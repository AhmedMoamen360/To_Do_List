import QtQuick 2.0
import QtQuick.Controls 2.15

Rectangle {
    id: root

    color: "#37474f"
    implicitHeight: textInput.height + 5
    radius: 5

    signal addTask(string task)

    Image {
        id: image
        source: "qrc:/icons/add.png"
        anchors.left: root.left
        anchors.leftMargin: 5
        anchors.verticalCenter: root.verticalCenter
        fillMode: Image.PreserveAspectFit
        height: textInput.height
        width: 20
    }

    TextField {
        id: textInput
        anchors.right: root.right
        anchors.left: image.right
        anchors.leftMargin: 10
        anchors.verticalCenter: root.verticalCenter
        font.pixelSize: 18
        background: Item {}
        color: "white"
        placeholderText: "Add a Task..."
        onAccepted: {
            if(text != "") {
                root.addTask(text)
                text = ""
            }
        }
    }
}
