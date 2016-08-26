import React from 'react';
import PokemonIndexItem from './pokemon_index_item';

class PokemonIndex extends React.Component {
  render() {
    return (
      <section className="pokedex">
        <ul>
          {this.props.pokemon.map( pokemon => {
            return <PokemonIndexItem pokemon={pokemon} />;
            })}
          </ul>
      </section>
    );
  }
}

export default PokemonIndex;
