$(document).ready(function() {
  var targets = $(".relative-fade");
  if(targets.length > 0) {
    setInterval(function() { relativeFade(targets) }, 30);
  }
});

function relativeFade(targets) {
  for(var i = 0; i < targets.length; i++) {
    var tar = $(targets[i]);
    var windowHeight = $(window).height();
    var tarHeight = tar.height();
    var screenMiddle = $(window).scrollTop() + (windowHeight * 0.5);
    var targetMiddle = tar.position().top + (tarHeight * 0.5);
    var tarSize = (tarHeight * 0.5) + ((windowHeight * 0.5) * 0.8)
    var amt = tarSize - Math.abs(screenMiddle - targetMiddle);
    var opacity = Math.min(Math.max(0, amt/tarSize), 1)
    tar.css({
      "opacity": opacity * 1.25
    });
  }
}