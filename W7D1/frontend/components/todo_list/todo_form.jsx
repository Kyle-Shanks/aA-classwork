import React from 'react';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {title: "", body: ""};
  }

  handleSubmit(event) {
    event.preventDefault();
    this.props.handleSubmit(this.state.title, this.state.body);
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
        <input type="text" placeholder="Todo Title" onChange={this.update('title').bind(this)}/>
        <br />
        <textarea type="text" placeholder="Todo Body" onChange={this.update('body').bind(this)}>{ this.state.body }</textarea>
        <br />
        <input type="submit" value="Add Todo"/>
      </form>
    );
  }
}

export default TodoForm;
