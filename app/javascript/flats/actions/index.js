import cities from "../cities";

export function setCities() {
  console.log(cities);
  return {
    type: "SET_CITIES",
    payload: cities
  };
}

export function selectFlat(flat) {
  return {
    type: "SELECT_FLAT",
    payload: flat
  };
}

export function activeCity(city) {
  return {
    type: "ACTIVE_CITY",
    payload: city
  };
}
