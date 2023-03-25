import sys
import resources
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine
from Modules.OutputController import OutputController

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    output_controller = OutputController()
    engine.rootContext().setContextProperty("outputcontroller", output_controller)

    engine.quit.connect(app.quit)
    engine.load('main.qml')

    sys.exit(app.exec())
