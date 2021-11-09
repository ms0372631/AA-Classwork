import React from "react";
// import * as Minesweeper from "../minesweeper.js";

class Tile extends React.Component {
  // props: tile={t}
  constructor(props) {
    super(props);
  }

  handleClick(e) {
    e.preventDefault();
    
    this.props.tile.explore();

    let reveal = true;
    if (e.altKey) {
      reveal = false;
      this.classList('flagged');
    } else {
      this.classList.add('explored');
    }
    
    this.props.updateGame(this.props.tile, reveal);
  }
  
  render() {
    // console.log(this.props);
    return (
      <div>
        {(() => {
          let t = this.props.tile;
          if (t.explored && t.adjacentBombCount() > 1) {
            return (                         // passes in e for us
              <div className="tile explored" onClick={this.handleClick.bind(this)}>
                {t.adjacentBombCount()}
              </div>
            )
          } else if (t.bombed) {
            return (
              <div className="tile bombed" onClick={this.handleClick.bind(this)}></div>
            )
          } else if (t.flagged) {
            return (
              <div className="tile flagged" onClick={this.handleClick.bind(this)}></div>
            )
          } else {
            return (
              <div className="tile" onClick={this.handleClick.bind(this)}></div>
            )
          }
        })()}
      </div>
    )
  }
}

export default Tile;