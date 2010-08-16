$(document).ready(function() {
    $("#applicant_firstname").keyup(function() {
        delay(function() {
          var firstname = $("#applicant_firstname").val();
          validate_field('firstname', firstname, $("#applicant_firstname"));
        }, 600);
    });
    $("#applicant_phone").keyup(function() {
        delay(function() {
          var phone = $("#applicant_phone").val();
          validate_field('phone', phone, $("#applicant_phone"));
        }, 600);
    });
    $("#applicant_lastname").keyup(function() {
        delay(function() {
          var lastname = $("#applicant_lastname").val();
          validate_field('lastname', lastname, $("#applicant_lastname"));
        }, 600);
    });
    $("#applicant_mail").keyup(function() {
        delay(function() {
          var lastname = $("#applicant_mail").val();
          validate_field('mail', lastname, $("#applicant_mail"));
        }, 600);
    });
    $("#applicant_position_id_1").keyup(function() {
        delay(function() {
          var lastname = $("#applicant_position_id_1").val();
          validate_field('position_id_1', lastname, $("#applicant_position_id_1"));
        }, 600);
    });
});
