import React from 'react';

import Board from './minesweeper';
import GameTile from './tile';

class GameBoard extends React.Component {
  constructor(props) {
    super(props);
  }

  renderBoard() {
    return (
      this.props.board.grid.map( (row, index1) => {
        return (
          <div key={index1}> {
            row.map( (ele, index2) => {
              return (
                <GameTile tile={ele}
                          updateGame={this.props.updateGame}
                          key={index2} />
              );
            })
          } </div>
        );
      })
    );
  }

  render() {
    return (
      <div>
        <span>
          {this.renderBoard()}
        </span>
      </div>
    );
  }

}

export default GameBoard;
