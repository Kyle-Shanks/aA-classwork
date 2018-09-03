import React from 'react';
import TodoList from './todo_list/todo_list_container';

const Todo = (props) => {
  return (
    <div className="page-container">
      <h1>Todos App</h1>
      <TodoList />
    </div>
  );
};

export default Todo;
