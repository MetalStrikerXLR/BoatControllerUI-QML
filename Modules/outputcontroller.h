#ifndef OUTPUTCONTROLLER_H
#define OUTPUTCONTROLLER_H

#include <QObject>
#include <QDebug>
#include <QSerialPort>
#include <QSerialPortInfo>

class OutputController : public QObject
{
    Q_OBJECT

public:
    explicit OutputController(QObject *parent = nullptr);
    ~OutputController();

    Q_INVOKABLE void transmitData(QString Data);

signals:
    void dataReceived(QString data);
    void resetComplete();

private slots:
    void receiveData();
    void resetUI();

private:
    QString m_portName = "";
    QSerialPort * m_serialPort;

};

#endif // OUTPUTCONTROLLER_H
