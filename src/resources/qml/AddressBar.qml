import QtQuick 2.11
import QtQuick.Layouts 1.0

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

    RowLayout {
        id: displaybox
        anchors.fill: parent
        spacing: root.barPadding

        NavigationButton {
            id: backButton
            Layout.leftMargin: root.barPadding
            text: "<"
            onClicked: root.back();
        }

        NavigationButton {
            id: forwardButton
            text: ">"
            onClicked: root.forward();
        }

        AddressBackground {
            id: label
            height: backButton.height

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

        AddressBackground {
            id: field
            height: backButton.height

            visible: !label.visible

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
