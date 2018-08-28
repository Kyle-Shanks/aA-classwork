class View {
  constructor(game, $el) {
    this.game = game;
    this.displayEl = $el;
  }

  bindEvents() {
    this.displayEl.on("click", ".grid-cell", this.makeMove.bind(this));
  }

  makeMove(event) {
    const $cell = $(event.target);

    if ($cell.text() === "") {
      const pos = $cell.data('pos');
      const mark = (this.game.currentPlayer);

      $cell.text(mark);

      if (mark === 'x') {
        $cell.addClass('x');
      } else {
        $cell.addClass('o');
      }

      this.game.playMove(pos);
      $cell.addClass("selected");

      if(this.game.isOver()) {
        const winnerMark = this.game.winner();

        $('.grid-cell').each(function(i) {
          if($(this).text() === winnerMark) {
            $(this).addClass('winner');
          } else {
            $(this).addClass('loser');
          }
        });

        if (winnerMark) {
          $('.ttt').append($(`<h2>You win, ${winnerMark}!</h2>`));
        }else {
          $('.ttt').append($(`<h2>It's a draw!</h2>`));
        }
      }
    }
  }

  setupBoard() {
    const $ul = $('<ul class="grid-list">');

    for (let i = 0; i < 9; i++) {
      const $li = $(`<li class="grid-cell" data-pos="[${Math.floor(i/3)}, ${i%3}]">`);
      $ul.append($li);
    }

    this.displayEl.append($ul);
  }
}

module.exports = View;
