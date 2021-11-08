import React from "react"
import Tile from "./tile";

export default class Board extends React.Component {
  constructor(props) {
    super(props);
    let t = new Tile();
    this.state = {tiles: t};
  }

  render() {
    return (
      <div>
        <div>this is the board</div>
        <p>{this.state.tiles}</p>
      </div>
    )
  }
}

