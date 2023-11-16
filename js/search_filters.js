const filtersActionsCall = () => {
    document.querySelectorAll(".filters__options .--show-hidden").forEach((e => {
        e.addEventListener("click", (e => {
            e.preventDefault();
            const t = e.target.closest(".--show-hidden")
                , { id: r } = t.dataset;
            document.querySelector(`#${r}_content`)?.classList.toggle("--shown"),
                t.classList.toggle("--shown")
        }
        ))
    }
    ));
    document.querySelectorAll(".filters__more").forEach((e => {
        e.addEventListener("click", (t => {
            document.querySelectorAll(".filters__block").forEach((e => {
                e.classList.remove("--hide")
            }
            )),
                e.remove()
        }
        ))
    }
    ));
    document.querySelectorAll(".filters__toggler:not(.--not-expandable)").forEach((e => {
        e.addEventListener("click", (e => {
            e.preventDefault();
            const t = e.target.closest(".filters__toggler:not(.--not-expandable)");
            t.classList.toggle("--not-expanded");
            const r = t.closest(".filters__content.--group");
            if (!r)
                return;
            const { toggle: o } = t.dataset
                , i = r.querySelector(`#${o}`);
            if (!i)
                return;
            r.querySelectorAll(".filters__toggler.--active, .filters__expand-group.--active").forEach((e => {
                e.classList.remove("--active")
            }
            )),
                t.classList.add("--active"),
                i.parentNode.classList.add("--active")
        }
        ))
    }
    ));
    document.querySelectorAll(".filters__options .--remove").forEach((e => {
        e.addEventListener("click", (e => {
            e.preventDefault();
            const { target: t } = e
                , r = t.closest(".filters__block");
            if (!r)
                return;
            r.querySelectorAll(".__serialize").forEach((e => {
                e.value = ""
            }
            ));
            r.querySelectorAll("input").forEach((e => {
                e.checked = !1
            }
            ));
            const o = r.closest("form");
            o && o.submit()
        }
        ))
    }
    ));
    function e(e) {
        const t = e.parentNode;
        e.value = e.value.replace(/[^0-9]/g, "");
        const r = function (e, t) {
            const r = document.createElement("canvas").getContext("2d");
            return r.font = t,
                r.measureText(e).width
        }(e.value, "14px Arial");
        r > t.offsetWidth - 30 ? e.style.width = t.offsetWidth - 30 + "px" : e.style.width = `${r + 10}px`
    }
    document.querySelectorAll(".filters__item .f-control[type=checkbox]").forEach((e => {
        e.addEventListener("change", (e => {
            if (app_shop.vars.view < 3)
                return;
            const { target: t } = e
                , r = t.closest(".filters__block");
            if (!r)
                return;
            const o = r.querySelector(".filters__toggler");
            if (!o)
                return;
            const i = o.querySelector(".btn > span[old_text]");
            if (!i)
                return;
            const s = r.querySelectorAll("input:checked:not(.--not-serialize)");
            if (!s.length)
                return o.classList.remove("--selected"),
                    void (i.innerHTML = i.getAttribute("old_text"));
            const l = [...s].map((e => {
                const t = e.closest(".filters__item").querySelector(".--name");
                return t ? t.innerText : ""
            }
            )).join(", ");
            o.classList.add("--selected"),
                i.innerHTML = l
        }
        ))
    }
    ));
    document.querySelectorAll("#PriceRangeFrom, #PriceRangeTo").forEach((t => {
        t.addEventListener("input", (t => {
            e(t.target)
        }
        )),
            e(t)
    }
    ));
    document.querySelectorAll("#filter_xpress_expand input").forEach((e => {
        e.addEventListener("change", (e => {
            const { checked: t } = e.target;
            if (!t)
                return;
            const { localized: r } = e.target.dataset;
            if (!r || "true" === r)
                return;
            const o = document.querySelector("#xpress_modal");
            o && (app_shop.vars.xpressClicked = e.target.id,
                Modal({
                    element: o,
                    classList: "--xpress"
                }))
        }
        ))
    }
    ));
    document.querySelector(".filters__form").addEventListener("submit", (function (e) {
        const t = document.querySelector("#PriceRangeFrom")
            , r = document.querySelector("#PriceRangeTo");
        if (parseFloat(t?.value) > parseFloat(r?.value))
            return e.preventDefault(),
                void document.querySelector(".filters__price").classList.add("has-error");
        document.querySelector(".filters__price").classList.remove("has-error")
    }
    ))
}
    , showHiddenFiltersFromRight = () => {
        document.querySelectorAll(".filters__block").forEach((e => {
            const t = e.querySelector(".filters__toggler");
            if (!t)
                return;
            const r = e.querySelector(".filters__expand");
            if (!r)
                return;
            r.classList.remove("right"),
                e.classList.remove("right");
            t.getBoundingClientRect().left + 450 > window.innerWidth && app_shop.vars.view >= 3 && (r.classList.add("right"),
                e.classList.add("right"))
        }
        ))
    }
    ;
