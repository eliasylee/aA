import React from 'react';
import $ from 'jquery';

class Weather extends React.Component {
  constructor() {
    super();
    this.state = { loc: "", temp: "" };
  }

  componentDidMount() {
    navigator.geolocation.getCurrentPosition((position) => {
      let request = new XMLHttpRequest();

      request.open(
          'GET',
          `http://api.openweathermap.org/data/2.5/weather?lat=${position.coords.latitude}&lon=${position.coords.longitude}&APPID=568c533e7be2a87f6fda484a0a788a1d`,
          true
      );

      request.onload = function() {
        if (request.status >= 200 && request.status < 400) {
          let loc = request.responseText.location.name;
          let temp = request.responseText.current.temp_f;

          this.setState({ loc: loc, temp: temp });
        } else {
          console.log("Fail");
        }
      };

      request.send();
    });
  }

  render() {
    return (
      <div>
        <header>Weather</header>
        <span>Location: { this.state.loc }</span>
        <span>Temperature: { this.state.temp }</span>
      </div>
    );
  }
}

export default Weather;
