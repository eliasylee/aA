import React from 'react';
import requestTodos from '../../actions/todo_actions';
import TodoListItem from './todo_list_item';

class TodoList extends React.Component {
  constructor(props) {
    super(props);
  }
  componentDidMount() {
    this.props.requestTodos();
  }

  render() {
    let titles = this.props.todos.map( (todo, index) => {
      return <TodoListItem todo={todo} key={index}/>;
    });

    return <ul>{titles}</ul>;
  }
}

export default TodoList;
