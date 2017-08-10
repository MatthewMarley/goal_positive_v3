/* global $ */
$(document).on('turbolinks:load', function() {
   $(this).find('.goal-index-description').fadeTo(1000, 1);
   $(this).find('.goal-index-username').fadeTo(1500,1);
   //$('#goals').append('<%= escape_javascript render(@goals) %>');
   //$('.pagination').replaceWith('<%= escape_javascript will_paginate(@goals) %>');
});

