
Array.prototype.bubble_sort = function() {
    for (let i = 0; i < this.length; i++) {
        for (let j = 0; j < this.length - i - 1; j++) {
            if (this[j] > this[j + 1]) {
                let tmp = this[j];
                this[j] = this[j + 1];
                this[j + 1] = tmp;
            }
        }
    }
    return this;
};

console.log([3, 5, 2, 1, 4].bubble_sort());
console.log([3, 7, 9, 2, 8].bubble_sort());



String.prototype.substrings = function() {
    let substrings = [];
    for (let i = 0; i < this.length; i++) {
        for (let j = i; j < this.length; j++) {
            substrings.push(this.substring(i, j + 1));
        }
    }
    return substrings
}

console.log("bubblesort".substrings());