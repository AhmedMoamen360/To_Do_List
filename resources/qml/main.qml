import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: root

    minimumWidth: 350
    minimumHeight: 350
    visible: true
    color: ToDoStyle.backgroundColor
    title: "To Do List"

    TasksList {
        id: tasksList

        model: sortedTasks
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            bottom: textField.top
            margins: 5
        }
    }

    TaskField {
        id: textField

        anchors {
            bottom: parent.bottom
            leftMargin: 5
            rightMargin: 5
            bottomMargin: 20
            left: parent.left
            right: parent.right
        }
        onAddTask: (task) => { tasksList.addTask(task) }
    }
}
