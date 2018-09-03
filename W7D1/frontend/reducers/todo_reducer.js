import { RECEIVE_TODOS, RECEIVE_TODO } from './../actions/todo_actions';

const initialState = {
  1: {
    id: 1,
    title: 'wash car',
    body: 'with soap',
    done: false
  },
  2: {
    id: 2,
    title: 'wash dog',
    body: 'with shampoo',
    done: true
  },
};

const todoReducer = (state = initialState, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_TODOS:
      const resetState = {};
      for (let i in action.todos) {
        resetState[action.todos[i].id] = action.todos[i];
      }
      return resetState;

    case RECEIVE_TODO:
      const newTodo = { id: action.id, title: action.title, body: action.body, done: action.done };
      const newState = Object.assign({}, state);
      newState[newTodo.id] = newTodo;
      return newState;

    default:
      return state;
  }
};

export default todoReducer;
