const View = require('./ttt-view.js');  // require appropriate file
const Game = require('../ttt_node/game.js');  // require appropriate file

document.addEventListener("DOMContentLoaded", () => {
  // Your code here
  const game = new Game();
  let ttt = document.querySelector(".ttt");
  // let ttt = document.getElementsByClassName(".ttt")
  const view = new View(game, ttt);
  // let x = ttt.children[0];
  // for (let i = 0; i < x.children.length; i++) {
  //   let listItem = x.children[i];
  //   console.log(listItem)
  // }

  console.log(game.currentPlayer);
});