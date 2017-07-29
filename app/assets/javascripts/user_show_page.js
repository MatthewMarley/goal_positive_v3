/* global $ */
$(document).on('turbolinks:load', function() {
    $('.user-show-titles').fadeTo(2000, 1);
    $('.user-goals-text-elements').mouseenter(function() {
       $(this).find('.user-goals-description').fadeTo(500,1); 
    });
    $(function() {
       $(window).scroll(function() {
           var nodelist = document.getElementsByTagName("p").length;
           var paraClassName = [];
           for (var i = 0; i < nodelist; i++) {
               paraClassName[i] = '.about-para-' + [i+1];
               if($(this).scrollTop() + 1000 >= $(paraClassName[i]).offset().top) {
                   $(paraClassName[i]).fadeTo(1000, 1);
               }
           }
       }); 
    });
});


    
    