app_shop.run((function () {
    showHiddenFiltersFromRight()
}
), "all", ".filters__block > .filters__toggler", !0),
    app_shop.run((function () {
        let e = null;
        window.addEventListener("resize", (function () {
            clearTimeout(e),
                e = setTimeout((() => {
                    showHiddenFiltersFromRight()
                }
                ), 50)
        }
        ))
    }
    ), "all", ".filters__block > .filters__toggler");
const Filters = function (e) {
    this.params = e,
        this.setInputValue = e => {
            const { id: t } = e.dataset
                , r = [...document.querySelectorAll(`input[data-id="${t}"]:checked`)].map((e => e.value)).join(",");
            document.querySelector(`#${t}_input`).value = r
        }
        ,
        this.setLabeLsQuantity = async () => {
            const e = await fetch(`/search.php?${this.serialize()}&getProductXML=true&xmlType=filtering`)
                , t = await e.text();
            [...(new DOMParser).parseFromString(t, "text/xml").querySelectorAll("filter")].forEach((e => {
                const { type: t } = e.attributes;
                let r = e.id.replace(/\[(.*?)\]/g, "$1")
                    , o = document.querySelector(`#${r}_expand`);
                if ("dual" === t.value && (r = "filter_dual",
                    o = document.querySelector("#filter_dual_expand")),
                    o && "filter_text" !== r) {
                    const t = e.querySelectorAll("item");
                    t.length && [...t].forEach((e => {
                        const { value: t, quantity: i } = e.attributes
                            , s = 'label[for="' + r + "_" + t.value + '"] .--quantity'
                            , l = o.querySelector(s);
                        l && (i ? (l.classList.remove("d-none"),
                            l.innerHTML = i.value) : (l.classList.add("d-none"),
                                l.innerHTML = 0))
                    }
                    ))
                }
            }
            ))
        }
        ,
        this.getPriceRange = (e = "#PriceRangeFrom", t = "#PriceRangeTo") => {
            const r = document.querySelector(e)
                , o = document.querySelector(t);
            return `${r.value}-${o.value}`
        }
        ,
        this.serialize = (e = ".__serialize") => [...this.filtersForm.querySelectorAll(e)].filter((e => "checkbox" === e.type ? e.checked : e.value)).map((e => `${e.name}=${e.value}`)).join("&"),
        this.setVisibleExpand = () => {
            const e = document.querySelectorAll(".--not-expanded");
            if (!e.length)
                return app_shop.fn.cookie.set("filterHidden", "", 355),
                    !1;
            const t = [...e].map((e => e.nextSibling.id));
            app_shop.fn.cookie.set("filterHidden", t, 355)
        }
        ,
        this.getVisibleExpand = () => {
            const e = app_shop.fn.cookie.get("filterHidden");
            e && e.split(",").forEach((e => {
                const t = document.querySelector(`.filters__expand#${e}`);
                if (null !== t) {
                    t.previousSibling.classList.add("--not-expanded")
                }
            }
            ))
        }
        ,
        this.start = () => {
            this.filtersForm.querySelectorAll('input[type="checkbox"]').forEach((e => {
                e.addEventListener("change", (e => {
                    const { target: t } = e
                        , { id: r } = t.dataset;
                    r && this.setInputValue(t),
                        this.getQuantity && this.setLabeLsQuantity()
                }
                ))
            }
            ));
            document.querySelectorAll("#PriceRangeFrom, #PriceRangeTo").forEach((e => {
                e.addEventListener("change", (e => {
                    const t = document.querySelector("#filter_price_input");
                    t && (t.value = this.getPriceRange())
                }
                ))
            }
            )),
                this.actionsCall && this.actionsCall();
            document.querySelectorAll(".filters__toggler:not(.--not-expandable)").forEach((e => {
                e.addEventListener("click", (() => {
                    this.setVisibleExpand()
                }
                ))
            }
            )),
                this.disableFiltersExpandCookie || this.getVisibleExpand()
        }
        ,
        this.init = () => {
            this.filtersForm = document.querySelector(".filters__form"),
                this.filtersForm && (this.actionsCall = filtersActionsCall || null,
                    this.getQuantity = !0,
                    this.disableFiltersExpandCookie = !0,
                    this.start())
        }
};
app_shop.run((function () {
    document.querySelectorAll(".filters__expanded-group").forEach((e => {
        e.querySelectorAll("input").forEach((e => {
            e.setAttribute("data-id", `${e.getAttribute("data-id")}_not_serialize`),
                e.id = `${e.id}_not_serialize`,
                e.classList.add("--not-serialize")
        }
        ));
        e.closest(".filters__block").querySelectorAll('.filters__toggle-group input:not([value="uniw"])').forEach((e => {
            e.setAttribute("data-id", e.getAttribute("data-id").replace("_not_serialize", "")),
                e.id = e.id.replace("_not_serialize", ""),
                e.classList.remove("--not-serialize")
        }
        ))
    }
    ))
}
), [1, 2], "#Filters", !0),
    app_shop.run((function () {
        document.querySelectorAll(".filters__expanded-group").forEach((e => {
            e.querySelectorAll("input").forEach((e => {
                e.setAttribute("data-id", e.getAttribute("data-id").replace("_not_serialize", "")),
                    e.id = e.id.replace("_not_serialize", ""),
                    e.classList.remove("--not-serialize")
            }
            ));
            e.closest(".filters__block").querySelectorAll('.filters__toggle-group input:not([value="uniw"])').forEach((e => {
                e.setAttribute("data-id", `${e.getAttribute("data-id")}_not_serialize`),
                    e.id = `${e.id}_not_serialize`,
                    e.classList.add("--not-serialize")
            }
            ))
        }
        ))
    }
    ), [3, 4], "#Filters", !0),
    app_shop.run((() => {
        app_shop.vars.filtersRef = new Filters,
            app_shop.vars.filtersRef.init()
    }
    ), "all", "#Filters", !0);
