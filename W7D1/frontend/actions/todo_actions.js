export const RECEIVE_TODOS = 'RECEIVE_TODOS';
export const RECEIVE_TODO = 'RECEIVE_TODO';

export const receiveTodo = ({ title, body }) => {
  return {
    type: RECEIVE_TODO,
    id: Math.floor(Math.random() * 10000),
    title: title,
    body: body,
    done: false
  };
};

export const receiveTodos = (todos) => {
  return {
    type: RECEIVE_TODOS,
    todos: todos
  };
};

// Complete
// Delete
// Edit?
