$(document).ready(function () {
    $('#showMore').on('click', function () {
        var content = $('#additionalContent');
        var button = $(this);

        content.toggleClass('expanded');

        if (content.hasClass('expanded')) {
            button.text('Czytaj mniej');
        } else {
            button.text('Czytaj więcej');
        }
    });
});






