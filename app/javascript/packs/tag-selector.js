const tagSelector = () => {
  const tagSelectors = document.querySelectorAll('[data-tagid]');
  tagSelectors.forEach((tag) => {
    tag.addEventListener("click", (event) => {
      console.log('hey')
      event.currentTarget.classList.toggle("tag-click");
    })
  }
)};

export { tagSelector };
