import QtQuick 2.12
import QtQuick.Controls 2.12

Item {
    id: root
    property string objectName: "DrivePage"
    property real widthFactor
    property real heightFactor
    property real avgFactor

    Text {
        id: name
        text: qsTr("Unavailable")
        color: "white"
        font.pixelSize: 32 * avgFactor
        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
        }
    }
}
