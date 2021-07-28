import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 500
    height: 350
    visible: true
    color: "#102027"
    title: qsTr("To Do List")

    MouseArea {
        anchors.fill: parent
        onClicked: {
            field.input_focus = isInsideRect(x, y)
            field.input_text = field.input_text == "" ? "Add a Task" : field.input_text
        }
    }

    function isInsideRect(x, y) {
        return (x >= field.x && x <= field.x + field.width && y >= field.y && y <= field.y + field.height)
    }

    TaskField {
        id: field
        input_focus: false
        input_text: "Add a Task"
        anchors {
            top: lv.bottom
            leftMargin: 5
            rightMargin: 5
            topMargin: 20
            left: parent.left
            right: parent.right
        }
    }

    ListView {
        id: lv
        property var collapsed: ({})
        implicitHeight: parent.height * 0.75
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            leftMargin: 5
            rightMargin: 5
            topMargin: 5
        }
        model: TasksModel {}
        delegate: TaskDelegate {
            anchors {left: parent.left; right: parent.right}
        }
        clip: true
        spacing: 5
        footer: Rectangle {
            anchors {left: parent.left; right: parent.right}
            height: 3
            radius: 5
            color: "#102027"
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
