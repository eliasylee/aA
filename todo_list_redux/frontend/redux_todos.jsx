import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import { requestTodos } from './actions/todo_actions';
import Root from './components/root';

document.addEventListener("DOMContentLoaded", event => {
  const root = document.getElementById('content');
  const store = configureStore();
  ReactDOM.render(<Root store={store} />, root);
});
