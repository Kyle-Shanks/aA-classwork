class View {
  constructor(game, $el) {
    this.game = game;
    this.domElement = $el;
    this.selected = null;
  }

  clickTower(event) {
    if (this.selected === null) {
      this.selected = $(event.currentTarget).data('idx');
      $(event.currentTarget).addClass('selected');
    } else {
      if (this.game.isValidMove(this.selected, $(event.currentTarget).data('idx'))) {
        this.game.move(this.selected, $(event.currentTarget).data('idx'));
        this.render();
        if (this.game.isWon()) {
          alert('You Win!');
          $(".towers").off("click");
          $(".tower").addClass("game-over");
        }
      } else {
        alert('Invalide Move!');
      }
      $('.tower').removeClass('selected');
      this.selected = null;
    }
  }

  setupTowers() {
    const towers = $('<ul class="towers">');

    for (var i = 0; i < 3; i++) {
      const tower = $(`<li class="tower" data-idx="${i}">`);
      towers.append(tower);
    }

    this.domElement.append(towers);

    towers.on("click", ".tower", this.clickTower.bind(this));
  }

  render() {
    const towers = this.game.towers;

    for (var i = 0; i < towers.length; i++) {
      const $tower = $('.tower').eq(i);
      $tower.empty();
      towers[i].forEach(disk => {
        const $disk = $(`<div class="disk disk-${disk}">`);
        $tower.append($disk);
      });
    }

  }
}

module.exports = View;
