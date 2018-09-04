import React from 'react';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
  }
  render() {
    return (
      <div key={this.props.todo.id}>
        <h3>{this.props.todo.title}</h3>
        <p>{this.props.todo.body}</p>
      </div>
    );
  }
}

export default TodoListItem;
