import GMaps from 'gmaps/gmaps.js';

const getWidth = () => {
  return Math.max(
    document.body.scrollWidth,
    document.documentElement.scrollWidth,
    document.body.offsetWidth,
    document.documentElement.offsetWidth,
    document.documentElement.clientWidth
  );
}

var map;
var infowindow = null;
const mapElement = (getWidth() > 768) ? document.getElementById('desktop-map') : document.getElementById('mobile-map');
const markers = JSON.parse(mapElement.dataset.markers)

function initMap() {
  map = new google.maps.Map(mapElement, {
    center: {lat: 51.5074, lng: -0.1248},
    zoom: 13,
    disableDefaultUI: true
  });

  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(({coords: {latitude, longitude}}) => {
      let pos = {lat: latitude, lng: longitude}
      map.setCenter(pos);
      new google.maps.Marker({
        position: pos,
        map: map,
        icon: "/user_marker.svg"
      })
    })
  } else {
    handleLocationError(false, userLocation, map.getCenter());
  }

  markers.forEach(marker => {
    let mapMarker = new google.maps.Marker({
      position: {lat: marker.place.latitude, lng: marker.place.longitude },
      map: map,
      title: name,
      icon: "/place_marker.svg"
    });

    google.maps.event.addListener(mapMarker, 'click', function() {
      if (infowindow) infowindow.close();
      infowindow = new google.maps.InfoWindow({
        content: marker["infoWindow"]["content"]
      });
      infowindow.open(map, mapMarker);
    });
  })
}

initMap()
