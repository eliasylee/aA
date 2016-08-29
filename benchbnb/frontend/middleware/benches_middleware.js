import { BenchConstants,
         receiveBenches,
         requestBenches,
         receiveBench } from '../actions/bench_actions';
import { FilterConstants } from '../actions/filter_actions';
import { fetchBenches, createBench } from '../util/bench_api_util';

const BenchesMiddleware = ({ getState, dispatch }) => next => action => {
  switch (action.type) {
    case BenchConstants.REQUEST_BENCHES:
      let filters = getState().filters;
      const requestSuccess = data => dispatch(receiveBenches(data));
      fetchBenches(filters, requestSuccess);
      break;
    case FilterConstants.UPDATE_BOUNDS:
      next(action);
      dispatch(requestBenches());
      break;
    case BenchConstants.CREATE_BENCH:
      const createSuccess = data => dispatch(receiveBench(data));
      createBench(action.bench, createSuccess);
      break;
    default:
      return next(action);
  }
};

export default BenchesMiddleware;
