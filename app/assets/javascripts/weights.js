$(function() {
  $("#weight_value").focus();

  $("#weight_date").datepicker({
   dateFormat: 'yy/mm/dd',
   onClose: function(dateText, inst) { 
        setTimeout(function(){
          $("#weight_value").focus();
        }, 200);
      }
  });
});



