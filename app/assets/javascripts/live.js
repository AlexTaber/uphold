var scrollIndex = 0;

$(document).ready(function() {
  $("#carousel-left").click(scrollLeft);
  $("#carousel-right").click(scrollRight);
  $("#carousel-left").hide();
  updateDotColor();
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

  updateDotColor();
}

function updateDotColor() {
  var tarDot = $("#dot-" + String(scrollIndex))
  var dots = $(".fa-circle");
  for(var i = 0; i < dots.length; i++) {
    var curDot = $(dots[i]);

    if(tarDot.attr('id') == curDot.attr('id')) {
      curDot.css("color", "#B7AA6A");
    } else {
      curDot.css("color", "#d5cea9");
    }
  }
}