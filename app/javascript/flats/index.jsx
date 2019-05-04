// external modules
import React from "react";
import ReactDOM from "react-dom";
import { Provider } from "react-redux";
import { createStore, combineReducers } from "redux";

// internal modules
// import "../assets/stylesheets/application.scss"; IMPORT FROM INITIAL
import App from "./components/app.jsx";

// Reducers
import citiesReducer from "./reducers/cities_reducer";
import activeCityReducer from "./reducers/active_city_reducer";

const reducers = combineReducers({
  cities: citiesReducer,
  activeCity: activeCityReducer
});


// render an instance of the component in the DOM
ReactDOM.render(
  <Provider store={createStore(reducers)}>
    <App />
  </Provider>,
  document.getElementById("app")
);
