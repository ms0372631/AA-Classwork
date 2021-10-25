const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");
const Game = require("./game.js");

// window.MovingObject = MovingObject;

window.addEventListener('DOMContentLoaded', function (event) {
    console.log('DOM fully loaded and parsed');
    // const mo = new MovingObject({
    //     pos: [30, 30],
    //     vel: [10, 10],
    //     radius: 5,
    //     color: "#00FF00"
    // });
    // const ast = new Asteroid({ pos: [50, 50] });
    const canvasEl = document.getElementById('game-canvas');
    const ctx2d = canvasEl.getContext('2d');
    const game = new Game(310, 120,5);
    console.log(game);
    game.draw(ctx2d);
    // ast.draw(ctx2d);
});