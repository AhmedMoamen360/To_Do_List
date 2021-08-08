import QtQuick 2.0
import QtQuick.Controls 2.15

Rectangle {
    id: root

    color: "#37474f"
    implicitHeight: textInput.implicitHeight + 5
    radius: 5

    signal addTask(string task)

    Image {
        id: image
        source: "qrc:/icons/add.png"
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.verticalCenter: parent.verticalCenter
        fillMode: Image.PreserveAspectFit
        height: textInput.height
        width: 20
    }

    TextField {
        id: textInput
        anchors.right: parent.right
        anchors.left: image.right
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: 18
        background: Item {}
        color: "black"
        placeholderText: "Add task..."
        onAccepted: {
            if(text != "") {
                root.addTask(text)
                text = ""
            }
        }
    }
}
