<?php include 'head.php'; ?>

<body>

    <div id="container" class="search_page container max-width-1200">
        <?php include 'header.php' ?>
        <div id="layout" class="row clearfix">

            <?php include 'breadcrumbs.php' ?>
            <?php include 'aside.php' ?>

            <div id="content" class="col-12">

                <section class="search_name pb-5">
                    <h1 class="search_name__label headline"><span class="headline__name">Kawa ziarnista - najlepsze kawy
                            do ekspresu! </span></h1><span class="search_name__total">( ilość produktów: <span
                            class="search_name__total_value">1479</span> )</span>
                </section>
                <hr />
                <div class="search-results-top-menu py-3 d-flex justify-content-between flex-nowrap">
                    <div class="graph-wrapper py-1 d-flex flex-row justify-content-center">
                        <div class="pr-2 py-1"> Widok:</div>
                        <div class="cursor-pointer  d-flex flex-row justify-content-around align-bottom">
                            <div id="produkty" class="align-middle hover:text-gold transition-1 text-gold px-2 py-1"
                                style="color: #b29370;">
                                Produkty
                            </div>
                            <div class="px-2 py-1 d-flex flex-row justify-content-center align-items-center">
                                <input type="checkbox" id="switch" /><label for="switch">Toggle</label>
                            </div>
                            <div id="smaki" class="align-middle hover:text-gold transition-1 px-2 py-1">
                                Smaki
                            </div>
                        </div>
                    </div>
                    <div class="dropdown-wrapper  justify-content-around px-2 py-1 d-none d-md-flex flex-row">
                        <div class="filter float-left md:float-none">
                            <button class="filter-dropdown-trigger px-2 py-1">
                                <span class="mr-2"> Filtrowanie</span> <i class="fa fa-chevron-down"></i>
                            </button>

                        </div>
                        <div class="sort ml-5">
                            <button class="sort-dropdown-trigger py-1">
                                <span class="mr-2"> Sortowanie</span> <i class="fa fa-chevron-down"></i>
                            </button>

                        </div>
                    </div>
                </div>
                <div class="search_settings">
                    <div id="paging_setting_top" class="s_paging">

                        <form class="s_paging__item --sort d-md-none mb-2" action="https://www.konesso.pl/settings.php">
                            <div class="f-dropdown f-group s_paging__select --order --small-md "><select
                                    class="s_paging__select-select --order-select --small-md-select" name="sort_order">
                                    <option value="name-a" class="option_name-a">Sortuj po nazwie rosnąco</option>
                                    <option value="name-d" class="option_name-d">Sortuj po nazwie malejąco</option>
                                    <option value="price-a" class="option_price-a">Sortuj po cenie rosnąco</option>
                                    <option value="price-d" class="option_price-d">Sortuj po cenie malejąco</option>
                                    <option value="date-a" class="option_date-a">Sortuj po dacie rosnąco</option>
                                    <option value="date-d" class="option_date-d">Sortuj po dacie malejąco</option>
                                </select>
                                <button type="button" class="f-control f-dropdown-toggle" data-indexcurrent="0">

                                    <span class="f-dropdown-button">Sortuj po nazwie rosnąco</span>
                                </button>
                                <ul class="f-dropdown-menu">

                                    <li class="f-dropdown-li option_name-a">
                                        <a class="f-dropdown-item --selected" href="#name-a" data-index="0"
                                            data-value="name-a">Sortuj po nazwie rosnąco</a>
                                    </li>

                                    <li class="f-dropdown-li option_name-d">
                                        <a class="f-dropdown-item" href="#name-d" data-index="1"
                                            data-value="name-d">Sortuj po nazwie malejąco</a>
                                    </li>

                                    <li class="f-dropdown-li option_price-a">
                                        <a class="f-dropdown-item" href="#price-a" data-index="2"
                                            data-value="price-a">Sortuj po cenie rosnąco</a>
                                    </li>

                                    <li class="f-dropdown-li option_price-d">
                                        <a class="f-dropdown-item" href="#price-d" data-index="3"
                                            data-value="price-d">Sortuj po cenie malejąco</a>
                                    </li>

                                    <li class="f-dropdown-li option_date-a">
                                        <a class="f-dropdown-item" href="#date-a" data-index="4"
                                            data-value="date-a">Sortuj po dacie rosnąco</a>
                                    </li>

                                    <li class="f-dropdown-li option_date-d">
                                        <a class="f-dropdown-item" href="#date-d" data-index="5"
                                            data-value="date-d">Sortuj po dacie malejąco</a>
                                    </li>

                                </ul>
                            </div>
                        </form>


                        <form class="s_paging__item --portions d-none" action="https://www.konesso.pl/settings.php">
                            <div class="f-dropdown f-group s_paging__select --portions --small-md "><select
                                    class="s_paging__select-select --portions-select --small-md-select"
                                    id="select_top_portions" name="portions">
                                    <option value="30" selected="">Pokaż 30</option>
                                    <option value="60">Pokaż 60</option>
                                    <option value="90">Pokaż 90</option>
                                    <option value="120">Pokaż 120</option>
                                    <option value="150">Pokaż 150</option>
                                    <option value="180">Pokaż 180</option>
                                    <option value="210">Pokaż 210</option>
                                    <option value="240">Pokaż 240</option>
                                    <option value="270">Pokaż 270</option>
                                    <option value="300">Pokaż 300</option>
                                </select>
                                <button type="button" class="f-control f-dropdown-toggle" data-indexcurrent="0">

                                    <span class="f-dropdown-button">Pokaż 30</span>
                                </button>
                                <ul class="f-dropdown-menu">

                                    <li class="f-dropdown-li">
                                        <a class="f-dropdown-item --selected" href="#30" data-index="0"
                                            data-value="30">Pokaż 30</a>
                                    </li>

                                    <li class="f-dropdown-li">
                                        <a class="f-dropdown-item" href="#60" data-index="1" data-value="60">Pokaż
                                            60</a>
                                    </li>

                                    <li class="f-dropdown-li">
                                        <a class="f-dropdown-item" href="#90" data-index="2" data-value="90">Pokaż
                                            90</a>
                                    </li>

                                    <li class="f-dropdown-li">
                                        <a class="f-dropdown-item" href="#120" data-index="3" data-value="120">Pokaż
                                            120</a>
                                    </li>

                                    <li class="f-dropdown-li">
                                        <a class="f-dropdown-item" href="#150" data-index="4" data-value="150">Pokaż
                                            150</a>
                                    </li>

                                    <li class="f-dropdown-li">
                                        <a class="f-dropdown-item" href="#180" data-index="5" data-value="180">Pokaż
                                            180</a>
                                    </li>

                                    <li class="f-dropdown-li">
                                        <a class="f-dropdown-item" href="#210" data-index="6" data-value="210">Pokaż
                                            210</a>
                                    </li>

                                    <li class="f-dropdown-li">
                                        <a class="f-dropdown-item" href="#240" data-index="7" data-value="240">Pokaż
                                            240</a>
                                    </li>

                                    <li class="f-dropdown-li">
                                        <a class="f-dropdown-item" href="#270" data-index="8" data-value="270">Pokaż
                                            270</a>
                                    </li>

                                    <li class="f-dropdown-li">
                                        <a class="f-dropdown-item" href="#300" data-index="9" data-value="300">Pokaż
                                            300</a>
                                    </li>

                                </ul>
                            </div>
                        </form>

                        <div class="s_paging__item --filters d-md-none mb-2 mb-sm-3"><a class="btn --solid --large"
                                href="#menu_filter">
                                Pokaż filtry
                            </a></div>
                    </div>
                    <section id="Filters" class="filters mb-4 d-md-none">
                        <form class="filters__form" method="get"
                            action="https://www.konesso.pl/pol_m_Kawa_Rodzaj_Kawa-ziarnista-2160.html">

                            <div class="sort-element s_paging__item filters__block --sort --inFilters"
                                data-action="https://www.konesso.pl/settings.php">
                                <div class="f-dropdown f-group s_paging__select --order --small-md "><select
                                        class="s_paging__select-select --order-select --small-md-select"
                                        name="sort_order">
                                        <option value="name-a" class="option_name-a">Sortuj po nazwie rosnąco
                                        </option>
                                        <option value="name-d" class="option_name-d">Sortuj po nazwie malejąco
                                        </option>
                                        <option value="price-a" class="option_price-a">Sortuj po cenie rosnąco
                                        </option>
                                        <option value="price-d" class="option_price-d">Sortuj po cenie malejąco
                                        </option>
                                        <option value="date-a" class="option_date-a">Sortuj po dacie rosnąco
                                        </option>
                                        <option value="date-d" class="option_date-d">Sortuj po dacie malejąco
                                        </option>
                                    </select>
                                    <button type="button" class="f-control f-dropdown-toggle" data-indexcurrent="0">

                                        <span class="f-dropdown-button">Sortuj po nazwie rosnąco</span>
                                    </button>
                                    <ul class="f-dropdown-menu">

                                        <li class="f-dropdown-li option_name-a">
                                            <a class="f-dropdown-item --selected" href="#name-a" data-index="0"
                                                data-value="name-a">Sortuj po nazwie rosnąco</a>
                                        </li>

                                        <li class="f-dropdown-li option_name-d">
                                            <a class="f-dropdown-item" href="#name-d" data-index="1"
                                                data-value="name-d">Sortuj po nazwie malejąco</a>
                                        </li>

                                        <li class="f-dropdown-li option_price-a">
                                            <a class="f-dropdown-item" href="#price-a" data-index="2"
                                                data-value="price-a">Sortuj po cenie rosnąco</a>
                                        </li>

                                        <li class="f-dropdown-li option_price-d">
                                            <a class="f-dropdown-item" href="#price-d" data-index="3"
                                                data-value="price-d">Sortuj po cenie malejąco</a>
                                        </li>

                                        <li class="f-dropdown-li option_date-a">
                                            <a class="f-dropdown-item" href="#date-a" data-index="4"
                                                data-value="date-a">Sortuj po dacie rosnąco</a>
                                        </li>

                                        <li class="f-dropdown-li option_date-d">
                                            <a class="f-dropdown-item" href="#date-d" data-index="5"
                                                data-value="date-d">Sortuj po dacie malejąco</a>
                                        </li>

                                    </ul>
                                </div>
                            </div>
                            <div class="sort-element s_paging__item filters__block --portions --inFilters"
                                data-action="https://www.konesso.pl/settings.php">
                                <div class="f-dropdown f-group s_paging__select --portions --small-md "><select
                                        class="s_paging__select-select --portions-select --small-md-select"
                                        id="select_top_portions" name="portions">
                                        <option value="30" selected="">Pokaż 30</option>
                                        <option value="60">Pokaż 60</option>
                                        <option value="90">Pokaż 90</option>
                                        <option value="120">Pokaż 120</option>
                                        <option value="150">Pokaż 150</option>
                                        <option value="180">Pokaż 180</option>
                                        <option value="210">Pokaż 210</option>
                                        <option value="240">Pokaż 240</option>
                                        <option value="270">Pokaż 270</option>
                                        <option value="300">Pokaż 300</option>
                                    </select>
                                    <button type="button" class="f-control f-dropdown-toggle" data-indexcurrent="0">

                                        <span class="f-dropdown-button">Pokaż 30</span>
                                    </button>
                                    <ul class="f-dropdown-menu">

                                        <li class="f-dropdown-li">
                                            <a class="f-dropdown-item --selected" href="#30" data-index="0"
                                                data-value="30">Pokaż 30</a>
                                        </li>

                                        <li class="f-dropdown-li">
                                            <a class="f-dropdown-item" href="#60" data-index="1" data-value="60">Pokaż
                                                60</a>
                                        </li>

                                        <li class="f-dropdown-li">
                                            <a class="f-dropdown-item" href="#90" data-index="2" data-value="90">Pokaż
                                                90</a>
                                        </li>

                                        <li class="f-dropdown-li">
                                            <a class="f-dropdown-item" href="#120" data-index="3" data-value="120">Pokaż
                                                120</a>
                                        </li>

                                        <li class="f-dropdown-li">
                                            <a class="f-dropdown-item" href="#150" data-index="4" data-value="150">Pokaż
                                                150</a>
                                        </li>

                                        <li class="f-dropdown-li">
                                            <a class="f-dropdown-item" href="#180" data-index="5" data-value="180">Pokaż
                                                180</a>
                                        </li>

                                        <li class="f-dropdown-li">
                                            <a class="f-dropdown-item" href="#210" data-index="6" data-value="210">Pokaż
                                                210</a>
                                        </li>

                                        <li class="f-dropdown-li">
                                            <a class="f-dropdown-item" href="#240" data-index="7" data-value="240">Pokaż
                                                240</a>
                                        </li>

                                        <li class="f-dropdown-li">
                                            <a class="f-dropdown-item" href="#270" data-index="8" data-value="270">Pokaż
                                                270</a>
                                        </li>

                                        <li class="f-dropdown-li">
                                            <a class="f-dropdown-item" href="#300" data-index="9" data-value="300">Pokaż
                                                300</a>
                                        </li>

                                    </ul>
                                </div>
                            </div>


                            <div class="filter-element filters__block"><input type="hidden" class="__serialize"
                                    id="filter_producer_input" name="filter_producer" value=""><a class="filters__toggler
    								" data-id="filter_producer">
                                    <div class="btn --icon-right d-block pr-4"><span class="d-none d-md-block"
                                            old_text="Marka">Marka</span><span class="d-md-none">Marka</span></div>
                                </a>
                                <div class="filters__expand p-md-2 pt-md-3" id="filter_producer_expand">
                                    <ul class="filters__content --list" id="filter_producer_content">
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1626156012"
                                                    data-id="filter_producer" value="1626156012"><label class="f-label"
                                                    for="filter_producer_1626156012"><span class="--name">1000 HILLS
                                                        PRODUCTS</span><span class="--quantity">12</span></label>
                                            </div>
                                        </li>
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1386331988"
                                                    data-id="filter_producer" value="1386331988"><label class="f-label"
                                                    for="filter_producer_1386331988"><span
                                                        class="--name">AEROPRESS</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1454661568"
                                                    data-id="filter_producer" value="1454661568"><label class="f-label"
                                                    for="filter_producer_1454661568"><span
                                                        class="--name">AGUST</span><span
                                                        class="--quantity">6</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1375789011"
                                                    data-id="filter_producer" value="1375789011"><label class="f-label"
                                                    for="filter_producer_1375789011"><span class="--name">ANTICA
                                                        TOSTATURA TRIESTINA</span><span
                                                        class="--quantity">4</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --last-not-hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1370952142"
                                                    data-id="filter_producer" value="1370952142"><label class="f-label"
                                                    for="filter_producer_1370952142"><span
                                                        class="--name">ARCAFFE</span><span
                                                        class="--quantity">10</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1683007304"
                                                    data-id="filter_producer" value="1683007304"><label class="f-label"
                                                    for="filter_producer_1683007304"><span class="--name">BARSHAKER
                                                        COFFEE ROASTERS</span><span class="--quantity">26</span></label>
                                            </div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1320750793"
                                                    data-id="filter_producer" value="1320750793"><label class="f-label"
                                                    for="filter_producer_1320750793"><span
                                                        class="--name">MkCafe</span><span
                                                        class="--quantity">52</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1424771084"
                                                    data-id="filter_producer" value="1424771084"><label class="f-label"
                                                    for="filter_producer_1424771084"><span
                                                        class="--name">BIALETTI</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1626156011"
                                                    data-id="filter_producer" value="1626156011"><label class="f-label"
                                                    for="filter_producer_1626156011"><span class="--name">BRACIA
                                                        ZIÓŁKOWSCY</span><span class="--quantity">14</span></label>
                                            </div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1320750813"
                                                    data-id="filter_producer" value="1320750813"><label class="f-label"
                                                    for="filter_producer_1320750813"><span
                                                        class="--name">BRISTOT</span><span
                                                        class="--quantity">13</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1462196520"
                                                    data-id="filter_producer" value="1462196520"><label class="f-label"
                                                    for="filter_producer_1462196520"><span class="--name">CAFFE DEL
                                                        FARO</span><span class="--quantity">7</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1605003436"
                                                    data-id="filter_producer" value="1605003436"><label class="f-label"
                                                    for="filter_producer_1605003436"><span class="--name">CAFFE
                                                        GRANO</span><span class="--quantity">28</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1547711172"
                                                    data-id="filter_producer" value="1547711172"><label class="f-label"
                                                    for="filter_producer_1547711172"><span
                                                        class="--name">CELLINI</span><span
                                                        class="--quantity">10</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1646032034"
                                                    data-id="filter_producer" value="1646032034"><label class="f-label"
                                                    for="filter_producer_1646032034"><span class="--name">COFFEE
                                                        HUNTER</span><span class="--quantity">25</span></label>
                                            </div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1518508950"
                                                    data-id="filter_producer" value="1518508950"><label class="f-label"
                                                    for="filter_producer_1518508950"><span class="--name">COFFEE
                                                        JOURNEY</span><span class="--quantity">14</span></label>
                                            </div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1605251531"
                                                    data-id="filter_producer" value="1605251531"><label class="f-label"
                                                    for="filter_producer_1605251531"><span
                                                        class="--name">COFFEELAB</span><span
                                                        class="--quantity">39</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1623137618"
                                                    data-id="filter_producer" value="1623137618"><label class="f-label"
                                                    for="filter_producer_1623137618"><span class="--name">COFFEE
                                                        PLANT</span><span class="--quantity">61</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1649528860"
                                                    data-id="filter_producer" value="1649528860"><label class="f-label"
                                                    for="filter_producer_1649528860"><span class="--name">COFFEE
                                                        PROFICIENCY</span><span class="--quantity">15</span></label>
                                            </div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1538044675"
                                                    data-id="filter_producer" value="1538044675"><label class="f-label"
                                                    for="filter_producer_1538044675"><span
                                                        class="--name">CORNELLA</span><span
                                                        class="--quantity">11</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1601275587"
                                                    data-id="filter_producer" value="1601275587"><label class="f-label"
                                                    for="filter_producer_1601275587"><span class="--name">COSTA
                                                        COFFEE</span><span class="--quantity">35</span></label>
                                            </div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1632836014"
                                                    data-id="filter_producer" value="1632836014"><label class="f-label"
                                                    for="filter_producer_1632836014"><span class="--name">CRAFT COFFEE
                                                        ROASTERS</span><span class="--quantity">6</span></label>
                                            </div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1624254678"
                                                    data-id="filter_producer" value="1624254678"><label class="f-label"
                                                    for="filter_producer_1624254678"><span class="--name">CZARNA
                                                        FALA</span><span class="--quantity">20</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1691130863"
                                                    data-id="filter_producer" value="1691130863"><label class="f-label"
                                                    for="filter_producer_1691130863"><span
                                                        class="--name">DALLMAYR</span><span
                                                        class="--quantity">7</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1617716735"
                                                    data-id="filter_producer" value="1617716735"><label class="f-label"
                                                    for="filter_producer_1617716735"><span class="--name">DAVIDOFF
                                                        CAFE</span><span class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1351328802"
                                                    data-id="filter_producer" value="1351328802"><label class="f-label"
                                                    for="filter_producer_1351328802"><span
                                                        class="--name">DIEMME</span><span
                                                        class="--quantity">11</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1636009286"
                                                    data-id="filter_producer" value="1636009286"><label class="f-label"
                                                    for="filter_producer_1636009286"><span class="--name">DOBRA PALARNIA
                                                        KAWY</span><span class="--quantity">14</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1460108797"
                                                    data-id="filter_producer" value="1460108797"><label class="f-label"
                                                    for="filter_producer_1460108797"><span class="--name">ETNO
                                                        CAFE</span><span class="--quantity">29</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1611578738"
                                                    data-id="filter_producer" value="1611578738"><label class="f-label"
                                                    for="filter_producer_1611578738"><span class="--name">FIGA
                                                        COFFEE</span><span class="--quantity">10</span></label>
                                            </div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1600078819"
                                                    data-id="filter_producer" value="1600078819"><label class="f-label"
                                                    for="filter_producer_1600078819"><span
                                                        class="--name">GIMA</span><span
                                                        class="--quantity">15</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1679036991"
                                                    data-id="filter_producer" value="1679036991"><label class="f-label"
                                                    for="filter_producer_1679036991"><span
                                                        class="--name">HALISEK</span><span
                                                        class="--quantity">3</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1521704255"
                                                    data-id="filter_producer" value="1521704255"><label class="f-label"
                                                    for="filter_producer_1521704255"><span class="--name">HARD BEANS
                                                        COFFEE ROASTERS</span><span class="--quantity">17</span></label>
                                            </div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1665489419"
                                                    data-id="filter_producer" value="1665489419"><label class="f-label"
                                                    for="filter_producer_1665489419"><span
                                                        class="--name">HARDY</span><span
                                                        class="--quantity">3</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1660642623"
                                                    data-id="filter_producer" value="1660642623"><label class="f-label"
                                                    for="filter_producer_1660642623"><span
                                                        class="--name">HARVEST</span><span
                                                        class="--quantity">9</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1320750882"
                                                    data-id="filter_producer" value="1320750882"><label class="f-label"
                                                    for="filter_producer_1320750882"><span
                                                        class="--name">HAUSBRANDT</span><span
                                                        class="--quantity">13</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1549920956"
                                                    data-id="filter_producer" value="1549920956"><label class="f-label"
                                                    for="filter_producer_1549920956"><span class="--name">HAYB
                                                        SPECIALITY COFFEE</span><span
                                                        class="--quantity">65</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1667472552"
                                                    data-id="filter_producer" value="1667472552"><label class="f-label"
                                                    for="filter_producer_1667472552"><span class="--name">HIVE
                                                        ROASTERS</span><span class="--quantity">14</span></label>
                                            </div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1320750889"
                                                    data-id="filter_producer" value="1320750889"><label class="f-label"
                                                    for="filter_producer_1320750889"><span
                                                        class="--name">ILLY</span><span
                                                        class="--quantity">11</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1655704760"
                                                    data-id="filter_producer" value="1655704760"><label class="f-label"
                                                    for="filter_producer_1655704760"><span class="--name">INGAGI
                                                        COFFEE</span><span class="--quantity">28</span></label>
                                            </div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1643118478"
                                                    data-id="filter_producer" value="1643118478"><label class="f-label"
                                                    for="filter_producer_1643118478"><span
                                                        class="--name">ITALCAFFE</span><span
                                                        class="--quantity">24</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1320750900"
                                                    data-id="filter_producer" value="1320750900"><label class="f-label"
                                                    for="filter_producer_1320750900"><span
                                                        class="--name">IZZO</span><span
                                                        class="--quantity">6</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1672126371"
                                                    data-id="filter_producer" value="1672126371"><label class="f-label"
                                                    for="filter_producer_1672126371"><span class="--name">JACOBS DOUWE
                                                        EGBERTS</span><span class="--quantity">12</span></label>
                                            </div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1427450328"
                                                    data-id="filter_producer" value="1427450328"><label class="f-label"
                                                    for="filter_producer_1427450328"><span class="--name">JAVA
                                                        COFFEE</span><span class="--quantity">33</span></label>
                                            </div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1409647912"
                                                    data-id="filter_producer" value="1409647912"><label class="f-label"
                                                    for="filter_producer_1409647912"><span class="--name">JOHAN &amp;
                                                        NYSTRÖM</span><span class="--quantity">1</span></label>
                                            </div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1382960527"
                                                    data-id="filter_producer" value="1382960527"><label class="f-label"
                                                    for="filter_producer_1382960527"><span
                                                        class="--name">JOLLY</span><span
                                                        class="--quantity">7</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1534838710"
                                                    data-id="filter_producer" value="1534838710"><label class="f-label"
                                                    for="filter_producer_1534838710"><span class="--name">JUAN VALDEZ
                                                        CAFE</span><span class="--quantity">10</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1320750906"
                                                    data-id="filter_producer" value="1320750906"><label class="f-label"
                                                    for="filter_producer_1320750906"><span
                                                        class="--name">JURA</span><span
                                                        class="--quantity">5</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1624254676"
                                                    data-id="filter_producer" value="1624254676"><label class="f-label"
                                                    for="filter_producer_1624254676"><span
                                                        class="--name">KAFAR</span><span
                                                        class="--quantity">11</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1678692469"
                                                    data-id="filter_producer" value="1678692469"><label class="f-label"
                                                    for="filter_producer_1678692469"><span class="--name">KAFEJETO
                                                        PALARNIA</span><span class="--quantity">13</span></label>
                                            </div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1668519413"
                                                    data-id="filter_producer" value="1668519413"><label class="f-label"
                                                    for="filter_producer_1668519413"><span class="--name">KARMELLO
                                                        CHOCOLATIER</span><span class="--quantity">6</span></label>
                                            </div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1683876803"
                                                    data-id="filter_producer" value="1683876803"><label class="f-label"
                                                    for="filter_producer_1683876803"><span
                                                        class="--name">KawePale</span><span
                                                        class="--quantity">21</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1624254679"
                                                    data-id="filter_producer" value="1624254679"><label class="f-label"
                                                    for="filter_producer_1624254679"><span
                                                        class="--name">KAWUSZKA</span><span
                                                        class="--quantity">15</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1320750916"
                                                    data-id="filter_producer" value="1320750916"><label class="f-label"
                                                    for="filter_producer_1320750916"><span
                                                        class="--name">KIMBO</span><span
                                                        class="--quantity">26</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1624254677"
                                                    data-id="filter_producer" value="1624254677"><label class="f-label"
                                                    for="filter_producer_1624254677"><span
                                                        class="--name">KYOTO</span><span
                                                        class="--quantity">17</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1320750930"
                                                    data-id="filter_producer" value="1320750930"><label class="f-label"
                                                    for="filter_producer_1320750930"><span class="--name">LA
                                                        BRASILIANA</span><span class="--quantity">7</span></label>
                                            </div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1547469995"
                                                    data-id="filter_producer" value="1547469995"><label class="f-label"
                                                    for="filter_producer_1547469995"><span class="--name">LACAVA
                                                        SPECIALTY COFFEE ROASTERY</span><span
                                                        class="--quantity">62</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1320750707"
                                                    data-id="filter_producer" value="1320750707"><label class="f-label"
                                                    for="filter_producer_1320750707"><span
                                                        class="--name">LAVAZZA</span><span
                                                        class="--quantity">44</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1354199479"
                                                    data-id="filter_producer" value="1354199479"><label class="f-label"
                                                    for="filter_producer_1354199479"><span
                                                        class="--name">LUCAFFE</span><span
                                                        class="--quantity">12</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1327655932"
                                                    data-id="filter_producer" value="1327655932"><label class="f-label"
                                                    for="filter_producer_1327655932"><span
                                                        class="--name">MANUEL</span><span
                                                        class="--quantity">9</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1452159959"
                                                    data-id="filter_producer" value="1452159959"><label class="f-label"
                                                    for="filter_producer_1452159959"><span
                                                        class="--name">MESETA</span><span
                                                        class="--quantity">5</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1695015615"
                                                    data-id="filter_producer" value="1695015615"><label class="f-label"
                                                    for="filter_producer_1695015615"><span class="--name">MIGA
                                                        COFFEE</span><span class="--quantity">12</span></label>
                                            </div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1626156013"
                                                    data-id="filter_producer" value="1626156013"><label class="f-label"
                                                    for="filter_producer_1626156013"><span class="--name">MK
                                                        CAFE</span><span class="--quantity">19</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1624254675"
                                                    data-id="filter_producer" value="1624254675"><label class="f-label"
                                                    for="filter_producer_1624254675"><span class="--name">MOMENTO COFFEE
                                                    </span><span class="--quantity">31</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1604387806"
                                                    data-id="filter_producer" value="1604387806"><label class="f-label"
                                                    for="filter_producer_1604387806"><span class="--name">MOTT
                                                        COFFEE</span><span class="--quantity">14</span></label>
                                            </div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1666589830"
                                                    data-id="filter_producer" value="1666589830"><label class="f-label"
                                                    for="filter_producer_1666589830"><span
                                                        class="--name">MRC.</span><span
                                                        class="--quantity">14</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1568362177"
                                                    data-id="filter_producer" value="1568362177"><label class="f-label"
                                                    for="filter_producer_1568362177"><span
                                                        class="--name">MUSETTI</span><span
                                                        class="--quantity">8</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1320750965"
                                                    data-id="filter_producer" value="1320750965"><label class="f-label"
                                                    for="filter_producer_1320750965"><span class="--name">NEW YORK
                                                        CAFFE</span><span class="--quantity">4</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1438846256"
                                                    data-id="filter_producer" value="1438846256"><label class="f-label"
                                                    for="filter_producer_1438846256"><span class="--name">ORO
                                                        CAFFE</span><span class="--quantity">3</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1626156010"
                                                    data-id="filter_producer" value="1626156010"><label class="f-label"
                                                    for="filter_producer_1626156010"><span class="--name">PALE COFFEE
                                                        ROASTERS</span><span class="--quantity">2</span></label>
                                            </div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1640761812"
                                                    data-id="filter_producer" value="1640761812"><label class="f-label"
                                                    for="filter_producer_1640761812"><span
                                                        class="--name">PALOMA</span><span
                                                        class="--quantity">22</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1350653570"
                                                    data-id="filter_producer" value="1350653570"><label class="f-label"
                                                    for="filter_producer_1350653570"><span class="--name">PARANA
                                                        CAFFE</span><span class="--quantity">4</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1358167503"
                                                    data-id="filter_producer" value="1358167503"><label class="f-label"
                                                    for="filter_producer_1358167503"><span
                                                        class="--name">PASSALACQUA</span><span
                                                        class="--quantity">3</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1320750741"
                                                    data-id="filter_producer" value="1320750741"><label class="f-label"
                                                    for="filter_producer_1320750741"><span
                                                        class="--name">PELLINI</span><span
                                                        class="--quantity">11</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1683876802"
                                                    data-id="filter_producer" value="1683876802"><label class="f-label"
                                                    for="filter_producer_1683876802"><span class="--name">PIXEL COFFEE
                                                        ROASTERS</span><span class="--quantity">6</span></label>
                                            </div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1529400875"
                                                    data-id="filter_producer" value="1529400875"><label class="f-label"
                                                    for="filter_producer_1529400875"><span
                                                        class="--name">PLUTON</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1652085007"
                                                    data-id="filter_producer" value="1652085007"><label class="f-label"
                                                    for="filter_producer_1652085007"><span class="--name">PRASKA KAWY
                                                        PALARNIA</span><span class="--quantity">10</span></label>
                                            </div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1649528858"
                                                    data-id="filter_producer" value="1649528858"><label class="f-label"
                                                    for="filter_producer_1649528858"><span class="--name">Produkcja
                                                        zakończona</span><span class="--quantity">2</span></label>
                                            </div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1632836015"
                                                    data-id="filter_producer" value="1632836015"><label class="f-label"
                                                    for="filter_producer_1632836015"><span
                                                        class="--name">QUALIA</span><span
                                                        class="--quantity">26</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1612854983"
                                                    data-id="filter_producer" value="1612854983"><label class="f-label"
                                                    for="filter_producer_1612854983"><span class="--name">QUBA
                                                        CAFFE</span><span class="--quantity">19</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1630307310"
                                                    data-id="filter_producer" value="1630307310"><label class="f-label"
                                                    for="filter_producer_1630307310"><span
                                                        class="--name">ROASTAINS</span><span
                                                        class="--quantity">43</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1679036990"
                                                    data-id="filter_producer" value="1679036990"><label class="f-label"
                                                    for="filter_producer_1679036990"><span
                                                        class="--name">ROST</span><span
                                                        class="--quantity">17</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1320751013"
                                                    data-id="filter_producer" value="1320751013"><label class="f-label"
                                                    for="filter_producer_1320751013"><span
                                                        class="--name">SEGAFREDO</span><span
                                                        class="--quantity">19</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1603792611"
                                                    data-id="filter_producer" value="1603792611"><label class="f-label"
                                                    for="filter_producer_1603792611"><span class="--name">SIMON
                                                        LEVELT</span><span class="--quantity">9</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1614324792"
                                                    data-id="filter_producer" value="1614324792"><label class="f-label"
                                                    for="filter_producer_1614324792"><span
                                                        class="--name">STARBUCKS®</span><span
                                                        class="--quantity">13</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1580478753"
                                                    data-id="filter_producer" value="1580478753"><label class="f-label"
                                                    for="filter_producer_1580478753"><span class="--name">STORY COFFEE
                                                        ROASTERS</span><span class="--quantity">26</span></label>
                                            </div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1665489420"
                                                    data-id="filter_producer" value="1665489420"><label class="f-label"
                                                    for="filter_producer_1665489420"><span
                                                        class="--name">SUPRACAFE</span><span
                                                        class="--quantity">3</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1661424660"
                                                    data-id="filter_producer" value="1661424660"><label class="f-label"
                                                    for="filter_producer_1661424660"><span class="--name">ŚWIEŻO
                                                        PALONA</span><span class="--quantity">12</span></label>
                                            </div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1617713164"
                                                    data-id="filter_producer" value="1617713164"><label class="f-label"
                                                    for="filter_producer_1617713164"><span
                                                        class="--name">TCHIBO</span><span
                                                        class="--quantity">17</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1598613441"
                                                    data-id="filter_producer" value="1598613441"><label class="f-label"
                                                    for="filter_producer_1598613441"><span class="--name">THE WHITE
                                                        BEAR</span><span class="--quantity">14</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1602690196"
                                                    data-id="filter_producer" value="1602690196"><label class="f-label"
                                                    for="filter_producer_1602690196"><span
                                                        class="--name">TIMEMORE</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1661424659"
                                                    data-id="filter_producer" value="1661424659"><label class="f-label"
                                                    for="filter_producer_1661424659"><span class="--name">TOM
                                                        CAFFE</span><span class="--quantity">10</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1541419983"
                                                    data-id="filter_producer" value="1541419983"><label class="f-label"
                                                    for="filter_producer_1541419983"><span
                                                        class="--name">TRISMOKA</span><span
                                                        class="--quantity">15</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1320750820"
                                                    data-id="filter_producer" value="1320750820"><label class="f-label"
                                                    for="filter_producer_1320750820"><span
                                                        class="--name">VERGNANO</span><span
                                                        class="--quantity">3</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1642502283"
                                                    data-id="filter_producer" value="1642502283"><label class="f-label"
                                                    for="filter_producer_1642502283"><span class="--name">WILD HILL
                                                        COFFEE</span><span class="--quantity">10</span></label>
                                            </div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1487168281"
                                                    data-id="filter_producer" value="1487168281"><label class="f-label"
                                                    for="filter_producer_1487168281"><span
                                                        class="--name">WROASTERS</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1623137662"
                                                    data-id="filter_producer" value="1623137662"><label class="f-label"
                                                    for="filter_producer_1623137662"><span class="--name">WYSOCKI
                                                        COFFEE</span><span class="--quantity">22</span></label>
                                            </div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1679036992"
                                                    data-id="filter_producer" value="1679036992"><label class="f-label"
                                                    for="filter_producer_1679036992"><span class="--name">YOCO
                                                        COFFEE</span><span class="--quantity">10</span></label>
                                            </div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_producer_1352545434"
                                                    data-id="filter_producer" value="1352545434"><label class="f-label"
                                                    for="filter_producer_1352545434"><span
                                                        class="--name">ZICAFFE</span><span
                                                        class="--quantity">14</span></label></div>
                                        </li>
                                    </ul>
                                    <div class="filters__options"><a class="--show-hidden btn py-0 pl-0 pr-0"
                                            data-id="filter_producer"><span class="--show">+ Rozwiń</span><span
                                                class="--hide">- Ukryj</span></a><button type="submit"
                                            class="--submit btn --solid --small">
                                            Filtruj
                                        </button><button type="submit" class="--remove btn" title="Wyczyść filtry">
                                            Wyczyść filtry
                                        </button></div>
                                </div>
                            </div>
                            <div class="filter-element filters__block"><input type="hidden" class="__serialize"
                                    id="filter_traits1335603892_input" name="filter_traits[1335603892]" value=""><a
                                    class="filters__toggler
    								" data-id="filter_traits1335603892">
                                    <div class="btn --icon-right d-block pr-4"><span class="d-none d-md-block"
                                            old_text="Blend czy Single">Blend czy Single</span><span
                                            class="d-md-none">Blend czy Single</span></div>
                                </a>
                                <div class="filters__expand p-md-2 pt-md-3" id="filter_traits1335603892_expand">
                                    <ul class="filters__content --list" id="filter_traits1335603892_content">
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603892_1335603893"
                                                    data-id="filter_traits1335603892" value="1335603893"><label
                                                    class="f-label" for="filter_traits1335603892_1335603893"><span
                                                        class="--name">Blend / Mieszanki</span><span
                                                        class="--quantity">725</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603892_1335603898"
                                                    data-id="filter_traits1335603892" value="1335603898"><label
                                                    class="f-label" for="filter_traits1335603892_1335603898"><span
                                                        class="--name">Single / Jednorodne</span><span
                                                        class="--quantity">705</span></label></div>
                                        </li>
                                    </ul>
                                    <div class="filters__options"><button type="submit"
                                            class="--submit btn --solid --small">
                                            Filtruj
                                        </button><button type="submit" class="--remove btn" title="Wyczyść filtry">
                                            Wyczyść filtry
                                        </button></div>
                                </div>
                            </div>
                            <div class="filter-element filters__block"><input type="hidden" class="__serialize"
                                    id="filter_traits1335603899_input" name="filter_traits[1335603899]" value=""><a
                                    class="filters__toggler
    								" data-id="filter_traits1335603899">
                                    <div class="btn --icon-right d-block pr-4"><span class="d-none d-md-block"
                                            old_text="Pochodzenie ziaren">Pochodzenie ziaren</span><span
                                            class="d-md-none">Pochodzenie ziaren</span></div>
                                </a>
                                <div class="filters__expand p-md-2 pt-md-3" id="filter_traits1335603899_expand">
                                    <ul class="filters__content --list" id="filter_traits1335603899_content">
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603899_1335603972"
                                                    data-id="filter_traits1335603899" value="1335603972"><label
                                                    class="f-label" for="filter_traits1335603899_1335603972"><span
                                                        class="--name">Afryka</span><span
                                                        class="--quantity">47</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603899_1335608449"
                                                    data-id="filter_traits1335603899" value="1335608449"><label
                                                    class="f-label" for="filter_traits1335603899_1335608449"><span
                                                        class="--name">Ameryka</span><span
                                                        class="--quantity">3</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603899_1335603921"
                                                    data-id="filter_traits1335603899" value="1335603921"><label
                                                    class="f-label" for="filter_traits1335603899_1335603921"><span
                                                        class="--name">Ameryka Południowa</span><span
                                                        class="--quantity">109</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603899_1335603906"
                                                    data-id="filter_traits1335603899" value="1335603906"><label
                                                    class="f-label" for="filter_traits1335603899_1335603906"><span
                                                        class="--name">Ameryka Środkowa</span><span
                                                        class="--quantity">92</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --last-not-hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603899_1335603973"
                                                    data-id="filter_traits1335603899" value="1335603973"><label
                                                    class="f-label" for="filter_traits1335603899_1335603973"><span
                                                        class="--name">Azja</span><span
                                                        class="--quantity">37</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603899_1335604270"
                                                    data-id="filter_traits1335603899" value="1335604270"><label
                                                    class="f-label" for="filter_traits1335603899_1335604270"><span
                                                        class="--name">Boliwia</span><span
                                                        class="--quantity">3</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603899_1335603900"
                                                    data-id="filter_traits1335603899" value="1335603900"><label
                                                    class="f-label" for="filter_traits1335603899_1335603900"><span
                                                        class="--name">Brazylia</span><span
                                                        class="--quantity">499</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603899_1335604033"
                                                    data-id="filter_traits1335603899" value="1335604033"><label
                                                    class="f-label" for="filter_traits1335603899_1335604033"><span
                                                        class="--name">Burundi</span><span
                                                        class="--quantity">6</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603899_1335605033"
                                                    data-id="filter_traits1335603899" value="1335605033"><label
                                                    class="f-label" for="filter_traits1335603899_1335605033"><span
                                                        class="--name">Chiny</span><span
                                                        class="--quantity">3</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603899_1335604493"
                                                    data-id="filter_traits1335603899" value="1335604493"><label
                                                    class="f-label" for="filter_traits1335603899_1335604493"><span
                                                        class="--name">Demokratyczna Republika Konga</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603899_1335603954"
                                                    data-id="filter_traits1335603899" value="1335603954"><label
                                                    class="f-label" for="filter_traits1335603899_1335603954"><span
                                                        class="--name">Dominikana</span><span
                                                        class="--quantity">3</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603899_1335603902"
                                                    data-id="filter_traits1335603899" value="1335603902"><label
                                                    class="f-label" for="filter_traits1335603899_1335603902"><span
                                                        class="--name">Etiopia</span><span
                                                        class="--quantity">161</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603899_1335603901"
                                                    data-id="filter_traits1335603899" value="1335603901"><label
                                                    class="f-label" for="filter_traits1335603899_1335603901"><span
                                                        class="--name">Gwatemala</span><span
                                                        class="--quantity">137</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603899_1335603957"
                                                    data-id="filter_traits1335603899" value="1335603957"><label
                                                    class="f-label" for="filter_traits1335603899_1335603957"><span
                                                        class="--name">Honduras</span><span
                                                        class="--quantity">57</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603899_1335603904"
                                                    data-id="filter_traits1335603899" value="1335603904"><label
                                                    class="f-label" for="filter_traits1335603899_1335603904"><span
                                                        class="--name">Indie</span><span
                                                        class="--quantity">139</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603899_1335603931"
                                                    data-id="filter_traits1335603899" value="1335603931"><label
                                                    class="f-label" for="filter_traits1335603899_1335603931"><span
                                                        class="--name">Indonezja</span><span
                                                        class="--quantity">34</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603899_1335605779"
                                                    data-id="filter_traits1335603899" value="1335605779"><label
                                                    class="f-label" for="filter_traits1335603899_1335605779"><span
                                                        class="--name">Jamajka</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603899_1335604020"
                                                    data-id="filter_traits1335603899" value="1335604020"><label
                                                    class="f-label" for="filter_traits1335603899_1335604020"><span
                                                        class="--name">Kamerun</span><span
                                                        class="--quantity">9</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603899_1335603953"
                                                    data-id="filter_traits1335603899" value="1335603953"><label
                                                    class="f-label" for="filter_traits1335603899_1335603953"><span
                                                        class="--name">Kenia</span><span
                                                        class="--quantity">62</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603899_1335603903"
                                                    data-id="filter_traits1335603899" value="1335603903"><label
                                                    class="f-label" for="filter_traits1335603899_1335603903"><span
                                                        class="--name">Kolumbia</span><span
                                                        class="--quantity">180</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603899_1335604021"
                                                    data-id="filter_traits1335603899" value="1335604021"><label
                                                    class="f-label" for="filter_traits1335603899_1335604021"><span
                                                        class="--name">Kongo</span><span
                                                        class="--quantity">6</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603899_1335603942"
                                                    data-id="filter_traits1335603899" value="1335603942"><label
                                                    class="f-label" for="filter_traits1335603899_1335603942"><span
                                                        class="--name">Kostaryka</span><span
                                                        class="--quantity">81</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603899_1335605250"
                                                    data-id="filter_traits1335603899" value="1335605250"><label
                                                    class="f-label" for="filter_traits1335603899_1335605250"><span
                                                        class="--name">Kuba</span><span
                                                        class="--quantity">7</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603899_1335603956"
                                                    data-id="filter_traits1335603899" value="1335603956"><label
                                                    class="f-label" for="filter_traits1335603899_1335603956"><span
                                                        class="--name">Meksyk</span><span
                                                        class="--quantity">25</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603899_1335603948"
                                                    data-id="filter_traits1335603899" value="1335603948"><label
                                                    class="f-label" for="filter_traits1335603899_1335603948"><span
                                                        class="--name">Nikaragua</span><span
                                                        class="--quantity">30</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603899_1335604041"
                                                    data-id="filter_traits1335603899" value="1335604041"><label
                                                    class="f-label" for="filter_traits1335603899_1335604041"><span
                                                        class="--name">Panama</span><span
                                                        class="--quantity">4</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603899_1335604293"
                                                    data-id="filter_traits1335603899" value="1335604293"><label
                                                    class="f-label" for="filter_traits1335603899_1335604293"><span
                                                        class="--name">Papua-Nowa Gwinea</span><span
                                                        class="--quantity">7</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603899_1335603963"
                                                    data-id="filter_traits1335603899" value="1335603963"><label
                                                    class="f-label" for="filter_traits1335603899_1335603963"><span
                                                        class="--name">Peru</span><span
                                                        class="--quantity">60</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603899_1335607946"
                                                    data-id="filter_traits1335603899" value="1335607946"><label
                                                    class="f-label" for="filter_traits1335603899_1335607946"><span
                                                        class="--name">Portoryko</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603899_1335604058"
                                                    data-id="filter_traits1335603899" value="1335604058"><label
                                                    class="f-label" for="filter_traits1335603899_1335604058"><span
                                                        class="--name">Rwanda</span><span
                                                        class="--quantity">73</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603899_1335603950"
                                                    data-id="filter_traits1335603899" value="1335603950"><label
                                                    class="f-label" for="filter_traits1335603899_1335603950"><span
                                                        class="--name">Salwador</span><span
                                                        class="--quantity">28</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603899_1335603975"
                                                    data-id="filter_traits1335603899" value="1335603975"><label
                                                    class="f-label" for="filter_traits1335603899_1335603975"><span
                                                        class="--name">Tanzania</span><span
                                                        class="--quantity">18</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603899_1335609308"
                                                    data-id="filter_traits1335603899" value="1335609308"><label
                                                    class="f-label" for="filter_traits1335603899_1335609308"><span
                                                        class="--name">Timor</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603899_1335604019"
                                                    data-id="filter_traits1335603899" value="1335604019"><label
                                                    class="f-label" for="filter_traits1335603899_1335604019"><span
                                                        class="--name">Togo</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603899_1335603997"
                                                    data-id="filter_traits1335603899" value="1335603997"><label
                                                    class="f-label" for="filter_traits1335603899_1335603997"><span
                                                        class="--name">Uganda</span><span
                                                        class="--quantity">23</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603899_1335603905"
                                                    data-id="filter_traits1335603899" value="1335603905"><label
                                                    class="f-label" for="filter_traits1335603899_1335603905"><span
                                                        class="--name">Wietnam</span><span
                                                        class="--quantity">23</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603899_1335607992"
                                                    data-id="filter_traits1335603899" value="1335607992"><label
                                                    class="f-label" for="filter_traits1335603899_1335607992"><span
                                                        class="--name">Wybrzeże Kości Słoniowej</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                    </ul>
                                    <div class="filters__options"><a class="--show-hidden btn py-0 pl-0 pr-0"
                                            data-id="filter_traits1335603899"><span class="--show">+
                                                Rozwiń</span><span class="--hide">- Ukryj</span></a><button
                                            type="submit" class="--submit btn --solid --small">
                                            Filtruj
                                        </button><button type="submit" class="--remove btn" title="Wyczyść filtry">
                                            Wyczyść filtry
                                        </button></div>
                                </div>
                            </div>
                            <div class="filter-element filters__more d-none"><a href="##" title="Więcej filtrów"><span
                                        class="btn --icon-right d-block pr-4"><span class="d-none d-md-block"
                                            old_text="Pochodzenie ziaren"> Więcej filtrów</span><span
                                            class="d-md-none">Więcej
                                            filtrów</span></a></div>
                            <div class="filter-element filters__block --hide"><input type="hidden" class="__serialize"
                                    id="filter_traits1335603539_input" name="filter_traits[1335603539]" value=""><a
                                    class="filters__toggler
    								" data-id="filter_traits1335603539">
                                    <div class="btn --icon-right d-block pr-4"><span class="d-none d-md-block"
                                            old_text="Opakowanie">Opakowanie</span><span
                                            class="d-md-none">Opakowanie</span></div>
                                </a>
                                <div class="filters__expand p-md-2 pt-md-3" id="filter_traits1335603539_expand">
                                    <ul class="filters__content --list" id="filter_traits1335603539_content">
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603539_1335608736"
                                                    data-id="filter_traits1335603539" value="1335608736"><label
                                                    class="f-label" for="filter_traits1335603539_1335608736"><span
                                                        class="--name">1000</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603539_1335603658"
                                                    data-id="filter_traits1335603539" value="1335603658"><label
                                                    class="f-label" for="filter_traits1335603539_1335603658"><span
                                                        class="--name">1000g</span><span
                                                        class="--quantity">583</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603539_1335607831"
                                                    data-id="filter_traits1335603539" value="1335607831"><label
                                                    class="f-label" for="filter_traits1335603539_1335607831"><span
                                                        class="--name">1250g</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603539_1335607822"
                                                    data-id="filter_traits1335603539" value="1335607822"><label
                                                    class="f-label" for="filter_traits1335603539_1335607822"><span
                                                        class="--name">1500g</span><span
                                                        class="--quantity">7</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --last-not-hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603539_1335604536"
                                                    data-id="filter_traits1335603539" value="1335604536"><label
                                                    class="f-label" for="filter_traits1335603539_1335604536"><span
                                                        class="--name">150g</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603539_1335604601"
                                                    data-id="filter_traits1335603539" value="1335604601"><label
                                                    class="f-label" for="filter_traits1335603539_1335604601"><span
                                                        class="--name">190g</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603539_1335605181"
                                                    data-id="filter_traits1335603539" value="1335605181"><label
                                                    class="f-label" for="filter_traits1335603539_1335605181"><span
                                                        class="--name">2000g</span><span
                                                        class="--quantity">20</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603539_1335603677"
                                                    data-id="filter_traits1335603539" value="1335603677"><label
                                                    class="f-label" for="filter_traits1335603539_1335603677"><span
                                                        class="--name">200g</span><span
                                                        class="--quantity">24</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603539_1335608165"
                                                    data-id="filter_traits1335603539" value="1335608165"><label
                                                    class="f-label" for="filter_traits1335603539_1335608165"><span
                                                        class="--name">2200</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603539_1335604294"
                                                    data-id="filter_traits1335603539" value="1335604294"><label
                                                    class="f-label" for="filter_traits1335603539_1335604294"><span
                                                        class="--name">250g</span><span
                                                        class="--quantity">685</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603539_1335603657"
                                                    data-id="filter_traits1335603539" value="1335603657"><label
                                                    class="f-label" for="filter_traits1335603539_1335603657"><span
                                                        class="--name">3000g</span><span
                                                        class="--quantity">9</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603539_1335608101"
                                                    data-id="filter_traits1335603539" value="1335608101"><label
                                                    class="f-label" for="filter_traits1335603539_1335608101"><span
                                                        class="--name">330g</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603539_1335604690"
                                                    data-id="filter_traits1335603539" value="1335604690"><label
                                                    class="f-label" for="filter_traits1335603539_1335604690"><span
                                                        class="--name">400g</span><span
                                                        class="--quantity">10</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603539_1335604039"
                                                    data-id="filter_traits1335603539" value="1335604039"><label
                                                    class="f-label" for="filter_traits1335603539_1335604039"><span
                                                        class="--name">450 g</span><span
                                                        class="--quantity">4</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603539_1335605653"
                                                    data-id="filter_traits1335603539" value="1335605653"><label
                                                    class="f-label" for="filter_traits1335603539_1335605653"><span
                                                        class="--name">454g</span><span
                                                        class="--quantity">10</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603539_1335603659"
                                                    data-id="filter_traits1335603539" value="1335603659"><label
                                                    class="f-label" for="filter_traits1335603539_1335603659"><span
                                                        class="--name">500g</span><span
                                                        class="--quantity">75</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603539_1335605630"
                                                    data-id="filter_traits1335603539" value="1335605630"><label
                                                    class="f-label" for="filter_traits1335603539_1335605630"><span
                                                        class="--name">550g</span><span
                                                        class="--quantity">3</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603539_1335607833"
                                                    data-id="filter_traits1335603539" value="1335607833"><label
                                                    class="f-label" for="filter_traits1335603539_1335607833"><span
                                                        class="--name">600g</span><span
                                                        class="--quantity">3</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603539_1335603661"
                                                    data-id="filter_traits1335603539" value="1335603661"><label
                                                    class="f-label" for="filter_traits1335603539_1335603661"><span
                                                        class="--name">700g</span><span
                                                        class="--quantity">4</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603539_1335604882"
                                                    data-id="filter_traits1335603539" value="1335604882"><label
                                                    class="f-label" for="filter_traits1335603539_1335604882"><span
                                                        class="--name">750g</span><span
                                                        class="--quantity">5</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603539_1335604547"
                                                    data-id="filter_traits1335603539" value="1335604547"><label
                                                    class="f-label" for="filter_traits1335603539_1335604547"><span
                                                        class="--name">800g</span><span
                                                        class="--quantity">7</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603539_1335604545"
                                                    data-id="filter_traits1335603539" value="1335604545"><label
                                                    class="f-label" for="filter_traits1335603539_1335604545"><span
                                                        class="--name">900g</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                    </ul>
                                    <div class="filters__options"><a class="--show-hidden btn py-0 pl-0 pr-0"
                                            data-id="filter_traits1335603539"><span class="--show">+
                                                Rozwiń</span><span class="--hide">- Ukryj</span></a><button
                                            type="submit" class="--submit btn --solid --small">
                                            Filtruj
                                        </button><button type="submit" class="--remove btn" title="Wyczyść filtry">
                                            Wyczyść filtry
                                        </button></div>
                                </div>
                            </div>
                            <div class="filter-element filters__block --hide"><input type="hidden" class="__serialize"
                                    id="filter_traits1335604645_input" name="filter_traits[1335604645]" value=""><a
                                    class="filters__toggler
    								" data-id="filter_traits1335604645">
                                    <div class="btn --icon-right d-block pr-4"><span class="d-none d-md-block"
                                            old_text="Gatunek kawy">Gatunek kawy</span><span class="d-md-none">Gatunek
                                            kawy</span></div>
                                </a>
                                <div class="filters__expand p-md-2 pt-md-3" id="filter_traits1335604645_expand">
                                    <ul class="filters__content --list" id="filter_traits1335604645_content">
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335604645_1335604651"
                                                    data-id="filter_traits1335604645" value="1335604651"><label
                                                    class="f-label" for="filter_traits1335604645_1335604651"><span
                                                        class="--name">Arabica</span><span
                                                        class="--quantity">26</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335604645_1335604646"
                                                    data-id="filter_traits1335604645" value="1335604646"><label
                                                    class="f-label" for="filter_traits1335604645_1335604646"><span
                                                        class="--name">Kawa mieszana</span><span
                                                        class="--quantity">27</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335604645_1335604981"
                                                    data-id="filter_traits1335604645" value="1335604981"><label
                                                    class="f-label" for="filter_traits1335604645_1335604981"><span
                                                        class="--name">Robusta</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                    </ul>
                                    <div class="filters__options"><button type="submit"
                                            class="--submit btn --solid --small">
                                            Filtruj
                                        </button><button type="submit" class="--remove btn" title="Wyczyść filtry">
                                            Wyczyść filtry
                                        </button></div>
                                </div>
                            </div>
                            <div class="filter-element filters__block --hide"><input type="hidden" class="__serialize"
                                    id="filter_traits1335603421_input" name="filter_traits[1335603421]" value=""><a
                                    class="filters__toggler
    								" data-id="filter_traits1335603421">
                                    <div class="btn --icon-right d-block pr-4"><span class="d-none d-md-block"
                                            old_text="Skład">Skład</span><span class="d-md-none">Skład</span></div>
                                </a>
                                <div class="filters__expand p-md-2 pt-md-3" id="filter_traits1335603421_expand">
                                    <ul class="filters__content --list" id="filter_traits1335603421_content">
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603421_1335603424"
                                                    data-id="filter_traits1335603421" value="1335603424"><label
                                                    class="f-label" for="filter_traits1335603421_1335603424"><span
                                                        class="--name">100% Arabika</span><span
                                                        class="--quantity">1066</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603421_1335603573"
                                                    data-id="filter_traits1335603421" value="1335603573"><label
                                                    class="f-label" for="filter_traits1335603421_1335603573"><span
                                                        class="--name">100% Robusta</span><span
                                                        class="--quantity">12</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603421_1335604014"
                                                    data-id="filter_traits1335603421" value="1335604014"><label
                                                    class="f-label" for="filter_traits1335603421_1335604014"><span
                                                        class="--name">10% Arabika, 90% Robusta</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603421_1335603431"
                                                    data-id="filter_traits1335603421" value="1335603431"><label
                                                    class="f-label" for="filter_traits1335603421_1335603431"><span
                                                        class="--name">20% Arabika, 80% Robusta</span><span
                                                        class="--quantity">9</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --last-not-hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603421_1335608097"
                                                    data-id="filter_traits1335603421" value="1335608097"><label
                                                    class="f-label" for="filter_traits1335603421_1335608097"><span
                                                        class="--name">25% Arabika, 75% Robusta</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603421_1335603468"
                                                    data-id="filter_traits1335603421" value="1335603468"><label
                                                    class="f-label" for="filter_traits1335603421_1335603468"><span
                                                        class="--name">30% Arabika, 70% Robusta</span><span
                                                        class="--quantity">6</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603421_1335603486"
                                                    data-id="filter_traits1335603421" value="1335603486"><label
                                                    class="f-label" for="filter_traits1335603421_1335603486"><span
                                                        class="--name">35% Arabika, 65% Robusta</span><span
                                                        class="--quantity">4</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603421_1335603429"
                                                    data-id="filter_traits1335603421" value="1335603429"><label
                                                    class="f-label" for="filter_traits1335603421_1335603429"><span
                                                        class="--name">40% Arabika, 60% Robusta</span><span
                                                        class="--quantity">21</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603421_1335603555"
                                                    data-id="filter_traits1335603421" value="1335603555"><label
                                                    class="f-label" for="filter_traits1335603421_1335603555"><span
                                                        class="--name">45% Arabika, 55% Robusta</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603421_1335603428"
                                                    data-id="filter_traits1335603421" value="1335603428"><label
                                                    class="f-label" for="filter_traits1335603421_1335603428"><span
                                                        class="--name">50% Arabika, 50% Robusta</span><span
                                                        class="--quantity">35</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603421_1335604280"
                                                    data-id="filter_traits1335603421" value="1335604280"><label
                                                    class="f-label" for="filter_traits1335603421_1335604280"><span
                                                        class="--name">55% Arabika, 45% Robusta</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603421_1335603678"
                                                    data-id="filter_traits1335603421" value="1335603678"><label
                                                    class="f-label" for="filter_traits1335603421_1335603678"><span
                                                        class="--name">5% Arabika, 95% Robusta</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603421_1335603427"
                                                    data-id="filter_traits1335603421" value="1335603427"><label
                                                    class="f-label" for="filter_traits1335603421_1335603427"><span
                                                        class="--name">60% Arabika, 40% Robusta</span><span
                                                        class="--quantity">29</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603421_1335603572"
                                                    data-id="filter_traits1335603421" value="1335603572"><label
                                                    class="f-label" for="filter_traits1335603421_1335603572"><span
                                                        class="--name">65% Arabika, 35% Robusta</span><span
                                                        class="--quantity">10</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603421_1335603426"
                                                    data-id="filter_traits1335603421" value="1335603426"><label
                                                    class="f-label" for="filter_traits1335603421_1335603426"><span
                                                        class="--name">70% Arabika, 30% Robusta</span><span
                                                        class="--quantity">59</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603421_1335603553"
                                                    data-id="filter_traits1335603421" value="1335603553"><label
                                                    class="f-label" for="filter_traits1335603421_1335603553"><span
                                                        class="--name">75% Arabika, 25% Robusta</span><span
                                                        class="--quantity">13</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603421_1335603443"
                                                    data-id="filter_traits1335603421" value="1335603443"><label
                                                    class="f-label" for="filter_traits1335603421_1335603443"><span
                                                        class="--name">80% Arabika, 20% Robusta</span><span
                                                        class="--quantity">61</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603421_1335603444"
                                                    data-id="filter_traits1335603421" value="1335603444"><label
                                                    class="f-label" for="filter_traits1335603421_1335603444"><span
                                                        class="--name">85% Arabika, 15% Robusta</span><span
                                                        class="--quantity">12</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603421_1335603422"
                                                    data-id="filter_traits1335603421" value="1335603422"><label
                                                    class="f-label" for="filter_traits1335603421_1335603422"><span
                                                        class="--name">90% Arabika, 10% Robusta</span><span
                                                        class="--quantity">23</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603421_1335603445"
                                                    data-id="filter_traits1335603421" value="1335603445"><label
                                                    class="f-label" for="filter_traits1335603421_1335603445"><span
                                                        class="--name">92% Arabika, 8% Robusta</span><span
                                                        class="--quantity">3</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603421_1335603442"
                                                    data-id="filter_traits1335603421" value="1335603442"><label
                                                    class="f-label" for="filter_traits1335603421_1335603442"><span
                                                        class="--name">95% Arabika, 5% Robusta</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603421_1335603446"
                                                    data-id="filter_traits1335603421" value="1335603446"><label
                                                    class="f-label" for="filter_traits1335603421_1335603446"><span
                                                        class="--name">97% Arabika, 3% Robusta</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603421_1335608642"
                                                    data-id="filter_traits1335603421" value="1335608642"><label
                                                    class="f-label" for="filter_traits1335603421_1335608642"><span
                                                        class="--name">Arabika </span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603421_1335604495"
                                                    data-id="filter_traits1335603421" value="1335604495"><label
                                                    class="f-label" for="filter_traits1335603421_1335604495"><span
                                                        class="--name">Arabika, Robusta</span><span
                                                        class="--quantity">77</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603421_1335608643"
                                                    data-id="filter_traits1335603421" value="1335608643"><label
                                                    class="f-label" for="filter_traits1335603421_1335608643"><span
                                                        class="--name">Robusta</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                    </ul>
                                    <div class="filters__options"><a class="--show-hidden btn py-0 pl-0 pr-0"
                                            data-id="filter_traits1335603421"><span class="--show">+
                                                Rozwiń</span><span class="--hide">- Ukryj</span></a><button
                                            type="submit" class="--submit btn --solid --small">
                                            Filtruj
                                        </button><button type="submit" class="--remove btn" title="Wyczyść filtry">
                                            Wyczyść filtry
                                        </button></div>
                                </div>
                            </div>
                            <div class="filter-element filters__block --hide"><input type="hidden" class="__serialize"
                                    id="filter_traits1335603487_input" name="filter_traits[1335603487]" value=""><a
                                    class="filters__toggler
    								" data-id="filter_traits1335603487">
                                    <div class="btn --icon-right d-block pr-4"><span class="d-none d-md-block"
                                            old_text="Stopień palenia">Stopień palenia</span><span
                                            class="d-md-none">Stopień palenia</span></div>
                                </a>
                                <div class="filters__expand p-md-2 pt-md-3" id="filter_traits1335603487_expand">
                                    <ul class="filters__content --list" id="filter_traits1335603487_content">
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603487_1335603490"
                                                    data-id="filter_traits1335603487" value="1335603490"><label
                                                    class="f-label" for="filter_traits1335603487_1335603490"><span
                                                        class="--name">Ciemny</span><span
                                                        class="--quantity">151</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603487_1335603488"
                                                    data-id="filter_traits1335603487" value="1335603488"><label
                                                    class="f-label" for="filter_traits1335603487_1335603488"><span
                                                        class="--name">Jasny</span><span
                                                        class="--quantity">344</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603487_1335608971"
                                                    data-id="filter_traits1335603487" value="1335608971"><label
                                                    class="f-label" for="filter_traits1335603487_1335608971"><span
                                                        class="--name">Lekki / Średni</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603487_1335603489"
                                                    data-id="filter_traits1335603487" value="1335603489"><label
                                                    class="f-label" for="filter_traits1335603487_1335603489"><span
                                                        class="--name">Średni</span><span
                                                        class="--quantity">953</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --last-not-hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603487_1335608710"
                                                    data-id="filter_traits1335603487" value="1335608710"><label
                                                    class="f-label" for="filter_traits1335603487_1335608710"><span
                                                        class="--name">Średnio-ciemny</span><span
                                                        class="--quantity">4</span></label></div>
                                        </li>
                                    </ul>
                                    <div class="filters__options"><button type="submit"
                                            class="--submit btn --solid --small">
                                            Filtruj
                                        </button><button type="submit" class="--remove btn" title="Wyczyść filtry">
                                            Wyczyść filtry
                                        </button></div>
                                </div>
                            </div>
                            <div class=" filter-element filters__block --hide"><input type="hidden" class="__serialize"
                                    id="filter_traits1335603491_input" name="filter_traits[1335603491]" value=""><a
                                    class="filters__toggler
    								" data-id="filter_traits1335603491">
                                    <div class="btn --icon-right d-block pr-4"><span class="d-none d-md-block"
                                            old_text="Zawartość kofeiny">Zawartość kofeiny</span><span
                                            class="d-md-none">Zawartość kofeiny</span></div>
                                </a>
                                <div class="filters__expand p-md-2 pt-md-3" id="filter_traits1335603491_expand">
                                    <ul class="filters__content --list" id="filter_traits1335603491_content">
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603491_1335603495"
                                                    data-id="filter_traits1335603491" value="1335603495"><label
                                                    class="f-label" for="filter_traits1335603491_1335603495"><span
                                                        class="--name">Bezkofeinowa</span><span
                                                        class="--quantity">37</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603491_1335603492"
                                                    data-id="filter_traits1335603491" value="1335603492"><label
                                                    class="f-label" for="filter_traits1335603491_1335603492"><span
                                                        class="--name">Niska</span><span
                                                        class="--quantity">1082</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603491_1335603493"
                                                    data-id="filter_traits1335603491" value="1335603493"><label
                                                    class="f-label" for="filter_traits1335603491_1335603493"><span
                                                        class="--name">Średnia</span><span
                                                        class="--quantity">195</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603491_1335603494"
                                                    data-id="filter_traits1335603491" value="1335603494"><label
                                                    class="f-label" for="filter_traits1335603491_1335603494"><span
                                                        class="--name">Wysoka</span><span
                                                        class="--quantity">145</span></label></div>
                                        </li>
                                    </ul>
                                    <div class="filters__options"><button type="submit"
                                            class="--submit btn --solid --small">
                                            Filtruj
                                        </button><button type="submit" class="--remove btn" title="Wyczyść filtry">
                                            Wyczyść filtry
                                        </button></div>
                                </div>
                            </div>
                            <div class="filter-element filters__block --hide"><input type="hidden" class="__serialize"
                                    id="filter_traits1335603574_input" name="filter_traits[1335603574]" value=""><a
                                    class="filters__toggler
    								" data-id="filter_traits1335603574">
                                    <div class="btn --icon-right d-block pr-4"><span class="d-none d-md-block"
                                            old_text="Rodzaj">Rodzaj</span><span class="d-md-none">Rodzaj</span>
                                    </div>
                                </a>
                                <div class="filters__expand p-md-2 pt-md-3" id="filter_traits1335603574_expand">
                                    <ul class="filters__content --list" id="filter_traits1335603574_content">
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603574_1335603643"
                                                    data-id="filter_traits1335603574" value="1335603643"><label
                                                    class="f-label" for="filter_traits1335603574_1335603643"><span
                                                        class="--name">Aeropress</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603574_1335603626"
                                                    data-id="filter_traits1335603574" value="1335603626"><label
                                                    class="f-label" for="filter_traits1335603574_1335603626"><span
                                                        class="--name">Akcesoria baristy</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603574_1335603587"
                                                    data-id="filter_traits1335603574" value="1335603587"><label
                                                    class="f-label" for="filter_traits1335603574_1335603587"><span
                                                        class="--name">Kawa ziarnista</span><span
                                                        class="--quantity">1466</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603574_1335603648"
                                                    data-id="filter_traits1335603574" value="1335603648"><label
                                                    class="f-label" for="filter_traits1335603574_1335603648"><span
                                                        class="--name">Kawiarki</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --last-not-hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603574_1335603577"
                                                    data-id="filter_traits1335603574" value="1335603577"><label
                                                    class="f-label" for="filter_traits1335603574_1335603577"><span
                                                        class="--name">Ręczny</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603574_1335603591"
                                                    data-id="filter_traits1335603574" value="1335603591"><label
                                                    class="f-label" for="filter_traits1335603574_1335603591"><span
                                                        class="--name">Zestawy kawowe</span><span
                                                        class="--quantity">5</span></label></div>
                                        </li>
                                    </ul>
                                    <div class="filters__options"><a class="--show-hidden btn py-0 pl-0 pr-0"
                                            data-id="filter_traits1335603574"><span class="--show">+
                                                Rozwiń</span><span class="--hide">- Ukryj</span></a><button
                                            type="submit" class="--submit btn --solid --small">
                                            Filtruj
                                        </button><button type="submit" class="--remove btn" title="Wyczyść filtry">
                                            Wyczyść filtry
                                        </button></div>
                                </div>
                            </div>
                            <div class="filter-element filters__block --hide"><input type="hidden" class="__serialize"
                                    id="filter_traits1335603894_input" name="filter_traits[1335603894]" value=""><a
                                    class="filters__toggler
    								" data-id="filter_traits1335603894">
                                    <div class="btn --icon-right d-block pr-4"><span class="d-none d-md-block"
                                            old_text="Wyczuwalne smaki">Wyczuwalne smaki</span><span
                                            class="d-md-none">Wyczuwalne smaki</span></div>
                                </a>
                                <div class="filters__expand p-md-2 pt-md-3" id="filter_traits1335603894_expand">
                                    <ul class="filters__content --list" id="filter_traits1335603894_content">
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603979"
                                                    data-id="filter_traits1335603894" value="1335603979"><label
                                                    class="f-label" for="filter_traits1335603894_1335603979"><span
                                                        class="--name">Agrest</span><span
                                                        class="--quantity">5</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608738"
                                                    data-id="filter_traits1335603894" value="1335608738"><label
                                                    class="f-label" for="filter_traits1335603894_1335608738"><span
                                                        class="--name">Alkohol</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603974"
                                                    data-id="filter_traits1335603894" value="1335603974"><label
                                                    class="f-label" for="filter_traits1335603894_1335603974"><span
                                                        class="--name">Amaretto</span><span
                                                        class="--quantity">9</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604034"
                                                    data-id="filter_traits1335603894" value="1335604034"><label
                                                    class="f-label" for="filter_traits1335603894_1335604034"><span
                                                        class="--name">Ananas</span><span
                                                        class="--quantity">5</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --last-not-hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335605051"
                                                    data-id="filter_traits1335603894" value="1335605051"><label
                                                    class="f-label" for="filter_traits1335603894_1335605051"><span
                                                        class="--name">Anyż</span><span
                                                        class="--quantity">3</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335605582"
                                                    data-id="filter_traits1335603894" value="1335605582"><label
                                                    class="f-label" for="filter_traits1335603894_1335605582"><span
                                                        class="--name">Arbuz</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604016"
                                                    data-id="filter_traits1335603894" value="1335604016"><label
                                                    class="f-label" for="filter_traits1335603894_1335604016"><span
                                                        class="--name">Aronia</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604500"
                                                    data-id="filter_traits1335603894" value="1335604500"><label
                                                    class="f-label" for="filter_traits1335603894_1335604500"><span
                                                        class="--name">Banan</span><span
                                                        class="--quantity">5</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603986"
                                                    data-id="filter_traits1335603894" value="1335603986"><label
                                                    class="f-label" for="filter_traits1335603894_1335603986"><span
                                                        class="--name">Bergamotka</span><span
                                                        class="--quantity">12</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335605253"
                                                    data-id="filter_traits1335603894" value="1335605253"><label
                                                    class="f-label" for="filter_traits1335603894_1335605253"><span
                                                        class="--name">Biała czekolada</span><span
                                                        class="--quantity">7</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335605049"
                                                    data-id="filter_traits1335603894" value="1335605049"><label
                                                    class="f-label" for="filter_traits1335603894_1335605049"><span
                                                        class="--name">Biała herbata</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335609253"
                                                    data-id="filter_traits1335603894" value="1335609253"><label
                                                    class="f-label" for="filter_traits1335603894_1335609253"><span
                                                        class="--name">Biała porzeczka</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608432"
                                                    data-id="filter_traits1335603894" value="1335608432"><label
                                                    class="f-label" for="filter_traits1335603894_1335608432"><span
                                                        class="--name">Białe wino</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608737"
                                                    data-id="filter_traits1335603894" value="1335608737"><label
                                                    class="f-label" for="filter_traits1335603894_1335608737"><span
                                                        class="--name">Białe winogrona</span><span
                                                        class="--quantity">10</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335607532"
                                                    data-id="filter_traits1335603894" value="1335607532"><label
                                                    class="f-label" for="filter_traits1335603894_1335607532"><span
                                                        class="--name">Biały grejpfrut</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604291"
                                                    data-id="filter_traits1335603894" value="1335604291"><label
                                                    class="f-label" for="filter_traits1335603894_1335604291"><span
                                                        class="--name">Borówka</span><span
                                                        class="--quantity">9</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335607798"
                                                    data-id="filter_traits1335603894" value="1335607798"><label
                                                    class="f-label" for="filter_traits1335603894_1335607798"><span
                                                        class="--name">Bratki</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608713"
                                                    data-id="filter_traits1335603894" value="1335608713"><label
                                                    class="f-label" for="filter_traits1335603894_1335608713"><span
                                                        class="--name">Brązowy cukier</span><span
                                                        class="--quantity">10</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608442"
                                                    data-id="filter_traits1335603894" value="1335608442"><label
                                                    class="f-label" for="filter_traits1335603894_1335608442"><span
                                                        class="--name">Brownie</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604009"
                                                    data-id="filter_traits1335603894" value="1335604009"><label
                                                    class="f-label" for="filter_traits1335603894_1335604009"><span
                                                        class="--name">Brzoskwinie</span><span
                                                        class="--quantity">45</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335609136"
                                                    data-id="filter_traits1335603894" value="1335609136"><label
                                                    class="f-label" for="filter_traits1335603894_1335609136"><span
                                                        class="--name">Brzoskwiniowe Ice Tea</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335605182"
                                                    data-id="filter_traits1335603894" value="1335605182"><label
                                                    class="f-label" for="filter_traits1335603894_1335605182"><span
                                                        class="--name">Cedr</span><span
                                                        class="--quantity">4</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335605241"
                                                    data-id="filter_traits1335603894" value="1335605241"><label
                                                    class="f-label" for="filter_traits1335603894_1335605241"><span
                                                        class="--name">Chałwa</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604018"
                                                    data-id="filter_traits1335603894" value="1335604018"><label
                                                    class="f-label" for="filter_traits1335603894_1335604018"><span
                                                        class="--name">Chleb</span><span
                                                        class="--quantity">7</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335607751"
                                                    data-id="filter_traits1335603894" value="1335607751"><label
                                                    class="f-label" for="filter_traits1335603894_1335607751"><span
                                                        class="--name">Chleb tostowy</span><span
                                                        class="--quantity">3</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335606024"
                                                    data-id="filter_traits1335603894" value="1335606024"><label
                                                    class="f-label" for="filter_traits1335603894_1335606024"><span
                                                        class="--name">Chmiel</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335607588"
                                                    data-id="filter_traits1335603894" value="1335607588"><label
                                                    class="f-label" for="filter_traits1335603894_1335607588"><span
                                                        class="--name">Ciasteczko</span><span
                                                        class="--quantity">6</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604511"
                                                    data-id="filter_traits1335603894" value="1335604511"><label
                                                    class="f-label" for="filter_traits1335603894_1335604511"><span
                                                        class="--name">Ciastko czekoladowe</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608422"
                                                    data-id="filter_traits1335603894" value="1335608422"><label
                                                    class="f-label" for="filter_traits1335603894_1335608422"><span
                                                        class="--name">Ciastko maślane</span><span
                                                        class="--quantity">3</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335609288"
                                                    data-id="filter_traits1335603894" value="1335609288"><label
                                                    class="f-label" for="filter_traits1335603894_1335609288"><span
                                                        class="--name">Ciastko pekanowe</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604586"
                                                    data-id="filter_traits1335603894" value="1335604586"><label
                                                    class="f-label" for="filter_traits1335603894_1335604586"><span
                                                        class="--name">Ciasto biszkoptowe</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335607945"
                                                    data-id="filter_traits1335603894" value="1335607945"><label
                                                    class="f-label" for="filter_traits1335603894_1335607945"><span
                                                        class="--name">Ciasto migdałowe</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604060"
                                                    data-id="filter_traits1335603894" value="1335604060"><label
                                                    class="f-label" for="filter_traits1335603894_1335604060"><span
                                                        class="--name">Ciemna czekolada</span><span
                                                        class="--quantity">94</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335609123"
                                                    data-id="filter_traits1335603894" value="1335609123"><label
                                                    class="f-label" for="filter_traits1335603894_1335609123"><span
                                                        class="--name">Ciemny rum</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335609119"
                                                    data-id="filter_traits1335603894" value="1335609119"><label
                                                    class="f-label" for="filter_traits1335603894_1335609119"><span
                                                        class="--name">Cukier</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335605563"
                                                    data-id="filter_traits1335603894" value="1335605563"><label
                                                    class="f-label" for="filter_traits1335603894_1335605563"><span
                                                        class="--name">Cukierki</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608739"
                                                    data-id="filter_traits1335603894" value="1335608739"><label
                                                    class="f-label" for="filter_traits1335603894_1335608739"><span
                                                        class="--name">Cukierki Toffi</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604025"
                                                    data-id="filter_traits1335603894" value="1335604025"><label
                                                    class="f-label" for="filter_traits1335603894_1335604025"><span
                                                        class="--name">Cukier trzcinowy</span><span
                                                        class="--quantity">32</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603977"
                                                    data-id="filter_traits1335603894" value="1335603977"><label
                                                    class="f-label" for="filter_traits1335603894_1335603977"><span
                                                        class="--name">Cynamon</span><span
                                                        class="--quantity">13</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335609636"
                                                    data-id="filter_traits1335603894" value="1335609636"><label
                                                    class="f-label" for="filter_traits1335603894_1335609636"><span
                                                        class="--name">Cynamonki</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603966"
                                                    data-id="filter_traits1335603894" value="1335603966"><label
                                                    class="f-label" for="filter_traits1335603894_1335603966"><span
                                                        class="--name">Cytryna</span><span
                                                        class="--quantity">35</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603987"
                                                    data-id="filter_traits1335603894" value="1335603987"><label
                                                    class="f-label" for="filter_traits1335603894_1335603987"><span
                                                        class="--name">Czarna herbata</span><span
                                                        class="--quantity">48</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603976"
                                                    data-id="filter_traits1335603894" value="1335603976"><label
                                                    class="f-label" for="filter_traits1335603894_1335603976"><span
                                                        class="--name">Czarna porzeczka</span><span
                                                        class="--quantity">18</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604017"
                                                    data-id="filter_traits1335603894" value="1335604017"><label
                                                    class="f-label" for="filter_traits1335603894_1335604017"><span
                                                        class="--name">Czarny pieprz</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603925"
                                                    data-id="filter_traits1335603894" value="1335603925"><label
                                                    class="f-label" for="filter_traits1335603894_1335603925"><span
                                                        class="--name">Czekolada</span><span
                                                        class="--quantity">361</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335606210"
                                                    data-id="filter_traits1335603894" value="1335606210"><label
                                                    class="f-label" for="filter_traits1335603894_1335606210"><span
                                                        class="--name">Czekolada deserowa</span><span
                                                        class="--quantity">15</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604051"
                                                    data-id="filter_traits1335603894" value="1335604051"><label
                                                    class="f-label" for="filter_traits1335603894_1335604051"><span
                                                        class="--name">Czereśnie</span><span
                                                        class="--quantity">21</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604499"
                                                    data-id="filter_traits1335603894" value="1335604499"><label
                                                    class="f-label" for="filter_traits1335603894_1335604499"><span
                                                        class="--name">Czerwona pomarańcza</span><span
                                                        class="--quantity">8</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604037"
                                                    data-id="filter_traits1335603894" value="1335604037"><label
                                                    class="f-label" for="filter_traits1335603894_1335604037"><span
                                                        class="--name">Czerwona porzeczka</span><span
                                                        class="--quantity">19</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608341"
                                                    data-id="filter_traits1335603894" value="1335608341"><label
                                                    class="f-label" for="filter_traits1335603894_1335608341"><span
                                                        class="--name">Czerwona śliwka</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604277"
                                                    data-id="filter_traits1335603894" value="1335604277"><label
                                                    class="f-label" for="filter_traits1335603894_1335604277"><span
                                                        class="--name">Czerwone jabłko</span><span
                                                        class="--quantity">18</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335605629"
                                                    data-id="filter_traits1335603894" value="1335605629"><label
                                                    class="f-label" for="filter_traits1335603894_1335605629"><span
                                                        class="--name">Czerwone owoce</span><span
                                                        class="--quantity">39</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335605183"
                                                    data-id="filter_traits1335603894" value="1335605183"><label
                                                    class="f-label" for="filter_traits1335603894_1335605183"><span
                                                        class="--name">Czerwone wino</span><span
                                                        class="--quantity">5</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604036"
                                                    data-id="filter_traits1335603894" value="1335604036"><label
                                                    class="f-label" for="filter_traits1335603894_1335604036"><span
                                                        class="--name">Czerwone winogrona</span><span
                                                        class="--quantity">6</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335609377"
                                                    data-id="filter_traits1335603894" value="1335609377"><label
                                                    class="f-label" for="filter_traits1335603894_1335609377"><span
                                                        class="--name">Czerwony agrest</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603994"
                                                    data-id="filter_traits1335603894" value="1335603994"><label
                                                    class="f-label" for="filter_traits1335603894_1335603994"><span
                                                        class="--name">Czerwony grejpfrut</span><span
                                                        class="--quantity">6</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604508"
                                                    data-id="filter_traits1335603894" value="1335604508"><label
                                                    class="f-label" for="filter_traits1335603894_1335604508"><span
                                                        class="--name">Daktyle</span><span
                                                        class="--quantity">6</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604692"
                                                    data-id="filter_traits1335603894" value="1335604692"><label
                                                    class="f-label" for="filter_traits1335603894_1335604692"><span
                                                        class="--name">Drzewo sandałowe</span><span
                                                        class="--quantity">3</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604003"
                                                    data-id="filter_traits1335603894" value="1335604003"><label
                                                    class="f-label" for="filter_traits1335603894_1335604003"><span
                                                        class="--name">Dżem</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335605633"
                                                    data-id="filter_traits1335603894" value="1335605633"><label
                                                    class="f-label" for="filter_traits1335603894_1335605633"><span
                                                        class="--name">Dżem jeżynowy</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608433"
                                                    data-id="filter_traits1335603894" value="1335608433"><label
                                                    class="f-label" for="filter_traits1335603894_1335608433"><span
                                                        class="--name">Dżem malinowy</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335609519"
                                                    data-id="filter_traits1335603894" value="1335609519"><label
                                                    class="f-label" for="filter_traits1335603894_1335609519"><span
                                                        class="--name">Dżem morelowy</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608434"
                                                    data-id="filter_traits1335603894" value="1335608434"><label
                                                    class="f-label" for="filter_traits1335603894_1335608434"><span
                                                        class="--name">Dżem porzeczkowy</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335605595"
                                                    data-id="filter_traits1335603894" value="1335605595"><label
                                                    class="f-label" for="filter_traits1335603894_1335605595"><span
                                                        class="--name">Dżem truskawkowy</span><span
                                                        class="--quantity">4</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335609311"
                                                    data-id="filter_traits1335603894" value="1335609311"><label
                                                    class="f-label" for="filter_traits1335603894_1335609311"><span
                                                        class="--name">Dżem z ciemnych owoców</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608411"
                                                    data-id="filter_traits1335603894" value="1335608411"><label
                                                    class="f-label" for="filter_traits1335603894_1335608411"><span
                                                        class="--name">Dżem z owoców leśnych</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335609007"
                                                    data-id="filter_traits1335603894" value="1335609007"><label
                                                    class="f-label" for="filter_traits1335603894_1335609007"><span
                                                        class="--name">Dżem żurawinowy</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335609693"
                                                    data-id="filter_traits1335603894" value="1335609693"><label
                                                    class="f-label" for="filter_traits1335603894_1335609693"><span
                                                        class="--name">Dżem z żółtych owoców</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608988"
                                                    data-id="filter_traits1335603894" value="1335608988"><label
                                                    class="f-label" for="filter_traits1335603894_1335608988"><span
                                                        class="--name">Dzikie jagody</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335605782"
                                                    data-id="filter_traits1335603894" value="1335605782"><label
                                                    class="f-label" for="filter_traits1335603894_1335605782"><span
                                                        class="--name">Egzotyczny</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335606292"
                                                    data-id="filter_traits1335603894" value="1335606292"><label
                                                    class="f-label" for="filter_traits1335603894_1335606292"><span
                                                        class="--name">Eukaliptus</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603999"
                                                    data-id="filter_traits1335603894" value="1335603999"><label
                                                    class="f-label" for="filter_traits1335603894_1335603999"><span
                                                        class="--name">Figa</span><span
                                                        class="--quantity">8</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335606033"
                                                    data-id="filter_traits1335603894" value="1335606033"><label
                                                    class="f-label" for="filter_traits1335603894_1335606033"><span
                                                        class="--name">Fiołek</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335606153"
                                                    data-id="filter_traits1335603894" value="1335606153"><label
                                                    class="f-label" for="filter_traits1335603894_1335606153"><span
                                                        class="--name">Fistaszki</span><span
                                                        class="--quantity">4</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604624"
                                                    data-id="filter_traits1335603894" value="1335604624"><label
                                                    class="f-label" for="filter_traits1335603894_1335604624"><span
                                                        class="--name">Gałka muszkatołowa</span><span
                                                        class="--quantity">5</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603971"
                                                    data-id="filter_traits1335603894" value="1335603971"><label
                                                    class="f-label" for="filter_traits1335603894_1335603971"><span
                                                        class="--name">Gorzka czekolada</span><span
                                                        class="--quantity">80</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335605647"
                                                    data-id="filter_traits1335603894" value="1335605647"><label
                                                    class="f-label" for="filter_traits1335603894_1335605647"><span
                                                        class="--name">Goździki</span><span
                                                        class="--quantity">4</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604071"
                                                    data-id="filter_traits1335603894" value="1335604071"><label
                                                    class="f-label" for="filter_traits1335603894_1335604071"><span
                                                        class="--name">Granat</span><span
                                                        class="--quantity">7</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608758"
                                                    data-id="filter_traits1335603894" value="1335608758"><label
                                                    class="f-label" for="filter_traits1335603894_1335608758"><span
                                                        class="--name">Grejpfrut</span><span
                                                        class="--quantity">13</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604010"
                                                    data-id="filter_traits1335603894" value="1335604010"><label
                                                    class="f-label" for="filter_traits1335603894_1335604010"><span
                                                        class="--name">Gruszka</span><span
                                                        class="--quantity">7</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335605576"
                                                    data-id="filter_traits1335603894" value="1335605576"><label
                                                    class="f-label" for="filter_traits1335603894_1335605576"><span
                                                        class="--name">Guawa</span><span
                                                        class="--quantity">3</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608424"
                                                    data-id="filter_traits1335603894" value="1335608424"><label
                                                    class="f-label" for="filter_traits1335603894_1335608424"><span
                                                        class="--name">Herbata</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604504"
                                                    data-id="filter_traits1335603894" value="1335604504"><label
                                                    class="f-label" for="filter_traits1335603894_1335604504"><span
                                                        class="--name">Herbata Assam</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335609657"
                                                    data-id="filter_traits1335603894" value="1335609657"><label
                                                    class="f-label" for="filter_traits1335603894_1335609657"><span
                                                        class="--name">Herbata Ceylon</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335605852"
                                                    data-id="filter_traits1335603894" value="1335605852"><label
                                                    class="f-label" for="filter_traits1335603894_1335605852"><span
                                                        class="--name">Herbata Earl Grey</span><span
                                                        class="--quantity">5</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335609120"
                                                    data-id="filter_traits1335603894" value="1335609120"><label
                                                    class="f-label" for="filter_traits1335603894_1335609120"><span
                                                        class="--name">Herbata Oolong</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604587"
                                                    data-id="filter_traits1335603894" value="1335604587"><label
                                                    class="f-label" for="filter_traits1335603894_1335604587"><span
                                                        class="--name">Herbatniki</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335605599"
                                                    data-id="filter_traits1335603894" value="1335605599"><label
                                                    class="f-label" for="filter_traits1335603894_1335605599"><span
                                                        class="--name">Herbatniki kakaowe</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604042"
                                                    data-id="filter_traits1335603894" value="1335604042"><label
                                                    class="f-label" for="filter_traits1335603894_1335604042"><span
                                                        class="--name">Hibiskus</span><span
                                                        class="--quantity">3</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604024"
                                                    data-id="filter_traits1335603894" value="1335604024"><label
                                                    class="f-label" for="filter_traits1335603894_1335604024"><span
                                                        class="--name">Jabłko</span><span
                                                        class="--quantity">23</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335609723"
                                                    data-id="filter_traits1335603894" value="1335609723"><label
                                                    class="f-label" for="filter_traits1335603894_1335609723"><span
                                                        class="--name">Jabłko Ligol</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604063"
                                                    data-id="filter_traits1335603894" value="1335604063"><label
                                                    class="f-label" for="filter_traits1335603894_1335604063"><span
                                                        class="--name">Jagody</span><span
                                                        class="--quantity">50</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603929"
                                                    data-id="filter_traits1335603894" value="1335603929"><label
                                                    class="f-label" for="filter_traits1335603894_1335603929"><span
                                                        class="--name">Jaśmin</span><span
                                                        class="--quantity">31</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604011"
                                                    data-id="filter_traits1335603894" value="1335604011"><label
                                                    class="f-label" for="filter_traits1335603894_1335604011"><span
                                                        class="--name">Jeżyny</span><span
                                                        class="--quantity">7</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608727"
                                                    data-id="filter_traits1335603894" value="1335608727"><label
                                                    class="f-label" for="filter_traits1335603894_1335608727"><span
                                                        class="--name">Jogurt</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608991"
                                                    data-id="filter_traits1335603894" value="1335608991"><label
                                                    class="f-label" for="filter_traits1335603894_1335608991"><span
                                                        class="--name">Jogurt truskawkowy</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603945"
                                                    data-id="filter_traits1335603894" value="1335603945"><label
                                                    class="f-label" for="filter_traits1335603894_1335603945"><span
                                                        class="--name">Kakao</span><span
                                                        class="--quantity">138</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335606289"
                                                    data-id="filter_traits1335603894" value="1335606289"><label
                                                    class="f-label" for="filter_traits1335603894_1335606289"><span
                                                        class="--name">Kaktus</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608711"
                                                    data-id="filter_traits1335603894" value="1335608711"><label
                                                    class="f-label" for="filter_traits1335603894_1335608711"><span
                                                        class="--name">Kandyzowany ananas</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335605583"
                                                    data-id="filter_traits1335603894" value="1335605583"><label
                                                    class="f-label" for="filter_traits1335603894_1335605583"><span
                                                        class="--name">Kardamon</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603927"
                                                    data-id="filter_traits1335603894" value="1335603927"><label
                                                    class="f-label" for="filter_traits1335603894_1335603927"><span
                                                        class="--name">Karmel</span><span
                                                        class="--quantity">236</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335607784"
                                                    data-id="filter_traits1335603894" value="1335607784"><label
                                                    class="f-label" for="filter_traits1335603894_1335607784"><span
                                                        class="--name">Karmelizowane migdały</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608427"
                                                    data-id="filter_traits1335603894" value="1335608427"><label
                                                    class="f-label" for="filter_traits1335603894_1335608427"><span
                                                        class="--name">Karmelizowane orzechy</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335609401"
                                                    data-id="filter_traits1335603894" value="1335609401"><label
                                                    class="f-label" for="filter_traits1335603894_1335609401"><span
                                                        class="--name">Karmelizowany cukier</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608353"
                                                    data-id="filter_traits1335603894" value="1335608353"><label
                                                    class="f-label" for="filter_traits1335603894_1335608353"><span
                                                        class="--name">Karmelki</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608466"
                                                    data-id="filter_traits1335603894" value="1335608466"><label
                                                    class="f-label" for="filter_traits1335603894_1335608466"><span
                                                        class="--name">Karmelki cytrusowe</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608756"
                                                    data-id="filter_traits1335603894" value="1335608756"><label
                                                    class="f-label" for="filter_traits1335603894_1335608756"><span
                                                        class="--name">Kasztany</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603965"
                                                    data-id="filter_traits1335603894" value="1335603965"><label
                                                    class="f-label" for="filter_traits1335603894_1335603965"><span
                                                        class="--name">Kiwi</span><span
                                                        class="--quantity">5</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335605646"
                                                    data-id="filter_traits1335603894" value="1335605646"><label
                                                    class="f-label" for="filter_traits1335603894_1335605646"><span
                                                        class="--name">Kolendra</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335609517"
                                                    data-id="filter_traits1335603894" value="1335609517"><label
                                                    class="f-label" for="filter_traits1335603894_1335609517"><span
                                                        class="--name">Kompot z wiśni</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604054"
                                                    data-id="filter_traits1335603894" value="1335604054"><label
                                                    class="f-label" for="filter_traits1335603894_1335604054"><span
                                                        class="--name">Konfitury</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603952"
                                                    data-id="filter_traits1335603894" value="1335603952"><label
                                                    class="f-label" for="filter_traits1335603894_1335603952"><span
                                                        class="--name">Korzeń imbiru</span><span
                                                        class="--quantity">5</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604049"
                                                    data-id="filter_traits1335603894" value="1335604049"><label
                                                    class="f-label" for="filter_traits1335603894_1335604049"><span
                                                        class="--name">Krem kakaowy</span><span
                                                        class="--quantity">4</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604053"
                                                    data-id="filter_traits1335603894" value="1335604053"><label
                                                    class="f-label" for="filter_traits1335603894_1335604053"><span
                                                        class="--name">Krem z ciemnej czekolady</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604287"
                                                    data-id="filter_traits1335603894" value="1335604287"><label
                                                    class="f-label" for="filter_traits1335603894_1335604287"><span
                                                        class="--name">Krówka</span><span
                                                        class="--quantity">3</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335609252"
                                                    data-id="filter_traits1335603894" value="1335609252"><label
                                                    class="f-label" for="filter_traits1335603894_1335609252"><span
                                                        class="--name">Kwiat czarnego bzu</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608467"
                                                    data-id="filter_traits1335603894" value="1335608467"><label
                                                    class="f-label" for="filter_traits1335603894_1335608467"><span
                                                        class="--name">Kwiat jabłoni</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335607840"
                                                    data-id="filter_traits1335603894" value="1335607840"><label
                                                    class="f-label" for="filter_traits1335603894_1335607840"><span
                                                        class="--name">Kwiat pomarańczy</span><span
                                                        class="--quantity">4</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603937"
                                                    data-id="filter_traits1335603894" value="1335603937"><label
                                                    class="f-label" for="filter_traits1335603894_1335603937"><span
                                                        class="--name">Kwiaty</span><span
                                                        class="--quantity">76</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604415"
                                                    data-id="filter_traits1335603894" value="1335604415"><label
                                                    class="f-label" for="filter_traits1335603894_1335604415"><span
                                                        class="--name">Landrynki</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335607867"
                                                    data-id="filter_traits1335603894" value="1335607867"><label
                                                    class="f-label" for="filter_traits1335603894_1335607867"><span
                                                        class="--name">Lawenda</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335609692"
                                                    data-id="filter_traits1335603894" value="1335609692"><label
                                                    class="f-label" for="filter_traits1335603894_1335609692"><span
                                                        class="--name">Lemoniada porzeczkowa</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604828"
                                                    data-id="filter_traits1335603894" value="1335604828"><label
                                                    class="f-label" for="filter_traits1335603894_1335604828"><span
                                                        class="--name">Liczi</span><span
                                                        class="--quantity">3</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335605780"
                                                    data-id="filter_traits1335603894" value="1335605780"><label
                                                    class="f-label" for="filter_traits1335603894_1335605780"><span
                                                        class="--name">Likier</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604057"
                                                    data-id="filter_traits1335603894" value="1335604057"><label
                                                    class="f-label" for="filter_traits1335603894_1335604057"><span
                                                        class="--name">Limonka</span><span
                                                        class="--quantity">18</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603933"
                                                    data-id="filter_traits1335603894" value="1335603933"><label
                                                    class="f-label" for="filter_traits1335603894_1335603933"><span
                                                        class="--name">Liść tytoniu</span><span
                                                        class="--quantity">20</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603959"
                                                    data-id="filter_traits1335603894" value="1335603959"><label
                                                    class="f-label" for="filter_traits1335603894_1335603959"><span
                                                        class="--name">Lukrecja</span><span
                                                        class="--quantity">9</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604494"
                                                    data-id="filter_traits1335603894" value="1335604494"><label
                                                    class="f-label" for="filter_traits1335603894_1335604494"><span
                                                        class="--name">Makadamia</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335607733"
                                                    data-id="filter_traits1335603894" value="1335607733"><label
                                                    class="f-label" for="filter_traits1335603894_1335607733"><span
                                                        class="--name">Malina liofilizowana</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603964"
                                                    data-id="filter_traits1335603894" value="1335603964"><label
                                                    class="f-label" for="filter_traits1335603894_1335603964"><span
                                                        class="--name">Maliny</span><span
                                                        class="--quantity">39</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603958"
                                                    data-id="filter_traits1335603894" value="1335603958"><label
                                                    class="f-label" for="filter_traits1335603894_1335603958"><span
                                                        class="--name">Mandarynka</span><span
                                                        class="--quantity">15</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604029"
                                                    data-id="filter_traits1335603894" value="1335604029"><label
                                                    class="f-label" for="filter_traits1335603894_1335604029"><span
                                                        class="--name">Mango</span><span
                                                        class="--quantity">16</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604067"
                                                    data-id="filter_traits1335603894" value="1335604067"><label
                                                    class="f-label" for="filter_traits1335603894_1335604067"><span
                                                        class="--name">Marakuja</span><span
                                                        class="--quantity">6</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603995"
                                                    data-id="filter_traits1335603894" value="1335603995"><label
                                                    class="f-label" for="filter_traits1335603894_1335603995"><span
                                                        class="--name">Marcepan</span><span
                                                        class="--quantity">36</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603978"
                                                    data-id="filter_traits1335603894" value="1335603978"><label
                                                    class="f-label" for="filter_traits1335603894_1335603978"><span
                                                        class="--name">Masło orzechowe</span><span
                                                        class="--quantity">9</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604030"
                                                    data-id="filter_traits1335603894" value="1335604030"><label
                                                    class="f-label" for="filter_traits1335603894_1335604030"><span
                                                        class="--name">Melasa</span><span
                                                        class="--quantity">22</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603996"
                                                    data-id="filter_traits1335603894" value="1335603996"><label
                                                    class="f-label" for="filter_traits1335603894_1335603996"><span
                                                        class="--name">Melon</span><span
                                                        class="--quantity">9</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604679"
                                                    data-id="filter_traits1335603894" value="1335604679"><label
                                                    class="f-label" for="filter_traits1335603894_1335604679"><span
                                                        class="--name">Mięta</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603949"
                                                    data-id="filter_traits1335603894" value="1335603949"><label
                                                    class="f-label" for="filter_traits1335603894_1335603949"><span
                                                        class="--name">Migdały</span><span
                                                        class="--quantity">79</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603940"
                                                    data-id="filter_traits1335603894" value="1335603940"><label
                                                    class="f-label" for="filter_traits1335603894_1335603940"><span
                                                        class="--name">Miód</span><span
                                                        class="--quantity">89</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608450"
                                                    data-id="filter_traits1335603894" value="1335608450"><label
                                                    class="f-label" for="filter_traits1335603894_1335608450"><span
                                                        class="--name">Miód lipowy</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604281"
                                                    data-id="filter_traits1335603894" value="1335604281"><label
                                                    class="f-label" for="filter_traits1335603894_1335604281"><span
                                                        class="--name">Mirabelka</span><span
                                                        class="--quantity">5</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603968"
                                                    data-id="filter_traits1335603894" value="1335603968"><label
                                                    class="f-label" for="filter_traits1335603894_1335603968"><span
                                                        class="--name">Mleczna czekolada</span><span
                                                        class="--quantity">83</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608721"
                                                    data-id="filter_traits1335603894" value="1335608721"><label
                                                    class="f-label" for="filter_traits1335603894_1335608721"><span
                                                        class="--name">Mleko owsiane</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604035"
                                                    data-id="filter_traits1335603894" value="1335604035"><label
                                                    class="f-label" for="filter_traits1335603894_1335604035"><span
                                                        class="--name">Morela</span><span
                                                        class="--quantity">26</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604048"
                                                    data-id="filter_traits1335603894" value="1335604048"><label
                                                    class="f-label" for="filter_traits1335603894_1335604048"><span
                                                        class="--name">Mus czekoladowy</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604065"
                                                    data-id="filter_traits1335603894" value="1335604065"><label
                                                    class="f-label" for="filter_traits1335603894_1335604065"><span
                                                        class="--name">Nektarynka</span><span
                                                        class="--quantity">5</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603984"
                                                    data-id="filter_traits1335603894" value="1335603984"><label
                                                    class="f-label" for="filter_traits1335603894_1335603984"><span
                                                        class="--name">Nugat</span><span
                                                        class="--quantity">34</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335605050"
                                                    data-id="filter_traits1335603894" value="1335605050"><label
                                                    class="f-label" for="filter_traits1335603894_1335605050"><span
                                                        class="--name">Nutella</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335607486"
                                                    data-id="filter_traits1335603894" value="1335607486"><label
                                                    class="f-label" for="filter_traits1335603894_1335607486"><span
                                                        class="--name">Orzech laskowy</span><span
                                                        class="--quantity">28</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604383"
                                                    data-id="filter_traits1335603894" value="1335604383"><label
                                                    class="f-label" for="filter_traits1335603894_1335604383"><span
                                                        class="--name">Orzechowe ciasteczka</span><span
                                                        class="--quantity">12</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608704"
                                                    data-id="filter_traits1335603894" value="1335608704"><label
                                                    class="f-label" for="filter_traits1335603894_1335608704"><span
                                                        class="--name">Orzech włoski</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603895"
                                                    data-id="filter_traits1335603894" value="1335603895"><label
                                                    class="f-label" for="filter_traits1335603894_1335603895"><span
                                                        class="--name">Orzechy</span><span
                                                        class="--quantity">297</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608423"
                                                    data-id="filter_traits1335603894" value="1335608423"><label
                                                    class="f-label" for="filter_traits1335603894_1335608423"><span
                                                        class="--name">Orzechy laskowe</span><span
                                                        class="--quantity">6</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335609637"
                                                    data-id="filter_traits1335603894" value="1335609637"><label
                                                    class="f-label" for="filter_traits1335603894_1335609637"><span
                                                        class="--name">Orzechy makadamia</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335607791"
                                                    data-id="filter_traits1335603894" value="1335607791"><label
                                                    class="f-label" for="filter_traits1335603894_1335607791"><span
                                                        class="--name">Orzechy nerkowca</span><span
                                                        class="--quantity">3</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608732"
                                                    data-id="filter_traits1335603894" value="1335608732"><label
                                                    class="f-label" for="filter_traits1335603894_1335608732"><span
                                                        class="--name">Orzechy piniowe</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335607944"
                                                    data-id="filter_traits1335603894" value="1335607944"><label
                                                    class="f-label" for="filter_traits1335603894_1335607944"><span
                                                        class="--name">Orzechy włoskie</span><span
                                                        class="--quantity">6</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335606221"
                                                    data-id="filter_traits1335603894" value="1335606221"><label
                                                    class="f-label" for="filter_traits1335603894_1335606221"><span
                                                        class="--name">Orzechy w miodzie</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608419"
                                                    data-id="filter_traits1335603894" value="1335608419"><label
                                                    class="f-label" for="filter_traits1335603894_1335608419"><span
                                                        class="--name">Orzeszki koli</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608435"
                                                    data-id="filter_traits1335603894" value="1335608435"><label
                                                    class="f-label" for="filter_traits1335603894_1335608435"><span
                                                        class="--name">Owoc dzikiej róży</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604026"
                                                    data-id="filter_traits1335603894" value="1335604026"><label
                                                    class="f-label" for="filter_traits1335603894_1335604026"><span
                                                        class="--name">Owoce</span><span
                                                        class="--quantity">66</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603930"
                                                    data-id="filter_traits1335603894" value="1335603930"><label
                                                    class="f-label" for="filter_traits1335603894_1335603930"><span
                                                        class="--name">Owoce cytrusowe</span><span
                                                        class="--quantity">97</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335609570"
                                                    data-id="filter_traits1335603894" value="1335609570"><label
                                                    class="f-label" for="filter_traits1335603894_1335609570"><span
                                                        class="--name">owoce czerwone</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603941"
                                                    data-id="filter_traits1335603894" value="1335603941"><label
                                                    class="f-label" for="filter_traits1335603894_1335603941"><span
                                                        class="--name">Owoce kandyzowane</span><span
                                                        class="--quantity">11</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603934"
                                                    data-id="filter_traits1335603894" value="1335603934"><label
                                                    class="f-label" for="filter_traits1335603894_1335603934"><span
                                                        class="--name">Owoce leśne</span><span
                                                        class="--quantity">15</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604292"
                                                    data-id="filter_traits1335603894" value="1335604292"><label
                                                    class="f-label" for="filter_traits1335603894_1335604292"><span
                                                        class="--name">Owoce pestkowe</span><span
                                                        class="--quantity">13</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603947"
                                                    data-id="filter_traits1335603894" value="1335603947"><label
                                                    class="f-label" for="filter_traits1335603894_1335603947"><span
                                                        class="--name">Owoce tropikalne</span><span
                                                        class="--quantity">20</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608418"
                                                    data-id="filter_traits1335603894" value="1335608418"><label
                                                    class="f-label" for="filter_traits1335603894_1335608418"><span
                                                        class="--name">Owoce tropikalne w czekoladzie</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335609694"
                                                    data-id="filter_traits1335603894" value="1335609694"><label
                                                    class="f-label" for="filter_traits1335603894_1335609694"><span
                                                        class="--name">Palony cukier</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335605044"
                                                    data-id="filter_traits1335603894" value="1335605044"><label
                                                    class="f-label" for="filter_traits1335603894_1335605044"><span
                                                        class="--name">Papaja</span><span
                                                        class="--quantity">10</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603991"
                                                    data-id="filter_traits1335603894" value="1335603991"><label
                                                    class="f-label" for="filter_traits1335603894_1335603991"><span
                                                        class="--name">Pieczone ciasto</span><span
                                                        class="--quantity">3</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335605598"
                                                    data-id="filter_traits1335603894" value="1335605598"><label
                                                    class="f-label" for="filter_traits1335603894_1335605598"><span
                                                        class="--name">Pieczone jabłko</span><span
                                                        class="--quantity">3</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335607786"
                                                    data-id="filter_traits1335603894" value="1335607786"><label
                                                    class="f-label" for="filter_traits1335603894_1335607786"><span
                                                        class="--name">Pieczone kasztany</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604501"
                                                    data-id="filter_traits1335603894" value="1335604501"><label
                                                    class="f-label" for="filter_traits1335603894_1335604501"><span
                                                        class="--name">Pieczony ananas</span><span
                                                        class="--quantity">3</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608787"
                                                    data-id="filter_traits1335603894" value="1335608787"><label
                                                    class="f-label" for="filter_traits1335603894_1335608787"><span
                                                        class="--name">Pieczywo tostowe</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608476"
                                                    data-id="filter_traits1335603894" value="1335608476"><label
                                                    class="f-label" for="filter_traits1335603894_1335608476"><span
                                                        class="--name">Piernik</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335605924"
                                                    data-id="filter_traits1335603894" value="1335605924"><label
                                                    class="f-label" for="filter_traits1335603894_1335605924"><span
                                                        class="--name">Pigwa</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335606201"
                                                    data-id="filter_traits1335603894" value="1335606201"><label
                                                    class="f-label" for="filter_traits1335603894_1335606201"><span
                                                        class="--name">Pikantne przyprawy</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608733"
                                                    data-id="filter_traits1335603894" value="1335608733"><label
                                                    class="f-label" for="filter_traits1335603894_1335608733"><span
                                                        class="--name">Pina Colada</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335609124"
                                                    data-id="filter_traits1335603894" value="1335609124"><label
                                                    class="f-label" for="filter_traits1335603894_1335609124"><span
                                                        class="--name">Pistacja</span><span
                                                        class="--quantity">3</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603961"
                                                    data-id="filter_traits1335603894" value="1335603961"><label
                                                    class="f-label" for="filter_traits1335603894_1335603961"><span
                                                        class="--name">Pomarańcze</span><span
                                                        class="--quantity">48</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335605533"
                                                    data-id="filter_traits1335603894" value="1335605533"><label
                                                    class="f-label" for="filter_traits1335603894_1335605533"><span
                                                        class="--name">Pomelo</span><span
                                                        class="--quantity">3</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335609400"
                                                    data-id="filter_traits1335603894" value="1335609400"><label
                                                    class="f-label" for="filter_traits1335603894_1335609400"><span
                                                        class="--name">Pomidor</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608728"
                                                    data-id="filter_traits1335603894" value="1335608728"><label
                                                    class="f-label" for="filter_traits1335603894_1335608728"><span
                                                        class="--name">Porzeczka</span><span
                                                        class="--quantity">5</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604278"
                                                    data-id="filter_traits1335603894" value="1335604278"><label
                                                    class="f-label" for="filter_traits1335603894_1335604278"><span
                                                        class="--name">Poziomki</span><span
                                                        class="--quantity">9</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335605433"
                                                    data-id="filter_traits1335603894" value="1335605433"><label
                                                    class="f-label" for="filter_traits1335603894_1335605433"><span
                                                        class="--name">Pralina</span><span
                                                        class="--quantity">5</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604061"
                                                    data-id="filter_traits1335603894" value="1335604061"><label
                                                    class="f-label" for="filter_traits1335603894_1335604061"><span
                                                        class="--name">Prażone migdały</span><span
                                                        class="--quantity">11</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604050"
                                                    data-id="filter_traits1335603894" value="1335604050"><label
                                                    class="f-label" for="filter_traits1335603894_1335604050"><span
                                                        class="--name">Prażone orzechy</span><span
                                                        class="--quantity">32</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608425"
                                                    data-id="filter_traits1335603894" value="1335608425"><label
                                                    class="f-label" for="filter_traits1335603894_1335608425"><span
                                                        class="--name">Prażone orzechy laskowe</span><span
                                                        class="--quantity">4</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608004"
                                                    data-id="filter_traits1335603894" value="1335608004"><label
                                                    class="f-label" for="filter_traits1335603894_1335608004"><span
                                                        class="--name">Prażone orzechy ziemne</span><span
                                                        class="--quantity">4</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603955"
                                                    data-id="filter_traits1335603894" value="1335603955"><label
                                                    class="f-label" for="filter_traits1335603894_1335603955"><span
                                                        class="--name">Prażone zboża</span><span
                                                        class="--quantity">4</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608412"
                                                    data-id="filter_traits1335603894" value="1335608412"><label
                                                    class="f-label" for="filter_traits1335603894_1335608412"><span
                                                        class="--name">Precle</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335607528"
                                                    data-id="filter_traits1335603894" value="1335607528"><label
                                                    class="f-label" for="filter_traits1335603894_1335607528"><span
                                                        class="--name">Prince Polo</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603960"
                                                    data-id="filter_traits1335603894" value="1335603960"><label
                                                    class="f-label" for="filter_traits1335603894_1335603960"><span
                                                        class="--name">Przyprawa korzenna</span><span
                                                        class="--quantity">24</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603932"
                                                    data-id="filter_traits1335603894" value="1335603932"><label
                                                    class="f-label" for="filter_traits1335603894_1335603932"><span
                                                        class="--name">Przyprawy</span><span
                                                        class="--quantity">31</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608187"
                                                    data-id="filter_traits1335603894" value="1335608187"><label
                                                    class="f-label" for="filter_traits1335603894_1335608187"><span
                                                        class="--name">Pu-erh</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603980"
                                                    data-id="filter_traits1335603894" value="1335603980"><label
                                                    class="f-label" for="filter_traits1335603894_1335603980"><span
                                                        class="--name">Rabarbar</span><span
                                                        class="--quantity">15</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603944"
                                                    data-id="filter_traits1335603894" value="1335603944"><label
                                                    class="f-label" for="filter_traits1335603894_1335603944"><span
                                                        class="--name">Rodzynki</span><span
                                                        class="--quantity">17</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335606129"
                                                    data-id="filter_traits1335603894" value="1335606129"><label
                                                    class="f-label" for="filter_traits1335603894_1335606129"><span
                                                        class="--name">Róża</span><span
                                                        class="--quantity">3</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604068"
                                                    data-id="filter_traits1335603894" value="1335604068"><label
                                                    class="f-label" for="filter_traits1335603894_1335604068"><span
                                                        class="--name">Różowy grejpfrut</span><span
                                                        class="--quantity">18</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604052"
                                                    data-id="filter_traits1335603894" value="1335604052"><label
                                                    class="f-label" for="filter_traits1335603894_1335604052"><span
                                                        class="--name">Rum</span><span
                                                        class="--quantity">13</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608007"
                                                    data-id="filter_traits1335603894" value="1335608007"><label
                                                    class="f-label" for="filter_traits1335603894_1335608007"><span
                                                        class="--name">Ryż preparowany</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335605566"
                                                    data-id="filter_traits1335603894" value="1335605566"><label
                                                    class="f-label" for="filter_traits1335603894_1335605566"><span
                                                        class="--name">Skórka cytryny</span><span
                                                        class="--quantity">5</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335607943"
                                                    data-id="filter_traits1335603894" value="1335607943"><label
                                                    class="f-label" for="filter_traits1335603894_1335607943"><span
                                                        class="--name">Skórka limonki</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335609695"
                                                    data-id="filter_traits1335603894" value="1335609695"><label
                                                    class="f-label" for="filter_traits1335603894_1335609695"><span
                                                        class="--name">Skórka pieczonego chleba</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604286"
                                                    data-id="filter_traits1335603894" value="1335604286"><label
                                                    class="f-label" for="filter_traits1335603894_1335604286"><span
                                                        class="--name">Skórka pomarańczy</span><span
                                                        class="--quantity">15</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603992"
                                                    data-id="filter_traits1335603894" value="1335603992"><label
                                                    class="f-label" for="filter_traits1335603894_1335603992"><span
                                                        class="--name">Śliwka</span><span
                                                        class="--quantity">47</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335605045"
                                                    data-id="filter_traits1335603894" value="1335605045"><label
                                                    class="f-label" for="filter_traits1335603894_1335605045"><span
                                                        class="--name">Śliwka w czekoladzie</span><span
                                                        class="--quantity">3</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335607607"
                                                    data-id="filter_traits1335603894" value="1335607607"><label
                                                    class="f-label" for="filter_traits1335603894_1335607607"><span
                                                        class="--name">Słód</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603951"
                                                    data-id="filter_traits1335603894" value="1335603951"><label
                                                    class="f-label" for="filter_traits1335603894_1335603951"><span
                                                        class="--name">Słodkie owoce</span><span
                                                        class="--quantity">8</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608759"
                                                    data-id="filter_traits1335603894" value="1335608759"><label
                                                    class="f-label" for="filter_traits1335603894_1335608759"><span
                                                        class="--name">Ślwki</span><span
                                                        class="--quantity">3</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335609518"
                                                    data-id="filter_traits1335603894" value="1335609518"><label
                                                    class="f-label" for="filter_traits1335603894_1335609518"><span
                                                        class="--name">Sok jabłko-wiśnia</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335606291"
                                                    data-id="filter_traits1335603894" value="1335606291"><label
                                                    class="f-label" for="filter_traits1335603894_1335606291"><span
                                                        class="--name">Sól morska</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335609310"
                                                    data-id="filter_traits1335603894" value="1335609310"><label
                                                    class="f-label" for="filter_traits1335603894_1335609310"><span
                                                        class="--name">Suszona brzoskwinia</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603943"
                                                    data-id="filter_traits1335603894" value="1335603943"><label
                                                    class="f-label" for="filter_traits1335603894_1335603943"><span
                                                        class="--name">Suszona morela</span><span
                                                        class="--quantity">7</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604040"
                                                    data-id="filter_traits1335603894" value="1335604040"><label
                                                    class="f-label" for="filter_traits1335603894_1335604040"><span
                                                        class="--name">Suszona śliwka</span><span
                                                        class="--quantity">12</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335605490"
                                                    data-id="filter_traits1335603894" value="1335605490"><label
                                                    class="f-label" for="filter_traits1335603894_1335605490"><span
                                                        class="--name">Suszona żurawina</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335606034"
                                                    data-id="filter_traits1335603894" value="1335606034"><label
                                                    class="f-label" for="filter_traits1335603894_1335606034"><span
                                                        class="--name">Suszone jabłko</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603970"
                                                    data-id="filter_traits1335603894" value="1335603970"><label
                                                    class="f-label" for="filter_traits1335603894_1335603970"><span
                                                        class="--name">Suszone owoce</span><span
                                                        class="--quantity">52</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608987"
                                                    data-id="filter_traits1335603894" value="1335608987"><label
                                                    class="f-label" for="filter_traits1335603894_1335608987"><span
                                                        class="--name">Suszone pomidory</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608468"
                                                    data-id="filter_traits1335603894" value="1335608468"><label
                                                    class="f-label" for="filter_traits1335603894_1335608468"><span
                                                        class="--name">Suszone zioła</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604264"
                                                    data-id="filter_traits1335603894" value="1335604264"><label
                                                    class="f-label" for="filter_traits1335603894_1335604264"><span
                                                        class="--name">Syrop klonowy</span><span
                                                        class="--quantity">14</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335609762"
                                                    data-id="filter_traits1335603894" value="1335609762"><label
                                                    class="f-label" for="filter_traits1335603894_1335609762"><span
                                                        class="--name">Syrop z granatu</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335605570"
                                                    data-id="filter_traits1335603894" value="1335605570"><label
                                                    class="f-label" for="filter_traits1335603894_1335605570"><span
                                                        class="--name">Szarlotka</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604015"
                                                    data-id="filter_traits1335603894" value="1335604015"><label
                                                    class="f-label" for="filter_traits1335603894_1335604015"><span
                                                        class="--name">Szlachetne drewno</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335606290"
                                                    data-id="filter_traits1335603894" value="1335606290"><label
                                                    class="f-label" for="filter_traits1335603894_1335606290"><span
                                                        class="--name">Tequila</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603962"
                                                    data-id="filter_traits1335603894" value="1335603962"><label
                                                    class="f-label" for="filter_traits1335603894_1335603962"><span
                                                        class="--name">Toffi</span><span
                                                        class="--quantity">22</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603969"
                                                    data-id="filter_traits1335603894" value="1335603969"><label
                                                    class="f-label" for="filter_traits1335603894_1335603969"><span
                                                        class="--name">Tosty</span><span
                                                        class="--quantity">5</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603988"
                                                    data-id="filter_traits1335603894" value="1335603988"><label
                                                    class="f-label" for="filter_traits1335603894_1335603988"><span
                                                        class="--name">Trawa cytrynowa</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335605781"
                                                    data-id="filter_traits1335603894" value="1335605781"><label
                                                    class="f-label" for="filter_traits1335603894_1335605781"><span
                                                        class="--name">Tropikalny</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604002"
                                                    data-id="filter_traits1335603894" value="1335604002"><label
                                                    class="f-label" for="filter_traits1335603894_1335604002"><span
                                                        class="--name">Truskawki</span><span
                                                        class="--quantity">31</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608098"
                                                    data-id="filter_traits1335603894" value="1335608098"><label
                                                    class="f-label" for="filter_traits1335603894_1335608098"><span
                                                        class="--name">Truskawki w czekoladzie</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335605564"
                                                    data-id="filter_traits1335603894" value="1335605564"><label
                                                    class="f-label" for="filter_traits1335603894_1335605564"><span
                                                        class="--name">Trzcina cukrowa</span><span
                                                        class="--quantity">6</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608871"
                                                    data-id="filter_traits1335603894" value="1335608871"><label
                                                    class="f-label" for="filter_traits1335603894_1335608871"><span
                                                        class="--name">Tytoń</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335605975"
                                                    data-id="filter_traits1335603894" value="1335605975"><label
                                                    class="f-label" for="filter_traits1335603894_1335605975"><span
                                                        class="--name">Wafelek czekoladowy</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335609449"
                                                    data-id="filter_traits1335603894" value="1335609449"><label
                                                    class="f-label" for="filter_traits1335603894_1335609449"><span
                                                        class="--name">Wafle kakaowe</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603928"
                                                    data-id="filter_traits1335603894" value="1335603928"><label
                                                    class="f-label" for="filter_traits1335603894_1335603928"><span
                                                        class="--name">Wanilia</span><span
                                                        class="--quantity">49</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335605976"
                                                    data-id="filter_traits1335603894" value="1335605976"><label
                                                    class="f-label" for="filter_traits1335603894_1335605976"><span
                                                        class="--name">Wędzona śliwka</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608705"
                                                    data-id="filter_traits1335603894" value="1335608705"><label
                                                    class="f-label" for="filter_traits1335603894_1335608705"><span
                                                        class="--name">Werbena</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335605532"
                                                    data-id="filter_traits1335603894" value="1335605532"><label
                                                    class="f-label" for="filter_traits1335603894_1335605532"><span
                                                        class="--name">Whisky</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335607785"
                                                    data-id="filter_traits1335603894" value="1335607785"><label
                                                    class="f-label" for="filter_traits1335603894_1335607785"><span
                                                        class="--name">Wiciokrzew</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608712"
                                                    data-id="filter_traits1335603894" value="1335608712"><label
                                                    class="f-label" for="filter_traits1335603894_1335608712"><span
                                                        class="--name">Wino</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604056"
                                                    data-id="filter_traits1335603894" value="1335604056"><label
                                                    class="f-label" for="filter_traits1335603894_1335604056"><span
                                                        class="--name">Winogrona</span><span
                                                        class="--quantity">15</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335605246"
                                                    data-id="filter_traits1335603894" value="1335605246"><label
                                                    class="f-label" for="filter_traits1335603894_1335605246"><span
                                                        class="--name">Wino musujące</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604032"
                                                    data-id="filter_traits1335603894" value="1335604032"><label
                                                    class="f-label" for="filter_traits1335603894_1335604032"><span
                                                        class="--name">Wiśnia</span><span
                                                        class="--quantity">44</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335605573"
                                                    data-id="filter_traits1335603894" value="1335605573"><label
                                                    class="f-label" for="filter_traits1335603894_1335605573"><span
                                                        class="--name">Wiśnia w czekoladzie</span><span
                                                        class="--quantity">4</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335606202"
                                                    data-id="filter_traits1335603894" value="1335606202"><label
                                                    class="f-label" for="filter_traits1335603894_1335606202"><span
                                                        class="--name">Wiśniowe konfitury</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335608916"
                                                    data-id="filter_traits1335603894" value="1335608916"><label
                                                    class="f-label" for="filter_traits1335603894_1335608916"><span
                                                        class="--name">Zboże</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604619"
                                                    data-id="filter_traits1335603894" value="1335604619"><label
                                                    class="f-label" for="filter_traits1335603894_1335604619"><span
                                                        class="--name">Zielona herbata</span><span
                                                        class="--quantity">5</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604282"
                                                    data-id="filter_traits1335603894" value="1335604282"><label
                                                    class="f-label" for="filter_traits1335603894_1335604282"><span
                                                        class="--name">Zielone jabłko</span><span
                                                        class="--quantity">2</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604008"
                                                    data-id="filter_traits1335603894" value="1335604008"><label
                                                    class="f-label" for="filter_traits1335603894_1335604008"><span
                                                        class="--name">Zioła</span><span
                                                        class="--quantity">8</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335604503"
                                                    data-id="filter_traits1335603894" value="1335604503"><label
                                                    class="f-label" for="filter_traits1335603894_1335604503"><span
                                                        class="--name">Żółte owoce</span><span
                                                        class="--quantity">24</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335606164"
                                                    data-id="filter_traits1335603894" value="1335606164"><label
                                                    class="f-label" for="filter_traits1335603894_1335606164"><span
                                                        class="--name">Żółte śliwki</span><span
                                                        class="--quantity">4</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603894_1335603993"
                                                    data-id="filter_traits1335603894" value="1335603993"><label
                                                    class="f-label" for="filter_traits1335603894_1335603993"><span
                                                        class="--name">Żurawina</span><span
                                                        class="--quantity">15</span></label></div>
                                        </li>
                                    </ul>
                                    <div class="filters__options"><a class="--show-hidden btn py-0 pl-0 pr-0"
                                            data-id="filter_traits1335603894"><span class="--show">+
                                                Rozwiń</span><span class="--hide">- Ukryj</span></a><button
                                            type="submit" class="--submit btn --solid --small">
                                            Filtruj
                                        </button><button type="submit" class="--remove btn" title="Wyczyść filtry">
                                            Wyczyść filtry
                                        </button></div>
                                </div>
                            </div>
                            <div class="filter-element filters__block --hide"><input type="hidden" class="__serialize"
                                    id="filter_traits1335603533_input" name="filter_traits[1335603533]" value=""><a
                                    class="filters__toggler
    								" data-id="filter_traits1335603533">
                                    <div class="btn --icon-right d-block pr-4"><span class="d-none d-md-block"
                                            old_text="Przeznaczenie ">Przeznaczenie </span><span
                                            class="d-md-none">Przeznaczenie </span></div>
                                </a>
                                <div class="filters__expand p-md-2 pt-md-3" id="filter_traits1335603533_expand">
                                    <ul class="filters__content --list" id="filter_traits1335603533_content">
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603533_1335603580"
                                                    data-id="filter_traits1335603533" value="1335603580"><label
                                                    class="f-label" for="filter_traits1335603533_1335603580"><span
                                                        class="--name">Do alternatyw</span><span
                                                        class="--quantity">360</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603533_1335603581"
                                                    data-id="filter_traits1335603533" value="1335603581"><label
                                                    class="f-label" for="filter_traits1335603533_1335603581"><span
                                                        class="--name">Do biura</span><span
                                                        class="--quantity">642</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603533_1335603578"
                                                    data-id="filter_traits1335603533" value="1335603578"><label
                                                    class="f-label" for="filter_traits1335603533_1335603578"><span
                                                        class="--name">Do domu</span><span
                                                        class="--quantity">1162</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603533_1335603592"
                                                    data-id="filter_traits1335603533" value="1335603592"><label
                                                    class="f-label" for="filter_traits1335603533_1335603592"><span
                                                        class="--name">Do ekspresu automatycznego</span><span
                                                        class="--quantity">1077</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --last-not-hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603533_1335603593"
                                                    data-id="filter_traits1335603533" value="1335603593"><label
                                                    class="f-label" for="filter_traits1335603533_1335603593"><span
                                                        class="--name">Do ekspresu kolbowego</span><span
                                                        class="--quantity">1079</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603533_1335609115"
                                                    data-id="filter_traits1335603533" value="1335609115"><label
                                                    class="f-label" for="filter_traits1335603533_1335609115"><span
                                                        class="--name">Do ekspresu przelewowego</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603533_1335606212"
                                                    data-id="filter_traits1335603533" value="1335606212"><label
                                                    class="f-label" for="filter_traits1335603533_1335606212"><span
                                                        class="--name">Do espresso</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603533_1335603690"
                                                    data-id="filter_traits1335603533" value="1335603690"><label
                                                    class="f-label" for="filter_traits1335603533_1335603690"><span
                                                        class="--name">Do gastronomii</span><span
                                                        class="--quantity">77</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603533_1335603594"
                                                    data-id="filter_traits1335603533" value="1335603594"><label
                                                    class="f-label" for="filter_traits1335603533_1335603594"><span
                                                        class="--name">Do kawiarki</span><span
                                                        class="--quantity">307</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603533_1335603579"
                                                    data-id="filter_traits1335603533" value="1335603579"><label
                                                    class="f-label" for="filter_traits1335603533_1335603579"><span
                                                        class="--name">Do kawiarni</span><span
                                                        class="--quantity">478</span></label></div>
                                        </li>
                                    </ul>
                                    <div class="filters__options"><a class="--show-hidden btn py-0 pl-0 pr-0"
                                            data-id="filter_traits1335603533"><span class="--show">+
                                                Rozwiń</span><span class="--hide">- Ukryj</span></a><button
                                            type="submit" class="--submit btn --solid --small">
                                            Filtruj
                                        </button><button type="submit" class="--remove btn" title="Wyczyść filtry">
                                            Wyczyść filtry
                                        </button></div>
                                </div>
                            </div>
                            <div class="filter-element filters__block --hide"><input type="hidden" class="__serialize"
                                    id="filter_traits1335603586_input" name="filter_traits[1335603586]" value=""><a
                                    class="filters__toggler
    								" data-id="filter_traits1335603586">
                                    <div class="btn --icon-right d-block pr-4"><span class="d-none d-md-block"
                                            old_text="Palarnia">Palarnia</span><span class="d-md-none">Palarnia</span>
                                    </div>
                                </a>
                                <div class="filters__expand p-md-2 pt-md-3" id="filter_traits1335603586_expand">
                                    <ul class="filters__content --list" id="filter_traits1335603586_content">
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603586_1335603595"
                                                    data-id="filter_traits1335603586" value="1335603595"><label
                                                    class="f-label" for="filter_traits1335603586_1335603595"><span
                                                        class="--name">Anglia</span><span
                                                        class="--quantity">30</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603586_1335604031"
                                                    data-id="filter_traits1335603586" value="1335604031"><label
                                                    class="f-label" for="filter_traits1335603586_1335604031"><span
                                                        class="--name">Hiszpania</span><span
                                                        class="--quantity">14</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603586_1335604678"
                                                    data-id="filter_traits1335603586" value="1335604678"><label
                                                    class="f-label" for="filter_traits1335603586_1335604678"><span
                                                        class="--name">Holandia</span><span
                                                        class="--quantity">9</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																  ">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603586_1335603876"
                                                    data-id="filter_traits1335603586" value="1335603876"><label
                                                    class="f-label" for="filter_traits1335603586_1335603876"><span
                                                        class="--name">Kolumbia</span><span
                                                        class="--quantity">9</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --last-not-hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603586_1335603597"
                                                    data-id="filter_traits1335603586" value="1335603597"><label
                                                    class="f-label" for="filter_traits1335603586_1335603597"><span
                                                        class="--name">Polska</span><span
                                                        class="--quantity">621</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603586_1335608760"
                                                    data-id="filter_traits1335603586" value="1335608760"><label
                                                    class="f-label" for="filter_traits1335603586_1335608760"><span
                                                        class="--name">Rumunia</span><span
                                                        class="--quantity">4</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603586_1335603598"
                                                    data-id="filter_traits1335603586" value="1335603598"><label
                                                    class="f-label" for="filter_traits1335603586_1335603598"><span
                                                        class="--name">Szwecja</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2
    																   --hidden">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control focused" id="filter_traits1335603586_1335603600"
                                                    data-id="filter_traits1335603586" value="1335603600"><label
                                                    class="f-label" for="filter_traits1335603586_1335603600"><span
                                                        class="--name">Włochy</span><span
                                                        class="--quantity">376</span></label></div>
                                        </li>
                                    </ul>
                                    <div class="filters__options"><a class="--show-hidden btn py-0 pl-0 pr-0"
                                            data-id="filter_traits1335603586"><span class="--show">+
                                                Rozwiń</span><span class="--hide">- Ukryj</span></a><button
                                            type="submit" class="--submit btn --solid --small">
                                            Filtruj
                                        </button><button type="submit" class="--remove btn" title="Wyczyść filtry">
                                            Wyczyść filtry
                                        </button></div>
                                </div>
                            </div>
                            <div class="filter-element filters__block --hide"><a class="filters__toggler
    								" data-id="filter_dual">
                                    <div class="btn --icon-right d-block pr-4"><span class="d-none d-md-block"
                                            old_text="Pokaż tylko">
                                            Pokaż tylko
                                        </span><span class="d-md-none">
                                            Pokaż tylko
                                        </span></div>
                                </a>
                                <div class="filters__expand p-md-2 pt-md-3" id="filter_dual_expand">
                                    <ul class="filters__content --list" id="filter_dual_content">
                                        <li class="filters__item mb-2">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control __serialize focused" id="filter_bestseller_y"
                                                    value="y" name="filter_bestseller"><label class="f-label"
                                                    for="filter_bestseller_y"><span
                                                        class="--name">Bestseller</span><span
                                                        class="--quantity">15</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control __serialize focused" id="filter_promotion_y"
                                                    value="y" name="filter_promotion"><label class="f-label"
                                                    for="filter_promotion_y"><span class="--name">Promocja</span><span
                                                        class="--quantity">151</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control __serialize focused" id="filter_discount_y"
                                                    value="y" name="filter_discount"><label class="f-label"
                                                    for="filter_discount_y"><span class="--name">Przecena</span><span
                                                        class="--quantity">1</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control __serialize focused" id="filter_new_y" value="y"
                                                    name="filter_new"><label class="f-label" for="filter_new_y"><span
                                                        class="--name">Nowość</span><span
                                                        class="--quantity">21</span></label></div>
                                        </li>
                                        <li class="filters__item mb-2">
                                            <div class="f-group --small --checkbox mb-0"><input type="checkbox"
                                                    class="f-control __serialize focused" id="filter_availability_y"
                                                    value="y" name="filter_availability"><label class="f-label"
                                                    for="filter_availability_y"><span
                                                        class="--name">Dostępność</span><span
                                                        class="--quantity">1252</span></label></div>
                                        </li>
                                    </ul>
                                    <div class="filters__options"><button type="submit"
                                            class="--submit btn --solid --small">
                                            Filtruj
                                        </button><button type="submit" class="--remove btn" title="Wyczyść filtry">
                                            Wyczyść filtry
                                        </button></div>
                                </div>
                            </div>
                            <div class="filter-element filters__block --hide"><input type="hidden" class="__serialize"
                                    id="filter_price_input" name="filter_price" value=""><a class="filters__toggler
    								" data-id="filter_price">
                                    <div class="btn --icon-right d-block pr-4"><span class="d-none d-md-block"
                                            old_text="Cena">Cena</span><span class="d-md-none">Cena</span></div>
                                </a>
                                <div class="filters__expand p-md-2 pt-md-3" id="filter_price_expand">
                                    <div class="filters__content --range"><input type="hidden" id="min_price_start"
                                            value="0"><input type="hidden" id="max_price_start" value="490">
                                        <div class="filters__price-slider">
                                            <div class="--price"></div>
                                        </div>
                                        <div class="filters__price">
                                            <div
                                                class="filters__range d-flex justify-content-between align-items-center">
                                                <label for="PriceRangeFrom" class="--from"><input id="PriceRangeFrom"
                                                        type="text" class="--input-from" value="0"><span
                                                        class="--currency">zł</span></label><span class="--gap">
                                                    -
                                                </span><label for="PriceRangeTo" class="--to"><input id="PriceRangeTo"
                                                        type="text" class="--input-to" value="490"><span
                                                        class="--currency">zł</span></label>
                                            </div>
                                            <div class="filters_options"><button type="submit"
                                                    class="btn p-md-0 mt-md-2 d-none d-inline-block">
                                                    Zastosuj zakres cen
                                                </button></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="f-group filters__buttons d-md-none"><button type="submit"
                                    class="btn --medium --solid" title="Kliknij aby zastosować wybrane filtry">

                                    Zastosuj wybrane filtry
                                </button></div>
                        </form>
                    </section>
                </div>

                <section class="search-product search products d-flex flex-wrap mb-2 mb-sm-3">
                    <?php
                    function generateRandomData() {
                        $data = [];
                        for ($i = 0; $i < 12; $i++) {
                            $data[] = rand(30, 100); 
                        }
                        return implode(', ', $data);
                    }
                    $products = [
                        [
                        'name'=> 'Kawa ziarnista',
                        'price'=> '29.99',
                        'img'=>
                        'https://www.konesso.pl/pol_pm_Kawa-ziarnista-MK-Cafe-Crema-1kg-10376_2.jpg',
                        'promotion'=> 'true',
                        'promotionType'=> 'promocja',
                        'lowerPrice'=> 'true'
                        ],
                   
                        [
                        'name'=> 'Kawa ziarnista 2',
                        'price'=> '39.99',
                        'img'=> ' https://www.konesso.pl/pol_pm_Kawa-ziarnista-MK-Cafe-Premium-1kg-10377_3.jpg',
                        'promotion'=> 'true',
                        'promotionType'=> 'nowość',
                        ],
                        [
                        'name'=> 'Kawa ziarnista 3',
                        'price'=> '49.99',
                        'img'=> 'https://www.konesso.pl/pol_pm_Kawa-ziarnista-MK-Cafe-Crema-1kg-10376_2.jpg',
                        'promotion'=> 'true',
                        'promotionType'=> 'bestseller',
                        ],
                        [
                        'name'=> 'Kawa ziarnista 4',
                        'price'=> '19.99',
                        'img'=> 'https://www.konesso.pl/pol_pm_Kawa-ziarnista-MK-Cafe-Premium-1kg-10377_3.jpg'
                        ],
                        [
                        'name'=> 'Kawa ziarnista 5',
                        'price'=> '149.99',
                        'img'=> ' https://www.konesso.pl/pol_pm_Kawa-ziarnista-MK-Cafe-Crema-1kg-10376_2.jpg'
                        ],
                        [
                        'name'=> 'Kawa ziarnista 6',
                        'price'=> '249.99',
                        'img'=> 'https://www.konesso.pl/pol_pm_Kawa-ziarnista-MK-Cafe-Premium-1kg-10377_3.jpg',
                        'promotion'=> 'true',
                        'promotionType'=> 'kawa miesiąca',
                        ],
                        [
                        'name'=> 'Kawa ziarnista 7',
                        'price'=> '29.99',
                        'img'=>
                        'https://www.konesso.pl/pol_pm_Kawa-ziarnista-MK-Cafe-Crema-1kg-10376_2.jpg',
                        ],
                        [
                        'name'=> 'Kawa ziarnista 8',
                        'price'=> '39.99',
                        'img'=> ' https://www.konesso.pl/pol_pm_Kawa-ziarnista-MK-Cafe-Premium-1kg-10377_3.jpg',
                        ],
                        [
                        'name'=> 'Kawa ziarnista 9',
                        'price'=> '49.99',
                        'img'=> 'https://www.konesso.pl/pol_pm_Kawa-ziarnista-MK-Cafe-Crema-1kg-10376_2.jpg'
                        ],
                        [
                        'name'=> 'Kawa ziarnista 10',
                        'price'=> '19.99',
                        'img'=> 'https://www.konesso.pl/pol_pm_Kawa-ziarnista-MK-Cafe-Premium-1kg-10377_3.jpg',
                        'promotion'=> 'true',
                        'promotionType'=> 'promocja',
                        'lowerPrice'=> 'true'
                        ],
                        [
                        'name'=> 'Kawa ziarnista 11',
                        'price'=> '149.99',
                        'img'=> ' https://www.konesso.pl/pol_pm_Kawa-ziarnista-MK-Cafe-Crema-1kg-10376_2.jpg'
                        ],
                        [
                        'name'=> 'Kawa ziarnista 12',
                        'price'=> '249.99',
                        'img'=> 'https://www.konesso.pl/pol_pm_Kawa-ziarnista-MK-Cafe-Premium-1kg-10377_3.jpg',
                        'promotion'=> 'true',
                        'promotionType'=> 'bestseller',
                        ]
                        ];
                        foreach ($products as $product) {
                            $product['graphData'] = generateRandomData();
                        
                            // Sprawdzenie czy istnieje promocja i dodanie 'promotionType' jeśli jest dostępne
                            if (isset($product['promotion']) && $product['promotion'] === 'true' && isset($product['promotionType'])) {
                                $product['displayPromotion'] = "<strong class=\"label_icons\"><span class=\"label --promo\">" . htmlspecialchars($product['promotionType']) . "</span></strong>";
                            } else {
                                $product['displayPromotion'] = "";
                            }

                            // Sprawdzanie czy produkt ma obniżoną cenę jeżeli jest 'lowerPrice'
                            if (isset($product['lowerPrice']) && $product['lowerPrice'] === 'true') {
                                $product['promoClass'] = ""; 
                                $product['priceClass'] = "d-none";
                            } else {
                                $product['promoClass'] = "d-none";
                                $product['priceClass'] = ""; 
                            }

                            include 'search-result-product.php';
                        }
                   ?>
                </section>
                <div id="paging_setting_bottom" class="s_paging mt-5 mt-md-0">
                    <form class="s_paging__item --sort d-none" action="https://www.konesso.pl/settings.php">
                        <div class="f-dropdown f-group s_paging__select --order --small-md "><select
                                class="s_paging__select-select --order-select --small-md-select" id="select_bottom_sort"
                                name="sort_order">
                                <option value="name-a" class="option_name-a">Sortuj po nazwie rosnąco</option>
                                <option value="name-d" class="option_name-d">Sortuj po nazwie malejąco</option>
                                <option value="price-a" class="option_price-a">Sortuj po cenie rosnąco</option>
                                <option value="price-d" class="option_price-d">Sortuj po cenie malejąco</option>
                                <option value="date-a" class="option_date-a">Sortuj po dacie rosnąco</option>
                                <option value="date-d" class="option_date-d">Sortuj po dacie malejąco</option>
                            </select>
                            <button type="button" class="f-control f-dropdown-toggle" data-indexcurrent="0">

                                <span class="f-dropdown-button">Sortuj po nazwie rosnąco</span>
                            </button>
                            <ul class="f-dropdown-menu">

                                <li class="f-dropdown-li option_name-a">
                                    <a class="f-dropdown-item --selected" href="#name-a" data-index="0"
                                        data-value="name-a">Sortuj po nazwie rosnąco</a>
                                </li>

                                <li class="f-dropdown-li option_name-d">
                                    <a class="f-dropdown-item" href="#name-d" data-index="1" data-value="name-d">Sortuj
                                        po nazwie malejąco</a>
                                </li>

                                <li class="f-dropdown-li option_price-a">
                                    <a class="f-dropdown-item" href="#price-a" data-index="2"
                                        data-value="price-a">Sortuj po cenie rosnąco</a>
                                </li>

                                <li class="f-dropdown-li option_price-d">
                                    <a class="f-dropdown-item" href="#price-d" data-index="3"
                                        data-value="price-d">Sortuj po cenie malejąco</a>
                                </li>

                                <li class="f-dropdown-li option_date-a">
                                    <a class="f-dropdown-item" href="#date-a" data-index="4" data-value="date-a">Sortuj
                                        po dacie rosnąco</a>
                                </li>

                                <li class="f-dropdown-li option_date-d">
                                    <a class="f-dropdown-item" href="#date-d" data-index="5" data-value="date-d">Sortuj
                                        po dacie malejąco</a>
                                </li>

                            </ul>
                        </div>
                    </form>
                    <form class="s_paging__item --portions d-none" action="https://www.konesso.pl/settings.php">
                        <div class="f-dropdown f-group s_paging__select --portions --small-md "><select
                                class="s_paging__select-select --portions-select --small-md-select"
                                id="select_bottom_portions" name="portions">
                                <option value="30" selected="">Pokaż 30</option>
                                <option value="60">Pokaż 60</option>
                                <option value="90">Pokaż 90</option>
                                <option value="120">Pokaż 120</option>
                                <option value="150">Pokaż 150</option>
                                <option value="180">Pokaż 180</option>
                                <option value="210">Pokaż 210</option>
                                <option value="240">Pokaż 240</option>
                                <option value="270">Pokaż 270</option>
                                <option value="300">Pokaż 300</option>
                            </select>
                            <button type="button" class="f-control f-dropdown-toggle" data-indexcurrent="0">

                                <span class="f-dropdown-button">Pokaż 30</span>
                            </button>
                            <ul class="f-dropdown-menu">

                                <li class="f-dropdown-li">
                                    <a class="f-dropdown-item --selected" href="#30" data-index="0"
                                        data-value="30">Pokaż 30</a>
                                </li>

                                <li class="f-dropdown-li">
                                    <a class="f-dropdown-item" href="#60" data-index="1" data-value="60">Pokaż 60</a>
                                </li>

                                <li class="f-dropdown-li">
                                    <a class="f-dropdown-item" href="#90" data-index="2" data-value="90">Pokaż 90</a>
                                </li>

                                <li class="f-dropdown-li">
                                    <a class="f-dropdown-item" href="#120" data-index="3" data-value="120">Pokaż 120</a>
                                </li>

                                <li class="f-dropdown-li">
                                    <a class="f-dropdown-item" href="#150" data-index="4" data-value="150">Pokaż 150</a>
                                </li>

                                <li class="f-dropdown-li">
                                    <a class="f-dropdown-item" href="#180" data-index="5" data-value="180">Pokaż 180</a>
                                </li>

                                <li class="f-dropdown-li">
                                    <a class="f-dropdown-item" href="#210" data-index="6" data-value="210">Pokaż 210</a>
                                </li>

                                <li class="f-dropdown-li">
                                    <a class="f-dropdown-item" href="#240" data-index="7" data-value="240">Pokaż 240</a>
                                </li>

                                <li class="f-dropdown-li">
                                    <a class="f-dropdown-item" href="#270" data-index="8" data-value="270">Pokaż 270</a>
                                </li>

                                <li class="f-dropdown-li">
                                    <a class="f-dropdown-item" href="#300" data-index="9" data-value="300">Pokaż 300</a>
                                </li>

                            </ul>
                        </div>
                    </form>
                    <ul class="s_paging__item pagination mb-2 mb-sm-3" data-total="1479" data-from="1" data-to="30"
                        data-portions="30">
                        <li class="pagination__element --prev --disabled"><span class="pagination__link"></span></li>
                        <li class="pagination__element --item --active"><span class="pagination__link">1</span></li>
                        <li class="pagination__element --item"><a class="pagination__link"
                                href="https://www.konesso.pl/pol_m_Kawa_Rodzaj_Kawa-ziarnista-2160.html?counter=1">2</a>
                        </li>
                        <li class="pagination__element --item"><a class="pagination__link"
                                href="https://www.konesso.pl/pol_m_Kawa_Rodzaj_Kawa-ziarnista-2160.html?counter=2">3</a>
                        </li>
                        <li class="pagination__element --item"><a class="pagination__link"
                                href="https://www.konesso.pl/pol_m_Kawa_Rodzaj_Kawa-ziarnista-2160.html?counter=3">4</a>
                        </li>
                        <li class="pagination__element --item"><a class="pagination__link"
                                href="https://www.konesso.pl/pol_m_Kawa_Rodzaj_Kawa-ziarnista-2160.html?counter=4">5</a>
                        </li>
                        <li class="pagination__element --item"><a class="pagination__link"
                                href="https://www.konesso.pl/pol_m_Kawa_Rodzaj_Kawa-ziarnista-2160.html?counter=5">6</a>
                        </li>
                        <li class="pagination__element --item"><a class="pagination__link"
                                href="https://www.konesso.pl/pol_m_Kawa_Rodzaj_Kawa-ziarnista-2160.html?counter=6">7</a>
                        </li>
                        <li class="pagination__element --gap --disabled"><span class="pagination__link">...</span></li>
                        <li class="pagination__element --item"><a class="pagination__link"
                                href="https://www.konesso.pl/pol_m_Kawa_Rodzaj_Kawa-ziarnista-2160.html?counter=49">50</a>
                        </li>
                        <li class="pagination__element --next --button"><a class="pagination__link"
                                href="https://www.konesso.pl/pol_m_Kawa_Rodzaj_Kawa-ziarnista-2160.html?counter=1"></a><a
                                class="pagination__button --next btn --secondary --solid --icon-right icon-angle-right d-md-none"
                                href="https://www.konesso.pl/pol_m_Kawa_Rodzaj_Kawa-ziarnista-2160.html?counter=1">Następna
                                strona</a></li>
                    </ul>
                </div>
                <section class="search_description --bottom cm">
                    <div class="search_description__wrapper">
                        <p>&nbsp;</p>
                        <script type="text/javascript"
                            src="chrome-extension://folgingmlllljinofbclfdbepcdobfaf/content.js"></script>
                    </div>
                </section>
                <script>
                var _additional_ajax = true;
                </script>
                <div class="additional-info px-6">
                    <div>
                        <h2 class="py-3">Czy wraz z poranną kawą możesz wyruszyć w podróż dookoła świata?</h2>
                        <p>Tak! Poranna filiżanka kawy może przenieść Cię w dalekie, egzotyczne kraje – za każdym razem
                            w inne! Udaj się z nami w podróż dookoła świata, poznaj bogactwo smaków i aromatów kaw z
                            różnych zakątków globu.</p><br />
                        <p>W sklepie MK Cafe Fresh proponujemy Ci rozmaite rodzaje <strong>kaw Arabica</strong>,
                            pochodzące z różnych stron świata. Oferujemy zarówno ziarna zebrane na plantacjach
                            azjatyckich, afrykańskich, jak i środkowo- oraz południowoamerykańskich. Każda z
                            proponowanych przez nas kaw charakteryzuje się unikalnym profilem aromatycznym,
                            intensywnością oraz poziomem kwasowości. Wszyscy znajdą tu więc coś dla siebie – niezależnie
                            od tego, czy potrzebują <strong>kawy do ekspresu ciśnieniowego</strong>, <strong>kawy do
                                kawiarki</strong> czy innych urządzeń do parzenia kawy.</p><br />
                        <div class="moreContent">
                            <p>Wybrane kawy możesz otrzymać od nas zarówno w ziarnach, jak i zmielone, gotowe do
                                parzenia. Oczywiście każde opakowanie kawy zawiera wyłącznie ziarna świeżo palone w
                                naszej Manufakturze! Możesz wybierać spośród <a
                                    href="https://mkfresh.pl/kawy/kawy-jednorodne">kaw jednorodnych
                                    (<em>origins</em>)</a>, czyli ziaren pochodzących wyłącznie z jednego obszaru
                                geograficznego, jednego kraju czy jednej plantacji, oraz specjalnie skomponowanych <a
                                    href="https://mkfresh.pl/kawy/kawy-swiata">mieszanek ziaren</a> z różnych regionów –
                                <em>blend</em>.
                            </p><br />
                            <p>W poszukiwaniu nowych doznań smakowych warto zajrzeć do zakładki „Edycja limitowana”,
                                gdzie znajdziesz wyjątkowe <a href="https://mkfresh.pl/kawy/kawy-swiata">kawy
                                    świata</a>. Różne odsłony kaw prosto z Brazylii zachwycą Cię miodową słodyczą
                                (Brazil Cemorrado Honey), cytrusową świeżością czy różnymi wariantami delikatnych smaków
                                czekoladowo-orzechowych. Miłośników orientalnych, głębokich smaków z pewnością
                                zainteresują kawy z Indii. Odkryjesz w nich wyraziste nuty czekolady, karmelu, przypraw
                                korzennych oraz szlachetnego drewna.</p><br />
                            <p>A może wybierzesz jedną z kaw Arabica z gorącej Etiopii? Sidamo należy do wysokiej
                                jakości, klasycznych kaw zachodniej części kraju. Coś jeszcze bardziej egzotycznego? To
                                może intensywna, owocowo-karmelowo-czekoladowa Indonesia Java Purbaya! Albo mieszanka
                                słodyczy i orzeźwienia – Las Campanillas z Nikaragui.</p><br />
                            <p>Kawy Origins to jednorodne ziarna pochodzące z pięciu regionów tzw. pasa kawowego, czyli
                                obszaru mieszczącego się pomiędzy Zwrotnikiem Raka a Zwrotnikiem Koziorożca. Kawy
                                Origins cechuje bogaty smak i aromat, które stanowią wypadkową wielu czynników: klimatu,
                                typu gleby, wysokości upraw, metody zbioru i obróbki. Proponujemy w naszym sklepie
                                <strong>kawy ziarniste</strong> jednorodne pochodzące z Brazylii, Kenii, Indii,
                                Indonezji, Kolumbii i Kostaryki.
                            </p><br />
                            <p>Kawy typu „blend” to z kolei mieszanki, w skład których wchodzą ziarna z dwóch lub
                                większej liczby upraw. Ziarna zostały dobrane w specjalnych proporcjach, a efektem jest
                                połączenie najlepszych kaw świata w nowe, ciekawe kompozycje. Jeśli cenisz delikatną w
                                smaku klasykę, spróbuj <a href="https://mkfresh.pl/master-blend">kawy Master Blend</a>
                                stanowiącej mieszankę ziaren brazylijskich i kolumbijskich. <a
                                    href="https://mkfresh.pl/subtle-harmony">Kawa Subtle Harmony</a> dodaje do tej pary
                                jeszcze ziarna z Kostaryki, stawiając kropkę nad „i” brzoskwiniowymi nutami smakowymi.
                                Ciekawą mieszanką jest też Supreme Strength – unikalna fuzja ziaren z Brazylii i
                                Kolumbii z korzenną, aromatyczną kawą indyjską.</p><br />
                            <p>Nie wiesz, na jaką kawę się zdecydować? A może szukasz pomysłu na prezent? Dostępne w
                                naszym sklepie zestawy kaw to doskonała sposobność na degustację różnych rodzajów kaw, a
                                także wspaniały, elegancki i wyszukany podarunek. Kawy są zawsze <a
                                    href="https://mkfresh.pl/unikatowa-manufaktura">świeżo palone</a> i pakowane w
                                gustowne pudełko.</p><br />
                            <p>Jeżeli nie możesz się zdecydować może pomóc Tobie nasz internetowy konfigurator, który
                                pomoże Tobie <a href="https://mkfresh.pl/front/wizard/">jaką kawę wybrać</a> i przy
                                pomocy trzech pytań pozwoli Ci znaleźć idealną dla Ciebie 100% kawę arabica.</p><br />
                        </div>
                    </div>
                    <p class="text-center m-0"><button
                            class="hover:bg-gold-dark hover:border-gold-dark px-6 py-2 bg-gold border-solid border-2 border-gold text-white transition hidden">
                            Czytaj więcej
                        </button></p>
                </div>
            </div>
        </div>

        <?php include 'footer.php'; ?>
        <script src="./js/Chart.min.js"></script>
        <script src="./js/shop.js"></script>
        <script src="./js/search_filters.js?r=1699540673">
        </script>
        <script src="./js/envelope.js.gzip">
        </script>
        <script src="./js/menu_suggested_shop_for_language.js.gzip">
        </script>
        <script src="./js/menu_alert.js.gzip">
        </script>
        <script src="./js/menu_compare.js.gzip?">
        </script>
        <script src="./js/menu_additionalpayments.js.gzip">
        </script>
        <script src="./js/menu_omnibus.js.gzip">
        </script>
        <script src="./js/search_promo_products.js">
        </script>



        <script>
        app_shop.runApp();
        </script>
</body>

</html>