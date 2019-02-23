const clickWishlistHeart = () => {
  const wishlistHearts = document.querySelectorAll("#wishlist-heart");
  wishlistHearts.forEach((heart) => {
    heart.addEventListener("click", (event) => {
    event.currentTarget.classList.toggle("wishlist-heart-clicked");
  })
  }
)};

export { clickWishlistHeart };
