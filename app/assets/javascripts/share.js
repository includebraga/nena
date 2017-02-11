$(function() {
  $('.social-share-button a').click(function() {
    var projectId = $('body').data('id');

    $.ajax({
      type: "POST",
      url: "/share",
      data: { project_id: projectId }
    });
  });
});
