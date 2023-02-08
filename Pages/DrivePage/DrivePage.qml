import QtQuick 2.11
import QtQuick.Controls 2.4
import "../Components"

Item {
    id: root
    property string objectName: "DrivePage"

    SystemMessage {
        id: sysMsg
        width: 290 * respWidthFactor * 0.5
        height: 164 * respHeightFactor * 0.5
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 111 * respHeightFactor * 0.2
            leftMargin: 815 * respWidthFactor * 0.5
        }
    }

    VoltageIndicatorLeft {
        property real voltVal: outputcontroller.battVoltage1

        id: voltIndLeft
        width: 184 * respWidthFactor * 0.5
        height: 132 * respHeightFactor * 0.5
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 110 * respHeightFactor * 0.2
            leftMargin: 162 * respWidthFactor * 0.5
        }

        Label {
            id: voltageLeftTxt
            text: voltIndLeft.voltVal.toFixed(2) + "V"
            color: "#A1A1A1"
            font.family: "Kentledge"
            font.pixelSize: 23 * respAvgFactor * 0.5
            horizontalAlignment: Qt.AlignCenter

            anchors {
                horizontalCenter: parent.horizontalCenter
                top: parent.top
                topMargin: 76 * respHeightFactor * 0.5
            }
        }
    }

    VoltageIndicatorRight {
        property real voltVal: outputcontroller.battVoltage2

        id: voltIndRight
        width: 184 * respWidthFactor * 0.5
        height: 132 * respHeightFactor * 0.5
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 110 * respHeightFactor * 0.2
            leftMargin: 1576 * respWidthFactor * 0.5
        }

        Label {
            id: voltageRightTxt
            text: voltIndRight.voltVal.toFixed(2) + "V"
            color: "#A1A1A1"
            font.family: "Kentledge"
            font.pixelSize: 23 * respAvgFactor * 0.5
            horizontalAlignment: Qt.AlignCenter

            anchors {
                horizontalCenter: parent.horizontalCenter
                top: parent.top
                topMargin: 76 * respHeightFactor * 0.5
            }
        }
    }

    LeftDial {
        id: leftRpmDial
        width: 751 * respWidthFactor * 0.4
        height: 751 * respHeightFactor * 0.4
        value: outputcontroller.rpm1
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 212 * respHeightFactor * 0.30
            leftMargin: 149 * respWidthFactor * 0.75
        }
    }

    RightDial {
        id: rightRpmDial
        width: 751 * respWidthFactor * 0.4
        height: 751 * respHeightFactor * 0.4
        value: outputcontroller.rpm2
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 212 * respHeightFactor * 0.30
            leftMargin: 1018 * respWidthFactor * 0.535
        }
    }

    TempMonitorLeft {
        id: tempMonLeft
        width: 335 * respWidthFactor * 0.5
        height: 167 * respHeightFactor * 0.5
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 686 * respHeightFactor * 0.37
            leftMargin: 239 * respWidthFactor * 0.5
        }

        oilTempVal: outputcontroller.oilPressure1
        engineTempVal: outputcontroller.temperature1
    }

    TempMonitorRight {
        id: tempMonRight
        width: 335 * respWidthFactor * 0.5
        height: 167 * respHeightFactor * 0.5
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 686 * respHeightFactor * 0.37
            leftMargin: 1345 * respWidthFactor * 0.5
        }

        oilTempVal: outputcontroller.oilPressure2
        engineTempVal: outputcontroller.temperature2
    }

    Image {
        id: ps
        width: 1377 *respWidthFactor * 0.5
        height: 101 * respHeightFactor * 0.5
        source: "qrc:/Assets/DrivePage/Widgets/PS.png"
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 869 * respHeightFactor * 0.4
            leftMargin: 271 * respWidthFactor * 0.5
        }
    }

    Rectangle {
        id: clusterTest
        visible: false
        color: "transparent"
        width: parent.width
        height: 110 * respHeightFactor * 0.5
        anchors {
            bottom: parent.bottom
        }

        Row {
            spacing: 20 * respWidthFactor * 0.5

            Slider {
                id: leftRPMSlider
                from: 0
                to: 6000
                onValueChanged: {
                    leftRpmDial.value = leftRPMSlider.value
                }
            }

            Slider {
                id: rightRPMSlider
                from: 0
                to: 6000
                onValueChanged: {
                    rightRpmDial.value = rightRPMSlider.value
                }
            }

            Slider {
                id: oilTemSlider
                from: 0
                to: 10
                onValueChanged: {
                    tempMonLeft.oilTempVal = oilTemSlider.value
                    tempMonRight.oilTempVal = oilTemSlider.value
                }
            }

            Slider {
                id: engineTemSlider
                from: 0
                to: 120
                onValueChanged: {
                    tempMonLeft.engineTempVal = engineTemSlider.value
                    tempMonRight.engineTempVal = engineTemSlider.value
                }
            }

            Slider {
                id: batLeftSlider
                from: 0
                to: 24
                onValueChanged: {
                    voltIndLeft.voltVal = batLeftSlider.value
                }
            }

            Slider {
                id: batRightSlider
                from: 0
                to: 24
                onValueChanged: {
                    voltIndRight.voltVal = batRightSlider.value
                }
            }
        }
    }
}
