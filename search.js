
$(document).ready(function () {
    $('#switch').on('change', function () {

        if ($(this).is(':checked')) {
            console.log("🚀 ~ file: search.js:6 ~ $(this).is(':checked'):", $(this).is(':checked'))
            // Gdy przełącznik jest w pozycji "on"

            $('#produkty').css('color', 'black');
            $('#smaki').css('color', 'orange');
            $('.graph-background').show();
            $('picture').hide();
            $('.label_icons').hide();

        } else {
            // Gdy przełącznik jest w pozycji "off"
            console.log("🚀 ~ file: search.js:15 ~ $(this).is(':!checked'):", $(this).is(':checked'))
            $('#produkty').css('color', 'orange');
            $('#smaki').css('color', 'black');
            $('.graph-background').hide();
            $('picture').show();
            $('.label_icons').show();
        }
    });

    // Dodanie przycisku "Ukryj filtry" i ukrycie go
    var hideFiltersBtn = $('<button/>', {
        text: 'Ukryj filtry',
        class: 'hide-filters-btn btn btn-secondary mt-2',
        click: function () {
            $('#Filters').addClass('d-md-none');
            $(this).hide(); // Ukryj przycisk "Ukryj filtry" po kliknięciu
        }
    }).appendTo('#Filters').hide();

    // Przełączanie widoczności formularza filtrowania
    $('.filter-dropdown-trigger').on("click", function () {
        $('#Filters').removeClass('d-md-none');
        $('.sort-element').addClass('d-none');
        $('.filter-element').removeClass('d-none');
        hideFiltersBtn.show(); // Pokaż przycisk "Ukryj filtry"
    });

    // Przełączanie widoczności formularza sortowania
    $('.sort-dropdown-trigger').on("click", function () {
        $('#Filters').removeClass('d-md-none');
        $('.filter-element').addClass('d-none');
        $('.sort-element').removeClass('d-none');
        hideFiltersBtn.show(); // Pokaż przycisk "Ukryj filtry"
    });
    $('.s_paging__item.--filters a').on("click", function (e) {

        $('#Filters').removeClass('d-none');
        $('.sort-element').removeClass('d-none');
        $('.filter-element').removeClass('d-none');
    });

    // Obsługa dropdownów
    $('.f-dropdown.f-group.s_paging__select.--order.--small-md, .f-dropdown.f-group.s_paging__select.--portions.--small-md').on("click", function () {
        $(this).toggleClass('--open');
    });




    $('.radar-chart').each(function (index, element) {
        var radarChart = new Chart(element, {
            type: 'radar',
            data: {
                labels: ['Czekolada', 'Słodycz', 'Karmel', 'Gorycz', 'Nuty kwiatowe',
                    'Owoce', 'Orzech', 'Karmel', 'Gorycz', 'Nuty kwiatowe', 'Owoce',
                    'Orzech'
                ],
                datasets: [{
                    backgroundColor: "rgba(178, 147, 112, 0.5)",
                    borderColor: "rgba(178, 147, 112, 0.5)",
                    pointBackgroundColor: "transparent",
                    pointBorderColor: "transparent",
                    fill: "origin",
                    data: [65, 59, 80, 61, 86, 95, 80, 70, 40, 60, 30, 80]
                }]
            },
            options: {
                responsive: true,
                legend: {
                    display: false
                },
                scale: {
                    angleLines: {
                        color: 'white'
                    },
                    ticks: {
                        beginAtZero: false,
                        min: 20,
                        display: false
                    },
                    gridLines: {
                        color: 'white'
                    },
                    pointLabels: {
                        fontColor: 'black'
                    }
                },
                tooltips: {
                    enabled: true,
                }

            },



        });
    });

});