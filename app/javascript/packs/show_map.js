console.log('map first')
const showMap = () => {
  const mapButton = document.querySelector("#map-button");
  if (mapButton) {
    mapButton.addEventListener("click", (event) => {
      console.log('map js')
      document.querySelector("#map").classList.toggle("map-show");
    })
  }
 }

export { showMap };
