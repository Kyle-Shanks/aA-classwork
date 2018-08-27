// sum
function sum1() {
  let total = 0;

  for (var i = 0; i < arguments.length; i++) {
    total += arguments[i];
  }

  return total;
}

function sum2(...args) {
  return args.reduce((acc,num) => acc+num);
}

// myBind
Function.prototype.myBind1 = function(ctx) {
  // const bindArgs = arguments.slice(1);
  // const bindArgs = Array.prototype.slice.call(arguments, 1);
  const bindArgs = [].slice.call(arguments,1);
  return () => this.apply(ctx, bindArgs.concat(arguments));
};

Function.prototype.myBind2 = function(ctx, ...bindArgs) {
  return (...funcArgs) => this.apply(ctx, bindArgs.concat(funcArgs));
};

// curriedSum
function curriedSum(numArgs) {
  const nums = [];
  return function _curriedSum(num) {
    nums.push(num);
    if (nums.length >= numArgs) {
      return nums.reduce((acc, num) => acc + num);
    } else {
      return _curriedSum;
    }
  };
}

Function.prototype.curry = function (numArgs) {
  const args = [];
  const that = this;

  return function _curriedFunction(arg) {
    args.push(arg);

    if (args.length === numArgs) {
      return that(...args);
    } else {
      return _curriedFunction;
    }
  };
};

Function.prototype.curry2 = function(numArgs) {
  const args = [];
  const that = this;

  return function _curriedFunction(arg) {
    args.push(arg);

    if (args.length === numArgs) {
      // return that.apply(that, args);
      return that.apply(null, args);
    } else {
      return _curriedFunction;
    }
  };
};
