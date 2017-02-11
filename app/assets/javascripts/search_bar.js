$(function() {
  $('.SearchBar-indicator').click(function() {
    if ($(this).hasClass('expanded')) {
      $(this).text('▼');
    } else {
      $(this).text('▲');
    }

    $(this).toggleClass('expanded');
    $(this).siblings('.SearchBar-container').slideToggle();
  });
});
