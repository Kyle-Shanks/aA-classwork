import { createStore, applyMiddleware } from 'redux';
import rootReducer from '../reducers/root_reducer';
import thunk from '../reducers/thunk';

const defaultState = {
  entities: {
    users: {}
  },
  session: {
    id: null,
  },
  errors: {
    session: ["Invalid credentials"]
  }
};

export const configureStore = (preloadedState = defaultState) => {
  return createStore(rootReducer, preloadedState, applyMiddleware(thunk));
};
