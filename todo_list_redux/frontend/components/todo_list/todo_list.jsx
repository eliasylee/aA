import React from 'react';
import requestTodos from '../../actions/todo_actions';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

class TodoList extends React.Component {
  constructor(props) {
    super(props);
  }
  componentDidMount() {
    this.props.requestTodos();
  }

  render() {
    let titles = this.props.todos.map( (todo, index) => {
      return <TodoListItem todo={todo}
                           toggleTodo={this.props.toggleTodo}
                           destroyTodo={this.props.destroyTodo}
                           key={index}/>;
    });

    return (
      <div>
        <TodoForm createTodo={this.props.createTodo}/>
        <ul>{titles}</ul>
      </div>
    );
  }
}

export default TodoList;
