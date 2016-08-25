import { ACTIONS, requestAllPokemon, receiveAllPokemon } from '../actions/pokemon_actions';
import { fetchAllPokemon } from '../util/api_util';

export default ({ dispatch }) => next => action => {
  switch (action.type) {
    case "REQUEST_ALL_POKEMON":
      const pokemonSuccess = pokemon => dispatch(receiveAllPokemon(pokemon));
      fetchAllPokemon(pokemonSuccess);
      break;
    default:
      return next(action);
  }
};
