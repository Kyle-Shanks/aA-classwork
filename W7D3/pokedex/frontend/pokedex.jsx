import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';
import { receiveAllPokemon, requestAllPokemon } from './actions/pokemon_actions';
import { fetchAllPokemon } from './util/api_util';
import configureStore from './store/store';
import { selectAllPokemon } from './reducers/selectors';

const store = configureStore();

window.store = store;
window.getState = store.getState;
window.fetchAllPokemon = fetchAllPokemon;
window.receiveAllPokemon = receiveAllPokemon;
window.requestAllPokemon = requestAllPokemon;
window.selectAllPokemon = selectAllPokemon;

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, root);
});
