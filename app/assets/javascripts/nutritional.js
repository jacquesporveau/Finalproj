$( document ).ready(function() {

  var fruit = $('#fruit').val();
  var veg = $('#veg').val();
  var liquid = $('#liquid').val();
  var seednut = $('#seednut').val();
  var herb = $('#herb').val();

  if (fruit == "") {
    fruit = "default";
  }

  if (veg == "") {
    veg = "default";
  }

  if (liquid == "") {
    liquid = "default";
  }

  if (seednut == "") {
    seednut = "default";
  }

  if (herb == "") {
    herb = "default";
  }

  $.get( "/nutritionaljson?fruit="+fruit+"&veg="+veg+"&liquid="+liquid+"&seednut="+seednut+"&herb="+herb, function( data ) {
    $('#nutritional-label').nutritionLabel(data);
  });
});