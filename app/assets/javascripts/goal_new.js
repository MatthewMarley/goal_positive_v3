/* global $ */
$(document).on('turbolinks:load', function() {
    $('.new-goal-form').fadeTo(1000, 1);
    $('#new-goal-character-field').on("keyup", function() {
        var length = $(this).val().length;
        $('#new-goal-character-counter').html(length + '/50');
    });
});