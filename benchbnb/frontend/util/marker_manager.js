class MarkerManager {
  constructor (map) {
    this.map = map;
    this.markers = [];
    this.benchesToAdd = this._benchesToAdd.bind(this);
    this.createMarkerFromBench = this._createMarkerFromBench.bind(this);
    this.markersToRemove = this._markersToRemove.bind(this);
    this.removeMarker = this._removeMarker.bind(this);
  }

  updateMarkers (benches) {
    this.benches = benches;

    let benchesToAdd = this._benchesToAdd(benches);
    benchesToAdd.forEach( bench => {
      this._createMarkerFromBench(bench);
    });

    let markersToRemove = this._markersToRemove();
    markersToRemove.forEach( marker => {
      this._removeMarker(marker);
    });
  }

  _benchesToAdd () {
    let mapBenchIds = this.markers.map( marker => marker.benchId )
    let newBenches = [];

    this.benches.forEach( bench => {
      if (!mapBenchIds.includes(bench.id) ) {
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
      map: this.map,
      benchId: bench.id
    })

    this.markers.push(newMarker);
  }

  _markersToRemove () {
    let persistingMarkers = []
    let benchIds = this.benches.map( bench => bench.id )

    this.markers.forEach( marker => {
      if (!benchIds.includes(marker.benchId)) {
        persistingMarkers.push(marker)
      }
    });

    return persistingMarkers;
  }

  _removeMarker (marker) {
    let idx = this.markers.indexOf(marker);
    this.markers[idx].setMap(null);
    this.markers = this.markers.slice(0, idx).concat(this.markers.slice(idx + 1, this.markers.length));
  }
}

export default MarkerManager;
