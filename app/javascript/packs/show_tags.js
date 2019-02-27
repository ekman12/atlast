const showTags = () => {
  const filterButton = document.querySelector("#show-filters");
  if(filterButton) {
    filterButton.addEventListener("click", (event) => {
    event.currentTarget.classList.toggle("hidden");
    const tagFilters = document.querySelector(".tag-filters");
    tagFilters.classList.toggle("hidden");
    })
  }
 }

export { showTags };
