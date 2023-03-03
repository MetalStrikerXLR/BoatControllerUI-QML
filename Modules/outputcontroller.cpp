#include "outputcontroller.h"

OutputController::OutputController(QObject *parent)
    : QObject{parent}
{
#ifdef Q_OS_WINDOWS
    m_portName = "COM5";
#else
    m_portName = "ttyUSB0";
#endif

    // Lambda function format - Qorks in both Qt5 and Qt6
    QtConcurrent::run([this]{
                    checkSerialPortConnected();
                });

    // Qt6 format for QConcurrent
    //QtConcurrent::run(&OutputController::checkSerialPortConnected, this);
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

float OutputController::getBatteryVoltage1()
{
    return m_battVoltage1;
}

float OutputController::getBatteryVoltage2()
{
    return m_battVoltage2;
}

int OutputController::getOilPressure1()
{
    return m_oilPressure1;
}

int OutputController::getOilPressure2()
{
    return m_oilPressure2;
}

int OutputController::getTemperature1()
{
    return m_temperature1;
}

int OutputController::getTemperature2()
{
    return m_temperature2;
}

int OutputController::getRpm1()
{
    return m_rpm1;
}

int OutputController::getRpm2()
{
    return m_rpm2;
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

void OutputController::setBatteryVoltage1(float voltage)
{
    m_battVoltage1 = voltage;
    emit batteryVoltage1Changed();
}

void OutputController::setBatteryVoltage2(float voltage)
{
    m_battVoltage2 = voltage;
    emit batteryVoltage2Changed();
}

void OutputController::setOilPressure1(int pressure)
{
    m_oilPressure1 = pressure;
    emit oilPressure1Changed();
}

void OutputController::setOilPressure2(int pressure)
{
    m_oilPressure2 = pressure;
    emit oilPressure2Changed();
}

void OutputController::setTemperature1(int temperature)
{
    m_temperature1 = temperature;
    emit temperature1Changed();
}

void OutputController::setTemperature2(int temperature)
{
    m_temperature2 = temperature;
    emit temperature2Changed();
}

void OutputController::setRpm1(int rpm)
{
    m_rpm1 = rpm;
    emit rpm1Changed();
}

void OutputController::setRpm2(int rpm)
{
    m_rpm2 = rpm;
    emit rpm2Changed();
}

void OutputController::checkSerialPortConnected()
{
    m_serialPort = new QSerialPort(m_portName);
    m_serialPort->setBaudRate(QSerialPort::Baud115200);
    m_serialPort->setDataBits(QSerialPort::Data8);
    m_serialPort->setParity(QSerialPort::NoParity);
    m_serialPort->setStopBits(QSerialPort::OneStop);
    m_serialPort->setFlowControl(QSerialPort::NoFlowControl);

    qDebug() << "SerialPort Configured for: " << m_serialPort->portName() << " " << m_serialPort->baudRate();

    while(!m_serialPort->isOpen()) {
        if (m_serialPort->open(QIODevice::ReadWrite)) {
            qDebug() << "Serial Port opened successfully";

            transmitData("ACK");
            receiveData();

        } else {
            qDebug() << "Serial Port open error";
        }
    }
}

void OutputController::receiveData()
{
    while(!m_killThread) {
        QString recvData;
        m_serialPort->waitForReadyRead(35);

        recvData = m_serialPort->readAll();
        QStringList splitData = recvData.split(":");
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

            if(splitData[11] == "B1"){
                float batt1 = ((splitData[12].toFloat()));
                setBatteryVoltage1(batt1);
            }

            if(splitData[13] == "B2"){
                float batt2 = ((splitData[14].toFloat()));
                setBatteryVoltage2(batt2);
            }

            if(splitData[15] == "O1"){
                int pres1 = splitData[16].toInt();
                setOilPressure1(pres1);
            }

            if(splitData[17] == "O2"){
                int pres2 = splitData[18].toInt();
                setOilPressure2(pres2);
            }

            if(splitData[19] == "T1"){
                int temp1 = splitData[20].toInt();
                setTemperature1(temp1);
            }

            if(splitData[21] == "T2"){
                int temp2 = splitData[22].toInt();
                setTemperature2(temp2);
            }

            if(splitData[23] == "RPM1"){
                int rpm1 = splitData[24].toInt();
                setRpm1(rpm1);
            }

            if(splitData[25] == "RPM2"){
                int rpm2 = splitData[26].toInt();
                setRpm2(rpm2);
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
