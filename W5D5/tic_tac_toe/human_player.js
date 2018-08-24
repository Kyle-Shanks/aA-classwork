class HumanPlayer {
  constructor(name,mark){
    this.name = name;
    this.mark = mark;
  }

  makeMove(reader, callback){
    reader.question('Make a move!: ', function(move){
      let mark = move.split(",").map(el => parseInt(el));
      callback(mark);
    });
  }
}

module.exports = HumanPlayer;
