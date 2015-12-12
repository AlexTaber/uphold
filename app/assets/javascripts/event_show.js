var venueFade = false;

$(document).ready(function() {
  $("#event-header-content-" + String(scrollIndex)).hide();
  $("#event-header-content-" + String(scrollIndex)).fadeIn(2000);

  var target = $(".venue-container");
  if(target.length > 0) {
    setInterval(function() { fadeInVenue(target) }, 400);
  }

  //button scrolls
  $("#bands-button").click(bandsScroll);
  $("#venue-button").click(venueScroll);
});

function fadeInVenue(child) {
  if(!venueFade) {
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

function bandsScroll() {
  var target = $(".bands-container");
  var offset = $(window).height() * 0.1;
  scrollToEl(target, offset);
}

function venueScroll() {
  var target = $(".venue-container");
  var offset = $(window).height() * 0.1;
  scrollToEl(target, offset);
}

function scrollToEl(target, offset) {
  console.log("HERE");
  $('html, body').animate({
      scrollTop: target.offset().top - offset
  }, 1200);
}