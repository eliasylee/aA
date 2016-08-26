import { connect } from 'react-redux';
import { ACTIONS } from '../../actions/pokemon_actions';
import { requestOnePokemon } from '../../actions/pokemon_actions';
import PokemonDetail from './pokemon_detail';

const mapStateToProps = state => ({
  pokemon: state
});


export default connect(
  mapStateToProps,
  null
)(PokemonDetail);
