class Rating {

    onAjaxClickRating(newRate) {
        $('#rate-value').text((Math.round(newRate * 10) / 10).toFixed(1));
    }

    onClickRating() {
        $.get('', 'vote=' + $(this).data('rate'), this.onAjaxClickRating);
        return false; //(event.preventDefault)
    };

    init() {
        $('#rating').children('a').click(this.onClickRating)
    };
}