// - Clock -
class Clock {
  constructor() {
    const date = new Date();
    this.hour = date.getHours();
    this.minute = date.getMinutes();
    this.second = date.getSeconds();

    this.printTime();
    setInterval( this._tick.bind(this) , 1000);
  }

  printTime(){
    const h = this.hour > 9 ? this.hour : "0"+this.hour;
    const m = this.minute > 9 ? this.minute : "0"+this.minute;
    const s = this.second > 9 ? this.second : "0"+this.second;
    console.log(`${h}:${m}:${s}`);
  }

  _tick() {
    if(++this.second >= 60) {
      this.second = 0;
      this.minute++;
      if(this.minute >= 60) {
        this.minute = 0;
        this.hour++;
        if(this.hour >= 24) { this.hour = 0; }
      }
    }
    this.printTime();
  }
}

// const clock = new Clock();

// - addNumbers -
const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum ,numsLeft, completionCallback) {

  if (numsLeft > 0) {
    reader.question('Please enter a number: ', function(num) {
      sum += parseInt(num);
      console.log(`Current Sum: ${sum}`);
      numsLeft--;
      addNumbers(sum, numsLeft, completionCallback);
    });
  }

  if (numsLeft === 0){
    completionCallback(sum);
    reader.close();
  }
}

// addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));

// - absurdBubbleSort -
function askIfGreaterThan(el1, el2, callback) {
  reader.question(`Is ${el1} greater than ${el2}?: `, function(answer) {
    const output = (answer === 'yes') ? true : false;
    callback(output);
  });
}

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  if(i === arr.length - 1) {
    outerBubbleSortLoop(madeAnySwaps);
  } else {
    askIfGreaterThan(arr[i],arr[i+1],function(isGreater) {
      if(isGreater) {
        madeAnySwaps = true;
        [arr[i],arr[i+1]] = [arr[i+1],arr[i]];
      }
      i++;
      innerBubbleSortLoop(arr,i,madeAnySwaps,outerBubbleSortLoop);
    });
  }
}

function absurdBubbleSort(arr, sortCompletionCallback) {
  function outerBubbleSortLoop(madeAnySwaps) {
    if(madeAnySwaps) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    } else {
      sortCompletionCallback(arr);
    }
  }

  outerBubbleSortLoop(true);
}

// absurdBubbleSort([3, 2, 1], function (arr) {
//   console.log("Sorted array: " + JSON.stringify(arr));
//   reader.close();
// });

// - MyBind Function -
Function.prototype.myBind = function(context) {
  return () => (this.apply(context));
};

// class Lamp {
//   constructor() {
//     this.name = "a lamp";
//   }
// }
//
// const turnOn = function() {
//    console.log("Turning on " + this.name);
// };
//
// const lamp = new Lamp();
//
// turnOn(); // should not work the way we want it to
//
// const boundTurnOn = turnOn.bind(lamp);
// const myBoundTurnOn = turnOn.myBind(lamp);
//
// boundTurnOn(); // should say "Turning on a lamp"
// myBoundTurnOn(); // should say "Turning on a lamp"
