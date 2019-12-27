
const showMap = () => {
  const mapButton = document.querySelector("#map-button");
  if (mapButton) {
    mapButton.addEventListener("click", (event) => {
      console.log('toggling map show and not map hidden')
      document.querySelector("#mobile-map").classList.toggle("map-show");
      document.querySelector("#not-map").classList.toggle("hidden");
    })
  }
 }

export { showMap };
