const Util = require('./util.js');
const MovingObject = require('./moving_object.js');

const COLOR = '#ccc';
const RADIUS = 40;
const LENGTH = 2.2;

function Asteroid(pos, game) {
  MovingObject.call(this, {
    pos: pos,
    vel: Util.randomVec((Math.random() * LENGTH)+0.3),
    color: COLOR,
    radius: RADIUS,
    game: game
  });
}

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;
