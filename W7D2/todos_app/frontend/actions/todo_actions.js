import * as APIUtil from './../util/todo_api_util';
import { receiveErrors } from './error_actions';

export const RECEIVE_TODOS = 'RECEIVE_TODOS';
export const RECEIVE_TODO = 'RECEIVE_TODO';

// Basic Actions
export const receiveTodo = ({ title, body, done }) => {
  return {
    type: RECEIVE_TODO,
    id: Math.floor(Math.random() * 10000),
    title: title,
    body: body,
    done: done
  };
};

export const receiveTodos = (todos) => {
  return {
    type: RECEIVE_TODOS,
    todos: todos
  };
};

// Thunk Actions
export const fetchTodos = () => {
  return (dispatch) => {
    APIUtil.fetchTodos().then( res => {
      dispatch(receiveTodos(res))
    })
  }
}

export const createTodo = (todo) => {
  return (dispatch) => {
    return APIUtil.createTodo(todo).then(
      res => dispatch(receiveTodo(res)),
      err => {
        dispatch(receiveErrors(err.responseJSON));
      }
    )
  }
}
