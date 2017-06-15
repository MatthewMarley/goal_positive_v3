/* global $ */
$(document).on('turbolinks:load', function() {
    $('.navbar-brand').fadeTo(2000,1);
    $('.alert').delay(4000).fadeOut(2000);
    $("div[class^='user-goals-hover']").mouseenter(function() {
        $("h2[class^='color-light-blue']").animate({fontSize: "32px"});
    });
    //$("div[class^='user-goals-hover']").mouseleave(function() {
    //    $("h2[class^='color-light-blue']").animate({fontSize: "30px"});
    //});
    
    
    
    
    //$("input[name^='user-goals-text-elements']").mouseenter(function() {
    //    $('.hide-username-1').fadeTo(2000, 1);
    //});
});




//$("div[class^='user-goals-hover']").mouseenter(function() {
//    $("h6[class^='h6-hide-username']").fadeTo(2000,1);
//});