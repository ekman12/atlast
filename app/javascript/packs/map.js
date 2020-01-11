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

var mapElement;
var map;

if (getWidth() > 768) {
  mapElement = document.getElementById('desktop-map');
} else {
  mapElement = document.getElementById('mobile-map');
}

const markers = JSON.parse(mapElement.dataset.markers)

function initMap() {
  map = new google.maps.Map(mapElement, {
    center: {lat: 51.5074, lng: -0.1248},
    zoom: 13,
    disableDefaultUI: true,
  });

  const image = 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png';

  console.log(navigator.geolocation)

  let infoWindow = new google.maps.InfoWindow;

  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(position => {
      var pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      }
      console.log(pos)
      infoWindow.setPosition(pos);
      infoWindow.setContent('You are here!');
      infoWindow.open(map);
      map.setCenter(pos);

    })
  } else {
    var pos = {lat: marker.place.latitude, lng: marker.place.longitude }
  }

  markers.forEach(marker => {
    var mapMarker = new google.maps.Marker({
      position: {lat: marker.place.latitude, lng: marker.place.longitude },
      map: map,
      title: marker.place.name
    });

    var infowindow = new google.maps.InfoWindow({
      content: marker["infoWindow"]["content"]
    });

    mapMarker.addListener('click', function() {
      infowindow.open(map, mapMarker);
    });
  })

}

// if (navigator.geolocation) {
//           navigator.geolocation.getCurrentPosition(function(position) {
//             var pos = {
//               lat: position.coords.latitude,
//               lng: position.coords.longitude
//             };

//             infoWindow.setPosition(pos);
//             infoWindow.setContent('Location found.');
//             infoWindow.open(map);
//             map.setCenter(pos);
//           }, function() {
//             handleLocationError(true, infoWindow, map.getCenter());
//           });
//         } else {
//           // Browser doesn't support Geolocation
//           handleLocationError(false, infoWindow, map.getCenter());
//         }
//       }

//       function handleLocationError(browserHasGeolocation, infoWindow, pos) {
//         infoWindow.setPosition(pos);
//         infoWindow.setContent(browserHasGeolocation ?
//                               'Error: The Geolocation service failed.' :
//                               'Error: Your browser doesn\'t support geolocation.');
//         infoWindow.open(map);
//       }

initMap()


  // const image = 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png';
  // if (markers) {
  //   const markersArr = markers.map(marker => {
  //     return {
  //       lat: marker["lat"],
  //       lng: marker["lng"],
  //       icon: image,
  //       infoWindow: {
  //         content: marker["infoWindow"]["content"]
  //       }
  //     }
  //   })
  // }

    // console.log(markersArr)

//     // console.log(map)
//     // google.maps.event.trigger(map);
//     // console.log(mapElement.dataset.markers)

// map.addMarkers(markersArr)








// import GMaps from 'gmaps/gmaps.js';
// import { autocomplete } from '../components/autocomplete';
// // import imgUrl from 'images/icon-72x72.png';

// console.log("something please?")
// const mapElement = document.getElementById('map');

// if (mapElement) { // don't try to build a map if there's no div#map to inject in
//   const map = new GMaps({ el: '#map', lat: -8.65410, lng: 115.13065, disableDefaultUI: true });
//   google.maps.event.trigger(map);
//   const markers = JSON.parse(mapElement.dataset.markers);
//   const iconBase = 'https://maps.google.com/mapfiles/ms/icons/pink-dot.png'


//   if (markers) {
//     const markersArr = markers.map(marker => {
//       return {
//         lat: marker["lat"],
//         lng: marker["lng"],
//         icon: iconBase,
//         infoWindow: {
//           content: marker["infoWindow"]["content"]
//         }
//       }
//     })



//     map.addMarkers(markersArr)

//     // check if navigation give current location
//     if (navigator.geolocation) {
//       navigator.geolocation.getCurrentPosition(function(position) {
//         var user_pos = {
//           lat: position.coords.latitude,
//           lng: position.coords.longitude
//         };

//         map.setCenter(user_pos.lat, user_pos.lng);
//         map.setZoom(13);
//       })
//     } else {
//       if (markers.length === 0) {
//         map.setZoom(2);
//       } else if (markers.length === 1) {
//         map.setCenter(markers[0].lat, markers[0].lng);
//         map.setZoom(10);
//       } else {
//         map.fitLatLngBounds(markers);
//       }
//     }

//   }


//   autocomplete();
// }

// console.log("calling pack tag")
      // var map;
      // function initMap() {
      //   map = new google.maps.Map(document.getElementById('map'), {
      //     center: {lat: -34.397, lng: 150.644},
      //     zoom: 8
      //   });
      // }


// WORKS BUT THROWS SOME SORT OF ERROR
      // var map;
      // function initMap() {
      //   map = new google.maps.Map(document.getElementById('map'), {
      //     center: {lat: -34.397, lng: 150.644},
      //     zoom: 8
      //   });
      // }

      // initMap()


// SOME SOLUTION OFF THE INTERNET
//   function initMap() {} // now it IS a function and it is in global

//   $(() => {
//   initMap = function() {
//     // your code like...
//     var map = new google.maps.Map(document.getElementById('map'), {/*your code*/});
//     // and other stuff...
//   }
// })
