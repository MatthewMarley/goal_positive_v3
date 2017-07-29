/* global $ */
$(document).on('turbolinks:load', function() {
    $('.about-para-5').fadeTo(1000, 1);
    $(function() {
       $(window).scroll(function() {
           if($(this).scrollTop() + 1000 >= $('.about-overview').offset().top) {
               $('.about-overview').fadeTo(1000, 1);
           }
           $('.about-create').mouseenter(function() {
               $('.slider').animate({
                   width: $('.h3-about-create').width()
               }, 1000);
           });
           
           
           
           
          
       }); 
    });
});    