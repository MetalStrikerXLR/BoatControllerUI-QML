import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Shapes 1.4
import Qt5Compat.GraphicalEffects
import "../Components"

Item {
    property real minValue: 0
    property real maxValue: 6000
    property int value: 0

    id: rightDial

    CircularBar {
        width: parent.width - (30 * respWidthFactor * 0.4)
        height: parent.height - (30 * respHeightFactor * 0.4)
        minValue: parent.minValue
        maxValue: parent.maxValue
        value: parent.value
        startAngle: 132.5
        spanAngle: 148.5
        dialWidth: parent.width - dialCenter.width
        progressColor: "#9F0000"
        penStyle: Qt.FlatCap
        dialType: CircularBar.NoDial

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    Image {
        id: dialCenter
        width: 470 * respWidthFactor * 0.4
        height: 470 * respHeightFactor * 0.4
        source: "qrc:/Assets/DrivePage/Widgets/DialCenter.png"
        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
        }

        Label {
            id: dialValue
            text: value
            color: "#EEEEEE"
            font.family: "Kentledge"
            font.pixelSize: 70 * respAvgFactor * 0.4
            font.bold: true
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: parent.top
                topMargin: 162 * respHeightFactor * 0.4
            }
        }

        Label {
            id: dialUnit
            text: "RPM"
            color: "#EEEEEE"
            font.family: "Kentledge"
            font.pixelSize: 35 * respAvgFactor * 0.4
            anchors {
                horizontalCenter: dialValue.horizontalCenter
                top: dialValue.bottom
                topMargin: -15 * respHeightFactor * 0.4
            }
        }
    }

    Image {
        id: dialBg
        width: 708 * respWidthFactor * 0.4
        height: 744 * respHeightFactor * 0.4
        source: "qrc:/Assets/DrivePage/Widgets/DialDisplayRight.png"
        anchors {
            top: parent.top
            left: parent.left
        }
    }
}