const xpressText = {
    geolocationError: "Wystąpił błąd poczas sprawdzania kodu pocztowego. Proszę spróbować ponownie",
    zipcodeError: "Nie można pobrać kodu pocztowego"
};
app_shop.fn.xpressCouriersInit = () => {
    const e = document.querySelector("#xpress_modal");
    if (!e)
        return;
    const t = new FormValidation({
        form: e
    });
    t.init();
    const r = () => {
        const e = document.querySelector(".modal");
        e && e.classList.add("--loading")
    }
        , o = () => {
            const e = document.querySelector(".modal");
            e && e.classList.remove("--loading")
        }
        , i = () => {
            const e = document.querySelector("#xpress_error_modal");
            e && Modal({
                element: e,
                classList: "--xpress-error"
            })
        }
        ;
    if (!navigator.geolocation) {
        const e = document.querySelector(".xpress__geolocation");
        if (!e)
            return;
        e.remove()
    }
    e.addEventListener("click", (e => {
        const { target: s } = e;
        s.closest(".xpress_submit") && (e.preventDefault(),
            (async () => {
                const e = document.querySelector("#xpress_zipcode_input");
                if (!e)
                    return;
                if (r(),
                    !await t.validateForm())
                    return void o();
                const { value: s } = e;
                if (!(await fetch(`/ajax/client-new.php?setClientSamedayLocation=1&zipcode=${s}`, {
                    method: "POST"
                })).ok)
                    return void i();
                const l = await fetch("/search.php?&getProductXML=true&xmlType=filtering");
                if (!l.ok)
                    return void i();
                const n = await l.text()
                    , a = (new DOMParser).parseFromString(n, "text/xml")
                    , c = a.querySelector("sameday") || a.querySelector("nextday");
                if (!c)
                    return void i();
                const d = c.getAttribute("client_localized")
                    , u = c.getAttribute("service_available_for_current_location");
                if ("false" === d || "false" === u)
                    return void i();
                const p = document.querySelector("#Filters form");
                p && p.submit()
            }
            )()),
            s.closest(".xpress__get_geo") && (e.preventDefault(),
                navigator.geolocation && (r(),
                    navigator.geolocation.getCurrentPosition((async e => {
                        const { latitude: r, longitude: i } = e.coords || {}
                            , s = `https://nominatim.openstreetmap.org/reverse?format=json&lat=${r}&lon=${i}`
                            , l = await fetch(s)
                            , n = await l.json()
                            , { address: { postcode: a } = {} } = n || {};
                        if (!a)
                            return o(),
                                void Alertek.show_alert(xpressText.zipcodeError);
                        o();
                        const c = document.querySelector("#xpress_zipcode_input");
                        c && (c.value = a,
                            c.classList.add("focused"),
                            t.validateForm())
                    }
                    ), (() => {
                        o(),
                            Alertek.show_alert(xpressText.geolocationError)
                    }
                    ))))
    }
    ))
}
    ,
    app_shop.run((() => {
        app_shop.fn.xpressCouriersInit()
    }
    ), "all", "#xpress_modal", !0),
    app_shop.run((() => {
        app_shop.fn.selectPaging = new SelectToDropdown({
            selector: ".s_paging__select:not(.f-dropdown)",
            afterClickDropdownCallback: e => {
                const t = e.querySelector(".f-dropdown-item");
                if (!t)
                    return;
                const { index: r } = t.dataset
                    , o = e.closest(".s_paging__item.--sort")
                    , i = document.querySelector("#paging_setting_top form.s_paging__item.--sort select");
                if (o && i) {
                    i.selectedIndex = r;
                    return void document.querySelector("#paging_setting_top form.s_paging__item.--sort").submit()
                }
                const s = e.closest(".s_paging__item.--portions")
                    , l = document.querySelector("#paging_setting_top form.s_paging__item.--portions select");
                if (s && l) {
                    l.selectedIndex = r;
                    document.querySelector("#paging_setting_top form.s_paging__item.--portions").submit()
                } else
                    e.closest("form").submit()
            }
        });
        const e = document.querySelector(".s_paging__item.--filters a");
        e && e.addEventListener("click", (e => {
            e.preventDefault(),
                e.stopPropagation(),
                document.documentElement.classList.add("filters_open")
        }
        ))
    }
    ), "all", ".s_paging", !0);
