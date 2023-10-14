import QtQuick 2.12
import QtQuick.Controls 2.12
import "./"

Item {
    id: root
    property real respWidthFactor
    property real respHeightFactor
    property int homeNavBtnWidth: 320
    property int profileNavBtnWidth: 320
    property int institutionNavBtnWidth: 320

    height: parent.height
    anchors.top: parent.top
    anchors.left: parent.left

    Image {
        id: pageTitleBox
        width: 324 * respWidthFactor
        height: 116 * respHeightFactor
        source: "qrc:/Assets/Others/PageTitleBox.png"
        anchors {
            top: root.top
            left: root.left
            topMargin: -19 * respHeightFactor
            leftMargin: 1607 * respWidthFactor
        }

        Image {
            id: profileBadge
            width: 52 * respWidthFactor
            height: 52 * respHeightFactor
            source: authenticator.currentUserCredentials === "student" ? "qrc:/Assets/ProfilePage/ProfileBadge.png"
                                                                       : "qrc:/Assets/ProfilePage/ProfileBadge2.png"
            anchors {
                top: pageTitleBox.top
                left: pageTitleBox.left
                topMargin: 45 * respHeightFactor
                leftMargin: 67 * respWidthFactor
            }
        }

        Label {
            id: pageTitle
            text: "Hi, " + authenticator.currentUser
            width: 82 * respWidthFactor
            height: 28 * respHeightFactor
            color: "#3D3E3D"
            font.pixelSize: 25 * respWidthFactor
            font.bold: true
            font.family: "Arial"
            anchors {
                top: pageTitleBox.top
                left: pageTitleBox.left
                topMargin: 58 * respHeightFactor
                leftMargin: 150 * respWidthFactor
            }
        }
    }

    ToggleableButton {
        id: homeNavBtn
        width: homeNavBtnWidth * respWidthFactor
        height: 100 * respHeightFactor
        iconOffState: "qrc:/Assets/Others/Navbar/HomeTabUnselected.png"
        iconOnState: "qrc:/Assets/Others/Navbar/HomeTabSelected.png"
        iconOnPressedState: "qrc:/Assets/Others/Navbar/HomeTabSelected.png"
        iconOffPressedState: "qrc:/Assets/Others/Navbar/HomeTabUnselected.png"
        cursorShape: Qt.PointingHandCursor
        anchors {
            top: root.top
            left: root.left
            topMargin: 367 * respHeightFactor
            leftMargin: -10 * respHeightFactor
        }

        onClicked: {
            if(portalStackView.currentItem.objectName !== "HomePage")
            {
                if(portalStackView.currentItem.objectName === "ProfilePage")
                {
                    profileNavBtn.isOn = false
                    profileNavBtnWidth = 320
                }
                else if(portalStackView.currentItem.objectName === "InstitutionPage")
                {
                    institutionNavBtn.isOn = false
                    institutionNavBtnWidth = 320
                }

                homeNavBtn.isOn = true
                homeNavBtnWidth = 350
                portalStackView.replace(portalStackView.currentItem, homePage)
            }
        }
    }

    ToggleableButton {
        id: profileNavBtn
        width: profileNavBtnWidth * respWidthFactor
        height: 100 * respHeightFactor
        iconOffState: "qrc:/Assets/Others/Navbar/ProfileTabUnselected.png"
        iconOnState: "qrc:/Assets/Others/Navbar/ProfileTabSelected.png"
        iconOnPressedState: "qrc:/Assets/Others/Navbar/ProfileTabSelected.png"
        iconOffPressedState: "qrc:/Assets/Others/Navbar/ProfileTabUnselected.png"
        cursorShape: Qt.PointingHandCursor
        anchors {
            top: root.top
            left: root.left
            topMargin: 488 * respHeightFactor
            leftMargin: -10 * respHeightFactor
        }

        onClicked: {
            if(portalStackView.currentItem.objectName !== "ProfilePage")
            {
                if(portalStackView.currentItem.objectName === "HomePage")
                {
                    homeNavBtn.isOn = false
                    homeNavBtnWidth = 320
                }
                else if(portalStackView.currentItem.objectName === "InstitutionPage")
                {
                    institutionNavBtn.isOn = false
                    institutionNavBtnWidth = 320
                }

                profileNavBtn.isOn = true
                profileNavBtnWidth = 350
                portalStackView.replace(portalStackView.currentItem, profilePage)
            }
        }
    }

    ToggleableButton {
        id: institutionNavBtn
        width: institutionNavBtnWidth * respWidthFactor
        height: 100 * respHeightFactor
        iconOffState: "qrc:/Assets/Others/Navbar/InstitutionTabUnselected.png"
        iconOnState: "qrc:/Assets/Others/Navbar/InstitutionTabSelected.png"
        iconOnPressedState: "qrc:/Assets/Others/Navbar/InstitutionTabSelected.png"
        iconOffPressedState: "qrc:/Assets/Others/Navbar/InstitutionTabUnselected.png"
        cursorShape: Qt.PointingHandCursor
        anchors {
            top: root.top
            left: root.left
            topMargin: 608 * respHeightFactor
            leftMargin: -10 * respHeightFactor
        }

        onClicked: {
            if(portalStackView.currentItem.objectName !== "InstitutionPage")
            {
                if(portalStackView.currentItem.objectName === "HomePage")
                {
                    homeNavBtn.isOn = false
                    homeNavBtnWidth = 320
                }
                else if(portalStackView.currentItem.objectName === "ProfilePage")
                {
                    profileNavBtn.isOn = false
                    profileNavBtnWidth = 320
                }

                institutionNavBtn.isOn = true
                institutionNavBtnWidth = 350
                portalStackView.replace(portalStackView.currentItem, institutionPage)
            }

        }
    }

    Component.onCompleted:  {
        homeNavBtn.isOn = true
        homeNavBtnWidth = 350
    }
}
