import React from 'react';
import ReactDom from 'react-dom';
import * as API from './util/api_util';
import { ACTIONS, receiveAllPokemon } from './actions/pokemon_actions';
import configureStore from './store/store';
import Root from './components/root';


document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById('root');
  let store = configureStore();
  ReactDom.render( <Root store={store}/>, root);
  // window.store = store;
});


// {API.fetchAllPokemon((pokemon) =>
//   store.dispatch(receiveAllPokemon(pokemon)))}
