import QtQuick 2.0

Component {

    Text {
        id: txt
        readonly property ListView __lv: ListView.view
        width: parent.width
        text: model.name // or name directly
        font.pixelSize: 32
        //            Component.onCompleted: console.log("Welcome", model.index, model.name)
        //            Component.onDestruction: console.log("Die", model.index, model.name)

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
}
