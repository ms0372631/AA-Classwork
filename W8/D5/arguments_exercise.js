
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

Function.prototype.myBind = function (obj) {
    let myself = this;
    return function {
        myself.call(obj, ...args);
    }
}

