import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

const TodoList = ({ todos, handleSubmit }) => {
  return(
    <div className="todo-list-container">
      <h3>Todo List goes here</h3>
      {
        todos.map(todo => {
          return (
            <TodoListItem todo={todo}/>
          )
        })
      }
      <br />
      <TodoForm handleSubmit={handleSubmit} />
    </div>
  )
}

export default TodoList;
