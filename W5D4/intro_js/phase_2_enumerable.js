Array.prototype.myEach = function(callback) {
  for (var i = 0; i < this.length; i++) {
    callback(this[i]);
  }
};

Array.prototype.myMap = function(callback) {
  let arr = [];
  for (var i = 0; i < this.length; i++) {
    arr.push(callback(this[i]));
  }
  return arr;
};

Array.prototype.reduce = function(callback, iVal) {
  let start = iVal ? 0 : 1;
  let acc = iVal || this[0];

  for (var i = start; i < this.length; i++) {
    acc = callback(acc, this[i]);
  }
  return acc;
};
