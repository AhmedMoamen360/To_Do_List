import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 200
    height: 200
    visible: true
    title: qsTr("Hello World")

    ListModel {
        id: nameModel
        ListElement {name: "Alice"}
        ListElement {name: "Bob"}
        ListElement {name: "Jane"}
        ListElement {name: "Victor"}
        ListElement {name: "Wendy"}
        ListElement {name: "Alice"}
        ListElement {name: "Bob"}
        ListElement {name: "Jane"}
        ListElement {name: "Victor"}
        ListElement {name: "Wendy"}
        ListElement {name: "Alice"}
        ListElement {name: "Bob"}
        ListElement {name: "Jane"}
        ListElement {name: "Victor"}
        ListElement {name: "Wendy"}
        ListElement {name: "Alice"}
        ListElement {name: "Bob"}
        ListElement {name: "Jane"}
        ListElement {name: "Victor"}
        ListElement {name: "Wendy"}
    }

    Component {
        id: nameDelegate

        Rectangle {
            readonly property ListView __lv: ListView.view
            // view is an attached property with ListView to give a pointer
            // to the root of the delegate
            color: __lv.currentIndex == index ? "grey" : "yellow"
            implicitHeight: txt.implicitHeight
            //            implicitWidth: txt.implicitWidth
            anchors {
                left: parent != null ? parent.left : undefined
                right: parent != null ? parent.right : undefined
            }

            Text {
                id: txt
                text: model.name // or name directly
                font.pixelSize: 32
                //            Component.onCompleted: console.log("Welcome", model.index, model.name)
                //            Component.onDestruction: console.log("Die", model.index, model.name)

            }
            MouseArea {
                anchors.fill: parent
                onClicked: __lv.currentIndex = index // or model.index the same
            }
        }
    }

    ListView {
        id: lv
        anchors.fill: parent
        model: nameModel
        delegate: nameDelegate
        clip: true
        Component.onCompleted: console.log(cacheBuffer)
        onCurrentIndexChanged: console.log(currentIndex)
        //        cacheBuffer: 200
    }
}
