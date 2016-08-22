import React from 'react';

class Clock extends React.Component {
  constructor() {
    super();
    this.state = { time: new Date() };
  }

  componentDidMount() {
    setInterval( () => {
      this.setState({ time: new Date() });
    }, 1000);
  }

  render() {
    const time = this.state.time.toTimeString();
    const date = this.state.time.toDateString();
    return (

      <div>
        <header>Clock</header>
        <span className="clock-time">Time: {time} </span>
        <span className="clock-date">Date: {date} </span>
      </div>
    );
  }
}

export default Clock;
