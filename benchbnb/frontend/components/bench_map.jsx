import React from 'react';
import ReactDOM from 'react-dom';
import MarkerManager from '../util/marker_manager';

class BenchMap extends React.Component {
  componentDidMount () {
    const mapDOMNode = this.refs.map;
    const mapOptions = {
      center: {lat: 37.7758, lng: -122.435},
      zoom: 13
    };

    this.map = new google.maps.Map(mapDOMNode, mapOptions);
    this.MarkerManager = new MarkerManager(this.map);
    this.MarkerManager.updateMarkers(this.props.benches);

    let latLngBounds;

    google.maps.event.addListener(this.map, 'bounds_changed', () => {
      let latLngBounds = this.map.getBounds();
    });

    google.maps.event.addListener(this.map, "idle", () => {
      let northEast = latLngBounds.getNorthEast();
      let southWest = latLngBounds.getSouthWest();

      let bounds = {
        "northEast": { "lat": `${northEast.lat()}`, "lng": `${northEast.lng()}` },
        "southWest": { "lat": `${southWest.lat()}`, "lng": `${southWest.lng()}` }
      };

      this.props.updateBounds('bounds', bounds)
    });
  };

  componentDidUpdate () {
    this.MarkerManager.updateMarkers(this.props.benches);
  }

  render () {
    return (
      <div id="map-container" ref='map'></div>
    );
  }
}

export default BenchMap;
