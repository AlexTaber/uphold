$(document).ready(function() {
  fadeInHeader();
  $(".service").on("mouseenter", serviceEnter);
  $(".service").on("mouseleave", serviceLeave);
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