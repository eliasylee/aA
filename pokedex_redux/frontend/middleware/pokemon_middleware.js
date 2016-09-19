import { ACTIONS,
         receiveAllPokemon,
         receiveOnePokemon} from '../actions/pokemon_actions';
import { fetchAllPokemon, fetchOnePokemon } from '../util/api_util';

export default ({ dispatch }) => next => action => {
  switch (action.type) {
    case "REQUEST_ALL_POKEMON":
      const allPokemonSuccess = pokemon => dispatch(receiveAllPokemon(pokemon));
      fetchAllPokemon(allPokemonSuccess);
      break;
    case "REQUEST_ONE_POKEMON":
      const onePokemonSuccess = pokemon => dispatch(receiveOnePokemon(pokemon));
      fetchOnePokemon(action.pokemon, onePokemonSuccess);
      break;
    default:
      return next(action);
  }
};
