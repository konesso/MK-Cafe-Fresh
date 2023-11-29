const infiniteScrollTxt = { loadMore: 'Wczytaj wiÄcej produktĂłw' };
(SearchAjax = function (t) {
    const e = this;
    (this.params = t || {}),
        (this.fetchData = async t => {
            const e = document.getElementById('layout');
            e && e.classList.add('load-content');
            try {
                const o = await fetch(t),
                    n = await o.text(),
                    r = new DOMParser().parseFromString(n, 'text/html');
                this.updateDom(r),
                    t.includes('settings.php') || t.includes('settings.html') || app_shop.fn.change_url(t),
                    e && e.classList.remove('load-content');
            } catch (t) {
                return (
                    console.error('AJAX fetchSearchAjax() Error:', t),
                    e && e.classList.remove('load-content'),
                    !1
                );
            }
            return !0;
        }),
        (this.updateDom = t => {
            const e = document.getElementById('content'),
                o = t.getElementById('content');
            if (e && o) {
                e.outerHTML = o.outerHTML;
                const n = document.getElementById('Filters'),
                    r = t.getElementById('Filters');
                n &&
                    r &&
                    ((n.outerHTML = r.outerHTML),
                        app_shop.vars.view < 3 && document.querySelector('#content #Filters')?.remove()),
                    app_shop.vars.bLazy.revalidate(),
                    app_shop.fn.runAjaxFn(),
                    this.onSubmitSelectors && this.onSubmitEvent(),
                    'function' == typeof this.updateDomCallback && this.updateDomCallback();
            }
        }),
        (this.validateFiltersForm = () => {
            const t = document.querySelector('#PriceRangeFrom'),
                e = document.querySelector('#PriceRangeTo');
            return !(parseFloat(t?.value) > parseFloat(e?.value));
        }),
        (this.onClickEvent = t => {
            if (t.target.closest(e.onClickSelectors)) {
                t.preventDefault(), t.stopPropagation();
                const o = t.target.closest(e.onClickSelectors);
                return (
                    e.validateFiltersForm()
                        ? e.fetchData(o.getAttribute('href'))
                        : document.querySelector('.filters__price').classList.add('has-error'),
                    !1
                );
            }
            return !0;
        }),
        (this.onSubmitEvent = () => {
            document.querySelectorAll(this.onSubmitSelectors).forEach(t => {
                t.onsubmit = function (o) {
                    o.preventDefault(), o.stopPropagation();
                    const n = new URLSearchParams(new FormData(t)).toString(),
                        r = t.getAttribute('action'),
                        a = `${r}${new RegExp(/\?/g).test(r) ? '&' : '?'}${n}`;
                    return (
                        e.validateFiltersForm()
                            ? (document.querySelector('html').classList.contains('filters_open') &&
                                document.querySelector('html').classList.remove('filters_open'),
                                e.fetchData(a))
                            : document.querySelector('.filters__price').classList.add('has-error'),
                        !1
                    );
                };
            });
        }),
        (this.popstate = () => {
            window.location.href = window.location.href;
        }),
        (this.initEvents = () => (
            this.onClickSelectors && document.addEventListener('click', this.onClickEvent),
            this.onSubmitSelectors && this.onSubmitEvent(),
            window.addEventListener('popstate', this.popstate),
            !1
        )),
        (this.init = () => {
            const { updateDomCallback: t, onClickSelectors: e, onSubmitSelectors: o } = this.params;
            (this.updateDomCallback = t),
                (this.onClickSelectors = e),
                (this.onSubmitSelectors = o),
                this.initEvents();
        });
}),
    app_shop.run(
        function () {
            (app_shop.fn.searchAjax = new SearchAjax({
                onClickSelectors:
                    '#search a.product__compare_item, #menu_compare_product a.--remove, .pagination a, #Filters .filters__buttons a, #filter_list a',
                onSubmitSelectors: '#paging_setting_top form, .filters__form',
                updateDomCallback: () => {
                    app_shop.fn.infiniteScroll && app_shop.fn.infiniteScroll.reInit();
                    const t = document.querySelector('.search_name');
                    t && t.scrollIntoView({ behavior: 'smooth' });
                },
            })),
                window._additional_ajax && app_shop.fn.searchAjax.init();
        },
        'all',
        '#search',
    ),
    (InfiniteScroll = function (t) {
        const e = this;
        (this.params = t || {}),
            (this.vars = {
                observeInited: !1,
                loadMore: !1,
                loadedProducts: document.querySelectorAll('#search .product').length,
                pagingElementsObject: {},
                currentPagingElement: !1,
            }),
            (this.fetchNextPage = async () => {
                const t = document.querySelector(
                    '#paging_setting_bottom .pagination__element.--next:not(.--disabled) .pagination__link',
                );
                if (t) {
                    document.getElementById('paging_setting_bottom').classList.add('load-content');
                    try {
                        const e = await fetch(t.getAttribute('href')),
                            o = await e.text(),
                            n = new DOMParser().parseFromString(o, 'text/html');
                        this.updateDom(n),
                            app_shop.fn.change_url(t),
                            'scrollRestoration' in history && (history.scrollRestoration = 'manual'),
                            document.getElementById('paging_setting_bottom').classList.remove('load-content');
                    } catch (t) {
                        return (
                            console.error('AJAX fetchNextPage() Error:', t),
                            document.getElementById('paging_setting_bottom').classList.remove('load-content'),
                            !1
                        );
                    }
                }
                return !0;
            }),
            (this.updateDom = t => {
                const o = t

                    .querySelector('#search .product[data-product_first]')

                    .getAttribute('data-product_page');
                (this.vars.pagingElementsObject[o] = [
                    !!t.querySelector('#paging_setting_top .pagination') &&
                    t.querySelector('#paging_setting_top .pagination').outerHTML,
                    !!t.querySelector('#paging_setting_bottom .pagination') &&
                    t.querySelector('#paging_setting_bottom .pagination').outerHTML,
                ]),
                    (this.vars.currentPagingElement = o),
                    (this.vars.loadedProducts += t.querySelectorAll('#search .product').length),
                    t.querySelectorAll('#search .product').forEach(t => {
                        document.querySelector('#search').appendChild(t);
                    }),
                    document.querySelectorAll('.pagination').forEach((e, o) => {
                        e.outerHTML = t.querySelectorAll('.pagination')[o].outerHTML;
                    }),
                    this.lastProductInView.observe(document.querySelector('#search .product:last-child')),
                    document.querySelectorAll('#search .product[data-product_first]').forEach(t => {
                        e.firstProductInView.unobserve(t), e.firstProductInView.observe(t);
                    }),
                    this.updateDomCallback && this.updateDomCallback();
            }),
            (this.addLoadMoreButton = () => {
                if (
                    document.querySelector(
                        '#paging_setting_bottom .pagination__element.--next:not(.--disabled) .pagination__link',
                    )
                ) {
                    const t =
                        parseInt(
                            document
                                .querySelector('#paging_setting_bottom .pagination')
                                .getAttribute('data-total'),
                            10,
                        ) -
                        parseInt(
                            document
                                .querySelector('#paging_setting_bottom .pagination')
                                .getAttribute('data-to'),
                            10,
                        ),
                        e = document.createElement('div');
                    e.classList.add('infinite_scroll__more_wrapper'),
                        (e.innerHTML = `<a href="#loadMore" class="infinite_scroll__more btn --solid --large">${infiniteScrollTxt.loadMore}<span class="infinite_scroll__count">${t}</span></a>`),
                        document.getElementById('paging_setting_bottom').appendChild(e),
                        document.getElementById('paging_setting_bottom').classList.add('--load-more');
                }
            }),
            (this.removeLoadMoreButton = () => {
                document.querySelector('.infinite_scroll__more_wrapper') &&
                    (document
                        .querySelector('.infinite_scroll__more_wrapper')
                        .parentNode.removeChild(document.querySelector('.infinite_scroll__more_wrapper')),
                        document.getElementById('paging_setting_bottom').classList.remove('--load-more'));
            }),
            (this.lastProductInView = new IntersectionObserver(t => {
                t.forEach(t => {
                    t.isIntersecting &&
                        ((1 === app_shop.vars.view && e.vars.loadedProducts < 100) ||
                            (1 !== app_shop.vars.view && e.vars.loadedProducts < 300) ||
                            e.vars.loadMore
                            ? e.fetchNextPage()
                            : e.addLoadMoreButton(),
                            e.lastProductInView.unobserve(t.target));
                });
            })),
            (this.firstProductInView = new IntersectionObserver(t => {
                t.forEach(t => {
                    if (
                        t.isIntersecting &&
                        t.target.getAttribute('data-product_page') !== e.vars.currentPagingElement
                    ) {
                        if (document.querySelector('#paging_setting_top .pagination')) {
                            const o =
                                e.vars.pagingElementsObject[t.target.getAttribute('data-product_page')]?.[0];
                            o && (document.querySelector('#paging_setting_top .pagination').outerHTML = o);
                        }
                        if (document.querySelector('#paging_setting_bottom .pagination')) {
                            const o =
                                e.vars.pagingElementsObject[t.target.getAttribute('data-product_page')]?.[1];
                            o && (document.querySelector('#paging_setting_bottom .pagination').outerHTML = o);
                        }
                        (e.vars.currentPagingElement = t.target.getAttribute('data-product_page')),
                            e.changePageInUrl(t.target.getAttribute('data-product_page'));
                    }
                });
            })),
            (this.changePageInUrl = t => {
                const e = window.location.href,
                    o = new URL(e);
                o.searchParams.has('counter') &&
                    o.searchParams.get('counter') !== t &&
                    (o.searchParams.set('counter', t), app_shop.fn.change_url(o.href));
            }),
            (this.scrollEvent = () => {
                !e.observeInited &&
                    document.querySelector('#search .product:last-child') &&
                    (e.lastProductInView.observe(document.querySelector('#search .product:last-child')),
                        (e.observeInited = !0));
            }),
            (this.eventDelegation = t => {
                if (t.target.closest(e.linkToProductSelector)) {
                    const o = t.target
                        .closest(e.linkToProductSelector)
                        .closest('.product')
                        .getAttribute('data-product_page');
                    e.changePageInUrl(o);
                }
                return (
                    !t.target.closest('.infinite_scroll__more') ||
                    (t.preventDefault(),
                        e.fetchNextPage(),
                        e.removeLoadMoreButton(),
                        (e.vars.loadMore = !0),
                        !1)
                );
            }),
            (this.initEvents = () => (
                window.addEventListener('scroll', this.scrollEvent),
                document.addEventListener('click', this.eventDelegation),
                !1
            )),
            (this.init = () => {
                const { updateDomCallback: t, linkToProductSelector: e } = this.params;
                (this.updateDomCallback = t),
                    (this.linkToProductSelector =
                        e || '#search .product__icon, #search .product__name, #search .product__compare_item');
                const o = document
                    .querySelector('#search .product[data-product_first]')
                if (o) {
                    o.getAttribute('data-product_page');
                }

                (this.vars.pagingElementsObject[o] = [
                    !!document.querySelector('#paging_setting_top .pagination') &&
                    document.querySelector('#paging_setting_top .pagination').outerHTML,
                    !!document.querySelector('#paging_setting_top .pagination') &&
                    document.querySelector('#paging_setting_bottom .pagination').outerHTML,
                ]),
                    this.initEvents();
            }),
            (this.reInit = () => {
                (this.observeInited = !1), (this.vars.pagingElementsObject = []);
                const t =
                    !!document.querySelector('#search .product[data-product_first]') &&
                    document
                        .querySelector('#search .product[data-product_first]')
                        .getAttribute('data-product_page');
                document.querySelector('#paging_setting_top .pagination') &&
                    t &&
                    (this.vars.pagingElementsObject[t] = [
                        !!document.querySelector('#paging_setting_top .pagination') &&
                        document.querySelector('#paging_setting_top .pagination').outerHTML,
                        !!document.querySelector('#paging_setting_top .pagination') &&
                        document.querySelector('#paging_setting_bottom .pagination').outerHTML,
                    ]);
            });
    }),
    app_shop.run(
        function () {
            (app_shop.fn.infiniteScroll = new InfiniteScroll({
                updateDomCallback: () => {
                    app_shop.vars.bLazy.revalidate(),
                        app_shop.vars?.disableAjaxOnScrollSetHeight ||
                        app_shop.fn.setHeight({
                            selectors: ['#search .product__prices', '#search .product__name'],
                            container: '#search',
                        }),
                        'undefined' != typeof runOmnibusFallback &&
                        'function' == typeof runOmnibusFallback &&
                        runOmnibusFallback();
                },
            })),
                app_shop.fn.infiniteScroll.init();
        },
        'all',
        '.search_page #paging_setting_bottom .pagination',
    );


// const o = document.querySelector("#search .product[data-product_first]").getAttribute("data-product_page");