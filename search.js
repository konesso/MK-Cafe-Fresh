
$(document).ready(function () {
    // Przełączanie widoczności zdjęć o wyksów smaku
    $('#switch').on('change', function () {

        if ($(this).is(':checked')) {
            console.log("🚀 ~ file: search.js:6 ~ $(this).is(':checked'):", $(this).is(':checked'))
            // Gdy przełącznik jest w pozycji "on"

            $('#produkty').css('color', 'black');
            $('#smaki').css('color', 'b29370');
            $('.graph-background').show();
            $('picture').hide();
            $('.label_icons').hide();

        } else {
            // Gdy przełącznik jest w pozycji "off"
            console.log("🚀 ~ file: search.js:15 ~ $(this).is(':!checked'):", $(this).is(':checked'))
            $('#produkty').css('color', 'b29370');
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

    // Funkcja do przełączania ikon
    function toggleIcon(button) {
        var icon = button.find('i');
        if (icon.hasClass('fa-chevron-down')) {
            icon.removeClass('fa-chevron-down').addClass('fa-chevron-up');
        } else {
            icon.removeClass('fa-chevron-up').addClass('fa-chevron-down');
        }
    }

    // Przełączanie widoczności formularza filtrowania i sortowania
    $('.filter-dropdown-trigger, .sort-dropdown-trigger').on("click", function () {
        // Sprawdź czy filtry są już widoczne
        var filtersVisible = !$('#Filters').hasClass('d-md-none');

        if (filtersVisible) {
            // Jeśli filtry są widoczne, ukryj je
            $('#Filters').addClass('d-md-none');
            hideFiltersBtn.hide();
        } else {
            // Jeśli filtry są ukryte, pokaż je
            $('#Filters').removeClass('d-md-none');
            hideFiltersBtn.show();
        }

        // Przełączanie elementów filtrowania i sortowania
        var isFilterButton = $(this).hasClass('filter-dropdown-trigger');
        $('.sort-element').toggleClass('d-none', !isFilterButton);
        $('.filter-element').toggleClass('d-none', isFilterButton);

        var isSortButton = $(this).hasClass('sort-dropdown-trigger');
        $('.sort-element').toggleClass('d-none', !isSortButton);
        $('.filter-element').toggleClass('d-none', isSortButton);

        // Przełącz ikonę
        toggleIcon($(this));
    });

    // Obsługa dropdownów w filtrach i sortowaniu
    $('.f-dropdown.f-group.s_paging__select.--order.--small-md, .f-dropdown.f-group.s_paging__select.--portions.--small-md').on("click", function () {
        $(this).toggleClass('--open');
    });


    // radar-chart - wykresy w miejscu zjęcia
    $('.radar-chart').each(function (index, element) {
        // Pobierz dane z atrybutu data-graph
        var graphDataAttr = $(element).closest('.graph-background').attr('data-graph');

        // Sprawdź czy atrybut data-graph istnieje
        if (graphDataAttr) {
            // Jeśli atrybut data-graph istnieje, przekształć dane w tablicę liczb
            var graphData = graphDataAttr.split(', ').map(Number);

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


                        data: graphData // Użyj przekształconych danych

                    }]
                },
                options: {
                    responsive: true,
                    legend: {
                        display: false
                    },
                    animation: {
                        duration: 3000,
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
            }); // Koniec radarChart
        } else {
            // Jeśli atrybut data-graph nie istnieje, wyświetl komunikat "Brak Danych"
            var ctx = element.getContext('2d');
            ctx.textAlign = 'center';
            ctx.textBaseline = 'middle';
            ctx.font = '16px Futura';
            ctx.fillText('Brak Danych', element.width / 2, element.height / 2);
        }
    });

});