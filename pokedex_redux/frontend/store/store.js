import { createStore, applyMiddleware } from 'redux';
import pokemonReducer from '../reducers/pokemon_reducer';
import pokemonMiddleware from '../middleware/pokemon_middleware';


const configureStore = (preLoadedState = []) => (
  createStore(
    pokemonReducer,
    preLoadedState,
    applyMiddleware(pokemonMiddleware)
  )
);

export default configureStore;
