import { combineReducers } from 'redux';
import todoReducer from './todo_reducer';
import errorReducer from './error_reducer';

const rootReducer = combineReducers({
	todos: todoReducer,
  errors: errorReducer
});

// Long way
// const rootReducer = function(state, action) {
//   return {todos: todosReducers(state.todos, action)};
// };

export default rootReducer;
