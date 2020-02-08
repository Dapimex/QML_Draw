import QtQuick 2.6
import "painter.js" as Painter
import QtQuick.Layouts 1.3

Item {
    id: root
    width: 720; height: 1280;

    property color currentColor: "black"

    LineCanvas {
        id: draw
        anchors.fill: parent
        color: currentColor
        lineWidth: 5
    }

    RowLayout {
        id: switchers
        width: parent.width
        anchors {
            bottom: parent.bottom

        }
        Switch {
            id: black
            Layout.alignment: Qt.AlignCenter
            width: parent.width / 6
            height: width / 2
            color: 'black'
            backgroundColor: 'lightgray'
            dimmedColor: 'gray'
            checked: true
            onClicked: {
                black.checked = true
                red.checked = false
                green.checked = false
                yellow.checked = false
                blue.checked = false
                currentColor = color
            }
        }
        Switch {
            id: red
            Layout.alignment: Qt.AlignCenter
            width: parent.width / 6
            height: width / 2
            color: 'red'
            backgroundColor: 'lightgray'
            dimmedColor: 'gray'
            checked: false
            onClicked: {
                black.checked = false
                red.checked = true
                green.checked = false
                yellow.checked = false
                blue.checked = false
                currentColor = color
            }
        }
        Switch {
            id: green
            Layout.alignment: Qt.AlignCenter
            width: parent.width / 6
            height: width / 2
            color: 'green'
            backgroundColor: 'lightgray'
            dimmedColor: 'gray'
            checked: false
            onClicked: {
                black.checked = false
                red.checked = false
                green.checked = true
                yellow.checked = false
                blue.checked = false
                currentColor = color
            }
        }
        Switch {
            id: yellow
            Layout.alignment: Qt.AlignCenter
            width: parent.width / 6
            height: width / 2
            color: 'yellow'
            backgroundColor: 'lightgray'
            dimmedColor: 'gray'
            checked: false
            onClicked: {
                black.checked = false
                red.checked = false
                green.checked = false
                yellow.checked = true
                blue.checked = false
                currentColor = color
            }
        }
        Switch {
            id: blue
            Layout.alignment: Qt.AlignCenter
            width: parent.width / 6
            height: width / 2
            color: 'blue'
            backgroundColor: 'lightgray'
            dimmedColor: 'gray'
            checked: false
            onClicked: {
                black.checked = false
                red.checked = false
                green.checked = false
                yellow.checked = false
                blue.checked = true
                currentColor = color
            }
        }
    }

    ColumnLayout {
        id: buttons
        anchors {
            right: parent.right
            verticalCenter: parent.verticalCenter
        }

        Button {
            width: root.width / 10
            height: width
            text: qsTr("+")
            textColor: "darkgray"
            textFont {
                pointSize: 48
            }
            color: "lightgray"
            dimmedColor: "gray"
            pressedColor: "white"
            padding: 10
            borderRadius: 4
            enabled: true
            onClicked: {
                draw.lineWidth += 1
            }
        }
        Button {
            width: root.width / 10
            height: width
            text: qsTr("-")
            textColor: "darkgray"
            textFont {
                pointSize: 48
            }
            color: "lightgray"
            dimmedColor: "gray"
            pressedColor: "white"
            padding: 10
            borderRadius: 4
            enabled: true
            onClicked: {
                draw.lineWidth -= 1
            }
        }
        Button {
            width: root.width / 10
            height: width
            text: qsTr("X")
            textColor: "darkgray"
            textFont {
                pointSize: 48
            }
            color: "lightgray"
            dimmedColor: "gray"
            pressedColor: "white"
            padding: 10
            borderRadius: 4
            enabled: true
            onClicked: {
                draw.removeColor(root.currentColor)
            }
        }

    }




}
