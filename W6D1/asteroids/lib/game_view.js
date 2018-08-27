function GameView(game, cnv) {
  this.game = game;
  this.ctx = cnv.getContext('2d');
  this.start();
}

GameView.prototype.start = function() {
  const view = this;
  setInterval(function() {
    view.game.moveObjects();
    view.game.draw(view.ctx);
  }, 20);
};

module.exports = GameView;
