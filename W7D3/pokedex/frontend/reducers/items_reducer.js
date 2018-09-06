import { RECEIVE_POKEMON } from '../actions/pokemon_actions';

const itemsReducer = (state = {}, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_POKEMON:
      const newState = Object.assign({}, state, action.pokemon.items); //action.pokenmon.items will overwrite whatever inside of state.items
      return newState;
    default:
      return state;
  }
};

export default itemsReducer;
