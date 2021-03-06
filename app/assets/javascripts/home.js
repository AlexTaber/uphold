var fadeInAboutsIndex = 0;
var scrollPosition = 0;

$(document).ready(function() {
  fadeInHeader();
  $(".service").on("mouseenter", serviceEnter);
  $(".service").on("mouseleave", serviceLeave);

  setTimeout(checkScroll, 200);
});

function fadeInHeader() {
  $(".home-header-container").hide();
  $(".home-header-container").fadeIn(1200);
  $(".home-header-logo").animate({
    "height": "44vh",
    "marginTop": "+=2vh"
  }, 1200);
}

function serviceEnter(e) {
  var tar = $(this).children().first();
  tar.animate({
    'marginTop' : "-=3vh"
  }, 200);
  $(this).children(".service-text").hide().fadeIn(200);
}

function serviceLeave(e) {
  var tar = $(this).children().first();
  tar.animate({
    'marginTop' : "+=3vh"
  }, 200);
  $(this).children(".service-text").show().fadeOut(200);
};

function fadeInAbouts() {
  var children = $(".home-about").children("p");
  for(var i = fadeInAboutsIndex; i < children.length; i++) {
    var child = $(children[i]);
    var targetOffset = $(window).height() * 0.65;
    var target = child.position().top - targetOffset;
    if($(window).scrollTop() > target) {
      child.animate({
        'marginTop' : "-=12vh"
      }, 1000);
      fadeInAboutsIndex += 1;
    }
  }
}

function didScroll() {
  return scrollPosition != $(window).scrollTop();
}

function checkScroll() {
  if(didScroll) {
      fadeInAbouts();
  }
  setTimeout(checkScroll, 200);
}