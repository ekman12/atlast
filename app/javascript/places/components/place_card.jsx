import React from 'react';

const PlaceCard = (props) => {
  const photo = props.place.posts[0].photo.url
  const divStyle = {
    backgroundImage: `linear-gradient(rgba(0,0,0,0.2), rgba(0,0,0,0.0)), url(${photo})`
  };

  const visitors = () =>{
    const userNames = props.place.users.map(u => u.first_name)
    const userIds = props.place.users.map(u => u.id)
    const visited = userIds.includes(props.place.current_user[0].id)
    const numVisit = userNames.length
    if (visited) {
      return (numVisit == 1 ? "You visited" : `You and ${numVisit - 1} friends visited`);
    } else {
      return `${numVisit - 1} friends visited`
    }
  }

  return (
    <div className="card">
      <div className="card-top" style={divStyle}>
      </div>
      <div className="card-bottom">
        <div className="card-bottom-place">
          <p>
            <strong>{props.place.name}</strong>
            <br></br>
            <small>{props.place.city}</small>
          </p>
          <div className="friends-card-bottom">
            <p> {visitors()} </p>
          </div>
        </div>
      </div>
    </div>
  )
}

export default PlaceCard;

// USE THE BELOW IF YOU WANT GRADIENT ON IMAGES:
//backgroundImage: "linear-gradient(rgba(0,0,0,0.2), rgba(0,0,0,0.0)), url('http://res.cloudinary.com/tomek/image/upload/v1551411369/qbxhf66nu3zymm1juz5q.jpg')"
