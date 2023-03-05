$(document).on('turbolinks:load', function() {
  $('#page-top').on('click', function(event) {
    event.preventDefault();
    $('html, body').animate({scrollTop: 0}, 900);
  });
});