function range(start, end) {
  // let result = [];
  if (end == start)
    return [end];
  return range(start, end - 1).concat(end);
}

// 0, 4 => 0, 3 => 0, 2 => 0, 1 => 0, 0
// 0, 4 => [0, 1, 2, 3, 4]
console.log(range(0,4));

function sumRec(arr) {
  if (arr.length == 1)
    return arr[0];
  return arr[arr.length - 1] + sumRec(arr.slice(0, arr.length - 1));
}

console.log(sumRec([0, 1, 2, 4, 5]));

function exponent(base, exp) {
    if (exp == 0)
      return 1;
    return base * exponent(base, exp - 1);
}

console.log(exponent(2, 4));


function fibonacci(n) {
  if (n == 1)
    return [0];
  if (n == 2)
    return [0, 1];
  let result = fibonacci(n - 1);
  return result.concat(result[result.length - 1] + result[result.length - 2]);
}

console.log(fibonacci(6));


function deepDup(arr) {
  let dup = [];
  arr.forEach((ele) => {
    if (!Array.isArray(ele))
      dup.push(ele);
    else
      dup.push(deepDup(ele));
  });
  return dup; 
}

console.log(deepDup([3, [2, 3], [2, 3, 1]]));