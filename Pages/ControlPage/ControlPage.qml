import QtQuick 2.12
import QtQuick.Controls 2.12
import "../Components"

Item {
    id: root
    property string objectName: "ControlPage"
    property real widthFactor
    property real heightFactor
    property real avgFactor

    Image {
        id: seperatorBG
        width: 426 * respWidthFactor * 0.72
        height: 503 * respHeightFactor * 0.72
        source: "qrc:/Assets/ControlPage/SectionSeperator.png"
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 41 * respHeightFactor
            leftMargin: 60 * respWidthFactor
        }
    }

    // Interior Lights Section

    Label {
        id: interiorLightLabel
        text: "INTERIOR LIGHTS"
        color: "#FFFFFF"
        font.pixelSize: 8.5 * respAvgFactor * 0.72
        font.family: "Kentledge"
        font.weight: 400 * respAvgFactor * 0.72
        horizontalAlignment: Qt.AlignHCenter
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 41 * respHeightFactor
            leftMargin: 60 * respWidthFactor
        }
    }

    Row {
        id: interiorLightRow1
        width: 83 * respWidthFactor * 0.72
        height: 83 * respHeightFactor * 0.72
        spacing: -2  * respWidthFactor
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 60 * respHeightFactor
            leftMargin: 54 * respWidthFactor
        }

        ToggleableButton {
            id: interiorLightBtnA
            width: 83 * respWidthFactor * 0.72
            height: 83 * respHeightFactor * 0.72
            iconOffState: "qrc:/Assets/ControlPage/ButtonA_Unpressed.png"
            iconOffPressedState: "qrc:/Assets/ControlPage/ButtonA_Unpressed.png"
            iconOnState: "qrc:/Assets/ControlPage/ButtonA_Pressed.png"
            iconOnPressedState: "qrc:/Assets/ControlPage/ButtonA_Pressed.png"

            Label {
                id: interiorLightBtnATxt
                text: "Navigation\nLights"
                color: "#79787E"
                font.pixelSize: 8 * respAvgFactor * 0.72
                font.family: "Kentledge"
                horizontalAlignment: Qt.AlignHCenter
                anchors {
                    top: parent.bottom
                    horizontalCenter: parent.horizontalCenter
                    topMargin: -2 * respHeightFactor
                }
            }

            onClicked: {
                interiorLightBtnA.isOn = !interiorLightBtnA.isOn
            }
        }

        ToggleableButton {
            id: interiorLightBtnB
            width: 83 * respWidthFactor * 0.72
            height: 83 * respHeightFactor * 0.72
            iconOffState: "qrc:/Assets/ControlPage/ButtonB_Unpressed.png"
            iconOffPressedState: "qrc:/Assets/ControlPage/ButtonB_Unpressed.png"
            iconOnState: "qrc:/Assets/ControlPage/ButtonB_Pressed.png"
            iconOnPressedState: "qrc:/Assets/ControlPage/ButtonB_Pressed.png"

            Label {
                id: interiorLightBtnBTxt
                text: "Anchor\nLights"
                color: "#79787E"
                font.pixelSize: 8 * respAvgFactor * 0.72
                font.family: "Kentledge"
                horizontalAlignment: Qt.AlignHCenter
                anchors {
                    top: parent.bottom
                    horizontalCenter: parent.horizontalCenter
                    topMargin: -2 * respHeightFactor
                }
            }

            onClicked: {
                interiorLightBtnB.isOn = !interiorLightBtnB.isOn
            }
        }

        ToggleableButton {
            id: interiorLightBtnC
            width: 83 * respWidthFactor * 0.72
            height: 83 * respHeightFactor * 0.72
            iconOffState: "qrc:/Assets/ControlPage/ButtonC_Unpressed.png"
            iconOffPressedState: "qrc:/Assets/ControlPage/ButtonC_Unpressed.png"
            iconOnState: "qrc:/Assets/ControlPage/ButtonC_Pressed.png"
            iconOnPressedState: "qrc:/Assets/ControlPage/ButtonC_Pressed.png"

            Label {
                id: interiorLightBtnCTxt
                text: "Underwater\nLights"
                color: "#79787E"
                font.pixelSize: 8 * respAvgFactor * 0.72
                font.family: "Kentledge"
                horizontalAlignment: Qt.AlignHCenter
                anchors {
                    top: parent.bottom
                    horizontalCenter: parent.horizontalCenter
                    topMargin: -2 * respHeightFactor
                }
            }

            onClicked: {
                interiorLightBtnC.isOn = !interiorLightBtnC.isOn
            }
        }
    }

    Row {
        id: interiorLightRow2
        width: 83 * respWidthFactor * 0.72
        height: 83 * respHeightFactor * 0.72
        spacing: -2  * respWidthFactor
        anchors {
            top: interiorLightRow1.bottom
            left: interiorLightRow1.left
            topMargin: 27 * respHeightFactor * 0.72
        }

        ToggleableButton {
            id: interiorLightBtnD
            width: 83 * respWidthFactor * 0.72
            height: 83 * respHeightFactor * 0.72
            iconOffState: "qrc:/Assets/ControlPage/ButtonD_Unpressed.png"
            iconOffPressedState: "qrc:/Assets/ControlPage/ButtonD_Unpressed.png"
            iconOnState: "qrc:/Assets/ControlPage/ButtonD_Pressed.png"
            iconOnPressedState: "qrc:/Assets/ControlPage/ButtonD_Pressed.png"

            Label {
                id: interiorLightBtnDTxt
                text: "Docking\nLights"
                color: "#79787E"
                font.pixelSize: 8 * respAvgFactor * 0.72
                font.family: "Kentledge"
                horizontalAlignment: Qt.AlignHCenter
                anchors {
                    top: parent.bottom
                    horizontalCenter: parent.horizontalCenter
                    topMargin: -2 * respHeightFactor
                }
            }

            onClicked: {
                interiorLightBtnD.isOn = !interiorLightBtnD.isOn
            }
        }

        ToggleableButton {
            id: interiorLightBtnE
            width: 83 * respWidthFactor * 0.72
            height: 83 * respHeightFactor * 0.72
            iconOffState: "qrc:/Assets/ControlPage/ButtonD_Unpressed.png"
            iconOffPressedState: "qrc:/Assets/ControlPage/ButtonD_Unpressed.png"
            iconOnState: "qrc:/Assets/ControlPage/ButtonD_Pressed.png"
            iconOnPressedState: "qrc:/Assets/ControlPage/ButtonD_Pressed.png"

            Label {
                id: interiorLightBtnETxt
                text: "Docking\nLights"
                color: "#79787E"
                font.pixelSize: 8 * respAvgFactor * 0.72
                font.family: "Kentledge"
                horizontalAlignment: Qt.AlignHCenter
                anchors {
                    top: parent.bottom
                    horizontalCenter: parent.horizontalCenter
                    topMargin: -2 * respHeightFactor
                }
            }
            onClicked: {
                interiorLightBtnE.isOn = !interiorLightBtnE.isOn
            }
        }

        ToggleableButton {
            id: interiorLightBtnF
            width: 83 * respWidthFactor * 0.72
            height: 83 * respHeightFactor * 0.72
            iconOffState: "qrc:/Assets/ControlPage/ButtonD_Unpressed.png"
            iconOffPressedState: "qrc:/Assets/ControlPage/ButtonD_Unpressed.png"
            iconOnState: "qrc:/Assets/ControlPage/ButtonD_Pressed.png"
            iconOnPressedState: "qrc:/Assets/ControlPage/ButtonD_Pressed.png"

            Label {
                id: interiorLightBtnFTxt
                text: "Docking\nLights"
                color: "#79787E"
                font.pixelSize: 8 * respAvgFactor * 0.72
                font.family: "Kentledge"
                horizontalAlignment: Qt.AlignHCenter
                anchors {
                    top: parent.bottom
                    horizontalCenter: parent.horizontalCenter
                    topMargin: -2 * respHeightFactor
                }
            }

            onClicked: {
                interiorLightBtnF.isOn = !interiorLightBtnF.isOn
            }
        }
    }

    // Exterior Lights Section

    Label {
        id: exteriorLightLabel
        text: "EXTERIOR LIGHTS"
        color: "#FFFFFF"
        font.pixelSize: 8.5 * respAvgFactor * 0.72
        font.family: "Kentledge"
        font.weight: 400 * respAvgFactor * 0.72
        horizontalAlignment: Qt.AlignHCenter
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 325 * respHeightFactor * 0.72
            leftMargin: 60 * respWidthFactor
        }
    }

    Row {
        id: exteriorLightRow1
        width: 83 * respWidthFactor * 0.72
        height: 83 * respHeightFactor * 0.72
        spacing: -2  * respWidthFactor
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 340 * respHeightFactor * 0.72
            leftMargin: 54 * respWidthFactor
        }

        ToggleableButton {
            id: exteriorLightBtnA
            width: 83 * respWidthFactor * 0.72
            height: 83 * respHeightFactor * 0.72
            iconOffState: "qrc:/Assets/ControlPage/ButtonD_Unpressed.png"
            iconOffPressedState: "qrc:/Assets/ControlPage/ButtonD_Unpressed.png"
            iconOnState: "qrc:/Assets/ControlPage/ButtonD_Pressed.png"
            iconOnPressedState: "qrc:/Assets/ControlPage/ButtonD_Pressed.png"

            Label {
                id: exteriorLightBtnATxt
                text: "Docking\nLights"
                color: "#79787E"
                font.pixelSize: 8 * respAvgFactor * 0.72
                font.family: "Kentledge"
                horizontalAlignment: Qt.AlignHCenter
                anchors {
                    top: parent.bottom
                    horizontalCenter: parent.horizontalCenter
                    topMargin: -2 * respHeightFactor
                }
            }

            onClicked: {
                exteriorLightBtnA.isOn = !exteriorLightBtnA.isOn
            }
        }

        ToggleableButton {
            id: exteriorLightBtnB
            width: 83 * respWidthFactor * 0.72
            height: 83 * respHeightFactor * 0.72
            iconOffState: "qrc:/Assets/ControlPage/ButtonD_Unpressed.png"
            iconOffPressedState: "qrc:/Assets/ControlPage/ButtonD_Unpressed.png"
            iconOnState: "qrc:/Assets/ControlPage/ButtonD_Pressed.png"
            iconOnPressedState: "qrc:/Assets/ControlPage/ButtonD_Pressed.png"

            Label {
                id: exteriorLightBtnBTxt
                text: "Docking\nLights"
                color: "#79787E"
                font.pixelSize: 8 * respAvgFactor * 0.72
                font.family: "Kentledge"
                horizontalAlignment: Qt.AlignHCenter
                anchors {
                    top: parent.bottom
                    horizontalCenter: parent.horizontalCenter
                    topMargin: -2 * respHeightFactor
                }
            }

            onClicked: {
                exteriorLightBtnB.isOn = !exteriorLightBtnB.isOn
            }
        }

        ToggleableButton {
            id: exteriorLightBtnC
            width: 83 * respWidthFactor * 0.72
            height: 83 * respHeightFactor * 0.72
            iconOffState: "qrc:/Assets/ControlPage/ButtonD_Unpressed.png"
            iconOffPressedState: "qrc:/Assets/ControlPage/ButtonD_Unpressed.png"
            iconOnState: "qrc:/Assets/ControlPage/ButtonD_Pressed.png"
            iconOnPressedState: "qrc:/Assets/ControlPage/ButtonD_Pressed.png"

            Label {
                id: exteriorLightBtnCTxt
                text: "Docking\nLights"
                color: "#79787E"
                font.pixelSize: 8 * respAvgFactor * 0.72
                font.family: "Kentledge"
                horizontalAlignment: Qt.AlignHCenter
                anchors {
                    top: parent.bottom
                    horizontalCenter: parent.horizontalCenter
                    topMargin: -2 * respHeightFactor
                }
            }

            onClicked: {
                exteriorLightBtnC.isOn = !exteriorLightBtnC.isOn
            }
        }
    }

    Row {
        id: exteriorLightRow2
        width: 83 * respWidthFactor * 0.72
        height: 83 * respHeightFactor * 0.72
        spacing: -2  * respWidthFactor
        anchors {
            top: exteriorLightRow1.bottom
            left: exteriorLightRow1.left
            topMargin: 27 * respHeightFactor * 0.72
        }

        ToggleableButton {
            id: exteriorLightBtnD
            width: 83 * respWidthFactor * 0.72
            height: 83 * respHeightFactor * 0.72
            iconOffState: "qrc:/Assets/ControlPage/ButtonD_Unpressed.png"
            iconOffPressedState: "qrc:/Assets/ControlPage/ButtonD_Unpressed.png"
            iconOnState: "qrc:/Assets/ControlPage/ButtonD_Pressed.png"
            iconOnPressedState: "qrc:/Assets/ControlPage/ButtonD_Pressed.png"

            Label {
                id: exteriorLightBtnDTxt
                text: "Docking\nLights"
                color: "#79787E"
                font.pixelSize: 8 * respAvgFactor * 0.72
                font.family: "Kentledge"
                horizontalAlignment: Qt.AlignHCenter
                anchors {
                    top: parent.bottom
                    horizontalCenter: parent.horizontalCenter
                    topMargin: -2 * respHeightFactor
                }
            }

            onClicked: {
                exteriorLightBtnD.isOn = !exteriorLightBtnD.isOn
            }
        }

        ToggleableButton {
            id: exteriorLightBtnE
            width: 83 * respWidthFactor * 0.72
            height: 83 * respHeightFactor * 0.72
            iconOffState: "qrc:/Assets/ControlPage/ButtonD_Unpressed.png"
            iconOffPressedState: "qrc:/Assets/ControlPage/ButtonD_Unpressed.png"
            iconOnState: "qrc:/Assets/ControlPage/ButtonD_Pressed.png"
            iconOnPressedState: "qrc:/Assets/ControlPage/ButtonD_Pressed.png"

            Label {
                id: exteriorLightBtnETxt
                text: "Docking\nLights"
                color: "#79787E"
                font.pixelSize: 8 * respAvgFactor * 0.72
                font.family: "Kentledge"
                horizontalAlignment: Qt.AlignHCenter
                anchors {
                    top: parent.bottom
                    horizontalCenter: parent.horizontalCenter
                    topMargin: -2 * respHeightFactor
                }
            }
            onClicked: {
                exteriorLightBtnE.isOn = !exteriorLightBtnE.isOn
            }
        }

        ToggleableButton {
            id: exteriorLightBtnF
            width: 83 * respWidthFactor * 0.72
            height: 83 * respHeightFactor * 0.72
            iconOffState: "qrc:/Assets/ControlPage/ButtonD_Unpressed.png"
            iconOffPressedState: "qrc:/Assets/ControlPage/ButtonD_Unpressed.png"
            iconOnState: "qrc:/Assets/ControlPage/ButtonD_Pressed.png"
            iconOnPressedState: "qrc:/Assets/ControlPage/ButtonD_Pressed.png"

            Label {
                id: exteriorLightBtnFTxt
                text: "Docking\nLights"
                color: "#79787E"
                font.pixelSize: 8 * respAvgFactor * 0.72
                font.family: "Kentledge"
                horizontalAlignment: Qt.AlignHCenter
                anchors {
                    top: parent.bottom
                    horizontalCenter: parent.horizontalCenter
                    topMargin: -2 * respHeightFactor
                }
            }

            onClicked: {
                exteriorLightBtnF.isOn = !exteriorLightBtnF.isOn
            }
        }
    }

    // Switches Section

    Label {
        id: switchesLabel
        text: "SWITCHES"
        color: "#FFFFFF"
        font.pixelSize: 8.5 * respAvgFactor * 0.72
        font.family: "Kentledge"
        font.weight: 400 * respAvgFactor * 0.72
        horizontalAlignment: Qt.AlignHCenter
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 41 * respHeightFactor
            leftMargin: 405 * respWidthFactor * 0.72
        }
    }

    Column {
        id: switchCol
        spacing: 20  * respWidthFactor * 0.72
        anchors {
            top: switchesLabel.top
            topMargin: 43 * respHeightFactor * 0.72
            horizontalCenter: switchesLabel.horizontalCenter
        }

        ToggleableButton {
            id: switchBtnA
            width: 70 * respWidthFactor * 0.72
            height: 70 * respHeightFactor * 0.72
            iconOffState: "qrc:/Assets/ControlPage/ButtonG_Unpressed.png"
            iconOffPressedState: "qrc:/Assets/ControlPage/ButtonG_Unpressed.png"
            iconOnState: "qrc:/Assets/ControlPage/ButtonG_Pressed.png"
            iconOnPressedState: "qrc:/Assets/ControlPage/ButtonG_Pressed.png"

            Label {
                id: switchBtnATxt
                text: "FRIDGE"
                color: "#79787E"
                font.pixelSize: 8 * respAvgFactor * 0.72
                font.family: "Kentledge"
                horizontalAlignment: Qt.AlignHCenter
                anchors {
                    top: parent.bottom
                    horizontalCenter: parent.horizontalCenter
                    topMargin: -2 * respHeightFactor
                }
            }

            onClicked: {
                switchBtnA.isOn = !switchBtnA.isOn
            }
        }

        ToggleableButton {
            id: switchBtnB
            width: 70 * respWidthFactor * 0.72
            height: 70 * respHeightFactor * 0.72
            iconOffState: "qrc:/Assets/ControlPage/ButtonH_Unpressed.png"
            iconOffPressedState: "qrc:/Assets/ControlPage/ButtonH_Unpressed.png"
            iconOnState: "qrc:/Assets/ControlPage/ButtonH_Pressed.png"
            iconOnPressedState: "qrc:/Assets/ControlPage/ButtonH_Pressed.png"

            Label {
                id: switchBtnBTxt
                text: "HORN"
                color: "#79787E"
                font.pixelSize: 8 * respAvgFactor * 0.72
                font.family: "Kentledge"
                horizontalAlignment: Qt.AlignHCenter
                anchors {
                    top: parent.bottom
                    horizontalCenter: parent.horizontalCenter
                    topMargin: -2 * respHeightFactor
                }
            }

            onClicked: {
                switchBtnB.isOn = !switchBtnB.isOn
            }
        }

        ToggleableButton {
            id: switchBtnC
            width: 70 * respWidthFactor * 0.72
            height: 70 * respHeightFactor * 0.72
            iconOffState: "qrc:/Assets/ControlPage/ButtonI_Unpressed.png"
            iconOffPressedState: "qrc:/Assets/ControlPage/ButtonI_Unpressed.png"
            iconOnState: "qrc:/Assets/ControlPage/ButtonI_Pressed.png"
            iconOnPressedState: "qrc:/Assets/ControlPage/ButtonI_Pressed.png"

            Label {
                id: switchBtnCTxt
                text: "TOILET"
                color: "#79787E"
                font.pixelSize: 8 * respAvgFactor * 0.72
                font.family: "Kentledge"
                horizontalAlignment: Qt.AlignHCenter
                anchors {
                    top: parent.bottom
                    horizontalCenter: parent.horizontalCenter
                    topMargin: -2 * respHeightFactor
                }
            }

            onClicked: {
                switchBtnC.isOn = !switchBtnC.isOn
            }
        }

        ToggleableButton {
            id: switchBtnD
            width: 70 * respWidthFactor * 0.72
            height: 70 * respHeightFactor * 0.72
            iconOffState: "qrc:/Assets/ControlPage/ButtonJ_Unpressed.png"
            iconOffPressedState: "qrc:/Assets/ControlPage/ButtonJ_Unpressed.png"
            iconOnState: "qrc:/Assets/ControlPage/ButtonJ_Pressed.png"
            iconOnPressedState: "qrc:/Assets/ControlPage/ButtonJ_Pressed.png"

            Label {
                id: switchBtnDTxt
                text: "WATER HEATER"
                color: "#79787E"
                font.pixelSize: 8 * respAvgFactor * 0.72
                font.family: "Kentledge"
                horizontalAlignment: Qt.AlignHCenter
                anchors {
                    top: parent.bottom
                    horizontalCenter: parent.horizontalCenter
                    topMargin: -2 * respHeightFactor
                }
            }

            onClicked: {
                switchBtnD.isOn = !switchBtnD.isOn
            }
        }

        ToggleableButton {
            id: switchBtnE
            width: 70 * respWidthFactor * 0.72
            height: 70 * respHeightFactor * 0.72
            iconOffState: "qrc:/Assets/ControlPage/ButtonK_Unpressed.png"
            iconOffPressedState: "qrc:/Assets/ControlPage/ButtonK_Unpressed.png"
            iconOnState: "qrc:/Assets/ControlPage/ButtonK_Pressed.png"
            iconOnPressedState: "qrc:/Assets/ControlPage/ButtonK_Pressed.png"

            Label {
                id: switchBtnETxt
                text: "ELECTRONIC"
                color: "#79787E"
                font.pixelSize: 8 * respAvgFactor * 0.72
                font.family: "Kentledge"
                horizontalAlignment: Qt.AlignHCenter
                anchors {
                    top: parent.bottom
                    horizontalCenter: parent.horizontalCenter
                    topMargin: -2 * respHeightFactor
                }
            }

            onClicked: {
                switchBtnE.isOn = !switchBtnE.isOn
            }
        }
    }

    // Fluids ViewSection

    Label {
        id: fluidsLabel
        text: "FLUIDS"
        color: "#FFFFFF"
        font.pixelSize: 8.5 * respAvgFactor * 0.72
        font.family: "Kentledge"
        font.weight: 400 * respAvgFactor * 0.72
        horizontalAlignment: Qt.AlignHCenter
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 41 * respHeightFactor
            leftMargin: 650 * respWidthFactor
        }
    }

    Row {
        id: fluidsProgressBarRow1
        spacing: 18  * respWidthFactor
        anchors {
            top: parent.top
            horizontalCenter: fluidsLabel.horizontalCenter
            topMargin: 104 * respHeightFactor
        }

        ChartStyleProgressBar {
            id: progressBarA
            width: 115 * respWidthFactor * 0.72
            height: 140 * respHeightFactor * 0.72
            avgFactor: respAvgFactor * 0.72
            progressBarColorStart: "#07850C"
            progressBarColorEnd: "#2AA62F"
            itemName: "Bar A"
            value: 15

        }

        ChartStyleProgressBar {
            id: progressBarB
            width: 115 * respWidthFactor * 0.72
            height: 140 * respHeightFactor * 0.72
            avgFactor: respAvgFactor * 0.72
            progressBarColorStart: "#D80B0B"
            progressBarColorEnd: "#A62A2A"
            itemName: "Bar B"
            value: 27
        }

        ChartStyleProgressBar {
            id: progressBarC
            width: 115 * respWidthFactor * 0.72
            height: 140 * respHeightFactor * 0.72
            avgFactor: respAvgFactor * 0.72
            progressBarColorStart: "#07850C"
            progressBarColorEnd: "#2AA62F"
            itemName: "Bar C"
            value: 100
        }

        ChartStyleProgressBar {
            id: progressBarD
            width: 115 * respWidthFactor * 0.72
            height: 140 * respHeightFactor * 0.72
            avgFactor: respAvgFactor * 0.72
            progressBarColorStart: "#07850C"
            progressBarColorEnd: "#2AA62F"
            itemName: "Bar D"
            value: 30
        }

        ChartStyleProgressBar {
            id: progressBarE
            width: 115 * respWidthFactor * 0.72
            height: 140 * respHeightFactor * 0.72
            avgFactor: respAvgFactor * 0.72
            progressBarColorStart: "#075085"
            progressBarColorEnd: "#2A5CA6"
            itemName: "Bar E"
            value: 75
        }
    }

    Row {
        id: fluidsRow
        spacing: -2  * respWidthFactor
        anchors {
            top: parent.top
            horizontalCenter: fluidsLabel.horizontalCenter
            topMargin: 360 * respHeightFactor * 0.72
        }

        ToggleableButton {
            id: fluidControlBtnA
            width: 83 * respWidthFactor * 0.72
            height: 83 * respHeightFactor * 0.72
            iconOffState: "qrc:/Assets/ControlPage/ButtonE_Unpressed.png"
            iconOffPressedState: "qrc:/Assets/ControlPage/ButtonE_Unpressed.png"
            iconOnState: "qrc:/Assets/ControlPage/ButtonE_Pressed.png"
            iconOnPressedState: "qrc:/Assets/ControlPage/ButtonE_Pressed.png"

            Label {
                id: fluidControlBtnATxt
                text: "Water\nPump A"
                color: "#79787E"
                font.pixelSize: 8 * respAvgFactor * 0.72
                font.family: "Kentledge"
                horizontalAlignment: Qt.AlignHCenter
                anchors {
                    top: parent.bottom
                    horizontalCenter: parent.horizontalCenter
                    topMargin: -2 * respHeightFactor
                }
            }

            onClicked: {
                fluidControlBtnA.isOn = !fluidControlBtnA.isOn
            }
        }

        ToggleableButton {
            id: fluidControlBtnB
            width: 83 * respWidthFactor * 0.72
            height: 83 * respHeightFactor * 0.72
            iconOffState: "qrc:/Assets/ControlPage/ButtonE_Unpressed.png"
            iconOffPressedState: "qrc:/Assets/ControlPage/ButtonE_Unpressed.png"
            iconOnState: "qrc:/Assets/ControlPage/ButtonE_Pressed.png"
            iconOnPressedState: "qrc:/Assets/ControlPage/ButtonE_Pressed.png"

            Label {
                id: fluidControlBtnBTxt
                text: "Water\nPump B"
                color: "#79787E"
                font.pixelSize: 8 * respAvgFactor * 0.72
                font.family: "Kentledge"
                horizontalAlignment: Qt.AlignHCenter
                anchors {
                    top: parent.bottom
                    horizontalCenter: parent.horizontalCenter
                    topMargin: -2 * respHeightFactor
                }
            }

            onClicked: {
                fluidControlBtnB.isOn = !fluidControlBtnB.isOn
            }
        }

        ToggleableButton {
            id: fluidControlBtnC
            width: 83 * respWidthFactor * 0.72
            height: 83 * respHeightFactor * 0.72
            iconOffState: "qrc:/Assets/ControlPage/ButtonE_Unpressed.png"
            iconOffPressedState: "qrc:/Assets/ControlPage/ButtonE_Unpressed.png"
            iconOnState: "qrc:/Assets/ControlPage/ButtonE_Pressed.png"
            iconOnPressedState: "qrc:/Assets/ControlPage/ButtonE_Pressed.png"

            Label {
                id: fluidControlBtnCTxt
                text: "Water\nPump C"
                color: "#79787E"
                font.pixelSize: 8 * respAvgFactor * 0.72
                font.family: "Kentledge"
                horizontalAlignment: Qt.AlignHCenter
                anchors {
                    top: parent.bottom
                    horizontalCenter: parent.horizontalCenter
                    topMargin: -2 * respHeightFactor
                }
            }

            onClicked: {
                fluidControlBtnC.isOn = !fluidControlBtnC.isOn
            }
        }

        ToggleableButton {
            id: fluidControlBtnD
            width: 83 * respWidthFactor * 0.72
            height: 83 * respHeightFactor * 0.72
            iconOffState: "qrc:/Assets/ControlPage/ButtonE_Unpressed.png"
            iconOffPressedState: "qrc:/Assets/ControlPage/ButtonE_Unpressed.png"
            iconOnState: "qrc:/Assets/ControlPage/ButtonE_Pressed.png"
            iconOnPressedState: "qrc:/Assets/ControlPage/ButtonE_Pressed.png"

            Label {
                id: fluidControlBtnDTxt
                text: "Water\nPump D"
                color: "#79787E"
                font.pixelSize: 8 * respAvgFactor * 0.72
                font.family: "Kentledge"
                horizontalAlignment: Qt.AlignHCenter
                anchors {
                    top: parent.bottom
                    horizontalCenter: parent.horizontalCenter
                    topMargin: -2 * respHeightFactor
                }
            }

            onClicked: {
                fluidControlBtnD.isOn = !fluidControlBtnD.isOn
            }
        }

        ToggleableButton {
            id: fluidControlBtnE
            width: 83 * respWidthFactor * 0.72
            height: 83 * respHeightFactor * 0.72
            iconOffState: "qrc:/Assets/ControlPage/ButtonE_Unpressed.png"
            iconOffPressedState: "qrc:/Assets/ControlPage/ButtonE_Unpressed.png"
            iconOnState: "qrc:/Assets/ControlPage/ButtonE_Pressed.png"
            iconOnPressedState: "qrc:/Assets/ControlPage/ButtonE_Pressed.png"

            Label {
                id: fluidControlBtnETxt
                text: "Water\nPump E"
                color: "#79787E"
                font.pixelSize: 8 * respAvgFactor * 0.72
                font.family: "Kentledge"
                horizontalAlignment: Qt.AlignHCenter
                anchors {
                    top: parent.bottom
                    horizontalCenter: parent.horizontalCenter
                    topMargin: -2 * respHeightFactor
                }
            }

            onClicked: {
                fluidControlBtnE.isOn = !fluidControlBtnE.isOn
            }
        }
    }
}
