const Asteroid = require('./asteroid.js');

const DIM_X = 950;
const DIM_Y = 750;
const NUM_ASTEROIDS = 12;

function Game() {
  this.asteroids = [];
  this.addAsteroids();
}

Game.prototype.randomPosition = function () {
  return [Math.random() * DIM_X, Math.random() * DIM_Y];
};

Game.prototype.addAsteroids = function () {
  for (var i = 0; i < NUM_ASTEROIDS; i++) {
    this.asteroids.push(new Asteroid(this.randomPosition(), this));
  }
};

Game.prototype.draw = function (ctx) {
  ctx.clearRect(0, 0, DIM_X, DIM_Y);
  this.asteroids.forEach((asteroid) => asteroid.draw(ctx));
};

Game.prototype.wrap = function(pos) {
  let x = pos[0];
  let y = pos[1];

  if(x < -50) {
    x = DIM_X;
  } else if (x > DIM_X) {
    x = -50;
  }

  if(y < -50) {
    y = DIM_Y;
  } else if (y > DIM_Y) {
    y = -50;
  }
  return [x,y];
};

Game.prototype.moveObjects = function () {
  this.asteroids.forEach((asteroid) => asteroid.move());
  // this.checkCollisions();
};

Game.prototype.checkCollisions = function () {
  for (var i = 0; i < this.asteroids.length - 1; i++) {
    for (var j = i + 1; j < this.asteroids.length; j++) {
      let asteroid1 = this.asteroids[i];
      let asteroid2 = this.asteroids[j];

      if (asteroid1.isCollidedWith(asteroid2)) {
        console.log("COLLISION!");
        this.asteroids.splice(j,1);
        this.asteroids.splice(i,1);
      }
    }
  }
};

module.exports = Game;
