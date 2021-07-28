import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 400
    height: 400
    visible: true
    color: "#435560"
    title: qsTr("To Do List")

    ListView {
        id: lv
        property var collapsed: ({})
        anchors.fill: parent
//        anchors.bottomMargin: 20
        model: TasksModel {}
        delegate: TaskDelegate {
            anchors {left: parent.left; right: parent.right}
        }
//        focus: true
//        keyNavigationWraps: true
        clip: true
        spacing: 2
        header: Rectangle {
            anchors {left: parent.left; right: parent.right}
            height: 5
            radius: 2
            color: "lightgray"
        }
        footer: Rectangle {
            anchors {left: parent.left; right: parent.right}
            height: 5
            radius: 2
            color: "lightgray"
        }
//        highlight: Rectangle {
//            anchors {left: parent.left; right: parent.right}
//            //            height: 5
//            color: "lightgray"
//        }

        section {
            property: "type"
            criteria: ViewSection.FullString // or ViewSection.FirstCharacter
            delegate: SectionDelegate {
                anchors {left: parent.left; right: parent.right}
            }
        }

        function isSectionExpanded(section) {
            return !(section in collapsed)
        }

        function showSection(section) {
            delete collapsed[section]
            collapsedChanged()
        }

        function hideSection(section) {
            collapsed[section] = true
            collapsedChanged()
        }

        function toggleSection(section) {
            if(isSectionExpanded(section)) {
                hideSection(section)
            }
            else {
                showSection(section)
            }
        }

        //        Component.onCompleted: console.log(cacheBuffer)
        //        onCurrentIndexChanged: console.log(currentIndex)
        //        cacheBuffer: 200
    }

//    Text {
//        id: label
//        anchors.bottom: parent.bottom
//        anchors.horizontalCenter: parent.horizontalCenter
//        text: "<b>" + lv.currentItem.text + "</b> is current"
//        font.pixelSize: 16
//    }
}
