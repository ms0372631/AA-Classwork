function range(start, end) {
  // let result = [];
  if (end == start)
    return [end];
  return range(start, end - 1).concat(end);
}

// 0, 4 => 0, 3 => 0, 2 => 0, 1 => 0, 0
// 0, 4 => [0, 1, 2, 3, 4]
console.log(range(0,4));
