import React from 'react';
import { Provider } from 'react-redux';
import { Router, Route, hashHistory} from 'react-router';
import {requestAllPokemon} from '../actions/pokemon_actions';
import PokemonIndexContainer from './pokemon/pokemon_index_container';
import PokemonDetailContainer from './pokemon/pokemon_detail_container';

const Root = ({ store }) => {
  const requestAllPokemonOnEnter = () => {
    store.dispatch(requestAllPokemon());
  };

  return (
    <Provider store={store}>
      <Router history={hashHistory}>
        <Route path='/' component={PokemonIndexContainer}
          onEnter={requestAllPokemonOnEnter}>
          <Route path="pokemon/:id" component={PokemonDetailContainer}/>
        </Route>
      </Router>
    </Provider>
  );
};

export default Root;
