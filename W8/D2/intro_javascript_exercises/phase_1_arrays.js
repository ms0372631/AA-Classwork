Array.prototype.uniq = function() {
    let uniq = [];
    this.forEach((el)=>{
        if (!uniq.includes(el)) {
            uniq.push(el);
        }
    });
    return uniq;
};

console.log([1, 2, 2, 3, 3, 3].uniq());


Array.prototype.twoSum = function () {
    let pairs = [];
    for (let i = 0; i < this.length; i++) {
        for (let j = i + 1; j < this.length; j++) {
            if (this[i] + this[j] == 0)
                pairs.push([i, j]);
        }
    }
    return pairs;
};

console.log([1, -1, 2, 3, 4].twoSum());

Array.prototype.transpose = function () {
    let transpose = [];
    for (let i = 0; i < this.length; i++) {
        for (let j = 0; j < this[0].length; j++) {
            if (!transpose[j])
                transpose.push([]);
            transpose[j].push(this[i][j]);
        }
    }
    return transpose;
};

console.log([[1, 2], [1, 0], [1, 2]].transpose());
console.log([[1, 0]].transpose());