const MovingObject = require('./moving_object.js');
const Util = require('./util.js');

Util.inherits(Asteroid, MovingObject);

function Asteroid(options) {
  this.COLOR = 'yellow';
  this.RADIUS = 10;
  console.log(options);
  MovingObject.call(this,{
    pos: options.pos,
    vel: [10,10],
    radius: this.RADIUS,
    color: this.COLOR,
    game: options.game
  });
};

module.exports = Asteroid;