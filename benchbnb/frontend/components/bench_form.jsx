import React from 'react';

class BenchForm extends React.Component {
  render () {
    return (
      <div>
        <h1>Create Bench</h1>
        <form>
          <label>
            Description
            <textarea id="bench-description"></textarea>
          </label>
          <br/>
          <label>
            Number of Seats
            <input id="bench-seat-number"></input>
          </label>
          <br/>
          <label>
            Latitude
            <input id="bench-latitude"></input>
          </label>
          <br/>
          <label>
            Longitude
            <input id="bench-longitude"></input>
          </label>
        </form>
      </div>
    )
  }
}

export default BenchForm;
