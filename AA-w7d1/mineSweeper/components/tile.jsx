import React from 'react';

import {Tile} from './minesweeper';

class GameTile extends React.Component {
  render() {
    let tile = this.props.tile;
    let symbol;

    if (tile.bombed) {
      symbol = String.fromCharCode(parseInt("1F4A3",16));
    } else if (tile.flagged) {
      symbol = String.fromCharCode(parseInt("2691",16));
    } else if (tile.explored) {
      symbol = tile.adjacentBombCount();
    } else {
      symbol = " ";
    }

    return (
      <div>{symbol}</div>
    );
  }
}

export default GameTile;
