import QtQuick 2.0

Rectangle {
    readonly property ListView __lv: ListView.view
    property bool expanded: __lv.isSectionExpanded(model.type) // or type directly
    implicitHeight: txt.implicitHeight + 10
    height: expanded ? implicitHeight : 0
    radius: 5
    color: mouse.containsMouse ? "#9e9e9e" : "#242426"
    clip: true

    Behavior on height {
        NumberAnimation {duration: 200}
    }

    Image {
        id: image
        source: mouse.containsMouse ? "images/checked.png" : "images/circle.png"
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.verticalCenter: parent.verticalCenter
        fillMode: Image.PreserveAspectFit
        height: txt.implicitHeight
        width: 20
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        hoverEnabled: true
    }

    Text {
        id: txt
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: image.right
        anchors.leftMargin: 10
        text: model.task // or task directly
        font.pixelSize: 18
        color: "white"
    }
}
