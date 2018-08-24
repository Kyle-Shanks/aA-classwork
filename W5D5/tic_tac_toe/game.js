const Board = require('./board.js');
const HumanPlayer = require('./human_player.js');

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


class Game{

  constructor(board = new Board(), p1 = new HumanPlayer('A','X'), p2 = new HumanPlayer('B','O')){
    this.board = board;
    this.p1 = p1;
    this.p2 = p2;
    this.currentPlayer = this.p1;
  }

  won() {
    return this.board.won();
  }

  render() {
    this.board.render();
  }

  switchPlayer() {
    this.currentPlayer = this.currentPlayer === this.p1 ? this.p2 : this.p1;
  }

  play(completionCallback) {

    if (this.won()){
      console.log('Congrats you won!');
      this.render();
      completionCallback(this.board.winner());
    } else {
      const game = this;
      this.render();
      this.currentPlayer.makeMove(reader, function(pos) {
        if(game.board.validMove(pos)) {
          game.board.placeMark(pos, game.currentPlayer.mark);
          game.switchPlayer();
        } else {
          console.log('Not a valid move');
        }
        game.play(completionCallback);
      });
    }

  }
}

const g = new Game();
g.play(function(winner) {
  console.log(`The winner is ${winner}`);
  reader.close();
});
