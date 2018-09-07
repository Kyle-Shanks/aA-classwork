import { RECEIVE_ERRORS, RECEIVE_CURRENT_USER } from '../actions/session_actions.js';
import { merge } from 'lodash';

export default (state = [], action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_ERRORS:
      return merge([], state, action);
    case RECEIVE_CURRENT_USER:
      return [];
    default:
      return state;
  }
};
