import _ from 'lodash';

export const selectAllPokemon = (state) => { //state = store.getState()
  return _.values(state.entities.pokemon);
};
