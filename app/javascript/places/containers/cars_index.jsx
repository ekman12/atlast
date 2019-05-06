import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';

import { fetchCars } from '../actions';
// import Aside from '../components/aside';

class CarsIndex extends Component {
  componentWillMount() {
    this.props.fetchCars(this.props.garage);
    // debugger
  }

  render () {
    // debugger
    return [
      <div className="list-container" key="cars">
        {this.props.cars.map((car) => {
          return (
            <ul>
              <li><strong>Owner:</strong> {car.city}</li>
              <li>{car.name}</li>
              <li>{car.country}</li>
            </ul>
          );
        })}
      </div>
    ];
  }
};

function mapStateToProps(state) {
  return {
    cars: state.cars,
    garage: state.garage
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchCars }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(CarsIndex);
