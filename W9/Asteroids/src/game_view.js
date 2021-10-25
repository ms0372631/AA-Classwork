const Game = require("./game");

function GameView(game, ctx) {
    this.game = game;
    this.ctx = ctx;
};


GameView.prototype.start = function() {
    let gv = this;
    setInterval(function() {
        gv.game.moveObjects();
        gv.game.draw(gv.ctx);
    }, 500);
};

module.exports = GameView;

