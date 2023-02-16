#ifndef OUTPUTCONTROLLER_H
#define OUTPUTCONTROLLER_H

#include <QObject>
#include <QDebug>
#include <QtSerialPort/QSerialPort>
#include <QtSerialPort/QSerialPortInfo>
#include <QtConcurrent>
#include <QTimer>

class OutputController : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int levelTank1 READ getLevelTank1 WRITE setLevelTank1 NOTIFY levelTank1Changed)
    Q_PROPERTY(int levelTank2 READ getLevelTank2 WRITE setLevelTank2 NOTIFY levelTank2Changed)
    Q_PROPERTY(int levelTank3 READ getLevelTank3 WRITE setLevelTank3 NOTIFY levelTank3Changed)
    Q_PROPERTY(int levelTank4 READ getLevelTank4 WRITE setLevelTank4 NOTIFY levelTank4Changed)
    Q_PROPERTY(int levelTank5 READ getLevelTank5 WRITE setLevelTank5 NOTIFY levelTank5Changed)
    Q_PROPERTY(int battVoltage1 READ getBatteryVoltage1 WRITE setBatteryVoltage1 NOTIFY batteryVoltage1Changed)
    Q_PROPERTY(int battVoltage2 READ getBatteryVoltage2 WRITE setBatteryVoltage2 NOTIFY batteryVoltage2Changed)
    Q_PROPERTY(int oilPressure1 READ getOilPressure1 WRITE setOilPressure1 NOTIFY oilPressure1Changed)
    Q_PROPERTY(int oilPressure2 READ getOilPressure2 WRITE setOilPressure2 NOTIFY oilPressure2Changed)
    Q_PROPERTY(int temperature1 READ getTemperature1 WRITE setTemperature1 NOTIFY temperature1Changed)
    Q_PROPERTY(int temperature2 READ getTemperature2 WRITE setTemperature2 NOTIFY temperature2Changed)
    Q_PROPERTY(int rpm1 READ getRpm1 WRITE setRpm1 NOTIFY rpm1Changed)
    Q_PROPERTY(int rpm2 READ getRpm2 WRITE setRpm2 NOTIFY rpm2Changed)

public:
    explicit OutputController(QObject *parent = nullptr);
    ~OutputController();

    Q_INVOKABLE void transmitData(QString Data);
    Q_INVOKABLE void killThread();

    int getLevelTank1();
    int getLevelTank2();
    int getLevelTank3();
    int getLevelTank4();
    int getLevelTank5();
    float getBatteryVoltage1();
    float getBatteryVoltage2();
    int getOilPressure1();
    int getOilPressure2();
    int getTemperature1();
    int getTemperature2();
    int getRpm1();
    int getRpm2();

    void setLevelTank1(int lvl);
    void setLevelTank2(int lvl);
    void setLevelTank3(int lvl);
    void setLevelTank4(int lvl);
    void setLevelTank5(int lvl);
    void setBatteryVoltage1(float voltage);
    void setBatteryVoltage2(float voltage);
    void setOilPressure1(int pressure);
    void setOilPressure2(int pressure);
    void setTemperature1(int temperature);
    void setTemperature2(int temperature);
    void setRpm1(int rpm);
    void setRpm2(int rpm);

signals:
    void dataReceived(QString data);
    void resetComplete();

    void levelTank1Changed();
    void levelTank2Changed();
    void levelTank3Changed();
    void levelTank4Changed();
    void levelTank5Changed();
    void batteryVoltage1Changed();
    void batteryVoltage2Changed();
    void oilPressure1Changed();
    void oilPressure2Changed();
    void temperature1Changed();
    void temperature2Changed();
    void rpm1Changed();
    void rpm2Changed();

private slots:
    void checkSerialPortConnected();
    void receiveData();
    void resetUI();

private:
    QString m_portName = "";
    QSerialPort * m_serialPort;
    QTimer * m_serialPortChecker;

    int m_lvlTank1 = 0;
    int m_lvlTank2 = 0;
    int m_lvlTank3 = 0;
    int m_lvlTank4 = 0;
    int m_lvlTank5 = 0;

    float m_battVoltage1 = 0;
    float m_battVoltage2 = 0;

    int m_oilPressure1 = 0;
    int m_oilPressure2 = 0;

    int m_temperature1 = 0;
    int m_temperature2 = 0;

    int m_rpm1 = 0;
    int m_rpm2 = 0;

    bool m_killThread = false;

};

#endif // OUTPUTCONTROLLER_H
