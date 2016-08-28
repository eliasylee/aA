import { connect } from 'react-redux';
import { requestBenches } from '../actions/bench_actions';
import { updateBounds } from '../actions/filter_actions';
import BenchIndex from './bench_index';
import Search from './search';

const mapStateToProps = state => ({
  benches: state.benches
});

const mapDispatchToProps = dispatch => ({
  requestBenches: () => dispatch(requestBenches()),
  updateBounds: (bounds) => dispatch(updateBounds(bounds))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Search);
