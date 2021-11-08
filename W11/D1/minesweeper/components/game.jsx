import React from "react";
import Board from "./board";

export default class Game extends React.Component {
  constructor(props) {
    super(props);
    let b = new Board();
    this.state = {
      board: b,

    };
    this.updateGame = this.updateGame.bind(this);
  }
  updateGame() {

  }
  render() {
    return (
      <Board board={this.state.board} updateGame={this.updateGame} />
    )
  }
}