import QtQuick 2.0
import QtQuick.Controls 2.15

Rectangle {
    id: root

    property bool checked
    property bool expanded
    property alias text: textField.text

    signal editTask(string task)
    signal checkClicked()

    implicitHeight: textField.height + 10
    height: expanded ? textField.height : 0
    radius: 5
    color: mouseTask.containsMouse ? ToDoStyle.hoverColor : ToDoStyle.delegateColor
    clip: true

    Behavior on height {
        NumberAnimation {duration: 200}
    }

    Image {
        id: image
        source: {
            if(root.checked) {
                return "qrc:/icons/completed.png"
            }

            if(mouseImage.containsMouse) {
                return "qrc:/icons/checked.png"
            }
            else {
                return "qrc:/icons/circle.png"
            }
        }
        anchors {
            left: root.left
            leftMargin: 5
            verticalCenter: root.verticalCenter
        }
        fillMode: Image.PreserveAspectFit
        height: textField.height
        width: 20

        MouseArea {
            id: mouseImage
            anchors.fill: parent
            hoverEnabled: true
            onClicked: root.checkClicked()
        }
    }

    TextField {
        id: textField
        anchors {
            verticalCenter: root.verticalCenter
            left: image.right
            right: root.right
            leftMargin: 10
            rightMargin: 10
        }
        font {
            strikeout: root.checked
            pixelSize: ToDoStyle.fontTextPixelSize
        }
        background: Item {}
        color: ToDoStyle.textColor
        onAccepted: {
            if(text != "") {
                textField.focus = false
                root.editTask(text)
            }
        }

        MouseArea {
            id: mouseTask
            anchors.fill: parent
            hoverEnabled: true
            onDoubleClicked: textField.forceActiveFocus()
        }
    }
}
