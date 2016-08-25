import React from 'react';

class PokemonIndex extends React.Component {


  render() {
    return (
      <section className="pokedex">
        <ul>
          {this.props.pokemon.map( pokemon => {
            return (
              <div key={pokemon.id}>
                <li>{pokemon.name}</li>
                <img src={pokemon.image_url}/>
              </div>
              );
            })}
          </ul>
      </section>
    );
  }
}

export default PokemonIndex;
