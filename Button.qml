import QtQuick 2.6

Item {

    id: root

    property alias text: innerText.text
    property alias textFont: innerText.font
    property alias textColor: innerText.color
    property color dimmedColor
    property color pressedColor
    property color color
    property int padding
    property alias borderRadius: button.radius
    property bool isPressed
    property bool enable

    signal clicked()
    signal pressed()
    signal released()
    signal pressAndHold()


    width: innerText.contentWidth + 2*padding
    height: innerText.contentHeight + 2*padding

    Rectangle {
        id: button
        anchors.fill: parent
        color: enable ? (isPressed ? root.pressedColor : root.color) : root.dimmedColor

        Behavior on color {

            ColorAnimation {
                duration: 200
            }
        }

        MouseArea {

            id: mouseArea
            anchors.fill: parent

            onClicked: root.clicked()
            onPressed: {
                root.pressed()
                root.isPressed = true
            }
            onPressAndHold: root.pressAndHold()
            onReleased: {
                root.released()
                root.isPressed = false
            }

        }

        Text {
            id: innerText
            anchors.centerIn: parent
        }
    }
}
