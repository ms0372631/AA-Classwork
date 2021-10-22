class Clock {
  constructor(hour, minutes, seconds) {
  this.hour = hour
  this.minutes = minutes
  this.seconds = seconds
  }

  printTime() {
    console.log(`${this.hour}:${this.minutes}:${this.seconds}`)
  }

  _tick() {
    if (this.seconds === 60) {
      this.seconds = 0 
      this.minutes += 1
    } 

    if (this.minutes === 60) {
      this.minutes = 0
      this.hour += 1
    }
    
    if (this.hour === 24) {
      this.seconds = 0
      this.minutes = 0
      this.hour = 0
    }
    this.seconds += 1
    this.printTime()
  }
}



// const readline = require('readline');

// const reader = readline.createInterface({
//   input: process.stdin,
//   output: process.stdout
// });

function addNumbers(sum, numsLeft, completionCallback) {
  if (numsLeft > 0) {
    reader.question("Input a number", function (integer) {
      const answer = parseInt(integer);
      sum += answer
      console.log(sum)
    //   numsLeft -= 1
      addNumbers(sum, numsLeft - 1, completionCallback)
    }
    )} else {
      completionCallback(sum)
    }
    
} 

// addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));

// function absurdBubbleSort(arr, sortCompletionCallback) {
//     let sorted = false;
//     while (!sorted) {
//         sorted = true;
//         for (let i = 0; i < arr.length - 1; i++) {
//             askIfGreaterThan(arr[i], arr[i + 1], )
//         }

//     }
// }

// function askIfGreaterThan(el1, el2, callback) {
//     const readline = require('readline');

//     const reader = readline.createInterface({
//         input: process.stdin,
//         output: process.stdout
//     });

//     reader.question(`is ${arr[i + 1]} less than ${arr[i]}`, )

    const readline = require("readline");

    const reader = readline.createInterface({
        input: process.stdin,
        output: process.stdout
    });

    // Write this first.
    function askIfGreaterThan(el1, el2, callback) {
        // Prompt user to tell us whether el1 > el2; pass true back to the // arr[i] = 3 arr[i+1 = 2]
        // callback if true; else false.
        reader.question (`is ${el1} greater than ${el2}?`, function (answer) {
                if (answer === "yes") callback(true);
                else callback(false);
            })

    }

    // Once you're done testing askIfGreaterThan with dummy arguments, write this.
    function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {  //madeAnySwaps === false i = 0
        // Do an "async loop":
        // 1. If (i == arr.length - 1), call outerBubbleSortLoop, letting it
        //    know whether any swap was made.
        // 2. Else, use `askIfGreaterThan` to compare `arr[i]` and `arr[i +
        //    1]`. Swap if necessary. Call `innerBubbleSortLoop` again to
        //    continue the inner loop. You'll want to increment i for the
        //    next call, and possibly switch madeAnySwaps if you did swap.
        if (i === (arr.length - 1)) {  
         return outerBubbleSortLoop(madeAnySwaps);
          
        }
        
        askIfGreaterThan(arr[i], arr[i + 1], function (response) {  // arr[i] = 3 arr[i+1 = 2]
            if (response) {
              let temp = arr[i]
              arr[i] = arr[i + 1]
              arr[i + 1] = temp
                // arr[i], arr[i + 1] = arr[i + 1], arr[i];
                madeAnySwaps = true;
            }
        })
  
        innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop)
    }
    function absurdBubbleSort(arr, sortCompletionCallback) {
        function outerBubbleSortLoop(madeAnySwaps) {
            // Begin an inner loop if you made any swaps. Otherwise, call
            // `sortCompletionCallback`.
            if (madeAnySwaps) innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
            else sortCompletionCallback(arr);
        }
      outerBubbleSortLoop(true);
      
        // Kick the first outer loop off, starting `madeAnySwaps` as true.
    }

    absurdBubbleSort([3, 2, 1], function (arr) {
        console.log("Sorted array: " + JSON.stringify(arr));
        reader.close();
    });
