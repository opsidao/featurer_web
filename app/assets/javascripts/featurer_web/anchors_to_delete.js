$(document).ready(function() {
  $("a[data-method=delete]").on('click', function(e) {
    e.preventDefault();

    if (confirm("Are you sure?") == true) {
      theElement = $(this);

      $.ajax({
        url: $(this).attr("href"),
        type: "DELETE",
        success: function() {
          row = theElement.closest("tr");
          row.fadeOut(400, function() {
            row.remove();
          });
        }
      });
    }
  });
});
