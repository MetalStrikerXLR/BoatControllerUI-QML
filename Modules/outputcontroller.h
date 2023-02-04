#ifndef OUTPUTCONTROLLER_H
#define OUTPUTCONTROLLER_H

#include <QObject>
#include <QDebug>
#include <QSerialPort>
#include <QSerialPortInfo>
#include <QtConcurrent>

class OutputController : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int levelTank1 READ getLevelTank1 WRITE setLevelTank1 NOTIFY levelTank1Changed)
    Q_PROPERTY(int levelTank2 READ getLevelTank2 WRITE setLevelTank2 NOTIFY levelTank2Changed)
    Q_PROPERTY(int levelTank3 READ getLevelTank3 WRITE setLevelTank3 NOTIFY levelTank3Changed)
    Q_PROPERTY(int levelTank4 READ getLevelTank4 WRITE setLevelTank4 NOTIFY levelTank4Changed)
    Q_PROPERTY(int levelTank5 READ getLevelTank5 WRITE setLevelTank5 NOTIFY levelTank5Changed)

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

    void setLevelTank1(int lvl);
    void setLevelTank2(int lvl);
    void setLevelTank3(int lvl);
    void setLevelTank4(int lvl);
    void setLevelTank5(int lvl);

signals:
    void dataReceived(QString data);
    void resetComplete();

    void levelTank1Changed();
    void levelTank2Changed();
    void levelTank3Changed();
    void levelTank4Changed();
    void levelTank5Changed();

private slots:
    void receiveData();
    void resetUI();

private:
    QString m_portName = "";
    QSerialPort * m_serialPort;

    int m_lvlTank1 = 0;
    int m_lvlTank2 = 0;
    int m_lvlTank3 = 0;
    int m_lvlTank4 = 0;
    int m_lvlTank5 = 0;

    bool m_killThread = false;

};

#endif // OUTPUTCONTROLLER_H
