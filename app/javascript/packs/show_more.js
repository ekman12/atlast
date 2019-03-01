const showMore = () => {
  const moreText = document.querySelectorAll(".show-more-text");
  moreText.forEach((more) => {
    more.addEventListener("click", (event) => {
      event.currentTarget.classList.toggle("hidden");
      console.log(event.currentTarget)
      const showMoreBtn = event.currentTarget
      const postDesc = showMoreBtn.nextElementSibling
      console.log(postDesc)
      postDesc.classList.remove("display-less");
    })
  }
)};

export { showMore };
