function calculateSubscriptionPrice(e) {
    return (
        (this.params = e || {}),
        (this.roundPrice = e => {
            const t = currency_decimal_separator;
            currency_decimal_separator = '.';
            const i = format_price(e, { mask: '#####0.00' });
            return (currency_decimal_separator = t), i;
        }),
        (this.formatPrice = e =>
            format_price(e, {
                mask: this.currencyFormat,
                currency: this.symbol,
                currency_space: this.currencySpace,
                currency_before_price: this.currencyBeforeValue,
            })),
        (this.percentagePrice = (e, t, i, n) => {
            let r = 0 === n ? 0 : i * (n / 100);
            return (r += t), (r = e - r), r > 0 ? r : 0;
        }),
        (this.quotaPrice = (e, t, i) => {
            let n = t + i;
            return (n = e - n), n > 0 ? n : 0;
        }),
        (this.calculatePercent = (e, t) => 100 - (100 * t) / e),
        (this.netPrice = (e, t) => {
            const i = e - (e * t) / 100;
            return i > 0 ? i : 0;
        }),
        (this.init = () => {
            const {
                max: t,
                maxNet: i,
                save: n,
                before: r,
                rebateValue: o,
                rebateType: s,
                currencyFormat: a,
                symbol: c,
                currencySpace: l,
                currencyBeforeValue: p,
            } = e;
            if (!t && !o) return !1;
            (this.currencyFormat =
                a || app_shop.vars?.currency?.format || app_shop.vars?.currency_format),
                (this.symbol = c || app_shop.vars?.currency?.symbol || app_shop.vars?.symbol),
                (this.currencySpace = l || app_shop.vars?.currency?.space || app_shop.vars?.currency_space),
                (this.currencyBeforeValue =
                    p || app_shop.vars?.currency?.beforeValue || app_shop.vars.currency_before_value),
                (this.rebateType = s || 'percentage');
            const d =
                'percentage' === this.rebateType
                    ? this.percentagePrice(+t, +n, +r, +o)
                    : this.quotaPrice(+t, +n, +o),
                u = this.calculatePercent(t, d),
                h = this.netPrice(i, u);
            return {
                gross: { value: this.roundPrice(d), formatted: this.formatPrice(d) },
                net: { value: this.roundPrice(h), formatted: this.formatPrice(h) },
                percent: Math.round(u),
            };
        }),
        this.init()
    );
}
app_shop.graphql || (app_shop.graphql = {}),
    (app_shop.graphql.getLowestPrice = async e => {
        const t = JSON.stringify({
            query: `query {\n      getLastLowestProductPrices(${e}) {\n        id\n        sizes {\n          id\n          price {\n            ${app_shop?.vars?.priceType || 'gross'
                } {\n              value\n              currency\n              formatted\n            }\n          }\n        }\n      }\n    }`,
        });
        try {
            const e = app_shop?.urls?.graphql
                ? `${app_shop?.urls?.graphql}?getLastLowestProductPrices`
                : '/graphql/v1/?getLastLowestProductPrices',
                i = await fetch(e, {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json', Accept: 'application/json' },
                    body: t,
                });
            return await i.json();
        } catch (e) {
            return console.error('AJAX fetchLastLowestProductPrices() Error:', e), !1;
        }
    });
class VanillaCalendar {
    constructor(e, t) {
        (this.HTMLElement = 'object' == typeof e ? e : document.querySelector(e)),
            this.HTMLElement &&
            ((this.type = t?.type ?? 'default'),
                (this.date = {
                    min: t?.date?.min ?? '1970-01-01',
                    max: t?.date?.max ?? '2470-12-31',
                    today: t?.date?.today ?? new Date(),
                }),
                (this.info = { top: t?.info?.top ?? !1, bottom: t?.info?.bottom ?? !1 }),
                (this.settings = {
                    lang: t?.settings?.lang ?? app_shop?.vars?.language?.symbol ?? 'pl',
                    iso8601: t?.settings?.iso8601 ?? !0,
                    workingDays: t?.settings?.workingDays ?? null,
                    disabled: {
                        weekDay: t?.settings?.disabled?.weekDay ?? null,
                        weekends: t?.settings?.disabled?.weekends ?? !1,
                    },
                    range: {
                        min: t?.settings?.range?.min ?? this.date.min,
                        max: t?.settings?.range?.max ?? this.date.max,
                        disabled: t?.settings?.range?.disabled ?? null,
                        enabled: t?.settings?.range?.enabled ?? null,
                    },
                    selection: {
                        day: t?.settings?.selection?.day ?? 'single',
                        month: t?.settings?.selection?.month ?? !0,
                        year: t?.settings?.selection?.year ?? !0,
                        time: t?.settings?.selection?.time ?? !1,
                        controlTime: t?.settings?.selection?.controlTime ?? 'all',
                        stepHours: t?.settings?.selection?.stepHours ?? 1,
                        stepMinutes: t?.settings?.selection?.stepMinutes ?? 1,
                    },
                    selected: {
                        dates: t?.settings?.selected?.dates ?? null,
                        month: t?.settings?.selected?.month ?? null,
                        year: t?.settings?.selected?.year ?? null,
                        holidays: t?.settings?.selected?.holidays ?? null,
                        time: t?.settings?.selected?.time ?? null,
                    },
                    visibility: {
                        templateHeader: t?.settings?.visibility?.templateHeader ?? '%M %Y',
                        monthShort: t?.settings?.visibility?.monthShort ?? !0,
                        weekNumbers: t?.settings?.visibility?.weekNumbers ?? !1,
                        weekend: t?.settings?.visibility?.weekend ?? !0,
                        today: t?.settings?.visibility?.today ?? !0,
                        disabled: t?.settings?.visibility?.disabled ?? !1,
                    },
                }),
                (this.locale = { months: t?.locale?.months ?? [], weekday: t?.locale?.weekday ?? [] }),
                (this.actions = {
                    clickDay: t?.actions?.clickDay ?? null,
                    clickMonth: t?.actions?.clickMonth ?? null,
                    clickYear: t?.actions?.clickYear ?? null,
                    changeTime: t?.actions?.changeTime ?? null,
                }),
                (this.popups = t?.popups ?? null),
                (this.currentType = this.type),
                (this.selectedKeeping = null),
                (this.userTime = !1));
    }
    generateDate(e) {
        const t = e.getUTCFullYear();
        let i = e.getUTCMonth() + 1,
            n = e.getUTCDate();
        return (i = i < 10 ? `0${i}` : i), (n = n < 10 ? `0${n}` : n), `${t}-${i}-${n}`;
    }
    transformTime12(e) {
        const t = Number(e);
        let i = t;
        return (
            0 === t
                ? (i = '12')
                : 13 === t
                    ? (i = '01')
                    : 14 === t
                        ? (i = '02')
                        : 15 === t
                            ? (i = '03')
                            : 16 === t
                                ? (i = '04')
                                : 17 === t
                                    ? (i = '05')
                                    : 18 === t
                                        ? (i = '06')
                                        : 19 === t
                                            ? (i = '07')
                                            : 20 === t
                                                ? (i = '08')
                                                : 21 === t
                                                    ? (i = '09')
                                                    : 22 === t
                                                        ? (i = '10')
                                                        : 23 === t && (i = '11'),
            i
        );
    }
    transformTime24(e, t) {
        const i = Number(e);
        let n = i;
        return (
            'AM' === t
                ? 12 === i && (n = '00')
                : 'PM' === t &&
                (1 === i
                    ? (n = '13')
                    : 2 === i
                        ? (n = '14')
                        : 3 === i
                            ? (n = '15')
                            : 4 === i
                                ? (n = '16')
                                : 5 === i
                                    ? (n = '17')
                                    : 6 === i
                                        ? (n = '18')
                                        : 7 === i
                                            ? (n = '19')
                                            : 8 === i
                                                ? (n = '20')
                                                : 9 === i
                                                    ? (n = '21')
                                                    : 10 === i
                                                        ? (n = '22')
                                                        : 11 === i && (n = '23')),
            n
        );
    }
    setVariablesDates() {
        null !== this.settings.selected.dates
            ? (this.selectedDates = this.settings.selected.dates)
            : (this.selectedDates = []),
            null !== this.settings.selected.month &&
                this.settings.selected.month >= 0 &&
                this.settings.selected.month < 12
                ? (this.selectedMonth = this.settings.selected.month)
                : (this.selectedMonth = this.date.today.getUTCMonth()),
            null !== this.settings.selected.year &&
                this.settings.selected.year >= 0 &&
                this.settings.selected.year <= 9999
                ? (this.selectedYear = this.settings.selected.year)
                : (this.selectedYear = this.date.today.getUTCFullYear()),
            (this.viewYear = this.selectedYear),
            (this.dateMin = this.settings.visibility.disabled
                ? new Date(this.date.min)
                : new Date(this.settings.range.min)),
            (this.dateMax = this.settings.visibility.disabled
                ? new Date(this.date.max)
                : new Date(this.settings.range.max));
        const e = !0 === this.settings.selection.time || 12 === this.settings.selection.time;
        if (e || 24 === this.settings.selection.time) {
            if ('string' == typeof this.settings.selected.time) {
                const t = e
                    ? /^([0-9]|0[1-9]|1[0-2]):([0-5][0-9])|(AM|PM)/g
                    : /^([0-1]?[0-9]|2[0-3]):([0-5][0-9])/g;
                this.settings.selected.time.replace(t, (t, i, n, r) => {
                    i && n && ((this.userTime = !0), (this.selectedHours = i), (this.selectedMinutes = n)),
                        r && e ? (this.selectedKeeping = r) : e && (this.selectedKeeping = 'AM');
                });
            }
            !this.userTime && e
                ? ((this.selectedHours = this.transformTime12(this.date.today.getHours())),
                    (this.selectedMinutes = this.date.today.getMinutes()),
                    (this.selectedKeeping = Number(this.date.today.getHours()) > 12 ? 'PM' : 'AM'))
                : this.userTime ||
                ((this.selectedHours = this.date.today.getHours()),
                    (this.selectedMinutes = this.date.today.getMinutes())),
                (this.selectedHours =
                    Number(this.selectedHours) < 10
                        ? `0${Number(this.selectedHours)}`
                        : `${this.selectedHours}`),
                (this.selectedMinutes =
                    Number(this.selectedMinutes) < 10
                        ? `0${Number(this.selectedMinutes)}`
                        : `${this.selectedMinutes}`),
                (this.selectedTime = `${this.selectedHours}:${this.selectedMinutes}${this.selectedKeeping ? ` ${this.selectedKeeping}` : ''
                    }`);
        } else
            this.settings.selection.time &&
                ((this.settings.selection.time = null),
                    console.error('The value of the time property can be: false, true, 12 or 24.'));
    }
    createDOM() {
        'default' === this.currentType
            ? (this.HTMLElement.classList.add('vanilla-calendar_default'),
                this.HTMLElement.classList.remove('vanilla-calendar_month'),
                this.HTMLElement.classList.remove('vanilla-calendar_year'),
                (this.HTMLElement.innerHTML = `\n      ${this.info.top ? '\n      <div class="vanilla-calendar-info --top"></div>\n      ' : ''
                    }\n      <div class="vanilla-calendar-header">\n        <button type="button"\n          class="vanilla-calendar-arrow vanilla-calendar-arrow_prev"\n          data-calendar-arrow="prev"\n          title="Prev">\n        </button>\n        <div class="vanilla-calendar-header__content"></div>\n        <button type="button"\n          class="vanilla-calendar-arrow vanilla-calendar-arrow_next"\n          data-calendar-arrow="next"\n          title="Next">\n        </button>\n      </div>\n      ${this.settings.visibility.weekNumbers
                        ? '\n      <div class="vanilla-calendar-column">\n        <b class="vanilla-calendar-column__title">#</b>\n        <div class="vanilla-calendar-column__content vanilla-calendar-week-numbers"></div>\n      </div>\n      '
                        : ''
                    }\n      <div class="vanilla-calendar-content">\n        <div class="vanilla-calendar-week"></div>\n        <div class="vanilla-calendar-days"></div>\n        ${this.settings.selection.time
                        ? '\n        <div class="vanilla-calendar-time"></div>\n        '
                        : ''
                    }\n      </div>\n      ${this.info.bottom
                        ? '\n      <div class="vanilla-calendar-info --bottom"></div>\n      '
                        : ''
                    }\n    `))
            : 'month' === this.currentType
                ? (this.HTMLElement.classList.remove('vanilla-calendar_default'),
                    this.HTMLElement.classList.add('vanilla-calendar_month'),
                    this.HTMLElement.classList.remove('vanilla-calendar_year'),
                    (this.HTMLElement.innerHTML =
                        '\n      <div class="vanilla-calendar-header">\n        <div class="vanilla-calendar-header__content"></div>\n      </div>\n      <div class="vanilla-calendar-content">\n        <div class="vanilla-calendar-months"></div>\n      </div>'))
                : 'year' === this.currentType &&
                (this.HTMLElement.classList.remove('vanilla-calendar_default'),
                    this.HTMLElement.classList.remove('vanilla-calendar_month'),
                    this.HTMLElement.classList.add('vanilla-calendar_year'),
                    (this.HTMLElement.innerHTML =
                        '\n      <div class="vanilla-calendar-header">\n        <button type="button"\n          class="vanilla-calendar-arrow vanilla-calendar-arrow_prev"\n          title="prev">\n        </button>\n        <div class="vanilla-calendar-header__content"></div>\n        <button type="button"\n          class="vanilla-calendar-arrow vanilla-calendar-arrow_next"\n          title="next">\n        </button>\n      </div>\n      <div class="vanilla-calendar-content">\n        <div class="vanilla-calendar-years"></div>\n      </div>'));
    }
    createHeader() {
        const e = this.HTMLElement.querySelector('.vanilla-calendar-header__content'),
            t = this.settings.selection.month ? '' : ' vanilla-calendar-month_disabled',
            i = this.settings.selection.year ? '' : ' vanilla-calendar-year_disabled',
            n =
                `\n    <button type="button"\n      class="vanilla-calendar-month${t}"\n      data-calendar-selected-month="${this.selectedMonth
                    }">\n      ${this.locale.months[this.selectedMonth]}\n    </button>`.replace(/[\n\t]/g, ''),
            r =
                `\n    <button type="button"\n      class="vanilla-calendar-year${i}"\n      data-calendar-selected-year="${this.selectedYear}">\n      ${this.selectedYear}\n    </button>`.replace(
                    /[\n\t]/g,
                    '',
                );
        let o = this.settings.visibility.templateHeader.replace('%M', n);
        (o = o.replace('%Y', r)), (e.innerHTML = o);
    }
    controlArrows() {
        if (!['default', 'year'].includes(this.currentType)) return;
        const e = this.HTMLElement.querySelector('.vanilla-calendar-arrow_prev'),
            t = this.HTMLElement.querySelector('.vanilla-calendar-arrow_next');
        (() => {
            if ('default' !== this.currentType) return;
            const i = this.selectedMonth === this.dateMin.getUTCMonth(),
                n = this.selectedMonth === this.dateMax.getUTCMonth(),
                r = !this.settings.selection.year || this.selectedYear === this.dateMin.getUTCFullYear(),
                o = !this.settings.selection.year || this.selectedYear === this.dateMax.getUTCFullYear();
            (i && r) || !this.settings.selection.month
                ? (e.style.visibility = 'hidden')
                : (e.style.visibility = null),
                (n && o) || !this.settings.selection.month
                    ? (t.style.visibility = 'hidden')
                    : (t.style.visibility = null);
        })(),
            (() => {
                'year' === this.currentType &&
                    (this.dateMin.getUTCFullYear() && this.viewYear - 7 <= this.dateMin.getUTCFullYear()
                        ? (e.style.visibility = 'hidden')
                        : (e.style.visibility = null),
                        this.dateMax.getUTCFullYear() && this.viewYear + 7 >= this.dateMax.getUTCFullYear()
                            ? (t.style.visibility = 'hidden')
                            : (t.style.visibility = null));
            })();
    }
    createWeek() {
        const e = this.HTMLElement.querySelector('.vanilla-calendar-week'),
            t = document.createElement('b');
        t.className = 'vanilla-calendar-week__day';
        const i = [...this.locale.weekday];
        this.settings.iso8601 && i.push(i.shift()), (e.innerHTML = '');
        for (let n = 0; n < i.length; n++) {
            const r = i[n],
                o = t.cloneNode(!0);
            this.settings.visibility.weekend && this.settings.iso8601
                ? (5 !== n && 6 !== n) || o.classList.add('vanilla-calendar-week__day_weekend')
                : this.settings.visibility.weekend &&
                !this.settings.iso8601 &&
                ((0 !== n && 6 !== n) || o.classList.add('vanilla-calendar-week__day_weekend')),
                (o.innerText = `${r}`),
                e.append(o);
        }
    }
    getWeekNumber(e) {
        const t = new Date(e).getUTCDate(),
            i = new Date(e).getUTCMonth(),
            n = new Date(e).getUTCFullYear(),
            r = new Date(n, i, t),
            o = new Date(Date.UTC(r.getUTCFullYear(), 0, 1)),
            s = Math.ceil(((r - o) / 864e5 + 1) / 7);
        return { year: r.getUTCFullYear(), week: s };
    }
    createWeekNumbers(e, t) {
        if (!this.settings.visibility.weekNumbers) return;
        const i = this.HTMLElement.querySelector('.vanilla-calendar-week-numbers'),
            n = this.HTMLElement.querySelectorAll('.vanilla-calendar-day__btn'),
            r = Math.ceil((e + t) / 7),
            o = document.createElement('span');
        (o.className = 'vanilla-calendar-week-number'), (i.innerHTML = '');
        for (let e = 0; e < r; e++) {
            const t = this.getWeekNumber(n[7 * e].dataset.calendarDay),
                r = o.cloneNode(!0);
            (r.innerText = `${t.week}`), (r.dataset.calendarYearWeek = `${t.year}`), i.append(r);
        }
    }
    createPopup(e) {
        if (this.popups)
            for (const t in this.popups)
                if (Object.hasOwnProperty.call(this.popups, t)) {
                    const i = e.querySelector(`[data-calendar-day="${t}"]`);
                    if (i) {
                        const e = this.popups[t];
                        i.classList.add(e.modifier),
                            (i.parentNode.innerHTML += `<div class="vanilla-calendar-day__popup">${e.html}</div>`);
                    }
                }
    }
    createDays() {
        const e = new Date(Date.UTC(this.selectedYear, this.selectedMonth, 1)),
            t = new Date(Date.UTC(this.selectedYear, this.selectedMonth + 1, 0)).getUTCDate();
        let i = Number(e.getUTCDay());
        this.settings.iso8601 && (i = Number((0 !== e.getUTCDay() ? e.getUTCDay() : 7) - 1));
        const n = this.HTMLElement.querySelector('.vanilla-calendar-days'),
            r = document.createElement('div'),
            o = document.createElement('button');
        (r.className = 'vanilla-calendar-day'),
            (o.className = 'vanilla-calendar-day__btn'),
            (o.type = 'button'),
            ['single', 'multiple', 'multiple-ranged'].includes(this.settings.selection.day) &&
            n.classList.add('vanilla-calendar-days_selecting'),
            (n.innerHTML = '');
        const s = (e, t, i, n) => {
            !this.settings.visibility.weekend ||
                (0 !== t && 6 !== t) ||
                e.classList.add('vanilla-calendar-day__btn_weekend'),
                Array.isArray(this.settings.selected.holidays) &&
                this.settings.selected.holidays.forEach(t => {
                    t === i && e.classList.add('vanilla-calendar-day__btn_holiday');
                });
            let r = this.date.today.getUTCDate(),
                o = this.date.today.getUTCMonth() + 1;
            (r = r < 10 ? `0${r}` : r), (o = o < 10 ? `0${o}` : o);
            const s = `${this.date.today.getUTCFullYear()}-${o}-${r}`;
            this.settings.visibility.today &&
                e.dataset.calendarDay === s &&
                e.classList.add('vanilla-calendar-day__btn_today'),
                0 === this.selectedDates.indexOf(i) ||
                    (this.selectedDates[0] && this.selectedDates.indexOf(i) === this.selectedDates.length - 1)
                    ? e.classList.add('vanilla-calendar-day__btn_selected')
                    : 'multiple-ranged' === this.settings.selection.day && this.selectedDates.indexOf(i) > 0
                        ? (e.classList.add('vanilla-calendar-day__btn_selected'),
                            e.classList.add('vanilla-calendar-day__btn_intermediate'))
                        : this.selectedDates.indexOf(i) > 0 &&
                        e.classList.add('vanilla-calendar-day__btn_selected'),
                (this.settings.range.min > i || this.settings.range.max < i) &&
                e.classList.add('vanilla-calendar-day__btn_disabled'),
                this.settings.selection.month ||
                n ||
                e.classList.add('vanilla-calendar-day__btn_disabled'),
                this.settings.selection.year ||
                new Date(i).getFullYear() === this.selectedYear ||
                e.classList.add('vanilla-calendar-day__btn_disabled'),
                Array.isArray(this.settings.range.disabled)
                    ? this.settings.range.disabled.forEach(t => {
                        t === i && e.classList.add('vanilla-calendar-day__btn_disabled');
                    })
                    : Array.isArray(this.settings.range.enabled) &&
                    (e.classList.add('vanilla-calendar-day__btn_disabled'),
                        this.settings.range.enabled.forEach(t => {
                            t === i && e.classList.remove('vanilla-calendar-day__btn_disabled');
                        })),
                !this.settings.disabled.weekends ||
                (0 !== t && 6 !== t) ||
                e.classList.add('vanilla-calendar-day__btn_disabled'),
                Array.isArray(this.settings.disabled.weekDay) &&
                this.settings.disabled.weekDay.forEach(i => {
                    i === t && e.classList.add('vanilla-calendar-day__btn_disabled');
                }),
                Array.isArray(this.settings.workingDays) &&
                (this.settings.workingDays.includes(t) ||
                    e.classList.add('vanilla-calendar-day__btn_disabled'));
        },
            a = (e, t, i, a, c) => {
                const l = r.cloneNode(!0),
                    p = o.cloneNode(!0);
                c && p.classList.add(c),
                    (p.innerText = e),
                    (p.dataset.calendarDay = i),
                    s(p, t, i, a),
                    l.append(p),
                    n.append(l);
            };
        (() => {
            let e = new Date(Date.UTC(this.selectedYear, this.selectedMonth, 0)).getUTCDate() - i,
                t = this.selectedYear,
                n = this.selectedMonth;
            0 === this.selectedMonth
                ? ((n = this.locale.months.length), (t = this.selectedYear - 1))
                : this.selectedMonth < 10 && (n = `0${this.selectedMonth}`);
            for (let r = 0; r < i; r++) {
                e += 1;
                const i = `${t}-${n}-${e}`,
                    r = new Date(Date.UTC(this.selectedYear, this.selectedMonth, e - 1)).getUTCMonth() - 1,
                    o = new Date(Date.UTC(this.selectedYear, r, e)).getUTCDay();
                a(e, o, i, !1, 'vanilla-calendar-day__btn_prev');
            }
        })(),
            (() => {
                for (let e = 1; e <= t; e++) {
                    const t = new Date(Date.UTC(this.selectedYear, this.selectedMonth, e)),
                        i = this.generateDate(t),
                        n = t.getUTCDay();
                    a(e, n, i, !0);
                }
            })(),
            (() => {
                const e = i + t,
                    n = Math.ceil(e / this.locale.weekday.length),
                    r = this.locale.weekday.length * n - e;
                let o = this.selectedYear,
                    s = this.selectedMonth + 2;
                this.selectedMonth + 1 === this.locale.months.length
                    ? ((s = '01'), (o = this.selectedYear + 1))
                    : this.selectedMonth + 2 < 10 && (s = `0${this.selectedMonth + 2}`);
                for (let e = 1; e <= r; e++) {
                    const t = `${o}-${s}-${e < 10 ? `0${e}` : e}`,
                        i = new Date(Date.UTC(this.selectedYear, this.selectedMonth, e)).getUTCMonth() + 1,
                        n = new Date(Date.UTC(this.selectedYear, i, e)).getUTCDay();
                    a(e, n, t, !1, 'vanilla-calendar-day__btn_next');
                }
            })(),
            this.createPopup(n),
            this.createWeekNumbers(i, t);
    }
    changeMonth(e) {
        const t = this.locale.months.length - 1;
        switch (e) {
            case 'prev':
                0 !== this.selectedMonth
                    ? (this.selectedMonth -= 1)
                    : this.settings.selection.year && ((this.selectedYear -= 1), (this.selectedMonth = t));
                break;
            case 'next':
                this.selectedMonth !== t
                    ? (this.selectedMonth += 1)
                    : this.settings.selection.year && ((this.selectedYear += 1), (this.selectedMonth = 0));
        }
        (this.settings.selected.month = this.selectedMonth),
            (this.settings.selected.year = this.selectedYear),
            this.createHeader(),
            this.controlArrows(),
            this.createDays();
    }
    createYears() {
        (this.currentType = 'year'), this.createDOM(), this.createHeader(), this.controlArrows();
        const e = this.HTMLElement.querySelector('.vanilla-calendar-years');
        this.settings.selection.year && e.classList.add('vanilla-calendar-years_selecting');
        const t = document.createElement('button');
        (t.type = 'button'), (t.className = 'vanilla-calendar-years__year');
        for (let i = this.viewYear - 7; i < this.viewYear + 8; i++) {
            const n = i,
                r = t.cloneNode(!0);
            n === this.selectedYear && r.classList.add('vanilla-calendar-years__year_selected'),
                n < this.dateMin.getUTCFullYear() &&
                r.classList.add('vanilla-calendar-years__year_disabled'),
                n > this.dateMax.getUTCFullYear() &&
                r.classList.add('vanilla-calendar-years__year_disabled'),
                (r.dataset.calendarYear = n),
                (r.innerText = `${n}`),
                e.append(r);
        }
    }
    createMonths() {
        (this.currentType = 'month'), this.createDOM(), this.createHeader();
        const e = this.HTMLElement.querySelector('.vanilla-calendar-months');
        this.settings.selection.month && e.classList.add('vanilla-calendar-months_selecting');
        const t = document.createElement('button');
        (t.type = 'button'), (t.className = 'vanilla-calendar-months__month');
        for (let i = 0; i < this.locale.months.length; i++) {
            const n = this.locale.months[i],
                r = t.cloneNode(!0);
            i === this.selectedMonth && r.classList.add('vanilla-calendar-months__month_selected'),
                i < this.dateMin.getUTCMonth() &&
                this.selectedYear === this.dateMin.getUTCFullYear() &&
                r.classList.add('vanilla-calendar-months__month_disabled'),
                i > this.dateMax.getUTCMonth() &&
                this.selectedYear === this.dateMax.getUTCFullYear() &&
                r.classList.add('vanilla-calendar-months__month_disabled'),
                (r.dataset.calendarMonth = i),
                (r.title = `${n}`),
                (r.innerText = `${this.settings.visibility.monthShort ? n.substring(0, 3) : n}`),
                e.append(r);
        }
    }
    controlTime(e) {
        const t = this.HTMLElement.querySelector('.vanilla-calendar-time__range input[name="hours"]'),
            i = this.HTMLElement.querySelector('.vanilla-calendar-time__range input[name="minutes"]'),
            n = this.HTMLElement.querySelector('.vanilla-calendar-time__hours input[name="hours"]'),
            r = this.HTMLElement.querySelector('.vanilla-calendar-time__minutes input[name="minutes"]'),
            o = this.HTMLElement.querySelector('.vanilla-calendar-time__keeping'),
            s = (e, t) => {
                e.addEventListener('mouseover', () => t.classList.add('is-focus'));
            },
            a = (e, t) => {
                e.addEventListener('mouseout', () => t.classList.remove('is-focus'));
            },
            c = (e, t, i) => {
                'hours' === i
                    ? (this.selectedHours = `${t}`)
                    : 'minutes' === i && (this.selectedMinutes = `${t}`),
                    (this.selectedTime = `${this.selectedHours}:${this.selectedMinutes}${this.selectedKeeping ? ` ${this.selectedKeeping}` : ''
                        }`),
                    (this.settings.selected.time = this.selectedTime),
                    this.actions.changeTime &&
                    this.actions.changeTime(
                        e,
                        this.selectedTime,
                        this.selectedHours,
                        this.selectedMinutes,
                        this.selectedKeeping,
                    );
            },
            l = (e, t, i, n) => {
                e.addEventListener('input', e => {
                    let r = Number(e.target.value);
                    (r = r < 10 ? `0${r}` : `${r}`),
                        'hours' === i && 12 === n
                            ? Number(e.target.value) < n && Number(e.target.value) > 0
                                ? ((t.value = r),
                                    (this.selectedKeeping = 'AM'),
                                    (o.innerText = this.selectedKeeping),
                                    c(e, r, i))
                                : (0 === Number(e.target.value)
                                    ? ((this.selectedKeeping = 'AM'), (o.innerText = 'AM'))
                                    : ((this.selectedKeeping = 'PM'), (o.innerText = 'PM')),
                                    (t.value = this.transformTime12(e.target.value)),
                                    c(e, this.transformTime12(e.target.value), i))
                            : ((t.value = r), c(e, r, i));
                });
            },
            p = (e, t, i, n) => {
                t.addEventListener('change', t => {
                    let r = Number(t.target.value);
                    (r = r < 10 ? `0${r}` : `${r}`),
                        'hours' === i && 12 === n
                            ? t.target.value && Number(t.target.value) <= n && Number(t.target.value) > 0
                                ? ((t.target.value = r),
                                    (e.value = this.transformTime24(r, this.selectedKeeping)),
                                    c(t, r, i))
                                : t.target.value &&
                                    Number(t.target.value) < 24 &&
                                    (Number(t.target.value) > n || 0 === Number(t.target.value))
                                    ? (0 === Number(t.target.value)
                                        ? ((this.selectedKeeping = 'AM'), (o.innerText = 'AM'))
                                        : ((this.selectedKeeping = 'PM'), (o.innerText = 'PM')),
                                        (t.target.value = this.transformTime12(t.target.value)),
                                        (e.value = r),
                                        c(t, this.transformTime12(t.target.value), i))
                                    : (t.target.value = this.selectedHours)
                            : t.target.value && Number(t.target.value) <= n && Number(t.target.value) >= 0
                                ? ((t.target.value = r), (e.value = r), c(t, r, i))
                                : 'hours' === i
                                    ? (t.target.value = this.selectedHours)
                                    : 'minutes' === i && (t.target.value = this.selectedMinutes);
                });
            };
        s(t, n),
            s(i, r),
            a(t, n),
            a(i, r),
            l(t, n, 'hours', 24 === e ? 23 : e),
            l(i, r, 'minutes'),
            p(t, n, 'hours', 24 === e ? 23 : e),
            p(i, r, 'minutes', 59),
            o &&
            o.addEventListener('click', e => {
                o.innerText.includes('AM')
                    ? (this.selectedKeeping = 'PM')
                    : (this.selectedKeeping = 'AM'),
                    (t.value = this.transformTime24(this.selectedHours, this.selectedKeeping)),
                    c(e, this.selectedHours, 'hours'),
                    (o.innerText = this.selectedKeeping);
            });
    }
    createTime() {
        const e = this.HTMLElement.querySelector('.vanilla-calendar-time');
        if (!e) return;
        const t = !0 === this.settings.selection.time ? 12 : this.settings.selection.time,
            i = 'range' === this.settings.selection.controlTime;
        (e.innerHTML = `\n    <div class="vanilla-calendar-time__content">\n      <label class="vanilla-calendar-time__hours">\n        <input type="text"\n          name="hours"\n          maxlength="2"\n          value="${this.selectedHours
            }"\n          ${i ? 'disabled' : ''
            }>\n      </label>\n      <label class="vanilla-calendar-time__minutes">\n        <input type="text"\n          name="minutes"\n          maxlength="2"\n          value="${this.selectedMinutes
            }"\n          ${i ? 'disabled' : ''}>\n      </label>\n      ${12 === t
                ? `\n      <button type="button"\n        class="vanilla-calendar-time__keeping"\n        ${i ? 'disabled' : ''
                }>${this.selectedKeeping}</button>\n      `
                : ''
            }\n    </div>\n    <div class="vanilla-calendar-time__ranges">\n      <label class="vanilla-calendar-time__range">\n        <input type="range"\n          name="hours"\n          min="0"\n          max="23"\n          step="${this.settings.selection.stepHours
            }"\n          value="${this.selectedKeeping
                ? this.transformTime24(this.selectedHours, this.selectedKeeping)
                : this.selectedHours
            }">\n      </label>\n      <label class="vanilla-calendar-time__range">\n        <input type="range"\n          name="minutes"\n          min="0"\n          max="59"\n          step="${this.settings.selection.stepMinutes
            }"\n          value="${this.selectedMinutes}">\n      </label>\n    </div>`),
            this.controlTime(t);
    }
    getLocale() {
        if ('define' !== this.settings.lang) {
            this.locale.weekday = [];
            for (let e = 0; e < 7; e++) {
                let t = new Date(0, 0, e).toLocaleString(this.settings.lang, { weekday: 'short' });
                (t = `${t.charAt(0).toUpperCase()}${t.substring(1, t.length)}`),
                    (t = t.replace(/\./, '')),
                    this.locale.weekday.push(t);
            }
            this.locale.months = [];
            for (let e = 0; e < 12; e++) {
                let t = new Date(0, e).toLocaleString(this.settings.lang, { month: 'long' });
                (t = `${t.charAt(0).toUpperCase()}${t.substring(1, t.length)}`),
                    (t = t.replace(/\./, '')),
                    this.locale.months.push(t);
            }
        }
    }
    createInfo() {
        if (this.info.top) {
            this.HTMLElement.querySelector('.vanilla-calendar-info.--top').innerHTML = this.info.top;
        }
        if (this.info.bottom) {
            this.HTMLElement.querySelector('.vanilla-calendar-info.--bottom').innerHTML =
                this.info.bottom;
        }
    }
    update() {
        this.setVariablesDates(),
            this.getLocale(),
            this.createDOM(),
            this.createHeader(),
            this.controlArrows(),
            this.createTime(),
            this.createInfo(),
            'default' === this.currentType
                ? (this.createWeek(), this.createDays())
                : 'month' === this.currentType
                    ? this.createMonths()
                    : 'year' === this.currentType && this.createYears();
    }
    click() {
        this.HTMLElement.addEventListener('click', e => {
            const t = e.target.closest('.vanilla-calendar-arrow'),
                i = e.target.closest('.vanilla-calendar-arrow_prev'),
                n = e.target.closest('.vanilla-calendar-arrow_next'),
                r = e.target.closest('.vanilla-calendar-day__btn'),
                o = e.target.closest('.vanilla-calendar-day__btn_prev'),
                s = e.target.closest('.vanilla-calendar-day__btn_next'),
                a = e.target.closest('.vanilla-calendar-year'),
                c = e.target.closest('.vanilla-calendar-years__year'),
                l = e.target.closest('.vanilla-calendar-month'),
                p = e.target.closest('.vanilla-calendar-months__month'),
                d = () => {
                    r.classList.contains('vanilla-calendar-day__btn_selected')
                        ? this.selectedDates.splice(this.selectedDates.indexOf(r.dataset.calendarDay), 1)
                        : ((this.selectedDates = []), this.selectedDates.push(r.dataset.calendarDay));
                },
                u = () => {
                    r.classList.contains('vanilla-calendar-day__btn_selected')
                        ? this.selectedDates.splice(this.selectedDates.indexOf(r.dataset.calendarDay), 1)
                        : this.selectedDates.push(r.dataset.calendarDay);
                },
                h = () => {
                    if (
                        (this.selectedDates.length > 1 && (this.selectedDates = []),
                            this.selectedDates.push(r.dataset.calendarDay),
                            !this.selectedDates[1])
                    )
                        return;
                    const e = new Date(
                        Date.UTC(
                            new Date(this.selectedDates[0]).getUTCFullYear(),
                            new Date(this.selectedDates[0]).getUTCMonth(),
                            new Date(this.selectedDates[0]).getUTCDate(),
                        ),
                    ),
                        t = new Date(
                            Date.UTC(
                                new Date(this.selectedDates[1]).getUTCFullYear(),
                                new Date(this.selectedDates[1]).getUTCMonth(),
                                new Date(this.selectedDates[1]).getUTCDate(),
                            ),
                        ),
                        i = e => {
                            const t = this.generateDate(e);
                            (this.settings.range.disabled && this.settings.range.disabled.includes(t)) ||
                                this.selectedDates.push(t);
                        };
                    if (((this.selectedDates = []), t > e))
                        for (let n = e; n <= t; n.setUTCDate(n.getUTCDate() + 1)) i(n);
                    else for (let n = e; n >= t; n.setUTCDate(n.getUTCDate() - 1)) i(n);
                };
            (() => {
                t &&
                    'year' !== this.currentType &&
                    'month' !== this.currentType &&
                    this.changeMonth(e.target.dataset.calendarArrow);
            })(),
                (() => {
                    if (
                        ['single', 'multiple', 'multiple-ranged'].includes(this.settings.selection.day) &&
                        r
                    ) {
                        switch (this.settings.selection.day) {
                            case 'single':
                                d();
                                break;
                            case 'multiple':
                                u();
                                break;
                            case 'multiple-ranged':
                                h();
                        }
                        this.actions.clickDay && this.actions.clickDay(e, this.selectedDates),
                            (this.settings.selected.dates = this.selectedDates),
                            o ? this.changeMonth('prev') : s ? this.changeMonth('next') : this.createDays();
                    }
                })(),
                (() => {
                    this.settings.selection.year &&
                        (t && 'year' === this.currentType
                            ? (n ? (this.viewYear += 15) : i && (this.viewYear -= 15), this.createYears())
                            : 'year' !== this.currentType && a
                                ? this.createYears()
                                : 'year' === this.currentType && a
                                    ? ((this.currentType = this.type), this.update())
                                    : c &&
                                    ((this.selectedYear = Number(c.dataset.calendarYear)),
                                        (this.currentType = this.type),
                                        this.selectedMonth < this.dateMin.getUTCMonth() &&
                                        this.selectedYear === this.dateMin.getUTCFullYear() &&
                                        (this.settings.selected.month = this.dateMin.getUTCMonth()),
                                        this.selectedMonth > this.dateMax.getUTCMonth() &&
                                        this.selectedYear === this.dateMax.getUTCFullYear() &&
                                        (this.settings.selected.month = this.dateMax.getUTCMonth()),
                                        this.actions.clickYear && this.actions.clickYear(e, this.selectedYear),
                                        (this.settings.selected.year = this.selectedYear),
                                        this.update()));
                })(),
                (() => {
                    this.settings.selection.month &&
                        ('month' !== this.currentType && l
                            ? this.createMonths()
                            : 'month' === this.currentType && l
                                ? ((this.currentType = this.type), this.update())
                                : p &&
                                ((this.selectedMonth = Number(p.dataset.calendarMonth)),
                                    (this.currentType = this.type),
                                    this.actions.clickMonth && this.actions.clickMonth(e, this.selectedMonth),
                                    (this.settings.selected.month = this.selectedMonth),
                                    this.update()));
                })();
        });
    }
    init() {
        this.HTMLElement && (this.update(), this.click());
    }
}
function FormValidation(e) {
    const { form: t, formSelector: i, afterValidate: n, afterValidateForm: r } = e || {};
    (this.debounce = (e, t = 500) => {
        let i;
        return (...n) => {
            clearTimeout(i), (i = setTimeout(() => e(...n), t));
        };
    }),
        (this.fetchData = async e => {
            try {
                const t = await fetch(
                    `${app_shop?.urls?.graphql || '/graphql/v1/'}?query=validateClientData`,
                    { method: 'POST', body: JSON.stringify({ query: `query {${e}}` }) },
                );
                return await t.json();
            } catch (e) {
                return console.error('AJAX FormValidation() validateClientData Error:', e), !1;
            }
        }),
        (this.vars = { passwordLengthMin: 6, passwordLengthMax: 30, changedInputs: [] }),
        (this.callbacks = { validate: n, validateAll: r }),
        (this.errorCode = {
            birth_date:
                app_shop?.txt?.errorCode?.birth_date ||
                'Wpisz poprawnÄ datÄ urodzenia w formacie RRRR-MM-DD',
            illegal_characters_client_city:
                app_shop?.txt?.errorCode?.illegal_characters_client_city ||
                'Jeden z uĹźytych znakĂłw jest niedozwolony.',
            illegal_characters_client_firm:
                app_shop?.txt?.errorCode?.illegal_characters_client_firm ||
                'Jeden z uĹźytych znakĂłw jest niedozwolony.',
            illegal_characters_client_firstname:
                app_shop?.txt?.errorCode?.illegal_characters_client_firstname ||
                'Jeden z uĹźytych znakĂłw jest niedozwolony.',
            illegal_characters_client_lastname:
                app_shop?.txt?.errorCode?.illegal_characters_client_lastname ||
                'Jeden z uĹźytych znakĂłw jest niedozwolony.',
            illegal_characters_client_nip:
                app_shop?.txt?.errorCode?.illegal_characters_client_nip ||
                'Jeden z uĹźytych znakĂłw jest niedozwolony.',
            illegal_characters_client_phone:
                app_shop?.txt?.errorCode?.illegal_characters_client_phone ||
                'Jeden z uĹźytych znakĂłw jest niedozwolony.',
            illegal_characters_client_phone2:
                app_shop?.txt?.errorCode?.illegal_characters_client_phone2 ||
                'Jeden z uĹźytych znakĂłw jest niedozwolony.',
            illegal_characters_client_street:
                app_shop?.txt?.errorCode?.illegal_characters_client_street ||
                'Jeden z uĹźytych znakĂłw jest niedozwolony.',
            illegal_characters_delivery_additional:
                app_shop?.txt?.errorCode?.illegal_characters_delivery_additional ||
                'Jeden z uĹźytych znakĂłw jest niedozwolony.',
            illegal_characters_delivery_city:
                app_shop?.txt?.errorCode?.illegal_characters_delivery_city ||
                'Jeden z uĹźytych znakĂłw jest niedozwolony.',
            illegal_characters_delivery_firstname:
                app_shop?.txt?.errorCode?.illegal_characters_delivery_firstname ||
                'Jeden z uĹźytych znakĂłw jest niedozwolony.',
            illegal_characters_delivery_lastname:
                app_shop?.txt?.errorCode?.illegal_characters_delivery_lastname ||
                'Jeden z uĹźytych znakĂłw jest niedozwolony.',
            illegal_characters_delivery_phone:
                app_shop?.txt?.errorCode?.illegal_characters_delivery_phone ||
                'Jeden z uĹźytych znakĂłw jest niedozwolony.',
            illegal_characters_delivery_street:
                app_shop?.txt?.errorCode?.illegal_characters_delivery_street ||
                'Jeden z uĹźytych znakĂłw jest niedozwolony.',
            incorect_delivery_region:
                app_shop?.txt?.errorCode?.incorect_delivery_region || 'Wybierz kraj odbiorcy przesyĹki.',
            incorect_delivery_zipcode:
                app_shop?.txt?.errorCode?.incorect_delivery_zipcode ||
                'Wpisz kod pocztowy odbiorcy przesyĹki.',
            incorect_email:
                app_shop?.txt?.errorCode?.incorect_email ||
                'BĹÄdnie wpisany e-mail. Wpisz peĹny adres e-mail, np. jan@kowalski.com',
            incorect_invoice_phone:
                app_shop?.txt?.errorCode?.incorect_invoice_phone || 'Wpisz telefon klienta.',
            incorect_invoice_zipcode:
                app_shop?.txt?.errorCode?.incorect_invoice_zipcode || 'Wpisz kod pocztowy klienta.',
            incorect_login:
                app_shop?.txt?.errorCode?.incorect_login ||
                'BĹÄdnie wpisany login. Login musi mieÄ minimum 3, a maksimum 40 znakĂłw. MoĹźesz uĹźyÄ liter i cyfr oraz symboli @ . - _.',
            incorect_nip:
                app_shop?.txt?.errorCode?.incorect_nip || 'Niepoprawny NIP dla wybranego kraju.',
            incorect_phone: app_shop?.txt?.errorCode?.incorect_phone || 'Wpisz swĂłj telefon.',
            incorect_shops: app_shop?.txt?.errorCode?.incorect_shops || 'Wybierz sklep z listy.',
            incorect_zipcode:
                app_shop?.txt?.errorCode?.incorect_zipcode || 'BĹÄdnie wpisany kod pocztowy.',
            incorrect_region: app_shop?.txt?.errorCode?.incorrect_region || 'BĹÄdnie wybrany region.',
            invalid_format:
                app_shop?.txt?.errorCode?.invalid_format ||
                'NieprawidĹowy format. Pole musi zawieraÄ przynajmniej jednÄ literÄ.',
            login_equals_password:
                app_shop?.txt?.errorCode?.login_equals_password ||
                'HasĹo jest takie samo jak login. Wpisz inne hasĹo.',
            login_taken: app_shop?.txt?.errorCode?.login_taken || 'Podany login jest juĹź zajÄty',
            login_taken_login_propose:
                app_shop?.txt?.errorCode?.login_taken_login_propose ||
                'Podany login jest juĹź zajÄty.<br/><br/>Proponowany login: ',
            no_city: app_shop?.txt?.errorCode?.no_city || 'Wpisz w to pole nazwÄ miasta.',
            no_delivery_city:
                app_shop?.txt?.errorCode?.no_delivery_city || 'Wpisz miejscowoĹÄ odbiorcy przesyĹki.',
            no_delivery_firstname:
                app_shop?.txt?.errorCode?.no_delivery_firstname || 'Wpisz imiÄ odbiorcy przesyĹki.',
            no_delivery_lastname:
                app_shop?.txt?.errorCode?.no_delivery_lastname || 'Wpisz nazwisko odbiorcy przesyĹki.',
            no_delivery_street:
                app_shop?.txt?.errorCode?.no_delivery_street ||
                'Wpisz ulicÄ i numer domu odbiorcy przesyĹki.',
            no_firmname: app_shop?.txt?.errorCode?.no_firmname || 'BĹÄdnie wpisana nazwa firmy.',
            no_firstname: app_shop?.txt?.errorCode?.no_firstname || 'Wpisz w to pole swoje imiÄ.',
            no_invoice_city: app_shop?.txt?.errorCode?.no_invoice_city || 'Wpisz miejscowoĹÄ klienta.',
            no_invoice_firmname:
                app_shop?.txt?.errorCode?.no_invoice_firmname || 'Wpisz nazwÄ firmy klienta.',
            no_invoice_firstname: app_shop?.txt?.errorCode?.no_invoice_firstname || 'Wpisz imiÄ klienta.',
            no_invoice_lastname:
                app_shop?.txt?.errorCode?.no_invoice_lastname || 'Wpisz nazwisko klienta.',
            no_invoice_street:
                app_shop?.txt?.errorCode?.no_invoice_street || 'Wpisz ulicÄ i numer domu klienta.',
            no_invoice_street_number:
                app_shop?.txt?.errorCode?.no_invoice_street_number || 'Wpisz ulicÄ i numer domu klienta.',
            no_login: app_shop?.txt?.errorCode?.no_login || 'Wpisz w to pole swĂłj login.',
            no_name: app_shop?.txt?.errorCode?.no_name || 'Wpisz w to pole swoje nazwisko.',
            no_password: app_shop?.txt?.errorCode?.no_password || 'Wpisz w to pole swoje hasĹo.',
            no_street: app_shop?.txt?.errorCode?.no_street || 'Wpisz nazwÄ ulicy lub miejscowoĹci.',
            no_street_number: app_shop?.txt?.errorCode?.no_street_number || 'Podaj nr domu.',
            no_street_number_uk: app_shop?.txt?.errorCode?.no_street_number_uk || 'Brakuje numeru domu.',
            not_equal_passwords:
                app_shop?.txt?.errorCode?.not_equal_passwords ||
                'Wpisane hasĹa nie sÄ takie same. Wpisz ponownie hasĹo i potwierdzenie.',
            password_to_long:
                app_shop?.txt?.errorCode?.password_to_long ||
                'Za dĹugie hasĹo. Wpisz krĂłtsze hasĹo (maksimum',
            password_to_short:
                app_shop?.txt?.errorCode?.password_to_short ||
                'Zbyt krĂłtkie hasĹo. Wpisz dĹuĹźsze hasĹo (minimum',
            used_login: app_shop?.txt?.errorCode?.used_login || 'Podany login jest juĹź zajÄty',
            incorrect_iban:
                app_shop?.txt?.errorCode?.incorrect_iban ||
                app_shop.txt.txt_validation5 ||
                'Format numeru konta bankowego jest niepoprawny',
        }),
        (this.txt = {
            mandatoryField: app_shop?.txt?.formValidation?.mandatoryField || 'ProszÄ wypeĹniÄ to pole.',
            zipcodeFormat:
                app_shop?.txt?.formValidation?.zipcodeFormat ||
                'Poprawne formaty kodu pocztowego dla wybranego kraju to [X - cyfra; Y - litera]:',
            characters: app_shop?.txt?.formValidation?.characters || 'znakĂłw).',
            noOptionSelected: app_shop?.txt?.formValidation?.noOptionSelected || 'ProszÄ wybraÄ opcjÄ.',
            minimalCharacters:
                app_shop?.txt?.formValidation?.minimalCharacters ||
                app_shop.txt.txt_validation1 ||
                'Minimalna liczba znakĂłw dla tego pola to ',
            maximumCharacters:
                app_shop?.txt?.formValidation?.maximumCharacters ||
                app_shop.txt.txt_validation2 ||
                'Maksymalna liczba znakĂłw dla tego pola to ',
        }),
        (this.queries = {
            VALIDATE_FIRSTNAME_QUERY: e =>
                `validateClientData(ClientDataInput: { clientData: {\n      clientBillingData: {\n        firstname: "${e?.replace?.(
                    /"/g,
                    '\\"',
                )}"\n      }\n    }}) {\n      messages {\n        code\n        message\n      }\n    }`,
            VALIDATE_LASTNAME_QUERY: e =>
                `validateClientData(ClientDataInput: { clientData: {\n      clientBillingData: {\n        lastname: "${e?.replace?.(
                    /"/g,
                    '\\"',
                )}"\n      }\n    }}) {\n      messages {\n        code\n        message\n      }\n    }`,
            VALIDATE_ADDITIONAL_QUERY: e =>
                `validateClientData(ClientDataInput: { clientData: {\n      clientBillingData: {\n        companyName: "${e?.replace?.(
                    /"/g,
                    '\\"',
                )}"\n      }\n    }}) {\n      messages {\n        code\n        message\n      }\n    }`,
            VALIDATE_NIP_QUERY: (e, t) =>
                `validateClientData(ClientDataInput: { clientData: {\n      clientBillingData: {\n        country: ${t}\n      }\n      taxNumber: "${e?.replace?.(
                    /"/g,
                    '\\"',
                )}"\n    }}) {\n      messages {\n        code\n        message\n      }\n    }`,
            VALIDATE_STREET_QUERY: (e, t) =>
                `validateClientData(ClientDataInput: { clientData: {\n      clientBillingData: {\n        street: "${e?.replace?.(
                    /"/g,
                    '\\"',
                )}"\n        country: ${t}\n      }\n    }}) {\n      messages {\n        code\n        message\n      }\n    }`,
            VALIDATE_ZIPCODE_QUERY: (e, t) =>
                `validateClientData(ClientDataInput: { clientData: {\n      clientBillingData: {\n        zipcode: "${e?.replace?.(
                    /"/g,
                    '\\"',
                )}"\n        country: ${t}\n      }\n    }}) {\n      messages {\n        code\n        message\n      }\n    }`,
            VALIDATE_CITY_QUERY: e =>
                `validateClientData(ClientDataInput: { clientData: {\n      clientBillingData: {\n        city: "${e?.replace?.(
                    /"/g,
                    '\\"',
                )}"\n      }\n    }}) {\n      messages {\n        code\n        message\n      }\n    }`,
            VALIDATE_PHONE_QUERY: (e, t) =>
                `validateClientData(ClientDataInput: { clientData: {\n      clientBillingData: {\n        phone: "${e?.replace?.(
                    /"/g,
                    '\\"',
                )}"\n        country: ${t}\n      }\n    }}) {\n      messages {\n        code\n        message\n      }\n    }`,
            VALIDATE_EMAIL_QUERY: e =>
                `validateClientData(ClientDataInput: {clientData: {\n      email: "${e?.replace?.(
                    /"/g,
                    '\\"',
                )}"\n    }}) {\n      messages {\n        code\n        message\n      }\n      clientExists\n    }`,
            VALIDATE_BIRTHDATE_QUERY: e =>
                `validateClientData(ClientDataInput: {clientData: {\n      birthDate: "${e?.replace?.(
                    /"/g,
                    '\\"',
                )}"\n    }}) {\n      messages {\n        code\n        message\n      }\n    }`,
            VALIDATE_LOGIN_QUERY: e =>
                `validateClientData(ClientDataInput: {loginAndPassword: {\n      login: "${e?.replace?.(
                    /"/g,
                    '\\"',
                )}"\n    }}) {\n      messages {\n        code\n        message\n      }\n    }`,
            VALIDATE_PASSWORD_QUERY: e =>
                `validateClientData(ClientDataInput: {loginAndPassword: {\n      password: "${e?.replace?.(
                    /"/g,
                    '\\"',
                )}"\n    }}) {\n      messages {\n        code\n        message\n      }\n    }`,
            VALIDATE_INPUTS_QUERY: e =>
                JSON.stringify({
                    query: `query {\n        validateClientData(${e}) {\n          messages {\n            code\n            message\n          }\n        }\n      }`,
                }),
        }),
        (this.events = {
            onInput: e => {
                const { target: t } = e;
                this.vars.changedInputs.push(t), this.debounces.validateInput(t);
            },
            onChange: e => {
                const { target: t } = e;
                this.validateCheckbox(t);
            },
            onSubmit: async e => {
                if ('true' === this.form.dataset.handled) return void delete this.form.dataset.handled;
                e.preventDefault();
                (await this.validateForm())
                    ? (this.form.classList.remove('--fail-validation'),
                        (this.form.dataset.handled = 'true'),
                        this.form.submit())
                    : this.form.classList.add('--fail-validation');
            },
        }),
        (this.concatErrorMessages = e => {
            const { code: t } = e[0];
            switch (t) {
                case 'incorect_zipcode':
                    return `${this.errorCode[t]}Â ${this.txt.zipcodeFormat}Â ${e[1]?.message}`;
                case 'password_to_short':
                    return `${this.errorCode[t]}Â ${this.vars.passwordLengthMin}Â ${this.txt.characters}`;
                case 'password_to_long':
                    return `${this.errorCode[t]}Â ${this.vars.passwordLengthMax}Â ${this.txt.characters}`;
                default:
                    return this.errorCode[t];
            }
        }),
        (this.validateFirstnameGQL = async e => {
            const { input: t, getQuery: i, response: n } = e,
                { value: r } = t,
                o = this.queries.VALIDATE_FIRSTNAME_QUERY(r);
            if (i) return this.queries.VALIDATE_FIRSTNAME_QUERY(r);
            const s = n || (await this.fetchData(o)),
                { messages: a } = s?.data?.validateClientData || s;
            return a?.length ? this.concatErrorMessages(a) : '';
        }),
        (this.validateLastnameGQL = async e => {
            const { input: t, getQuery: i, response: n } = e,
                { value: r } = t,
                o = this.queries.VALIDATE_LASTNAME_QUERY(r);
            if (i) return this.queries.VALIDATE_LASTNAME_QUERY(r);
            const s = n || (await this.fetchData(o)),
                { messages: a } = s?.data?.validateClientData || s;
            return a?.length ? this.concatErrorMessages(a) : '';
        }),
        (this.validateAdditionalGQL = async e => {
            const { input: t, getQuery: i, response: n } = e,
                { value: r } = t,
                o = this.queries.VALIDATE_ADDITIONAL_QUERY(r);
            if (i) return o;
            const s = n || (await this.fetchData(o)),
                { messages: a } = s?.data?.validateClientData || s;
            return a?.length ? this.concatErrorMessages(a) : '';
        }),
        (this.validateNipGQL = async e => {
            const { input: t, getQuery: i, response: n } = e,
                { value: r } = t,
                { region: o } = t.dataset,
                s = this.queries.VALIDATE_NIP_QUERY(r, o);
            if (i) return s;
            const a = n || (await this.fetchData(s)),
                { messages: c } = a?.data?.validateClientData || a;
            return c?.length ? this.concatErrorMessages(c) : '';
        }),
        (this.validateStreetGQL = async e => {
            const { input: t, getQuery: i, response: n } = e,
                { value: r } = t,
                { concatFrom: o, region: s } = t.dataset,
                a = this.form?.querySelector(o),
                c = `${r} ${a?.value || ''}`,
                l = this.queries.VALIDATE_STREET_QUERY(c, s);
            if (i) return l;
            const p = n || (await this.fetchData(l)),
                { messages: d } = p?.data?.validateClientData || p;
            return d?.length
                ? a && 'no_street_number' === d[0].code
                    ? (this.setValidityState(a, this.concatErrorMessages(d)), '')
                    : this.concatErrorMessages(d)
                : (a && this.setValidityState(a, ''), '');
        }),
        (this.validateZipcodeGQL = async e => {
            const { input: t, getQuery: i, response: n } = e,
                { value: r } = t,
                { region: o } = t.dataset,
                s = this.queries.VALIDATE_ZIPCODE_QUERY(r, o);
            if (i) return s;
            const a = n || (await this.fetchData(s)),
                { messages: c } = a?.data?.validateClientData || a;
            return c?.length ? this.concatErrorMessages(c) : '';
        }),
        (this.validateCityGQL = async e => {
            const { input: t, getQuery: i, response: n } = e,
                { value: r } = t,
                o = this.queries.VALIDATE_CITY_QUERY(r);
            if (i) return o;
            const s = n || (await this.fetchData(o)),
                { messages: a } = s?.data?.validateClientData || s;
            return a?.length ? this.concatErrorMessages(a) : '';
        }),
        (this.validatePhone = e => {
            const { input: t, getQuery: i } = e;
            if (i) return '';
            const { value: n } = t;
            return n.length >= 9 ? '' : this.concatErrorMessages([{ code: 'incorect_phone' }]);
        }),
        (this.validatePhoneGQL = async e => {
            const { input: t, getQuery: i, response: n } = e,
                { value: r } = t,
                { region: o } = t.dataset;
            if (!o) return this.validatePhone(e);
            const s = this.queries.VALIDATE_PHONE_QUERY(r, o);
            if (i) return s;
            const a = n || (await this.fetchData(s)),
                { messages: c } = a?.data?.validateClientData || a;
            return c?.length ? this.concatErrorMessages(c) : '';
        }),
        (this.validateEmailGQL = async e => {
            const { input: t, getQuery: i, response: n } = e,
                { value: r } = t,
                o = this.queries.VALIDATE_EMAIL_QUERY(r);
            if (i) return o;
            const s = n || (await this.fetchData(o)),
                { messages: a } = s?.data?.validateClientData || s;
            return a?.length ? this.concatErrorMessages(a) : '';
        }),
        (this.validateBirthdateGQL = async e => {
            const { input: t, getQuery: i, response: n } = e,
                { value: r } = t,
                o = this.queries.VALIDATE_BIRTHDATE_QUERY(r);
            if (i) return o;
            const s = n || (await this.fetchData(o)),
                { messages: a } = s?.data?.validateClientData || s;
            return a?.length ? this.concatErrorMessages(a) : '';
        }),
        (this.validateLoginGQL = async e => {
            const { input: t, getQuery: i, response: n } = e,
                { value: r } = t,
                o = this.queries.VALIDATE_LOGIN_QUERY(r);
            if (i) return o;
            const s = n || (await this.fetchData(o)),
                { messages: a } = s?.data?.validateClientData || s;
            return a?.length ? this.concatErrorMessages(a) : '';
        }),
        (this.validatePasswordGQL = async e => {
            const { input: t, getQuery: i, response: n } = e,
                { value: r } = t,
                o = this.queries.VALIDATE_PASSWORD_QUERY(r);
            if (i) return o;
            const s = n || (await this.fetchData(o)),
                { messages: a } = s?.data?.validateClientData || s;
            return a?.length ? this.concatErrorMessages(a) : '';
        }),
        (this.validateIBANGQL = async e => {
            const { input: t, getQuery: i } = e,
                { value: n } = t;
            if (i) return '';
            const r = await fetch(`/ajax/payments.php?action=verify_iban&bankAccount=${n}`),
                o = await r.json(),
                { errno: s } = o || {};
            return s ? this.concatErrorMessages([{ code: 'incorrect_iban' }]) : '';
        }),
        (this.getInputQueries = async e =>
            (
                await Promise.all(
                    e.map(async e => {
                        const t = await this.validateGraphQL({ input: e, getQuery: !0 });
                        return `${e.id}:${t}`;
                    }),
                )
            ).join('')),
        (this.validateInputsGQL = async e => {
            const t = await this.getInputQueries(e),
                i = await this.fetchData(t);
            i?.data &&
                Object.keys(i.data).forEach(async t => {
                    const [n] = e.filter(e => e.id === t);
                    if (!n) return;
                    const r = await this.validateGraphQL({ input: n, response: i.data[t] });
                    this.setValidityState(n, r);
                });
        }),
        (this.clientExists = async e => {
            const t = this.queries.VALIDATE_EMAIL_QUERY(e),
                i = await this.fetchData(t),
                { clientExists: n } = i?.data?.validateClientData || i;
            return n;
        }),
        (this.validateMinLength = e => {
            const t = e.getAttribute('minlength');
            return t ? (+t <= e.value.length ? '' : `${this.txt.minimalCharacters}${t}`) : '';
        }),
        (this.validateMaxLength = e => {
            const t = e.getAttribute('maxlength');
            return t ? (+t >= e.value.length ? '' : `${this.txt.maximumCharacters}${t}`) : '';
        }),
        (this.validateInputs = async e => {
            e.forEach(e => {
                const t =
                    this.validateNotEmpty(e) || this.validateMinLength(e) || this.validateMaxLength(e);
                '' !== t && this.setValidityState(e, t);
            });
            const t = [...e].filter(e => e.closest('.f-feedback:not(.--error)'));
            if (!t.length) return;
            [...t]
                .filter(e => !e.hasAttribute('data-graphql'))
                .forEach(e => {
                    this.setValidityState(e, '');
                });
            const i = [...t].filter(e => e.hasAttribute('data-graphql'));
            i.length && (await this.validateInputsGQL(i));
        }),
        (this.isPhoneNumber = e => new RegExp('^[0-9*#+() ]+$').test(e)),
        (this.getGQLType = e => {
            const { graphql: t } = e.dataset,
                i = t.split(' ');
            if (2 === i.filter(e => 'phone' === e || 'email' === e).length) {
                return this.isPhoneNumber(e.value) ? 'phone' : 'email';
            }
            return i[0];
        }),
        (this.validateGraphQL = async e => {
            const { input: t, getQuery: i, response: n } = e,
                { graphql: r } = t.dataset;
            if (!r) return !1;
            const o = r.split(' ');
            switch (1 === o.length ? o[0] : this.getGQLType(t)) {
                case 'firstname':
                    return await this.validateFirstnameGQL({ input: t, getQuery: i, response: n });
                case 'lastname':
                    return await this.validateLastnameGQL({ input: t, getQuery: i, response: n });
                case 'additional':
                case 'firm':
                    return await this.validateAdditionalGQL({ input: t, getQuery: i, response: n });
                case 'nip':
                    return await this.validateNipGQL({ input: t, getQuery: i, response: n });
                case 'street':
                    return await this.validateStreetGQL({ input: t, getQuery: i, response: n });
                case 'zipcode':
                    return await this.validateZipcodeGQL({ input: t, getQuery: i, response: n });
                case 'city':
                    return await this.validateCityGQL({ input: t, getQuery: i, response: n });
                case 'phone':
                    return await this.validatePhoneGQL({ input: t, getQuery: i, response: n });
                case 'email':
                    return await this.validateEmailGQL({ input: t, getQuery: i, response: n });
                case 'birthdate':
                    return await this.validateBirthdateGQL({ input: t, getQuery: i, response: n });
                case 'login':
                    return await this.validateLoginGQL({ input: t, getQuery: i, response: n });
                case 'password':
                    return await this.validatePasswordGQL({ input: t, getQuery: i, response: n });
                case 'iban':
                    return await this.validateIBANGQL({ input: t, getQuery: i, response: n });
                default:
                    return (
                        console.warn(`No support for validation '${r}' in validateClientData GraphQL`),
                        this.setValidityState(t, '')
                    );
            }
        }),
        (this.validateInput = async e => {
            const t = [...new Set(this.vars.changedInputs)].filter(
                e => 'username' !== e.autocomplete && 'current-password' !== e.autocomplete,
            );
            if (((this.vars.changedInputs = []), t.length > 1))
                return this.removeAllValidityState(), this.validateForm(), !1;
            const { concatTo: i } = e.dataset;
            if (i) return this.validateInput(this.form.querySelector(i));
            let n = this.validateNotEmpty(e) || this.validateMinLength(e) || this.validateMaxLength(e);
            if ('' !== n) return this.setValidityState(e, n);
            return e.getAttribute('data-graphql')
                ? ((n = await this.validateGraphQL({ input: e })), this.setValidityState(e, n))
                : this.setValidityState(e, n);
        }),
        (this.validateSelects = e => {
            e.forEach(e => {
                this.validateSelect(e);
            });
        }),
        (this.validateSelect = e => {
            if (!e) return !0;
            let t = '';
            return e.closest('.--placeholder') && e.selectedIndex < 1
                ? ((t = this.txt.noOptionSelected), this.setValidityState(e, t))
                : this.setValidityState(e, t);
        }),
        (this.validateCheckboxes = e => {
            e.forEach(e => {
                this.validateCheckbox(e);
            });
        }),
        (this.validateCheckbox = e =>
            !e || (e.checked ? this.setValidityState(e, '', !0) : this.setValidityState(e, 'error', !0))),
        (this.validateObjectGQL = async (e = {}) => {
            let t = '';
            for (const [i, n] of Object.entries(e)) {
                const r = { dataset: {} };
                (r.value = 'street' === i && e.streetNumber ? `${n} ${e.streetNumber}` : n),
                    (r.dataset.region = e.region),
                    (r.dataset.graphql = i);
                const o = await this.validateGraphQL({ input: r, getQuery: !0 });
                o && (t += `${i}:${o}`);
            }
            if ('' === t) return !0;
            const i = await this.fetchData(t);
            if (!i?.data) return !0;
            const n = [];
            for (const [t, r] of Object.entries(i.data)) {
                const o = { dataset: {} };
                (o.value = 'street' === t && e.streetNumber ? `${r} ${e.streetNumber}` : r),
                    (o.dataset.region = e.region),
                    (o.dataset.graphql = t),
                    n.push(await this.validateGraphQL({ input: o, response: i.data[t] }));
            }
            return !n.filter(e => '' !== e).length;
        }),
        (this.validateObjectRequired = (e = {}, t = []) => {
            if (!t.length) return !0;
            for (const [i, n] of Object.entries(e))
                if (t.includes(i) && '' === n) return (validRequired = !1), !1;
            return !0;
        }),
        (this.validateObject = async (e = {}, t) => {
            if (!this.validateObjectRequired(e, t)) return !1;
            return !!(await this.validateObjectGQL(e, t));
        }),
        (this.validateForm = async e => {
            const t = e || this.form,
                i = t.querySelectorAll('.f-control.--validate:not(:disabled):not([type="checkbox"])'),
                n = [...i].filter(e => e.closest('.f-feedback:not(.--error):not(.--success)'));
            await this.validateInputs(n);
            const r = t.querySelectorAll(
                'select.f-select.--validate:not(:disabled), div.f-select.--validate select:not(:disabled)',
            ),
                o = [...r].filter(e => e.closest('.f-feedback:not(.--error):not(.--success)'));
            this.validateSelects(o);
            const s = t.querySelectorAll('.f-control.--validate[type="checkbox"]:not(:disabled)'),
                a = [...s].filter(e =>
                    e.closest(
                        '.--checkbox:not(.--error):not(.--success), .--switch:not(.--error):not(.--success)',
                    ),
                );
            this.validateCheckboxes(a);
            const c = [...i].filter(e => e.closest('.f-feedback.--error')),
                l = [...r].filter(e => e.closest('.f-feedback.--error')),
                p = [...s].filter(e =>
                    e.closest('.--checkbox.--error, .--switch.--error, .f-feedback.--error'),
                );
            return c.length || l.length || p.length
                ? ('function' == typeof this.callbacks.validateAll && this.callbacks.validateAll(e, !1), !1)
                : ('function' == typeof this.callbacks.validateAll && this.callbacks.validateAll(e, !0),
                    !0);
        }),
        (this.validateNotEmpty = e =>
            e.required || 0 !== e.value.length
                ? e.value.length > 0
                    ? ''
                    : this.txt.mandatoryField
                : ''),
        (this.createMessageElement = e => {
            const t = document.createElement('div');
            return t.classList.add('f-message'), e.append(t), t;
        }),
        (this.setValidityState = (e, t, i) => {
            if (!(e && e instanceof HTMLElement)) return !1;
            const n = e.closest('.f-feedback') || e.parentNode;
            n.classList.remove('--success', '--error');
            const r = !i && (n.querySelector('.f-message') || this.createMessageElement(n));
            return (
                n.classList.toggle('--empty', '' === e.value),
                '' === t
                    ? (n.classList.add('--success'),
                        r && (r.textContent = ''),
                        'function' == typeof this.callbacks.validate && this.callbacks.validate(e, !0),
                        !0)
                    : (n.classList.add('--error'),
                        r && (r.textContent = t),
                        'function' == typeof this.callbacks.validate && this.callbacks.validate(e, !1),
                        !1)
            );
        }),
        (this.getValidityState = e => {
            if (!e) return '';
            const t = e.closest('.f-feedback') || e.parentNode;
            return t.classList.contains('--success')
                ? 'success'
                : t.classList.contains('--error')
                    ? 'error'
                    : '';
        }),
        (this.removeAllValidityState = e => {
            (e || this.form).querySelectorAll('.f-control.--validate').forEach(e => {
                this.removeValidityState(e);
            });
        }),
        (this.removeValidityState = e => {
            const t = e.closest('.f-feedback') || e.parentNode;
            t.classList.remove('--success', '--error');
            const i = t.querySelector('.f-message');
            i && (i.textContent = '');
        }),
        (this.removeEvents = () => {
            this.form.querySelectorAll('.f-control.--validate').forEach(e => {
                'checkbox' !== e.type
                    ? e.removeEventListener('input', this.events.onInput)
                    : e.removeEventListener('change', this.events.onChange);
            }),
                'FORM' === this.form.tagName &&
                this.form.removeEventListener('submit', this.events.onSubmit);
        }),
        (this.initEvents = () => {
            this.form.querySelectorAll('.f-control.--validate').forEach(e => {
                'checkbox' !== e.type
                    ? e.addEventListener('input', this.events.onInput)
                    : e.addEventListener('change', this.events.onChange);
            }),
                'FORM' === this.form.tagName && this.form.addEventListener('submit', this.events.onSubmit);
        }),
        (this.init = () => {
            (this.form = t || document.querySelector(i) || document), this.initEvents();
        }),
        (this.destroy = () => {
            this.removeEvents();
        }),
        (this.reInit = () => {
            this.destroy(), this.init();
        }),
        (this.debounces = { validateInput: this.debounce(this.validateInput) });
}
app_shop.graphql || (app_shop.graphql = {}),
    (app_shop.graphql.trackingEvents = async e => {
        const { headers: t } = e || {};
        if (!t) return !1;
        const i = t.get('x-iai-tracking-events');
        if (!i || +i < 1) return !1;
        const n = JSON.stringify({ query: 'query {\n      trackingEvents\n    }' });
        try {
            const e = await fetch(app_shop?.urls?.graphql || '/graphql/v1/', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json', Accept: 'application/json' },
                body: n,
            }),
                t = await e.json();
            return (
                t.data.trackingEvents?.forEach(e => {
                    const t = new Function(e);
                    try {
                        t();
                    } catch (t) {
                        console.error('AJAX getTrackingEvents() Event-Error: ', e, t);
                    }
                }),
                t.data.trackingEvents
            );
        } catch (e) {
            return console.error('AJAX getTrackingEvents() Error:', e), [];
        }
    }),
    (app_shop.fn.ajaxLoadSite = function (e) {
        if (
            ((() => {
                const e = document.getElementById('ajaxLoadSite'),
                    t = document.getElementById('ajaxLoadSite_cover');
                e && e.remove(), t && t.remove();
            })(),
                !e)
        )
            return;
        const t = `\n    <div id="ajaxLoadSite_cover" style="height:${document.body.scrollHeight}px;width:100%;position:absolute;left:0;top:0;"></div>\n    <div id="ajaxLoadSite" style="left:50%;transform:translateX(-50%);"></div>\n  `;
        document.body.insertAdjacentHTML('beforeend', t);
    }),
    (app_shop.fn.ajaxLoadSiteMessage = function (e) {
        const t = document.getElementById('ajaxLoadSite');
        t && t.append(e);
    });
class WebAuthn {
    constructor(e = {}) {
        (this.IAIAccountsUrl = e.IAIAccountsUrl || 'https://accounts.idosell.com/'),
            (this.urls = e.urls || {
                generateRegister: `${this.IAIAccountsUrl}webAuthn/generateRegisterRequest.php`,
                register: `${this.IAIAccountsUrl}webAuthn/register.php`,
                generateLogin: `${this.IAIAccountsUrl}webAuthn/generateLoginRequest.php`,
                login: `${this.IAIAccountsUrl}webAuthn/login.php`,
                gql: '/graphql/v1/',
            }),
            (this.supportMac = e.supportMac ?? !0),
            (this.supportIos = e.supportIos ?? !0),
            (this.supportSafari = e.supportSafari ?? !0),
            (this.supportOpera = e.supportOpera ?? !0);
    }
    async fetchDataGQL(e = {}) {
        const { data: t, url: i, urlParameter: n = '' } = e;
        if (!t) return !1;
        const r = `${i || this.urls.gql || '/graphql/v1/'}${n}`;
        try {
            const e = await fetch(r, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json', Accept: 'application/json' },
                body: t,
            });
            if (!e.ok) throw new Error(`HTTP error! status: ${e.status}`);
            return await e.json();
        } catch (e) {
            throw new Error(
                `A connection error occurred. It was not possible to retrieve data from ${r}`,
            );
        }
    }
    async fetchData(e = {}) {
        const { data: t, url: i } = e;
        if (!t || !i) return !1;
        try {
            const e = await fetch(i, {
                method: 'POST',
                body: t,
                credentials: 'include',
                cache: 'no-cache',
            });
            if (!e.ok) throw new Error(`HTTP error! status: ${e.status}`);
            return await e.json();
        } catch (e) {
            throw new Error(
                `A connection error occurred. It was not possible to retrieve data from ${i}`,
            );
        }
    }
    browserNotSupported() {
        const e = new Error('Browser not supported.');
        throw ((e.code = 1), e);
    }
    isOpera() {
        const { browser: e } = document.documentElement.dataset;
        return !!e && ('Opera' === e || ('Safari' === e && navigator.userAgent.indexOf('OP') > -1));
    }
    isNotSupportedSafari() {
        const { browser: e, browserVersion: t } = document.documentElement.dataset;
        return !(!e || !t) && 'Safari' === e && +t < 15;
    }
    async checkBrowserSupport() {
        return !(
            !window.fetch ||
            !navigator.credentials ||
            !navigator.credentials.create ||
            !window.PublicKeyCredential?.isUserVerifyingPlatformAuthenticatorAvailable ||
            !(await window.PublicKeyCredential?.isUserVerifyingPlatformAuthenticatorAvailable()) ||
            (!this.supportMac && app_shop.vars.isMac) ||
            (!this.supportIos && app_shop.vars.isIos) ||
            (!this.supportSafari && app_shop.vars.isSafari) ||
            (!this.supportOpera && this.isOpera()) ||
            this.isNotSupportedSafari()
        );
    }
    checkResponse(e) {
        if (!e) throw new Error('Failed to retrieve data.');
        if ('error' === e.status) throw new Error(e.errorMsg || 'Unknown error occured.');
    }
    recursiveBase64StrToArrayBuffer(e) {
        const t = '=?BINARY?B?';
        let i = {};
        if (Array.isArray(e)) i = e.map(e => this.recursiveBase64StrToArrayBuffer(e));
        else {
            if ('object' != typeof e) return e;
            Object.keys(e).forEach(n => {
                if ('string' == typeof e[n]) {
                    let r = e[n];
                    if (r.startsWith(t) && r.endsWith('?=')) {
                        r = r.slice(t.length, -'?='.length);
                        const e = window.atob(r),
                            o = new Uint8Array(e.length);
                        for (let t = 0; t < e.length; t++) o[t] = e.charCodeAt(t);
                        i[n] = o.buffer;
                    } else i[n] = e[n];
                } else i[n] = this.recursiveBase64StrToArrayBuffer(e[n]);
            });
        }
        return i;
    }
    arrayBufferToBase64(e) {
        const t = new Uint8Array(e),
            i = Array.from(t, e => String.fromCharCode(e)).join('');
        return window.btoa(i);
    }
    async registration({ userLogin: e = '', authorizeToken: t = '' }) {
        if (((await this.checkBrowserSupport()) || this.browserNotSupported(), !e))
            throw new Error('"userLogin" is required.');
        if (!t)
            throw new Error(
                '"authorizeToken" is required. GraphQL expressCheckoutVerifyOtp > verificationToken.',
            );
        const i = await this.fetchData({ data: t, url: this.urls.generateRegister });
        this.checkResponse(i);
        const n = JSON.parse(i.data),
            r = this.recursiveBase64StrToArrayBuffer(n),
            o = await navigator.credentials.create(r),
            { clientDataJSON: s, attestationObject: a } = o?.response || {},
            c = {
                userLogin: e,
                domain: window.location.hostname,
                authenticatorTransportMethods: o.response.getTransports ? o.response.getTransports() : [],
                clientDataJSONBase64: s ? this.arrayBufferToBase64(s) : '',
                attestationObjectBase64: a ? this.arrayBufferToBase64(a) : '',
            },
            l = await this.fetchData({ data: JSON.stringify(c), url: this.urls.register });
        this.checkResponse(l), console.log(l);
    }
    async login() {
        (await this.checkBrowserSupport()) || this.browserNotSupported();
        const e = { domain: window.location.hostname },
            t = await this.fetchData({ data: JSON.stringify(e), url: this.urls.generateLogin });
        this.checkResponse(t);
        const i = JSON.parse(t.data),
            n = this.recursiveBase64StrToArrayBuffer(i),
            r = await navigator.credentials.get(n),
            {
                rawId: o,
                response: { clientDataJSON: s, authenticatorData: a, signature: c, userHandle: l },
            } = r || {},
            p = {
                domain: window.location.hostname,
                publicKeyCredentialBinRawId: o ? this.arrayBufferToBase64(o) : null,
                clientDataJSONBase64: s ? this.arrayBufferToBase64(s) : null,
                authenticatorDataBase64: a ? this.arrayBufferToBase64(a) : null,
                signatureBase64: c ? this.arrayBufferToBase64(c) : null,
                userHandleBinBase64: l ? this.arrayBufferToBase64(l) : null,
            },
            d = await this.fetchData({ data: JSON.stringify(p), url: this.urls.login });
        if ((this.checkResponse(d), 'success' !== d.status)) throw new Error(d.ms);
        return await this.loginToShop(d.loginToken);
    }
    async loginToShop(e) {
        if (!e) throw new Error('"loginToken" is invalid.');
        const t = JSON.stringify({
            query: `mutation{\n        loginByIAIAccountsToken(token: "${e}") {\n          status\n          login\n        }\n      }`,
        });
        return (await this.fetchDataGQL({ data: t, urlParameter: '?mutation=loginByToken' }))?.data
            ?.loginByIAIAccountsToken;
    }
}
app_shop.fn.cookie = {
    get: function (e) {
        const t = document.cookie.split(';');
        for (let i = 0; i < t.length; i++) {
            const n = t[i].trim(),
                [r, o] = n.split('=');
            if (r === e) return decodeURIComponent(o);
        }
        return null;
    },
    set: function (e, t, i) {
        let n = '';
        if (i) {
            const e = new Date();
            e.setTime(e.getTime() + 24 * i * 60 * 60 * 1e3), (n = `; expires=${e.toUTCString()}`);
        }
        document.cookie = `${e}=${encodeURIComponent(t)}${n}; path=/`;
    },
    remove: function (e) {
        this.set(e, '', -1);
    },
};
var projectorv3_disable_ajax = projectorv3_disable_ajax || 1,
    projectorClass = function () {
        (classObj = this),
            (this.currency = ''),
            (this.curr_class = ''),
            (this.firstRun = !0),
            (this.onDisableAlert = !0),
            (this.timeoutAjax = 18e3),
            (this.errorMsg = []),
            (this.currentSizeObj = {}),
            (this.configObj = {}),
            (this.action = ''),
            (this.innerHTML = ''),
            (this.nettoPrice = 'net' === app_shop.vars.priceType),
            (this.options = []),
            (this.options.hide_unit = !1),
            (this.options.friendly_shipping_format = []),
            (this.options.endStartFunction = function () { }),
            (this.options.endInitFunction = function () { }),
            (this.options.beginStartFunction = function () { }),
            (this.options.endShippingFunction = function () { }),
            (this.options.formatPrice = function (e) { }),
            (this.externalFormatFn = !1),
            (this.options.endGetAjaxProductDataFunction = function () { }),
            (this.options.clearXMLGetAjaxProductDataFunction = function (e) { }),
            (this.options.beginGetAjaxProductDataFunction = function () { }),
            (this.options.endSetCurrentSizeFunction = function () { }),
            (this.options.ajaxAddFunction = function (e) {
                classObj.alert(classObj.txt.dodano_produkt);
            }),
            (this.options.contenersPrefix = 'projector_'),
            (this.options.curr_before_price = !1),
            (this.options.choiceSize = !1),
            (this.options.contact_link = '/contact.php'),
            (this.options.hoursBeforeOrderBy = 3),
            (this.isStarted = !1),
            (this.prefix = this.options.contenersPrefix),
            (this.actions = {}),
            (this.txt = []),
            (this.txt.oszczedzasz = 'OszczÄdzasz '),
            (this.txt.taniej = '%, czyli '),
            (this.txt.wzestawie = ' kupujÄc w zestawie'),
            (this.txt.niedostepny = 'Produkt niedostÄpny'),
            (this.txt.tylkotel = 'Cena na telefon. Skontaktuj siÄ ze sprzedawcÄ'),
            (this.txt.tylko_punkty = 'Towar dostÄpny tylko w programie lojalnoĹciowym.'),
            (this.txt.gratis = 'Dostawa gratis!'),
            (this.txt.gratis_produkt = 'Gratis!'),
            (this.txt.niemastanu = 'Produkt niedostÄpny'),
            (this.txt.status_24 = '24 godz.'),
            (this.txt.status_48 = '48 godz.'),
            (this.txt.status_natychmiast = 'w ciÄgu 24h'),
            (this.txt.day = ' dzieĹ '),
            (this.txt.days = ' dni '),
            (this.txt.hour = ' godz. '),
            (this.txt.hours = ' godz. '),
            (this.txt.min = ' min '),
            (this.txt.mins = ' min '),
            (this.txt.za = ' za '),
            (this.txt.proc = '%'),
            (this.txt.wybrany_rozmiar = 'Rozmiar'),
            (this.txt.wysylka = 'WysyĹka '),
            (this.txt.wysylka_za = 'WysyĹka w ciÄgu '),
            (this.txt.dostepny = 'Dostawa '),
            (this.txt.dostepny_za = 'Dostawa za '),
            (this.txt.pkt = 'pkt.'),
            (this.txt.status_full = 'wiÄksza iloĹÄ'),
            (this.txt.status_amount_null = 'brak w magazynie'),
            (this.txt.forpointsonly = 'Produkt moĹźesz kupiÄ za punkty'),
            (this.txt.disable_desc = 'Skontaktuj siÄ z nami'),
            (this.txt.choiceSize = 'Wybierz rozmiar'),
            (this.txt.maksymalnie = 'Maksymalnie moĹźesz zamĂłwiÄ'),
            (this.txt.minimalnie = 'Minimalnie moĹźesz zamĂłwiÄ'),
            (this.txt.brak_magazyn = 'Brak na magazynie'),
            (this.txt.dodano_produkt = 'Produkt zostaĹ dodany.'),
            (this.txt.dodano_produkt_blad = 'WystÄpiĹ bĹÄd podczas dodawania produktu.'),
            (this.txt.ilosc_mm = ''),
            (this.txt.ilosc_mo = ''),
            (this.txt.ilosc_mo_inf = ''),
            (this.txt.infinity = ''),
            (this.txt.koszt_od = 'Koszt od '),
            (this.txt.wysylka_total_begin = '<br/>(z tow. z koszyka '),
            (this.txt.wysylka_total_end = ')'),
            (this.txt.nawias_end = ''),
            (this.txt.amount = ''),
            (this.txt.order_by = 'ZamĂłw do '),
            (this.txt.it_will_ship_today = ' to wyĹlemy dzisiaj');
        var e = !0;
        (this.isset = function (e) {
            return void 0 !== window[e];
        }),
            (this.getAttr = function (e, t) {
                return e && e.hasAttribute(t) ? e.getAttribute(t) : '';
            }),
            (this.getData = function (e) {
                try {
                    return e;
                } catch (e) { }
            }),
            (this.getIndex = function (e, t) {
                var i = 0;
                for (var n in e) {
                    if (t === i) return n;
                    i++;
                }
                return null;
            }),
            (this.formatPrice = function (e, t, i, n, r) {
                return (
                    (currency = i || this.currentSizeObj.currency),
                    (r = !!r),
                    t &&
                    (this.configObj.rebateNumber && r && (e = this.configObj.rebateNumber.price),
                        (e *= this.configObj.valueOfNumberInput)),
                    n
                        ? e
                        : this.externalFormatFn
                            ? this.options.formatPrice({ price: e, currency: currency })
                            : this.options.curr_before_price
                                ? '<span class="projector_price"><span class="projector_currency">' +
                                currency +
                                '</span>' +
                                (1 * e).toFixed(2) +
                                '</span>'
                                : '<span class="projector_price">' +
                                (1 * e).toFixed(2) +
                                '<span class="projector_currency">' +
                                currency +
                                '</span></span>'
                );
            }),
            (this.status_description = function () {
                if (
                    (this.hide(document.querySelector('#' + this.prefix + 'status_gfx')),
                        document.querySelector('#' + this.prefix + 'status')?.classList.add('--status-hide'),
                        this.currentSizeObj.amount_mm && this.currentSizeObj.amount_mo && '' != this.txt.ilosc_mm)
                ) {
                    var e = this.currentSizeObj.amount_mm,
                        t = this.currentSizeObj.amount_mo,
                        i = e + ' ' + (e > 1 ? this.currentSizeObj.unit_plural : this.currentSizeObj.unit),
                        n = t + ' ' + (t > 1 ? this.currentSizeObj.unit_plural : this.currentSizeObj.unit),
                        r = this.txt.ilosc_mm.format(i),
                        o = this.txt.ilosc_mo.format(n);
                    if (e > 0 && -1 == t)
                        return (
                            document.querySelector('#' + this.prefix + 'status_description') &&
                            (document.querySelector('#' + this.prefix + 'status_description').innerHTML =
                                '<div id="#' +
                                this.prefix +
                                'amount_mm">' +
                                r +
                                '</div><div id="#' +
                                this.prefix +
                                'amount_mo">' +
                                this.txt.ilosc_mo_inf +
                                '</div>'),
                            !1
                        );
                    if (e > 0 && t > 0)
                        return (
                            document.querySelector('#' + this.prefix + 'status_description') &&
                            (document.querySelector('#' + this.prefix + 'status_description').innerHTML =
                                '<div id="#' +
                                this.prefix +
                                'amount_mm">' +
                                r +
                                '</div><div id="#' +
                                this.prefix +
                                'amount_mo">' +
                                o +
                                '</div>'),
                            !1
                        );
                }
                this.currentSizeObj.availability.delivery_date &&
                    'disable' == this.currentSizeObj.availability.status
                    ? document.querySelector('#' + this.prefix + 'status_description') &&
                    (document.querySelector('#' + this.prefix + 'status_description').innerHTML =
                        this.currentSizeObj.availability.status_description +
                        ' <span>' +
                        this.currentSizeObj.availability.delivery_date +
                        '</span>')
                    : this.currentSizeObj.availability.status_description
                        ? (document.querySelector('#' + this.prefix + 'status_description') &&
                            (document.querySelector('#' + this.prefix + 'status_description').innerHTML =
                                this.currentSizeObj.availability.status_description),
                            document
                                .querySelector('#' + this.prefix + 'status_description')
                                ?.classList.remove('--status-hide', '--phone-disable'))
                        : 'disable' == this.currentSizeObj.availability.status
                            ? (document
                                .querySelector('#' + this.prefix + 'status')
                                ?.classList.add('--status-hide', '--phone-disable'),
                                this.hide(document.querySelector('#' + this.prefix + 'status_description_wrapper')))
                            : (document
                                .querySelector('#' + this.prefix + 'status')
                                ?.classList.remove('--status-hide', '--phone-disable'),
                                this.hide(document.querySelector('#' + this.prefix + 'status_description_wrapper'))),
                    this.currentSizeObj.availability.status_gfx &&
                    (this.show(document.querySelector('#' + this.prefix + 'status_gfx')),
                        document
                            .querySelector('#' + this.prefix + 'status_gfx')
                            ?.setAttribute('src', this.currentSizeObj.availability.status_gfx),
                        document
                            .querySelector('#' + this.prefix + 'status')
                            ?.classList.remove('--status-hide'));
            }),
            (this.sellBy = function (e, t, i) {
                if ('disable' == this.currentSizeObj.availability.status)
                    return (
                        !this.onDisableAlert ||
                        ('product_bundle' == this.currentSizeObj.product_type && 1 == this.firstRun) ||
                        this.alert(this.txt.niedostepny),
                        e
                    );
                if (((e = parseFloat(e)), (t = parseFloat(t)), (i = parseFloat(i)), isNaN(i) || i <= e)) {
                    if (0 === Object.keys(product_data.order_quantity_range).length) return e.toFixed(t);
                    e = e.toFixed(t);
                }
                (number = Math.floor(i / e) * e),
                    (number =
                        ((i / e) * e - number).toFixed(t + 1) > 0
                            ? (1 * number + e).toFixed(t)
                            : number.toFixed(t)),
                    (number = parseFloat(number));
                var n = this.currentSizeObj.amount,
                    r = e;
                if (0 !== Object.keys(product_data.order_quantity_range).length) {
                    var o = product_data.order_quantity_range;
                    if (o.max_quantity_per_order) {
                        var s = parseFloat(o.max_quantity_per_order);
                        n = n > s || -1 == n ? s : n;
                    }
                    if (o.max_size_quantity_per_order) {
                        var a = parseFloat(o.max_size_quantity_per_order);
                        n = n > a || -1 == n ? a : n;
                    }
                    if (o.min_quantity_per_order) {
                        var c = parseFloat(o.min_quantity_per_order);
                        r = c > r ? c : r;
                    }
                    if (o.min_size_quantity_per_order) {
                        var l = parseFloat(o.min_size_quantity_per_order);
                        r = l > r ? l : r;
                    }
                    if (o.minimum_quantity_subscription) {
                        var p = parseFloat(o.minimum_quantity_subscription);
                        r = p > r ? p : r;
                    }
                }
                if (r && number < r) {
                    if (this.isStarted) {
                        const i =
                            (Math.ceil(parseFloat(r) / e) * e).toFixed(t) > 1
                                ? this.currentSizeObj.unit_plural
                                : this.currentSizeObj.unit;
                        this.alert(
                            this.txt.minimalnie + ' ' + (Math.ceil(parseFloat(r) / e) * e).toFixed(t) + ' ' + i,
                        );
                    }
                    return (this.isStarted = !0), (Math.ceil(parseFloat(r) / e) * e).toFixed(t);
                }
                if (number > n && -1 != n) {
                    const i =
                        (Math.floor(parseFloat(n) / e) * e).toFixed(t) > 1
                            ? this.currentSizeObj.unit_plural
                            : this.currentSizeObj.unit;
                    return (
                        this.alert(
                            this.txt.maksymalnie + ' ' + (Math.floor(parseFloat(n) / e) * e).toFixed(t) + ' ' + i,
                        ),
                        (this.isStarted = !0),
                        (Math.floor(parseFloat(n) / e) * e).toFixed(t)
                    );
                }
                return (this.isStarted = !0), number;
            }),
            (this.projectorInit = function (e) {
                if (!this.isset('product_data')) return this.errorMsg.push('no data'), !1;
                (this.curr_class = document.querySelector('#' + this.prefix + 'form')?.className),
                    e.contenersPrefix &&
                    ((this.options.contenersPrefix = e.contenersPrefix), (this.prefix = e.contenersPrefix)),
                    'undefined' !== e.onDisableAlert && (this.onDisableAlert = e.onDisableAlert),
                    e.beginStartFunction && (this.options.beginStartFunction = e.beginStartFunction),
                    e.formatPrice &&
                    ((this.options.formatPrice = e.formatPrice), (this.externalFormatFn = !0)),
                    e.endInitFunction && (this.options.endInitFunction = e.endInitFunction),
                    e.endStartFunction && (this.options.endStartFunction = e.endStartFunction),
                    e.endShippingFunction && (this.options.endShippingFunction = e.endShippingFunction),
                    e.endSetCurrentSizeFunction &&
                    (this.options.endSetCurrentSizeFunction = e.endSetCurrentSizeFunction),
                    e.ajaxAddFunction && (this.options.ajaxAddFunction = e.ajaxAddFunction),
                    e.clearXMLGetAjaxProductDataFunction &&
                    (this.options.clearXMLGetAjaxProductDataFunction =
                        e.clearXMLGetAjaxProductDataFunction),
                    e.endGetAjaxProductDataFunction &&
                    (this.options.endGetAjaxProductDataFunction = e.endGetAjaxProductDataFunction),
                    e.beginGetAjaxProductDataFunction &&
                    (this.options.beginGetAjaxProductDataFunction = e.beginGetAjaxProductDataFunction),
                    e.hide_unit && (this.options.hide_unit = e.hide_unit),
                    e.curr_before_price && (this.options.curr_before_price = e.curr_before_price),
                    e.contact_link && (this.options.contact_link = e.contact_link),
                    e.hoursBeforeOrderBy && (this.options.hoursBeforeOrderBy = e.hoursBeforeOrderBy),
                    e.getShippingTimeFunction &&
                    e.productParamsFunction &&
                    ((this.options.getShippingTimeFunction = e.getShippingTimeFunction),
                        (this.options.productParamsFunction = e.productParamsFunction)),
                    e.friendly_shipping_format &&
                    (this.options.friendly_shipping_format = e.friendly_shipping_format),
                    product_data.currency && (this.currency = product_data.currency),
                    (this.txt.amount = document.querySelector('#' + this.prefix + 'amount')?.innerHTML),
                    product_data.sizes &&
                    product_data.sizes.onesize &&
                    (this.setCurrentSizeObj(this.getIndex(product_data.sizes, 0)), this.start()),
                    this.options.endInitFunction();
            }),
            (this.variety = function (e, t, i) {
                return 1 == e ? t : i;
            }),
            (this.formatDate = e => e.slice(0, 10).split('-').reverse().slice(0, -1).join('.')),
            (this.shippingTimeBuffer = []),
            (this.timeoutHandle = ''),
            (this.updateShippingTime = async () => {
                const e = await this.options.getShippingTimeFunction(this.options.productParamsFunction());
                if (e && e.data && e.data.shipping && e.data.shipping.shippingTime) {
                    const t = e.data.shipping.shippingTime;
                    (this.currentSizeObj.shipping_time = {}),
                        (this.currentSizeObj.shipping_time.unknown_time = t.unknownTime),
                        (this.currentSizeObj.shipping_time.today = `${t.shippingTime.today}`),
                        (this.currentSizeObj.shipping_time.today_shipment_deadline = t.todayShipmentDeadline),
                        (this.currentSizeObj.shipping_time.days = t.shippingTime.time.days),
                        (this.currentSizeObj.shipping_time.hours = t.shippingTime.time.hours),
                        (this.currentSizeObj.shipping_time.minutes = t.shippingTime.time.minutes),
                        (this.currentSizeObj.shipping_time.week_day = t.shippingTime.weekDay),
                        (this.currentSizeObj.shipping_time.week_amount = t.shippingTime.weekAmount),
                        (this.currentSizeObj.shipping_time.time = t.time);
                }
                return e;
            }),
            (this.shippingTime = async function (e) {
                result = [];
                const t = md5(this.options.productParamsFunction()),
                    i = this.shippingTimeBuffer.filter(e => e.key === t);
                let n = {};
                if (i.length) return i[0];
                if (
                    ((projectorv3_disable_ajax && 0 == projectorv3_disable_ajax) ||
                        (n = await this.updateShippingTime()),
                        'disable' !== this.currentSizeObj.availability.status &&
                        this.currentSizeObj.shipping_time)
                ) {
                    const e = this.currentSizeObj.shipping_time;
                    let i = !1;
                    if (e.today_shipment_deadline) {
                        const t = e.today_shipment_deadline.split(':'),
                            n = new Date();
                        n.setHours(t[0], t[1], t[2]);
                        const r = new Date();
                        r.setHours(r.getHours() + this.options.hoursBeforeOrderBy),
                            (i = n.getTime() - r.getTime() < 0);
                    }
                    if (e.today_shipment_deadline && i) {
                        (result[0] = this.txt.order_by),
                            (result[1] = e.today_shipment_deadline.slice(0, -3) + this.txt.it_will_ship_today);
                        const i = { key: t, value: result, response: n };
                        return this.shippingTimeBuffer.push(i), i;
                    }
                    if ('true' == e.today) {
                        (result[0] = this.txt.wysylka), (result[1] = this.options.friendly_shipping_format[0]);
                        const e = { key: t, value: result, response: n };
                        return this.shippingTimeBuffer.push(e), e;
                    }
                    if (0 == +e.days || (1 == +e.days && 0 == +e.hours && 0 == +e.minutes)) {
                        this.txt.tomorrow
                            ? ((result[0] = this.txt.wysylka), (result[1] = this.txt.tomorrow))
                            : ((result[0] = this.txt.wysylka_za), (result[1] = this.txt.status_24));
                        const e = { key: t, value: result, response: n };
                        return this.shippingTimeBuffer.push(e), e;
                    }
                    if (+e.days > 29 && this.txt.shipmentIn) {
                        (result[0] = this.txt.shipmentIn), (result[1] = +e.days + this.txt.days);
                        const i = { key: t, value: result, response: n };
                        return this.shippingTimeBuffer.push(i), i;
                    }
                    (result[0] = this.txt.wysylka),
                        (result[1] = this.options.friendly_shipping_format[+e.week_day]),
                        +e.week_amount > 0 && (result[1] += `(${this.formatDate(e.time)})`);
                }
                const r = { key: t, value: result, response: n };
                return this.shippingTimeBuffer.push(r), r;
            }),
            (this.show = function (e) {
                if (!e) return;
                if ('' !== e.style.display) return void (e.style.display = '');
                const { display: t } = getComputedStyle(e);
                e.style.display = 'none' !== t ? t : 'block';
            }),
            (this.hide = function (e) {
                e && (e.style.display = 'none');
            }),
            (this.off = function (e) {
                if (!e) return;
                const t = e.cloneNode(!0);
                e.parentNode.replaceChild(t, e);
            }),
            (this.start = function () {
                if (
                    (this.options.beginStartFunction(),
                        (window.projectorv3_disable_ajax = projectorv3_disable_ajax || 1),
                        !this.currentSizeObj.type)
                )
                    return !1;
                var t = this;
                const n = document.getElementById('projector_form')?.getAttribute('data-subscription');
                var r = async function () {
                    (product_data.sizes.uniw || product_data.sizes.onesize) && t.setCurrentSizeObj('uniw'),
                        'true' === n
                            ? (t.currentSizeObj.price =
                                product_data.sizes[t.currentSizeObj.type].price_subscription)
                            : 'false' === n &&
                            (t.currentSizeObj.price = product_data.sizes[t.currentSizeObj.type].price_normal),
                        document.querySelector('#' + t.prefix + 'form') &&
                        (document.querySelector('#' + t.prefix + 'form').className =
                            t.curr_class + ' ' + t.currentSizeObj.availability.status),
                        (t.configObj.displaySize = 'onesize' != t.currentSizeObj.type),
                        t.currentSizeObj.availability &&
                        (t.configObj.disableNumberInput = 'disable' == t.currentSizeObj.availability.status),
                        (t.configObj.disableBuyButton = !1),
                        ('disable' != t.currentSizeObj.availability.status &&
                            'true' != t.currentSizeObj.phone_price) ||
                        (t.configObj.disableBuyButton = !0),
                        (t.configObj.displayBuySection = !!t.currentSizeObj.gratis);
                    var r = t.currentSizeObj.unit_sellby + '';
                    if (
                        (document.querySelector('#' + t.options.contenersPrefix + 'number') &&
                            (r = document.querySelector('#' + t.options.contenersPrefix + 'number').value),
                            (t.configObj.valueOfNumberInput = t.sellBy(
                                t.currentSizeObj.unit_sellby,
                                t.currentSizeObj.unit_precision,
                                r.replace(',', '.'),
                            )),
                            t.currentSizeObj.rebateNumber)
                    )
                        for (i in ((t.configObj.rabatIndex = -1),
                            (t.configObj.rabatIndex_last = -1),
                            t.currentSizeObj.rebateNumber)) {
                            var o = t.currentSizeObj.rebateNumber[i].threshold_end
                                ? t.currentSizeObj.rebateNumber[i].threshold_end
                                : t.configObj.valueOfNumberInput;
                            if (
                                parseFloat(t.configObj.valueOfNumberInput) >=
                                parseFloat(t.currentSizeObj.rebateNumber[i].threshold) &&
                                parseFloat(t.configObj.valueOfNumberInput) <= parseFloat(o)
                            ) {
                                if (
                                    ((t.configObj.rabatIndex = i),
                                        (t.configObj.rabatIndex_last = i),
                                        !t.currentSizeObj.rebateNumber[1 * i + 1] ||
                                        parseFloat(t.configObj.valueOfNumberInput) <
                                        parseFloat(t.currentSizeObj.rebateNumber[1 * i + 1].threshold))
                                )
                                    break;
                            } else
                                parseFloat(t.configObj.valueOfNumberInput) >=
                                    parseFloat(t.currentSizeObj.rebateNumber[i].threshold) &&
                                    (t.configObj.rabatIndex_last = i);
                        }
                    if (
                        (t.configObj.rabatIndex && -1 != t.configObj.rabatIndex
                            ? ((t.configObj.rebateNumber = t.currentSizeObj.rebateNumber[t.configObj.rabatIndex]),
                                (t.configObj.rebateNumberNext = t.configObj.rebateNumber))
                            : (t.configObj.rebateNumber = !1),
                            t.currentSizeObj.rebateNumber &&
                            t.currentSizeObj.rebateNumber[1 * t.configObj.rabatIndex + 1] &&
                            (t.configObj.rebateNumberNext =
                                t.currentSizeObj.rebateNumber[1 * t.configObj.rabatIndex + 1]),
                            t.configObj.rabatIndex_last &&
                            t.currentSizeObj.rebateNumber[1 * t.configObj.rabatIndex_last + 1] &&
                            (t.configObj.rebateNumberNext =
                                t.currentSizeObj.rebateNumber[1 * t.configObj.rabatIndex_last + 1]),
                            'onesize' == t.currentSizeObj.type || 'uniw' == t.currentSizeObj.type
                                ? t.hide(document.querySelector('#' + t.prefix + 'sizes_cont'))
                                : t.show(document.querySelector('#' + t.prefix + 'sizes_cont')),
                            t.status_description(),
                            document.querySelector('#' + t.prefix + 'amount'))
                    ) {
                        t.show(document.querySelector('#' + t.prefix + 'amount'));
                        var s = t.currentSizeObj.amount;
                        0 == s
                            ? t.hide(document.querySelector('#' + t.prefix + 'amount'))
                            : -1 == s &&
                            ((s = t.txt.infinity),
                                '' == t.txt.infinity && t.hide(document.querySelector('#' + t.prefix + 'amount'))),
                            1 == s
                                ? (s = s + ' ' + t.currentSizeObj.unit)
                                : s > 1 && (s = s + ' ' + t.currentSizeObj.unit_plural),
                            document.querySelector('#' + t.prefix + 'amount') &&
                            (document.querySelector('#' + t.prefix + 'amount').innerHTML =
                                t.txt.amount.format(s));
                    }
                    if (
                        (t.currentSizeObj.product_type &&
                            'product_virtual' == t.currentSizeObj.product_type &&
                            t.hide(document.querySelector('#' + t.prefix + 'amount')),
                            'y' == t.currentSizeObj.availability.visible &&
                                t.currentSizeObj &&
                                t.currentSizeObj.availability.status_description
                                ? (t.show(document.querySelector('#' + t.prefix + 'status_description_wrapper')),
                                    t.currentSizeObj.availability.status_gfx &&
                                    t.show(document.querySelector('#' + t.prefix + 'status_gfx')),
                                    document
                                        .querySelector('#' + t.prefix + 'status')
                                        ?.classList.remove('--status-hide'))
                                : (t.hide(document.querySelector('#' + t.prefix + 'status_description_wrapper')),
                                    t.hide(document.querySelector('#' + t.prefix + 'status_gfx')),
                                    document.querySelector('#' + t.prefix + 'status')?.classList.add('--status-hide')),
                            'true' == t.currentSizeObj.availability.delivery_days_undefined &&
                                'true' == t.currentSizeObj.delivery.undefined
                                ? t.hide(document.querySelector('#' + t.prefix + 'delivery_wrapper'))
                                : t.show(document.querySelector('#' + t.prefix + 'delivery_wrapper')),
                            t.hide(document.querySelector('#' + t.prefix + 'delivery_days')),
                            projectorv3_disable_ajax && 0 == projectorv3_disable_ajax)
                    ) {
                        if (
                            (t.hide(document.querySelector('#' + t.prefix + 'delivery_days')),
                                t.currentSizeObj && 'true' != t.currentSizeObj.availability.delivery_days_undefined)
                        ) {
                            document
                                .querySelector('#' + t.prefix + 'status')
                                ?.classList.add('--loading', '--time-show');
                            const e = await t.shippingTime();
                            if (
                                (e.value.length
                                    ? (document.querySelector('#' + t.prefix + 'delivery_label') &&
                                        (t.show(document.querySelector('#' + t.prefix + 'delivery_label')),
                                            (document.querySelector('#' + t.prefix + 'delivery_label').innerHTML =
                                                e.value[0])),
                                        document.querySelector('#' + t.prefix + 'delivery_days') &&
                                        (t.show(document.querySelector('#' + t.prefix + 'delivery_days')),
                                            (document.querySelector('#' + t.prefix + 'delivery_days').innerHTML =
                                                e.value[1])))
                                    : document
                                        .querySelector('#' + t.prefix + 'status')
                                        ?.classList.remove('--time-show'),
                                    document.querySelector('#' + t.prefix + 'status_wrapper'))
                            ) {
                                const e = document.querySelector('#' + t.prefix + 'status_wrapper');
                                (e.style.minHeight = '0px'), (e.style.minHeight = `${e.offsetHeight}px`);
                            }
                            document.querySelector('#' + t.prefix + 'status')?.classList.remove('--loading'),
                                t.options.endShippingFunction(e.response);
                        }
                    } else if ('true' != t.currentSizeObj.availability.delivery_days_undefined) {
                        var a = t;
                        clearTimeout(a.timeHandle),
                            document.querySelector('#' + a.prefix + 'delivery_days') &&
                            document
                                .querySelector('#' + a.prefix + 'delivery_days')
                                .closest('.product_section')
                                ?.classList.add('loading'),
                            (a.timeHandle = setTimeout(async function () {
                                document
                                    .querySelector('#' + t.prefix + 'status')
                                    ?.classList.add('--loading', '--time-show');
                                const e = await t.shippingTime();
                                if (
                                    (e.value.length
                                        ? (document.querySelector('#' + t.prefix + 'delivery_label') &&
                                            (t.show(document.querySelector('#' + t.prefix + 'delivery_label')),
                                                (document.querySelector('#' + t.prefix + 'delivery_label').innerHTML =
                                                    e.value[0])),
                                            document.querySelector('#' + t.prefix + 'delivery_days') &&
                                            (t.show(document.querySelector('#' + t.prefix + 'delivery_days')),
                                                (document.querySelector('#' + t.prefix + 'delivery_days').innerHTML =
                                                    e.value[1])))
                                        : document
                                            .querySelector('#' + t.prefix + 'status')
                                            ?.classList.remove('--time-show'),
                                        document.querySelector('#' + t.prefix + 'status_wrapper'))
                                ) {
                                    const e = document.querySelector('#' + t.prefix + 'status_wrapper');
                                    (e.style.minHeight = '0px'), (e.style.minHeight = `${e.offsetHeight}px`);
                                }
                                document.querySelector('#' + t.prefix + 'status')?.classList.remove('--loading'),
                                    t.options.endShippingFunction(e.response);
                            }, 50));
                    }
                    t.hide(document.querySelector('#' + t.prefix + 'shipping_unknown')),
                        (t.currentSizeObj.product_type &&
                            ('product_virtual' == t.currentSizeObj.product_type ||
                                'product_service' == t.currentSizeObj.product_type)) ||
                            'disable' == t.currentSizeObj.availability.status
                            ? (t.hide(document.querySelector('#' + t.prefix + 'shipping_info')),
                                t.hide(document.querySelector('#' + t.prefix + 'shipping_dialog')),
                                t.currentSizeObj.availability.status_description
                                    ? t.show(document.querySelector('#' + t.prefix + 'status_description'))
                                    : t.hide(document.querySelector('#' + t.prefix + 'status_description')))
                            : (t.show(document.querySelector('#' + t.prefix + 'shipping_info')),
                                t.show(document.querySelector('#' + t.prefix + 'shipping_dialog')),
                                t.hide(document.querySelector('#' + t.prefix + 'status_description'))),
                        t.currentSizeObj.delay_time &&
                            'true' == t.currentSizeObj.delay_time.unknown_delivery_time &&
                            'order' == t.currentSizeObj.availability.status
                            ? (t.hide(document.querySelector('#' + t.prefix + 'shipping_info')),
                                t.hide(document.querySelector('#' + t.prefix + 'shipping_dialog')),
                                t.hide(document.querySelector('#' + t.prefix + 'status_description')),
                                t.hide(document.querySelector('#' + t.prefix + 'status_wrapper')),
                                document.querySelector('#' + t.prefix + 'status')?.classList.add('--unknown-show'),
                                t.show(document.querySelector('#' + t.prefix + 'shipping_unknown')))
                            : (document
                                .querySelector('#' + t.prefix + 'status')
                                ?.classList.remove('--unknown-show'),
                                t.show(document.querySelector('#' + t.prefix + 'status_wrapper'))),
                        document.querySelector('#' + t.prefix + 'shipping') &&
                        (0 == t.currentSizeObj.delivery.shipping
                            ? (document.querySelector('#' + t.prefix + 'shipping').innerHTML = t.txt.gratis)
                            : (document.querySelector('#' + t.prefix + 'shipping').innerHTML =
                                t.txt.koszt_od + t.formatPrice(t.currentSizeObj.delivery.shipping, e)),
                            'true' == t.currentSizeObj.delivery.undefined
                                ? t.hide(document.querySelector('#' + t.prefix + 'shipping'))
                                : t.show(document.querySelector('#' + t.prefix + 'shipping'))),
                        t.currentSizeObj.price.advanceprice
                            ? (t.show(document.querySelector('#' + t.prefix + 'advanceprice_wrapper')),
                                document.querySelector('#' + t.prefix + 'advanceprice') &&
                                (document.querySelector('#' + t.prefix + 'advanceprice').innerHTML =
                                    t.formatPrice(t.currentSizeObj.price.advanceprice, e)))
                            : t.hide(document.querySelector('#' + t.prefix + 'advanceprice_wrapper')),
                        t.show(document.querySelector('#' + t.prefix + 'sellbyprice_wrapper')),
                        document.querySelector('#' + t.prefix + 'sellbyprice') &&
                        (document.querySelector('#' + t.prefix + 'sellbyprice').innerHTML = t.nettoPrice
                            ? t.currentSizeObj.price.price_net_formatted
                            : t.currentSizeObj.price.price_formatted),
                        t.hide(document.querySelector('#' + t.prefix + 'prices_wrapper')),
                        t.currentSizeObj.price.srp &&
                            t.currentSizeObj.price.srp > 0 &&
                            t.currentSizeObj.price.srp != t.currentSizeObj.price.value
                            ? (t.show(document.querySelector('#' + t.prefix + 'price_srp_wrapper')),
                                t.show(document.querySelector('#' + t.prefix + 'prices_wrapper')),
                                document.querySelector('#' + t.prefix + 'price_srp') &&
                                (document.querySelector('#' + t.prefix + 'price_srp').innerHTML = t.formatPrice(
                                    t.nettoPrice ? t.currentSizeObj.price.srp_net : t.currentSizeObj.price.srp,
                                    e,
                                )))
                            : t.hide(document.querySelector('#' + t.prefix + 'price_srp_wrapper')),
                        t.currentSizeObj.price.price_net && t.currentSizeObj.price.price_net > 0
                            ? (t.show(document.querySelector('#' + t.prefix + 'price_net_wrapper')),
                                t.show(document.querySelector('#' + t.prefix + 'price_net')),
                                document.querySelector('#' + t.prefix + 'price_net') &&
                                (document.querySelector('#' + t.prefix + 'price_net').innerHTML = t.formatPrice(
                                    t.nettoPrice ? t.currentSizeObj.price.value : t.currentSizeObj.price.price_net,
                                    e,
                                )))
                            : (t.hide(document.querySelector('#' + t.prefix + 'price_net_wrapper')),
                                t.hide(document.querySelector('#' + t.prefix + 'price_net')));
                    let c = '';
                    if ('true' == t.currentSizeObj.phone_price)
                        t.currentSizeObj.price.points > 0
                            ? (t.hide(document.querySelector('#' + t.prefix + 'price_value')),
                                t.show(document.querySelector('#' + t.prefix + 'prices_wrapper')),
                                document
                                    .querySelector('#' + t.prefix + 'prices_wrapper')
                                    ?.classList.add('--only-points'))
                            : (t.show(document.querySelector('#' + t.prefix + 'price_value')),
                                t.show(document.querySelector('#' + t.prefix + 'prices_wrapper')),
                                document
                                    .querySelector('#' + t.prefix + 'prices_wrapper')
                                    ?.classList.remove('--only-points'),
                                document.querySelector('#' + t.prefix + 'price_value') &&
                                (t.currentSizeObj.availability.status_gfx_tel &&
                                    '' != t.currentSizeObj.availability.status_gfx_tel
                                    ? (document.querySelector('#' + t.prefix + 'price_value').innerHTML =
                                        '<a class="projector_prices__contact" target="_blank" href="' +
                                        t.options.contact_link +
                                        '"><img src="' +
                                        t.currentSizeObj.availability.status_gfx_tel +
                                        '"/><span>' +
                                        t.currentSizeObj.availability.status_description_tel +
                                        '</span></a>')
                                    : (document.querySelector('#' + t.prefix + 'price_value').innerHTML =
                                        '<a class="projector_prices__contact" target="_blank" href="' +
                                        t.options.contact_link +
                                        '">' +
                                        t.currentSizeObj.availability.status_description_tel +
                                        '</a>')));
                    else if (
                        (t.show(document.querySelector('#' + t.prefix + 'price_value')),
                            t.show(document.querySelector('#' + t.prefix + 'prices_wrapper')),
                            document
                                .querySelector('#' + t.prefix + 'prices_wrapper')
                                ?.classList.remove('--only-points'),
                            t.currentSizeObj.price.rebateNumber)
                    ) {
                        const e = t.configObj.valueOfNumberInput;
                        if (t.currentSizeObj.price.rebateNumber.items.includes(null))
                            document.querySelector('#' + t.prefix + 'price_value') &&
                                (+e >= +t.currentSizeObj.price.rebateNumber.nextleft
                                    ? ((document.querySelector('#' + t.prefix + 'price_value').innerHTML =
                                        t.formatPrice(
                                            t.nettoPrice
                                                ? t.currentSizeObj.price.rebateNumber.nextprice_net
                                                : t.currentSizeObj.price.rebateNumber.nextprice,
                                            !0,
                                            !1,
                                            !1,
                                        )),
                                        (c = t.nettoPrice
                                            ? t.currentSizeObj.price.rebateNumber.nextprice_net
                                            : t.currentSizeObj.price.rebateNumber.nextprice),
                                        (t.rebateThreshold = t.currentSizeObj.price.rebateNumber.nextthreshold))
                                    : ((document.querySelector('#' + t.prefix + 'price_value').innerHTML =
                                        t.formatPrice(
                                            t.nettoPrice
                                                ? t.currentSizeObj.price.price_net
                                                : t.currentSizeObj.price.value,
                                            !0,
                                            !1,
                                            !1,
                                        )),
                                        (t.rebateThreshold = !1)));
                        else {
                            const i = [...t.currentSizeObj.price.rebateNumber.items]
                                .reverse()
                                .find(t => e >= +t.left);
                            document.querySelector('#' + t.prefix + 'price_value') &&
                                (i
                                    ? ((document.querySelector('#' + t.prefix + 'price_value').innerHTML =
                                        t.formatPrice(t.nettoPrice ? i.price_net : i.price, !0, !1, !1)),
                                        (c = t.nettoPrice ? i.price_net : i.price),
                                        (t.rebateThreshold = i.threshold))
                                    : ((document.querySelector('#' + t.prefix + 'price_value').innerHTML =
                                        t.formatPrice(
                                            t.nettoPrice
                                                ? t.currentSizeObj.price.price_net
                                                : t.currentSizeObj.price.value,
                                            !0,
                                            !1,
                                            !1,
                                        )),
                                        (t.rebateThreshold = !1)));
                        }
                    } else
                        document.querySelector('#' + t.prefix + 'price_value') &&
                            (document.querySelector('#' + t.prefix + 'price_value').innerHTML = t.formatPrice(
                                t.nettoPrice ? t.currentSizeObj.price.price_net : t.currentSizeObj.price.value,
                                !0,
                                !1,
                                !1,
                            ));
                    if (
                        (t.currentSizeObj.price.maxprice
                            ? t.currentSizeObj.price.maxprice > 0
                                ? (t.show(document.querySelector('#' + t.prefix + 'price_maxprice')),
                                    document.querySelector('#' + t.prefix + 'price_maxprice') &&
                                    (document.querySelector('#' + t.prefix + 'price_maxprice').innerHTML =
                                        t.formatPrice(
                                            t.nettoPrice
                                                ? t.currentSizeObj.price.maxprice_net
                                                : t.currentSizeObj.price.maxprice,
                                            e,
                                        )))
                                : t.hide(document.querySelector('#' + t.prefix + 'price_maxprice'))
                            : '' != c
                                ? ((t.currentSizeObj.price.maxprice = t.currentSizeObj.price.value),
                                    (t.currentSizeObj.price.maxprice_net = t.currentSizeObj.price.price_net),
                                    t.currentSizeObj.price.maxprice > 0
                                        ? (t.show(document.querySelector('#' + t.prefix + 'price_maxprice')),
                                            document.querySelector('#' + t.prefix + 'price_maxprice') &&
                                            (document.querySelector('#' + t.prefix + 'price_maxprice').innerHTML =
                                                t.formatPrice(
                                                    t.nettoPrice
                                                        ? t.currentSizeObj.price.maxprice_net
                                                        : t.currentSizeObj.price.maxprice,
                                                    e,
                                                )))
                                        : t.hide(document.querySelector('#' + t.prefix + 'price_maxprice')))
                                : t.hide(document.querySelector('#' + t.prefix + 'price_maxprice')),
                            t.currentSizeObj.price.omnibus_price &&
                            document.querySelector('#' + t.prefix + 'omnibus_price_value') &&
                            (document.querySelector('#' + t.prefix + 'omnibus_price_value').innerHTML =
                                t.formatPrice(
                                    t.nettoPrice
                                        ? t.currentSizeObj.price.omnibus_price_net
                                        : t.currentSizeObj.price.omnibus_price,
                                    e,
                                )),
                            t.options.hide_unit
                                ? (t.hide(document.querySelector('#' + t.prefix + 'price_unit_sellby')),
                                    t.hide(document.querySelector('#' + t.prefix + 'price_unit')))
                                : 1 == t.configObj.valueOfNumberInput
                                    ? (t.hide(document.querySelector('#' + t.prefix + 'price_unit_sellby')),
                                        document.querySelector('#' + t.prefix + 'price_unit_sellby') &&
                                        (document.querySelector('#' + t.prefix + 'price_unit_sellby').innerHTML =
                                            t.configObj.valueOfNumberInput),
                                        document.querySelector('#' + t.prefix + 'price_unit') &&
                                        (document.querySelector('#' + t.prefix + 'price_unit').innerHTML =
                                            t.currentSizeObj.unit))
                                    : (t.show(document.querySelector('#' + t.prefix + 'price_unit_sellby')),
                                        document.querySelector('#' + t.prefix + 'price_unit_sellby') &&
                                        (document.querySelector('#' + t.prefix + 'price_unit_sellby').innerHTML =
                                            t.configObj.valueOfNumberInput),
                                        document.querySelector('#' + t.prefix + 'price_unit') &&
                                        (document.querySelector('#' + t.prefix + 'price_unit').innerHTML = t
                                            .currentSizeObj.unit_plural
                                            ? t.currentSizeObj.unit_plural
                                            : t.currentSizeObj.unit)),
                            t.currentSizeObj.bundle_price || t.currentSizeObj.price.yousave_percent
                                ? t.show(document.querySelector('#' + t.prefix + 'yousave_bundle_wrapper'))
                                : t.hide(document.querySelector('#' + t.prefix + 'yousave_bundle_wrapper')),
                            (yousaveTmp = t.nettoPrice
                                ? t.currentSizeObj.price.yousave_net
                                : t.currentSizeObj.price.yousave),
                            (yousave_percentTmp = t.currentSizeObj.price.yousave_percent),
                            '' != c &&
                            ((yousaveTmp = t.nettoPrice
                                ? +t.currentSizeObj.price.maxprice_net - +c
                                : +t.currentSizeObj.price.maxprice - +c),
                                (yousave_percentTmp = (
                                    (100 * +yousaveTmp) /
                                    (t.nettoPrice
                                        ? +t.currentSizeObj.price.maxprice_net
                                        : +t.currentSizeObj.price.maxprice)
                                ).toFixed())),
                            0 == +yousave_percentTmp &&
                            (yousave_percentTmp = (
                                (+yousaveTmp /
                                    (t.nettoPrice
                                        ? +t.currentSizeObj.price.price_net
                                        : +t.currentSizeObj.price.value)) *
                                100
                            ).toFixed(1)),
                            document.querySelector('#' + t.prefix + 'price_yousave') &&
                            ('true' != t.currentSizeObj.phone_price &&
                                t.currentSizeObj.bundle_price &&
                                t.currentSizeObj.bundle_price.amount_diff_gross > 0
                                ? (t.show(document.querySelector('#' + t.prefix + 'price_yousave')),
                                    (document.querySelector('#' + t.prefix + 'price_yousave').innerHTML =
                                        t.txt.oszczedzasz +
                                        t.currentSizeObj.bundle_price.percent_diff +
                                        t.txt.taniej +
                                        t.formatPrice(
                                            t.nettoPrice
                                                ? t.currentSizeObj.bundle_price.amount_diff_net
                                                : t.currentSizeObj.bundle_price.amount_diff_gross,
                                            e,
                                        ) +
                                        t.txt.wzestawie))
                                : 'true' != t.currentSizeObj.phone_price && yousaveTmp
                                    ? (t.show(document.querySelector('#' + t.prefix + 'price_yousave')),
                                        (document.querySelector('#' + t.prefix + 'price_yousave').innerHTML =
                                            t.txt.oszczedzasz +
                                            yousave_percentTmp +
                                            t.txt.taniej +
                                            t.formatPrice(yousaveTmp, e) +
                                            t.txt.nawias_end))
                                    : t.hide(document.querySelector('#' + t.prefix + 'price_yousave'))),
                            t.hide(document.querySelector('#' + t.prefix + 'price_points_wrapper')),
                            t.currentSizeObj.price.points > 0 &&
                            (t.show(document.querySelector('#' + t.prefix + 'price_points')),
                                document.querySelector('#' + t.prefix + 'price_points') &&
                                (document.querySelector('#' + t.prefix + 'price_points').innerHTML =
                                    t.formatPrice(t.currentSizeObj.price.points, e, t.txt.pkt, !0).toFixed(2) +
                                    t.txt.pkt),
                                t.show(document.querySelector('#' + t.prefix + 'points_wrapper')),
                                t.show(document.querySelector('#' + t.prefix + 'price_points_wrapper'))),
                            t.currentSizeObj.price.points_recive > 0
                                ? (t.show(document.querySelector('#' + t.prefix + 'points_wrapper')),
                                    t.show(document.querySelector('#' + t.prefix + 'points_recive_points')),
                                    document.querySelector('#' + t.prefix + 'points_recive_points') &&
                                    (document.querySelector('#' + t.prefix + 'points_recive_points').innerHTML =
                                        t
                                            .formatPrice(t.currentSizeObj.price.points_recive, e, t.txt.pkt, !0)
                                            .toFixed(2) + t.txt.pkt),
                                    t.show(document.querySelector('#' + t.prefix + 'price_points_recive_wrapper')))
                                : t.hide(document.querySelector('#' + t.prefix + 'price_points_recive_wrapper')),
                            t.currentSizeObj.for_points,
                            t.hide(document.querySelector('#' + t.prefix + 'tell_availability')),
                            document.querySelector('#' + t.prefix + 'tell_availability'))
                    ) {
                        document
                            .querySelector('#' + t.prefix + 'tell_availability')
                            .querySelectorAll('input')
                            .forEach(e => (e.disabled = !0));
                    }
                    var l = t;
                    if (t.configObj.addBasketFnBtn)
                        t.off(document.querySelector('#' + t.prefix + 'button_basket')),
                            document.querySelector('#' + t.prefix + 'button_basket') &&
                            document
                                .querySelector('#' + t.prefix + 'button_basket')
                                .addEventListener('click', function (e) {
                                    l.configObj.addBasketFnBtn(), e.preventDefault();
                                }),
                            document
                                .querySelector('#' + t.prefix + 'button_basket')
                                ?.classList.remove('disabled');
                    else if (t.configObj.disableBuyButtonTXT) {
                        var p = t.configObj.disableBuyButtonTXT;
                        document.querySelector('#' + t.prefix + 'button_basket') &&
                            document
                                .querySelector('#' + t.prefix + 'button_basket')
                                .addEventListener('click', function (e) {
                                    classObj.alert(p), e.preventDefault();
                                }),
                            document.querySelector('#' + t.prefix + 'number') &&
                            (document.querySelector('#' + t.prefix + 'number').disabled = !0);
                    } else if ('disable' == t.currentSizeObj.availability.status) {
                        if (
                            (t.hide(document.querySelector('#' + t.prefix + 'price_points_wrapper')),
                                document.querySelector('#' + t.prefix + 'button_basket') &&
                                document
                                    .querySelector('#' + t.prefix + 'button_basket')
                                    .addEventListener('click', function (e) {
                                        classObj.alert(classObj.txt.niedostepny), e.preventDefault();
                                    }),
                                document.querySelector('#' + t.prefix + 'button_basket')?.classList.add('disabled'),
                                document.querySelector('#' + t.prefix + 'number') &&
                                (document.querySelector('#' + t.prefix + 'number').disabled = !0),
                                t.show(document.querySelector('#' + t.prefix + 'tell_availability')),
                                document.querySelector('#' + t.prefix + 'tell_availability'))
                        ) {
                            document
                                .querySelector('#' + t.prefix + 'tell_availability')
                                .querySelectorAll('input')
                                .forEach(e => (e.disabled = !1));
                        }
                    } else
                        'true' == t.currentSizeObj.phone_price && t.currentSizeObj.price.points > 0
                            ? (document.querySelector('#' + t.prefix + 'button_basket') &&
                                document
                                    .querySelector('#' + t.prefix + 'button_basket')
                                    .addEventListener('click', function (e) {
                                        classObj.alert(classObj.txt.tylko_punkty), e.preventDefault();
                                    }),
                                document.querySelector('#' + t.prefix + 'button_basket')?.classList.add('disabled'),
                                document.querySelector('#' + t.prefix + 'number') &&
                                (document.querySelector('#' + t.prefix + 'number').disabled = !0))
                            : 'true' == t.currentSizeObj.phone_price
                                ? (document.querySelector('#' + t.prefix + 'number') &&
                                    (document.querySelector('#' + t.prefix + 'number').disabled = !1),
                                    document.querySelector('#' + t.prefix + 'button_basket') &&
                                    document
                                        .querySelector('#' + t.prefix + 'button_basket')
                                        .addEventListener('click', function (e) {
                                            classObj.alert(classObj.txt.tylkotel), e.preventDefault();
                                        }),
                                    document.querySelector('#' + t.prefix + 'button_basket')?.classList.add('disabled'),
                                    document.querySelector('#' + t.prefix + 'number') &&
                                    (document.querySelector('#' + t.prefix + 'number').disabled = !0),
                                    document.querySelector('#' + t.prefix + 'form')?.classList.add('--phone'))
                                : (t.off(document.querySelector('#' + t.prefix + 'button_basket')),
                                    document
                                        .querySelector('#' + t.prefix + 'button_basket')
                                        ?.classList.remove('disabled'),
                                    document.querySelector('#' + t.prefix + 'number') &&
                                    (document.querySelector('#' + t.prefix + 'number').disabled = !1),
                                    document.querySelector('#' + t.prefix + 'form')?.classList.remove('--phone'));
                    return (
                        t.currentSizeObj.gratis &&
                        (t.hide(document.querySelector('#' + t.prefix + 'buy_section')),
                            t.hide(document.querySelector('#' + t.prefix + 'price_points_wrapper'))),
                        t.currentSizeObj.price.basket_enable &&
                        'y' == t.currentSizeObj.price.basket_enable &&
                        'true' == t.currentSizeObj.phone_price &&
                        (t.off(document.querySelector('#' + t.prefix + 'button_basket')),
                            document
                                .querySelector('#' + t.prefix + 'button_basket')
                                ?.classList.remove('disabled'),
                            document.querySelector('#' + t.prefix + 'number') &&
                            (document.querySelector('#' + t.prefix + 'number').disabled = !1),
                            document.querySelector('#' + t.prefix + 'price_value') &&
                            (document.querySelector('#' + t.prefix + 'price_value').innerHTML =
                                '<span class="' +
                                t.prefix +
                                '_price_gratis">' +
                                t.txt.gratis_produkt +
                                '</span>')),
                        document.querySelector('#' + t.options.contenersPrefix + 'number') &&
                        (document.querySelector('#' + t.options.contenersPrefix + 'number').value =
                            t.configObj.valueOfNumberInput),
                        document.querySelector(
                            '#' + t.options.contenersPrefix + 'buy_section .f-dropdown-button',
                        ) &&
                        (document.querySelector(
                            '#' + t.options.contenersPrefix + 'buy_section .f-dropdown-button',
                        ).textContent = t.configObj.valueOfNumberInput),
                        t.configObj.rebateNumberNext &&
                        (document.querySelector('#' + t.prefix + 'product_rebatenumber_value') &&
                            (document.querySelector('#' + t.prefix + 'product_rebatenumber_value').textContent =
                                (t.configObj.rebateNumberNext.value + t.txt.proc).replace(/\.00/gi, '')),
                            document.querySelector('#' + t.prefix + 'product_rebatenumber_threshold') &&
                            (document.querySelector(
                                '#' + t.prefix + 'product_rebatenumber_threshold',
                            ).textContent = t.configObj.rebateNumberNext.threshold.replace(/\.00/gi, ''))),
                        (t.firstRun = !1),
                        t.options.endStartFunction(),
                        !0
                    );
                };
                const o = async e => {
                    const t = await fetch(e);
                    return await t.json();
                };
                product_data.sizes[t.currentSizeObj.type].availability
                    ? 'true' !== n || product_data.sizes[t.currentSizeObj.type].price_subscription
                        ? 'false' !== n || product_data.sizes[t.currentSizeObj.type].price_normal
                            ? r()
                            : o(
                                '/ajax/projector.php?action=get&product=' +
                                product_data.product_id +
                                '&size=' +
                                t.currentSizeObj.type +
                                '&get=sizeprices',
                            ).then(e => {
                                (product_data.sizes[t.currentSizeObj.type].price = e.sizeprices),
                                    (product_data.sizes[t.currentSizeObj.type].price_normal = e.sizeprices),
                                    r();
                            })
                        : o(
                            '/ajax/projector.php?action=get&product=' +
                            product_data.product_id +
                            '&size=' +
                            t.currentSizeObj.type +
                            '&get=sizeprices&subscription=1',
                        ).then(e => {
                            (product_data.sizes[t.currentSizeObj.type].price = e.sizeprices),
                                (product_data.sizes[t.currentSizeObj.type].price_subscription = e.sizeprices),
                                r();
                        })
                    : product_data.sizes &&
                    ('product_bundle' != product_data.product_type
                        ? o(
                            '/ajax/projector.php?action=get&product=' +
                            product_data.product_id +
                            '&size=' +
                            t.currentSizeObj.type +
                            '&get=sizeavailability,sizedelivery,sizeprices' +
                            ('true' === n ? '&subscription=1' : ''),
                        ).then(e => {
                            (product_data.sizes[t.currentSizeObj.type].availability = e.sizeavailability),
                                (product_data.sizes[t.currentSizeObj.type].delivery = e.sizedelivery),
                                (product_data.sizes[t.currentSizeObj.type].price = e.sizeprices),
                                (product_data.sizes[t.currentSizeObj.type].delay_time =
                                    e.sizeavailability.delay_time),
                                'true' === n
                                    ? (product_data.sizes[t.currentSizeObj.type].price_subscription =
                                        e.sizeprices)
                                    : (product_data.sizes[t.currentSizeObj.type].price_normal = e.sizeprices),
                                r();
                        })
                        : 'product_bundle' == product_data.product_type &&
                        app_shop.fn.update_bundle &&
                        app_shop.fn.update_bundle());
            }),
            (this.liczProcent = function (e, t) {
                return (e = parseFloat(e)) - e * ((t = parseFloat(t)) / 100);
            }),
            (this.addAction = function (e, t, i) {
                this.actions[e] || (this.actions[e] = {}), (this.actions[e][t] = i);
            }),
            (this.getConfigObj = function () {
                return this.configObj;
            }),
            (this.alert = function (e) {
                Alertek.show_alert(e);
            }),
            (this.setCurrentSizeObj = async function (e) {
                if (projectorv3_disable_ajax && 0 == projectorv3_disable_ajax)
                    product_data.sizes[e]
                        ? ((this.currentSizeObj = product_data.sizes[e]),
                            (this.currentSizeObj.product_type = product_data.product_type),
                            (this.currentSizeObj.currency = product_data.currency),
                            (this.currentSizeObj.unit = product_data.unit),
                            (this.currentSizeObj.unit_plural = product_data.unit_plural
                                ? product_data.unit_plural
                                : ''),
                            (this.currentSizeObj.unit_sellby =
                                '' != product_data.unit_sellby ? product_data.unit_sellby : 1),
                            (this.currentSizeObj.unit_precision =
                                '' != product_data.unit_precision ? product_data.unit_precision : 0))
                        : this.errorMsg.push('setCurrentSize no data'),
                        this.options.endSetCurrentSizeFunction();
                else {
                    var t = this,
                        i = function () {
                            'onesize' == e && (e = 'uniw'),
                                product_data.sizes[e]
                                    ? ((t.currentSizeObj = product_data.sizes[e]),
                                        (t.currentSizeObj.product_type = product_data.product_type),
                                        (t.currentSizeObj.currency = product_data.currency),
                                        (t.currentSizeObj.unit = product_data.unit),
                                        (t.currentSizeObj.unit_plural = product_data.unit_plural
                                            ? product_data.unit_plural
                                            : ''),
                                        (t.currentSizeObj.unit_sellby =
                                            '' != product_data.unit_sellby ? product_data.unit_sellby : 1),
                                        (t.currentSizeObj.unit_precision =
                                            '' != product_data.unit_precision ? product_data.unit_precision : 0),
                                        product_data.for_points &&
                                        (t.currentSizeObj.for_points = product_data.for_points))
                                    : t.errorMsg.push('setCurrentSize no data');
                        };
                    if (product_data.sizes) i();
                    else {
                        const e = await fetch(
                            '/ajax/projector.php?action=get&product=' + product_data.product_id + '&get=sizes',
                        ),
                            n = await e.json();
                        if (n.sizes) {
                            product_data.sizes = {};
                            for (const e of n.sizes.items) product_data.sizes[e.type] = e;
                            i(), t.start();
                        }
                    }
                    this.options.endSetCurrentSizeFunction();
                }
            }),
            (this.getCurrentSizeObj = function (e) {
                return this.currentSizeObj;
            });
    };
(app_shop.vars.xhr = ''),
    (app_shop.getFile = e => {
        const t = document.createElement('script');
        (t.src = `${app_shop.urls.prefix}${e}.js`), document.body.appendChild(t);
    }),
    (app_shop.getOuterJS = e => {
        e.forEach(e => {
            const t = document.createElement('script');
            (t.src = `${app_shop.urls.prefix}${e}.js`), document.body.appendChild(t);
        });
    }),
    (app_shop.run = (e, t, i, n) => {
        (Array.isArray(t) ? t : [t]).forEach(t => {
            (app_shop.fnrun[t] = app_shop.fnrun[t] || []), app_shop.fnrun[t].push({ w: i, fn: e, a: n });
        });
    }),
    (app_shop.runArr = (e, t, i) => {
        e &&
            (console.groupCollapsed(`mode: ${t}`),
                e.forEach(e => {
                    const { w: t, fn: n, a: r } = e;
                    (!t || null !== document.querySelector(t)) && ((i && t && !r) || (n(), console.log(t)));
                }),
                console.groupEnd());
    });
class iaiGetAjax {
    constructor() {
        (this.data = {}), (this.cache = {}), (this.fn = {});
    }
    addToData(e, t, i) {
        this.data[e] ? console.log(`${e} data exist`) : ((this.data[e] = t), (this.fn[e] = i));
    }
    projector(e) {
        this.addToData('Projector', { format: 'json', params: {} }, e);
    }
    basket(e) {
        this.addToData('Basket', {}, e);
    }
    wishlist(e) {
        this.addToData('Wishlist', {}, e);
    }
    comparers(e) {
        this.addToData('Comparers', {}, e);
    }
    snippets(e, t) {
        this.addToData(
            'Snippets',
            {
                format: 'json',
                params: {
                    mobile: t.mobile,
                    tablet: t.tablet,
                    pc: t.pc,
                    request_uri: t.request_uri,
                    additional_ajax: t.additional_ajax,
                },
            },
            e,
        );
    }
    toplayersAndWidgets(e, t) {
        this.addToData(
            'ToplayersAndWidgets',
            {
                format: 'json',
                params: {
                    mobile: t.mobile,
                    tablet: t.tablet,
                    pc: t.pc,
                    request_uri: t.request_uri,
                    additional_ajax: t.additional_ajax,
                },
            },
            e,
        );
    }
    reInit(e = []) {
        e.length
            ? (Object.keys(this.data).forEach(t => {
                e.includes(t) || (delete this.data[t], delete this.fn[t], delete this.cache[t]);
            }),
                this.init())
            : this.init();
    }
    init() {
        const e = `request=${JSON.stringify(this.data)}`;
        // fetch('/ajax/get.php', {
        //     method: 'POST',
        //     headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        //     body: e,
        // })
        //     .then(e => e.json())
        //     .then(e => {
        //         (this.cache = e), Object.values(this.fn).forEach(e => e(this.cache));
        //     })
        //     .catch(e => {
        //         console.error('Error:', e);
        //     });
    }
}
const iaiGet = new iaiGetAjax();
(app_shop.fn.change_url = e => {
    history.pushState && history.pushState({ foo: 'bar' }, '', decodeURIComponent(e));
}),
    (app_shop.fn.evalJSFromHtml = function (e) {
        const t = document.createElement('div');
        t.innerHTML = e;
        t.querySelectorAll('script.ajaxLoad').forEach(e => document.body.appendChild(e));
    }),
    (app_shop.fn.load = async (e, t, i, n = '') => {
        const r = `${e}${n}`,
            o = new AbortController(),
            s = setTimeout(() => o.abort(), 16e3);
        t.forEach(([e]) => document.querySelector(e)?.classList.add('load-content'));
        try {
            const n = await fetch(r, { signal: o.signal }),
                a = await n.text(),
                c = new DOMParser().parseFromString(a, 'text/html');
            t.forEach(e => {
                const [t, i] = e,
                    n = document.querySelector(t),
                    r = c.querySelector(i);
                n && r && (n.outerHTML = r.outerHTML);
            }),
                app_shop.fn.change_url(e),
                app_shop.fn.evalJSFromHtml(c),
                i && i(c);
        } catch (t) {
            window.location.href = e;
        } finally {
            clearTimeout(s);
        }
    }),
    (app_shop.fn.variety = (e, t, i) => (1 == +e ? t : i)),
    (app_shop.fn.setGrid = () => {
        if (1 === app_shop.vars.view) {
            return void document.querySelectorAll('.setMobileGrid').forEach(e => {
                const t = e.dataset.item,
                    i = document.querySelector(t);
                if (!i) return;
                const n = document.createElement('del');
                (n.className = 'domHandler'),
                    (n.dataset.item = t),
                    (n.style.display = 'none'),
                    e.before(n),
                    e.append(i);
            });
        }
        document.querySelectorAll('.domHandler').forEach(e => {
            const t = e.dataset.item,
                i = document.querySelector(t);
            i && (e.after(i), e.remove());
        });
    }),
    (app_shop.fn.runAjaxFn = () => {
        if ((app_shop.runArr(app_shop.fnrun.all, 'all', !0), app_shop.vars.view))
            return void app_shop.runArr(app_shop.fnrun[app_shop.vars.view], app_shop.vars.view, !0);
        const e = document.getElementById('viewType');
        if (!e) return;
        const { width: t } = window.getComputedStyle(e);
        (app_shop.vars.view = parseInt(t, 10)),
            app_shop.runArr(app_shop.fnrun[app_shop.vars.view], app_shop.vars.view, !0);
    }),
    (app_shop.runApp = () => {
        const e = document.getElementById('viewType'),
            { width: t } = window.getComputedStyle(e) || {};
        (app_shop.vars.view = parseInt(t, 10) || 1),
            app_shop.runArr(app_shop.fnrun.all, 'all'),
            app_shop.runArr(app_shop.fnrun[app_shop.vars.view], app_shop.vars.view),
            app_shop.fn.setGrid(),
            app_shop.getOuterJS(app_shop.files),
            iaiGet.init();
        let i,
            n = app_shop.vars.view;
        const r = () => {
            clearTimeout(i),
                (i = setTimeout(() => {
                    const { width: t } = window.getComputedStyle(e);
                    (app_shop.vars.view = parseInt(t, 10)),
                        app_shop.vars.view !== n &&
                        ((n = app_shop.vars.view),
                            app_shop.runArr(app_shop.fnrun[app_shop.vars.view], app_shop.vars.view),
                            app_shop.fn.setGrid());
                }, 100));
        };
        window.removeEventListener('resize', r), window.addEventListener('resize', r);
    }),
    (app_shop.fn.getRwdSrc = e => {
        if (!e) return '';
        const { src_mobile: t, src_tablet: i, src_desktop: n } = e.dataset || e.data() || {},
            r = [t, i, n, n][app_shop.vars.view - 1];
        return r || '';
    }),
    (app_shop.fn.rwdBanner = (e, t) => {
        e &&
            t &&
            t.forEach(t => {
                app_shop.run(
                    () => {
                        document.querySelectorAll(e).forEach(e => {
                            e.querySelectorAll('img.rwd-src').forEach(e => {
                                e.setAttribute('src', app_shop.fn.getRwdSrc(e));
                            });
                        });
                    },
                    t,
                    e,
                );
            });
    }),
    (String.prototype.format = function (...e) {
        let t = this;
        return (
            e.forEach(e => {
                t = t.replace(/%[a-z]/, e);
            }),
            t
        );
    }),
    (app_shop.fn.news_data = function (e) {
        const { data: t, month_names: i, format: n = '%d-%m-%y' } = e || {};
        if (!t) return !1;
        const r = t.split('-');
        return !(r.length < 3) && (i && (r[1] = i[parseInt(r[1], 10) - 1]), n.format(r[2], r[1], r[0]));
    }),
    (app_shop.fn.setHeight = e => {
        const { selector: t, selectors: i, container: n } = e || {};
        if ((!t && !i) || !n) return;
        const r = document.querySelector(n);
        if (!r) return;
        const o = e => {
            const { marginLeft: t, marginRight: i } = window.getComputedStyle(e);
            return e.offsetWidth + parseInt(t, 10) + parseInt(i, 10);
        },
            s = o(r),
            a = o(r.firstElementChild),
            c = e => {
                if (!document.querySelectorAll(e).length) return;
                const t = Math.round(s / a);
                if (0 === t) return;
                const i = [...r.children];
                for (let n = 0; n < i.length; n += t) {
                    const r = i.slice(n, n + t).map(t => t.querySelector(e)),
                        o = Math.max(...r.map(e => e.offsetHeight));
                    r.forEach(e => {
                        e.style.minHeight = `${o}px`;
                    });
                }
            };
        t && c(t), i?.length && i.forEach(e => c(e));
    }),
    (function (e, t) {
        'use strict';
        'object' == typeof module && 'object' == typeof module.exports
            ? (module.exports = e.document
                ? t(e, !0)
                : function (e) {
                    if (!e.document) throw new Error('jQuery requires a window with a document');
                    return t(e);
                })
            : t(e);
    })('undefined' != typeof window ? window : this, function (e, t) {
        'use strict';
        var i = [],
            n = Object.getPrototypeOf,
            r = i.slice,
            o = i.flat
                ? function (e) {
                    return i.flat.call(e);
                }
                : function (e) {
                    return i.concat.apply([], e);
                },
            s = i.push,
            a = i.indexOf,
            c = {},
            l = c.toString,
            p = c.hasOwnProperty,
            d = p.toString,
            u = d.call(Object),
            h = {},
            f = function (e) {
                return 'function' == typeof e && 'number' != typeof e.nodeType;
            },
            m = function (e) {
                return null != e && e === e.window;
            },
            _ = e.document,
            g = { type: !0, src: !0, nonce: !0, noModule: !0 };
        function y(e, t, i) {
            var n,
                r,
                o = (i = i || _).createElement('script');
            if (((o.text = e), t))
                for (n in g) (r = t[n] || (t.getAttribute && t.getAttribute(n))) && o.setAttribute(n, r);
            i.head.appendChild(o).parentNode.removeChild(o);
        }
        function v(e) {
            return null == e
                ? e + ''
                : 'object' == typeof e || 'function' == typeof e
                    ? c[l.call(e)] || 'object'
                    : typeof e;
        }
        var b = '3.5.1',
            w = function (e, t) {
                return new w.fn.init(e, t);
            };
        function k(e) {
            var t = !!e && 'length' in e && e.length,
                i = v(e);
            return (
                !f(e) &&
                !m(e) &&
                ('array' === i || 0 === t || ('number' == typeof t && 0 < t && t - 1 in e))
            );
        }
        (w.fn = w.prototype =
        {
            jquery: b,
            constructor: w,
            length: 0,
            toArray: function () {
                return r.call(this);
            },
            get: function (e) {
                return null == e ? r.call(this) : e < 0 ? this[e + this.length] : this[e];
            },
            pushStack: function (e) {
                var t = w.merge(this.constructor(), e);
                return (t.prevObject = this), t;
            },
            each: function (e) {
                return w.each(this, e);
            },
            map: function (e) {
                return this.pushStack(
                    w.map(this, function (t, i) {
                        return e.call(t, i, t);
                    }),
                );
            },
            slice: function () {
                return this.pushStack(r.apply(this, arguments));
            },
            first: function () {
                return this.eq(0);
            },
            last: function () {
                return this.eq(-1);
            },
            even: function () {
                return this.pushStack(
                    w.grep(this, function (e, t) {
                        return (t + 1) % 2;
                    }),
                );
            },
            odd: function () {
                return this.pushStack(
                    w.grep(this, function (e, t) {
                        return t % 2;
                    }),
                );
            },
            eq: function (e) {
                var t = this.length,
                    i = +e + (e < 0 ? t : 0);
                return this.pushStack(0 <= i && i < t ? [this[i]] : []);
            },
            end: function () {
                return this.prevObject || this.constructor();
            },
            push: s,
            sort: i.sort,
            splice: i.splice,
        }),
            (w.extend = w.fn.extend =
                function () {
                    var e,
                        t,
                        i,
                        n,
                        r,
                        o,
                        s = arguments[0] || {},
                        a = 1,
                        c = arguments.length,
                        l = !1;
                    for (
                        'boolean' == typeof s && ((l = s), (s = arguments[a] || {}), a++),
                        'object' == typeof s || f(s) || (s = {}),
                        a === c && ((s = this), a--);
                        a < c;
                        a++
                    )
                        if (null != (e = arguments[a]))
                            for (t in e)
                                (n = e[t]),
                                    '__proto__' !== t &&
                                    s !== n &&
                                    (l && n && (w.isPlainObject(n) || (r = Array.isArray(n)))
                                        ? ((i = s[t]),
                                            (o = r && !Array.isArray(i) ? [] : r || w.isPlainObject(i) ? i : {}),
                                            (r = !1),
                                            (s[t] = w.extend(l, o, n)))
                                        : void 0 !== n && (s[t] = n));
                    return s;
                }),
            w.extend({
                expando: 'jQuery' + (b + Math.random()).replace(/\D/g, ''),
                isReady: !0,
                error: function (e) {
                    throw new Error(e);
                },
                noop: function () { },
                isPlainObject: function (e) {
                    var t, i;
                    return !(
                        !e ||
                        '[object Object]' !== l.call(e) ||
                        ((t = n(e)) &&
                            ('function' != typeof (i = p.call(t, 'constructor') && t.constructor) ||
                                d.call(i) !== u))
                    );
                },
                isEmptyObject: function (e) {
                    var t;
                    for (t in e) return !1;
                    return !0;
                },
                globalEval: function (e, t, i) {
                    y(e, { nonce: t && t.nonce }, i);
                },
                each: function (e, t) {
                    var i,
                        n = 0;
                    if (k(e)) for (i = e.length; n < i && !1 !== t.call(e[n], n, e[n]); n++);
                    else for (n in e) if (!1 === t.call(e[n], n, e[n])) break;
                    return e;
                },
                makeArray: function (e, t) {
                    var i = t || [];
                    return (
                        null != e && (k(Object(e)) ? w.merge(i, 'string' == typeof e ? [e] : e) : s.call(i, e)),
                        i
                    );
                },
                inArray: function (e, t, i) {
                    return null == t ? -1 : a.call(t, e, i);
                },
                merge: function (e, t) {
                    for (var i = +t.length, n = 0, r = e.length; n < i; n++) e[r++] = t[n];
                    return (e.length = r), e;
                },
                grep: function (e, t, i) {
                    for (var n = [], r = 0, o = e.length, s = !i; r < o; r++)
                        !t(e[r], r) !== s && n.push(e[r]);
                    return n;
                },
                map: function (e, t, i) {
                    var n,
                        r,
                        s = 0,
                        a = [];
                    if (k(e)) for (n = e.length; s < n; s++) null != (r = t(e[s], s, i)) && a.push(r);
                    else for (s in e) null != (r = t(e[s], s, i)) && a.push(r);
                    return o(a);
                },
                guid: 1,
                support: h,
            }),
            'function' == typeof Symbol && (w.fn[Symbol.iterator] = i[Symbol.iterator]),
            w.each(
                'Boolean Number String Function Array Date RegExp Object Error Symbol'.split(' '),
                function (e, t) {
                    c['[object ' + t + ']'] = t.toLowerCase();
                },
            );
        var x = (function (e) {
            var t,
                i,
                n,
                r,
                o,
                s,
                a,
                c,
                l,
                p,
                d,
                u,
                h,
                f,
                m,
                _,
                g,
                y,
                v,
                b = 'sizzle' + 1 * new Date(),
                w = e.document,
                k = 0,
                x = 0,
                S = ce(),
                C = ce(),
                $ = ce(),
                j = ce(),
                T = function (e, t) {
                    return e === t && (d = !0), 0;
                },
                z = {}.hasOwnProperty,
                D = [],
                A = D.pop,
                E = D.push,
                L = D.push,
                O = D.slice,
                M = function (e, t) {
                    for (var i = 0, n = e.length; i < n; i++) if (e[i] === t) return i;
                    return -1;
                },
                q =
                    'checked|selected|async|autofocus|autoplay|controls|defer|disabled|hidden|ismap|loop|multiple|open|readonly|required|scoped',
                P = '[\\x20\\t\\r\\n\\f]',
                I = '(?:\\\\[\\da-fA-F]{1,6}' + P + '?|\\\\[^\\r\\n\\f]|[\\w-]|[^\0-\\x7f])+',
                N =
                    '\\[' +
                    P +
                    '*(' +
                    I +
                    ')(?:' +
                    P +
                    '*([*^$|!~]?=)' +
                    P +
                    '*(?:\'((?:\\\\.|[^\\\\\'])*)\'|"((?:\\\\.|[^\\\\"])*)"|(' +
                    I +
                    '))|)' +
                    P +
                    '*\\]',
                H =
                    ':(' +
                    I +
                    ')(?:\\(((\'((?:\\\\.|[^\\\\\'])*)\'|"((?:\\\\.|[^\\\\"])*)")|((?:\\\\.|[^\\\\()[\\]]|' +
                    N +
                    ')*)|.*)\\)|)',
                F = new RegExp(P + '+', 'g'),
                B = new RegExp('^' + P + '+|((?:^|[^\\\\])(?:\\\\.)*)' + P + '+$', 'g'),
                R = new RegExp('^' + P + '*,' + P + '*'),
                W = new RegExp('^' + P + '*([>+~]|' + P + ')' + P + '*'),
                Y = new RegExp(P + '|>'),
                U = new RegExp(H),
                Q = new RegExp('^' + I + '$'),
                V = {
                    ID: new RegExp('^#(' + I + ')'),
                    CLASS: new RegExp('^\\.(' + I + ')'),
                    TAG: new RegExp('^(' + I + '|[*])'),
                    ATTR: new RegExp('^' + N),
                    PSEUDO: new RegExp('^' + H),
                    CHILD: new RegExp(
                        '^:(only|first|last|nth|nth-last)-(child|of-type)(?:\\(' +
                        P +
                        '*(even|odd|(([+-]|)(\\d*)n|)' +
                        P +
                        '*(?:([+-]|)' +
                        P +
                        '*(\\d+)|))' +
                        P +
                        '*\\)|)',
                        'i',
                    ),
                    bool: new RegExp('^(?:' + q + ')$', 'i'),
                    needsContext: new RegExp(
                        '^' +
                        P +
                        '*[>+~]|:(even|odd|eq|gt|lt|nth|first|last)(?:\\(' +
                        P +
                        '*((?:-\\d)?\\d*)' +
                        P +
                        '*\\)|)(?=[^-]|$)',
                        'i',
                    ),
                },
                G = /HTML$/i,
                J = /^(?:input|select|textarea|button)$/i,
                Z = /^h\d$/i,
                K = /^[^{]+\{\s*\[native \w/,
                X = /^(?:#([\w-]+)|(\w+)|\.([\w-]+))$/,
                ee = /[+~]/,
                te = new RegExp('\\\\[\\da-fA-F]{1,6}' + P + '?|\\\\([^\\r\\n\\f])', 'g'),
                ie = function (e, t) {
                    var i = '0x' + e.slice(1) - 65536;
                    return (
                        t ||
                        (i < 0
                            ? String.fromCharCode(i + 65536)
                            : String.fromCharCode((i >> 10) | 55296, (1023 & i) | 56320))
                    );
                },
                ne = /([\0-\x1f\x7f]|^-?\d)|^-$|[^\0-\x1f\x7f-\uFFFF\w-]/g,
                re = function (e, t) {
                    return t
                        ? '\0' === e
                            ? 'ďż˝'
                            : e.slice(0, -1) + '\\' + e.charCodeAt(e.length - 1).toString(16) + ' '
                        : '\\' + e;
                },
                oe = function () {
                    u();
                },
                se = be(
                    function (e) {
                        return !0 === e.disabled && 'fieldset' === e.nodeName.toLowerCase();
                    },
                    { dir: 'parentNode', next: 'legend' },
                );
            try {
                L.apply((D = O.call(w.childNodes)), w.childNodes), D[w.childNodes.length].nodeType;
            } catch (t) {
                L = {
                    apply: D.length
                        ? function (e, t) {
                            E.apply(e, O.call(t));
                        }
                        : function (e, t) {
                            for (var i = e.length, n = 0; (e[i++] = t[n++]););
                            e.length = i - 1;
                        },
                };
            }
            function ae(e, t, n, r) {
                var o,
                    a,
                    l,
                    p,
                    d,
                    f,
                    g,
                    y = t && t.ownerDocument,
                    w = t ? t.nodeType : 9;
                if (((n = n || []), 'string' != typeof e || !e || (1 !== w && 9 !== w && 11 !== w)))
                    return n;
                if (!r && (u(t), (t = t || h), m)) {
                    if (11 !== w && (d = X.exec(e)))
                        if ((o = d[1])) {
                            if (9 === w) {
                                if (!(l = t.getElementById(o))) return n;
                                if (l.id === o) return n.push(l), n;
                            } else if (y && (l = y.getElementById(o)) && v(t, l) && l.id === o)
                                return n.push(l), n;
                        } else {
                            if (d[2]) return L.apply(n, t.getElementsByTagName(e)), n;
                            if ((o = d[3]) && i.getElementsByClassName && t.getElementsByClassName)
                                return L.apply(n, t.getElementsByClassName(o)), n;
                        }
                    if (
                        i.qsa &&
                        !j[e + ' '] &&
                        (!_ || !_.test(e)) &&
                        (1 !== w || 'object' !== t.nodeName.toLowerCase())
                    ) {
                        if (((g = e), (y = t), 1 === w && (Y.test(e) || W.test(e)))) {
                            for (
                                ((y = (ee.test(e) && ge(t.parentNode)) || t) === t && i.scope) ||
                                ((p = t.getAttribute('id'))
                                    ? (p = p.replace(ne, re))
                                    : t.setAttribute('id', (p = b))),
                                a = (f = s(e)).length;
                                a--;

                            )
                                f[a] = (p ? '#' + p : ':scope') + ' ' + ve(f[a]);
                            g = f.join(',');
                        }
                        try {
                            return L.apply(n, y.querySelectorAll(g)), n;
                        } catch (t) {
                            j(e, !0);
                        } finally {
                            p === b && t.removeAttribute('id');
                        }
                    }
                }
                return c(e.replace(B, '$1'), t, n, r);
            }
            function ce() {
                var e = [];
                return function t(i, r) {
                    return e.push(i + ' ') > n.cacheLength && delete t[e.shift()], (t[i + ' '] = r);
                };
            }
            function le(e) {
                return (e[b] = !0), e;
            }
            function pe(e) {
                var t = h.createElement('fieldset');
                try {
                    return !!e(t);
                } catch (e) {
                    return !1;
                } finally {
                    t.parentNode && t.parentNode.removeChild(t), (t = null);
                }
            }
            function de(e, t) {
                for (var i = e.split('|'), r = i.length; r--;) n.attrHandle[i[r]] = t;
            }
            function ue(e, t) {
                var i = t && e,
                    n = i && 1 === e.nodeType && 1 === t.nodeType && e.sourceIndex - t.sourceIndex;
                if (n) return n;
                if (i) for (; (i = i.nextSibling);) if (i === t) return -1;
                return e ? 1 : -1;
            }
            function he(e) {
                return function (t) {
                    return 'input' === t.nodeName.toLowerCase() && t.type === e;
                };
            }
            function fe(e) {
                return function (t) {
                    var i = t.nodeName.toLowerCase();
                    return ('input' === i || 'button' === i) && t.type === e;
                };
            }
            function me(e) {
                return function (t) {
                    return 'form' in t
                        ? t.parentNode && !1 === t.disabled
                            ? 'label' in t
                                ? 'label' in t.parentNode
                                    ? t.parentNode.disabled === e
                                    : t.disabled === e
                                : t.isDisabled === e || (t.isDisabled !== !e && se(t) === e)
                            : t.disabled === e
                        : 'label' in t && t.disabled === e;
                };
            }
            function _e(e) {
                return le(function (t) {
                    return (
                        (t = +t),
                        le(function (i, n) {
                            for (var r, o = e([], i.length, t), s = o.length; s--;)
                                i[(r = o[s])] && (i[r] = !(n[r] = i[r]));
                        })
                    );
                });
            }
            function ge(e) {
                return e && void 0 !== e.getElementsByTagName && e;
            }
            for (t in ((i = ae.support = {}),
                (o = ae.isXML =
                    function (e) {
                        var t = e.namespaceURI,
                            i = (e.ownerDocument || e).documentElement;
                        return !G.test(t || (i && i.nodeName) || 'HTML');
                    }),
                (u = ae.setDocument =
                    function (e) {
                        var t,
                            r,
                            s = e ? e.ownerDocument || e : w;
                        return (
                            s != h &&
                            9 === s.nodeType &&
                            s.documentElement &&
                            ((f = (h = s).documentElement),
                                (m = !o(h)),
                                w != h &&
                                (r = h.defaultView) &&
                                r.top !== r &&
                                (r.addEventListener
                                    ? r.addEventListener('unload', oe, !1)
                                    : r.attachEvent && r.attachEvent('onunload', oe)),
                                (i.scope = pe(function (e) {
                                    return (
                                        f.appendChild(e).appendChild(h.createElement('div')),
                                        void 0 !== e.querySelectorAll && !e.querySelectorAll(':scope fieldset div').length
                                    );
                                })),
                                (i.attributes = pe(function (e) {
                                    return (e.className = 'i'), !e.getAttribute('className');
                                })),
                                (i.getElementsByTagName = pe(function (e) {
                                    return e.appendChild(h.createComment('')), !e.getElementsByTagName('*').length;
                                })),
                                (i.getElementsByClassName = K.test(h.getElementsByClassName)),
                                (i.getById = pe(function (e) {
                                    return (
                                        (f.appendChild(e).id = b), !h.getElementsByName || !h.getElementsByName(b).length
                                    );
                                })),
                                i.getById
                                    ? ((n.filter.ID = function (e) {
                                        var t = e.replace(te, ie);
                                        return function (e) {
                                            return e.getAttribute('id') === t;
                                        };
                                    }),
                                        (n.find.ID = function (e, t) {
                                            if (void 0 !== t.getElementById && m) {
                                                var i = t.getElementById(e);
                                                return i ? [i] : [];
                                            }
                                        }))
                                    : ((n.filter.ID = function (e) {
                                        var t = e.replace(te, ie);
                                        return function (e) {
                                            var i = void 0 !== e.getAttributeNode && e.getAttributeNode('id');
                                            return i && i.value === t;
                                        };
                                    }),
                                        (n.find.ID = function (e, t) {
                                            if (void 0 !== t.getElementById && m) {
                                                var i,
                                                    n,
                                                    r,
                                                    o = t.getElementById(e);
                                                if (o) {
                                                    if ((i = o.getAttributeNode('id')) && i.value === e) return [o];
                                                    for (r = t.getElementsByName(e), n = 0; (o = r[n++]);)
                                                        if ((i = o.getAttributeNode('id')) && i.value === e) return [o];
                                                }
                                                return [];
                                            }
                                        })),
                                (n.find.TAG = i.getElementsByTagName
                                    ? function (e, t) {
                                        return void 0 !== t.getElementsByTagName
                                            ? t.getElementsByTagName(e)
                                            : i.qsa
                                                ? t.querySelectorAll(e)
                                                : void 0;
                                    }
                                    : function (e, t) {
                                        var i,
                                            n = [],
                                            r = 0,
                                            o = t.getElementsByTagName(e);
                                        if ('*' === e) {
                                            for (; (i = o[r++]);) 1 === i.nodeType && n.push(i);
                                            return n;
                                        }
                                        return o;
                                    }),
                                (n.find.CLASS =
                                    i.getElementsByClassName &&
                                    function (e, t) {
                                        if (void 0 !== t.getElementsByClassName && m) return t.getElementsByClassName(e);
                                    }),
                                (g = []),
                                (_ = []),
                                (i.qsa = K.test(h.querySelectorAll)) &&
                                (pe(function (e) {
                                    var t;
                                    (f.appendChild(e).innerHTML =
                                        "<a id='" +
                                        b +
                                        "'></a><select id='" +
                                        b +
                                        "-\r\\' msallowcapture=''><option selected=''></option></select>"),
                                        e.querySelectorAll("[msallowcapture^='']").length &&
                                        _.push('[*^$]=' + P + '*(?:\'\'|"")'),
                                        e.querySelectorAll('[selected]').length ||
                                        _.push('\\[' + P + '*(?:value|' + q + ')'),
                                        e.querySelectorAll('[id~=' + b + '-]').length || _.push('~='),
                                        (t = h.createElement('input')).setAttribute('name', ''),
                                        e.appendChild(t),
                                        e.querySelectorAll("[name='']").length ||
                                        _.push('\\[' + P + '*name' + P + '*=' + P + '*(?:\'\'|"")'),
                                        e.querySelectorAll(':checked').length || _.push(':checked'),
                                        e.querySelectorAll('a#' + b + '+*').length || _.push('.#.+[+~]'),
                                        e.querySelectorAll('\\\f'),
                                        _.push('[\\r\\n\\f]');
                                }),
                                    pe(function (e) {
                                        e.innerHTML =
                                            "<a href='' disabled='disabled'></a><select disabled='disabled'><option/></select>";
                                        var t = h.createElement('input');
                                        t.setAttribute('type', 'hidden'),
                                            e.appendChild(t).setAttribute('name', 'D'),
                                            e.querySelectorAll('[name=d]').length && _.push('name' + P + '*[*^$|!~]?='),
                                            2 !== e.querySelectorAll(':enabled').length && _.push(':enabled', ':disabled'),
                                            (f.appendChild(e).disabled = !0),
                                            2 !== e.querySelectorAll(':disabled').length && _.push(':enabled', ':disabled'),
                                            e.querySelectorAll('*,:x'),
                                            _.push(',.*:');
                                    })),
                                (i.matchesSelector = K.test(
                                    (y =
                                        f.matches ||
                                        f.webkitMatchesSelector ||
                                        f.mozMatchesSelector ||
                                        f.oMatchesSelector ||
                                        f.msMatchesSelector),
                                )) &&
                                pe(function (e) {
                                    (i.disconnectedMatch = y.call(e, '*')), y.call(e, "[s!='']:x"), g.push('!=', H);
                                }),
                                (_ = _.length && new RegExp(_.join('|'))),
                                (g = g.length && new RegExp(g.join('|'))),
                                (t = K.test(f.compareDocumentPosition)),
                                (v =
                                    t || K.test(f.contains)
                                        ? function (e, t) {
                                            var i = 9 === e.nodeType ? e.documentElement : e,
                                                n = t && t.parentNode;
                                            return (
                                                e === n ||
                                                !(
                                                    !n ||
                                                    1 !== n.nodeType ||
                                                    !(i.contains
                                                        ? i.contains(n)
                                                        : e.compareDocumentPosition && 16 & e.compareDocumentPosition(n))
                                                )
                                            );
                                        }
                                        : function (e, t) {
                                            if (t) for (; (t = t.parentNode);) if (t === e) return !0;
                                            return !1;
                                        }),
                                (T = t
                                    ? function (e, t) {
                                        if (e === t) return (d = !0), 0;
                                        var n = !e.compareDocumentPosition - !t.compareDocumentPosition;
                                        return (
                                            n ||
                                            (1 &
                                                (n =
                                                    (e.ownerDocument || e) == (t.ownerDocument || t)
                                                        ? e.compareDocumentPosition(t)
                                                        : 1) ||
                                                (!i.sortDetached && t.compareDocumentPosition(e) === n)
                                                ? e == h || (e.ownerDocument == w && v(w, e))
                                                    ? -1
                                                    : t == h || (t.ownerDocument == w && v(w, t))
                                                        ? 1
                                                        : p
                                                            ? M(p, e) - M(p, t)
                                                            : 0
                                                : 4 & n
                                                    ? -1
                                                    : 1)
                                        );
                                    }
                                    : function (e, t) {
                                        if (e === t) return (d = !0), 0;
                                        var i,
                                            n = 0,
                                            r = e.parentNode,
                                            o = t.parentNode,
                                            s = [e],
                                            a = [t];
                                        if (!r || !o)
                                            return e == h ? -1 : t == h ? 1 : r ? -1 : o ? 1 : p ? M(p, e) - M(p, t) : 0;
                                        if (r === o) return ue(e, t);
                                        for (i = e; (i = i.parentNode);) s.unshift(i);
                                        for (i = t; (i = i.parentNode);) a.unshift(i);
                                        for (; s[n] === a[n];) n++;
                                        return n ? ue(s[n], a[n]) : s[n] == w ? -1 : a[n] == w ? 1 : 0;
                                    })),
                            h
                        );
                    }),
                (ae.matches = function (e, t) {
                    return ae(e, null, null, t);
                }),
                (ae.matchesSelector = function (e, t) {
                    if (
                        (u(e), i.matchesSelector && m && !j[t + ' '] && (!g || !g.test(t)) && (!_ || !_.test(t)))
                    )
                        try {
                            var n = y.call(e, t);
                            if (n || i.disconnectedMatch || (e.document && 11 !== e.document.nodeType)) return n;
                        } catch (e) {
                            j(t, !0);
                        }
                    return 0 < ae(t, h, null, [e]).length;
                }),
                (ae.contains = function (e, t) {
                    return (e.ownerDocument || e) != h && u(e), v(e, t);
                }),
                (ae.attr = function (e, t) {
                    (e.ownerDocument || e) != h && u(e);
                    var r = n.attrHandle[t.toLowerCase()],
                        o = r && z.call(n.attrHandle, t.toLowerCase()) ? r(e, t, !m) : void 0;
                    return void 0 !== o
                        ? o
                        : i.attributes || !m
                            ? e.getAttribute(t)
                            : (o = e.getAttributeNode(t)) && o.specified
                                ? o.value
                                : null;
                }),
                (ae.escape = function (e) {
                    return (e + '').replace(ne, re);
                }),
                (ae.error = function (e) {
                    throw new Error('Syntax error, unrecognized expression: ' + e);
                }),
                (ae.uniqueSort = function (e) {
                    var t,
                        n = [],
                        r = 0,
                        o = 0;
                    if (((d = !i.detectDuplicates), (p = !i.sortStable && e.slice(0)), e.sort(T), d)) {
                        for (; (t = e[o++]);) t === e[o] && (r = n.push(o));
                        for (; r--;) e.splice(n[r], 1);
                    }
                    return (p = null), e;
                }),
                (r = ae.getText =
                    function (e) {
                        var t,
                            i = '',
                            n = 0,
                            o = e.nodeType;
                        if (o) {
                            if (1 === o || 9 === o || 11 === o) {
                                if ('string' == typeof e.textContent) return e.textContent;
                                for (e = e.firstChild; e; e = e.nextSibling) i += r(e);
                            } else if (3 === o || 4 === o) return e.nodeValue;
                        } else for (; (t = e[n++]);) i += r(t);
                        return i;
                    }),
                ((n = ae.selectors =
                {
                    cacheLength: 50,
                    createPseudo: le,
                    match: V,
                    attrHandle: {},
                    find: {},
                    relative: {
                        '>': { dir: 'parentNode', first: !0 },
                        ' ': { dir: 'parentNode' },
                        '+': { dir: 'previousSibling', first: !0 },
                        '~': { dir: 'previousSibling' },
                    },
                    preFilter: {
                        ATTR: function (e) {
                            return (
                                (e[1] = e[1].replace(te, ie)),
                                (e[3] = (e[3] || e[4] || e[5] || '').replace(te, ie)),
                                '~=' === e[2] && (e[3] = ' ' + e[3] + ' '),
                                e.slice(0, 4)
                            );
                        },
                        CHILD: function (e) {
                            return (
                                (e[1] = e[1].toLowerCase()),
                                'nth' === e[1].slice(0, 3)
                                    ? (e[3] || ae.error(e[0]),
                                        (e[4] = +(e[4] ? e[5] + (e[6] || 1) : 2 * ('even' === e[3] || 'odd' === e[3]))),
                                        (e[5] = +(e[7] + e[8] || 'odd' === e[3])))
                                    : e[3] && ae.error(e[0]),
                                e
                            );
                        },
                        PSEUDO: function (e) {
                            var t,
                                i = !e[6] && e[2];
                            return V.CHILD.test(e[0])
                                ? null
                                : (e[3]
                                    ? (e[2] = e[4] || e[5] || '')
                                    : i &&
                                    U.test(i) &&
                                    (t = s(i, !0)) &&
                                    (t = i.indexOf(')', i.length - t) - i.length) &&
                                    ((e[0] = e[0].slice(0, t)), (e[2] = i.slice(0, t))),
                                    e.slice(0, 3));
                        },
                    },
                    filter: {
                        TAG: function (e) {
                            var t = e.replace(te, ie).toLowerCase();
                            return '*' === e
                                ? function () {
                                    return !0;
                                }
                                : function (e) {
                                    return e.nodeName && e.nodeName.toLowerCase() === t;
                                };
                        },
                        CLASS: function (e) {
                            var t = S[e + ' '];
                            return (
                                t ||
                                ((t = new RegExp('(^|' + P + ')' + e + '(' + P + '|$)')) &&
                                    S(e, function (e) {
                                        return t.test(
                                            ('string' == typeof e.className && e.className) ||
                                            (void 0 !== e.getAttribute && e.getAttribute('class')) ||
                                            '',
                                        );
                                    }))
                            );
                        },
                        ATTR: function (e, t, i) {
                            return function (n) {
                                var r = ae.attr(n, e);
                                return null == r
                                    ? '!=' === t
                                    : !t ||
                                    ((r += ''),
                                        '=' === t
                                            ? r === i
                                            : '!=' === t
                                                ? r !== i
                                                : '^=' === t
                                                    ? i && 0 === r.indexOf(i)
                                                    : '*=' === t
                                                        ? i && -1 < r.indexOf(i)
                                                        : '$=' === t
                                                            ? i && r.slice(-i.length) === i
                                                            : '~=' === t
                                                                ? -1 < (' ' + r.replace(F, ' ') + ' ').indexOf(i)
                                                                : '|=' === t && (r === i || r.slice(0, i.length + 1) === i + '-'));
                            };
                        },
                        CHILD: function (e, t, i, n, r) {
                            var o = 'nth' !== e.slice(0, 3),
                                s = 'last' !== e.slice(-4),
                                a = 'of-type' === t;
                            return 1 === n && 0 === r
                                ? function (e) {
                                    return !!e.parentNode;
                                }
                                : function (t, i, c) {
                                    var l,
                                        p,
                                        d,
                                        u,
                                        h,
                                        f,
                                        m = o !== s ? 'nextSibling' : 'previousSibling',
                                        _ = t.parentNode,
                                        g = a && t.nodeName.toLowerCase(),
                                        y = !c && !a,
                                        v = !1;
                                    if (_) {
                                        if (o) {
                                            for (; m;) {
                                                for (u = t; (u = u[m]);)
                                                    if (a ? u.nodeName.toLowerCase() === g : 1 === u.nodeType) return !1;
                                                f = m = 'only' === e && !f && 'nextSibling';
                                            }
                                            return !0;
                                        }
                                        if (((f = [s ? _.firstChild : _.lastChild]), s && y)) {
                                            for (
                                                v =
                                                (h =
                                                    (l =
                                                        (p =
                                                            (d = (u = _)[b] || (u[b] = {}))[u.uniqueID] ||
                                                            (d[u.uniqueID] = {}))[e] || [])[0] === k && l[1]) && l[2],
                                                u = h && _.childNodes[h];
                                                (u = (++h && u && u[m]) || (v = h = 0) || f.pop());

                                            )
                                                if (1 === u.nodeType && ++v && u === t) {
                                                    p[e] = [k, h, v];
                                                    break;
                                                }
                                        } else if (
                                            (y &&
                                                (v = h =
                                                    (l =
                                                        (p =
                                                            (d = (u = t)[b] || (u[b] = {}))[u.uniqueID] ||
                                                            (d[u.uniqueID] = {}))[e] || [])[0] === k && l[1]),
                                                !1 === v)
                                        )
                                            for (
                                                ;
                                                (u = (++h && u && u[m]) || (v = h = 0) || f.pop()) &&
                                                ((a ? u.nodeName.toLowerCase() !== g : 1 !== u.nodeType) ||
                                                    !++v ||
                                                    (y &&
                                                        ((p = (d = u[b] || (u[b] = {}))[u.uniqueID] || (d[u.uniqueID] = {}))[
                                                            e
                                                        ] = [k, v]),
                                                        u !== t));

                                            );
                                        return (v -= r) === n || (v % n == 0 && 0 <= v / n);
                                    }
                                };
                        },
                        PSEUDO: function (e, t) {
                            var i,
                                r =
                                    n.pseudos[e] ||
                                    n.setFilters[e.toLowerCase()] ||
                                    ae.error('unsupported pseudo: ' + e);
                            return r[b]
                                ? r(t)
                                : 1 < r.length
                                    ? ((i = [e, e, '', t]),
                                        n.setFilters.hasOwnProperty(e.toLowerCase())
                                            ? le(function (e, i) {
                                                for (var n, o = r(e, t), s = o.length; s--;)
                                                    e[(n = M(e, o[s]))] = !(i[n] = o[s]);
                                            })
                                            : function (e) {
                                                return r(e, 0, i);
                                            })
                                    : r;
                        },
                    },
                    pseudos: {
                        not: le(function (e) {
                            var t = [],
                                i = [],
                                n = a(e.replace(B, '$1'));
                            return n[b]
                                ? le(function (e, t, i, r) {
                                    for (var o, s = n(e, null, r, []), a = e.length; a--;)
                                        (o = s[a]) && (e[a] = !(t[a] = o));
                                })
                                : function (e, r, o) {
                                    return (t[0] = e), n(t, null, o, i), (t[0] = null), !i.pop();
                                };
                        }),
                        has: le(function (e) {
                            return function (t) {
                                return 0 < ae(e, t).length;
                            };
                        }),
                        contains: le(function (e) {
                            return (
                                (e = e.replace(te, ie)),
                                function (t) {
                                    return -1 < (t.textContent || r(t)).indexOf(e);
                                }
                            );
                        }),
                        lang: le(function (e) {
                            return (
                                Q.test(e || '') || ae.error('unsupported lang: ' + e),
                                (e = e.replace(te, ie).toLowerCase()),
                                function (t) {
                                    var i;
                                    do {
                                        if ((i = m ? t.lang : t.getAttribute('xml:lang') || t.getAttribute('lang')))
                                            return (i = i.toLowerCase()) === e || 0 === i.indexOf(e + '-');
                                    } while ((t = t.parentNode) && 1 === t.nodeType);
                                    return !1;
                                }
                            );
                        }),
                        target: function (t) {
                            var i = e.location && e.location.hash;
                            return i && i.slice(1) === t.id;
                        },
                        root: function (e) {
                            return e === f;
                        },
                        focus: function (e) {
                            return (
                                e === h.activeElement &&
                                (!h.hasFocus || h.hasFocus()) &&
                                !!(e.type || e.href || ~e.tabIndex)
                            );
                        },
                        enabled: me(!1),
                        disabled: me(!0),
                        checked: function (e) {
                            var t = e.nodeName.toLowerCase();
                            return ('input' === t && !!e.checked) || ('option' === t && !!e.selected);
                        },
                        selected: function (e) {
                            return e.parentNode && e.parentNode.selectedIndex, !0 === e.selected;
                        },
                        empty: function (e) {
                            for (e = e.firstChild; e; e = e.nextSibling) if (e.nodeType < 6) return !1;
                            return !0;
                        },
                        parent: function (e) {
                            return !n.pseudos.empty(e);
                        },
                        header: function (e) {
                            return Z.test(e.nodeName);
                        },
                        input: function (e) {
                            return J.test(e.nodeName);
                        },
                        button: function (e) {
                            var t = e.nodeName.toLowerCase();
                            return ('input' === t && 'button' === e.type) || 'button' === t;
                        },
                        text: function (e) {
                            var t;
                            return (
                                'input' === e.nodeName.toLowerCase() &&
                                'text' === e.type &&
                                (null == (t = e.getAttribute('type')) || 'text' === t.toLowerCase())
                            );
                        },
                        first: _e(function () {
                            return [0];
                        }),
                        last: _e(function (e, t) {
                            return [t - 1];
                        }),
                        eq: _e(function (e, t, i) {
                            return [i < 0 ? i + t : i];
                        }),
                        even: _e(function (e, t) {
                            for (var i = 0; i < t; i += 2) e.push(i);
                            return e;
                        }),
                        odd: _e(function (e, t) {
                            for (var i = 1; i < t; i += 2) e.push(i);
                            return e;
                        }),
                        lt: _e(function (e, t, i) {
                            for (var n = i < 0 ? i + t : t < i ? t : i; 0 <= --n;) e.push(n);
                            return e;
                        }),
                        gt: _e(function (e, t, i) {
                            for (var n = i < 0 ? i + t : i; ++n < t;) e.push(n);
                            return e;
                        }),
                    },
                }).pseudos.nth = n.pseudos.eq),
                { radio: !0, checkbox: !0, file: !0, password: !0, image: !0 }))
                n.pseudos[t] = he(t);
            for (t in { submit: !0, reset: !0 }) n.pseudos[t] = fe(t);
            function ye() { }
            function ve(e) {
                for (var t = 0, i = e.length, n = ''; t < i; t++) n += e[t].value;
                return n;
            }
            function be(e, t, i) {
                var n = t.dir,
                    r = t.next,
                    o = r || n,
                    s = i && 'parentNode' === o,
                    a = x++;
                return t.first
                    ? function (t, i, r) {
                        for (; (t = t[n]);) if (1 === t.nodeType || s) return e(t, i, r);
                        return !1;
                    }
                    : function (t, i, c) {
                        var l,
                            p,
                            d,
                            u = [k, a];
                        if (c) {
                            for (; (t = t[n]);) if ((1 === t.nodeType || s) && e(t, i, c)) return !0;
                        } else
                            for (; (t = t[n]);)
                                if (1 === t.nodeType || s)
                                    if (
                                        ((p = (d = t[b] || (t[b] = {}))[t.uniqueID] || (d[t.uniqueID] = {})),
                                            r && r === t.nodeName.toLowerCase())
                                    )
                                        t = t[n] || t;
                                    else {
                                        if ((l = p[o]) && l[0] === k && l[1] === a) return (u[2] = l[2]);
                                        if (((p[o] = u)[2] = e(t, i, c))) return !0;
                                    }
                        return !1;
                    };
            }
            function we(e) {
                return 1 < e.length
                    ? function (t, i, n) {
                        for (var r = e.length; r--;) if (!e[r](t, i, n)) return !1;
                        return !0;
                    }
                    : e[0];
            }
            function ke(e, t, i, n, r) {
                for (var o, s = [], a = 0, c = e.length, l = null != t; a < c; a++)
                    (o = e[a]) && ((i && !i(o, n, r)) || (s.push(o), l && t.push(a)));
                return s;
            }
            function xe(e, t, i, n, r, o) {
                return (
                    n && !n[b] && (n = xe(n)),
                    r && !r[b] && (r = xe(r, o)),
                    le(function (o, s, a, c) {
                        var l,
                            p,
                            d,
                            u = [],
                            h = [],
                            f = s.length,
                            m =
                                o ||
                                (function (e, t, i) {
                                    for (var n = 0, r = t.length; n < r; n++) ae(e, t[n], i);
                                    return i;
                                })(t || '*', a.nodeType ? [a] : a, []),
                            _ = !e || (!o && t) ? m : ke(m, u, e, a, c),
                            g = i ? (r || (o ? e : f || n) ? [] : s) : _;
                        if ((i && i(_, g, a, c), n))
                            for (l = ke(g, h), n(l, [], a, c), p = l.length; p--;)
                                (d = l[p]) && (g[h[p]] = !(_[h[p]] = d));
                        if (o) {
                            if (r || e) {
                                if (r) {
                                    for (l = [], p = g.length; p--;) (d = g[p]) && l.push((_[p] = d));
                                    r(null, (g = []), l, c);
                                }
                                for (p = g.length; p--;)
                                    (d = g[p]) && -1 < (l = r ? M(o, d) : u[p]) && (o[l] = !(s[l] = d));
                            }
                        } else (g = ke(g === s ? g.splice(f, g.length) : g)), r ? r(null, s, g, c) : L.apply(s, g);
                    })
                );
            }
            function Se(e) {
                for (
                    var t,
                    i,
                    r,
                    o = e.length,
                    s = n.relative[e[0].type],
                    a = s || n.relative[' '],
                    c = s ? 1 : 0,
                    p = be(
                        function (e) {
                            return e === t;
                        },
                        a,
                        !0,
                    ),
                    d = be(
                        function (e) {
                            return -1 < M(t, e);
                        },
                        a,
                        !0,
                    ),
                    u = [
                        function (e, i, n) {
                            var r = (!s && (n || i !== l)) || ((t = i).nodeType ? p(e, i, n) : d(e, i, n));
                            return (t = null), r;
                        },
                    ];
                    c < o;
                    c++
                )
                    if ((i = n.relative[e[c].type])) u = [be(we(u), i)];
                    else {
                        if ((i = n.filter[e[c].type].apply(null, e[c].matches))[b]) {
                            for (r = ++c; r < o && !n.relative[e[r].type]; r++);
                            return xe(
                                1 < c && we(u),
                                1 < c &&
                                ve(e.slice(0, c - 1).concat({ value: ' ' === e[c - 2].type ? '*' : '' })).replace(
                                    B,
                                    '$1',
                                ),
                                i,
                                c < r && Se(e.slice(c, r)),
                                r < o && Se((e = e.slice(r))),
                                r < o && ve(e),
                            );
                        }
                        u.push(i);
                    }
                return we(u);
            }
            return (
                (ye.prototype = n.filters = n.pseudos),
                (n.setFilters = new ye()),
                (s = ae.tokenize =
                    function (e, t) {
                        var i,
                            r,
                            o,
                            s,
                            a,
                            c,
                            l,
                            p = C[e + ' '];
                        if (p) return t ? 0 : p.slice(0);
                        for (a = e, c = [], l = n.preFilter; a;) {
                            for (s in ((i && !(r = R.exec(a))) ||
                                (r && (a = a.slice(r[0].length) || a), c.push((o = []))),
                                (i = !1),
                                (r = W.exec(a)) &&
                                ((i = r.shift()),
                                    o.push({ value: i, type: r[0].replace(B, ' ') }),
                                    (a = a.slice(i.length))),
                                n.filter))
                                !(r = V[s].exec(a)) ||
                                    (l[s] && !(r = l[s](r))) ||
                                    ((i = r.shift()),
                                        o.push({ value: i, type: s, matches: r }),
                                        (a = a.slice(i.length)));
                            if (!i) break;
                        }
                        return t ? a.length : a ? ae.error(e) : C(e, c).slice(0);
                    }),
                (a = ae.compile =
                    function (e, t) {
                        var i,
                            r,
                            o,
                            a,
                            c,
                            p,
                            d = [],
                            f = [],
                            _ = $[e + ' '];
                        if (!_) {
                            for (t || (t = s(e)), i = t.length; i--;) (_ = Se(t[i]))[b] ? d.push(_) : f.push(_);
                            (_ = $(
                                e,
                                ((r = f),
                                    (a = 0 < (o = d).length),
                                    (c = 0 < r.length),
                                    (p = function (e, t, i, s, p) {
                                        var d,
                                            f,
                                            _,
                                            g = 0,
                                            y = '0',
                                            v = e && [],
                                            b = [],
                                            w = l,
                                            x = e || (c && n.find.TAG('*', p)),
                                            S = (k += null == w ? 1 : Math.random() || 0.1),
                                            C = x.length;
                                        for (p && (l = t == h || t || p); y !== C && null != (d = x[y]); y++) {
                                            if (c && d) {
                                                for (f = 0, t || d.ownerDocument == h || (u(d), (i = !m)); (_ = r[f++]);)
                                                    if (_(d, t || h, i)) {
                                                        s.push(d);
                                                        break;
                                                    }
                                                p && (k = S);
                                            }
                                            a && ((d = !_ && d) && g--, e && v.push(d));
                                        }
                                        if (((g += y), a && y !== g)) {
                                            for (f = 0; (_ = o[f++]);) _(v, b, t, i);
                                            if (e) {
                                                if (0 < g) for (; y--;) v[y] || b[y] || (b[y] = A.call(s));
                                                b = ke(b);
                                            }
                                            L.apply(s, b), p && !e && 0 < b.length && 1 < g + o.length && ae.uniqueSort(s);
                                        }
                                        return p && ((k = S), (l = w)), v;
                                    }),
                                    a ? le(p) : p),
                            )).selector = e;
                        }
                        return _;
                    }),
                (c = ae.select =
                    function (e, t, i, r) {
                        var o,
                            c,
                            l,
                            p,
                            d,
                            u = 'function' == typeof e && e,
                            h = !r && s((e = u.selector || e));
                        if (((i = i || []), 1 === h.length)) {
                            if (
                                2 < (c = h[0] = h[0].slice(0)).length &&
                                'ID' === (l = c[0]).type &&
                                9 === t.nodeType &&
                                m &&
                                n.relative[c[1].type]
                            ) {
                                if (!(t = (n.find.ID(l.matches[0].replace(te, ie), t) || [])[0])) return i;
                                u && (t = t.parentNode), (e = e.slice(c.shift().value.length));
                            }
                            for (
                                o = V.needsContext.test(e) ? 0 : c.length;
                                o-- && ((l = c[o]), !n.relative[(p = l.type)]);

                            )
                                if (
                                    (d = n.find[p]) &&
                                    (r = d(
                                        l.matches[0].replace(te, ie),
                                        (ee.test(c[0].type) && ge(t.parentNode)) || t,
                                    ))
                                ) {
                                    if ((c.splice(o, 1), !(e = r.length && ve(c)))) return L.apply(i, r), i;
                                    break;
                                }
                        }
                        return (u || a(e, h))(r, t, !m, i, !t || (ee.test(e) && ge(t.parentNode)) || t), i;
                    }),
                (i.sortStable = b.split('').sort(T).join('') === b),
                (i.detectDuplicates = !!d),
                u(),
                (i.sortDetached = pe(function (e) {
                    return 1 & e.compareDocumentPosition(h.createElement('fieldset'));
                })),
                pe(function (e) {
                    return (e.innerHTML = "<a href='#'></a>"), '#' === e.firstChild.getAttribute('href');
                }) ||
                de('type|href|height|width', function (e, t, i) {
                    if (!i) return e.getAttribute(t, 'type' === t.toLowerCase() ? 1 : 2);
                }),
                (i.attributes &&
                    pe(function (e) {
                        return (
                            (e.innerHTML = '<input/>'),
                            e.firstChild.setAttribute('value', ''),
                            '' === e.firstChild.getAttribute('value')
                        );
                    })) ||
                de('value', function (e, t, i) {
                    if (!i && 'input' === e.nodeName.toLowerCase()) return e.defaultValue;
                }),
                pe(function (e) {
                    return null == e.getAttribute('disabled');
                }) ||
                de(q, function (e, t, i) {
                    var n;
                    if (!i)
                        return !0 === e[t]
                            ? t.toLowerCase()
                            : (n = e.getAttributeNode(t)) && n.specified
                                ? n.value
                                : null;
                }),
                ae
            );
        })(e);
        (w.find = x),
            (w.expr = x.selectors),
            (w.expr[':'] = w.expr.pseudos),
            (w.uniqueSort = w.unique = x.uniqueSort),
            (w.text = x.getText),
            (w.isXMLDoc = x.isXML),
            (w.contains = x.contains),
            (w.escapeSelector = x.escape);
        var S = function (e, t, i) {
            for (var n = [], r = void 0 !== i; (e = e[t]) && 9 !== e.nodeType;)
                if (1 === e.nodeType) {
                    if (r && w(e).is(i)) break;
                    n.push(e);
                }
            return n;
        },
            C = function (e, t) {
                for (var i = []; e; e = e.nextSibling) 1 === e.nodeType && e !== t && i.push(e);
                return i;
            },
            $ = w.expr.match.needsContext;
        function j(e, t) {
            return e.nodeName && e.nodeName.toLowerCase() === t.toLowerCase();
        }
        var T = /^<([a-z][^\/\0>:\x20\t\r\n\f]*)[\x20\t\r\n\f]*\/?>(?:<\/\1>|)$/i;
        function z(e, t, i) {
            return f(t)
                ? w.grep(e, function (e, n) {
                    return !!t.call(e, n, e) !== i;
                })
                : t.nodeType
                    ? w.grep(e, function (e) {
                        return (e === t) !== i;
                    })
                    : 'string' != typeof t
                        ? w.grep(e, function (e) {
                            return -1 < a.call(t, e) !== i;
                        })
                        : w.filter(t, e, i);
        }
        (w.filter = function (e, t, i) {
            var n = t[0];
            return (
                i && (e = ':not(' + e + ')'),
                1 === t.length && 1 === n.nodeType
                    ? w.find.matchesSelector(n, e)
                        ? [n]
                        : []
                    : w.find.matches(
                        e,
                        w.grep(t, function (e) {
                            return 1 === e.nodeType;
                        }),
                    )
            );
        }),
            w.fn.extend({
                find: function (e) {
                    var t,
                        i,
                        n = this.length,
                        r = this;
                    if ('string' != typeof e)
                        return this.pushStack(
                            w(e).filter(function () {
                                for (t = 0; t < n; t++) if (w.contains(r[t], this)) return !0;
                            }),
                        );
                    for (i = this.pushStack([]), t = 0; t < n; t++) w.find(e, r[t], i);
                    return 1 < n ? w.uniqueSort(i) : i;
                },
                filter: function (e) {
                    return this.pushStack(z(this, e || [], !1));
                },
                not: function (e) {
                    return this.pushStack(z(this, e || [], !0));
                },
                is: function (e) {
                    return !!z(this, 'string' == typeof e && $.test(e) ? w(e) : e || [], !1).length;
                },
            });
        var D,
            A = /^(?:\s*(<[\w\W]+>)[^>]*|#([\w-]+))$/;
        ((w.fn.init = function (e, t, i) {
            var n, r;
            if (!e) return this;
            if (((i = i || D), 'string' == typeof e)) {
                if (
                    !(n =
                        '<' === e[0] && '>' === e[e.length - 1] && 3 <= e.length
                            ? [null, e, null]
                            : A.exec(e)) ||
                    (!n[1] && t)
                )
                    return !t || t.jquery ? (t || i).find(e) : this.constructor(t).find(e);
                if (n[1]) {
                    if (
                        ((t = t instanceof w ? t[0] : t),
                            w.merge(this, w.parseHTML(n[1], t && t.nodeType ? t.ownerDocument || t : _, !0)),
                            T.test(n[1]) && w.isPlainObject(t))
                    )
                        for (n in t) f(this[n]) ? this[n](t[n]) : this.attr(n, t[n]);
                    return this;
                }
                return (r = _.getElementById(n[2])) && ((this[0] = r), (this.length = 1)), this;
            }
            return e.nodeType
                ? ((this[0] = e), (this.length = 1), this)
                : f(e)
                    ? void 0 !== i.ready
                        ? i.ready(e)
                        : e(w)
                    : w.makeArray(e, this);
        }).prototype = w.fn),
            (D = w(_));
        var E = /^(?:parents|prev(?:Until|All))/,
            L = { children: !0, contents: !0, next: !0, prev: !0 };
        function O(e, t) {
            for (; (e = e[t]) && 1 !== e.nodeType;);
            return e;
        }
        w.fn.extend({
            has: function (e) {
                var t = w(e, this),
                    i = t.length;
                return this.filter(function () {
                    for (var e = 0; e < i; e++) if (w.contains(this, t[e])) return !0;
                });
            },
            closest: function (e, t) {
                var i,
                    n = 0,
                    r = this.length,
                    o = [],
                    s = 'string' != typeof e && w(e);
                if (!$.test(e))
                    for (; n < r; n++)
                        for (i = this[n]; i && i !== t; i = i.parentNode)
                            if (
                                i.nodeType < 11 &&
                                (s ? -1 < s.index(i) : 1 === i.nodeType && w.find.matchesSelector(i, e))
                            ) {
                                o.push(i);
                                break;
                            }
                return this.pushStack(1 < o.length ? w.uniqueSort(o) : o);
            },
            index: function (e) {
                return e
                    ? 'string' == typeof e
                        ? a.call(w(e), this[0])
                        : a.call(this, e.jquery ? e[0] : e)
                    : this[0] && this[0].parentNode
                        ? this.first().prevAll().length
                        : -1;
            },
            add: function (e, t) {
                return this.pushStack(w.uniqueSort(w.merge(this.get(), w(e, t))));
            },
            addBack: function (e) {
                return this.add(null == e ? this.prevObject : this.prevObject.filter(e));
            },
        }),
            w.each(
                {
                    parent: function (e) {
                        var t = e.parentNode;
                        return t && 11 !== t.nodeType ? t : null;
                    },
                    parents: function (e) {
                        return S(e, 'parentNode');
                    },
                    parentsUntil: function (e, t, i) {
                        return S(e, 'parentNode', i);
                    },
                    next: function (e) {
                        return O(e, 'nextSibling');
                    },
                    prev: function (e) {
                        return O(e, 'previousSibling');
                    },
                    nextAll: function (e) {
                        return S(e, 'nextSibling');
                    },
                    prevAll: function (e) {
                        return S(e, 'previousSibling');
                    },
                    nextUntil: function (e, t, i) {
                        return S(e, 'nextSibling', i);
                    },
                    prevUntil: function (e, t, i) {
                        return S(e, 'previousSibling', i);
                    },
                    siblings: function (e) {
                        return C((e.parentNode || {}).firstChild, e);
                    },
                    children: function (e) {
                        return C(e.firstChild);
                    },
                    contents: function (e) {
                        return null != e.contentDocument && n(e.contentDocument)
                            ? e.contentDocument
                            : (j(e, 'template') && (e = e.content || e), w.merge([], e.childNodes));
                    },
                },
                function (e, t) {
                    w.fn[e] = function (i, n) {
                        var r = w.map(this, t, i);
                        return (
                            'Until' !== e.slice(-5) && (n = i),
                            n && 'string' == typeof n && (r = w.filter(n, r)),
                            1 < this.length && (L[e] || w.uniqueSort(r), E.test(e) && r.reverse()),
                            this.pushStack(r)
                        );
                    };
                },
            );
        var M = /[^\x20\t\r\n\f]+/g;
        function q(e) {
            return e;
        }
        function P(e) {
            throw e;
        }
        function I(e, t, i, n) {
            var r;
            try {
                e && f((r = e.promise))
                    ? r.call(e).done(t).fail(i)
                    : e && f((r = e.then))
                        ? r.call(e, t, i)
                        : t.apply(void 0, [e].slice(n));
            } catch (e) {
                i.apply(void 0, [e]);
            }
        }
        (w.Callbacks = function (e) {
            var t, i;
            e =
                'string' == typeof e
                    ? ((t = e),
                        (i = {}),
                        w.each(t.match(M) || [], function (e, t) {
                            i[t] = !0;
                        }),
                        i)
                    : w.extend({}, e);
            var n,
                r,
                o,
                s,
                a = [],
                c = [],
                l = -1,
                p = function () {
                    for (s = s || e.once, o = n = !0; c.length; l = -1)
                        for (r = c.shift(); ++l < a.length;)
                            !1 === a[l].apply(r[0], r[1]) && e.stopOnFalse && ((l = a.length), (r = !1));
                    e.memory || (r = !1), (n = !1), s && (a = r ? [] : '');
                },
                d = {
                    add: function () {
                        return (
                            a &&
                            (r && !n && ((l = a.length - 1), c.push(r)),
                                (function t(i) {
                                    w.each(i, function (i, n) {
                                        f(n)
                                            ? (e.unique && d.has(n)) || a.push(n)
                                            : n && n.length && 'string' !== v(n) && t(n);
                                    });
                                })(arguments),
                                r && !n && p()),
                            this
                        );
                    },
                    remove: function () {
                        return (
                            w.each(arguments, function (e, t) {
                                for (var i; -1 < (i = w.inArray(t, a, i));) a.splice(i, 1), i <= l && l--;
                            }),
                            this
                        );
                    },
                    has: function (e) {
                        return e ? -1 < w.inArray(e, a) : 0 < a.length;
                    },
                    empty: function () {
                        return a && (a = []), this;
                    },
                    disable: function () {
                        return (s = c = []), (a = r = ''), this;
                    },
                    disabled: function () {
                        return !a;
                    },
                    lock: function () {
                        return (s = c = []), r || n || (a = r = ''), this;
                    },
                    locked: function () {
                        return !!s;
                    },
                    fireWith: function (e, t) {
                        return s || ((t = [e, (t = t || []).slice ? t.slice() : t]), c.push(t), n || p()), this;
                    },
                    fire: function () {
                        return d.fireWith(this, arguments), this;
                    },
                    fired: function () {
                        return !!o;
                    },
                };
            return d;
        }),
            w.extend({
                Deferred: function (t) {
                    var i = [
                        ['notify', 'progress', w.Callbacks('memory'), w.Callbacks('memory'), 2],
                        [
                            'resolve',
                            'done',
                            w.Callbacks('once memory'),
                            w.Callbacks('once memory'),
                            0,
                            'resolved',
                        ],
                        [
                            'reject',
                            'fail',
                            w.Callbacks('once memory'),
                            w.Callbacks('once memory'),
                            1,
                            'rejected',
                        ],
                    ],
                        n = 'pending',
                        r = {
                            state: function () {
                                return n;
                            },
                            always: function () {
                                return o.done(arguments).fail(arguments), this;
                            },
                            catch: function (e) {
                                return r.then(null, e);
                            },
                            pipe: function () {
                                var e = arguments;
                                return w
                                    .Deferred(function (t) {
                                        w.each(i, function (i, n) {
                                            var r = f(e[n[4]]) && e[n[4]];
                                            o[n[1]](function () {
                                                var e = r && r.apply(this, arguments);
                                                e && f(e.promise)
                                                    ? e.promise().progress(t.notify).done(t.resolve).fail(t.reject)
                                                    : t[n[0] + 'With'](this, r ? [e] : arguments);
                                            });
                                        }),
                                            (e = null);
                                    })
                                    .promise();
                            },
                            then: function (t, n, r) {
                                var o = 0;
                                function s(t, i, n, r) {
                                    return function () {
                                        var a = this,
                                            c = arguments,
                                            l = function () {
                                                var e, l;
                                                if (!(t < o)) {
                                                    if ((e = n.apply(a, c)) === i.promise())
                                                        throw new TypeError('Thenable self-resolution');
                                                    (l = e && ('object' == typeof e || 'function' == typeof e) && e.then),
                                                        f(l)
                                                            ? r
                                                                ? l.call(e, s(o, i, q, r), s(o, i, P, r))
                                                                : (o++,
                                                                    l.call(e, s(o, i, q, r), s(o, i, P, r), s(o, i, q, i.notifyWith)))
                                                            : (n !== q && ((a = void 0), (c = [e])), (r || i.resolveWith)(a, c));
                                                }
                                            },
                                            p = r
                                                ? l
                                                : function () {
                                                    try {
                                                        l();
                                                    } catch (e) {
                                                        w.Deferred.exceptionHook && w.Deferred.exceptionHook(e, p.stackTrace),
                                                            o <= t + 1 &&
                                                            (n !== P && ((a = void 0), (c = [e])), i.rejectWith(a, c));
                                                    }
                                                };
                                        t
                                            ? p()
                                            : (w.Deferred.getStackHook && (p.stackTrace = w.Deferred.getStackHook()),
                                                e.setTimeout(p));
                                    };
                                }
                                return w
                                    .Deferred(function (e) {
                                        i[0][3].add(s(0, e, f(r) ? r : q, e.notifyWith)),
                                            i[1][3].add(s(0, e, f(t) ? t : q)),
                                            i[2][3].add(s(0, e, f(n) ? n : P));
                                    })
                                    .promise();
                            },
                            promise: function (e) {
                                return null != e ? w.extend(e, r) : r;
                            },
                        },
                        o = {};
                    return (
                        w.each(i, function (e, t) {
                            var s = t[2],
                                a = t[5];
                            (r[t[1]] = s.add),
                                a &&
                                s.add(
                                    function () {
                                        n = a;
                                    },
                                    i[3 - e][2].disable,
                                    i[3 - e][3].disable,
                                    i[0][2].lock,
                                    i[0][3].lock,
                                ),
                                s.add(t[3].fire),
                                (o[t[0]] = function () {
                                    return o[t[0] + 'With'](this === o ? void 0 : this, arguments), this;
                                }),
                                (o[t[0] + 'With'] = s.fireWith);
                        }),
                        r.promise(o),
                        t && t.call(o, o),
                        o
                    );
                },
                when: function (e) {
                    var t = arguments.length,
                        i = t,
                        n = Array(i),
                        o = r.call(arguments),
                        s = w.Deferred(),
                        a = function (e) {
                            return function (i) {
                                (n[e] = this),
                                    (o[e] = 1 < arguments.length ? r.call(arguments) : i),
                                    --t || s.resolveWith(n, o);
                            };
                        };
                    if (
                        t <= 1 &&
                        (I(e, s.done(a(i)).resolve, s.reject, !t),
                            'pending' === s.state() || f(o[i] && o[i].then))
                    )
                        return s.then();
                    for (; i--;) I(o[i], a(i), s.reject);
                    return s.promise();
                },
            });
        var N = /^(Eval|Internal|Range|Reference|Syntax|Type|URI)Error$/;
        (w.Deferred.exceptionHook = function (t, i) {
            e.console &&
                e.console.warn &&
                t &&
                N.test(t.name) &&
                e.console.warn('jQuery.Deferred exception: ' + t.message, t.stack, i);
        }),
            (w.readyException = function (t) {
                e.setTimeout(function () {
                    throw t;
                });
            });
        var H = w.Deferred();
        function F() {
            _.removeEventListener('DOMContentLoaded', F), e.removeEventListener('load', F), w.ready();
        }
        (w.fn.ready = function (e) {
            return (
                H.then(e).catch(function (e) {
                    w.readyException(e);
                }),
                this
            );
        }),
            w.extend({
                isReady: !1,
                readyWait: 1,
                ready: function (e) {
                    (!0 === e ? --w.readyWait : w.isReady) ||
                        ((w.isReady = !0) !== e && 0 < --w.readyWait) ||
                        H.resolveWith(_, [w]);
                },
            }),
            (w.ready.then = H.then),
            'complete' === _.readyState || ('loading' !== _.readyState && !_.documentElement.doScroll)
                ? e.setTimeout(w.ready)
                : (_.addEventListener('DOMContentLoaded', F), e.addEventListener('load', F));
        var B = function (e, t, i, n, r, o, s) {
            var a = 0,
                c = e.length,
                l = null == i;
            if ('object' === v(i)) for (a in ((r = !0), i)) B(e, t, a, i[a], !0, o, s);
            else if (
                void 0 !== n &&
                ((r = !0),
                    f(n) || (s = !0),
                    l &&
                    (s
                        ? (t.call(e, n), (t = null))
                        : ((l = t),
                            (t = function (e, t, i) {
                                return l.call(w(e), i);
                            }))),
                    t)
            )
                for (; a < c; a++) t(e[a], i, s ? n : n.call(e[a], a, t(e[a], i)));
            return r ? e : l ? t.call(e) : c ? t(e[0], i) : o;
        },
            R = /^-ms-/,
            W = /-([a-z])/g;
        function Y(e, t) {
            return t.toUpperCase();
        }
        function U(e) {
            return e.replace(R, 'ms-').replace(W, Y);
        }
        var Q = function (e) {
            return 1 === e.nodeType || 9 === e.nodeType || !+e.nodeType;
        };
        function V() {
            this.expando = w.expando + V.uid++;
        }
        (V.uid = 1),
            (V.prototype = {
                cache: function (e) {
                    var t = e[this.expando];
                    return (
                        t ||
                        ((t = {}),
                            Q(e) &&
                            (e.nodeType
                                ? (e[this.expando] = t)
                                : Object.defineProperty(e, this.expando, { value: t, configurable: !0 }))),
                        t
                    );
                },
                set: function (e, t, i) {
                    var n,
                        r = this.cache(e);
                    if ('string' == typeof t) r[U(t)] = i;
                    else for (n in t) r[U(n)] = t[n];
                    return r;
                },
                get: function (e, t) {
                    return void 0 === t ? this.cache(e) : e[this.expando] && e[this.expando][U(t)];
                },
                access: function (e, t, i) {
                    return void 0 === t || (t && 'string' == typeof t && void 0 === i)
                        ? this.get(e, t)
                        : (this.set(e, t, i), void 0 !== i ? i : t);
                },
                remove: function (e, t) {
                    var i,
                        n = e[this.expando];
                    if (void 0 !== n) {
                        if (void 0 !== t) {
                            i = (t = Array.isArray(t) ? t.map(U) : (t = U(t)) in n ? [t] : t.match(M) || [])
                                .length;
                            for (; i--;) delete n[t[i]];
                        }
                        (void 0 === t || w.isEmptyObject(n)) &&
                            (e.nodeType ? (e[this.expando] = void 0) : delete e[this.expando]);
                    }
                },
                hasData: function (e) {
                    var t = e[this.expando];
                    return void 0 !== t && !w.isEmptyObject(t);
                },
            });
        var G = new V(),
            J = new V(),
            Z = /^(?:\{[\w\W]*\}|\[[\w\W]*\])$/,
            K = /[A-Z]/g;
        function X(e, t, i) {
            var n, r;
            if (void 0 === i && 1 === e.nodeType)
                if (
                    ((n = 'data-' + t.replace(K, '-$&').toLowerCase()),
                        'string' == typeof (i = e.getAttribute(n)))
                ) {
                    try {
                        i =
                            'true' === (r = i) ||
                            ('false' !== r &&
                                ('null' === r ? null : r === +r + '' ? +r : Z.test(r) ? JSON.parse(r) : r));
                    } catch (e) { }
                    J.set(e, t, i);
                } else i = void 0;
            return i;
        }
        w.extend({
            hasData: function (e) {
                return J.hasData(e) || G.hasData(e);
            },
            data: function (e, t, i) {
                return J.access(e, t, i);
            },
            removeData: function (e, t) {
                J.remove(e, t);
            },
            _data: function (e, t, i) {
                return G.access(e, t, i);
            },
            _removeData: function (e, t) {
                G.remove(e, t);
            },
        }),
            w.fn.extend({
                data: function (e, t) {
                    var i,
                        n,
                        r,
                        o = this[0],
                        s = o && o.attributes;
                    if (void 0 === e) {
                        if (this.length && ((r = J.get(o)), 1 === o.nodeType && !G.get(o, 'hasDataAttrs'))) {
                            for (i = s.length; i--;)
                                s[i] &&
                                    0 === (n = s[i].name).indexOf('data-') &&
                                    ((n = U(n.slice(5))), X(o, n, r[n]));
                            G.set(o, 'hasDataAttrs', !0);
                        }
                        return r;
                    }
                    return 'object' == typeof e
                        ? this.each(function () {
                            J.set(this, e);
                        })
                        : B(
                            this,
                            function (t) {
                                var i;
                                if (o && void 0 === t)
                                    return void 0 !== (i = J.get(o, e)) || void 0 !== (i = X(o, e)) ? i : void 0;
                                this.each(function () {
                                    J.set(this, e, t);
                                });
                            },
                            null,
                            t,
                            1 < arguments.length,
                            null,
                            !0,
                        );
                },
                removeData: function (e) {
                    return this.each(function () {
                        J.remove(this, e);
                    });
                },
            }),
            w.extend({
                queue: function (e, t, i) {
                    var n;
                    if (e)
                        return (
                            (t = (t || 'fx') + 'queue'),
                            (n = G.get(e, t)),
                            i && (!n || Array.isArray(i) ? (n = G.access(e, t, w.makeArray(i))) : n.push(i)),
                            n || []
                        );
                },
                dequeue: function (e, t) {
                    t = t || 'fx';
                    var i = w.queue(e, t),
                        n = i.length,
                        r = i.shift(),
                        o = w._queueHooks(e, t);
                    'inprogress' === r && ((r = i.shift()), n--),
                        r &&
                        ('fx' === t && i.unshift('inprogress'),
                            delete o.stop,
                            r.call(
                                e,
                                function () {
                                    w.dequeue(e, t);
                                },
                                o,
                            )),
                        !n && o && o.empty.fire();
                },
                _queueHooks: function (e, t) {
                    var i = t + 'queueHooks';
                    return (
                        G.get(e, i) ||
                        G.access(e, i, {
                            empty: w.Callbacks('once memory').add(function () {
                                G.remove(e, [t + 'queue', i]);
                            }),
                        })
                    );
                },
            }),
            w.fn.extend({
                queue: function (e, t) {
                    var i = 2;
                    return (
                        'string' != typeof e && ((t = e), (e = 'fx'), i--),
                        arguments.length < i
                            ? w.queue(this[0], e)
                            : void 0 === t
                                ? this
                                : this.each(function () {
                                    var i = w.queue(this, e, t);
                                    w._queueHooks(this, e), 'fx' === e && 'inprogress' !== i[0] && w.dequeue(this, e);
                                })
                    );
                },
                dequeue: function (e) {
                    return this.each(function () {
                        w.dequeue(this, e);
                    });
                },
                clearQueue: function (e) {
                    return this.queue(e || 'fx', []);
                },
                promise: function (e, t) {
                    var i,
                        n = 1,
                        r = w.Deferred(),
                        o = this,
                        s = this.length,
                        a = function () {
                            --n || r.resolveWith(o, [o]);
                        };
                    for ('string' != typeof e && ((t = e), (e = void 0)), e = e || 'fx'; s--;)
                        (i = G.get(o[s], e + 'queueHooks')) && i.empty && (n++, i.empty.add(a));
                    return a(), r.promise(t);
                },
            });
        var ee = /[+-]?(?:\d*\.|)\d+(?:[eE][+-]?\d+|)/.source,
            te = new RegExp('^(?:([+-])=|)(' + ee + ')([a-z%]*)$', 'i'),
            ie = ['Top', 'Right', 'Bottom', 'Left'],
            ne = _.documentElement,
            re = function (e) {
                return w.contains(e.ownerDocument, e);
            },
            oe = { composed: !0 };
        ne.getRootNode &&
            (re = function (e) {
                return w.contains(e.ownerDocument, e) || e.getRootNode(oe) === e.ownerDocument;
            });
        var se = function (e, t) {
            return (
                'none' === (e = t || e).style.display ||
                ('' === e.style.display && re(e) && 'none' === w.css(e, 'display'))
            );
        };
        function ae(e, t, i, n) {
            var r,
                o,
                s = 20,
                a = n
                    ? function () {
                        return n.cur();
                    }
                    : function () {
                        return w.css(e, t, '');
                    },
                c = a(),
                l = (i && i[3]) || (w.cssNumber[t] ? '' : 'px'),
                p = e.nodeType && (w.cssNumber[t] || ('px' !== l && +c)) && te.exec(w.css(e, t));
            if (p && p[3] !== l) {
                for (c /= 2, l = l || p[3], p = +c || 1; s--;)
                    w.style(e, t, p + l), (1 - o) * (1 - (o = a() / c || 0.5)) <= 0 && (s = 0), (p /= o);
                (p *= 2), w.style(e, t, p + l), (i = i || []);
            }
            return (
                i &&
                ((p = +p || +c || 0),
                    (r = i[1] ? p + (i[1] + 1) * i[2] : +i[2]),
                    n && ((n.unit = l), (n.start = p), (n.end = r))),
                r
            );
        }
        var ce = {};
        function le(e, t) {
            for (var i, n, r, o, s, a, c, l = [], p = 0, d = e.length; p < d; p++)
                (n = e[p]).style &&
                    ((i = n.style.display),
                        t
                            ? ('none' === i &&
                                ((l[p] = G.get(n, 'display') || null), l[p] || (n.style.display = '')),
                                '' === n.style.display &&
                                se(n) &&
                                (l[p] =
                                    ((c = s = o = void 0),
                                        (s = (r = n).ownerDocument),
                                        (a = r.nodeName),
                                        (c = ce[a]) ||
                                        ((o = s.body.appendChild(s.createElement(a))),
                                            (c = w.css(o, 'display')),
                                            o.parentNode.removeChild(o),
                                            'none' === c && (c = 'block'),
                                            (ce[a] = c)))))
                            : 'none' !== i && ((l[p] = 'none'), G.set(n, 'display', i)));
            for (p = 0; p < d; p++) null != l[p] && (e[p].style.display = l[p]);
            return e;
        }
        w.fn.extend({
            show: function () {
                return le(this, !0);
            },
            hide: function () {
                return le(this);
            },
            toggle: function (e) {
                return 'boolean' == typeof e
                    ? e
                        ? this.show()
                        : this.hide()
                    : this.each(function () {
                        se(this) ? w(this).show() : w(this).hide();
                    });
            },
        });
        var pe,
            de,
            ue = /^(?:checkbox|radio)$/i,
            he = /<([a-z][^\/\0>\x20\t\r\n\f]*)/i,
            fe = /^$|^module$|\/(?:java|ecma)script/i;
        (pe = _.createDocumentFragment().appendChild(_.createElement('div'))),
            (de = _.createElement('input')).setAttribute('type', 'radio'),
            de.setAttribute('checked', 'checked'),
            de.setAttribute('name', 't'),
            pe.appendChild(de),
            (h.checkClone = pe.cloneNode(!0).cloneNode(!0).lastChild.checked),
            (pe.innerHTML = '<textarea>x</textarea>'),
            (h.noCloneChecked = !!pe.cloneNode(!0).lastChild.defaultValue),
            (pe.innerHTML = '<option></option>'),
            (h.option = !!pe.lastChild);
        var me = {
            thead: [1, '<table>', '</table>'],
            col: [2, '<table><colgroup>', '</colgroup></table>'],
            tr: [2, '<table><tbody>', '</tbody></table>'],
            td: [3, '<table><tbody><tr>', '</tr></tbody></table>'],
            _default: [0, '', ''],
        };
        function _e(e, t) {
            var i;
            return (
                (i =
                    void 0 !== e.getElementsByTagName
                        ? e.getElementsByTagName(t || '*')
                        : void 0 !== e.querySelectorAll
                            ? e.querySelectorAll(t || '*')
                            : []),
                void 0 === t || (t && j(e, t)) ? w.merge([e], i) : i
            );
        }
        function ge(e, t) {
            for (var i = 0, n = e.length; i < n; i++)
                G.set(e[i], 'globalEval', !t || G.get(t[i], 'globalEval'));
        }
        (me.tbody = me.tfoot = me.colgroup = me.caption = me.thead),
            (me.th = me.td),
            h.option || (me.optgroup = me.option = [1, "<select multiple='multiple'>", '</select>']);
        var ye = /<|&#?\w+;/;
        function ve(e, t, i, n, r) {
            for (
                var o, s, a, c, l, p, d = t.createDocumentFragment(), u = [], h = 0, f = e.length;
                h < f;
                h++
            )
                if ((o = e[h]) || 0 === o)
                    if ('object' === v(o)) w.merge(u, o.nodeType ? [o] : o);
                    else if (ye.test(o)) {
                        for (
                            s = s || d.appendChild(t.createElement('div')),
                            a = (he.exec(o) || ['', ''])[1].toLowerCase(),
                            c = me[a] || me._default,
                            s.innerHTML = c[1] + w.htmlPrefilter(o) + c[2],
                            p = c[0];
                            p--;

                        )
                            s = s.lastChild;
                        w.merge(u, s.childNodes), ((s = d.firstChild).textContent = '');
                    } else u.push(t.createTextNode(o));
            for (d.textContent = '', h = 0; (o = u[h++]);)
                if (n && -1 < w.inArray(o, n)) r && r.push(o);
                else if (((l = re(o)), (s = _e(d.appendChild(o), 'script')), l && ge(s), i))
                    for (p = 0; (o = s[p++]);) fe.test(o.type || '') && i.push(o);
            return d;
        }
        var be = /^key/,
            we = /^(?:mouse|pointer|contextmenu|drag|drop)|click/,
            ke = /^([^.]*)(?:\.(.+)|)/;
        function xe() {
            return !0;
        }
        function Se() {
            return !1;
        }
        function Ce(e, t) {
            return (
                (e ===
                    (function () {
                        try {
                            return _.activeElement;
                        } catch (e) { }
                    })()) ==
                ('focus' === t)
            );
        }
        function $e(e, t, i, n, r, o) {
            var s, a;
            if ('object' == typeof t) {
                for (a in ('string' != typeof i && ((n = n || i), (i = void 0)), t))
                    $e(e, a, i, n, t[a], o);
                return e;
            }
            if (
                (null == n && null == r
                    ? ((r = i), (n = i = void 0))
                    : null == r &&
                    ('string' == typeof i ? ((r = n), (n = void 0)) : ((r = n), (n = i), (i = void 0))),
                    !1 === r)
            )
                r = Se;
            else if (!r) return e;
            return (
                1 === o &&
                ((s = r),
                    ((r = function (e) {
                        return w().off(e), s.apply(this, arguments);
                    }).guid = s.guid || (s.guid = w.guid++))),
                e.each(function () {
                    w.event.add(this, t, r, n, i);
                })
            );
        }
        function je(e, t, i) {
            i
                ? (G.set(e, t, !1),
                    w.event.add(e, t, {
                        namespace: !1,
                        handler: function (e) {
                            var n,
                                o,
                                s = G.get(this, t);
                            if (1 & e.isTrigger && this[t]) {
                                if (s.length) (w.event.special[t] || {}).delegateType && e.stopPropagation();
                                else if (
                                    ((s = r.call(arguments)),
                                        G.set(this, t, s),
                                        (n = i(this, t)),
                                        this[t](),
                                        s !== (o = G.get(this, t)) || n ? G.set(this, t, !1) : (o = {}),
                                        s !== o)
                                )
                                    return e.stopImmediatePropagation(), e.preventDefault(), o.value;
                            } else
                                s.length &&
                                    (G.set(this, t, {
                                        value: w.event.trigger(w.extend(s[0], w.Event.prototype), s.slice(1), this),
                                    }),
                                        e.stopImmediatePropagation());
                        },
                    }))
                : void 0 === G.get(e, t) && w.event.add(e, t, xe);
        }
        (w.event = {
            global: {},
            add: function (e, t, i, n, r) {
                var o,
                    s,
                    a,
                    c,
                    l,
                    p,
                    d,
                    u,
                    h,
                    f,
                    m,
                    _ = G.get(e);
                if (Q(e))
                    for (
                        i.handler && ((i = (o = i).handler), (r = o.selector)),
                        r && w.find.matchesSelector(ne, r),
                        i.guid || (i.guid = w.guid++),
                        (c = _.events) || (c = _.events = Object.create(null)),
                        (s = _.handle) ||
                        (s = _.handle =
                            function (t) {
                                return void 0 !== w && w.event.triggered !== t.type
                                    ? w.event.dispatch.apply(e, arguments)
                                    : void 0;
                            }),
                        l = (t = (t || '').match(M) || ['']).length;
                        l--;

                    )
                        (h = m = (a = ke.exec(t[l]) || [])[1]),
                            (f = (a[2] || '').split('.').sort()),
                            h &&
                            ((d = w.event.special[h] || {}),
                                (h = (r ? d.delegateType : d.bindType) || h),
                                (d = w.event.special[h] || {}),
                                (p = w.extend(
                                    {
                                        type: h,
                                        origType: m,
                                        data: n,
                                        handler: i,
                                        guid: i.guid,
                                        selector: r,
                                        needsContext: r && w.expr.match.needsContext.test(r),
                                        namespace: f.join('.'),
                                    },
                                    o,
                                )),
                                (u = c[h]) ||
                                (((u = c[h] = []).delegateCount = 0),
                                    (d.setup && !1 !== d.setup.call(e, n, f, s)) ||
                                    (e.addEventListener && e.addEventListener(h, s))),
                                d.add && (d.add.call(e, p), p.handler.guid || (p.handler.guid = i.guid)),
                                r ? u.splice(u.delegateCount++, 0, p) : u.push(p),
                                (w.event.global[h] = !0));
            },
            remove: function (e, t, i, n, r) {
                var o,
                    s,
                    a,
                    c,
                    l,
                    p,
                    d,
                    u,
                    h,
                    f,
                    m,
                    _ = G.hasData(e) && G.get(e);
                if (_ && (c = _.events)) {
                    for (l = (t = (t || '').match(M) || ['']).length; l--;)
                        if (((h = m = (a = ke.exec(t[l]) || [])[1]), (f = (a[2] || '').split('.').sort()), h)) {
                            for (
                                d = w.event.special[h] || {},
                                u = c[(h = (n ? d.delegateType : d.bindType) || h)] || [],
                                a = a[2] && new RegExp('(^|\\.)' + f.join('\\.(?:.*\\.|)') + '(\\.|$)'),
                                s = o = u.length;
                                o--;

                            )
                                (p = u[o]),
                                    (!r && m !== p.origType) ||
                                    (i && i.guid !== p.guid) ||
                                    (a && !a.test(p.namespace)) ||
                                    (n && n !== p.selector && ('**' !== n || !p.selector)) ||
                                    (u.splice(o, 1),
                                        p.selector && u.delegateCount--,
                                        d.remove && d.remove.call(e, p));
                            s &&
                                !u.length &&
                                ((d.teardown && !1 !== d.teardown.call(e, f, _.handle)) ||
                                    w.removeEvent(e, h, _.handle),
                                    delete c[h]);
                        } else for (h in c) w.event.remove(e, h + t[l], i, n, !0);
                    w.isEmptyObject(c) && G.remove(e, 'handle events');
                }
            },
            dispatch: function (e) {
                var t,
                    i,
                    n,
                    r,
                    o,
                    s,
                    a = new Array(arguments.length),
                    c = w.event.fix(e),
                    l = (G.get(this, 'events') || Object.create(null))[c.type] || [],
                    p = w.event.special[c.type] || {};
                for (a[0] = c, t = 1; t < arguments.length; t++) a[t] = arguments[t];
                if (((c.delegateTarget = this), !p.preDispatch || !1 !== p.preDispatch.call(this, c))) {
                    for (
                        s = w.event.handlers.call(this, c, l), t = 0;
                        (r = s[t++]) && !c.isPropagationStopped();

                    )
                        for (
                            c.currentTarget = r.elem, i = 0;
                            (o = r.handlers[i++]) && !c.isImmediatePropagationStopped();

                        )
                            (c.rnamespace && !1 !== o.namespace && !c.rnamespace.test(o.namespace)) ||
                                ((c.handleObj = o),
                                    (c.data = o.data),
                                    void 0 !==
                                    (n = ((w.event.special[o.origType] || {}).handle || o.handler).apply(
                                        r.elem,
                                        a,
                                    )) &&
                                    !1 === (c.result = n) &&
                                    (c.preventDefault(), c.stopPropagation()));
                    return p.postDispatch && p.postDispatch.call(this, c), c.result;
                }
            },
            handlers: function (e, t) {
                var i,
                    n,
                    r,
                    o,
                    s,
                    a = [],
                    c = t.delegateCount,
                    l = e.target;
                if (c && l.nodeType && !('click' === e.type && 1 <= e.button))
                    for (; l !== this; l = l.parentNode || this)
                        if (1 === l.nodeType && ('click' !== e.type || !0 !== l.disabled)) {
                            for (o = [], s = {}, i = 0; i < c; i++)
                                void 0 === s[(r = (n = t[i]).selector + ' ')] &&
                                    (s[r] = n.needsContext
                                        ? -1 < w(r, this).index(l)
                                        : w.find(r, this, null, [l]).length),
                                    s[r] && o.push(n);
                            o.length && a.push({ elem: l, handlers: o });
                        }
                return (l = this), c < t.length && a.push({ elem: l, handlers: t.slice(c) }), a;
            },
            addProp: function (e, t) {
                Object.defineProperty(w.Event.prototype, e, {
                    enumerable: !0,
                    configurable: !0,
                    get: f(t)
                        ? function () {
                            if (this.originalEvent) return t(this.originalEvent);
                        }
                        : function () {
                            if (this.originalEvent) return this.originalEvent[e];
                        },
                    set: function (t) {
                        Object.defineProperty(this, e, {
                            enumerable: !0,
                            configurable: !0,
                            writable: !0,
                            value: t,
                        });
                    },
                });
            },
            fix: function (e) {
                return e[w.expando] ? e : new w.Event(e);
            },
            special: {
                load: { noBubble: !0 },
                click: {
                    setup: function (e) {
                        var t = this || e;
                        return ue.test(t.type) && t.click && j(t, 'input') && je(t, 'click', xe), !1;
                    },
                    trigger: function (e) {
                        var t = this || e;
                        return ue.test(t.type) && t.click && j(t, 'input') && je(t, 'click'), !0;
                    },
                    _default: function (e) {
                        var t = e.target;
                        return (ue.test(t.type) && t.click && j(t, 'input') && G.get(t, 'click')) || j(t, 'a');
                    },
                },
                beforeunload: {
                    postDispatch: function (e) {
                        void 0 !== e.result && e.originalEvent && (e.originalEvent.returnValue = e.result);
                    },
                },
            },
        }),
            (w.removeEvent = function (e, t, i) {
                e.removeEventListener && e.removeEventListener(t, i);
            }),
            (w.Event = function (e, t) {
                if (!(this instanceof w.Event)) return new w.Event(e, t);
                e && e.type
                    ? ((this.originalEvent = e),
                        (this.type = e.type),
                        (this.isDefaultPrevented =
                            e.defaultPrevented || (void 0 === e.defaultPrevented && !1 === e.returnValue)
                                ? xe
                                : Se),
                        (this.target = e.target && 3 === e.target.nodeType ? e.target.parentNode : e.target),
                        (this.currentTarget = e.currentTarget),
                        (this.relatedTarget = e.relatedTarget))
                    : (this.type = e),
                    t && w.extend(this, t),
                    (this.timeStamp = (e && e.timeStamp) || Date.now()),
                    (this[w.expando] = !0);
            }),
            (w.Event.prototype = {
                constructor: w.Event,
                isDefaultPrevented: Se,
                isPropagationStopped: Se,
                isImmediatePropagationStopped: Se,
                isSimulated: !1,
                preventDefault: function () {
                    var e = this.originalEvent;
                    (this.isDefaultPrevented = xe), e && !this.isSimulated && e.preventDefault();
                },
                stopPropagation: function () {
                    var e = this.originalEvent;
                    (this.isPropagationStopped = xe), e && !this.isSimulated && e.stopPropagation();
                },
                stopImmediatePropagation: function () {
                    var e = this.originalEvent;
                    (this.isImmediatePropagationStopped = xe),
                        e && !this.isSimulated && e.stopImmediatePropagation(),
                        this.stopPropagation();
                },
            }),
            w.each(
                {
                    altKey: !0,
                    bubbles: !0,
                    cancelable: !0,
                    changedTouches: !0,
                    ctrlKey: !0,
                    detail: !0,
                    eventPhase: !0,
                    metaKey: !0,
                    pageX: !0,
                    pageY: !0,
                    shiftKey: !0,
                    view: !0,
                    char: !0,
                    code: !0,
                    charCode: !0,
                    key: !0,
                    keyCode: !0,
                    button: !0,
                    buttons: !0,
                    clientX: !0,
                    clientY: !0,
                    offsetX: !0,
                    offsetY: !0,
                    pointerId: !0,
                    pointerType: !0,
                    screenX: !0,
                    screenY: !0,
                    targetTouches: !0,
                    toElement: !0,
                    touches: !0,
                    which: function (e) {
                        var t = e.button;
                        return null == e.which && be.test(e.type)
                            ? null != e.charCode
                                ? e.charCode
                                : e.keyCode
                            : !e.which && void 0 !== t && we.test(e.type)
                                ? 1 & t
                                    ? 1
                                    : 2 & t
                                        ? 3
                                        : 4 & t
                                            ? 2
                                            : 0
                                : e.which;
                    },
                },
                w.event.addProp,
            ),
            w.each({ focus: 'focusin', blur: 'focusout' }, function (e, t) {
                w.event.special[e] = {
                    setup: function () {
                        return je(this, e, Ce), !1;
                    },
                    trigger: function () {
                        return je(this, e), !0;
                    },
                    delegateType: t,
                };
            }),
            w.each(
                {
                    mouseenter: 'mouseover',
                    mouseleave: 'mouseout',
                    pointerenter: 'pointerover',
                    pointerleave: 'pointerout',
                },
                function (e, t) {
                    w.event.special[e] = {
                        delegateType: t,
                        bindType: t,
                        handle: function (e) {
                            var i,
                                n = e.relatedTarget,
                                r = e.handleObj;
                            return (
                                (n && (n === this || w.contains(this, n))) ||
                                ((e.type = r.origType), (i = r.handler.apply(this, arguments)), (e.type = t)),
                                i
                            );
                        },
                    };
                },
            ),
            w.fn.extend({
                on: function (e, t, i, n) {
                    return $e(this, e, t, i, n);
                },
                one: function (e, t, i, n) {
                    return $e(this, e, t, i, n, 1);
                },
                off: function (e, t, i) {
                    var n, r;
                    if (e && e.preventDefault && e.handleObj)
                        return (
                            (n = e.handleObj),
                            w(e.delegateTarget).off(
                                n.namespace ? n.origType + '.' + n.namespace : n.origType,
                                n.selector,
                                n.handler,
                            ),
                            this
                        );
                    if ('object' == typeof e) {
                        for (r in e) this.off(r, t, e[r]);
                        return this;
                    }
                    return (
                        (!1 !== t && 'function' != typeof t) || ((i = t), (t = void 0)),
                        !1 === i && (i = Se),
                        this.each(function () {
                            w.event.remove(this, e, i, t);
                        })
                    );
                },
            });
        var Te = /<script|<style|<link/i,
            ze = /checked\s*(?:[^=]|=\s*.checked.)/i,
            De = /^\s*<!(?:\[CDATA\[|--)|(?:\]\]|--)>\s*$/g;
        function Ae(e, t) {
            return (
                (j(e, 'table') &&
                    j(11 !== t.nodeType ? t : t.firstChild, 'tr') &&
                    w(e).children('tbody')[0]) ||
                e
            );
        }
        function Ee(e) {
            return (e.type = (null !== e.getAttribute('type')) + '/' + e.type), e;
        }
        function Le(e) {
            return (
                'true/' === (e.type || '').slice(0, 5)
                    ? (e.type = e.type.slice(5))
                    : e.removeAttribute('type'),
                e
            );
        }
        function Oe(e, t) {
            var i, n, r, o, s, a;
            if (1 === t.nodeType) {
                if (G.hasData(e) && (a = G.get(e).events))
                    for (r in (G.remove(t, 'handle events'), a))
                        for (i = 0, n = a[r].length; i < n; i++) w.event.add(t, r, a[r][i]);
                J.hasData(e) && ((o = J.access(e)), (s = w.extend({}, o)), J.set(t, s));
            }
        }
        function Me(e, t, i, n) {
            t = o(t);
            var r,
                s,
                a,
                c,
                l,
                p,
                d = 0,
                u = e.length,
                m = u - 1,
                _ = t[0],
                g = f(_);
            if (g || (1 < u && 'string' == typeof _ && !h.checkClone && ze.test(_)))
                return e.each(function (r) {
                    var o = e.eq(r);
                    g && (t[0] = _.call(this, r, o.html())), Me(o, t, i, n);
                });
            if (
                u &&
                ((s = (r = ve(t, e[0].ownerDocument, !1, e, n)).firstChild),
                    1 === r.childNodes.length && (r = s),
                    s || n)
            ) {
                for (c = (a = w.map(_e(r, 'script'), Ee)).length; d < u; d++)
                    (l = r),
                        d !== m && ((l = w.clone(l, !0, !0)), c && w.merge(a, _e(l, 'script'))),
                        i.call(e[d], l, d);
                if (c)
                    for (p = a[a.length - 1].ownerDocument, w.map(a, Le), d = 0; d < c; d++)
                        (l = a[d]),
                            fe.test(l.type || '') &&
                            !G.access(l, 'globalEval') &&
                            w.contains(p, l) &&
                            (l.src && 'module' !== (l.type || '').toLowerCase()
                                ? w._evalUrl &&
                                !l.noModule &&
                                w._evalUrl(l.src, { nonce: l.nonce || l.getAttribute('nonce') }, p)
                                : y(l.textContent.replace(De, ''), l, p));
            }
            return e;
        }
        function qe(e, t, i) {
            for (var n, r = t ? w.filter(t, e) : e, o = 0; null != (n = r[o]); o++)
                i || 1 !== n.nodeType || w.cleanData(_e(n)),
                    n.parentNode && (i && re(n) && ge(_e(n, 'script')), n.parentNode.removeChild(n));
            return e;
        }
        w.extend({
            htmlPrefilter: function (e) {
                return e;
            },
            clone: function (e, t, i) {
                var n,
                    r,
                    o,
                    s,
                    a,
                    c,
                    l,
                    p = e.cloneNode(!0),
                    d = re(e);
                if (!(h.noCloneChecked || (1 !== e.nodeType && 11 !== e.nodeType) || w.isXMLDoc(e)))
                    for (s = _e(p), n = 0, r = (o = _e(e)).length; n < r; n++)
                        (a = o[n]),
                            'input' === (l = (c = s[n]).nodeName.toLowerCase()) && ue.test(a.type)
                                ? (c.checked = a.checked)
                                : ('input' !== l && 'textarea' !== l) || (c.defaultValue = a.defaultValue);
                if (t)
                    if (i)
                        for (o = o || _e(e), s = s || _e(p), n = 0, r = o.length; n < r; n++) Oe(o[n], s[n]);
                    else Oe(e, p);
                return 0 < (s = _e(p, 'script')).length && ge(s, !d && _e(e, 'script')), p;
            },
            cleanData: function (e) {
                for (var t, i, n, r = w.event.special, o = 0; void 0 !== (i = e[o]); o++)
                    if (Q(i)) {
                        if ((t = i[G.expando])) {
                            if (t.events)
                                for (n in t.events) r[n] ? w.event.remove(i, n) : w.removeEvent(i, n, t.handle);
                            i[G.expando] = void 0;
                        }
                        i[J.expando] && (i[J.expando] = void 0);
                    }
            },
        }),
            w.fn.extend({
                detach: function (e) {
                    return qe(this, e, !0);
                },
                remove: function (e) {
                    return qe(this, e);
                },
                text: function (e) {
                    return B(
                        this,
                        function (e) {
                            return void 0 === e
                                ? w.text(this)
                                : this.empty().each(function () {
                                    (1 !== this.nodeType && 11 !== this.nodeType && 9 !== this.nodeType) ||
                                        (this.textContent = e);
                                });
                        },
                        null,
                        e,
                        arguments.length,
                    );
                },
                append: function () {
                    return Me(this, arguments, function (e) {
                        (1 !== this.nodeType && 11 !== this.nodeType && 9 !== this.nodeType) ||
                            Ae(this, e).appendChild(e);
                    });
                },
                prepend: function () {
                    return Me(this, arguments, function (e) {
                        if (1 === this.nodeType || 11 === this.nodeType || 9 === this.nodeType) {
                            var t = Ae(this, e);
                            t.insertBefore(e, t.firstChild);
                        }
                    });
                },
                before: function () {
                    return Me(this, arguments, function (e) {
                        this.parentNode && this.parentNode.insertBefore(e, this);
                    });
                },
                after: function () {
                    return Me(this, arguments, function (e) {
                        this.parentNode && this.parentNode.insertBefore(e, this.nextSibling);
                    });
                },
                empty: function () {
                    for (var e, t = 0; null != (e = this[t]); t++)
                        1 === e.nodeType && (w.cleanData(_e(e, !1)), (e.textContent = ''));
                    return this;
                },
                clone: function (e, t) {
                    return (
                        (e = null != e && e),
                        (t = null == t ? e : t),
                        this.map(function () {
                            return w.clone(this, e, t);
                        })
                    );
                },
                html: function (e) {
                    return B(
                        this,
                        function (e) {
                            var t = this[0] || {},
                                i = 0,
                                n = this.length;
                            if (void 0 === e && 1 === t.nodeType) return t.innerHTML;
                            if (
                                'string' == typeof e &&
                                !Te.test(e) &&
                                !me[(he.exec(e) || ['', ''])[1].toLowerCase()]
                            ) {
                                e = w.htmlPrefilter(e);
                                try {
                                    for (; i < n; i++)
                                        1 === (t = this[i] || {}).nodeType &&
                                            (w.cleanData(_e(t, !1)), (t.innerHTML = e));
                                    t = 0;
                                } catch (e) { }
                            }
                            t && this.empty().append(e);
                        },
                        null,
                        e,
                        arguments.length,
                    );
                },
                replaceWith: function () {
                    var e = [];
                    return Me(
                        this,
                        arguments,
                        function (t) {
                            var i = this.parentNode;
                            w.inArray(this, e) < 0 && (w.cleanData(_e(this)), i && i.replaceChild(t, this));
                        },
                        e,
                    );
                },
            }),
            w.each(
                {
                    appendTo: 'append',
                    prependTo: 'prepend',
                    insertBefore: 'before',
                    insertAfter: 'after',
                    replaceAll: 'replaceWith',
                },
                function (e, t) {
                    w.fn[e] = function (e) {
                        for (var i, n = [], r = w(e), o = r.length - 1, a = 0; a <= o; a++)
                            (i = a === o ? this : this.clone(!0)), w(r[a])[t](i), s.apply(n, i.get());
                        return this.pushStack(n);
                    };
                },
            );
        var Pe = new RegExp('^(' + ee + ')(?!px)[a-z%]+$', 'i'),
            Ie = function (t) {
                var i = t.ownerDocument.defaultView;
                return (i && i.opener) || (i = e), i.getComputedStyle(t);
            },
            Ne = function (e, t, i) {
                var n,
                    r,
                    o = {};
                for (r in t) (o[r] = e.style[r]), (e.style[r] = t[r]);
                for (r in ((n = i.call(e)), t)) e.style[r] = o[r];
                return n;
            },
            He = new RegExp(ie.join('|'), 'i');
        function Fe(e, t, i) {
            var n,
                r,
                o,
                s,
                a = e.style;
            return (
                (i = i || Ie(e)) &&
                ('' !== (s = i.getPropertyValue(t) || i[t]) || re(e) || (s = w.style(e, t)),
                    !h.pixelBoxStyles() &&
                    Pe.test(s) &&
                    He.test(t) &&
                    ((n = a.width),
                        (r = a.minWidth),
                        (o = a.maxWidth),
                        (a.minWidth = a.maxWidth = a.width = s),
                        (s = i.width),
                        (a.width = n),
                        (a.minWidth = r),
                        (a.maxWidth = o))),
                void 0 !== s ? s + '' : s
            );
        }
        function Be(e, t) {
            return {
                get: function () {
                    if (!e()) return (this.get = t).apply(this, arguments);
                    delete this.get;
                },
            };
        }
        !(function () {
            function t() {
                if (p) {
                    (l.style.cssText =
                        'position:absolute;left:-11111px;width:60px;margin-top:1px;padding:0;border:0'),
                        (p.style.cssText =
                            'position:relative;display:block;box-sizing:border-box;overflow:scroll;margin:auto;border:1px;padding:1px;width:60%;top:1%'),
                        ne.appendChild(l).appendChild(p);
                    var t = e.getComputedStyle(p);
                    (n = '1%' !== t.top),
                        (c = 12 === i(t.marginLeft)),
                        (p.style.right = '60%'),
                        (s = 36 === i(t.right)),
                        (r = 36 === i(t.width)),
                        (p.style.position = 'absolute'),
                        (o = 12 === i(p.offsetWidth / 3)),
                        ne.removeChild(l),
                        (p = null);
                }
            }
            function i(e) {
                return Math.round(parseFloat(e));
            }
            var n,
                r,
                o,
                s,
                a,
                c,
                l = _.createElement('div'),
                p = _.createElement('div');
            p.style &&
                ((p.style.backgroundClip = 'content-box'),
                    (p.cloneNode(!0).style.backgroundClip = ''),
                    (h.clearCloneStyle = 'content-box' === p.style.backgroundClip),
                    w.extend(h, {
                        boxSizingReliable: function () {
                            return t(), r;
                        },
                        pixelBoxStyles: function () {
                            return t(), s;
                        },
                        pixelPosition: function () {
                            return t(), n;
                        },
                        reliableMarginLeft: function () {
                            return t(), c;
                        },
                        scrollboxSize: function () {
                            return t(), o;
                        },
                        reliableTrDimensions: function () {
                            var t, i, n, r;
                            return (
                                null == a &&
                                ((t = _.createElement('table')),
                                    (i = _.createElement('tr')),
                                    (n = _.createElement('div')),
                                    (t.style.cssText = 'position:absolute;left:-11111px'),
                                    (i.style.height = '1px'),
                                    (n.style.height = '9px'),
                                    ne.appendChild(t).appendChild(i).appendChild(n),
                                    (r = e.getComputedStyle(i)),
                                    (a = 3 < parseInt(r.height)),
                                    ne.removeChild(t)),
                                a
                            );
                        },
                    }));
        })();
        var Re = ['Webkit', 'Moz', 'ms'],
            We = _.createElement('div').style,
            Ye = {};
        function Ue(e) {
            return (
                w.cssProps[e] ||
                Ye[e] ||
                (e in We
                    ? e
                    : (Ye[e] =
                        (function (e) {
                            for (var t = e[0].toUpperCase() + e.slice(1), i = Re.length; i--;)
                                if ((e = Re[i] + t) in We) return e;
                        })(e) || e))
            );
        }
        var Qe = /^(none|table(?!-c[ea]).+)/,
            Ve = /^--/,
            Ge = { position: 'absolute', visibility: 'hidden', display: 'block' },
            Je = { letterSpacing: '0', fontWeight: '400' };
        function Ze(e, t, i) {
            var n = te.exec(t);
            return n ? Math.max(0, n[2] - (i || 0)) + (n[3] || 'px') : t;
        }
        function Ke(e, t, i, n, r, o) {
            var s = 'width' === t ? 1 : 0,
                a = 0,
                c = 0;
            if (i === (n ? 'border' : 'content')) return 0;
            for (; s < 4; s += 2)
                'margin' === i && (c += w.css(e, i + ie[s], !0, r)),
                    n
                        ? ('content' === i && (c -= w.css(e, 'padding' + ie[s], !0, r)),
                            'margin' !== i && (c -= w.css(e, 'border' + ie[s] + 'Width', !0, r)))
                        : ((c += w.css(e, 'padding' + ie[s], !0, r)),
                            'padding' !== i
                                ? (c += w.css(e, 'border' + ie[s] + 'Width', !0, r))
                                : (a += w.css(e, 'border' + ie[s] + 'Width', !0, r)));
            return (
                !n &&
                0 <= o &&
                (c +=
                    Math.max(
                        0,
                        Math.ceil(e['offset' + t[0].toUpperCase() + t.slice(1)] - o - c - a - 0.5),
                    ) || 0),
                c
            );
        }
        function Xe(e, t, i) {
            var n = Ie(e),
                r = (!h.boxSizingReliable() || i) && 'border-box' === w.css(e, 'boxSizing', !1, n),
                o = r,
                s = Fe(e, t, n),
                a = 'offset' + t[0].toUpperCase() + t.slice(1);
            if (Pe.test(s)) {
                if (!i) return s;
                s = 'auto';
            }
            return (
                ((!h.boxSizingReliable() && r) ||
                    (!h.reliableTrDimensions() && j(e, 'tr')) ||
                    'auto' === s ||
                    (!parseFloat(s) && 'inline' === w.css(e, 'display', !1, n))) &&
                e.getClientRects().length &&
                ((r = 'border-box' === w.css(e, 'boxSizing', !1, n)), (o = a in e) && (s = e[a])),
                (s = parseFloat(s) || 0) + Ke(e, t, i || (r ? 'border' : 'content'), o, n, s) + 'px'
            );
        }
        function et(e, t, i, n, r) {
            return new et.prototype.init(e, t, i, n, r);
        }
        w.extend({
            cssHooks: {
                opacity: {
                    get: function (e, t) {
                        if (t) {
                            var i = Fe(e, 'opacity');
                            return '' === i ? '1' : i;
                        }
                    },
                },
            },
            cssNumber: {
                animationIterationCount: !0,
                columnCount: !0,
                fillOpacity: !0,
                flexGrow: !0,
                flexShrink: !0,
                fontWeight: !0,
                gridArea: !0,
                gridColumn: !0,
                gridColumnEnd: !0,
                gridColumnStart: !0,
                gridRow: !0,
                gridRowEnd: !0,
                gridRowStart: !0,
                lineHeight: !0,
                opacity: !0,
                order: !0,
                orphans: !0,
                widows: !0,
                zIndex: !0,
                zoom: !0,
            },
            cssProps: {},
            style: function (e, t, i, n) {
                if (e && 3 !== e.nodeType && 8 !== e.nodeType && e.style) {
                    var r,
                        o,
                        s,
                        a = U(t),
                        c = Ve.test(t),
                        l = e.style;
                    if ((c || (t = Ue(a)), (s = w.cssHooks[t] || w.cssHooks[a]), void 0 === i))
                        return s && 'get' in s && void 0 !== (r = s.get(e, !1, n)) ? r : l[t];
                    'string' == (o = typeof i) &&
                        (r = te.exec(i)) &&
                        r[1] &&
                        ((i = ae(e, t, r)), (o = 'number')),
                        null != i &&
                        i == i &&
                        ('number' !== o || c || (i += (r && r[3]) || (w.cssNumber[a] ? '' : 'px')),
                            h.clearCloneStyle || '' !== i || 0 !== t.indexOf('background') || (l[t] = 'inherit'),
                            (s && 'set' in s && void 0 === (i = s.set(e, i, n))) ||
                            (c ? l.setProperty(t, i) : (l[t] = i)));
                }
            },
            css: function (e, t, i, n) {
                var r,
                    o,
                    s,
                    a = U(t);
                return (
                    Ve.test(t) || (t = Ue(a)),
                    (s = w.cssHooks[t] || w.cssHooks[a]) && 'get' in s && (r = s.get(e, !0, i)),
                    void 0 === r && (r = Fe(e, t, n)),
                    'normal' === r && t in Je && (r = Je[t]),
                    '' === i || i ? ((o = parseFloat(r)), !0 === i || isFinite(o) ? o || 0 : r) : r
                );
            },
        }),
            w.each(['height', 'width'], function (e, t) {
                w.cssHooks[t] = {
                    get: function (e, i, n) {
                        if (i)
                            return !Qe.test(w.css(e, 'display')) ||
                                (e.getClientRects().length && e.getBoundingClientRect().width)
                                ? Xe(e, t, n)
                                : Ne(e, Ge, function () {
                                    return Xe(e, t, n);
                                });
                    },
                    set: function (e, i, n) {
                        var r,
                            o = Ie(e),
                            s = !h.scrollboxSize() && 'absolute' === o.position,
                            a = (s || n) && 'border-box' === w.css(e, 'boxSizing', !1, o),
                            c = n ? Ke(e, t, n, a, o) : 0;
                        return (
                            a &&
                            s &&
                            (c -= Math.ceil(
                                e['offset' + t[0].toUpperCase() + t.slice(1)] -
                                parseFloat(o[t]) -
                                Ke(e, t, 'border', !1, o) -
                                0.5,
                            )),
                            c &&
                            (r = te.exec(i)) &&
                            'px' !== (r[3] || 'px') &&
                            ((e.style[t] = i), (i = w.css(e, t))),
                            Ze(0, i, c)
                        );
                    },
                };
            }),
            (w.cssHooks.marginLeft = Be(h.reliableMarginLeft, function (e, t) {
                if (t)
                    return (
                        (parseFloat(Fe(e, 'marginLeft')) ||
                            e.getBoundingClientRect().left -
                            Ne(e, { marginLeft: 0 }, function () {
                                return e.getBoundingClientRect().left;
                            })) + 'px'
                    );
            })),
            w.each({ margin: '', padding: '', border: 'Width' }, function (e, t) {
                (w.cssHooks[e + t] = {
                    expand: function (i) {
                        for (var n = 0, r = {}, o = 'string' == typeof i ? i.split(' ') : [i]; n < 4; n++)
                            r[e + ie[n] + t] = o[n] || o[n - 2] || o[0];
                        return r;
                    },
                }),
                    'margin' !== e && (w.cssHooks[e + t].set = Ze);
            }),
            w.fn.extend({
                css: function (e, t) {
                    return B(
                        this,
                        function (e, t, i) {
                            var n,
                                r,
                                o = {},
                                s = 0;
                            if (Array.isArray(t)) {
                                for (n = Ie(e), r = t.length; s < r; s++) o[t[s]] = w.css(e, t[s], !1, n);
                                return o;
                            }
                            return void 0 !== i ? w.style(e, t, i) : w.css(e, t);
                        },
                        e,
                        t,
                        1 < arguments.length,
                    );
                },
            }),
            (((w.Tween = et).prototype = {
                constructor: et,
                init: function (e, t, i, n, r, o) {
                    (this.elem = e),
                        (this.prop = i),
                        (this.easing = r || w.easing._default),
                        (this.options = t),
                        (this.start = this.now = this.cur()),
                        (this.end = n),
                        (this.unit = o || (w.cssNumber[i] ? '' : 'px'));
                },
                cur: function () {
                    var e = et.propHooks[this.prop];
                    return e && e.get ? e.get(this) : et.propHooks._default.get(this);
                },
                run: function (e) {
                    var t,
                        i = et.propHooks[this.prop];
                    return (
                        this.options.duration
                            ? (this.pos = t =
                                w.easing[this.easing](e, this.options.duration * e, 0, 1, this.options.duration))
                            : (this.pos = t = e),
                        (this.now = (this.end - this.start) * t + this.start),
                        this.options.step && this.options.step.call(this.elem, this.now, this),
                        i && i.set ? i.set(this) : et.propHooks._default.set(this),
                        this
                    );
                },
            }).init.prototype = et.prototype),
            ((et.propHooks = {
                _default: {
                    get: function (e) {
                        var t;
                        return 1 !== e.elem.nodeType || (null != e.elem[e.prop] && null == e.elem.style[e.prop])
                            ? e.elem[e.prop]
                            : (t = w.css(e.elem, e.prop, '')) && 'auto' !== t
                                ? t
                                : 0;
                    },
                    set: function (e) {
                        w.fx.step[e.prop]
                            ? w.fx.step[e.prop](e)
                            : 1 !== e.elem.nodeType || (!w.cssHooks[e.prop] && null == e.elem.style[Ue(e.prop)])
                                ? (e.elem[e.prop] = e.now)
                                : w.style(e.elem, e.prop, e.now + e.unit);
                    },
                },
            }).scrollTop = et.propHooks.scrollLeft =
                {
                    set: function (e) {
                        e.elem.nodeType && e.elem.parentNode && (e.elem[e.prop] = e.now);
                    },
                }),
            (w.easing = {
                linear: function (e) {
                    return e;
                },
                swing: function (e) {
                    return 0.5 - Math.cos(e * Math.PI) / 2;
                },
                _default: 'swing',
            }),
            (w.fx = et.prototype.init),
            (w.fx.step = {});
        var tt,
            it,
            nt,
            rt,
            ot = /^(?:toggle|show|hide)$/,
            st = /queueHooks$/;
        function at() {
            it &&
                (!1 === _.hidden && e.requestAnimationFrame
                    ? e.requestAnimationFrame(at)
                    : e.setTimeout(at, w.fx.interval),
                    w.fx.tick());
        }
        function ct() {
            return (
                e.setTimeout(function () {
                    tt = void 0;
                }),
                (tt = Date.now())
            );
        }
        function lt(e, t) {
            var i,
                n = 0,
                r = { height: e };
            for (t = t ? 1 : 0; n < 4; n += 2 - t) r['margin' + (i = ie[n])] = r['padding' + i] = e;
            return t && (r.opacity = r.width = e), r;
        }
        function pt(e, t, i) {
            for (
                var n, r = (dt.tweeners[t] || []).concat(dt.tweeners['*']), o = 0, s = r.length;
                o < s;
                o++
            )
                if ((n = r[o].call(i, t, e))) return n;
        }
        function dt(e, t, i) {
            var n,
                r,
                o = 0,
                s = dt.prefilters.length,
                a = w.Deferred().always(function () {
                    delete c.elem;
                }),
                c = function () {
                    if (r) return !1;
                    for (
                        var t = tt || ct(),
                        i = Math.max(0, l.startTime + l.duration - t),
                        n = 1 - (i / l.duration || 0),
                        o = 0,
                        s = l.tweens.length;
                        o < s;
                        o++
                    )
                        l.tweens[o].run(n);
                    return (
                        a.notifyWith(e, [l, n, i]),
                        n < 1 && s ? i : (s || a.notifyWith(e, [l, 1, 0]), a.resolveWith(e, [l]), !1)
                    );
                },
                l = a.promise({
                    elem: e,
                    props: w.extend({}, t),
                    opts: w.extend(!0, { specialEasing: {}, easing: w.easing._default }, i),
                    originalProperties: t,
                    originalOptions: i,
                    startTime: tt || ct(),
                    duration: i.duration,
                    tweens: [],
                    createTween: function (t, i) {
                        var n = w.Tween(e, l.opts, t, i, l.opts.specialEasing[t] || l.opts.easing);
                        return l.tweens.push(n), n;
                    },
                    stop: function (t) {
                        var i = 0,
                            n = t ? l.tweens.length : 0;
                        if (r) return this;
                        for (r = !0; i < n; i++) l.tweens[i].run(1);
                        return (
                            t ? (a.notifyWith(e, [l, 1, 0]), a.resolveWith(e, [l, t])) : a.rejectWith(e, [l, t]),
                            this
                        );
                    },
                }),
                p = l.props;
            for (
                (function (e, t) {
                    var i, n, r, o, s;
                    for (i in e)
                        if (
                            ((r = t[(n = U(i))]),
                                (o = e[i]),
                                Array.isArray(o) && ((r = o[1]), (o = e[i] = o[0])),
                                i !== n && ((e[n] = o), delete e[i]),
                                (s = w.cssHooks[n]) && ('expand' in s))
                        )
                            for (i in ((o = s.expand(o)), delete e[n], o))
                                (i in e) || ((e[i] = o[i]), (t[i] = r));
                        else t[n] = r;
                })(p, l.opts.specialEasing);
                o < s;
                o++
            )
                if ((n = dt.prefilters[o].call(l, e, p, l.opts)))
                    return f(n.stop) && (w._queueHooks(l.elem, l.opts.queue).stop = n.stop.bind(n)), n;
            return (
                w.map(p, pt, l),
                f(l.opts.start) && l.opts.start.call(e, l),
                l
                    .progress(l.opts.progress)
                    .done(l.opts.done, l.opts.complete)
                    .fail(l.opts.fail)
                    .always(l.opts.always),
                w.fx.timer(w.extend(c, { elem: e, anim: l, queue: l.opts.queue })),
                l
            );
        }
        (w.Animation = w.extend(dt, {
            tweeners: {
                '*': [
                    function (e, t) {
                        var i = this.createTween(e, t);
                        return ae(i.elem, e, te.exec(t), i), i;
                    },
                ],
            },
            tweener: function (e, t) {
                f(e) ? ((t = e), (e = ['*'])) : (e = e.match(M));
                for (var i, n = 0, r = e.length; n < r; n++)
                    (i = e[n]), (dt.tweeners[i] = dt.tweeners[i] || []), dt.tweeners[i].unshift(t);
            },
            prefilters: [
                function (e, t, i) {
                    var n,
                        r,
                        o,
                        s,
                        a,
                        c,
                        l,
                        p,
                        d = 'width' in t || 'height' in t,
                        u = this,
                        h = {},
                        f = e.style,
                        m = e.nodeType && se(e),
                        _ = G.get(e, 'fxshow');
                    for (n in (i.queue ||
                        (null == (s = w._queueHooks(e, 'fx')).unqueued &&
                            ((s.unqueued = 0),
                                (a = s.empty.fire),
                                (s.empty.fire = function () {
                                    s.unqueued || a();
                                })),
                            s.unqueued++,
                            u.always(function () {
                                u.always(function () {
                                    s.unqueued--, w.queue(e, 'fx').length || s.empty.fire();
                                });
                            })),
                        t))
                        if (((r = t[n]), ot.test(r))) {
                            if ((delete t[n], (o = o || 'toggle' === r), r === (m ? 'hide' : 'show'))) {
                                if ('show' !== r || !_ || void 0 === _[n]) continue;
                                m = !0;
                            }
                            h[n] = (_ && _[n]) || w.style(e, n);
                        }
                    if ((c = !w.isEmptyObject(t)) || !w.isEmptyObject(h))
                        for (n in (d &&
                            1 === e.nodeType &&
                            ((i.overflow = [f.overflow, f.overflowX, f.overflowY]),
                                null == (l = _ && _.display) && (l = G.get(e, 'display')),
                                'none' === (p = w.css(e, 'display')) &&
                                (l
                                    ? (p = l)
                                    : (le([e], !0), (l = e.style.display || l), (p = w.css(e, 'display')), le([e]))),
                                ('inline' === p || ('inline-block' === p && null != l)) &&
                                'none' === w.css(e, 'float') &&
                                (c ||
                                    (u.done(function () {
                                        f.display = l;
                                    }),
                                        null == l && ((p = f.display), (l = 'none' === p ? '' : p))),
                                    (f.display = 'inline-block'))),
                            i.overflow &&
                            ((f.overflow = 'hidden'),
                                u.always(function () {
                                    (f.overflow = i.overflow[0]),
                                        (f.overflowX = i.overflow[1]),
                                        (f.overflowY = i.overflow[2]);
                                })),
                            (c = !1),
                            h))
                            c ||
                                (_ ? 'hidden' in _ && (m = _.hidden) : (_ = G.access(e, 'fxshow', { display: l })),
                                    o && (_.hidden = !m),
                                    m && le([e], !0),
                                    u.done(function () {
                                        for (n in (m || le([e]), G.remove(e, 'fxshow'), h)) w.style(e, n, h[n]);
                                    })),
                                (c = pt(m ? _[n] : 0, n, u)),
                                n in _ || ((_[n] = c.start), m && ((c.end = c.start), (c.start = 0)));
                },
            ],
            prefilter: function (e, t) {
                t ? dt.prefilters.unshift(e) : dt.prefilters.push(e);
            },
        })),
            (w.speed = function (e, t, i) {
                var n =
                    e && 'object' == typeof e
                        ? w.extend({}, e)
                        : {
                            complete: i || (!i && t) || (f(e) && e),
                            duration: e,
                            easing: (i && t) || (t && !f(t) && t),
                        };
                return (
                    w.fx.off
                        ? (n.duration = 0)
                        : 'number' != typeof n.duration &&
                        (n.duration in w.fx.speeds
                            ? (n.duration = w.fx.speeds[n.duration])
                            : (n.duration = w.fx.speeds._default)),
                    (null != n.queue && !0 !== n.queue) || (n.queue = 'fx'),
                    (n.old = n.complete),
                    (n.complete = function () {
                        f(n.old) && n.old.call(this), n.queue && w.dequeue(this, n.queue);
                    }),
                    n
                );
            }),
            w.fn.extend({
                fadeTo: function (e, t, i, n) {
                    return this.filter(se).css('opacity', 0).show().end().animate({ opacity: t }, e, i, n);
                },
                animate: function (e, t, i, n) {
                    var r = w.isEmptyObject(e),
                        o = w.speed(t, i, n),
                        s = function () {
                            var t = dt(this, w.extend({}, e), o);
                            (r || G.get(this, 'finish')) && t.stop(!0);
                        };
                    return (s.finish = s), r || !1 === o.queue ? this.each(s) : this.queue(o.queue, s);
                },
                stop: function (e, t, i) {
                    var n = function (e) {
                        var t = e.stop;
                        delete e.stop, t(i);
                    };
                    return (
                        'string' != typeof e && ((i = t), (t = e), (e = void 0)),
                        t && this.queue(e || 'fx', []),
                        this.each(function () {
                            var t = !0,
                                r = null != e && e + 'queueHooks',
                                o = w.timers,
                                s = G.get(this);
                            if (r) s[r] && s[r].stop && n(s[r]);
                            else for (r in s) s[r] && s[r].stop && st.test(r) && n(s[r]);
                            for (r = o.length; r--;)
                                o[r].elem !== this ||
                                    (null != e && o[r].queue !== e) ||
                                    (o[r].anim.stop(i), (t = !1), o.splice(r, 1));
                            (!t && i) || w.dequeue(this, e);
                        })
                    );
                },
                finish: function (e) {
                    return (
                        !1 !== e && (e = e || 'fx'),
                        this.each(function () {
                            var t,
                                i = G.get(this),
                                n = i[e + 'queue'],
                                r = i[e + 'queueHooks'],
                                o = w.timers,
                                s = n ? n.length : 0;
                            for (
                                i.finish = !0,
                                w.queue(this, e, []),
                                r && r.stop && r.stop.call(this, !0),
                                t = o.length;
                                t--;

                            )
                                o[t].elem === this && o[t].queue === e && (o[t].anim.stop(!0), o.splice(t, 1));
                            for (t = 0; t < s; t++) n[t] && n[t].finish && n[t].finish.call(this);
                            delete i.finish;
                        })
                    );
                },
            }),
            w.each(['toggle', 'show', 'hide'], function (e, t) {
                var i = w.fn[t];
                w.fn[t] = function (e, n, r) {
                    return null == e || 'boolean' == typeof e
                        ? i.apply(this, arguments)
                        : this.animate(lt(t, !0), e, n, r);
                };
            }),
            w.each(
                {
                    slideDown: lt('show'),
                    slideUp: lt('hide'),
                    slideToggle: lt('toggle'),
                    fadeIn: { opacity: 'show' },
                    fadeOut: { opacity: 'hide' },
                    fadeToggle: { opacity: 'toggle' },
                },
                function (e, t) {
                    w.fn[e] = function (e, i, n) {
                        return this.animate(t, e, i, n);
                    };
                },
            ),
            (w.timers = []),
            (w.fx.tick = function () {
                var e,
                    t = 0,
                    i = w.timers;
                for (tt = Date.now(); t < i.length; t++) (e = i[t])() || i[t] !== e || i.splice(t--, 1);
                i.length || w.fx.stop(), (tt = void 0);
            }),
            (w.fx.timer = function (e) {
                w.timers.push(e), w.fx.start();
            }),
            (w.fx.interval = 13),
            (w.fx.start = function () {
                it || ((it = !0), at());
            }),
            (w.fx.stop = function () {
                it = null;
            }),
            (w.fx.speeds = { slow: 600, fast: 200, _default: 400 }),
            (w.fn.delay = function (t, i) {
                return (
                    (t = (w.fx && w.fx.speeds[t]) || t),
                    (i = i || 'fx'),
                    this.queue(i, function (i, n) {
                        var r = e.setTimeout(i, t);
                        n.stop = function () {
                            e.clearTimeout(r);
                        };
                    })
                );
            }),
            (nt = _.createElement('input')),
            (rt = _.createElement('select').appendChild(_.createElement('option'))),
            (nt.type = 'checkbox'),
            (h.checkOn = '' !== nt.value),
            (h.optSelected = rt.selected),
            ((nt = _.createElement('input')).value = 't'),
            (nt.type = 'radio'),
            (h.radioValue = 't' === nt.value);
        var ut,
            ht = w.expr.attrHandle;
        w.fn.extend({
            attr: function (e, t) {
                return B(this, w.attr, e, t, 1 < arguments.length);
            },
            removeAttr: function (e) {
                return this.each(function () {
                    w.removeAttr(this, e);
                });
            },
        }),
            w.extend({
                attr: function (e, t, i) {
                    var n,
                        r,
                        o = e.nodeType;
                    if (3 !== o && 8 !== o && 2 !== o)
                        return void 0 === e.getAttribute
                            ? w.prop(e, t, i)
                            : ((1 === o && w.isXMLDoc(e)) ||
                                (r = w.attrHooks[t.toLowerCase()] || (w.expr.match.bool.test(t) ? ut : void 0)),
                                void 0 !== i
                                    ? null === i
                                        ? void w.removeAttr(e, t)
                                        : r && 'set' in r && void 0 !== (n = r.set(e, i, t))
                                            ? n
                                            : (e.setAttribute(t, i + ''), i)
                                    : r && 'get' in r && null !== (n = r.get(e, t))
                                        ? n
                                        : null == (n = w.find.attr(e, t))
                                            ? void 0
                                            : n);
                },
                attrHooks: {
                    type: {
                        set: function (e, t) {
                            if (!h.radioValue && 'radio' === t && j(e, 'input')) {
                                var i = e.value;
                                return e.setAttribute('type', t), i && (e.value = i), t;
                            }
                        },
                    },
                },
                removeAttr: function (e, t) {
                    var i,
                        n = 0,
                        r = t && t.match(M);
                    if (r && 1 === e.nodeType) for (; (i = r[n++]);) e.removeAttribute(i);
                },
            }),
            (ut = {
                set: function (e, t, i) {
                    return !1 === t ? w.removeAttr(e, i) : e.setAttribute(i, i), i;
                },
            }),
            w.each(w.expr.match.bool.source.match(/\w+/g), function (e, t) {
                var i = ht[t] || w.find.attr;
                ht[t] = function (e, t, n) {
                    var r,
                        o,
                        s = t.toLowerCase();
                    return (
                        n || ((o = ht[s]), (ht[s] = r), (r = null != i(e, t, n) ? s : null), (ht[s] = o)), r
                    );
                };
            });
        var ft = /^(?:input|select|textarea|button)$/i,
            mt = /^(?:a|area)$/i;
        function _t(e) {
            return (e.match(M) || []).join(' ');
        }
        function gt(e) {
            return (e.getAttribute && e.getAttribute('class')) || '';
        }
        function yt(e) {
            return Array.isArray(e) ? e : ('string' == typeof e && e.match(M)) || [];
        }
        w.fn.extend({
            prop: function (e, t) {
                return B(this, w.prop, e, t, 1 < arguments.length);
            },
            removeProp: function (e) {
                return this.each(function () {
                    delete this[w.propFix[e] || e];
                });
            },
        }),
            w.extend({
                prop: function (e, t, i) {
                    var n,
                        r,
                        o = e.nodeType;
                    if (3 !== o && 8 !== o && 2 !== o)
                        return (
                            (1 === o && w.isXMLDoc(e)) || ((t = w.propFix[t] || t), (r = w.propHooks[t])),
                            void 0 !== i
                                ? r && 'set' in r && void 0 !== (n = r.set(e, i, t))
                                    ? n
                                    : (e[t] = i)
                                : r && 'get' in r && null !== (n = r.get(e, t))
                                    ? n
                                    : e[t]
                        );
                },
                propHooks: {
                    tabIndex: {
                        get: function (e) {
                            var t = w.find.attr(e, 'tabindex');
                            return t
                                ? parseInt(t, 10)
                                : ft.test(e.nodeName) || (mt.test(e.nodeName) && e.href)
                                    ? 0
                                    : -1;
                        },
                    },
                },
                propFix: { for: 'htmlFor', class: 'className' },
            }),
            h.optSelected ||
            (w.propHooks.selected = {
                get: function (e) {
                    var t = e.parentNode;
                    return t && t.parentNode && t.parentNode.selectedIndex, null;
                },
                set: function (e) {
                    var t = e.parentNode;
                    t && (t.selectedIndex, t.parentNode && t.parentNode.selectedIndex);
                },
            }),
            w.each(
                [
                    'tabIndex',
                    'readOnly',
                    'maxLength',
                    'cellSpacing',
                    'cellPadding',
                    'rowSpan',
                    'colSpan',
                    'useMap',
                    'frameBorder',
                    'contentEditable',
                ],
                function () {
                    w.propFix[this.toLowerCase()] = this;
                },
            ),
            w.fn.extend({
                addClass: function (e) {
                    var t,
                        i,
                        n,
                        r,
                        o,
                        s,
                        a,
                        c = 0;
                    if (f(e))
                        return this.each(function (t) {
                            w(this).addClass(e.call(this, t, gt(this)));
                        });
                    if ((t = yt(e)).length)
                        for (; (i = this[c++]);)
                            if (((r = gt(i)), (n = 1 === i.nodeType && ' ' + _t(r) + ' '))) {
                                for (s = 0; (o = t[s++]);) n.indexOf(' ' + o + ' ') < 0 && (n += o + ' ');
                                r !== (a = _t(n)) && i.setAttribute('class', a);
                            }
                    return this;
                },
                removeClass: function (e) {
                    var t,
                        i,
                        n,
                        r,
                        o,
                        s,
                        a,
                        c = 0;
                    if (f(e))
                        return this.each(function (t) {
                            w(this).removeClass(e.call(this, t, gt(this)));
                        });
                    if (!arguments.length) return this.attr('class', '');
                    if ((t = yt(e)).length)
                        for (; (i = this[c++]);)
                            if (((r = gt(i)), (n = 1 === i.nodeType && ' ' + _t(r) + ' '))) {
                                for (s = 0; (o = t[s++]);)
                                    for (; -1 < n.indexOf(' ' + o + ' ');) n = n.replace(' ' + o + ' ', ' ');
                                r !== (a = _t(n)) && i.setAttribute('class', a);
                            }
                    return this;
                },
                toggleClass: function (e, t) {
                    var i = typeof e,
                        n = 'string' === i || Array.isArray(e);
                    return 'boolean' == typeof t && n
                        ? t
                            ? this.addClass(e)
                            : this.removeClass(e)
                        : f(e)
                            ? this.each(function (i) {
                                w(this).toggleClass(e.call(this, i, gt(this), t), t);
                            })
                            : this.each(function () {
                                var t, r, o, s;
                                if (n)
                                    for (r = 0, o = w(this), s = yt(e); (t = s[r++]);)
                                        o.hasClass(t) ? o.removeClass(t) : o.addClass(t);
                                else
                                    (void 0 !== e && 'boolean' !== i) ||
                                        ((t = gt(this)) && G.set(this, '__className__', t),
                                            this.setAttribute &&
                                            this.setAttribute(
                                                'class',
                                                t || !1 === e ? '' : G.get(this, '__className__') || '',
                                            ));
                            });
                },
                hasClass: function (e) {
                    var t,
                        i,
                        n = 0;
                    for (t = ' ' + e + ' '; (i = this[n++]);)
                        if (1 === i.nodeType && -1 < (' ' + _t(gt(i)) + ' ').indexOf(t)) return !0;
                    return !1;
                },
            });
        var vt = /\r/g;
        w.fn.extend({
            val: function (e) {
                var t,
                    i,
                    n,
                    r = this[0];
                return arguments.length
                    ? ((n = f(e)),
                        this.each(function (i) {
                            var r;
                            1 === this.nodeType &&
                                (null == (r = n ? e.call(this, i, w(this).val()) : e)
                                    ? (r = '')
                                    : 'number' == typeof r
                                        ? (r += '')
                                        : Array.isArray(r) &&
                                        (r = w.map(r, function (e) {
                                            return null == e ? '' : e + '';
                                        })),
                                    ((t = w.valHooks[this.type] || w.valHooks[this.nodeName.toLowerCase()]) &&
                                        'set' in t &&
                                        void 0 !== t.set(this, r, 'value')) ||
                                    (this.value = r));
                        }))
                    : r
                        ? (t = w.valHooks[r.type] || w.valHooks[r.nodeName.toLowerCase()]) &&
                            'get' in t &&
                            void 0 !== (i = t.get(r, 'value'))
                            ? i
                            : 'string' == typeof (i = r.value)
                                ? i.replace(vt, '')
                                : null == i
                                    ? ''
                                    : i
                        : void 0;
            },
        }),
            w.extend({
                valHooks: {
                    option: {
                        get: function (e) {
                            var t = w.find.attr(e, 'value');
                            return null != t ? t : _t(w.text(e));
                        },
                    },
                    select: {
                        get: function (e) {
                            var t,
                                i,
                                n,
                                r = e.options,
                                o = e.selectedIndex,
                                s = 'select-one' === e.type,
                                a = s ? null : [],
                                c = s ? o + 1 : r.length;
                            for (n = o < 0 ? c : s ? o : 0; n < c; n++)
                                if (
                                    ((i = r[n]).selected || n === o) &&
                                    !i.disabled &&
                                    (!i.parentNode.disabled || !j(i.parentNode, 'optgroup'))
                                ) {
                                    if (((t = w(i).val()), s)) return t;
                                    a.push(t);
                                }
                            return a;
                        },
                        set: function (e, t) {
                            for (var i, n, r = e.options, o = w.makeArray(t), s = r.length; s--;)
                                ((n = r[s]).selected = -1 < w.inArray(w.valHooks.option.get(n), o)) && (i = !0);
                            return i || (e.selectedIndex = -1), o;
                        },
                    },
                },
            }),
            w.each(['radio', 'checkbox'], function () {
                (w.valHooks[this] = {
                    set: function (e, t) {
                        if (Array.isArray(t)) return (e.checked = -1 < w.inArray(w(e).val(), t));
                    },
                }),
                    h.checkOn ||
                    (w.valHooks[this].get = function (e) {
                        return null === e.getAttribute('value') ? 'on' : e.value;
                    });
            }),
            (h.focusin = 'onfocusin' in e);
        var bt = /^(?:focusinfocus|focusoutblur)$/,
            wt = function (e) {
                e.stopPropagation();
            };
        w.extend(w.event, {
            trigger: function (t, i, n, r) {
                var o,
                    s,
                    a,
                    c,
                    l,
                    d,
                    u,
                    h,
                    g = [n || _],
                    y = p.call(t, 'type') ? t.type : t,
                    v = p.call(t, 'namespace') ? t.namespace.split('.') : [];
                if (
                    ((s = h = a = n = n || _),
                        3 !== n.nodeType &&
                        8 !== n.nodeType &&
                        !bt.test(y + w.event.triggered) &&
                        (-1 < y.indexOf('.') && ((y = (v = y.split('.')).shift()), v.sort()),
                            (l = y.indexOf(':') < 0 && 'on' + y),
                            ((t = t[w.expando] ? t : new w.Event(y, 'object' == typeof t && t)).isTrigger = r
                                ? 2
                                : 3),
                            (t.namespace = v.join('.')),
                            (t.rnamespace = t.namespace
                                ? new RegExp('(^|\\.)' + v.join('\\.(?:.*\\.|)') + '(\\.|$)')
                                : null),
                            (t.result = void 0),
                            t.target || (t.target = n),
                            (i = null == i ? [t] : w.makeArray(i, [t])),
                            (u = w.event.special[y] || {}),
                            r || !u.trigger || !1 !== u.trigger.apply(n, i)))
                ) {
                    if (!r && !u.noBubble && !m(n)) {
                        for (c = u.delegateType || y, bt.test(c + y) || (s = s.parentNode); s; s = s.parentNode)
                            g.push(s), (a = s);
                        a === (n.ownerDocument || _) && g.push(a.defaultView || a.parentWindow || e);
                    }
                    for (o = 0; (s = g[o++]) && !t.isPropagationStopped();)
                        (h = s),
                            (t.type = 1 < o ? c : u.bindType || y),
                            (d = (G.get(s, 'events') || Object.create(null))[t.type] && G.get(s, 'handle')) &&
                            d.apply(s, i),
                            (d = l && s[l]) &&
                            d.apply &&
                            Q(s) &&
                            ((t.result = d.apply(s, i)), !1 === t.result && t.preventDefault());
                    return (
                        (t.type = y),
                        r ||
                        t.isDefaultPrevented() ||
                        (u._default && !1 !== u._default.apply(g.pop(), i)) ||
                        !Q(n) ||
                        (l &&
                            f(n[y]) &&
                            !m(n) &&
                            ((a = n[l]) && (n[l] = null),
                                (w.event.triggered = y),
                                t.isPropagationStopped() && h.addEventListener(y, wt),
                                n[y](),
                                t.isPropagationStopped() && h.removeEventListener(y, wt),
                                (w.event.triggered = void 0),
                                a && (n[l] = a))),
                        t.result
                    );
                }
            },
            simulate: function (e, t, i) {
                var n = w.extend(new w.Event(), i, { type: e, isSimulated: !0 });
                w.event.trigger(n, null, t);
            },
        }),
            w.fn.extend({
                trigger: function (e, t) {
                    return this.each(function () {
                        w.event.trigger(e, t, this);
                    });
                },
                triggerHandler: function (e, t) {
                    var i = this[0];
                    if (i) return w.event.trigger(e, t, i, !0);
                },
            }),
            h.focusin ||
            w.each({ focus: 'focusin', blur: 'focusout' }, function (e, t) {
                var i = function (e) {
                    w.event.simulate(t, e.target, w.event.fix(e));
                };
                w.event.special[t] = {
                    setup: function () {
                        var n = this.ownerDocument || this.document || this,
                            r = G.access(n, t);
                        r || n.addEventListener(e, i, !0), G.access(n, t, (r || 0) + 1);
                    },
                    teardown: function () {
                        var n = this.ownerDocument || this.document || this,
                            r = G.access(n, t) - 1;
                        r ? G.access(n, t, r) : (n.removeEventListener(e, i, !0), G.remove(n, t));
                    },
                };
            });
        var kt = e.location,
            xt = { guid: Date.now() },
            St = /\?/;
        w.parseXML = function (t) {
            var i;
            if (!t || 'string' != typeof t) return null;
            try {
                i = new e.DOMParser().parseFromString(t, 'text/xml');
            } catch (t) {
                i = void 0;
            }
            return (
                (i && !i.getElementsByTagName('parsererror').length) || w.error('Invalid XML: ' + t), i
            );
        };
        var Ct = /\[\]$/,
            $t = /\r?\n/g,
            jt = /^(?:submit|button|image|reset|file)$/i,
            Tt = /^(?:input|select|textarea|keygen)/i;
        function zt(e, t, i, n) {
            var r;
            if (Array.isArray(t))
                w.each(t, function (t, r) {
                    i || Ct.test(e)
                        ? n(e, r)
                        : zt(e + '[' + ('object' == typeof r && null != r ? t : '') + ']', r, i, n);
                });
            else if (i || 'object' !== v(t)) n(e, t);
            else for (r in t) zt(e + '[' + r + ']', t[r], i, n);
        }
        (w.param = function (e, t) {
            var i,
                n = [],
                r = function (e, t) {
                    var i = f(t) ? t() : t;
                    n[n.length] = encodeURIComponent(e) + '=' + encodeURIComponent(null == i ? '' : i);
                };
            if (null == e) return '';
            if (Array.isArray(e) || (e.jquery && !w.isPlainObject(e)))
                w.each(e, function () {
                    r(this.name, this.value);
                });
            else for (i in e) zt(i, e[i], t, r);
            return n.join('&');
        }),
            w.fn.extend({
                serialize: function () {
                    return w.param(this.serializeArray());
                },
                serializeArray: function () {
                    return this.map(function () {
                        var e = w.prop(this, 'elements');
                        return e ? w.makeArray(e) : this;
                    })
                        .filter(function () {
                            var e = this.type;
                            return (
                                this.name &&
                                !w(this).is(':disabled') &&
                                Tt.test(this.nodeName) &&
                                !jt.test(e) &&
                                (this.checked || !ue.test(e))
                            );
                        })
                        .map(function (e, t) {
                            var i = w(this).val();
                            return null == i
                                ? null
                                : Array.isArray(i)
                                    ? w.map(i, function (e) {
                                        return { name: t.name, value: e.replace($t, '\r\n') };
                                    })
                                    : { name: t.name, value: i.replace($t, '\r\n') };
                        })
                        .get();
                },
            });
        var Dt = /%20/g,
            At = /#.*$/,
            Et = /([?&])_=[^&]*/,
            Lt = /^(.*?):[ \t]*([^\r\n]*)$/gm,
            Ot = /^(?:GET|HEAD)$/,
            Mt = /^\/\//,
            qt = {},
            Pt = {},
            It = '*/'.concat('*'),
            Nt = _.createElement('a');
        function Ht(e) {
            return function (t, i) {
                'string' != typeof t && ((i = t), (t = '*'));
                var n,
                    r = 0,
                    o = t.toLowerCase().match(M) || [];
                if (f(i))
                    for (; (n = o[r++]);)
                        '+' === n[0]
                            ? ((n = n.slice(1) || '*'), (e[n] = e[n] || []).unshift(i))
                            : (e[n] = e[n] || []).push(i);
            };
        }
        function Ft(e, t, i, n) {
            var r = {},
                o = e === Pt;
            function s(a) {
                var c;
                return (
                    (r[a] = !0),
                    w.each(e[a] || [], function (e, a) {
                        var l = a(t, i, n);
                        return 'string' != typeof l || o || r[l]
                            ? o
                                ? !(c = l)
                                : void 0
                            : (t.dataTypes.unshift(l), s(l), !1);
                    }),
                    c
                );
            }
            return s(t.dataTypes[0]) || (!r['*'] && s('*'));
        }
        function Bt(e, t) {
            var i,
                n,
                r = w.ajaxSettings.flatOptions || {};
            for (i in t) void 0 !== t[i] && ((r[i] ? e : n || (n = {}))[i] = t[i]);
            return n && w.extend(!0, e, n), e;
        }
        (Nt.href = kt.href),
            w.extend({
                active: 0,
                lastModified: {},
                etag: {},
                ajaxSettings: {
                    url: kt.href,
                    type: 'GET',
                    isLocal: /^(?:about|app|app-storage|.+-extension|file|res|widget):$/.test(kt.protocol),
                    global: !0,
                    processData: !0,
                    async: !0,
                    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                    accepts: {
                        '*': It,
                        text: 'text/plain',
                        html: 'text/html',
                        xml: 'application/xml, text/xml',
                        json: 'application/json, text/javascript',
                    },
                    contents: { xml: /\bxml\b/, html: /\bhtml/, json: /\bjson\b/ },
                    responseFields: { xml: 'responseXML', text: 'responseText', json: 'responseJSON' },
                    converters: {
                        '* text': String,
                        'text html': !0,
                        'text json': JSON.parse,
                        'text xml': w.parseXML,
                    },
                    flatOptions: { url: !0, context: !0 },
                },
                ajaxSetup: function (e, t) {
                    return t ? Bt(Bt(e, w.ajaxSettings), t) : Bt(w.ajaxSettings, e);
                },
                ajaxPrefilter: Ht(qt),
                ajaxTransport: Ht(Pt),
                ajax: function (t, i) {
                    'object' == typeof t && ((i = t), (t = void 0)), (i = i || {});
                    var n,
                        r,
                        o,
                        s,
                        a,
                        c,
                        l,
                        p,
                        d,
                        u,
                        h = w.ajaxSetup({}, i),
                        f = h.context || h,
                        m = h.context && (f.nodeType || f.jquery) ? w(f) : w.event,
                        g = w.Deferred(),
                        y = w.Callbacks('once memory'),
                        v = h.statusCode || {},
                        b = {},
                        k = {},
                        x = 'canceled',
                        S = {
                            readyState: 0,
                            getResponseHeader: function (e) {
                                var t;
                                if (l) {
                                    if (!s)
                                        for (s = {}; (t = Lt.exec(o));)
                                            s[t[1].toLowerCase() + ' '] = (s[t[1].toLowerCase() + ' '] || []).concat(
                                                t[2],
                                            );
                                    t = s[e.toLowerCase() + ' '];
                                }
                                return null == t ? null : t.join(', ');
                            },
                            getAllResponseHeaders: function () {
                                return l ? o : null;
                            },
                            setRequestHeader: function (e, t) {
                                return (
                                    null == l && ((e = k[e.toLowerCase()] = k[e.toLowerCase()] || e), (b[e] = t)),
                                    this
                                );
                            },
                            overrideMimeType: function (e) {
                                return null == l && (h.mimeType = e), this;
                            },
                            statusCode: function (e) {
                                var t;
                                if (e)
                                    if (l) S.always(e[S.status]);
                                    else for (t in e) v[t] = [v[t], e[t]];
                                return this;
                            },
                            abort: function (e) {
                                var t = e || x;
                                return n && n.abort(t), C(0, t), this;
                            },
                        };
                    if (
                        (g.promise(S),
                            (h.url = ((t || h.url || kt.href) + '').replace(Mt, kt.protocol + '//')),
                            (h.type = i.method || i.type || h.method || h.type),
                            (h.dataTypes = (h.dataType || '*').toLowerCase().match(M) || ['']),
                            null == h.crossDomain)
                    ) {
                        c = _.createElement('a');
                        try {
                            (c.href = h.url),
                                (c.href = c.href),
                                (h.crossDomain = Nt.protocol + '//' + Nt.host != c.protocol + '//' + c.host);
                        } catch (t) {
                            h.crossDomain = !0;
                        }
                    }
                    if (
                        (h.data &&
                            h.processData &&
                            'string' != typeof h.data &&
                            (h.data = w.param(h.data, h.traditional)),
                            Ft(qt, h, i, S),
                            l)
                    )
                        return S;
                    for (d in ((p = w.event && h.global) && 0 == w.active++ && w.event.trigger('ajaxStart'),
                        (h.type = h.type.toUpperCase()),
                        (h.hasContent = !Ot.test(h.type)),
                        (r = h.url.replace(At, '')),
                        h.hasContent
                            ? h.data &&
                            h.processData &&
                            0 === (h.contentType || '').indexOf('application/x-www-form-urlencoded') &&
                            (h.data = h.data.replace(Dt, '+'))
                            : ((u = h.url.slice(r.length)),
                                h.data &&
                                (h.processData || 'string' == typeof h.data) &&
                                ((r += (St.test(r) ? '&' : '?') + h.data), delete h.data),
                                !1 === h.cache &&
                                ((r = r.replace(Et, '$1')), (u = (St.test(r) ? '&' : '?') + '_=' + xt.guid++ + u)),
                                (h.url = r + u)),
                        h.ifModified &&
                        (w.lastModified[r] && S.setRequestHeader('If-Modified-Since', w.lastModified[r]),
                            w.etag[r] && S.setRequestHeader('If-None-Match', w.etag[r])),
                        ((h.data && h.hasContent && !1 !== h.contentType) || i.contentType) &&
                        S.setRequestHeader('Content-Type', h.contentType),
                        S.setRequestHeader(
                            'Accept',
                            h.dataTypes[0] && h.accepts[h.dataTypes[0]]
                                ? h.accepts[h.dataTypes[0]] + ('*' !== h.dataTypes[0] ? ', ' + It + '; q=0.01' : '')
                                : h.accepts['*'],
                        ),
                        h.headers))
                        S.setRequestHeader(d, h.headers[d]);
                    if (h.beforeSend && (!1 === h.beforeSend.call(f, S, h) || l)) return S.abort();
                    if (
                        ((x = 'abort'),
                            y.add(h.complete),
                            S.done(h.success),
                            S.fail(h.error),
                            (n = Ft(Pt, h, i, S)))
                    ) {
                        if (((S.readyState = 1), p && m.trigger('ajaxSend', [S, h]), l)) return S;
                        h.async &&
                            0 < h.timeout &&
                            (a = e.setTimeout(function () {
                                S.abort('timeout');
                            }, h.timeout));
                        try {
                            (l = !1), n.send(b, C);
                        } catch (t) {
                            if (l) throw t;
                            C(-1, t);
                        }
                    } else C(-1, 'No Transport');
                    function C(t, i, s, c) {
                        var d,
                            u,
                            _,
                            b,
                            k,
                            x = i;
                        l ||
                            ((l = !0),
                                a && e.clearTimeout(a),
                                (n = void 0),
                                (o = c || ''),
                                (S.readyState = 0 < t ? 4 : 0),
                                (d = (200 <= t && t < 300) || 304 === t),
                                s &&
                                (b = (function (e, t, i) {
                                    for (var n, r, o, s, a = e.contents, c = e.dataTypes; '*' === c[0];)
                                        c.shift(),
                                            void 0 === n && (n = e.mimeType || t.getResponseHeader('Content-Type'));
                                    if (n)
                                        for (r in a)
                                            if (a[r] && a[r].test(n)) {
                                                c.unshift(r);
                                                break;
                                            }
                                    if (c[0] in i) o = c[0];
                                    else {
                                        for (r in i) {
                                            if (!c[0] || e.converters[r + ' ' + c[0]]) {
                                                o = r;
                                                break;
                                            }
                                            s || (s = r);
                                        }
                                        o = o || s;
                                    }
                                    if (o) return o !== c[0] && c.unshift(o), i[o];
                                })(h, S, s)),
                                !d &&
                                -1 < w.inArray('script', h.dataTypes) &&
                                (h.converters['text script'] = function () { }),
                                (b = (function (e, t, i, n) {
                                    var r,
                                        o,
                                        s,
                                        a,
                                        c,
                                        l = {},
                                        p = e.dataTypes.slice();
                                    if (p[1]) for (s in e.converters) l[s.toLowerCase()] = e.converters[s];
                                    for (o = p.shift(); o;)
                                        if (
                                            (e.responseFields[o] && (i[e.responseFields[o]] = t),
                                                !c && n && e.dataFilter && (t = e.dataFilter(t, e.dataType)),
                                                (c = o),
                                                (o = p.shift()))
                                        )
                                            if ('*' === o) o = c;
                                            else if ('*' !== c && c !== o) {
                                                if (!(s = l[c + ' ' + o] || l['* ' + o]))
                                                    for (r in l)
                                                        if (
                                                            (a = r.split(' '))[1] === o &&
                                                            (s = l[c + ' ' + a[0]] || l['* ' + a[0]])
                                                        ) {
                                                            !0 === s ? (s = l[r]) : !0 !== l[r] && ((o = a[0]), p.unshift(a[1]));
                                                            break;
                                                        }
                                                if (!0 !== s)
                                                    if (s && e.throws) t = s(t);
                                                    else
                                                        try {
                                                            t = s(t);
                                                        } catch (e) {
                                                            return {
                                                                state: 'parsererror',
                                                                error: s ? e : 'No conversion from ' + c + ' to ' + o,
                                                            };
                                                        }
                                            }
                                    return { state: 'success', data: t };
                                })(h, b, S, d)),
                                d
                                    ? (h.ifModified &&
                                        ((k = S.getResponseHeader('Last-Modified')) && (w.lastModified[r] = k),
                                            (k = S.getResponseHeader('etag')) && (w.etag[r] = k)),
                                        204 === t || 'HEAD' === h.type
                                            ? (x = 'nocontent')
                                            : 304 === t
                                                ? (x = 'notmodified')
                                                : ((x = b.state), (u = b.data), (d = !(_ = b.error))))
                                    : ((_ = x), (!t && x) || ((x = 'error'), t < 0 && (t = 0))),
                                (S.status = t),
                                (S.statusText = (i || x) + ''),
                                d ? g.resolveWith(f, [u, x, S]) : g.rejectWith(f, [S, x, _]),
                                S.statusCode(v),
                                (v = void 0),
                                p && m.trigger(d ? 'ajaxSuccess' : 'ajaxError', [S, h, d ? u : _]),
                                y.fireWith(f, [S, x]),
                                p && (m.trigger('ajaxComplete', [S, h]), --w.active || w.event.trigger('ajaxStop')));
                    }
                    return S;
                },
                getJSON: function (e, t, i) {
                    return w.get(e, t, i, 'json');
                },
                getScript: function (e, t) {
                    return w.get(e, void 0, t, 'script');
                },
            }),
            w.each(['get', 'post'], function (e, t) {
                w[t] = function (e, i, n, r) {
                    return (
                        f(i) && ((r = r || n), (n = i), (i = void 0)),
                        w.ajax(
                            w.extend(
                                { url: e, type: t, dataType: r, data: i, success: n },
                                w.isPlainObject(e) && e,
                            ),
                        )
                    );
                };
            }),
            w.ajaxPrefilter(function (e) {
                var t;
                for (t in e.headers)
                    'content-type' === t.toLowerCase() && (e.contentType = e.headers[t] || '');
            }),
            (w._evalUrl = function (e, t, i) {
                return w.ajax({
                    url: e,
                    type: 'GET',
                    dataType: 'script',
                    cache: !0,
                    async: !1,
                    global: !1,
                    converters: { 'text script': function () { } },
                    dataFilter: function (e) {
                        w.globalEval(e, t, i);
                    },
                });
            }),
            w.fn.extend({
                wrapAll: function (e) {
                    var t;
                    return (
                        this[0] &&
                        (f(e) && (e = e.call(this[0])),
                            (t = w(e, this[0].ownerDocument).eq(0).clone(!0)),
                            this[0].parentNode && t.insertBefore(this[0]),
                            t
                                .map(function () {
                                    for (var e = this; e.firstElementChild;) e = e.firstElementChild;
                                    return e;
                                })
                                .append(this)),
                        this
                    );
                },
                wrapInner: function (e) {
                    return f(e)
                        ? this.each(function (t) {
                            w(this).wrapInner(e.call(this, t));
                        })
                        : this.each(function () {
                            var t = w(this),
                                i = t.contents();
                            i.length ? i.wrapAll(e) : t.append(e);
                        });
                },
                wrap: function (e) {
                    var t = f(e);
                    return this.each(function (i) {
                        w(this).wrapAll(t ? e.call(this, i) : e);
                    });
                },
                unwrap: function (e) {
                    return (
                        this.parent(e)
                            .not('body')
                            .each(function () {
                                w(this).replaceWith(this.childNodes);
                            }),
                        this
                    );
                },
            }),
            (w.expr.pseudos.hidden = function (e) {
                return !w.expr.pseudos.visible(e);
            }),
            (w.expr.pseudos.visible = function (e) {
                return !!(e.offsetWidth || e.offsetHeight || e.getClientRects().length);
            }),
            (w.ajaxSettings.xhr = function () {
                try {
                    return new e.XMLHttpRequest();
                } catch (e) { }
            });
        var Rt = { 0: 200, 1223: 204 },
            Wt = w.ajaxSettings.xhr();
        (h.cors = !!Wt && 'withCredentials' in Wt),
            (h.ajax = Wt = !!Wt),
            w.ajaxTransport(function (t) {
                var i, n;
                if (h.cors || (Wt && !t.crossDomain))
                    return {
                        send: function (r, o) {
                            var s,
                                a = t.xhr();
                            if ((a.open(t.type, t.url, t.async, t.username, t.password), t.xhrFields))
                                for (s in t.xhrFields) a[s] = t.xhrFields[s];
                            for (s in (t.mimeType && a.overrideMimeType && a.overrideMimeType(t.mimeType),
                                t.crossDomain || r['X-Requested-With'] || (r['X-Requested-With'] = 'XMLHttpRequest'),
                                r))
                                a.setRequestHeader(s, r[s]);
                            (i = function (e) {
                                return function () {
                                    i &&
                                        ((i =
                                            n =
                                            a.onload =
                                            a.onerror =
                                            a.onabort =
                                            a.ontimeout =
                                            a.onreadystatechange =
                                            null),
                                            'abort' === e
                                                ? a.abort()
                                                : 'error' === e
                                                    ? 'number' != typeof a.status
                                                        ? o(0, 'error')
                                                        : o(a.status, a.statusText)
                                                    : o(
                                                        Rt[a.status] || a.status,
                                                        a.statusText,
                                                        'text' !== (a.responseType || 'text') || 'string' != typeof a.responseText
                                                            ? { binary: a.response }
                                                            : { text: a.responseText },
                                                        a.getAllResponseHeaders(),
                                                    ));
                                };
                            }),
                                (a.onload = i()),
                                (n = a.onerror = a.ontimeout = i('error')),
                                void 0 !== a.onabort
                                    ? (a.onabort = n)
                                    : (a.onreadystatechange = function () {
                                        4 === a.readyState &&
                                            e.setTimeout(function () {
                                                i && n();
                                            });
                                    }),
                                (i = i('abort'));
                            try {
                                a.send((t.hasContent && t.data) || null);
                            } catch (r) {
                                if (i) throw r;
                            }
                        },
                        abort: function () {
                            i && i();
                        },
                    };
            }),
            w.ajaxPrefilter(function (e) {
                e.crossDomain && (e.contents.script = !1);
            }),
            w.ajaxSetup({
                accepts: {
                    script:
                        'text/javascript, application/javascript, application/ecmascript, application/x-ecmascript',
                },
                contents: { script: /\b(?:java|ecma)script\b/ },
                converters: {
                    'text script': function (e) {
                        return w.globalEval(e), e;
                    },
                },
            }),
            w.ajaxPrefilter('script', function (e) {
                void 0 === e.cache && (e.cache = !1), e.crossDomain && (e.type = 'GET');
            }),
            w.ajaxTransport('script', function (e) {
                var t, i;
                if (e.crossDomain || e.scriptAttrs)
                    return {
                        send: function (n, r) {
                            (t = w('<script>')
                                .attr(e.scriptAttrs || {})
                                .prop({ charset: e.scriptCharset, src: e.url })
                                .on(
                                    'load error',
                                    (i = function (e) {
                                        t.remove(), (i = null), e && r('error' === e.type ? 404 : 200, e.type);
                                    }),
                                )),
                                _.head.appendChild(t[0]);
                        },
                        abort: function () {
                            i && i();
                        },
                    };
            });
        var Yt,
            Ut = [],
            Qt = /(=)\?(?=&|$)|\?\?/;
        w.ajaxSetup({
            jsonp: 'callback',
            jsonpCallback: function () {
                var e = Ut.pop() || w.expando + '_' + xt.guid++;
                return (this[e] = !0), e;
            },
        }),
            w.ajaxPrefilter('json jsonp', function (t, i, n) {
                var r,
                    o,
                    s,
                    a =
                        !1 !== t.jsonp &&
                        (Qt.test(t.url)
                            ? 'url'
                            : 'string' == typeof t.data &&
                            0 === (t.contentType || '').indexOf('application/x-www-form-urlencoded') &&
                            Qt.test(t.data) &&
                            'data');
                if (a || 'jsonp' === t.dataTypes[0])
                    return (
                        (r = t.jsonpCallback = f(t.jsonpCallback) ? t.jsonpCallback() : t.jsonpCallback),
                        a
                            ? (t[a] = t[a].replace(Qt, '$1' + r))
                            : !1 !== t.jsonp && (t.url += (St.test(t.url) ? '&' : '?') + t.jsonp + '=' + r),
                        (t.converters['script json'] = function () {
                            return s || w.error(r + ' was not called'), s[0];
                        }),
                        (t.dataTypes[0] = 'json'),
                        (o = e[r]),
                        (e[r] = function () {
                            s = arguments;
                        }),
                        n.always(function () {
                            void 0 === o ? w(e).removeProp(r) : (e[r] = o),
                                t[r] && ((t.jsonpCallback = i.jsonpCallback), Ut.push(r)),
                                s && f(o) && o(s[0]),
                                (s = o = void 0);
                        }),
                        'script'
                    );
            }),
            (h.createHTMLDocument =
                (((Yt = _.implementation.createHTMLDocument('').body).innerHTML =
                    '<form></form><form></form>'),
                    2 === Yt.childNodes.length)),
            (w.parseHTML = function (e, t, i) {
                return 'string' != typeof e
                    ? []
                    : ('boolean' == typeof t && ((i = t), (t = !1)),
                        t ||
                        (h.createHTMLDocument
                            ? (((n = (t = _.implementation.createHTMLDocument('')).createElement('base')).href =
                                _.location.href),
                                t.head.appendChild(n))
                            : (t = _)),
                        (o = !i && []),
                        (r = T.exec(e))
                            ? [t.createElement(r[1])]
                            : ((r = ve([e], t, o)), o && o.length && w(o).remove(), w.merge([], r.childNodes)));
                var n, r, o;
            }),
            (w.fn.load = function (e, t, i) {
                var n,
                    r,
                    o,
                    s = this,
                    a = e.indexOf(' ');
                return (
                    -1 < a && ((n = _t(e.slice(a))), (e = e.slice(0, a))),
                    f(t) ? ((i = t), (t = void 0)) : t && 'object' == typeof t && (r = 'POST'),
                    0 < s.length &&
                    w
                        .ajax({ url: e, type: r || 'GET', dataType: 'html', data: t })
                        .done(function (e) {
                            (o = arguments), s.html(n ? w('<div>').append(w.parseHTML(e)).find(n) : e);
                        })
                        .always(
                            i &&
                            function (e, t) {
                                s.each(function () {
                                    i.apply(this, o || [e.responseText, t, e]);
                                });
                            },
                        ),
                    this
                );
            }),
            (w.expr.pseudos.animated = function (e) {
                return w.grep(w.timers, function (t) {
                    return e === t.elem;
                }).length;
            }),
            (w.offset = {
                setOffset: function (e, t, i) {
                    var n,
                        r,
                        o,
                        s,
                        a,
                        c,
                        l = w.css(e, 'position'),
                        p = w(e),
                        d = {};
                    'static' === l && (e.style.position = 'relative'),
                        (a = p.offset()),
                        (o = w.css(e, 'top')),
                        (c = w.css(e, 'left')),
                        ('absolute' === l || 'fixed' === l) && -1 < (o + c).indexOf('auto')
                            ? ((s = (n = p.position()).top), (r = n.left))
                            : ((s = parseFloat(o) || 0), (r = parseFloat(c) || 0)),
                        f(t) && (t = t.call(e, i, w.extend({}, a))),
                        null != t.top && (d.top = t.top - a.top + s),
                        null != t.left && (d.left = t.left - a.left + r),
                        'using' in t
                            ? t.using.call(e, d)
                            : ('number' == typeof d.top && (d.top += 'px'),
                                'number' == typeof d.left && (d.left += 'px'),
                                p.css(d));
                },
            }),
            w.fn.extend({
                offset: function (e) {
                    if (arguments.length)
                        return void 0 === e
                            ? this
                            : this.each(function (t) {
                                w.offset.setOffset(this, e, t);
                            });
                    var t,
                        i,
                        n = this[0];
                    return n
                        ? n.getClientRects().length
                            ? ((t = n.getBoundingClientRect()),
                                (i = n.ownerDocument.defaultView),
                                { top: t.top + i.pageYOffset, left: t.left + i.pageXOffset })
                            : { top: 0, left: 0 }
                        : void 0;
                },
                position: function () {
                    if (this[0]) {
                        var e,
                            t,
                            i,
                            n = this[0],
                            r = { top: 0, left: 0 };
                        if ('fixed' === w.css(n, 'position')) t = n.getBoundingClientRect();
                        else {
                            for (
                                t = this.offset(), i = n.ownerDocument, e = n.offsetParent || i.documentElement;
                                e && (e === i.body || e === i.documentElement) && 'static' === w.css(e, 'position');

                            )
                                e = e.parentNode;
                            e &&
                                e !== n &&
                                1 === e.nodeType &&
                                (((r = w(e).offset()).top += w.css(e, 'borderTopWidth', !0)),
                                    (r.left += w.css(e, 'borderLeftWidth', !0)));
                        }
                        return {
                            top: t.top - r.top - w.css(n, 'marginTop', !0),
                            left: t.left - r.left - w.css(n, 'marginLeft', !0),
                        };
                    }
                },
                offsetParent: function () {
                    return this.map(function () {
                        for (var e = this.offsetParent; e && 'static' === w.css(e, 'position');)
                            e = e.offsetParent;
                        return e || ne;
                    });
                },
            }),
            w.each({ scrollLeft: 'pageXOffset', scrollTop: 'pageYOffset' }, function (e, t) {
                var i = 'pageYOffset' === t;
                w.fn[e] = function (n) {
                    return B(
                        this,
                        function (e, n, r) {
                            var o;
                            if ((m(e) ? (o = e) : 9 === e.nodeType && (o = e.defaultView), void 0 === r))
                                return o ? o[t] : e[n];
                            o ? o.scrollTo(i ? o.pageXOffset : r, i ? r : o.pageYOffset) : (e[n] = r);
                        },
                        e,
                        n,
                        arguments.length,
                    );
                };
            }),
            w.each(['top', 'left'], function (e, t) {
                w.cssHooks[t] = Be(h.pixelPosition, function (e, i) {
                    if (i) return (i = Fe(e, t)), Pe.test(i) ? w(e).position()[t] + 'px' : i;
                });
            }),
            w.each({ Height: 'height', Width: 'width' }, function (e, t) {
                w.each({ padding: 'inner' + e, content: t, '': 'outer' + e }, function (i, n) {
                    w.fn[n] = function (r, o) {
                        var s = arguments.length && (i || 'boolean' != typeof r),
                            a = i || (!0 === r || !0 === o ? 'margin' : 'border');
                        return B(
                            this,
                            function (t, i, r) {
                                var o;
                                return m(t)
                                    ? 0 === n.indexOf('outer')
                                        ? t['inner' + e]
                                        : t.document.documentElement['client' + e]
                                    : 9 === t.nodeType
                                        ? ((o = t.documentElement),
                                            Math.max(
                                                t.body['scroll' + e],
                                                o['scroll' + e],
                                                t.body['offset' + e],
                                                o['offset' + e],
                                                o['client' + e],
                                            ))
                                        : void 0 === r
                                            ? w.css(t, i, a)
                                            : w.style(t, i, r, a);
                            },
                            t,
                            s ? r : void 0,
                            s,
                        );
                    };
                });
            }),
            w.each(
                ['ajaxStart', 'ajaxStop', 'ajaxComplete', 'ajaxError', 'ajaxSuccess', 'ajaxSend'],
                function (e, t) {
                    w.fn[t] = function (e) {
                        return this.on(t, e);
                    };
                },
            ),
            w.fn.extend({
                bind: function (e, t, i) {
                    return this.on(e, null, t, i);
                },
                unbind: function (e, t) {
                    return this.off(e, null, t);
                },
                delegate: function (e, t, i, n) {
                    return this.on(t, e, i, n);
                },
                undelegate: function (e, t, i) {
                    return 1 === arguments.length ? this.off(e, '**') : this.off(t, e || '**', i);
                },
                hover: function (e, t) {
                    return this.mouseenter(e).mouseleave(t || e);
                },
            }),
            w.each(
                'blur focus focusin focusout resize scroll click dblclick mousedown mouseup mousemove mouseover mouseout mouseenter mouseleave change select submit keydown keypress keyup contextmenu'.split(
                    ' ',
                ),
                function (e, t) {
                    w.fn[t] = function (e, i) {
                        return 0 < arguments.length ? this.on(t, null, e, i) : this.trigger(t);
                    };
                },
            );
        var Vt = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
        (w.proxy = function (e, t) {
            var i, n, o;
            if (('string' == typeof t && ((i = e[t]), (t = e), (e = i)), f(e)))
                return (
                    (n = r.call(arguments, 2)),
                    ((o = function () {
                        return e.apply(t || this, n.concat(r.call(arguments)));
                    }).guid = e.guid =
                        e.guid || w.guid++),
                    o
                );
        }),
            (w.holdReady = function (e) {
                e ? w.readyWait++ : w.ready(!0);
            }),
            (w.isArray = Array.isArray),
            (w.parseJSON = JSON.parse),
            (w.nodeName = j),
            (w.isFunction = f),
            (w.isWindow = m),
            (w.camelCase = U),
            (w.type = v),
            (w.now = Date.now),
            (w.isNumeric = function (e) {
                var t = w.type(e);
                return ('number' === t || 'string' === t) && !isNaN(e - parseFloat(e));
            }),
            (w.trim = function (e) {
                return null == e ? '' : (e + '').replace(Vt, '');
            }),
            'function' == typeof define &&
            define.amd &&
            define('jquery', [], function () {
                return w;
            });
        var Gt = e.jQuery,
            Jt = e.$;
        return (
            (w.noConflict = function (t) {
                return e.$ === w && (e.$ = Jt), t && e.jQuery === w && (e.jQuery = Gt), w;
            }),
            void 0 === t && (e.jQuery = e.$ = w),
            w
        );
    }),
    (jQuery.fn.size = function () {
        return this.length;
    }),
    ($.curCSS = function (e, t, i) {
        $(e).css(t, i);
    }),
    /*!
     * jQuery Migrate - v3.3.1 - 2020-06-25T01:07Z
     * Copyright OpenJS Foundation and other contributors
     */
    (function (e) {
        'use strict';
        'function' == typeof define && define.amd
            ? define(['jquery'], function (t) {
                return e(t, window);
            })
            : 'object' == typeof module && module.exports
                ? (module.exports = e(require('jquery'), window))
                : e(jQuery, window);
    })(function (e, t) {
        'use strict';
        function i(t) {
            return (
                (function (e, t) {
                    var i,
                        n = /^(\d+)\.(\d+)\.(\d+)/,
                        r = n.exec(e) || [],
                        o = n.exec(t) || [];
                    for (i = 1; i <= 3; i++) {
                        if (+r[i] > +o[i]) return 1;
                        if (+r[i] < +o[i]) return -1;
                    }
                    return 0;
                })(e.fn.jquery, t) >= 0
            );
        }
        e.migrateVersion = '3.3.1';
        function n(e, t, i, n) {
            Object.defineProperty(e, t, {
                configurable: !0,
                enumerable: !0,
                get: function () {
                    return i;
                },
                set: function (e) {
                    i = e;
                },
            });
        }
        function r(e, t, i, n) {
            e[t] = function () {
                return i.apply(this, arguments);
            };
        }
        (e.migrateDeduplicateWarnings = !0),
            (e.migrateWarnings = []),
            void 0 === e.migrateTrace && (e.migrateTrace = !0),
            (e.migrateReset = function () {
                ({}), (e.migrateWarnings.length = 0);
            }),
            t.document.compatMode;
        var o,
            s = {},
            a = e.fn.init,
            c = e.find,
            l = /\[(\s*[-\w]+\s*)([~|^$*]?=)\s*([-\w#]*?#[-\w#]*)\s*\]/,
            p = /\[(\s*[-\w]+\s*)([~|^$*]?=)\s*([-\w#]*?#[-\w#]*)\s*\]/g,
            d = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
        for (o in ((e.fn.init = function (e) {
            var t = Array.prototype.slice.call(arguments);
            return 'string' == typeof e && '#' === e && (t[0] = []), a.apply(this, t);
        }),
            (e.fn.init.prototype = e.fn),
            (e.find = function (e) {
                var i = Array.prototype.slice.call(arguments);
                if ('string' == typeof e && l.test(e))
                    try {
                        t.document.querySelector(e);
                    } catch (n) {
                        e = e.replace(p, function (e, t, i, n) {
                            return '[' + t + i + '"' + n + '"]';
                        });
                        try {
                            t.document.querySelector(e), i[0], (i[0] = e);
                        } catch (e) {
                            i[0];
                        }
                    }
                return c.apply(this, i);
            }),
            c))
            Object.prototype.hasOwnProperty.call(c, o) && (e.find[o] = c[o]);
        if (
            (r(e.fn, 'size', function () {
                return this.length;
            }),
                r(e, 'parseJSON', function () {
                    return JSON.parse.apply(null, arguments);
                }),
                r(e, 'holdReady', e.holdReady),
                r(e, 'unique', e.uniqueSort),
                n(e.expr, 'filters', e.expr.pseudos),
                n(e.expr, ':', e.expr.pseudos),
                i('3.1.1') &&
                r(e, 'trim', function (e) {
                    return null == e ? '' : (e + '').replace(d, '');
                }),
                i('3.2.0') &&
                r(e, 'nodeName', function (e, t) {
                    return e.nodeName && e.nodeName.toLowerCase() === t.toLowerCase();
                }),
                i('3.3.0') &&
                (r(e, 'isNumeric', function (e) {
                    var t = typeof e;
                    return ('number' === t || 'string' === t) && !isNaN(e - parseFloat(e));
                }),
                    e.each(
                        'Boolean Number String Function Array Date RegExp Object Error Symbol'.split(' '),
                        function (e, t) {
                            s['[object ' + t + ']'] = t.toLowerCase();
                        },
                    ),
                    r(e, 'type', function (e) {
                        return null == e
                            ? e + ''
                            : 'object' == typeof e || 'function' == typeof e
                                ? s[Object.prototype.toString.call(e)] || 'object'
                                : typeof e;
                    }),
                    r(e, 'isFunction', function (e) {
                        return 'function' == typeof e;
                    }),
                    r(e, 'isWindow', function (e) {
                        return null != e && e === e.window;
                    }),
                    r(e, 'isArray', Array.isArray)),
                e.ajax)
        ) {
            var u = e.ajax;
            e.ajax = function () {
                var e = u.apply(this, arguments);
                return (
                    e.promise && (r(e, 'success', e.done), r(e, 'error', e.fail), r(e, 'complete', e.always)),
                    e
                );
            };
        }
        var h = e.fn.removeAttr,
            f = e.fn.toggleClass,
            m = /\S+/g;
        function _(e) {
            return e.replace(/-([a-z])/g, function (e, t) {
                return t.toUpperCase();
            });
        }
        (e.fn.removeAttr = function (t) {
            var i = this;
            return (
                e.each(t.match(m), function (t, n) {
                    e.expr.match.bool.test(n) && i.prop(n, !1);
                }),
                h.apply(this, arguments)
            );
        }),
            (e.fn.toggleClass = function (t) {
                return void 0 !== t && 'boolean' != typeof t
                    ? f.apply(this, arguments)
                    : this.each(function () {
                        var i = (this.getAttribute && this.getAttribute('class')) || '';
                        i && e.data(this, '__className__', i),
                            this.setAttribute &&
                            this.setAttribute(
                                'class',
                                i || !1 === t ? '' : e.data(this, '__className__') || '',
                            );
                    });
            });
        var g,
            y = /^[a-z]/,
            v =
                /^(?:Border(?:Top|Right|Bottom|Left)?(?:Width|)|(?:Margin|Padding)?(?:Top|Right|Bottom|Left)?|(?:Min|Max)?(?:Width|Height))$/;
        function b(e) {
            return y.test(e) && v.test(e[0].toUpperCase() + e.slice(1));
        }
        e.swap &&
            e.each(['height', 'width', 'reliableMarginRight'], function (t, i) {
                var n = e.cssHooks[i] && e.cssHooks[i].get;
                n &&
                    (e.cssHooks[i].get = function () {
                        var e;
                        return !0, (e = n.apply(this, arguments)), !1, e;
                    });
            }),
            (e.swap = function (e, t, i, n) {
                var r,
                    o,
                    s = {};
                for (o in t) (s[o] = e.style[o]), (e.style[o] = t[o]);
                for (o in ((r = i.apply(e, n || [])), t)) e.style[o] = s[o];
                return r;
            }),
            i('3.4.0') &&
            'undefined' != typeof Proxy &&
            (e.cssProps = new Proxy(e.cssProps || {}, {
                set: function () {
                    return Reflect.set.apply(this, arguments);
                },
            })),
            e.cssNumber || (e.cssNumber = {}),
            (g = e.fn.css),
            (e.fn.css = function (t, i) {
                var n,
                    r = this;
                return (
                    t &&
                    'object' == typeof t &&
                    !Array.isArray(t) &&
                    e.each(t, function (t, i) {
                        e.fn.css.call(r, t, i);
                    }),
                    'number' == typeof i && !b((n = _(t))) && e.cssNumber[n],
                    g.apply(this, arguments)
                );
            });
        var w = e.data;
        if (
            ((e.data = function (t, i, n) {
                var r, o, s;
                if (i && 'object' == typeof i && 2 === arguments.length) {
                    for (s in ((r = e.hasData(t) && w.call(this, t)), (o = {}), i))
                        s !== _(s) ? (r[s] = i[s]) : (o[s] = i[s]);
                    return w.call(this, t, o), i;
                }
                return i &&
                    'string' == typeof i &&
                    i !== _(i) &&
                    (r = e.hasData(t) && w.call(this, t)) &&
                    i in r
                    ? (arguments.length > 2 && (r[i] = n), r[i])
                    : w.apply(this, arguments);
            }),
                e.fx)
        ) {
            var k,
                x = e.Tween.prototype.run,
                S = function (e) {
                    return e;
                };
            (e.Tween.prototype.run = function () {
                e.easing[this.easing].length > 1 && (this.easing.toString(), (e.easing[this.easing] = S)),
                    x.apply(this, arguments);
            }),
                (k = e.fx.interval || 13),
                'jQuery.fx.interval is deprecated',
                t.requestAnimationFrame &&
                Object.defineProperty(e.fx, 'interval', {
                    configurable: !0,
                    enumerable: !0,
                    get: function () {
                        return t.document.hidden, k;
                    },
                    set: function (e) {
                        k = e;
                    },
                });
        }
        var C = e.fn.load,
            $ = e.event.add,
            j = e.event.fix;
        (e.event.props = []),
            (e.event.fixHooks = {}),
            n(e.event.props, 'concat', e.event.props.concat),
            (e.event.fix = function (t) {
                var i,
                    n = t.type,
                    r = this.fixHooks[n],
                    o = e.event.props;
                if (o.length) for (o.join(); o.length;) e.event.addProp(o.pop());
                if (r && !r._migrated_ && ((r._migrated_ = !0), (o = r.props) && o.length))
                    for (; o.length;) e.event.addProp(o.pop());
                return (i = j.call(this, t)), r && r.filter ? r.filter(i, t) : i;
            }),
            (e.event.add = function (e, i) {
                return e === t && 'load' === i && t.document.readyState, $.apply(this, arguments);
            }),
            e.each(['load', 'unload', 'error'], function (t, i) {
                e.fn[i] = function () {
                    var e = Array.prototype.slice.call(arguments, 0);
                    return 'load' === i && 'string' == typeof e[0]
                        ? C.apply(this, e)
                        : (e.splice(0, 0, i),
                            arguments.length
                                ? this.on.apply(this, e)
                                : (this.triggerHandler.apply(this, e), this));
                };
            }),
            e.each(
                'blur focus focusin focusout resize scroll click dblclick mousedown mouseup mousemove mouseover mouseout mouseenter mouseleave change select submit keydown keypress keyup contextmenu'.split(
                    ' ',
                ),
                function (t, i) {
                    e.fn[i] = function (e, t) {
                        return arguments.length > 0 ? this.on(i, null, e, t) : this.trigger(i);
                    };
                },
            ),
            e(function () {
                e(t.document).triggerHandler('ready');
            }),
            (e.event.special.ready = {
                setup: function () {
                    t.document;
                },
            }),
            e.fn.extend({
                bind: function (e, t, i) {
                    return this.on(e, null, t, i);
                },
                unbind: function (e, t) {
                    return this.off(e, null, t);
                },
                delegate: function (e, t, i, n) {
                    return this.on(t, e, i, n);
                },
                undelegate: function (e, t, i) {
                    return 1 === arguments.length ? this.off(e, '**') : this.off(t, e || '**', i);
                },
                hover: function (e, t) {
                    return this.on('mouseenter', e).on('mouseleave', t || e);
                },
            });
        var T =
            /<(?!area|br|col|embed|hr|img|input|link|meta|param)(([a-z][^\/\0>\x20\t\r\n\f]*)[^>]*)\/>/gi,
            z = e.htmlPrefilter,
            D = function (e) {
                var i = t.document.implementation.createHTMLDocument('');
                return (i.body.innerHTML = e), i.body && i.body.innerHTML;
            },
            A = function (e) {
                var t = e.replace(T, '<$1></$2>');
                t !== e && (D(e), D(t));
            };
        (e.UNSAFE_restoreLegacyHtmlPrefilter = function () {
            e.htmlPrefilter = function (e) {
                return A(e), e.replace(T, '<$1></$2>');
            };
        }),
            (e.htmlPrefilter = function (e) {
                return A(e), z(e);
            });
        var E = e.fn.offset;
        if (
            ((e.fn.offset = function () {
                var e = this[0];
                return !e || (e.nodeType && e.getBoundingClientRect)
                    ? E.apply(this, arguments)
                    : arguments.length
                        ? this
                        : void 0;
            }),
                e.ajax)
        ) {
            var L = e.param;
            e.param = function (t, i) {
                var n = e.ajaxSettings && e.ajaxSettings.traditional;
                return void 0 === i && n && (i = n), L.call(this, t, i);
            };
        }
        var O = e.fn.andSelf || e.fn.addBack;
        if (
            ((e.fn.andSelf = function () {
                return O.apply(this, arguments);
            }),
                e.Deferred)
        ) {
            var M = e.Deferred,
                q = [
                    ['resolve', 'done', e.Callbacks('once memory'), e.Callbacks('once memory'), 'resolved'],
                    ['reject', 'fail', e.Callbacks('once memory'), e.Callbacks('once memory'), 'rejected'],
                    ['notify', 'progress', e.Callbacks('memory'), e.Callbacks('memory')],
                ];
            (e.Deferred = function (t) {
                var i = M(),
                    n = i.promise();
                return (
                    (i.pipe = n.pipe =
                        function () {
                            var t = arguments;
                            return e
                                .Deferred(function (r) {
                                    e.each(q, function (e, o) {
                                        var s = 'function' == typeof t[e] && t[e];
                                        i[o[1]](function () {
                                            var e = s && s.apply(this, arguments);
                                            e && 'function' == typeof e.promise
                                                ? e.promise().done(r.resolve).fail(r.reject).progress(r.notify)
                                                : r[o[0] + 'With'](this === n ? r.promise() : this, s ? [e] : arguments);
                                        });
                                    }),
                                        (t = null);
                                })
                                .promise();
                        }),
                    t && t.call(i, i),
                    i
                );
            }),
                (e.Deferred.exceptionHook = M.exceptionHook);
        }
        return e;
    }),
    (jQuery.event.special.touchstart = {
        setup: function (e, t, i) {
            this.addEventListener('touchstart', i, { passive: !t.includes('noPreventDefault') });
        },
    }),
    (jQuery.event.special.touchmove = {
        setup: function (e, t, i) {
            this.addEventListener('touchmove', i, { passive: !t.includes('noPreventDefault') });
        },
    }),
    (jQuery.event.special.wheel = {
        setup: function (e, t, i) {
            this.addEventListener('wheel', i, { passive: !0 });
        },
    }),
    (jQuery.event.special.mousewheel = {
        setup: function (e, t, i) {
            this.addEventListener('mousewheel', i, { passive: !0 });
        },
    }),
    (function (e) {
        'use strict';
        'function' == typeof define && define.amd
            ? define(['jquery'], e)
            : 'undefined' != typeof exports
                ? (module.exports = e(require('jquery')))
                : e(jQuery);
    })(function (e) {
        'use strict';
        var t = window.Slick || {};
        ((t = (function () {
            var t = 0;
            return function (i, n) {
                var r,
                    o = this;
                (o.defaults = {
                    accessibility: !0,
                    adaptiveHeight: !1,
                    appendArrows: e(i),
                    appendDots: e(i),
                    arrows: !0,
                    asNavFor: null,
                    prevArrow:
                        '<button class="slick-prev" aria-label="Previous" type="button">Previous</button>',
                    nextArrow: '<button class="slick-next" aria-label="Next" type="button">Next</button>',
                    autoplay: !1,
                    autoplaySpeed: 3e3,
                    centerMode: !1,
                    centerPadding: '50px',
                    cssEase: 'ease',
                    customPaging: function (t, i) {
                        return e('<button type="button" />').text(i + 1);
                    },
                    dots: !1,
                    dotsClass: 'slick-dots',
                    draggable: !0,
                    easing: 'linear',
                    edgeFriction: 0.35,
                    fade: !1,
                    focusOnSelect: !1,
                    focusOnChange: !1,
                    infinite: !0,
                    initialSlide: 0,
                    lazyLoad: 'ondemand',
                    mobileFirst: !1,
                    pauseOnHover: !0,
                    pauseOnFocus: !0,
                    pauseOnDotsHover: !1,
                    respondTo: 'window',
                    responsive: null,
                    rows: 1,
                    rtl: !1,
                    slide: '',
                    slidesPerRow: 1,
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    speed: 500,
                    swipe: !0,
                    swipeToSlide: !1,
                    touchMove: !0,
                    touchThreshold: 5,
                    useCSS: !0,
                    useTransform: !0,
                    variableWidth: !1,
                    vertical: !1,
                    verticalSwiping: !1,
                    waitForAnimate: !0,
                    zIndex: 1e3,
                }),
                    (o.initials = {
                        animating: !1,
                        dragging: !1,
                        autoPlayTimer: null,
                        currentDirection: 0,
                        currentLeft: null,
                        currentSlide: 0,
                        direction: 1,
                        $dots: null,
                        listWidth: null,
                        listHeight: null,
                        loadIndex: 0,
                        $nextArrow: null,
                        $prevArrow: null,
                        scrolling: !1,
                        slideCount: null,
                        slideWidth: null,
                        $slideTrack: null,
                        $slides: null,
                        sliding: !1,
                        slideOffset: 0,
                        swipeLeft: null,
                        swiping: !1,
                        $list: null,
                        touchObject: {},
                        transformsEnabled: !1,
                        unslicked: !1,
                    }),
                    e.extend(o, o.initials),
                    (o.activeBreakpoint = null),
                    (o.animType = null),
                    (o.animProp = null),
                    (o.breakpoints = []),
                    (o.breakpointSettings = []),
                    (o.cssTransitions = !1),
                    (o.focussed = !1),
                    (o.interrupted = !1),
                    (o.hidden = 'hidden'),
                    (o.paused = !0),
                    (o.positionProp = null),
                    (o.respondTo = null),
                    (o.rowCount = 1),
                    (o.shouldClick = !0),
                    (o.$slider = e(i)),
                    (o.$slidesCache = null),
                    (o.transformType = null),
                    (o.transitionType = null),
                    (o.visibilityChange = 'visibilitychange'),
                    (o.windowWidth = 0),
                    (o.windowTimer = null),
                    (r = e(i).data('slick') || {}),
                    (o.options = e.extend({}, o.defaults, n, r)),
                    (o.currentSlide = o.options.initialSlide),
                    (o.originalSettings = o.options),
                    void 0 !== document.mozHidden
                        ? ((o.hidden = 'mozHidden'), (o.visibilityChange = 'mozvisibilitychange'))
                        : void 0 !== document.webkitHidden &&
                        ((o.hidden = 'webkitHidden'), (o.visibilityChange = 'webkitvisibilitychange')),
                    (o.autoPlay = e.proxy(o.autoPlay, o)),
                    (o.autoPlayClear = e.proxy(o.autoPlayClear, o)),
                    (o.autoPlayIterator = e.proxy(o.autoPlayIterator, o)),
                    (o.changeSlide = e.proxy(o.changeSlide, o)),
                    (o.clickHandler = e.proxy(o.clickHandler, o)),
                    (o.selectHandler = e.proxy(o.selectHandler, o)),
                    (o.setPosition = e.proxy(o.setPosition, o)),
                    (o.swipeHandler = e.proxy(o.swipeHandler, o)),
                    (o.dragHandler = e.proxy(o.dragHandler, o)),
                    (o.keyHandler = e.proxy(o.keyHandler, o)),
                    (o.instanceUid = t++),
                    (o.htmlExpr = /^(?:\s*(<[\w\W]+>)[^>]*)$/),
                    o.registerBreakpoints(),
                    o.init(!0);
            };
        })()).prototype.activateADA = function () {
            this.$slideTrack
                .find('.slick-active')
                .attr({ 'aria-hidden': 'false' })
                .find('a, input, button, select')
                .attr({ tabindex: '0' });
        }),
            (t.prototype.addSlide = t.prototype.slickAdd =
                function (t, i, n) {
                    var r = this;
                    if ('boolean' == typeof i) (n = i), (i = null);
                    else if (i < 0 || i >= r.slideCount) return !1;
                    r.unload(),
                        'number' == typeof i
                            ? 0 === i && 0 === r.$slides.length
                                ? e(t).appendTo(r.$slideTrack)
                                : n
                                    ? e(t).insertBefore(r.$slides.eq(i))
                                    : e(t).insertAfter(r.$slides.eq(i))
                            : !0 === n
                                ? e(t).prependTo(r.$slideTrack)
                                : e(t).appendTo(r.$slideTrack),
                        (r.$slides = r.$slideTrack.children(this.options.slide)),
                        r.$slideTrack.children(this.options.slide).detach(),
                        r.$slideTrack.append(r.$slides),
                        r.$slides.each(function (t, i) {
                            e(i).attr('data-slick-index', t);
                        }),
                        (r.$slidesCache = r.$slides),
                        r.reinit();
                }),
            (t.prototype.animateHeight = function () {
                var e = this;
                if (
                    1 === e.options.slidesToShow &&
                    !0 === e.options.adaptiveHeight &&
                    !1 === e.options.vertical
                ) {
                    var t = e.$slides.eq(e.currentSlide).outerHeight(!0);
                    e.$list.animate({ height: t }, e.options.speed);
                }
            }),
            (t.prototype.animateSlide = function (t, i) {
                var n = {},
                    r = this;
                r.animateHeight(),
                    !0 === r.options.rtl && !1 === r.options.vertical && (t = -t),
                    !1 === r.transformsEnabled
                        ? !1 === r.options.vertical
                            ? r.$slideTrack.animate({ left: t }, r.options.speed, r.options.easing, i)
                            : r.$slideTrack.animate({ top: t }, r.options.speed, r.options.easing, i)
                        : !1 === r.cssTransitions
                            ? (!0 === r.options.rtl && (r.currentLeft = -r.currentLeft),
                                e({ animStart: r.currentLeft }).animate(
                                    { animStart: t },
                                    {
                                        duration: r.options.speed,
                                        easing: r.options.easing,
                                        step: function (e) {
                                            (e = Math.ceil(e)),
                                                !1 === r.options.vertical
                                                    ? ((n[r.animType] = 'translate(' + e + 'px, 0px)'), r.$slideTrack.css(n))
                                                    : ((n[r.animType] = 'translate(0px,' + e + 'px)'), r.$slideTrack.css(n));
                                        },
                                        complete: function () {
                                            i && i.call();
                                        },
                                    },
                                ))
                            : (r.applyTransition(),
                                (t = Math.ceil(t)),
                                !1 === r.options.vertical
                                    ? (n[r.animType] = 'translate3d(' + t + 'px, 0px, 0px)')
                                    : (n[r.animType] = 'translate3d(0px,' + t + 'px, 0px)'),
                                r.$slideTrack.css(n),
                                i &&
                                setTimeout(function () {
                                    r.disableTransition(), i.call();
                                }, r.options.speed));
            }),
            (t.prototype.getNavTarget = function () {
                var t = this.options.asNavFor;
                return t && null !== t && (t = e(t).not(this.$slider)), t;
            }),
            (t.prototype.asNavFor = function (t) {
                var i = this.getNavTarget();
                null !== i &&
                    'object' == typeof i &&
                    i.each(function () {
                        var i = e(this).slick('getSlick');
                        i.unslicked || i.slideHandler(t, !0);
                    });
            }),
            (t.prototype.applyTransition = function (e) {
                var t = this,
                    i = {};
                !1 === t.options.fade
                    ? (i[t.transitionType] =
                        t.transformType + ' ' + t.options.speed + 'ms ' + t.options.cssEase)
                    : (i[t.transitionType] = 'opacity ' + t.options.speed + 'ms ' + t.options.cssEase),
                    !1 === t.options.fade ? t.$slideTrack.css(i) : t.$slides.eq(e).css(i);
            }),
            (t.prototype.autoPlay = function () {
                var e = this;
                e.autoPlayClear(),
                    e.slideCount > e.options.slidesToShow &&
                    (e.autoPlayTimer = setInterval(e.autoPlayIterator, e.options.autoplaySpeed));
            }),
            (t.prototype.autoPlayClear = function () {
                this.autoPlayTimer && clearInterval(this.autoPlayTimer);
            }),
            (t.prototype.autoPlayIterator = function () {
                var e = this,
                    t = e.currentSlide + e.options.slidesToScroll;
                e.paused ||
                    e.interrupted ||
                    e.focussed ||
                    (!1 === e.options.infinite &&
                        (1 === e.direction && e.currentSlide + 1 === e.slideCount - 1
                            ? (e.direction = 0)
                            : 0 === e.direction &&
                            ((t = e.currentSlide - e.options.slidesToScroll),
                                e.currentSlide - 1 == 0 && (e.direction = 1))),
                        e.slideHandler(t));
            }),
            (t.prototype.buildArrows = function () {
                var t = this;
                !0 === t.options.arrows &&
                    ((t.$prevArrow = e(t.options.prevArrow).addClass('slick-arrow')),
                        (t.$nextArrow = e(t.options.nextArrow).addClass('slick-arrow')),
                        t.slideCount > t.options.slidesToShow
                            ? (t.$prevArrow.removeClass('slick-hidden').removeAttr('aria-hidden tabindex'),
                                t.$nextArrow.removeClass('slick-hidden').removeAttr('aria-hidden tabindex'),
                                t.htmlExpr.test(t.options.prevArrow) &&
                                t.$prevArrow.prependTo(t.options.appendArrows),
                                t.htmlExpr.test(t.options.nextArrow) && t.$nextArrow.appendTo(t.options.appendArrows),
                                !0 !== t.options.infinite &&
                                t.$prevArrow.addClass('slick-disabled').attr('aria-disabled', 'true'))
                            : t.$prevArrow
                                .add(t.$nextArrow)
                                .addClass('slick-hidden')
                                .attr({ 'aria-disabled': 'true', tabindex: '-1' }));
            }),
            (t.prototype.buildDots = function () {
                var t,
                    i,
                    n = this;
                if (!0 === n.options.dots) {
                    for (
                        n.$slider.addClass('slick-dotted'),
                        i = e('<ul />').addClass(n.options.dotsClass),
                        t = 0;
                        t <= n.getDotCount();
                        t += 1
                    )
                        i.append(e('<li />').append(n.options.customPaging.call(this, n, t)));
                    (n.$dots = i.appendTo(n.options.appendDots)),
                        n.$dots.find('li').first().addClass('slick-active');
                }
            }),
            (t.prototype.buildOut = function () {
                var t = this;
                (t.$slides = t.$slider
                    .children(t.options.slide + ':not(.slick-cloned)')
                    .addClass('slick-slide')),
                    (t.slideCount = t.$slides.length),
                    t.$slides.each(function (t, i) {
                        e(i)
                            .attr('data-slick-index', t)
                            .data('originalStyling', e(i).attr('style') || '');
                    }),
                    t.$slider.addClass('slick-slider'),
                    (t.$slideTrack =
                        0 === t.slideCount
                            ? e('<div class="slick-track"/>').appendTo(t.$slider)
                            : t.$slides.wrapAll('<div class="slick-track"/>').parent()),
                    (t.$list = t.$slideTrack.wrap('<div class="slick-list"/>').parent()),
                    t.$slideTrack.css('opacity', 0),
                    (!0 !== t.options.centerMode && !0 !== t.options.swipeToSlide) ||
                    (t.options.slidesToScroll = 1),
                    e('img[data-lazy]', t.$slider).not('[src]').addClass('slick-loading'),
                    t.setupInfinite(),
                    t.buildArrows(),
                    t.buildDots(),
                    t.updateDots(),
                    t.setSlideClasses('number' == typeof t.currentSlide ? t.currentSlide : 0),
                    !0 === t.options.draggable && t.$list.addClass('draggable');
            }),
            (t.prototype.buildRows = function () {
                var e,
                    t,
                    i,
                    n,
                    r,
                    o,
                    s,
                    a = this;
                if (
                    ((n = document.createDocumentFragment()), (o = a.$slider.children()), a.options.rows > 1)
                ) {
                    for (
                        s = a.options.slidesPerRow * a.options.rows, r = Math.ceil(o.length / s), e = 0;
                        e < r;
                        e++
                    ) {
                        var c = document.createElement('div');
                        for (t = 0; t < a.options.rows; t++) {
                            var l = document.createElement('div');
                            for (i = 0; i < a.options.slidesPerRow; i++) {
                                var p = e * s + (t * a.options.slidesPerRow + i);
                                o.get(p) && l.appendChild(o.get(p));
                            }
                            c.appendChild(l);
                        }
                        n.appendChild(c);
                    }
                    a.$slider.empty().append(n),
                        a.$slider
                            .children()
                            .children()
                            .children()
                            .css({ width: 100 / a.options.slidesPerRow + '%', display: 'inline-block' });
                }
            }),
            (t.prototype.checkResponsive = function (t, i) {
                var n,
                    r,
                    o,
                    s = this,
                    a = !1,
                    c = s.$slider.width(),
                    l = window.innerWidth || e(window).width();
                if (
                    ('window' === s.respondTo
                        ? (o = l)
                        : 'slider' === s.respondTo
                            ? (o = c)
                            : 'min' === s.respondTo && (o = Math.min(l, c)),
                        s.options.responsive && s.options.responsive.length && null !== s.options.responsive)
                ) {
                    for (n in ((r = null), s.breakpoints))
                        s.breakpoints.hasOwnProperty(n) &&
                            (!1 === s.originalSettings.mobileFirst
                                ? o < s.breakpoints[n] && (r = s.breakpoints[n])
                                : o > s.breakpoints[n] && (r = s.breakpoints[n]));
                    null !== r
                        ? null !== s.activeBreakpoint
                            ? (r !== s.activeBreakpoint || i) &&
                            ((s.activeBreakpoint = r),
                                'unslick' === s.breakpointSettings[r]
                                    ? s.unslick(r)
                                    : ((s.options = e.extend({}, s.originalSettings, s.breakpointSettings[r])),
                                        !0 === t && (s.currentSlide = s.options.initialSlide),
                                        s.refresh(t)),
                                (a = r))
                            : ((s.activeBreakpoint = r),
                                'unslick' === s.breakpointSettings[r]
                                    ? s.unslick(r)
                                    : ((s.options = e.extend({}, s.originalSettings, s.breakpointSettings[r])),
                                        !0 === t && (s.currentSlide = s.options.initialSlide),
                                        s.refresh(t)),
                                (a = r))
                        : null !== s.activeBreakpoint &&
                        ((s.activeBreakpoint = null),
                            (s.options = s.originalSettings),
                            !0 === t && (s.currentSlide = s.options.initialSlide),
                            s.refresh(t),
                            (a = r)),
                        t || !1 === a || s.$slider.trigger('breakpoint', [s, a]);
                }
            }),
            (t.prototype.changeSlide = function (t, i) {
                var n,
                    r,
                    o = this,
                    s = e(t.currentTarget);
                switch (
                (s.is('a') && t.preventDefault(),
                    s.is('li') || (s = s.closest('li')),
                    (n =
                        o.slideCount % o.options.slidesToScroll != 0
                            ? 0
                            : (o.slideCount - o.currentSlide) % o.options.slidesToScroll),
                    t.data.message)
                ) {
                    case 'previous':
                        (r = 0 === n ? o.options.slidesToScroll : o.options.slidesToShow - n),
                            o.slideCount > o.options.slidesToShow && o.slideHandler(o.currentSlide - r, !1, i);
                        break;
                    case 'next':
                        (r = 0 === n ? o.options.slidesToScroll : n),
                            o.slideCount > o.options.slidesToShow && o.slideHandler(o.currentSlide + r, !1, i);
                        break;
                    case 'index':
                        var a = 0 === t.data.index ? 0 : t.data.index || s.index() * o.options.slidesToScroll;
                        o.slideHandler(o.checkNavigable(a), !1, i), s.children().trigger('focus');
                        break;
                    default:
                        return;
                }
            }),
            (t.prototype.checkNavigable = function (e) {
                var t, i;
                if (((i = 0), e > (t = this.getNavigableIndexes())[t.length - 1])) e = t[t.length - 1];
                else
                    for (var n in t) {
                        if (e < t[n]) {
                            e = i;
                            break;
                        }
                        i = t[n];
                    }
                return e;
            }),
            (t.prototype.cleanUpEvents = function () {
                var t = this;
                t.options.dots &&
                    null !== t.$dots &&
                    (e('li', t.$dots)
                        .off('click.slick', t.changeSlide)
                        .off('mouseenter.slick', e.proxy(t.interrupt, t, !0))
                        .off('mouseleave.slick', e.proxy(t.interrupt, t, !1)),
                        !0 === t.options.accessibility && t.$dots.off('keydown.slick', t.keyHandler)),
                    t.$slider.off('focus.slick blur.slick'),
                    !0 === t.options.arrows &&
                    t.slideCount > t.options.slidesToShow &&
                    (t.$prevArrow && t.$prevArrow.off('click.slick', t.changeSlide),
                        t.$nextArrow && t.$nextArrow.off('click.slick', t.changeSlide),
                        !0 === t.options.accessibility &&
                        (t.$prevArrow && t.$prevArrow.off('keydown.slick', t.keyHandler),
                            t.$nextArrow && t.$nextArrow.off('keydown.slick', t.keyHandler))),
                    t.$list.off('touchstart.slick mousedown.slick', t.swipeHandler),
                    t.$list.off('touchmove.slick mousemove.slick', t.swipeHandler),
                    t.$list.off('touchend.slick mouseup.slick', t.swipeHandler),
                    t.$list.off('touchcancel.slick mouseleave.slick', t.swipeHandler),
                    t.$list.off('click.slick', t.clickHandler),
                    e(document).off(t.visibilityChange, t.visibility),
                    t.cleanUpSlideEvents(),
                    !0 === t.options.accessibility && t.$list.off('keydown.slick', t.keyHandler),
                    !0 === t.options.focusOnSelect &&
                    e(t.$slideTrack).children().off('click.slick', t.selectHandler),
                    e(window).off('orientationchange.slick.slick-' + t.instanceUid, t.orientationChange),
                    e(window).off('resize.slick.slick-' + t.instanceUid, t.resize),
                    e('[draggable!=true]', t.$slideTrack).off('dragstart', t.preventDefault),
                    e(window).off('load.slick.slick-' + t.instanceUid, t.setPosition);
            }),
            (t.prototype.cleanUpSlideEvents = function () {
                var t = this;
                t.$list.off('mouseenter.slick', e.proxy(t.interrupt, t, !0)),
                    t.$list.off('mouseleave.slick', e.proxy(t.interrupt, t, !1));
            }),
            (t.prototype.cleanUpRows = function () {
                var e,
                    t = this;
                t.options.rows > 1 &&
                    ((e = t.$slides.children().children()).removeAttr('style'), t.$slider.empty().append(e));
            }),
            (t.prototype.clickHandler = function (e) {
                !1 === this.shouldClick &&
                    (e.stopImmediatePropagation(), e.stopPropagation(), e.preventDefault());
            }),
            (t.prototype.destroy = function (t) {
                var i = this;
                i.autoPlayClear(),
                    (i.touchObject = {}),
                    i.cleanUpEvents(),
                    e('.slick-cloned', i.$slider).detach(),
                    i.$dots && i.$dots.remove(),
                    i.$prevArrow &&
                    i.$prevArrow.length &&
                    (i.$prevArrow
                        .removeClass('slick-disabled slick-arrow slick-hidden')
                        .removeAttr('aria-hidden aria-disabled tabindex')
                        .css('display', ''),
                        i.htmlExpr.test(i.options.prevArrow) && i.$prevArrow.remove()),
                    i.$nextArrow &&
                    i.$nextArrow.length &&
                    (i.$nextArrow
                        .removeClass('slick-disabled slick-arrow slick-hidden')
                        .removeAttr('aria-hidden aria-disabled tabindex')
                        .css('display', ''),
                        i.htmlExpr.test(i.options.nextArrow) && i.$nextArrow.remove()),
                    i.$slides &&
                    (i.$slides
                        .removeClass('slick-slide slick-active slick-center slick-visible slick-current')
                        .removeAttr('aria-hidden')
                        .removeAttr('data-slick-index')
                        .each(function () {
                            e(this).attr('style', e(this).data('originalStyling'));
                        }),
                        i.$slideTrack.children(this.options.slide).detach(),
                        i.$slideTrack.detach(),
                        i.$list.detach(),
                        i.$slider.append(i.$slides)),
                    i.cleanUpRows(),
                    i.$slider.removeClass('slick-slider'),
                    i.$slider.removeClass('slick-initialized'),
                    i.$slider.removeClass('slick-dotted'),
                    (i.unslicked = !0),
                    t || i.$slider.trigger('destroy', [i]);
            }),
            (t.prototype.disableTransition = function (e) {
                var t = this,
                    i = {};
                (i[t.transitionType] = ''),
                    !1 === t.options.fade ? t.$slideTrack.css(i) : t.$slides.eq(e).css(i);
            }),
            (t.prototype.fadeSlide = function (e, t) {
                var i = this;
                !1 === i.cssTransitions
                    ? (i.$slides.eq(e).css({ zIndex: i.options.zIndex }),
                        i.$slides.eq(e).animate({ opacity: 1 }, i.options.speed, i.options.easing, t))
                    : (i.applyTransition(e),
                        i.$slides.eq(e).css({ opacity: 1, zIndex: i.options.zIndex }),
                        t &&
                        setTimeout(function () {
                            i.disableTransition(e), t.call();
                        }, i.options.speed));
            }),
            (t.prototype.fadeSlideOut = function (e) {
                var t = this;
                !1 === t.cssTransitions
                    ? t.$slides
                        .eq(e)
                        .animate(
                            { opacity: 0, zIndex: t.options.zIndex - 2 },
                            t.options.speed,
                            t.options.easing,
                        )
                    : (t.applyTransition(e),
                        t.$slides.eq(e).css({ opacity: 0, zIndex: t.options.zIndex - 2 }));
            }),
            (t.prototype.filterSlides = t.prototype.slickFilter =
                function (e) {
                    var t = this;
                    null !== e &&
                        ((t.$slidesCache = t.$slides),
                            t.unload(),
                            t.$slideTrack.children(this.options.slide).detach(),
                            t.$slidesCache.filter(e).appendTo(t.$slideTrack),
                            t.reinit());
                }),
            (t.prototype.focusHandler = function () {
                var t = this;
                t.$slider.off('focus.slick blur.slick').on('focus.slick blur.slick', '*', function (i) {
                    i.stopImmediatePropagation();
                    var n = e(this);
                    setTimeout(function () {
                        t.options.pauseOnFocus && ((t.focussed = n.is(':focus')), t.autoPlay());
                    }, 0);
                });
            }),
            (t.prototype.getCurrent = t.prototype.slickCurrentSlide =
                function () {
                    return this.currentSlide;
                }),
            (t.prototype.getDotCount = function () {
                var e = this,
                    t = 0,
                    i = 0,
                    n = 0;
                if (!0 === e.options.infinite)
                    if (e.slideCount <= e.options.slidesToShow) ++n;
                    else
                        for (; t < e.slideCount;)
                            ++n,
                                (t = i + e.options.slidesToScroll),
                                (i +=
                                    e.options.slidesToScroll <= e.options.slidesToShow
                                        ? e.options.slidesToScroll
                                        : e.options.slidesToShow);
                else if (!0 === e.options.centerMode) n = e.slideCount;
                else if (e.options.asNavFor)
                    for (; t < e.slideCount;)
                        ++n,
                            (t = i + e.options.slidesToScroll),
                            (i +=
                                e.options.slidesToScroll <= e.options.slidesToShow
                                    ? e.options.slidesToScroll
                                    : e.options.slidesToShow);
                else n = 1 + Math.ceil((e.slideCount - e.options.slidesToShow) / e.options.slidesToScroll);
                return n - 1;
            }),
            (t.prototype.getLeft = function (e) {
                var t,
                    i,
                    n,
                    r,
                    o = this,
                    s = 0;
                return (
                    (o.slideOffset = 0),
                    (i = o.$slides.first().outerHeight(!0)),
                    !0 === o.options.infinite
                        ? (o.slideCount > o.options.slidesToShow &&
                            ((o.slideOffset = o.slideWidth * o.options.slidesToShow * -1),
                                (r = -1),
                                !0 === o.options.vertical &&
                                !0 === o.options.centerMode &&
                                (2 === o.options.slidesToShow
                                    ? (r = -1.5)
                                    : 1 === o.options.slidesToShow && (r = -2)),
                                (s = i * o.options.slidesToShow * r)),
                            o.slideCount % o.options.slidesToScroll != 0 &&
                            e + o.options.slidesToScroll > o.slideCount &&
                            o.slideCount > o.options.slidesToShow &&
                            (e > o.slideCount
                                ? ((o.slideOffset =
                                    (o.options.slidesToShow - (e - o.slideCount)) * o.slideWidth * -1),
                                    (s = (o.options.slidesToShow - (e - o.slideCount)) * i * -1))
                                : ((o.slideOffset =
                                    (o.slideCount % o.options.slidesToScroll) * o.slideWidth * -1),
                                    (s = (o.slideCount % o.options.slidesToScroll) * i * -1))))
                        : e + o.options.slidesToShow > o.slideCount &&
                        ((o.slideOffset = (e + o.options.slidesToShow - o.slideCount) * o.slideWidth),
                            (s = (e + o.options.slidesToShow - o.slideCount) * i)),
                    o.slideCount <= o.options.slidesToShow && ((o.slideOffset = 0), (s = 0)),
                    !0 === o.options.centerMode && o.slideCount <= o.options.slidesToShow
                        ? (o.slideOffset =
                            (o.slideWidth * Math.floor(o.options.slidesToShow)) / 2 -
                            (o.slideWidth * o.slideCount) / 2)
                        : !0 === o.options.centerMode && !0 === o.options.infinite
                            ? (o.slideOffset +=
                                o.slideWidth * Math.floor(o.options.slidesToShow / 2) - o.slideWidth)
                            : !0 === o.options.centerMode &&
                            ((o.slideOffset = 0),
                                (o.slideOffset += o.slideWidth * Math.floor(o.options.slidesToShow / 2))),
                    (t = !1 === o.options.vertical ? e * o.slideWidth * -1 + o.slideOffset : e * i * -1 + s),
                    !0 === o.options.variableWidth &&
                    ((n =
                        o.slideCount <= o.options.slidesToShow || !1 === o.options.infinite
                            ? o.$slideTrack.children('.slick-slide').eq(e)
                            : o.$slideTrack.children('.slick-slide').eq(e + o.options.slidesToShow)),
                        (t =
                            !0 === o.options.rtl
                                ? n[0]
                                    ? -1 * (o.$slideTrack.width() - n[0].offsetLeft - n.width())
                                    : 0
                                : n[0]
                                    ? -1 * n[0].offsetLeft
                                    : 0),
                        !0 === o.options.centerMode &&
                        ((n =
                            o.slideCount <= o.options.slidesToShow || !1 === o.options.infinite
                                ? o.$slideTrack.children('.slick-slide').eq(e)
                                : o.$slideTrack.children('.slick-slide').eq(e + o.options.slidesToShow + 1)),
                            (t =
                                !0 === o.options.rtl
                                    ? n[0]
                                        ? -1 * (o.$slideTrack.width() - n[0].offsetLeft - n.width())
                                        : 0
                                    : n[0]
                                        ? -1 * n[0].offsetLeft
                                        : 0),
                            (t += (o.$list.width() - n.outerWidth()) / 2))),
                    t
                );
            }),
            (t.prototype.getOption = t.prototype.slickGetOption =
                function (e) {
                    return this.options[e];
                }),
            (t.prototype.getNavigableIndexes = function () {
                var e,
                    t = this,
                    i = 0,
                    n = 0,
                    r = [];
                for (
                    !1 === t.options.infinite
                        ? (e = t.slideCount)
                        : ((i = -1 * t.options.slidesToScroll),
                            (n = -1 * t.options.slidesToScroll),
                            (e = 2 * t.slideCount));
                    i < e;

                )
                    r.push(i),
                        (i = n + t.options.slidesToScroll),
                        (n +=
                            t.options.slidesToScroll <= t.options.slidesToShow
                                ? t.options.slidesToScroll
                                : t.options.slidesToShow);
                return r;
            }),
            (t.prototype.getSlick = function () {
                return this;
            }),
            (t.prototype.getSlideCount = function () {
                var t,
                    i,
                    n = this;
                return (
                    (i =
                        !0 === n.options.centerMode
                            ? n.slideWidth * Math.floor(n.options.slidesToShow / 2)
                            : 0),
                    !0 === n.options.swipeToSlide
                        ? (n.$slideTrack.find('.slick-slide').each(function (r, o) {
                            if (o.offsetLeft - i + e(o).outerWidth() / 2 > -1 * n.swipeLeft) return (t = o), !1;
                        }),
                            Math.abs(e(t).attr('data-slick-index') - n.currentSlide) || 1)
                        : n.options.slidesToScroll
                );
            }),
            (t.prototype.goTo = t.prototype.slickGoTo =
                function (e, t) {
                    this.changeSlide({ data: { message: 'index', index: parseInt(e) } }, t);
                }),
            (t.prototype.init = function (t) {
                var i = this;
                e(i.$slider).hasClass('slick-initialized') ||
                    (e(i.$slider).addClass('slick-initialized'),
                        i.buildRows(),
                        i.buildOut(),
                        i.setProps(),
                        i.startLoad(),
                        i.loadSlider(),
                        i.initializeEvents(),
                        i.updateArrows(),
                        i.updateDots(),
                        i.checkResponsive(!0),
                        i.focusHandler()),
                    t && i.$slider.trigger('init', [i]),
                    !0 === i.options.accessibility && i.initADA(),
                    i.options.autoplay && ((i.paused = !1), i.autoPlay());
            }),
            (t.prototype.initADA = function () {
                var t = this,
                    i = Math.ceil(t.slideCount / t.options.slidesToShow),
                    n = t.getNavigableIndexes().filter(function (e) {
                        return e >= 0 && e < t.slideCount;
                    });
                t.$slides
                    .add(t.$slideTrack.find('.slick-cloned'))
                    .attr({ 'aria-hidden': 'true', tabindex: '-1' })
                    .find('a, input, button, select')
                    .attr({ tabindex: '-1' }),
                    null !== t.$dots &&
                    (t.$slides.not(t.$slideTrack.find('.slick-cloned')).each(function (i) {
                        var r = n.indexOf(i);
                        e(this).attr({
                            role: 'tabpanel',
                            id: 'slick-slide' + t.instanceUid + i,
                            tabindex: -1,
                        }),
                            -1 !== r &&
                            e(this).attr({ 'aria-describedby': 'slick-slide-control' + t.instanceUid + r });
                    }),
                        t.$dots
                            .attr('role', 'tablist')
                            .find('li')
                            .each(function (r) {
                                var o = n[r];
                                e(this).attr({ role: 'presentation' }),
                                    e(this)
                                        .find('button')
                                        .first()
                                        .attr({
                                            role: 'tab',
                                            id: 'slick-slide-control' + t.instanceUid + r,
                                            'aria-controls': 'slick-slide' + t.instanceUid + o,
                                            'aria-label': r + 1 + ' of ' + i,
                                            'aria-selected': null,
                                            tabindex: '-1',
                                        });
                            })
                            .eq(t.currentSlide)
                            .find('button')
                            .attr({ 'aria-selected': 'true', tabindex: '0' })
                            .end());
                for (var r = t.currentSlide, o = r + t.options.slidesToShow; r < o; r++)
                    t.$slides.eq(r).attr('tabindex', 0);
                t.activateADA();
            }),
            (t.prototype.initArrowEvents = function () {
                var e = this;
                !0 === e.options.arrows &&
                    e.slideCount > e.options.slidesToShow &&
                    (e.$prevArrow
                        .off('click.slick')
                        .on('click.slick', { message: 'previous' }, e.changeSlide),
                        e.$nextArrow.off('click.slick').on('click.slick', { message: 'next' }, e.changeSlide),
                        !0 === e.options.accessibility &&
                        (e.$prevArrow.on('keydown.slick', e.keyHandler),
                            e.$nextArrow.on('keydown.slick', e.keyHandler)));
            }),
            (t.prototype.initDotEvents = function () {
                var t = this;
                !0 === t.options.dots &&
                    (e('li', t.$dots).on('click.slick', { message: 'index' }, t.changeSlide),
                        !0 === t.options.accessibility && t.$dots.on('keydown.slick', t.keyHandler)),
                    !0 === t.options.dots &&
                    !0 === t.options.pauseOnDotsHover &&
                    e('li', t.$dots)
                        .on('mouseenter.slick', e.proxy(t.interrupt, t, !0))
                        .on('mouseleave.slick', e.proxy(t.interrupt, t, !1));
            }),
            (t.prototype.initSlideEvents = function () {
                var t = this;
                t.options.pauseOnHover &&
                    (t.$list.on('mouseenter.slick', e.proxy(t.interrupt, t, !0)),
                        t.$list.on('mouseleave.slick', e.proxy(t.interrupt, t, !1)));
            }),
            (t.prototype.initializeEvents = function () {
                var t = this;
                t.initArrowEvents(),
                    t.initDotEvents(),
                    t.initSlideEvents(),
                    t.$list.on('touchstart.slick mousedown.slick', { action: 'start' }, t.swipeHandler),
                    t.$list.on('touchmove.slick mousemove.slick', { action: 'move' }, t.swipeHandler),
                    t.$list.on('touchend.slick mouseup.slick', { action: 'end' }, t.swipeHandler),
                    t.$list.on('touchcancel.slick mouseleave.slick', { action: 'end' }, t.swipeHandler),
                    t.$list.on('click.slick', t.clickHandler),
                    e(document).on(t.visibilityChange, e.proxy(t.visibility, t)),
                    !0 === t.options.accessibility && t.$list.on('keydown.slick', t.keyHandler),
                    !0 === t.options.focusOnSelect &&
                    e(t.$slideTrack).children().on('click.slick', t.selectHandler),
                    e(window).on(
                        'orientationchange.slick.slick-' + t.instanceUid,
                        e.proxy(t.orientationChange, t),
                    ),
                    e(window).on('resize.slick.slick-' + t.instanceUid, e.proxy(t.resize, t)),
                    e('[draggable!=true]', t.$slideTrack).on('dragstart', t.preventDefault),
                    e(window).on('load.slick.slick-' + t.instanceUid, t.setPosition),
                    e(t.setPosition);
            }),
            (t.prototype.initUI = function () {
                var e = this;
                !0 === e.options.arrows &&
                    e.slideCount > e.options.slidesToShow &&
                    (e.$prevArrow.show(), e.$nextArrow.show()),
                    !0 === e.options.dots && e.slideCount > e.options.slidesToShow && e.$dots.show();
            }),
            (t.prototype.keyHandler = function (e) {
                var t = this;
                e.target.tagName.match('TEXTAREA|INPUT|SELECT') ||
                    (37 === e.keyCode && !0 === t.options.accessibility
                        ? t.changeSlide({ data: { message: !0 === t.options.rtl ? 'next' : 'previous' } })
                        : 39 === e.keyCode &&
                        !0 === t.options.accessibility &&
                        t.changeSlide({ data: { message: !0 === t.options.rtl ? 'previous' : 'next' } }));
            }),
            (t.prototype.lazyLoad = function () {
                function t(t) {
                    e('img[data-lazy]', t).each(function () {
                        var t = e(this),
                            i = e(this).attr('data-lazy'),
                            n = e(this).attr('data-srcset'),
                            r = e(this).attr('data-sizes') || o.$slider.attr('data-sizes'),
                            s = document.createElement('img');
                        (s.onload = function () {
                            t.animate({ opacity: 0 }, 100, function () {
                                n && (t.attr('srcset', n), r && t.attr('sizes', r)),
                                    t.attr('src', i).animate({ opacity: 1 }, 200, function () {
                                        t.removeAttr('data-lazy data-srcset data-sizes').removeClass('slick-loading');
                                    }),
                                    o.$slider.trigger('lazyLoaded', [o, t, i]);
                            });
                        }),
                            (s.onerror = function () {
                                t
                                    .removeAttr('data-lazy')
                                    .removeClass('slick-loading')
                                    .addClass('slick-lazyload-error'),
                                    o.$slider.trigger('lazyLoadError', [o, t, i]);
                            }),
                            (s.src = i);
                    });
                }
                var i,
                    n,
                    r,
                    o = this;
                if (
                    (!0 === o.options.centerMode
                        ? !0 === o.options.infinite
                            ? (r =
                                (n = o.currentSlide + (o.options.slidesToShow / 2 + 1)) +
                                o.options.slidesToShow +
                                2)
                            : ((n = Math.max(0, o.currentSlide - (o.options.slidesToShow / 2 + 1))),
                                (r = o.options.slidesToShow / 2 + 1 + 2 + o.currentSlide))
                        : ((n = o.options.infinite ? o.options.slidesToShow + o.currentSlide : o.currentSlide),
                            (r = Math.ceil(n + o.options.slidesToShow)),
                            !0 === o.options.fade && (n > 0 && n--, r <= o.slideCount && r++)),
                        (i = o.$slider.find('.slick-slide').slice(n, r)),
                        'anticipated' === o.options.lazyLoad)
                )
                    for (
                        var s = n - 1, a = r, c = o.$slider.find('.slick-slide'), l = 0;
                        l < o.options.slidesToScroll;
                        l++
                    )
                        s < 0 && (s = o.slideCount - 1), (i = (i = i.add(c.eq(s))).add(c.eq(a))), s--, a++;
                t(i),
                    o.slideCount <= o.options.slidesToShow
                        ? t(o.$slider.find('.slick-slide'))
                        : o.currentSlide >= o.slideCount - o.options.slidesToShow
                            ? t(o.$slider.find('.slick-cloned').slice(0, o.options.slidesToShow))
                            : 0 === o.currentSlide &&
                            t(o.$slider.find('.slick-cloned').slice(-1 * o.options.slidesToShow));
            }),
            (t.prototype.loadSlider = function () {
                var e = this;
                e.setPosition(),
                    e.$slideTrack.css({ opacity: 1 }),
                    e.$slider.removeClass('slick-loading'),
                    e.initUI(),
                    'progressive' === e.options.lazyLoad && e.progressiveLazyLoad();
            }),
            (t.prototype.next = t.prototype.slickNext =
                function () {
                    this.changeSlide({ data: { message: 'next' } });
                }),
            (t.prototype.orientationChange = function () {
                this.checkResponsive(), this.setPosition();
            }),
            (t.prototype.pause = t.prototype.slickPause =
                function () {
                    this.autoPlayClear(), (this.paused = !0);
                }),
            (t.prototype.play = t.prototype.slickPlay =
                function () {
                    var e = this;
                    e.autoPlay(),
                        (e.options.autoplay = !0),
                        (e.paused = !1),
                        (e.focussed = !1),
                        (e.interrupted = !1);
                }),
            (t.prototype.postSlide = function (t) {
                var i = this;
                i.unslicked ||
                    (i.$slider.trigger('afterChange', [i, t]),
                        (i.animating = !1),
                        i.slideCount > i.options.slidesToShow && i.setPosition(),
                        (i.swipeLeft = null),
                        i.options.autoplay && i.autoPlay(),
                        !0 === i.options.accessibility &&
                        (i.initADA(),
                            i.options.focusOnChange &&
                            e(i.$slides.get(i.currentSlide)).attr('tabindex', 0).focus()));
            }),
            (t.prototype.prev = t.prototype.slickPrev =
                function () {
                    this.changeSlide({ data: { message: 'previous' } });
                }),
            (t.prototype.preventDefault = function (e) {
                e.preventDefault();
            }),
            (t.prototype.progressiveLazyLoad = function (t) {
                t = t || 1;
                var i,
                    n,
                    r,
                    o,
                    s,
                    a = this,
                    c = e('img[data-lazy]', a.$slider);
                c.length
                    ? ((i = c.first()),
                        (n = i.attr('data-lazy')),
                        (r = i.attr('data-srcset')),
                        (o = i.attr('data-sizes') || a.$slider.attr('data-sizes')),
                        ((s = document.createElement('img')).onload = function () {
                            r && (i.attr('srcset', r), o && i.attr('sizes', o)),
                                i
                                    .attr('src', n)
                                    .removeAttr('data-lazy data-srcset data-sizes')
                                    .removeClass('slick-loading'),
                                !0 === a.options.adaptiveHeight && a.setPosition(),
                                a.$slider.trigger('lazyLoaded', [a, i, n]),
                                a.progressiveLazyLoad();
                        }),
                        (s.onerror = function () {
                            t < 3
                                ? setTimeout(function () {
                                    a.progressiveLazyLoad(t + 1);
                                }, 500)
                                : (i
                                    .removeAttr('data-lazy')
                                    .removeClass('slick-loading')
                                    .addClass('slick-lazyload-error'),
                                    a.$slider.trigger('lazyLoadError', [a, i, n]),
                                    a.progressiveLazyLoad());
                        }),
                        (s.src = n))
                    : a.$slider.trigger('allImagesLoaded', [a]);
            }),
            (t.prototype.refresh = function (t) {
                var i,
                    n,
                    r = this;
                (n = r.slideCount - r.options.slidesToShow),
                    !r.options.infinite && r.currentSlide > n && (r.currentSlide = n),
                    r.slideCount <= r.options.slidesToShow && (r.currentSlide = 0),
                    (i = r.currentSlide),
                    r.destroy(!0),
                    e.extend(r, r.initials, { currentSlide: i }),
                    r.init(),
                    t || r.changeSlide({ data: { message: 'index', index: i } }, !1);
            }),
            (t.prototype.registerBreakpoints = function () {
                var t,
                    i,
                    n,
                    r = this,
                    o = r.options.responsive || null;
                if ('array' === e.type(o) && o.length) {
                    for (t in ((r.respondTo = r.options.respondTo || 'window'), o))
                        if (((n = r.breakpoints.length - 1), o.hasOwnProperty(t))) {
                            for (i = o[t].breakpoint; n >= 0;)
                                r.breakpoints[n] && r.breakpoints[n] === i && r.breakpoints.splice(n, 1), n--;
                            r.breakpoints.push(i), (r.breakpointSettings[i] = o[t].settings);
                        }
                    r.breakpoints.sort(function (e, t) {
                        return r.options.mobileFirst ? e - t : t - e;
                    });
                }
            }),
            (t.prototype.reinit = function () {
                var t = this;
                (t.$slides = t.$slideTrack.children(t.options.slide).addClass('slick-slide')),
                    (t.slideCount = t.$slides.length),
                    t.currentSlide >= t.slideCount &&
                    0 !== t.currentSlide &&
                    (t.currentSlide = t.currentSlide - t.options.slidesToScroll),
                    t.slideCount <= t.options.slidesToShow && (t.currentSlide = 0),
                    t.registerBreakpoints(),
                    t.setProps(),
                    t.setupInfinite(),
                    t.buildArrows(),
                    t.updateArrows(),
                    t.initArrowEvents(),
                    t.buildDots(),
                    t.updateDots(),
                    t.initDotEvents(),
                    t.cleanUpSlideEvents(),
                    t.initSlideEvents(),
                    t.checkResponsive(!1, !0),
                    !0 === t.options.focusOnSelect &&
                    e(t.$slideTrack).children().on('click.slick', t.selectHandler),
                    t.setSlideClasses('number' == typeof t.currentSlide ? t.currentSlide : 0),
                    t.setPosition(),
                    t.focusHandler(),
                    (t.paused = !t.options.autoplay),
                    t.autoPlay(),
                    t.$slider.trigger('reInit', [t]);
            }),
            (t.prototype.resize = function () {
                var t = this;
                e(window).width() !== t.windowWidth &&
                    (clearTimeout(t.windowDelay),
                        (t.windowDelay = window.setTimeout(function () {
                            (t.windowWidth = e(window).width()),
                                t.checkResponsive(),
                                t.unslicked || t.setPosition();
                        }, 50)));
            }),
            (t.prototype.removeSlide = t.prototype.slickRemove =
                function (e, t, i) {
                    var n = this;
                    if (
                        ((e =
                            'boolean' == typeof e ? (!0 === (t = e) ? 0 : n.slideCount - 1) : !0 === t ? --e : e),
                            n.slideCount < 1 || e < 0 || e > n.slideCount - 1)
                    )
                        return !1;
                    n.unload(),
                        !0 === i
                            ? n.$slideTrack.children().remove()
                            : n.$slideTrack.children(this.options.slide).eq(e).remove(),
                        (n.$slides = n.$slideTrack.children(this.options.slide)),
                        n.$slideTrack.children(this.options.slide).detach(),
                        n.$slideTrack.append(n.$slides),
                        (n.$slidesCache = n.$slides),
                        n.reinit();
                }),
            (t.prototype.setCSS = function (e) {
                var t,
                    i,
                    n = this,
                    r = {};
                !0 === n.options.rtl && (e = -e),
                    (t = 'left' == n.positionProp ? Math.ceil(e) + 'px' : '0px'),
                    (i = 'top' == n.positionProp ? Math.ceil(e) + 'px' : '0px'),
                    (r[n.positionProp] = e),
                    !1 === n.transformsEnabled
                        ? n.$slideTrack.css(r)
                        : ((r = {}),
                            !1 === n.cssTransitions
                                ? ((r[n.animType] = 'translate(' + t + ', ' + i + ')'), n.$slideTrack.css(r))
                                : ((r[n.animType] = 'translate3d(' + t + ', ' + i + ', 0px)'),
                                    n.$slideTrack.css(r)));
            }),
            (t.prototype.setDimensions = function () {
                var e = this;
                !1 === e.options.vertical
                    ? !0 === e.options.centerMode &&
                    e.$list.css({ padding: '0px ' + e.options.centerPadding })
                    : (e.$list.height(e.$slides.first().outerHeight(!0) * e.options.slidesToShow),
                        !0 === e.options.centerMode &&
                        e.$list.css({ padding: e.options.centerPadding + ' 0px' })),
                    (e.listWidth = e.$list.width()),
                    (e.listHeight = e.$list.height()),
                    !1 === e.options.vertical && !1 === e.options.variableWidth
                        ? ((e.slideWidth = Math.ceil(e.listWidth / e.options.slidesToShow)),
                            e.$slideTrack.width(
                                Math.ceil(e.slideWidth * e.$slideTrack.children('.slick-slide').length),
                            ))
                        : !0 === e.options.variableWidth
                            ? e.$slideTrack.width(5e3 * e.slideCount)
                            : ((e.slideWidth = Math.ceil(e.listWidth)),
                                e.$slideTrack.height(
                                    Math.ceil(
                                        e.$slides.first().outerHeight(!0) * e.$slideTrack.children('.slick-slide').length,
                                    ),
                                ));
                var t = e.$slides.first().outerWidth(!0) - e.$slides.first().width();
                !1 === e.options.variableWidth &&
                    e.$slideTrack.children('.slick-slide').width(e.slideWidth - t);
            }),
            (t.prototype.setFade = function () {
                var t,
                    i = this;
                i.$slides.each(function (n, r) {
                    (t = i.slideWidth * n * -1),
                        !0 === i.options.rtl
                            ? e(r).css({
                                position: 'relative',
                                right: t,
                                top: 0,
                                zIndex: i.options.zIndex - 2,
                                opacity: 0,
                            })
                            : e(r).css({
                                position: 'relative',
                                left: t,
                                top: 0,
                                zIndex: i.options.zIndex - 2,
                                opacity: 0,
                            });
                }),
                    i.$slides.eq(i.currentSlide).css({ zIndex: i.options.zIndex - 1, opacity: 1 });
            }),
            (t.prototype.setHeight = function () {
                var e = this;
                if (
                    1 === e.options.slidesToShow &&
                    !0 === e.options.adaptiveHeight &&
                    !1 === e.options.vertical
                ) {
                    var t = e.$slides.eq(e.currentSlide).outerHeight(!0);
                    e.$list.css('height', t);
                }
            }),
            (t.prototype.setOption = t.prototype.slickSetOption =
                function () {
                    var t,
                        i,
                        n,
                        r,
                        o,
                        s = this,
                        a = !1;
                    if (
                        ('object' === e.type(arguments[0])
                            ? ((n = arguments[0]), (a = arguments[1]), (o = 'multiple'))
                            : 'string' === e.type(arguments[0]) &&
                            ((n = arguments[0]),
                                (r = arguments[1]),
                                (a = arguments[2]),
                                'responsive' === arguments[0] && 'array' === e.type(arguments[1])
                                    ? (o = 'responsive')
                                    : void 0 !== arguments[1] && (o = 'single')),
                            'single' === o)
                    )
                        s.options[n] = r;
                    else if ('multiple' === o)
                        e.each(n, function (e, t) {
                            s.options[e] = t;
                        });
                    else if ('responsive' === o)
                        for (i in r)
                            if ('array' !== e.type(s.options.responsive)) s.options.responsive = [r[i]];
                            else {
                                for (t = s.options.responsive.length - 1; t >= 0;)
                                    s.options.responsive[t].breakpoint === r[i].breakpoint &&
                                        s.options.responsive.splice(t, 1),
                                        t--;
                                s.options.responsive.push(r[i]);
                            }
                    a && (s.unload(), s.reinit());
                }),
            (t.prototype.setPosition = function () {
                var e = this;
                e.setDimensions(),
                    e.setHeight(),
                    !1 === e.options.fade ? e.setCSS(e.getLeft(e.currentSlide)) : e.setFade(),
                    e.$slider.trigger('setPosition', [e]);
            }),
            (t.prototype.setProps = function () {
                var e = this,
                    t = document.body.style;
                (e.positionProp = !0 === e.options.vertical ? 'top' : 'left'),
                    'top' === e.positionProp
                        ? e.$slider.addClass('slick-vertical')
                        : e.$slider.removeClass('slick-vertical'),
                    (void 0 === t.WebkitTransition &&
                        void 0 === t.MozTransition &&
                        void 0 === t.msTransition) ||
                    (!0 === e.options.useCSS && (e.cssTransitions = !0)),
                    e.options.fade &&
                    ('number' == typeof e.options.zIndex
                        ? e.options.zIndex < 3 && (e.options.zIndex = 3)
                        : (e.options.zIndex = e.defaults.zIndex)),
                    void 0 !== t.OTransform &&
                    ((e.animType = 'OTransform'),
                        (e.transformType = '-o-transform'),
                        (e.transitionType = 'OTransition'),
                        void 0 === t.perspectiveProperty &&
                        void 0 === t.webkitPerspective &&
                        (e.animType = !1)),
                    void 0 !== t.MozTransform &&
                    ((e.animType = 'MozTransform'),
                        (e.transformType = '-moz-transform'),
                        (e.transitionType = 'MozTransition'),
                        void 0 === t.perspectiveProperty && void 0 === t.MozPerspective && (e.animType = !1)),
                    void 0 !== t.webkitTransform &&
                    ((e.animType = 'webkitTransform'),
                        (e.transformType = '-webkit-transform'),
                        (e.transitionType = 'webkitTransition'),
                        void 0 === t.perspectiveProperty &&
                        void 0 === t.webkitPerspective &&
                        (e.animType = !1)),
                    void 0 !== t.msTransform &&
                    ((e.animType = 'msTransform'),
                        (e.transformType = '-ms-transform'),
                        (e.transitionType = 'msTransition'),
                        void 0 === t.msTransform && (e.animType = !1)),
                    void 0 !== t.transform &&
                    !1 !== e.animType &&
                    ((e.animType = 'transform'),
                        (e.transformType = 'transform'),
                        (e.transitionType = 'transition')),
                    (e.transformsEnabled =
                        e.options.useTransform && null !== e.animType && !1 !== e.animType);
            }),
            (t.prototype.setSlideClasses = function (e) {
                var t,
                    i,
                    n,
                    r,
                    o = this;
                if (
                    ((i = o.$slider
                        .find('.slick-slide')
                        .removeClass('slick-active slick-center slick-current')
                        .attr('aria-hidden', 'true')),
                        o.$slides.eq(e).addClass('slick-current'),
                        !0 === o.options.centerMode)
                ) {
                    var s = o.options.slidesToShow % 2 == 0 ? 1 : 0;
                    (t = Math.floor(o.options.slidesToShow / 2)),
                        !0 === o.options.infinite &&
                        (e >= t && e <= o.slideCount - 1 - t
                            ? o.$slides
                                .slice(e - t + s, e + t + 1)
                                .addClass('slick-active')
                                .attr('aria-hidden', 'false')
                            : ((n = o.options.slidesToShow + e),
                                i
                                    .slice(n - t + 1 + s, n + t + 2)
                                    .addClass('slick-active')
                                    .attr('aria-hidden', 'false')),
                            0 === e
                                ? i.eq(i.length - 1 - o.options.slidesToShow).addClass('slick-center')
                                : e === o.slideCount - 1 && i.eq(o.options.slidesToShow).addClass('slick-center')),
                        o.$slides.eq(e).addClass('slick-center');
                } else
                    e >= 0 && e <= o.slideCount - o.options.slidesToShow
                        ? o.$slides
                            .slice(e, e + o.options.slidesToShow)
                            .addClass('slick-active')
                            .attr('aria-hidden', 'false')
                        : i.length <= o.options.slidesToShow
                            ? i.addClass('slick-active').attr('aria-hidden', 'false')
                            : ((r = o.slideCount % o.options.slidesToShow),
                                (n = !0 === o.options.infinite ? o.options.slidesToShow + e : e),
                                o.options.slidesToShow == o.options.slidesToScroll &&
                                    o.slideCount - e < o.options.slidesToShow
                                    ? i
                                        .slice(n - (o.options.slidesToShow - r), n + r)
                                        .addClass('slick-active')
                                        .attr('aria-hidden', 'false')
                                    : i
                                        .slice(n, n + o.options.slidesToShow)
                                        .addClass('slick-active')
                                        .attr('aria-hidden', 'false'));
                ('ondemand' !== o.options.lazyLoad && 'anticipated' !== o.options.lazyLoad) || o.lazyLoad();
            }),
            (t.prototype.setupInfinite = function () {
                var t,
                    i,
                    n,
                    r = this;
                if (
                    (!0 === r.options.fade && (r.options.centerMode = !1),
                        !0 === r.options.infinite &&
                        !1 === r.options.fade &&
                        ((i = null), r.slideCount > r.options.slidesToShow))
                ) {
                    for (
                        n = !0 === r.options.centerMode ? r.options.slidesToShow + 1 : r.options.slidesToShow,
                        t = r.slideCount;
                        t > r.slideCount - n;
                        t -= 1
                    )
                        (i = t - 1),
                            e(r.$slides[i])
                                .clone(!0)
                                .attr('id', '')
                                .attr('data-slick-index', i - r.slideCount)
                                .prependTo(r.$slideTrack)
                                .addClass('slick-cloned');
                    for (t = 0; t < n + r.slideCount; t += 1)
                        (i = t),
                            e(r.$slides[i])
                                .clone(!0)
                                .attr('id', '')
                                .attr('data-slick-index', i + r.slideCount)
                                .appendTo(r.$slideTrack)
                                .addClass('slick-cloned');
                    r.$slideTrack
                        .find('.slick-cloned')
                        .find('[id]')
                        .each(function () {
                            e(this).attr('id', '');
                        });
                }
            }),
            (t.prototype.interrupt = function (e) {
                e || this.autoPlay(), (this.interrupted = e);
            }),
            (t.prototype.selectHandler = function (t) {
                var i = this,
                    n = e(t.target).is('.slick-slide') ? e(t.target) : e(t.target).parents('.slick-slide'),
                    r = parseInt(n.attr('data-slick-index'));
                r || (r = 0),
                    i.slideCount <= i.options.slidesToShow ? i.slideHandler(r, !1, !0) : i.slideHandler(r);
            }),
            (t.prototype.slideHandler = function (e, t, i) {
                var n,
                    r,
                    o,
                    s,
                    a,
                    c = null,
                    l = this;
                if (
                    ((t = t || !1),
                        !(
                            (!0 === l.animating && !0 === l.options.waitForAnimate) ||
                            (!0 === l.options.fade && l.currentSlide === e)
                        ))
                )
                    if (
                        (!1 === t && l.asNavFor(e),
                            (n = e),
                            (c = l.getLeft(n)),
                            (s = l.getLeft(l.currentSlide)),
                            (l.currentLeft = null === l.swipeLeft ? s : l.swipeLeft),
                            !1 === l.options.infinite &&
                            !1 === l.options.centerMode &&
                            (e < 0 || e > l.getDotCount() * l.options.slidesToScroll))
                    )
                        !1 === l.options.fade &&
                            ((n = l.currentSlide),
                                !0 !== i
                                    ? l.animateSlide(s, function () {
                                        l.postSlide(n);
                                    })
                                    : l.postSlide(n));
                    else if (
                        !1 === l.options.infinite &&
                        !0 === l.options.centerMode &&
                        (e < 0 || e > l.slideCount - l.options.slidesToScroll)
                    )
                        !1 === l.options.fade &&
                            ((n = l.currentSlide),
                                !0 !== i
                                    ? l.animateSlide(s, function () {
                                        l.postSlide(n);
                                    })
                                    : l.postSlide(n));
                    else {
                        if (
                            (l.options.autoplay && clearInterval(l.autoPlayTimer),
                                (r =
                                    n < 0
                                        ? l.slideCount % l.options.slidesToScroll != 0
                                            ? l.slideCount - (l.slideCount % l.options.slidesToScroll)
                                            : l.slideCount + n
                                        : n >= l.slideCount
                                            ? l.slideCount % l.options.slidesToScroll != 0
                                                ? 0
                                                : n - l.slideCount
                                            : n),
                                (l.animating = !0),
                                l.$slider.trigger('beforeChange', [l, l.currentSlide, r]),
                                (o = l.currentSlide),
                                (l.currentSlide = r),
                                l.setSlideClasses(l.currentSlide),
                                l.options.asNavFor &&
                                (a = (a = l.getNavTarget()).slick('getSlick')).slideCount <=
                                a.options.slidesToShow &&
                                a.setSlideClasses(l.currentSlide),
                                l.updateDots(),
                                l.updateArrows(),
                                !0 === l.options.fade)
                        )
                            return (
                                !0 !== i
                                    ? (l.fadeSlideOut(o),
                                        l.fadeSlide(r, function () {
                                            l.postSlide(r);
                                        }))
                                    : l.postSlide(r),
                                void l.animateHeight()
                            );
                        !0 !== i
                            ? l.animateSlide(c, function () {
                                l.postSlide(r);
                            })
                            : l.postSlide(r);
                    }
            }),
            (t.prototype.startLoad = function () {
                var e = this;
                !0 === e.options.arrows &&
                    e.slideCount > e.options.slidesToShow &&
                    (e.$prevArrow.hide(), e.$nextArrow.hide()),
                    !0 === e.options.dots && e.slideCount > e.options.slidesToShow && e.$dots.hide(),
                    e.$slider.addClass('slick-loading');
            }),
            (t.prototype.swipeDirection = function () {
                var e,
                    t,
                    i,
                    n,
                    r = this;
                return (
                    (e = r.touchObject.startX - r.touchObject.curX),
                    (t = r.touchObject.startY - r.touchObject.curY),
                    (i = Math.atan2(t, e)),
                    (n = Math.round((180 * i) / Math.PI)) < 0 && (n = 360 - Math.abs(n)),
                    (n <= 45 && n >= 0) || (n <= 360 && n >= 315)
                        ? !1 === r.options.rtl
                            ? 'left'
                            : 'right'
                        : n >= 135 && n <= 225
                            ? !1 === r.options.rtl
                                ? 'right'
                                : 'left'
                            : !0 === r.options.verticalSwiping
                                ? n >= 35 && n <= 135
                                    ? 'down'
                                    : 'up'
                                : 'vertical'
                );
            }),
            (t.prototype.swipeEnd = function (e) {
                var t,
                    i,
                    n = this;
                if (((n.dragging = !1), (n.swiping = !1), n.scrolling)) return (n.scrolling = !1), !1;
                if (
                    ((n.interrupted = !1),
                        (n.shouldClick = !(n.touchObject.swipeLength > 10)),
                        void 0 === n.touchObject.curX)
                )
                    return !1;
                if (
                    (!0 === n.touchObject.edgeHit && n.$slider.trigger('edge', [n, n.swipeDirection()]),
                        n.touchObject.swipeLength >= n.touchObject.minSwipe)
                ) {
                    switch ((i = n.swipeDirection())) {
                        case 'left':
                        case 'down':
                            (t = n.options.swipeToSlide
                                ? n.checkNavigable(n.currentSlide + n.getSlideCount())
                                : n.currentSlide + n.getSlideCount()),
                                (n.currentDirection = 0);
                            break;
                        case 'right':
                        case 'up':
                            (t = n.options.swipeToSlide
                                ? n.checkNavigable(n.currentSlide - n.getSlideCount())
                                : n.currentSlide - n.getSlideCount()),
                                (n.currentDirection = 1);
                    }
                    'vertical' != i &&
                        (n.slideHandler(t), (n.touchObject = {}), n.$slider.trigger('swipe', [n, i]));
                } else
                    n.touchObject.startX !== n.touchObject.curX &&
                        (n.slideHandler(n.currentSlide), (n.touchObject = {}));
            }),
            (t.prototype.swipeHandler = function (e) {
                var t = this;
                if (
                    !(
                        !1 === t.options.swipe ||
                        ('ontouchend' in document && !1 === t.options.swipe) ||
                        (!1 === t.options.draggable && -1 !== e.type.indexOf('mouse'))
                    )
                )
                    switch (
                    ((t.touchObject.fingerCount =
                        e.originalEvent && void 0 !== e.originalEvent.touches
                            ? e.originalEvent.touches.length
                            : 1),
                        (t.touchObject.minSwipe = t.listWidth / t.options.touchThreshold),
                        !0 === t.options.verticalSwiping &&
                        (t.touchObject.minSwipe = t.listHeight / t.options.touchThreshold),
                        e.data.action)
                    ) {
                        case 'start':
                            t.swipeStart(e);
                            break;
                        case 'move':
                            t.swipeMove(e);
                            break;
                        case 'end':
                            t.swipeEnd(e);
                    }
            }),
            (t.prototype.swipeMove = function (e) {
                var t,
                    i,
                    n,
                    r,
                    o,
                    s,
                    a = this;
                return (
                    (o = void 0 !== e.originalEvent ? e.originalEvent.touches : null),
                    !(!a.dragging || a.scrolling || (o && 1 !== o.length)) &&
                    ((t = a.getLeft(a.currentSlide)),
                        (a.touchObject.curX = void 0 !== o ? o[0].pageX : e.clientX),
                        (a.touchObject.curY = void 0 !== o ? o[0].pageY : e.clientY),
                        (a.touchObject.swipeLength = Math.round(
                            Math.sqrt(Math.pow(a.touchObject.curX - a.touchObject.startX, 2)),
                        )),
                        (s = Math.round(Math.sqrt(Math.pow(a.touchObject.curY - a.touchObject.startY, 2)))),
                        !a.options.verticalSwiping && !a.swiping && s > 4
                            ? ((a.scrolling = !0), !1)
                            : (!0 === a.options.verticalSwiping && (a.touchObject.swipeLength = s),
                                (i = a.swipeDirection()),
                                void 0 !== e.originalEvent &&
                                a.touchObject.swipeLength > 4 &&
                                ((a.swiping = !0), e.preventDefault()),
                                (r =
                                    (!1 === a.options.rtl ? 1 : -1) *
                                    (a.touchObject.curX > a.touchObject.startX ? 1 : -1)),
                                !0 === a.options.verticalSwiping &&
                                (r = a.touchObject.curY > a.touchObject.startY ? 1 : -1),
                                (n = a.touchObject.swipeLength),
                                (a.touchObject.edgeHit = !1),
                                !1 === a.options.infinite &&
                                ((0 === a.currentSlide && 'right' === i) ||
                                    (a.currentSlide >= a.getDotCount() && 'left' === i)) &&
                                ((n = a.touchObject.swipeLength * a.options.edgeFriction),
                                    (a.touchObject.edgeHit = !0)),
                                !1 === a.options.vertical
                                    ? (a.swipeLeft = t + n * r)
                                    : (a.swipeLeft = t + n * (a.$list.height() / a.listWidth) * r),
                                !0 === a.options.verticalSwiping && (a.swipeLeft = t + n * r),
                                !0 !== a.options.fade &&
                                !1 !== a.options.touchMove &&
                                (!0 === a.animating ? ((a.swipeLeft = null), !1) : void a.setCSS(a.swipeLeft))))
                );
            }),
            (t.prototype.swipeStart = function (e) {
                var t,
                    i = this;
                if (
                    ((i.interrupted = !0),
                        1 !== i.touchObject.fingerCount || i.slideCount <= i.options.slidesToShow)
                )
                    return (i.touchObject = {}), !1;
                void 0 !== e.originalEvent &&
                    void 0 !== e.originalEvent.touches &&
                    (t = e.originalEvent.touches[0]),
                    (i.touchObject.startX = i.touchObject.curX = void 0 !== t ? t.pageX : e.clientX),
                    (i.touchObject.startY = i.touchObject.curY = void 0 !== t ? t.pageY : e.clientY),
                    (i.dragging = !0);
            }),
            (t.prototype.unfilterSlides = t.prototype.slickUnfilter =
                function () {
                    var e = this;
                    null !== e.$slidesCache &&
                        (e.unload(),
                            e.$slideTrack.children(this.options.slide).detach(),
                            e.$slidesCache.appendTo(e.$slideTrack),
                            e.reinit());
                }),
            (t.prototype.unload = function () {
                var t = this;
                e('.slick-cloned', t.$slider).remove(),
                    t.$dots && t.$dots.remove(),
                    t.$prevArrow && t.htmlExpr.test(t.options.prevArrow) && t.$prevArrow.remove(),
                    t.$nextArrow && t.htmlExpr.test(t.options.nextArrow) && t.$nextArrow.remove(),
                    t.$slides
                        .removeClass('slick-slide slick-active slick-visible slick-current')
                        .attr('aria-hidden', 'true')
                        .css('width', '');
            }),
            (t.prototype.unslick = function (e) {
                var t = this;
                t.$slider.trigger('unslick', [t, e]), t.destroy();
            }),
            (t.prototype.updateArrows = function () {
                var e = this;
                Math.floor(e.options.slidesToShow / 2),
                    !0 === e.options.arrows &&
                    e.slideCount > e.options.slidesToShow &&
                    !e.options.infinite &&
                    (e.$prevArrow.removeClass('slick-disabled').attr('aria-disabled', 'false'),
                        e.$nextArrow.removeClass('slick-disabled').attr('aria-disabled', 'false'),
                        0 === e.currentSlide
                            ? (e.$prevArrow.addClass('slick-disabled').attr('aria-disabled', 'true'),
                                e.$nextArrow.removeClass('slick-disabled').attr('aria-disabled', 'false'))
                            : ((e.currentSlide >= e.slideCount - e.options.slidesToShow &&
                                !1 === e.options.centerMode) ||
                                (e.currentSlide >= e.slideCount - 1 && !0 === e.options.centerMode)) &&
                            (e.$nextArrow.addClass('slick-disabled').attr('aria-disabled', 'true'),
                                e.$prevArrow.removeClass('slick-disabled').attr('aria-disabled', 'false')));
            }),
            (t.prototype.updateDots = function () {
                var e = this;
                null !== e.$dots &&
                    (e.$dots.find('li').removeClass('slick-active').end(),
                        e.$dots
                            .find('li')
                            .eq(Math.floor(e.currentSlide / e.options.slidesToScroll))
                            .addClass('slick-active'));
            }),
            (t.prototype.visibility = function () {
                var e = this;
                e.options.autoplay && (document[e.hidden] ? (e.interrupted = !0) : (e.interrupted = !1));
            }),
            (e.fn.slick = function () {
                var e,
                    i,
                    n = this,
                    r = arguments[0],
                    o = Array.prototype.slice.call(arguments, 1),
                    s = n.length;
                for (e = 0; e < s; e++)
                    if (
                        ('object' == typeof r || void 0 === r
                            ? (n[e].slick = new t(n[e], r))
                            : (i = n[e].slick[r].apply(n[e].slick, o)),
                            void 0 !== i)
                    )
                        return i;
                return n;
            });
    });
var centerImage = function (e, t, i) {
    var n = [];
    $(e).each(function (e) {
        var r = new Image();
        (r.src = $(this).attr('src')),
            (n[e] = $(this)),
            (elementHeight = 0),
            r.complete
                ? ((elementHeight = n[e].is(':visible') ? n[e].height() : r.height),
                    elementHeight > t
                        ? n[e].css('max-height', t)
                        : n[e].css({
                            'background-color': i,
                            'padding-top': (t - elementHeight) / 2,
                            'padding-bottom': (t - elementHeight) / 2,
                        }))
                : (r.onload = function () {
                    (elementHeight = n[e].is(':visible') ? n[e].height() : r.height),
                        elementHeight > t
                            ? n[e].css('max-height', t)
                            : n[e].css({
                                'background-color': i,
                                'padding-top': (t - elementHeight) / 2,
                                'padding-bottom': (t - elementHeight) / 2,
                            });
                });
    });
};
function parseURLParams(e) {
    var t = {},
        i = e.indexOf('?') + 1,
        n = e.indexOf('#') + 1 || e.length + 1,
        r = e.slice(i, n - 1);
    if (r === e || '' === r) return t;
    for (var o = r.replace(/\+/g, ' ').split('&'), s = 0; s < o.length; s++) {
        var a = o[s].split('='),
            c = decodeURIComponent(a[0]),
            l = decodeURIComponent(a[1]);
        c in t || (t[c] = []), t[c].push(2 === a.length ? l : null);
    }
    return t;
}
(jQuery.cookie = function (e, t, i) {
    if (arguments.length > 1 && '[object Object]' !== String(t)) {
        if (((i = jQuery.extend({}, i)), null == t && (i.expires = -1), 'number' == typeof i.expires)) {
            var n = i.expires,
                r = (i.expires = new Date());
            r.setDate(r.getDate() + n);
        }
        return (
            (t = String(t)),
            (document.cookie = [
                encodeURIComponent(e),
                '=',
                i.raw ? t : encodeURIComponent(t),
                i.expires ? '; expires=' + i.expires.toUTCString() : '',
                i.path ? '; path=' + i.path : '',
                i.domain ? '; domain=' + i.domain : '',
                i.secure ? '; secure' : '',
            ].join(''))
        );
    }
    var o,
        s = (i = t || {}).raw
            ? function (e) {
                return e;
            }
            : decodeURIComponent;
    return (o = new RegExp('(?:^|; )' + encodeURIComponent(e) + '=([^;]*)').exec(document.cookie))
        ? s(o[1])
        : null;
}),
    (function (e) {
        'use strict';
        function t(e, t) {
            var i = (65535 & e) + (65535 & t);
            return (((e >> 16) + (t >> 16) + (i >> 16)) << 16) | (65535 & i);
        }
        function i(e, i, n, r, o, s) {
            return t(
                (function (e, t) {
                    return (e << t) | (e >>> (32 - t));
                })(t(t(i, e), t(r, s)), o),
                n,
            );
        }
        function n(e, t, n, r, o, s, a) {
            return i((t & n) | (~t & r), e, t, o, s, a);
        }
        function r(e, t, n, r, o, s, a) {
            return i((t & r) | (n & ~r), e, t, o, s, a);
        }
        function o(e, t, n, r, o, s, a) {
            return i(t ^ n ^ r, e, t, o, s, a);
        }
        function s(e, t, n, r, o, s, a) {
            return i(n ^ (t | ~r), e, t, o, s, a);
        }
        function a(e, i) {
            (e[i >> 5] |= 128 << i % 32), (e[14 + (((i + 64) >>> 9) << 4)] = i);
            var a,
                c,
                l,
                p,
                d,
                u = 1732584193,
                h = -271733879,
                f = -1732584194,
                m = 271733878;
            for (a = 0; a < e.length; a += 16)
                (c = u),
                    (l = h),
                    (p = f),
                    (d = m),
                    (h = s(
                        (h = s(
                            (h = s(
                                (h = s(
                                    (h = o(
                                        (h = o(
                                            (h = o(
                                                (h = o(
                                                    (h = r(
                                                        (h = r(
                                                            (h = r(
                                                                (h = r(
                                                                    (h = n(
                                                                        (h = n(
                                                                            (h = n(
                                                                                (h = n(
                                                                                    h,
                                                                                    (f = n(
                                                                                        f,
                                                                                        (m = n(
                                                                                            m,
                                                                                            (u = n(u, h, f, m, e[a], 7, -680876936)),
                                                                                            h,
                                                                                            f,
                                                                                            e[a + 1],
                                                                                            12,
                                                                                            -389564586,
                                                                                        )),
                                                                                        u,
                                                                                        h,
                                                                                        e[a + 2],
                                                                                        17,
                                                                                        606105819,
                                                                                    )),
                                                                                    m,
                                                                                    u,
                                                                                    e[a + 3],
                                                                                    22,
                                                                                    -1044525330,
                                                                                )),
                                                                                (f = n(
                                                                                    f,
                                                                                    (m = n(
                                                                                        m,
                                                                                        (u = n(u, h, f, m, e[a + 4], 7, -176418897)),
                                                                                        h,
                                                                                        f,
                                                                                        e[a + 5],
                                                                                        12,
                                                                                        1200080426,
                                                                                    )),
                                                                                    u,
                                                                                    h,
                                                                                    e[a + 6],
                                                                                    17,
                                                                                    -1473231341,
                                                                                )),
                                                                                m,
                                                                                u,
                                                                                e[a + 7],
                                                                                22,
                                                                                -45705983,
                                                                            )),
                                                                            (f = n(
                                                                                f,
                                                                                (m = n(
                                                                                    m,
                                                                                    (u = n(u, h, f, m, e[a + 8], 7, 1770035416)),
                                                                                    h,
                                                                                    f,
                                                                                    e[a + 9],
                                                                                    12,
                                                                                    -1958414417,
                                                                                )),
                                                                                u,
                                                                                h,
                                                                                e[a + 10],
                                                                                17,
                                                                                -42063,
                                                                            )),
                                                                            m,
                                                                            u,
                                                                            e[a + 11],
                                                                            22,
                                                                            -1990404162,
                                                                        )),
                                                                        (f = n(
                                                                            f,
                                                                            (m = n(
                                                                                m,
                                                                                (u = n(u, h, f, m, e[a + 12], 7, 1804603682)),
                                                                                h,
                                                                                f,
                                                                                e[a + 13],
                                                                                12,
                                                                                -40341101,
                                                                            )),
                                                                            u,
                                                                            h,
                                                                            e[a + 14],
                                                                            17,
                                                                            -1502002290,
                                                                        )),
                                                                        m,
                                                                        u,
                                                                        e[a + 15],
                                                                        22,
                                                                        1236535329,
                                                                    )),
                                                                    (f = r(
                                                                        f,
                                                                        (m = r(
                                                                            m,
                                                                            (u = r(u, h, f, m, e[a + 1], 5, -165796510)),
                                                                            h,
                                                                            f,
                                                                            e[a + 6],
                                                                            9,
                                                                            -1069501632,
                                                                        )),
                                                                        u,
                                                                        h,
                                                                        e[a + 11],
                                                                        14,
                                                                        643717713,
                                                                    )),
                                                                    m,
                                                                    u,
                                                                    e[a],
                                                                    20,
                                                                    -373897302,
                                                                )),
                                                                (f = r(
                                                                    f,
                                                                    (m = r(
                                                                        m,
                                                                        (u = r(u, h, f, m, e[a + 5], 5, -701558691)),
                                                                        h,
                                                                        f,
                                                                        e[a + 10],
                                                                        9,
                                                                        38016083,
                                                                    )),
                                                                    u,
                                                                    h,
                                                                    e[a + 15],
                                                                    14,
                                                                    -660478335,
                                                                )),
                                                                m,
                                                                u,
                                                                e[a + 4],
                                                                20,
                                                                -405537848,
                                                            )),
                                                            (f = r(
                                                                f,
                                                                (m = r(
                                                                    m,
                                                                    (u = r(u, h, f, m, e[a + 9], 5, 568446438)),
                                                                    h,
                                                                    f,
                                                                    e[a + 14],
                                                                    9,
                                                                    -1019803690,
                                                                )),
                                                                u,
                                                                h,
                                                                e[a + 3],
                                                                14,
                                                                -187363961,
                                                            )),
                                                            m,
                                                            u,
                                                            e[a + 8],
                                                            20,
                                                            1163531501,
                                                        )),
                                                        (f = r(
                                                            f,
                                                            (m = r(
                                                                m,
                                                                (u = r(u, h, f, m, e[a + 13], 5, -1444681467)),
                                                                h,
                                                                f,
                                                                e[a + 2],
                                                                9,
                                                                -51403784,
                                                            )),
                                                            u,
                                                            h,
                                                            e[a + 7],
                                                            14,
                                                            1735328473,
                                                        )),
                                                        m,
                                                        u,
                                                        e[a + 12],
                                                        20,
                                                        -1926607734,
                                                    )),
                                                    (f = o(
                                                        f,
                                                        (m = o(
                                                            m,
                                                            (u = o(u, h, f, m, e[a + 5], 4, -378558)),
                                                            h,
                                                            f,
                                                            e[a + 8],
                                                            11,
                                                            -2022574463,
                                                        )),
                                                        u,
                                                        h,
                                                        e[a + 11],
                                                        16,
                                                        1839030562,
                                                    )),
                                                    m,
                                                    u,
                                                    e[a + 14],
                                                    23,
                                                    -35309556,
                                                )),
                                                (f = o(
                                                    f,
                                                    (m = o(
                                                        m,
                                                        (u = o(u, h, f, m, e[a + 1], 4, -1530992060)),
                                                        h,
                                                        f,
                                                        e[a + 4],
                                                        11,
                                                        1272893353,
                                                    )),
                                                    u,
                                                    h,
                                                    e[a + 7],
                                                    16,
                                                    -155497632,
                                                )),
                                                m,
                                                u,
                                                e[a + 10],
                                                23,
                                                -1094730640,
                                            )),
                                            (f = o(
                                                f,
                                                (m = o(
                                                    m,
                                                    (u = o(u, h, f, m, e[a + 13], 4, 681279174)),
                                                    h,
                                                    f,
                                                    e[a],
                                                    11,
                                                    -358537222,
                                                )),
                                                u,
                                                h,
                                                e[a + 3],
                                                16,
                                                -722521979,
                                            )),
                                            m,
                                            u,
                                            e[a + 6],
                                            23,
                                            76029189,
                                        )),
                                        (f = o(
                                            f,
                                            (m = o(
                                                m,
                                                (u = o(u, h, f, m, e[a + 9], 4, -640364487)),
                                                h,
                                                f,
                                                e[a + 12],
                                                11,
                                                -421815835,
                                            )),
                                            u,
                                            h,
                                            e[a + 15],
                                            16,
                                            530742520,
                                        )),
                                        m,
                                        u,
                                        e[a + 2],
                                        23,
                                        -995338651,
                                    )),
                                    (f = s(
                                        f,
                                        (m = s(
                                            m,
                                            (u = s(u, h, f, m, e[a], 6, -198630844)),
                                            h,
                                            f,
                                            e[a + 7],
                                            10,
                                            1126891415,
                                        )),
                                        u,
                                        h,
                                        e[a + 14],
                                        15,
                                        -1416354905,
                                    )),
                                    m,
                                    u,
                                    e[a + 5],
                                    21,
                                    -57434055,
                                )),
                                (f = s(
                                    f,
                                    (m = s(
                                        m,
                                        (u = s(u, h, f, m, e[a + 12], 6, 1700485571)),
                                        h,
                                        f,
                                        e[a + 3],
                                        10,
                                        -1894986606,
                                    )),
                                    u,
                                    h,
                                    e[a + 10],
                                    15,
                                    -1051523,
                                )),
                                m,
                                u,
                                e[a + 1],
                                21,
                                -2054922799,
                            )),
                            (f = s(
                                f,
                                (m = s(
                                    m,
                                    (u = s(u, h, f, m, e[a + 8], 6, 1873313359)),
                                    h,
                                    f,
                                    e[a + 15],
                                    10,
                                    -30611744,
                                )),
                                u,
                                h,
                                e[a + 6],
                                15,
                                -1560198380,
                            )),
                            m,
                            u,
                            e[a + 13],
                            21,
                            1309151649,
                        )),
                        (f = s(
                            f,
                            (m = s(
                                m,
                                (u = s(u, h, f, m, e[a + 4], 6, -145523070)),
                                h,
                                f,
                                e[a + 11],
                                10,
                                -1120210379,
                            )),
                            u,
                            h,
                            e[a + 2],
                            15,
                            718787259,
                        )),
                        m,
                        u,
                        e[a + 9],
                        21,
                        -343485551,
                    )),
                    (u = t(u, c)),
                    (h = t(h, l)),
                    (f = t(f, p)),
                    (m = t(m, d));
            return [u, h, f, m];
        }
        function c(e) {
            var t,
                i = '',
                n = 32 * e.length;
            for (t = 0; t < n; t += 8) i += String.fromCharCode((e[t >> 5] >>> t % 32) & 255);
            return i;
        }
        function l(e) {
            var t,
                i = [];
            for (i[(e.length >> 2) - 1] = void 0, t = 0; t < i.length; t += 1) i[t] = 0;
            var n = 8 * e.length;
            for (t = 0; t < n; t += 8) i[t >> 5] |= (255 & e.charCodeAt(t / 8)) << t % 32;
            return i;
        }
        function p(e) {
            var t,
                i,
                n = '';
            for (i = 0; i < e.length; i += 1)
                (t = e.charCodeAt(i)),
                    (n += '0123456789abcdef'.charAt((t >>> 4) & 15) + '0123456789abcdef'.charAt(15 & t));
            return n;
        }
        function d(e) {
            return unescape(encodeURIComponent(e));
        }
        function u(e) {
            return (function (e) {
                return c(a(l(e), 8 * e.length));
            })(d(e));
        }
        function h(e, t) {
            return (function (e, t) {
                var i,
                    n,
                    r = l(e),
                    o = [],
                    s = [];
                for (
                    o[15] = s[15] = void 0, r.length > 16 && (r = a(r, 8 * e.length)), i = 0;
                    i < 16;
                    i += 1
                )
                    (o[i] = 909522486 ^ r[i]), (s[i] = 1549556828 ^ r[i]);
                return (n = a(o.concat(l(t)), 512 + 8 * t.length)), c(a(s.concat(n), 640));
            })(d(e), d(t));
        }
        function f(e, t, i) {
            return t
                ? i
                    ? h(t, e)
                    : (function (e, t) {
                        return p(h(e, t));
                    })(t, e)
                : i
                    ? u(e)
                    : (function (e) {
                        return p(u(e));
                    })(e);
        }
        'function' == typeof define && define.amd
            ? define(function () {
                return f;
            })
            : 'object' == typeof module && module.exports
                ? (module.exports = f)
                : (e.md5 = f);
    })(window),
    (window.format_price = function (e, t) {
        var i = e,
            n = (t = t || {}).mask || '###&nbsp;##0,00';
        currency_grouping_separator && (n = n.replace(',', currency_grouping_separator)),
            currency_decimal_separator && (n = n.replace('.', currency_decimal_separator));
        var r = t.currency || '',
            o = t.currency_space ? ' ' : '',
            s = !!t.currency_before_price;
        if (!n || isNaN(+i)) return i;
        var a = (i = '-' == n.charAt(0) ? -i : +i) < 0 ? (i = -i) : 0,
            c = n.match(/[^\d\-\+#]/g),
            l = (c && c[c.length - 1]) || '.',
            p = (c && c[1] && c[0]) || ',';
        n = n.split(l);
        i = +(i = i.toFixed(n[1] && n[1].length)) + '';
        var d = n[1] && n[1].lastIndexOf('0'),
            u = i.split('.');
        (!u[1] || (u[1] && u[1].length <= d)) && (i = (+i).toFixed(d + 1));
        var h = n[0].split(p);
        n[0] = h.join('');
        var f = n[0] && n[0].indexOf('0');
        if (f > -1) for (; u[0].length < n[0].length - f;) u[0] = '0' + u[0];
        else 0 == +u[0] && (u[0] = '');
        (i = i.split('.'))[0] = u[0];
        var m = h[1] && h[h.length - 1].length;
        if (m) {
            for (var _ = i[0], g = '', y = _.length % m, v = 0, b = _.length; v < b; v++)
                (g += _.charAt(v)), !((v - y + 1) % m) && v < b - m && (g += p);
            i[0] = g;
        }
        i[1] = n[1] && i[1] ? l + i[1] : '';
        e = (a ? '-' : '') + i[0] + i[1];
        return (e = s ? r + o + e : e + o + r);
    }),
    (function (e, t) {
        'object' == typeof exports && 'undefined' != typeof module
            ? t()
            : 'function' == typeof define && define.amd
                ? define(t)
                : t();
    })(0, function () {
        'use strict';
        function e(e) {
            var t = this.constructor;
            return this.then(
                function (i) {
                    return t.resolve(e()).then(function () {
                        return i;
                    });
                },
                function (i) {
                    return t.resolve(e()).then(function () {
                        return t.reject(i);
                    });
                },
            );
        }
        function t() { }
        function i(e) {
            if (!(this instanceof i)) throw new TypeError('Promises must be constructed via new');
            if ('function' != typeof e) throw new TypeError('not a function');
            (this._state = 0),
                (this._handled = !1),
                (this._value = void 0),
                (this._deferreds = []),
                a(e, this);
        }
        function n(e, t) {
            for (; 3 === e._state;) e = e._value;
            0 !== e._state
                ? ((e._handled = !0),
                    i._immediateFn(function () {
                        var i = 1 === e._state ? t.onFulfilled : t.onRejected;
                        if (null !== i) {
                            var n;
                            try {
                                n = i(e._value);
                            } catch (e) {
                                return void o(t.promise, e);
                            }
                            r(t.promise, n);
                        } else (1 === e._state ? r : o)(t.promise, e._value);
                    }))
                : e._deferreds.push(t);
        }
        function r(e, t) {
            try {
                if (t === e) throw new TypeError('A promise cannot be resolved with itself.');
                if (t && ('object' == typeof t || 'function' == typeof t)) {
                    var n = t.then;
                    if (t instanceof i) return (e._state = 3), (e._value = t), void s(e);
                    if ('function' == typeof n)
                        return void a(
                            (function (e, t) {
                                return function () {
                                    e.apply(t, arguments);
                                };
                            })(n, t),
                            e,
                        );
                }
                (e._state = 1), (e._value = t), s(e);
            } catch (t) {
                o(e, t);
            }
        }
        function o(e, t) {
            (e._state = 2), (e._value = t), s(e);
        }
        function s(e) {
            2 === e._state &&
                0 === e._deferreds.length &&
                i._immediateFn(function () {
                    e._handled || i._unhandledRejectionFn(e._value);
                });
            for (var t = 0, r = e._deferreds.length; r > t; t++) n(e, e._deferreds[t]);
            e._deferreds = null;
        }
        function a(e, t) {
            var i = !1;
            try {
                e(
                    function (e) {
                        i || ((i = !0), r(t, e));
                    },
                    function (e) {
                        i || ((i = !0), o(t, e));
                    },
                );
            } catch (e) {
                if (i) return;
                (i = !0), o(t, e);
            }
        }
        var c = setTimeout;
        (i.prototype.catch = function (e) {
            return this.then(null, e);
        }),
            (i.prototype.then = function (e, i) {
                var r = new this.constructor(t);
                return (
                    n(
                        this,
                        new (function (e, t, i) {
                            (this.onFulfilled = 'function' == typeof e ? e : null),
                                (this.onRejected = 'function' == typeof t ? t : null),
                                (this.promise = i);
                        })(e, i, r),
                    ),
                    r
                );
            }),
            (i.prototype.finally = e),
            (i.all = function (e) {
                return new i(function (t, i) {
                    function n(e, s) {
                        try {
                            if (s && ('object' == typeof s || 'function' == typeof s)) {
                                var a = s.then;
                                if ('function' == typeof a)
                                    return void a.call(
                                        s,
                                        function (t) {
                                            n(e, t);
                                        },
                                        i,
                                    );
                            }
                            (r[e] = s), 0 == --o && t(r);
                        } catch (e) {
                            i(e);
                        }
                    }
                    if (!e || void 0 === e.length) throw new TypeError('Promise.all accepts an array');
                    var r = Array.prototype.slice.call(e);
                    if (0 === r.length) return t([]);
                    for (var o = r.length, s = 0; r.length > s; s++) n(s, r[s]);
                });
            }),
            (i.resolve = function (e) {
                return e && 'object' == typeof e && e.constructor === i
                    ? e
                    : new i(function (t) {
                        t(e);
                    });
            }),
            (i.reject = function (e) {
                return new i(function (t, i) {
                    i(e);
                });
            }),
            (i.race = function (e) {
                return new i(function (t, i) {
                    for (var n = 0, r = e.length; r > n; n++) e[n].then(t, i);
                });
            }),
            (i._immediateFn =
                ('function' == typeof setImmediate &&
                    function (e) {
                        setImmediate(e);
                    }) ||
                function (e) {
                    c(e, 0);
                }),
            (i._unhandledRejectionFn = function (e) {
                void 0 !== console && console && console.warn('Possible Unhandled Promise Rejection:', e);
            });
        var l = (function () {
            if ('undefined' != typeof self) return self;
            if ('undefined' != typeof window) return window;
            if ('undefined' != typeof global) return global;
            throw Error('unable to locate global object');
        })();
        'Promise' in l
            ? l.Promise.prototype.finally || (l.Promise.prototype.finally = e)
            : (l.Promise = i);
    }),
    /*! jQuery UI - v1.13.1 - 2022-01-24
     * http://jqueryui.com
     * Includes: keycode.js, widgets/datepicker.js
     * Copyright jQuery Foundation and other contributors; Licensed MIT */
    (function (e) {
        'use strict';
        'function' == typeof define && define.amd ? define(['jquery'], e) : e(jQuery);
    })(function (e) {
        'use strict';
        e.ui = e.ui || {};
        var t;
    /*!
     * jQuery UI Keycode 1.13.1
     * http://jqueryui.com
     *
     * Copyright jQuery Foundation and other contributors
     * Released under the MIT license.
     * http://jquery.org/license
     */ (e.ui.version = '1.13.1'),
            (e.ui.keyCode = {
                BACKSPACE: 8,
                COMMA: 188,
                DELETE: 46,
                DOWN: 40,
                END: 35,
                ENTER: 13,
                ESCAPE: 27,
                HOME: 36,
                LEFT: 37,
                PAGE_DOWN: 34,
                PAGE_UP: 33,
                PERIOD: 190,
                RIGHT: 39,
                SPACE: 32,
                TAB: 9,
                UP: 38,
            });
        function i() {
            (this._curInst = null),
                (this._keyEvent = !1),
                (this._disabledInputs = []),
                (this._datepickerShowing = !1),
                (this._inDialog = !1),
                (this._mainDivId = 'ui-datepicker-div'),
                (this._inlineClass = 'ui-datepicker-inline'),
                (this._appendClass = 'ui-datepicker-append'),
                (this._triggerClass = 'ui-datepicker-trigger'),
                (this._dialogClass = 'ui-datepicker-dialog'),
                (this._disableClass = 'ui-datepicker-disabled'),
                (this._unselectableClass = 'ui-datepicker-unselectable'),
                (this._currentClass = 'ui-datepicker-current-day'),
                (this._dayOverClass = 'ui-datepicker-days-cell-over'),
                (this.regional = []),
                (this.regional[''] = {
                    closeText: 'Done',
                    prevText: 'Prev',
                    nextText: 'Next',
                    currentText: 'Today',
                    monthNames: [
                        'January',
                        'February',
                        'March',
                        'April',
                        'May',
                        'June',
                        'July',
                        'August',
                        'September',
                        'October',
                        'November',
                        'December',
                    ],
                    monthNamesShort: [
                        'Jan',
                        'Feb',
                        'Mar',
                        'Apr',
                        'May',
                        'Jun',
                        'Jul',
                        'Aug',
                        'Sep',
                        'Oct',
                        'Nov',
                        'Dec',
                    ],
                    dayNames: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
                    dayNamesShort: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
                    dayNamesMin: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
                    weekHeader: 'Wk',
                    dateFormat: 'mm/dd/yy',
                    firstDay: 0,
                    isRTL: !1,
                    showMonthAfterYear: !1,
                    yearSuffix: '',
                    selectMonthLabel: 'Select month',
                    selectYearLabel: 'Select year',
                }),
                (this._defaults = {
                    showOn: 'focus',
                    showAnim: 'fadeIn',
                    showOptions: {},
                    defaultDate: null,
                    appendText: '',
                    buttonText: '...',
                    buttonImage: '',
                    buttonImageOnly: !1,
                    hideIfNoPrevNext: !1,
                    navigationAsDateFormat: !1,
                    gotoCurrent: !1,
                    changeMonth: !1,
                    changeYear: !1,
                    yearRange: 'c-10:c+10',
                    showOtherMonths: !1,
                    selectOtherMonths: !1,
                    showWeek: !1,
                    calculateWeek: this.iso8601Week,
                    shortYearCutoff: '+10',
                    minDate: null,
                    maxDate: null,
                    duration: 'fast',
                    beforeShowDay: null,
                    beforeShow: null,
                    onSelect: null,
                    onChangeMonthYear: null,
                    onClose: null,
                    onUpdateDatepicker: null,
                    numberOfMonths: 1,
                    showCurrentAtPos: 0,
                    stepMonths: 1,
                    stepBigMonths: 12,
                    altField: '',
                    altFormat: '',
                    constrainInput: !0,
                    showButtonPanel: !1,
                    autoSize: !1,
                    disabled: !1,
                }),
                e.extend(this._defaults, this.regional['']),
                (this.regional.en = e.extend(!0, {}, this.regional[''])),
                (this.regional['en-US'] = e.extend(!0, {}, this.regional.en)),
                (this.dpDiv = n(
                    e(
                        "<div id='" +
                        this._mainDivId +
                        "' class='ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all'></div>",
                    ),
                ));
        }
        function n(t) {
            var i = 'button, .ui-datepicker-prev, .ui-datepicker-next, .ui-datepicker-calendar td a';
            return t
                .on('mouseout', i, function () {
                    e(this).removeClass('ui-state-hover'),
                        -1 !== this.className.indexOf('ui-datepicker-prev') &&
                        e(this).removeClass('ui-datepicker-prev-hover'),
                        -1 !== this.className.indexOf('ui-datepicker-next') &&
                        e(this).removeClass('ui-datepicker-next-hover');
                })
                .on('mouseover', i, r);
        }
        function r() {
            e.datepicker._isDisabledDatepicker(t.inline ? t.dpDiv.parent()[0] : t.input[0]) ||
                (e(this).parents('.ui-datepicker-calendar').find('a').removeClass('ui-state-hover'),
                    e(this).addClass('ui-state-hover'),
                    -1 !== this.className.indexOf('ui-datepicker-prev') &&
                    e(this).addClass('ui-datepicker-prev-hover'),
                    -1 !== this.className.indexOf('ui-datepicker-next') &&
                    e(this).addClass('ui-datepicker-next-hover'));
        }
        function o(t, i) {
            for (var n in (e.extend(t, i), i)) null == i[n] && (t[n] = i[n]);
            return t;
        }
        /*!
         * jQuery UI Datepicker 1.13.1
         * http://jqueryui.com
         *
         * Copyright jQuery Foundation and other contributors
         * Released under the MIT license.
         * http://jquery.org/license
         */
        e.extend(e.ui, { datepicker: { version: '1.13.1' } }),
            e.extend(i.prototype, {
                markerClassName: 'hasDatepicker',
                maxRows: 4,
                _widgetDatepicker: function () {
                    return this.dpDiv;
                },
                setDefaults: function (e) {
                    return o(this._defaults, e || {}), this;
                },
                _attachDatepicker: function (t, i) {
                    var n, r, o;
                    (r = 'div' === (n = t.nodeName.toLowerCase()) || 'span' === n),
                        t.id || ((this.uuid += 1), (t.id = 'dp' + this.uuid)),
                        ((o = this._newInst(e(t), r)).settings = e.extend({}, i || {})),
                        'input' === n ? this._connectDatepicker(t, o) : r && this._inlineDatepicker(t, o);
                },
                _newInst: function (t, i) {
                    return {
                        id: t[0].id.replace(/([^A-Za-z0-9_\-])/g, '\\\\$1'),
                        input: t,
                        selectedDay: 0,
                        selectedMonth: 0,
                        selectedYear: 0,
                        drawMonth: 0,
                        drawYear: 0,
                        inline: i,
                        dpDiv: i
                            ? n(
                                e(
                                    "<div class='" +
                                    this._inlineClass +
                                    " ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all'></div>",
                                ),
                            )
                            : this.dpDiv,
                    };
                },
                _connectDatepicker: function (t, i) {
                    var n = e(t);
                    (i.append = e([])),
                        (i.trigger = e([])),
                        n.hasClass(this.markerClassName) ||
                        (this._attachments(n, i),
                            n
                                .addClass(this.markerClassName)
                                .on('keydown', this._doKeyDown)
                                .on('keypress', this._doKeyPress)
                                .on('keyup', this._doKeyUp),
                            this._autoSize(i),
                            e.data(t, 'datepicker', i),
                            i.settings.disabled && this._disableDatepicker(t));
                },
                _attachments: function (t, i) {
                    var n,
                        r,
                        o,
                        s = this._get(i, 'appendText'),
                        a = this._get(i, 'isRTL');
                    i.append && i.append.remove(),
                        s &&
                        ((i.append = e('<span>').addClass(this._appendClass).text(s)),
                            t[a ? 'before' : 'after'](i.append)),
                        t.off('focus', this._showDatepicker),
                        i.trigger && i.trigger.remove(),
                        ('focus' !== (n = this._get(i, 'showOn')) && 'both' !== n) ||
                        t.on('focus', this._showDatepicker),
                        ('button' !== n && 'both' !== n) ||
                        ((r = this._get(i, 'buttonText')),
                            (o = this._get(i, 'buttonImage')),
                            this._get(i, 'buttonImageOnly')
                                ? (i.trigger = e('<img>')
                                    .addClass(this._triggerClass)
                                    .attr({ src: o, alt: r, title: r }))
                                : ((i.trigger = e("<button type='button'>").addClass(this._triggerClass)),
                                    o
                                        ? i.trigger.html(e('<img>').attr({ src: o, alt: r, title: r }))
                                        : i.trigger.text(r)),
                            t[a ? 'before' : 'after'](i.trigger),
                            i.trigger.on('click', function () {
                                return (
                                    e.datepicker._datepickerShowing && e.datepicker._lastInput === t[0]
                                        ? e.datepicker._hideDatepicker()
                                        : e.datepicker._datepickerShowing && e.datepicker._lastInput !== t[0]
                                            ? (e.datepicker._hideDatepicker(), e.datepicker._showDatepicker(t[0]))
                                            : e.datepicker._showDatepicker(t[0]),
                                    !1
                                );
                            }));
                },
                _autoSize: function (e) {
                    if (this._get(e, 'autoSize') && !e.inline) {
                        var t,
                            i,
                            n,
                            r,
                            o = new Date(2009, 11, 20),
                            s = this._get(e, 'dateFormat');
                        s.match(/[DM]/) &&
                            ((t = function (e) {
                                for (i = 0, n = 0, r = 0; r < e.length; r++)
                                    e[r].length > i && ((i = e[r].length), (n = r));
                                return n;
                            }),
                                o.setMonth(t(this._get(e, s.match(/MM/) ? 'monthNames' : 'monthNamesShort'))),
                                o.setDate(
                                    t(this._get(e, s.match(/DD/) ? 'dayNames' : 'dayNamesShort')) + 20 - o.getDay(),
                                )),
                            e.input.attr('size', this._formatDate(e, o).length);
                    }
                },
                _inlineDatepicker: function (t, i) {
                    var n = e(t);
                    n.hasClass(this.markerClassName) ||
                        (n.addClass(this.markerClassName).append(i.dpDiv),
                            e.data(t, 'datepicker', i),
                            this._setDate(i, this._getDefaultDate(i), !0),
                            this._updateDatepicker(i),
                            this._updateAlternate(i),
                            i.settings.disabled && this._disableDatepicker(t),
                            i.dpDiv.css('display', 'block'));
                },
                _dialogDatepicker: function (t, i, n, r, s) {
                    var a,
                        c,
                        l,
                        p,
                        d,
                        u = this._dialogInst;
                    return (
                        u ||
                        ((this.uuid += 1),
                            (a = 'dp' + this.uuid),
                            (this._dialogInput = e(
                                "<input type='text' id='" +
                                a +
                                "' style='position: absolute; top: -100px; width: 0px;'/>",
                            )),
                            this._dialogInput.on('keydown', this._doKeyDown),
                            e('body').append(this._dialogInput),
                            ((u = this._dialogInst = this._newInst(this._dialogInput, !1)).settings = {}),
                            e.data(this._dialogInput[0], 'datepicker', u)),
                        o(u.settings, r || {}),
                        (i = i && i.constructor === Date ? this._formatDate(u, i) : i),
                        this._dialogInput.val(i),
                        (this._pos = s ? (s.length ? s : [s.pageX, s.pageY]) : null),
                        this._pos ||
                        ((c = document.documentElement.clientWidth),
                            (l = document.documentElement.clientHeight),
                            (p = document.documentElement.scrollLeft || document.body.scrollLeft),
                            (d = document.documentElement.scrollTop || document.body.scrollTop),
                            (this._pos = [c / 2 - 100 + p, l / 2 - 150 + d])),
                        this._dialogInput.css('left', this._pos[0] + 20 + 'px').css('top', this._pos[1] + 'px'),
                        (u.settings.onSelect = n),
                        (this._inDialog = !0),
                        this.dpDiv.addClass(this._dialogClass),
                        this._showDatepicker(this._dialogInput[0]),
                        e.blockUI && e.blockUI(this.dpDiv),
                        e.data(this._dialogInput[0], 'datepicker', u),
                        this
                    );
                },
                _destroyDatepicker: function (i) {
                    var n,
                        r = e(i),
                        o = e.data(i, 'datepicker');
                    r.hasClass(this.markerClassName) &&
                        ((n = i.nodeName.toLowerCase()),
                            e.removeData(i, 'datepicker'),
                            'input' === n
                                ? (o.append.remove(),
                                    o.trigger.remove(),
                                    r
                                        .removeClass(this.markerClassName)
                                        .off('focus', this._showDatepicker)
                                        .off('keydown', this._doKeyDown)
                                        .off('keypress', this._doKeyPress)
                                        .off('keyup', this._doKeyUp))
                                : ('div' !== n && 'span' !== n) || r.removeClass(this.markerClassName).empty(),
                            t === o && ((t = null), (this._curInst = null)));
                },
                _enableDatepicker: function (t) {
                    var i,
                        n,
                        r = e(t),
                        o = e.data(t, 'datepicker');
                    r.hasClass(this.markerClassName) &&
                        ('input' === (i = t.nodeName.toLowerCase())
                            ? ((t.disabled = !1),
                                o.trigger
                                    .filter('button')
                                    .each(function () {
                                        this.disabled = !1;
                                    })
                                    .end()
                                    .filter('img')
                                    .css({ opacity: '1.0', cursor: '' }))
                            : ('div' !== i && 'span' !== i) ||
                            ((n = r.children('.' + this._inlineClass))
                                .children()
                                .removeClass('ui-state-disabled'),
                                n
                                    .find('select.ui-datepicker-month, select.ui-datepicker-year')
                                    .prop('disabled', !1)),
                            (this._disabledInputs = e.map(this._disabledInputs, function (e) {
                                return e === t ? null : e;
                            })));
                },
                _disableDatepicker: function (t) {
                    var i,
                        n,
                        r = e(t),
                        o = e.data(t, 'datepicker');
                    r.hasClass(this.markerClassName) &&
                        ('input' === (i = t.nodeName.toLowerCase())
                            ? ((t.disabled = !0),
                                o.trigger
                                    .filter('button')
                                    .each(function () {
                                        this.disabled = !0;
                                    })
                                    .end()
                                    .filter('img')
                                    .css({ opacity: '0.5', cursor: 'default' }))
                            : ('div' !== i && 'span' !== i) ||
                            ((n = r.children('.' + this._inlineClass)).children().addClass('ui-state-disabled'),
                                n
                                    .find('select.ui-datepicker-month, select.ui-datepicker-year')
                                    .prop('disabled', !0)),
                            (this._disabledInputs = e.map(this._disabledInputs, function (e) {
                                return e === t ? null : e;
                            })),
                            (this._disabledInputs[this._disabledInputs.length] = t));
                },
                _isDisabledDatepicker: function (e) {
                    if (!e) return !1;
                    for (var t = 0; t < this._disabledInputs.length; t++)
                        if (this._disabledInputs[t] === e) return !0;
                    return !1;
                },
                _getInst: function (t) {
                    try {
                        return e.data(t, 'datepicker');
                    } catch (e) {
                        throw 'Missing instance data for this datepicker';
                    }
                },
                _optionDatepicker: function (t, i, n) {
                    var r,
                        s,
                        a,
                        c,
                        l = this._getInst(t);
                    if (2 === arguments.length && 'string' == typeof i)
                        return 'defaults' === i
                            ? e.extend({}, e.datepicker._defaults)
                            : l
                                ? 'all' === i
                                    ? e.extend({}, l.settings)
                                    : this._get(l, i)
                                : null;
                    (r = i || {}),
                        'string' == typeof i && ((r = {})[i] = n),
                        l &&
                        (this._curInst === l && this._hideDatepicker(),
                            (s = this._getDateDatepicker(t, !0)),
                            (a = this._getMinMaxDate(l, 'min')),
                            (c = this._getMinMaxDate(l, 'max')),
                            o(l.settings, r),
                            null !== a &&
                            void 0 !== r.dateFormat &&
                            void 0 === r.minDate &&
                            (l.settings.minDate = this._formatDate(l, a)),
                            null !== c &&
                            void 0 !== r.dateFormat &&
                            void 0 === r.maxDate &&
                            (l.settings.maxDate = this._formatDate(l, c)),
                            'disabled' in r &&
                            (r.disabled ? this._disableDatepicker(t) : this._enableDatepicker(t)),
                            this._attachments(e(t), l),
                            this._autoSize(l),
                            this._setDate(l, s),
                            this._updateAlternate(l),
                            this._updateDatepicker(l));
                },
                _changeDatepicker: function (e, t, i) {
                    this._optionDatepicker(e, t, i);
                },
                _refreshDatepicker: function (e) {
                    var t = this._getInst(e);
                    t && this._updateDatepicker(t);
                },
                _setDateDatepicker: function (e, t) {
                    var i = this._getInst(e);
                    i && (this._setDate(i, t), this._updateDatepicker(i), this._updateAlternate(i));
                },
                _getDateDatepicker: function (e, t) {
                    var i = this._getInst(e);
                    return i && !i.inline && this._setDateFromField(i, t), i ? this._getDate(i) : null;
                },
                _doKeyDown: function (t) {
                    var i,
                        n,
                        r,
                        o = e.datepicker._getInst(t.target),
                        s = !0,
                        a = o.dpDiv.is('.ui-datepicker-rtl');
                    if (((o._keyEvent = !0), e.datepicker._datepickerShowing))
                        switch (t.keyCode) {
                            case 9:
                                e.datepicker._hideDatepicker(), (s = !1);
                                break;
                            case 13:
                                return (
                                    (r = e(
                                        'td.' +
                                        e.datepicker._dayOverClass +
                                        ':not(.' +
                                        e.datepicker._currentClass +
                                        ')',
                                        o.dpDiv,
                                    ))[0] && e.datepicker._selectDay(t.target, o.selectedMonth, o.selectedYear, r[0]),
                                    (i = e.datepicker._get(o, 'onSelect'))
                                        ? ((n = e.datepicker._formatDate(o)),
                                            i.apply(o.input ? o.input[0] : null, [n, o]))
                                        : e.datepicker._hideDatepicker(),
                                    !1
                                );
                            case 27:
                                e.datepicker._hideDatepicker();
                                break;
                            case 33:
                                e.datepicker._adjustDate(
                                    t.target,
                                    t.ctrlKey
                                        ? -e.datepicker._get(o, 'stepBigMonths')
                                        : -e.datepicker._get(o, 'stepMonths'),
                                    'M',
                                );
                                break;
                            case 34:
                                e.datepicker._adjustDate(
                                    t.target,
                                    t.ctrlKey
                                        ? +e.datepicker._get(o, 'stepBigMonths')
                                        : +e.datepicker._get(o, 'stepMonths'),
                                    'M',
                                );
                                break;
                            case 35:
                                (t.ctrlKey || t.metaKey) && e.datepicker._clearDate(t.target),
                                    (s = t.ctrlKey || t.metaKey);
                                break;
                            case 36:
                                (t.ctrlKey || t.metaKey) && e.datepicker._gotoToday(t.target),
                                    (s = t.ctrlKey || t.metaKey);
                                break;
                            case 37:
                                (t.ctrlKey || t.metaKey) && e.datepicker._adjustDate(t.target, a ? 1 : -1, 'D'),
                                    (s = t.ctrlKey || t.metaKey),
                                    t.originalEvent.altKey &&
                                    e.datepicker._adjustDate(
                                        t.target,
                                        t.ctrlKey
                                            ? -e.datepicker._get(o, 'stepBigMonths')
                                            : -e.datepicker._get(o, 'stepMonths'),
                                        'M',
                                    );
                                break;
                            case 38:
                                (t.ctrlKey || t.metaKey) && e.datepicker._adjustDate(t.target, -7, 'D'),
                                    (s = t.ctrlKey || t.metaKey);
                                break;
                            case 39:
                                (t.ctrlKey || t.metaKey) && e.datepicker._adjustDate(t.target, a ? -1 : 1, 'D'),
                                    (s = t.ctrlKey || t.metaKey),
                                    t.originalEvent.altKey &&
                                    e.datepicker._adjustDate(
                                        t.target,
                                        t.ctrlKey
                                            ? +e.datepicker._get(o, 'stepBigMonths')
                                            : +e.datepicker._get(o, 'stepMonths'),
                                        'M',
                                    );
                                break;
                            case 40:
                                (t.ctrlKey || t.metaKey) && e.datepicker._adjustDate(t.target, 7, 'D'),
                                    (s = t.ctrlKey || t.metaKey);
                                break;
                            default:
                                s = !1;
                        }
                    else 36 === t.keyCode && t.ctrlKey ? e.datepicker._showDatepicker(this) : (s = !1);
                    s && (t.preventDefault(), t.stopPropagation());
                },
                _doKeyPress: function (t) {
                    var i,
                        n,
                        r = e.datepicker._getInst(t.target);
                    if (e.datepicker._get(r, 'constrainInput'))
                        return (
                            (i = e.datepicker._possibleChars(e.datepicker._get(r, 'dateFormat'))),
                            (n = String.fromCharCode(null == t.charCode ? t.keyCode : t.charCode)),
                            t.ctrlKey || t.metaKey || n < ' ' || !i || i.indexOf(n) > -1
                        );
                },
                _doKeyUp: function (t) {
                    var i = e.datepicker._getInst(t.target);
                    if (i.input.val() !== i.lastVal)
                        try {
                            e.datepicker.parseDate(
                                e.datepicker._get(i, 'dateFormat'),
                                i.input ? i.input.val() : null,
                                e.datepicker._getFormatConfig(i),
                            ) &&
                                (e.datepicker._setDateFromField(i),
                                    e.datepicker._updateAlternate(i),
                                    e.datepicker._updateDatepicker(i));
                        } catch (e) { }
                    return !0;
                },
                _showDatepicker: function (t) {
                    var i, n, r, s, a, c, l;
                    ('input' !== (t = t.target || t).nodeName.toLowerCase() &&
                        (t = e('input', t.parentNode)[0]),
                        e.datepicker._isDisabledDatepicker(t) || e.datepicker._lastInput === t) ||
                        ((i = e.datepicker._getInst(t)),
                            e.datepicker._curInst &&
                            e.datepicker._curInst !== i &&
                            (e.datepicker._curInst.dpDiv.stop(!0, !0),
                                i &&
                                e.datepicker._datepickerShowing &&
                                e.datepicker._hideDatepicker(e.datepicker._curInst.input[0])),
                            !1 !== (r = (n = e.datepicker._get(i, 'beforeShow')) ? n.apply(t, [t, i]) : {}) &&
                            (o(i.settings, r),
                                (i.lastVal = null),
                                (e.datepicker._lastInput = t),
                                e.datepicker._setDateFromField(i),
                                e.datepicker._inDialog && (t.value = ''),
                                e.datepicker._pos ||
                                ((e.datepicker._pos = e.datepicker._findPos(t)),
                                    (e.datepicker._pos[1] += t.offsetHeight)),
                                (s = !1),
                                e(t)
                                    .parents()
                                    .each(function () {
                                        return !(s |= 'fixed' === e(this).css('position'));
                                    }),
                                (a = { left: e.datepicker._pos[0], top: e.datepicker._pos[1] }),
                                (e.datepicker._pos = null),
                                i.dpDiv.empty(),
                                i.dpDiv.css({ position: 'absolute', display: 'block', top: '-1000px' }),
                                e.datepicker._updateDatepicker(i),
                                (a = e.datepicker._checkOffset(i, a, s)),
                                i.dpDiv.css({
                                    position: e.datepicker._inDialog && e.blockUI ? 'static' : s ? 'fixed' : 'absolute',
                                    display: 'none',
                                    left: a.left + 'px',
                                    top: a.top + 'px',
                                }),
                                i.inline ||
                                ((c = e.datepicker._get(i, 'showAnim')),
                                    (l = e.datepicker._get(i, 'duration')),
                                    i.dpDiv.css(
                                        'z-index',
                                        (function (e) {
                                            for (var t, i; e.length && e[0] !== document;) {
                                                if (
                                                    ('absolute' === (t = e.css('position')) ||
                                                        'relative' === t ||
                                                        'fixed' === t) &&
                                                    ((i = parseInt(e.css('zIndex'), 10)), !isNaN(i) && 0 !== i)
                                                )
                                                    return i;
                                                e = e.parent();
                                            }
                                            return 0;
                                        })(e(t)) + 1,
                                    ),
                                    (e.datepicker._datepickerShowing = !0),
                                    e.effects && e.effects.effect[c]
                                        ? i.dpDiv.show(c, e.datepicker._get(i, 'showOptions'), l)
                                        : i.dpDiv[c || 'show'](c ? l : null),
                                    e.datepicker._shouldFocusInput(i) && i.input.trigger('focus'),
                                    (e.datepicker._curInst = i))));
                },
                _updateDatepicker: function (i) {
                    (this.maxRows = 4),
                        (t = i),
                        i.dpDiv.empty().append(this._generateHTML(i)),
                        this._attachHandlers(i);
                    var n,
                        o = this._getNumberOfMonths(i),
                        s = o[1],
                        a = i.dpDiv.find('.' + this._dayOverClass + ' a'),
                        c = e.datepicker._get(i, 'onUpdateDatepicker');
                    a.length > 0 && r.apply(a.get(0)),
                        i.dpDiv
                            .removeClass('ui-datepicker-multi-2 ui-datepicker-multi-3 ui-datepicker-multi-4')
                            .width(''),
                        s > 1 && i.dpDiv.addClass('ui-datepicker-multi-' + s).css('width', 17 * s + 'em'),
                        i.dpDiv[(1 !== o[0] || 1 !== o[1] ? 'add' : 'remove') + 'Class']('ui-datepicker-multi'),
                        i.dpDiv[(this._get(i, 'isRTL') ? 'add' : 'remove') + 'Class']('ui-datepicker-rtl'),
                        i === e.datepicker._curInst &&
                        e.datepicker._datepickerShowing &&
                        e.datepicker._shouldFocusInput(i) &&
                        i.input.trigger('focus'),
                        i.yearshtml &&
                        ((n = i.yearshtml),
                            setTimeout(function () {
                                n === i.yearshtml &&
                                    i.yearshtml &&
                                    i.dpDiv.find('select.ui-datepicker-year').first().replaceWith(i.yearshtml),
                                    (n = i.yearshtml = null);
                            }, 0)),
                        c && c.apply(i.input ? i.input[0] : null, [i]);
                },
                _shouldFocusInput: function (e) {
                    return (
                        e.input && e.input.is(':visible') && !e.input.is(':disabled') && !e.input.is(':focus')
                    );
                },
                _checkOffset: function (t, i, n) {
                    var r = t.dpDiv.outerWidth(),
                        o = t.dpDiv.outerHeight(),
                        s = t.input ? t.input.outerWidth() : 0,
                        a = t.input ? t.input.outerHeight() : 0,
                        c = document.documentElement.clientWidth + (n ? 0 : e(document).scrollLeft()),
                        l = document.documentElement.clientHeight + (n ? 0 : e(document).scrollTop());
                    return (
                        (i.left -= this._get(t, 'isRTL') ? r - s : 0),
                        (i.left -= n && i.left === t.input.offset().left ? e(document).scrollLeft() : 0),
                        (i.top -= n && i.top === t.input.offset().top + a ? e(document).scrollTop() : 0),
                        (i.left -= Math.min(i.left, i.left + r > c && c > r ? Math.abs(i.left + r - c) : 0)),
                        (i.top -= Math.min(i.top, i.top + o > l && l > o ? Math.abs(o + a) : 0)),
                        i
                    );
                },
                _findPos: function (t) {
                    for (
                        var i, n = this._getInst(t), r = this._get(n, 'isRTL');
                        t && ('hidden' === t.type || 1 !== t.nodeType || e.expr.pseudos.hidden(t));

                    )
                        t = t[r ? 'previousSibling' : 'nextSibling'];
                    return [(i = e(t).offset()).left, i.top];
                },
                _hideDatepicker: function (t) {
                    var i,
                        n,
                        r,
                        o,
                        s = this._curInst;
                    !s ||
                        (t && s !== e.data(t, 'datepicker')) ||
                        (this._datepickerShowing &&
                            ((i = this._get(s, 'showAnim')),
                                (n = this._get(s, 'duration')),
                                (r = function () {
                                    e.datepicker._tidyDialog(s);
                                }),
                                e.effects && (e.effects.effect[i] || e.effects[i])
                                    ? s.dpDiv.hide(i, e.datepicker._get(s, 'showOptions'), n, r)
                                    : s.dpDiv['slideDown' === i ? 'slideUp' : 'fadeIn' === i ? 'fadeOut' : 'hide'](
                                        i ? n : null,
                                        r,
                                    ),
                                i || r(),
                                (this._datepickerShowing = !1),
                                (o = this._get(s, 'onClose')) &&
                                o.apply(s.input ? s.input[0] : null, [s.input ? s.input.val() : '', s]),
                                (this._lastInput = null),
                                this._inDialog &&
                                (this._dialogInput.css({ position: 'absolute', left: '0', top: '-100px' }),
                                    e.blockUI && (e.unblockUI(), e('body').append(this.dpDiv))),
                                (this._inDialog = !1)));
                },
                _tidyDialog: function (e) {
                    e.dpDiv.removeClass(this._dialogClass).off('.ui-datepicker-calendar');
                },
                _checkExternalClick: function (t) {
                    if (e.datepicker._curInst) {
                        var i = e(t.target),
                            n = e.datepicker._getInst(i[0]);
                        ((i[0].id === e.datepicker._mainDivId ||
                            0 !== i.parents('#' + e.datepicker._mainDivId).length ||
                            i.hasClass(e.datepicker.markerClassName) ||
                            i.closest('.' + e.datepicker._triggerClass).length ||
                            !e.datepicker._datepickerShowing ||
                            (e.datepicker._inDialog && e.blockUI)) &&
                            (!i.hasClass(e.datepicker.markerClassName) || e.datepicker._curInst === n)) ||
                            e.datepicker._hideDatepicker();
                    }
                },
                _adjustDate: function (t, i, n) {
                    var r = e(t),
                        o = this._getInst(r[0]);
                    this._isDisabledDatepicker(r[0]) ||
                        (this._adjustInstDate(o, i, n), this._updateDatepicker(o));
                },
                _gotoToday: function (t) {
                    var i,
                        n = e(t),
                        r = this._getInst(n[0]);
                    this._get(r, 'gotoCurrent') && r.currentDay
                        ? ((r.selectedDay = r.currentDay),
                            (r.drawMonth = r.selectedMonth = r.currentMonth),
                            (r.drawYear = r.selectedYear = r.currentYear))
                        : ((i = new Date()),
                            (r.selectedDay = i.getDate()),
                            (r.drawMonth = r.selectedMonth = i.getMonth()),
                            (r.drawYear = r.selectedYear = i.getFullYear())),
                        this._notifyChange(r),
                        this._adjustDate(n);
                },
                _selectMonthYear: function (t, i, n) {
                    var r = e(t),
                        o = this._getInst(r[0]);
                    (o['selected' + ('M' === n ? 'Month' : 'Year')] = o[
                        'draw' + ('M' === n ? 'Month' : 'Year')
                    ] =
                        parseInt(i.options[i.selectedIndex].value, 10)),
                        this._notifyChange(o),
                        this._adjustDate(r);
                },
                _selectDay: function (t, i, n, r) {
                    var o,
                        s = e(t);
                    e(r).hasClass(this._unselectableClass) ||
                        this._isDisabledDatepicker(s[0]) ||
                        (((o = this._getInst(s[0])).selectedDay = o.currentDay =
                            parseInt(e('a', r).attr('data-date'))),
                            (o.selectedMonth = o.currentMonth = i),
                            (o.selectedYear = o.currentYear = n),
                            this._selectDate(t, this._formatDate(o, o.currentDay, o.currentMonth, o.currentYear)));
                },
                _clearDate: function (t) {
                    var i = e(t);
                    this._selectDate(i, '');
                },
                _selectDate: function (t, i) {
                    var n,
                        r = e(t),
                        o = this._getInst(r[0]);
                    (i = null != i ? i : this._formatDate(o)),
                        o.input && o.input.val(i),
                        this._updateAlternate(o),
                        (n = this._get(o, 'onSelect'))
                            ? n.apply(o.input ? o.input[0] : null, [i, o])
                            : o.input && o.input.trigger('change'),
                        o.inline
                            ? this._updateDatepicker(o)
                            : (this._hideDatepicker(),
                                (this._lastInput = o.input[0]),
                                'object' != typeof o.input[0] && o.input.trigger('focus'),
                                (this._lastInput = null));
                },
                _updateAlternate: function (t) {
                    var i,
                        n,
                        r,
                        o = this._get(t, 'altField');
                    o &&
                        ((i = this._get(t, 'altFormat') || this._get(t, 'dateFormat')),
                            (n = this._getDate(t)),
                            (r = this.formatDate(i, n, this._getFormatConfig(t))),
                            e(document).find(o).val(r));
                },
                noWeekends: function (e) {
                    var t = e.getDay();
                    return [t > 0 && t < 6, ''];
                },
                iso8601Week: function (e) {
                    var t,
                        i = new Date(e.getTime());
                    return (
                        i.setDate(i.getDate() + 4 - (i.getDay() || 7)),
                        (t = i.getTime()),
                        i.setMonth(0),
                        i.setDate(1),
                        Math.floor(Math.round((t - i) / 864e5) / 7) + 1
                    );
                },
                parseDate: function (t, i, n) {
                    if (null == t || null == i) throw 'Invalid arguments';
                    if ('' === (i = 'object' == typeof i ? i.toString() : i + '')) return null;
                    var r,
                        o,
                        s,
                        a,
                        c = 0,
                        l = (n ? n.shortYearCutoff : null) || this._defaults.shortYearCutoff,
                        p = 'string' != typeof l ? l : (new Date().getFullYear() % 100) + parseInt(l, 10),
                        d = (n ? n.dayNamesShort : null) || this._defaults.dayNamesShort,
                        u = (n ? n.dayNames : null) || this._defaults.dayNames,
                        h = (n ? n.monthNamesShort : null) || this._defaults.monthNamesShort,
                        f = (n ? n.monthNames : null) || this._defaults.monthNames,
                        m = -1,
                        _ = -1,
                        g = -1,
                        y = -1,
                        v = !1,
                        b = function (e) {
                            var i = r + 1 < t.length && t.charAt(r + 1) === e;
                            return i && r++, i;
                        },
                        w = function (e) {
                            var t = b(e),
                                n = '@' === e ? 14 : '!' === e ? 20 : 'y' === e && t ? 4 : 'o' === e ? 3 : 2,
                                r = new RegExp('^\\d{' + ('y' === e ? n : 1) + ',' + n + '}'),
                                o = i.substring(c).match(r);
                            if (!o) throw 'Missing number at position ' + c;
                            return (c += o[0].length), parseInt(o[0], 10);
                        },
                        k = function (t, n, r) {
                            var o = -1,
                                s = e
                                    .map(b(t) ? r : n, function (e, t) {
                                        return [[t, e]];
                                    })
                                    .sort(function (e, t) {
                                        return -(e[1].length - t[1].length);
                                    });
                            if (
                                (e.each(s, function (e, t) {
                                    var n = t[1];
                                    if (i.substr(c, n.length).toLowerCase() === n.toLowerCase())
                                        return (o = t[0]), (c += n.length), !1;
                                }),
                                    -1 !== o)
                            )
                                return o + 1;
                            throw 'Unknown name at position ' + c;
                        },
                        x = function () {
                            if (i.charAt(c) !== t.charAt(r)) throw 'Unexpected literal at position ' + c;
                            c++;
                        };
                    for (r = 0; r < t.length; r++)
                        if (v) "'" !== t.charAt(r) || b("'") ? x() : (v = !1);
                        else
                            switch (t.charAt(r)) {
                                case 'd':
                                    g = w('d');
                                    break;
                                case 'D':
                                    k('D', d, u);
                                    break;
                                case 'o':
                                    y = w('o');
                                    break;
                                case 'm':
                                    _ = w('m');
                                    break;
                                case 'M':
                                    _ = k('M', h, f);
                                    break;
                                case 'y':
                                    m = w('y');
                                    break;
                                case '@':
                                    (m = (a = new Date(w('@'))).getFullYear()),
                                        (_ = a.getMonth() + 1),
                                        (g = a.getDate());
                                    break;
                                case '!':
                                    (m = (a = new Date((w('!') - this._ticksTo1970) / 1e4)).getFullYear()),
                                        (_ = a.getMonth() + 1),
                                        (g = a.getDate());
                                    break;
                                case "'":
                                    b("'") ? x() : (v = !0);
                                    break;
                                default:
                                    x();
                            }
                    if (c < i.length && ((s = i.substr(c)), !/^\s+/.test(s)))
                        throw 'Extra/unparsed characters found in date: ' + s;
                    if (
                        (-1 === m
                            ? (m = new Date().getFullYear())
                            : m < 100 &&
                            (m +=
                                new Date().getFullYear() -
                                (new Date().getFullYear() % 100) +
                                (m <= p ? 0 : -100)),
                            y > -1)
                    )
                        for (_ = 1, g = y; ;) {
                            if (g <= (o = this._getDaysInMonth(m, _ - 1))) break;
                            _++, (g -= o);
                        }
                    if (
                        (a = this._daylightSavingAdjust(new Date(m, _ - 1, g))).getFullYear() !== m ||
                        a.getMonth() + 1 !== _ ||
                        a.getDate() !== g
                    )
                        throw 'Invalid date';
                    return a;
                },
                ATOM: 'yy-mm-dd',
                COOKIE: 'D, dd M yy',
                ISO_8601: 'yy-mm-dd',
                RFC_822: 'D, d M y',
                RFC_850: 'DD, dd-M-y',
                RFC_1036: 'D, d M y',
                RFC_1123: 'D, d M yy',
                RFC_2822: 'D, d M yy',
                RSS: 'D, d M y',
                TICKS: '!',
                TIMESTAMP: '@',
                W3C: 'yy-mm-dd',
                _ticksTo1970:
                    24 * (718685 + Math.floor(492.5) - Math.floor(19.7) + Math.floor(4.925)) * 60 * 60 * 1e7,
                formatDate: function (e, t, i) {
                    if (!t) return '';
                    var n,
                        r = (i ? i.dayNamesShort : null) || this._defaults.dayNamesShort,
                        o = (i ? i.dayNames : null) || this._defaults.dayNames,
                        s = (i ? i.monthNamesShort : null) || this._defaults.monthNamesShort,
                        a = (i ? i.monthNames : null) || this._defaults.monthNames,
                        c = function (t) {
                            var i = n + 1 < e.length && e.charAt(n + 1) === t;
                            return i && n++, i;
                        },
                        l = function (e, t, i) {
                            var n = '' + t;
                            if (c(e)) for (; n.length < i;) n = '0' + n;
                            return n;
                        },
                        p = function (e, t, i, n) {
                            return c(e) ? n[t] : i[t];
                        },
                        d = '',
                        u = !1;
                    if (t)
                        for (n = 0; n < e.length; n++)
                            if (u) "'" !== e.charAt(n) || c("'") ? (d += e.charAt(n)) : (u = !1);
                            else
                                switch (e.charAt(n)) {
                                    case 'd':
                                        d += l('d', t.getDate(), 2);
                                        break;
                                    case 'D':
                                        d += p('D', t.getDay(), r, o);
                                        break;
                                    case 'o':
                                        d += l(
                                            'o',
                                            Math.round(
                                                (new Date(t.getFullYear(), t.getMonth(), t.getDate()).getTime() -
                                                    new Date(t.getFullYear(), 0, 0).getTime()) /
                                                864e5,
                                            ),
                                            3,
                                        );
                                        break;
                                    case 'm':
                                        d += l('m', t.getMonth() + 1, 2);
                                        break;
                                    case 'M':
                                        d += p('M', t.getMonth(), s, a);
                                        break;
                                    case 'y':
                                        d += c('y')
                                            ? t.getFullYear()
                                            : (t.getFullYear() % 100 < 10 ? '0' : '') + (t.getFullYear() % 100);
                                        break;
                                    case '@':
                                        d += t.getTime();
                                        break;
                                    case '!':
                                        d += 1e4 * t.getTime() + this._ticksTo1970;
                                        break;
                                    case "'":
                                        c("'") ? (d += "'") : (u = !0);
                                        break;
                                    default:
                                        d += e.charAt(n);
                                }
                    return d;
                },
                _possibleChars: function (e) {
                    var t,
                        i = '',
                        n = !1,
                        r = function (i) {
                            var n = t + 1 < e.length && e.charAt(t + 1) === i;
                            return n && t++, n;
                        };
                    for (t = 0; t < e.length; t++)
                        if (n) "'" !== e.charAt(t) || r("'") ? (i += e.charAt(t)) : (n = !1);
                        else
                            switch (e.charAt(t)) {
                                case 'd':
                                case 'm':
                                case 'y':
                                case '@':
                                    i += '0123456789';
                                    break;
                                case 'D':
                                case 'M':
                                    return null;
                                case "'":
                                    r("'") ? (i += "'") : (n = !0);
                                    break;
                                default:
                                    i += e.charAt(t);
                            }
                    return i;
                },
                _get: function (e, t) {
                    return void 0 !== e.settings[t] ? e.settings[t] : this._defaults[t];
                },
                _setDateFromField: function (e, t) {
                    if (e.input.val() !== e.lastVal) {
                        var i = this._get(e, 'dateFormat'),
                            n = (e.lastVal = e.input ? e.input.val() : null),
                            r = this._getDefaultDate(e),
                            o = r,
                            s = this._getFormatConfig(e);
                        try {
                            o = this.parseDate(i, n, s) || r;
                        } catch (e) {
                            n = t ? '' : n;
                        }
                        (e.selectedDay = o.getDate()),
                            (e.drawMonth = e.selectedMonth = o.getMonth()),
                            (e.drawYear = e.selectedYear = o.getFullYear()),
                            (e.currentDay = n ? o.getDate() : 0),
                            (e.currentMonth = n ? o.getMonth() : 0),
                            (e.currentYear = n ? o.getFullYear() : 0),
                            this._adjustInstDate(e);
                    }
                },
                _getDefaultDate: function (e) {
                    return this._restrictMinMax(
                        e,
                        this._determineDate(e, this._get(e, 'defaultDate'), new Date()),
                    );
                },
                _determineDate: function (t, i, n) {
                    var r =
                        null == i || '' === i
                            ? n
                            : 'string' == typeof i
                                ? (function (i) {
                                    try {
                                        return e.datepicker.parseDate(
                                            e.datepicker._get(t, 'dateFormat'),
                                            i,
                                            e.datepicker._getFormatConfig(t),
                                        );
                                    } catch (e) { }
                                    for (
                                        var n =
                                            (i.toLowerCase().match(/^c/) ? e.datepicker._getDate(t) : null) ||
                                            new Date(),
                                        r = n.getFullYear(),
                                        o = n.getMonth(),
                                        s = n.getDate(),
                                        a = /([+\-]?[0-9]+)\s*(d|D|w|W|m|M|y|Y)?/g,
                                        c = a.exec(i);
                                        c;

                                    ) {
                                        switch (c[2] || 'd') {
                                            case 'd':
                                            case 'D':
                                                s += parseInt(c[1], 10);
                                                break;
                                            case 'w':
                                            case 'W':
                                                s += 7 * parseInt(c[1], 10);
                                                break;
                                            case 'm':
                                            case 'M':
                                                (o += parseInt(c[1], 10)),
                                                    (s = Math.min(s, e.datepicker._getDaysInMonth(r, o)));
                                                break;
                                            case 'y':
                                            case 'Y':
                                                (r += parseInt(c[1], 10)),
                                                    (s = Math.min(s, e.datepicker._getDaysInMonth(r, o)));
                                        }
                                        c = a.exec(i);
                                    }
                                    return new Date(r, o, s);
                                })(i)
                                : 'number' == typeof i
                                    ? isNaN(i)
                                        ? n
                                        : (function (e) {
                                            var t = new Date();
                                            return t.setDate(t.getDate() + e), t;
                                        })(i)
                                    : new Date(i.getTime());
                    return (
                        (r = r && 'Invalid Date' === r.toString() ? n : r) &&
                        (r.setHours(0), r.setMinutes(0), r.setSeconds(0), r.setMilliseconds(0)),
                        this._daylightSavingAdjust(r)
                    );
                },
                _daylightSavingAdjust: function (e) {
                    return e ? (e.setHours(e.getHours() > 12 ? e.getHours() + 2 : 0), e) : null;
                },
                _setDate: function (e, t, i) {
                    var n = !t,
                        r = e.selectedMonth,
                        o = e.selectedYear,
                        s = this._restrictMinMax(e, this._determineDate(e, t, new Date()));
                    (e.selectedDay = e.currentDay = s.getDate()),
                        (e.drawMonth = e.selectedMonth = e.currentMonth = s.getMonth()),
                        (e.drawYear = e.selectedYear = e.currentYear = s.getFullYear()),
                        (r === e.selectedMonth && o === e.selectedYear) || i || this._notifyChange(e),
                        this._adjustInstDate(e),
                        e.input && e.input.val(n ? '' : this._formatDate(e));
                },
                _getDate: function (e) {
                    return !e.currentYear || (e.input && '' === e.input.val())
                        ? null
                        : this._daylightSavingAdjust(new Date(e.currentYear, e.currentMonth, e.currentDay));
                },
                _attachHandlers: function (t) {
                    var i = this._get(t, 'stepMonths'),
                        n = '#' + t.id.replace(/\\\\/g, '\\');
                    t.dpDiv.find('[data-handler]').map(function () {
                        var t = {
                            prev: function () {
                                e.datepicker._adjustDate(n, -i, 'M');
                            },
                            next: function () {
                                e.datepicker._adjustDate(n, +i, 'M');
                            },
                            hide: function () {
                                e.datepicker._hideDatepicker();
                            },
                            today: function () {
                                e.datepicker._gotoToday(n);
                            },
                            selectDay: function () {
                                return (
                                    e.datepicker._selectDay(
                                        n,
                                        +this.getAttribute('data-month'),
                                        +this.getAttribute('data-year'),
                                        this,
                                    ),
                                    !1
                                );
                            },
                            selectMonth: function () {
                                return e.datepicker._selectMonthYear(n, this, 'M'), !1;
                            },
                            selectYear: function () {
                                return e.datepicker._selectMonthYear(n, this, 'Y'), !1;
                            },
                        };
                        e(this).on(this.getAttribute('data-event'), t[this.getAttribute('data-handler')]);
                    });
                },
                _generateHTML: function (t) {
                    var i,
                        n,
                        r,
                        o,
                        s,
                        a,
                        c,
                        l,
                        p,
                        d,
                        u,
                        h,
                        f,
                        m,
                        _,
                        g,
                        y,
                        v,
                        b,
                        w,
                        k,
                        x,
                        S,
                        C,
                        $,
                        j,
                        T,
                        z,
                        D,
                        A,
                        E,
                        L,
                        O,
                        M,
                        q,
                        P,
                        I,
                        N,
                        H,
                        F = new Date(),
                        B = this._daylightSavingAdjust(new Date(F.getFullYear(), F.getMonth(), F.getDate())),
                        R = this._get(t, 'isRTL'),
                        W = this._get(t, 'showButtonPanel'),
                        Y = this._get(t, 'hideIfNoPrevNext'),
                        U = this._get(t, 'navigationAsDateFormat'),
                        Q = this._getNumberOfMonths(t),
                        V = this._get(t, 'showCurrentAtPos'),
                        G = this._get(t, 'stepMonths'),
                        J = 1 !== Q[0] || 1 !== Q[1],
                        Z = this._daylightSavingAdjust(
                            t.currentDay
                                ? new Date(t.currentYear, t.currentMonth, t.currentDay)
                                : new Date(9999, 9, 9),
                        ),
                        K = this._getMinMaxDate(t, 'min'),
                        X = this._getMinMaxDate(t, 'max'),
                        ee = t.drawMonth - V,
                        te = t.drawYear;
                    if ((ee < 0 && ((ee += 12), te--), X))
                        for (
                            i = this._daylightSavingAdjust(
                                new Date(X.getFullYear(), X.getMonth() - Q[0] * Q[1] + 1, X.getDate()),
                            ),
                            i = K && i < K ? K : i;
                            this._daylightSavingAdjust(new Date(te, ee, 1)) > i;

                        )
                            --ee < 0 && ((ee = 11), te--);
                    for (
                        t.drawMonth = ee,
                        t.drawYear = te,
                        n = this._get(t, 'prevText'),
                        n = U
                            ? this.formatDate(
                                n,
                                this._daylightSavingAdjust(new Date(te, ee - G, 1)),
                                this._getFormatConfig(t),
                            )
                            : n,
                        r = this._canAdjustMonth(t, -1, te, ee)
                            ? e('<a>')
                                .attr({
                                    class: 'ui-datepicker-prev ui-corner-all',
                                    'data-handler': 'prev',
                                    'data-event': 'click',
                                    title: n,
                                })
                                .append(
                                    e('<span>')
                                        .addClass('ui-icon ui-icon-circle-triangle-' + (R ? 'e' : 'w'))
                                        .text(n),
                                )[0].outerHTML
                            : Y
                                ? ''
                                : e('<a>')
                                    .attr({ class: 'ui-datepicker-prev ui-corner-all ui-state-disabled', title: n })
                                    .append(
                                        e('<span>')
                                            .addClass('ui-icon ui-icon-circle-triangle-' + (R ? 'e' : 'w'))
                                            .text(n),
                                    )[0].outerHTML,
                        o = this._get(t, 'nextText'),
                        o = U
                            ? this.formatDate(
                                o,
                                this._daylightSavingAdjust(new Date(te, ee + G, 1)),
                                this._getFormatConfig(t),
                            )
                            : o,
                        s = this._canAdjustMonth(t, 1, te, ee)
                            ? e('<a>')
                                .attr({
                                    class: 'ui-datepicker-next ui-corner-all',
                                    'data-handler': 'next',
                                    'data-event': 'click',
                                    title: o,
                                })
                                .append(
                                    e('<span>')
                                        .addClass('ui-icon ui-icon-circle-triangle-' + (R ? 'w' : 'e'))
                                        .text(o),
                                )[0].outerHTML
                            : Y
                                ? ''
                                : e('<a>')
                                    .attr({ class: 'ui-datepicker-next ui-corner-all ui-state-disabled', title: o })
                                    .append(
                                        e('<span>')
                                            .attr('class', 'ui-icon ui-icon-circle-triangle-' + (R ? 'w' : 'e'))
                                            .text(o),
                                    )[0].outerHTML,
                        a = this._get(t, 'currentText'),
                        c = this._get(t, 'gotoCurrent') && t.currentDay ? Z : B,
                        a = U ? this.formatDate(a, c, this._getFormatConfig(t)) : a,
                        l = '',
                        t.inline ||
                        (l = e('<button>')
                            .attr({
                                type: 'button',
                                class: 'ui-datepicker-close ui-state-default ui-priority-primary ui-corner-all',
                                'data-handler': 'hide',
                                'data-event': 'click',
                            })
                            .text(this._get(t, 'closeText'))[0].outerHTML),
                        p = '',
                        W &&
                        (p = e("<div class='ui-datepicker-buttonpane ui-widget-content'>")
                            .append(R ? l : '')
                            .append(
                                this._isInRange(t, c)
                                    ? e('<button>')
                                        .attr({
                                            type: 'button',
                                            class:
                                                'ui-datepicker-current ui-state-default ui-priority-secondary ui-corner-all',
                                            'data-handler': 'today',
                                            'data-event': 'click',
                                        })
                                        .text(a)
                                    : '',
                            )
                            .append(R ? '' : l)[0].outerHTML),
                        d = parseInt(this._get(t, 'firstDay'), 10),
                        d = isNaN(d) ? 0 : d,
                        u = this._get(t, 'showWeek'),
                        h = this._get(t, 'dayNames'),
                        f = this._get(t, 'dayNamesMin'),
                        m = this._get(t, 'monthNames'),
                        _ = this._get(t, 'monthNamesShort'),
                        g = this._get(t, 'beforeShowDay'),
                        y = this._get(t, 'showOtherMonths'),
                        v = this._get(t, 'selectOtherMonths'),
                        b = this._getDefaultDate(t),
                        w = '',
                        x = 0;
                        x < Q[0];
                        x++
                    ) {
                        for (S = '', this.maxRows = 4, C = 0; C < Q[1]; C++) {
                            if (
                                (($ = this._daylightSavingAdjust(new Date(te, ee, t.selectedDay))),
                                    (j = ' ui-corner-all'),
                                    (T = ''),
                                    J)
                            ) {
                                if (((T += "<div class='ui-datepicker-group"), Q[1] > 1))
                                    switch (C) {
                                        case 0:
                                            (T += ' ui-datepicker-group-first'),
                                                (j = ' ui-corner-' + (R ? 'right' : 'left'));
                                            break;
                                        case Q[1] - 1:
                                            (T += ' ui-datepicker-group-last'),
                                                (j = ' ui-corner-' + (R ? 'left' : 'right'));
                                            break;
                                        default:
                                            (T += ' ui-datepicker-group-middle'), (j = '');
                                    }
                                T += "'>";
                            }
                            for (
                                T +=
                                "<div class='ui-datepicker-header ui-widget-header ui-helper-clearfix" +
                                j +
                                "'>" +
                                (/all|left/.test(j) && 0 === x ? (R ? s : r) : '') +
                                (/all|right/.test(j) && 0 === x ? (R ? r : s) : '') +
                                this._generateMonthYearHeader(t, ee, te, K, X, x > 0 || C > 0, m, _) +
                                "</div><table class='ui-datepicker-calendar'><thead><tr>",
                                z = u
                                    ? "<th class='ui-datepicker-week-col'>" + this._get(t, 'weekHeader') + '</th>'
                                    : '',
                                k = 0;
                                k < 7;
                                k++
                            )
                                z +=
                                    "<th scope='col'" +
                                    ((k + d + 6) % 7 >= 5 ? " class='ui-datepicker-week-end'" : '') +
                                    "><span title='" +
                                    h[(D = (k + d) % 7)] +
                                    "'>" +
                                    f[D] +
                                    '</span></th>';
                            for (
                                T += z + '</tr></thead><tbody>',
                                A = this._getDaysInMonth(te, ee),
                                te === t.selectedYear &&
                                ee === t.selectedMonth &&
                                (t.selectedDay = Math.min(t.selectedDay, A)),
                                E = (this._getFirstDayOfMonth(te, ee) - d + 7) % 7,
                                L = Math.ceil((E + A) / 7),
                                O = J && this.maxRows > L ? this.maxRows : L,
                                this.maxRows = O,
                                M = this._daylightSavingAdjust(new Date(te, ee, 1 - E)),
                                q = 0;
                                q < O;
                                q++
                            ) {
                                for (
                                    T += '<tr>',
                                    P = u
                                        ? "<td class='ui-datepicker-week-col'>" +
                                        this._get(t, 'calculateWeek')(M) +
                                        '</td>'
                                        : '',
                                    k = 0;
                                    k < 7;
                                    k++
                                )
                                    (I = g ? g.apply(t.input ? t.input[0] : null, [M]) : [!0, '']),
                                        (H =
                                            ((N = M.getMonth() !== ee) && !v) || !I[0] || (K && M < K) || (X && M > X)),
                                        (P +=
                                            "<td class='" +
                                            ((k + d + 6) % 7 >= 5 ? ' ui-datepicker-week-end' : '') +
                                            (N ? ' ui-datepicker-other-month' : '') +
                                            ((M.getTime() === $.getTime() && ee === t.selectedMonth && t._keyEvent) ||
                                                (b.getTime() === M.getTime() && b.getTime() === $.getTime())
                                                ? ' ' + this._dayOverClass
                                                : '') +
                                            (H ? ' ' + this._unselectableClass + ' ui-state-disabled' : '') +
                                            (N && !y
                                                ? ''
                                                : ' ' +
                                                I[1] +
                                                (M.getTime() === Z.getTime() ? ' ' + this._currentClass : '') +
                                                (M.getTime() === B.getTime() ? ' ui-datepicker-today' : '')) +
                                            "'" +
                                            ((N && !y) || !I[2] ? '' : " title='" + I[2].replace(/'/g, '&#39;') + "'") +
                                            (H
                                                ? ''
                                                : " data-handler='selectDay' data-event='click' data-month='" +
                                                M.getMonth() +
                                                "' data-year='" +
                                                M.getFullYear() +
                                                "'") +
                                            '>' +
                                            (N && !y
                                                ? '&#xa0;'
                                                : H
                                                    ? "<span class='ui-state-default'>" + M.getDate() + '</span>'
                                                    : "<a class='ui-state-default" +
                                                    (M.getTime() === B.getTime() ? ' ui-state-highlight' : '') +
                                                    (M.getTime() === Z.getTime() ? ' ui-state-active' : '') +
                                                    (N ? ' ui-priority-secondary' : '') +
                                                    "' href='#' aria-current='" +
                                                    (M.getTime() === Z.getTime() ? 'true' : 'false') +
                                                    "' data-date='" +
                                                    M.getDate() +
                                                    "'>" +
                                                    M.getDate() +
                                                    '</a>') +
                                            '</td>'),
                                        M.setDate(M.getDate() + 1),
                                        (M = this._daylightSavingAdjust(M));
                                T += P + '</tr>';
                            }
                            ++ee > 11 && ((ee = 0), te++),
                                (S += T +=
                                    '</tbody></table>' +
                                    (J
                                        ? '</div>' +
                                        (Q[0] > 0 && C === Q[1] - 1
                                            ? "<div class='ui-datepicker-row-break'></div>"
                                            : '')
                                        : ''));
                        }
                        w += S;
                    }
                    return (w += p), (t._keyEvent = !1), w;
                },
                _generateMonthYearHeader: function (e, t, i, n, r, o, s, a) {
                    var c,
                        l,
                        p,
                        d,
                        u,
                        h,
                        f,
                        m,
                        _ = this._get(e, 'changeMonth'),
                        g = this._get(e, 'changeYear'),
                        y = this._get(e, 'showMonthAfterYear'),
                        v = this._get(e, 'selectMonthLabel'),
                        b = this._get(e, 'selectYearLabel'),
                        w = "<div class='ui-datepicker-title'>",
                        k = '';
                    if (o || !_) k += "<span class='ui-datepicker-month'>" + s[t] + '</span>';
                    else {
                        for (
                            c = n && n.getFullYear() === i,
                            l = r && r.getFullYear() === i,
                            k +=
                            "<select class='ui-datepicker-month' aria-label='" +
                            v +
                            "' data-handler='selectMonth' data-event='change'>",
                            p = 0;
                            p < 12;
                            p++
                        )
                            (!c || p >= n.getMonth()) &&
                                (!l || p <= r.getMonth()) &&
                                (k +=
                                    "<option value='" +
                                    p +
                                    "'" +
                                    (p === t ? " selected='selected'" : '') +
                                    '>' +
                                    a[p] +
                                    '</option>');
                        k += '</select>';
                    }
                    if ((y || (w += k + (!o && _ && g ? '' : '&#xa0;')), !e.yearshtml))
                        if (((e.yearshtml = ''), o || !g))
                            w += "<span class='ui-datepicker-year'>" + i + '</span>';
                        else {
                            for (
                                d = this._get(e, 'yearRange').split(':'),
                                u = new Date().getFullYear(),
                                h = function (e) {
                                    var t = e.match(/c[+\-].*/)
                                        ? i + parseInt(e.substring(1), 10)
                                        : e.match(/[+\-].*/)
                                            ? u + parseInt(e, 10)
                                            : parseInt(e, 10);
                                    return isNaN(t) ? u : t;
                                },
                                f = h(d[0]),
                                m = Math.max(f, h(d[1] || '')),
                                f = n ? Math.max(f, n.getFullYear()) : f,
                                m = r ? Math.min(m, r.getFullYear()) : m,
                                e.yearshtml +=
                                "<select class='ui-datepicker-year' aria-label='" +
                                b +
                                "' data-handler='selectYear' data-event='change'>";
                                f <= m;
                                f++
                            )
                                e.yearshtml +=
                                    "<option value='" +
                                    f +
                                    "'" +
                                    (f === i ? " selected='selected'" : '') +
                                    '>' +
                                    f +
                                    '</option>';
                            (e.yearshtml += '</select>'), (w += e.yearshtml), (e.yearshtml = null);
                        }
                    return (
                        (w += this._get(e, 'yearSuffix')),
                        y && (w += (!o && _ && g ? '' : '&#xa0;') + k),
                        (w += '</div>')
                    );
                },
                _adjustInstDate: function (e, t, i) {
                    var n = e.selectedYear + ('Y' === i ? t : 0),
                        r = e.selectedMonth + ('M' === i ? t : 0),
                        o = Math.min(e.selectedDay, this._getDaysInMonth(n, r)) + ('D' === i ? t : 0),
                        s = this._restrictMinMax(e, this._daylightSavingAdjust(new Date(n, r, o)));
                    (e.selectedDay = s.getDate()),
                        (e.drawMonth = e.selectedMonth = s.getMonth()),
                        (e.drawYear = e.selectedYear = s.getFullYear()),
                        ('M' !== i && 'Y' !== i) || this._notifyChange(e);
                },
                _restrictMinMax: function (e, t) {
                    var i = this._getMinMaxDate(e, 'min'),
                        n = this._getMinMaxDate(e, 'max'),
                        r = i && t < i ? i : t;
                    return n && r > n ? n : r;
                },
                _notifyChange: function (e) {
                    var t = this._get(e, 'onChangeMonthYear');
                    t && t.apply(e.input ? e.input[0] : null, [e.selectedYear, e.selectedMonth + 1, e]);
                },
                _getNumberOfMonths: function (e) {
                    var t = this._get(e, 'numberOfMonths');
                    return null == t ? [1, 1] : 'number' == typeof t ? [1, t] : t;
                },
                _getMinMaxDate: function (e, t) {
                    return this._determineDate(e, this._get(e, t + 'Date'), null);
                },
                _getDaysInMonth: function (e, t) {
                    return 32 - this._daylightSavingAdjust(new Date(e, t, 32)).getDate();
                },
                _getFirstDayOfMonth: function (e, t) {
                    return new Date(e, t, 1).getDay();
                },
                _canAdjustMonth: function (e, t, i, n) {
                    var r = this._getNumberOfMonths(e),
                        o = this._daylightSavingAdjust(new Date(i, n + (t < 0 ? t : r[0] * r[1]), 1));
                    return (
                        t < 0 && o.setDate(this._getDaysInMonth(o.getFullYear(), o.getMonth())),
                        this._isInRange(e, o)
                    );
                },
                _isInRange: function (e, t) {
                    var i,
                        n,
                        r = this._getMinMaxDate(e, 'min'),
                        o = this._getMinMaxDate(e, 'max'),
                        s = null,
                        a = null,
                        c = this._get(e, 'yearRange');
                    return (
                        c &&
                        ((i = c.split(':')),
                            (n = new Date().getFullYear()),
                            (s = parseInt(i[0], 10)),
                            (a = parseInt(i[1], 10)),
                            i[0].match(/[+\-].*/) && (s += n),
                            i[1].match(/[+\-].*/) && (a += n)),
                        (!r || t.getTime() >= r.getTime()) &&
                        (!o || t.getTime() <= o.getTime()) &&
                        (!s || t.getFullYear() >= s) &&
                        (!a || t.getFullYear() <= a)
                    );
                },
                _getFormatConfig: function (e) {
                    var t = this._get(e, 'shortYearCutoff');
                    return {
                        shortYearCutoff: (t =
                            'string' != typeof t ? t : (new Date().getFullYear() % 100) + parseInt(t, 10)),
                        dayNamesShort: this._get(e, 'dayNamesShort'),
                        dayNames: this._get(e, 'dayNames'),
                        monthNamesShort: this._get(e, 'monthNamesShort'),
                        monthNames: this._get(e, 'monthNames'),
                    };
                },
                _formatDate: function (e, t, i, n) {
                    t ||
                        ((e.currentDay = e.selectedDay),
                            (e.currentMonth = e.selectedMonth),
                            (e.currentYear = e.selectedYear));
                    var r = t
                        ? 'object' == typeof t
                            ? t
                            : this._daylightSavingAdjust(new Date(n, i, t))
                        : this._daylightSavingAdjust(new Date(e.currentYear, e.currentMonth, e.currentDay));
                    return this.formatDate(this._get(e, 'dateFormat'), r, this._getFormatConfig(e));
                },
            }),
            (e.fn.datepicker = function (t) {
                if (!this.length) return this;
                e.datepicker.initialized ||
                    (e(document).on('mousedown', e.datepicker._checkExternalClick),
                        (e.datepicker.initialized = !0)),
                    0 === e('#' + e.datepicker._mainDivId).length && e('body').append(e.datepicker.dpDiv);
                var i = Array.prototype.slice.call(arguments, 1);
                return 'string' != typeof t || ('isDisabled' !== t && 'getDate' !== t && 'widget' !== t)
                    ? 'option' === t && 2 === arguments.length && 'string' == typeof arguments[1]
                        ? e.datepicker['_' + t + 'Datepicker'].apply(e.datepicker, [this[0]].concat(i))
                        : this.each(function () {
                            'string' == typeof t
                                ? e.datepicker['_' + t + 'Datepicker'].apply(e.datepicker, [this].concat(i))
                                : e.datepicker._attachDatepicker(this, t);
                        })
                    : e.datepicker['_' + t + 'Datepicker'].apply(e.datepicker, [this[0]].concat(i));
            }),
            (e.datepicker = new i()),
            (e.datepicker.initialized = !1),
            (e.datepicker.uuid = new Date().getTime()),
            (e.datepicker.version = '1.13.1');
        e.datepicker;
    }),
    (app_shop.fn.fontCallback = () => {
        void 0 !== app_shop.fn.fontCallbackMenu && app_shop.fn.fontCallbackMenu();
    });
var google_map_style_array = [
    {
        featureType: 'landscape',
        stylers: [{ saturation: -100 }, { lightness: 65 }, { visibility: 'on' }],
    },
    {
        featureType: 'poi',
        stylers: [{ saturation: -100 }, { lightness: 51 }, { visibility: 'simplified' }],
    },
    { featureType: 'road.highway', stylers: [{ saturation: -100 }, { visibility: 'simplified' }] },
    {
        featureType: 'road.arterial',
        stylers: [{ saturation: -100 }, { lightness: 30 }, { visibility: 'on' }],
    },
    {
        featureType: 'road.local',
        stylers: [{ saturation: -100 }, { lightness: 40 }, { visibility: 'on' }],
    },
    { featureType: 'transit', stylers: [{ saturation: -100 }, { visibility: 'simplified' }] },
    { featureType: 'administrative.province', stylers: [{ visibility: 'off' }] },
    {
        featureType: 'water',
        elementType: 'labels',
        stylers: [{ visibility: 'on' }, { lightness: -25 }, { saturation: -100 }],
    },
    {
        featureType: 'water',
        elementType: 'geometry',
        stylers: [{ hue: '#ffff00' }, { lightness: -25 }, { saturation: -97 }],
    },
];
app_shop.run(
    function () {
        $('[data-ajaxLoad]').length &&
            (app_shop.fn.hotspotAjaxInit = new HotspotAjaxInit({
                afterAllHotspotsCallback: () => {
                    $('.hotspot:not(.--list):not(.--slider):not(.--added)').each(function () {
                        $(this).find('.product__name').setHeight($(this).find('.products')),
                            $(this).find('.product__prices').setHeight($(this).find('.products'));
                    }),
                        (app_shop.vars.hotspot_slider = new HotspotSlider({
                            selector: '.hotspot.--slider .products:not(.slick-initialized)',
                            callbackBefore: e => {
                                e.each(function () {
                                    $(this)
                                        .on('init', function (e) {
                                            app_shop.fn.multiSlideAdaptiveHeight(this);
                                        })
                                        .on('beforeChange', function (e, t, i) {
                                            app_shop.fn.multiSlideAdaptiveHeight(this);
                                        }),
                                        $(this).find('.product__name').setHeight($(this)),
                                        $(this).find('.product__prices').setHeight($(this));
                                });
                            },
                        })),
                        'function' == typeof runOmnibusFallback && runOmnibusFallback();
                },
            }));
    },
    'all',
    'body',
    !0,
),
    app_shop.run(
        function () {
            $('.hotspot:not(.--list):not(.--slider):not(.--added)').each(function () {
                $(this).find('.product__name').setHeight($(this).find('.products')),
                    $(this).find('.product__prices').setHeight($(this).find('.products'));
            });
        },
        [1, 2, 3, 4],
        '.hotspot',
    ),
    app_shop.run(
        function () {
            app_shop.vars.hotspot_slider = new HotspotSlider({
                selector: '.hotspot.--slider .products:not(.slick-initialized)',
                callbackBefore: e => {
                    e.each(function () {
                        $(this)
                            .on('init', function (e) {
                                app_shop.fn.multiSlideAdaptiveHeight(this);
                            })
                            .on('beforeChange', function (e, t, i) {
                                app_shop.fn.multiSlideAdaptiveHeight(this);
                            }),
                            $(this).find('.product__name').setHeight($(this)),
                            $(this).find('.product__prices').setHeight($(this));
                    });
                },
            });
        },
        'all',
        '.hotspot.--slider',
    ),
    app_shop.run(
        function () {
            $('[data-tablet-class]').each(function () {
                $(this).removeClass($(this).attr('data-tablet-class'));
            }),
                $('[data-mobile-class]').each(function () {
                    $(this).removeClass($(this).attr('data-mobile-class'));
                }),
                $('html').removeClass('_mobile');
        },
        [3, 4],
        'body',
        !0,
    ),
    app_shop.run(
        function () {
            setTabletClass(),
                $('#projector_form div.product_info').prepend($('div.product_info_top')),
                $('#projector_form h1').after($('div.projector_description'));
        },
        2,
        'body',
        !0,
    ),
    app_shop.run(
        function () {
            setMobileClass(),
                $('#n67367').length
                    ? ($('#n67367').before($('div.product_info_top')),
                        $('#n67367').before($('div.projector_description')))
                    : ($('#projector_form div.product_info').append($('div.product_info_top')),
                        $('#projector_form div.product_info').append($('div.projector_description')));
        },
        1,
        'body',
        !0,
    ),
    app_shop.run(
        () => {
            document.querySelectorAll('.cm img.rwd-src').forEach(e => {
                e.setAttribute('src', app_shop.fn.getRwdSrc(e));
            });
        },
        [1, 2, 3, 4],
        '.cm img.rwd-src',
    ),
    app_shop.run(function () {
        $('img.b-lazy').parents('a').addClass('loading'),
            (app_shop.vars.bLazy = new Blazy({
                breakpoints: [{ width: 420, src: 'data-src-small' }],
                success: function (e) {
                    $(e).parents('.loading').removeClass('loading'),
                        $('#main_banner1 .main_slider.slick-slider').length &&
                        setTimeout(() => {
                            $('#main_banner1 .main_slider').find('.slick-slide').height('auto'),
                                $('#main_banner1 .main_slider').slick('setOption', '', '', !0);
                        }, 200);
                },
            })),
            // $('#main_banner1 .main_slider').length &&
            //             setTimeout(() => {
            //                 $('#main_banner1 .main_slider').find('.slick-slide').height('auto'),
            //                     // $('#main_banner1 .main_slider').slick('setOption', '', '', !0);
            //             }, 100);

            $('.form-group .form-control, .f-group .f-control').on(
                'change input focus blur',
                app_shop.fn.addFocused,
            ),
            setTimeout(() => {
                $('.form-group .form-control, .f-group .f-control').each(app_shop.fn.addFocused);
            }, 500),
            $('.f-group.--file .f-control').on('change', function () {
                var e = $(this),
                    t = e.siblings('.f-label');
                e.val().length
                    ? (t.addClass('--file'),
                        t.attr('data-label') || t.attr('data-label', t.text()),
                        t.text(e.val()))
                    : (t.removeClass('--file'), t.text(t.attr('data-label')));
            }),
            $('.drop_down_label').append(' <span>'),
            $('.drop_down_list > .active').each(function () {
                $(this).parents('.drop_down_wrapper').find('.drop_down_label span').html($(this).html());
            }),
            $(document).on('click touchstart', '.drop_down_label', function () {
                $(this).toggleClass('open_list'), $(this).next('.drop_down_list').slideToggle();
            }),
            $(document).on('click', '.drop_down_list > *', function () {
                $(this).parents('.drop_down_wrapper').find('.drop_down_label span').text($(this).text()),
                    $(this).parents('.drop_down_wrapper').find('.drop_down_label').removeClass('open_list'),
                    $(this).parents('.drop_down_list').slideUp();
            }),
            $('table.ui-responsive').each(function () {
                if ($(this).find('thead th').length)
                    var e = $.map($(this).find('thead tr th'), function (e, t) {
                        return $(e).text();
                    });
                else
                    e = $.map($(this).find('thead tr td'), function (e, t) {
                        return $(e).text();
                    });
                $(this)
                    .find('tbody tr')
                    .each(function () {
                        $(this)
                            .find('td:first')
                            .replaceWith(function (t, i) {
                                return e[0]
                                    ? $('<th/>').html('<b class="ui-table-cell-label">' + e[0] + '</b>' + i)
                                    : $('<th/>').html(i);
                            });
                    }),
                    $(this)
                        .find('tbody tr')
                        .each(function () {
                            $(this)
                                .find('td')
                                .each(function (t) {
                                    e[t + 1] &&
                                        $(this).prepend('<b class="ui-table-cell-label">' + e[t + 1] + '</b>');
                                });
                        });
            }),
            $('body').append($('#alert_cover')),
            $('body').backTop({ txt: '<i class="icon-chevron-up"></i>' });
        let e = 0.01 * window.innerHeight;
        document.documentElement.style.setProperty('--vh', `${e}px`),
            window.addEventListener('resize', () => {
                (e = 0.01 * window.innerHeight),
                    document.documentElement.style.setProperty('--vh', `${e}px`);
            });
    }, 'all'),
    app_shop.run(
        function () {
            document.querySelectorAll('.article__date').forEach(e => {
                const t = app_shop.fn.news_data({
                    data: e.textContent,
                    month_names: iaical_shortNames,
                    format: '<div>%d</div><span>%m</span>',
                });
                t && (e.innerHTML = t);
            });
        },
        'all',
        '.article__date',
    ),
    (app_shop.fn.fixed_scroll = (e, t) => {
        let i = window.scrollY;
        const n = window;
        window.addEventListener('scroll', function (r) {
            n.scrollY > i && n.scrollY > 0
                ? !e.classList.contains(t) && e.classList.add(t)
                : e.classList.contains(t) && e.classList.remove(t),
                (i = n.scrollY);
        });
    }),
    (app_shop.fn.isIos = () =>
        ['iPad Simulator', 'iPhone Simulator', 'iPod Simulator', 'iPad', 'iPhone', 'iPod'].includes(
            navigator.platform,
        ) ||
        (navigator.userAgent.includes('Mac') && 'ontouchend' in document)),
    (app_shop.vars.isIos = app_shop.fn.isIos()),
    (app_shop.fn.isSafari = () =>
    (isSafari =
        navigator.vendor &&
        navigator.vendor.indexOf('Apple') > -1 &&
        navigator.userAgent &&
        -1 == navigator.userAgent.indexOf('CriOS') &&
        -1 == navigator.userAgent.indexOf('FxiOS'))),
    (app_shop.vars.isSafari = app_shop.fn.isSafari()),
    app_shop.run(
        function () {
            app_shop.fn.fixed_scroll(document.querySelector('html'), 'scroll'),
                app_shop.vars.isIos && $('html').addClass('--ios'),
                app_shop.vars.isSafari && $('html').addClass('--safari');
        },
        [1, 2],
        '#container',
    ),
    app_shop.run(
        function () {
            $('.moreInfo__show').on('click', function () {
                $(this).parent().toggleClass('--hover'),
                    $(this).parent().find('.moreInfo').toggleClass('--hover');
            });
        },
        'all',
        '.moreInfo__show',
    ),
    (app_shop.txt.txt_77752_1 =
        'Nie moĹźna wgraÄ pliku %s, poniewaĹź przekracza maksymalny dozwolony rozmiar %dMB.'),
    (app_shop.txt.txt_77752_2 =
        'Nie moĹźna wgraÄ pliku %s, poniewaĹź zaĹÄczanie plikĂłw tego typu jest niedozwolone.'),
    (app_shop.txt.txt_77752_3 = 'Dopuszczalne formaty zdjÄÄ: .jpg.'),
    (app_shop.txt.txt_77752_4 = 'Maksymalny rozmiar zdjÄcia to: %spx.');
var hotspotAjaxWrapType = '';
function ownKeys(e, t) {
    var i = Object.keys(e);
    if (Object.getOwnPropertySymbols) {
        var n = Object.getOwnPropertySymbols(e);
        t &&
            (n = n.filter(function (t) {
                return Object.getOwnPropertyDescriptor(e, t).enumerable;
            })),
            i.push.apply(i, n);
    }
    return i;
}
function _objectSpread(e) {
    for (var t = 1; t < arguments.length; t++) {
        var i = null != arguments[t] ? arguments[t] : {};
        t % 2
            ? ownKeys(Object(i), !0).forEach(function (t) {
                _defineProperty(e, t, i[t]);
            })
            : Object.getOwnPropertyDescriptors
                ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(i))
                : ownKeys(Object(i)).forEach(function (t) {
                    Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(i, t));
                });
    }
    return e;
}
function _defineProperty(e, t, i) {
    return (
        t in e
            ? Object.defineProperty(e, t, { value: i, enumerable: !0, configurable: !0, writable: !0 })
            : (e[t] = i),
        e
    );
}
(app_shop.txt.txt_validation1 = 'Minimalna liczba znakĂłw dla tego pola to '),
    (app_shop.txt.txt_validation2 = 'Maksymalna liczba znakĂłw dla tego pola to '),
    (app_shop.txt.txt_validation3 =
        'BĹÄdnie wpisany e-mail. Wpisz peĹny adres e-mail, np. jan@kowalski.com.'),
    (app_shop.txt.txt_validation4 = 'Te pole jest obowiÄzkowe.'),
    (app_shop.txt.txt_validation5 = 'Format numeru konta bankowego jest niepoprawny '),
    (app_shop.txt.txt_validation6 = 'Numer telefonu powinien zawieraÄ minimum 9 znakĂłw '),
    (app_shop.txt.hotspot_prev = 'Poprzedni z tej kategorii'),
    (app_shop.txt.hotspot_next = 'NastÄpny z tej kategorii');
const Alertek = {
    alert_cover: '',
    cloudID: '',
    alert_timer: null,
    Start: (e, t, i = 4e3) => {
        if (
            (clearTimeout(Alertek.alert_timer),
                $('#alert_cover').remove(),
                $('body').append(
                    `<div id="alert_cover" class="alertek ${t ? `${t}` : ''
                    }" style="display:none" onclick="Alertek.hide_alert();"><![CDATA[]]></div>`,
                ),
                t || $('#alert_cover').addClass('menu_messages_message'),
                (Alertek.cloudID = $('#alert_cover')),
                e)
        ) {
            if ((Alertek.cloudID.html(e), !t)) {
                const e = parseInt(
                    $(window).height() / 2 - Alertek.cloudID.height() / 2 + $(window).scrollTop(),
                ),
                    t = parseInt($(window).width() / 2 - Alertek.cloudID.width() / 2);
                Alertek.cloudID.css({ top: e, marginLeft: t, left: 0 });
            }
            Alertek.cloudID.fadeIn(500), (Alertek.alert_timer = setTimeout(Alertek.End, i));
        }
    },
    End: () => {
        Alertek.cloudID.fadeOut(500);
    },
    Info: (e, t) => {
        Alertek.Start(e, '--info', t);
    },
    Warning: (e, t) => {
        Alertek.Start(e, '--warning', t);
    },
    Error: (e, t) => {
        Alertek.Start(e, '--error', t);
    },
    Success: (e, t) => {
        Alertek.Start(e, '--success', t);
    },
    show_alert: (e, t) => {
        Alertek.Start(e, !1, t);
    },
    hide_alert: () => {
        Alertek.End();
    },
};
$(this).addClass($(this).attr('data-tablet-class')),
    $('html').removeClass('_mobile'),
    app_shop.run(
        function () {
            setTimeout(function () {
                app_shop.fn.cookie.get('login') &&
                    (app_shop.fn.cookie.set('ck_cook', !0, 30), $('#ckdsclmrshtdwn').click());
            }, 500);
        },
        'all',
        'body',
    ),
    (function (e) {
        e.fn.separateElements = function (t) {
            var i = e.extend({ numCol: 4 }, t);
            return this.each(function () {
                ($this = e(this)),
                    $this.find('.separator').remove(),
                    $this.find('> *:nth-child(' + i.numCol + 'n)').after('<div class="clearfix separator">');
            });
        };
    })(jQuery),
    (function (e) {
        e.fn.wrappTableLayout = function (t) {
            var i = e.extend(
                {
                    numCol: 4,
                    wrapper: '<div class="table_row">',
                    tableClass: 'table_wrapper',
                    cellClass: 'table_cell',
                    wrapp: !0,
                },
                t,
            );
            return this.each(function () {
                $this = e(this);
                var t = $this.find('> *');
                if (
                    ($this.is('.' + i.tableClass) &&
                        ($this.removeClass(i.tableClass),
                            t.removeClass(i.cellClass),
                            t.find('> *').unwrap(),
                            (t = $this.find('> *'))),
                        i.wrapp)
                ) {
                    $this.addClass(i.tableClass), t.addClass(i.cellClass);
                    for (var n = 0, r = t.length; n < r; n += i.numCol)
                        t.slice(n, n + i.numCol).wrapAll(i.wrapper);
                }
            });
        };
    })(jQuery);
var IAI_Ajax = {
    Request: function (_url, pd, fun) {
        $.ajax({ type: 'POST', url: _url, data: pd }).done(function (responseText) {
            fun &&
                fun.onSuccess &&
                (fun.arg
                    ? eval(fun.onSuccess + "('" + responseText + "', '" + fun.arg + "');")
                    : eval(fun.onSuccess + "('" + responseText + "');"));
        });
    },
};
(app_shop.fn.addFocused = function (e, t) {
    const i = t ? $(t) : $(this);
    (i.next().hasClass('control-label') || i.next().hasClass('f-label')) &&
        ('' != i.val() ? i.addClass('focused') : i.removeClass('focused'));
}),
    ($.fn.textWidth = function (e, t) {
        return (
            $.fn.textWidth.fakeEl || ($.fn.textWidth.fakeEl = $('<span>').hide().appendTo(document.body)),
            $.fn.textWidth.fakeEl.text(e || this.val() || this.text()).css('font', t || this.css('font')),
            $.fn.textWidth.fakeEl.width()
        );
    });
const loadImageFromInput = e =>
    new Promise((t, i) => {
        const n = (window.URL || window.webkitURL).createObjectURL(e),
            r = new Image();
        (r.onload = () => t({ width: r.width, height: r.height })), (r.onerror = i), (r.src = n);
    });
$(document).on('change', 'input[type=file]', function () {
    if (!(window.File && window.FileReader && window.FileList && window.Blob)) return !1;
    const e = this.files[0],
        { name: t, size: i, type: n } = e || {},
        [r] = t.split('.').reverse(),
        o = $(this).data('max_filesize'),
        s = o && i <= Number(o),
        a = app_shop.vars.blacklist_mime && app_shop.vars.blacklist_mime.includes(n),
        c = app_shop.vars.blacklist_extension && app_shop.vars.blacklist_extension.includes(r);
    let l = '';
    return (
        a || (c && app_shop.txt.txt_77752_2)
            ? (l = app_shop.txt.txt_77752_2.format(t))
            : !s &&
            app_shop.txt.txt_77752_1 &&
            o &&
            (l = app_shop.txt.txt_77752_1.format(t, (o / 1048576).toFixed(2))),
        l ? ($(this).val(''), Alertek.Start(l), !1) : void 0
    );
}),
    ($.fn.inView = function () {
        return $(window).scrollTop() + $(window).height() + 100 > $(this).position().top;
    }),
    (function (e) {
        e.fn.backTop = function (t) {
            var i = e.extend({ speed: 500, txt: '&uarr;', id: 'backTop', duration: 500 }, t);
            e('#' + i.id).remove(), e('body').append('<a id=' + i.id + '>' + i.txt + '</a>');
            var n = e('#' + i.id),
                r = 2 * e(window).height(),
                o = i.speed;
            (getRightOffset = function () {
                var t = 10,
                    i = 0.5 * (e(window).width() - e('#container').outerWidth()) - 2 * t;
                i >= n.outerWidth() && (t = i - n.outerWidth() + t), n.css('right', t + 'px');
            }),
                getRightOffset(),
                e(window).resize(function () {
                    getRightOffset();
                }),
                e(document).scroll(function () {
                    e(window).scrollTop() >= r ? n.fadeIn(o) : n.fadeOut(o);
                }),
                n.click(function () {
                    e('html, body').animate({ scrollTop: 0 }, { duration: i.duration });
                });
        };
    })(jQuery),
    (function (e, t, i) {
        function n(e, t) {
            return typeof e === t;
        }
        function r(e) {
            var t = x.className,
                i = b._config.classPrefix || '';
            if ((S && (t = t.baseVal), b._config.enableJSClass)) {
                var n = new RegExp('(^|\\s)' + i + 'no-js(\\s|$)');
                t = t.replace(n, '$1' + i + 'js$2');
            }
            b._config.enableClasses &&
                ((t += ' ' + i + e.join(' ' + i)), S ? (x.className.baseVal = t) : (x.className = t));
        }
        function o(e, t) {
            if ('object' == typeof e) for (var i in e) k(e, i) && o(i, e[i]);
            else {
                var n = (e = e.toLowerCase()).split('.'),
                    s = b[n[0]];
                if ((2 == n.length && (s = s[n[1]]), void 0 !== s)) return b;
                (t = 'function' == typeof t ? t() : t),
                    1 == n.length
                        ? (b[n[0]] = t)
                        : (!b[n[0]] || b[n[0]] instanceof Boolean || (b[n[0]] = new Boolean(b[n[0]])),
                            (b[n[0]][n[1]] = t)),
                    r([(t && 0 != t ? '' : 'no-') + n.join('-')]),
                    b._trigger(e, t);
            }
            return b;
        }
        function s(e) {
            return e
                .replace(/([a-z])-([a-z])/g, function (e, t, i) {
                    return t + i.toUpperCase();
                })
                .replace(/^-/, '');
        }
        function a() {
            return 'function' != typeof t.createElement
                ? t.createElement(arguments[0])
                : S
                    ? t.createElementNS.call(t, 'http://www.w3.org/2000/svg', arguments[0])
                    : t.createElement.apply(t, arguments);
        }
        function c(t, i, n) {
            var r;
            if ('getComputedStyle' in e) {
                r = getComputedStyle.call(e, t, i);
                var o = e.console;
                if (null !== r) n && (r = r.getPropertyValue(n));
                else if (o) {
                    o[o.error ? 'error' : 'log'].call(
                        o,
                        'getComputedStyle returning null, its possible modernizr test results are inaccurate',
                    );
                }
            } else r = !i && t.currentStyle && t.currentStyle[n];
            return r;
        }
        function l(e, t) {
            return !!~('' + e).indexOf(t);
        }
        function p(e, t) {
            return function () {
                return e.apply(t, arguments);
            };
        }
        function d(e, i, n, r) {
            var o,
                s,
                c,
                l,
                p = 'modernizr',
                d = a('div'),
                u = (function () {
                    var e = t.body;
                    return e || ((e = a(S ? 'svg' : 'body')).fake = !0), e;
                })();
            if (parseInt(n, 10))
                for (; n--;) ((c = a('div')).id = r ? r[n] : p + (n + 1)), d.appendChild(c);
            return (
                ((o = a('style')).type = 'text/css'),
                (o.id = 's' + p),
                (u.fake ? u : d).appendChild(o),
                u.appendChild(d),
                o.styleSheet ? (o.styleSheet.cssText = e) : o.appendChild(t.createTextNode(e)),
                (d.id = p),
                u.fake &&
                ((u.style.background = ''),
                    (u.style.overflow = 'hidden'),
                    (l = x.style.overflow),
                    (x.style.overflow = 'hidden'),
                    x.appendChild(u)),
                (s = i(d, e)),
                u.fake
                    ? (u.parentNode.removeChild(u), (x.style.overflow = l), x.offsetHeight)
                    : d.parentNode.removeChild(d),
                !!s
            );
        }
        function u(e) {
            return e
                .replace(/([A-Z])/g, function (e, t) {
                    return '-' + t.toLowerCase();
                })
                .replace(/^ms-/, '-ms-');
        }
        function h(t, n) {
            var r = t.length;
            if ('CSS' in e && 'supports' in e.CSS) {
                for (; r--;) if (e.CSS.supports(u(t[r]), n)) return !0;
                return !1;
            }
            if ('CSSSupportsRule' in e) {
                for (var o = []; r--;) o.push('(' + u(t[r]) + ':' + n + ')');
                return d(
                    '@supports (' + (o = o.join(' or ')) + ') { #modernizr { position: absolute; } }',
                    function (e) {
                        return 'absolute' == c(e, null, 'position');
                    },
                );
            }
            return i;
        }
        function f(e, t, r, o) {
            function c() {
                d && (delete A.style, delete A.modElem);
            }
            if (((o = !n(o, 'undefined') && o), !n(r, 'undefined'))) {
                var p = h(e, r);
                if (!n(p, 'undefined')) return p;
            }
            for (var d, u, f, m, _, g = ['modernizr', 'tspan', 'samp']; !A.style && g.length;)
                (d = !0), (A.modElem = a(g.shift())), (A.style = A.modElem.style);
            for (f = e.length, u = 0; f > u; u++)
                if (((m = e[u]), (_ = A.style[m]), l(m, '-') && (m = s(m)), A.style[m] !== i)) {
                    if (o || n(r, 'undefined')) return c(), 'pfx' != t || m;
                    try {
                        A.style[m] = r;
                    } catch (e) { }
                    if (A.style[m] != _) return c(), 'pfx' != t || m;
                }
            return c(), !1;
        }
        function m(e, t, i, r, o) {
            var s = e.charAt(0).toUpperCase() + e.slice(1),
                a = (e + ' ' + j.join(s + ' ') + s).split(' ');
            return n(t, 'string') || n(t, 'undefined')
                ? f(a, t, r, o)
                : (function (e, t, i) {
                    var r;
                    for (var o in e)
                        if (e[o] in t)
                            return !1 === i ? e[o] : n((r = t[e[o]]), 'function') ? p(r, i || t) : r;
                    return !1;
                })((a = (e + ' ' + $.join(s + ' ') + s).split(' ')), t, i);
        }
        function _(e, t, n) {
            return m(e, i, i, t, n);
        }
        var g = [],
            y = [],
            v = {
                _version: '3.5.0',
                _config: { classPrefix: '', enableClasses: !0, enableJSClass: !0, usePrefixes: !0 },
                _q: [],
                on: function (e, t) {
                    var i = this;
                    setTimeout(function () {
                        t(i[e]);
                    }, 0);
                },
                addTest: function (e, t, i) {
                    y.push({ name: e, fn: t, options: i });
                },
                addAsyncTest: function (e) {
                    y.push({ name: null, fn: e });
                },
            },
            b = function () { };
        (b.prototype = v), (b = new b());
        var w = v._config.usePrefixes ? ' -webkit- -moz- -o- -ms- '.split(' ') : ['', ''];
        v._prefixes = w;
        var k,
            x = t.documentElement,
            S = 'svg' === x.nodeName.toLowerCase(),
            C = 'Moz O ms Webkit',
            $ = v._config.usePrefixes ? C.toLowerCase().split(' ') : [];
        (v._domPrefixes = $),
            (function () {
                var e = {}.hasOwnProperty;
                k =
                    n(e, 'undefined') || n(e.call, 'undefined')
                        ? function (e, t) {
                            return t in e && n(e.constructor.prototype[t], 'undefined');
                        }
                        : function (t, i) {
                            return e.call(t, i);
                        };
            })(),
            (v._l = {}),
            (v.on = function (e, t) {
                this._l[e] || (this._l[e] = []),
                    this._l[e].push(t),
                    b.hasOwnProperty(e) &&
                    setTimeout(function () {
                        b._trigger(e, b[e]);
                    }, 0);
            }),
            (v._trigger = function (e, t) {
                if (this._l[e]) {
                    var i = this._l[e];
                    setTimeout(function () {
                        var e;
                        for (e = 0; e < i.length; e++) (0, i[e])(t);
                    }, 0),
                        delete this._l[e];
                }
            }),
            b._q.push(function () {
                v.addTest = o;
            }),
            b.addTest('canvas', function () {
                var e = a('canvas');
                return !(!e.getContext || !e.getContext('2d'));
            });
        var j = v._config.usePrefixes ? C.split(' ') : [];
        v._cssomPrefixes = j;
        var T = function (t) {
            var n,
                r = w.length,
                o = e.CSSRule;
            if (void 0 === o) return i;
            if (!t) return !1;
            if ((n = (t = t.replace(/^@/, '')).replace(/-/g, '_').toUpperCase() + '_RULE') in o)
                return '@' + t;
            for (var s = 0; r > s; s++) {
                var a = w[s];
                if (a.toUpperCase() + '_' + n in o) return '@-' + a.toLowerCase() + '-' + t;
            }
            return !1;
        };
        v.atRule = T;
        var z = (v.testStyles = d);
        z('#modernizr { width: 50vw; }', function (t) {
            var i = parseInt(e.innerWidth / 2, 10),
                n = parseInt(c(t, null, 'width'), 10);
            b.addTest('cssvwunit', n == i);
        });
        var D = { elem: a('modernizr') };
        b._q.push(function () {
            delete D.elem;
        });
        var A = { style: D.elem.style };
        b._q.unshift(function () {
            delete A.style;
        }),
            (v.testAllProps = m),
            (v.prefixed = function (e, t, i) {
                return 0 === e.indexOf('@')
                    ? T(e)
                    : (-1 != e.indexOf('-') && (e = s(e)), t ? m(e, t, i) : m(e, 'pfx'));
            }),
            (v.testAllProps = _),
            b.addTest('flexbox', _('flexBasis', '1px', !0)),
            b.addTest('touch', function () {
                var i;
                if ('ontouchstart' in e || (e.DocumentTouch && t instanceof DocumentTouch)) i = !0;
                else {
                    var n = [
                        '@media (',
                        w.join('touch-enabled),('),
                        'heartz',
                        ')',
                        '{#modernizr{top:9px;position:absolute}}',
                    ].join('');
                    z(n, function (e) {
                        i = 9 === e.offsetTop;
                    });
                }
                return i;
            }),
            (function () {
                var e, t, i, r, o, s;
                for (var a in y)
                    if (y.hasOwnProperty(a)) {
                        if (
                            ((e = []),
                                (t = y[a]).name &&
                                (e.push(t.name.toLowerCase()),
                                    t.options && t.options.aliases && t.options.aliases.length))
                        )
                            for (i = 0; i < t.options.aliases.length; i++)
                                e.push(t.options.aliases[i].toLowerCase());
                        for (r = n(t.fn, 'function') ? t.fn() : t.fn, o = 0; o < e.length; o++)
                            1 === (s = e[o].split('.')).length
                                ? (b[s[0]] = r)
                                : (!b[s[0]] || b[s[0]] instanceof Boolean || (b[s[0]] = new Boolean(b[s[0]])),
                                    (b[s[0]][s[1]] = r)),
                                g.push((r ? '' : 'no-') + s.join('-'));
                    }
            })(),
            r(g),
            delete v.addTest,
            delete v.addAsyncTest;
        for (var E = 0; E < b._q.length; E++) b._q[E]();
        e.Modernizr = b;
    })(window, document),
    (function (e, t) {
        'function' == typeof define && define.amd
            ? define(t)
            : 'object' == typeof exports
                ? (module.exports = t())
                : (e.Blazy = t());
    })(this, function () {
        function e(e) {
            var i = e._util;
            (i.elements = (function (e) {
                for (
                    var t = [], i = (e = e.root.querySelectorAll(e.selector)).length;
                    i--;
                    t.unshift(e[i])
                );
                return t;
            })(e.options)),
                (i.count = i.elements.length),
                i.destroyed &&
                ((i.destroyed = !1),
                    e.options.container &&
                    d(e.options.container, function (e) {
                        l(e, 'scroll', i.validateT);
                    }),
                    l(window, 'resize', i.saveViewportOffsetT),
                    l(window, 'resize', i.validateT),
                    l(window, 'scroll', i.validateT)),
                t(e);
        }
        function t(e) {
            for (var t = e._util, n = 0; n < t.count; n++) {
                var r,
                    o = t.elements[n],
                    a = o;
                r = e.options;
                var c = a.getBoundingClientRect();
                r.container && _ && (a = a.closest(r.containerClass))
                    ? (r =
                        !!i((a = a.getBoundingClientRect()), f) &&
                        i(c, {
                            top: a.top - r.offset,
                            right: a.right + r.offset,
                            bottom: a.bottom + r.offset,
                            left: a.left - r.offset,
                        }))
                    : (r = i(c, f)),
                    (r || s(o, e.options.successClass)) &&
                    (e.load(o), t.elements.splice(n, 1), t.count--, n--);
            }
            0 === t.count && e.destroy();
        }
        function i(e, t) {
            return e.right >= t.left && e.bottom >= t.top && e.left <= t.right && e.top <= t.bottom;
        }
        function n(e, t, i) {
            if (
                !s(e, i.successClass) &&
                (t || i.loadInvisible || (0 < e.offsetWidth && 0 < e.offsetHeight))
            )
                if ((t = e.getAttribute(h) || e.getAttribute(i.src))) {
                    var n = (t = t.split(i.separator))[m && 1 < t.length ? 1 : 0],
                        c = e.getAttribute(i.srcset),
                        u = 'img' === e.nodeName.toLowerCase(),
                        f = (t = e.parentNode) && 'picture' === t.nodeName.toLowerCase();
                    if (u || void 0 === e.src) {
                        var _ = new Image(),
                            g = function () {
                                i.error && i.error(e, 'invalid'),
                                    a(e, i.errorClass),
                                    p(_, 'error', g),
                                    p(_, 'load', y);
                            },
                            y = function () {
                                u ? f || o(e, n, c) : (e.style.backgroundImage = 'url("' + n + '")'),
                                    r(e, i),
                                    p(_, 'load', y),
                                    p(_, 'error', g);
                            };
                        f &&
                            ((_ = e),
                                d(t.getElementsByTagName('source'), function (e) {
                                    var t = i.srcset,
                                        n = e.getAttribute(t);
                                    n && (e.setAttribute('srcset', n), e.removeAttribute(t));
                                })),
                            l(_, 'error', g),
                            l(_, 'load', y),
                            o(_, n, c);
                    } else (e.src = n), r(e, i);
                } else
                    'video' === e.nodeName.toLowerCase()
                        ? (d(e.getElementsByTagName('source'), function (e) {
                            var t = i.src,
                                n = e.getAttribute(t);
                            n && (e.setAttribute('src', n), e.removeAttribute(t));
                        }),
                            e.load(),
                            r(e, i))
                        : (i.error && i.error(e, 'missing'), a(e, i.errorClass));
        }
        function r(e, t) {
            a(e, t.successClass),
                t.success && t.success(e),
                e.removeAttribute(t.src),
                e.removeAttribute(t.srcset),
                d(t.breakpoints, function (t) {
                    e.removeAttribute(t.src);
                });
        }
        function o(e, t, i) {
            i && e.setAttribute('srcset', i), (e.src = t);
        }
        function s(e, t) {
            return -1 !== (' ' + e.className + ' ').indexOf(' ' + t + ' ');
        }
        function a(e, t) {
            s(e, t) || (e.className += ' ' + t);
        }
        function c(e) {
            (f.bottom = (window.innerHeight || document.documentElement.clientHeight) + e),
                (f.right = (window.innerWidth || document.documentElement.clientWidth) + e);
        }
        function l(e, t, i) {
            e.attachEvent
                ? e.attachEvent && e.attachEvent('on' + t, i)
                : e.addEventListener(t, i, { capture: !1, passive: !0 });
        }
        function p(e, t, i) {
            e.detachEvent
                ? e.detachEvent && e.detachEvent('on' + t, i)
                : e.removeEventListener(t, i, { capture: !1, passive: !0 });
        }
        function d(e, t) {
            if (e && t) for (var i = e.length, n = 0; n < i && !1 !== t(e[n], n); n++);
        }
        function u(e, t, i) {
            var n = 0;
            return function () {
                var r = +new Date();
                r - n < t || ((n = r), e.apply(i, arguments));
            };
        }
        var h, f, m, _;
        return function (i) {
            if (!document.querySelectorAll) {
                var r = document.createStyleSheet();
                document.querySelectorAll = function (e, t, i, n, o) {
                    for (
                        o = document.all,
                        t = [],
                        i = (e = e.replace(/\[for\b/gi, '[htmlFor').split(',')).length;
                        i--;

                    ) {
                        for (r.addRule(e[i], 'k:v'), n = o.length; n--;) o[n].currentStyle.k && t.push(o[n]);
                        r.removeRule(0);
                    }
                    return t;
                };
            }
            var o = this,
                s = (o._util = {});
            (s.elements = []),
                (s.destroyed = !0),
                (o.options = i || {}),
                (o.options.error = o.options.error || !1),
                (o.options.offset = o.options.offset || 100),
                (o.options.root = o.options.root || document),
                (o.options.success = o.options.success || !1),
                (o.options.selector = o.options.selector || '.b-lazy'),
                (o.options.separator = o.options.separator || '|'),
                (o.options.containerClass = o.options.container),
                (o.options.container =
                    !!o.options.containerClass && document.querySelectorAll(o.options.containerClass)),
                (o.options.errorClass = o.options.errorClass || 'b-error'),
                (o.options.breakpoints = o.options.breakpoints || !1),
                (o.options.loadInvisible = o.options.loadInvisible || !1),
                (o.options.successClass = o.options.successClass || 'b-loaded'),
                (o.options.validateDelay = o.options.validateDelay || 25),
                (o.options.saveViewportOffsetDelay = o.options.saveViewportOffsetDelay || 50),
                (o.options.srcset = o.options.srcset || 'data-srcset'),
                (o.options.src = h = o.options.src || 'data-src'),
                (_ = Element.prototype.closest),
                (m = 1 < window.devicePixelRatio),
                ((f = {}).top = 0 - o.options.offset),
                (f.left = 0 - o.options.offset),
                (o.revalidate = function () {
                    e(this);
                }),
                (o.load = function (e, t) {
                    var i = this.options;
                    void 0 === e.length
                        ? n(e, t, i)
                        : d(e, function (e) {
                            n(e, t, i);
                        });
                }),
                (o.destroy = function () {
                    var e = this._util;
                    this.options.container &&
                        d(this.options.container, function (t) {
                            p(t, 'scroll', e.validateT);
                        }),
                        p(window, 'scroll', e.validateT),
                        p(window, 'resize', e.validateT),
                        p(window, 'resize', e.saveViewportOffsetT),
                        (e.count = 0),
                        (e.elements.length = 0),
                        (e.destroyed = !0);
                }),
                (s.validateT = u(
                    function () {
                        t(o);
                    },
                    o.options.validateDelay,
                    o,
                )),
                (s.saveViewportOffsetT = u(
                    function () {
                        c(o.options.offset);
                    },
                    o.options.saveViewportOffsetDelay,
                    o,
                )),
                c(o.options.offset),
                d(o.options.breakpoints, function (e) {
                    if (e.width >= window.screen.width) return (h = e.src), !1;
                }),
                setTimeout(function () {
                    e(o);
                });
        };
    }),
    (function (e) {
        var t,
            i,
            n = 'center',
            r = 'left',
            o = 'right',
            s = 'auto';
        function a(t) {
            (this.$element = e(t)),
                (this.original_text = this.$element.html()),
                (this.settings = e.extend({}, e.fn.trunk8.defaults));
        }
        function c() {
            var t,
                n,
                r,
                o,
                a = this.data('trunk8'),
                c = a.settings,
                l = c.width,
                p = c.side,
                d = c.fill,
                u = i.getLineHeight(this) * c.lines,
                h = a.original_text,
                f = h.length,
                m = '';
            if ((this.html(h), l === s)) {
                if (this.height() <= u) return;
                for (t = 0, n = f - 1; t <= n;)
                    (r = t + ((n - t) >> 1)),
                        (o = i.eatStr(h, p, f - r, d)),
                        this.html(o),
                        this.height() > u ? (n = r - 1) : ((t = r + 1), (m = m.length > o.length ? m : o));
                this.html(''), this.html(m), c.tooltip && this.attr('title', h);
            } else
                isNaN(l)
                    ? e.error('Invalid width "' + l + '".')
                    : ((r = f - l),
                        (o = i.eatStr(h, p, r, d)),
                        this.html(o),
                        c.tooltip && this.attr('title', h));
        }
        (a.prototype.updateSettings = function (t) {
            this.settings = e.extend(this.settings, t);
        }),
            (t = {
                init: function (t) {
                    return this.each(function () {
                        var i = e(this),
                            n = i.data('trunk8');
                        n || i.data('trunk8', (n = new a(this))), n.updateSettings(t), c.call(i);
                    });
                },
                update: function (t) {
                    return this.each(function () {
                        var i = e(this);
                        t && (i.data('trunk8').original_text = t), c.call(i);
                    });
                },
                revert: function () {
                    return this.each(function () {
                        var t = e(this).data('trunk8').original_text;
                        e(this).html(t);
                    });
                },
                getSettings: function () {
                    return this.get(0).data('trunk8').settings;
                },
            }),
            (i = {
                eatStr: function (t, s, a, c) {
                    var l,
                        p,
                        d = t.length,
                        u = i.eatStr.generateKey.apply(null, arguments);
                    if (i.eatStr.cache[u]) return i.eatStr.cache[u];
                    if (
                        (('string' == typeof t && 0 !== d) || e.error('Invalid source string "' + t + '".'),
                            a < 0 || a > d)
                    )
                        e.error('Invalid bite size "' + a + '".');
                    else if (0 === a) return t;
                    switch (
                    ('string' != typeof (c + '') && e.error('Fill unable to be converted to a string.'), s)
                    ) {
                        case o:
                            return (i.eatStr.cache[u] = e.trim(t.substr(0, d - a)) + c);
                        case r:
                            return (i.eatStr.cache[u] = c + e.trim(t.substr(a)));
                        case n:
                            return (
                                (l = d >> 1),
                                (p = a >> 1),
                                (i.eatStr.cache[u] =
                                    e.trim(i.eatStr(t.substr(0, d - l), o, a - p, '')) +
                                    c +
                                    e.trim(i.eatStr(t.substr(d - l), r, p, '')))
                            );
                        default:
                            e.error('Invalid side "' + s + '".');
                    }
                },
                getLineHeight: function (t) {
                    var i,
                        n = e(t),
                        r = n.css('float'),
                        o = n.css('position'),
                        s = n.html(),
                        a = 'line-height-test';
                    return (
                        'none' !== r && n.css('float', 'none'),
                        'absolute' === o && n.css('position', 'static'),
                        n.html('i').wrap('<div id="' + a + '" />'),
                        (i = e('#' + a).innerHeight()),
                        n.html(s).css({ float: r, position: o }).unwrap(),
                        i
                    );
                },
            }),
            (i.eatStr.cache = {}),
            (i.eatStr.generateKey = function () {
                return Array.prototype.join.call(arguments, '');
            }),
            (e.fn.trunk8 = function (i) {
                return t[i]
                    ? t[i].apply(this, Array.prototype.slice.call(arguments, 1))
                    : 'object' != typeof i && i
                        ? void e.error('Method ' + i + ' does not exist on jQuery.trunk8')
                        : t.init.apply(this, arguments);
            }),
            (e.fn.trunk8.defaults = { fill: '&hellip;', lines: 1, side: o, tooltip: !0, width: s });
    })(jQuery);
var responsiveSwitch = (function () {
    var e = parseInt(window.responsiveSwitchBreakpoint) || 1024,
        t = 'ResponsiveSwitch',
        i = 'content',
        n = 'data-rs',
        r = 'rs-link-to-desktop',
        o = 'rs-link-to-responsive',
        s = 'rs-link-inactive',
        a = 'rs-link-active';
    function c() {
        var r = document.querySelector('meta[name="viewport"]');
        return (
            null == r.getAttribute(n) && r.setAttribute(n, r.getAttribute(i)),
            r.getAttribute(i) == r.getAttribute(n)
                ? ((document.cookie = t + '=true;path=/'),
                    document.documentElement.clientWidth != window.innerWidth
                        ? (document.location.href = m())
                        : r.setAttribute(
                            i,
                            'width=' + e + 'px, initial-scale=' + document.documentElement.clientWidth / e,
                        ))
                : ((document.cookie = t + '=false;path=/;expires=Thu, 01 Jan 1970 00:00:01 GMT'),
                    document.documentElement.clientWidth != window.innerWidth
                        ? (document.location.href = m())
                        : r.setAttribute(i, r.getAttribute(n))),
            !1
        );
    }
    var l = !1;
    function p() {
        for (var t = document.querySelectorAll('.rs-link'), i = 0; i < t.length; i++) {
            var n = t[i];
            null != n &&
                (f(n, o),
                    f(n, r),
                    f(n, s),
                    f(n, a),
                    u()
                        ? (h(n, o), h(n, a), (n.innerHTML = n.getAttribute('data-link-responsive')))
                        : document.documentElement &&
                            (document.documentElement.clientWidth < e ||
                                'true' == n.getAttribute('data-always-visible'))
                            ? (h(n, r), h(n, a), (n.innerHTML = n.getAttribute('data-link-desktop')))
                            : (h(n, s), (n.innerHTML = '')),
                    l ||
                    n.addEventListener(
                        'click',
                        function (e) {
                            (e = e || window.event).preventDefault(), d();
                        },
                        !1,
                    ));
        }
        l = !0;
    }
    function d() {
        c(), p();
    }
    function u() {
        return document.cookie.search(t + '=true') > -1;
    }
    function h(e, t) {
        e.className += ' ' + t;
    }
    function f(e, t) {
        (e.className = ' ' + e.className + ' '), (e.className = e.className.replace(' ' + t + ' ', ''));
    }
    function m() {
        var e = new Date().getTime();
        return (
            document.location.protocol +
            '//' +
            document.location.host +
            document.location.pathname +
            (window.location.search ? window.location.search + '&' : '?') +
            'rsTimestamp=' +
            e +
            document.location.hash
        );
    }
    return (
        u() && c(),
        document.addEventListener &&
        (document.addEventListener('DOMContentLoaded', p, !1),
            document.addEventListener('orientationchange', p, !1),
            window.addEventListener('resize', p, !1)),
        { toggle: d }
    );
})();
function procesArrayFunctions(e) {
    var t, i;
    for (t = 0, i = e.length; t < i; t++) {
        $(e[t][1]).length && e[t][0]($(e[t][1]));
    }
}
($.fn.maxHeightO = function () {
    var e = 0;
    return (
        this.each(function () {
            e = Math.max(e, $(this).outerHeight());
        }),
        e
    );
}),
    ($.fn.maxHeight = function () {
        var e = 0;
        return (
            this.height('auto'),
            this.each(function () {
                e = Math.max(e, $(this).outerHeight());
            }),
            this.height(e),
            this
        );
    });
var setMobileClass = function () {
    $('[data-tablet-class]').each(function () {
        $(this).removeClass($(this).attr('data-tablet-class'));
    }),
        $('[data-mobile-class]').each(function () {
            $(this).addClass($(this).attr('data-mobile-class'));
        }),
        $('html').addClass('_mobile');
},
    setTabletClass = function () {
        $('[data-mobile-class]').each(function () {
            $(this).removeClass($(this).attr('data-mobile-class'));
        }),
            $('[data-tablet-class]').each(function () {
                $(this).addClass($(this).attr('data-tablet-class'));
            }),
            $('html').removeClass('_mobile');
    };
(app_shop.formControl = {
    vars: {
        minLength: function (e) {
            return app_shop.txt.txt_validation1 + e + '.';
        },
        maxLength: function (e) {
            return app_shop.txt.txt_validation2 + e + '.';
        },
        email: app_shop.txt.txt_validation3,
        required: app_shop.txt.txt_validation4,
        bankAccount: app_shop.txt.txt_validation5,
        phone: app_shop.txt.txt_validation6,
    },
    patterns: {
        email:
            /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/,
    },
    timeHandle: '',
    ajaxValidation: function (e, t, i, n, r) {
        var o, s, a, c, l, p;
        if (
            ((s = this),
                (a = e.parent()),
                (c = e.data('validation')),
                (p = e.data('ajaxtype')),
                (o = c + '=' + t),
                e.data('serialize') &&
                e.data('serialize').indexOf('data-') > -1 &&
                (o += '&' + e.attr(e.data('serialize'))),
                '' == t)
        )
            return s.clearValidation(a), s.resetRequiredClass(a), !1;
        'get' == p
            ? $.get(
                i,
                o,
                function (t) {
                    t.errno
                        ? ('bankAccount' == c && (l = s.vars.bankAccount), s.addError(e, l), r && r())
                        : (s.addSuccess(e), n && n());
                },
                'json',
            )
            : $.post(
                i,
                o,
                function (t) {
                    t.errno
                        ? ('bankAccount' == c && (l = s.vars.bankAccount), s.addError(e, l), r && r())
                        : (s.addSuccess(e), n && n());
                },
                'json',
            );
    },
    ajaxValidationWithData: function (e, t, i, n) {
        $.post(
            e,
            t,
            function (e) {
                0 != e.errno ? n && n(e) : i && i(e);
            },
            'json',
        );
    },
    isNumeric: function (e) {
        const t = 'string' == typeof e ? e.replace(/\s/g, '') : e;
        return !isNaN(parseFloat(t)) && isFinite(t);
    },
    validate: function (e, t) {
        var i, n, r, o, s, a, c;
        if (
            ((r = e.parent()),
                (i = e.attr('type')),
                (n = e.val()),
                this.patterns.email,
                (o = e.attr('minlength')),
                (s = e.attr('maxlength')),
                (a = e.data('validate')),
                (c = e.data('validation-url')),
                'checkbox' == e.attr('type'))
        )
            e.is(':checked')
                ? e
                    .parents('.has-feedback, .f-feedback')
                    .removeClass('has-error --error')
                    .addClass('has-success --success')
                : e
                    .parents('.has-feedback, .f-feedback')
                    .removeClass('has-success --success')
                    .addClass('has-error --error');
        else if (c) this.ajaxValidation(e, n, c);
        else {
            if (o) {
                if (n.length < o) return this.addError(e, this.vars.minLength(o)), !1;
                this.addSuccess(e);
            }
            if (s) {
                if (n.length > s) return this.addError(e, this.vars.minLength(s)), !1;
                this.addSuccess(e);
            }
            'email' == i && this.checkMail(e),
                a &&
                'text' == i &&
                (a.indexOf('phone') > -1 || a.indexOf('email') > -1) &&
                (this.isNumeric(n)
                    ? n.length < 9
                        ? this.addError(e, this.vars.phone)
                        : this.addSuccess(e)
                    : a.indexOf('email') > -1
                        ? this.checkMail(e)
                        : a.indexOf('phone') > -1 && this.addError(e, this.vars.phone)),
                n || t || (this.clearValidation(r), this.resetRequiredClass(r));
        }
    },
    checkMail: function (e) {
        e.val().match(this.patterns.email) ? this.addSuccess(e) : this.addError(e, this.vars.email);
    },
    checkForm: function (e, t) {
        var i, n, r;
        return (
            (i = e.find(
                'input.validate:enabled:visible, textarea.validate:enabled:visible, input.--validate:enabled:visible, textarea.--validate:enabled:visible',
            )),
            e.find('input[type="checkbox"]').not('[disabled]').not(':checked'),
            !0,
            !0,
            (r = this),
            !i.length ||
            (i.each(function () {
                r.validate($(this), !0);
            }),
                this.resetRequiredClass(i),
                !(n = e.find('.has-error:visible:first, .--error:visible:first')).length ||
                ($('html, body').animate(
                    {
                        scrollTop:
                            app_shop.vars.view < 3
                                ? n.offset().top - 10 - $('header').outerHeight()
                                : n.offset().top - 10,
                    },
                    300,
                ),
                    !1))
        );
    },
    checkValidateFields: function (e, t) {
        var i = e.find(
            'input.validate:enabled:visible, textarea.validate:enabled:visible, input.--validate:enabled:visible, textarea.--validate:enabled:visible',
        ),
            n = e.find('input#terms_agree[required]').not('[disabled]').not(':checked'),
            r = !0;
        if (
            ((that = this), this.resetRequiredClass(i), i.length) &&
            (i.each(function () {
                ($this = $(this)),
                    (r = !$.trim($this.val())),
                    $this.is('[required]') &&
                    r &&
                    (that.addError($this),
                        $this
                            .parents('.form-group, .f-group')
                            .find(' > div')
                            .append(
                                '<span class="help-block validate_message text-danger">' +
                                app_shop.txt.txt_validation4 +
                                '</span>',
                            ),
                        n.each(function () {
                            that.addError($this);
                        }));
            }),
                that.resetRequiredClass(e),
                e.find('.has-error:visible:first, .--error:visible:first').length)
        )
            return !1;
        return !0;
    },
    addSuccess: function (e) {
        this.clearValidation(e.parent()),
            this.removeErrorInfo(e),
            (e = e.is('[type=checkbox]') ? e.parents('div.checkbox, .--checkbox') : e.parent()).addClass(
                'has-success --success',
            );
    },
    addError: function (e, t) {
        this.clearValidation(e.parent()),
            t && this.addErrorInfo(e, t),
            (e = e.is('[type=checkbox]') ? e.parents('div.checkbox, .--checkbox') : e.parent()).addClass(
                'has-error --error',
            );
    },
    clearValidation: function (e) {
        this.removeErrorInfo(e),
            e.removeClass('has-success has-error has-required --success --error --required');
    },
    resetRequiredClass: function (e) {
        e.find('input.validate[required], input.--validate[required]')
            .parent()
            .not('.has-success,.has-error,.checkbox, .--success, .--error, .--checkbox')
            .addClass('has-required --required');
    },
    addErrorInfo: function (e, t) {
        this.removeErrorInfo(e),
            e.parent().append('<span class="help-block validate_message text-danger">' + t + '</span>');
    },
    removeErrorInfo: function (e) {
        e.children('.validate_message').remove();
    },
}),
    ($.fn.setHeight = function (e) {
        var t = Math.round(e.outerWidth(!0) / e.children().outerWidth(!0)),
            i = e.children().length;
        if (t > 0)
            for (var n = 0; n < i; n += t) {
                var r = e.children().slice(n, n + t);
                r.find(this).length && (r = r.find(this)),
                    r.removeAttr('style'),
                    r.css('min-height', r.maxHeightO());
            }
    });
const HotspotSlider = function (e) {
    return (
        (this.params = e),
        (this.defaults = {
            prevArrow: `<a class="hotspot__arrow --prev" href=""><span>${app_shop.txt.hotspot_prev}</span></a>`,
            nextArrow: `<a class="hotspot__arrow --next" href=""><span>${app_shop.txt.hotspot_next}</span></a>`,
            dotsClass: 'hotspot__dots',
            arrows: !0,
            dots: !0,
            slidesToShow: 6,
            slidesToScroll: 6,
            responsive: [
                { breakpoint: 1200, settings: { slidesToShow: 4, slidesToScroll: 4 } },
                { breakpoint: 979, settings: { slidesToShow: 4, slidesToScroll: 4 } },
                {
                    breakpoint: 757,
                    settings: {
                        slidesToShow: 1,
                        slidesToScroll: 1,
                        swipeToSlide: !0,
                        centerMode: !0,
                        centerPadding: '24vw',
                        dots: !1,
                    },
                },
                {
                    breakpoint: 550,
                    settings: {
                        slidesToShow: 1,
                        slidesToScroll: 1,
                        swipeToSlide: !0,
                        centerMode: !0,
                        centerPadding: '18vw',
                        dots: !1,
                    },
                },
            ],
        }),
        (this.init = () => {
            const { selector: e, options: t, callbackBefore: i, callbackAfter: n } = this.params;
            (this.settings = _objectSpread({}, this.defaults, {}, t)),
                (this.selector = e),
                (this.slider = $(e)),
                'function' == typeof i && i(this.slider),
                this.slider.on('afterChange', function () {
                    app_shop.vars.bLazy && app_shop.vars.bLazy.revalidate();
                }),
                this.slider.slick(this.settings),
                'function' == typeof n && n(this.slider);
        }),
        (this.reset = () => {
            this.slider && this.slider.slick('unslick'), this.init(this.params);
        }),
        (this.destroy = () => {
            this.slider && this.slider.slick('unslick');
        }),
        this.init()
    );
};
app_shop.fn.multiSlideAdaptiveHeight = e => {
    const t = [];
    let i = 0;
    setTimeout(function () {
        $(e).addClass('--adaptive'),
            $('.slick-track .slick-active', e).each(function (e) {
                t[e] = $(this).outerHeight();
            }),
            t.forEach(e => {
                e > i && (i = e);
            }),
            $('.slick-list', e).height(i);
    }, 10);
};
const SelectToDropdown = function (e) {
    return (
        (this.params = e),
        (this.init = () => {
            const {
                selector: e,
                generateDropdownCallback: t,
                clickDropdownCallback: i,
                afterClickDropdownCallback: n,
                disableMobileView: r,
            } = this.params;
            (this.selects = document.querySelectorAll(e)),
                (this.generateDropdownCallback = t),
                (this.clickDropdownCallback = i),
                (this.afterClickDropdownCallback = n),
                (this.disableMobileView = r),
                this.selects.length &&
                (this.generateDropdown(), document.addEventListener('click', this.closeDropdown));
        }),
        (this.generateDropdown = () => {
            this.selects.forEach(e => {
                e.selectedIndex < 0 && (e.selectedIndex = 0);
                const t = `<div class="f-dropdown f-group ${e.getAttribute('class')} ${this.disableMobileView ? '--disable-mobile-view' : ''
                    }">\n        <button type="button" class="f-control f-dropdown-toggle${e.disabled ? ' --disabled' : ''
                    }${e.hasAttribute('readonly') ? ' --readonly' : ''}" data-indexcurrent="${e.options[e.selectedIndex].index
                    }">\n          ${e.hasAttribute('data-label')
                        ? `<strong class="f-dropdown-label">${e.getAttribute('data-label')}</strong>`
                        : ''
                    }\n          <span class="f-dropdown-button">${e.options[e.selectedIndex].text
                    }</span>\n        </button>\n        <ul class="f-dropdown-menu">\n          ${[
                        ...e.querySelectorAll('option'),
                    ]
                        .map(
                            (e, t) =>
                                `\n            <li class="f-dropdown-li${e.hasAttribute('class') ? ` ${e.getAttribute('class')}` : ''
                                }${e.disabled ? ' --disabled' : ''}">\n              <a class="f-dropdown-item${e.selected ? ' --selected' : ''
                                }" href="#${e.getAttribute(
                                    'value',
                                )}" data-index="${t}" data-value="${e.getAttribute('value')}" ${[...e.attributes]
                                    .filter(e => e.name.startsWith('data-'))
                                    .map(e => `${e.name}="${e.value}"`)
                                    .join(' ')}>${e.innerHTML}</a>\n            </li>\n          `,
                        )
                        .join('')}\n        </ul>\n      </div>`,
                    i = document.createElement('div');
                i.innerHTML = t;
                const n = i.firstChild;
                e.insertAdjacentElement('afterend', n),
                    n.insertBefore(e, n.firstChild),
                    Object.values(e.classList).forEach(t => e.classList.replace(t, `${t}-select`)),
                    this.openDropdown(n),
                    this.clickDropdown(n),
                    this.disableMobileView || this.mobileView(n),
                    this.generateDropdownCallback && this.generateDropdownCallback(n);
            });
        }),
        (this.mobileView = e => {
            e.querySelector('select').addEventListener('change', function () {
                const t = this.selectedIndex;
                e.querySelectorAll('.f-dropdown-li').forEach(e => {
                    parseInt(e.querySelector('.f-dropdown-item').getAttribute('data-index'), 10) === t &&
                        e.click();
                });
            });
        }),
        (this.openDropdown = e => {
            e.querySelector('button.f-dropdown-toggle').addEventListener('click', function (e) {
                if ((e.preventDefault(), this.classList.contains('--disabled'))) return !1;
                this.parentNode.classList.toggle('--open');
            });
        }),
        (this.closeDropdown = e => {
            document
                .querySelectorAll('.f-dropdown')
                .forEach(
                    t =>
                        !!t.classList.contains('--open') &&
                        (!e || 'click' !== e.type || t === e || !t.contains(e.target)) &&
                        void t.classList.remove('--open'),
                );
        }),
        (this.clickDropdown = e => {
            if (this.clickDropdownCallback) this.clickDropdownCallback(e);
            else {
                const t = this.afterClickDropdownCallback;
                e.querySelectorAll('.f-dropdown-li').forEach(i => {
                    i.addEventListener('click', function (i) {
                        i.preventDefault();
                        const n = this.querySelector('.f-dropdown-item'),
                            r = e.querySelectorAll('.f-dropdown-item'),
                            o = n.getAttribute('data-index'),
                            s = n.innerHTML,
                            a = e.querySelector('select'),
                            c = e.querySelector('button.f-dropdown-toggle'),
                            l = c.querySelector('.f-dropdown-button'),
                            p = e.querySelector('.f-dropdown-item.--selected');
                        r.forEach(e => e.classList.remove('--selected', '--prev')),
                            p.classList.add('--prev'),
                            n.classList.add('--selected'),
                            (a.selectedIndex = o),
                            (l.innerHTML = s),
                            c.setAttribute('data-indexcurrent', n.getAttribute('data-index')),
                            e.classList.remove('--open'),
                            t && t(this);
                    });
                });
            }
        }),
        (this.destroy = () => {
            this.selects.forEach(e => {
                const t = e.closest('.f-dropdown');
                t &&
                    (t.insertAdjacentElement('afterend', e),
                        t.remove(),
                        e.classList.forEach(t => e.classList.replace(t, t.slice(0, -7))));
            });
        }),
        (this.reInit = () => {
            this.destroy(), this.init();
        }),
        this.init()
    );
};
app_shop.fn.changeLiteral = (e, t, i) => {
    const n = e % 10,
        r = e % 100,
        o = [];
    return (
        !0 !== i && o.push(e),
        1 === e && t[1]
            ? o.push(t[1])
            : (0 === e || (n >= 0 && n <= 1) || (n >= 5 && n <= 9) || (r > 10 && r < 20)) && t[0]
                ? o.push(t[0])
                : (r < 10 || r > 20) && n >= 2 && n <= 4 && t[2] && o.push(t[2]),
        o.join(' ')
    );
};
const HotspotAjaxInit = function (e) {
    const t = this;
    return; //todo;

    return (
        (this.params = e || {}),
        (this.vars = {
            loaded: !1,
            hotspotElements: document.querySelectorAll('[data-ajaxload=true]'),
        }),
        (this.fetchHotspots = async e => {
            try {
                const t = await fetch(e);
                return await t.json();
            } catch (e) {
                return console.error('AJAX fetchHotspots() Error:', e), !1;
            }
        }),
        (this.hotspotInView = new IntersectionObserver(e => {
            e.forEach(e => {
                e.isIntersecting &&
                    (t.vars.loaded || (t.getHotspot(), (t.vars.loaded = !0)),
                        t.hotspotInView.unobserve(e.target));
            });
        })),
        (this.getHotspot = async () => {
            let e = '';
            document.querySelector('.projector_page') &&
                (e =
                    (document.getElementById('projector_product_hidden') &&
                        document.getElementById('projector_product_hidden').value) ||
                    (document.getElementById('projector_form') &&
                        document.getElementById('projector_form').getAttribute('data-product_id')) ||
                    '');
            const i = [];
            document.querySelector('.basketedit_page') &&
                (document.querySelectorAll('.productslist_item').forEach(e => {
                    i.push(e.querySelector('input[name*="product"]').value);
                }),
                    document.querySelectorAll('.basket__block[data-product-id]').forEach(e => {
                        i.push(e.querySelector('input[name*="product"]').value);
                    }));
            const n = [...this.vars.hotspotElements].map(e => e.getAttribute('id')).join(','),
                r = `/ajax/hotspots.php?action=get-hotspots-html&zones-names=${n}&components=${n}&zones-types=${[
                    ...this.vars.hotspotElements,
                ]
                    .map(e => e.getAttribute('data-pagetype'))
                    .join(',')}&product=${e}&products=${i.join(';')}`;
            this.vars.hotspotElements.forEach(e => {
                e.classList.add('load-content');
            });
            const o = await this.fetchHotspots(r);
            o
                ? (this.vars.hotspotElements.forEach(e => {
                    e.classList.remove('load-content');
                }),
                    Object.keys(o).forEach(e => {
                        const i = document.getElementById(e);
                        '' !== o[e] ? i && (i.outerHTML = o[e]) : i && i.parentNode.removeChild(i),
                            app_shop.vars.bLazy && app_shop.vars.bLazy.revalidate(),
                            t.afterOneHotspotCallback && t.afterOneHotspotCallback(i);
                    }),
                    t.afterAllHotspotsCallback && t.afterAllHotspotsCallback())
                : this.vars.hotspotElements.forEach(e => {
                    e.parentNode.removeChild(e);
                });
        }),
        (this.init = () => {
            const { afterOneHotspotCallback: e, afterAllHotspotsCallback: i } = this.params;
            (this.afterOneHotspotCallback = e || !1),
                (this.afterAllHotspotsCallback = i || !1),
                this.vars.hotspotElements.forEach(e => {
                    t.hotspotInView.observe(e);
                });
        }),
        this.init()
    );
};
function FixedElement(e = 'element', t = '--fixed', i = 'spacerClass', n = 'top', r = () => { }) {
    const o = this;
    let s = !1;
    const a = document.querySelector(e),
        c = {
            elH: a.getBoundingClientRect().height,
            elOffset: a.getBoundingClientRect().top + a.ownerDocument.defaultView.pageYOffset,
        };
    (this.revalidate = () => {
        c.elH = a.getBoundingClientRect().height;
        const e = document.querySelector(`.${i}`);
        (c.elOffset = e
            ? e.getBoundingClientRect().top + e.ownerDocument.defaultView.pageYOffset
            : a.getBoundingClientRect().top + a.ownerDocument.defaultView.pageYOffset),
            (s = !0);
    }),
        (this.modifyElement = () => {
            (
                'top' === n
                    ? window.scrollY > c.elOffset
                    : 'bottom' === n
                        ? window.scrollY - c.elH + window.screen.height < c.elOffset
                        : void 0
            )
                ? !a.classList.contains(t) &&
                (a.classList.add(t),
                    (e => {
                        let t = document.createElement('div');
                        (t.className = i), (t.style.paddingTop = `${e}px`), a.after(t);
                    })(c.elH),
                    r(!0))
                : a.classList.contains(t) &&
                (a.classList.remove(t),
                    (() => {
                        const e = document.querySelector(`.${i}`);
                        e && e.parentNode.removeChild(e);
                    })(),
                    r(!1));
        }),
        (this.init = () => {
            if (null === a) return !1;
            window.addEventListener('scroll', () => {
                s = !0;
            }),
                (scroll = setInterval(function () {
                    s && ((s = !1), o.modifyElement());
                }, 30)),
                o.modifyElement();
        }),
        (this.clear = () => {
            clearInterval(scroll);
        });
}
function Bars() {
    (this.calculatePosition = (e, t) => e.reduce((e, i, n) => (n < t ? e + i.offsetHeight : e), 0)),
        (this.setPosition = () => {
            const e = [...document.querySelectorAll('.bars_top .bars__item[data-fixed]')];
            e.forEach((t, i) => {
                t.style.setProperty('--position', this.calculatePosition(e, i));
            });
            const t = [...document.querySelectorAll('.bars_bottom .bars__item[data-fixed]')].reverse();
            t.forEach((e, i) => {
                e.style.setProperty('--position', this.calculatePosition(t, i));
            });
        }),
        (this.fixed = () => {
            document.querySelectorAll('.bars__item[data-fixed]').forEach(e => {
                const t = +getComputedStyle(e).getPropertyValue('--position'),
                    i = e.getBoundingClientRect().top - t,
                    n = e.getBoundingClientRect().bottom + t - window.innerHeight;
                i < 0 || n >= 0
                    ? (e.style.setProperty('min-height', `${e.offsetHeight}px`), e.classList.add('--fixed'))
                    : (e.classList.remove('--fixed'), e.style.removeProperty('min-height'));
            });
        }),
        (this.closeBarClick = e => {
            const { target: t } = e;
            if (t.closest('.bars__close')) {
                e.preventDefault();
                const i = t.closest('.bars__item');
                i.parentNode.removeChild(i), this.saveClosing(i), this.reset();
            }
        }),
        (this.removeClosedBars = () => {
            (JSON.parse(localStorage.getItem('closedBars')) || []).forEach(e => {
                const t = document.getElementById(e);
                t && t.parentNode.removeChild(t);
            }),
                this.checkEmptyBars();
        }),
        (this.checkEmptyBars = () => {
            const e = document.querySelector('.bars_top');
            0 === e?.childNodes.length && e.parentNode.removeChild(e);
            const t = document.querySelector('.bars_bottom');
            0 === t?.childNodes.length && t.parentNode.removeChild(t);
        }),
        (this.saveClosing = e => {
            const { id: t } = e,
                i = JSON.parse(localStorage.getItem('closedBars')) || [];
            i.push(t), localStorage.setItem('closedBars', JSON.stringify(i));
        }),
        (this.setBarsHeight = () => {
            if (document.documentElement.classList.contains('--scroll-down')) return !1;
            const e = document.querySelector('.bars_top')?.offsetHeight;
            return document.documentElement.style.setProperty('--bars-height', `${e}px`), !0;
        }),
        (this.clearAll = () => {
            document.querySelectorAll('.bars__item[data-fixed]').forEach(e => {
                e.classList.remove('--fixed'),
                    e.style.removeProperty('--position'),
                    e.style.removeProperty('min-height');
            });
        }),
        (this.destroy = () => {
            document.removeEventListener('scroll', this.fixed),
                document.removeEventListener('click', this.closeBarClick),
                window.removeEventListener('resize', this.setBarsHeight),
                this.clearAll();
        }),
        (this.reset = () => {
            this.destroy(), this.init();
        }),
        (this.init = () => {
            this.removeClosedBars(),
                document.addEventListener('click', this.closeBarClick),
                app_shop.vars.view < 3 &&
                (this.setBarsHeight(), window.addEventListener('resize', this.setBarsHeight)),
                app_shop.vars.view > 2 &&
                (this.setPosition(), this.fixed(), document.addEventListener('scroll', this.fixed));
        });
}
(Modal = function (e) {
    const t = this;
    if (
        ((this.params = e || {}),
            (this.closeModal = () => {
                const e = document.getElementById('modal');
                this.beforeClose && this.beforeClose(e);
                const t = document.getElementById('modal_placeholder');
                if (t) {
                    const i = e.querySelector('.modal__content > *');
                    t.insertAdjacentElement('afterend', i), t.parentNode.removeChild(t);
                }
                e.parentNode.removeChild(e),
                    document.documentElement.classList.remove('--modal'),
                    document.removeEventListener('click', this.events.eventDelegation, !0),
                    document.removeEventListener('keydown', this.events.escClick),
                    this.afterClose && this.afterClose(e, this);
            }),
            (this.createElement = e => {
                const { element: t, classes: i, id: n, href: r } = e,
                    o = document.createElement(t);
                return (
                    void 0 !== i && (o.className = i),
                    void 0 !== n && (o.id = n),
                    void 0 !== r && (o.href = r),
                    o
                );
            }),
            (this.createModal = () => {
                document.getElementById('modal') && this.closeModal();
                const e = this.createElement({
                    element: 'div',
                    classes: this.classList ? `modal ${this.classList}` : 'modal',
                    id: 'modal',
                }),
                    t = this.createElement({ element: 'div', classes: 'modal__wrapper' }),
                    i = this.createElement({ element: 'div', id: 'modal_placeholder' }),
                    n = this.createElement({ element: 'a', classes: 'modal__close', href: '#modalClose' }),
                    r = this.createElement({ element: 'div', classes: 'modal__content' });
                this.element
                    ? this.element instanceof jQuery && this.element.length
                        ? (document.body.contains(this.element[0]) &&
                            this.element[0].insertAdjacentElement('afterend', i),
                            r.appendChild(this.element[0]))
                        : this.element instanceof jQuery ||
                        (document.body.contains(this.element) &&
                            this.element.insertAdjacentElement('afterend', i),
                            r.appendChild(this.element))
                    : this.html && (r.innerHTML = this.html),
                    t.appendChild(n),
                    t.appendChild(r),
                    e.appendChild(t),
                    document.documentElement.classList.add('--modal'),
                    this.initEvents(),
                    this.beforeShow && this.beforeShow(e, this),
                    document.body.appendChild(e),
                    this.classList && this.classList.includes('--absolute') && window.scrollTo(0, 0),
                    app_shop?.vars?.bLazy?.revalidate(),
                    this.afterShow && this.afterShow(e, this);
            }),
            (this.events = {
                eventDelegation: e => {
                    const i = document.getElementById('modal'),
                        n = !(
                            !document.getElementById('topLayerBackDrop') ||
                            'none' === document.getElementById('topLayerBackDrop').style.display
                        ),
                        r = !(
                            !document.querySelector('.iai_cookie') ||
                            document.querySelector('.iai_cookie').classList.contains('d-none')
                        );
                    for (const t of this.notCloseSelectors) if (e.target.closest(t)) return !1;
                    return (
                        ((i &&
                            !i.querySelector('.modal__wrapper').contains(e.target) &&
                            !n &&
                            !r &&
                            'INPUT' !== document.activeElement.tagName) ||
                            e.target.closest('.modal__close')) &&
                        (e.preventDefault(), t.closeModal()),
                        !1
                    );
                },
                escClick: e => {
                    'Escape' === e.key && t.closeModal();
                },
            }),
            (this.initEvents = () => {
                document.removeEventListener('click', this.events.eventDelegation, !0),
                    document.addEventListener('click', this.events.eventDelegation, !0),
                    document.removeEventListener('keydown', this.events.escClick),
                    document.addEventListener('keydown', this.events.escClick);
            }),
            (this.init = () => {
                const {
                    element: e,
                    html: t,
                    classList: i,
                    beforeShow: n,
                    afterShow: r,
                    beforeClose: o,
                    afterClose: s,
                    notCloseSelectors: a,
                } = this.params;
                (this.element = e || !1),
                    (this.html = t || !1),
                    (this.beforeShow = n || !1),
                    (this.afterShow = r || !1),
                    (this.beforeClose = o || !1),
                    (this.afterClose = s || !1),
                    (this.classList = i || !1),
                    (this.notCloseSelectors = a || []),
                    this.createModal();
            }),
            !this.params.notInit)
    )
        return this.init();
}),
    app_shop.run(
        function () {
            document.querySelectorAll('form:not(.is-validated)').forEach(e => {
                e.addEventListener('submit', e => {
                    e.target.classList.add('--submitting'),
                        e.target.addEventListener('submit', e => (e.preventDefault(), !1));
                });
            });
        },
        'all',
        'form',
    ),
    app_shop.run(
        function () {
            document.querySelectorAll('[data-change-literal-days]').forEach(e => {
                const t = +e.getAttribute('data-change-literal-days');
                e.textContent = app_shop.fn.changeLiteral(t, ['dni', 'dzieĹ', 'dni'], !1);
            });
        },
        'all',
        '[data-change-literal-days]',
        !0,
    ),
    app_shop.run(
        function () {
            document.querySelectorAll('[data-change-literal-days-up-to]').forEach(e => {
                const t = +e.getAttribute('data-change-literal-days-up-to');
                e.textContent = app_shop.fn.changeLiteral(t, ['dni', 'dnia', 'dni'], !1);
            });
        },
        'all',
        '[data-change-literal-days-up-to]',
        !0,
    ),
    app_shop.run(
        function () {
            document.addEventListener('click', e => {
                const { target: t } = e;
                if (t.closest('.l_welcome__element.--logout') || t.closest('.logout_link'))
                    for (let e = 0; e < sessionStorage.length;) {
                        const t = sessionStorage.key(e);
                        t.startsWith('expchck') ? sessionStorage.removeItem(t) : (e += 1);
                    }
            });
        },
        'all',
        '.l_welcome__element.--logout, .logout_link',
    ),
    (RegionForced = function (e) {
        (this.params = e || {}),
            (this.txt = {
                label: 'TwĂłj wybrany kraj dostawy to ',
                labelZipcode: 'TwĂłj wybrany region dostawy to ',
                currency: 'Ceny wyĹwietlane w walucie: ',
                timeAndCosts: 'Czasy i koszty dostawy wyĹwietlane dla kraju: ',
                timeAndCostsZipcode: 'Czasy i koszty dostawy wyĹwietlane dla regionu: ',
                andRegion: ' i regionu: ',
                continue: 'Kontynuuj',
                restoreDefault: 'PrzywrĂłÄ domyĹlny kraj dostawy: ',
                restoreDefaultZipcode: 'PrzywrĂłÄ domyĹlny region dostawy: ',
            }),
            (this.events = {
                unsetRegion: e => (e.preventDefault(), this.unsetTemporaryRegion(), !1),
                unsetZipcode: e => (e.preventDefault(), this.unsetTemporaryZipcode(), !1),
                unsetRegionAndZipcode: e => (e.preventDefault(), this.unsetTemporaryRegionAndZipcode(), !1),
                continue: e => (e.preventDefault(), this.modifyCookie(), this.modal.closeModal(), !1),
            }),
            (this.queries = {
                unsetRegion: () =>
                    JSON.stringify({
                        query:
                            'mutation {\n        unsetTemporaryRegion {\n          status\n          error {\n            code\n            message\n          }\n        }\n      }',
                    }),
                unsetZipcode: () =>
                    JSON.stringify({
                        query:
                            'mutation {\n        unsetTemporaryZipcode {\n          status\n          error {\n            code\n            message\n          }\n        }\n      }',
                    }),
                unsetRegionAndZipcode: () =>
                    JSON.stringify({
                        query:
                            'mutation {\n        unsetTemporaryRegion {\n          status\n          error {\n            code\n            message\n          }\n        }\n        unsetTemporaryZipcode {\n          status\n          error {\n            code\n            message\n          }\n        }\n      }',
                    }),
            }),
            (this.fetchData = async (e = {}) => {
                const { data: t, link: i, linkParameter: n = '' } = e;
                if (!t) return !1;
                try {
                    const e = await fetch(`${i || app_shop.urls.graphql || '/graphql/v1'}${n}`, {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/json', Accept: 'application/json' },
                        body: t,
                    });
                    return await e.json();
                } catch (e) {
                    return console.error('GraphQL fetchData() Error:', e), !1;
                }
            }),
            (this.unsetTemporaryRegion = async () => {
                const e = document.querySelector('.modal');
                e && e.classList.add('--loading');
                const t = await this.fetchData({
                    data: this.queries.unsetRegion(),
                    linkParameter: '?mutation=unsetRegion',
                }),
                    { status: i } = t?.data?.unsetTemporaryRegion;
                e && e.classList.add('--remove'),
                    'success' === i &&
                    ((document.cookie = 'setRegionForced=; path=/; Max-Age=-99999999;'),
                        window.location.reload());
            }),
            (this.unsetTemporaryZipcode = async () => {
                const e = document.querySelector('.modal');
                e && e.classList.add('--loading');
                const t = await this.fetchData({
                    data: this.queries.unsetZipcode(),
                    linkParameter: '?mutation=unsetZipcode',
                }),
                    { status: i } = t?.data?.unsetTemporaryZipcode;
                e && e.classList.add('--remove'),
                    'success' === i &&
                    ((document.cookie = 'setZipcodeForced=; path=/; Max-Age=-99999999;'),
                        window.location.reload());
            }),
            (this.unsetTemporaryRegionAndZipcode = async () => {
                const e = document.querySelector('.modal');
                e && e.classList.add('--loading');
                const t = await this.fetchData({
                    data: this.queries.unsetRegionAndZipcode(),
                    linkParameter: '?mutation=unsetRegionAndZipcode',
                }),
                    { status: i } = t?.data?.unsetTemporaryRegion;
                e && e.classList.add('--remove'),
                    'success' === i &&
                    ((document.cookie = 'setRegionForced=; path=/; Max-Age=-99999999;'),
                        (document.cookie = 'setZipcodeForced=; path=/; Max-Age=-99999999;'),
                        window.location.reload());
            }),
            (this.getCookieByName = e => {
                const t = `; ${document.cookie}`.split(`; ${e}=`);
                return 2 === t.length && t.pop().split(';').shift();
            }),
            (this.create = ({
                currentCountry: e,
                defaultCountry: t,
                currentZipcode: i,
                defaultZipcode: n,
            }) => {
                const r = !e && i,
                    o = !r && i,
                    s = document.createElement('div');
                s.classList.add('region_forced'),
                    (s.innerHTML = `<div class="region_forced__label">\n      <span class="region_forced__label_text">${r ? this.txt.labelZipcode : this.txt.label
                        }</span>\n      <strong class="region_forced__label_value">${r ? i : e
                        }</strong>\n    </div>\n    <div class="region_forced__body">\n      <div class="region_forced__item --currency">\n        <span classs="region_forced__item_text">${this.txt.currency
                        }</span>\n        <strong class="region_forced__item_value">${app_shop?.vars?.currency?.id
                        }</strong>\n      </div>\n      <div class="region_forced__item --delivery">\n        <span classs="region_forced__item_text">${r ? this.txt.timeAndCostsZipcode : this.txt.timeAndCosts
                        }</span>\n        <strong class="region_forced__item_value">${r ? i : e
                        }</strong>\n        ${o
                            ? `<span class="region_forced__and_region">${this.txt.andRegion}<strong>${i}</strong></span>`
                            : ''
                        }\n      </div>\n    </div>\n    <div class="region_forced__buttons">\n      <button class="region_forced__continue btn --solid --large" type="button">${this.txt.continue
                        }</button>\n      <a href="#unsetTemporaryRegion" class="region_forced__unset">${r ? this.txt.restoreDefaultZipcode : this.txt.restoreDefault
                        }<strong>${r ? n : t}</strong></a>\n    </div>`),
                    (this.modal = new Modal({ element: s, classList: '--region-forced' }));
                let a = 'region';
                r && (a = 'zipcode'), o && (a = 'regionAndZipcode'), this.initEvents({ type: a });
            }),
            (this.modifyCookie = () => {
                const e = this.getCookieByName('setRegionForced'),
                    t = this.getCookieByName('setZipcodeForced'),
                    i = JSON.parse(e),
                    n = JSON.parse(t);
                i &&
                    ((i.showModal = !1), (document.cookie = `setRegionForced=${JSON.stringify(i)}; path=/;`)),
                    n &&
                    ((n.showModal = !1),
                        (document.cookie = `setZipcodeForced=${JSON.stringify(n)}; path=/;`));
            }),
            (this.initEvents = ({ type: e }) => {
                const t = document.querySelector('.region_forced__unset');
                t &&
                    ('region' === e && t.addEventListener('click', this.events.unsetRegion),
                        'zipcode' === e && t.addEventListener('click', this.events.unsetZipcode),
                        'regionAndZipcode' === e &&
                        t.addEventListener('click', this.events.unsetRegionAndZipcode));
                const i = document.querySelector('.region_forced__continue');
                i && i.addEventListener('click', this.events.continue);
            }),
            (this.init = () => {
                const e = this.getCookieByName('setRegionForced'),
                    t = this.getCookieByName('setZipcodeForced');
                if (!e && !t) return;
                const i = JSON.parse(e),
                    n = JSON.parse(t),
                    { currentCountry: r, defaultCountry: o, showModal: s } = i || {},
                    { currentZipcode: a, defaultZipcode: c, showModal: l } = n || {};
                (s || l) &&
                    this.create({
                        currentCountry: r,
                        defaultCountry: o,
                        currentZipcode: a,
                        defaultZipcode: c,
                    });
            });
    }),
    (app_shop.fn.regionForced = new RegionForced()),
    app_shop.run(
        function () {
            app_shop.fn.regionForced.init();
        },
        'all',
        '#container:not(.place-order_page):not(.prepaid_page)',
    ),
    app_shop.txt || (app_shop.txt = {}),
    app_shop.txt.errorCode || (app_shop.txt.errorCode = {}),
    (app_shop.txt.errorCode.birth_date = 'Wpisz poprawnÄ datÄ urodzenia w formacie RRRR-MM-DD'),
    (app_shop.txt.errorCode.illegal_characters_client_city =
        'Jeden z uĹźytych znakĂłw jest niedozwolony.'),
    (app_shop.txt.errorCode.illegal_characters_client_firm =
        'Jeden z uĹźytych znakĂłw jest niedozwolony.'),
    (app_shop.txt.errorCode.illegal_characters_client_firstname =
        'Jeden z uĹźytych znakĂłw jest niedozwolony.'),
    (app_shop.txt.errorCode.illegal_characters_client_lastname =
        'Jeden z uĹźytych znakĂłw jest niedozwolony.'),
    (app_shop.txt.errorCode.illegal_characters_client_nip =
        'Jeden z uĹźytych znakĂłw jest niedozwolony.'),
    (app_shop.txt.errorCode.illegal_characters_client_phone =
        'Jeden z uĹźytych znakĂłw jest niedozwolony.'),
    (app_shop.txt.errorCode.illegal_characters_client_phone2 =
        'Jeden z uĹźytych znakĂłw jest niedozwolony.'),
    (app_shop.txt.errorCode.illegal_characters_client_street =
        'Jeden z uĹźytych znakĂłw jest niedozwolony.'),
    (app_shop.txt.errorCode.illegal_characters_delivery_additional =
        'Jeden z uĹźytych znakĂłw jest niedozwolony.'),
    (app_shop.txt.errorCode.illegal_characters_delivery_city =
        'Jeden z uĹźytych znakĂłw jest niedozwolony.'),
    (app_shop.txt.errorCode.illegal_characters_delivery_firstname =
        'Jeden z uĹźytych znakĂłw jest niedozwolony.'),
    (app_shop.txt.errorCode.illegal_characters_delivery_lastname =
        'Jeden z uĹźytych znakĂłw jest niedozwolony.'),
    (app_shop.txt.errorCode.illegal_characters_delivery_phone =
        'Jeden z uĹźytych znakĂłw jest niedozwolony.'),
    (app_shop.txt.errorCode.illegal_characters_delivery_street =
        'Jeden z uĹźytych znakĂłw jest niedozwolony.'),
    (app_shop.txt.errorCode.incorect_delivery_region = 'Wybierz kraj odbiorcy przesyĹki.'),
    (app_shop.txt.errorCode.incorect_delivery_zipcode = 'Wpisz kod pocztowy odbiorcy przesyĹki.'),
    (app_shop.txt.errorCode.incorect_email =
        'BĹÄdnie wpisany e-mail. Wpisz peĹny adres e-mail, np. jan@kowalski.com'),
    (app_shop.txt.errorCode.incorect_invoice_phone = 'Wpisz telefon klienta.'),
    (app_shop.txt.errorCode.incorect_invoice_zipcode = 'Wpisz kod pocztowy klienta.'),
    (app_shop.txt.errorCode.incorect_login =
        'BĹÄdnie wpisany login. Login musi mieÄ minimum 3, a maksimum 40 znakĂłw. MoĹźesz uĹźyÄ liter i cyfr oraz symboli @ . - _.'),
    (app_shop.txt.errorCode.incorect_nip = 'BĹÄdnie wpisany NIP.'),
    (app_shop.txt.errorCode.incorect_phone = 'Wpisz swĂłj telefon.'),
    (app_shop.txt.errorCode.incorect_shops = 'Wybierz sklep z listy.'),
    (app_shop.txt.errorCode.incorect_zipcode = 'BĹÄdnie wpisany kod pocztowy.'),
    (app_shop.txt.errorCode.incorrect_region = 'BĹÄdnie wybrany region.'),
    (app_shop.txt.errorCode.invalid_format =
        'NieprawidĹowy format. Pole musi zawieraÄ przynajmniej jednÄ literÄ.'),
    (app_shop.txt.errorCode.login_equals_password =
        'HasĹo jest takie samo jak login. Wpisz inne hasĹo.'),
    (app_shop.txt.errorCode.login_taken = 'Podany login jest juĹź zajÄty.'),
    (app_shop.txt.errorCode.login_taken_login_propose =
        'Podany login jest juĹź zajÄty.<br/><br/>Proponowany login: '),
    (app_shop.txt.errorCode.no_city = 'Wpisz w to pole nazwÄ miasta.'),
    (app_shop.txt.errorCode.no_delivery_city = 'Wpisz miejscowoĹÄ odbiorcy przesyĹki.'),
    (app_shop.txt.errorCode.no_delivery_firstname = 'Wpisz imiÄ odbiorcy przesyĹki.'),
    (app_shop.txt.errorCode.no_delivery_lastname = 'Wpisz nazwisko odbiorcy przesyĹki.'),
    (app_shop.txt.errorCode.no_delivery_street = 'Wpisz ulicÄ i numer domu odbiorcy przesyĹki.'),
    (app_shop.txt.errorCode.no_firmname = 'BĹÄdnie wpisana nazwa firmy.'),
    (app_shop.txt.errorCode.no_firstname = 'Wpisz w to pole swoje imiÄ.'),
    (app_shop.txt.errorCode.no_invoice_city = 'Wpisz miejscowoĹÄ klienta.'),
    (app_shop.txt.errorCode.no_invoice_firmname = 'Wpisz nazwÄ firmy klienta.'),
    (app_shop.txt.errorCode.no_invoice_firstname = 'Wpisz imiÄ klienta.'),
    (app_shop.txt.errorCode.no_invoice_lastname = 'Wpisz nazwisko klienta.'),
    (app_shop.txt.errorCode.no_invoice_street = 'Wpisz ulicÄ i numer domu klienta.'),
    (app_shop.txt.errorCode.no_invoice_street_number = 'Wpisz ulicÄ i numer domu klienta.'),
    (app_shop.txt.errorCode.no_login = 'Wpisz w to pole swĂłj login.'),
    (app_shop.txt.errorCode.no_name = 'Wpisz w to pole swoje nazwisko.'),
    (app_shop.txt.errorCode.no_password = 'Wpisz w to pole swoje hasĹo.'),
    (app_shop.txt.errorCode.no_street = 'Wpisz nazwÄ ulicy lub miejscowoĹci.'),
    (app_shop.txt.errorCode.no_street_number = 'Podaj nr domu.'),
    (app_shop.txt.errorCode.no_street_number_uk = 'Brakuje numeru domu.'),
    (app_shop.txt.errorCode.not_equal_passwords =
        'Wpisane hasĹa nie sÄ takie same. Wpisz ponownie hasĹo i potwierdzenie.'),
    (app_shop.txt.errorCode.password_to_long = 'Za dĹugie hasĹo. Wpisz krĂłtsze hasĹo (maksimum.'),
    (app_shop.txt.errorCode.password_to_short =
        'Zbyt krĂłtkie hasĹo. Wpisz dĹuĹźsze hasĹo (minimum.'),
    (app_shop.txt.errorCode.used_login = 'Podany login jest juĹź zajÄty.'),
    (app_shop.txt.errorCode.incorrect_iban = 'Format numeru konta bankowego jest niepoprawny'),
    app_shop.txt.formValidation || (app_shop.txt.formValidation = {}),
    (app_shop.txt.formValidation.mandatoryField = 'ProszÄ wypeĹniÄ to pole.'),
    (app_shop.txt.formValidation.zipcodeFormat =
        'Poprawne formaty kodu pocztowego dla wybranego kraju to [X - cyfra; Y - litera]:'),
    (app_shop.txt.formValidation.characters = 'znakĂłw).'),
    (app_shop.txt.formValidation.minimalCharacters = 'Minimalna liczba znakĂłw dla tego pola to '),
    (app_shop.txt.formValidation.maximumCharacters = 'Maksymalna liczba znakĂłw dla tego pola to '),
    app_shop.run(
        function () {
            (app_shop.fn.bars = new Bars()), app_shop.fn.bars.init();
        },
        'all',
        'html:not(.order_process)',
    ),
    app_shop.run(
        function () {
            app_shop.fn.bars.reset();
        },
        [1, 2, 3, 4],
        'html:not(.order_process)',
    ),
    (app_shop.txt.txt_118559_6 = ''),
    !app_shop.txt.txt_118559_6 && (app_shop.txt.txt_118559_6 = 1),
    app_shop.run(
        () => {
            console.log('test'),
                null === $.cookie('rabateCode_clicked') && Boolean(document.querySelector('#rabateCode'))
                    ? $('html').addClass('--rabateCode')
                    : ($('#rabateCode').remove(), $('html').removeClass('--rabateCode')),
                $('#rabateCode .rabateCode__close').on('click', function (e) {
                    return (
                        e.preventDefault(),
                        $.cookie('rabateCode_clicked', !0, { expires: parseInt(app_shop.txt.txt_118559_6) }),
                        $('#rabateCode').remove(),
                        $('html').removeClass('--rabateCode'),
                        !1
                    );
                });
        },
        'all',
        '.--rabateCode',
    ),
    (app_shop.txt.txt_118559_6 = ''),
    !app_shop.txt.txt_118559_6 && (app_shop.txt.txt_118559_6 = 1),
    app_shop.run(
        () => {
            null === $.cookie('freeeshipping_clicked') && Boolean(document.querySelector('#freeShipping'))
                ? $('html').addClass('--freeShipping')
                : ($('#freeShipping').remove(), $('html').removeClass('--freeShipping')),
                $('#freeShipping .freeShipping__close').on('click', function (e) {
                    return (
                        e.preventDefault(),
                        $.cookie('freeeshipping_clicked', !0, { expires: parseInt(app_shop.txt.txt_118559_6) }),
                        $('#freeShipping').remove(),
                        $('html').removeClass('--freeShipping'),
                        !1
                    );
                });
        },
        'all',
        '.--freeShipping',
    ),
    app_shop.run(
        function () {
            app_shop.fn.searchResults = new SearchResults({
                resultsLimit: 6,
                inputLengthToStartSearching: 2,
            });
        },
        'all',
        '#menu_search',
    );
const searchTxt = {
    categories: 'Kategorie',
    cms: 'Informacje',
    beforeProducer: 'Producent: ',
    beforeSeries: 'Seria: ',
    separator: ' / ',
    buttonAllText: 'PokaĹź wszystkie',
    telPrice: 'Cena na telefon',
};
(SearchResults = function (e) {
    const t = this;
    return (
        (this.params = e || {}),
        (this.vars = { typingTimer: '', doneTypingInterval: 500, searchResultQuery: '/graphql/v1/' }),
        (this.fetchData = async () => {
            const e = this.searchInput.value;
            if (e.length < this.inputLengthToStartSearching) return !1;
            if (sessionStorage.getItem(`search_${e}`))
                return JSON.parse(sessionStorage.getItem(`search_${e}`));
            const t = JSON.stringify({
                query: `query {\n        productsTextSearch(searchInput: {\n            text: "${e}",\n            limit: ${this.resultsLimit}\n          }) {\n            products {\n              name, link, iconSmall, iconSmallSecond,\n              price {\n                  price {\n                      gross {\n                        value\n                        formatted\n                      }\n                      net {\n                        value\n                        formatted\n                      }\n                  }\n              }\n            }\n            series {\n                name, link\n            }\n            producers {\n                name, link\n            }\n            menuNodes {\n                name, link\n            }\n            cms {\n                name, link\n            }\n            searchQueries {\n                name, link\n            }\n          }\n        }`,
            });
            try {
                const i = await fetch(this.vars.searchResultQuery, {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json', Accept: 'application/json' },
                    body: t,
                }),
                    n = (await i.json()).data.productsTextSearch;
                return sessionStorage.setItem(`search_${e}`, JSON.stringify(n)), n;
            } catch (e) {
                return console.error('AJAX fetchDataSearchResults() Error:', e), !1;
            }
        }),
        (this.openResults = () => {
            this.searchInput.closest('form').classList.add('--open'),
                (this.resultsWrapper.scrollTop = 0),
                document.documentElement.classList.add('--results-open'),
                document.querySelector('#container.main_page') &&
                document.documentElement.classList.add('--results-main-open');
        }),
        (this.closeResults = () => {
            this.searchInput.closest('form').classList.remove('--open'),
                document.documentElement.classList.remove('--results-open'),
                document.querySelector('#container.main_page') &&
                document.documentElement.classList.remove('--results-main-open');
        }),
        (this.buildResult = async () => {
            this.searchInput.closest('form').classList.add('--loading');
            const e = await this.fetchData();
            if (
                (this.searchInput.closest('form').classList.remove('--loading'),
                    (this.resultsWrapper.innerHTML = ''),
                    e)
            ) {
                if (!Object.values(e).filter(e => (e ? e.length : '')).length)
                    return this.closeResults(), !1;
                if ((this.openResults(), e.searchQueries && e.searchQueries.length)) {
                    const t = this.searchInput.value,
                        i = new RegExp(t, 'i');
                    this.resultsWrapper.innerHTML += `\n          <div class="search_result__block --queries">\n            ${e.searchQueries
                        .map(
                            e =>
                                `<a class="search_result__item --query" href="${e.link}">${e.name.replace(
                                    i,
                                    '<b>$&</b>',
                                )}</a>`,
                        )
                        .join('')}\n          </div>\n        `;
                }
                Object.keys(e)
                    .filter(e => 'searchQueries' !== e)
                    .some(t => (e[t] ? e[t].length : '')) &&
                    ((this.resultsWrapper.innerHTML += '<div class="search_result__block --others"></div>'),
                        e.products &&
                        e.products.length &&
                        (this.resultsWrapper.querySelector(
                            '.search_result__block.--others',
                        ).innerHTML += `\n            <div class="search_result__sub --products">\n              ${e.products
                            .map(
                                e =>
                                    `\n                <a class="search_result__item --product" href="${e.link
                                    }">\n                  <span class="search_result__icon">${void 0 !== e.iconSmallSecond
                                        ? `<picture>\n                      <source type="image/webp" srcset="${e.iconSmall}"/>\n                      <img src="${e.iconSmallSecond}" alt="${e.name}">\n                    </picture>`
                                        : `<img src="${e.iconSmall}" alt="${e.name}" />`
                                    }</span>\n                  <span class="search_result__name_wrapper">\n                    <span class="search_result__name">${e.name
                                    }</span>\n                    <span class="search_result__price">${t.netPrice
                                        ? 0 !== e.price.price.net.value
                                            ? e.price.price.net.formatted
                                            : searchTxt.telPrice
                                        : 0 !== e.price.price.gross.value
                                            ? e.price.price.gross.formatted
                                            : searchTxt.telPrice
                                    }</span>\n                  </span>\n                </a>\n              `,
                            )
                            .join(
                                '',
                            )}\n              <button type="submit" class="search_result__item --button-all${t.buttonAllClass
                            }">${searchTxt.buttonAllText}</button>\n            </div>\n          `),
                        ((e.producers && e.producers.length) ||
                            (e.series && e.series.length) ||
                            (e.menuNodes && e.menuNodes.length)) &&
                        (this.resultsWrapper.querySelector(
                            '.search_result__block.--others',
                        ).innerHTML += `\n            <div class="search_result__sub --categories">\n              <strong class="search_result__label">${searchTxt.categories
                        }</strong>\n              <div class="search_result__items">\n                ${e.producers
                            ? e.producers
                                .map(
                                    e =>
                                        `\n                  <a class="search_result__item --producer" href="${e.link}">\n                    <span class="search_result__name_label">${searchTxt.beforeProducer}</span><span class="search_result__name">${e.name}</span>\n                  </a>\n                `,
                                )
                                .join('')
                            : ''
                            }\n\n                ${e.series
                                ? e.series
                                    .map(
                                        e =>
                                            `\n                  <a class="search_result__item --series" href="${e.link}">\n                    <span class="search_result__name_label">${searchTxt.beforeSeries}</span><span class="search_result__name">${e.name}</span>\n                  </a>\n                `,
                                    )
                                    .join('')
                                : ''
                            }\n\n                ${e.menuNodes
                                ? e.menuNodes
                                    .map(
                                        e =>
                                            `\n                  <a class="search_result__item --menu" href="${e.link
                                            }">\n                    <span class="search_result__name">${e.bc ? e.bc.item.map(e => e.title).join(searchTxt.separator) : e.name
                                            }</span>\n                  </a>\n                `,
                                    )
                                    .join('')
                                : ''
                            }\n              </div>\n            </div>\n          `),
                        e.cms &&
                        e.cms.length &&
                        (this.resultsWrapper.querySelector(
                            '.search_result__block.--others',
                        ).innerHTML += `\n            <div class="search_result__sub --cms">\n              <strong class="search_result__label">${searchTxt.cms
                        }</strong>\n              <div class="search_result__items">\n                ${e.cms
                            .map(
                                e =>
                                    `\n                  <a class="search_result__item --cms" href="${e.link}">\n                    <span class="search_result__name">${e.name}</span>\n                  </a>\n                `,
                            )
                            .join('')}\n              </div>\n            </div>\n          `));
            } else this.closeResults();
            return this.afterBuildResult && this.afterBuildResult(e), !0;
        }),
        (this.updateSearchInput = () => {
            const e = t.resultsWrapper.querySelector('.search_result__item.--active .search_result__name')
                ? t.resultsWrapper.querySelector('.search_result__item.--active .search_result__name')
                    .textContent
                : t.resultsWrapper.querySelector('.search_result__item.--active').textContent;
            t.searchInput.value = e;
        }),
        (this.updateFocusElement = e => {
            this.resultsWrapper
                .querySelectorAll('.search_result__item')
                .forEach(e => e.classList.remove('--active')),
                'null' != typeof e && e.classList.add('--active'),
                'null' != typeof e && e.focus(),
                this.updateSearchInput();
        }),
        (this.initEvents = () => {
            const e = document.getElementById('menu_search');
            e &&
                e.addEventListener('submit', function () {
                    const e = t.searchInput.getAttribute('data-value');
                    e && (t.searchInput.value = e);
                }),
                this.searchInput.addEventListener('keyup', function (e) {
                    const i = e.which || e.keyCode || 0;
                    37 !== i &&
                        38 !== i &&
                        39 !== i &&
                        40 !== i &&
                        (t.searchInput.setAttribute('data-value', this.value),
                            clearTimeout(t.vars.typingTimer),
                            (t.vars.typingTimer = setTimeout(t.buildResult, t.vars.doneTypingInterval)),
                            document.querySelector(
                                'html._mobile:not(.sidebar_open):not(.--search-open) .main_page',
                            ) && window.scrollTo(0, 0));
                }),
                this.searchInput.addEventListener('keydown', function (e) {
                    const i = e.which || e.keyCode || 0;
                    return (
                        37 === i ||
                        38 === i ||
                        39 === i ||
                        40 === i ||
                        (t.searchInput.setAttribute('data-value', this.value),
                            clearTimeout(t.vars.typingTimer),
                            t.searchInput.closest('form').classList.add('--focus'),
                            !document.querySelector('.--search-open') || 13 !== i) ||
                        (e.preventDefault(), this.closest('form').submit(), !1)
                    );
                }),
                this.searchInput.addEventListener('focus', function () {
                    this.closest('form').classList.add('--focus');
                }),
                document.addEventListener('scroll', function (e) {
                    window.scrollY > 0
                        ? document.documentElement.classList.add('--scroll-down')
                        : $('html').hasClass('sidebar_open') ||
                        $('html').hasClass('filters_open') ||
                        document.documentElement.classList.remove('--scroll-down');
                }),
                document
                    .querySelector('.search_result, .search_result__block')
                    .addEventListener('scroll', function () {
                        app_shop.vars.view < 3 && document.activeElement.blur();
                    }),
                document.addEventListener('keydown', function (e) {
                    if (t.searchInput.closest('form.--open.--focus')) {
                        const i = e.which || e.keyCode || 0;
                        if (37 === i || 38 === i || 39 === i || 40 === i) {
                            e.preventDefault();
                            const n = [
                                ...t.resultsWrapper.querySelectorAll('.search_result__item'),
                                t.resultsWrapper.querySelector('.search_result__button_all'),
                            ],
                                r = t.resultsWrapper.querySelector('.search_result__item.--query'),
                                o = t.resultsWrapper.querySelector(
                                    '.search_result__block.--others .search_result__item',
                                );
                            switch (i) {
                                case 40: {
                                    const e = n.indexOf(
                                        t.resultsWrapper.querySelector('.search_result__item.--active'),
                                    );
                                    e > -1 && n[e + 1] ? t.updateFocusElement(n[e + 1]) : t.updateFocusElement(n[0]);
                                    break;
                                }
                                case 38: {
                                    const e = n.indexOf(
                                        t.resultsWrapper.querySelector('.search_result__item.--active'),
                                    );
                                    e > -1 && n[e - 1]
                                        ? t.updateFocusElement(n[e - 1])
                                        : t.updateFocusElement(n[n.length - 1]),
                                        t.updateSearchInput();
                                    break;
                                }
                                case 37:
                                    1 !== app_shop.vars.view && r && o && t.updateFocusElement(r);
                                    break;
                                case 39:
                                    1 !== app_shop.vars.view && r && o && t.updateFocusElement(o);
                                    break;
                                default:
                                    return !0;
                            }
                        } else 13 !== i && t.searchInput.focus();
                        return !1;
                    }
                }),
                document.addEventListener('click', function (e) {
                    return (
                        e.target.closest('.menu_search__mobile') &&
                        (e.preventDefault(),
                            document.documentElement.classList.add('--search-open'),
                            $('.main_slider').slick('slickSetOption', 'autoplay', !1, !0),
                            t.searchInput.focus()),
                        e.target.closest('.--search-open .menu_search__submit') &&
                        (e.preventDefault(),
                            document.documentElement.classList.remove('--search-open', '--results-main-open'),
                            $('.main_slider').slick('slickSetOption', 'autoplay', !0, !0)),
                        e.target.closest('header .navbar-toggler') &&
                        document.documentElement.classList.remove('--results-main-open'),
                        t.searchInput.closest('form').classList.contains('--focus') &&
                        !t.searchInput.closest('form').contains(e.target) &&
                        t.searchInput.closest('form').classList.remove('--focus'),
                        !1
                    );
                });
        }),
        (this.init = () => {
            const {
                searchInput: e,
                resultsWrapper: t,
                resultsLimit: i,
                inputLengthToStartSearching: n,
                afterBuildResult: r,
                buttonAllClass: o,
            } = this.params;
            (this.searchInput = e
                ? document.querySelector(e)
                : document.querySelector('.menu_search__input')),
                (this.resultsWrapper = t
                    ? document.querySelector(t)
                    : document.querySelector('.search_result')),
                (this.resultsLimit = i || ''),
                (this.inputLengthToStartSearching = n || 4),
                (this.netPrice = 'net' === app_shop.vars.priceType),
                (this.afterBuildResult = r || !1),
                (this.buttonAllClass = o || ' btn --outline'),
                this.initEvents();
        }),
        this.init()
    );
}),
    app_shop.run(
        () => {
            app_shop.fn.selectPaging = new SelectToDropdown({
                selector: '#menu_settings  select.form-control:not(.f-dropdown)',
                generateDropdownCallback: e => {
                    e.classList.remove('form-control');
                },
            });
            const e = document.querySelector('#menu_settings form');
            if (!e) return;
            const t = document.querySelector('#menu_settings .open_trigger');
            t &&
                t.addEventListener('click', () => {
                    e.classList.toggle('active');
                });
        },
        'all',
        '#menu_settings',
    );
const DefaultShoppingList = function () {
    return (
        (this.vars = { firstListName: 'Lista zakupowa' }),
        (this.queries = {
            addList: () =>
                JSON.stringify({
                    query: `mutation {\n        shoppingListCreate(ShoppingListSettingsInput: {\n          name: "${this.vars.firstListName}",\n        }) {\n          status\n          id\n        }\n      }`,
                }),
        }),
        (this.fetchData = async e => {
            try {
                const t = await fetch('/graphql/v1/?query=createShoppingList', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json', Accept: 'application/json' },
                    body: e,
                });
                await app_shop.graphql.trackingEvents(t);
                return await t.json();
            } catch (e) {
                return console.error('AJAX fetchDataShoppingList() Error:', e), !1;
            }
        }),
        (this.createList = async () => {
            await this.fetchData(this.queries.addList());
        }),
        (this.initEvents = () => {
            document.addEventListener('click', async e => {
                const { target: t } = e;
                t.closest(
                    '.slt_link.--empty, .slt_lists__nav_link.--empty, .slm_lists__nav_link.--empty',
                ) &&
                    (e.preventDefault(),
                        await this.createList(),
                        (window.location.href = t.closest('[href]')?.href));
            });
        }),
        this.initEvents()
    );
};
app_shop.run(
    function () {
        app_shop.fn.defaultShoppingList = new DefaultShoppingList();
    },
    'all',
    '.slt_link.--empty, .slt_lists__nav_link.--empty, .slm_lists__nav_link.--empty',
),
    (app_shop.fn.customBasket = e =>
        `\n  <div class="topBasket__row">\n    <a class="topBasket__item --photo" href="${e.link
        }">\n      ${void 0 !== e.icon_second
            ? `<picture>\n          <source type="image/webp" srcset="${e.icon}"/>\n          <img src="${e.icon_second}" alt="${e.name}">\n        </picture>`
            : `<img src="${e.icon}" alt="${e.name}">`
        }\n    </a>\n    <a class="topBasket__item --name" href="${e.link
        }">\n      <span class="topBasket__name">${e.name}</span>\n      ${'uniw' !== e.size ? `<span class="topBasket__size">${e.size_name}</span>` : ''
        }\n      ${e.product_version_name
            ? `<span class="topBasket__version">${e.product_version_name}</span>`
            : ''
        }\n    </a>\n    <span class="topBasket__item --sum">\n      <span class="value">${e.count
        }</span>\n      <span class="unit">${e.worth_unit
        }</span>\n    </span>\n    <span class="topBasket__item --prices">${'net' === app_shop.vars.priceType
            ? e.prices.worth_net_formatted
            : e.prices.worth_gros_formatted
        }</span>\n  </div>\n`),
    (app_shop.fn.menu_basket_cache = function () {
        const e = document.getElementById('menu_basket');
        if (!e) return;
        iaiGet?.data?.Basket && iaiGet.reInit
            ? iaiGet.reInit(['Basket'])
            : iaiGet.basket(t => {
                e.classList.remove('--skeleton');
                const { Basket: { response: { basket: i } = {} } = {} } = t || {};
                if (!i) return;
                app_shop.vars.basket = i;
                const { products: n = [], user: r = {} } = i;
                (app_shop.vars.user = r),
                    e.classList.toggle('--hide', !n.length || n.length > 22),
                    e.classList.toggle('--list', n.length > 10);
                const o = e.querySelector('.topBasket__price');
                if (o) {
                    const { worth_net_formatted: e, worth_formatted: t } = i;
                    o.innerHTML = 'net' === app_shop.vars.priceType ? e : t;
                }
                const s = e.querySelector('.badge');
                if (s) {
                    const { productsCounter: e = 0 } = i;
                    s.innerHTML = e > 0 ? e : '';
                }
                const a = e.querySelector('#shipppingCost');
                if (a) {
                    const { shippingCost_net_formatted: e, shippingCost_formatted: t } = i;
                    a.innerHTML = 'net' === app_shop.vars.priceType ? e : t;
                }
                const c = document.getElementById('freeShipping');
                if (c) {
                    const { toShippingFree: e } = i;
                    c.classList.toggle('--active', 0 == +e);
                }
                if (!n.length)
                    return void (
                        'function' == typeof app_shop.fn.afterBasketCallback &&
                        app_shop.fn.afterBasketCallback(i)
                    );
                let l = '';
                n.forEach(e => {
                    l += app_shop.fn.customBasket(e);
                });
                const p = e.querySelector('.topBasket__block.--products');
                p && (p.innerHTML = l);
                const d = n.find(e => '' === e.name || '0' !== e.subscription_period);
                e.classList.toggle('--oneclick-hide', !!d);
                document.querySelectorAll('.topBasket__details').forEach(e => {
                    e.removeAttribute('style');
                }),
                    'function' == typeof app_shop.fn.afterBasketCallback &&
                    app_shop.fn.afterBasketCallback(i);
            });
    });
const menu_basket_cache = app_shop.fn.menu_basket_cache;
app_shop.run(
    () => {
        app_shop.fn.menu_basket_cache();
    },
    'all',
    '#menu_basket',
);
var submenuWidth = '200',
    dlmenu_showmore = '1',
    dlmenu_shownumber = '10',
    dlmenu_columnHeight = '320',
    dlmenu_columnConcat = '1',
    dlmenu_padding = '30',
    dlmenu_columns = '5',
    dlmenu_wide = 'true';
function simple_tooltip(e, t, i) {
    var n = '',
        r = '';
    $(document).on('mouseover', e, function () {
        $(this).next().is('.tooltipContent')
            ? (n = $(this).next().html())
            : $(this).prop('title') && ((n = $(this).prop('title')), $(this).removeAttr('title')),
            $('#' + t).remove(),
            clearTimeout(r),
            $('body').append("<div style='display:none;' class='" + t + "' id='" + t + "'><p></p></div>"),
            $('#' + t).hover(
                function () {
                    clearTimeout(r);
                },
                function () {
                    $('#' + t).remove();
                },
            ),
            '' != n &&
            ' ' != n &&
            'undefined' != n &&
            ($('#' + t)
                .find('p')
                .html(n),
                $('#' + t).fadeIn(400));
    }),
        $(document).on('mousemove', e, function (e) {
            var n,
                r,
                o = $(window).scrollTop(),
                s = $(window).width(),
                a = 15;
            i || !1
                ? ((n =
                    e.pageX - $('#' + t).outerWidth(!0) - a <= 0
                        ? e.pageX + a
                        : e.pageX - a - $('#' + t).outerWidth(!0)),
                    (r =
                        o + 30 >= e.pageY - $('#' + t).height()
                            ? o + a
                            : e.pageY - $('#' + t).outerHeight(!0) - a))
                : ((n = s - 30 >= $('#' + t).width() + e.pageX ? e.pageX + a : s - $('#' + t).width() - a),
                    (r =
                        o + 30 >= e.pageY - $('#' + t).height() ? o + a : e.pageY - $('#' + t).height() - a)),
                $('#' + t).css({ left: n, top: r });
        }),
        $(document).on('mouseout', e, function () {
            $(this).next().is('.tooltipContent') || $(this).prop('title', n),
                (r = setTimeout(function () {
                    $('#' + t).remove();
                }, 500));
        }),
        $(document).bind('touchstart', function (i) {
            0 === $(i.target).closest('#' + t).length &&
                0 === $(i.target).closest(e).length &&
                $('#' + t).length &&
                $('#' + t).remove();
        });
}
function calculate_instalments(params) {
    let {
        minPrice: minPrice,
        maxPrice: maxPrice,
        totalPrice: totalPrice,
        link: link,
        instalmentName: instalmentName,
        priceType: priceType,
    } = params;
    'object' != typeof params &&
        null !== params &&
        ([minPrice, maxPrice, totalPrice, , link, , instalmentName, , priceType] = arguments),
        (minPrice = parseFloat(minPrice, 10) || !1);
    const minPriceFormat =
        !!minPrice &&
        `${format_price(minPrice, {
            mask: app_shop.vars.currency_format,
            currency: instalmentData.currency,
            currency_space: app_shop.vars.currency_space,
            currency_before_price: app_shop.vars.currency_before_value,
        })}${priceType && 'net' === priceType ? app_shop.txt.instalmentNet : ''}`;
    maxPrice = parseFloat(maxPrice, 10) || !1;
    const maxPriceFormat =
        !!maxPrice &&
        `${format_price(maxPrice, {
            mask: app_shop.vars.currency_format,
            currency: instalmentData.currency,
            currency_space: app_shop.vars.currency_space,
            currency_before_price: app_shop.vars.currency_before_value,
        })}${priceType && 'net' === priceType ? app_shop.txt.instalmentNet : ''}`;
    (totalPrice = parseFloat(totalPrice, 10) || !1),
        (link = link || !1),
        (instalmentName = instalmentName || !1),
        (priceType = priceType || !1);
    let productsPrice = '';
    productsPrice =
        priceType && 'net' === priceType
            ? document.getElementById('projector_number')
                ? instalmentData.priceNet * document.getElementById('projector_number').value
                : instalmentData.priceNet
            : document.getElementById('projector_number')
                ? instalmentData.price * document.getElementById('projector_number').value
                : instalmentData.price;
    const productsPriceFormat = `${format_price(productsPrice, {
        mask: app_shop.vars.currency_format,
        currency: instalmentData.currency,
        currency_space: app_shop.vars.currency_space,
        currency_before_price: app_shop.vars.currency_before_value,
    })}${priceType && 'net' === priceType ? app_shop.txt.instalmentNet : ''}`;
    if (
        (link &&
            -1 !== link.indexOf('{calculate_price}') &&
            (link = link.replace('{calculate_price}', 'XXX')),
            0 === productsPrice)
    )
        return eval(link), !1;
    if (
        0 === instalmentData.basketCount &&
        ((!minPrice && !maxPrice) ||
            (minPrice && productsPrice >= minPrice && maxPrice && productsPrice <= maxPrice))
    )
        return eval(link.replace('XXX', productsPrice)), !1;
    let infoHTML = '';
    minPrice && productsPrice < minPrice
        ? (infoHTML = `\n      <div class='menu_messages_message'>\n        <div class='menu_messages_message_sub'>\n          <p>${app_shop.txt.instalmentLabelMin}${instalmentName}${app_shop.txt.instalmentLabelTo}${minPriceFormat}</p>\n        </div>\n      </div>\n    `)
        : maxPrice &&
        productsPrice > maxPrice &&
        (infoHTML = `\n      <div class='menu_messages_message'>\n        <div class='menu_messages_message_sub'>\n          <p>${app_shop.txt.instalmentLabelMax}${instalmentName}${app_shop.txt.instalmentLabelTo}${maxPriceFormat}</p>\n        </div>\n      </div>\n    `);
    let sumPrice = 0;
    sumPrice = totalPrice
        ? (totalPrice + productsPrice).toFixed(2)
        : (
            (priceType && 'net' === priceType
                ? instalmentData.basketCostNet
                : instalmentData.basketCost) + productsPrice
        ).toFixed(2);
    const sumPriceFormat = `${format_price(sumPrice, {
        mask: app_shop.vars.currency_format,
        currency: instalmentData.currency,
        currency_space: app_shop.vars.currency_space,
        currency_before_price: app_shop.vars.currency_before_value,
    })}${priceType && 'net' === priceType ? app_shop.txt.instalmentNet : ''}`;
    let buttonHTML = '';
    if (
        (document.querySelector('#container.projector_page') &&
            ((buttonHTML = `\n      <button class="instalment_calculator__button ${(minPrice && productsPrice < minPrice) || (maxPrice && productsPrice > maxPrice)
                ? app_shop.txt.instalmentButtonDisableClassDialog
                : app_shop.txt.instalmentButtonClassDialog
                }"${(minPrice && productsPrice < minPrice) || (maxPrice && productsPrice > maxPrice)
                    ? ''
                    : ` onclick="${link.replace('XXX', productsPrice)}"`
                }>\n        <span class="instalment_calculator__button_txt">${app_shop.txt.instalmentSingleProduct
                }</span>\n        <span class="instalment_calculator__button_price">${productsPriceFormat}</span>\n        ${minPrice && productsPrice < minPrice
                    ? `<span class="instalment_calculator__button_info">${app_shop.txt.instalmentTextMin}</span>`
                    : ''
                }\n        ${maxPrice && productsPrice > maxPrice
                    ? `<span class="instalment_calculator__button_info">${app_shop.txt.instalmentTextMax}</span>`
                    : ''
                }\n      </button>\n    `),
                0 !== instalmentData.basketCount &&
                (buttonHTML += `\n        <button class="instalment_calculator__button ${(minPrice && sumPrice < minPrice) || (maxPrice && sumPrice > maxPrice)
                    ? app_shop.txt.instalmentButtonDisableClassDialog
                    : app_shop.txt.instalmentButtonClassDialog
                    }"${(minPrice && sumPrice < minPrice) || (maxPrice && sumPrice > maxPrice)
                        ? ''
                        : ` onclick="${link.replace('XXX', sumPrice)}"`
                    }>\n          <span class="instalment_calculator__button_txt">${app_shop.txt.instalmentBasketProduct
                    }</span>\n          <span class="instalment_calculator__button_price">${sumPriceFormat}</span>\n          ${minPrice && sumPrice < minPrice
                        ? `<span class="instalment_calculator__button_info">${app_shop.txt.instalmentTextMinBasket}</span>`
                        : ''
                    }\n          ${maxPrice && sumPrice > maxPrice
                        ? `<span class="instalment_calculator__button_info">${app_shop.txt.instalmentTextMaxBasket}</span>`
                        : ''
                    }\n        </button>\n      `)),
            document.querySelector('#container.basketedit_page'))
    ) {
        if (minPrice && productsPrice >= minPrice && maxPrice && productsPrice <= maxPrice)
            return eval(link.replace('XXX', productsPrice)), !1;
        buttonHTML = `\n      <button class="instalment_calculator__button ${(minPrice && productsPrice < minPrice) || (maxPrice && productsPrice > maxPrice)
            ? app_shop.txt.instalmentButtonDisableClassDialog
            : app_shop.txt.instalmentButtonClassDialog
            }"${(minPrice && productsPrice < minPrice) || (maxPrice && productsPrice > maxPrice)
                ? ''
                : ` onclick="${link.replace('XXX', productsPrice)}"`
            }>\n        <span class="instalment_calculator__button_txt">${app_shop.txt.instalmentMultiProduct
            }</span>\n        <span class="instalment_calculator__button_price">${productsPriceFormat}</span>\n        ${minPrice && productsPrice < minPrice
                ? `<span class="instalment_calculator__button_info">${app_shop.txt.instalmentTextMinB}</span>`
                : ''
            }\n        ${maxPrice && productsPrice > maxPrice
                ? `<span class="instalment_calculator__button_info">${app_shop.txt.instalmentTextMaxB}</span>`
                : ''
            }\n      </button>\n    `;
    }
    Modal({ html: infoHTML + buttonHTML, classList: 'instalment_calculator' });
}
function runOmnibusFallback() {
    try {
        const e = document.querySelectorAll(
            '[data-last_price_change_date]:not([data-omnibus]):not(.--omnibus):not(.--omnibus-short)',
        );
        if (0 === e.length) return;
        void 0 !== app_shop.fn.omnibusGrapqhlFallback
            ? app_shop.fn.omnibusGrapqhlFallback?.init?.(e)
            : (app_shop.fn.omnibusGrapqhlFallback = new OmnibusGraphqlFallback(e));
    } catch (e) {
        console.error('[OmnibusFallback]:runOmnibusFallback Error', e);
    }
}
(app_shop.fn.mobileGen = function (e = !1) {
    if (e) $('.nav-header').remove();
    else if (!$('.nav-header').length) {
        var t = $('aside .nav-link + ul');
        $.each(t, function (e, t) {
            var i = $(t).prev();
            $(t).prepend('<li class="nav-header"></li>'),
                $(t).find('.nav-header').prepend(i.clone()),
                $(t)
                    .find('.nav-header')
                    .prepend(
                        '<a href="#backLink" class="nav-header__backLink"><i class="icon-angle-left"></i></a>',
                    );
        });
    }
}),
    app_shop.run(
        function () {
            var e = $(window).width();
            $('.navbar-nav .isOverflow').removeClass('isOverflow'),
                $('.navbar-nav > .nav-item').each(function () {
                    var t;
                    ($this = $(this)),
                        (t = e - $this.offset().left) < parseInt(submenuWidth) && $this.addClass('isOverflow'),
                        t < parseInt(2 * submenuWidth) && $this.find('.navbar-subnav').addClass('isOverflow');
                }),
                $('.nav-link img.rwd-src').each(function () {
                    ($this = $(this)), $this.attr('src', app_shop.fn.getRwdSrc($this));
                }),
                app_shop.vars.view < 2
                    ? window.matchMedia('(display-mode: standalone)').matches &&
                    $('.nav-link').each(function (e) {
                        $(this).next().is('ul') &&
                            ($(this).attr('data-href', $(this).attr('href')),
                                $(this).attr('href', '##'),
                                $(this).addClass('not_selectable'));
                    })
                    : $('.nav-link').each(function (e) {
                        '' != $(this).attr('data-href') &&
                            ($(this).attr('href', $(this).attr('data-href')), $(this).removeAttr('data-href')),
                            $(this).removeClass('not_selectable');
                    }),
                app_shop.vars.view > 2 && $('html').removeClass('filters_open').removeClass('sidebar_open');
        },
        [1, 2, 3, 4],
        '#menu_categories',
    ),
    app_shop.run(
        function () {
            app_shop.fn.mobileGen(!0);
        },
        [3, 4],
        '#menu_categories',
    ),
    $(document).on('click', '.navbar-toggler', function (e) {
        return (
            e.preventDefault(),
            $('html').hasClass('filters_open') || $('html').hasClass('sidebar_open')
                ? ($('html').removeClass('filters_open').removeClass('sidebar_open'),
                    $('header .handler[data-item="menu_search"]').before($('#menu_search')),
                    $('header .handler[data-item="menu_search"]').remove())
                : ($('html').addClass('sidebar_open'),
                    $('#menu_search').before(
                        '<del class="handler" data-item="menu_search" style="display:none"></del>',
                    ),
                    'object' == typeof app_shop.fn.shoppingList
                        ? $('aside .setMobileGrid[data-item="#menu_navbar"]').before($('#menu_search'))
                        : $('aside .setMobileGrid[data-item="#menu_navbar"]').after($('#menu_search'))),
            $('aside .navbar-subnav, aside .navbar-subsubnav, aside, #menu_settings form').scrollTop(0),
            app_shop.fn.mobileGen(),
            app_shop.fn.setMobileCategories && app_shop.fn.setMobileCategories(),
            !1
        );
    }),
    $(document).on('click', 'aside .navbar-collapse .nav-link', function () {
        var e = $(this).next(),
            t = $(this).parent(),
            i = e.children();
        if (e.is('ul') && app_shop.vars.view < 3)
            return t.toggleClass('nav-open'), 2 === i.length && i.last().toggleClass('nav-open'), !1;
    }),
    $(document).on('click', 'aside .nav-header .nav-header__backLink', function () {
        var e = $(this).parents('.nav-open').eq(0),
            t = e.parents('ul').eq(0),
            i = t.children();
        return (
            e.removeClass('nav-open'),
            2 === i.length && t.parents('.nav-open').eq(0).removeClass('nav-open'),
            !1
        );
    }),
    $(document).on('click', '.touch header .navbar-collapse .nav-link', function (e) {
        var t = $(this).next(),
            i = t.is('.active');
        return (
            $('.nav-item ul').removeClass('active'),
            $(this).parent().parent().hasClass('navbar-nav') &&
            $('.navbar-subnav').removeClass('--hover'),
            !!($('#menu_navbar').parent('.wide').size() && t.parents('ul').size() > 1) ||
            (t.is('ul')
                ? (i
                    ? (t.removeClass('active'),
                        t.find('ul.active').removeClass('active'),
                        t.parents('ul').not('.navbar-nav').addClass('active'))
                    : (t.addClass('active'),
                        t.parents('ul').not('.navbar-nav').addClass('active'),
                        $('body').off('click.navbar'),
                        $('body').on('click.navbar', function (e) {
                            $('.nav-item ul').removeClass('active');
                        })),
                    $(this).next('.navbar-subnav').length > 0 &&
                    (!$(this).attr('data-visited') &&
                        (app_shop.fn.concatColumns(t), app_shop.fn.setPositionMenu(t)),
                        $(this).attr('data-visited', 'true')),
                    e.preventDefault(),
                    !1)
                : void 0)
        );
    }),
    $(document).on(
        'click',
        '.sidebar_open header, .sidebar_open #content, .sidebar_open footer, .filters_open header, .filters_open #content, .filters_open footer',
        function (e) {
            return (
                $('html').removeClass('sidebar_open filters_open'),
                $('.nav-open').removeClass('nav-open'),
                $('#menu_settings form').removeClass('active'),
                $('header .handler[data-item="menu_search"]').before($('#menu_search')),
                $('header .handler[data-item="menu_search"]').remove(),
                app_shop.fn.setMobileCategories && app_shop.fn.setMobileCategories(),
                e.preventDefault(),
                !1
            );
        },
    ),
    app_shop.run(
        function () {
            dlmenu_wide &&
                ($('#menu_categories .nav-item.--extend').each(function () {
                    $(this).off(),
                        $(this).on('click', function (e) {
                            e.preventDefault(), $(this).parent().toggleClass('show');
                            let t = $(this).find('a'),
                                i = t.text();
                            return (
                                t.off(),
                                t.text(t.attr('txt_alt')),
                                t.attr('txt_alt', i),
                                t.parents('.navbar-subnav').addClass('--hover'),
                                !1
                            );
                        });
                }),
                    $('.navbar-subnav').on('mouseover', function () {
                        $('.navbar-subnav').removeClass('--hover');
                    }),
                    $('.no-touch .navbar-nav > .nav-item > .nav-link').on('mouseover', function () {
                        $(this).next('.navbar-subnav').length > 0 &&
                            (!$(this).attr('data-visited') &&
                                (app_shop.fn.concatColumns($(this).next('.navbar-subnav')),
                                    app_shop.fn.setPositionMenu($(this).next('.navbar-subnav'))),
                                $(this).attr('data-visited', 'true'));
                    }),
                    (app_shop.fn.concatColumns = function (e) {
                        if (void 0 !== dlmenu_columnConcat && '' != dlmenu_columnConcat) {
                            let t = $('<li>', { class: 'nav-item nav-merge' }),
                                i = parseInt(dlmenu_columnHeight);
                            e.find(' > .nav-item').each(function () {
                                const e = $(this);
                                let n = e.height(),
                                    r = e.next().height();
                                !e.hasClass('nav-merge') && (n = e.height()),
                                    !e.next().hasClass('nav-merge') && (r = e.next().height()),
                                    e.hasClass('--all') && (i = 0),
                                    n < i && r + n < i
                                        ? (e.after(t), t.append(e), (i -= n))
                                        : n < i &&
                                        (e.after(t),
                                            t.append(e),
                                            (i = parseInt(dlmenu_columnHeight)),
                                            (t = $('<li>', { class: 'nav-item nav-merge' })));
                            });
                        }
                    }),
                    $('#menu_categories .navbar-nav > .nav-item').each(function () {
                        0 === $(this).find('li.nav-item:not(.empty):not(.nav-merge)').length &&
                            $(this).addClass('--noBold');
                    }),
                    (app_shop.fn.setPositionMenu = function (e) {
                        const t = $('#menu_categories').width() - dlmenu_padding,
                            i = e.find('> .nav-item:not(.--all)').length;
                        if (
                            (e.addClass('--cols' + i),
                                (i < dlmenu_columns && window.screen.width > 1200) ||
                                (i < dlmenu_columns - 1 && window.screen.width < 1200))
                        ) {
                            let i = e,
                                n = i.parent().position().left;
                            n = n < 0 ? 0 : n;
                            let r = t - (i.width() + n),
                                o = n - -1 * r;
                            (o = r > 0 ? n : o), i.css('left', o + 'px');
                        }
                    }),
                    document.querySelectorAll('.nav-link:not(.nav-gfx) > img.gfx_lvl_1.--omo').forEach(e => {
                        e.style.maxWidth = `${e.previousElementSibling.offsetWidth}px`;
                    }));
        },
        [3, 4],
        '#menu_categories',
    ),
    app_shop.run(
        function () {
            $('.nav-link.nav-gfx').on({
                mouseenter() {
                    const e = $(this).find('img'),
                        t = e.data('omo'),
                        i = e.parent().innerWidth() - e.parent().width(),
                        n = e.parent().innerHeight() - e.parent().height();
                    t &&
                        (e.parent().css('min-width', e.width() + i),
                            e.parent().css('min-height', e.height() + n),
                            e.attr('data-tmp_img', e.attr('src')),
                            'img_rwd' === t
                                ? 1 === app_shop.vars.view
                                    ? e.attr('src', e.data('omo_mobile'))
                                    : 2 === app_shop.vars.view
                                        ? e.attr('src', e.data('omo_tablet'))
                                        : e.attr('src', e.data('omo_desktop'))
                                : e.attr('src', e.data('omo_img')));
                },
                mouseleave() {
                    const e = $(this).find('img'),
                        t = e.data('tmp_img');
                    t && (e.attr('src', t), e.removeAttr('data-tmp_img'));
                },
            });
        },
        'all',
        '.nav-link',
    ),
    app_shop.run(
        () => {
            const e = document.querySelector('header');
            if (!e) return;
            const t = document.querySelector('.breadcrumbs');
            e.append(t);
        },
        [3, 4],
        '.breadcrumbs',
    ),
    app_shop.run(
        () => {
            const e = document.getElementById('layout');
            if (!e) return;
            const t = document.querySelector('.breadcrumbs');
            e.prepend(t);
        },
        [1, 2],
        '.breadcrumbs',
    ),
    app_shop.run(
        () => {
            document.querySelector('.breadcrumbs #back_button').addEventListener('click', e => {
                e.preventDefault(), window.history.back();
            });
        },
        'all',
        '.breadcrumbs #back_button',
    ),
    app_shop.run(
        function () {
            simple_tooltip('.order_process_security.show_tip', 'n59581_tooltip');
        },
        'all',
        '.order_process_security.show_tip',
    ),
    app_shop.run(
        function () {
            $('.slm_lists__label').on('click', function () {
                $(this).parents('.slm_lists').toggleClass('--active');
            });
        },
        'all',
        '.shopping_list_menu',
    ),
    (app_shop.fn.setGrid = function () {
        switch (app_shop.vars.view) {
            case 4:
            case 3:
                $('.domHandler').each(function () {
                    var e = $(this).data('item');
                    $(this).after($(e)), $(this).remove();
                });
                break;
            case 2:
            case 1:
                $('.domHandler').length ||
                    $('.setMobileGrid').each(function () {
                        var e = $(this).data('item');
                        $(e).before('<del class="domHandler" data-item="' + e + '" style="display:none">'),
                            $(this).append($(e));
                    });
        }
    }),
    (app_shop.fn.setMobileCategories = function () {
        const e = (e, t) => {
            t.split(',').forEach(e => {
                $(e).hide(), $(e).removeClass('--active');
            }),
                e.split(',').forEach(e => {
                    $(e).show(), $(e).addClass('--active');
                });
        },
            t = () => {
                $('aside').prepend($('#mobileCategories'));
                let t = '';
                $('#mobileCategories .mobileCategories__link').each(function () {
                    (t += `${t}, ${$(this).attr('data-ids')}`),
                        $(this).off(),
                        $(this).on('click', function () {
                            return (
                                $('#mobileCategories .mobileCategories__link').removeClass('--active'),
                                $(this).addClass('--active'),
                                e($(this).attr('data-ids'), t),
                                !1
                            );
                        });
                }),
                    e($('#mobileCategories .mobileCategories__link').first().attr('data-ids'), t),
                    $('#mobileCategories .mobileCategories__link').removeClass('--active'),
                    $('#mobileCategories .mobileCategories__link').first().addClass('--active');
            };
        $('#mobileCategories').length && t();
    }),
    app_shop.run(
        function () {
            $('#menu_blog_bydates > ul > li > a').on('click', function () {
                if ($(this).next('ul'))
                    return (
                        $(this).parent().hasClass('active')
                            ? $(this).parent().removeClass('active')
                            : ($('#menu_blog_bydates > ul > li').removeClass('active'),
                                $(this).parent().addClass('active')),
                        !1
                    );
            });
        },
        'all',
        '#menu_blog_bydates',
        !0,
    ),
    $('.progress_bar_1.active').size()
        ? $('div.progress_bar_keeper').addClass('progress_bar_1_active')
        : $('.progress_bar_2.active').size()
            ? $('div.progress_bar_keeper').addClass('progress_bar_2_active')
            : $('.progress_bar_3.active').size()
                ? $('div.progress_bar_keeper').addClass('progress_bar_3_active')
                : $('.progress_bar_4.active').size() &&
                $('div.progress_bar_keeper').addClass('progress_bar_4_active'),
    app_shop.run(
        function () {
            $('footer').before($('#search_hotspot_zone1'));
        },
        'all',
        '#search_hotspot_zone1',
    ),
    app_shop.run(
        () => {
            document.querySelectorAll('.footer_links_label:not(:only-child)').forEach(e => {
                e.addEventListener('click', e => {
                    app_shop.vars.view > 1 ||
                        (e.preventDefault(), e.target.closest('.footer_links')?.classList.toggle('--open'));
                });
            });
        },
        'all',
        '.footer_links_label:not(:only-child)',
    ),
    app_shop.run(
        () => {
            document.querySelectorAll('.footer_links_sub a.--gfx').forEach(e => {
                e.addEventListener('mouseover', e => {
                    const t = e.target.closest('a.--gfx').querySelector('img');
                    if (!t) return;
                    const { onmouseover: i } = t.dataset;
                    i && ((t.dataset.tmp = t.src), (t.src = i));
                }),
                    e.addEventListener('mouseout', e => {
                        const t = e.target.closest('a.--gfx').querySelector('img');
                        if (!t) return;
                        const { tmp: i } = t.dataset;
                        i && ((t.src = i), delete t.dataset.tmp);
                    });
            });
        },
        'all',
        '.footer_links_sub a.--gfx',
    ),
    app_shop.run(
        () => {
            document.querySelector('#manageCookies')?.addEventListener('click', () => {
                'function' == typeof prepareCookiesConfiguration && prepareCookiesConfiguration();
            });
        },
        'all',
        '#manageCookies',
    ),
    app_shop.fn.rwdBanner('.platnosci_54388', [1, 2, 3, 4]),
    app_shop.run(function () {
        simple_tooltip('.showTip', 'n59581_tooltip_dictionary'),
            simple_tooltip('#contentcolumn_order1 .showTip_order1', 'n59581_tooltip'),
            simple_tooltip('#basketedit_gifts .showTip_gift', 'n59581_tooltip'),
            simple_tooltip('#basketedit_productslist .showTip_basket', 'n59581_tooltip'),
            simple_tooltip('span.btn_note', 'n59581_instalment_note');
    }, 'all'),
    app_shop.run(function () {
        iaiGet.snippets(
            function (e) {
                var t = e.Snippets.response.items;
                for (var i in t)
                    switch (t[i].region) {
                        case 'head':
                            $('head').append(t[i].content);
                            break;
                        case 'body_top':
                            $('body').prepend(t[i].content);
                            break;
                        default:
                            $('body').append(t[i].content);
                    }
            },
            {
                mobile: (1 == app_shop.vars.view).toString(),
                tablet: (2 == app_shop.vars.view).toString(),
                pc: (app_shop.vars.view >= 3).toString(),
                request_uri: app_shop.vars.request_uri,
                additional_ajax: app_shop.vars.additional_ajax,
            },
        ),
            iaiGet.toplayersAndWidgets(
                function (json) {
                    var ToplayersAndWidgets = json.ToplayersAndWidgets.response.items;
                    for (var key in ToplayersAndWidgets)
                        'script' === key
                            ? eval(ToplayersAndWidgets[key])
                            : $('body').append(ToplayersAndWidgets[key].content);
                },
                {
                    mobile: (1 == app_shop.vars.view).toString(),
                    tablet: (2 == app_shop.vars.view).toString(),
                    pc: (app_shop.vars.view >= 3).toString(),
                    request_uri: app_shop.vars.request_uri,
                    additional_ajax: app_shop.vars.additional_ajax,
                },
            );
    }, 'all'),
    (app_shop.txt.instalmentLabel = ''),
    (app_shop.txt.instalmentSingleProduct = 'Oblicz raty tylko dla tego produktu'),
    (app_shop.txt.instalmentMultiProduct = 'Oblicz raty produktĂłw w koszyku'),
    (app_shop.txt.instalmentBasketProduct = 'Oblicz raty ĹÄcznie z wartoĹciÄ koszyka'),
    (app_shop.txt.instalmentNoTall =
        'Nie wszystkie umieszczone w koszyku produkty umoĹźliwiÄ zakup tym systemem ratalnym. PrzejdĹş do szczegĂłĹĂłw kaĹźdego z produktĂłw aby dowiedzieÄ siÄ ktĂłre z nich umoĹźliwiajÄ taki zakup. JeĹźeli zdecydujesz siÄ na zakup na raty, opĹata za te produkty bÄdzie musiaĹa byÄ wniesiona odrÄbnie pozostaĹymi sposobami pĹatnoĹci.'),
    (app_shop.txt.instalmentTooMany =
        'W koszyku znajduje siÄ zbyt duĹźa iloĹÄ produktĂłw aby mĂłc opĹaciÄ zamĂłwienie tym systemem ratalnym. Zmniejsz iloĹÄ produktĂłw do '),
    (app_shop.txt.instalmentTooMany2 =
        ' aby mĂłc skorzystaÄ z systemu rat. IloĹÄ sztuk jednego produktu nie jest limitowana.'),
    (app_shop.txt.instalmentLabelTo = ' to '),
    (app_shop.txt.instalmentLabelMinBasket =
        'Nie moĹźesz uruchomiÄ symulacji rat dla caĹego koszyka, poniewaĹź minimalna kwota umoĹźliwiajÄca zakupy przez '),
    (app_shop.txt.instalmentTextMin = 'ZwiÄksz iloĹÄ sztuk produktu, aby uruchomiÄ kalkulator rat.'),
    (app_shop.txt.instalmentTextMinBasket =
        'ZwiÄksz iloĹÄ sztuk tego produktu, lub wrzuÄ do koszyka dodatkowe produkty.'),
    (app_shop.txt.instalmentTextMinB =
        'ZwiÄksz iloĹÄ produktĂłw w koszyku, aby uruchomiÄ kalkulator rat.'),
    (app_shop.txt.instalmentLabelMax = 'Maksymalna kwota umoĹźliwiajÄca zakupy przez '),
    (app_shop.txt.instalmentLabelMaxBasket =
        'Nie moĹźesz uruchomiÄ symulacji rat dla caĹego koszyka, poniewaĹź maksymalna kwota umoĹźliwiajÄca zakupy przez '),
    (app_shop.txt.instalmentTextMax = 'Zmniejsz iloĹÄ sztuk produktu, aby uruchomiÄ kalkulator rat.'),
    (app_shop.txt.instalmentTextMaxBasket =
        'Zmniejsz iloĹÄ sztuk tego produktu, lub usuĹ z koszyka niektĂłre produkty.'),
    (app_shop.txt.instalmentTextMaxB =
        'Zmniejsz iloĹÄ produktĂłw w koszyku, aby uruchomiÄ kalkulator rat.'),
    (app_shop.txt.instalmentLabelMin = 'Minimalna kwota umoĹźliwiajÄca zakupy przez '),
    (app_shop.txt.instalmentButtonClassDialog = 'btn --solid --medium'),
    (app_shop.txt.instalmentButtonDisableClassDialog = 'btn --solid --secondary --medium --disabled'),
    (app_shop.txt.instalmentNet = ' netto'),
    app_shop.run(
        function () {
            Modal({ element: document.getElementById('menu_notice') });
        },
        'all',
        '#menu_notice',
    ),
    app_shop.run(
        function () {
            'function' == typeof runOmnibusFallback && runOmnibusFallback();
        },
        'all',
        '[data-last_price_change_date]',
        !0,
    ),
    app_shop.run(
        () => {
            $('.affiliate.--generator.--menu').after($('.affiliate__info.--small'));
        },
        [1],
        '.affiliate.--generator.--menu',
    ),
    app_shop.run(
        () => {
            $('.affiliate.--generator.--menu').append($('.affiliate__info.--small'));
        },
        [2, 3, 4],
        '.affiliate.--generator.--menu',
    );
const basketActionsCall = e => {
    $('.basket .--click, .basket__tools .--click').on('click', async function () {
        const e = $(this),
            t = e.attr('href'),
            i = e.parents('.basket__block'),
            n = i.find('.basket__item.--actions'),
            r = $('.basket__item.--actions.--active, .basket__item.--actions.--active-comment'),
            o = $('.basket__form');
        switch (t) {
            case '#showActions':
                (!i.hasClass('--special') || i.hasClass('--special_quantity')) &&
                    (n.toggleClass('--active'), e.toggleClass('--open'));
                break;
            case '#editComment':
                app_shop.vars.view < 3
                    ? n.addClass('--active --active-comment')
                    : (r.not(n).removeClass('--active-comment'), n.toggleClass('--active-comment'));
                break;
            case '#addComment':
                r.not(n).removeClass('--active-comment'), n.toggleClass('--active-comment');
                break;
            case '#addMoreFile': {
                const t = e.prev();
                t.append(t.find('input').first().clone().val('')), t.scrollTop(t[0].scrollHeight);
                break;
            }
            case '#previewFile': {
                const t = e.attr('rel'),
                    i = e.parent().find('span').text();
                let n = new Image();
                return (
                    (n.src = t),
                    (n.onload = function () {
                        Modal({
                            html: `<div id="ui-dialogimg"><img alt="${i}" src="${t}" /></div>`,
                            classList: '--medium',
                        });
                    }),
                    !1
                );
            }
            case '#delQuantity':
            case '#addQuantity': {
                const e = i.find('.quantity__input'),
                    { unit_sellby: n } = e.data(),
                    r =
                        '#delQuantity' === t
                            ? parseFloat(e.val()) - parseFloat(n)
                            : parseFloat(e.val()) + parseFloat(n);
                e.val(r).change(), e.keyup();
                break;
            }
            case '#remove':
                i.find('.quantity__input').val(0), o.submit();
                break;
            case '#removeAll':
                $('.basket__action .quantity__input').val(0), o.submit();
                break;
            case '#removeSelected':
                $('.basket__product_checkbox').each(function () {
                    $(this).is(':checked') &&
                        $('.basket__block[data-product-checkbox-id="' + $(this).val() + '"]')
                            .find('.quantity__input')
                            .val(0);
                }),
                    o.submit();
                break;
            case '#addToFavorite':
                break;
            case '#addWrapper':
                $('.basket__wrappers').toggleClass('--active'),
                    app_shop.vars.bLazy && app_shop.vars.bLazy.revalidate(),
                    $('#wrappers_wrapper .product__name').setHeight($('#wrappers_wrapper .products')),
                    $('#wrappers_wrapper .product__prices').setHeight($('#wrappers_wrapper .products'));
                break;
            default:
                return !0;
        }
        return !1;
    }),
        $('.basket__select_all_checkbox').on('change', function () {
            $(this).is(':checked')
                ? $('.basket__product_checkbox').prop('checked', !0)
                : $('.basket__product_checkbox').prop('checked', !1);
        }),
        $('.basket__gift_inputs[data-nogiftforyou]').length > 0 &&
        (Alertek.show_alert(productslist_maxvalue_05_txt),
            $.post(
                $('form.basket__form').attr('action'),
                $('form.basket__form').serialize(),
                function () { },
                'json',
            )),
        $('.basket__add .add__textarea').blur(function () {
            const e = $(this),
                t = e.val().length,
                i = productslist_maxvalue_04_txt;
            t > i &&
                (e.val(e.val().substring(0, i)),
                    Alertek.show_alert(productslist_03a_txt + i + productslist_03b_txt));
        }),
        $('.basket__quantity .quantity__input').on('keyup', function () {
            const e = $(this),
                t = e.val();
            if ((e.val(e.val().replace(/[^0-9.]+/g, '')), app_shop.vars.view < 3)) {
                const i = $.fn.textWidth(t, '21px Arial');
                e.width(i + 15);
            } else e.removeAttr('style');
        }),
        $(document).on('click.close_wrappers', '.close_wrappers', function () {
            $('.basket__wrappers').removeClass('--active');
        }),
        $('.basket__quantity .quantity__input').on('change', function () {
            const t = $(this);
            let i = !1,
                n = !1;
            const r = t.parents('.basket__block').attr('data-product-id'),
                o = t.parents('.basket__block').attr('data-product-size');
            $('.basket__block').each(function () {
                $(this).attr('data-product-id') == r &&
                    $(this).attr('data-product-size') == o &&
                    $(this).hasClass('--special') &&
                    ((i = !0), (n = $(this).find('.quantity__input').val()));
            }),
                t.parents('.basket__block').hasClass('--special') && (i = !1),
                i ? e.numberCheck($(this), n) : e.numberCheck($(this));
        }),
        simple_tooltip('.basket__tip', 'n59581_tooltip'),
        $('.basket__param.--comment .param__label').trunk8({ lines: 2 }),
        document.querySelectorAll('.basket__visible_in_group').forEach(e => {
            e.addEventListener('click', e => {
                e.preventDefault();
                const { target: t } = e,
                    i = t.closest('.basket__block').getAttribute('data-group-id');
                return (
                    document.querySelectorAll(`.basket__block[data-group-id="${i}"]`).forEach(e => {
                        e.classList.toggle('--open');
                    }),
                    !1
                );
            });
        });
};
app_shop.run(
    function () {
        $('.basketedit_summary_container').after($('.basket__tools')),
            $('.basket__tools').after($('.basket__wrappers'));
        new Basket({ funcActionsCall: basketActionsCall });
    },
    'all',
    '#Basket',
),
    app_shop.run(
        function () {
            $('.basket__quantity .quantity__input').keyup();
        },
        [1, 2, 3, 4],
        '#Basket',
    );
var productslist_03a_txt = 'Uwagi mogÄ mieÄ maksymalnie ',
    productslist_03b_txt = ' znakĂłw. ',
    productslist_maxvalue_04_txt = '255',
    productslist_maxvalue_05_txt =
        "<b>Wybrany przez Ciebie wczeĹniej produkt gratisowy nie jest dostÄpny dla takiej wartoĹci koszyka. </b><br/><span style='font-weight:normal;'>Prosimy wybierz inny produkt gratisowy lub zmieĹ wartoĹÄ swojego zamĂłwienie.</span>",
    txt_order_wrappers_1 = 'Do koszyka',
    txt_order_wrappers_2 = 'Gratis !',
    txt_order_wrappers_4 = 'Wybierz opakowanie',
    txt_order_wrappers_8 = 'Zamknij',
    product_buttons_basket_class = 'btn --solid';
const basketeditTxt = { week1: ' tydzieĹ', week2: ' tygodnie', week3: ' tygodni' };
(basketeditTxtWeek = [basketeditTxt.week3, basketeditTxt.week1, basketeditTxt.week2]),
    app_shop.run(
        function () {
            document.querySelectorAll('.basket__division .basket__division_option').forEach(e => {
                const t = e?.getAttribute('data-weeks'),
                    i = e?.getAttribute('data-days'),
                    n = e?.getAttribute('data-week_day'),
                    r = 'true' == e?.getAttribute('data-today'),
                    o = e?.getAttribute('data-shipping_date'),
                    s = 'false' === e?.getAttribute('data-isDivision'),
                    a = formatDivisionDates({
                        weeks: t,
                        days: i,
                        week_day: n,
                        today: r,
                        shipping_date: o,
                        beforeDataReplace: () => {
                            s ||
                                document.querySelectorAll('.basket__division_literal').forEach(e => {
                                    e.style.display = 'none';
                                });
                        },
                        useSeparator: !0,
                    });
                a &&
                    (s
                        ? e.querySelectorAll('.basket__division_now').forEach(e => {
                            e.innerHTML = a;
                        })
                        : document.querySelectorAll('.basket__division_weeks').forEach(e => {
                            e.innerHTML = a;
                        }));
            }),
                $('input[name="allow_division_order"]').on('change', function () {
                    $(this).parents('form').submit();
                });
        },
        'all',
        '.basket__division',
    ),
    app_shop.run(
        function () {
            $('div.categories-list_wrapper ul').show();
        },
        4,
        'div.categories-list_wrapper',
        !0,
    ),
    app_shop.run(
        function () {
            $('div.categories-list_wrapper ul').show();
        },
        3,
        'div.categories-list_wrapper',
        !0,
    ),
    app_shop.run(
        function () {
            $('div.categories-list_wrapper ul').show();
        },
        2,
        'div.categories-list_wrapper',
        !0,
    ),
    app_shop.run(
        function () {
            $(
                'div.categories-list_wrapper ul.categories-list_level2, div.categories-list_wrapper ul.categories-list_level3',
            ).hide(),
                $('span.more_categories')
                    .unbind()
                    .click(function () {
                        $(this).toggleClass('open').next('ul').slideToggle();
                    });
        },
        1,
        'div.categories-list_wrapper',
        !0,
    );
var client_new_social_info_js_txt_1 =
    'Zaloguj siÄ na ktĂłrÄĹ z wyĹźej wymienionych formy logowania aby dokoĹczyÄ rejestracjÄ.';
app_shop.run(
    function () {
        Modal({
            element: $('#client_new_social_info'),
            classList: '--social',
            afterShow: (e, t) => {
                $('.go_to_register_form').on('click', function (e) {
                    return t.closeModal(), !1;
                });
            },
        });
    },
    'all',
    '#client_new_social_info',
),
    app_shop.run(
        function () {
            $('#button_alert div').html(client_new_social_info_js_txt_1),
                $('#submit_register')
                    .removeAttr('onclick')
                    .click(function () {
                        return $('#button_alert').show(), !1;
                    }),
                $('#submit_register').hover(
                    function () { },
                    function () {
                        $('#button_alert').hide();
                    },
                ),
                $('#client_new_social li strong').on('click', function () {
                    $('#client_new_social form')
                        .not($('#social_networking_' + $(this).attr('data-service')))
                        .hide(),
                        $('#social_networking_' + $(this).attr('data-service')).toggle();
                }),
                $('#client_new_social form').on('submit', function () {
                    return (window.location = '/' + $(this).attr('action') + '?' + $(this).serialize()), !1;
                });
        },
        'all',
        '#client_new_social',
    ),
    app_shop.run(
        () => {
            app_shop.vars.topSpacer = 70;
        },
        1,
        '.client-new_page',
    ),
    app_shop.run(
        () => {
            app_shop.vars.topSpacer = 90;
        },
        2,
        '.client-new_page',
    ),
    app_shop.run(
        () => {
            app_shop.vars.topSpacer = 10;
        },
        [3, 4],
        '.client-new_page',
    );
const clientFormTxt = {
    txt00: 'Mamy juĹź zarejestrowane konto dla podanego adresu e-mail: ',
    txt01: 'PamiÄtam swĂłj login i hasĹo i mogÄ je podaÄ.',
    txt02: 'ChcÄ stworzyÄ nowe konto przy uĹźyciu tego adresu (niezalecane).',
    txt03: 'WyĹlij e-mail pozwalajÄcy na automatyczne zalogowanie',
    txt06: 'WyĹlij wiadomoĹÄ na adres',
    txt07: 'z danymi potrzebnymi do logowania .',
    txt08: '<br/>ZaĹoĹźone wczeĹniej konto zostaĹo poĹÄczone z kontem',
    txt13:
        'Proponujemy Ci uĹźycie tego konta, co pozwoli Ci korzystaÄ z przywilejĂłw zarezerwowanych dla wielokrotnych klientĂłw. Aby siÄ zalogowaÄ na wczeĹniej zaĹoĹźone konto, wystarczy klikniÄcie na link, ktĂłry moĹźemy Ci wysĹaÄ w e-mailu.',
    txt14: 'Poprawne formaty kodu pocztowego dla wybranego kraju to [X - cyfra; Y - litera]:',
    txt15: 'znakĂłw).',
    txt16: 'ProszÄ wypeĹniÄ to pole.',
    txt16a: '<i class="icon-visibility"></i> PokaĹź hasĹo',
    txt16b: '<i class="icon-novisibility"></i> Ukryj hasĹo',
    txt17: 'Wpisz nazwÄ ulicy lub miejscowoĹci.',
    txt18: 'NieprawidĹowy format. Pole musi zawieraÄ przynajmniej jednÄ literÄ.',
};
var clientNewErrorCode = [];
(clientNewErrorCode.no_login = 'Wpisz w to pole swĂłj login.'),
    (clientNewErrorCode.incorect_login =
        'BĹÄdnie wpisany login. Login musi mieÄ minimum 3, a maksimum 40 znakĂłw. MoĹźesz uĹźyÄ liter i cyfr oraz symboli @ . - _.'),
    (clientNewErrorCode.no_password = 'Wpisz w to pole swoje hasĹo.'),
    (clientNewErrorCode.password_to_short =
        'Zbyt krĂłtkie hasĹo. Wpisz dĹuĹźsze hasĹo (minimum 6 znakĂłw).'),
    (clientNewErrorCode.password_to_long =
        'Za dĹugie hasĹo. Wpisz krĂłtsze hasĹo (maksimum 15 znakĂłw).'),
    (clientNewErrorCode.login_equals_password = 'HasĹo jest takie samo jak login. Wpisz inne hasĹo.'),
    (clientNewErrorCode.not_equal_passwords =
        'Wpisane hasĹa nie sÄ takie same. Wpisz ponownie hasĹo i potwierdzenie.'),
    (clientNewErrorCode.no_firstname = 'Wpisz w to pole swoje imiÄ.'),
    (clientNewErrorCode.no_name = 'Wpisz w to pole swoje nazwisko.'),
    (clientNewErrorCode.incorect_email =
        'BĹÄdnie wpisany e-mail. Wpisz peĹny adres e-mail, np. jan@kowalski.com'),
    (clientNewErrorCode.incorect_shops = 'Wybierz sklep z listy.'),
    (clientNewErrorCode.incorect_nip = 'BĹÄdnie wpisany NIP.'),
    (clientNewErrorCode.no_firmname = 'BĹÄdnie wpisana nazwa firmy.'),
    (clientNewErrorCode.incorrect_region = 'BĹÄdnie wybrany region.'),
    (clientNewErrorCode.no_city = 'Wpisz w to pole nazwÄ miasta.'),
    (clientNewErrorCode.birth_date = 'Wpisz poprawnÄ datÄ urodzenia w formacie RRRR-MM-DD'),
    (clientNewErrorCode.no_street = 'Wpisz nazwÄ ulicy lub miejscowoĹci.'),
    (clientNewErrorCode.no_street_number = 'Wpisz nazwÄ ulicy lub miejscowoĹci.'),
    (clientNewErrorCode.incorect_phone = 'Wpisz swĂłj telefon.'),
    (clientNewErrorCode.incorect_zipcode = 'BĹÄdnie wpisany kod pocztowy.'),
    (clientNewErrorCode.no_delivery_firstname = 'Wpisz imiÄ odbiorcy przesyĹki.'),
    (clientNewErrorCode.no_delivery_lastname = 'Wpisz nazwisko odbiorcy przesyĹki.'),
    (clientNewErrorCode.no_delivery_city = 'Wpisz miejscowoĹÄ odbiorcy przesyĹki.'),
    (clientNewErrorCode.no_delivery_street = 'Wpisz ulicÄ i numer domu odbiorcy przesyĹki.'),
    (clientNewErrorCode.incorect_delivery_region = 'Wybierz kraj odbiorcy przesyĹki.'),
    (clientNewErrorCode.incorect_delivery_zipcode = 'Wpisz kod pocztowy odbiorcy przesyĹki.'),
    (clientNewErrorCode.login_taken = 'Podany login jest juĹź zajÄty'),
    (clientNewErrorCode.used_login = 'Podany login jest juĹź zajÄty'),
    (clientNewErrorCode.login_taken_login_propose =
        'Podany login jest juĹź zajÄty.<br/><br/>Proponowany login: '),
    (clientNewErrorCode.illegal_characters_client_firstname =
        'Jeden z uĹźytych znakĂłw jest niedozwolony.'),
    (clientNewErrorCode.illegal_characters_client_lastname =
        'Jeden z uĹźytych znakĂłw jest niedozwolony.'),
    (clientNewErrorCode.illegal_characters_client_street =
        'Jeden z uĹźytych znakĂłw jest niedozwolony.'),
    (clientNewErrorCode.illegal_characters_client_city =
        'Jeden z uĹźytych znakĂłw jest niedozwolony.'),
    (clientNewErrorCode.illegal_characters_client_phone =
        'Jeden z uĹźytych znakĂłw jest niedozwolony.'),
    (clientNewErrorCode.illegal_characters_client_phone2 =
        'Jeden z uĹźytych znakĂłw jest niedozwolony.'),
    (clientNewErrorCode.illegal_characters_client_firm =
        'Jeden z uĹźytych znakĂłw jest niedozwolony.'),
    (clientNewErrorCode.illegal_characters_delivery_firstname =
        'Jeden z uĹźytych znakĂłw jest niedozwolony.'),
    (clientNewErrorCode.illegal_characters_delivery_lastname =
        'Jeden z uĹźytych znakĂłw jest niedozwolony.'),
    (clientNewErrorCode.illegal_characters_delivery_city =
        'Jeden z uĹźytych znakĂłw jest niedozwolony.'),
    (clientNewErrorCode.illegal_characters_delivery_additional =
        'Jeden z uĹźytych znakĂłw jest niedozwolony.'),
    (clientNewErrorCode.illegal_characters_delivery_street =
        'Jeden z uĹźytych znakĂłw jest niedozwolony.'),
    (clientNewErrorCode.illegal_characters_delivery_phone =
        'Jeden z uĹźytych znakĂłw jest niedozwolony.'),
    (clientNewErrorCode.illegal_characters_client_nip =
        'Jeden z uĹźytych znakĂłw jest niedozwolony.'),
    (clientNewErrorCode.password_to_short = 'Zbyt krĂłtkie hasĹo. Wpisz dĹuĹźsze hasĹo (minimum'),
    (clientNewErrorCode.password_to_long = 'Za dĹugie hasĹo. Wpisz krĂłtsze hasĹo (maksimum'),
    (clientNewErrorCode.no_invoice_firstname = 'Wpisz imiÄ klienta.'),
    (clientNewErrorCode.no_invoice_lastname = 'Wpisz nazwisko klienta.'),
    (clientNewErrorCode.no_invoice_firmname = 'Wpisz nazwÄ firmy klienta.'),
    (clientNewErrorCode.incorect_invoice_phone = 'Wpisz telefon klienta.'),
    (clientNewErrorCode.no_invoice_city = 'Wpisz miejscowoĹÄ klienta.'),
    (clientNewErrorCode.no_invoice_street = 'Wpisz ulicÄ i numer domu klienta.'),
    (clientNewErrorCode.no_invoice_street_number = 'Wpisz ulicÄ i numer domu klienta.'),
    (clientNewErrorCode.incorect_invoice_zipcode = 'Wpisz kod pocztowy klienta.'),
    (clientNewErrorCode.invalid_format =
        'NieprawidĹowy format. Pole musi zawieraÄ przynajmniej jednÄ literÄ.'),
    (clientNewErrorCode.no_street_number_uk = 'Brakuje numeru domu.'),
    (clientNewErrorCode.no_street_number = 'Podaj nr domu.'),
    (clientFormOptions = { streetnumber: '"1"' }),
    app_shop.run(
        function () {
            $('#client_new_summary').before($('div.rebate_card_wrap'));
        },
        'all',
        '.rebate_card_wrap',
    ),
    app_shop.run(
        function () {
            $('.rebates_active__button.--change').on('click', function () {
                return (
                    $('.rebates_active__sub.--form').removeClass('d-none'),
                    $(this).parent().addClass('d-none'),
                    app_shop.vars.view > 1 &&
                    app_shop.vars.view < 4 &&
                    $('.rebates_active__sub.--info').addClass('d-none'),
                    !1
                );
            });
        },
        'all',
        '.rebates_info',
    );
const BorderRadiusAdd = e => {
    $('.rebates_product__products').each(function () {
        let t = $(this).find($('.rebates_product__product')),
            i = t.length;
        t.removeClass('--radiusLeftTop --radiusRightBottom --radiusRightTop --radiusLeftBottom'),
            t.first().addClass('--radiusLeftTop'),
            t.last().addClass('--radiusRightBottom'),
            i < e
                ? t.last().addClass('--radiusRightTop')
                : t.filter(`:nth-child(${e})`).addClass('--radiusRightTop'),
            i < e
                ? t.last().addClass('--radiusRightTop')
                : t.filter(`:nth-child(${e})`).addClass('--radiusRightTop'),
            i % e == 0
                ? t.filter(`:nth-child(${i - e + 1})`).addClass('--radiusLeftBottom')
                : (t.filter(`:nth-child(${i - (i % e)})`).addClass('--radiusRightBottom'),
                    t.filter(`:nth-child(${i - (i % e) + 1})`).addClass('--radiusLeftBottom'));
    });
};
app_shop.run(
    () => {
        BorderRadiusAdd(2);
    },
    [1],
    '.rebates_product__products',
),
    app_shop.run(
        () => {
            BorderRadiusAdd(4);
        },
        [2, 3, 4],
        '.rebates_product__products',
    ),
    BorderRadiusAdd(4),
    app_shop.run(
        function () {
            1 != app_shop.vars.view &&
                $('a.show_on_map').click(function () {
                    return contact_map.showMap(), !1;
                }),
                1 == app_shop.vars.view &&
                $('div.contact_contact_right p').each(function () {
                    $(this).find('a').size() &&
                        ($(this).css('cursor', 'pointer'),
                            $(this).click(function () {
                                window.location = $(this).find('a').attr('href');
                            }));
                });
        },
        'all',
        '#contact_contact',
    ),
    (app_shop.fn.replaceSelects = function (e, t, i) {
        e.each(function (e) {
            var n = $(this),
                r = e;
            ($selectValue = n.val()),
                ($selectName = n.attr('name')),
                ($labelName = ''),
                n.data('label') && ($labelName = '<b>' + n.data('label') + '</b>'),
                ($ul = $(
                    '<div class="dropdown dropdownsearching form-group ' +
                    n.attr('class') +
                    '"><ul class="dropdown-menu" aria-labelledby="' +
                    t +
                    r +
                    '"></ul></div>',
                )),
                n.children().each(function (e) {
                    var t = $(this);
                    $li = $('<li>');
                    var i = new Array();
                    if (
                        ($.each(t.data(), function (e, t) {
                            var n = 'data-' + e + '=' + t;
                            i.push(n);
                        }),
                            i.length)
                    )
                        var n = i.join(' ');
                    else n = '';
                    $('<a data-index="' + e + '" ' + n + '>')
                        .attr('href', '#' + t.attr('value'))
                        .attr('data-value', t.attr('value'))
                        .text(t.text())
                        .addClass($selectValue == t.attr('value') ? 'selected' : '')
                        .appendTo($li),
                        $li.appendTo($ul.find('ul')),
                        t.attr('class') && $li.addClass(t.attr('class')),
                        t.attr('data-price') && $li.attr('data-price', t.attr('data-price'));
                }),
                $ul
                    .prepend(
                        '<button id="' +
                        t +
                        r +
                        '" class="form-control dropdown-toggle" data-indexcurrent="0" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">' +
                        $labelName +
                        '<span>' +
                        n.find('option:selected').text() +
                        '</span></button>',
                    )
                    .prepend(
                        '<input class="select_hidden searching_ajax" type="hidden" name="' +
                        $selectName +
                        '" value="' +
                        $selectValue +
                        '" />',
                    ),
                i &&
                $ul.find('li').on('click.option', function () {
                    i($(this));
                }),
                n.replaceWith($ul);
        });
    }),
    app_shop.run(
        function () {
            $(document).on('click', 'a.show_description', function () {
                return $(this).parent().addClass('expanded'), !1;
            }),
                $(document).on('click', 'a.hide_description', function () {
                    return $(this).prev().removeClass('expanded'), !1;
                });
        },
        'all',
        '.navigation_desc',
    );
var newsletter = {
    txt: '',
    fill: function (e) {
        '' == e.val() && e.val(newsletter.txt);
    },
    clear: function (e) {
        '' != e.val() && e.val() == newsletter.txt && e.val('');
    },
    mode: function (e) {
        $('#mailing_action_contact').val(e),
            'remove' == e
                ? ($('input[name="newsletter_consent"], input[name="mailing_name"]').removeClass(
                    'validate',
                ),
                    $('#newsletter_privacy_consent').find('.has-feedback').removeClass('has-error'),
                    $('input[name="mailing_name"]').parent().removeClass('has-error'),
                    $('input[name="mailing_name"]').siblings('.validate_message').html(''))
                : 'add' == e &&
                $('input[name="newsletter_consent"], input[name="mailing_name"]').addClass('validate');
    },
};
function opinionsTruncate() {
    app_shop.fn.textTruncate = new TextTruncate(
        { lineH: 18, lineC: 2, wrapper: $('#opinions_wrapper'), count: 95 },
        (e, t) => {
            t.parents('.opinion_item').on('mouseleave', () => {
                app_shop.fn.magicGrid.positionItems(), t.parents('.opinion_item').off();
            }),
                $('html').hasClass('touch') && app_shop.fn.magicGrid.positionItems();
        },
    );
}
function opinionsImgLoad() {
    app_shop.vars.bLazy.options.success = function (e) {
        $(e).parents('.loading').removeClass('loading'), app_shop.fn.magicGrid.positionItems();
    };
}
app_shop.run(
    function () {
        $('form.newsletter_form')
            .find('input, textarea')
            .on('input', function () {
                clearTimeout(app_shop.formControl.timeHandle),
                    (obj = $(this)),
                    (app_shop.formControl.timeHandle = setTimeout(function () {
                        app_shop.formControl.validate(obj);
                    }, 500));
            }),
            $('#newsletter_button_remove').on('click', function () {
                return newsletter.mode('remove'), app_shop.formControl.checkForm($(this).parents('form'));
            }),
            $('#newsletter_button_add').on('click', function () {
                return newsletter.mode('add'), app_shop.formControl.checkForm($(this).parents('form'));
            });
    },
    'all',
    'form.newsletter_form',
),
    (app_shop.vars.opinion_send =
        "Twoja opinia o zamĂłwieniu zostaĹa wysĹana, dziÄkujemy. JeĹźeli chcesz jÄ zmieniÄ kliknij <a href='#edit' class='opinion_edit'>tutaj</a>."),
    (app_shop.vars.opinion_send2 = 'Twoja opinia o produkcie zostaĹa wysĹana, dziÄkujemy.'),
    (app_shop.vars.opinion_error = 'Twoja opinia nie zostaĹa wysĹana.'),
    (app_shop.vars.opinion_empty = 'Podaj treĹÄ opinii.'),
    (app_shop.vars.opinion_file_size = 'Max. rozmiar zdjÄcia to: 2048x1536px.'),
    (app_shop.vars.opinion_file_type = 'Dopuszczalne formaty zdjÄÄ: jpg.'),
    (app_shop.vars.magicGridOptions = {
        container: '.opinions_wrapper',
        static: !0,
        animate: !0,
        gutter: 30,
        maxColumns: 3,
        useMin: !0,
    }),
    (app_shop.fn.opinionsLoad = function () {
        (app_shop.fn.magicGrid = new MagicGrid(app_shop.vars.magicGridOptions)),
            app_shop.fn.magicGrid.listen(),
            app_shop.fn.magicGrid.positionItems(),
            opinionsTruncate(),
            $('.new_load_items img.b-lazy').parents('a').addClass('loading'),
            (app_shop.vars.bLazy = new Blazy({
                container: '#opinions_wrapper',
                success: function (e) {
                    setTimeout(function () {
                        $(e).parents('.loading').removeClass('loading'), app_shop.fn.magicGrid.positionItems();
                    }, 200);
                },
            }));
    }),
    app_shop.run(
        () => {
            opinionsTruncate(), opinionsImgLoad();
        },
        'all',
        '#opinions_wrapper',
    ),
    (app_shop.txt.more = 'wiÄcej'),
    app_shop.run(
        function () {
            new OpinionsShop({});
        },
        'all',
        '#opinions_shop',
    ),
    app_shop.run(
        function () {
            $('#order_open__number_input, #order_open__email_input').on('input', function () {
                clearTimeout(app_shop.formControl.timeHandle);
                const e = $(this);
                app_shop.formControl.timeHandle = setTimeout(function () {
                    app_shop.formControl.validate(e);
                }, 500);
            }),
                $('.order_open__button').on('click', function () {
                    return app_shop.formControl.checkForm($(this).parents('.order_open__form'));
                });
        },
        'all',
        '.order_open',
    );
const orderTxt = {
    gratis: 'Gratis!',
    pkt: ' pkt.',
    gross: ' brutto',
    day: ' dzieĹ ',
    days: ' dni ',
    hour: ' godz. ',
    hours: ' godz. ',
    minutes: ' min',
    time_pick1: 'Przewidywana dostawa ',
    time_pick2: 'Przewidywana dostawa ',
    time_pick3: 'Odbierz zamĂłwienie za ',
    time_pick4: 'Odbierz zamĂłwienie - ',
    time_pick5: 'Przewidywana dostawa - ',
    time_pick5de: '',
    time_pick6: 'ZamĂłwienie bÄdzie gotowe do odbioru natychmiast po przyjÄciu zamĂłwienia',
    shipping0: 'Dzisiaj',
    shipping1: 'PoniedziaĹek',
    shipping2: 'Wtorek',
    shipping3: 'Ĺroda',
    shipping4: 'Czwartek',
    shipping5: 'PiÄtek',
    shipping6: 'Sobota',
    shipping7: 'Niedziela',
    shipping8: 'jutro',
    servicesError: 'WystÄpiĹ problem z poĹÄczeniem. Za chwilÄ nastÄpi ponowna prĂłba poĹÄczenia.',
},
    orderTxtShipping = [
        orderTxt.shipping0,
        orderTxt.shipping1,
        orderTxt.shipping2,
        orderTxt.shipping3,
        orderTxt.shipping4,
        orderTxt.shipping5,
        orderTxt.shipping6,
        orderTxt.shipping7,
    ];
var activeObject;
function passAction() {
    activeObject.is('a')
        ? (window.location = activeObject.attr('href'))
        : activeObject.closest('form').submit();
}
function setUnload() {
    $(window).bind('beforeunload', function (e) {
        return ((e = e || window.event).returnValue = confirmmessage), confirmmessage;
    });
}
function order2_input_valid() {
    $('.order2_terms_wrapper input').each(function () {
        $(this).is(':checked') || $(this).parent().parent().addClass('required');
    }),
        $('.order2_terms_wrapper input').not(':checked').length > 0
            ? $('input.order2_button_order, input.order2_button_next').addClass('terms_required')
            : $('input.order2_button_order, input.order2_button_next').removeClass('terms_required');
}
function order2_terms_valid() {
    const e = document.querySelector('.order2_info1_sub_phone.--no-phone');
    if (e) {
        e.scrollIntoView({ behavior: 'smooth', block: 'start' });
        document.getElementById('order2TelInput').focus();
    } else
        $('input.order2_button_order').is('.terms_required')
            ? order2_input_valid()
            : ($(window).unbind('beforeunload'),
                $('#ajaxLoadSite,#ajaxLoadSite_cover').show(),
                $('form.order2_form').submit());
}
(orderTxt.xpress1 = 'Musisz podaÄ szczegĂłĹy dotyczÄce sposobu dostawy'),
    (orderTxt.xpress2 = 'Kurier ekspresowy nie obsĹuguje Twojej okolicy '),
    (orderTxt.xpress3 =
        'WystÄpiĹ bĹÄd zewnÄtrznego serwisu firmy kurierskiej. ProszÄ skontaktowaÄ siÄ z obsĹugÄ sklepu lub zmieniÄ formÄ dostawy. '),
    (orderTxt.week1 = ' tydzieĹ'),
    (orderTxt.week2 = ' tygodnie'),
    (orderTxt.week3 = ' tygodni'),
    (orderTxtWeek = [orderTxt.week3, orderTxt.week1, orderTxt.week2]),
    (orderTxt.selectDeliveryMethod = 'Wybierz opcjÄ dostawy'),
    (orderTxt.selectPaymentMethod = 'Wybierz formÄ pĹatnoĹci'),
    app_shop.run(
        function () {
            app_shop.fn.ajaxLoadSite(1),
                app_shop.fn.ajaxLoadSiteMessage(order_send_preloadertxt),
                $('#ajaxLoadSite,#ajaxLoadSite_cover').hide(),
                setUnload(),
                $('input[type="submit"], a, button[type="submit"]')
                    .not(
                        'form.order2_form a, form.order2_form input, form.order2_form button, form[action="settings.php"] button, a.progress__item',
                    )
                    .click(function (e) {
                        return (
                            e.stopPropagation(),
                            (activeObject = $(this)),
                            (dialogHTML = `<div id="menu_notice"><h2>${confirmwarning}</h2><p>${confirmmessage2}</p></div>`),
                            Modal({
                                html: `<div id="menu_notice" class="menu_notice"><h2>${confirmwarning}</h2><p>${confirmmessage2}</p><div class="menu_notice__buttons"><a href="#stop" class="menu_notice__button --stop btn --solid">${stop_order_button}</a><a href="#continue" class="menu_notice__button --continue btn --solid">${continue_order_button}</a></div></div>`,
                                classList: '--order2-notice',
                                afterShow: (e, t) => {
                                    e
                                        .querySelector('.menu_notice__button.--continue')
                                        .addEventListener('click', e => (e.preventDefault(), t.closeModal(), !1)),
                                        e
                                            .querySelector('.menu_notice__button.--stop')
                                            .addEventListener(
                                                'click',
                                                e => (
                                                    e.preventDefault(), $(window).unbind('beforeunload'), passAction(), !1
                                                ),
                                            );
                                },
                            }),
                            !1
                        );
                    }),
                $('input.order2_button_order, input.order2_button_next').click(function () {
                    return order2_terms_valid(), !1;
                }),
                $(
                    'a.n57856_orderlink, a.n57856_nextlink, a.order2_button_change, a.order2_button_change_stock, a.order2_button_change_address, a.order2_button_change2,  a.order2_change_delivery_link',
                ).click(function () {
                    return (
                        $(window).unbind('beforeunload'),
                        $(this).is('input.order2_button_order, a.n57856_orderlink') &&
                        $('#ajaxLoadSite,#ajaxLoadSite_cover').show(),
                        !0
                    );
                }),
                $('input.order2_button_order').on('mouseover', function () {
                    order2_input_valid();
                }),
                $('.order2_terms_wrapper input').click(function () {
                    $(this).parent().parent().removeClass('required');
                }),
                'undefined' != typeof only_virtual &&
                'yes' == only_virtual &&
                $('div.wrappers_price').hide();
        },
        'all',
        'form.order2_form',
        !0,
    );
var confirmmessage =
    'Twoje zamĂłwienie nie zostaĹo jeszcze zĹoĹźone. Opuszczenie tej strony oznacza porzucenie zamĂłwienia. PamiÄtaj, Ĺźe wracajÄc do zamĂłwienia za jakiĹ czas niektĂłre z produktĂłw lub cen mogÄ byÄ juĹź nieaktualne.',
    confirmmessage2 =
        'Twoje zamĂłwienie nie zostaĹo jeszcze zĹoĹźone. Dopiero przejĹcie do kolejnego etapu zamĂłwienia oznacza wysĹanie go do realizacji. PamiÄtaj, Ĺźe wracajÄc do zamĂłwienia za jakiĹ czas niektĂłre z produktĂłw lub cen mogÄ byÄ juĹź nieaktualne.',
    confirmwarning = 'OstrzeĹźenie',
    order_send_preloadertxt = 'Trwa skĹadanie zamĂłwienia',
    stop_order_button = 'Przerwij skĹadanie zamĂłwienia ',
    continue_order_button = 'Kontynuuj skĹadanie zamĂłwienia ';
const order2Txt = { week1: ' tydzieĹ', week2: ' tygodnie', week3: ' tygodni' };
order2TxtWeek = [orderTxt.week3, orderTxt.week1, orderTxt.week2];
var eInvoice_dialog = function () {
    if (!$('#e-invoice_dialog').length) return !1;
    app_shop.fn.order2eInvoice = new Modal({
        element: $('#e-invoice_dialog'),
        classList: '--medium',
    });
};
app_shop.run(
    function () {
        1 == $('input[name="invoice"]:checked').val() && eInvoice_dialog(),
            $(document).on('change', 'input[name="invoice"]', function () {
                1 == $(this).val() && eInvoice_dialog();
            }),
            $(document).on('click', '#e-invoice_dialog button', function () {
                return (
                    $('input#order2_document_e-invoice').prop('checked', !0),
                    app_shop.fn.order2eInvoice.closeModal(),
                    !1
                );
            });
    },
    'all',
    '#e-invoice_dialog',
),
    app_shop.run(
        function () {
            $('a#toggle_comments_button').on('click', function () {
                return $(this).parent().toggleClass('open'), !1;
            });
        },
        'all',
        '#toggle_comments_button',
    ),
    app_shop.run(
        function () {
            orderTxt.week3, orderTxt.week1, orderTxt.week2;
            const e = [orderTxt.days, orderTxt.day, orderTxt.days],
                t = $('.shipping_time_division').data('weeks'),
                i = $('.shipping_time_division').data('days'),
                n = $('.shipping_time_division').data('week_day'),
                r = $('.shipping_time_division').data('today');
            0 === parseInt(t, 10)
                ? ($('.order2__division_literal').hide(),
                    r
                        ? $('.shipping_time_division strong').html(orderTxtShipping[0])
                        : $('.shipping_time_division strong').html(orderTxtShipping[parseInt(n, 10)]))
                : $('.shipping_time_division strong').html(
                    app_shop.fn.changeLiteral(parseInt(i, 10), e, !1),
                );
        },
        'all',
        '.shipping_time_division',
    ),
    app_shop.run(
        function () {
            $('#order2_products .ordered-files li a').on('click', function (e) {
                e.preventDefault();
                const t = $(this),
                    i = t.attr('href'),
                    n = t.parent().find('span').text();
                let r = new Image();
                return (
                    (r.src = i),
                    (r.onload = function () {
                        Modal({
                            html: `<div id="ui-dialogimg"><img alt="${n}" src="${i}" /></div>`,
                            classList: '--medium',
                        });
                    }),
                    (r.onerror = function () {
                        window.open(i);
                    }),
                    !1
                );
            });
        },
        'all',
        '#order2_products .ordered-files li a',
    ),
    app_shop.run(
        function () {
            document.querySelectorAll('.ordered_product__visible_in_group').forEach(e => {
                e.addEventListener('click', e => {
                    e.preventDefault();
                    const { target: t } = e,
                        i = t.closest('.ordered_product').getAttribute('data-group-id');
                    return (
                        document.querySelectorAll(`.ordered_product[data-group-id="${i}"]`).forEach(e => {
                            e.classList.toggle('--open');
                        }),
                        !1
                    );
                });
            });
        },
        'all',
        '.ordered_product',
    ),
    app_shop.run(function () {
        'undefined' != typeof only_virtual &&
            'true' == only_virtual &&
            $('#prepaid_delivery_list').hide();
    }, 'all'),
    (jQuery.fn.hasScrollBar = function () {
        return this.width() < this.find('>*:first').width();
    }),
    (app_shop.vars.cmpItemWidth = 200),
    (app_shop.fn.cmpItemWidth = function (e, t) {
        $('#compareCss').remove();
        var i = $('#product_compare_list').width() / e - 2 * t;
        (app_shop.vars.cmpItemWidth = i),
            $('head').append("<style id='compareCss'>.compare .item_width{ width:" + i + 'px; }</style>'),
            setTimeout(function () {
                $('#product_compare_list').hasScrollBar()
                    ? $('#product_compare_list_wrapper').addClass('hasScrollBar')
                    : $('#product_compare_list_wrapper').removeClass('hasScrollBar');
            }, 500);
    }),
    app_shop.run(
        function () {
            app_shop.fn.cmpItemWidth(3, 1);
        },
        1,
        '#product_compare_list',
    ),
    app_shop.run(
        function () {
            app_shop.fn.cmpItemWidth(4, 1);
        },
        2,
        '#product_compare_list',
    ),
    app_shop.run(
        function () {
            app_shop.fn.cmpItemWidth(4, 1);
        },
        3,
        '#product_compare_list',
    ),
    app_shop.run(
        function () {
            app_shop.fn.cmpItemWidth(5, 1);
        },
        4,
        '#product_compare_list',
    ),
    app_shop.run(
        function () {
            var e = $('#product_compare_list_wrapper'),
                t = $('#product_compare_list'),
                i = function () {
                    t.scrollLeft() + t.innerWidth() >= t[0].scrollWidth
                        ? e.addClass('hideNext')
                        : e.removeClass('hideNext'),
                        0 == t.scrollLeft() ? e.addClass('hidePrev') : e.removeClass('hidePrev');
                };
            $('.configure a[href="#differences"]').click(function () {
                var e = $(this),
                    i = e.data('toggletxt').trim(),
                    n = decodeURIComponent(e.html().trim());
                if ((e.html(i), e.data('toggletxt', n), $('#product_compare_list .highlight').size()))
                    return $('#product_compare_list .highlight').removeClass('highlight'), !1;
                t
                    .find('tr')
                    .not('.cmp_product')
                    .each(function () {
                        $.unique(
                            $(this)
                                .find('td')
                                .map(function () {
                                    return $(this).text().trim().toLowerCase();
                                }),
                        ).size() > 1 && $(this).addClass('highlight');
                    }),
                    $.unique(
                        $('.list_traits li.producer div').map(function () {
                            return $(this).text().trim().toLowerCase();
                        }),
                    ).size() > 1 && $('.list_traits li.producer').addClass('highlight'),
                    $.unique(
                        $('.list_traits li.barcode div').map(function () {
                            return $(this).text().trim().toLowerCase();
                        }),
                    ).size() > 1 && $('.list_traits li.barcode').addClass('highlight');
            }),
                $('.configure_item a[data-position]').click(function () {
                    var n = $(this),
                        r = n.data('position') - 1;
                    return (
                        $('#product_compare_list tr').each(function () {
                            $(this).find('td').eq(r).toggleClass('hideCol');
                        }),
                        setTimeout(function () {
                            t.hasScrollBar() ? e.addClass('hasScrollBar') : e.removeClass('hasScrollBar'), i();
                            var r = n.data('toggletxt').trim(),
                                o = decodeURIComponent(n.html().trim());
                            n.html(r), n.data('toggletxt', o);
                        }, 300),
                        !1
                    );
                }),
                t.bind('scroll', function () {
                    i();
                }),
                t.scrollLeft(0),
                $('.navigation .prev').click(function () {
                    t.animate({ scrollLeft: '-=' + app_shop.vars.cmpItemWidth }, 500);
                }),
                $('.navigation .next').click(function () {
                    t.animate({ scrollLeft: '+=' + app_shop.vars.cmpItemWidth }, 500);
                });
        },
        'all',
        '#product_compare_list',
    ),
    app_shop.run(
        function () {
            $('#product_stocks_list .sizes_wrapper').wrappTableLayout({ numCol: 3 });
        },
        [3, 4],
        '#product_stocks_list',
    ),
    app_shop.run(
        function () {
            $('#product_stocks_list .sizes_wrapper').wrappTableLayout({ numCol: 2 });
        },
        2,
        '#product_stocks_list',
    ),
    app_shop.run(
        function () {
            $('#product_stocks_list .sizes_wrapper').wrappTableLayout({ numCol: 1 });
        },
        1,
        '#product_stocks_list',
    ),
    $(function () {
        $('.show_tab').click(function () {
            return (
                1 == app_shop.vars.view &&
                ($(this).toggleClass('tab_hidden').toggleClass('tab_visible'),
                    $($(this).attr('href')).slideToggle('fast')),
                !1
            );
        });
    }),
    $(document).on('click', '#photos_slider .photos__link, #photos_nav a.--more', function (e) {
        e.preventDefault();
        const t = $(this).hasClass('--more')
            ? parseInt($(this).data('slick-index'), 10)
            : parseInt($(this).parent().data('slick-index'), 10);
        return app_shop.vars.projectorPhotoSwipe.init(t), document.activeElement.blur(), !1;
    }),
    app_shop.run(
        function () {
            const e = new AbortController();
            let t = 0;
            function i() {
                const t = document.querySelectorAll(
                    '.photos__slider .photos___slider_wrapper:not(.slick-initialized) img',
                );
                t.forEach(i => {
                    i.addEventListener(
                        'load',
                        i => {
                            if ([...t].every(e => e.complete)) {
                                e.abort();
                                const t = app_shop.vars?.projectorSlider?.slider;
                                return (
                                    t?.slick('refresh'),
                                    void (function (e) {
                                        const t = e?.get(0);
                                        t &&
                                            (t.parentElement?.setAttribute('style', ''),
                                                t.parentElement?.style?.removeProperty('--slick-min-height'));
                                    })(t)
                                );
                            }
                        },
                        { signal: e.signal },
                    );
                });
            }
            window.addEventListener('DOMContentLoaded', () => {
                i(),
                    (app_shop.vars.projectorSlider = new ProjectorSlider({
                        selector: '.photos__slider .photos___slider_wrapper:not(.slick-initialized)',
                        callbackBefore: e => {
                            e.on('init', function () {
                                0 === t &&
                                    (!(function (e) {
                                        const t = e?.get(0);
                                        let i = t?.offsetHeight;
                                        'number' == typeof i &&
                                            0 !== i &&
                                            t &&
                                            ((i = `${i}px`),
                                                t.parentElement?.style?.setProperty('min-height', i),
                                                t.parentElement?.style?.setProperty('--slick-min-height', i));
                                    })(e),
                                        ++t);
                            })
                                .on('beforeChange', function () {
                                    $('#photos_slider').removeAttr('data-skeleton');
                                })
                                .on('afterChange', function () {
                                    const i = document.querySelector(
                                        '.photos__figure.--video.slick-active video[data-src]',
                                    );
                                    if (i) {
                                        const t = i.getAttribute('data-src');
                                        i.setAttribute('src', t),
                                            i.removeAttribute('data-src'),
                                            i.addEventListener('loadeddata', function () {
                                                e.slick('setOption', '', '', !0);
                                            });
                                    }
                                    const n = document.querySelector(
                                        '.photos__figure.--video:not(.slick-active) video[src]',
                                    );
                                    n && n.pause(), 1 === t && (e.slick('refresh'), ++t);
                                })
                                .on('lazyLoaded', function () {
                                    $('#photos_slider').removeAttr('data-skeleton');
                                })
                                .on('lazyLoadError', function () {
                                    $('#photos_slider').removeAttr('data-skeleton');
                                });
                        },
                    }));
            }),
                (app_shop.vars.projectorPhotoSwipe = new ProjectorPhotoSwipe({
                    selector: '#photos_slider .photos__figure:not(.slick-cloned) .photos__link',
                    pswp: '.pswp',
                })),
                $('#photos_slider .photos__link.--video')
                    .off()
                    .on('click', function (e) {
                        return e.preventDefault(), !1;
                    });
        },
        'all',
        '#photos_slider',
        !0,
    ),
    (app_shop.txt.txt_111709_1 = 'UdostÄpnij na Facebooku'),
    (app_shop.txt.txt_111709_2 = 'Pobierz zdjÄcie'),
    (ProjectorPhotoSwipe = function (e) {
        (this.params = e),
            (this.defaults = {
                timeToIdle: !1,
                index: 0,
                zoomEl: !1,
                fullscreenEl: !1,
                shareEl: !1,
                history: !1,
                focus: !1,
                showAnimationDuration: 0,
                hideAnimationDuration: 0,
                shareButtons: !1,
                closeOnScroll: !1,
                captionEl: !1,
                clickToCloseNonZoomable: !1,
                closeElClasses: ['caption', 'ui'],
            }),
            (this.init = e => {
                const { selector: t, options: i, pswp: n, itemsArray: r, thumbnailsFunc: o } = this.params;
                (this.settings = { ...this.defaults, ...i }),
                    (this.selector = t),
                    (this.pswp = document.querySelectorAll(n)[0]),
                    (this.items = []);
                let s = document.createElement('span');
                s.classList.add('photoSwipe_overlay'),
                    document.body.appendChild(s),
                    document.querySelector('.photoSwipe_overlay').addEventListener('click', function () {
                        document.querySelector('.pswp__button--close').click();
                    }),
                    r ? (this.items = r) : this.setItemsArray(),
                    e && (this.settings.index = e);
                const a = new PhotoSwipe(this.pswp, PhotoSwipeUI_Default, this.items, this.settings);
                a.listen('gettingData', function (e, t) {
                    if (t.w < 1 || t.h < 1) {
                        const e = new Image();
                        (e.onload = function () {
                            (t.w = this.width), (t.h = this.height), a.updateSize(!0);
                        }),
                            (e.src = t.src);
                    }
                }),
                    a.init(),
                    'function' == typeof o ? o(a) : this.setThumbnails(a),
                    document.querySelector('.photos__figure.--video video[src]') &&
                    document.querySelector('.photos__figure.--video video[src]').pause();
            }),
            (this.setItemsArray = () => {
                [].slice.call(document.querySelectorAll(this.selector)).forEach(e => {
                    const t =
                        /\.webp$/i.test(e.querySelector('img')?.currentSrc) || !e.getAttribute('data-href'),
                        i = e.classList.contains('--video')
                            ? {
                                html: `<video controls="controls" autoplay="autoplay" data-src="${e.getAttribute(
                                    'href',
                                )}"></video>`,
                            }
                            : {
                                src: t ? e.getAttribute('href') : e.getAttribute('data-href'),
                                w: e.getAttribute('data-width'),
                                h: e.getAttribute('data-height'),
                            };
                    this.items.push(i);
                });
            }),
            (this.setThumbnails = e => {
                const t = document.createElement('div');
                t.classList.add('photoSwipe_innerthumbs'),
                    document.querySelector('.pswp').appendChild(t),
                    (document.querySelector('div.photoSwipe_innerthumbs').innerHTML = [
                        ...document.querySelectorAll(
                            '#photos_slider .photos__figure:not(.slick-cloned) .photos__photo',
                        ),
                    ]
                        .map(
                            e =>
                                `<figure class="photos__figure --nav">\n      <span class="photos__link --nav">${e.outerHTML}</span>\n    </figure>`,
                        )
                        .join('')),
                    document.querySelector('.photos__link.--video video') &&
                    (document.querySelector('div.photoSwipe_innerthumbs').innerHTML +=
                        '<figure class="photos__figure --nav --video">\n        <span class="photos__link --nav --video"></span>\n      </figure>'),
                    document
                        .querySelectorAll('div.photoSwipe_innerthumbs .photos__photo')
                        .forEach(e => e.classList.add('--nav')),
                    1 === document.querySelectorAll('#photos_slider .photos__photo').length &&
                    document.querySelector('div.photoSwipe_innerthumbs').classList.add('--one');
                const i = document.querySelectorAll('div.photoSwipe_innerthumbs .photos__link'),
                    n = e.getCurrentIndex();
                i[n].classList.add('--active');
                const r =
                    document
                        .querySelector('div.photoSwipe_innerthumbs .photos__link.--active')
                        .getBoundingClientRect().top -
                    document.querySelector('div.photoSwipe_innerthumbs').getBoundingClientRect().top +
                    document.querySelector('div.photoSwipe_innerthumbs').scrollTop;
                document.querySelector('div.photoSwipe_innerthumbs').scroll({ top: r, behavior: 'smooth' });
                let o = document.createElement('span');
                o.classList.add('photoSwipe_name'),
                    (o.innerHTML = `${document.querySelector('.product_name__name').innerText}`),
                    document.querySelector('.pswp__top-bar').append(o);
                const s = () => {
                    let e = document.createElement('span'),
                        t = document.querySelector('.pswp__counter').innerText;
                    (t = t.replaceAll(' ', '')),
                        (t = t.split('/')),
                        (t[0] = `<b>${t[0]}</b>`),
                        (e.innerHTML = t.join('/')),
                        (document.querySelector('.pswp__counter').innerHTML = ''),
                        document.querySelector('.pswp__counter').append(e);
                };
                s(),
                    4 == app_shop.vars.view &&
                    $('.photoSwipe_innerthumbs').slick({
                        mobileFirst: !0,
                        vertical: !0,
                        dots: !1,
                        arrows: !0,
                        infinite: !1,
                        prevArrow: '<a class="slick-prev" href=""><i class="icon-angle-up"></i></a>',
                        nextArrow: '<a class="slick-next" href=""><i class="icon-angle-down"></i></a>',
                        slidesToShow: 7,
                    }),
                    i.forEach(t => {
                        t.addEventListener('click', function () {
                            i.forEach(e => {
                                e.classList.remove('--active');
                            }),
                                this.classList.add('--active'),
                                e.goTo([...i].indexOf(this));
                        });
                        const n = t.querySelector('.photos__photo.slick-loading');
                        n &&
                            (n.setAttribute('src', n.getAttribute('data-lazy')),
                                n.removeAttribute('data-lazy'),
                                n.classList.remove('slick-loading'));
                    }),
                    e.listen('close', function () {
                        document
                            .querySelector('.photoSwipe_innerthumbs')
                            .parentNode.removeChild(document.querySelector('.photoSwipe_innerthumbs')),
                            document.body.removeChild(document.querySelector('.photoSwipe_overlay')),
                            document.querySelector('.pswp video[src]') &&
                            document.querySelector('.pswp video[src]').pause();
                    }),
                    e.listen('afterChange', function () {
                        const t = document.querySelectorAll('div.photoSwipe_innerthumbs .photos__link'),
                            i = e.getCurrentIndex();
                        t.forEach(e => {
                            e.classList.remove('--active');
                        }),
                            t[i].classList.add('--active');
                        const n =
                            document
                                .querySelector('div.photoSwipe_innerthumbs .photos__link.--active')
                                .getBoundingClientRect().top -
                            document.querySelector('div.photoSwipe_innerthumbs').getBoundingClientRect().top +
                            document.querySelector('div.photoSwipe_innerthumbs').scrollTop;
                        document
                            .querySelector('div.photoSwipe_innerthumbs')
                            .scroll({ top: n, behavior: 'smooth' });
                        const r = e.currItem.container.querySelector('video[data-src]');
                        if (r) {
                            const e = r.getAttribute('data-src');
                            r.setAttribute('src', e), r.removeAttribute('data-src');
                        }
                        document.querySelector('.pswp video[src]') &&
                            document.querySelector('.pswp video[src]').pause(),
                            s();
                    });
            });
    }),
    app_shop.run(
        function () {
            document.querySelector('.traits__all').addEventListener('click', function (e) {
                return (
                    e.preventDefault(),
                    document.querySelector('.traits').classList.add('--show'),
                    app_shop?.vars?.bLazy?.revalidate(),
                    !1
                );
            });
        },
        'all',
        '.traits__all',
        !0,
    ),
    (app_shop.fn.createExpressAutofillConsent = async (e = 'pin') => {
        const t = document.querySelector('#projector_form');
        if (!t) return !1;
        if (!app_shop.fn.checkProjectorData()) return !1;
        const i = new FormData(t),
            n = {};
        for (let [e, t] of i.entries()) n[e] = t;
        sessionStorage.setItem('productData', JSON.stringify(n));
        const r = !('product_virtual' !== product_data?.product_type),
            o = !('product_service' !== product_data?.product_type);
        return (
            app_shop.vars.isLogged
                ? await app_shop.fn.expChck.goStep('summary', {
                    previousStep: null,
                    virtualProduct: r,
                    serviceProduct: o,
                })
                : 'pin' === e
                    ? await app_shop.fn.expChck.goStep('login', {
                        previousStep: null,
                        virtualProduct: r,
                        serviceProduct: o,
                    })
                    : await app_shop.fn.expChck.goStep('loginServices', {
                        previousStep: null,
                        virtualProduct: r,
                        serviceProduct: o,
                    }),
            !1
        );
    }),
    app_shop.run(
        function () {
            const e = document.querySelector('#projector_express_checkout');
            e.addEventListener('click', async () => {
                e.classList.add('--loading'),
                    e.getAttribute('data-login') &&
                    sessionStorage.setItem('expressCheckoutLogin', e.getAttribute('data-login')),
                    e.getAttribute('data-type') &&
                    sessionStorage.setItem('expressCheckoutLoginType', e.getAttribute('data-type')),
                    await app_shop.fn.createExpressAutofillConsent(e.getAttribute('data-type')),
                    e.classList.remove('--loading');
            }),
                'true' === localStorage.getItem('expchckDeviceRegistered') &&
                'false' !== localStorage.getItem('expchckSaveDevice') &&
                e.classList.add('--web-authn');
        },
        'all',
        '#projector_express_checkout',
        !0,
    ),
    app_shop.run(
        async function () {
            if (!app_shop.fn.webAuthnExpChck) return;
            (await app_shop.fn.webAuthnExpChck.checkBrowserSupport()) &&
                document.documentElement.addEventListener('change', e => {
                    const { target: t } = e;
                    if (t.closest('#expchck_save_device')) {
                        const e = document.querySelector('#projector_express_checkout');
                        if (!e) return;
                        const { checked: i } = t,
                            n = i && 'true' === localStorage.getItem('expchckDeviceRegistered');
                        e.classList.toggle('--web-authn', n);
                    }
                });
        },
        'all',
        '#projector_express_checkout',
    ),
    app_shop.run(
        function () {
            (app_shop.fn.projectorForm = new ProjectorForm()), app_shop.fn.projectorForm.init();
        },
        'all',
        '#projector_form',
        !0,
    ),
    (app_shop.fn.getExpressCheckoutData = async e => {
        if (
            'undefined' != typeof expressCheckoutApi &&
            'function' == typeof expressCheckoutApi.initCheckout
        ) {
            const t = (e.target ? e.target : e)
                .closest('.projector_oneclick__item')
                .getAttribute('data-id'),
                i = new URLSearchParams(new FormData(document.getElementById('projector_form')));
            await expressCheckoutApi.initCheckout(t, i);
        }
    }),
    (app_shop.fn.validateProductConflict = () =>
        0 === document.querySelectorAll('#projector_form .--conflict').length),
    (app_shop.fn.checkProjectorData = e => {
        if (!app_shop.fn.projectorForm.sizeSelected())
            return e || app_shop.fn.projectorForm.alertProjector(), !1;
        if (!app_shop.fn.validateProductConflict())
            return (
                Alertek.show_alert(
                    projectorObj.txt['Produkt o wybranej konfiguracji nie istnieje. Wybierz inny wariant.'],
                ),
                !1
            );
        if (!app_shop.fn.bundleVersionSelected(e)) return !1;
        if (!app_shop.fn.bundleSizeSelected(e)) return !1;
        const t = document.querySelector('.projector_buy__more');
        t && t.classList.add('--active');
        document
            .querySelectorAll('.projector_buy__number, .projector_buy__number .f-dropdown-toggle')
            .forEach(e => {
                e.classList.remove('--disabled');
            });
        const i = document.querySelector('h1.product_name__name'),
            n = document.querySelector('.projector_oneclick');
        document.querySelectorAll('.projector_oneclick__item').forEach(e => {
            i && 0 === i.textContent.length
                ? (e.classList.remove('--checked'), n && n.setAttribute('data-hide', !0))
                : e.classList.add('--checked');
        });
        const r = document.querySelector('.projector_inpost_pay');
        return r && r.classList.add('--checked'), !0;
    });
const expressCheckoutApiClickEvent = e =>
    !e.target.closest('.projector_oneclick__item').classList.contains('--loading') &&
    !!app_shop.fn.checkProjectorData();
app_shop.run(
    function () {
        document.querySelectorAll('.projector_oneclick__item').forEach(e => {
            if (
                (e.addEventListener('click', expressCheckoutApiClickEvent),
                    'undefined' != typeof expressCheckoutApi &&
                    'function' == typeof expressCheckoutApi.renderButton)
            ) {
                const t = e.getAttribute('data-id');
                expressCheckoutApi.renderButton(t, e);
            }
        });
    },
    'all',
    '.projector_oneclick__item',
    !0,
);
const inpostPayClickEvent = async e => {
    const t = e.target.closest('.projector_inpost_pay');
    if (t.classList.contains('--loading')) return;
    if (t.querySelector('inpost-izi-button[baskedlinked="true"]')) return;
    if (!app_shop.fn.checkProjectorData()) return;
    const { basketByFront: i } = t.dataset;
    if ('1' !== i) return;
    const n = e.target.closest('.inpostizi-bind-button-body');
    if (!n) return;
    t.classList.add('--loading'), e.stopImmediatePropagation(), e.preventDefault();
    const r = document.querySelector('#projector_form'),
        o = new FormData(r),
        s = r.getAttribute('action');
    await fetch(s, { method: 'POST', body: o }),
        n.dispatchEvent(new Event('click', { bubbles: !0, cancelable: !0 })),
        t.classList.remove('--loading'),
        'function' == typeof menu_basket_cache
            ? menu_basket_cache()
            : 'function' == typeof app_shop.fn.menu_basket_cache && app_shop.fn.menu_basket_cache();
};
app_shop.run(
    () => {
        document
            .querySelector('.projector_inpost_pay')
            .addEventListener('click', inpostPayClickEvent, !0),
            'function' == typeof renderInpostPayButton &&
            renderInpostPayButton('product', 'inpostPay', product_data.product_id);
    },
    'all',
    '.projector_inpost_pay',
    !0,
),
    app_shop.run(
        function () {
            (app_shop.vars.curr_url_projector = location.pathname),
                $(window).on('popstate', function () {
                    app_shop.vars.curr_url_projector !== location.pathname &&
                        (window.location.href = window.location.href);
                });
        },
        'all',
        '#projector_form',
    );
const projectorFormatPrice = e =>
    format_price(e.price, {
        mask: app_shop.vars.currency_format,
        currency: e.currency,
        currency_space: app_shop.vars.currency_space,
        currency_before_price: app_shop.vars.currency_before_value,
    });
function updateBuyNumberDetails() {
    const e = document.querySelector('#projector_buy_section .projector_buy__number_amounts'),
        t = e?.querySelector('.number_amount'),
        i = e?.querySelector('.number_unit');
    e &&
        i &&
        t &&
        projectorObj?.currentSizeObj?.amount > 0 &&
        ((t.textContent = projectorObj.currentSizeObj.amount + ' '),
            (i.textContent =
                projectorObj.currentSizeObj.amount > 1
                    ? projectorObj.currentSizeObj.unit_plural
                    : projectorObj.currentSizeObj.unit + ' '),
            e.classList.remove('d-none'));
}
function projectorEndStartCallback() {
    app_shop.fn.updateYouSave();
    const { price: e } = projectorObj.currentSizeObj;
    if (void 0 !== e && $('#projector_rebateNumber').length && void 0 !== e.rebateNumber) {
        $('#projector_form .projector_multipack').addClass('--active').removeClass('--hide');
        const { rebateNumber: t } = e,
            i = !!projectorObj.rebateThreshold && parseFloat(projectorObj.rebateThreshold, 10);
        $('.projector_multipack__item').length > 1
            ? $('.projector_multipack__item').each(function (e) {
                $(this)
                    .find('.projector_multipack__price')
                    .text(
                        'net' === app_shop.vars.priceType
                            ? t.items[e].price_net_formatted
                            : t.items[e].price_formatted,
                    ),
                    i && i === parseFloat($(this).data('value'), 10)
                        ? $(this).find('input').prop('checked', !0)
                        : $(this).find('input').prop('checked', !1);
            })
            : ($('.projector_multipack__price').text(
                'net' === app_shop.vars.priceType ? t.nextprice_net_formatted : t.nextprice_formatted,
            ),
                i && i === parseFloat($('.projector_multipack__item').data('value'), 10)
                    ? $('.projector_multipack__item input').prop('checked', !0)
                    : $('.projector_multipack__item input').prop('checked', !1));
    } else
        $('#projector_rebateNumber').length &&
            $('#projector_form .projector_multipack').addClass('--hide');
    'undefined' != typeof expressCheckoutApi &&
        'function' == typeof expressCheckoutApi.refreshInitData &&
        expressCheckoutApi.refreshInitData(),
        app_shop.fn.checkProjectorData(!0);
    const { amount: t } = projectorObj.currentSizeObj,
        i = document.getElementById('projector_number');
    if (void 0 !== t && +t > 0 && i) {
        const e =
            i.getAttribute('data-minimum-quantity-subscription') ||
            i.getAttribute('data-minimum-quantity') ||
            i.getAttribute('data-sellby'),
            n = document.getElementById('projector_form');
        +e > +t && n.classList.add('disable');
    }
    updateBuyNumberDetails();
}
function projectorEndInitFunctionCallback() { }
(app_shop.fn.updateYouSave = () => {
    ($('#projector_form[data-collection]').length &&
        1 === $('#projector_form[data-collection] .projector_bundle__checkbox:checked').length) ||
        'true' == projectorObj.currentSizeObj.phone_price ||
        'undefined' == typeof yousaveTmp ||
        isNaN(yousaveTmp)
        ? $('#projector_price_yousave').hide()
        : ($('#projector_price_yousave')
            .show()
            .html(
                `<span class="projector_prices__percent_before">${projectorObj.txt.oszczedzasz
                }</span><span class="projector_prices__percent_value">${+yousave_percentTmp < 1 ? yousave_percentTmp : yousave_percentTmp.split('.')[0]
                }</span><span class="projector_prices__percent_after">${'product_bundle' === product_data.product_type &&
                    +projectorObj.currentSizeObj.bundle_price.percent_diff > 0 &&
                    +projectorObj.currentSizeObj.bundle_price.amount_diff_gross > 0
                    ? document.querySelector('.projector_details[data-collection]')
                        ? projectorObj.txt.nawias_end_collection
                        : projectorObj.txt.nawias_end_bundle
                    : projectorObj.txt.nawias_end
                }</span>`,
            ),
            $('#projector_price_maxprice_wrapper').show());
}),
    app_shop.run(
        function () {
            (app_shop.fn.productStocks = new ProductStocks({
                stockLinkSelector: '.projector_stocks__info.--link',
            })),
                app_shop.fn.productStocks.init();
        },
        'all',
        '.projector_stocks__info.--link',
        !0,
    ),
    app_shop.run(
        function () {
            $('.projector_instalments__link').on('click', function () {
                return (
                    $('.projector_instalments').toggleClass('--active'), app_shop.vars.bLazy.revalidate(), !1
                );
            });
        },
        'all',
        '.projector_instalments__link',
        !0,
    );
var projectorv3_disable_ajax = '1';
(projectorObj = new projectorClass()),
    (projectorObj.txt.additional_texts = ''),
    (projectorObj.txt.za = ' za '),
    (projectorObj.txt.taniej = '% ('),
    (projectorObj.txt.oszczedzasz = '(ZniĹźka '),
    (projectorObj.txt.wzestawie = '), kupujÄc w zestawie. '),
    (projectorObj.txt.niedostepny = 'Produkt niedostÄpny'),
    (projectorObj.txt.tylkotel = 'Cena na telefon. Skontaktuj siÄ ze sprzedawcÄ.'),
    (projectorObj.txt.tylko_punkty = 'Produkt dostÄpny tylko w programie lojalnoĹciowym.'),
    (projectorObj.txt.za_malo_punktow = 'Nie masz wystarczajÄcej iloĹci punktĂłw'),
    (projectorObj.txt.gratis = 'WysyĹka gratis!'),
    (projectorObj.txt.niemastanu = 'Produkt niedostÄpny'),
    (projectorObj.txt.status_24 = '24 godz.'),
    (projectorObj.txt.status_48 = '48 godz.'),
    (projectorObj.txt.status_natychmiast = 'Natychmiast'),
    (projectorObj.txt.day = ' dzieĹ '),
    (projectorObj.txt.days = ' dni  '),
    (projectorObj.txt.hour = ' godz.'),
    (projectorObj.txt.hours = ' godz. '),
    (projectorObj.txt.min = ' min '),
    (projectorObj.txt.mins = ' min. '),
    (projectorObj.txt.proc = '%'),
    (projectorObj.txt.wybrany_rozmiar = 'Rozmiar:'),
    (projectorObj.txt.wysylka = 'WysyĹka '),
    (projectorObj.txt.wysylka_za = 'WysyĹka w ciÄgu '),
    (projectorObj.txt.shipmentIn = 'WysyĹka za '),
    (projectorObj.txt.tomorrow = ' jutro'),
    (projectorObj.txt.dostepny = ''),
    (projectorObj.txt.dostepny_za = ' za '),
    (projectorObj.txt.pkt = ' pkt.'),
    (projectorObj.txt.status_amount_full = 'wiÄksza iloĹÄ'),
    (projectorObj.txt.status_amount_null = 'brak w magazynie'),
    (projectorObj.txt.forpointsonly = 'Produkt moĹźesz kupiÄ za punkty.'),
    (projectorObj.txt.disable_desc = 'Skontaktuj siÄ z nami.'),
    (projectorObj.txt.choiceSize = 'Wybierz rozmiar'),
    (projectorObj.txt.maksymalnie = 'Maksymalnie moĹźesz dodaÄ'),
    (projectorObj.txt.minimalnie = 'Minimalnie musisz zamĂłwiÄ '),
    (projectorObj.txt.brak_magazyn = 'Brak na magazynie'),
    (projectorObj.txt.koszt_od = 'Koszt od '),
    (projectorObj.txt.wysylka_total_begin = '<br/>(z tow. z koszyka '),
    (projectorObj.txt.wysylka_total_end = ')'),
    (projectorObj.txt.nawias_end_collection = '% kupujÄc w kolekcji)'),
    (projectorObj.txt.nawias_end_bundle = '% kupujÄc w zestawie)'),
    (projectorObj.txt.nawias_end = '%)'),
    (projectorObj.txt.gratis_produkt = 'Gratis!'),
    (projectorObj.txt.virtual_inbasket = 'Produkt znajduje siÄ juĹź w koszyku'),
    (projectorObj.txt.infinity = ''),
    (projectorObj.txt.ilosc_mm = 'Aktualnie w naszym magazynie mamy <b>%d</b>.'),
    (projectorObj.txt.ilosc_mo = 'Kolejne <b>%d</b> moĹźemy sprowadziÄ na zamĂłwienie.'),
    (projectorObj.txt.ilosc_mo_inf = 'DowolnÄ iloĹÄ moĹźemy sprawadziÄ na zamĂłwienie.'),
    (projectorObj.txt.size_select_functionality = '0'),
    (projectorObj.txt.sizes_projector_functionality = '1'),
    (projectorObj.txt.size_select_label = 'Rozmiar:'),
    (projectorObj.txt.size_select_tell_availability = 'Powiadom o dostÄpnoĹci'),
    (projectorObj.txt.size_select_last_unit = 'Ostatnia sztuka!'),
    (projectorObj.txt.size_select_few_last_units = 'Ostatnie sztuki!'),
    (projectorObj.txt.order_by = 'ZamĂłw do '),
    (projectorObj.txt.it_will_ship_today = ' to wyĹlemy dzisiaj'),
    (projectorObj.txt['Produkt o wybranej konfiguracji nie istnieje. Wybierz inny wariant.'] =
        'Produkt o wybranej konfiguracji nie istnieje. Wybierz inny wariant.');
var Projector_txt_maksymalnie = 'Maksymalnie moĹźesz zamĂłwiÄ: ',
    Projector_txt_minimalnie = projectorObj.txt.minimalnie,
    Projector_txt_brak_magazyn = 'Brak na magazynie',
    Projector_txt_produkt_niedostepny = 'Produkt niedostÄpny',
    Projector_txt_podajilosc = 'Podaj iloĹÄ dla wybranego rozmiaru',
    Projector_txt_zalogujsie = 'Zaloguj siÄ',
    Projector_txt_closedialog = '',
    txt_raty_button1 = 'Oblicz raty wybranego produktu',
    txt_raty_button2 = 'Oblicz raty wraz z kwotÄ z koszyka ',
    txt_62619_cms_table = 'Tabela rozmiarĂłw',
    txt_toltip_1 =
        'Cena najtaĹszej z dostÄpnych form wysyĹki z uwzglÄdnieniem twojego koszyka. PeĹnÄ listÄ cen i kurierĂłw otrzymasz podczas skĹadania zamĂłwienia.',
    txt_toltip_2 = 'Program lojalnoĹciowy dostÄpny jest tylko dla zalogowanych klientĂłw.',
    txt_toltip_2a =
        'MoĹźesz zamieniÄ zgromadzone punkty lojalnoĹciowe na ten produkt. Obecnie masz [xxx] punktĂłw.',
    txt_toltip_3 =
        'Po opĹaceniu zamĂłwienia przyznamy ci takÄ iloĹÄ punktĂłw lojalnoĹciowych. Ĺťeby zbieraÄ punkty musisz byÄ zarejestrowanym klientem.',
    txt_toltip_3a = 'Po opĹaceniu zamĂłwienia przyznamy ci takÄ iloĹÄ punktĂłw lojalnoĹciowych.',
    txt_toltip_4 = '',
    prepaid = 'PĹatnoĹÄ przed wysyĹkÄ',
    dvp = 'PĹatnoĹÄ przy odbiorze',
    day_txt = ' dzieĹ ',
    days_txt = ' dni ',
    hour_txt = ' godz. ',
    hours_txt = ' godz. ',
    min_txt = ' min.',
    txt_24h = '24h',
    txt_do_24h = 'do 24h',
    delivery_txt = 'Sam transport zajmie ',
    delivery_txt2 = 'Przygotowanie do odbioru osobistego zajmie ',
    delivery_txt3 = 'Forma dostawy dostÄpna od ',
    gratis_txt = 'Gratis!';
(app_shop.txt.txt_74629_1 = 'Do koĹca promocji: '),
    (app_shop.txt.txt_74629_2 = 'Wybierz innÄ opcjÄ.'),
    (app_shop.txt.txt_74629_3 = 'dni'),
    (app_shop.txt.txt_74629_4 = 'godzin '),
    (app_shop.txt.txt_74629_5 = 'minut '),
    (app_shop.txt.txt_74629_6 = 'sekund '),
    (app_shop.txt.txt_74629_7 =
        'Przepraszamy, ale nie zdefiniowaliĹmy standardowego kosztu dostawy, zostanie on ustalony indywidualnie przez naszÄ obsĹugÄ po przyjÄciu zamĂłwienia.');
var txt_shipping_8 = ' dzisiaj',
    txt_shipping_9 = ' w poniedziaĹek ',
    txt_shipping_10 = ' we wtorek ',
    txt_shipping_11 = ' w ĹrodÄ ',
    txt_shipping_12 = ' w czwartek ',
    txt_shipping_13 = ' w piÄtek ',
    txt_shipping_14 = ' w sobotÄ ',
    txt_shipping_15 = ' w niedzielÄ ',
    txt_shipping_16 = 'jutro!';
(app_shop.txt.txt_74629_8 = 'ProszÄ wybraÄ rozmiar'),
    (projectorObj.options.friendly_shipping_format = [
        txt_shipping_8,
        txt_shipping_9,
        txt_shipping_10,
        txt_shipping_11,
        txt_shipping_12,
        txt_shipping_13,
        txt_shipping_14,
        txt_shipping_15,
    ]),
    (app_shop.txt.txt_74629_9 = 'TwĂłj produkt jest gotowy do wysyĹki'),
    (app_shop.txt.txt_74629_10 =
        'TwĂłj produkt jest juĹź spakowany i gotowy do odebrania przez kuriera'),
    (app_shop.txt.txt_74629_11 = 'Czas przygotowania produktu do wysyĹki'),
    (app_shop.txt.txt_74629_11a = 'Gotowy do wysyĹki'),
    (app_shop.txt.txt_74629_11b = 'Produkt jest spakowany i moĹźliwy do odebrania przez kuriera'),
    (app_shop.txt.txt_74629_12 =
        'Jest to czas, w ktĂłrym produkt jest pakowany i przygotowywany do odebrania przez kuriera'),
    (app_shop.txt.txt_74629_13 = ''),
    (app_shop.txt.txt_74629_14 = 'Przygotowanie do odbioru osobistego zajmie do 24h'),
    (app_shop.txt.txt_74629_15 = 'Przygotowanie do odbioru osobistego zajmie 24h'),
    (app_shop.txt.txt_74629_16 = 'Przygotowanie do odbioru osobistego zajmie '),
    (app_shop.txt.txt_74629_17 = 'PrzesyĹka bÄdzie u Ciebie dzisiaj! '),
    (app_shop.txt.txt_74629_18 = 'PrzesyĹka bÄdzie u Ciebie jutro!'),
    (app_shop.txt.txt_74629_19 = 'PrzesyĹka bÄdzie u Ciebie za '),
    (app_shop.txt.txt_74629_16467 = 'Zamknij okno'),
    (app_shop.txt.txt_74629_conflict =
        'WybĂłr tej pozycji spowoduje koniecznoĹÄ dostosowania innych opcji. '),
    (app_shop.txt.txt_sold_out = 'wyprzedane');
var txt_62619_nieprawidlowy_email = 'Niepoprawny adres email.',
    txt_62619_przekroczono_liczbe = 'Przekroczono liczbÄ dodanych powiadomieĹ w ciÄgu dnia.',
    txt_62619_podczas_dodawania =
        'Podczas dodawania produktu wystÄpiĹ bĹÄd. SprawdĹş poprawnoĹÄ wprowadzonych danych',
    txt_62619_produkt_dodany = 'Produkt zostaĹ poprawnie dodany do powiadomieĹ.',
    txt_62619_blad_pobrania = 'WystÄpiĹ problem z poĹÄczeniem. Wykonaj czynnoĹÄ ponownie.',
    txt_62619_bledny_email =
        'BĹÄdnie wpisany e-mail. Wpisz peĹny adres e-mail, np. jan@kowalski.com ',
    txt_62619_wpisz_telefon = 'Wpisz swĂłj telefon. ',
    fashionGallery_new = '';
function CountdownTimer(e, t) {
    this.initialize.apply(this, arguments);
}
(app_shop.txt.daysOfWeek = [
    'Dzisiaj',
    'PoniedziaĹek',
    'Wtorek',
    'Ĺroda',
    'Czwartek',
    'PiÄtek',
    'Sobota',
    'Niedziela',
]),
    (app_shop.txt.shippingInfoVat = '* Cena brutto (z VAT)'),
    (app_shop.txt.shippingInfoPrepaid = 'PĹatnoĹÄ przed wysyĹkÄ'),
    (app_shop.txt.shippingInfoDvp = 'PĹatnoĹÄ przy odbiorze'),
    (app_shop.txt.shippingInfoHeaderName = 'Forma dostawy'),
    (app_shop.txt.shippingInfoHeaderDelivery = 'Przewidywana dostawa'),
    (app_shop.txt.shippingInfoHeaderCost = 'Cena *'),
    (app_shop.txt.shippingInfoCurrentRegion =
        'Przedstawione czasy i koszty wysyĹki dotyczÄ wybranego kraju dostawy: '),
    (app_shop.txt.shippingInfoCurrentZipcode =
        'Przedstawione czasy i koszty wysyĹki dotyczÄ wybranego regionu dostawy: '),
    (app_shop.txt.shippingInfoAndRegion = ' i regionu: '),
    (app_shop.txt.shippingInfoDefaultRegion = 'PrzywrĂłÄ domyĹlny kraj dostawy: '),
    (app_shop.txt.shippingInfoDefaultZipcode = 'PrzywrĂłÄ domyĹlny region dostawy: '),
    (app_shop.txt.linkCopiedToClipboard = 'Skopiowano link do schowka'),
    (CountdownTimer.prototype = {
        initialize: function (e, t) {
            (this.elem = e), (this.tl = t), (this.tid = '');
        },
        newData: function (e) {
            this.tl = e;
        },
        countDown: function () {
            var e = '',
                t = new Date(),
                i = Math.floor((this.tl - t) / 864e5),
                n = Math.floor(((this.tl - t) % 864e5) / 36e5),
                r = Math.floor(((this.tl - t) % 864e5) / 6e4) % 60,
                o = (Math.floor(((this.tl - t) % 864e5) / 1e3) % 60) % 60,
                s = this;
            if (!(this.tl - t > 0)) return clearTimeout(this.tid), void this.elem.remove();
            (e += '<label class="projector_label">' + app_shop.txt.txt_74629_1 + '</label><div>'),
                this.addZero(i) > 0 &&
                (e +=
                    '<span class="number-wrapper"><div class="line"></div><div class="caption">' +
                    app_shop.txt.txt_74629_3 +
                    '</div><span class="number day">' +
                    this.addZero(i) +
                    '</span></span>'),
                (e +=
                    '<span class="number-wrapper"><div class="line"></div><div class="caption">' +
                    app_shop.txt.txt_74629_4 +
                    '</div><span class="number hour">' +
                    this.addZero(n) +
                    '</span></span>'),
                (e +=
                    '<span class="number-wrapper"><div class="line"></div><div class="caption">' +
                    app_shop.txt.txt_74629_5 +
                    '</div><span class="number min">' +
                    this.addZero(r) +
                    '</span></span><span class="number-wrapper"><div class="line"></div><div class="caption">' +
                    app_shop.txt.txt_74629_6 +
                    '</div><span class="number sec">' +
                    this.addZero(o) +
                    '</span></span></div>'),
                this.elem.html(e),
                (this.tid = setTimeout(function () {
                    s.countDown();
                }, 1e3));
        },
        addZero: function (e) {
            return 1 === e.toString().length ? `0${e}`.slice(-2) : e;
        },
    }),
    (app_shop.graphql.projectorShippingInput = () => {
        let e = '';
        if (document.querySelector('#projector_form[data-type="product_bundle"]')) {
            e = `bundleParts: [${[
                ...(document.querySelector('#projector_form[data-collection]')
                    ? document.querySelectorAll('.projector_bundle__checkbox:checked')
                    : document.querySelectorAll('.projector_bundle__item')),
            ]
                .map(
                    e =>
                        `{\n      id: ${e.closest('.projector_bundle__item').querySelector('.projector_bundle__product_id')
                            .value
                        }\n      size: "${e.closest('.projector_bundle__item').querySelector('.projector_bundle__product_size')
                            ? e
                                .closest('.projector_bundle__item')
                                .querySelector('.projector_bundle__product_size').value
                            : e
                                .closest('.projector_bundle__item')
                                .querySelector('.projector_bundle__size-select').value
                        }"\n    }`,
                )
                .join('')}]`;
        }
        return `ShippingInput: {\n    mode: product\n    products: [{\n      id: ${document.getElementById('projector_product_hidden').value
            }\n      size: "${'onesize' === document.getElementById('projector_size_hidden').value
                ? 'uniw'
                : document.getElementById('projector_size_hidden').value
            }"\n      quantity: ${document.getElementById('projector_number')
                ? document.getElementById('projector_number').value
                : product_data.unit_sellby
            }\n      ${e}\n    }]\n  }`;
    }),
    (app_shop.graphql.getShippingTime = async e => {
        const t = JSON.stringify({
            query: `query {\n      shipping(${e}) {\n        shippingTime {\n          shippingTime {\n            time {\n              days\n              hours\n              minutes\n            }\n            weekDay\n            weekAmount\n            today\n          }\n          time\n          unknownTime\n          todayShipmentDeadline\n        }\n      }\n    }`,
        });
        try {
            const e = await fetch(app_shop.urls.graphql, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json', Accept: 'application/json' },
                body: t,
            });
            return await e.json();
        } catch (e) {
            return console.error('AJAX fetchDataShippingTime() Error:', e), !1;
        }
    }),
    (app_shop.graphql.getCouriersForModal = async e => {
        const t = JSON.stringify({
            query: `query {\n      shipping(${e}) {\n        shipping {\n          courier {\n            icon\n            name\n          }\n          prepaid\n          cost {\n            value\n            formatted\n          }\n          deliveryTime {\n            time {\n              days\n              hours\n              minutes\n            }\n            weekDay\n            weekAmount\n            today\n          }\n        }\n      }\n    }`,
        });
        try {
            const e = await fetch(app_shop.urls.graphql, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json', Accept: 'application/json' },
                body: t,
            });
            return await e.json();
        } catch (e) {
            return console.error('GraphQL fetchDataShipping() Error:', e), !1;
        }
    }),
    (ShippingInfo = function (e) {
        const t = this;
        (this.params = e || {}),
            (this.couriersDataBuffer = []),
            (this.events = {
                unsetRegion: e => (e.preventDefault(), this.unsetTemporaryRegion(), !1),
                unsetZipcode: e => (e.preventDefault(), this.unsetTemporaryZipcode(), !1),
                unsetRegionAndZipcode: e => (e.preventDefault(), this.unsetTemporaryRegionAndZipcode(), !1),
            }),
            (this.queries = {
                unsetRegion: () =>
                    JSON.stringify({
                        query:
                            'mutation {\n        unsetTemporaryRegion {\n          status\n          error {\n            code\n            message\n          }\n        }\n      }',
                    }),
                unsetZipcode: () =>
                    JSON.stringify({
                        query:
                            'mutation {\n        unsetTemporaryZipcode {\n          status\n          error {\n            code\n            message\n          }\n        }\n      }',
                    }),
                unsetRegionAndZipcode: () =>
                    JSON.stringify({
                        query:
                            'mutation {\n        unsetTemporaryRegion {\n          status\n          error {\n            code\n            message\n          }\n        }\n        unsetTemporaryZipcode {\n          status\n          error {\n            code\n            message\n          }\n        }\n      }',
                    }),
            }),
            (this.fetchData = async (e = {}) => {
                const { data: t, link: i, linkParameter: n = '' } = e;
                if (!t) return !1;
                try {
                    const e = await fetch(`${i || app_shop.urls.graphql || '/graphql/v1'}${n}`, {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/json', Accept: 'application/json' },
                        body: t,
                    });
                    return await e.json();
                } catch (e) {
                    return console.error('GraphQL fetchData() Error:', e), !1;
                }
            }),
            (this.unsetTemporaryRegion = async () => {
                const e = document.querySelector('.modal');
                e && e.classList.add('--loading');
                const t = await this.fetchData({
                    data: this.queries.unsetRegion(),
                    linkParameter: '?mutation=unsetRegion',
                }),
                    { status: i } = t?.data?.unsetTemporaryRegion;
                e && e.classList.add('--remove'),
                    'success' === i &&
                    ((document.cookie = 'setRegionForced=; path=/; Max-Age=-99999999;'),
                        (this.couriersDataBuffer = []),
                        this.init());
            }),
            (this.unsetTemporaryZipcode = async () => {
                const e = document.querySelector('.modal');
                e && e.classList.add('--loading');
                const t = await this.fetchData({
                    data: this.queries.unsetZipcode(),
                    linkParameter: '?mutation=unsetZipcode',
                }),
                    { status: i } = t?.data?.unsetTemporaryZipcode;
                e && e.classList.add('--remove'),
                    'success' === i &&
                    ((document.cookie = 'setZipcodeForced=; path=/; Max-Age=-99999999;'),
                        (this.couriersDataBuffer = []),
                        this.init());
            }),
            (this.unsetTemporaryRegionAndZipcode = async () => {
                const e = document.querySelector('.modal');
                e && e.classList.add('--loading');
                const t = await this.fetchData({
                    data: this.queries.unsetRegionAndZipcode(),
                    linkParameter: '?mutation=unsetRegionAndZipcode',
                }),
                    { status: i } = t?.data?.unsetTemporaryRegion;
                e && e.classList.add('--remove'),
                    'success' === i &&
                    ((document.cookie = 'setRegionForced=; path=/; Max-Age=-99999999;'),
                        (document.cookie = 'setZipcodeForced=; path=/; Max-Age=-99999999;'),
                        (this.couriersDataBuffer = []),
                        this.init());
            }),
            (this.getCookieByName = e => {
                const t = `; ${document.cookie}`.split(`; ${e}=`);
                return 2 === t.length && t.pop().split(';').shift();
            }),
            (this.calculateDate = e => {
                const { days: t, hours: i, minutes: n } = e,
                    r = new Date();
                return (
                    void 0 !== t && r.setDate(r.getDate() + parseInt(t, 10)),
                    void 0 !== i && r.setHours(r.getHours() + parseInt(i, 10)),
                    void 0 !== n && r.setMinutes(r.getMinutes() + parseInt(n, 10)),
                    r.toJSON().slice(0, 10).split('-').reverse().slice(0, -1).join('.')
                );
            }),
            (this.getCourierHtml = e => {
                const i = document.createElement('div');
                i.classList.add('shipping_info__courier');
                const n = e.courier.icon,
                    r = e.courier.name,
                    o = e.deliveryTime.today
                        ? app_shop.txt.daysOfWeek[0]
                        : app_shop.txt.daysOfWeek[e.deliveryTime.weekDay],
                    s =
                        e.deliveryTime.weekAmount > 0
                            ? `Â (${t.calculateDate({
                                days: e.deliveryTime.time.days,
                                hours: e.deliveryTime.time.hours,
                                minutes: e.deliveryTime.time.minutes,
                            })})`
                            : '',
                    a = e.cost.value > 0 ? e.cost.formatted : gratis_txt;
                return (
                    (i.innerHTML = `<span class="shipping_info__item --icon"><img src="${n}" alt="${r}"/></span>\n    <span class="shipping_info__item --name">${r}</span>\n    <span class="shipping_info__item --delivery">${o}${s}</span>\n    <strong class="shipping_info__item --cost">${a}</strong>`),
                    i
                );
            }),
            (this.createRegionForcedMessage = () => {
                const e = this.getCookieByName('setRegionForced'),
                    t = this.getCookieByName('setZipcodeForced');
                if (!e && !t) return '';
                const i = JSON.parse(e),
                    n = JSON.parse(t),
                    { currentCountry: r, defaultCountry: o, showModal: s } = i || {},
                    { currentZipcode: a, defaultZipcode: c, showModal: l } = n || {};
                if (!s && !l) return '';
                const p = !r && a,
                    d = !p && a;
                return `<div class="shipping_info__top">\n      <span class="shipping_info__current_region">${p ? app_shop.txt.shippingInfoCurrentZipcode : app_shop.txt.shippingInfoCurrentRegion
                    }<strong class="shipping_info__region_name">${p ? a : r}</strong>${d
                        ? `<span class="shipping_info__and_region">${app_shop.txt.shippingInfoAndRegion}<strong>${a}</strong></span>`
                        : ''
                    }</span>\n      <a href="#unsetTemporaryRegion" class="shipping_info__default_region">${p ? app_shop.txt.shippingInfoDefaultZipcode : app_shop.txt.shippingInfoDefaultRegion
                    }<strong class="shipping_info__region_name">${p ? c : o}</strong></a>\n    </div>`;
            }),
            (this.create = async () => {
                const e = md5(this.productParamsFunction()),
                    i = this.couriersDataBuffer.filter(t => t.key === e);
                let n = {};
                if (
                    (i.length
                        ? (n = JSON.parse(i[0].value))
                        : ((n = await this.getCouriersFunction(this.productParamsFunction())),
                            this.couriersDataBuffer.push({ key: e, value: JSON.stringify(n) })),
                        n && n.data && n.data.shipping && n.data.shipping.shipping)
                ) {
                    const e = this.createRegionForcedMessage(),
                        { shipping: i } = n.data.shipping,
                        r = i.filter(e => 'dvp' === e.prepaid),
                        o = i.filter(e => 'prepaid' === e.prepaid),
                        s = document.createElement('div');
                    s.classList.add('shipping_info'),
                        (s.id = 'shipping_info'),
                        (s.innerHTML = `${e}<div class="shipping_info__body">\n        ${o.length
                            ? `<div class="shipping_info__block --prepaid">\n          <strong class="shipping_info__label">${app_shop.txt.shippingInfoPrepaid
                            }</strong>\n          <div class="shipping_info__header">\n            <span class="shipping_info__header_item --icon-name">${app_shop.txt.shippingInfoHeaderName
                            }</span>\n            <span class="shipping_info__header_item --delivery">${app_shop.txt.shippingInfoHeaderDelivery
                            }</span>\n            <span class="shipping_info__header_item --cost">${app_shop.txt.shippingInfoHeaderCost
                            }</span>\n          </div>\n          <div class="shipping_info__couriers">\n            ${o
                                .map(e => t.getCourierHtml(e).outerHTML)
                                .join('')}\n          </div>\n        </div>`
                            : ''
                            }\n        ${r.length
                                ? `<div class="shipping_info__block --prepaid">\n          <strong class="shipping_info__label">${app_shop.txt.shippingInfoDvp
                                }</strong>\n          <div class="shipping_info__header">\n            <span class="shipping_info__header_item --icon-name">${app_shop.txt.shippingInfoHeaderName
                                }</span>\n            <span class="shipping_info__header_item --delivery">${app_shop.txt.shippingInfoHeaderDelivery
                                }</span>\n            <span class="shipping_info__header_item --cost">${app_shop.txt.shippingInfoHeaderCost
                                }</span>\n          </div>\n          <div class="shipping_info__couriers">\n            ${r
                                    .map(e => t.getCourierHtml(e).outerHTML)
                                    .join('')}\n          </div>\n        </div>`
                                : ''
                            }\n      </div>\n      <div class="shipping_info__footer">\n        <span class="shipping_info__vat">${app_shop.txt.shippingInfoVat
                            }</span>\n      </div>`),
                        this.onlyHtml
                            ? this.onlyHtml(s)
                            : Modal({
                                element: s,
                                classList: '--shipping-info --large',
                                afterShow: this.afterShowModal,
                            });
                    const a = this.getCookieByName('setRegionForced'),
                        c = this.getCookieByName('setZipcodeForced');
                    let l = 'region';
                    !a && c && (l = 'zipcode'),
                        a && c && (l = 'regionAndZipcode'),
                        this.initEvents({ type: l });
                } else {
                    const e = `<div class="menu_messages_message"><div class="menu_messages_message_sub"><p>${app_shop.txt.txt_74629_7}</p></div></div>`;
                    this.onlyHtml
                        ? this.onlyHtml(e)
                        : Modal({ html: e, classList: '--shipping-info', afterShow: this.afterShowModal });
                }
            }),
            (this.initEvents = ({ type: e }) => {
                const t = document.querySelector('.shipping_info__default_region');
                t &&
                    ('region' === e && t.addEventListener('click', this.events.unsetRegion),
                        'zipcode' === e && t.addEventListener('click', this.events.unsetZipcode),
                        'regionAndZipcode' === e &&
                        t.addEventListener('click', this.events.unsetRegionAndZipcode));
            }),
            (this.init = () => {
                const e = this.getCookieByName('setRegionForced'),
                    t = this.getCookieByName('setZipcodeForced');
                (e || t) && (this.couriersDataBuffer = []);
                const {
                    getCouriersFunction: i,
                    productParamsFunction: n,
                    afterShowModal: r,
                    onlyHtml: o,
                } = this.params;
                (this.getCouriersFunction = i || !1),
                    (this.productParamsFunction = n || !1),
                    (this.afterShowModal = r || !1),
                    (this.onlyHtml = o || !1),
                    this.create();
            });
    }),
    app_shop.run(
        function () {
            $('.projector_bundle:not(.--skeleton)').insertBefore($('.projector_bundle.--skeleton')),
                $('.projector_bundle.--skeleton').remove(),
                (app_shop.fn.projectorBundle = new ProjectorBundle({
                    beforeSliderCallback: e => {
                        e.each(function () {
                            $(this).find('.projector_bundle__name').setHeight($(this));
                        });
                    },
                    afterSliderCallback: e => {
                        $('.projector_bundle__label').append(e.find('.projector_bundle__arrow'));
                    },
                })),
                app_shop.fn.projectorBundle.init();
        },
        'all',
        '.projector_bundle',
        !0,
    ),
    app_shop.run(
        function () {
            1 === app_shop.vars.view
                ? app_shop.fn.projectorBundle.initSlider()
                : app_shop.fn.projectorBundle.destroySlider();
        },
        [1, 2, 3, 4],
        '.projector_bundle',
        !0,
    ),
    app_shop.run(
        function () {
            $('.enclosures__name.--audio, .enclosures__name.--video').on('click', function (e) {
                let t;
                return (
                    e.stopPropagation(),
                    (t = $(this).hasClass('--audio')
                        ? `<audio src="${$(this).attr('href')}" controls autoplay></audio>`
                        : `<video width="100%" height="478" src="${$(this).attr(
                            'href',
                        )}" controls autoplay></video>`),
                    Modal({ html: t, classList: '--enclosures' }),
                    !1
                );
            }),
                'function' == typeof ProjectorPhotoSwipe &&
                ($('.enclosures__name.--image').on('click', function (e) {
                    e.preventDefault();
                    const t = parseInt($(this).data('index'), 10);
                    return app_shop.vars.projectorEnclosuresPhotoSwipe.init(t), !1;
                }),
                    $('.enclosures__name.--image').each(function (e) {
                        $(this).attr('data-index', e);
                    }),
                    (app_shop.vars.projectorEnclosuresPhotoSwipe = new ProjectorPhotoSwipe({
                        selector: '.enclosures__name.--image',
                        pswp: '.pswp',
                    })));
        },
        'all',
        '#projector_enclosures',
        !0,
    ),
    app_shop.run(
        function () {
            document.querySelectorAll('.dictionary__more').forEach(e => {
                e.addEventListener('click', function (e) {
                    return e.preventDefault(), this.parentNode.parentNode.classList.toggle('--active'), !1;
                });
            });
        },
        'all',
        '.dictionary__more',
        !0,
    ),
    app_shop.run(
        function () {
            $('.questions__question').on('click', function () {
                return $(this).parent().toggleClass('--active'), !1;
            }),
                $('.questions__button').on('click', function (e) {
                    return (
                        e.stopPropagation(),
                        Modal({ element: $('.askforproduct'), classList: '--askforproduct' }),
                        !1
                    );
                });
        },
        'all',
        '#product_questions_list',
        !0,
    ),
    app_shop.run(
        function () {
            $('#askforproduct__email_input, #askforproduct__question_input').on('input', function () {
                clearTimeout(app_shop.formControl.timeHandle);
                const e = $(this);
                app_shop.formControl.timeHandle = setTimeout(function () {
                    app_shop.formControl.validate(e);
                }, 500);
            }),
                $('.askforproduct__button').on('click', function () {
                    return app_shop.formControl.checkForm($(this).parents('.askforproduct__form'));
                });
        },
        'all',
        '.askforproduct',
        !0,
    ),
    app_shop.run(
        function () {
            $('.opinions__more_txt').on('click', function (e) {
                return (
                    e.preventDefault(),
                    $('#opinions_section .opinions_list [data-hide="true"]').attr('data-hide', !1),
                    app_shop?.vars?.bLazy?.revalidate(),
                    $('.opinions__more').hide(),
                    $('.opinions_list').addClass('show'),
                    !1
                );
            });
        },
        'all',
        '.opinions__more',
        !0,
    ),
    app_shop.run(
        function () {
            $('#opinions_section .opinions_element_photo a').on('click', function (e) {
                e.preventDefault(), e.stopPropagation();
                const t = $(this),
                    i = t.attr('href'),
                    n = t.find('img').attr('title'),
                    r = new Image();
                return (
                    (r.src = i),
                    (r.onload = function () {
                        Modal({ html: `<div id="ui-dialogimg"><img alt="${n}" src="${i}" /></div>` });
                    }),
                    !1
                );
            });
        },
        'all',
        '#opinions_section .opinions_element_photo',
        !0,
    ),
    app_shop.run(
        function () {
            document.getElementById('opinions_filter_confirmed').addEventListener('change', function () {
                const e = document.querySelector('.opinions__more');
                e && (e.style.display = 'none');
                const t = document.querySelector('.opinion_rate.--active');
                (t
                    ? document.querySelectorAll(`.opinions_list__item[data-opinion_rate="${t.id}"]`)
                    : document.querySelectorAll('.opinions_list__item')
                ).forEach(e => {
                    this.checked && 'false' === e.getAttribute('data-confirmed')
                        ? (e.setAttribute('data-hide', !0),
                            app_shop.vars.view > 2 &&
                            document.getElementById('opinions_section').scrollIntoView({ behavior: 'smooth' }))
                        : (e.setAttribute('data-hide', !1), app_shop?.vars?.bLazy?.revalidate());
                }),
                    document.querySelector('.opinions_list__item[data-hide="false"]')
                        ? document.getElementById('no_opinions_of_type').classList.add('d-none')
                        : document.getElementById('no_opinions_of_type').classList.remove('d-none');
            });
        },
        'all',
        '#opinions_filter_confirmed',
        !0,
    ),
    (app_shop.vars.opinions_empty_input = 'ProszÄ wypeĹniÄ to pole.'),
    (app_shop.vars.opinions_not_email = 'Podano niepoprawny adres email.'),
    (app_shop.fn.validateEmail = function (e) {
        return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(
            String(e).toLowerCase(),
        );
    }),
    (app_shop.fn.opinionsValidate = function (e) {
        var t = e.find('input[required]');
        return (
            $.each(t, function (e, t) {
                $(t).parent().removeClass('has-error').find('.validate_message').remove(),
                    $(t).val()
                        ? 'email' !== $(t).prop('type') ||
                        app_shop.fn.validateEmail($(t).val()) ||
                        $(t)
                            .parent()
                            .addClass('has-error')
                            .append(
                                '<span class="help-block validate_message text-danger">' +
                                app_shop.vars.opinions_not_email +
                                '</span>',
                            )
                        : $(t)
                            .parent()
                            .addClass('has-error')
                            .append(
                                '<span class="help-block validate_message text-danger">' +
                                app_shop.vars.opinions_empty_input +
                                '</span>',
                            );
            }),
            !e.find('.has-error').length
        );
    });
var txt_1_69363 = 'Wybierz najwygodniejszy dla ciebie sposĂłb wysyĹki zwrotu';
$(document).on('click', '.step3d #return_go_next', function () {
    if (
        $('.step3d .order1_delitem_radio input').size() &&
        !$('.step3d .order1_delitem_radio input:checked').size()
    )
        return Alertek.show_alert(txt_1_69363), !1;
}),
    $(document).on('click', '.step3d div.return_delitem', function () {
        $('.step3d div.return_delitem.active').removeClass('active'),
            $(this).addClass('active').find('input.order1_delitem_radio').prop('checked', !0);
    });
var txt_1_69372 = 'Wybierz sposĂłb zwrotu produktĂłw',
    txt_1_69372_param = 'Wybierz parametr sposobu zwrotu produktĂłw',
    txt_1_69372_tak = 'Potwierdzam',
    txt_1_69372_confirm_header = 'Czy potwierdzasz ...?',
    txt_1_fill_phone =
        'Aby wybraÄ tÄ metodÄ zwrotu musisz uzupeĹniÄ numer telefonu w ustawieniach swojego konta';
$(document).on('click', 'div.return_type.disabled_inpost', function () {
    Alertek.show_alert(txt_1_fill_phone);
}),
    $(document).on('click', 'div.return_type.choose_return_type:not(.disabled_inpost)', function () {
        var e = $(this).find('input.return_type').val();
        $(this).addClass('current_method'),
            $('.return_type.choose_return_type.active').removeClass('active'),
            $(this).addClass('active').find('input.return_type').prop('checked', !0),
            $(
                '.return_type.choose_return_type:not(.current_method) .return_methods_param > input, div.return_delitem_items:not(#delitem_item' +
                e +
                ') .return_methods_param > input',
            ).prop('checked', !1),
            $('div.return_delivery_form, div.return_delitem_items').hide(),
            $('#delitem_item' + e).size() &&
            ($('div.return_delivery_form, #delitem_item' + e).show(),
                $('#delitem_item' + e)
                    .find('div.return_delitem:first')
                    .click()),
            $(this).removeClass('current_method');
    }),
    $(document).on('click', '.step3 #return_go_next', function (e) {
        if ($('.step3 div.return_type input').size()) {
            if (!$('.step3 div.return_type input:checked').size())
                return e.preventDefault(), Alertek.show_alert(txt_1_69372), !1;
            if (
                $('.active .return_methods_param > input').length &&
                !$('.active .return_methods_param > input:checked').length
            )
                return e.preventDefault(), Alertek.show_alert(txt_1_69372_param), !1;
            $('div.progress_bar_wrapper').removeClass('pb_step3').addClass('pb_step4');
        }
    }),
    $(document).on('change', '.return_methods_param > input', function () {
        if ($(this).parents().hasClass('disabled_inpost')) return $(this).prop('checked', !1), !1;
        $(this).prop('checked') &&
            $(this).parent().find('.return_confirmation_message').length &&
            confirmReturnParam($(this).parent());
    }),
    $(document).on('click', '.step3 div.return_delitem', function () {
        $('.step3 div.return_delitem.active').removeClass('active'),
            $(this).addClass('active').find('input.order1_delitem_radio').prop('checked', !0),
            $('.step3 div.return_delitem:not(.active) .return_methods_param > input').prop('checked', !1);
    });
var remove_param = !0;
function confirmReturnParam(e) {
    Modal({
        html: `<div id="menu_notice" class="menu_notice --rma"><h2>${txt_1_69372_confirm_header}</h2><p>${e
            .find('.return_confirmation_message')
            .html()}</p><div class="menu_notice__buttons"><button class="menu_notice__button btn --solid" onclick="remove_param = false;document.querySelector('.modal__close').click(); return false;">${txt_1_69372_tak}</button></div></div>`,
        afterClose: (e, t) => {
            remove_param && unsetMethodParam(), (remove_param = !0);
        },
    });
}
function unsetMethodParam() {
    $('.active .return_methods_param > input').prop('checked', !1);
}
app_shop.run(
    function () {
        $('.return_type.active').click();
    },
    'all',
    '.return_type',
),
    app_shop.run(
        function () {
            $('#returns_open__number_input, #returns_open__email_input').on('input', function () {
                clearTimeout(app_shop.formControl.timeHandle);
                const e = $(this);
                app_shop.formControl.timeHandle = setTimeout(function () {
                    app_shop.formControl.validate(e);
                }, 500);
            }),
                $('.returns_open__button').on('click', function () {
                    return app_shop.formControl.checkForm($(this).parents('.returns_open__form'));
                });
        },
        'all',
        '.returns_open',
    );
var txt_1_69378 = 'Wybierz formÄ zwrotu naleĹźnoĹci',
    validationTextErrors = [];
(validationTextErrors.invalid_bank_acccount =
    'Wprowadzony numer konta bankowego jest nieprawidĹowy.'),
    app_shop.run(
        function () {
            $('.step5 [data-validation="bank_account"]').keyup();
        },
        'all',
        '.step5 [data-validation="bank_account"]',
    );
var txt_1_69376 = 'Wybierz adres punktu zwrotu';
function init_rma_calendar() {
    $('#rma_add_form_begin_ymd').datepicker({
        dateFormat: iaical_dateFormat,
        dayNamesMin: iaical_daysShort,
        monthNames: iaical_monthNames,
        onSelect: rma_add.setTime,
        firstDay: iaical_firstDay,
    });
}
$(document).on('click', '.step4a div.pickupl_return', function () {
    $('.step4a div.pickupl_return').removeClass('active'),
        $(this).addClass('active').find('input').prop('checked', !0);
}),
    app_shop.run(
        function () {
            $(document).on('click', '.step4a #return_go_next', function () {
                if (!$('.step4a div.pickupl_return input:checked').size())
                    return Alertek.show_alert(txt_1_69376), !1;
                $('div.progress_bar_wrapper').removeClass('pb_step4').addClass('pb_step5');
            });
        },
        'all',
        '.pickup_return_list_form .pickupl_return',
    );
var rma_add_alert = 'WypeĹnij wszystkie pola formularza.',
    rma_add_msg1 = 'Podaj nazwÄ produktu',
    rma_add_msg2 = 'Podaj numer seryjny produktu',
    rma_add_msg3 = 'Podaj datÄ zakupu produktu',
    rma_add_msg4 = 'Opisz usterkÄ',
    rma_add_msg5 = 'Opisz miejsce zakupu produktu',
    rma_add_msg6 = 'Podaj adres, na ktĂłry chcesz otrzymaÄ zwrot pieniÄdzy',
    rma_add_msg7 = 'Podaj numer konta bankowego',
    rma_add_msg8 = 'Podaj dane do czeku';
if (void 0 === typeof rma_add_paymentTrigger) var rma_add_paymentTrigger = 1;
app_shop.run(
    function () {
        $('#rma_add_form')
            .find('input, textarea')
            .on('input', function () {
                clearTimeout(app_shop.formControl.timeHandle),
                    (obj = $(this)),
                    (app_shop.formControl.timeHandle = setTimeout(function () {
                        app_shop.formControl.validate(obj);
                    }, 500));
            }),
            $('a#rma_add_form_submit').on('click', function () {
                return (
                    1 == app_shop.formControl.checkForm($(this).parents('form')) &&
                    $('form#rma_add_form').submit(),
                    !1
                );
            });
    },
    'all',
    '#rma_add_form',
),
    app_shop.run(
        function () {
            app_shop.vars.rma_action && init_rma_calendar();
        },
        'all',
        '.rma_add_form_outline',
    );
var rma_add = {
    placeTrigger: 0,
    setPlace: function (e) {
        $('.rma_add_form_boxsub_hidden').css('display', 'none'),
            $('#' + e).css('display', 'block'),
            (rma_add.placeTrigger = 'rma_add_form_buyplace_other' == e ? 1 : 0);
    },
    setPayment: function (e) {
        switch (
        ($('.rma_add_form_boxsub2_hidden').css('display', 'none'),
            $('#' + e).css('display', 'block'),
            e)
        ) {
            case 'rma_add_form_payp':
                rma_add_paymentTrigger = 1;
                break;
            case 'rma_add_form_payb':
                rma_add_paymentTrigger = 2;
                break;
            case 'rma_add_form_payc':
                rma_add_paymentTrigger = 3;
                break;
            case 'rma_add_form_payt':
                rma_add_paymentTrigger = 4;
        }
        rma_add.checkInps();
    },
    hideInfoText: function (e, t) { },
    showInfo: function (e, t, i) {
        t
            ? ((document.getElementById(e + '_off').style.display = ''),
                (document.getElementById(e + '_on').style.display = 'none'),
                i
                    ? ((document.getElementById(e + '_help').style.display = 'block'),
                        (document.getElementById(e + '_help').firstChild.innerHTML = i),
                        rma_add.hideInfoText(e, 5))
                    : (document.getElementById(e + '_help').style.display = 'none'))
            : ((document.getElementById(e + '_off').style.display = 'none'),
                (document.getElementById(e + '_on').style.display = ''),
                (document.getElementById(e + '_help').style.display = 'none'));
    },
    checkInps: function (e) { },
    setTime: function (e, t) {
        var i = $('#rma_add_form_begin_ymd').datepicker('getDate');
        $('#rma_add_form_beginy').val(i.getFullYear()),
            $('#rma_add_form_beginm').val(i.getMonth() + 1),
            $('#rma_add_form_begind').val(i.getDate()),
            app_shop.formControl.validate($('#rma_add_form_begin_ymd'));
    },
    chooseSite: function (e) {
        var t = e.slice(5);
        $('.rma_add_form_stock').removeClass('rmaf_selected'),
            $('#' + e).addClass('rmaf_selected'),
            $('#rma_stock').val(t);
    },
},
    form_validation_error = '',
    prefered_form_complain = 'Preferowana forma reklamacji';
const fetchRMAMessages = async () => {
    document.querySelector('.rma_questions').classList.add('load-content');
    try {
        await fetch(window.location.href)
            .then(e => e.text())
            .then(e => {
                var t = new DOMParser().parseFromString(e, 'text/html');
                (document.querySelector('.rma_questions').innerHTML =
                    t.querySelector('.rma_questions').innerHTML),
                    document.querySelector('.rma_questions').classList.remove('load-content'),
                    $('a.rma_attach_file').on('click', function () {
                        $(this).closest('form').find('div.rma_af_files').show(), $(this).hide();
                    }),
                    document.querySelector('.rma_af_addMoreAttachments').addEventListener('click', e => {
                        const t = document.querySelector('.rma_af_foto input').cloneNode(!0);
                        console.log(t),
                            (t.value = ''),
                            document.querySelector('.rma_af_foto').insertAdjacentElement('beforeend', t);
                    });
            });
    } catch (e) {
        throw new Error(e);
    }
},
    sendComplaintMethod = async () => {
        if (null !== localStorage.getItem('complaint_method')) {
            const e = new FormData();
            e.append('comment', `${prefered_form_complain}: ${localStorage.getItem('complaint_method')}`);
            try {
                await fetch(`${window.location.href}&message=rma`, { method: 'POST', body: e }),
                    fetchRMAMessages(),
                    localStorage.removeItem('complaint_method');
            } catch (e) {
                throw new Error(e);
            }
        }
    };
app_shop.run(
    function () {
        $('.rma_af_input')
            .find('input, textarea')
            .on('input', function () {
                clearTimeout(app_shop.formControl.timeHandle),
                    (obj = $(this)),
                    (app_shop.formControl.timeHandle = setTimeout(function () {
                        app_shop.formControl.validate(obj);
                    }, 500));
            }),
            $('.rma_af_buttons > button').on('click', function () {
                return app_shop.formControl.checkForm($(this).parents('form'));
            });
    },
    'all',
    '.rma_added_files',
),
    app_shop.run(
        function () {
            sendComplaintMethod(),
                document.querySelector('.rma_af_addMoreAttachments').addEventListener('click', e => {
                    const t = document.querySelector('.rma_af_foto input').cloneNode(!0);
                    console.log(t),
                        (t.value = ''),
                        document.querySelector('.rma_af_foto').insertAdjacentElement('beforeend', t);
                });
        },
        'all',
        '.rma_orderdetails_info',
    ),
    $(document).on('click', '.step2 .saveQuantity', function () {
        return $('.productslist_product_action input').prop('checked', !0), !1;
    }),
    $(document).on('click', '.step1 a.orders_more', function () {
        return $('.step1').hide(), $('.step2').show(), !1;
    }),
    $(document).on('click', '.step2 input.return_product', function () {
        $('.step2 textarea.return_comment').toggle();
    }),
    $(document).on('click', '.step5a div.return_form', function () {
        $('.step5a div.return_form').removeClass('active'),
            $(this).addClass('active').find('input').prop('checked', !0),
            $(this).is('#disable_button') &&
            $('#disable_button input.return_form').val().length < 3 &&
            $('#return_go_next').prop('disabled', 'disabled').css('opacity', '0.6');
    }),
    $(document).on('click', 'label.return_type', function () {
        $('label.return_type.active').removeClass('active'), $(this).addClass('active');
    }),
    $(function () {
        $('td.rma-remarks').each(function () {
            $(this).attr('colspan', $('.orders.table-stroke thead th').size() - 1);
        }),
            $('a.rma_attach_file').on('click', function () {
                $(this).closest('form').find('div.rma_af_files').show(), $(this).hide();
            }),
            $('#disable_button input.return_form').keyup(function () {
                $('#disable_button input.return_form').val().length < 3
                    ? $('#return_go_next').prop('disabled', 'disabled').css('opacity', '0.6')
                    : $('#return_go_next').prop('disabled', !1).css('opacity', '1');
            });
    });
var rmaHideSpeed = 200,
    rmaLessInfo = '',
    rma_cancel_alert = '',
    rma_list = {
        rmaMoreInfo: $('rma_list_item1').eq(0).children('.rma_list_item_operation').html(),
        choosePanel: function (e, t) {
            $('#' + e) &&
                ($('#' + e)
                    .siblings()
                    .removeClass('rma_on'),
                    $('#' + e).addClass('rma_on')),
                $('#' + t) &&
                ($('#' + t)
                    .siblings()
                    .hide(),
                    $('#' + t).show());
        },
        chooseRma: function (e) {
            $('#rmal_' + e) &&
                ($('#rmal_' + e).toggleClass('rma_itema'),
                    $('#rmal_' + e)
                        .children('.rma_list_item_operation')
                        .toggleClass('ophidden'),
                    'none' ==
                        $('#rmal_' + e)
                            .next()
                            .css('display')
                        ? $('#rmal_' + e)
                            .next()
                            .slideDown(rmaHideSpeed)
                        : $('#rmal_' + e)
                            .next()
                            .slideUp(rmaHideSpeed));
        },
        cancelRma: function (e) {
            if (1 != confirm(rma_cancel_alert)) return !1;
            window.location = e;
        },
    };
app_shop.run(
    function () {
        rma_list.chooseRma(app_shop.vars.chooseRma);
    },
    'all',
    '.rma_list_data_outline',
),
    app_shop.run(
        function () {
            $('#rma_open__number_input, #rma_open__email_input').on('input', function () {
                clearTimeout(app_shop.formControl.timeHandle);
                const e = $(this);
                app_shop.formControl.timeHandle = setTimeout(function () {
                    app_shop.formControl.validate(e);
                }, 500);
            }),
                $('.rma_open__button').on('click', function () {
                    return app_shop.formControl.checkForm($(this).parents('.rma_open__form'));
                });
        },
        'all',
        '.rma_open',
    );
var txt_1_69378 = 'Wybierz formÄ zwrotu naleĹźnoĹci',
    validationTextErrors = [];
(validationTextErrors.invalid_bank_acccount =
    'Wprowadzony numer konta bankowego jest nieprawidĹowy.'),
    app_shop.run(
        function () {
            $('.return_form')
                .find('input, textarea')
                .on('input', function () {
                    clearTimeout(app_shop.formControl.timeHandle),
                        (obj = $(this)),
                        (app_shop.formControl.timeHandle = setTimeout(function () {
                            app_shop.formControl.validate(obj);
                        }, 500));
                }),
                $('.step5 #return_go_next').on('click', function () {
                    const e = document.querySelector('.complain_select');
                    if (
                        (e &&
                            0 !== e.querySelector('select').selectedIndex &&
                            localStorage.setItem('complaint_method', e.querySelector('select').value),
                            !$('.return_form.form-control.validate').parent().is('.has-success') &&
                            $('.return_form.form-control.validate').parents('.return_form').is('.active'))
                    )
                        return (
                            app_shop.formControl.checkForm($(this).parents('form')),
                            document
                                .querySelector('.return_form.form-control.validate')
                                .parentNode.classList.add('has-error'),
                            !1
                        );
                    $('div.progress_bar_wrapper').removeClass('pb_step5').addClass('pb_step6');
                }),
                (app_shop.fn.selectComplainMethod = new SelectToDropdown({
                    selector: '.complain_select',
                    afterClickDropdownCallback: e => {
                        document.querySelector('.complain_select').classList.remove('has-error');
                    },
                }));
        },
        'all',
        '.return_form',
    ),
    (handleTim = ''),
    $(document).on('click', '.step5 div.return_form', function () {
        $('.step5 div.return_form').removeClass('active'),
            $(this).addClass('active').find('input').prop('checked', !0);
    }),
    app_shop.run(
        function () {
            $(document).on('click', 'a.show_description', function () {
                return $(this).parent().addClass('expanded'), !1;
            }),
                $(document).on('click', 'a.hide_description', function () {
                    return $(this).prev().removeClass('expanded'), !1;
                });
        },
        'all',
        '.search_description',
    ),
    app_shop.run(
        function () {
            app_shop.fn.categoryDivider('.search_description.--top .search_description__wrapper');
        },
        'all',
        '.search_description',
        !0,
    ),
    (app_shop.vars.show_description = 'Czytaj wiÄcej'),
    (app_shop.vars.hide_description = 'ZwiĹ'),
    (app_shop.fn.categoryDivider = function (e) {
        var t = e || '.search_categoriesdescription_sub',
            i = $(t).children(),
            n = void 0 !== app_shop.vars.categorySize ? app_shop.vars.categorySize : 512;
        return (
            i.length > 1 &&
            !$(t).parent().find('.search_categoriesdescription_next').length &&
            0 !== n &&
            ($.each(i, function (e, i) {
                var r = -1 * (n - i.innerText.length);
                n - i.innerText.length <= 0 &&
                    r >= n &&
                    ($(t).parent().find('.search_categoriesdescription_next').length ||
                        $(t).after(
                            '<div class="search_categoriesdescription_next cm"><a class="show_description pt-3">' +
                            app_shop.vars.show_description +
                            '</a></div>',
                        ),
                        $(i).appendTo($(t).parent().find('.search_categoriesdescription_next'))),
                    (n -= i.innerText.length);
            }),
                app_shop.vars.hide_description &&
                $(t)
                    .parent()
                    .find('.search_categoriesdescription_next')
                    .after('<a class="hide_description pb-3">' + app_shop.vars.hide_description + '</a>')),
            $(t).removeClass('skeleton'),
            $(t).parent().removeClass('--skeleton'),
            !1
        );
    }),
    app_shop.run(
        function () {
            app_shop.fn.categoryDivider('.search_description.--bottom .search_description__wrapper');
        },
        'all',
        '.search_description',
        !0,
    ),
    app_shop.run(
        function () {
            $(window).resize(function () {
                $('.selectbox-title,.selectbox-container').removeAttr('style');
            });
        },
        'all',
        '#searching_form',
    ),
    (app_shop.fn.switchSigninView = function (e) {
        $('#signin-form_box_left .signin-form_box_sub').hide(), $('#' + e.attr('value')).show();
    }),
    app_shop.run(
        function () {
            $('a.password_reminder_signin, a.password_back_signin').on('click', function () {
                return app_shop.fn.switchSigninView($($(this).attr('href'))), !1;
            }),
                $('.cookie_login_social_more_social').on('click', function () {
                    return $('#cookie_login_social_more').show(), $(this).remove(), !1;
                });
        },
        'all',
        '#signin-form',
    ),
    app_shop.run(
        function () {
            $('a.show_on_map').click(function () {
                if ($('.no-touch')) return stock_map.showMap(), !1;
            });
        },
        'all',
        '#stock_info_58110',
    ),
    app_shop.run(
        function () {
            $('.stocks_list_name').maxHeight(),
                $('.stocks_list_adress').maxHeight(),
                $('.stocks_list_phone').maxHeight(),
                $('.stocks_list_mail').maxHeight();
        },
        1,
        '.stocks_list_wrapper',
        !0,
    ),
    app_shop.run(
        function () {
            $('.stocks_list_name').maxHeight(),
                $('.stocks_list_adress').maxHeight(),
                $('.stocks_list_phone').maxHeight(),
                $('.stocks_list_mail').maxHeight();
        },
        2,
        '.stocks_list_wrapper',
        !0,
    ),
    app_shop.run(
        function () {
            $('.stocks_list_name').maxHeight(),
                $('.stocks_list_adress').maxHeight(),
                $('.stocks_list_phone').maxHeight(),
                $('.stocks_list_mail').maxHeight();
        },
        3,
        '.stocks_list_wrapper',
        !0,
    ),
    app_shop.run(
        function () {
            $('.stocks_list_name').maxHeight(),
                $('.stocks_list_adress').maxHeight(),
                $('.stocks_list_phone').maxHeight(),
                $('.stocks_list_mail').maxHeight();
        },
        4,
        '.stocks_list_wrapper',
        !0,
    );
var stocks_list_more_txt = 'wiÄcej informacji',
    stocks_list_on_map_txt = 'PokaĹź na mapie';
