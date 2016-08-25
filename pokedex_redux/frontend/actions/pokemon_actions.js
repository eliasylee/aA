export const ACTIONS = {
  RECEIVE_ALL_POKEMON: "RECEIVE_ALL_POKEMON",
  REQUEST_ALL_POKEMON: "REQUEST_ALL_POKEMON"
};

export const receiveAllPokemon = pokemon => ({
  type: ACTIONS.RECEIVE_ALL_POKEMON,
  pokemon
});

export const requestAllPokemon = () => ({
  type: ACTIONS.REQUEST_ALL_POKEMON
});
