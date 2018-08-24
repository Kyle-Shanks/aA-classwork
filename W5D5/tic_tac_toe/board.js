class Board {
  constructor(){
    this.board = Array.from( {length: 3}, u => ['','',''] );
  }

  won() {
    // Horizontal Checks
    for (var i = 0; i < this.board.length; i++) {
      if(this.board[i].every((mark) => mark === 'X')) { return 'X'; }
      if(this.board[i].every((mark) => mark === 'O')) { return 'O'; }
    }

    // Vertical Checks
    for (let i = 0; i < 3; i++) {
      if(this.board.every((r) => r[i] === 'X')) { return 'X'; }
      if(this.board.every((r) => r[i] === 'O')) { return 'O'; }
    }

    // Diagonal Checks
    if(this.board[0][0] === 'X' && this.board[1][1] === 'X' && this.board[2][2] === 'X') { return 'X'; }
    if(this.board[0][0] === 'O' && this.board[1][1] === 'O' && this.board[2][2] === 'O') { return 'O'; }
    if(this.board[0][2] === 'X' && this.board[1][1] === 'X' && this.board[2][0] === 'X') { return 'X'; }
    if(this.board[0][2] === 'O' && this.board[1][1] === 'O' && this.board[2][0] === 'O') { return 'O'; }

    return false;
  }

  winner() {
    return this.won();
  }

  empty(pos) {
    let [x,y] = [pos[0], pos[1]];
    return !this.board[x][y];
  }

  placeMark(pos, mark) {
    if (this.empty(pos)){
      let [x,y] = [pos[0], pos[1]];
      this.board[x][y] = mark;
    }
  }

  validMove(pos){
    let [x,y] = [pos[0],pos[1]];
    if (x > 2 || y > 2 || x < 0 || y < 0){
      return false;
    } else {
      return this.empty(pos);
    }
  }

  render(){
    let boardArr = [];

    for (var i = 0; i < this.board.length; i++) {
      let row = this.board[i];
      boardArr.push(` ${row[0]||" "} | ${row[1]||" "} | ${row[2]||" "} `);
      if(i < 2) { boardArr.push("___ ___ ___"); }
    }

    boardArr.forEach(line => console.log(line));
    console.log('');
  }
}

module.exports = Board;
