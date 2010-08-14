// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function validate_field(name, value, field) {
  var postData = { };
  postData['field'] = name;
  postData['value'] = value;
  // Denne må endres på dev for at den skal fungere!
  $.post('/admission/position/validate', postData, function(data) {
      if(data.valid==false) {
      $(field).parent('div').removeClass('fieldWithoutErrors');
      $(field).parent('div').addClass('fieldWithErrors');
      }else{
      $(field).parent('div').removeClass('fieldWithErrors');
      $(field).parent('div').addClass('fieldWithoutErrors');
      }                                                        
      }, 'json');        
}


var delay = (function(){
    var timer = 0;
    return function(callback, ms){
    clearTimeout (timer);
    timer = setTimeout(callback, ms);
    };
    })();

Array.prototype.in_array = function(p_val) {
  for(var i = 0, l = this.length; i < l; i++) {
    if(this[i] == p_val) {
      return true;
    }
  }
  return false;
}

$(document).ajaxSend(function(event, request, settings) {
    if (typeof(AUTH_TOKEN) == "undefined") return;
    settings.data = settings.data || "";
    settings.data += (settings.data ? "&" : "") + "authenticity_token=" + encodeURIComponent(AUTH_TOKEN);
    });


$(document).ready(function() {

    $("#contact_name").keyup(function() {
      delay(function() {
        var name = $("#contact_name").val();
        validate_field('name', name, $("#contact_name") );
        }, 600);
      });

    $("#contact_email").keyup(function() {
      delay(function() {
        var email = $("#contact_email").val();
        validate_field('email', email, $("#contact_email") );
        }, 600);
      });

    });

