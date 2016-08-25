import { RECEIVE_TODOS, RECEIVE_TODO, REMOVE_TODO } from '../actions/todo_actions';
import merge from 'lodash/merge';

const TodosReducer = (state = {}, action) => {
  switch(action.type) {
    case RECEIVE_TODOS:
      return merge({}, state, action.todos);
    case RECEIVE_TODO:
      let newTodo = {};
      newTodo[action.todo.id] = action.todo;
      return merge({}, state, newTodo);
    case REMOVE_TODO:
      let newState = ({}, state);
      delete newState[action.todo.id];
      return newState;
    default:
      return state;
  }
};

export default TodosReducer;
