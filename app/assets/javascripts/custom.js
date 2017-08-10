/* global $ */
$(document).on('turbolinks:load', function() {
    $('.navbar-brand').fadeTo(2000, 1);
    $('.alert').delay(4000).fadeOut(2000);
    if ($('.pagination').length) {
        $(window).scroll(function() {
            var url = $('.pagination .next_page').attr('href');
            if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
                $('.pagination').text("Please Wait...");
                return $.getScript(url);
            }
        });
        return $(window).scroll();
    }
});
