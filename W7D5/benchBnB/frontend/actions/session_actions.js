import * as SessionAPIUtil from '../util/session_api_util.js';

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const RECEIVE_ERRORS = 'RECEIVE_ERRORS';
export const LOGOUT_CURRENT_USER = 'LOGOUT_CURRENT_USER';

// Regular action
export const receiveCurrentUser = (currentUser) => {
  return {
    type: RECEIVE_CURRENT_USER,
    user: currentUser,
  };
};
export const logoutCurrentUser = () => {
  return {
    type: LOGOUT_CURRENT_USER,
  };
};
export const receiveErrors = (errors) => {
  return {
    type: RECEIVE_ERRORS,
    errors,
  };
};

// Thunk actions
export const login = (user) => {
  return (dispatch) => {
    return SessionAPIUtil.login(user).then(
      res => { dispatch(receiveCurrentUser(res)); },
      errors => { dispatch(receiveErrors(errors)); }
    );
  };
};
export const logout = () => {
  return (dispatch) => {
    return SessionAPIUtil.logout().then(
      () => { dispatch(logoutCurrentUser()); },
      errors => { dispatch(receiveErrors(errors)); }
    );
  };
};
export const signup = (user) => {
  return (dispatch) => {
    return SessionAPIUtil.signup(user).then(
      res => { dispatch(receiveCurrentUser(res)); },
      errors => { dispatch(receiveErrors(errors)); }
    );
  };
};
