/* global $ */
$(document).on('turbolinks:load', function() {
   $('.goals-index-hover').mouseenter(function() {
      $(this).find('.goal-index-description').fadeTo(500, 1);
      $(this).find('.goal-index-username').fadeTo(500, 1);
   });
});

