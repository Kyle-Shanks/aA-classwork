import { RECEIVE_ALL_POKEMON, RECEIVE_POKEMON } from '../actions/pokemon_actions';

const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
      return Object.keys(state).length === 0 ? action.pokemon : Object.assign(action.pokemon, state);
    case RECEIVE_POKEMON:
      const newState = Object.assign({}, state);
      newState[action.pokemon.pokemon.id] = action.pokemon.pokemon;
      return newState;
    default:
      return state;
  }
};

export default pokemonReducer;
