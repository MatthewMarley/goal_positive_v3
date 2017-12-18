/* global $ */
$(document).on('turbolinks:load', function() {
    //$('.about-para-5').fadeTo(8000, 1);
    $(function() {
       $(window).scroll(function() {
           if($(this).scrollTop() + 1000 >= $('.about-overview').offset().top) {
               $('.about-overview').fadeTo(1000, 1);
           }
           // Add border and underline on hover. Use stop() to stop animations building up
           $('.about-create').hover(function() {
               $('.slider-create').stop().animate({
                   width: $('.h3-about-create').width()
               }, 500);
           }, function() {
               $('.slider-create').stop().animate({
                   width: 0
               }, 500);
           });
           
           $('.about-share').hover(function() {
               $('.slider-share').stop().animate({
                   width: $('.h3-about-share').width()
               }, 500);
           }, function() {
               $('.slider-share').stop().animate({
                   width: 0
               }, 500);
           });
           
           $('.about-help').hover(function() {
               $('.slider-help').stop().animate({
                   width: $('.h3-about-help').width()
               }, 500);
           }, function() {
               $('.slider-help').stop().animate({
                   width: 0
               }, 500);
           });
           
           $('.about-inspire').hover(function() {
               $('.slider-inspire').stop().animate({
                   width: $('.h3-about-inspire').width()
               }, 500);
           }, function() {
               $('.slider-inspire').stop().animate({
                   width: 0
               }, 500);
           });
           
           $('.about-understand').hover(function() {
               $('.slider-understand').stop().animate({
                   width: $('.h3-about-understand').width()
               }, 500);
           }, function() {
               $('.slider-understand').stop().animate({
                   width: 0
               }, 500);
           });
       }); 
    });
});    