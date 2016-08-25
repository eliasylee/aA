import React from 'react';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.handleToggle = this.handleToggle.bind(this);
    this.handleDestroy = this.handleDestroy.bind(this);
  }

  handleToggle() {
    this.props.toggleTodo(this);
  }

  handleDestroy() {
    this.props.destroyTodo(this);
  }

  render() {
    const { todo } = this.props;
    const { title, done } = todo;

    return (
      <span>
        <li>{title}</li>
        <button onClick={this.handleToggle}>{ done ? "Undo" : "Done" }</button>
        <button onClick={this.handleDestroy}>Destroy</button>
      </span>
    );
  }
}

export default TodoListItem;
