var scrollIndex = 0;

$(document).ready(function() {
  $(".carousel-left").click(scrollLeft);
  $(".carousel-right").click(scrollRight);
});

function scrollLeft() {
  subtractScrollIndex();

  $(".live-header-container").animate({
    "marginLeft": "+=100vw"
  }, 600);

  postScroll();
}

function scrollRight() {
  scrollIndex = (scrollIndex + 1) % 3;

  $(".live-header-container").animate({
    "marginLeft": "-=100vw"
  }, 600);

  postScroll();
}

function subtractScrollIndex() {
  scrollIndex -= 1;
  if(scrollIndex < 0) scrollIndex = 2;
}