import { REQUEST_TODOS, RECEIVE_TODOS } from '../actions/todo_actions';
import { fetchTodos, createTodo } from '../util/todo_api_util';
import { receiveTodos, receiveTodo } from '../actions/todo_actions';

const TodoMiddleware = store => next => action => {
  debugger
  switch(action.type) {
    case "REQUEST_TODOS":
      const success = data => store.dispatch(receiveTodos(data));
      fetchTodos(success);
      return next(action);
    case "CREATE_TODO":
      debugger
      const createSuccess = data => store.dispatch(receiveTodo(data));
      createTodo(action.todo, createSuccess);
      return next(action);
    default:
      return next(action);
  }
};

export default TodoMiddleware;
