Function.prototype.inherits = function (SuperClass) {
  let func = this;
  const Surrogate = function(){};
  Surrogate.prototype = SuperClass.prototype;
  func.prototype = new Surrogate();
  func.prototype.constructor = func;
}

function MovingObject (name, speed, mass) {
  this.name = name
  this.speed = speed;
  this.mass = mass;
}

MovingObject.prototype.moves = function () {
  console.log(`${this.name} is moving`);
}


function Ship (name, speed, mass, color) {
  MovingObject.call(this, name, speed, mass);
  this.color = color;
}
Ship.inherits(MovingObject);

Ship.prototype.floats = function () {
  console.log(`${this.name} is floating`);
}

function Asteroid () {
  
}
Asteroid.inherits(MovingObject);



// class MovingObject {
//   constructor(name, speed, mass) {
//     this.name = name
//     this.speed = speed;
//     this.mass = mass;
//   }
//   moves() {
//     console.log(`${this.name} is moving`)
//   }
// }

// class Ship extends MovingObject {
//   constructor(name, speed, mass, color) {
//     super(name, speed, mass);
//     this.color = color;
//   }
//   float() {
//     console.log(`${this.name} is floating`);
//   }
// }


// class Asteroid extends MovingObject {
//   constructor(name, speed, mass, radius) {
//     super(name, speed, mass);
//     this.radius = radius;
//   }
//   falls() {
//     console.log(`${this.name} is falling`)
//   }
// }


// MovingObject.prototype.inherits(Asteroid, Ship)
