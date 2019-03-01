
const initPhotoPreview = () => {
  const previewPhoto = (e) => {
    const photo = e.currentTarget.files[0]; // access the photo url that's being uploaded
    const reader = new FileReader(); // create the filereader

    reader.onload = function(e) {
      console.log(e.target.result)
      const hiddenImage = document.querySelector("img.hidden")

      hiddenImage.setAttribute('src', e.target.result)
      hiddenImage.classList.remove('hidden')

      const photoButton = document.querySelector(".add-photo-box");
      photoButton.classList.toggle('hidden');
    }

    console.log(photo)
    reader.readAsDataURL(photo);
  }

  const postPhoto = document.querySelector('#post_photo');
  postPhoto.addEventListener('change', previewPhoto); // #1
}

// if post-photo-preview is null, don't allow them to click the button
const checkForPhoto = () => {
  let photo = document.querySelector(".post-photo-preview");
  let button =  document.querySelector("#post-entry")

  button.addEventListener('click', (event) => {
    if (photo.src == "http://localhost:3000/posts") {
        if (document.querySelector('.invalid-photo')) {
          document.querySelector('.invalid-photo').remove();
        }
        photo.insertAdjacentHTML('afterend', "<p class=\"invalid-photo\">upload a photo asshole</p>")
        event.preventDefault();
    } else {
        document.querySelector('.invalid-photo').remove();
    }
  })
}


export { initPhotoPreview, checkForPhoto }

// const photoButton = document.querySelector(".add-photo-box");
// photoButton.classList.toggle('hidden');



