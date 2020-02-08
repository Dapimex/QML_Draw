function paintLines(ctx, lines) {
    for (var iLine = 0; iLine < lines.length; ++iLine) {
        var line = lines[iLine];
        if (line.width !== undefined)
            ctx.lineWidth = line.width;
        if (line.path !== undefined)
            ctx.path = line.path;
        if (line.fill !== undefined) {
            ctx.fillStyle = line.fill;
            ctx.fill();
        }
        if (line.stroke !== undefined) {
            ctx.strokeStyle = line.stroke;
            ctx.stroke();
        }
    }
}
