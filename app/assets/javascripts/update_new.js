/* global $ */
$(document).on('turbolinks:load', function() {
    $('.new-update-form').fadeTo(1000, 1); 
    $('#new-update-character-field').on("keyup", function() {
        var length = $(this).val().length;
        $('#new-update-character-counter').html(length + '/200');
    });
});