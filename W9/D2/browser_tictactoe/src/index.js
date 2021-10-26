const View = require('./ttt-view.js');  // require appropriate file
const Game = require('../ttt_node/game.js');  // require appropriate file

document.addEventListener("DOMContentLoaded", () => {
  // Your code here
  const game = new Game();
  const view = new View();
  let ttt = document.querySelector(".ttt");
  ttt.innerHTML = "<ul></ul>";
  let board = document.querySelector("ul");
  board.style.display = "flex";
  board.style.flexWrap = "wrap";
  board.style.width = "300px";
  board.style.listStyle = "none";
  board.style.border = "5px solid black";
  board.innerHTML = view.setupBoard();
});