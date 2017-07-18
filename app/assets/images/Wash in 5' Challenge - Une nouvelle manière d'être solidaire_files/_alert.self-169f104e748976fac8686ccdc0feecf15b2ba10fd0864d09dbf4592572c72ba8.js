$( document ).ready(function() {
  $(".alert-info").fadeTo(1500, 500).slideUp(500, function(){
      $(".alert-info").slideUp(500);
  });
  $(".alert-warning").fadeTo(1500, 500).slideUp(500, function(){
      $(".alert-warning").slideUp(500);
  });
});
