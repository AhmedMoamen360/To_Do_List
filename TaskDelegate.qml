import QtQuick 2.0

Rectangle {
    readonly property ListView __lv: ListView.view
    property bool expanded: __lv.isSectionExpanded(model.type) // or type directly
    implicitHeight: txt.implicitHeight
    height: expanded ? implicitHeight : 0
    radius: 4
    color: mouse.containsMouse ? "#BBBBBB" : "#435560"
    border {
        color: "black"
        width: 2
    }
    clip: true

    Behavior on height {
        NumberAnimation {duration: 200}
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
//        onClicked: __lv.currentIndex = index // or model.index the same
        hoverEnabled: true
    }

    Text {
        id: txt
        //    width: parent.width
        //    anchors {
        //        left: parent != null ? parent.left : undefined
        //        right: parent != null ? parent.right : undefined
        //    }
        anchors.left: parent.left
        anchors.leftMargin: 5
        text: model.task // or task directly
        font.pixelSize: 20

        //    Component.onCompleted: console.log("Welcome", model.index, model.name)
        //    Component.onDestruction: console.log("Die", model.index, model.name)

    }
}

//        Rectangle {
//            // view is an attached property with ListView to give a pointer
//            // to the root of the delegate
//            color: __lv.currentIndex == index ? "grey" : "yellow"
//            implicitHeight: txt.implicitHeight
//            //            implicitWidth: txt.implicitWidth
//            anchors {
//                left: parent != null ? parent.left : undefined
//                right: parent != null ? parent.right : undefined
//            }

//        }
