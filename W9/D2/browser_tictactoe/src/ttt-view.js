const Board = require("../ttt_node/board");

class View {
  constructor(game, el) {
    this.game = game;
    this.el = el;
    this.setupBoard();
  }

  setupBoard() {
    let board = "<ul>";
    for (let i = 0; i < 9; i++) {
      board += `<li id='${Math.floor(i / 3)}+${i % 3}'></li>`;
    }
    board + "</ul>";
    this.el.innerHTML = board;
    this.bindEvents();
  }
  
  
  bindEvents() {
    const list = this.el.children[0];
    for (let i = 0; i < list.length; i++) {
      const listItem = list[i];
      listItem.addEventListener("click", this.handleClick);
    }
  }

  handleClick(e) {
    let item = e.target;
    let pos = item.id;
    pos = pos.split("+");
    pos.map(elem => Number(elem));
    item.classList.toggle(this.game.currentPlayer)
    console.log("clicked")
    this.game.playMove(pos);
  }

  makeMove(square) {}

}

module.exports = View;
