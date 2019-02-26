const followChange = () => {
  const follows = document.querySelectorAll("#user-follow-button");
  follows.forEach((follow) => {
    follow.addEventListener("click", (event) => {
    event.currentTarget.innerText = "Followed!";
    })
  }
)};

export { followChange };
