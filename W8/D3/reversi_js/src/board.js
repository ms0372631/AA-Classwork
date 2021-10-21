// DON'T TOUCH THIS CODE
if (typeof window === 'undefined'){
  var Piece = require("./piece");
}
// DON'T TOUCH THIS CODE

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid() {
  let grid = [];
  for (let i = 0; i < 8; i++) {
    grid.push(new Array(8));
  }
  grid[3][4] = new Piece("black");
  grid[4][3] = new Piece("black");
  grid[3][3] = new Piece("white");
  grid[4][4] = new Piece("white");
  return grid;
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  if (pos[0] < 0 || pos[0] > 7 || pos[1] < 0 || pos[1] > 7) {
    return false;
  } else {
    return true;
  }
};

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  if (this.isValidPos(pos)) {
    return this.grid[pos[0]][pos[1]];
  } else {
    throw new Error('Not valid pos!');
  }
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  // if (!!this.grid[pos[0]][pos[1]] && this.grid[pos[0]][pos[1]].color === color) {
  //   return true;
  // }
  // else {
  //   return false;
  // }
  return !!this.grid[pos[0]][pos[1]] && this.grid[pos[0]][pos[1]].color === color;
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  return this.grid[pos[0]][pos[1]] instanceof Piece;
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns an empty array if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns empty array if it hits an empty position.
 *
 * Returns empty array if no pieces of the opposite color are found.
 */
Board.prototype._positionsToFlip = function(pos, color, dir, piecesToFlip){

  piecesToFlip = piecesToFlip || [];

  let newPos = [pos[0] + dir[0], pos[1] + dir[1]];
  if (!this.isValidPos(newPos))
    return [];
  if (this.getPiece(newPos) && this.getPiece(newPos).color === color)
    return piecesToFlip;

  if (this.isOccupied(newPos) && color === this.getPiece(newPos).oppColor() ) {
    piecesToFlip.push(newPos); //only if valid pos, pos occupied by piece of oppColor, 
    return this._positionsToFlip(newPos, color, dir, piecesToFlip);
  }

  return [];
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {

  if (this.isOccupied(pos)) {
    return false;
  }
  
  for (let i = 0; i < Board.DIRS.length; i++) {
    const dir = Board.DIRS[i];
    let dirMoves = this._positionsToFlip(pos, color, dir);
    // if (dirMoves.length > 0 && this.isMine(endPosition, color)) {
    //   return true;
    // }
    if (dirMoves && dirMoves.length > 0) {
      return true;
    }
    // if (dirMoves.length > 0)
    //   moves.push(dirMoves);
    
  }
  return false;
};

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  let newPiece = new Piece(color);

  if (this.validMove(pos, color)) {
    this.grid[pos[0]][pos[1]] = newPiece;
    for (let i = 0; i < Board.DIRS.length; i++) {
      let dir = Board.DIRS[i];
      
      for (let j = 0; j < this._positionsToFlip(pos, color, dir).length; j++) {
        let positionFlip = this._positionsToFlip(pos, color, dir)[j];
        this.getPiece(positionFlip).flip();
      }
    }
    
  } else {
    throw new Error('Invalid move!')
  }
  
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
  let validMoves = [];
  for (let i = 0; i < this.grid.length; i++) {
    for (let j = 0; j < this.grid.length; j++) {
      if (this.validMove([i,j], color)) {
        validMoves.push([i,j]);
      }
      
    }
    
  }
  return validMoves;
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  return this.validMoves(color).length > 0;
};



/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  return this.validMoves("black").length === 0 && this.validMoves("white").length === 0;
};




/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
  for (let i = 0; i < this.grid.length; i++) {
    let row = [];
    for (let j = 0; j < this.grid.length; j++) {
      row.push(this.grid[i][j] ? this.grid[i][j].toString() + " " : "_ ");
    }
    console.log(row.join(""));
  }
};


// DON'T TOUCH THIS CODE
if (typeof window === 'undefined'){
  module.exports = Board;
}
// DON'T TOUCH THIS CODE