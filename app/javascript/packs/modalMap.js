const mapInModal = () => {
  let mapModal = document.querySelector(".map-modal")
  let map =  document.querySelector("#map")
  let mapButton = document.querySelector(".map-button")
  if (mapButton){
      mapButton.addEventListener("click", function(){
      map.style.width = "375px"
      map.style.height = "815px"
  })
  }
}

export { mapInModal }
