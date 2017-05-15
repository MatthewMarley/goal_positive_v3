/* global $ */
$(document).on('turbolinks:load', function() {
    $('.navbar-brand').fadeTo(2000,1);
    $('.alert').delay(2000).fadeOut(2000);
});