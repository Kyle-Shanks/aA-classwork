// const Snake = require('./snake.js');

class View {
  constructor() {
    this.snake = new Snake();
  }

  render() {
    this.snake.move();
    $('.board').empty();

    this.snake.segments.forEach((pos) => {
      const $square = $(`<div class="segment" style="top: ${20*pos[0]}px; left: ${20*pos[1]}px;">`);
      $(".board").append($square);
    });
  }
}

const view = new View();
$(() => {

  view.render();
  setInterval(view.render.bind(view), 1000);

});
