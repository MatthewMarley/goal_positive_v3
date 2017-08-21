/* global $ */
$(document).on('turbolinks:load', function() {
    $('.signup-form').fadeTo(1000, 1);
    $('#signup-form-character-field').on("keyup", function() {
        var length = $(this).val().length;
        $('#signup-form-character-counter').html(length + '/25');
    });
});