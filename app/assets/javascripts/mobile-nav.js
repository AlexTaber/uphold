$(document).ready(function() {
  $("#mobile-nav-menu").click(toggleMobileNav);
  $(".mobile-dropdown").click(toggleDropdown).children().click(function(e) {
    return false;
  });;
});

function toggleMobileNav(e) {
  $(".mobile-nav-items").slideToggle(200);
}

function toggleDropdown(e) {
  $(".mobile-nav-services").slideToggle(200);
}