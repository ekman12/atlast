import GMaps from 'gmaps/gmaps.js';
import { autocomplete } from '../components/autocomplete';

const mapElement = document.getElementById('map');

if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 0, lng: 0, disableDefaultUI: true });
  google.maps.event.trigger(map,);
  const markers = JSON.parse(mapElement.dataset.markers);

// function initMap() {
//   var map = new google.maps.Map(document.getElementById('map'), {
//     zoom: 4,
//     center: {lat: -33, lng: 151},
//     disableDefaultUI: true
//   });
// }

  // var infowindow = new google.maps.InfoWindow({
  //   content: contentString
  // });

  // debugger

  if(markers) {
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

disableDefaultUI: true

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


  autocomplete();
}

// console.log('map test')

