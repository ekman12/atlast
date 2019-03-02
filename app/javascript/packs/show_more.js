// const showMore = () => {
//   const moreText = document.querySelectorAll(".show-more-text");
//   moreText.forEach((more) => {
//     more.addEventListener("click", (event) => {
//       event.currentTarget.classList.toggle("hidden");
//       console.log(event.currentTarget)
//       const showMoreBtn = event.currentTarget
//       const postDesc = showMoreBtn.nextElementSibling
//       console.log(postDesc)
//       postDesc.classList.remove("display-less");
//     })
//   }
// )};

// export { showMore };


// const moreText = document.querySelectorAll(".show-more-text");


// moreText[3].getAttribute("data-post-id");


const showMore = () => {
  const moreText = document.querySelectorAll(".show-more-text");
  moreText.forEach((more) => {
    more.addEventListener("click", (event) => {
      const showBtn = event.currentTarget;
      const postId = showBtn.getAttribute("data-post-id");
      showBtn.classList.toggle("hidden");
      const postNote = document.querySelector(`.display-less[data-post-id="${postId}"]`);
      postNote.classList.remove("display-less");
    })
  }
)};

export { showMore };
