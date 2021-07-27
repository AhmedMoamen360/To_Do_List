import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 200
    height: 200
    visible: true
    title: qsTr("Hello World")

    ListModel {
        id: nameModel
        ListElement {name: "Alice"; team: "Crypto"}
        ListElement {name: "Bob"; team: "Crypto"}
        ListElement {name: "Jane"; team: "QA"}
        ListElement {name: "Victor"; team: "QA"}
        ListElement {name: "Wendy"; team: "Graphics"}
    }

    ListView {
        id: lv
        anchors.fill: parent
        anchors.bottomMargin: 20
        model: nameModel
        delegate: TaskDelegate {}
        focus: true
        clip: true
        keyNavigationWraps: true
        header: Rectangle {
            anchors {left: parent.left; right: parent.right}
            height: 10
            color: "yellow"
        }
        footer: Rectangle {
            anchors {left: parent.left; right: parent.right}
            height: 10
            color: "red"
        }
        highlight: Rectangle {
            anchors {left: parent.left; right: parent.right}
            //            height: 10
            color: "lightgray"
        }

        section.property: "team"
        section.criteria: ViewSection.FullString // or ViewSection.FirstCharacter

        section.delegate: SectionDelegate {}

        //        Component.onCompleted: console.log(cacheBuffer)
        //        onCurrentIndexChanged: console.log(currentIndex)
        //        cacheBuffer: 200
    }

    Text {
        id: label
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        text: "<b>" + lv.currentItem.text + "</b> is current"
        font.pixelSize: 16
    }
}
