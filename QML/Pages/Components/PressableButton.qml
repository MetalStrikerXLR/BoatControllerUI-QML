import QtQuick 2.11
import QtQuick.Controls 2.4

Button {
    id: tabBtn

    width: 352
    height: 130
    property string iconSrc: ""
    property string iconPressedState: ""

    background: Rectangle {
        color: "transparent"
    }

    Image {
        id: icn
        width: tabBtn.width
        height: tabBtn.height
    }

    states: [
        State {
            name: "offState"
            PropertyChanges {
                target: icn
                source: iconSrc
            }
        },
        State {
            name: "pressedState"
            PropertyChanges {
                target: icn
                source: iconPressedState
            }
        }
    ]
    state: pressed ? "pressedState" : "offState"
}
