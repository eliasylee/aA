import React from 'react';

import GameBoard from './board';
import {Board} from './minesweeper';

class Game extends React.Component {
  constructor() {
    super();
    this.state = { board: new Board(40, 10) };
    this.updateGame = this.updateGame.bind(this);
  }

  updateGame() {

  }

  render() {
    return (
      <div>
        <GameBoard board={this.state.board} updateGame={this.updateGame}/>
      </div>
    );
  }
}

export default Game;
