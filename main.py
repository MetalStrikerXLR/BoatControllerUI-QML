import sys
import Assets.QRC.Resources
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QObject, pyqtSignal, pyqtProperty, pyqtSlot, QTimer
from PyQt5.QtSerialPort import QSerialPort, QSerialPortInfo


class OutputController(QObject):
    dataReceived = pyqtSignal(str)
    resetComplete = pyqtSignal()

    levelTank1Changed = pyqtSignal()
    levelTank2Changed = pyqtSignal()
    levelTank3Changed = pyqtSignal()
    levelTank4Changed = pyqtSignal()
    levelTank5Changed = pyqtSignal()

    batteryVoltage1Changed = pyqtSignal()
    batteryVoltage2Changed = pyqtSignal()

    oilPressure1Changed = pyqtSignal()
    oilPressure2Changed = pyqtSignal()

    temperature1Changed = pyqtSignal()
    temperature2Changed = pyqtSignal()

    rpm1Changed = pyqtSignal()
    rpm2Changed = pyqtSignal()

    def __init__(self, parent=None):
        super().__init__(parent)

        self.m_lvlTank1 = 0
        self.m_lvlTank2 = 0
        self.m_lvlTank3 = 0
        self.m_lvlTank4 = 0
        self.m_lvlTank5 = 0

        self.m_battVoltage1 = 0
        self.m_battVoltage2 = 0

        self.m_oilPressure1 = 0
        self.m_oilPressure2 = 0

        self.m_temperature1 = 0
        self.m_temperature2 = 0

        self.m_rpm1 = 0
        self.m_rpm2 = 0

        self.m_killThread = False

        # For Windows port name will be: COM + port number. Example: COM5
        # For RPi port name will be: ttyUSB + port number. Example: ttyUSB0
        self.m_portInfo = QSerialPortInfo()
        self.m_portName = "ttyUSB0"

        self.m_serialPort = QSerialPort(self.m_portName)
        self.m_serialPort.setBaudRate(QSerialPort.Baud115200)
        self.m_serialPort.setDataBits(QSerialPort.Data8)
        self.m_serialPort.setParity(QSerialPort.NoParity)
        self.m_serialPort.setStopBits(QSerialPort.OneStop)
        self.m_serialPort.setFlowControl(QSerialPort.NoFlowControl)
        self.m_serialPort.readyRead.connect(self.receiveData)

        self.m_portCheckerTimer = QTimer(self)
        self.m_portCheckerTimer.setInterval(1000)
        self.m_portCheckerTimer.timeout.connect(self.checkSerialPortConnected)

        self.m_portCheckerTimer.start()
        print("Init complete")

    @pyqtSlot(str)
    def transmitData(self, Data):
        self.m_serialPort.write(Data.encode())

    @pyqtSlot()
    def killThread(self):
        self.m_killThread = True

    @pyqtSlot()
    def checkSerialPortConnected(self):
        availablePorts = []
        for port in self.m_portInfo.availablePorts():
            availablePorts.append(port.portName())

        if self.m_portName in availablePorts:
            print("Serial Port", self.m_portName, "Available!")
            if not self.m_serialPort.isOpen():
                if self.m_serialPort.open(QSerialPort.ReadWrite):
                    print("Serial Port opened successfully")
                    self.transmitData("xAKh")
                else:
                    print("Serial Port open error")
                    self.m_serialPort.close()
            else:
                print("Serial Port already opened")
                pass
        else:
            print("Serial Port", self.m_portName, "Unavailable! Plug in Arduino!")
            self.m_serialPort.close()

    @pyqtSlot()
    def receiveData(self):
        available = self.m_serialPort.bytesAvailable()

        if available >= 109:

            if available > 127:
                self.m_serialPort.readAll()
                return

            try:
                recvData = bytes(self.m_serialPort.readAll()).decode()
                orderSplit = recvData.split(":L1")
                reorderedRecvData = ":L1" + orderSplit[1] + orderSplit[0]
                splitData = reorderedRecvData.split(":")
                print("Incoming Data from Arduino: ", splitData)

            except:
                print("Incoming data format from Arduino is wrong, skipping data parsing (check Arduino code)")
                return

            if len(splitData) == 29:
                try:
                    if splitData[1] == "L1":
                        lvl1 = float(splitData[2])
                        self.levelTank1 = lvl1

                    if splitData[3] == "L2":
                        lvl2 = float(splitData[4])
                        self.levelTank2 = lvl2

                    if splitData[5] == "L3":
                        lvl3 = float(splitData[6])
                        self.levelTank3 = lvl3

                    if splitData[7] == "L4":
                        lvl4 = float(splitData[8])
                        self.levelTank4 = lvl4

                    if splitData[9] == "L5":
                        lvl5 = float(splitData[10])
                        self.levelTank5 = lvl5

                    if splitData[11] == "B1":
                        batt1 = float(splitData[12])
                        self.batteryVoltage1 = batt1

                    if splitData[13] == "B2":
                        batt2 = float(splitData[14])
                        self.batteryVoltage2 = batt2

                    if splitData[15] == "O1":
                        pres1 = int(float(splitData[16]))
                        self.oilPressure1 = pres1

                    if splitData[17] == "O2":
                        pres2 = int(float(splitData[18]))
                        self.oilPressure2 = pres2

                    if splitData[19] == "T1":
                        temp1 = int(float(splitData[20]))
                        self.temperature1 = temp1

                    if splitData[21] == "T2":
                        temp2 = int(float(splitData[22]))
                        self.temperature2 = temp2

                    if splitData[23] == "RPM1":
                        rpm1 = int(splitData[24])
                        self.rpm1 = rpm1

                    if splitData[25] == "RPM2":
                        rpm2 = int(splitData[26])
                        self.rpm2 = rpm2

                    if splitData[27] == "CMD":
                        if splitData[28] == "xFFh":
                            self.resetUI()

                    self.dataReceived.emit(recvData)

                except:
                    pass

    @pyqtSlot()
    def resetUI(self):
        print("Arduino reset triggered. Resetting UI as well")
        self.resetComplete.emit()

    # ---------------------------------------- QML Exposed Properties ---------------------------------------- #

    @pyqtProperty(float, notify=levelTank1Changed)
    def levelTank1(self):
        return self.m_lvlTank1

    @levelTank1.setter
    def levelTank1(self, lvl):
        self.m_lvlTank1 = lvl
        self.levelTank1Changed.emit()

    @pyqtProperty(float, notify=levelTank2Changed)
    def levelTank2(self):
        return self.m_lvlTank2

    @levelTank2.setter
    def levelTank2(self, lvl):
        self.m_lvlTank2 = lvl
        self.levelTank2Changed.emit()

    @pyqtProperty(float, notify=levelTank3Changed)
    def levelTank3(self):
        return self.m_lvlTank3

    @levelTank3.setter
    def levelTank3(self, lvl):
        self.m_lvlTank3 = lvl
        self.levelTank3Changed.emit()

    @pyqtProperty(float, notify=levelTank4Changed)
    def levelTank4(self):
        return self.m_lvlTank4

    @levelTank4.setter
    def levelTank4(self, lvl):
        self.m_lvlTank4 = lvl
        self.levelTank4Changed.emit()

    @pyqtProperty(float, notify=levelTank5Changed)
    def levelTank5(self):
        return self.m_lvlTank5

    @levelTank5.setter
    def levelTank5(self, lvl):
        self.m_lvlTank5 = lvl
        self.levelTank5Changed.emit()

    @pyqtProperty(float, notify=batteryVoltage1Changed)
    def batteryVoltage1(self):
        return self.m_battVoltage1

    @batteryVoltage1.setter
    def batteryVoltage1(self, voltage):
        self.m_battVoltage1 = voltage
        self.batteryVoltage1Changed.emit()

    @pyqtProperty(float, notify=batteryVoltage2Changed)
    def batteryVoltage2(self):
        return self.m_battVoltage2

    @batteryVoltage2.setter
    def batteryVoltage2(self, voltage):
        self.m_battVoltage2 = voltage
        self.batteryVoltage2Changed.emit()

    @pyqtProperty(int, notify=oilPressure1Changed)
    def oilPressure1(self):
        return self.m_oilPressure1

    @oilPressure1.setter
    def oilPressure1(self, pressure):
        self.m_oilPressure1 = pressure
        self.oilPressure1Changed.emit()

    @pyqtProperty(int, notify=oilPressure2Changed)
    def oilPressure2(self):
        return self.m_oilPressure2

    @oilPressure2.setter
    def oilPressure2(self, pressure):
        self.m_oilPressure2 = pressure
        self.oilPressure2Changed.emit()

    @pyqtProperty(int, notify=temperature1Changed)
    def temperature1(self):
        return self.m_temperature1

    @temperature1.setter
    def temperature1(self, temperature):
        self.m_temperature1 = temperature
        self.temperature1Changed.emit()

    @pyqtProperty(int, notify=temperature2Changed)
    def temperature2(self):
        return self.m_temperature2

    @temperature2.setter
    def temperature2(self, temperature):
        self.m_temperature2 = temperature
        self.temperature2Changed.emit()

    @pyqtProperty(int, notify=rpm1Changed)
    def rpm1(self):
        return self.m_rpm1

    @rpm1.setter
    def rpm1(self, rpm):
        self.m_rpm1 = rpm
        self.rpm1Changed.emit()

    @pyqtProperty(int, notify=rpm2Changed)
    def rpm2(self):
        return self.m_rpm2

    @rpm2.setter
    def rpm2(self, rpm):
        self.m_rpm2 = rpm
        self.rpm2Changed.emit()


if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    output_controller = OutputController()
    engine.rootContext().setContextProperty("outputcontroller", output_controller)

    engine.quit.connect(app.quit)
    engine.load('main.qml')

    sys.exit(app.exec())
