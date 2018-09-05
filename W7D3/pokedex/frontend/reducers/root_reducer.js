import { combineReducers } from 'redux';
import entityReducer from './entity_reducer';

const rootReducer = combineReducers({
  entities: entityReducer
});

export default rootReducer;
