const Snake = require('./snake.js');

class Board {
  constructor() {
    this.snake = new Snake();
    this.grid = Array.from({length:20}, u => Array(20).fill().map(u => ""));
  }
}
