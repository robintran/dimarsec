$(document).ready(function () {
  $(".popups").click(function(){
      $('#zoomContainer01').css({width:$(document).width(), height:$(document).height()}).show();
      $(".lightBox").css("left",($(document).width()/2)-200);
      $(".lightBox").fadeIn();
    });

  $('#zoomContainer01').click(function () {
    $('#zoomContainer01').fadeOut();
    $(".alert-form").fadeOut();
    return false;
  });

  $('.alert-form').click(function () {
    $('#zoomContainer01').fadeOut();
    $(".alert-form").fadeOut();
    return false;
  });

  $(window).resize(function() {
     if (!$('#zoomContainer01').is(':hidden')){
       $('#zoomContainer01').css({width:$(document).width(), height:$(document).height()}).show();
     };
  });
});