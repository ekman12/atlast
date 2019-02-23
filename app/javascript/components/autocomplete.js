function autocomplete() {

  document.addEventListener("DOMContentLoaded", function() {
    var post_address = document.getElementById('post_place');
    if (post_address) {
      var autocomplete = new google.maps.places.Autocomplete(post_address, { types: [ 'establishment' ] });
      google.maps.event.addDomListener(post_address, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      }
      );
    }
  });
}

export { autocomplete };
