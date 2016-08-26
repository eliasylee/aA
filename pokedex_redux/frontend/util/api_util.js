export const fetchAllPokemon = (success) => {
  $.ajax({
    method: 'GET',
    url: 'api/pokemon',
    success: success
  });
};

export const fetchOnePokemon = (pokemon, success) => {
  $.ajax({
    method: 'GET',
    url: `api/pokemon/${pokemon.id}`,
    success: success
  });
};
