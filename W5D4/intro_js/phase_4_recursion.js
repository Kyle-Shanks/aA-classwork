function range(start,end) {
  if(start > end) { return false; }
  if(start === end) { return [start]; }
  return [start].concat(range(start+1,end));
}

function recSum(arr) {
  if(arr.length === 0) { return 0; }
  if(arr.length === 1) { return arr[0]; }
  return arr[0] + recSum(arr.slice(1));
}

function exponent(base, exp) {
  if(exp === 0) { return 1; }
  if(exp === 1) { return base; }
  return base * exponent(base, exp-1);
}

function fibonacci(n) {
  if(n <= 2) { return [0,1].slice(0,n); }
  let arr = fibonacci(n-1);
  return arr.concat([arr[arr.length-1] + arr[arr.length-2]]);
}

function deepDup(array) {
  if(!Array.isArray(array)) { return array; }
  let output = [];
  for (var i = 0; i < array.length; i++) {
    output.push( Array.isArray(array[i]) ? deepDup(array[i]) : array[i] );
  }
  return output;
}

function bsearch(array, target) {
  if(!array.includes(target)) { return -1;}

  let mid = Math.floor(array.length/2);
  if (array[mid] === target) { return mid; }

  if (array[mid] > target) {
    return bsearch(array.slice(0, mid), target);
  } else {
    return bsearch(array.slice(mid+1), target) + mid + 1;
  }
}

function mergesort(array) {
  if(array.length <= 1) { return array; }

  let mid = Math.floor(array.length/2);
  let left = array.slice(0, mid);
  let right = array.slice(mid);

  return merge(mergesort(left), mergesort(right));
}


function merge(left, right) {
  if(right.length === 0) {return left;}
  if(left.length === 0) {return right;}

  if (left[0] < right[0]) {
    return [left[0]].concat(merge(left.slice(1),right));
  } else {
    return [right[0]].concat(merge(left,right.slice(1)));
  }
}

function subsets(array) {
  if (array.length === 1) { return [[], array]; }
  let subarrays = subsets(array.slice(1));
  let add = subarrays.map((v) => { return [array[0]].concat(v); });
  return add.concat(subarrays).uniq();
}
