const tagSelector = () => {
  const tagSelectors = document.querySelectorAll('[data-tagid]');
  tagSelectors.forEach((tag) => {
    tag.addEventListener("click", (event) => {
      event.currentTarget.classList.toggle("tag-click");
    })
  }
)};

export { tagSelector };
