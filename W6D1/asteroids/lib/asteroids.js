
console.log('safety');
const CNV_WIDTH = 900;
const CNV_HEIGHT = 700;

document.addEventListener('DOMContentLoaded', function() {
  console.log('safety 2');

  const CNV = document.getElementById('canvas');
  CNV.height = CNV_HEIGHT;
  CNV.width = CNV_WIDTH;

  const Asteroid = require('./asteroid.js');

  const Bullet = require('./bullet.js');

  const GameView = require('./game_view.js');

  const Game = require('./game.js');

  const MovingObject = require('./moving_object.js');

  const Ship = require('./ship.js');

  const Util = require('./util.js');

  console.log('Webpack is working!');

  window.gameView = new GameView(new Game(), CNV);
});
