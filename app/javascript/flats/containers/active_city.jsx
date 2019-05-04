import React, { Component } from "react";

import { bindActionCreators } from "redux";
import { connect } from "react-redux";

import { activeCity } from "../actions";

class ActiveCity extends Component {
  render() {
    return (
      <div  className="active-city">
        <div>
        <h1>{this.props.activeCity.name}</h1>
          {this.props.activeCity.address}
        </div>
        <div>
          <img src={`https://www.lewagon.com/api/v1/cities/${this.props.activeCity.slug}/cover`} alt=""/>
        </div>
      </div>
    );
  }
}

function mapStateToProps(state) {
  return {
    activeCity: state.activeCity
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ ActiveCity }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(ActiveCity);
