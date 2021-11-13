import React from 'react';
import ReactDOM from 'react-dom';
import { fetchAllPokemon } from './util/api_util';
import { RECEIVE_ALL_POKEMON } from './actions/pokemon_actions';
import { receiveAllPokemon } from './actions/pokemon_actions';
import configureStore from './store/store'


document.addEventListener("DOMContentLoaded", () => {
  const rootEl = document.getElementById('root');
  ReactDOM.render(<h1>Pokedex</h1>, rootEl);

  window.fetchAllPokemon = fetchAllPokemon;
  window.receiveAllPokemon = receiveAllPokemon;
  const store = configureStore();
  console.log(store)
  window.getState = store.getState;
  window.dispatch = store.dispatch;
});