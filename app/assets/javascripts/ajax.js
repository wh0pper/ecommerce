//= require jquery

$(document).ready(function(){
  $("input[type=submit]").on('click', function(event) {
    event.preventDefault();

    var form = $(this).parent('form');

    $.ajax({
      type: "PATCH",
      url: form.attr('action'),
      data: form.serialize(),
      success: function(returned_data) {
        console.log("quantity updated to " + returned_data.quantity);
        $('span#' + returned_data.id).html(returned_data.quantity)
      },
      error: function(returned_data) {
        console.log('error:' + returned_data.status);
      },
      dataType: 'JSON'
    });
  });
});
