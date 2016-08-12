function range(min, max) {
  if(min === max) {
    return [min];
  } else if (min > max) {
    return [];
  }

  let arr = range(min, max - 1);
  arr.push(max);

  return arr;
}

// console.log(range(2,6));

function recSum(array) {
  //base case is return of a single number
  if(array.length == 1) {
    return array[0];
  }

  //pull current number, call recursion on the remaining array
  return array[0] + recSum(array.slice(1));
}

// console.log(recSum([1,2,3,4]));

function expRec(base, exp) {
  if(exp === 0) {
    return 1;
  }

  return base * expRec(base, exp - 1);
}

function expRec2(base, exp) {
  if (exp === 0) {
    return 1;
  } else if (exp === 1) {
    return base;
  }

  if (exp % 2 === 0) {
    return expRec2(base, exp / 2) * expRec2(base, exp / 2);
  } else {
    return base * (expRec2(base, (exp - 1) / 2)) * (expRec2(base, (exp - 1) / 2));
  }
}

// console.log(expRec2(2, 3));

function fib(n) {
  if (n === 0) {
    return [];
  } else if (n === 1) {
    return [0];
  } else if (n === 2) {
    return [0, 1];
  }

  let result = fib(n - 1);
  let length = result.length;
  result.push(result[length - 1] + result[length - 2]);

  return result;
}

// console.log(fib(5));

function bSearch(array, target) {
  let half = Math.floor(array.length/2);

  if (array[half] === target) {
    return half;
  } else if ( array.length === 0 ) {
    return undefined;
  }

  let left_half = array.slice(0,half);
  let right_half = array.slice(half + 1, array.length);

  if (array[half] > target) {
    return bSearch(left_half, target);
  } else {
    let result = bSearch(right_half, target);
    if (result === undefined) {
      return undefined;
    } else {
      return result + half + 1;
    }
  }
}

// console.log(bSearch([1, 2, 3], 1));
// console.log(bSearch([2, 3, 4, 5], 3));
// console.log(bSearch([2, 4, 6, 8, 10], 6));
// console.log(bSearch([1, 3, 4, 5, 9], 5));
// console.log(bSearch([1, 2, 3, 4, 5, 6], 6));
// console.log(bSearch([1, 2, 3, 4, 5, 6], 0));
// console.log(bSearch([1, 2, 3, 4, 5, 7], 6));

function makeChange(cost, coinsArray) {
  let bestChange = null;

  if (cost === 0 || cost < coinsArray[coinsArray.length - 1]) {
    return [];
  }

  for (let i = 0; i < coinsArray.length; i++) {
    if (cost < coinsArray[i]) {
      continue;
    }

    let change = [coinsArray[i]];
    let otherChange = makeChange(cost - coinsArray[i], coinsArray);
    let currentChange = change.concat(otherChange);

    if (currentChange.reduce((a, b) => a + b, 0) === cost) {
      if (bestChange === null || currentChange.length < bestChange.length) {
        bestChange = currentChange;
      }
    }
  }

  return bestChange;
}

// console.log(makeChange(21, [10, 9]));

// [1 2 3 4]
// [1 2] [3 4]
Array.prototype.myMergeSort = function(callBack){
  if (this.length <= 1) {
    return this;
  }

  let half = Math.floor(this.length / 2);
  let leftHalf = this.slice(0, half);
  let rightHalf = this.slice(half, this.length);

  let result = callBack(leftHalf.myMergeSort((left, right) => callBack(left, right)), rightHalf.myMergeSort((left, right) => callBack(left, right)));
  return result;
}

function merge(left, right) {
  let merged = [];

  while (left.length != 0 && right.length != 0) {
    if (left[0] <= right[0]) {
      merged.push(left.shift());
    } else {
      merged.push(right.shift());
    }
  }

  return merged.concat(left.concat(right));
}
//
// console.log([9,5,3,13,23,1,7,15].myMergeSort((left, right) => merge(left, right)));

Array.prototype.subSets = function() {
  if (this.length === 0) {
    return [[]];
  }

  let subArray = this.slice(0, -1);
  let subArraySets = subArray.subSets();
  // let firstElement = this[this.length - 1]
  // console.log(subArraySets);
  // subArraySets.forEach(sub => newSubs.push(sub.slice(0)));
  console.log(this[this.length - 1]);
  let newSubs = subArraySets.map(sub => sub.concat(this[this.length - 1]));

  let finalSubs = subArraySets.concat(newSubs);

  return finalSubs;
}

console.log([1].subSets());
