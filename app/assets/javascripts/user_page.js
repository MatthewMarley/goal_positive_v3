/* global $ */
$(document).on('turbolinks:load', function() {
    $('.user-goals-description').mouseenter(function() {
        $(this).fadeTo(1000,1);
    });
    $('.user-goals-hover-total').mouseenter(function() {
       $(this).find('h4').fadeTo(1000,1); 
    });
});


//$('#examples p').hide();

//$( this ).find( 'li.target' ).css("border", "3px double red");

//Short-hand for find: $('li.target',this);