var scrollIndex = 0;

$(document).ready(function() {
  $("#carousel-left").click(scrollLeft);
  $("#carousel-right").click(scrollRight);
  $("#carousel-left").hide();
});

function scrollLeft() {
  if(scrollIndex > 0) {
    subtractScrollIndex();

    $(".live-header-container").animate({
      "marginLeft": "+=100vw"
    }, 600);

    postScroll();
  }
}

function scrollRight() {
  if(scrollIndex < 2) {
    scrollIndex = (scrollIndex + 1) % 3;

    $(".live-header-container").animate({
      "marginLeft": "-=100vw"
    }, 600);

    postScroll();
  }
}

function subtractScrollIndex() {
  scrollIndex -= 1;
  if(scrollIndex < 0) scrollIndex = 2;
}

function postScroll() {
  if(scrollIndex == 0) {
    $("#carousel-left").fadeOut(200);
  } else if(scrollIndex == 2) {
    $("#carousel-right").fadeOut(200);
  } else {
    $("#carousel-left").fadeIn(200);
    $("#carousel-right").fadeIn(200);
  }
}