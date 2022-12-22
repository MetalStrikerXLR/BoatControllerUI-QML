import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12
import "./Pages/DrivePage"
import "./Pages/ControlPage"
import "./Pages/SettingsPage"
import "./Pages/Components"

ApplicationWindow {
    width: 1065
    height: 832
    visible: true
    //    visibility: "Maximized"
    title: qsTr("Boat Controller App")

    property int baseAssetWidth: 1065
    property int baseAssetHeight: 832
    property real respWidthFactor: width / baseAssetWidth
    property real respHeightFactor: height / baseAssetHeight
    property real respAvgFactor: Math.sqrt(Math.pow(respWidthFactor, 2) + Math.pow(respHeightFactor, 2))

    property string currentTime: ""
    property string currentDate: ""

    Timer {
        id: timer
        repeat: true
        interval: 1000
        running: true

        onTriggered: {
            const days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
            const months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

            var currentDateTime = new Date()

            let day = days[currentDateTime.getDay()]
            let month = months[currentDateTime.getMonth()]
            let date = currentDateTime.getDate()
            let year = currentDateTime.getFullYear()
            let hours = currentDateTime.getHours()
            let minutes = currentDateTime.getMinutes()
            let meredian = hours > 12 ? "PM" : "AM"

            hours = hours % 12
            hours = hours ? hours : 12
            hours = hours < 10 ? '0'+hours : hours;
            minutes = minutes < 10 ? '0'+minutes : minutes

            currentTime = hours + ":" + minutes + " " + meredian
            currentDate = day + "," + month + " " + date + ", " + year
        }
    }

    Rectangle {
        id: background
        color: "#080808"
        anchors.fill: parent
    }

    Label {
        id: logo
        width: 62 * respWidthFactor
        height: 30 * respHeightFactor
        text: "LOGO"
        color: "#FFFFFF"
        font.family: "Kentledge"
        font.pixelSize: 18 * respAvgFactor
        font.bold: true
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 63 * respHeightFactor
            leftMargin: 112 * respWidthFactor
        }

    }

    Image {
        id: alarmIcon
        width: 18 * respWidthFactor
        height: 20.73 * respHeightFactor
        source: "qrc:/Assets/MainPage/AlarmIcon.png"
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 70 * respHeightFactor
            leftMargin: 814 * respWidthFactor
        }
    }

    Label {
        id: timeText
        text: currentTime
        color: "white"
        font.pixelSize: 18 * respAvgFactor
        font.family: "Kentledge"
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 51 * respHeightFactor
            leftMargin: 880 * respWidthFactor
        }
    }

    Label {
        id: dateText
        text: currentDate
        color: "#807F84"
        font.pixelSize: 10 * respAvgFactor
        font.family: "Kentledge"
        anchors{
            top: timeText.bottom
            horizontalCenter: timeText.horizontalCenter
            topMargin: 4 * respHeightFactor
        }
    }

    // Create a swipe view and load the login page into it
    Rectangle {
        id: viewHolder
        width: 945 * respWidthFactor
        height: 590 * respHeightFactor
        color: "#201F25"
        radius: 20 * respAvgFactor
        clip: true
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 120 * respHeightFactor
            leftMargin: 60 * respWidthFactor
        }

        SwipeView {
            id: mainSwipeView
            currentIndex: 1
            anchors.fill: parent
            interactive: false

            DrivePage{
                id: drivePage
                widthFactor: respWidthFactor
                heightFactor: respHeightFactor
                avgFactor: respAvgFactor
                visible: true
            }

            ControlPage{
                id: controlPage
                widthFactor: respWidthFactor
                heightFactor: respHeightFactor
                avgFactor: respAvgFactor
                visible: true
            }

            SettingsPage{
                id: settingsPage
                widthFactor: respWidthFactor
                heightFactor: respHeightFactor
                avgFactor: respAvgFactor
                visible: true
            }
        }
    }

    Row {
        spacing: 158 * respWidthFactor
        anchors {
            top: viewHolder.bottom
            horizontalCenter: viewHolder.horizontalCenter
            topMargin: -2 * respHeightFactor
        }

        ToggleableButton {
            id: driveBtn
            width: 100 * respWidthFactor
            height: 122 * respHeightFactor
            iconOffState: "qrc:/Assets/MainPage/DriveTabUnselected.png"
            iconOffPressedState: "qrc:/Assets/MainPage/DriveTabUnselected.png"
            iconOnState: "qrc:/Assets/MainPage/DriveTabSelected.png"
            iconOnPressedState: "qrc:/Assets/MainPage/DriveTabSelected.png"
            isOn: mainSwipeView.currentIndex === 0 ? true : false

            onClicked: {
                mainSwipeView.setCurrentIndex(0)
            }
        }

        ToggleableButton {
            id: controlBtn
            width: 100 * respWidthFactor
            height: 122 * respHeightFactor
            iconOffState: "qrc:/Assets/MainPage/ControlTabUnselected.png"
            iconOffPressedState: "qrc:/Assets/MainPage/ControlTabUnselected.png"
            iconOnState: "qrc:/Assets/MainPage/ControlTabSelected.png"
            iconOnPressedState: "qrc:/Assets/MainPage/ControlTabSelected.png"
            isOn: mainSwipeView.currentIndex === 1 ? true : false

            onClicked: {
                mainSwipeView.setCurrentIndex(1)
            }
        }

        ToggleableButton {
            id: settingsBtn
            width: 100 * respWidthFactor
            height: 122 * respHeightFactor
            iconOffState: "qrc:/Assets/MainPage/SettingsTabUnselected.png"
            iconOffPressedState: "qrc:/Assets/MainPage/SettingsTabUnselected.png"
            iconOnState: "qrc:/Assets/MainPage/SettingsTabSelected.png"
            iconOnPressedState: "qrc:/Assets/MainPage/SettingsTabSelected.png"
            isOn: mainSwipeView.currentIndex === 2 ? true : false

            onClicked: {
                mainSwipeView.setCurrentIndex(2)
            }
        }
    }
}
