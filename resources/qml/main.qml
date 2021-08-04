import QtQuick 2.12
import QtQuick.Window 2.12
import SortedTasks 1.0

Window {
    width: 500
    height: 350
    visible: true
    color: "#1A1B1C"
    title: qsTr("To Do List")

    MouseArea {
        anchors.fill: parent
        onClicked: {
            field.input_focus = false
            field.input_text = field.input_text == "" ? "Add a Task" : field.input_text
            resetFocus(-1)
        }
    }

    Component.onCompleted: {
        field.addTask.connect(updateModel)
        for(let i = 0; i < lv.model.rowCount(); i++) {
            lv.itemAtIndex(i).mouseClicked.connect(resetFocus)
            console.log(lv.itemAtIndex(i))
        }
    }

    function updateModel(task) {
        lv.model.addTask(task)
    }

    function resetFocus(index) {
        for(let i = 0; i < lv.model.count; i++) {
            if(i != index) {
                lv.itemAtIndex(i).task_focus = false
            }
        }
    }

    TaskField {
        id: field
        input_focus: false
        input_text: "Add a Task"
        anchors {
            bottom: parent.bottom
            leftMargin: 5
            rightMargin: 5
            bottomMargin: 20
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
        model: SortedTasks {}
        delegate: TaskDelegate {
            anchors {left: parent.left; right: parent.right}
            task_focus: false
        }
        clip: true
        focus: true
        flickableDirection: Flickable.VerticalFlick
        boundsBehavior: Flickable.StopAtBounds
        spacing: 5
        footer: Rectangle {
            anchors {left: parent.left; right: parent.right}
            height: 3
            radius: 5
            color: "#37474f"
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
