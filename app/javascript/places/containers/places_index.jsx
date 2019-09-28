// NEXT TO DO:
// 1) Add click handler to click
//    - If not too hard just redirect to ruby post page for now
//    - if it is hard build out show page and do whole react journey as will have to do that anyway
// 2) Add a map
//    - Just a basic map
//    - How will it appear? Make it have a pretty position on page
// 3)

import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';

import { fetchPlaces } from '../actions';
import PlaceCard from '../components/place_card';

class PlacesIndex extends Component {
  handleClick = (event) => {
      this.props.selectFlat(event.target.id);
    };

  componentWillMount() {
    this.props.fetchPlaces();
  }


  render () {
    return [
      <div className="list-container" key="places">
        {this.props.places.map((place) => {
          return <PlaceCard place={place} key={place.id} onClick={this.handleClick}/>
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

    // const placeCards =
    //   this.state.places.map((place) => {
    //     console.log(place)
    //     return <PlaceCard place={place}/>
    //   })


    // return (
    //   <div>
    //   <div>Check these places out!</div>
    //   {placeCards}
    //  </div>



