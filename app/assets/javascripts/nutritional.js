$( document ).ready(function() {
  $.get( "/nutritionaljson", function( data ) {
    $('#nutritional-label').nutritionLabel(data);
  });
});