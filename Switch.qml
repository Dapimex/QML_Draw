import QtQuick 2.6

Item {

    id: root

    property bool checked: false
    property bool enabled: true
    property alias color: runner.color
    property color backgroundColor
    property color dimmedColor
    property alias borderRadius: background.radius

    signal clicked()

    function triggered() {
        checked = !checked;
    }

    height: width / 2
    borderRadius: height / 2

    Rectangle {
        id: background
        anchors.fill: root
        color: root.enabled ? backgroundColor : dimmedColor
    }

    Rectangle {

        id: runner

        width: root.width / 2
        height: root.height
        radius: background.radius

        Behavior on x {
            SpringAnimation {
                spring: 2; damping: 0.2
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            triggered()
            root.clicked()
        }
    }

    state: checked ? "on" : "off"
    states: [
        State {
            name: 'off'
            PropertyChanges {
                target: runner
                x: 0
            }
        },

        State {
            name: "on"
            PropertyChanges {
                target: runner
                x: root.width - runner.width

            }
        }
    ]
    transitions: [
        Transition {
            reversible: true
        }
    ]
}
