import QtQuick 2.11
import QtQuick.Layouts 1.0

import "theme.js" as Theme

Rectangle {
    id: root

    property alias url: labelText.text

    signal goToAddress(string address)
    signal back()
    signal forward()

    property int barPadding: 2
    property int barRadius: 2

    color: Theme.light

    function focusAddressField() {
        console.log("Focus Address Field: Set label visible to false")
        label.visible = false;
    }

    function unfocusAddressField() {
        console.log("Unfocus Address Field: Set label visible to true")
        label.visible = true;
    }

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

        Item {
            Layout.rightMargin: 2
            Layout.fillWidth: true
            Layout.preferredHeight: backButton.height

            AddressBackground {
                id: label
                anchors.fill: parent

                Text {
                    id: labelText
                    anchors.verticalCenter: parent.verticalCenter
                    leftPadding: root.barPadding
                    color: Theme.textColor
                }

                MouseArea {
                    id: clickToFocusArea
                    anchors.fill: label
                    hoverEnabled: true
                    cursorShape: Qt.IBeamCursor
                    onClicked: root.focusAddressField();
                }
            }

            AddressBackground {
                id: field
                anchors.fill: parent

                visible: !label.visible

                TextInput {
                    id: inputField
                    anchors.fill: parent
                    verticalAlignment: TextInput.AlignVCenter
                    leftPadding: labelText.leftPadding

                    focus: visible
                    selectByMouse: true
                    selectedTextColor: Theme.selectedTextColor
                    selectionColor: Theme.selectionColor

                    onActiveFocusChanged: {
                        if (activeFocus) {
                            inputField.text = labelText.text;
                            root.focusAddressField();
                            inputField.selectAll();
                        } else {
                            root.unfocusAddressField();
                        }
                    }

                    onAccepted: {
                        root.goToAddress(inputField.text);
                        root.unfocusAddressField();
                    }
                }
            }
        }
    }
}
