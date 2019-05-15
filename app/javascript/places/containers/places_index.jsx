import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';

import { fetchPlaces } from '../actions';
// import Aside from '../components/aside';

class PlacesIndex extends Component {
  componentWillMount() {
    this.props.fetchPlaces();
    // debugger
  }

  render () {
    // debugger
    return [
      <div className="list-container" key="places">
        {this.props.places.map((place) => {
          return (
            <ul>
              <li><strong>Owner:</strong> {place.city}</li>
              <li>{place.name}</li>
              <li>{place.country}</li>
            </ul>
          );
        })}
      </div>
    ];
  }
};

function mapStateToProps(state) {
  return {
    places: state.places,
    // garage: state.garage
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchPlaces }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(PlacesIndex);
