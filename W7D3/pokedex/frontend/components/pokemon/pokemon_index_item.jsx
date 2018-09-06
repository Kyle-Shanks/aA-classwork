import React from 'react';
import { Link } from 'react-router-dom';

class PokemonIndexItem extends React.Component {
  constructor(props) {
    super(props);
  }

  render () {
    //the outer {} is for react interpolation and inner one ${} is for JS string interpolation

    // onClick={() => this.props.fetchPokemon(this.props.poke.id)}
    return (
      <li className="poke-card">
        <Link to={`/pokemon/${this.props.poke.id}`}>
          <p>{this.props.poke.name}</p>
          <img className="poke-img" src={this.props.poke.image_url}/>
        </Link>
      </li>
    );
  }
}

// const mapDispatchToProps = (dispatch, ownProps) => {
//   return {
//     fetchPokemon: () => dispatch(requestPokemon(ownProps.poke.id))
//   };
// };

export default PokemonIndexItem;
