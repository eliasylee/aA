import { REQUEST_TODOS, RECEIVE_TODOS, CREATE_TODO, UPDATE_TODO, DESTROY_TODO } from '../actions/todo_actions';
import { fetchTodos, createTodo, updateTodo, destroyTodo } from '../util/todo_api_util';
import { receiveTodos, receiveTodo, removeTodo } from '../actions/todo_actions';

const TodoMiddleware = store => next => action => {
  switch(action.type) {
    case "REQUEST_TODOS":
      const success = data => store.dispatch(receiveTodos(data));
      fetchTodos(success);
      return next(action);
    case "CREATE_TODO":
      const createSuccess = data => store.dispatch(receiveTodo(data));
      createTodo(action.todo, createSuccess);
      return next(action);
    case "UPDATE_TODO":
      const updateSuccess = data => store.dispatch(receiveTodo(data));
      updateTodo(action.todo, updateSuccess);
      return next(action);
    case "DESTROY_TODO":
      debugger
      const destroySuccess = data => store.dispatch(removeTodo(data));
      destroyTodo(action.todo, destroySuccess);
      return next(action);
    default:
      return next(action);
  }
};

export default TodoMiddleware;
