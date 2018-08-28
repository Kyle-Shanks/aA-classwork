const DIRS = ['n', 'e', 's', 'w'];

class Snake {

  constructor() {
    this.segments = [[10,10]];
    this.length = 2;
    this.currentDir = DIRS[0];
  }

  move() {
    const head = this.segments[0];
    switch (this.currentDir) {
      case 'n':
        this.segments.unshift( [head[0] - 1, head[1]] );
        break;
      case 's':
        this.segments.unshift( [head[0] + 1, head[1]] );
        break;
      case 'e':
        this.segments.unshift( [head[0], head[1] + 1] );
        break;
      case 'w':
        this.segments.unshift( [head[0], head[1] - 1] );
        break;
    }

    this.collisionCheck();

    if(this.segments.length > this.length) {
      this.segments.pop();
    }
  }

  turn(newDir) {
    this.currentDir = newDir;
  }

  collisionCheck() {}
}
