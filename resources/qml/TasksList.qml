import QtQuick 2.0

ListView {
    id: root

    function addTask(task)
    {
        model.addTask(task)
    }

    property var collapsed: ({})

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

    clip: true
    flickableDirection: Flickable.VerticalFlick
    boundsBehavior: Flickable.StopAtBounds
    spacing: 5

    delegate: TaskDelegate {
        width: root.width
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
            anchors {left: parent.left; right: parent.right}
            sectionIsExpanded: root.isSectionExpanded(section)
            text: section
            onToggleSection: (section) => { root.toggleSection(section) }
        }
    }
}