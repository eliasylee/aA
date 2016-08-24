import { REQUEST_TODOS, RECEIVE_TODOS } from '../actions/todo_actions';
import { fetchTodos } from '../util/todo_api_util';
import { receiveTodos } from '../actions/todo_actions';

const TodoMiddleware = store => next => action => {
  switch(action.type) {
    case "REQUEST_TODOS":
      const success = data => store.dispatch(receiveTodos(data));
      fetchTodos(success);
      return next(action);
    default:
      return next(action);
  }
};

export default TodoMiddleware;
