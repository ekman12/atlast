const hideTags = () => {
  const filterButton = document.querySelector("#hide-filters");
  if (filterButton) {
    filterButton.addEventListener("click", (event) => {
    document.querySelector(".tag-filters").classList.toggle("hidden");
    document.querySelector("#show-filters").classList.toggle("hidden");
    })
  }
 }

export { hideTags };
