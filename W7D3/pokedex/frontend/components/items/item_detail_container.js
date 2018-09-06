import { connect } from 'react-redux';
import ItemDetail from './item_detail';

const mapStateToProps = (state, ownProps) => {
  return {
    item: selectPokemonItem(state, ownProps.match.params.itemId)
  };
};

const selectPokemonItem = (state, itemId) => { //state = store.getState()
  return state.entities.items[itemId];
};

export default connect(mapStateToProps)(ItemDetail);
