import React from "react"
import Tile from "./tile";

export default class Board extends React.Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  render() {
    return (
      <div>
        <div>this is the board</div>
        <div class="board">{
          this.props.board.grid.map((row, i) => 
            <div class="row {i}">
              {row.map((el, j) => 
                console.log(el)
              )}
            </div>
          )}
        </div>
        {/* <p>{this.state.tiles.render()}</p> */}
      </div>
    )
  }
}

