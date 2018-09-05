import { combineReducers } from 'redux';
import pokemonReducer from './pokemon_reducer';

const entityReducer = combineReducers({
  pokemon: pokemonReducer
});

export default entityReducer;
