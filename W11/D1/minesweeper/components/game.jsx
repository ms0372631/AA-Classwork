import React from "react";
import * as Minesweeper from "../minesweeper.js";
import Board from "./board.jsx";

export default class Game extends React.Component {
  constructor(props) {
    super(props);
    let b = new Minesweeper.Board(9, 2);
    this.state = {
      board: b,
    };
    this.updateGame = this.updateGame.bind(this);
  }
  updateGame(tile, reveal_bool) {
    if (reveal_bool) {
      tile.explore();
    } else { tile.toggleFlag() }
    
    this.setState({ board: this.state.board })
    console.log('rerendered')
  }
  render() {
    return (
      <Board board={this.state.board} updateGame={this.updateGame} />
    )
  }
}