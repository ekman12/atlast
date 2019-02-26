const hideTags = () => {
  const filterButton = document.querySelector("#hide-filters");
    filterButton.addEventListener("click", (event) => {
    document.querySelector(".tag-filters").classList.toggle("hidden");
    document.querySelector("#show-filters").classList.toggle("hidden");
    })
 }

export { hideTags };
