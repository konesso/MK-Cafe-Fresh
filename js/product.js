

// Obsługa kliknięcia strzałki w dół
$(document).ready(function () {
    // Dodanie/Usuwanie klasy --open po kliknięciu przycisku
    $('.f-control.f-dropdown-toggle').on('click', function () {
        console.log("🚀 ~ file: product.js:7 ~ $ ~ click:add --open")
        $('.f-dropdown.f-group.projector_buy__number.f-select').toggleClass('--open');
    });

    // Usuwanie klasy --open po kliknięciu na element <li> zawierający link 'więcej' i przeniesienie focusu na input
    $('li.f-dropdown-li').has('a.f-dropdown-item[data-more="true"]').on('click', function () {
        $('.f-dropdown.f-group.projector_buy__number.f-select').removeClass('--open');
        $('.projector_buy__more_input').focus(); // Przeniesienie focusu na input
    });
});



