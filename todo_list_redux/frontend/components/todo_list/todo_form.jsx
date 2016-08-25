import React from 'react';

class TodoForm extends React.Component {
  constructor() {
    super();
    this.state = {title: "", body: ""};
    this.handleTitleChange = this.handleTitleChange.bind(this);
    this.handleBodyChange = this.handleBodyChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleTitleChange (e) {
    this.setState({title: e.target.value});
  }

  handleBodyChange (e) {
    this.setState({body: e.target.value});
  }

  handleSubmit (e) {
    e.preventDefault();
    this.props.createTodo({todo: {title: this.state.title, body: this.state.body}});
  }

  render () {
    return (
      <div>
        <form>
          Title
          <input onChange={this.handleTitleChange}></input>
          Task
          <input onChange={this.handleBodyChange}></input>
          <button onClick={this.handleSubmit}>Submit</button>
        </form>
      </div>
    );
  }
}

export default TodoForm;
