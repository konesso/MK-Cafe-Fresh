<?php include 'head.php'; ?>

<body>
    <!-- End additional html or js -->
    <div id="container" class="main_page container max-width-1200 largeLogo">

        <!-- header -->
        <?php include 'header.php' ?>

        <div id="layout" class="row clearfix">

            <!-- asside mobile menu -->
            <?php include 'aside.php' ?>

            <div id="content" class="col-12">
                <div id="main_banner1" class="skeleton mb-4 mt-1 full-width-row">
                    <div class="main_slider">
                        
                        <div class="main_slider__item" style="--width:480;--height:400;--width-sm:768;--height-sm:480;--width-md:1170;--height-md:480;"><a target="_blank" href="#" title="Przykładowy baner strefy 1">
                                <picture>
                                    <source width="1170" height="483" media="(min-width:979px)" srcset="https://mkfreshprod.azureedge.net/img/0/0/70/resize/wysiwyg/Kopia_slider_desktop_13__2.png">
                                    <source width="768" height="483" media="(min-width:757px)" srcset="https://mkfreshprod.azureedge.net/img/480/360/70/resize/wysiwyg/master_36__1.png"><img src="https://mkfreshprod.azureedge.net/img/480/360/70/resize/wysiwyg/master_36__1.png" width="480" height="401" alt="Przykładowy baner strefy 1" class="loaded">
                                    
                                </picture>
                            </a></div>
                        
                        <div class="main_slider__item" style="--width:480;--height:400;--width-sm:768;--height-sm:480;--width-md:1170;--height-md:480;"><a target="_blank" href="#" title="Przykładowy baner strefy 1">
                                <picture>
                                    <source width="1170" height="483" media="(min-width:979px)" srcset="https://mkfreshprod.azureedge.net/img/0/0/70/resize/wysiwyg/Kopia_slider_desktop_9_.png">
                                    <source width="768" height="483" media="(min-width:757px)" srcset="https://mkfreshprod.azureedge.net/img/480/360/70/resize/wysiwyg/slider_mobile_16__1.png"><img src="https://mkfreshprod.azureedge.net/img/480/360/70/resize/wysiwyg/slider_mobile_16__1.png" width="480" height="401" alt="Przykładowy baner strefy 1" class="loaded">
                                    
                                </picture>
                            </a></div>
                       
                    </div>
                </div>

                <div class="d-flex justify-content-around onasstepts mt-4 mb-4">
                    <div class="d-flex align-items-center">
                        <span class="icon--product-trust-bean"></span>
                        <span class="desc">Prosto z Manufaktury<br>bezpośrednio do Ciebie</span>
                    </div>
                    <div class="d-flex align-items-center">
                        <span class="icon--product-trust-truck"></span>
                        <span class="desc">Bezpłatna dostawa<br>od 130 zł</span>
                    </div>
                    <div class="d-flex align-items-center">
                        <span class="icon--48-hours"></span>
                        <span class="desc">Wysyłamy<br>w 24h</span>
                    </div>
                    <div class="d-flex align-items-center">
                        <span class="icon--product-trust-globe"></span>
                        <span class="desc">Kawa dostępna<br>tylko online</span>
                    </div>
                </div>
             
                <?php include 'product-blog.php' ?>
            </div>
        </div>
    </div>
    <?php include 'footer.php'; ?>


    <script src="./js/shop.js"></script>
    <!-- <script src="main.js"></script> -->
    <script src="./js/envelope.js.gzip"></script>
    <script src="./js/menu_suggested_shop_for_language.js.gzip"></script>
    <script src="./js/menu_calendar.js.gzip"></script>
    <script src="./js/menu_omnibus.js.gzip"></script>
    <script src="./js/main_banner1.js.gzip"></script>
    <script src="./js/menu_alert.js.gzip"></script>
    <script>
        app_shop.runApp();
    </script>
    


</body>