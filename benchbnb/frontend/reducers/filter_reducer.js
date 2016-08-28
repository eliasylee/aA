import { FilterConstants, updateBounds } from '../actions/filter_actions';
import merge from 'lodash/merge';

const defaultState = {
  benches: {},
  filters: {
    bounds: {}
  }
}

const FilterReducer = ( state = defaultState, action ) => {
  switch (action.type) {
    case FilterConstants.UPDATE_BOUNDS:
      let newFilter = { [action.filter]: action.value };
      let newState = merge({}, state, newFilter );
      return newState;
    default:
      return state;
  }
};

export default FilterReducer;
