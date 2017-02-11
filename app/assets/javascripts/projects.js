// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
jQuery(function() {
  return $('#project_location_name').autocomplete({
    source: $('#project_location_name').data('autocomplete-source')
  });
});
