import GMaps from 'gmaps/gmaps.js';
import { autocomplete } from '../components/autocomplete';
// import imgUrl from 'images/icon-72x72.png';


const mapElement = document.getElementById('map');

if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: -8.65410, lng: 115.13065, disableDefaultUI: true });
  google.maps.event.trigger(map);
  const markers = JSON.parse(mapElement.dataset.markers);
  const iconBase = 'https://maps.google.com/mapfiles/ms/icons/pink-dot.png'


  if (markers) {
    const markersArr = markers.map(marker => {
      return {
        lat: marker["lat"],
        lng: marker["lng"],
        icon: iconBase,
        infoWindow: {
          content: marker["infoWindow"]["content"]
        }
      }
    })



    map.addMarkers(markersArr)

    // check if navigation give current location
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
        var user_pos = {
          lat: position.coords.latitude,
          lng: position.coords.longitude
        };

        map.setCenter(user_pos.lat, user_pos.lng);
        map.setZoom(13);
      })
    } else {
      if (markers.length === 0) {
        map.setZoom(2);
      } else if (markers.length === 1) {
        map.setCenter(markers[0].lat, markers[0].lng);
        map.setZoom(10);
      } else {
        map.fitLatLngBounds(markers);
      }
    }

  }


  autocomplete();
}
