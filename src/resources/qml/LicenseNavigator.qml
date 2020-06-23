import QtQuick 2.15
import QtQuick.Controls 1.4 as Classic
import QtQuick.Layouts 1.15

ColumnLayout {
    id: root

    property int pointSize: 12
    property alias model: tree.model
    property string licenseText
    signal displayLicense

    Classic.TreeView {
        id: tree

        Layout.fillHeight: true
        Layout.fillWidth: true

        headerVisible: false

        Classic.TableViewColumn {
            role: "display"
        }

        rowDelegate: Rectangle {
            height: root.pointSize * 2
            SystemPalette {
                id: sysPalette
            }
            color: {
                var baseColor = styleData.alternate ? sysPalette.alternateBase : sysPalette.base
                return styleData.selected ? sysPalette.highlight : baseColor
            }
        }

        itemDelegate: Item {
            Text {
                id: itemText
                anchors.verticalCenter: parent.verticalCenter
                color: styleData.textColor
                elide: styleData.elideMode
                text: styleData.value
                font.pointSize: root.pointSize
            }
        }

        function toggleExpanded(index) {
            if (tree.isExpanded(index))
                tree.collapse(index)
            else
                tree.expand(index)
        }

        onDoubleClicked: {
            tree.toggleExpanded(index)
            root.licenseText = model.readFile(index)
            root.displayLicense()
        }
    }
}
