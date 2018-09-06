import { combineReducers } from 'redux';
import entityReducer from './entity_reducer';
import uiReducer from './ui_reducer';

const rootReducer = combineReducers({
  entities: entityReducer,
  ui: uiReducer
});

export default rootReducer;
