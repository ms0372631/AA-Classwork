import React from "react"
import Tile from "./tile";
// import * as Minesweeper from "../minesweeper.js";

export default class Board extends React.Component {
  // <Board board={this.state.board} updateGame={this.updateGame} />
  // props has board and updategame function
  constructor(props) {
    super(props);
    this.state = {};
  }

  render() {
    return (
      <div>
        <div>this is the board</div>
        <div className="board">{
          this.props.board.grid.map((row, i) => 
            <div key={i}>
              {row.map((el, j) => {
                let t = this.props.board.grid[i][j];
                return <Tile tile={t} key={j} updateGame={this.props.updateGame}/>
              }
              )}
            </div>
          )}
        </div>
        {/* <p>{this.state.tiles.render()}</p> */}
      </div>
    )
  }
}

