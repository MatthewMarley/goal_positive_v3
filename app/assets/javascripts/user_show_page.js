/* global $ */
$(document).on('turbolinks:load', function() {
    $('.user-show-titles').fadeTo(2000, 1);
    $('.user-goals-text-elements').mouseenter(function() {
       $(this).find('.user-goals-description').fadeTo(500,1); 
    });
});


    
    

