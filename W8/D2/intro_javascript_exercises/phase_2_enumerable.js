// const myCallBack = (el) => {
// };

// function callBackExample(arr, callback) {
//   arr.forEach(callback);
// }

Array.prototype.myEach = function(callback) {
  for(let i = 0; i < this.length; i++) {
    callback(this[i]);
    
  }
  // this.forEach(callback);
}

const callback1 = (num) => {
  console.log(num);
}
// [1,2,3].myEach(callback);

Array.prototype.myMap = function(callback) {
  let result = [];
  for(let i = 0; i < this.length; i++) {
    result.push(callback(this[i]));
  }
  return result;
}

const callback2 = (num) => {
  return num * 2;
}

// console.log([1,2,3].myMap(callback2));

Array.prototype.myReduce = function(callback, initial) {
  let sum = initial || this[0];
  let i = initial ? 0 : 1;
  for(; i < this.length; i++) {
    // sum += this[i];
    sum = callback(sum, this[i]);
  }
  return sum;
}

const callback3 = (acc, el) => {
  return acc + el;
}

console.log([1,2,3].myReduce(callback3));
console.log([1,2,3].myReduce(callback3, 4));
