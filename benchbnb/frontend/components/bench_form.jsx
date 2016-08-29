import React from 'react';
import { withRouter } from 'react-router';

class BenchForm extends React.Component {
  constructor (props) {
    super(props);
    this.coords = {
      lat: this.props.lat,
      lng: this.props.lng
    }
    this.state = {
      description: "",
      seats: 0,
      lat: this.props.lat,
      lng: this.props.lng
    }
    this.handleSubmit = this.handleSubmit.bind(this);
    this.redirectToMap = this.redirectToMap.bind(this);
  }

  update (property) {
    return e => this.setState({ [property]: e.target.value });
  }

  handleSubmit (e) {
    e.preventDefault();
    let bench = Object.assign({}, this.state, this.coords);
    this.props.createBench(bench);
    this.redirectToMap();
  }

  redirectToMap () {
    this.props.router.push({
      pathname: "/"
    })
  }

  render () {
    return (
      <div className="bench-form-container">
        <h1>Create Bench</h1>
          <form className="bench-form" onSubmit={this.handleSubmit}>
            <label>Description</label>
            <textarea id="bench-description"
                      onChange={this.update("description")}>
            </textarea>
            <br/>

            <label>Number of Seats</label>
            <input id="bench-seat-number"
                   onChange={this.update("seats")} />
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
            <br/>

            <input type="submit" value="Create Bench" className="new-bench-button"/>
          </form>
      </div>
    )
  }
}

export default withRouter(BenchForm);
