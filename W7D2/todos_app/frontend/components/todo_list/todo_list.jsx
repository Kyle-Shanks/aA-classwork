import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

class TodoList extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.fetchTodos();
  }

  render(){
    return (
      <div className="todo-list-container">
        <h3>Todo List goes here</h3>
        {
          this.props.todos.map(todo => {
            return (
              <TodoListItem todo={todo}/>
            );
          })
        }
        <br />

        <div className="error-container">
          {
            this.props.errors.map(err => <p>{err}</p>)
          }
        </div>

        <TodoForm handleSubmit={this.props.handleSubmit} createTodo={this.props.createTodo} />
      </div>
    );
  }

}

export default TodoList;
