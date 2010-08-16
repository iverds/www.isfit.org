// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function validate_field(name, value, field) {
  var postData = { };
  postData['field'] = name;
  postData['value'] = value;
  // Denne må endres på dev for at den skal fungere!
  $.post('/dagingaa/www.isfit.org/admission/positions/validate', postData, function(data) {
      if(data.valid==false) {
      $(field).parent('div').removeClass('field_without_errors');
      $(field).parent('div').addClass('field_with_errors');
      }else{
      $(field).parent('div').removeClass('field_with_errors');
      $(field).parent('div').addClass('field_without_errors');
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


