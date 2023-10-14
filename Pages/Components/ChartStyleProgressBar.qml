import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Shapes 1.4

Rectangle {
    property string progressBarColorStart: "#2A5CA6"
    property string progressBarColorEnd: "#2A5CA6"
    property string itemName: "-"
    property real avgFactor: 1
    property int value: 30

    id: chatStylePB
    width: 115
    height: 140
    radius: 8
    color: "#302F34"

    Label {
        id: progressItemName
        text: itemName
        color: "#79787E"
        font.family: "Kentledge"
        font.pixelSize: 8 * avgFactor
        anchors {
            top: chatStylePB.top
            left: chatStylePB.left
            topMargin: chatStylePB.height * 0.365
            leftMargin: chatStylePB.width * 0.45
        }
    }

    Label {
        id: progressPercent
        text: value + "%"
        color: "#FFFFFF"
        font.family: "Kentledge"
        font.pixelSize: 12 * avgFactor
        anchors {
            top: chatStylePB.top
            left: chatStylePB.left
            topMargin: chatStylePB.height * 0.486
            leftMargin: chatStylePB.width * 0.45
        }
    }

    Rectangle {
        id: progressBarBackground
        width: chatStylePB.width * 0.2
        height: chatStylePB.height * 0.75
        radius: width/2
        color: "#201F25"
        anchors {
            top: chatStylePB.top
            left: chatStylePB.left
            topMargin: chatStylePB.height * 0.13
            leftMargin: chatStylePB.width * 0.15
        }
    }

    Rectangle {
        id: progressBarVisual
        width: progressBarBackground.width
        height: progressBarBackground.height * (value/100)
        radius: width/2
        anchors {
            bottom: progressBarBackground.bottom
            left: progressBarBackground.left
        }

        gradient: Gradient {
                GradientStop { position: 0.0; color: progressBarColorEnd }
                GradientStop { position: 1.0; color: progressBarColorStart }
            }
    }

}
