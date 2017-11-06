var scroller;

function headerScroller() {
    scroller.ratioOpacity = $(this).scrollTop() / scroller.collapse;
    scroller.logo.css('background-color', 'rgba(35,35,35, ' + scroller.ratioOpacity + ')');

    if ($(this).scrollTop() >= scroller.collapse) {
        scroller.mainNav.addClass('fixed');

    } else {
        scroller.mainNav.removeClass('fixed');
    }
}


$(function () {
    scroller = {
        collapse: 240,
        mainNav: $('#main-nav'),
        logo: $('#logo'),
        ratioOpacity: 1
    };

    // init header
    if ($(this).scrollTop() >= scroller.collapse) {
        scroller.mainNav.addClass('fixed');
    }
    scroller.ratioOpacity = $(this).scrollTop() / scroller.collapse;
    scroller.logo.css('background-color', 'rgba(35,35,35, ' + scroller.ratioOpacity + ')');


    // on vérifie si la classe Rating à bien été chargé
    if (typeof Rating === 'function') {
        var rating = new Rating();
        rating.init();
    }

    $(document).scroll(headerScroller);
});
