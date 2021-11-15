import React from 'react';
import {Provider} from 'react-redux';
import PokemonIndexContainer from './pokemon/pokemon_index_container';
import PokemonIndex from './pokemon/pokemon_index';

const Root = ({store}) => (
  <Provider store={store}>
    <PokemonIndexContainer>
      <PokemonIndex />
    </PokemonIndexContainer>
  </Provider>
)

export default Root;
