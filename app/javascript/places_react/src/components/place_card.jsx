import React from 'react';

const PlaceCard = (props) => {
  return (
    <div class="card">
      <div className="card-bottom-place">
        <p>
        <strong> {props.place.name} </strong>
        <small>{props.place.city}</small>
        </p>
      </div>
    </div>
  )
}

export default PlaceCard;


  // <div class="card">
  //    <div class="card-top" style="background-image: linear-gradient(rgba(0,0,0,0.2), rgba(0,0,0,0.0)), url(https://images.unsplash.com/photo-1557292882-c911bef21523?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=60);">
  //     </div>
  //   <div class="card-bottom">
  //     <div class="card-bottom-place">
  //       <p> <strong><%= place.name %></strong><br>
  //         <small><%#= place.neighbourhood %> <%= place.city %></small>
  //       </p>
  //       <%= render 'shared/wishlist_link', place: place %>
  //       <div class="friends-card-bottom">
  //         <p>
  //           <%= "You" if place.posts.where(user_id: current_user).count == 1 %>
  //           <%= "and" if (place.posts.where(user_id: current_user).count == 1) && ((place.posts.where(user_id: current_user.following).count) >=2)  %>
  //           <% unless ((place.posts.where(user_id: current_user.following)-place.posts.where(user_id: current_user)).count == 0) %>
  //           <%= pluralize (place.posts.where(user_id: current_user.following)-place.posts.where(user_id: current_user)).count, "friend" %>
  //           <% end %>
  //           visited
  //       </div>
  // //     </div>
  // //     <div class="tags-card-bottom">
  // //         <ul class="tags">
  // //           <% tag_collection.first(3).to_h.each do |name, count| %>
  // //             <li><a> <%= name %> (<%= count %>)</a></li>
  // //           <% end %>
  // //         </ul>
  // //     </div>
  // //  </div>
