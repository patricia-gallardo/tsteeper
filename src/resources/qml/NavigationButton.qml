import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.0

import "theme.js" as Theme

Button {
    id: root
    height: parent.height - (parent.padding * 2)
    width: height

    background: Rectangle {
        color: root.hovered ? Theme.dark : Theme.light
        radius: 2
    }
}
