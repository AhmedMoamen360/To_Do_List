import QtQuick 2.0

ListView {
    id: root

    property var collapsed: ({})

    clip: true
    flickableDirection: Flickable.VerticalFlick
    boundsBehavior: Flickable.StopAtBounds
    spacing: 5

    delegate: TaskDelegate {
        id: delegate

        width: root.width
        text: model.task
        type: model.type
        expanded: isSectionExpanded(model.type)
        onEditTaskType: (type, index) => { root.editTaskType(type, index) }
        onEditTask: (task, index) => { root.editTask(task, index) }
    }

    footer: Rectangle {
        width: root.width
        height: 3
        radius: 5
        color: "#37474f"
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

    function editTask(task, index) {
        model.editTask(task, index)
    }

    function editTaskType(type, index) {
        model.editTaskType(type, index)
    }

    function addTask(task) {
        model.addTask(task)
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
