var venueFade = false;

$(document).ready(function() {
  $("#event-header-content-" + String(scrollIndex)).hide();
  $("#event-header-content-" + String(scrollIndex)).fadeIn(2000);

  setInterval(fadeInVenue, 400);
});

function fadeInVenue() {
  if(!venueFade) {
    var child = $(".venue-container");
    var targetOffset = $(window).height() * 0.65;
    var target = child.position().top - targetOffset;
    if($(window).scrollTop() > target) {
      child.animate({
        opacity: 1
      }, 1600);
      venueFade = true;
    }
  }
}