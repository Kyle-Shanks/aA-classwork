import React from 'react';

class Autocomplete extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      inputVal: ""
    };
  }

  handleInput(event) {
    event.preventDefault();
    this.setState({inputVal: event.target.value});
  }

  render () {
    let results;
    if(this.state.inputVal === '') {
      results = [];
    } else {
      results = this.props.names.filter( (name) => name.toLowerCase().includes(this.state.inputVal.toLowerCase()));
    }

    return(
      <div className="section autocomplete">
        <h2 className="section-header">Autocomplete</h2>
        <input onChange={this.handleInput.bind(this)} class="autocomplete-input"
          type="text" placeholder="Search"></input>
        <ul className="search-results">
          {results.map( (name) => <li><p>{name}</p></li>)}
        </ul>
      </div>
    );
  }
}

export default Autocomplete;
