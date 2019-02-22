import GMaps from 'gmaps/gmaps.js';

const mapElement = document.getElementById('map');

if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
  const markers = JSON.parse(mapElement.dataset.markers);

  // var infowindow = new google.maps.InfoWindow({
  //   content: contentString
  // });

  const markersArr = markers.map(marker => {
    return {
      lat: marker["lat"],
      lng: marker["lng"],
      infoWindow: {
        content: marker["infoWindow"]["content"]
      }
    }
  })

  // console.log(markersArr)

  map.addMarkers(markersArr)

  // console.log(markersArr)

  // map.markers.forEach((marker) => {
  //   // var contentString = marker["infoWindow"]["content"];
  //   // var marker = map.addMarker({
  //   //   position: {lat: marker["lat"], lng: marker["lng"]}
  //   // });
  //   // var infowindow = new google.maps.InfoWindow({
  //   //   content: contentString
  //   // });
  //   marker.addListener('click', function() {
  //     console.log(map);
  //     console.log(marker.infoWindow);
  //     // map.hideInfoWindows()
  //     marker.infoWindow.open(map,marker);
  //   })
  // });


  // map.addMarkers(markers);

  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(14);
  } else {
    map.fitLatLngBounds(markers);
  }
}
