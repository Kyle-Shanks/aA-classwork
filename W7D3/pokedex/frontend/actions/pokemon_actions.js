import * as APIUtil from "../util/api_util";

export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
export const RECEIVE_POKEMON = "RECEIVE_POKEMON";

export const receiveAllPokemon = pokemon => {
  return {
    type: RECEIVE_ALL_POKEMON,
    pokemon
  };
};

export const receivePokemon = pokemon => {
  return {
    type: RECEIVE_POKEMON,
    pokemon
  };
};

export const requestAllPokemon = () => (dispatch) => {
  return APIUtil.fetchAllPokemon().then((res) => {
    dispatch(receiveAllPokemon(res));
  });
};

export const requestPokemon = id => (dispatch) => {
  return APIUtil.fetchPokemon(id).then((res) => {
    dispatch(receivePokemon(res));
  });
};
