$(document).ready(function(){
  $('.ec-day-header').click(function(){
    toggle_holiday($(this));
  });
  $('.category-1').each(function() {
    var userid = 0;
    $('#logout').each(function(){
      userid = $(this).data("user");
    });
    if ($(this).data("user") == userid)
    {
      $(this).css("background-color", "green")
    }
  });    

});