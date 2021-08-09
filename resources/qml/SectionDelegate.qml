import QtQuick 2.0

Rectangle {
    id: root

    property bool sectionIsExpanded
    property alias text: txt.text

    signal toggleSection(string section)

    color: mouseSection.containsMouse ? ToDoStyle.hoverColor : ToDoStyle.headerColor
    implicitHeight: txt.height + 5
    radius: 5
    border {
        color: ToDoStyle.borderColor
        width: 1
    }

    Image {
        id: image
        source: "qrc:/icons/collapse.png"
        anchors {
            left: root.left
            leftMargin: 5
            verticalCenter: parent.verticalCenter
        }
        fillMode: Image.PreserveAspectFit
        height: txt.height
        width: 20
        rotation: root.sectionIsExpanded ? 0 : -90

        Behavior on rotation {
            NumberAnimation {duration: 200}
        }
    }

    Text {
        id: txt
        anchors {
            left: image.right
            leftMargin: 10
            verticalCenter: root.verticalCenter
        }
        font {
            pixelSize: ToDoStyle.fontHeaderPixelSize
            bold: true
        }
        color: ToDoStyle.textColor
    }

    MouseArea {
        id: mouseSection
        anchors.fill: parent
        hoverEnabled: true
        onClicked: root.toggleSection(txt.text)
    }
}
