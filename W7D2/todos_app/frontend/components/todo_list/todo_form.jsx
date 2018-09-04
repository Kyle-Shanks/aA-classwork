import React from 'react';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {title: "", body: ""};
  }

  handleSubmit(event) {
    event.preventDefault();
    const newTodo = Object.assign({},{done: false},this.state);
    this.props.createTodo(newTodo).then(
      () => this.setState({title: "", body: ""}) 
    );
  }

  update(field) {
    return event => {
      event.preventDefault();
      this.setState({ [field]: event.target.value} );
    };
  }

  render() {
    return (
      <form className="todo-form" onSubmit={this.handleSubmit.bind(this)}>
        <input type="text" placeholder="Todo Title" onChange={this.update('title').bind(this)} value={this.state.title}/>
        <br />
        <textarea type="text" placeholder="Todo Body" onChange={this.update('body').bind(this)} value={this.state.body}></textarea>
        <br />
        <input type="submit" value="Add Todo"/>
      </form>
    );
  }
}

export default TodoForm;
