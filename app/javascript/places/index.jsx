import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import { createStore, combineReducers, applyMiddleware } from 'redux';
import reduxPromise from 'redux-promise';
import logger from 'redux-logger';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import { createHistory as history } from 'history';
import { reducer as formReducer } from 'redux-form';

import CarsIndex from './containers/cars_index';
import CarsShow from './containers/cars_show';
import CarsNew from './containers/cars_new';
// import '../assets/stylesheets/application.scss';

import carsReducer from './reducers/cars_reducer.js';

// State and reducers
const initialState = {
  places: 'test',
  cars: []
};

const reducers = combineReducers({
  places: (state = null, action) => state,
  cars: carsReducer,
  form: formReducer
});

const middlewares = applyMiddleware(reduxPromise, logger);

// render an instance of the component in the DOM
ReactDOM.render(
  <Provider store={createStore(reducers, initialState, middlewares)}>
    <Router history={history}>
      <div className="view-container">
        <Switch>
          <Route path="/places" exact component={CarsIndex} />
          <Route path="/cars/new" exact component={CarsNew} />
          <Route path="/cars/:id" component={CarsShow} />
        </Switch>
      </div>
    </Router>
  </Provider>,
  document.querySelector('#root')
);

//  THIS IS WHAT WE NEED TO INCLUDE IF YOU WANT TO
    // <Router history={history}>
    //   <div className="view-container">
    //     <Switch>
    //       <Route path="/places" exact component={CarsIndex} />
    //       <Route path="/cars/new" exact component={CarsNew} />
    //       <Route path="/cars/:id" component={CarsShow} />
    //     </Switch>
    //   </div>
    // </Router>
