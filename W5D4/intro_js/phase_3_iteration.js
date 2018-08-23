Array.bubbleSort = function(array) {
  let output = array.slice();
  let switchOccured = true;

  while (switchOccured) {
    switchOccured = false;

    for (var i = 1; i < output.length; i++) {
      if (output[i] < output[i-1]) {
        [output[i], output[i-1]] = [output[i-1], output[i]];
        switchOccured = true;
      }
    }
  }

  return output;
};

String.substrings = function(string) {
  let output = [];

  for (var i = 0; i < string.length + 1; i++) {
    for (var j = i; j < string.length + 1; j++) {
      output.push(string.slice(i, j));
    }
  }

  return output.uniq();
};
