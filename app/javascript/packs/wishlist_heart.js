const clickWishlistHeart = () => {
  const wishlistHeart = document.getElementById("wishlist-heart")
  wishlistHeart.addEventListener("click", (event) => {
    event.currentTarget.classList.toggle("wishlist-heart-clicked");
    console.log("hey!");
  });
};
export { clickWishlistHeart };


// const clickWishlistHeart = () => {
//   // const wishlistHeart = document.getElementById("wishlist-heart")
//   hearts.forEach(

//     )
//   listenToHeart(hearts)
// };

// const getHearts = () => {
//   const hearts = document.querySelector(".wishlist-heart")
// };

// const listenToHeart = (item) =>{
//   item.addEventListener("click", (event) => {
//     event.currentTarget.classList.toggle("wishlist-heart-clicked");
//   });
// }

// export { clickWishlistHeart };

