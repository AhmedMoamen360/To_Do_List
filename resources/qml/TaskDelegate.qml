import QtQuick 2.0

Rectangle {
    id: root
    property alias task_focus: txt.focus
    property string task_text: model.task
    readonly property ListView __lv: ListView.view
    property bool expanded: __lv.isSectionExpanded(model.type) // or type directly
    implicitHeight: txt.implicitHeight + 10
    height: expanded ? implicitHeight : 0
    radius: 5
    color: mouseTask.containsMouse ? "#9e9e9e" : "#242426"
    clip: true

    signal mouseClicked(int index)

    //    states: [
    //        State {
    //            name: "To Do"
    //            PropertyChanges {
    //                target: __lv.model.get(index)
    //                type: "Completed"
    //            }
    //        },
    //        State {
    //            name: "Completed"
    //            PropertyChanges {
    //                target: __lv.model.get(index)
    //                type: "To Do"
    //            }
    //        }
    //    ]

    //    transitions: [
    //        Transition {
    //            from: "To Do"
    //            to: "Completed"
    //            PropertyAnimation {
    //                target: __lv.model.get(index)
    //                properties: "type"
    //                duration: 100
    //            }
    //        },
    //        Transition {
    //            from: "To Do"
    //            to: "Completed"
    //            PropertyAnimation {
    //                target: __lv.model.get(index)
    //                properties: "type"
    //                duration: 100
    //            }
    //        }
    //    ]

    Behavior on height {
        NumberAnimation {duration: 200}
    }

    Image {
        id: image
        source: {
            if(type == "Completed") {
                return "qrc:/icons/completed.png"
            }

            if(mouseImage.containsMouse) {
                return "qrc:/icons/checked.png"
            }
            else {
                return "qrc:/icons/circle.png"
            }
        }
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.verticalCenter: parent.verticalCenter
        fillMode: Image.PreserveAspectFit
        height: txt.implicitHeight
        width: 20

        MouseArea {
            id: mouseImage
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {

                if(type == "Completed") {
                    __lv.model.editTaskType("To Do", index)
                }

                else if(type == "To Do") {
                    __lv.model.editTaskType("Completed", index)
                }

                root.mouseClicked(index)

                //            switch (parent.state) {
                //            case "": parent.state = type; break
                //            case "To Do": parent.state = "Completed"; break
                //            case "Completed": parent.state = "To Do"; break
                //            }
            }
        }
    }


    TextInput {
        id: txt
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: image.right
        anchors.right: parent.right
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        text: model.task // or task directly
        font.strikeout: type == "Completed" ? true : false
        font.pixelSize: 18
        color: "white"
        onAccepted: {
            focus = false
            if(text == "")
                __lv.model.editTask(task_text, index)
            else
                task_text = model.task
        }

        MouseArea {
            id: mouseTask
            anchors.fill: parent
            hoverEnabled: true
            onDoubleClicked: {
                txt.focus = true
                task_text = txt.text
                root.mouseClicked(index)
            }
            onClicked: {
                root.mouseClicked(index)
            }
        }
    }
}
