
function sum(...args) {
    let sum = 0;
    args.forEach(ele => sum += ele);
    return sum;
}

function sum() {
    args = Array.from(arguments)
    let sum = 0;
    args.forEach(ele => sum += ele);
    return sum;
}

console.log(sum(1, 2, 4));

Function.prototype.myBind = function (ctx, ...bindArgs) {
    let func = this;
    return function (...callArgs) {
        let allArgs = bindArgs.concat(callArgs);
        return func.apply(ctx, allArgs)
        // myself.call(obj, ...args);
    }
}

function curriedSum(numArgs) {
  let numbers = [];
  return function _curriedSum(num) {
    numbers.push(num);
    if (numbers.length === numArgs) {
      let sum = 0;
      numbers.forEach(ele => sum += ele);
      return sum;
    } else {   
      return _curriedSum;
    }
  };
};

const apples = curriedSum(4);
apples(5)(30)(20)(1); // => 56
