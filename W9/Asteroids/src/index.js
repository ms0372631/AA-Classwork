const MovingObject = require("./moving_object.js");

window.MovingObject = MovingObject;

window.addEventListener('DOMContentLoaded', function (event) {
    console.log('DOM fully loaded and parsed');
    const mo = new MovingObject({
        pos: [30, 30],
        vel: [10, 10],
        radius: 5,
        color: "#00FF00"
    });
    const canvasEl = document.getElementById('game-canvas');
    const ctx2d = canvasEl.getContext('2d');
    mo.draw(ctx2d);
});