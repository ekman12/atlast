// document.querySelector("#tag-selector")

const tagSelector = () => {
  const tagSelectors = document.querySelectorAll('[data-tagid]');
  tagSelectors.forEach((tag) => {
    tag.addEventListener("click", (event) => {
      console.log('hey')
      event.currentTarget.classList.toggle("tag-click");
    })
  }
)};

// export { tagSelector };

// const tagSelector = () => {
//   let tag = document.querySelector('[data-tagid]')
//   tag.addEventListener("click", (event) => {
//     console.log(event.currentTarget);
//     event.currentTarget.classList.toggle("btn-tag");
//   });
// }

export { tagSelector };

// const clickWishlistHeart = () => {
//   const wishlistHeart = document.getElementById("wishlist-heart")
//   wishlistHeart.addEventListener("click", (event) => {
//     event.currentTarget.classList.toggle("wishlist-heart-clicked");
//   });
// };

// export { clickWishlistHeart };
