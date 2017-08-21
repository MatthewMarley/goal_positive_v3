/* global $ */
$(document).on('turbolinks:load', function() {
    $('.login-form').fadeTo(1000, 1); 
    $('#character-field').on("keyup", function() {
        var length = $(this).val().length;
        $('#character-counter').html(length + '/50');
    });
});