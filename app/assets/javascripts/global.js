var lastScroll = 0;
var relativeFadeArr = [];
var isUpdated = true;
var windowHeight = $(window).height();
// var is_safari = navigator.userAgent.indexOf("Safari") > -1;
// var is_chrome = navigator.userAgent.indexOf('Chrome') > -1;
// if ((is_chrome)&&(is_safari)) {is_safari=false;}

$(document).ready(function() {
  var targets = $(".relative-fade");
  if(targets.length > 0) {
    setUpRelativeFadeArr(targets);
    setTimeout(function() { relativeFade(targets) }, 30);
  }
});

function relativeFade(targets) {
  var curScroll = $(window).scrollTop();
  if(curScroll != lastScroll) {
    for(var i = 0; i < relativeFadeArr.length; i++) {
      var tarHeight = relativeFadeArr[i].tar_height;
      var targetMiddle = relativeFadeArr[i].middle;
      var screenMiddle = curScroll + (windowHeight * 0.5);
      var tarSize = (tarHeight * 0.5) + ((windowHeight * 0.5) * 0.8)
      var amt = tarSize - Math.abs(screenMiddle - targetMiddle);
      var opacity = Math.min(Math.max(0, amt/tarSize), 1);
      if(opacity > 0) {
        relativeFadeArr[i].selector.css({
          "opacity": opacity * 1.25
        });
      }
    }
    lastScroll = curScroll;
    isUpdated = false;
  } else if(!isUpdated) {
    updateRelativeFadeVars();
    isUpdated = true;
  }

  setTimeout(function() { relativeFade(targets) }, 30);
}

function updateRelativeFadeVars() {
  windowHeight = $(window).height();
  updateRelativeFadeArr();
}

function setUpRelativeFadeArr(targets) {
  for(var i = 0; i < targets.length; i++) {
    var tar = $(targets[i]);
    relativeFadeArr[i] = {
      selector: tar,
      tar_height: tar.height(),
      middle: tar.position().top + (tar.height() * 0.5)
    }
  }
}

function updateRelativeFadeArr() {
  for(var i = 0; i < relativeFadeArr.length; i++) {
    tar = relativeFadeArr[i];
    tar.tar_height = tar.selector.height();
    tar.middle = tar.selector.position().top + (tar.tar_height * 0.5);
    console.log(tar);
  }
}