import QtQuick 2.11
import QtQuick.Controls 2.4

Item {
    id: root
    property string objectName: "SettingsPage"

    Text {
        id: name
        text: qsTr("Unavailable")
        color: "white"
        font.pixelSize: 32 * respAvgFactor
        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
        }
    }
}
