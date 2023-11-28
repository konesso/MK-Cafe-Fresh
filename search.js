
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

    if (window.innerWidth < 768) {
        $('.setMobileGrid[data-item="#Filters"]').html($('#Filters').html())
        setTimeout(() => {
            console.log('timeout')
            $('#photos_slider .slick-slider').slick('refresh');

        }, 1500);
    }

    $(document).ready(function () {
        var filterButton = $('.filter-dropdown-trigger');
        var sortButton = $('.sort-dropdown-trigger');
        var filterIcon = filterButton.find('i');
        var sortIcon = sortButton.find('i');

        // Obsługa kliknięcia przycisku Filtrowanie
        filterButton.on("click", function () {
            var filtersVisible = !$('#Filters').hasClass('d-md-none');
            // Sprawdzanie czy kliknięto przycisk Sortowanie
            var isSortVisible = sortIcon.hasClass('fa-chevron-up');

            // Jeśli filtr jest aktualnie widoczny lub jeśli kliknięto Sortowanie
            if (filtersVisible || isSortVisible) {
                $('#Filters').addClass('d-md-none');
                $('.filter-element').hide();
                $('.sort-element').hide();
                filterIcon.removeClass('fa-chevron-up').addClass('fa-chevron-down');
                sortIcon.removeClass('fa-chevron-up').addClass('fa-chevron-down');
            } else {
                $('#Filters').removeClass('d-md-none');
                $('.filter-element').show();
                $('.sort-element').hide(); // Ukryj elementy sortowania
                filterIcon.removeClass('fa-chevron-down').addClass('fa-chevron-up');
                sortIcon.removeClass('fa-chevron-up').addClass('fa-chevron-down');
            }
        });

        // Obsługa kliknięcia przycisku Sortowanie
        sortButton.on("click", function () {
            var filtersVisible = !$('#Filters').hasClass('d-md-none');
            // Sprawdzanie czy kliknięto przycisk Filtrowanie
            var isFilterVisible = filterIcon.hasClass('fa-chevron-up');

            // Jeśli sortowanie jest aktualnie widoczne lub jeśli kliknięto Filtrowanie
            if (filtersVisible || isFilterVisible) {
                $('#Filters').addClass('d-md-none');
                $('.filter-element').hide();
                $('.sort-element').hide();
                sortIcon.removeClass('fa-chevron-up').addClass('fa-chevron-down');
                filterIcon.removeClass('fa-chevron-up').addClass('fa-chevron-down');
            } else {
                $('#Filters').removeClass('d-md-none');
                $('.sort-element').show();
                $('.filter-element').hide(); // Ukryj elementy filtrowania
                sortIcon.removeClass('fa-chevron-down').addClass('fa-chevron-up');
                filterIcon.removeClass('fa-chevron-up').addClass('fa-chevron-down');
            }
        });
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


$('toggleShowMore').on('click', function () {

    $('#additionalContent').toggleClass('expanded');

});

