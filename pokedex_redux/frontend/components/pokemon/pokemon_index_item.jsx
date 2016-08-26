import React from 'react';
import { withRouter } from 'react-router';

class PokemonIndexItem extends React.Component {

  _handleClick(router, url) {
      return (e) => router.push(url);
  }

  render() {
    const { pokemon, router } = this.props;

    return (
      <li className="pokemon-index-item"
        onClick={this._handleClick(router, `pokemon/${pokemon.id}`)}>
        <span>{}</span>
        {pokemon.name}
        <img src={pokemon.image_url}/>
        <span>{}</span>
      </li>
    );
  }
}

export default withRouter(PokemonIndexItem);
