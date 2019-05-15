// const BASE_URL = 'https://wagon-garage-api.herokuapp.com';

// export function fetchPlaces(garage) {
export function fetchPlaces() {
  const url = 'http://localhost:3000/api/v1/places'
  // const url = `${BASE_URL}/${garage}/cars`;
  const promise = fetch(url)
    .then(r => r.json());

  return {
    type: 'FETCH_PLACES',
    payload: promise // Will be resolved by redux-promise
  };
}


// export function addCar(garage, car, callback) {
//   const url = `${BASE_URL}/${garage}/cars`;
//   const request = fetch(url, {
//     method: 'POST',
//     headers: {
//       'Accept': 'application/json',
//       'Content-Type': 'application/json'
//     },
//     body: JSON.stringify(car)
//   }).then(r => r.json())
//     .then(() => callback());


//   return {
//     type: 'ADD_CAR',
//     payload: request // Will be resolved by redux-promise
//   };
// }
