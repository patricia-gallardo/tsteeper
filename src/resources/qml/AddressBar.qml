import QtQuick 2.11

Rectangle {
    id: root

    property alias url: labelText.text

    signal goToAddress(string address)
    signal back()
    signal forward()

    property string barColor: "lightsteelblue"
    property int barPadding: 2
    property int barRadius: 2

    color: barColor

    Row {
        id: displaybox
        anchors.fill: parent
        padding: root.barPadding
        spacing: root.barPadding

        NavigationButton {
            id: backButton
            text: "<"
            onClicked: root.back();
        }

        NavigationButton {
            id: forwardButton
            text: ">"
            onClicked: root.forward();
        }

        Rectangle {
            id: label
            anchors.verticalCenter: parent.verticalCenter

            width: root.width - backButton.width - forwardButton.width - (root.barPadding * 4)
            height: backButton.height
            radius: root.barRadius
            color: "white"

            Text {
                id: labelText
                anchors.verticalCenter: parent.verticalCenter
                leftPadding: root.barPadding
                color: "black"
            }

            MouseArea {
                id: clickToFocusArea
                anchors.fill: label
                hoverEnabled: true
                cursorShape: Qt.IBeamCursor
                onClicked: label.visible = false;
            }
        }

        Rectangle {
            id: field
            anchors.verticalCenter: parent.verticalCenter

            width: label.width
            height: label.height
            radius: label.radius

            visible: !label.visible

            color: label.color

            TextInput {
                id: inputField
                anchors.fill: parent
                verticalAlignment: TextInput.AlignVCenter
                leftPadding: labelText.leftPadding

                focus: visible
                selectByMouse: true

                onActiveFocusChanged: {
                    if (activeFocus) {
                        inputField.text = labelText.text;
                        label.visible = false;
                        inputField.selectAll();
                    } else {
                        label.visible = true;
                    }
                }

                onAccepted: {
                    root.goToAddress(inputField.text)
                    label.visible = true;
                }
            }
        }
    }
}
