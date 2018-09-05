import React from 'react';

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    return (
      <div className="pokedex-container">
        <ul className="pokemon-list">
          {
            this.props.pokemon.map(poke => {
              return (
                <li className="poke-card" key={poke.id}>
                  <p>{poke.name}</p>
                  <img className="poke-img" src={poke.image_url}/>
                </li>
              );
            })
          }
        </ul>
      </div>
    );
  }
}

export default PokemonIndex;
