$(function() {
  $("#weight_value").focus();
  $(".best_in_place").best_in_place();
  $("#weight_date").datepicker({
   dateFormat: 'yy/mm/dd',
   onClose: function(dateText, inst) { 
        setTimeout(function(){
          $("#weight_value").focus();
        }, 200);
      }
  });
});



