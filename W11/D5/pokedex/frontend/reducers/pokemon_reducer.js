import { RECEIVE_ALL_POKEMON } from "../actions/pokemon_actions";

const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);
  let nextState = Object.assign({}, state);
  switch(action.type){
    case RECEIVE_ALL_POKEMON:
      let pokemons = {}
      for (var key in action.pokemon){
        pokemons[action.pokemon[key].id] = action.pokemon[key]
      }
      return pokemons;
    default: 
      return state;
  }
}

export default pokemonReducer