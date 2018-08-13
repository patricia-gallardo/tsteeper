import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.0

import "theme.js" as Theme

Button {
    id: root
    height: parent.height - (parent.padding * 2)
    width: height

    property string buttonHighlightColor
    property string buttonColor
    property string buttonTextColor

    contentItem: Text {
        text: root.text
        font: root.font
        color: buttonTextColor
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    background: Rectangle {
        id: style
        color: root.hovered ? buttonHighlightColor : buttonColor
        radius: 2
    }
}
