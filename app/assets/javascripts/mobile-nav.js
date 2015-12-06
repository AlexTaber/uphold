$(document).ready(function() {
  $("#mobile-nav-menu").click(toggleMobileNav)
});

function toggleMobileNav(e) {
  $(".mobile-nav-items").slideToggle(200);
}