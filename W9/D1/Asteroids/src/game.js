const Asteroid = require('./asteroid.js');

function Game(x=200, y=200, num_ast) {
  this.DIM_X = x;
  this.DIM_Y = y;
  this.NUM_ASTEROIDS = num_ast;
  this.asteroids = [];
  this.addAsteroids();
};

Game.prototype.addAsteroids = function() {
  const that = this;
  while (this.asteroids.length < this.NUM_ASTEROIDS) {
    const ast = new Asteroid({ 
      pos: this.randomPosition(),
      game: that
    });
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

Game.prototype.wrap = function (pos) {
  let newPos = [];
  // reset x
  if (pos[0] > this.DIM_X || pos[0] < 0) {
    newPos[0] = 0;
  }
  //reset y
  if (pos[1] > this.DIM_Y || pos[1] < 0) {
    newPos[1] = 0;
  }

  if (newPos[0] !== 0) {
    newPos[0] = pos[0];
  }
  if (newPos[1] !== 0) {
    newPos[1] = pos[1];
  }

  return newPos;
};

module.exports = Game;