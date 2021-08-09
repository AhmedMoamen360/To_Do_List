import QtQuick 2.0

Rectangle {
    id: root

    property alias text: txt.text
    property bool sectionIsExpanded

    readonly property string __ls: section
    color: mouse.containsMouse ? "#9e9e9e" : "#37474f"
    implicitHeight: txt.implicitHeight + 5
    radius: 5
    border {
        color: "black"
        width: 1
    }

    signal toggleSection(string section)

    Image {
        id: image
        source: "qrc:/icons/collapse.png"
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.verticalCenter: parent.verticalCenter
        fillMode: Image.PreserveAspectFit
        height: txt.implicitHeight
        width: 20
        rotation: sectionIsExpanded ? 0 : -90

        Behavior on rotation {
            NumberAnimation {duration: 200}
        }
    }

    Text {
        id: txt
        anchors.left: image.right
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: 24
        font.bold: true
        color: "white"
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        hoverEnabled: true
        onClicked: root.toggleSection(txt.text)
    }
}
