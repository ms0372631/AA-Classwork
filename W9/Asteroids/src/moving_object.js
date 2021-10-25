function MovingObject(options) {
    this.pos = options.pos;
    this.vel = options.vel;
    this.radius = options.radius;
    this.color = options.color;
};

MovingObject.prototype.draw = function (ctx) {
  const canvasEl = document.getElementById('game-canvas');
  canvasEl.width = 500;
  canvasEl.height = 500;
  const ctx2d = canvasEl.getContext('2d');
  ctx2d.fillStyle = 'red';
  ctx2d.fillRect= (0,0,500,500);

  ctx.beginPath();
  ctx.arc(100, 100, 20, 0, 2 * Math.PI, true);
  ctx.strokeStyle = "green";
  ctx.lineWidth = 5;
  ctx.stroke();
  ctx.fillStyle = "blue";
  ctx.fill();
};

MovingObject.prototype.move = function() {
  this.pos = [this.pos[0] + this.vel[0], this.pos[1] + this.vel[1]];
};

// const mo = new MovingObject({
//   pos: [30, 30],
//   vel: [10, 10],
//   radius: 5,
//   color: "#00FF00"
// });
module.exports = MovingObject;

