import QtQuick 2.0

Text {
    //    id: txt
    readonly property ListView __lv: ListView.view
    property bool expanded: __lv.isSectionExpanded(model.type) // or type directly
    width: parent.width
//    anchors {
//        left: parent != null ? parent.left : undefined
//        right: parent != null ? parent.right : undefined
//    }
    height: expanded ? implicitHeight : 0
    text: model.task // or task directly
    font.pixelSize: 32
    clip: true

    //            Component.onCompleted: console.log("Welcome", model.index, model.name)
    //            Component.onDestruction: console.log("Die", model.index, model.name)

    Behavior on height {
        NumberAnimation {duration: 200}
    }

    MouseArea {
        anchors.fill: parent
        onClicked: __lv.currentIndex = index // or model.index the same
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
