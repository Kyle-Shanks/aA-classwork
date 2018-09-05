import React from 'react';
import { Provider } from 'react-redux';
import PokemonIndexContainer from './pokemon/pokemon_index_container';

const Root = ({ store }) => {
  return (
    <Provider store={store}>
      <div className="page-container">
        <h1 className="poke-header">PokeDex</h1>
        <PokemonIndexContainer />
      </div>
    </Provider>
  );
};

export default Root;
