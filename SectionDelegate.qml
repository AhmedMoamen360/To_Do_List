import QtQuick 2.0

Rectangle {
    readonly property ListView __lv: ListView.view
    color: mouse.containsMouse ? "#6E7C7C" : "#92967D"
//    width: parent.width
    implicitHeight: txt.implicitHeight + 5
    border.width: 2
    border.color: "black"
    radius: 2

    Image {
        source: "images/collapse"
        anchors.left: parent.left
        anchors.leftMargin: 5
        fillMode: Image.PreserveAspectFit
        height: txt.implicitHeight
        width: 20
        rotation: __lv.isSectionExpanded(section) ? 0 : -90

        Behavior on rotation {
            NumberAnimation {duration: 200}
        }
    }

    Text {
        id: txt
        anchors.centerIn: parent
        font.pixelSize: 24
        font.bold: true
        text: section
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        hoverEnabled: true
        onClicked: __lv.toggleSection(section)
    }
}

