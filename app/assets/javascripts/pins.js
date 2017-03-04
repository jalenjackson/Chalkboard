


$(document).on('turbolinks:load', function() {
    $("#search").autocomplete({
        source: "/search_suggestions"
    });

    return $("#pins").masonry({
        itemSelector: '.box',
        isFitWidth: true
    });


});






