import QtQuick 2.0

Rectangle {
    id: root

    property bool sectionIsExpanded
    property alias text: txt.text

    signal toggleSection(string section)

    color: mouseSection.containsMouse ? "#9e9e9e" : "#37474f"
    implicitHeight: txt.height + 5
    radius: 5
    border {
        color: "black"
        width: 1
    }

    Image {
        id: image
        source: "qrc:/icons/collapse.png"
        anchors.left: root.left
        anchors.leftMargin: 5
        anchors.verticalCenter: parent.verticalCenter
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
        anchors.left: image.right
        anchors.leftMargin: 10
        anchors.verticalCenter: root.verticalCenter
        font.pixelSize: 24
        font.bold: true
        color: "white"
    }

    MouseArea {
        id: mouseSection
        anchors.fill: parent
        hoverEnabled: true
        onClicked: root.toggleSection(txt.text)
    }
}
