const showTags = () => {
  const filterButton = document.querySelector("#show-filters");
    // filterButton.classList.toggle("hidden")
    filterButton.addEventListener("click", (event) => {
    event.currentTarget.classList.toggle("hidden");
    const tagFilters = document.querySelector(".tag-filters");
    tagFilters.classList.toggle("hidden");
    })
 }

export { showTags };


//   follows.forEach((follow) => {
//     follow.addEventListener("click", (event) => {
//     event.currentTarget.innerText = "Followed!";
//     })
//   }
// )};

// export { followChange };
