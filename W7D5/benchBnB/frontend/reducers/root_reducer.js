import { combineReducers } from 'redux';
import errorsReducer from './errors_reducer.js';
import sessionReducer from './session_reducer.js';
import entitiesReducer from './entities_reducer.js';

const rootReducer = combineReducers({
  session: sessionReducer,
  entities: entitiesReducer,
  errors: errorsReducer
});

export default rootReducer;
