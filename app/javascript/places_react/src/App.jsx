import React, { Component } from 'react';
//import logo from './logo.svg';
import './App.css';
import PlaceCard from './components/place_card'

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      places: []
    };
  }

  componentDidMount = () => {
    const url = 'http://localhost:3000/api/v1/places'
    const promise = fetch(url)
    .then(response => response.json())
      .then(data => this.setState({ places: data}));
  }

  render() {

    const placeCards =
      this.state.places.map((place) => {
        console.log(place)
        return <PlaceCard place={place}/>
      })


    return (
      <div>
      <div>Check these places out!</div>
      {placeCards}
     </div>
    );
  }
}

export default App;

 // <div className="App">
 //      <header className="App-header">
 //        <img src={logo} className="App-logo" alt="logo" />
 //        <p>
 //          Edit <code>src/App.js</code> and save to reload.
 //        </p>
 //        <a
 //          className="App-link"
 //          href="https://reactjs.org"
 //          target="_blank"
 //          rel="noopener noreferrer"
 //        >
 //          Learn React
 //        </a>
 //      </header>
 //    </div>
