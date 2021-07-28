import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 400
    height: 400
    visible: true
    color: "#37474f"
    title: qsTr("To Do List")

    ListView {
        id: lv
        property var collapsed: ({})
        anchors.fill: parent
        model: TasksModel {}
        delegate: TaskDelegate {
            anchors {left: parent.left; right: parent.right}
        }
        clip: true
        spacing: 2
        header: Rectangle {
            anchors {left: parent.left; right: parent.right}
            height: 2
            radius: 2
            color: "#62727b"
        }
        footer: Rectangle {
            anchors {left: parent.left; right: parent.right}
            height: 2
            radius: 2
            color: "black"
        }

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
    }
}
