/* global $ */
$(document).on('turbolinks:load', function() {
    $('.user-show-titles').fadeTo(2000, 1);
    $('.user-goals-text-elements').mouseenter(function() {
       $(this).find('.user-goals-description').fadeTo(1000,1); 
    });
});


//$("#tour").on('click', 'button', function() { 
    
    
