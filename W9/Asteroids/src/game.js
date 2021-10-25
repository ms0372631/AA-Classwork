const Asteroid = require('./asteroid.js');

function Game(x=200, y=200, num_ast) {
  this.DIM_X = x;
  this.DIM_Y = y;
  this.NUM_ASTEROIDS = num_ast;
  this.asteroids = [];
  this.addAsteroids();
};

Game.prototype.addAsteroids = function() {
  while (this.asteroids.length < this.NUM_ASTEROIDS) {
    const ast = new Asteroid({ pos: this.randomPosition() });
    this.asteroids.push(ast);
  }
};

Game.prototype.randomPosition = function() {
  return [Math.floor(Math.random() * this.DIM_X), Math.floor(Math.random() * this.DIM_Y)];
};

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0,this.DIM_X, this.DIM_Y);
  for (let i=0; i<this.asteroids.length; i++) {
    // console.log(this.asteroids[i]);
    this.asteroids[i].draw(ctx);
  }
};

Game.prototype.moveObjects = function () {
  for (let i = 0; i < this.asteroids.length; i++) {
    this.asteroids[i].move();
  }
};

module.exports = Game;