$(document).ready(function() {
  fadeInHeader();
  $(".service").on("mouseenter", serviceEnter);
  $(".service").on("mouseleave", serviceLeave);

  fadeInAboutsIndex = 0;
  $(".home-about").children("p").css({ opacity: 0 });
  $(window).scroll(fadeInAbouts)
});

function fadeInHeader() {
  $(".home-header-container").hide();
  $(".home-header-container").fadeIn(2000);
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
    var targetOffset = $(window).height() * 0.75;
    var target = child.position().top - targetOffset;
    if($(window).scrollTop() > target) {
      console.log("HERE");
      child.animate({
        opacity: 1,
        'marginTop' : "-=12vh"
      }, 1200);
      fadeInAboutsIndex += 1;
    }
  }
}
