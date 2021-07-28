import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 200
    height: 200
    visible: true
    title: qsTr("Hello World")

    ListView {
        id: lv
        property var collapsed: ({})
        anchors.fill: parent
//        anchors.bottomMargin: 20
        model: TasksModel {}
        delegate: TaskDelegate {}
        focus: true
        clip: true
        spacing: 1
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

        section {
            property: "type"
            criteria: ViewSection.FullString // or ViewSection.FirstCharacter
            delegate: SectionDelegate {}
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
                console.log(collapsed, "Expanded")
            }
            else {
                showSection(section)
                console.log(collapsed, "Collapsed")
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
