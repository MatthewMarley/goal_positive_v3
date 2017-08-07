/* global $ */
$(document).on('turbolinks:load', function() {
    $('.plz').click(function() {
        $('.slider-home').stop().animate({
            width: $('.home-page-explore').width()
        }, 500);
    }, function() {
        $('.slider-home').stop().animate({
            width: 0
        }, 500);
    });
});

/* $('.plz').click(function() {
    $('.slider-home').stop().animate({
        width: $('.home-page-explore').width()
    }, 500);
}); */