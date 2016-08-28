class MarkerManager {
  constructor (map) {
    this.map = map;
    this.markers = [];
    this.benchesToAdd = this._benchesToAdd.bind(this);
    this.createMarkerFromBench = this._createMarkerFromBench.bind(this);
  }

  updateMarkers (benches) {
    this.benches = benches;
    let benchesToAdd = this.benchesToAdd(benches);
    benchesToAdd.forEach( bench => {
      this.createMarkerFromBench(bench);
    })
  }

  _benchesToAdd () {
    let mapBenchIds = this.markers.map( marker => marker.benchId )
    let newBenches = [];

    this.benches.forEach( bench => {
      if (!mapBenchIds.includes(bench.id)) {
        newBenches.push(bench);
      };
    })

    return newBenches;
  }

  _createMarkerFromBench (bench) {
    let markerPos = {
      lat: bench.lat,
      lng: bench.lng
    };

    let newMarker = new google.maps.Marker({
      position: markerPos,
      map: this.map
    })

    this.markers.push(newMarker);
  }
}

export default MarkerManager;
