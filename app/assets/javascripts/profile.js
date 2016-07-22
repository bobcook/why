$(document).on('keyup','.count_length',function(){
  var length = 100 - $(this).val().length;
  $('.char-length').html(length);
});
$(document).on('click','.change_image',function(){
  $("#profile_image").click();
});

function showimagepreview(input) {
  if (input.files && input.files[0]) {
    var filerdr = new FileReader();
    filerdr.onload = function(e) {
      img = e.target.result;
      div = $('.img-preview')
      div.css({
        "background-image": "url("+img+")",
      });
    }
    
    filerdr.readAsDataURL(input.files[0]);
  }
}