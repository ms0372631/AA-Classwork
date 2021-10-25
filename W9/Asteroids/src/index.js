const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");
const Game = require("./game.js");
const GameView = require("./game_view.js");

// window.MovingObject = MovingObject;

window.addEventListener('DOMContentLoaded', function (event) {
    console.log('DOM fully loaded and parsed');
    const canvasEl = document.getElementById('game-canvas');
    const ctx2d = canvasEl.getContext('2d');
    const game = new Game(300, 150,5);
    const game_view = new GameView(game, ctx2d);
    console.log(game_view);
    game_view.start();
});