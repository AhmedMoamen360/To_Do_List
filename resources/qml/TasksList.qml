import QtQuick 2.0

ListView {
    id: root

    property var collapsed: ({})

    function addTask(task) {
        model.addTask(task)
    }

    // private functions

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

    function editTask(task, index) {
        model.editTask(task, index)
    }

    function editType(type, index) {
        model.editType(type, index)
    }

    function deleteTask(index) {
        model.deleteTask(index)
    }

    clip: true
    focus: true
    flickableDirection: Flickable.VerticalFlick
    boundsBehavior: Flickable.StopAtBounds
    spacing: 5

    delegate: TaskDelegate {
        id: delegate

        width: root.width
        text: model.task
        checked: model.type === "Completed"
        expanded: isSectionExpanded(model.type)
        onCheckClicked: root.editType(checked ? "To Do" : "Completed", index)
        onEditTask: (task) => { root.editTask(task, index) }
        onDeleteTask: {
            root.deleteTask(index)
        }
    }

    footer: Rectangle {
        width: root.width
        height: 3
        radius: 5
        color: ToDoStyle.headerColor
    }

    section {
        property: "type"
        criteria: ViewSection.FullString
        delegate: SectionDelegate {
            id: sectionList

            width: root.width
            sectionIsExpanded: root.isSectionExpanded(section)
            text: section
            onToggleSection: (section) => { root.toggleSection(section) }
        }
    }
}
