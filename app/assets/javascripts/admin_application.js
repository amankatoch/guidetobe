//= require jquery
//= require jquery_ujs
//= require foundation
//= require redactor

// ad photo uploads
function onAdImageUpload(event) {
  console.log('image added');
  var logo_block = $('.logo_block');
  logo_block.fadeIn(400).css('background-image', 'url(' + event.fpfile.url + ')');
  $('.upload_button').text('Change image');
}

$(function(){
  // init foundation
  $(document).foundation();

  // focus on the username in the login form
  $('input#username').focus();

  // editor for posts
  $('#post_body').redactor();

  $("#file-upload-btn").change(function(){
    var file_name = $("#file-upload-btn").val();
    var extract_name = file_name.replace(/^.*[\\\/]/, '');
    if(file_name) {
      $("#file-name").text(extract_name);
      $(".import-btn").show();
    }
    else {
      $(".import-btn").hide();
      $("#file-name").text(""); 
    }
  });

});