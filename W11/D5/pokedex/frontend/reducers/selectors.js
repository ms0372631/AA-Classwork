

export const selectAllPokemon = state => {
  let allPokemon = Object.values(state.entities.pokemon);
  return allPokemon;
};