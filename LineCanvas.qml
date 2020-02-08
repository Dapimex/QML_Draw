import QtQuick 2.6

Item {
    id: root
    anchors.fill: parent

    property color color
    property real lineWidth

    property var lines: []
    property var ctx
    property var point

    function addLine(color, width, points) {
        var line = {
            "color": Qt.rgba(color.r, color.g, color.b, color.a),
            "width": width,
            "points": points
            }
        lines.push(line)
        drawLine(line)
    }

    function drawLine(line) {
        var ctx = canvas.getContext("2d")

        ctx.strokeStyle = line.color
        ctx.lineCap = "round"
        ctx.lineWidth = line.width
        ctx.beginPath()
        ctx.moveTo(line.points[0].x, line.points[0].y)
        ctx.lineTo(line.points[1].x, line.points[1].y)
        ctx.stroke()

        canvas.requestPaint()
    }

    function removeColor(color) {
        lines = lines.filter(function (line) {
            return !Qt.colorEqual(line.color, color)
        })
        canvas.clear()
        canvas.requestPaint()
    }

    Canvas {
        id: canvas
        anchors.fill: parent

        function clear() {
            var ctx = canvas.getContext("2d")
            ctx.reset()
            for (var line of root.lines) {
                drawLine(line)
            }
            canvas.requestPaint()
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onPressed: {
            root.point = {"x": mouseX, "y": mouseY}
        }
        onPositionChanged: {
            addLine(color, lineWidth, [root.point, {"x": mouseX, "y": mouseY}])
            root.point = {"x": mouseX, "y": mouseY}
        }
    }
}
