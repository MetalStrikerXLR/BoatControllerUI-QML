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

    connect(m_serialPort, &QSerialPort::readyRead, this, &OutputController::receiveData);

    if (m_serialPort->open(QIODevice::ReadWrite)) {
        qDebug() << "Serial Port opened successfully";
        transmitData("x111h");
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
    m_serialPort->write(Data.toUtf8());
}

void OutputController::receiveData()
{
    QString recvData = m_serialPort->readAll();
    qDebug() << recvData;

    if (recvData == "xFFh")
        resetUI();

    emit dataReceived(recvData);
}

void OutputController::resetUI()
{
    qDebug() << "Controller Power Cycled: Resetting UI";
    emit resetComplete();
}
