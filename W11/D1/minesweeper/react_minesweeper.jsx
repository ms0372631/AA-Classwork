import React from "react";
import ReactDOM from "react-dom";
import Game from "./components/game";

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  ReactDOM.render(<Game/> , root);
});

// const Game = (props) => {
//   return (
//     <div>
//       <p>Testing game</p>
//       <Board />
//     </div>
//   )
// }