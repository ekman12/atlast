import React, { Component } from "react";

import { bindActionCreators } from "redux";
import { connect } from "react-redux";

import { activeCity } from "../actions";

class City extends Component {
  handleClick = () => {
    console.log(this.props.city)
    this.props.activeCity(this.props.city);
  };

  render() {
    return (
      <div className="list-group-item" onClick={this.handleClick} >
        {this.props.city.name}
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
  return bindActionCreators({ activeCity }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(City);
