import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.0

import "theme.js" as Theme
import "addresses.js" as Addesses

RowLayout {
    id: root

    Layout.fillWidth: true
    spacing: 0

    property bool offTheRecord: false
    property alias currentIndex: tabs.currentIndex
    property alias model: tabsRepeater.model

    function makeNewTab()  {
        console.log("Make new tab");
        tabModel.append({ tabUrl: Addesses.speedDial, tabTitle: Addesses.speedDialTitle })
        tabs.currentIndex = (tabModel.count - 1)
    }

    function closeTabByIndex(tabIndex) {
        console.log("Close tab : " + tabIndex)
        tabModel.remove(tabIndex)
        if (tabModel.count === 0) {
            makeNewTab();
        }
    }

    function closeCurrentTab() {
        console.log("Close current tab")
        closeTabByIndex(tabs.currentIndex)
    }

    TabBar {
        id: tabs

        Repeater {
            id: tabsRepeater

            TabButton {
                id: tab
                text: tabTitle

                property bool currentTab: (index == tabs.currentIndex)

                width: 120

                contentItem: Text {
                    id: tabLabel

                    text: tab.text
                    font: tab.font
                    color: root.offTheRecord? Theme.offTheRecordTextColor : Theme.textColor
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight

                    Button {
                        id: closeTab

                        height: 12
                        width: 12
                        anchors.right: tabLabel.right
                        anchors.verticalCenter: tabLabel.verticalCenter

                        onClicked: closeTabByIndex(index);

                        background: Rectangle {
                            property string buttonColor: root.offTheRecord ? Theme.offTheRecordColor : Theme.addressBarColor
                            color: tab.hovered ? buttonColor : "transparent"
                            border.color: tabBackground.color
                            border.width: tab.hovered && closeTab.hovered ? (closeTab.down? 1 : 0) : 1
                            radius: 2
                        }
                    }
                }

                background: Rectangle {
                    id: tabBackground
                    property string offTheRecordColor: tab.hovered ? Theme.offTheRecordHightlight : (tab.currentTab ? Theme.offTheRecordColor : Theme.offTheRecordLowlight)
                    property string onTheRecordColor: tab.hovered ? Theme.addressBarHighlight : (tab.currentTab ? Theme.addressBarColor : Theme.addressBarLowlight)

                    color: root.offTheRecord ? offTheRecordColor : onTheRecordColor
                }
            }
        }
    }

    Button {
        id: newTab
        Layout.preferredHeight:12
        Layout.preferredWidth:12
        Layout.alignment: Qt.AlignVCenter
        Layout.leftMargin: 2

        onClicked: makeNewTab();

        background: Rectangle {
            property string buttonColor: root.offTheRecord ? Theme.offTheRecordColor : Theme.addressBarColor
            property string buttonHightlightColor: root.offTheRecord ? Theme.offTheRecordHightlight : Theme.addressBarHighlight
            color: newTab.hovered ? buttonHightlightColor : buttonColor
            border.color: Theme.tabBarBackground
            border.width: newTab.hovered ? 0 : 1
            radius: 2
        }
    }
}
