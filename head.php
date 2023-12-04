<html lang="pl" class="--vat --gross  --freeShipping --smallLogo no-touch " data-browser="Chrome"
    data-browser-version="117" style="--vh: 8.14px;">

<head>
    <meta name="viewport"
        content="user-scalable=no, initial-scale = 1.0, maximum-scale = 1.0, width=device-width, viewport-fit=cover" />

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Kawa ziarnista świeże kawy w ziarnach Konesso.pl</title>
    <meta name="keywords" content="kawa ziarnista " />
    <meta name="description"
        content="Kawa ziarnista do ekspresu i nie tylko! Najlepsze kawy ziarniste ponad 100 palarni kawy w jednym miejscu Zamów ulubioną kawę ziarnistą na Konesso.pl " />
    <link rel="shortcut icon" href="https://mkfresh.pl/base-assets/images/favicon/smalltile.png" />
    <meta name="theme-color" content="#0090f6" />
    <meta name="msapplication-navbutton-color" content="#0090f6" />
    <meta name="apple-mobile-web-app-status-bar-style" content="#0090f6" />

    <link rel="preload stylesheet" as="style" href="css/index.css?v=11" />
    <!-- <link rel="preload stylesheet" as="style" href="./style/index-old.css" /> -->

    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"> -->

    <script>
    var app_shop = {
        urls: {
            prefix: 'data="/gfx/'.replace('data="', '') + 'pol/',
            graphql: '/graphql/v1/'
        },
        vars: {
            priceType: 'gross',
            priceTypeVat: true,
            productDeliveryTimeAndAvailabilityWithBasket: false,
            geoipCountryCode: 'PL',
            currency: {
                id: 'PLN',
                symbol: 'zł',
                country: 'pl',
                format: '###,##0.00',
                beforeValue: false,
                space: true,
                decimalSeparator: ',',
                groupingSeparator: ' ',
            },
            language: {
                id: 'pol',
                symbol: 'pl',
                name: 'Polski'
            },
        },
        txt: {
            priceTypeText: ' brutto'
        },
        fn: {},
        fnrun: {},
        files: [],
        graphql: {},
    };
    const getCookieByName = name => {
        const value = `; ${document.cookie}`;
        const parts = value.split(`; ${name}=`);
        if (parts.length === 2) return parts.pop().split(';').shift();
        return false;
    };
    if (getCookieByName('freeeshipping_clicked')) {
        document.documentElement.classList.remove('--freeShipping');
    }
    if (getCookieByName('rabateCode_clicked')) {
        document.documentElement.classList.remove('--rabateCode');
    }

    function hideClosedBars() {
        const closedBarsArray = JSON.parse(localStorage.getItem('closedBars')) || [];
        if (closedBarsArray.length) {
            const styleElement = document.createElement('style');
            styleElement.textContent = `${closedBarsArray
                    .map(el => `#${el}`)
                    .join(',')}{display:none !important;}`;
            document.head.appendChild(styleElement);
        }
    }
    hideClosedBars();
    </script>

    <!-- End additional html or js -->

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script class="ajaxLoad">
    app_shop.vars.vat_registered = "true";
    app_shop.vars.currency_format = "###,##0.00";
    app_shop.vars.currency_before_value = false;
    app_shop.vars.currency_space = true;
    app_shop.vars.symbol = "zł";
    app_shop.vars.id = "PLN";
    app_shop.vars.baseurl = "http://www.konesso.pl/";
    app_shop.vars.sslurl = "https://www.konesso.pl/";
    app_shop.vars.curr_url = "%2Fproduct-pol-336-Kawa-ziarnista-Lavazza-Espresso-Italiano-1kg.html";
    var currency_decimal_separator = ',';
    var currency_grouping_separator = ' ';
    app_shop.vars.blacklist_extension = ["exe", "com", "swf", "js", "php"];
    app_shop.vars.blacklist_mime = ["application/javascript", "application/octet-stream", "message/http",
        "text/javascript", "application/x-deb", "application/x-javascript", "application/x-shockwave-flash",
        "application/x-msdownload"
    ];
    app_shop.urls.contact = "/contact-pol.html";
    </script>
</head>