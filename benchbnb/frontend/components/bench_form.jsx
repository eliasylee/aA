import React from 'react';

class BenchForm extends React.Component {
  constructor (props) {
    super(props);
    this.coords = {
      lat: this.props.lat,
      lng: this.props.lng
    }
  }

  render () {
    return (
      <div className="bench-form-container">
        <h1>Create Bench</h1>
          <form className="bench-form">
            <label>Description</label>
            <textarea id="bench-description"></textarea>
            <br/>

            <label>Number of Seats</label>
            <input id="bench-seat-number"></input>
            <br/>

            <label>Latitude</label>
            <input id="bench-latitude"
                   type="text"
                   value={this.coords.lat}
                   disabled />
            <br/>

            <label>Longitude</label>
            <input id="bench-longitude"
                   type="text"
                   value={this.coords.lng}
                   disabled />
          </form>
      </div>
    )
  }
}

export default BenchForm;
