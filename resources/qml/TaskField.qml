import QtQuick 2.0

Rectangle {
    property alias input_focus: txt_input.focus
    property alias input_text: txt_input.text

    color: mouse.containsMouse ? "#9e9e9e" : "#37474f"
    implicitHeight: txt_input.implicitHeight + 5
    radius: 5

    signal addTask(string task)

    Image {
        id: image
        source: "qrc:/icons/add.png"
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
        onAccepted: {
            if(text != "") {
                parent.addTask(text)
                text = ""
            }

        }
    }
    MouseArea {
        id: mouse
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            txt_input.focus = true
            txt_input.text = txt_input.text == "Add a Task" ? "" : txt_input.text
        }
    }

}
