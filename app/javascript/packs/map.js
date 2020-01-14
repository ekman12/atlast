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

console.log('Width:  ' +  getWidth() );

var map;
var infowindow = null;

let mapElement = (getWidth() > 768) ? document.getElementById('desktop-map') : document.getElementById('mobile-map');


const markers = JSON.parse(mapElement.dataset.markers)

function initMap() {
  map = new google.maps.Map(mapElement, {
    center: {lat: 51.5074, lng: -0.1248},
    zoom: 13,
    disableDefaultUI: true,
  });

  console.log(navigator.geolocation)

  let infoWindow = new google.maps.InfoWindow;

  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(({coords: {latitude, longitude}}) => {
      var pos = {lat: latitude, lng: longitude}
      infoWindow.setPosition(pos);
      infoWindow.setContent('You are here!');
      infoWindow.open(map);
      map.setCenter(pos);
    })
  } else {
    handleLocationError(false, infoWindow, map.getCenter());
  }

  markers.forEach(marker => {
    let mapMarker = new google.maps.Marker({
      position: {lat: marker.place.latitude, lng: marker.place.longitude },
      map: map,
      title: name
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
