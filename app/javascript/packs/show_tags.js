const showTags = () => {
  const filterButton = document.querySelector("#show-filters");
  if(filterButton) {
    filterButton.addEventListener("click", (event) => {
    event.currentTarget.classList.toggle("pink-filter");
    event.currentTarget.classList.toggle("grey-filter");
    const tagFilters = document.querySelector(".tag-filters");
    tagFilters.classList.toggle("hidden");
    })
  }
 }

export { showTags };
