#include "outputcontroller.h"

OutputController::OutputController(QObject *parent)
    : QObject{parent}
{
#ifdef Q_OS_WINDOWS
    m_portName = "COM3";
#else
    m_portName = "ttyAMA0";
#endif

    m_serialPort = new QSerialPort(m_portName);
    m_serialPort->setBaudRate(QSerialPort::Baud115200);
    m_serialPort->setDataBits(QSerialPort::Data8);
    m_serialPort->setParity(QSerialPort::NoParity);
    m_serialPort->setStopBits(QSerialPort::OneStop);
    m_serialPort->setFlowControl(QSerialPort::NoFlowControl);

    qDebug() << "SerialPort Configured for: " << m_serialPort->portName() << " " << m_serialPort->baudRate();

    //connect(m_serialPort, &QSerialPort::readyRead, this, &OutputController::receiveData);

    if (m_serialPort->open(QIODevice::ReadWrite)) {
        qDebug() << "Serial Port opened successfully";

        QtConcurrent::run([this]{
            receiveData();
        });

        transmitData("ACK");

    } else {
        qDebug() << "Serial Port open error";
    }
}

OutputController::~OutputController()
{
    delete m_serialPort;
}

void OutputController::transmitData(QString Data)
{
    m_serialPort->flush();
    m_serialPort->write(Data.toUtf8());
}

void OutputController::killThread()
{
    m_killThread = true;
}

int OutputController::getLevelTank1()
{
    return m_lvlTank1;
}

int OutputController::getLevelTank2()
{
    return m_lvlTank2;
}

int OutputController::getLevelTank3()
{
    return m_lvlTank3;
}

int OutputController::getLevelTank4()
{
    return m_lvlTank4;
}

int OutputController::getLevelTank5()
{
    return m_lvlTank5;
}

void OutputController::setLevelTank1(int lvl)
{
    m_lvlTank1 = lvl;
    emit levelTank1Changed();
}

void OutputController::setLevelTank2(int lvl)
{
    m_lvlTank2 = lvl;
    emit levelTank2Changed();
}

void OutputController::setLevelTank3(int lvl)
{
    m_lvlTank3 = lvl;
    emit levelTank3Changed();
}

void OutputController::setLevelTank4(int lvl)
{
    m_lvlTank4 = lvl;
    emit levelTank4Changed();
}

void OutputController::setLevelTank5(int lvl)
{
    m_lvlTank5 = lvl;
    emit levelTank5Changed();
}

void OutputController::receiveData()
{
    while(!m_killThread) {
        QString recvData;
        m_serialPort->waitForReadyRead(200);

        recvData = m_serialPort->readAll();
        QList splitData = recvData.split(":");
        qDebug() << splitData;


        if (splitData[0] == "xFFh")
            resetUI();

        if (splitData.size() == 27) {
            if(splitData[1] == "L1"){
                 int lvl1 = ((splitData[2].toFloat()) * 0.12 - 17.65);
                 setLevelTank1(lvl1);
            }

            if(splitData[3] == "L2"){
                 int lvl2 = ((splitData[4].toFloat()) * 0.12 - 17.65);
                 setLevelTank2(lvl2);
            }

            if(splitData[5] == "L3"){
                 int lvl3 = ((splitData[6].toFloat()) * 0.12 - 17.65);
                 setLevelTank3(lvl3);
            }

            if(splitData[7] == "L4"){
                 int lvl4 = ((splitData[8].toFloat()) * 0.12 - 17.65);
                 setLevelTank4(lvl4);
            }

            if(splitData[9] == "L5"){
                 int lvl5 = ((splitData[10].toFloat()) * 0.12 - 17.65);
                 setLevelTank5(lvl5);
            }
        }

        emit dataReceived(recvData);
    }
}

void OutputController::resetUI()
{
    qDebug() << "Controller Power Cycled: Resetting UI";
    emit resetComplete();
}
