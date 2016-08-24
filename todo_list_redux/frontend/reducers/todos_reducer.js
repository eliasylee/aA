import { RECEIVE_TODOS } from '../actions/todo_actions';
import merge from 'lodash/merge';

const TodosReducer = (state = {}, action) => {
  switch(action.type) {
    case RECEIVE_TODOS:
      return merge({}, state, action.todos);
    default:
      return state;
  }
};

export default TodosReducer;
