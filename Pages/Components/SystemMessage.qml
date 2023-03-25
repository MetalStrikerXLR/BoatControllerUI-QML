import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Shapes 1.4
import "../Components"

Item {
    id: systemMessage

    Image {
        id: background
        source: "qrc:/Assets/DrivePage/Widgets/SystemMsg.png"
        anchors.fill: parent
    }
}
