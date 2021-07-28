import QtQuick 2.0

Rectangle {
    readonly property ListView __lv: ListView.view
    color: "orange"
    width: parent.width
    implicitHeight: txt.implicitHeight + 5
    border.width: 2
    border.color: "black"

    Text {
        id: txt
        anchors.centerIn: parent
        font.pixelSize: 16
        font.bold: true
        text: section
    }

    MouseArea {
        anchors.fill: parent
        onClicked: __lv.toggleSection(section)
    }
}

