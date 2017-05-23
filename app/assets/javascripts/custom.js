/* global $ */
$(document).on('turbolinks:load', function() {
    $('.navbar-brand').fadeTo(2000,1);
    $('.alert').delay(4000).fadeOut(2000);
});