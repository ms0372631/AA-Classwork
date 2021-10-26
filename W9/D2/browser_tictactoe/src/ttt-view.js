const Board = require("../ttt_node/board");

class View {
  constructor(game, el) {}

  setupBoard() {
    let board = "";
    for (let i = 0; i < 9; i++) {
      board += "<li></li>";
    }
    return board;
  }
  
  
  bindEvents() {}

  handleClick(e) {}

  makeMove(square) {}

}

module.exports = View;
