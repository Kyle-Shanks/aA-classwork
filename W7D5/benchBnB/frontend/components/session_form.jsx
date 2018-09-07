import React from 'react';

class SessionForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: "",
      password: "",
    };
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.formAction(Object.assign({}, this.state));
  }

  update(field) {
    return (e) => {
      this.setState({
        [field]: e.currentTarget.value
      });
    };
  }

  render() {
    return (
      <div className="session-form">
        <h2>{this.props.buttonText}</h2>

        <ul className="errors">
          {
            this.props.errors.map((msg, idx) => <li key={idx}>{msg}</li>)
          }
        </ul>

        <form onSubmit={this.handleSubmit}>
          <input type='text' value={this.state.name} onChange={this.update('name')} />
          <input type='password' value={this.state.password} onChange={this.update('password')} />
          <button>{this.props.buttonText}</button>
        </form>
      </div>
    );
  }
}

export default SessionForm;
