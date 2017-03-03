// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(document).on('turbolinks:load', function(){

    setTimeout(function () {
        $('#notice, #alert').delay(5000).fadeOut()
    });

    $(window).scroll(function () {
        if ($(document).scrollTop() > 20) {
            $('nav').addClass('shrink');
        } else {
            $('nav').removeClass('shrink');
        }
    });

    $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
    $('.rated').raty({ path: '/assets',
        readOnly: true,
        score: function() {
            return $(this).attr('data-score');
        }
    });

    var comments = $('.comment-body');
    if (comments.length < 3) {
        $(".highest_rating, .lowest_rating").css("display", "none");
    }

    // for (var i = 0; i < comments.length; ++i) {
    //     if (i % 2 === 0) {
    //         comments[i].css('border', '2px solid DodgerBlue');
    //     } else {
    //         comments[i].css('border', '2px solid salmon');
    //     }
    // }
    comments.each(function(i, elem){
        if (i % 2 === 0) {
                $(this).css('background-color', '#f3f3f3');
            } else {
            $(this).css('background-color', 'rgb(251, 251, 251)');
            }
    });
});