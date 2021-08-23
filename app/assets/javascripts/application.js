
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require cocoon
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require jquery
//= require rails-ujs
//= require jquery_ujs
//= require data-confirm-modal
//= require activestorage
//= require chartkick
//= require Chart.bundle
//= require_tree .


/*global jQuery $*/

 $(function() {

      function readURL(input) {
        if (input.files && input.files[0]) {
          var reader = new FileReader();
          reader.onload = function (e) {
            $('#img_prev').attr('src', e.target.result);
          };
          reader.readAsDataURL(input.files[0]);
        }
      }
      $("#procedure_img").change(function() {
        readURL(this);
    });
 });




document.addEventListener("touchstart", function(){}, true);

// サイドメニューのタブ

$(function() {
    $("ul.menu li").hover(
      function() {
        $(".menuSub:not(:animated)", this).slideDown();
      },
      function() {
        $(".menuSub", this).slideUp();
      }
    );
  });


// トップ画面のフェードイン

jQuery(function ($) {
  var fadeIn = $('.fade-in');
  $(window).scroll(function () {
    $(fadeIn).each(function () {
      var offset = $(this).offset().top;
      var scroll = $(window).scrollTop();
      var windowHeight = $(window).height();
      if (scroll > offset - windowHeight + 100) {
        $(this).addClass("scroll-in");
      }
    });
  });
});