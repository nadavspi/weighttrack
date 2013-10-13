$(function() {
  $("#weight_value").focus();
  $(".best_in_place").best_in_place();

  $.datepicker.setDefaults({
    dateFormat: 'yy-mm-dd'
  });

  $("#weight_date").datepicker({
   onClose: function(dateText, inst) { 
        setTimeout(function(){
          $("#weight_value").focus();
        }, 200);
      }
  });
});



