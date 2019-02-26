const followChange = () => {
  const follows = document.querySelectorAll("#user-follow-button");
  follows.forEach((follow) => {
    follow.addEventListener("click", (event) => {
    event.currentTarget.innerText = "Followed!";
    })
  }
)};

  export { followChange };


// document.querySelector("[data-user-id='<%=@followed.id%>']").classList.toggle("user-card");


// const clickWishlistHeart = () => {
//   const wishlistHearts = document.querySelectorAll("#wishlist-heart");
//   wishlistHearts.forEach((heart) => {
//     heart.addEventListener("click", (event) => {
//     event.currentTarget.classList.toggle("wishlist-heart-clicked");
//   })
//   }
// )};

// export { clickWishlistHeart };
