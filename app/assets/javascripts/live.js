var scrollIndex = 0;
var maxIndex = 3;

$(document).ready(function() {
  maxIndex = Math.min(parseInt($("#scroll-index").attr("data-scrollIndex")), maxIndex);
  console.log(maxIndex);
  $("#carousel-left").click(scrollLeft);
  $("#carousel-right").click(scrollRight);
  postScroll();

  $(".fa-circle").click(dotScroll);
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
  if(scrollIndex < maxIndex - 1) {
    scrollIndex = (scrollIndex + 1) % maxIndex;

    $(".live-header-container").animate({
      "marginLeft": "-=100vw"
    }, 680);

    postScroll();
  }
}

function subtractScrollIndex() {
  scrollIndex -= 1;
  if(scrollIndex < 0) scrollIndex = maxIndex - 1;
}

function postScroll() {
  $("#carousel-right").fadeIn(200);
  $("#carousel-left").fadeIn(200);
  if(scrollIndex == 0) {
    $("#carousel-left").fadeOut(200);
  }

  if(scrollIndex == maxIndex - 1) {
    $("#carousel-right").fadeOut(200);
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

function dotScroll(e) {
  var dot = $(e.target);
  var id = dot.attr('id');
  var index = id[id.length - 1];
  var scrollAmount = String((scrollIndex - index) * 100) + "vw";
  console.log(scrollAmount);

  $(".live-header-container").animate({
    "marginLeft": "+=" + scrollAmount
  }, 680);

  scrollIndex = index;
  postScroll();
}