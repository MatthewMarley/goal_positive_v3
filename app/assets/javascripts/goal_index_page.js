/* global $ */
$(document).on('turbolinks:load', function() {
   $(this).find('.goal-index-description').fadeTo(2000, 1);
   $(this).find('.goal-index-username').fadeTo(3000,1);
});


/* $('.goals-index-hover').mouseenter(function() {
   $(this).find('.goal-index-description').fadeTo(1000, 1);
   $(this).find('.goal-index-username').fadeTo(1800,1);
}); */