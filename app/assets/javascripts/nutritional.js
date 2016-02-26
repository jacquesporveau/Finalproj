$( document ).ready(function() {
  var fruit = $('#fruit').val();
  var veg = $('#veg').val();
  var liquid = $('#liquid').val();
  var seednut = $('#seednut').val();
  var herb = $('#herb').val();
  $.get( "/nutritionaljson?fruit="+fruit+"&veg="+veg+"&liquid="+liquid+"&seednut="+seednut+"&herb="+herb, function( data ) {
    $('#nutritional-label').nutritionLabel(data);
  });
});