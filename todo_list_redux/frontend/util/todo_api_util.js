export const fetchTodos = (success, error) => {
  $.ajax({
    method: 'GET',
    url: 'api/todos',
    success: success,
    error: error
  });
};

export const createTodo = (todo, success, error) => {
  debugger
  $.ajax({
    method: 'POST',
    url: 'api/todos',
    data: todo,
    success: success,
    error: error
  });
};
