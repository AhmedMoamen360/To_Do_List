import QtQuick 2.0

Rectangle {
    property alias input_focus: txt_input.focus
    property alias input_text: txt_input.text

    color: mouse.containsMouse ? "#819ca9" : "#37474f"
    implicitHeight: txt_input.implicitHeight + 5
    radius: 5

    Image {
        id: image
        source: "images/add.png"
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.verticalCenter: parent.verticalCenter
        fillMode: Image.PreserveAspectFit
        height: txt_input.implicitHeight
        width: 20
    }

    TextInput {
        id: txt_input
        anchors.right: parent.right
        anchors.left: image.right
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: 18
        color: "white"
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        hoverEnabled: true

        onClicked: {
            txt_input.focus = true
        }
    }

}
