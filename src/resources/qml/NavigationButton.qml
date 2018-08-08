import QtQuick 2.11
import QtQuick.Controls 2.4

Button {
    id: root
    anchors.verticalCenter: parent.verticalCenter
    height: parent.height - (parent.padding * 2)
    width: height

    background: Rectangle {
        color: root.hovered ? "steelblue" : (root.pressed ? "blue" : "lightsteelblue")
        radius: 2
    }
}
