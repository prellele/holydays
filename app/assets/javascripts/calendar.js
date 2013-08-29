$(document).ready(function(){
  $(".ec-day-header").on("click", function () {
     var date = $(this).data("date");
     var spDate = date.split('-');

     $("#event_start_at_1i option").filter(function() {
       return $(this).text() == spDate[0]; 
     }).prop('selected', true);
     $("#event_start_at_2i option").filter(function() {
       return $(this).text() == spDate[1]; 
     }).prop('selected', true);
     $("#event_start_at_3i option").filter(function() {
       return $(this).text() == spDate[2]; 
     }).prop('selected', true);

     $("#event_end_at_1i option").filter(function() {
       return $(this).text() == spDate[0];
     }).prop('selected', true);
     $("#event_end_at_2i option").filter(function() {
       return $(this).text() == spDate[1];
     }).prop('selected', true);
     $("#event_end_at_3i option").filter(function() {
       return $(this).text() == spDate[2]; 
     }).prop('selected', true);

     $('#addEventDialog').modal('toggle');
  });
});
