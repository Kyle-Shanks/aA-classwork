import React from 'react';
import ItemDetailContainer from '../items/item_detail_container';
import { Route, Link } from 'react-router-dom';

class PokemonDetail extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestPokemon(parseInt(this.props.match.params.pokemonId));
  }

  componentWillReceiveProps(nextProps){
    if (this.props.pokemon && this.props.pokemon.id !== parseInt(nextProps.match.params.pokemonId) ) {
      // debugger
      this.props.requestPokemon(parseInt(nextProps.match.params.pokemonId));
    }
  }

  render () {
    if(!this.props.pokemon || !this.props.pokemon.poke_type) { return null; }

    return (
      <div className="pokemon-detail">
        <img className="big-poke-img" src={this.props.pokemon.image_url} />
        <h3>{this.props.pokemon.name}</h3>
        <p>Type: {this.props.pokemon.poke_type}</p>
        <p>Attack: {this.props.pokemon.attack}</p>
        <p>Defense: {this.props.pokemon.defense}</p>
        <p>Moves: {this.props.pokemon.moves.join(', ')}</p>

        <div className="item-display">
          <div className="item-options">
            {
              this.props.pokemon.item_ids.map((item_id,idx) => {
                return (
                  <Link key={idx} to={`/pokemon/${this.props.pokemon.id}/item/${item_id}`}>
                    <p>Item {item_id}</p>
                  </Link>
                );
              })
            }
          </div>
          <Route path="/pokemon/:pokemonId/item/:itemId" component={ItemDetailContainer} />
        </div>
      </div>
    );
  }
}

export default PokemonDetail;
