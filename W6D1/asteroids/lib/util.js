const Util = {
  distance: function (pos1, pos2) {
    const [x1, x2, y1, y2] = [pos1[0], pos2[0], pos1[1], pos2[1]];

    return Math.sqrt(Math.pow((x1 - x2), 2) + Math.pow((y1 - y2), 2));
  },

  inherits: function (Child, Parent) {
    function Surrogate() {}
    Surrogate.prototype = Parent.prototype;
    Child.prototype = new Surrogate();
    Child.prototype.constructor = Child;
  },

  randomVec: function (length) {
    const deg = 2 * Math.PI * Math.random();
    return Util.scale([Math.sin(deg), Math.cos(deg)], length);
  },

  scale: function (vec, m) {
    return [vec[0] * m, vec[1] * m];
  }
};

module.exports = Util;
