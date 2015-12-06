$(document).ready(function() {
  $("#mobile-nav-menu").click(toggleMobileNav);
  $(".mobile-dropdown").click(toggleDropdown);
});

function toggleMobileNav(e) {
  $(".mobile-nav-items").slideToggle(200);
}

function toggleDropdown(e) {
  if(this == e.target) {
    $(".mobile-nav-services").slideToggle(200);
  }
}