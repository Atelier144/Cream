// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import 'bootstrap';
import '../stylesheets/application';
import "@fortawesome/fontawesome-free/js/all"

$(document).ready(function () {
    $("header .hamburger").click(function () {
        if ($(this).hasClass("open")) {
            $(this).html('<i class="fas fa-bars"><i>');
            $(this).removeClass("open");
            $("header .pulldown-menu").slideUp();
        } else {
            $(this).addClass("open");
            $(this).html('<i class="fas fa-times"><i>');
            $("header .pulldown-menu").slideDown();
        }
    })
})
