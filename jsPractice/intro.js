Array.prototype.myUniq = function() {
  let curr_arr = this;
  let uniq_arr = [];

  for(let i = 0; i < curr_arr.length; i++) {
    if(!uniq_arr.includes(curr_arr[i])) {
      uniq_arr.push(curr_arr[i]);
    }
  }
  return uniq_arr;
};

// console.log([1, 2, 1, 3, 3].myUniq());

Array.prototype.twoSum = function() {
  let result = [];

  for(let i = 0; i < this.length; i++) {
    for(let j = i + 1; j < this.length; j++) {
      if(this[i] + this[j] === 0) {
        result.push([i,j]);
      }
    }
  }

  return result;
};

// console.log([-1, 0, 2, -2, 1].twoSum());

Array.prototype.myTranspose = function() {
  let result = [];

  for(let i = 0; i < this[0].length; i++) {
    result.push([]);
  }

  for(let i = 0; i < this.length; i++) {
    for(let j = 0; j < this[0].length; j++) {
      result[j].push(this[i][j]);
    }
  }

  return result;
};

// console.log([
//     [0, 1, 2],
//     [3, 4, 5],
//     [6, 7, 8]
//   ].myTranspose());

Array.prototype.myEach = function(callBack) {
  for(let i = 0; i < this.length; i++) {
    callBack(this[i]);
  }

  return this;
};

function print(el) {
  console.log(el);
}

// [1, 2, 3].myEach(el => print(el));

Array.prototype.myMap = function(callBack) {
  let result = [];

  this.myEach(el => result.push(callBack(el)));

  return result;
};

let arr = [1,2,3,4];

function timesTwo(el) {
  return el * 2;
}

// console.log(arr.myMap(el => timesTwo(el)));

Array.prototype.myInject = function(callBack) {
  result = this[0];

  this.slice(1).myEach(el => result = callBack(result, el));

  return result;
};

function multiply(numOne, numTwo) {
  return numOne * numTwo;
}

// console.log(arr.myInject((numOne, numTwo) => multiply(numOne, numTwo)));
Array.prototype.myBubbleSort = function() {
  let unsorted = true;

  while (unsorted) {
    unsorted = false;

    for (let i = 0; i < this.length - 1; i++) {
      if (this[i] > this[i + 1]) {
        let temp = this[i];
        this[i] = this[i + 1];
        this[i + 1] = temp;
        unsorted = true;
      }
    }
  }

  return this;
};

// console.log([5,4,7,3,1].myBubbleSort());
String.prototype.mySubstrings = function() {
  let substrings = [];

  for (let i = 0; i < this.length; i++) {
    for (let j = i + 1; j <= this.length; j++) {
      substrings.push(this.slice(i, j));
    }
  }

  return substrings;
}

// console.log("cat".mySubstrings());
