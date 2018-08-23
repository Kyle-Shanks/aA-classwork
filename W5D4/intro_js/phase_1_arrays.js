Array.prototype.uniq = function() {
  let temp = [];
  this.forEach(function(el) {
    if (!(temp.includes(el)) ) {
      temp.push(el);
    }
  });

  return temp;
};

Array.prototype.twoSum = function() {
  let output = [];
  for (var i = 0; i < this.length; i++) {
    for (var j = i; j < this.length; j++) {
      if (this[i] + this[j] === 0 && i !== j) {
        output.push([i, j]);
      }
    }
  }
  return output;
};

Array.prototype.transpose = function () {
  let output = Array.from({length: this[0].length}, () => []);

  for (var i = 0; i < this[0].length; i++) {
    for (var j = 0; j < this.length; j++) {
      output[i].push(this[j][i]);
    }
  }

  return output;
};
