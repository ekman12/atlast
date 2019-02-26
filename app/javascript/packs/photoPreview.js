// NOT BEING USED AT THE MOMENT


// const photoUpload = () => {
//   const photoButton = document.querySelector("#photo-upload");
//   photoButton.addEventListener("click", (event) => {
//     console.log("Hey!!");
//     // event.currentTarget.innerText = "Followed!";
//     document.querySelector(".photo-button").innerText = "Followed!";
//   })
// };

// export { photoUpload };
//     // document.querySelector("#show-filters").classList.toggle("hidden");

const initPhotoPreview = () => {
  const previewPhoto = (e) => {
    const photo = e.currentTarget.files[0]; // access the photo url that's being uploaded
    const reader = new FileReader(); // create the filereader

    reader.onload = function(e) {
      console.log(e.target.result)
      const hiddenImage = document.querySelector("img.hidden")

      hiddenImage.setAttribute('src', e.target.result)
      hiddenImage.classList.remove('hidden')
    }

    console.log(photo)
    reader.readAsDataURL(photo);
  }

  const postPhoto = document.querySelector('#post_photo');
  postPhoto.addEventListener('change', previewPhoto); // #1
}

export { initPhotoPreview }



