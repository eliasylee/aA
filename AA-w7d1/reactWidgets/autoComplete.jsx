import React from 'react';

class AutoComplete extends React.Component {
  constructor() {
    super();
    this.state = { input: "" };
    this.updateInput = this.updateInput.bind(this);
  }
  renderNames() {
    let match = this.state.input;
    const filteredNames = [];
    this.props.names.forEach( name => {
      if(name.slice(0, match.length) === match) {
        filteredNames.push(name);
      }
    });
    return filteredNames.map( name => {
      return <li key={name}>{name}</li>;
    });
  }

  updateInput(e) {
    this.setState({ input: e.target.value });
  }

  render() {
    return (
      <ac>
        <header>Name Selector</header>
        <input onChange={this.updateInput} value={this.state.input}/>
        <ul>
          {this.renderNames()}
        </ul>
      </ac>
    );
  }
}

export default AutoComplete;
