/* global $ */
$(document).on('turbolinks:load', function() {
    $('.navbar-brand').fadeTo(2000,1);
    $('.alert').delay(4000).fadeOut(2000);
    /*$('user-goals-mouse-events div').each(function(i) {
        $(this).attr('id', 'myid_' + i)    
    }); */
    
    $('.user-goals-hover-[i]').mouseenter(function(i) {
        $('.hide-username-[i]').fadeTo(2000,1);
    });
    $('.user-goals-hover').mouseleave(function() {
        $('hide-username').fadeOut(2000);
    });
});


/*<div id="parent">
  <div>child 1</div>
  
$('#parent div').each(function(i) {
   $(this).attr('id', 'myid_' + i);
});


 function changeTo(x) {
    x.style.backgroundColor = "#002C7F";
    x.style.color = "white";
};

function changeBack(x) {
    x.style.backgroundColor = "white";
}; */

//$( "#outer" ).mouseover(function() {