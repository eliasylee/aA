import { connect } from 'react-redux';
import { ACTIONS } from '../../actions/pokemon_actions';
import { requestAllPokemon } from '../../actions/pokemon_actions';
import PokemonIndex from './pokemon_index';

const mapStateToProps = state => ({
  pokemon: state
});

export default connect(
  mapStateToProps,
  null
)(PokemonIndex);
