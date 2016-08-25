import {ACTIONS, receiveAllPokemon} from '../actions/pokemon_actions';

const pokemonReducer = (state = [], action) => {
  switch (action.type) {
    case "RECEIVE_ALL_POKEMON":
      let newState = action.pokemon;
      return newState;
    default:
      return state;
    }
};

export default pokemonReducer;
