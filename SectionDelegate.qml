import QtQuick 2.0

Component {

    Rectangle {
        color: "orange"
        width: parent.width
        implicitHeight: text.implicitHeight + 5
        Text {
            id: text
            anchors.centerIn: parent
            font.pixelSize: 16
            font.bold: true
            text: section
        }
    }
}
