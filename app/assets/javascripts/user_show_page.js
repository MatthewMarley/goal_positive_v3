/* global $ */
$(document).on('turbolinks:load', function() {
    $('.user-show-titles').fadeTo(2000, 1);
    $('.user-goals-hover').mouseenter(function() {
       $(this).find('.user-goals-description').fadeTo(500,1);
       $(this).find('.user-goals-username').fadeTo(500, 1);
    });
});


    
    

