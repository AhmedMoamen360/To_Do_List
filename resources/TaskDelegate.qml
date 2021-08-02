import QtQuick 2.0

Rectangle {
    readonly property ListView __lv: ListView.view
    property bool expanded: __lv.isSectionExpanded(model.type) // or type directly
    implicitHeight: txt.implicitHeight + 10
    height: expanded ? implicitHeight : 0
    radius: 5
    color: mouse.containsMouse ? "#9e9e9e" : "#242426"
    clip: true

    states: [
        State {
            name: "To Do"
            PropertyChanges {
                target: __lv.model.get(index)
                type: "Completed"
            }
        },
        State {
            name: "Completed"
            PropertyChanges {
                target: __lv.model.get(index)
                type: "To Do"
            }
        }
    ]

    transitions: [
        Transition {
            from: "To Do"
            to: "Completed"
            PropertyAnimation {
                target: __lv.model.get(index)
                properties: "type"
                duration: 100
            }
        },
        Transition {
            from: "To Do"
            to: "Completed"
            PropertyAnimation {
                target: __lv.model.get(index)
                properties: "type"
                duration: 100
            }
        }
    ]

    Behavior on height {
        NumberAnimation {duration: 200}
    }

    Image {
        id: image
        source: {
            if(type == "Completed") {
                return "images/completed.png"
            }

            if(mouse.containsMouse) {
                return "images/checked.png"
            }
            else {
                return "images/circle.png"
            }
        }
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
        onClicked: {

//            if(type == "To Do") {
//                __lv.model.setProperty(index, "type", "Working On")
//            }

//            else if(type == "Working On") {
//                __lv.model.setProperty(index, "type", "Completed")
//            }

//            else if(type == "Completed") {
//                __lv.model.setProperty(index, "type", "Working On")
//            }

            switch (parent.state) {
            case "": parent.state = type; break
            case "To Do": parent.state = "Completed"; break
            case "Completed": parent.state = "To Do"; break
            }
        }
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
