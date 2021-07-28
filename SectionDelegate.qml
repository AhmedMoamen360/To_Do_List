import QtQuick 2.0

Rectangle {
    readonly property ListView __lv: ListView.view
    color: mouse.containsMouse ? "#819ca9" : "#37474f"
    implicitHeight: txt.implicitHeight + 5
    radius: 5
    border {
        color: "black"
        width: 1
    }

    Image {
        id: image
        source: "images/collapse.png"
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.verticalCenter: parent.verticalCenter
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
        anchors.left: image.right
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: 24
        font.bold: true
        text: section
        color: "white"
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        hoverEnabled: true
        onClicked: __lv.toggleSection(section)
    }
}

