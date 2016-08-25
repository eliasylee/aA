import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import { requestTodos, createTodo } from './actions/todo_actions';
import Root from './components/root';

document.addEventListener("DOMContentLoaded", event => {
  const root = document.getElementById('content');
  window.store = configureStore();
  window.createTodo = createTodo;
  ReactDOM.render(<Root store={window.store} />, root);
});
