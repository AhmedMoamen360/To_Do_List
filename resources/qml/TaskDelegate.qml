import QtQuick 2.0
import QtQuick.Controls 2.15

Rectangle {
    id: root

    property string type
    property bool expanded
    property alias text: txt.text

    signal editTaskType(string type, int index)
    signal editTask(string task, int index)

    implicitHeight: txt.height + 10
    height: expanded ? txt.height : 0
    radius: 5
    color: mouseTask.containsMouse ? "#9e9e9e" : "#242426"
    clip: true

    Behavior on height {
        NumberAnimation {duration: 200}
    }

    Image {
        id: image
        source: {
            if(root.type == "Completed") {
                return "qrc:/icons/completed.png"
            }

            if(mouseImage.containsMouse) {
                return "qrc:/icons/checked.png"
            }
            else {
                return "qrc:/icons/circle.png"
            }
        }
        anchors.left: root.left
        anchors.leftMargin: 5
        anchors.verticalCenter: root.verticalCenter
        fillMode: Image.PreserveAspectFit
        height: txt.height
        width: 20

        MouseArea {
            id: mouseImage
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
                if(root.type == "Completed") {
                    root.editTaskType("To Do", index)
                }

                else if(root.type == "To Do") {
                    root.editTaskType("Completed", index)
                }
            }
        }
    }

    TextField {
        id: txt
        anchors.verticalCenter: root.verticalCenter
        anchors.left: image.right
        anchors.right: root.right
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        font.strikeout: root.type == "Completed" ? true : false
        font.pixelSize: 18
        background: Item {}
        color: "white"
        onAccepted: {
            if(text != "") {
                focus = false
                root.editTask(text, index)
            }
        }

        MouseArea {
            id: mouseTask
            anchors.fill: parent
            hoverEnabled: true
            onDoubleClicked: {
                txt.focus = true
            }
        }
    }
}
