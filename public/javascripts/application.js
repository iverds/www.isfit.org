// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


$(document).ready(function () {
    $('#confirmDialog input:eq(0)').click(function (e) {
      e.preventDefault();

      // example of calling the confirm function
      // you must use a callback function to perform the "yes" action
      confirm("Continue to the SimpleModal Project page?", function () {
        window.location.href = 'http://www.ericmmartin.com/projects/simplemodal/';
        });
      });
    });

function confirm(message, callback) {
  $('#confirm').modal({
close:false, 
overlayId:'confirmModalOverlay',
containerId:'confirmModalContainer', 
onShow: function (dialog) {
dialog.data.find('.message').append(message);

// if the user clicks "yes"
dialog.data.find('.yes').click(function () {
  // call the callback
  if ($.isFunction(callback)) {
  callback.apply();
  }
  // close the dialog
  $.modal.close();
  });
}
});
}

