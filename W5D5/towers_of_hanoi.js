const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


class Game {
  constructor() {
    this.towers = [[3,2,1],[],[]];
  }

  promptMove(completionCallback) {
    this.render();
    const game = this;

    reader.question('Make a move son! : ', function(move) {
      let coord = move.split(",").map((el) => (parseInt(el)));
      if (game.validMove(coord)){
        game.move(coord);
        game.run(completionCallback);
      } else {
        console.log('Thats not a valid move son');
        game.promptMove();
      }
    });
  }

  validMove(coord) {
    const t1 = this.towers[coord[0]];
    const t2 = this.towers[coord[1]];

    if(coord[0] > 2 || coord[1] > 2) { return false; }
    if(coord[0] < 0 || coord[1] < 0) { return false; }
    if(t1.length === 0) { return false; }
    if(t1[t1.length - 1] > t2[t2.length - 1]) { return false; }

    return true;
  }

  move(coord) {
    this.towers[coord[1]].push( this.towers[coord[0]].pop() );
  }

  isWon() {
    return ((this.towers[1].length === 3) || (this.towers[2].length === 3));
  }

  render() {
    let sizeArr = [];

    for (var i = 0; i < 5; i++) {
      switch(i) {
        case 0: sizeArr.push("     ||     "); break;
        case 1: sizeArr.push("    ****    "); break;
        case 2: sizeArr.push("   ******   "); break;
        case 3: sizeArr.push("  ********  "); break;
        case 4: sizeArr.push(" ========== "); break;
      }
    }

    let output = [];
    output.push(sizeArr[0]+sizeArr[0]+sizeArr[0]);
    for (let i = 2; i > -1; i--) {
      output.push( sizeArr[this.towers[0][i] || 0] +
                   sizeArr[this.towers[1][i] || 0] +
                   sizeArr[this.towers[2][i] || 0] );
    }
    output.push(sizeArr[4]+sizeArr[4]+sizeArr[4]);

    output.forEach((line) => console.log(line));
  }

  run(completionCallback) {
    if (this.isWon()) {
      console.log('Congrats you win!');
      this.render();
      completionCallback();
    } else {
      this.promptMove(completionCallback);
    }
  }
}

const g = new Game();
g.run(function() { reader.close(); });
