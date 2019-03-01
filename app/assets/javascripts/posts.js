$(document).on('turbolinks:load', function() {
  var $input = $('#search_form')
  $input.keyup(function (e) { 
    $('.post').show();
    if ($input.val().length >= 3) {
      $('.post_title').filter(function () {
        return (!$(this).text().includes($input.val()))
      }).parent().hide()
    }
  });
});