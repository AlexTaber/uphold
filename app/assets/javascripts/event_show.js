var venueFade = false;
var target;
var targetTop;

$(document).ready(function() {
  target = $("#venue-container");

  $("#event-header-content-" + String(scrollIndex)).hide();
  $("#event-header-content-" + String(scrollIndex)).fadeIn(2000);

  if(target.length > 0) {
    targetTop = target.position().top;
    setTimeout(fadeInVenue, 400);
  }

  //button scrolls
  $("#bands-button").click(bandsScroll);
  $("#venue-button").click(venueScroll);
});

function fadeInVenue() {
  if(!venueFade) {
    var targetOffset = $(window).height() * 0.65;
    var targetHeight = targetTop - targetOffset;
    if($(window).scrollTop() > targetHeight) {
      target.animate({
        opacity: 1
      }, 1600);
      venueFade = true;
    } else {
      setTimeout(function() { fadeInVenue(target, targetTop) }, 400);
    }
  }
}

function bandsScroll() {
  var myTarget = $("#bands-container");
  var offset = $(window).height() * 0.1;
  scrollToEl(myTarget, offset);
}

function venueScroll() {
  var myTarget = $("#venue-container");
  var offset = $(window).height() * 0.1;
  scrollToEl(myTarget, offset);
}

function scrollToEl(myTarget, offset) {
  console.log("HERE");
  $('html, body').animate({
      scrollTop: myTarget.offset().top - offset
  }, 1200);
}