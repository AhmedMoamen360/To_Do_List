import QtQuick 2.0
import QtQuick.Controls 2.15

Rectangle {
    id: root

    color: ToDoStyle.headerColor
    implicitHeight: textInput.height + 5
    radius: 5

    signal addTask(string task)

    Image {
        id: image
        source: "qrc:/icons/add.png"
        anchors {
            left: root.left
            leftMargin: 5
            verticalCenter: root.verticalCenter
        }
        fillMode: Image.PreserveAspectFit
        height: textInput.height
        width: 20
    }

    TextField {
        id: textInput
        anchors {
            right: root.right
            left: image.right
            leftMargin: 10
            verticalCenter: root.verticalCenter
        }
        font {
            pixelSize: ToDoStyle.fontTextPixelSize
        }
        background: Item {}
        color: ToDoStyle.textColor
        placeholderText: "Add a Task..."
        onAccepted: {
            if(text != "") {
                root.addTask(text)
                text = ""
            }
        }
    }
}
