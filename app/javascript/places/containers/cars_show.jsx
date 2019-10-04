// import React, { Component } from 'react';
// import { bindActionCreators } from 'redux';
// import { connect } from 'react-redux';
// import { Link, withRouter } from 'react-router-dom';

// import Aside from '../components/aside';
// import { removeCar } from '../actions';

// class CarsShow extends Component {
//   handleClick = () => {
//     this.props.removeCar(this.props.history, this.props.car);
//   }

//   render () {
//     const car = this.props.car;
//     if (!car) {
//       return (
//         <Aside key="aside" garage={this.props.garage}>
//           <Link to="/">Back to list</Link>
//         </Aside>);
//     }
//     return [
//       <Aside key="aside" garage={this.props.garage}>
//         <Link to="/">Back to list</Link>
//       </Aside>,
//       <div className="car-container" key="car">
//         <div className="car-card">
//           <img className="car-picture" src="/assets/images/logo_square.svg" />
//           <div className="car-details">
//             <span>{car.brand} - {car.model}</span>
//             <ul>
//               <li><strong>Owner:</strong> {car.owner}</li>
//             </ul>
//             <span className="plate">{car.plate}</span>
//           </div>
//           <button className="delete" onClick={this.handleClick}>
//             <i className="fa fa-trash-o" aria-hidden="true"></i>
//             Delete
//           </button>
//         </div>
//       </div>
//     ];
//   }
// };

// function mapStateToProps(state, ownProps) {
//   const id = parseInt(ownProps.match.params.id);
//   return {
//     car: state.cars.find((car) => car.id === id),
//   };
// }

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ removeCar }, dispatch);
// }

// export default withRouter(connect(mapStateToProps, mapDispatchToProps)(CarsShow));
