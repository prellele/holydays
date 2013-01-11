function toggle_holiday(element) {
  var datearray = element.data("date").split('-');
  $.post('/events/toggle_holiday', {"event":{"start_at(1i)": datearray[0],"start_at(2i)": datearray[1],"start_at(3i)": datearray[2]}}); 
  setTimeout(function() {window.location.reload();},500);
}