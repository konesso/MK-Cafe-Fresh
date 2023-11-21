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
      let o = 0 === n ? 0 : i * (n / 100);
      return (o += t), (o = e - o), o > 0 ? o : 0;
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
        before: o,
        rebateValue: r,
        rebateType: a,
        currencyFormat: s,
        symbol: l,
        currencySpace: c,
        currencyBeforeValue: p,
      } = e;
      if (!t && !r) return !1;
      (this.currencyFormat =
        s || app_shop.vars?.currency?.format || app_shop.vars?.currency_format),
        (this.symbol = l || app_shop.vars?.currency?.symbol || app_shop.vars?.symbol),
        (this.currencySpace = c || app_shop.vars?.currency?.space || app_shop.vars?.currency_space),
        (this.currencyBeforeValue =
          p || app_shop.vars?.currency?.beforeValue || app_shop.vars.currency_before_value),
        (this.rebateType = a || 'percentage');
      const d =
        'percentage' === this.rebateType
          ? this.percentagePrice(+t, +n, +o, +r)
          : this.quotaPrice(+t, +n, +r),
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
        this.settings.selected.time.replace(t, (t, i, n, o) => {
          i && n && ((this.userTime = !0), (this.selectedHours = i), (this.selectedMinutes = n)),
            o && e ? (this.selectedKeeping = o) : e && (this.selectedKeeping = 'AM');
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
      n = `\n    <button type="button"\n      class="vanilla-calendar-month${t}"\n      data-calendar-selected-month="${this.selectedMonth
        }">\n      ${this.locale.months[this.selectedMonth]}\n    </button>`.replace(/[\n\t]/g, ''),
      o = `\n    <button type="button"\n      class="vanilla-calendar-year${i}"\n      data-calendar-selected-year="${this.selectedYear}">\n      ${this.selectedYear}\n    </button>`.replace(
        /[\n\t]/g,
        '',
      );
    let r = this.settings.visibility.templateHeader.replace('%M', n);
    (r = r.replace('%Y', o)), (e.innerHTML = r);
  }
  controlArrows() {
    if (!['default', 'year'].includes(this.currentType)) return;
    const e = this.HTMLElement.querySelector('.vanilla-calendar-arrow_prev'),
      t = this.HTMLElement.querySelector('.vanilla-calendar-arrow_next');
    (() => {
      if ('default' !== this.currentType) return;
      const i = this.selectedMonth === this.dateMin.getUTCMonth(),
        n = this.selectedMonth === this.dateMax.getUTCMonth(),
        o = !this.settings.selection.year || this.selectedYear === this.dateMin.getUTCFullYear(),
        r = !this.settings.selection.year || this.selectedYear === this.dateMax.getUTCFullYear();
      (i && o) || !this.settings.selection.month
        ? (e.style.visibility = 'hidden')
        : (e.style.visibility = null),
        (n && r) || !this.settings.selection.month
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
      const o = i[n],
        r = t.cloneNode(!0);
      this.settings.visibility.weekend && this.settings.iso8601
        ? (5 !== n && 6 !== n) || r.classList.add('vanilla-calendar-week__day_weekend')
        : this.settings.visibility.weekend &&
        !this.settings.iso8601 &&
        ((0 !== n && 6 !== n) || r.classList.add('vanilla-calendar-week__day_weekend')),
        (r.innerText = `${o}`),
        e.append(r);
    }
  }
  getWeekNumber(e) {
    const t = new Date(e).getUTCDate(),
      i = new Date(e).getUTCMonth(),
      n = new Date(e).getUTCFullYear(),
      o = new Date(n, i, t),
      r = new Date(Date.UTC(o.getUTCFullYear(), 0, 1)),
      a = Math.ceil(((o - r) / 864e5 + 1) / 7);
    return { year: o.getUTCFullYear(), week: a };
  }
  createWeekNumbers(e, t) {
    if (!this.settings.visibility.weekNumbers) return;
    const i = this.HTMLElement.querySelector('.vanilla-calendar-week-numbers'),
      n = this.HTMLElement.querySelectorAll('.vanilla-calendar-day__btn'),
      o = Math.ceil((e + t) / 7),
      r = document.createElement('span');
    (r.className = 'vanilla-calendar-week-number'), (i.innerHTML = '');
    for (let e = 0; e < o; e++) {
      const t = this.getWeekNumber(n[7 * e].dataset.calendarDay),
        o = r.cloneNode(!0);
      (o.innerText = `${t.week}`), (o.dataset.calendarYearWeek = `${t.year}`), i.append(o);
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
      o = document.createElement('div'),
      r = document.createElement('button');
    (o.className = 'vanilla-calendar-day'),
      (r.className = 'vanilla-calendar-day__btn'),
      (r.type = 'button'),
      ['single', 'multiple', 'multiple-ranged'].includes(this.settings.selection.day) &&
      n.classList.add('vanilla-calendar-days_selecting'),
      (n.innerHTML = '');
    const a = (e, t, i, n) => {
      !this.settings.visibility.weekend ||
        (0 !== t && 6 !== t) ||
        e.classList.add('vanilla-calendar-day__btn_weekend'),
        Array.isArray(this.settings.selected.holidays) &&
        this.settings.selected.holidays.forEach(t => {
          t === i && e.classList.add('vanilla-calendar-day__btn_holiday');
        });
      let o = this.date.today.getUTCDate(),
        r = this.date.today.getUTCMonth() + 1;
      (o = o < 10 ? `0${o}` : o), (r = r < 10 ? `0${r}` : r);
      const a = `${this.date.today.getUTCFullYear()}-${r}-${o}`;
      this.settings.visibility.today &&
        e.dataset.calendarDay === a &&
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
      s = (e, t, i, s, l) => {
        const c = o.cloneNode(!0),
          p = r.cloneNode(!0);
        l && p.classList.add(l),
          (p.innerText = e),
          (p.dataset.calendarDay = i),
          a(p, t, i, s),
          c.append(p),
          n.append(c);
      };
    (() => {
      let e = new Date(Date.UTC(this.selectedYear, this.selectedMonth, 0)).getUTCDate() - i,
        t = this.selectedYear,
        n = this.selectedMonth;
      0 === this.selectedMonth
        ? ((n = this.locale.months.length), (t = this.selectedYear - 1))
        : this.selectedMonth < 10 && (n = `0${this.selectedMonth}`);
      for (let o = 0; o < i; o++) {
        e += 1;
        const i = `${t}-${n}-${e}`,
          o = new Date(Date.UTC(this.selectedYear, this.selectedMonth, e - 1)).getUTCMonth() - 1,
          r = new Date(Date.UTC(this.selectedYear, o, e)).getUTCDay();
        s(e, r, i, !1, 'vanilla-calendar-day__btn_prev');
      }
    })(),
      (() => {
        for (let e = 1; e <= t; e++) {
          const t = new Date(Date.UTC(this.selectedYear, this.selectedMonth, e)),
            i = this.generateDate(t),
            n = t.getUTCDay();
          s(e, n, i, !0);
        }
      })(),
      (() => {
        const e = i + t,
          n = Math.ceil(e / this.locale.weekday.length),
          o = this.locale.weekday.length * n - e;
        let r = this.selectedYear,
          a = this.selectedMonth + 2;
        this.selectedMonth + 1 === this.locale.months.length
          ? ((a = '01'), (r = this.selectedYear + 1))
          : this.selectedMonth + 2 < 10 && (a = `0${this.selectedMonth + 2}`);
        for (let e = 1; e <= o; e++) {
          const t = `${r}-${a}-${e < 10 ? `0${e}` : e}`,
            i = new Date(Date.UTC(this.selectedYear, this.selectedMonth, e)).getUTCMonth() + 1,
            n = new Date(Date.UTC(this.selectedYear, i, e)).getUTCDay();
          s(e, n, t, !1, 'vanilla-calendar-day__btn_next');
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
        o = t.cloneNode(!0);
      n === this.selectedYear && o.classList.add('vanilla-calendar-years__year_selected'),
        n < this.dateMin.getUTCFullYear() &&
        o.classList.add('vanilla-calendar-years__year_disabled'),
        n > this.dateMax.getUTCFullYear() &&
        o.classList.add('vanilla-calendar-years__year_disabled'),
        (o.dataset.calendarYear = n),
        (o.innerText = `${n}`),
        e.append(o);
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
        o = t.cloneNode(!0);
      i === this.selectedMonth && o.classList.add('vanilla-calendar-months__month_selected'),
        i < this.dateMin.getUTCMonth() &&
        this.selectedYear === this.dateMin.getUTCFullYear() &&
        o.classList.add('vanilla-calendar-months__month_disabled'),
        i > this.dateMax.getUTCMonth() &&
        this.selectedYear === this.dateMax.getUTCFullYear() &&
        o.classList.add('vanilla-calendar-months__month_disabled'),
        (o.dataset.calendarMonth = i),
        (o.title = `${n}`),
        (o.innerText = `${this.settings.visibility.monthShort ? n.substring(0, 3) : n}`),
        e.append(o);
    }
  }
  controlTime(e) {
    const t = this.HTMLElement.querySelector('.vanilla-calendar-time__range input[name="hours"]'),
      i = this.HTMLElement.querySelector('.vanilla-calendar-time__range input[name="minutes"]'),
      n = this.HTMLElement.querySelector('.vanilla-calendar-time__hours input[name="hours"]'),
      o = this.HTMLElement.querySelector('.vanilla-calendar-time__minutes input[name="minutes"]'),
      r = this.HTMLElement.querySelector('.vanilla-calendar-time__keeping'),
      a = (e, t) => {
        e.addEventListener('mouseover', () => t.classList.add('is-focus'));
      },
      s = (e, t) => {
        e.addEventListener('mouseout', () => t.classList.remove('is-focus'));
      },
      l = (e, t, i) => {
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
      c = (e, t, i, n) => {
        e.addEventListener('input', e => {
          let o = Number(e.target.value);
          (o = o < 10 ? `0${o}` : `${o}`),
            'hours' === i && 12 === n
              ? Number(e.target.value) < n && Number(e.target.value) > 0
                ? ((t.value = o),
                  (this.selectedKeeping = 'AM'),
                  (r.innerText = this.selectedKeeping),
                  l(e, o, i))
                : (0 === Number(e.target.value)
                  ? ((this.selectedKeeping = 'AM'), (r.innerText = 'AM'))
                  : ((this.selectedKeeping = 'PM'), (r.innerText = 'PM')),
                  (t.value = this.transformTime12(e.target.value)),
                  l(e, this.transformTime12(e.target.value), i))
              : ((t.value = o), l(e, o, i));
        });
      },
      p = (e, t, i, n) => {
        t.addEventListener('change', t => {
          let o = Number(t.target.value);
          (o = o < 10 ? `0${o}` : `${o}`),
            'hours' === i && 12 === n
              ? t.target.value && Number(t.target.value) <= n && Number(t.target.value) > 0
                ? ((t.target.value = o),
                  (e.value = this.transformTime24(o, this.selectedKeeping)),
                  l(t, o, i))
                : t.target.value &&
                  Number(t.target.value) < 24 &&
                  (Number(t.target.value) > n || 0 === Number(t.target.value))
                  ? (0 === Number(t.target.value)
                    ? ((this.selectedKeeping = 'AM'), (r.innerText = 'AM'))
                    : ((this.selectedKeeping = 'PM'), (r.innerText = 'PM')),
                    (t.target.value = this.transformTime12(t.target.value)),
                    (e.value = o),
                    l(t, this.transformTime12(t.target.value), i))
                  : (t.target.value = this.selectedHours)
              : t.target.value && Number(t.target.value) <= n && Number(t.target.value) >= 0
                ? ((t.target.value = o), (e.value = o), l(t, o, i))
                : 'hours' === i
                  ? (t.target.value = this.selectedHours)
                  : 'minutes' === i && (t.target.value = this.selectedMinutes);
        });
      };
    a(t, n),
      a(i, o),
      s(t, n),
      s(i, o),
      c(t, n, 'hours', 24 === e ? 23 : e),
      c(i, o, 'minutes'),
      p(t, n, 'hours', 24 === e ? 23 : e),
      p(i, o, 'minutes', 59),
      r &&
      r.addEventListener('click', e => {
        r.innerText.includes('AM')
          ? (this.selectedKeeping = 'PM')
          : (this.selectedKeeping = 'AM'),
          (t.value = this.transformTime24(this.selectedHours, this.selectedKeeping)),
          l(e, this.selectedHours, 'hours'),
          (r.innerText = this.selectedKeeping);
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
      this.HTMLElement.querySelector(
        '.vanilla-calendar-info.--bottom',
      ).innerHTML = this.info.bottom;
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
        o = e.target.closest('.vanilla-calendar-day__btn'),
        r = e.target.closest('.vanilla-calendar-day__btn_prev'),
        a = e.target.closest('.vanilla-calendar-day__btn_next'),
        s = e.target.closest('.vanilla-calendar-year'),
        l = e.target.closest('.vanilla-calendar-years__year'),
        c = e.target.closest('.vanilla-calendar-month'),
        p = e.target.closest('.vanilla-calendar-months__month'),
        d = () => {
          o.classList.contains('vanilla-calendar-day__btn_selected')
            ? this.selectedDates.splice(this.selectedDates.indexOf(o.dataset.calendarDay), 1)
            : ((this.selectedDates = []), this.selectedDates.push(o.dataset.calendarDay));
        },
        u = () => {
          o.classList.contains('vanilla-calendar-day__btn_selected')
            ? this.selectedDates.splice(this.selectedDates.indexOf(o.dataset.calendarDay), 1)
            : this.selectedDates.push(o.dataset.calendarDay);
        },
        h = () => {
          if (
            (this.selectedDates.length > 1 && (this.selectedDates = []),
              this.selectedDates.push(o.dataset.calendarDay),
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
            o
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
              r ? this.changeMonth('prev') : a ? this.changeMonth('next') : this.createDays();
          }
        })(),
        (() => {
          this.settings.selection.year &&
            (t && 'year' === this.currentType
              ? (n ? (this.viewYear += 15) : i && (this.viewYear -= 15), this.createYears())
              : 'year' !== this.currentType && s
                ? this.createYears()
                : 'year' === this.currentType && s
                  ? ((this.currentType = this.type), this.update())
                  : l &&
                  ((this.selectedYear = Number(l.dataset.calendarYear)),
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
            ('month' !== this.currentType && c
              ? this.createMonths()
              : 'month' === this.currentType && c
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
  const { form: t, formSelector: i, afterValidate: n, afterValidateForm: o } = e || {};
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
    (this.callbacks = { validate: n, validateAll: o }),
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
        { value: o } = t,
        r = this.queries.VALIDATE_FIRSTNAME_QUERY(o);
      if (i) return this.queries.VALIDATE_FIRSTNAME_QUERY(o);
      const a = n || (await this.fetchData(r)),
        { messages: s } = a?.data?.validateClientData || a;
      return s?.length ? this.concatErrorMessages(s) : '';
    }),
    (this.validateLastnameGQL = async e => {
      const { input: t, getQuery: i, response: n } = e,
        { value: o } = t,
        r = this.queries.VALIDATE_LASTNAME_QUERY(o);
      if (i) return this.queries.VALIDATE_LASTNAME_QUERY(o);
      const a = n || (await this.fetchData(r)),
        { messages: s } = a?.data?.validateClientData || a;
      return s?.length ? this.concatErrorMessages(s) : '';
    }),
    (this.validateAdditionalGQL = async e => {
      const { input: t, getQuery: i, response: n } = e,
        { value: o } = t,
        r = this.queries.VALIDATE_ADDITIONAL_QUERY(o);
      if (i) return r;
      const a = n || (await this.fetchData(r)),
        { messages: s } = a?.data?.validateClientData || a;
      return s?.length ? this.concatErrorMessages(s) : '';
    }),
    (this.validateNipGQL = async e => {
      const { input: t, getQuery: i, response: n } = e,
        { value: o } = t,
        { region: r } = t.dataset,
        a = this.queries.VALIDATE_NIP_QUERY(o, r);
      if (i) return a;
      const s = n || (await this.fetchData(a)),
        { messages: l } = s?.data?.validateClientData || s;
      return l?.length ? this.concatErrorMessages(l) : '';
    }),
    (this.validateStreetGQL = async e => {
      const { input: t, getQuery: i, response: n } = e,
        { value: o } = t,
        { concatFrom: r, region: a } = t.dataset,
        s = this.form?.querySelector(r),
        l = `${o} ${s?.value || ''}`,
        c = this.queries.VALIDATE_STREET_QUERY(l, a);
      if (i) return c;
      const p = n || (await this.fetchData(c)),
        { messages: d } = p?.data?.validateClientData || p;
      return d?.length
        ? s && 'no_street_number' === d[0].code
          ? (this.setValidityState(s, this.concatErrorMessages(d)), '')
          : this.concatErrorMessages(d)
        : (s && this.setValidityState(s, ''), '');
    }),
    (this.validateZipcodeGQL = async e => {
      const { input: t, getQuery: i, response: n } = e,
        { value: o } = t,
        { region: r } = t.dataset,
        a = this.queries.VALIDATE_ZIPCODE_QUERY(o, r);
      if (i) return a;
      const s = n || (await this.fetchData(a)),
        { messages: l } = s?.data?.validateClientData || s;
      return l?.length ? this.concatErrorMessages(l) : '';
    }),
    (this.validateCityGQL = async e => {
      const { input: t, getQuery: i, response: n } = e,
        { value: o } = t,
        r = this.queries.VALIDATE_CITY_QUERY(o);
      if (i) return r;
      const a = n || (await this.fetchData(r)),
        { messages: s } = a?.data?.validateClientData || a;
      return s?.length ? this.concatErrorMessages(s) : '';
    }),
    (this.validatePhone = e => {
      const { input: t, getQuery: i } = e;
      if (i) return '';
      const { value: n } = t;
      return n.length >= 9 ? '' : this.concatErrorMessages([{ code: 'incorect_phone' }]);
    }),
    (this.validatePhoneGQL = async e => {
      const { input: t, getQuery: i, response: n } = e,
        { value: o } = t,
        { region: r } = t.dataset;
      if (!r) return this.validatePhone(e);
      const a = this.queries.VALIDATE_PHONE_QUERY(o, r);
      if (i) return a;
      const s = n || (await this.fetchData(a)),
        { messages: l } = s?.data?.validateClientData || s;
      return l?.length ? this.concatErrorMessages(l) : '';
    }),
    (this.validateEmailGQL = async e => {
      const { input: t, getQuery: i, response: n } = e,
        { value: o } = t,
        r = this.queries.VALIDATE_EMAIL_QUERY(o);
      if (i) return r;
      const a = n || (await this.fetchData(r)),
        { messages: s } = a?.data?.validateClientData || a;
      return s?.length ? this.concatErrorMessages(s) : '';
    }),
    (this.validateBirthdateGQL = async e => {
      const { input: t, getQuery: i, response: n } = e,
        { value: o } = t,
        r = this.queries.VALIDATE_BIRTHDATE_QUERY(o);
      if (i) return r;
      const a = n || (await this.fetchData(r)),
        { messages: s } = a?.data?.validateClientData || a;
      return s?.length ? this.concatErrorMessages(s) : '';
    }),
    (this.validateLoginGQL = async e => {
      const { input: t, getQuery: i, response: n } = e,
        { value: o } = t,
        r = this.queries.VALIDATE_LOGIN_QUERY(o);
      if (i) return r;
      const a = n || (await this.fetchData(r)),
        { messages: s } = a?.data?.validateClientData || a;
      return s?.length ? this.concatErrorMessages(s) : '';
    }),
    (this.validatePasswordGQL = async e => {
      const { input: t, getQuery: i, response: n } = e,
        { value: o } = t,
        r = this.queries.VALIDATE_PASSWORD_QUERY(o);
      if (i) return r;
      const a = n || (await this.fetchData(r)),
        { messages: s } = a?.data?.validateClientData || a;
      return s?.length ? this.concatErrorMessages(s) : '';
    }),
    (this.validateIBANGQL = async e => {
      const { input: t, getQuery: i } = e,
        { value: n } = t;
      if (i) return '';
      const o = await fetch(`/ajax/payments.php?action=verify_iban&bankAccount=${n}`),
        r = await o.json(),
        { errno: a } = r || {};
      return a ? this.concatErrorMessages([{ code: 'incorrect_iban' }]) : '';
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
          const o = await this.validateGraphQL({ input: n, response: i.data[t] });
          this.setValidityState(n, o);
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
        { graphql: o } = t.dataset;
      if (!o) return !1;
      const r = o.split(' ');
      switch (1 === r.length ? r[0] : this.getGQLType(t)) {
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
            console.warn(`No support for validation '${o}' in validateClientData GraphQL`),
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
        const o = { dataset: {} };
        (o.value = 'street' === i && e.streetNumber ? `${n} ${e.streetNumber}` : n),
          (o.dataset.region = e.region),
          (o.dataset.graphql = i);
        const r = await this.validateGraphQL({ input: o, getQuery: !0 });
        r && (t += `${i}:${r}`);
      }
      if ('' === t) return !0;
      const i = await this.fetchData(t);
      if (!i?.data) return !0;
      const n = [];
      for (const [t, o] of Object.entries(i.data)) {
        const r = { dataset: {} };
        (r.value = 'street' === t && e.streetNumber ? `${o} ${e.streetNumber}` : o),
          (r.dataset.region = e.region),
          (r.dataset.graphql = t),
          n.push(await this.validateGraphQL({ input: r, response: i.data[t] }));
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
      const o = t.querySelectorAll(
        'select.f-select.--validate:not(:disabled), div.f-select.--validate select:not(:disabled)',
      ),
        r = [...o].filter(e => e.closest('.f-feedback:not(.--error):not(.--success)'));
      this.validateSelects(r);
      const a = t.querySelectorAll('.f-control.--validate[type="checkbox"]:not(:disabled)'),
        s = [...a].filter(e =>
          e.closest(
            '.--checkbox:not(.--error):not(.--success), .--switch:not(.--error):not(.--success)',
          ),
        );
      this.validateCheckboxes(s);
      const l = [...i].filter(e => e.closest('.f-feedback.--error')),
        c = [...o].filter(e => e.closest('.f-feedback.--error')),
        p = [...a].filter(e =>
          e.closest('.--checkbox.--error, .--switch.--error, .f-feedback.--error'),
        );
      return l.length || c.length || p.length
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
      const o = !i && (n.querySelector('.f-message') || this.createMessageElement(n));
      return (
        n.classList.toggle('--empty', '' === e.value),
        '' === t
          ? (n.classList.add('--success'),
            o && (o.textContent = ''),
            'function' == typeof this.callbacks.validate && this.callbacks.validate(e, !0),
            !0)
          : (n.classList.add('--error'),
            o && (o.textContent = t),
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
    const o = `${i || this.urls.gql || '/graphql/v1/'}${n}`;
    try {
      const e = await fetch(o, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json', Accept: 'application/json' },
        body: t,
      });
      if (!e.ok) throw new Error(`HTTP error! status: ${e.status}`);
      return await e.json();
    } catch (e) {
      throw new Error(
        `A connection error occurred. It was not possible to retrieve data from ${o}`,
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
          let o = e[n];
          if (o.startsWith(t) && o.endsWith('?=')) {
            o = o.slice(t.length, -'?='.length);
            const e = window.atob(o),
              r = new Uint8Array(e.length);
            for (let t = 0; t < e.length; t++) r[t] = e.charCodeAt(t);
            i[n] = r.buffer;
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
      o = this.recursiveBase64StrToArrayBuffer(n),
      r = await navigator.credentials.create(o),
      { clientDataJSON: a, attestationObject: s } = r?.response || {},
      l = {
        userLogin: e,
        domain: window.location.hostname,
        authenticatorTransportMethods: r.response.getTransports ? r.response.getTransports() : [],
        clientDataJSONBase64: a ? this.arrayBufferToBase64(a) : '',
        attestationObjectBase64: s ? this.arrayBufferToBase64(s) : '',
      },
      c = await this.fetchData({ data: JSON.stringify(l), url: this.urls.register });
    this.checkResponse(c), console.log(c);
  }
  async login() {
    (await this.checkBrowserSupport()) || this.browserNotSupported();
    const e = { domain: window.location.hostname },
      t = await this.fetchData({ data: JSON.stringify(e), url: this.urls.generateLogin });
    this.checkResponse(t);
    const i = JSON.parse(t.data),
      n = this.recursiveBase64StrToArrayBuffer(i),
      o = await navigator.credentials.get(n),
      {
        rawId: r,
        response: { clientDataJSON: a, authenticatorData: s, signature: l, userHandle: c },
      } = o || {},
      p = {
        domain: window.location.hostname,
        publicKeyCredentialBinRawId: r ? this.arrayBufferToBase64(r) : null,
        clientDataJSONBase64: a ? this.arrayBufferToBase64(a) : null,
        authenticatorDataBase64: s ? this.arrayBufferToBase64(s) : null,
        signatureBase64: l ? this.arrayBufferToBase64(l) : null,
        userHandleBinBase64: c ? this.arrayBufferToBase64(c) : null,
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
(app_shop.fn.cookie = {
  get: function (e) {
    const t = document.cookie.split(';');
    for (let i = 0; i < t.length; i++) {
      const n = t[i].trim(),
        [o, r] = n.split('=');
      if (o === e) return decodeURIComponent(r);
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
      o = i.slice,
      r = i.flat
        ? function (e) {
          return i.flat.call(e);
        }
        : function (e) {
          return i.concat.apply([], e);
        },
      a = i.push,
      s = i.indexOf,
      l = {},
      c = l.toString,
      p = l.hasOwnProperty,
      d = p.toString,
      u = d.call(Object),
      h = {},
      _ = function (e) {
        return 'function' == typeof e && 'number' != typeof e.nodeType;
      },
      f = function (e) {
        return null != e && e === e.window;
      },
      m = e.document,
      g = { type: !0, src: !0, nonce: !0, noModule: !0 };
    function y(e, t, i) {
      var n,
        o,
        r = (i = i || m).createElement('script');
      if (((r.text = e), t))
        for (n in g) (o = t[n] || (t.getAttribute && t.getAttribute(n))) && r.setAttribute(n, o);
      i.head.appendChild(r).parentNode.removeChild(r);
    }
    function v(e) {
      return null == e
        ? e + ''
        : 'object' == typeof e || 'function' == typeof e
          ? l[c.call(e)] || 'object'
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
        !_(e) &&
        !f(e) &&
        ('array' === i || 0 === t || ('number' == typeof t && 0 < t && t - 1 in e))
      );
    }
    (w.fn = w.prototype = {
      jquery: b,
      constructor: w,
      length: 0,
      toArray: function () {
        return o.call(this);
      },
      get: function (e) {
        return null == e ? o.call(this) : e < 0 ? this[e + this.length] : this[e];
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
        return this.pushStack(o.apply(this, arguments));
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
      push: a,
      sort: i.sort,
      splice: i.splice,
    }),
      (w.extend = w.fn.extend = function () {
        var e,
          t,
          i,
          n,
          o,
          r,
          a = arguments[0] || {},
          s = 1,
          l = arguments.length,
          c = !1;
        for (
          'boolean' == typeof a && ((c = a), (a = arguments[s] || {}), s++),
          'object' == typeof a || _(a) || (a = {}),
          s === l && ((a = this), s--);
          s < l;
          s++
        )
          if (null != (e = arguments[s]))
            for (t in e)
              (n = e[t]),
                '__proto__' !== t &&
                a !== n &&
                (c && n && (w.isPlainObject(n) || (o = Array.isArray(n)))
                  ? ((i = a[t]),
                    (r = o && !Array.isArray(i) ? [] : o || w.isPlainObject(i) ? i : {}),
                    (o = !1),
                    (a[t] = w.extend(c, r, n)))
                  : void 0 !== n && (a[t] = n));
        return a;
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
            '[object Object]' !== c.call(e) ||
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
            null != e && (k(Object(e)) ? w.merge(i, 'string' == typeof e ? [e] : e) : a.call(i, e)),
            i
          );
        },
        inArray: function (e, t, i) {
          return null == t ? -1 : s.call(t, e, i);
        },
        merge: function (e, t) {
          for (var i = +t.length, n = 0, o = e.length; n < i; n++) e[o++] = t[n];
          return (e.length = o), e;
        },
        grep: function (e, t, i) {
          for (var n = [], o = 0, r = e.length, a = !i; o < r; o++)
            !t(e[o], o) !== a && n.push(e[o]);
          return n;
        },
        map: function (e, t, i) {
          var n,
            o,
            a = 0,
            s = [];
          if (k(e)) for (n = e.length; a < n; a++) null != (o = t(e[a], a, i)) && s.push(o);
          else for (a in e) null != (o = t(e[a], a, i)) && s.push(o);
          return r(s);
        },
        guid: 1,
        support: h,
      }),
      'function' == typeof Symbol && (w.fn[Symbol.iterator] = i[Symbol.iterator]),
      w.each(
        'Boolean Number String Function Array Date RegExp Object Error Symbol'.split(' '),
        function (e, t) {
          l['[object ' + t + ']'] = t.toLowerCase();
        },
      );
    var x = (function (e) {
      var t,
        i,
        n,
        o,
        r,
        a,
        s,
        l,
        c,
        p,
        d,
        u,
        h,
        _,
        f,
        m,
        g,
        y,
        v,
        b = 'sizzle' + 1 * new Date(),
        w = e.document,
        k = 0,
        x = 0,
        $ = le(),
        C = le(),
        S = le(),
        z = le(),
        j = function (e, t) {
          return e === t && (d = !0), 0;
        },
        T = {}.hasOwnProperty,
        D = [],
        A = D.pop,
        E = D.push,
        L = D.push,
        O = D.slice,
        M = function (e, t) {
          for (var i = 0, n = e.length; i < n; i++) if (e[i] === t) return i;
          return -1;
        },
        P =
          'checked|selected|async|autofocus|autoplay|controls|defer|disabled|hidden|ismap|loop|multiple|open|readonly|required|scoped',
        N = '[\\x20\\t\\r\\n\\f]',
        I = '(?:\\\\[\\da-fA-F]{1,6}' + N + '?|\\\\[^\\r\\n\\f]|[\\w-]|[^\0-\\x7f])+',
        q =
          '\\[' +
          N +
          '*(' +
          I +
          ')(?:' +
          N +
          '*([*^$|!~]?=)' +
          N +
          '*(?:\'((?:\\\\.|[^\\\\\'])*)\'|"((?:\\\\.|[^\\\\"])*)"|(' +
          I +
          '))|)' +
          N +
          '*\\]',
        F =
          ':(' +
          I +
          ')(?:\\(((\'((?:\\\\.|[^\\\\\'])*)\'|"((?:\\\\.|[^\\\\"])*)")|((?:\\\\.|[^\\\\()[\\]]|' +
          q +
          ')*)|.*)\\)|)',
        H = new RegExp(N + '+', 'g'),
        B = new RegExp('^' + N + '+|((?:^|[^\\\\])(?:\\\\.)*)' + N + '+$', 'g'),
        R = new RegExp('^' + N + '*,' + N + '*'),
        W = new RegExp('^' + N + '*([>+~]|' + N + ')' + N + '*'),
        Y = new RegExp(N + '|>'),
        U = new RegExp(F),
        Q = new RegExp('^' + I + '$'),
        V = {
          ID: new RegExp('^#(' + I + ')'),
          CLASS: new RegExp('^\\.(' + I + ')'),
          TAG: new RegExp('^(' + I + '|[*])'),
          ATTR: new RegExp('^' + q),
          PSEUDO: new RegExp('^' + F),
          CHILD: new RegExp(
            '^:(only|first|last|nth|nth-last)-(child|of-type)(?:\\(' +
            N +
            '*(even|odd|(([+-]|)(\\d*)n|)' +
            N +
            '*(?:([+-]|)' +
            N +
            '*(\\d+)|))' +
            N +
            '*\\)|)',
            'i',
          ),
          bool: new RegExp('^(?:' + P + ')$', 'i'),
          needsContext: new RegExp(
            '^' +
            N +
            '*[>+~]|:(even|odd|eq|gt|lt|nth|first|last)(?:\\(' +
            N +
            '*((?:-\\d)?\\d*)' +
            N +
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
        te = new RegExp('\\\\[\\da-fA-F]{1,6}' + N + '?|\\\\([^\\r\\n\\f])', 'g'),
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
        oe = function (e, t) {
          return t
            ? '\0' === e
              ? 'ďż˝'
              : e.slice(0, -1) + '\\' + e.charCodeAt(e.length - 1).toString(16) + ' '
            : '\\' + e;
        },
        re = function () {
          u();
        },
        ae = be(
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
      function se(e, t, n, o) {
        var r,
          s,
          c,
          p,
          d,
          _,
          g,
          y = t && t.ownerDocument,
          w = t ? t.nodeType : 9;
        if (((n = n || []), 'string' != typeof e || !e || (1 !== w && 9 !== w && 11 !== w)))
          return n;
        if (!o && (u(t), (t = t || h), f)) {
          if (11 !== w && (d = X.exec(e)))
            if ((r = d[1])) {
              if (9 === w) {
                if (!(c = t.getElementById(r))) return n;
                if (c.id === r) return n.push(c), n;
              } else if (y && (c = y.getElementById(r)) && v(t, c) && c.id === r)
                return n.push(c), n;
            } else {
              if (d[2]) return L.apply(n, t.getElementsByTagName(e)), n;
              if ((r = d[3]) && i.getElementsByClassName && t.getElementsByClassName)
                return L.apply(n, t.getElementsByClassName(r)), n;
            }
          if (
            i.qsa &&
            !z[e + ' '] &&
            (!m || !m.test(e)) &&
            (1 !== w || 'object' !== t.nodeName.toLowerCase())
          ) {
            if (((g = e), (y = t), 1 === w && (Y.test(e) || W.test(e)))) {
              for (
                ((y = (ee.test(e) && ge(t.parentNode)) || t) === t && i.scope) ||
                ((p = t.getAttribute('id'))
                  ? (p = p.replace(ne, oe))
                  : t.setAttribute('id', (p = b))),
                s = (_ = a(e)).length;
                s--;

              )
                _[s] = (p ? '#' + p : ':scope') + ' ' + ve(_[s]);
              g = _.join(',');
            }
            try {
              return L.apply(n, y.querySelectorAll(g)), n;
            } catch (t) {
              z(e, !0);
            } finally {
              p === b && t.removeAttribute('id');
            }
          }
        }
        return l(e.replace(B, '$1'), t, n, o);
      }
      function le() {
        var e = [];
        return function t(i, o) {
          return e.push(i + ' ') > n.cacheLength && delete t[e.shift()], (t[i + ' '] = o);
        };
      }
      function ce(e) {
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
        for (var i = e.split('|'), o = i.length; o--;) n.attrHandle[i[o]] = t;
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
      function _e(e) {
        return function (t) {
          var i = t.nodeName.toLowerCase();
          return ('input' === i || 'button' === i) && t.type === e;
        };
      }
      function fe(e) {
        return function (t) {
          return 'form' in t
            ? t.parentNode && !1 === t.disabled
              ? 'label' in t
                ? 'label' in t.parentNode
                  ? t.parentNode.disabled === e
                  : t.disabled === e
                : t.isDisabled === e || (t.isDisabled !== !e && ae(t) === e)
              : t.disabled === e
            : 'label' in t && t.disabled === e;
        };
      }
      function me(e) {
        return ce(function (t) {
          return (
            (t = +t),
            ce(function (i, n) {
              for (var o, r = e([], i.length, t), a = r.length; a--;)
                i[(o = r[a])] && (i[o] = !(n[o] = i[o]));
            })
          );
        });
      }
      function ge(e) {
        return e && void 0 !== e.getElementsByTagName && e;
      }
      for (t in ((i = se.support = {}),
        (r = se.isXML = function (e) {
          var t = e.namespaceURI,
            i = (e.ownerDocument || e).documentElement;
          return !G.test(t || (i && i.nodeName) || 'HTML');
        }),
        (u = se.setDocument = function (e) {
          var t,
            o,
            a = e ? e.ownerDocument || e : w;
          return (
            a != h &&
            9 === a.nodeType &&
            a.documentElement &&
            ((_ = (h = a).documentElement),
              (f = !r(h)),
              w != h &&
              (o = h.defaultView) &&
              o.top !== o &&
              (o.addEventListener
                ? o.addEventListener('unload', re, !1)
                : o.attachEvent && o.attachEvent('onunload', re)),
              (i.scope = pe(function (e) {
                return (
                  _.appendChild(e).appendChild(h.createElement('div')),
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
                  (_.appendChild(e).id = b), !h.getElementsByName || !h.getElementsByName(b).length
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
                    if (void 0 !== t.getElementById && f) {
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
                    if (void 0 !== t.getElementById && f) {
                      var i,
                        n,
                        o,
                        r = t.getElementById(e);
                      if (r) {
                        if ((i = r.getAttributeNode('id')) && i.value === e) return [r];
                        for (o = t.getElementsByName(e), n = 0; (r = o[n++]);)
                          if ((i = r.getAttributeNode('id')) && i.value === e) return [r];
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
                    o = 0,
                    r = t.getElementsByTagName(e);
                  if ('*' === e) {
                    for (; (i = r[o++]);) 1 === i.nodeType && n.push(i);
                    return n;
                  }
                  return r;
                }),
              (n.find.CLASS =
                i.getElementsByClassName &&
                function (e, t) {
                  if (void 0 !== t.getElementsByClassName && f) return t.getElementsByClassName(e);
                }),
              (g = []),
              (m = []),
              (i.qsa = K.test(h.querySelectorAll)) &&
              (pe(function (e) {
                var t;
                (_.appendChild(e).innerHTML =
                  "<a id='" +
                  b +
                  "'></a><select id='" +
                  b +
                  "-\r\\' msallowcapture=''><option selected=''></option></select>"),
                  e.querySelectorAll("[msallowcapture^='']").length &&
                  m.push('[*^$]=' + N + '*(?:\'\'|"")'),
                  e.querySelectorAll('[selected]').length ||
                  m.push('\\[' + N + '*(?:value|' + P + ')'),
                  e.querySelectorAll('[id~=' + b + '-]').length || m.push('~='),
                  (t = h.createElement('input')).setAttribute('name', ''),
                  e.appendChild(t),
                  e.querySelectorAll("[name='']").length ||
                  m.push('\\[' + N + '*name' + N + '*=' + N + '*(?:\'\'|"")'),
                  e.querySelectorAll(':checked').length || m.push(':checked'),
                  e.querySelectorAll('a#' + b + '+*').length || m.push('.#.+[+~]'),
                  e.querySelectorAll('\\\f'),
                  m.push('[\\r\\n\\f]');
              }),
                pe(function (e) {
                  e.innerHTML =
                    "<a href='' disabled='disabled'></a><select disabled='disabled'><option/></select>";
                  var t = h.createElement('input');
                  t.setAttribute('type', 'hidden'),
                    e.appendChild(t).setAttribute('name', 'D'),
                    e.querySelectorAll('[name=d]').length && m.push('name' + N + '*[*^$|!~]?='),
                    2 !== e.querySelectorAll(':enabled').length && m.push(':enabled', ':disabled'),
                    (_.appendChild(e).disabled = !0),
                    2 !== e.querySelectorAll(':disabled').length && m.push(':enabled', ':disabled'),
                    e.querySelectorAll('*,:x'),
                    m.push(',.*:');
                })),
              (i.matchesSelector = K.test(
                (y =
                  _.matches ||
                  _.webkitMatchesSelector ||
                  _.mozMatchesSelector ||
                  _.oMatchesSelector ||
                  _.msMatchesSelector),
              )) &&
              pe(function (e) {
                (i.disconnectedMatch = y.call(e, '*')), y.call(e, "[s!='']:x"), g.push('!=', F);
              }),
              (m = m.length && new RegExp(m.join('|'))),
              (g = g.length && new RegExp(g.join('|'))),
              (t = K.test(_.compareDocumentPosition)),
              (v =
                t || K.test(_.contains)
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
              (j = t
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
                    o = e.parentNode,
                    r = t.parentNode,
                    a = [e],
                    s = [t];
                  if (!o || !r)
                    return e == h ? -1 : t == h ? 1 : o ? -1 : r ? 1 : p ? M(p, e) - M(p, t) : 0;
                  if (o === r) return ue(e, t);
                  for (i = e; (i = i.parentNode);) a.unshift(i);
                  for (i = t; (i = i.parentNode);) s.unshift(i);
                  for (; a[n] === s[n];) n++;
                  return n ? ue(a[n], s[n]) : a[n] == w ? -1 : s[n] == w ? 1 : 0;
                })),
            h
          );
        }),
        (se.matches = function (e, t) {
          return se(e, null, null, t);
        }),
        (se.matchesSelector = function (e, t) {
          if (
            (u(e), i.matchesSelector && f && !z[t + ' '] && (!g || !g.test(t)) && (!m || !m.test(t)))
          )
            try {
              var n = y.call(e, t);
              if (n || i.disconnectedMatch || (e.document && 11 !== e.document.nodeType)) return n;
            } catch (e) {
              z(t, !0);
            }
          return 0 < se(t, h, null, [e]).length;
        }),
        (se.contains = function (e, t) {
          return (e.ownerDocument || e) != h && u(e), v(e, t);
        }),
        (se.attr = function (e, t) {
          (e.ownerDocument || e) != h && u(e);
          var o = n.attrHandle[t.toLowerCase()],
            r = o && T.call(n.attrHandle, t.toLowerCase()) ? o(e, t, !f) : void 0;
          return void 0 !== r
            ? r
            : i.attributes || !f
              ? e.getAttribute(t)
              : (r = e.getAttributeNode(t)) && r.specified
                ? r.value
                : null;
        }),
        (se.escape = function (e) {
          return (e + '').replace(ne, oe);
        }),
        (se.error = function (e) {
          throw new Error('Syntax error, unrecognized expression: ' + e);
        }),
        (se.uniqueSort = function (e) {
          var t,
            n = [],
            o = 0,
            r = 0;
          if (((d = !i.detectDuplicates), (p = !i.sortStable && e.slice(0)), e.sort(j), d)) {
            for (; (t = e[r++]);) t === e[r] && (o = n.push(r));
            for (; o--;) e.splice(n[o], 1);
          }
          return (p = null), e;
        }),
        (o = se.getText = function (e) {
          var t,
            i = '',
            n = 0,
            r = e.nodeType;
          if (r) {
            if (1 === r || 9 === r || 11 === r) {
              if ('string' == typeof e.textContent) return e.textContent;
              for (e = e.firstChild; e; e = e.nextSibling) i += o(e);
            } else if (3 === r || 4 === r) return e.nodeValue;
          } else for (; (t = e[n++]);) i += o(t);
          return i;
        }),
        ((n = se.selectors = {
          cacheLength: 50,
          createPseudo: ce,
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
                  ? (e[3] || se.error(e[0]),
                    (e[4] = +(e[4] ? e[5] + (e[6] || 1) : 2 * ('even' === e[3] || 'odd' === e[3]))),
                    (e[5] = +(e[7] + e[8] || 'odd' === e[3])))
                  : e[3] && se.error(e[0]),
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
                  (t = a(i, !0)) &&
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
              var t = $[e + ' '];
              return (
                t ||
                ((t = new RegExp('(^|' + N + ')' + e + '(' + N + '|$)')) &&
                  $(e, function (e) {
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
                var o = se.attr(n, e);
                return null == o
                  ? '!=' === t
                  : !t ||
                  ((o += ''),
                    '=' === t
                      ? o === i
                      : '!=' === t
                        ? o !== i
                        : '^=' === t
                          ? i && 0 === o.indexOf(i)
                          : '*=' === t
                            ? i && -1 < o.indexOf(i)
                            : '$=' === t
                              ? i && o.slice(-i.length) === i
                              : '~=' === t
                                ? -1 < (' ' + o.replace(H, ' ') + ' ').indexOf(i)
                                : '|=' === t && (o === i || o.slice(0, i.length + 1) === i + '-'));
              };
            },
            CHILD: function (e, t, i, n, o) {
              var r = 'nth' !== e.slice(0, 3),
                a = 'last' !== e.slice(-4),
                s = 'of-type' === t;
              return 1 === n && 0 === o
                ? function (e) {
                  return !!e.parentNode;
                }
                : function (t, i, l) {
                  var c,
                    p,
                    d,
                    u,
                    h,
                    _,
                    f = r !== a ? 'nextSibling' : 'previousSibling',
                    m = t.parentNode,
                    g = s && t.nodeName.toLowerCase(),
                    y = !l && !s,
                    v = !1;
                  if (m) {
                    if (r) {
                      for (; f;) {
                        for (u = t; (u = u[f]);)
                          if (s ? u.nodeName.toLowerCase() === g : 1 === u.nodeType) return !1;
                        _ = f = 'only' === e && !_ && 'nextSibling';
                      }
                      return !0;
                    }
                    if (((_ = [a ? m.firstChild : m.lastChild]), a && y)) {
                      for (
                        v =
                        (h =
                          (c =
                            (p =
                              (d = (u = m)[b] || (u[b] = {}))[u.uniqueID] ||
                              (d[u.uniqueID] = {}))[e] || [])[0] === k && c[1]) && c[2],
                        u = h && m.childNodes[h];
                        (u = (++h && u && u[f]) || (v = h = 0) || _.pop());

                      )
                        if (1 === u.nodeType && ++v && u === t) {
                          p[e] = [k, h, v];
                          break;
                        }
                    } else if (
                      (y &&
                        (v = h =
                          (c =
                            (p =
                              (d = (u = t)[b] || (u[b] = {}))[u.uniqueID] || (d[u.uniqueID] = {}))[
                            e
                            ] || [])[0] === k && c[1]),
                        !1 === v)
                    )
                      for (
                        ;
                        (u = (++h && u && u[f]) || (v = h = 0) || _.pop()) &&
                        ((s ? u.nodeName.toLowerCase() !== g : 1 !== u.nodeType) ||
                          !++v ||
                          (y &&
                            ((p = (d = u[b] || (u[b] = {}))[u.uniqueID] || (d[u.uniqueID] = {}))[
                              e
                            ] = [k, v]),
                            u !== t));

                      );
                    return (v -= o) === n || (v % n == 0 && 0 <= v / n);
                  }
                };
            },
            PSEUDO: function (e, t) {
              var i,
                o =
                  n.pseudos[e] ||
                  n.setFilters[e.toLowerCase()] ||
                  se.error('unsupported pseudo: ' + e);
              return o[b]
                ? o(t)
                : 1 < o.length
                  ? ((i = [e, e, '', t]),
                    n.setFilters.hasOwnProperty(e.toLowerCase())
                      ? ce(function (e, i) {
                        for (var n, r = o(e, t), a = r.length; a--;)
                          e[(n = M(e, r[a]))] = !(i[n] = r[a]);
                      })
                      : function (e) {
                        return o(e, 0, i);
                      })
                  : o;
            },
          },
          pseudos: {
            not: ce(function (e) {
              var t = [],
                i = [],
                n = s(e.replace(B, '$1'));
              return n[b]
                ? ce(function (e, t, i, o) {
                  for (var r, a = n(e, null, o, []), s = e.length; s--;)
                    (r = a[s]) && (e[s] = !(t[s] = r));
                })
                : function (e, o, r) {
                  return (t[0] = e), n(t, null, r, i), (t[0] = null), !i.pop();
                };
            }),
            has: ce(function (e) {
              return function (t) {
                return 0 < se(e, t).length;
              };
            }),
            contains: ce(function (e) {
              return (
                (e = e.replace(te, ie)),
                function (t) {
                  return -1 < (t.textContent || o(t)).indexOf(e);
                }
              );
            }),
            lang: ce(function (e) {
              return (
                Q.test(e || '') || se.error('unsupported lang: ' + e),
                (e = e.replace(te, ie).toLowerCase()),
                function (t) {
                  var i;
                  do {
                    if ((i = f ? t.lang : t.getAttribute('xml:lang') || t.getAttribute('lang')))
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
              return e === _;
            },
            focus: function (e) {
              return (
                e === h.activeElement &&
                (!h.hasFocus || h.hasFocus()) &&
                !!(e.type || e.href || ~e.tabIndex)
              );
            },
            enabled: fe(!1),
            disabled: fe(!0),
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
            first: me(function () {
              return [0];
            }),
            last: me(function (e, t) {
              return [t - 1];
            }),
            eq: me(function (e, t, i) {
              return [i < 0 ? i + t : i];
            }),
            even: me(function (e, t) {
              for (var i = 0; i < t; i += 2) e.push(i);
              return e;
            }),
            odd: me(function (e, t) {
              for (var i = 1; i < t; i += 2) e.push(i);
              return e;
            }),
            lt: me(function (e, t, i) {
              for (var n = i < 0 ? i + t : t < i ? t : i; 0 <= --n;) e.push(n);
              return e;
            }),
            gt: me(function (e, t, i) {
              for (var n = i < 0 ? i + t : i; ++n < t;) e.push(n);
              return e;
            }),
          },
        }).pseudos.nth = n.pseudos.eq),
        { radio: !0, checkbox: !0, file: !0, password: !0, image: !0 }))
        n.pseudos[t] = he(t);
      for (t in { submit: !0, reset: !0 }) n.pseudos[t] = _e(t);
      function ye() { }
      function ve(e) {
        for (var t = 0, i = e.length, n = ''; t < i; t++) n += e[t].value;
        return n;
      }
      function be(e, t, i) {
        var n = t.dir,
          o = t.next,
          r = o || n,
          a = i && 'parentNode' === r,
          s = x++;
        return t.first
          ? function (t, i, o) {
            for (; (t = t[n]);) if (1 === t.nodeType || a) return e(t, i, o);
            return !1;
          }
          : function (t, i, l) {
            var c,
              p,
              d,
              u = [k, s];
            if (l) {
              for (; (t = t[n]);) if ((1 === t.nodeType || a) && e(t, i, l)) return !0;
            } else
              for (; (t = t[n]);)
                if (1 === t.nodeType || a)
                  if (
                    ((p = (d = t[b] || (t[b] = {}))[t.uniqueID] || (d[t.uniqueID] = {})),
                      o && o === t.nodeName.toLowerCase())
                  )
                    t = t[n] || t;
                  else {
                    if ((c = p[r]) && c[0] === k && c[1] === s) return (u[2] = c[2]);
                    if (((p[r] = u)[2] = e(t, i, l))) return !0;
                  }
            return !1;
          };
      }
      function we(e) {
        return 1 < e.length
          ? function (t, i, n) {
            for (var o = e.length; o--;) if (!e[o](t, i, n)) return !1;
            return !0;
          }
          : e[0];
      }
      function ke(e, t, i, n, o) {
        for (var r, a = [], s = 0, l = e.length, c = null != t; s < l; s++)
          (r = e[s]) && ((i && !i(r, n, o)) || (a.push(r), c && t.push(s)));
        return a;
      }
      function xe(e, t, i, n, o, r) {
        return (
          n && !n[b] && (n = xe(n)),
          o && !o[b] && (o = xe(o, r)),
          ce(function (r, a, s, l) {
            var c,
              p,
              d,
              u = [],
              h = [],
              _ = a.length,
              f =
                r ||
                (function (e, t, i) {
                  for (var n = 0, o = t.length; n < o; n++) se(e, t[n], i);
                  return i;
                })(t || '*', s.nodeType ? [s] : s, []),
              m = !e || (!r && t) ? f : ke(f, u, e, s, l),
              g = i ? (o || (r ? e : _ || n) ? [] : a) : m;
            if ((i && i(m, g, s, l), n))
              for (c = ke(g, h), n(c, [], s, l), p = c.length; p--;)
                (d = c[p]) && (g[h[p]] = !(m[h[p]] = d));
            if (r) {
              if (o || e) {
                if (o) {
                  for (c = [], p = g.length; p--;) (d = g[p]) && c.push((m[p] = d));
                  o(null, (g = []), c, l);
                }
                for (p = g.length; p--;)
                  (d = g[p]) && -1 < (c = o ? M(r, d) : u[p]) && (r[c] = !(a[c] = d));
              }
            } else (g = ke(g === a ? g.splice(_, g.length) : g)), o ? o(null, a, g, l) : L.apply(a, g);
          })
        );
      }
      function $e(e) {
        for (
          var t,
          i,
          o,
          r = e.length,
          a = n.relative[e[0].type],
          s = a || n.relative[' '],
          l = a ? 1 : 0,
          p = be(
            function (e) {
              return e === t;
            },
            s,
            !0,
          ),
          d = be(
            function (e) {
              return -1 < M(t, e);
            },
            s,
            !0,
          ),
          u = [
            function (e, i, n) {
              var o = (!a && (n || i !== c)) || ((t = i).nodeType ? p(e, i, n) : d(e, i, n));
              return (t = null), o;
            },
          ];
          l < r;
          l++
        )
          if ((i = n.relative[e[l].type])) u = [be(we(u), i)];
          else {
            if ((i = n.filter[e[l].type].apply(null, e[l].matches))[b]) {
              for (o = ++l; o < r && !n.relative[e[o].type]; o++);
              return xe(
                1 < l && we(u),
                1 < l &&
                ve(e.slice(0, l - 1).concat({ value: ' ' === e[l - 2].type ? '*' : '' })).replace(
                  B,
                  '$1',
                ),
                i,
                l < o && $e(e.slice(l, o)),
                o < r && $e((e = e.slice(o))),
                o < r && ve(e),
              );
            }
            u.push(i);
          }
        return we(u);
      }
      return (
        (ye.prototype = n.filters = n.pseudos),
        (n.setFilters = new ye()),
        (a = se.tokenize = function (e, t) {
          var i,
            o,
            r,
            a,
            s,
            l,
            c,
            p = C[e + ' '];
          if (p) return t ? 0 : p.slice(0);
          for (s = e, l = [], c = n.preFilter; s;) {
            for (a in ((i && !(o = R.exec(s))) ||
              (o && (s = s.slice(o[0].length) || s), l.push((r = []))),
              (i = !1),
              (o = W.exec(s)) &&
              ((i = o.shift()),
                r.push({ value: i, type: o[0].replace(B, ' ') }),
                (s = s.slice(i.length))),
              n.filter))
              !(o = V[a].exec(s)) ||
                (c[a] && !(o = c[a](o))) ||
                ((i = o.shift()),
                  r.push({ value: i, type: a, matches: o }),
                  (s = s.slice(i.length)));
            if (!i) break;
          }
          return t ? s.length : s ? se.error(e) : C(e, l).slice(0);
        }),
        (s = se.compile = function (e, t) {
          var i,
            o,
            r,
            s,
            l,
            p,
            d = [],
            _ = [],
            m = S[e + ' '];
          if (!m) {
            for (t || (t = a(e)), i = t.length; i--;) (m = $e(t[i]))[b] ? d.push(m) : _.push(m);
            (m = S(
              e,
              ((o = _),
                (s = 0 < (r = d).length),
                (l = 0 < o.length),
                (p = function (e, t, i, a, p) {
                  var d,
                    _,
                    m,
                    g = 0,
                    y = '0',
                    v = e && [],
                    b = [],
                    w = c,
                    x = e || (l && n.find.TAG('*', p)),
                    $ = (k += null == w ? 1 : Math.random() || 0.1),
                    C = x.length;
                  for (p && (c = t == h || t || p); y !== C && null != (d = x[y]); y++) {
                    if (l && d) {
                      for (_ = 0, t || d.ownerDocument == h || (u(d), (i = !f)); (m = o[_++]);)
                        if (m(d, t || h, i)) {
                          a.push(d);
                          break;
                        }
                      p && (k = $);
                    }
                    s && ((d = !m && d) && g--, e && v.push(d));
                  }
                  if (((g += y), s && y !== g)) {
                    for (_ = 0; (m = r[_++]);) m(v, b, t, i);
                    if (e) {
                      if (0 < g) for (; y--;) v[y] || b[y] || (b[y] = A.call(a));
                      b = ke(b);
                    }
                    L.apply(a, b), p && !e && 0 < b.length && 1 < g + r.length && se.uniqueSort(a);
                  }
                  return p && ((k = $), (c = w)), v;
                }),
                s ? ce(p) : p),
            )).selector = e;
          }
          return m;
        }),
        (l = se.select = function (e, t, i, o) {
          var r,
            l,
            c,
            p,
            d,
            u = 'function' == typeof e && e,
            h = !o && a((e = u.selector || e));
          if (((i = i || []), 1 === h.length)) {
            if (
              2 < (l = h[0] = h[0].slice(0)).length &&
              'ID' === (c = l[0]).type &&
              9 === t.nodeType &&
              f &&
              n.relative[l[1].type]
            ) {
              if (!(t = (n.find.ID(c.matches[0].replace(te, ie), t) || [])[0])) return i;
              u && (t = t.parentNode), (e = e.slice(l.shift().value.length));
            }
            for (
              r = V.needsContext.test(e) ? 0 : l.length;
              r-- && ((c = l[r]), !n.relative[(p = c.type)]);

            )
              if (
                (d = n.find[p]) &&
                (o = d(c.matches[0].replace(te, ie), (ee.test(l[0].type) && ge(t.parentNode)) || t))
              ) {
                if ((l.splice(r, 1), !(e = o.length && ve(l)))) return L.apply(i, o), i;
                break;
              }
          }
          return (u || s(e, h))(o, t, !f, i, !t || (ee.test(e) && ge(t.parentNode)) || t), i;
        }),
        (i.sortStable = b.split('').sort(j).join('') === b),
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
        de(P, function (e, t, i) {
          var n;
          if (!i)
            return !0 === e[t]
              ? t.toLowerCase()
              : (n = e.getAttributeNode(t)) && n.specified
                ? n.value
                : null;
        }),
        se
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
    var $ = function (e, t, i) {
      for (var n = [], o = void 0 !== i; (e = e[t]) && 9 !== e.nodeType;)
        if (1 === e.nodeType) {
          if (o && w(e).is(i)) break;
          n.push(e);
        }
      return n;
    },
      C = function (e, t) {
        for (var i = []; e; e = e.nextSibling) 1 === e.nodeType && e !== t && i.push(e);
        return i;
      },
      S = w.expr.match.needsContext;
    function z(e, t) {
      return e.nodeName && e.nodeName.toLowerCase() === t.toLowerCase();
    }
    var j = /^<([a-z][^\/\0>:\x20\t\r\n\f]*)[\x20\t\r\n\f]*\/?>(?:<\/\1>|)$/i;
    function T(e, t, i) {
      return _(t)
        ? w.grep(e, function (e, n) {
          return !!t.call(e, n, e) !== i;
        })
        : t.nodeType
          ? w.grep(e, function (e) {
            return (e === t) !== i;
          })
          : 'string' != typeof t
            ? w.grep(e, function (e) {
              return -1 < s.call(t, e) !== i;
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
            o = this;
          if ('string' != typeof e)
            return this.pushStack(
              w(e).filter(function () {
                for (t = 0; t < n; t++) if (w.contains(o[t], this)) return !0;
              }),
            );
          for (i = this.pushStack([]), t = 0; t < n; t++) w.find(e, o[t], i);
          return 1 < n ? w.uniqueSort(i) : i;
        },
        filter: function (e) {
          return this.pushStack(T(this, e || [], !1));
        },
        not: function (e) {
          return this.pushStack(T(this, e || [], !0));
        },
        is: function (e) {
          return !!T(this, 'string' == typeof e && S.test(e) ? w(e) : e || [], !1).length;
        },
      });
    var D,
      A = /^(?:\s*(<[\w\W]+>)[^>]*|#([\w-]+))$/;
    ((w.fn.init = function (e, t, i) {
      var n, o;
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
              w.merge(this, w.parseHTML(n[1], t && t.nodeType ? t.ownerDocument || t : m, !0)),
              j.test(n[1]) && w.isPlainObject(t))
          )
            for (n in t) _(this[n]) ? this[n](t[n]) : this.attr(n, t[n]);
          return this;
        }
        return (o = m.getElementById(n[2])) && ((this[0] = o), (this.length = 1)), this;
      }
      return e.nodeType
        ? ((this[0] = e), (this.length = 1), this)
        : _(e)
          ? void 0 !== i.ready
            ? i.ready(e)
            : e(w)
          : w.makeArray(e, this);
    }).prototype = w.fn),
      (D = w(m));
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
          o = this.length,
          r = [],
          a = 'string' != typeof e && w(e);
        if (!S.test(e))
          for (; n < o; n++)
            for (i = this[n]; i && i !== t; i = i.parentNode)
              if (
                i.nodeType < 11 &&
                (a ? -1 < a.index(i) : 1 === i.nodeType && w.find.matchesSelector(i, e))
              ) {
                r.push(i);
                break;
              }
        return this.pushStack(1 < r.length ? w.uniqueSort(r) : r);
      },
      index: function (e) {
        return e
          ? 'string' == typeof e
            ? s.call(w(e), this[0])
            : s.call(this, e.jquery ? e[0] : e)
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
            return $(e, 'parentNode');
          },
          parentsUntil: function (e, t, i) {
            return $(e, 'parentNode', i);
          },
          next: function (e) {
            return O(e, 'nextSibling');
          },
          prev: function (e) {
            return O(e, 'previousSibling');
          },
          nextAll: function (e) {
            return $(e, 'nextSibling');
          },
          prevAll: function (e) {
            return $(e, 'previousSibling');
          },
          nextUntil: function (e, t, i) {
            return $(e, 'nextSibling', i);
          },
          prevUntil: function (e, t, i) {
            return $(e, 'previousSibling', i);
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
              : (z(e, 'template') && (e = e.content || e), w.merge([], e.childNodes));
          },
        },
        function (e, t) {
          w.fn[e] = function (i, n) {
            var o = w.map(this, t, i);
            return (
              'Until' !== e.slice(-5) && (n = i),
              n && 'string' == typeof n && (o = w.filter(n, o)),
              1 < this.length && (L[e] || w.uniqueSort(o), E.test(e) && o.reverse()),
              this.pushStack(o)
            );
          };
        },
      );
    var M = /[^\x20\t\r\n\f]+/g;
    function P(e) {
      return e;
    }
    function N(e) {
      throw e;
    }
    function I(e, t, i, n) {
      var o;
      try {
        e && _((o = e.promise))
          ? o.call(e).done(t).fail(i)
          : e && _((o = e.then))
            ? o.call(e, t, i)
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
        o,
        r,
        a,
        s = [],
        l = [],
        c = -1,
        p = function () {
          for (a = a || e.once, r = n = !0; l.length; c = -1)
            for (o = l.shift(); ++c < s.length;)
              !1 === s[c].apply(o[0], o[1]) && e.stopOnFalse && ((c = s.length), (o = !1));
          e.memory || (o = !1), (n = !1), a && (s = o ? [] : '');
        },
        d = {
          add: function () {
            return (
              s &&
              (o && !n && ((c = s.length - 1), l.push(o)),
                (function t(i) {
                  w.each(i, function (i, n) {
                    _(n)
                      ? (e.unique && d.has(n)) || s.push(n)
                      : n && n.length && 'string' !== v(n) && t(n);
                  });
                })(arguments),
                o && !n && p()),
              this
            );
          },
          remove: function () {
            return (
              w.each(arguments, function (e, t) {
                for (var i; -1 < (i = w.inArray(t, s, i));) s.splice(i, 1), i <= c && c--;
              }),
              this
            );
          },
          has: function (e) {
            return e ? -1 < w.inArray(e, s) : 0 < s.length;
          },
          empty: function () {
            return s && (s = []), this;
          },
          disable: function () {
            return (a = l = []), (s = o = ''), this;
          },
          disabled: function () {
            return !s;
          },
          lock: function () {
            return (a = l = []), o || n || (s = o = ''), this;
          },
          locked: function () {
            return !!a;
          },
          fireWith: function (e, t) {
            return a || ((t = [e, (t = t || []).slice ? t.slice() : t]), l.push(t), n || p()), this;
          },
          fire: function () {
            return d.fireWith(this, arguments), this;
          },
          fired: function () {
            return !!r;
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
            o = {
              state: function () {
                return n;
              },
              always: function () {
                return r.done(arguments).fail(arguments), this;
              },
              catch: function (e) {
                return o.then(null, e);
              },
              pipe: function () {
                var e = arguments;
                return w
                  .Deferred(function (t) {
                    w.each(i, function (i, n) {
                      var o = _(e[n[4]]) && e[n[4]];
                      r[n[1]](function () {
                        var e = o && o.apply(this, arguments);
                        e && _(e.promise)
                          ? e.promise().progress(t.notify).done(t.resolve).fail(t.reject)
                          : t[n[0] + 'With'](this, o ? [e] : arguments);
                      });
                    }),
                      (e = null);
                  })
                  .promise();
              },
              then: function (t, n, o) {
                var r = 0;
                function a(t, i, n, o) {
                  return function () {
                    var s = this,
                      l = arguments,
                      c = function () {
                        var e, c;
                        if (!(t < r)) {
                          if ((e = n.apply(s, l)) === i.promise())
                            throw new TypeError('Thenable self-resolution');
                          (c = e && ('object' == typeof e || 'function' == typeof e) && e.then),
                            _(c)
                              ? o
                                ? c.call(e, a(r, i, P, o), a(r, i, N, o))
                                : (r++,
                                  c.call(e, a(r, i, P, o), a(r, i, N, o), a(r, i, P, i.notifyWith)))
                              : (n !== P && ((s = void 0), (l = [e])), (o || i.resolveWith)(s, l));
                        }
                      },
                      p = o
                        ? c
                        : function () {
                          try {
                            c();
                          } catch (e) {
                            w.Deferred.exceptionHook && w.Deferred.exceptionHook(e, p.stackTrace),
                              r <= t + 1 &&
                              (n !== N && ((s = void 0), (l = [e])), i.rejectWith(s, l));
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
                    i[0][3].add(a(0, e, _(o) ? o : P, e.notifyWith)),
                      i[1][3].add(a(0, e, _(t) ? t : P)),
                      i[2][3].add(a(0, e, _(n) ? n : N));
                  })
                  .promise();
              },
              promise: function (e) {
                return null != e ? w.extend(e, o) : o;
              },
            },
            r = {};
          return (
            w.each(i, function (e, t) {
              var a = t[2],
                s = t[5];
              (o[t[1]] = a.add),
                s &&
                a.add(
                  function () {
                    n = s;
                  },
                  i[3 - e][2].disable,
                  i[3 - e][3].disable,
                  i[0][2].lock,
                  i[0][3].lock,
                ),
                a.add(t[3].fire),
                (r[t[0]] = function () {
                  return r[t[0] + 'With'](this === r ? void 0 : this, arguments), this;
                }),
                (r[t[0] + 'With'] = a.fireWith);
            }),
            o.promise(r),
            t && t.call(r, r),
            r
          );
        },
        when: function (e) {
          var t = arguments.length,
            i = t,
            n = Array(i),
            r = o.call(arguments),
            a = w.Deferred(),
            s = function (e) {
              return function (i) {
                (n[e] = this),
                  (r[e] = 1 < arguments.length ? o.call(arguments) : i),
                  --t || a.resolveWith(n, r);
              };
            };
          if (
            t <= 1 &&
            (I(e, a.done(s(i)).resolve, a.reject, !t),
              'pending' === a.state() || _(r[i] && r[i].then))
          )
            return a.then();
          for (; i--;) I(r[i], s(i), a.reject);
          return a.promise();
        },
      });
    var q = /^(Eval|Internal|Range|Reference|Syntax|Type|URI)Error$/;
    (w.Deferred.exceptionHook = function (t, i) {
      e.console &&
        e.console.warn &&
        t &&
        q.test(t.name) &&
        e.console.warn('jQuery.Deferred exception: ' + t.message, t.stack, i);
    }),
      (w.readyException = function (t) {
        e.setTimeout(function () {
          throw t;
        });
      });
    var F = w.Deferred();
    function H() {
      m.removeEventListener('DOMContentLoaded', H), e.removeEventListener('load', H), w.ready();
    }
    (w.fn.ready = function (e) {
      return (
        F.then(e).catch(function (e) {
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
            F.resolveWith(m, [w]);
        },
      }),
      (w.ready.then = F.then),
      'complete' === m.readyState || ('loading' !== m.readyState && !m.documentElement.doScroll)
        ? e.setTimeout(w.ready)
        : (m.addEventListener('DOMContentLoaded', H), e.addEventListener('load', H));
    var B = function (e, t, i, n, o, r, a) {
      var s = 0,
        l = e.length,
        c = null == i;
      if ('object' === v(i)) for (s in ((o = !0), i)) B(e, t, s, i[s], !0, r, a);
      else if (
        void 0 !== n &&
        ((o = !0),
          _(n) || (a = !0),
          c &&
          (a
            ? (t.call(e, n), (t = null))
            : ((c = t),
              (t = function (e, t, i) {
                return c.call(w(e), i);
              }))),
          t)
      )
        for (; s < l; s++) t(e[s], i, a ? n : n.call(e[s], s, t(e[s], i)));
      return o ? e : c ? t.call(e) : l ? t(e[0], i) : r;
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
            o = this.cache(e);
          if ('string' == typeof t) o[U(t)] = i;
          else for (n in t) o[U(n)] = t[n];
          return o;
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
      var n, o;
      if (void 0 === i && 1 === e.nodeType)
        if (
          ((n = 'data-' + t.replace(K, '-$&').toLowerCase()),
            'string' == typeof (i = e.getAttribute(n)))
        ) {
          try {
            i =
              'true' === (o = i) ||
              ('false' !== o &&
                ('null' === o ? null : o === +o + '' ? +o : Z.test(o) ? JSON.parse(o) : o));
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
            o,
            r = this[0],
            a = r && r.attributes;
          if (void 0 === e) {
            if (this.length && ((o = J.get(r)), 1 === r.nodeType && !G.get(r, 'hasDataAttrs'))) {
              for (i = a.length; i--;)
                a[i] &&
                  0 === (n = a[i].name).indexOf('data-') &&
                  ((n = U(n.slice(5))), X(r, n, o[n]));
              G.set(r, 'hasDataAttrs', !0);
            }
            return o;
          }
          return 'object' == typeof e
            ? this.each(function () {
              J.set(this, e);
            })
            : B(
              this,
              function (t) {
                var i;
                if (r && void 0 === t)
                  return void 0 !== (i = J.get(r, e)) || void 0 !== (i = X(r, e)) ? i : void 0;
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
            o = i.shift(),
            r = w._queueHooks(e, t);
          'inprogress' === o && ((o = i.shift()), n--),
            o &&
            ('fx' === t && i.unshift('inprogress'),
              delete r.stop,
              o.call(
                e,
                function () {
                  w.dequeue(e, t);
                },
                r,
              )),
            !n && r && r.empty.fire();
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
            o = w.Deferred(),
            r = this,
            a = this.length,
            s = function () {
              --n || o.resolveWith(r, [r]);
            };
          for ('string' != typeof e && ((t = e), (e = void 0)), e = e || 'fx'; a--;)
            (i = G.get(r[a], e + 'queueHooks')) && i.empty && (n++, i.empty.add(s));
          return s(), o.promise(t);
        },
      });
    var ee = /[+-]?(?:\d*\.|)\d+(?:[eE][+-]?\d+|)/.source,
      te = new RegExp('^(?:([+-])=|)(' + ee + ')([a-z%]*)$', 'i'),
      ie = ['Top', 'Right', 'Bottom', 'Left'],
      ne = m.documentElement,
      oe = function (e) {
        return w.contains(e.ownerDocument, e);
      },
      re = { composed: !0 };
    ne.getRootNode &&
      (oe = function (e) {
        return w.contains(e.ownerDocument, e) || e.getRootNode(re) === e.ownerDocument;
      });
    var ae = function (e, t) {
      return (
        'none' === (e = t || e).style.display ||
        ('' === e.style.display && oe(e) && 'none' === w.css(e, 'display'))
      );
    };
    function se(e, t, i, n) {
      var o,
        r,
        a = 20,
        s = n
          ? function () {
            return n.cur();
          }
          : function () {
            return w.css(e, t, '');
          },
        l = s(),
        c = (i && i[3]) || (w.cssNumber[t] ? '' : 'px'),
        p = e.nodeType && (w.cssNumber[t] || ('px' !== c && +l)) && te.exec(w.css(e, t));
      if (p && p[3] !== c) {
        for (l /= 2, c = c || p[3], p = +l || 1; a--;)
          w.style(e, t, p + c), (1 - r) * (1 - (r = s() / l || 0.5)) <= 0 && (a = 0), (p /= r);
        (p *= 2), w.style(e, t, p + c), (i = i || []);
      }
      return (
        i &&
        ((p = +p || +l || 0),
          (o = i[1] ? p + (i[1] + 1) * i[2] : +i[2]),
          n && ((n.unit = c), (n.start = p), (n.end = o))),
        o
      );
    }
    var le = {};
    function ce(e, t) {
      for (var i, n, o, r, a, s, l, c = [], p = 0, d = e.length; p < d; p++)
        (n = e[p]).style &&
          ((i = n.style.display),
            t
              ? ('none' === i &&
                ((c[p] = G.get(n, 'display') || null), c[p] || (n.style.display = '')),
                '' === n.style.display &&
                ae(n) &&
                (c[p] =
                  ((l = a = r = void 0),
                    (a = (o = n).ownerDocument),
                    (s = o.nodeName),
                    (l = le[s]) ||
                    ((r = a.body.appendChild(a.createElement(s))),
                      (l = w.css(r, 'display')),
                      r.parentNode.removeChild(r),
                      'none' === l && (l = 'block'),
                      (le[s] = l)))))
              : 'none' !== i && ((c[p] = 'none'), G.set(n, 'display', i)));
      for (p = 0; p < d; p++) null != c[p] && (e[p].style.display = c[p]);
      return e;
    }
    w.fn.extend({
      show: function () {
        return ce(this, !0);
      },
      hide: function () {
        return ce(this);
      },
      toggle: function (e) {
        return 'boolean' == typeof e
          ? e
            ? this.show()
            : this.hide()
          : this.each(function () {
            ae(this) ? w(this).show() : w(this).hide();
          });
      },
    });
    var pe,
      de,
      ue = /^(?:checkbox|radio)$/i,
      he = /<([a-z][^\/\0>\x20\t\r\n\f]*)/i,
      _e = /^$|^module$|\/(?:java|ecma)script/i;
    (pe = m.createDocumentFragment().appendChild(m.createElement('div'))),
      (de = m.createElement('input')).setAttribute('type', 'radio'),
      de.setAttribute('checked', 'checked'),
      de.setAttribute('name', 't'),
      pe.appendChild(de),
      (h.checkClone = pe.cloneNode(!0).cloneNode(!0).lastChild.checked),
      (pe.innerHTML = '<textarea>x</textarea>'),
      (h.noCloneChecked = !!pe.cloneNode(!0).lastChild.defaultValue),
      (pe.innerHTML = '<option></option>'),
      (h.option = !!pe.lastChild);
    var fe = {
      thead: [1, '<table>', '</table>'],
      col: [2, '<table><colgroup>', '</colgroup></table>'],
      tr: [2, '<table><tbody>', '</tbody></table>'],
      td: [3, '<table><tbody><tr>', '</tr></tbody></table>'],
      _default: [0, '', ''],
    };
    function me(e, t) {
      var i;
      return (
        (i =
          void 0 !== e.getElementsByTagName
            ? e.getElementsByTagName(t || '*')
            : void 0 !== e.querySelectorAll
              ? e.querySelectorAll(t || '*')
              : []),
        void 0 === t || (t && z(e, t)) ? w.merge([e], i) : i
      );
    }
    function ge(e, t) {
      for (var i = 0, n = e.length; i < n; i++)
        G.set(e[i], 'globalEval', !t || G.get(t[i], 'globalEval'));
    }
    (fe.tbody = fe.tfoot = fe.colgroup = fe.caption = fe.thead),
      (fe.th = fe.td),
      h.option || (fe.optgroup = fe.option = [1, "<select multiple='multiple'>", '</select>']);
    var ye = /<|&#?\w+;/;
    function ve(e, t, i, n, o) {
      for (
        var r, a, s, l, c, p, d = t.createDocumentFragment(), u = [], h = 0, _ = e.length;
        h < _;
        h++
      )
        if ((r = e[h]) || 0 === r)
          if ('object' === v(r)) w.merge(u, r.nodeType ? [r] : r);
          else if (ye.test(r)) {
            for (
              a = a || d.appendChild(t.createElement('div')),
              s = (he.exec(r) || ['', ''])[1].toLowerCase(),
              l = fe[s] || fe._default,
              a.innerHTML = l[1] + w.htmlPrefilter(r) + l[2],
              p = l[0];
              p--;

            )
              a = a.lastChild;
            w.merge(u, a.childNodes), ((a = d.firstChild).textContent = '');
          } else u.push(t.createTextNode(r));
      for (d.textContent = '', h = 0; (r = u[h++]);)
        if (n && -1 < w.inArray(r, n)) o && o.push(r);
        else if (((c = oe(r)), (a = me(d.appendChild(r), 'script')), c && ge(a), i))
          for (p = 0; (r = a[p++]);) _e.test(r.type || '') && i.push(r);
      return d;
    }
    var be = /^key/,
      we = /^(?:mouse|pointer|contextmenu|drag|drop)|click/,
      ke = /^([^.]*)(?:\.(.+)|)/;
    function xe() {
      return !0;
    }
    function $e() {
      return !1;
    }
    function Ce(e, t) {
      return (
        (e ===
          (function () {
            try {
              return m.activeElement;
            } catch (e) { }
          })()) ==
        ('focus' === t)
      );
    }
    function Se(e, t, i, n, o, r) {
      var a, s;
      if ('object' == typeof t) {
        for (s in ('string' != typeof i && ((n = n || i), (i = void 0)), t))
          Se(e, s, i, n, t[s], r);
        return e;
      }
      if (
        (null == n && null == o
          ? ((o = i), (n = i = void 0))
          : null == o &&
          ('string' == typeof i ? ((o = n), (n = void 0)) : ((o = n), (n = i), (i = void 0))),
          !1 === o)
      )
        o = $e;
      else if (!o) return e;
      return (
        1 === r &&
        ((a = o),
          ((o = function (e) {
            return w().off(e), a.apply(this, arguments);
          }).guid = a.guid || (a.guid = w.guid++))),
        e.each(function () {
          w.event.add(this, t, o, n, i);
        })
      );
    }
    function ze(e, t, i) {
      i
        ? (G.set(e, t, !1),
          w.event.add(e, t, {
            namespace: !1,
            handler: function (e) {
              var n,
                r,
                a = G.get(this, t);
              if (1 & e.isTrigger && this[t]) {
                if (a.length) (w.event.special[t] || {}).delegateType && e.stopPropagation();
                else if (
                  ((a = o.call(arguments)),
                    G.set(this, t, a),
                    (n = i(this, t)),
                    this[t](),
                    a !== (r = G.get(this, t)) || n ? G.set(this, t, !1) : (r = {}),
                    a !== r)
                )
                  return e.stopImmediatePropagation(), e.preventDefault(), r.value;
              } else
                a.length &&
                  (G.set(this, t, {
                    value: w.event.trigger(w.extend(a[0], w.Event.prototype), a.slice(1), this),
                  }),
                    e.stopImmediatePropagation());
            },
          }))
        : void 0 === G.get(e, t) && w.event.add(e, t, xe);
    }
    (w.event = {
      global: {},
      add: function (e, t, i, n, o) {
        var r,
          a,
          s,
          l,
          c,
          p,
          d,
          u,
          h,
          _,
          f,
          m = G.get(e);
        if (Q(e))
          for (
            i.handler && ((i = (r = i).handler), (o = r.selector)),
            o && w.find.matchesSelector(ne, o),
            i.guid || (i.guid = w.guid++),
            (l = m.events) || (l = m.events = Object.create(null)),
            (a = m.handle) ||
            (a = m.handle = function (t) {
              return void 0 !== w && w.event.triggered !== t.type
                ? w.event.dispatch.apply(e, arguments)
                : void 0;
            }),
            c = (t = (t || '').match(M) || ['']).length;
            c--;

          )
            (h = f = (s = ke.exec(t[c]) || [])[1]),
              (_ = (s[2] || '').split('.').sort()),
              h &&
              ((d = w.event.special[h] || {}),
                (h = (o ? d.delegateType : d.bindType) || h),
                (d = w.event.special[h] || {}),
                (p = w.extend(
                  {
                    type: h,
                    origType: f,
                    data: n,
                    handler: i,
                    guid: i.guid,
                    selector: o,
                    needsContext: o && w.expr.match.needsContext.test(o),
                    namespace: _.join('.'),
                  },
                  r,
                )),
                (u = l[h]) ||
                (((u = l[h] = []).delegateCount = 0),
                  (d.setup && !1 !== d.setup.call(e, n, _, a)) ||
                  (e.addEventListener && e.addEventListener(h, a))),
                d.add && (d.add.call(e, p), p.handler.guid || (p.handler.guid = i.guid)),
                o ? u.splice(u.delegateCount++, 0, p) : u.push(p),
                (w.event.global[h] = !0));
      },
      remove: function (e, t, i, n, o) {
        var r,
          a,
          s,
          l,
          c,
          p,
          d,
          u,
          h,
          _,
          f,
          m = G.hasData(e) && G.get(e);
        if (m && (l = m.events)) {
          for (c = (t = (t || '').match(M) || ['']).length; c--;)
            if (((h = f = (s = ke.exec(t[c]) || [])[1]), (_ = (s[2] || '').split('.').sort()), h)) {
              for (
                d = w.event.special[h] || {},
                u = l[(h = (n ? d.delegateType : d.bindType) || h)] || [],
                s = s[2] && new RegExp('(^|\\.)' + _.join('\\.(?:.*\\.|)') + '(\\.|$)'),
                a = r = u.length;
                r--;

              )
                (p = u[r]),
                  (!o && f !== p.origType) ||
                  (i && i.guid !== p.guid) ||
                  (s && !s.test(p.namespace)) ||
                  (n && n !== p.selector && ('**' !== n || !p.selector)) ||
                  (u.splice(r, 1),
                    p.selector && u.delegateCount--,
                    d.remove && d.remove.call(e, p));
              a &&
                !u.length &&
                ((d.teardown && !1 !== d.teardown.call(e, _, m.handle)) ||
                  w.removeEvent(e, h, m.handle),
                  delete l[h]);
            } else for (h in l) w.event.remove(e, h + t[c], i, n, !0);
          w.isEmptyObject(l) && G.remove(e, 'handle events');
        }
      },
      dispatch: function (e) {
        var t,
          i,
          n,
          o,
          r,
          a,
          s = new Array(arguments.length),
          l = w.event.fix(e),
          c = (G.get(this, 'events') || Object.create(null))[l.type] || [],
          p = w.event.special[l.type] || {};
        for (s[0] = l, t = 1; t < arguments.length; t++) s[t] = arguments[t];
        if (((l.delegateTarget = this), !p.preDispatch || !1 !== p.preDispatch.call(this, l))) {
          for (
            a = w.event.handlers.call(this, l, c), t = 0;
            (o = a[t++]) && !l.isPropagationStopped();

          )
            for (
              l.currentTarget = o.elem, i = 0;
              (r = o.handlers[i++]) && !l.isImmediatePropagationStopped();

            )
              (l.rnamespace && !1 !== r.namespace && !l.rnamespace.test(r.namespace)) ||
                ((l.handleObj = r),
                  (l.data = r.data),
                  void 0 !==
                  (n = ((w.event.special[r.origType] || {}).handle || r.handler).apply(
                    o.elem,
                    s,
                  )) &&
                  !1 === (l.result = n) &&
                  (l.preventDefault(), l.stopPropagation()));
          return p.postDispatch && p.postDispatch.call(this, l), l.result;
        }
      },
      handlers: function (e, t) {
        var i,
          n,
          o,
          r,
          a,
          s = [],
          l = t.delegateCount,
          c = e.target;
        if (l && c.nodeType && !('click' === e.type && 1 <= e.button))
          for (; c !== this; c = c.parentNode || this)
            if (1 === c.nodeType && ('click' !== e.type || !0 !== c.disabled)) {
              for (r = [], a = {}, i = 0; i < l; i++)
                void 0 === a[(o = (n = t[i]).selector + ' ')] &&
                  (a[o] = n.needsContext
                    ? -1 < w(o, this).index(c)
                    : w.find(o, this, null, [c]).length),
                  a[o] && r.push(n);
              r.length && s.push({ elem: c, handlers: r });
            }
        return (c = this), l < t.length && s.push({ elem: c, handlers: t.slice(l) }), s;
      },
      addProp: function (e, t) {
        Object.defineProperty(w.Event.prototype, e, {
          enumerable: !0,
          configurable: !0,
          get: _(t)
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
            return ue.test(t.type) && t.click && z(t, 'input') && ze(t, 'click', xe), !1;
          },
          trigger: function (e) {
            var t = this || e;
            return ue.test(t.type) && t.click && z(t, 'input') && ze(t, 'click'), !0;
          },
          _default: function (e) {
            var t = e.target;
            return (ue.test(t.type) && t.click && z(t, 'input') && G.get(t, 'click')) || z(t, 'a');
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
                : $e),
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
        isDefaultPrevented: $e,
        isPropagationStopped: $e,
        isImmediatePropagationStopped: $e,
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
            return ze(this, e, Ce), !1;
          },
          trigger: function () {
            return ze(this, e), !0;
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
                o = e.handleObj;
              return (
                (n && (n === this || w.contains(this, n))) ||
                ((e.type = o.origType), (i = o.handler.apply(this, arguments)), (e.type = t)),
                i
              );
            },
          };
        },
      ),
      w.fn.extend({
        on: function (e, t, i, n) {
          return Se(this, e, t, i, n);
        },
        one: function (e, t, i, n) {
          return Se(this, e, t, i, n, 1);
        },
        off: function (e, t, i) {
          var n, o;
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
            for (o in e) this.off(o, t, e[o]);
            return this;
          }
          return (
            (!1 !== t && 'function' != typeof t) || ((i = t), (t = void 0)),
            !1 === i && (i = $e),
            this.each(function () {
              w.event.remove(this, e, i, t);
            })
          );
        },
      });
    var je = /<script|<style|<link/i,
      Te = /checked\s*(?:[^=]|=\s*.checked.)/i,
      De = /^\s*<!(?:\[CDATA\[|--)|(?:\]\]|--)>\s*$/g;
    function Ae(e, t) {
      return (
        (z(e, 'table') &&
          z(11 !== t.nodeType ? t : t.firstChild, 'tr') &&
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
      var i, n, o, r, a, s;
      if (1 === t.nodeType) {
        if (G.hasData(e) && (s = G.get(e).events))
          for (o in (G.remove(t, 'handle events'), s))
            for (i = 0, n = s[o].length; i < n; i++) w.event.add(t, o, s[o][i]);
        J.hasData(e) && ((r = J.access(e)), (a = w.extend({}, r)), J.set(t, a));
      }
    }
    function Me(e, t, i, n) {
      t = r(t);
      var o,
        a,
        s,
        l,
        c,
        p,
        d = 0,
        u = e.length,
        f = u - 1,
        m = t[0],
        g = _(m);
      if (g || (1 < u && 'string' == typeof m && !h.checkClone && Te.test(m)))
        return e.each(function (o) {
          var r = e.eq(o);
          g && (t[0] = m.call(this, o, r.html())), Me(r, t, i, n);
        });
      if (
        u &&
        ((a = (o = ve(t, e[0].ownerDocument, !1, e, n)).firstChild),
          1 === o.childNodes.length && (o = a),
          a || n)
      ) {
        for (l = (s = w.map(me(o, 'script'), Ee)).length; d < u; d++)
          (c = o),
            d !== f && ((c = w.clone(c, !0, !0)), l && w.merge(s, me(c, 'script'))),
            i.call(e[d], c, d);
        if (l)
          for (p = s[s.length - 1].ownerDocument, w.map(s, Le), d = 0; d < l; d++)
            (c = s[d]),
              _e.test(c.type || '') &&
              !G.access(c, 'globalEval') &&
              w.contains(p, c) &&
              (c.src && 'module' !== (c.type || '').toLowerCase()
                ? w._evalUrl &&
                !c.noModule &&
                w._evalUrl(c.src, { nonce: c.nonce || c.getAttribute('nonce') }, p)
                : y(c.textContent.replace(De, ''), c, p));
      }
      return e;
    }
    function Pe(e, t, i) {
      for (var n, o = t ? w.filter(t, e) : e, r = 0; null != (n = o[r]); r++)
        i || 1 !== n.nodeType || w.cleanData(me(n)),
          n.parentNode && (i && oe(n) && ge(me(n, 'script')), n.parentNode.removeChild(n));
      return e;
    }
    w.extend({
      htmlPrefilter: function (e) {
        return e;
      },
      clone: function (e, t, i) {
        var n,
          o,
          r,
          a,
          s,
          l,
          c,
          p = e.cloneNode(!0),
          d = oe(e);
        if (!(h.noCloneChecked || (1 !== e.nodeType && 11 !== e.nodeType) || w.isXMLDoc(e)))
          for (a = me(p), n = 0, o = (r = me(e)).length; n < o; n++)
            (s = r[n]),
              'input' === (c = (l = a[n]).nodeName.toLowerCase()) && ue.test(s.type)
                ? (l.checked = s.checked)
                : ('input' !== c && 'textarea' !== c) || (l.defaultValue = s.defaultValue);
        if (t)
          if (i)
            for (r = r || me(e), a = a || me(p), n = 0, o = r.length; n < o; n++) Oe(r[n], a[n]);
          else Oe(e, p);
        return 0 < (a = me(p, 'script')).length && ge(a, !d && me(e, 'script')), p;
      },
      cleanData: function (e) {
        for (var t, i, n, o = w.event.special, r = 0; void 0 !== (i = e[r]); r++)
          if (Q(i)) {
            if ((t = i[G.expando])) {
              if (t.events)
                for (n in t.events) o[n] ? w.event.remove(i, n) : w.removeEvent(i, n, t.handle);
              i[G.expando] = void 0;
            }
            i[J.expando] && (i[J.expando] = void 0);
          }
      },
    }),
      w.fn.extend({
        detach: function (e) {
          return Pe(this, e, !0);
        },
        remove: function (e) {
          return Pe(this, e);
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
            1 === e.nodeType && (w.cleanData(me(e, !1)), (e.textContent = ''));
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
                !je.test(e) &&
                !fe[(he.exec(e) || ['', ''])[1].toLowerCase()]
              ) {
                e = w.htmlPrefilter(e);
                try {
                  for (; i < n; i++)
                    1 === (t = this[i] || {}).nodeType &&
                      (w.cleanData(me(t, !1)), (t.innerHTML = e));
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
              w.inArray(this, e) < 0 && (w.cleanData(me(this)), i && i.replaceChild(t, this));
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
            for (var i, n = [], o = w(e), r = o.length - 1, s = 0; s <= r; s++)
              (i = s === r ? this : this.clone(!0)), w(o[s])[t](i), a.apply(n, i.get());
            return this.pushStack(n);
          };
        },
      );
    var Ne = new RegExp('^(' + ee + ')(?!px)[a-z%]+$', 'i'),
      Ie = function (t) {
        var i = t.ownerDocument.defaultView;
        return (i && i.opener) || (i = e), i.getComputedStyle(t);
      },
      qe = function (e, t, i) {
        var n,
          o,
          r = {};
        for (o in t) (r[o] = e.style[o]), (e.style[o] = t[o]);
        for (o in ((n = i.call(e)), t)) e.style[o] = r[o];
        return n;
      },
      Fe = new RegExp(ie.join('|'), 'i');
    function He(e, t, i) {
      var n,
        o,
        r,
        a,
        s = e.style;
      return (
        (i = i || Ie(e)) &&
        ('' !== (a = i.getPropertyValue(t) || i[t]) || oe(e) || (a = w.style(e, t)),
          !h.pixelBoxStyles() &&
          Ne.test(a) &&
          Fe.test(t) &&
          ((n = s.width),
            (o = s.minWidth),
            (r = s.maxWidth),
            (s.minWidth = s.maxWidth = s.width = a),
            (a = i.width),
            (s.width = n),
            (s.minWidth = o),
            (s.maxWidth = r))),
        void 0 !== a ? a + '' : a
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
          (c.style.cssText =
            'position:absolute;left:-11111px;width:60px;margin-top:1px;padding:0;border:0'),
            (p.style.cssText =
              'position:relative;display:block;box-sizing:border-box;overflow:scroll;margin:auto;border:1px;padding:1px;width:60%;top:1%'),
            ne.appendChild(c).appendChild(p);
          var t = e.getComputedStyle(p);
          (n = '1%' !== t.top),
            (l = 12 === i(t.marginLeft)),
            (p.style.right = '60%'),
            (a = 36 === i(t.right)),
            (o = 36 === i(t.width)),
            (p.style.position = 'absolute'),
            (r = 12 === i(p.offsetWidth / 3)),
            ne.removeChild(c),
            (p = null);
        }
      }
      function i(e) {
        return Math.round(parseFloat(e));
      }
      var n,
        o,
        r,
        a,
        s,
        l,
        c = m.createElement('div'),
        p = m.createElement('div');
      p.style &&
        ((p.style.backgroundClip = 'content-box'),
          (p.cloneNode(!0).style.backgroundClip = ''),
          (h.clearCloneStyle = 'content-box' === p.style.backgroundClip),
          w.extend(h, {
            boxSizingReliable: function () {
              return t(), o;
            },
            pixelBoxStyles: function () {
              return t(), a;
            },
            pixelPosition: function () {
              return t(), n;
            },
            reliableMarginLeft: function () {
              return t(), l;
            },
            scrollboxSize: function () {
              return t(), r;
            },
            reliableTrDimensions: function () {
              var t, i, n, o;
              return (
                null == s &&
                ((t = m.createElement('table')),
                  (i = m.createElement('tr')),
                  (n = m.createElement('div')),
                  (t.style.cssText = 'position:absolute;left:-11111px'),
                  (i.style.height = '1px'),
                  (n.style.height = '9px'),
                  ne.appendChild(t).appendChild(i).appendChild(n),
                  (o = e.getComputedStyle(i)),
                  (s = 3 < parseInt(o.height)),
                  ne.removeChild(t)),
                s
              );
            },
          }));
    })();
    var Re = ['Webkit', 'Moz', 'ms'],
      We = m.createElement('div').style,
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
    function Ke(e, t, i, n, o, r) {
      var a = 'width' === t ? 1 : 0,
        s = 0,
        l = 0;
      if (i === (n ? 'border' : 'content')) return 0;
      for (; a < 4; a += 2)
        'margin' === i && (l += w.css(e, i + ie[a], !0, o)),
          n
            ? ('content' === i && (l -= w.css(e, 'padding' + ie[a], !0, o)),
              'margin' !== i && (l -= w.css(e, 'border' + ie[a] + 'Width', !0, o)))
            : ((l += w.css(e, 'padding' + ie[a], !0, o)),
              'padding' !== i
                ? (l += w.css(e, 'border' + ie[a] + 'Width', !0, o))
                : (s += w.css(e, 'border' + ie[a] + 'Width', !0, o)));
      return (
        !n &&
        0 <= r &&
        (l +=
          Math.max(
            0,
            Math.ceil(e['offset' + t[0].toUpperCase() + t.slice(1)] - r - l - s - 0.5),
          ) || 0),
        l
      );
    }
    function Xe(e, t, i) {
      var n = Ie(e),
        o = (!h.boxSizingReliable() || i) && 'border-box' === w.css(e, 'boxSizing', !1, n),
        r = o,
        a = He(e, t, n),
        s = 'offset' + t[0].toUpperCase() + t.slice(1);
      if (Ne.test(a)) {
        if (!i) return a;
        a = 'auto';
      }
      return (
        ((!h.boxSizingReliable() && o) ||
          (!h.reliableTrDimensions() && z(e, 'tr')) ||
          'auto' === a ||
          (!parseFloat(a) && 'inline' === w.css(e, 'display', !1, n))) &&
        e.getClientRects().length &&
        ((o = 'border-box' === w.css(e, 'boxSizing', !1, n)), (r = s in e) && (a = e[s])),
        (a = parseFloat(a) || 0) + Ke(e, t, i || (o ? 'border' : 'content'), r, n, a) + 'px'
      );
    }
    function et(e, t, i, n, o) {
      return new et.prototype.init(e, t, i, n, o);
    }
    w.extend({
      cssHooks: {
        opacity: {
          get: function (e, t) {
            if (t) {
              var i = He(e, 'opacity');
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
          var o,
            r,
            a,
            s = U(t),
            l = Ve.test(t),
            c = e.style;
          if ((l || (t = Ue(s)), (a = w.cssHooks[t] || w.cssHooks[s]), void 0 === i))
            return a && 'get' in a && void 0 !== (o = a.get(e, !1, n)) ? o : c[t];
          'string' == (r = typeof i) &&
            (o = te.exec(i)) &&
            o[1] &&
            ((i = se(e, t, o)), (r = 'number')),
            null != i &&
            i == i &&
            ('number' !== r || l || (i += (o && o[3]) || (w.cssNumber[s] ? '' : 'px')),
              h.clearCloneStyle || '' !== i || 0 !== t.indexOf('background') || (c[t] = 'inherit'),
              (a && 'set' in a && void 0 === (i = a.set(e, i, n))) ||
              (l ? c.setProperty(t, i) : (c[t] = i)));
        }
      },
      css: function (e, t, i, n) {
        var o,
          r,
          a,
          s = U(t);
        return (
          Ve.test(t) || (t = Ue(s)),
          (a = w.cssHooks[t] || w.cssHooks[s]) && 'get' in a && (o = a.get(e, !0, i)),
          void 0 === o && (o = He(e, t, n)),
          'normal' === o && t in Je && (o = Je[t]),
          '' === i || i ? ((r = parseFloat(o)), !0 === i || isFinite(r) ? r || 0 : o) : o
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
                : qe(e, Ge, function () {
                  return Xe(e, t, n);
                });
          },
          set: function (e, i, n) {
            var o,
              r = Ie(e),
              a = !h.scrollboxSize() && 'absolute' === r.position,
              s = (a || n) && 'border-box' === w.css(e, 'boxSizing', !1, r),
              l = n ? Ke(e, t, n, s, r) : 0;
            return (
              s &&
              a &&
              (l -= Math.ceil(
                e['offset' + t[0].toUpperCase() + t.slice(1)] -
                parseFloat(r[t]) -
                Ke(e, t, 'border', !1, r) -
                0.5,
              )),
              l &&
              (o = te.exec(i)) &&
              'px' !== (o[3] || 'px') &&
              ((e.style[t] = i), (i = w.css(e, t))),
              Ze(0, i, l)
            );
          },
        };
      }),
      (w.cssHooks.marginLeft = Be(h.reliableMarginLeft, function (e, t) {
        if (t)
          return (
            (parseFloat(He(e, 'marginLeft')) ||
              e.getBoundingClientRect().left -
              qe(e, { marginLeft: 0 }, function () {
                return e.getBoundingClientRect().left;
              })) + 'px'
          );
      })),
      w.each({ margin: '', padding: '', border: 'Width' }, function (e, t) {
        (w.cssHooks[e + t] = {
          expand: function (i) {
            for (var n = 0, o = {}, r = 'string' == typeof i ? i.split(' ') : [i]; n < 4; n++)
              o[e + ie[n] + t] = r[n] || r[n - 2] || r[0];
            return o;
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
                o,
                r = {},
                a = 0;
              if (Array.isArray(t)) {
                for (n = Ie(e), o = t.length; a < o; a++) r[t[a]] = w.css(e, t[a], !1, n);
                return r;
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
        init: function (e, t, i, n, o, r) {
          (this.elem = e),
            (this.prop = i),
            (this.easing = o || w.easing._default),
            (this.options = t),
            (this.start = this.now = this.cur()),
            (this.end = n),
            (this.unit = r || (w.cssNumber[i] ? '' : 'px'));
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
              ? (this.pos = t = w.easing[this.easing](
                e,
                this.options.duration * e,
                0,
                1,
                this.options.duration,
              ))
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
      }).scrollTop = et.propHooks.scrollLeft = {
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
      ot,
      rt = /^(?:toggle|show|hide)$/,
      at = /queueHooks$/;
    function st() {
      it &&
        (!1 === m.hidden && e.requestAnimationFrame
          ? e.requestAnimationFrame(st)
          : e.setTimeout(st, w.fx.interval),
          w.fx.tick());
    }
    function lt() {
      return (
        e.setTimeout(function () {
          tt = void 0;
        }),
        (tt = Date.now())
      );
    }
    function ct(e, t) {
      var i,
        n = 0,
        o = { height: e };
      for (t = t ? 1 : 0; n < 4; n += 2 - t) o['margin' + (i = ie[n])] = o['padding' + i] = e;
      return t && (o.opacity = o.width = e), o;
    }
    function pt(e, t, i) {
      for (
        var n, o = (dt.tweeners[t] || []).concat(dt.tweeners['*']), r = 0, a = o.length;
        r < a;
        r++
      )
        if ((n = o[r].call(i, t, e))) return n;
    }
    function dt(e, t, i) {
      var n,
        o,
        r = 0,
        a = dt.prefilters.length,
        s = w.Deferred().always(function () {
          delete l.elem;
        }),
        l = function () {
          if (o) return !1;
          for (
            var t = tt || lt(),
            i = Math.max(0, c.startTime + c.duration - t),
            n = 1 - (i / c.duration || 0),
            r = 0,
            a = c.tweens.length;
            r < a;
            r++
          )
            c.tweens[r].run(n);
          return (
            s.notifyWith(e, [c, n, i]),
            n < 1 && a ? i : (a || s.notifyWith(e, [c, 1, 0]), s.resolveWith(e, [c]), !1)
          );
        },
        c = s.promise({
          elem: e,
          props: w.extend({}, t),
          opts: w.extend(!0, { specialEasing: {}, easing: w.easing._default }, i),
          originalProperties: t,
          originalOptions: i,
          startTime: tt || lt(),
          duration: i.duration,
          tweens: [],
          createTween: function (t, i) {
            var n = w.Tween(e, c.opts, t, i, c.opts.specialEasing[t] || c.opts.easing);
            return c.tweens.push(n), n;
          },
          stop: function (t) {
            var i = 0,
              n = t ? c.tweens.length : 0;
            if (o) return this;
            for (o = !0; i < n; i++) c.tweens[i].run(1);
            return (
              t ? (s.notifyWith(e, [c, 1, 0]), s.resolveWith(e, [c, t])) : s.rejectWith(e, [c, t]),
              this
            );
          },
        }),
        p = c.props;
      for (
        (function (e, t) {
          var i, n, o, r, a;
          for (i in e)
            if (
              ((o = t[(n = U(i))]),
                (r = e[i]),
                Array.isArray(r) && ((o = r[1]), (r = e[i] = r[0])),
                i !== n && ((e[n] = r), delete e[i]),
                (a = w.cssHooks[n]) && ('expand' in a))
            )
              for (i in ((r = a.expand(r)), delete e[n], r))
                (i in e) || ((e[i] = r[i]), (t[i] = o));
            else t[n] = o;
        })(p, c.opts.specialEasing);
        r < a;
        r++
      )
        if ((n = dt.prefilters[r].call(c, e, p, c.opts)))
          return _(n.stop) && (w._queueHooks(c.elem, c.opts.queue).stop = n.stop.bind(n)), n;
      return (
        w.map(p, pt, c),
        _(c.opts.start) && c.opts.start.call(e, c),
        c
          .progress(c.opts.progress)
          .done(c.opts.done, c.opts.complete)
          .fail(c.opts.fail)
          .always(c.opts.always),
        w.fx.timer(w.extend(l, { elem: e, anim: c, queue: c.opts.queue })),
        c
      );
    }
    (w.Animation = w.extend(dt, {
      tweeners: {
        '*': [
          function (e, t) {
            var i = this.createTween(e, t);
            return se(i.elem, e, te.exec(t), i), i;
          },
        ],
      },
      tweener: function (e, t) {
        _(e) ? ((t = e), (e = ['*'])) : (e = e.match(M));
        for (var i, n = 0, o = e.length; n < o; n++)
          (i = e[n]), (dt.tweeners[i] = dt.tweeners[i] || []), dt.tweeners[i].unshift(t);
      },
      prefilters: [
        function (e, t, i) {
          var n,
            o,
            r,
            a,
            s,
            l,
            c,
            p,
            d = 'width' in t || 'height' in t,
            u = this,
            h = {},
            _ = e.style,
            f = e.nodeType && ae(e),
            m = G.get(e, 'fxshow');
          for (n in (i.queue ||
            (null == (a = w._queueHooks(e, 'fx')).unqueued &&
              ((a.unqueued = 0),
                (s = a.empty.fire),
                (a.empty.fire = function () {
                  a.unqueued || s();
                })),
              a.unqueued++,
              u.always(function () {
                u.always(function () {
                  a.unqueued--, w.queue(e, 'fx').length || a.empty.fire();
                });
              })),
            t))
            if (((o = t[n]), rt.test(o))) {
              if ((delete t[n], (r = r || 'toggle' === o), o === (f ? 'hide' : 'show'))) {
                if ('show' !== o || !m || void 0 === m[n]) continue;
                f = !0;
              }
              h[n] = (m && m[n]) || w.style(e, n);
            }
          if ((l = !w.isEmptyObject(t)) || !w.isEmptyObject(h))
            for (n in (d &&
              1 === e.nodeType &&
              ((i.overflow = [_.overflow, _.overflowX, _.overflowY]),
                null == (c = m && m.display) && (c = G.get(e, 'display')),
                'none' === (p = w.css(e, 'display')) &&
                (c
                  ? (p = c)
                  : (ce([e], !0), (c = e.style.display || c), (p = w.css(e, 'display')), ce([e]))),
                ('inline' === p || ('inline-block' === p && null != c)) &&
                'none' === w.css(e, 'float') &&
                (l ||
                  (u.done(function () {
                    _.display = c;
                  }),
                    null == c && ((p = _.display), (c = 'none' === p ? '' : p))),
                  (_.display = 'inline-block'))),
              i.overflow &&
              ((_.overflow = 'hidden'),
                u.always(function () {
                  (_.overflow = i.overflow[0]),
                    (_.overflowX = i.overflow[1]),
                    (_.overflowY = i.overflow[2]);
                })),
              (l = !1),
              h))
              l ||
                (m ? 'hidden' in m && (f = m.hidden) : (m = G.access(e, 'fxshow', { display: c })),
                  r && (m.hidden = !f),
                  f && ce([e], !0),
                  u.done(function () {
                    for (n in (f || ce([e]), G.remove(e, 'fxshow'), h)) w.style(e, n, h[n]);
                  })),
                (l = pt(f ? m[n] : 0, n, u)),
                n in m || ((m[n] = l.start), f && ((l.end = l.start), (l.start = 0)));
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
              complete: i || (!i && t) || (_(e) && e),
              duration: e,
              easing: (i && t) || (t && !_(t) && t),
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
            _(n.old) && n.old.call(this), n.queue && w.dequeue(this, n.queue);
          }),
          n
        );
      }),
      w.fn.extend({
        fadeTo: function (e, t, i, n) {
          return this.filter(ae).css('opacity', 0).show().end().animate({ opacity: t }, e, i, n);
        },
        animate: function (e, t, i, n) {
          var o = w.isEmptyObject(e),
            r = w.speed(t, i, n),
            a = function () {
              var t = dt(this, w.extend({}, e), r);
              (o || G.get(this, 'finish')) && t.stop(!0);
            };
          return (a.finish = a), o || !1 === r.queue ? this.each(a) : this.queue(r.queue, a);
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
                o = null != e && e + 'queueHooks',
                r = w.timers,
                a = G.get(this);
              if (o) a[o] && a[o].stop && n(a[o]);
              else for (o in a) a[o] && a[o].stop && at.test(o) && n(a[o]);
              for (o = r.length; o--;)
                r[o].elem !== this ||
                  (null != e && r[o].queue !== e) ||
                  (r[o].anim.stop(i), (t = !1), r.splice(o, 1));
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
                o = i[e + 'queueHooks'],
                r = w.timers,
                a = n ? n.length : 0;
              for (
                i.finish = !0,
                w.queue(this, e, []),
                o && o.stop && o.stop.call(this, !0),
                t = r.length;
                t--;

              )
                r[t].elem === this && r[t].queue === e && (r[t].anim.stop(!0), r.splice(t, 1));
              for (t = 0; t < a; t++) n[t] && n[t].finish && n[t].finish.call(this);
              delete i.finish;
            })
          );
        },
      }),
      w.each(['toggle', 'show', 'hide'], function (e, t) {
        var i = w.fn[t];
        w.fn[t] = function (e, n, o) {
          return null == e || 'boolean' == typeof e
            ? i.apply(this, arguments)
            : this.animate(ct(t, !0), e, n, o);
        };
      }),
      w.each(
        {
          slideDown: ct('show'),
          slideUp: ct('hide'),
          slideToggle: ct('toggle'),
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
        it || ((it = !0), st());
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
            var o = e.setTimeout(i, t);
            n.stop = function () {
              e.clearTimeout(o);
            };
          })
        );
      }),
      (nt = m.createElement('input')),
      (ot = m.createElement('select').appendChild(m.createElement('option'))),
      (nt.type = 'checkbox'),
      (h.checkOn = '' !== nt.value),
      (h.optSelected = ot.selected),
      ((nt = m.createElement('input')).value = 't'),
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
            o,
            r = e.nodeType;
          if (3 !== r && 8 !== r && 2 !== r)
            return void 0 === e.getAttribute
              ? w.prop(e, t, i)
              : ((1 === r && w.isXMLDoc(e)) ||
                (o = w.attrHooks[t.toLowerCase()] || (w.expr.match.bool.test(t) ? ut : void 0)),
                void 0 !== i
                  ? null === i
                    ? void w.removeAttr(e, t)
                    : o && 'set' in o && void 0 !== (n = o.set(e, i, t))
                      ? n
                      : (e.setAttribute(t, i + ''), i)
                  : o && 'get' in o && null !== (n = o.get(e, t))
                    ? n
                    : null == (n = w.find.attr(e, t))
                      ? void 0
                      : n);
        },
        attrHooks: {
          type: {
            set: function (e, t) {
              if (!h.radioValue && 'radio' === t && z(e, 'input')) {
                var i = e.value;
                return e.setAttribute('type', t), i && (e.value = i), t;
              }
            },
          },
        },
        removeAttr: function (e, t) {
          var i,
            n = 0,
            o = t && t.match(M);
          if (o && 1 === e.nodeType) for (; (i = o[n++]);) e.removeAttribute(i);
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
          var o,
            r,
            a = t.toLowerCase();
          return (
            n || ((r = ht[a]), (ht[a] = o), (o = null != i(e, t, n) ? a : null), (ht[a] = r)), o
          );
        };
      });
    var _t = /^(?:input|select|textarea|button)$/i,
      ft = /^(?:a|area)$/i;
    function mt(e) {
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
            o,
            r = e.nodeType;
          if (3 !== r && 8 !== r && 2 !== r)
            return (
              (1 === r && w.isXMLDoc(e)) || ((t = w.propFix[t] || t), (o = w.propHooks[t])),
              void 0 !== i
                ? o && 'set' in o && void 0 !== (n = o.set(e, i, t))
                  ? n
                  : (e[t] = i)
                : o && 'get' in o && null !== (n = o.get(e, t))
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
                : _t.test(e.nodeName) || (ft.test(e.nodeName) && e.href)
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
            o,
            r,
            a,
            s,
            l = 0;
          if (_(e))
            return this.each(function (t) {
              w(this).addClass(e.call(this, t, gt(this)));
            });
          if ((t = yt(e)).length)
            for (; (i = this[l++]);)
              if (((o = gt(i)), (n = 1 === i.nodeType && ' ' + mt(o) + ' '))) {
                for (a = 0; (r = t[a++]);) n.indexOf(' ' + r + ' ') < 0 && (n += r + ' ');
                o !== (s = mt(n)) && i.setAttribute('class', s);
              }
          return this;
        },
        removeClass: function (e) {
          var t,
            i,
            n,
            o,
            r,
            a,
            s,
            l = 0;
          if (_(e))
            return this.each(function (t) {
              w(this).removeClass(e.call(this, t, gt(this)));
            });
          if (!arguments.length) return this.attr('class', '');
          if ((t = yt(e)).length)
            for (; (i = this[l++]);)
              if (((o = gt(i)), (n = 1 === i.nodeType && ' ' + mt(o) + ' '))) {
                for (a = 0; (r = t[a++]);)
                  for (; -1 < n.indexOf(' ' + r + ' ');) n = n.replace(' ' + r + ' ', ' ');
                o !== (s = mt(n)) && i.setAttribute('class', s);
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
            : _(e)
              ? this.each(function (i) {
                w(this).toggleClass(e.call(this, i, gt(this), t), t);
              })
              : this.each(function () {
                var t, o, r, a;
                if (n)
                  for (o = 0, r = w(this), a = yt(e); (t = a[o++]);)
                    r.hasClass(t) ? r.removeClass(t) : r.addClass(t);
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
            if (1 === i.nodeType && -1 < (' ' + mt(gt(i)) + ' ').indexOf(t)) return !0;
          return !1;
        },
      });
    var vt = /\r/g;
    w.fn.extend({
      val: function (e) {
        var t,
          i,
          n,
          o = this[0];
        return arguments.length
          ? ((n = _(e)),
            this.each(function (i) {
              var o;
              1 === this.nodeType &&
                (null == (o = n ? e.call(this, i, w(this).val()) : e)
                  ? (o = '')
                  : 'number' == typeof o
                    ? (o += '')
                    : Array.isArray(o) &&
                    (o = w.map(o, function (e) {
                      return null == e ? '' : e + '';
                    })),
                  ((t = w.valHooks[this.type] || w.valHooks[this.nodeName.toLowerCase()]) &&
                    'set' in t &&
                    void 0 !== t.set(this, o, 'value')) ||
                  (this.value = o));
            }))
          : o
            ? (t = w.valHooks[o.type] || w.valHooks[o.nodeName.toLowerCase()]) &&
              'get' in t &&
              void 0 !== (i = t.get(o, 'value'))
              ? i
              : 'string' == typeof (i = o.value)
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
              return null != t ? t : mt(w.text(e));
            },
          },
          select: {
            get: function (e) {
              var t,
                i,
                n,
                o = e.options,
                r = e.selectedIndex,
                a = 'select-one' === e.type,
                s = a ? null : [],
                l = a ? r + 1 : o.length;
              for (n = r < 0 ? l : a ? r : 0; n < l; n++)
                if (
                  ((i = o[n]).selected || n === r) &&
                  !i.disabled &&
                  (!i.parentNode.disabled || !z(i.parentNode, 'optgroup'))
                ) {
                  if (((t = w(i).val()), a)) return t;
                  s.push(t);
                }
              return s;
            },
            set: function (e, t) {
              for (var i, n, o = e.options, r = w.makeArray(t), a = o.length; a--;)
                ((n = o[a]).selected = -1 < w.inArray(w.valHooks.option.get(n), r)) && (i = !0);
              return i || (e.selectedIndex = -1), r;
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
      trigger: function (t, i, n, o) {
        var r,
          a,
          s,
          l,
          c,
          d,
          u,
          h,
          g = [n || m],
          y = p.call(t, 'type') ? t.type : t,
          v = p.call(t, 'namespace') ? t.namespace.split('.') : [];
        if (
          ((a = h = s = n = n || m),
            3 !== n.nodeType &&
            8 !== n.nodeType &&
            !bt.test(y + w.event.triggered) &&
            (-1 < y.indexOf('.') && ((y = (v = y.split('.')).shift()), v.sort()),
              (c = y.indexOf(':') < 0 && 'on' + y),
              ((t = t[w.expando] ? t : new w.Event(y, 'object' == typeof t && t)).isTrigger = o
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
              o || !u.trigger || !1 !== u.trigger.apply(n, i)))
        ) {
          if (!o && !u.noBubble && !f(n)) {
            for (l = u.delegateType || y, bt.test(l + y) || (a = a.parentNode); a; a = a.parentNode)
              g.push(a), (s = a);
            s === (n.ownerDocument || m) && g.push(s.defaultView || s.parentWindow || e);
          }
          for (r = 0; (a = g[r++]) && !t.isPropagationStopped();)
            (h = a),
              (t.type = 1 < r ? l : u.bindType || y),
              (d = (G.get(a, 'events') || Object.create(null))[t.type] && G.get(a, 'handle')) &&
              d.apply(a, i),
              (d = c && a[c]) &&
              d.apply &&
              Q(a) &&
              ((t.result = d.apply(a, i)), !1 === t.result && t.preventDefault());
          return (
            (t.type = y),
            o ||
            t.isDefaultPrevented() ||
            (u._default && !1 !== u._default.apply(g.pop(), i)) ||
            !Q(n) ||
            (c &&
              _(n[y]) &&
              !f(n) &&
              ((s = n[c]) && (n[c] = null),
                (w.event.triggered = y),
                t.isPropagationStopped() && h.addEventListener(y, wt),
                n[y](),
                t.isPropagationStopped() && h.removeEventListener(y, wt),
                (w.event.triggered = void 0),
                s && (n[c] = s))),
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
              o = G.access(n, t);
            o || n.addEventListener(e, i, !0), G.access(n, t, (o || 0) + 1);
          },
          teardown: function () {
            var n = this.ownerDocument || this.document || this,
              o = G.access(n, t) - 1;
            o ? G.access(n, t, o) : (n.removeEventListener(e, i, !0), G.remove(n, t));
          },
        };
      });
    var kt = e.location,
      xt = { guid: Date.now() },
      $t = /\?/;
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
      St = /\r?\n/g,
      zt = /^(?:submit|button|image|reset|file)$/i,
      jt = /^(?:input|select|textarea|keygen)/i;
    function Tt(e, t, i, n) {
      var o;
      if (Array.isArray(t))
        w.each(t, function (t, o) {
          i || Ct.test(e)
            ? n(e, o)
            : Tt(e + '[' + ('object' == typeof o && null != o ? t : '') + ']', o, i, n);
        });
      else if (i || 'object' !== v(t)) n(e, t);
      else for (o in t) Tt(e + '[' + o + ']', t[o], i, n);
    }
    (w.param = function (e, t) {
      var i,
        n = [],
        o = function (e, t) {
          var i = _(t) ? t() : t;
          n[n.length] = encodeURIComponent(e) + '=' + encodeURIComponent(null == i ? '' : i);
        };
      if (null == e) return '';
      if (Array.isArray(e) || (e.jquery && !w.isPlainObject(e)))
        w.each(e, function () {
          o(this.name, this.value);
        });
      else for (i in e) Tt(i, e[i], t, o);
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
                jt.test(this.nodeName) &&
                !zt.test(e) &&
                (this.checked || !ue.test(e))
              );
            })
            .map(function (e, t) {
              var i = w(this).val();
              return null == i
                ? null
                : Array.isArray(i)
                  ? w.map(i, function (e) {
                    return { name: t.name, value: e.replace(St, '\r\n') };
                  })
                  : { name: t.name, value: i.replace(St, '\r\n') };
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
      Pt = {},
      Nt = {},
      It = '*/'.concat('*'),
      qt = m.createElement('a');
    function Ft(e) {
      return function (t, i) {
        'string' != typeof t && ((i = t), (t = '*'));
        var n,
          o = 0,
          r = t.toLowerCase().match(M) || [];
        if (_(i))
          for (; (n = r[o++]);)
            '+' === n[0]
              ? ((n = n.slice(1) || '*'), (e[n] = e[n] || []).unshift(i))
              : (e[n] = e[n] || []).push(i);
      };
    }
    function Ht(e, t, i, n) {
      var o = {},
        r = e === Nt;
      function a(s) {
        var l;
        return (
          (o[s] = !0),
          w.each(e[s] || [], function (e, s) {
            var c = s(t, i, n);
            return 'string' != typeof c || r || o[c]
              ? r
                ? !(l = c)
                : void 0
              : (t.dataTypes.unshift(c), a(c), !1);
          }),
          l
        );
      }
      return a(t.dataTypes[0]) || (!o['*'] && a('*'));
    }
    function Bt(e, t) {
      var i,
        n,
        o = w.ajaxSettings.flatOptions || {};
      for (i in t) void 0 !== t[i] && ((o[i] ? e : n || (n = {}))[i] = t[i]);
      return n && w.extend(!0, e, n), e;
    }
    (qt.href = kt.href),
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
        ajaxPrefilter: Ft(Pt),
        ajaxTransport: Ft(Nt),
        ajax: function (t, i) {
          'object' == typeof t && ((i = t), (t = void 0)), (i = i || {});
          var n,
            o,
            r,
            a,
            s,
            l,
            c,
            p,
            d,
            u,
            h = w.ajaxSetup({}, i),
            _ = h.context || h,
            f = h.context && (_.nodeType || _.jquery) ? w(_) : w.event,
            g = w.Deferred(),
            y = w.Callbacks('once memory'),
            v = h.statusCode || {},
            b = {},
            k = {},
            x = 'canceled',
            $ = {
              readyState: 0,
              getResponseHeader: function (e) {
                var t;
                if (c) {
                  if (!a)
                    for (a = {}; (t = Lt.exec(r));)
                      a[t[1].toLowerCase() + ' '] = (a[t[1].toLowerCase() + ' '] || []).concat(
                        t[2],
                      );
                  t = a[e.toLowerCase() + ' '];
                }
                return null == t ? null : t.join(', ');
              },
              getAllResponseHeaders: function () {
                return c ? r : null;
              },
              setRequestHeader: function (e, t) {
                return (
                  null == c && ((e = k[e.toLowerCase()] = k[e.toLowerCase()] || e), (b[e] = t)),
                  this
                );
              },
              overrideMimeType: function (e) {
                return null == c && (h.mimeType = e), this;
              },
              statusCode: function (e) {
                var t;
                if (e)
                  if (c) $.always(e[$.status]);
                  else for (t in e) v[t] = [v[t], e[t]];
                return this;
              },
              abort: function (e) {
                var t = e || x;
                return n && n.abort(t), C(0, t), this;
              },
            };
          if (
            (g.promise($),
              (h.url = ((t || h.url || kt.href) + '').replace(Mt, kt.protocol + '//')),
              (h.type = i.method || i.type || h.method || h.type),
              (h.dataTypes = (h.dataType || '*').toLowerCase().match(M) || ['']),
              null == h.crossDomain)
          ) {
            l = m.createElement('a');
            try {
              (l.href = h.url),
                (l.href = l.href),
                (h.crossDomain = qt.protocol + '//' + qt.host != l.protocol + '//' + l.host);
            } catch (t) {
              h.crossDomain = !0;
            }
          }
          if (
            (h.data &&
              h.processData &&
              'string' != typeof h.data &&
              (h.data = w.param(h.data, h.traditional)),
              Ht(Pt, h, i, $),
              c)
          )
            return $;
          for (d in ((p = w.event && h.global) && 0 == w.active++ && w.event.trigger('ajaxStart'),
            (h.type = h.type.toUpperCase()),
            (h.hasContent = !Ot.test(h.type)),
            (o = h.url.replace(At, '')),
            h.hasContent
              ? h.data &&
              h.processData &&
              0 === (h.contentType || '').indexOf('application/x-www-form-urlencoded') &&
              (h.data = h.data.replace(Dt, '+'))
              : ((u = h.url.slice(o.length)),
                h.data &&
                (h.processData || 'string' == typeof h.data) &&
                ((o += ($t.test(o) ? '&' : '?') + h.data), delete h.data),
                !1 === h.cache &&
                ((o = o.replace(Et, '$1')), (u = ($t.test(o) ? '&' : '?') + '_=' + xt.guid++ + u)),
                (h.url = o + u)),
            h.ifModified &&
            (w.lastModified[o] && $.setRequestHeader('If-Modified-Since', w.lastModified[o]),
              w.etag[o] && $.setRequestHeader('If-None-Match', w.etag[o])),
            ((h.data && h.hasContent && !1 !== h.contentType) || i.contentType) &&
            $.setRequestHeader('Content-Type', h.contentType),
            $.setRequestHeader(
              'Accept',
              h.dataTypes[0] && h.accepts[h.dataTypes[0]]
                ? h.accepts[h.dataTypes[0]] + ('*' !== h.dataTypes[0] ? ', ' + It + '; q=0.01' : '')
                : h.accepts['*'],
            ),
            h.headers))
            $.setRequestHeader(d, h.headers[d]);
          if (h.beforeSend && (!1 === h.beforeSend.call(_, $, h) || c)) return $.abort();
          if (
            ((x = 'abort'),
              y.add(h.complete),
              $.done(h.success),
              $.fail(h.error),
              (n = Ht(Nt, h, i, $)))
          ) {
            if ((($.readyState = 1), p && f.trigger('ajaxSend', [$, h]), c)) return $;
            h.async &&
              0 < h.timeout &&
              (s = e.setTimeout(function () {
                $.abort('timeout');
              }, h.timeout));
            try {
              (c = !1), n.send(b, C);
            } catch (t) {
              if (c) throw t;
              C(-1, t);
            }
          } else C(-1, 'No Transport');
          function C(t, i, a, l) {
            var d,
              u,
              m,
              b,
              k,
              x = i;
            c ||
              ((c = !0),
                s && e.clearTimeout(s),
                (n = void 0),
                (r = l || ''),
                ($.readyState = 0 < t ? 4 : 0),
                (d = (200 <= t && t < 300) || 304 === t),
                a &&
                (b = (function (e, t, i) {
                  for (var n, o, r, a, s = e.contents, l = e.dataTypes; '*' === l[0];)
                    l.shift(),
                      void 0 === n && (n = e.mimeType || t.getResponseHeader('Content-Type'));
                  if (n)
                    for (o in s)
                      if (s[o] && s[o].test(n)) {
                        l.unshift(o);
                        break;
                      }
                  if (l[0] in i) r = l[0];
                  else {
                    for (o in i) {
                      if (!l[0] || e.converters[o + ' ' + l[0]]) {
                        r = o;
                        break;
                      }
                      a || (a = o);
                    }
                    r = r || a;
                  }
                  if (r) return r !== l[0] && l.unshift(r), i[r];
                })(h, $, a)),
                !d &&
                -1 < w.inArray('script', h.dataTypes) &&
                (h.converters['text script'] = function () { }),
                (b = (function (e, t, i, n) {
                  var o,
                    r,
                    a,
                    s,
                    l,
                    c = {},
                    p = e.dataTypes.slice();
                  if (p[1]) for (a in e.converters) c[a.toLowerCase()] = e.converters[a];
                  for (r = p.shift(); r;)
                    if (
                      (e.responseFields[r] && (i[e.responseFields[r]] = t),
                        !l && n && e.dataFilter && (t = e.dataFilter(t, e.dataType)),
                        (l = r),
                        (r = p.shift()))
                    )
                      if ('*' === r) r = l;
                      else if ('*' !== l && l !== r) {
                        if (!(a = c[l + ' ' + r] || c['* ' + r]))
                          for (o in c)
                            if (
                              (s = o.split(' '))[1] === r &&
                              (a = c[l + ' ' + s[0]] || c['* ' + s[0]])
                            ) {
                              !0 === a ? (a = c[o]) : !0 !== c[o] && ((r = s[0]), p.unshift(s[1]));
                              break;
                            }
                        if (!0 !== a)
                          if (a && e.throws) t = a(t);
                          else
                            try {
                              t = a(t);
                            } catch (e) {
                              return {
                                state: 'parsererror',
                                error: a ? e : 'No conversion from ' + l + ' to ' + r,
                              };
                            }
                      }
                  return { state: 'success', data: t };
                })(h, b, $, d)),
                d
                  ? (h.ifModified &&
                    ((k = $.getResponseHeader('Last-Modified')) && (w.lastModified[o] = k),
                      (k = $.getResponseHeader('etag')) && (w.etag[o] = k)),
                    204 === t || 'HEAD' === h.type
                      ? (x = 'nocontent')
                      : 304 === t
                        ? (x = 'notmodified')
                        : ((x = b.state), (u = b.data), (d = !(m = b.error))))
                  : ((m = x), (!t && x) || ((x = 'error'), t < 0 && (t = 0))),
                ($.status = t),
                ($.statusText = (i || x) + ''),
                d ? g.resolveWith(_, [u, x, $]) : g.rejectWith(_, [$, x, m]),
                $.statusCode(v),
                (v = void 0),
                p && f.trigger(d ? 'ajaxSuccess' : 'ajaxError', [$, h, d ? u : m]),
                y.fireWith(_, [$, x]),
                p && (f.trigger('ajaxComplete', [$, h]), --w.active || w.event.trigger('ajaxStop')));
          }
          return $;
        },
        getJSON: function (e, t, i) {
          return w.get(e, t, i, 'json');
        },
        getScript: function (e, t) {
          return w.get(e, void 0, t, 'script');
        },
      }),
      w.each(['get', 'post'], function (e, t) {
        w[t] = function (e, i, n, o) {
          return (
            _(i) && ((o = o || n), (n = i), (i = void 0)),
            w.ajax(
              w.extend(
                { url: e, type: t, dataType: o, data: i, success: n },
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
            (_(e) && (e = e.call(this[0])),
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
          return _(e)
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
          var t = _(e);
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
            send: function (o, r) {
              var a,
                s = t.xhr();
              if ((s.open(t.type, t.url, t.async, t.username, t.password), t.xhrFields))
                for (a in t.xhrFields) s[a] = t.xhrFields[a];
              for (a in (t.mimeType && s.overrideMimeType && s.overrideMimeType(t.mimeType),
                t.crossDomain || o['X-Requested-With'] || (o['X-Requested-With'] = 'XMLHttpRequest'),
                o))
                s.setRequestHeader(a, o[a]);
              (i = function (e) {
                return function () {
                  i &&
                    ((i = n = s.onload = s.onerror = s.onabort = s.ontimeout = s.onreadystatechange = null),
                      'abort' === e
                        ? s.abort()
                        : 'error' === e
                          ? 'number' != typeof s.status
                            ? r(0, 'error')
                            : r(s.status, s.statusText)
                          : r(
                            Rt[s.status] || s.status,
                            s.statusText,
                            'text' !== (s.responseType || 'text') || 'string' != typeof s.responseText
                              ? { binary: s.response }
                              : { text: s.responseText },
                            s.getAllResponseHeaders(),
                          ));
                };
              }),
                (s.onload = i()),
                (n = s.onerror = s.ontimeout = i('error')),
                void 0 !== s.onabort
                  ? (s.onabort = n)
                  : (s.onreadystatechange = function () {
                    4 === s.readyState &&
                      e.setTimeout(function () {
                        i && n();
                      });
                  }),
                (i = i('abort'));
              try {
                s.send((t.hasContent && t.data) || null);
              } catch (o) {
                if (i) throw o;
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
            send: function (n, o) {
              (t = w('<script>')
                .attr(e.scriptAttrs || {})
                .prop({ charset: e.scriptCharset, src: e.url })
                .on(
                  'load error',
                  (i = function (e) {
                    t.remove(), (i = null), e && o('error' === e.type ? 404 : 200, e.type);
                  }),
                )),
                m.head.appendChild(t[0]);
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
        var o,
          r,
          a,
          s =
            !1 !== t.jsonp &&
            (Qt.test(t.url)
              ? 'url'
              : 'string' == typeof t.data &&
              0 === (t.contentType || '').indexOf('application/x-www-form-urlencoded') &&
              Qt.test(t.data) &&
              'data');
        if (s || 'jsonp' === t.dataTypes[0])
          return (
            (o = t.jsonpCallback = _(t.jsonpCallback) ? t.jsonpCallback() : t.jsonpCallback),
            s
              ? (t[s] = t[s].replace(Qt, '$1' + o))
              : !1 !== t.jsonp && (t.url += ($t.test(t.url) ? '&' : '?') + t.jsonp + '=' + o),
            (t.converters['script json'] = function () {
              return a || w.error(o + ' was not called'), a[0];
            }),
            (t.dataTypes[0] = 'json'),
            (r = e[o]),
            (e[o] = function () {
              a = arguments;
            }),
            n.always(function () {
              void 0 === r ? w(e).removeProp(o) : (e[o] = r),
                t[o] && ((t.jsonpCallback = i.jsonpCallback), Ut.push(o)),
                a && _(r) && r(a[0]),
                (a = r = void 0);
            }),
            'script'
          );
      }),
      (h.createHTMLDocument =
        (((Yt = m.implementation.createHTMLDocument('').body).innerHTML =
          '<form></form><form></form>'),
          2 === Yt.childNodes.length)),
      (w.parseHTML = function (e, t, i) {
        return 'string' != typeof e
          ? []
          : ('boolean' == typeof t && ((i = t), (t = !1)),
            t ||
            (h.createHTMLDocument
              ? (((n = (t = m.implementation.createHTMLDocument('')).createElement('base')).href =
                m.location.href),
                t.head.appendChild(n))
              : (t = m)),
            (r = !i && []),
            (o = j.exec(e))
              ? [t.createElement(o[1])]
              : ((o = ve([e], t, r)), r && r.length && w(r).remove(), w.merge([], o.childNodes)));
        var n, o, r;
      }),
      (w.fn.load = function (e, t, i) {
        var n,
          o,
          r,
          a = this,
          s = e.indexOf(' ');
        return (
          -1 < s && ((n = mt(e.slice(s))), (e = e.slice(0, s))),
          _(t) ? ((i = t), (t = void 0)) : t && 'object' == typeof t && (o = 'POST'),
          0 < a.length &&
          w
            .ajax({ url: e, type: o || 'GET', dataType: 'html', data: t })
            .done(function (e) {
              (r = arguments), a.html(n ? w('<div>').append(w.parseHTML(e)).find(n) : e);
            })
            .always(
              i &&
              function (e, t) {
                a.each(function () {
                  i.apply(this, r || [e.responseText, t, e]);
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
            o,
            r,
            a,
            s,
            l,
            c = w.css(e, 'position'),
            p = w(e),
            d = {};
          'static' === c && (e.style.position = 'relative'),
            (s = p.offset()),
            (r = w.css(e, 'top')),
            (l = w.css(e, 'left')),
            ('absolute' === c || 'fixed' === c) && -1 < (r + l).indexOf('auto')
              ? ((a = (n = p.position()).top), (o = n.left))
              : ((a = parseFloat(r) || 0), (o = parseFloat(l) || 0)),
            _(t) && (t = t.call(e, i, w.extend({}, s))),
            null != t.top && (d.top = t.top - s.top + a),
            null != t.left && (d.left = t.left - s.left + o),
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
              o = { top: 0, left: 0 };
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
                (((o = w(e).offset()).top += w.css(e, 'borderTopWidth', !0)),
                  (o.left += w.css(e, 'borderLeftWidth', !0)));
            }
            return {
              top: t.top - o.top - w.css(n, 'marginTop', !0),
              left: t.left - o.left - w.css(n, 'marginLeft', !0),
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
            function (e, n, o) {
              var r;
              if ((f(e) ? (r = e) : 9 === e.nodeType && (r = e.defaultView), void 0 === o))
                return r ? r[t] : e[n];
              r ? r.scrollTo(i ? r.pageXOffset : o, i ? o : r.pageYOffset) : (e[n] = o);
            },
            e,
            n,
            arguments.length,
          );
        };
      }),
      w.each(['top', 'left'], function (e, t) {
        w.cssHooks[t] = Be(h.pixelPosition, function (e, i) {
          if (i) return (i = He(e, t)), Ne.test(i) ? w(e).position()[t] + 'px' : i;
        });
      }),
      w.each({ Height: 'height', Width: 'width' }, function (e, t) {
        w.each({ padding: 'inner' + e, content: t, '': 'outer' + e }, function (i, n) {
          w.fn[n] = function (o, r) {
            var a = arguments.length && (i || 'boolean' != typeof o),
              s = i || (!0 === o || !0 === r ? 'margin' : 'border');
            return B(
              this,
              function (t, i, o) {
                var r;
                return f(t)
                  ? 0 === n.indexOf('outer')
                    ? t['inner' + e]
                    : t.document.documentElement['client' + e]
                  : 9 === t.nodeType
                    ? ((r = t.documentElement),
                      Math.max(
                        t.body['scroll' + e],
                        r['scroll' + e],
                        t.body['offset' + e],
                        r['offset' + e],
                        r['client' + e],
                      ))
                    : void 0 === o
                      ? w.css(t, i, s)
                      : w.style(t, i, o, s);
              },
              t,
              a ? o : void 0,
              a,
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
      var i, n, r;
      if (('string' == typeof t && ((i = e[t]), (t = e), (e = i)), _(e)))
        return (
          (n = o.call(arguments, 2)),
          ((r = function () {
            return e.apply(t || this, n.concat(o.call(arguments)));
          }).guid = e.guid = e.guid || w.guid++),
          r
        );
    }),
      (w.holdReady = function (e) {
        e ? w.readyWait++ : w.ready(!0);
      }),
      (w.isArray = Array.isArray),
      (w.parseJSON = JSON.parse),
      (w.nodeName = z),
      (w.isFunction = _),
      (w.isWindow = f),
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
            o = n.exec(e) || [],
            r = n.exec(t) || [];
          for (i = 1; i <= 3; i++) {
            if (+o[i] > +r[i]) return 1;
            if (+o[i] < +r[i]) return -1;
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
    function o(e, t, i, n) {
      e[t] = function () {
        return i.apply(this, arguments);
      };
    }
    (e.migrateDeduplicateWarnings = !0),
      (e.migrateWarnings = []),
      void 0 === e.migrateTrace && (e.migrateTrace = !0),
      (e.migrateReset = function () {
        ({}, (e.migrateWarnings.length = 0));
      }),
      t.document.compatMode;
    var r,
      a = {},
      s = e.fn.init,
      l = e.find,
      c = /\[(\s*[-\w]+\s*)([~|^$*]?=)\s*([-\w#]*?#[-\w#]*)\s*\]/,
      p = /\[(\s*[-\w]+\s*)([~|^$*]?=)\s*([-\w#]*?#[-\w#]*)\s*\]/g,
      d = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
    for (r in ((e.fn.init = function (e) {
      var t = Array.prototype.slice.call(arguments);
      return 'string' == typeof e && '#' === e && (t[0] = []), s.apply(this, t);
    }),
      (e.fn.init.prototype = e.fn),
      (e.find = function (e) {
        var i = Array.prototype.slice.call(arguments);
        if ('string' == typeof e && c.test(e))
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
        return l.apply(this, i);
      }),
      l))
      Object.prototype.hasOwnProperty.call(l, r) && (e.find[r] = l[r]);
    if (
      (o(e.fn, 'size', function () {
        return this.length;
      }),
        o(e, 'parseJSON', function () {
          return JSON.parse.apply(null, arguments);
        }),
        o(e, 'holdReady', e.holdReady),
        o(e, 'unique', e.uniqueSort),
        n(e.expr, 'filters', e.expr.pseudos),
        n(e.expr, ':', e.expr.pseudos),
        i('3.1.1') &&
        o(e, 'trim', function (e) {
          return null == e ? '' : (e + '').replace(d, '');
        }),
        i('3.2.0') &&
        o(e, 'nodeName', function (e, t) {
          return e.nodeName && e.nodeName.toLowerCase() === t.toLowerCase();
        }),
        i('3.3.0') &&
        (o(e, 'isNumeric', function (e) {
          var t = typeof e;
          return ('number' === t || 'string' === t) && !isNaN(e - parseFloat(e));
        }),
          e.each(
            'Boolean Number String Function Array Date RegExp Object Error Symbol'.split(' '),
            function (e, t) {
              a['[object ' + t + ']'] = t.toLowerCase();
            },
          ),
          o(e, 'type', function (e) {
            return null == e
              ? e + ''
              : 'object' == typeof e || 'function' == typeof e
                ? a[Object.prototype.toString.call(e)] || 'object'
                : typeof e;
          }),
          o(e, 'isFunction', function (e) {
            return 'function' == typeof e;
          }),
          o(e, 'isWindow', function (e) {
            return null != e && e === e.window;
          }),
          o(e, 'isArray', Array.isArray)),
        e.ajax)
    ) {
      var u = e.ajax;
      e.ajax = function () {
        var e = u.apply(this, arguments);
        return (
          e.promise && (o(e, 'success', e.done), o(e, 'error', e.fail), o(e, 'complete', e.always)),
          e
        );
      };
    }
    var h = e.fn.removeAttr,
      _ = e.fn.toggleClass,
      f = /\S+/g;
    function m(e) {
      return e.replace(/-([a-z])/g, function (e, t) {
        return t.toUpperCase();
      });
    }
    (e.fn.removeAttr = function (t) {
      var i = this;
      return (
        e.each(t.match(f), function (t, n) {
          e.expr.match.bool.test(n) && i.prop(n, !1);
        }),
        h.apply(this, arguments)
      );
    }),
      (e.fn.toggleClass = function (t) {
        return void 0 !== t && 'boolean' != typeof t
          ? _.apply(this, arguments)
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
      v = /^(?:Border(?:Top|Right|Bottom|Left)?(?:Width|)|(?:Margin|Padding)?(?:Top|Right|Bottom|Left)?|(?:Min|Max)?(?:Width|Height))$/;
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
        var o,
          r,
          a = {};
        for (r in t) (a[r] = e.style[r]), (e.style[r] = t[r]);
        for (r in ((o = i.apply(e, n || [])), t)) e.style[r] = a[r];
        return o;
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
          o = this;
        return (
          t &&
          'object' == typeof t &&
          !Array.isArray(t) &&
          e.each(t, function (t, i) {
            e.fn.css.call(o, t, i);
          }),
          'number' == typeof i && !b((n = m(t))) && e.cssNumber[n],
          g.apply(this, arguments)
        );
      });
    var w = e.data;
    if (
      ((e.data = function (t, i, n) {
        var o, r, a;
        if (i && 'object' == typeof i && 2 === arguments.length) {
          for (a in ((o = e.hasData(t) && w.call(this, t)), (r = {}), i))
            a !== m(a) ? (o[a] = i[a]) : (r[a] = i[a]);
          return w.call(this, t, r), i;
        }
        return i &&
          'string' == typeof i &&
          i !== m(i) &&
          (o = e.hasData(t) && w.call(this, t)) &&
          i in o
          ? (arguments.length > 2 && (o[i] = n), o[i])
          : w.apply(this, arguments);
      }),
        e.fx)
    ) {
      var k,
        x = e.Tween.prototype.run,
        $ = function (e) {
          return e;
        };
      (e.Tween.prototype.run = function () {
        e.easing[this.easing].length > 1 && (this.easing.toString(), (e.easing[this.easing] = $)),
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
      S = e.event.add,
      z = e.event.fix;
    (e.event.props = []),
      (e.event.fixHooks = {}),
      n(e.event.props, 'concat', e.event.props.concat),
      (e.event.fix = function (t) {
        var i,
          n = t.type,
          o = this.fixHooks[n],
          r = e.event.props;
        if (r.length) for (r.join(); r.length;) e.event.addProp(r.pop());
        if (o && !o._migrated_ && ((o._migrated_ = !0), (r = o.props) && r.length))
          for (; r.length;) e.event.addProp(r.pop());
        return (i = z.call(this, t)), o && o.filter ? o.filter(i, t) : i;
      }),
      (e.event.add = function (e, i) {
        return e === t && 'load' === i && t.document.readyState, S.apply(this, arguments);
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
    var j = /<(?!area|br|col|embed|hr|img|input|link|meta|param)(([a-z][^\/\0>\x20\t\r\n\f]*)[^>]*)\/>/gi,
      T = e.htmlPrefilter,
      D = function (e) {
        var i = t.document.implementation.createHTMLDocument('');
        return (i.body.innerHTML = e), i.body && i.body.innerHTML;
      },
      A = function (e) {
        var t = e.replace(j, '<$1></$2>');
        t !== e && (D(e), D(t));
      };
    (e.UNSAFE_restoreLegacyHtmlPrefilter = function () {
      e.htmlPrefilter = function (e) {
        return A(e), e.replace(j, '<$1></$2>');
      };
    }),
      (e.htmlPrefilter = function (e) {
        return A(e), T(e);
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
        P = [
          ['resolve', 'done', e.Callbacks('once memory'), e.Callbacks('once memory'), 'resolved'],
          ['reject', 'fail', e.Callbacks('once memory'), e.Callbacks('once memory'), 'rejected'],
          ['notify', 'progress', e.Callbacks('memory'), e.Callbacks('memory')],
        ];
      (e.Deferred = function (t) {
        var i = M(),
          n = i.promise();
        return (
          (i.pipe = n.pipe = function () {
            var t = arguments;
            return e
              .Deferred(function (o) {
                e.each(P, function (e, r) {
                  var a = 'function' == typeof t[e] && t[e];
                  i[r[1]](function () {
                    var e = a && a.apply(this, arguments);
                    e && 'function' == typeof e.promise
                      ? e.promise().done(o.resolve).fail(o.reject).progress(o.notify)
                      : o[r[0] + 'With'](this === n ? o.promise() : this, a ? [e] : arguments);
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
  });
var console = console || {};
(console.log = console.log || function () { }), (console.info = console.info || function () { });
var fun_pc = [],
  fun_pc_large = [],
  fun_tablet = [],
  fun_mobile = [];
function _instanceof(e, t) {
  return null != t && 'undefined' != typeof Symbol && t[Symbol.hasInstance]
    ? t[Symbol.hasInstance](e)
    : e instanceof t;
}
function _classCallCheck(e, t) {
  if (!_instanceof(e, t)) throw new TypeError('Cannot call a class as a function');
}
function _defineProperties(e, t) {
  for (var i = 0; i < t.length; i++) {
    var n = t[i];
    (n.enumerable = n.enumerable || !1),
      (n.configurable = !0),
      'value' in n && (n.writable = !0),
      Object.defineProperty(e, n.key, n);
  }
}
function _createClass(e, t, i) {
  return t && _defineProperties(e.prototype, t), i && _defineProperties(e, i), e;
}
(app_shop.vars.xhr = ''),
  (app_shop.getFile = function (e) {
    $.getScript(app_shop.urls.prefix + e + '.js');
  }),
  (app_shop.getOuterJS = function (e) {
    for (var t in e)
      $.getScript(app_shop.urls.prefix + e[t] + '.js', function () {
        console.log('file: ' + e[t]);
      });
  }),
  (app_shop.run = function (e, t, n, o) {
    if ($.isArray(t))
      for (i in t)
        app_shop.fnrun[t[i]] || (app_shop.fnrun[t[i]] = []),
          app_shop.fnrun[t[i]].push({ w: n, fn: e, a: o });
    else
      app_shop.fnrun[t] || (app_shop.fnrun[t] = []), app_shop.fnrun[t].push({ w: n, fn: e, a: o });
  }),
  (app_shop.runArr = function (e, t, i) {
    if (e) {
      var n, o;
      for (n = 0, o = e.length; n < o; n++) {
        var r = e[n].w,
          a = e[n].fn,
          s = e[n].a;
        i
          ? r
            ? $(r).size() && s && (a(), console.log('mode ' + t + ':' + r))
            : s && (a(), console.log('mode ' + t + ':' + r))
          : r
            ? $(r).size() && (a(), console.log('mode ' + t + ':' + r))
            : (a(), console.log('mode ' + t + ':' + r));
      }
    }
  });
var iaiGetAjax = (function () {
  function e(t) {
    _classCallCheck(this, e), (this.data = {}), (this.cache = {}), (this.fn = []);
  }
  return (
    _createClass(e, [
      {
        key: 'projector',
        value: function () {
          (this.data.Projector = { format: 'json', params: {} }), this.fn.push(fn);
        },
      },
      {
        key: 'basket',
        value: function (e) {
          (this.data.Basket = {}), this.fn.push(e);
        },
      },
      {
        key: 'wishlist',
        value: function (e) {
          (this.data.Wishlist = {}), this.fn.push(e);
        },
      },
      {
        key: 'comparers',
        value: function (e) {
          (this.data.Comparers = {}), this.fn.push(e);
        },
      },
      {
        key: 'snippets',
        value: function (e, t) {
          this.data.Snippets
            ? console.log('Snippets data exist')
            : (this.data.Snippets = {
              format: 'json',
              params: {
                mobile: t.mobile,
                tablet: t.tablet,
                pc: t.pc,
                request_uri: t.request_uri,
                additional_ajax: t.additional_ajax,
              },
            }),
            this.fn.push(e);
        },
      },
      {
        key: 'toplayersAndWidgets',
        value: function (e, t) {
          this.data.ToplayersAndWidgets
            ? console.log('ToplayersAndWidgets data exist')
            : (this.data.ToplayersAndWidgets = {
              format: 'json',
              params: {
                mobile: t.mobile,
                tablet: t.tablet,
                pc: t.pc,
                request_uri: t.request_uri,
                additional_ajax: t.additional_ajax,
              },
            }),
            this.fn.push(e);
        },
      },
      { key: 'hotspot', value: function (e, t) { } },
      { key: 'hotspotMain', value: function (e, t) { } },
      { key: 'hotspotProjector', value: function (e, t) { } },
      { key: 'hotspotSearch', value: function (e, t) { } },
      {
        key: 'init',
        value: function () {
          var e = 'request=' + JSON.stringify(this.data),
            t = this;
          $.ajax({
            type: 'POST',
            url: '/ajax/get.php',
            dataType: 'JSON',
            data: e,
            success: function (e) {
              (t.cache = e),
                t.fn.forEach(function (e) {
                  e(t.cache);
                });
            },
            error: function () { },
          });
        },
      },
    ]),
    e
  );
})(),
  iaiGet = new iaiGetAjax();
(app_shop.fn.change_url = function (e) {
  history.pushState && history.pushState({ foo: 'bar' }, '', decodeURIComponent(e));
}),
  (app_shop.fn.evalJSFromHtml = function (e) {
    var t = document.createElement('div');
    t.innerHTML = e;
    for (var i = t.getElementsByTagName('script'), n = [], o = 0; o < i.length; ++o)
      'SCRIPT' !== i[o].tagName ||
        ('ajaxLoad' != i[o].className && 'ajaxLoad' != i[o].parentNode.className) ||
        n.push(i[o]);
    $('body').append(n);
  }),
  (app_shop.fn.load = function (e, t, i, n) {
    app_shop.vars.xhr && 4 != app_shop.vars.xhr.readystate && app_shop.vars.xhr.abort(),
      $(t).addClass('load-content');
    for (var o = 0; t.length > o; o++) $(t[o][0]).addClass('load-content');
    app_shop.vars.xhr = $.ajax({
      url: e + n,
      timeout: 16e3,
      success: function (n, o) {
        for (var r = 0; t.length > r; r++)
          $(t[r][0]).removeClass('load-content').html($(n).find(t[r][1]).html());
        app_shop.fn.change_url(e), app_shop.fn.evalJSFromHtml(n), i && i();
      },
      error: function (t) {
        window.location.href = e;
      },
    });
  }),
  (app_shop.fn.variety = function (e, t, i) {
    return 1 == e ? t : i;
  }),
  (app_shop.fn.setGrid = function () {
    1 == app_shop.vars.view
      ? $('.setMobileGrid').each(function () {
        var e = $(this).data('item');
        $(e).before('<del class="domHandler" data-item="' + e + '" style="display:none">'),
          $(this).append($(e));
      })
      : $('.domHandler').each(function () {
        var e = $(this).data('item');
        $(this).after($(e)), $(this).remove();
      });
  }),
  (app_shop.fn.runAjaxFn = function () {
    app_shop.vars.view = Math.round($('#viewType').width());
    app_shop.vars.view;
    if ((app_shop.runArr(app_shop.fnrun.all, 'all', !0), !app_shop.vars.view)) return !1;
    app_shop.runArr(app_shop.fnrun[app_shop.vars.view], app_shop.vars.view, !0);
  }),
  (app_shop.runApp = function () {
    app_shop.vars.view = Math.round($('#viewType').width());
    var e = app_shop.vars.view;
    if ((app_shop.runArr(app_shop.fnrun.all, 'all'), !app_shop.vars.view)) return !1;
    app_shop.runArr(app_shop.fnrun[app_shop.vars.view], app_shop.vars.view),
      app_shop.fn.setGrid(),
      $(window).off('resize.view'),
      $(window).on('resize.view', function () {
        (app_shop.vars.view = Math.round($('#viewType').width())),
          app_shop.vars.view != e &&
          ((e = app_shop.vars.view),
            app_shop.runArr(app_shop.fnrun[app_shop.vars.view], app_shop.vars.view),
            app_shop.fn.setGrid());
      }),
      app_shop.getOuterJS(app_shop.files),
      iaiGet.init();
  }),
  (app_shop.fn.getRwdSrc = function (e) {
    var t = [
      e.data('src_mobile'),
      e.data('src_tablet'),
      e.data('src_desktop'),
      e.data('src_desktop'),
    ],
      i = t[app_shop.vars.view - 1];
    return (
      i || ((t = t.join(' ').split(' ')).length && (i = 1 == app_shop.vars.view ? t[0] : t.pop())),
      i
    );
  }),
  (app_shop.fn.rwdBanner = function (e, t) {
    for (i in t)
      app_shop.run(
        function () {
          $(e)
            .find('img.rwd-src')
            .each(function () {
              ($this = $(this)), $this.attr('src', app_shop.fn.getRwdSrc($this));
            });
        },
        t[i],
        e,
      );
  }),
  (function (e) {
    e.fn.iai_align = function () {
      return this.each(function () {
        if (e(this).data('align')) {
          var t = e(this).data('align').split('|'),
            n = '',
            o = 0,
            r = e(this);
          for (i in t)
            if (((option = t[i].split('#')), (n = option[0]), 'px' == (option[1] || 'px'))) {
              o = Math.max.apply(
                null,
                r
                  .find(n)
                  .map(function () {
                    return e(this).outerHeight();
                  })
                  .get(),
              );
              r.find(n).css('min-height', o);
            } else
              r.find(n).each(function () {
                e(this).wrap(
                  '<div style="display: table;width:100%;height:100%;table-layout: fixed;"><div style="display: table-cell;vertical-align: middle;min-height:100%">',
                );
              });
        }
      });
    };
  })(jQuery),
  (String.prototype.format = function () {
    var e,
      t = this;
    for (e in arguments) t = t.replace(/%[a-z]/, arguments[e]);
    return t;
  }),
  (app_shop.fn.news_data = function (e) {
    var t = '';
    if (!e.data || !(t = e.data.split('-')) || t.length < 3) return !1;
    var i = e.format || '%d-%m-%y';
    return e.month_names && (t[1] = e.month_names[parseInt(t[1]) - 1]), i.format(t[2], t[1], t[0]);
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
        var o,
          r = this;
        (r.defaults = {
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
          (r.initials = {
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
          e.extend(r, r.initials),
          (r.activeBreakpoint = null),
          (r.animType = null),
          (r.animProp = null),
          (r.breakpoints = []),
          (r.breakpointSettings = []),
          (r.cssTransitions = !1),
          (r.focussed = !1),
          (r.interrupted = !1),
          (r.hidden = 'hidden'),
          (r.paused = !0),
          (r.positionProp = null),
          (r.respondTo = null),
          (r.rowCount = 1),
          (r.shouldClick = !0),
          (r.$slider = e(i)),
          (r.$slidesCache = null),
          (r.transformType = null),
          (r.transitionType = null),
          (r.visibilityChange = 'visibilitychange'),
          (r.windowWidth = 0),
          (r.windowTimer = null),
          (o = e(i).data('slick') || {}),
          (r.options = e.extend({}, r.defaults, n, o)),
          (r.currentSlide = r.options.initialSlide),
          (r.originalSettings = r.options),
          void 0 !== document.mozHidden
            ? ((r.hidden = 'mozHidden'), (r.visibilityChange = 'mozvisibilitychange'))
            : void 0 !== document.webkitHidden &&
            ((r.hidden = 'webkitHidden'), (r.visibilityChange = 'webkitvisibilitychange')),
          (r.autoPlay = e.proxy(r.autoPlay, r)),
          (r.autoPlayClear = e.proxy(r.autoPlayClear, r)),
          (r.autoPlayIterator = e.proxy(r.autoPlayIterator, r)),
          (r.changeSlide = e.proxy(r.changeSlide, r)),
          (r.clickHandler = e.proxy(r.clickHandler, r)),
          (r.selectHandler = e.proxy(r.selectHandler, r)),
          (r.setPosition = e.proxy(r.setPosition, r)),
          (r.swipeHandler = e.proxy(r.swipeHandler, r)),
          (r.dragHandler = e.proxy(r.dragHandler, r)),
          (r.keyHandler = e.proxy(r.keyHandler, r)),
          (r.instanceUid = t++),
          (r.htmlExpr = /^(?:\s*(<[\w\W]+>)[^>]*)$/),
          r.registerBreakpoints(),
          r.init(!0);
      };
    })()).prototype.activateADA = function () {
      this.$slideTrack
        .find('.slick-active')
        .attr({ 'aria-hidden': 'false' })
        .find('a, input, button, select')
        .attr({ tabindex: '0' });
    }),
      (t.prototype.addSlide = t.prototype.slickAdd = function (t, i, n) {
        var o = this;
        if ('boolean' == typeof i) (n = i), (i = null);
        else if (i < 0 || i >= o.slideCount) return !1;
        o.unload(),
          'number' == typeof i
            ? 0 === i && 0 === o.$slides.length
              ? e(t).appendTo(o.$slideTrack)
              : n
                ? e(t).insertBefore(o.$slides.eq(i))
                : e(t).insertAfter(o.$slides.eq(i))
            : !0 === n
              ? e(t).prependTo(o.$slideTrack)
              : e(t).appendTo(o.$slideTrack),
          (o.$slides = o.$slideTrack.children(this.options.slide)),
          o.$slideTrack.children(this.options.slide).detach(),
          o.$slideTrack.append(o.$slides),
          o.$slides.each(function (t, i) {
            e(i).attr('data-slick-index', t);
          }),
          (o.$slidesCache = o.$slides),
          o.reinit();
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
          o = this;
        o.animateHeight(),
          !0 === o.options.rtl && !1 === o.options.vertical && (t = -t),
          !1 === o.transformsEnabled
            ? !1 === o.options.vertical
              ? o.$slideTrack.animate({ left: t }, o.options.speed, o.options.easing, i)
              : o.$slideTrack.animate({ top: t }, o.options.speed, o.options.easing, i)
            : !1 === o.cssTransitions
              ? (!0 === o.options.rtl && (o.currentLeft = -o.currentLeft),
                e({ animStart: o.currentLeft }).animate(
                  { animStart: t },
                  {
                    duration: o.options.speed,
                    easing: o.options.easing,
                    step: function (e) {
                      (e = Math.ceil(e)),
                        !1 === o.options.vertical
                          ? ((n[o.animType] = 'translate(' + e + 'px, 0px)'), o.$slideTrack.css(n))
                          : ((n[o.animType] = 'translate(0px,' + e + 'px)'), o.$slideTrack.css(n));
                    },
                    complete: function () {
                      i && i.call();
                    },
                  },
                ))
              : (o.applyTransition(),
                (t = Math.ceil(t)),
                !1 === o.options.vertical
                  ? (n[o.animType] = 'translate3d(' + t + 'px, 0px, 0px)')
                  : (n[o.animType] = 'translate3d(0px,' + t + 'px, 0px)'),
                o.$slideTrack.css(n),
                i &&
                setTimeout(function () {
                  o.disableTransition(), i.call();
                }, o.options.speed));
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
          o,
          r,
          a,
          s = this;
        if (
          ((n = document.createDocumentFragment()), (r = s.$slider.children()), s.options.rows > 1)
        ) {
          for (
            a = s.options.slidesPerRow * s.options.rows, o = Math.ceil(r.length / a), e = 0;
            e < o;
            e++
          ) {
            var l = document.createElement('div');
            for (t = 0; t < s.options.rows; t++) {
              var c = document.createElement('div');
              for (i = 0; i < s.options.slidesPerRow; i++) {
                var p = e * a + (t * s.options.slidesPerRow + i);
                r.get(p) && c.appendChild(r.get(p));
              }
              l.appendChild(c);
            }
            n.appendChild(l);
          }
          s.$slider.empty().append(n),
            s.$slider
              .children()
              .children()
              .children()
              .css({ width: 100 / s.options.slidesPerRow + '%', display: 'inline-block' });
        }
      }),
      (t.prototype.checkResponsive = function (t, i) {
        var n,
          o,
          r,
          a = this,
          s = !1,
          l = a.$slider.width(),
          c = window.innerWidth || e(window).width();
        if (
          ('window' === a.respondTo
            ? (r = c)
            : 'slider' === a.respondTo
              ? (r = l)
              : 'min' === a.respondTo && (r = Math.min(c, l)),
            a.options.responsive && a.options.responsive.length && null !== a.options.responsive)
        ) {
          for (n in ((o = null), a.breakpoints))
            a.breakpoints.hasOwnProperty(n) &&
              (!1 === a.originalSettings.mobileFirst
                ? r < a.breakpoints[n] && (o = a.breakpoints[n])
                : r > a.breakpoints[n] && (o = a.breakpoints[n]));
          null !== o
            ? null !== a.activeBreakpoint
              ? (o !== a.activeBreakpoint || i) &&
              ((a.activeBreakpoint = o),
                'unslick' === a.breakpointSettings[o]
                  ? a.unslick(o)
                  : ((a.options = e.extend({}, a.originalSettings, a.breakpointSettings[o])),
                    !0 === t && (a.currentSlide = a.options.initialSlide),
                    a.refresh(t)),
                (s = o))
              : ((a.activeBreakpoint = o),
                'unslick' === a.breakpointSettings[o]
                  ? a.unslick(o)
                  : ((a.options = e.extend({}, a.originalSettings, a.breakpointSettings[o])),
                    !0 === t && (a.currentSlide = a.options.initialSlide),
                    a.refresh(t)),
                (s = o))
            : null !== a.activeBreakpoint &&
            ((a.activeBreakpoint = null),
              (a.options = a.originalSettings),
              !0 === t && (a.currentSlide = a.options.initialSlide),
              a.refresh(t),
              (s = o)),
            t || !1 === s || a.$slider.trigger('breakpoint', [a, s]);
        }
      }),
      (t.prototype.changeSlide = function (t, i) {
        var n,
          o,
          r = this,
          a = e(t.currentTarget);
        switch (
        (a.is('a') && t.preventDefault(),
          a.is('li') || (a = a.closest('li')),
          (n =
            r.slideCount % r.options.slidesToScroll != 0
              ? 0
              : (r.slideCount - r.currentSlide) % r.options.slidesToScroll),
          t.data.message)
        ) {
          case 'previous':
            (o = 0 === n ? r.options.slidesToScroll : r.options.slidesToShow - n),
              r.slideCount > r.options.slidesToShow && r.slideHandler(r.currentSlide - o, !1, i);
            break;
          case 'next':
            (o = 0 === n ? r.options.slidesToScroll : n),
              r.slideCount > r.options.slidesToShow && r.slideHandler(r.currentSlide + o, !1, i);
            break;
          case 'index':
            var s = 0 === t.data.index ? 0 : t.data.index || a.index() * r.options.slidesToScroll;
            r.slideHandler(r.checkNavigable(s), !1, i), a.children().trigger('focus');
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
      (t.prototype.filterSlides = t.prototype.slickFilter = function (e) {
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
      (t.prototype.getCurrent = t.prototype.slickCurrentSlide = function () {
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
          o,
          r = this,
          a = 0;
        return (
          (r.slideOffset = 0),
          (i = r.$slides.first().outerHeight(!0)),
          !0 === r.options.infinite
            ? (r.slideCount > r.options.slidesToShow &&
              ((r.slideOffset = r.slideWidth * r.options.slidesToShow * -1),
                (o = -1),
                !0 === r.options.vertical &&
                !0 === r.options.centerMode &&
                (2 === r.options.slidesToShow
                  ? (o = -1.5)
                  : 1 === r.options.slidesToShow && (o = -2)),
                (a = i * r.options.slidesToShow * o)),
              r.slideCount % r.options.slidesToScroll != 0 &&
              e + r.options.slidesToScroll > r.slideCount &&
              r.slideCount > r.options.slidesToShow &&
              (e > r.slideCount
                ? ((r.slideOffset =
                  (r.options.slidesToShow - (e - r.slideCount)) * r.slideWidth * -1),
                  (a = (r.options.slidesToShow - (e - r.slideCount)) * i * -1))
                : ((r.slideOffset =
                  (r.slideCount % r.options.slidesToScroll) * r.slideWidth * -1),
                  (a = (r.slideCount % r.options.slidesToScroll) * i * -1))))
            : e + r.options.slidesToShow > r.slideCount &&
            ((r.slideOffset = (e + r.options.slidesToShow - r.slideCount) * r.slideWidth),
              (a = (e + r.options.slidesToShow - r.slideCount) * i)),
          r.slideCount <= r.options.slidesToShow && ((r.slideOffset = 0), (a = 0)),
          !0 === r.options.centerMode && r.slideCount <= r.options.slidesToShow
            ? (r.slideOffset =
              (r.slideWidth * Math.floor(r.options.slidesToShow)) / 2 -
              (r.slideWidth * r.slideCount) / 2)
            : !0 === r.options.centerMode && !0 === r.options.infinite
              ? (r.slideOffset +=
                r.slideWidth * Math.floor(r.options.slidesToShow / 2) - r.slideWidth)
              : !0 === r.options.centerMode &&
              ((r.slideOffset = 0),
                (r.slideOffset += r.slideWidth * Math.floor(r.options.slidesToShow / 2))),
          (t = !1 === r.options.vertical ? e * r.slideWidth * -1 + r.slideOffset : e * i * -1 + a),
          !0 === r.options.variableWidth &&
          ((n =
            r.slideCount <= r.options.slidesToShow || !1 === r.options.infinite
              ? r.$slideTrack.children('.slick-slide').eq(e)
              : r.$slideTrack.children('.slick-slide').eq(e + r.options.slidesToShow)),
            (t =
              !0 === r.options.rtl
                ? n[0]
                  ? -1 * (r.$slideTrack.width() - n[0].offsetLeft - n.width())
                  : 0
                : n[0]
                  ? -1 * n[0].offsetLeft
                  : 0),
            !0 === r.options.centerMode &&
            ((n =
              r.slideCount <= r.options.slidesToShow || !1 === r.options.infinite
                ? r.$slideTrack.children('.slick-slide').eq(e)
                : r.$slideTrack.children('.slick-slide').eq(e + r.options.slidesToShow + 1)),
              (t =
                !0 === r.options.rtl
                  ? n[0]
                    ? -1 * (r.$slideTrack.width() - n[0].offsetLeft - n.width())
                    : 0
                  : n[0]
                    ? -1 * n[0].offsetLeft
                    : 0),
              (t += (r.$list.width() - n.outerWidth()) / 2))),
          t
        );
      }),
      (t.prototype.getOption = t.prototype.slickGetOption = function (e) {
        return this.options[e];
      }),
      (t.prototype.getNavigableIndexes = function () {
        var e,
          t = this,
          i = 0,
          n = 0,
          o = [];
        for (
          !1 === t.options.infinite
            ? (e = t.slideCount)
            : ((i = -1 * t.options.slidesToScroll),
              (n = -1 * t.options.slidesToScroll),
              (e = 2 * t.slideCount));
          i < e;

        )
          o.push(i),
            (i = n + t.options.slidesToScroll),
            (n +=
              t.options.slidesToScroll <= t.options.slidesToShow
                ? t.options.slidesToScroll
                : t.options.slidesToShow);
        return o;
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
            ? (n.$slideTrack.find('.slick-slide').each(function (o, r) {
              if (r.offsetLeft - i + e(r).outerWidth() / 2 > -1 * n.swipeLeft) return (t = r), !1;
            }),
              Math.abs(e(t).attr('data-slick-index') - n.currentSlide) || 1)
            : n.options.slidesToScroll
        );
      }),
      (t.prototype.goTo = t.prototype.slickGoTo = function (e, t) {
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
            var o = n.indexOf(i);
            e(this).attr({
              role: 'tabpanel',
              id: 'slick-slide' + t.instanceUid + i,
              tabindex: -1,
            }),
              -1 !== o &&
              e(this).attr({ 'aria-describedby': 'slick-slide-control' + t.instanceUid + o });
          }),
            t.$dots
              .attr('role', 'tablist')
              .find('li')
              .each(function (o) {
                var r = n[o];
                e(this).attr({ role: 'presentation' }),
                  e(this)
                    .find('button')
                    .first()
                    .attr({
                      role: 'tab',
                      id: 'slick-slide-control' + t.instanceUid + o,
                      'aria-controls': 'slick-slide' + t.instanceUid + r,
                      'aria-label': o + 1 + ' of ' + i,
                      'aria-selected': null,
                      tabindex: '-1',
                    });
              })
              .eq(t.currentSlide)
              .find('button')
              .attr({ 'aria-selected': 'true', tabindex: '0' })
              .end());
        for (var o = t.currentSlide, r = o + t.options.slidesToShow; o < r; o++)
          t.$slides.eq(o).attr('tabindex', 0);
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
              o = e(this).attr('data-sizes') || r.$slider.attr('data-sizes'),
              a = document.createElement('img');
            (a.onload = function () {
              t.animate({ opacity: 0 }, 100, function () {
                n && (t.attr('srcset', n), o && t.attr('sizes', o)),
                  t.attr('src', i).animate({ opacity: 1 }, 200, function () {
                    t.removeAttr('data-lazy data-srcset data-sizes').removeClass('slick-loading');
                  }),
                  r.$slider.trigger('lazyLoaded', [r, t, i]);
              });
            }),
              (a.onerror = function () {
                t
                  .removeAttr('data-lazy')
                  .removeClass('slick-loading')
                  .addClass('slick-lazyload-error'),
                  r.$slider.trigger('lazyLoadError', [r, t, i]);
              }),
              (a.src = i);
          });
        }
        var i,
          n,
          o,
          r = this;
        if (
          (!0 === r.options.centerMode
            ? !0 === r.options.infinite
              ? (o =
                (n = r.currentSlide + (r.options.slidesToShow / 2 + 1)) +
                r.options.slidesToShow +
                2)
              : ((n = Math.max(0, r.currentSlide - (r.options.slidesToShow / 2 + 1))),
                (o = r.options.slidesToShow / 2 + 1 + 2 + r.currentSlide))
            : ((n = r.options.infinite ? r.options.slidesToShow + r.currentSlide : r.currentSlide),
              (o = Math.ceil(n + r.options.slidesToShow)),
              !0 === r.options.fade && (n > 0 && n--, o <= r.slideCount && o++)),
            (i = r.$slider.find('.slick-slide').slice(n, o)),
            'anticipated' === r.options.lazyLoad)
        )
          for (
            var a = n - 1, s = o, l = r.$slider.find('.slick-slide'), c = 0;
            c < r.options.slidesToScroll;
            c++
          )
            a < 0 && (a = r.slideCount - 1), (i = (i = i.add(l.eq(a))).add(l.eq(s))), a--, s++;
        t(i),
          r.slideCount <= r.options.slidesToShow
            ? t(r.$slider.find('.slick-slide'))
            : r.currentSlide >= r.slideCount - r.options.slidesToShow
              ? t(r.$slider.find('.slick-cloned').slice(0, r.options.slidesToShow))
              : 0 === r.currentSlide &&
              t(r.$slider.find('.slick-cloned').slice(-1 * r.options.slidesToShow));
      }),
      (t.prototype.loadSlider = function () {
        var e = this;
        e.setPosition(),
          e.$slideTrack.css({ opacity: 1 }),
          e.$slider.removeClass('slick-loading'),
          e.initUI(),
          'progressive' === e.options.lazyLoad && e.progressiveLazyLoad();
      }),
      (t.prototype.next = t.prototype.slickNext = function () {
        this.changeSlide({ data: { message: 'next' } });
      }),
      (t.prototype.orientationChange = function () {
        this.checkResponsive(), this.setPosition();
      }),
      (t.prototype.pause = t.prototype.slickPause = function () {
        this.autoPlayClear(), (this.paused = !0);
      }),
      (t.prototype.play = t.prototype.slickPlay = function () {
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
      (t.prototype.prev = t.prototype.slickPrev = function () {
        this.changeSlide({ data: { message: 'previous' } });
      }),
      (t.prototype.preventDefault = function (e) {
        e.preventDefault();
      }),
      (t.prototype.progressiveLazyLoad = function (t) {
        t = t || 1;
        var i,
          n,
          o,
          r,
          a,
          s = this,
          l = e('img[data-lazy]', s.$slider);
        l.length
          ? ((i = l.first()),
            (n = i.attr('data-lazy')),
            (o = i.attr('data-srcset')),
            (r = i.attr('data-sizes') || s.$slider.attr('data-sizes')),
            ((a = document.createElement('img')).onload = function () {
              o && (i.attr('srcset', o), r && i.attr('sizes', r)),
                i
                  .attr('src', n)
                  .removeAttr('data-lazy data-srcset data-sizes')
                  .removeClass('slick-loading'),
                !0 === s.options.adaptiveHeight && s.setPosition(),
                s.$slider.trigger('lazyLoaded', [s, i, n]),
                s.progressiveLazyLoad();
            }),
            (a.onerror = function () {
              t < 3
                ? setTimeout(function () {
                  s.progressiveLazyLoad(t + 1);
                }, 500)
                : (i
                  .removeAttr('data-lazy')
                  .removeClass('slick-loading')
                  .addClass('slick-lazyload-error'),
                  s.$slider.trigger('lazyLoadError', [s, i, n]),
                  s.progressiveLazyLoad());
            }),
            (a.src = n))
          : s.$slider.trigger('allImagesLoaded', [s]);
      }),
      (t.prototype.refresh = function (t) {
        var i,
          n,
          o = this;
        (n = o.slideCount - o.options.slidesToShow),
          !o.options.infinite && o.currentSlide > n && (o.currentSlide = n),
          o.slideCount <= o.options.slidesToShow && (o.currentSlide = 0),
          (i = o.currentSlide),
          o.destroy(!0),
          e.extend(o, o.initials, { currentSlide: i }),
          o.init(),
          t || o.changeSlide({ data: { message: 'index', index: i } }, !1);
      }),
      (t.prototype.registerBreakpoints = function () {
        var t,
          i,
          n,
          o = this,
          r = o.options.responsive || null;
        if ('array' === e.type(r) && r.length) {
          for (t in ((o.respondTo = o.options.respondTo || 'window'), r))
            if (((n = o.breakpoints.length - 1), r.hasOwnProperty(t))) {
              for (i = r[t].breakpoint; n >= 0;)
                o.breakpoints[n] && o.breakpoints[n] === i && o.breakpoints.splice(n, 1), n--;
              o.breakpoints.push(i), (o.breakpointSettings[i] = r[t].settings);
            }
          o.breakpoints.sort(function (e, t) {
            return o.options.mobileFirst ? e - t : t - e;
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
      (t.prototype.removeSlide = t.prototype.slickRemove = function (e, t, i) {
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
          o = {};
        !0 === n.options.rtl && (e = -e),
          (t = 'left' == n.positionProp ? Math.ceil(e) + 'px' : '0px'),
          (i = 'top' == n.positionProp ? Math.ceil(e) + 'px' : '0px'),
          (o[n.positionProp] = e),
          !1 === n.transformsEnabled
            ? n.$slideTrack.css(o)
            : ((o = {}),
              !1 === n.cssTransitions
                ? ((o[n.animType] = 'translate(' + t + ', ' + i + ')'), n.$slideTrack.css(o))
                : ((o[n.animType] = 'translate3d(' + t + ', ' + i + ', 0px)'),
                  n.$slideTrack.css(o)));
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
        i.$slides.each(function (n, o) {
          (t = i.slideWidth * n * -1),
            !0 === i.options.rtl
              ? e(o).css({
                position: 'relative',
                right: t,
                top: 0,
                zIndex: i.options.zIndex - 2,
                opacity: 0,
              })
              : e(o).css({
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
      (t.prototype.setOption = t.prototype.slickSetOption = function () {
        var t,
          i,
          n,
          o,
          r,
          a = this,
          s = !1;
        if (
          ('object' === e.type(arguments[0])
            ? ((n = arguments[0]), (s = arguments[1]), (r = 'multiple'))
            : 'string' === e.type(arguments[0]) &&
            ((n = arguments[0]),
              (o = arguments[1]),
              (s = arguments[2]),
              'responsive' === arguments[0] && 'array' === e.type(arguments[1])
                ? (r = 'responsive')
                : void 0 !== arguments[1] && (r = 'single')),
            'single' === r)
        )
          a.options[n] = o;
        else if ('multiple' === r)
          e.each(n, function (e, t) {
            a.options[e] = t;
          });
        else if ('responsive' === r)
          for (i in o)
            if ('array' !== e.type(a.options.responsive)) a.options.responsive = [o[i]];
            else {
              for (t = a.options.responsive.length - 1; t >= 0;)
                a.options.responsive[t].breakpoint === o[i].breakpoint &&
                  a.options.responsive.splice(t, 1),
                  t--;
              a.options.responsive.push(o[i]);
            }
        s && (a.unload(), a.reinit());
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
          o,
          r = this;
        if (
          ((i = r.$slider
            .find('.slick-slide')
            .removeClass('slick-active slick-center slick-current')
            .attr('aria-hidden', 'true')),
            r.$slides.eq(e).addClass('slick-current'),
            !0 === r.options.centerMode)
        ) {
          var a = r.options.slidesToShow % 2 == 0 ? 1 : 0;
          (t = Math.floor(r.options.slidesToShow / 2)),
            !0 === r.options.infinite &&
            (e >= t && e <= r.slideCount - 1 - t
              ? r.$slides
                .slice(e - t + a, e + t + 1)
                .addClass('slick-active')
                .attr('aria-hidden', 'false')
              : ((n = r.options.slidesToShow + e),
                i
                  .slice(n - t + 1 + a, n + t + 2)
                  .addClass('slick-active')
                  .attr('aria-hidden', 'false')),
              0 === e
                ? i.eq(i.length - 1 - r.options.slidesToShow).addClass('slick-center')
                : e === r.slideCount - 1 && i.eq(r.options.slidesToShow).addClass('slick-center')),
            r.$slides.eq(e).addClass('slick-center');
        } else
          e >= 0 && e <= r.slideCount - r.options.slidesToShow
            ? r.$slides
              .slice(e, e + r.options.slidesToShow)
              .addClass('slick-active')
              .attr('aria-hidden', 'false')
            : i.length <= r.options.slidesToShow
              ? i.addClass('slick-active').attr('aria-hidden', 'false')
              : ((o = r.slideCount % r.options.slidesToShow),
                (n = !0 === r.options.infinite ? r.options.slidesToShow + e : e),
                r.options.slidesToShow == r.options.slidesToScroll &&
                  r.slideCount - e < r.options.slidesToShow
                  ? i
                    .slice(n - (r.options.slidesToShow - o), n + o)
                    .addClass('slick-active')
                    .attr('aria-hidden', 'false')
                  : i
                    .slice(n, n + r.options.slidesToShow)
                    .addClass('slick-active')
                    .attr('aria-hidden', 'false'));
        ('ondemand' !== r.options.lazyLoad && 'anticipated' !== r.options.lazyLoad) || r.lazyLoad();
      }),
      (t.prototype.setupInfinite = function () {
        var t,
          i,
          n,
          o = this;
        if (
          (!0 === o.options.fade && (o.options.centerMode = !1),
            !0 === o.options.infinite &&
            !1 === o.options.fade &&
            ((i = null), o.slideCount > o.options.slidesToShow))
        ) {
          for (
            n = !0 === o.options.centerMode ? o.options.slidesToShow + 1 : o.options.slidesToShow,
            t = o.slideCount;
            t > o.slideCount - n;
            t -= 1
          )
            (i = t - 1),
              e(o.$slides[i])
                .clone(!0)
                .attr('id', '')
                .attr('data-slick-index', i - o.slideCount)
                .prependTo(o.$slideTrack)
                .addClass('slick-cloned');
          for (t = 0; t < n + o.slideCount; t += 1)
            (i = t),
              e(o.$slides[i])
                .clone(!0)
                .attr('id', '')
                .attr('data-slick-index', i + o.slideCount)
                .appendTo(o.$slideTrack)
                .addClass('slick-cloned');
          o.$slideTrack
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
          o = parseInt(n.attr('data-slick-index'));
        o || (o = 0),
          i.slideCount <= i.options.slidesToShow ? i.slideHandler(o, !1, !0) : i.slideHandler(o);
      }),
      (t.prototype.slideHandler = function (e, t, i) {
        var n,
          o,
          r,
          a,
          s,
          l = null,
          c = this;
        if (
          ((t = t || !1),
            !(
              (!0 === c.animating && !0 === c.options.waitForAnimate) ||
              (!0 === c.options.fade && c.currentSlide === e)
            ))
        )
          if (
            (!1 === t && c.asNavFor(e),
              (n = e),
              (l = c.getLeft(n)),
              (a = c.getLeft(c.currentSlide)),
              (c.currentLeft = null === c.swipeLeft ? a : c.swipeLeft),
              !1 === c.options.infinite &&
              !1 === c.options.centerMode &&
              (e < 0 || e > c.getDotCount() * c.options.slidesToScroll))
          )
            !1 === c.options.fade &&
              ((n = c.currentSlide),
                !0 !== i
                  ? c.animateSlide(a, function () {
                    c.postSlide(n);
                  })
                  : c.postSlide(n));
          else if (
            !1 === c.options.infinite &&
            !0 === c.options.centerMode &&
            (e < 0 || e > c.slideCount - c.options.slidesToScroll)
          )
            !1 === c.options.fade &&
              ((n = c.currentSlide),
                !0 !== i
                  ? c.animateSlide(a, function () {
                    c.postSlide(n);
                  })
                  : c.postSlide(n));
          else {
            if (
              (c.options.autoplay && clearInterval(c.autoPlayTimer),
                (o =
                  n < 0
                    ? c.slideCount % c.options.slidesToScroll != 0
                      ? c.slideCount - (c.slideCount % c.options.slidesToScroll)
                      : c.slideCount + n
                    : n >= c.slideCount
                      ? c.slideCount % c.options.slidesToScroll != 0
                        ? 0
                        : n - c.slideCount
                      : n),
                (c.animating = !0),
                c.$slider.trigger('beforeChange', [c, c.currentSlide, o]),
                (r = c.currentSlide),
                (c.currentSlide = o),
                c.setSlideClasses(c.currentSlide),
                c.options.asNavFor &&
                (s = (s = c.getNavTarget()).slick('getSlick')).slideCount <=
                s.options.slidesToShow &&
                s.setSlideClasses(c.currentSlide),
                c.updateDots(),
                c.updateArrows(),
                !0 === c.options.fade)
            )
              return (
                !0 !== i
                  ? (c.fadeSlideOut(r),
                    c.fadeSlide(o, function () {
                      c.postSlide(o);
                    }))
                  : c.postSlide(o),
                void c.animateHeight()
              );
            !0 !== i
              ? c.animateSlide(l, function () {
                c.postSlide(o);
              })
              : c.postSlide(o);
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
          o = this;
        return (
          (e = o.touchObject.startX - o.touchObject.curX),
          (t = o.touchObject.startY - o.touchObject.curY),
          (i = Math.atan2(t, e)),
          (n = Math.round((180 * i) / Math.PI)) < 0 && (n = 360 - Math.abs(n)),
          (n <= 45 && n >= 0) || (n <= 360 && n >= 315)
            ? !1 === o.options.rtl
              ? 'left'
              : 'right'
            : n >= 135 && n <= 225
              ? !1 === o.options.rtl
                ? 'right'
                : 'left'
              : !0 === o.options.verticalSwiping
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
          o,
          r,
          a,
          s = this;
        return (
          (r = void 0 !== e.originalEvent ? e.originalEvent.touches : null),
          !(!s.dragging || s.scrolling || (r && 1 !== r.length)) &&
          ((t = s.getLeft(s.currentSlide)),
            (s.touchObject.curX = void 0 !== r ? r[0].pageX : e.clientX),
            (s.touchObject.curY = void 0 !== r ? r[0].pageY : e.clientY),
            (s.touchObject.swipeLength = Math.round(
              Math.sqrt(Math.pow(s.touchObject.curX - s.touchObject.startX, 2)),
            )),
            (a = Math.round(Math.sqrt(Math.pow(s.touchObject.curY - s.touchObject.startY, 2)))),
            !s.options.verticalSwiping && !s.swiping && a > 4
              ? ((s.scrolling = !0), !1)
              : (!0 === s.options.verticalSwiping && (s.touchObject.swipeLength = a),
                (i = s.swipeDirection()),
                void 0 !== e.originalEvent &&
                s.touchObject.swipeLength > 4 &&
                ((s.swiping = !0), e.preventDefault()),
                (o =
                  (!1 === s.options.rtl ? 1 : -1) *
                  (s.touchObject.curX > s.touchObject.startX ? 1 : -1)),
                !0 === s.options.verticalSwiping &&
                (o = s.touchObject.curY > s.touchObject.startY ? 1 : -1),
                (n = s.touchObject.swipeLength),
                (s.touchObject.edgeHit = !1),
                !1 === s.options.infinite &&
                ((0 === s.currentSlide && 'right' === i) ||
                  (s.currentSlide >= s.getDotCount() && 'left' === i)) &&
                ((n = s.touchObject.swipeLength * s.options.edgeFriction),
                  (s.touchObject.edgeHit = !0)),
                !1 === s.options.vertical
                  ? (s.swipeLeft = t + n * o)
                  : (s.swipeLeft = t + n * (s.$list.height() / s.listWidth) * o),
                !0 === s.options.verticalSwiping && (s.swipeLeft = t + n * o),
                !0 !== s.options.fade &&
                !1 !== s.options.touchMove &&
                (!0 === s.animating ? ((s.swipeLeft = null), !1) : void s.setCSS(s.swipeLeft))))
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
      (t.prototype.unfilterSlides = t.prototype.slickUnfilter = function () {
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
          o = arguments[0],
          r = Array.prototype.slice.call(arguments, 1),
          a = n.length;
        for (e = 0; e < a; e++)
          if (
            ('object' == typeof o || void 0 === o
              ? (n[e].slick = new t(n[e], o))
              : (i = n[e].slick[o].apply(n[e].slick, r)),
              void 0 !== i)
          )
            return i;
        return n;
      });
  });
var centerImage = function (e, t, i) {
  var n = [];
  $(e).each(function (e) {
    var o = new Image();
    (o.src = $(this).attr('src')),
      (n[e] = $(this)),
      (elementHeight = 0),
      o.complete
        ? ((elementHeight = n[e].is(':visible') ? n[e].height() : o.height),
          elementHeight > t
            ? n[e].css('max-height', t)
            : n[e].css({
              'background-color': i,
              'padding-top': (t - elementHeight) / 2,
              'padding-bottom': (t - elementHeight) / 2,
            }))
        : (o.onload = function () {
          (elementHeight = n[e].is(':visible') ? n[e].height() : o.height),
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
    o = e.slice(i, n - 1);
  if (o === e || '' === o) return t;
  for (var r = o.replace(/\+/g, ' ').split('&'), a = 0; a < r.length; a++) {
    var s = r[a].split('='),
      l = decodeURIComponent(s[0]),
      c = decodeURIComponent(s[1]);
    l in t || (t[l] = []), t[l].push(2 === s.length ? c : null);
  }
  return t;
}
(jQuery.cookie = function (e, t, i) {
  if (arguments.length > 1 && '[object Object]' !== String(t)) {
    if (((i = jQuery.extend({}, i)), null == t && (i.expires = -1), 'number' == typeof i.expires)) {
      var n = i.expires,
        o = (i.expires = new Date());
      o.setDate(o.getDate() + n);
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
  var r,
    a = (i = t || {}).raw
      ? function (e) {
        return e;
      }
      : decodeURIComponent;
  return (r = new RegExp('(?:^|; )' + encodeURIComponent(e) + '=([^;]*)').exec(document.cookie))
    ? a(r[1])
    : null;
}),
  (function (e) {
    'use strict';
    function t(e, t) {
      var i = (65535 & e) + (65535 & t);
      return (((e >> 16) + (t >> 16) + (i >> 16)) << 16) | (65535 & i);
    }
    function i(e, i, n, o, r, a) {
      return t(
        (function (e, t) {
          return (e << t) | (e >>> (32 - t));
        })(t(t(i, e), t(o, a)), r),
        n,
      );
    }
    function n(e, t, n, o, r, a, s) {
      return i((t & n) | (~t & o), e, t, r, a, s);
    }
    function o(e, t, n, o, r, a, s) {
      return i((t & o) | (n & ~o), e, t, r, a, s);
    }
    function r(e, t, n, o, r, a, s) {
      return i(t ^ n ^ o, e, t, r, a, s);
    }
    function a(e, t, n, o, r, a, s) {
      return i(n ^ (t | ~o), e, t, r, a, s);
    }
    function s(e, i) {
      (e[i >> 5] |= 128 << i % 32), (e[14 + (((i + 64) >>> 9) << 4)] = i);
      var s,
        l,
        c,
        p,
        d,
        u = 1732584193,
        h = -271733879,
        _ = -1732584194,
        f = 271733878;
      for (s = 0; s < e.length; s += 16)
        (l = u),
          (c = h),
          (p = _),
          (d = f),
          (h = a(
            (h = a(
              (h = a(
                (h = a(
                  (h = r(
                    (h = r(
                      (h = r(
                        (h = r(
                          (h = o(
                            (h = o(
                              (h = o(
                                (h = o(
                                  (h = n(
                                    (h = n(
                                      (h = n(
                                        (h = n(
                                          h,
                                          (_ = n(
                                            _,
                                            (f = n(
                                              f,
                                              (u = n(u, h, _, f, e[s], 7, -680876936)),
                                              h,
                                              _,
                                              e[s + 1],
                                              12,
                                              -389564586,
                                            )),
                                            u,
                                            h,
                                            e[s + 2],
                                            17,
                                            606105819,
                                          )),
                                          f,
                                          u,
                                          e[s + 3],
                                          22,
                                          -1044525330,
                                        )),
                                        (_ = n(
                                          _,
                                          (f = n(
                                            f,
                                            (u = n(u, h, _, f, e[s + 4], 7, -176418897)),
                                            h,
                                            _,
                                            e[s + 5],
                                            12,
                                            1200080426,
                                          )),
                                          u,
                                          h,
                                          e[s + 6],
                                          17,
                                          -1473231341,
                                        )),
                                        f,
                                        u,
                                        e[s + 7],
                                        22,
                                        -45705983,
                                      )),
                                      (_ = n(
                                        _,
                                        (f = n(
                                          f,
                                          (u = n(u, h, _, f, e[s + 8], 7, 1770035416)),
                                          h,
                                          _,
                                          e[s + 9],
                                          12,
                                          -1958414417,
                                        )),
                                        u,
                                        h,
                                        e[s + 10],
                                        17,
                                        -42063,
                                      )),
                                      f,
                                      u,
                                      e[s + 11],
                                      22,
                                      -1990404162,
                                    )),
                                    (_ = n(
                                      _,
                                      (f = n(
                                        f,
                                        (u = n(u, h, _, f, e[s + 12], 7, 1804603682)),
                                        h,
                                        _,
                                        e[s + 13],
                                        12,
                                        -40341101,
                                      )),
                                      u,
                                      h,
                                      e[s + 14],
                                      17,
                                      -1502002290,
                                    )),
                                    f,
                                    u,
                                    e[s + 15],
                                    22,
                                    1236535329,
                                  )),
                                  (_ = o(
                                    _,
                                    (f = o(
                                      f,
                                      (u = o(u, h, _, f, e[s + 1], 5, -165796510)),
                                      h,
                                      _,
                                      e[s + 6],
                                      9,
                                      -1069501632,
                                    )),
                                    u,
                                    h,
                                    e[s + 11],
                                    14,
                                    643717713,
                                  )),
                                  f,
                                  u,
                                  e[s],
                                  20,
                                  -373897302,
                                )),
                                (_ = o(
                                  _,
                                  (f = o(
                                    f,
                                    (u = o(u, h, _, f, e[s + 5], 5, -701558691)),
                                    h,
                                    _,
                                    e[s + 10],
                                    9,
                                    38016083,
                                  )),
                                  u,
                                  h,
                                  e[s + 15],
                                  14,
                                  -660478335,
                                )),
                                f,
                                u,
                                e[s + 4],
                                20,
                                -405537848,
                              )),
                              (_ = o(
                                _,
                                (f = o(
                                  f,
                                  (u = o(u, h, _, f, e[s + 9], 5, 568446438)),
                                  h,
                                  _,
                                  e[s + 14],
                                  9,
                                  -1019803690,
                                )),
                                u,
                                h,
                                e[s + 3],
                                14,
                                -187363961,
                              )),
                              f,
                              u,
                              e[s + 8],
                              20,
                              1163531501,
                            )),
                            (_ = o(
                              _,
                              (f = o(
                                f,
                                (u = o(u, h, _, f, e[s + 13], 5, -1444681467)),
                                h,
                                _,
                                e[s + 2],
                                9,
                                -51403784,
                              )),
                              u,
                              h,
                              e[s + 7],
                              14,
                              1735328473,
                            )),
                            f,
                            u,
                            e[s + 12],
                            20,
                            -1926607734,
                          )),
                          (_ = r(
                            _,
                            (f = r(
                              f,
                              (u = r(u, h, _, f, e[s + 5], 4, -378558)),
                              h,
                              _,
                              e[s + 8],
                              11,
                              -2022574463,
                            )),
                            u,
                            h,
                            e[s + 11],
                            16,
                            1839030562,
                          )),
                          f,
                          u,
                          e[s + 14],
                          23,
                          -35309556,
                        )),
                        (_ = r(
                          _,
                          (f = r(
                            f,
                            (u = r(u, h, _, f, e[s + 1], 4, -1530992060)),
                            h,
                            _,
                            e[s + 4],
                            11,
                            1272893353,
                          )),
                          u,
                          h,
                          e[s + 7],
                          16,
                          -155497632,
                        )),
                        f,
                        u,
                        e[s + 10],
                        23,
                        -1094730640,
                      )),
                      (_ = r(
                        _,
                        (f = r(
                          f,
                          (u = r(u, h, _, f, e[s + 13], 4, 681279174)),
                          h,
                          _,
                          e[s],
                          11,
                          -358537222,
                        )),
                        u,
                        h,
                        e[s + 3],
                        16,
                        -722521979,
                      )),
                      f,
                      u,
                      e[s + 6],
                      23,
                      76029189,
                    )),
                    (_ = r(
                      _,
                      (f = r(
                        f,
                        (u = r(u, h, _, f, e[s + 9], 4, -640364487)),
                        h,
                        _,
                        e[s + 12],
                        11,
                        -421815835,
                      )),
                      u,
                      h,
                      e[s + 15],
                      16,
                      530742520,
                    )),
                    f,
                    u,
                    e[s + 2],
                    23,
                    -995338651,
                  )),
                  (_ = a(
                    _,
                    (f = a(
                      f,
                      (u = a(u, h, _, f, e[s], 6, -198630844)),
                      h,
                      _,
                      e[s + 7],
                      10,
                      1126891415,
                    )),
                    u,
                    h,
                    e[s + 14],
                    15,
                    -1416354905,
                  )),
                  f,
                  u,
                  e[s + 5],
                  21,
                  -57434055,
                )),
                (_ = a(
                  _,
                  (f = a(
                    f,
                    (u = a(u, h, _, f, e[s + 12], 6, 1700485571)),
                    h,
                    _,
                    e[s + 3],
                    10,
                    -1894986606,
                  )),
                  u,
                  h,
                  e[s + 10],
                  15,
                  -1051523,
                )),
                f,
                u,
                e[s + 1],
                21,
                -2054922799,
              )),
              (_ = a(
                _,
                (f = a(
                  f,
                  (u = a(u, h, _, f, e[s + 8], 6, 1873313359)),
                  h,
                  _,
                  e[s + 15],
                  10,
                  -30611744,
                )),
                u,
                h,
                e[s + 6],
                15,
                -1560198380,
              )),
              f,
              u,
              e[s + 13],
              21,
              1309151649,
            )),
            (_ = a(
              _,
              (f = a(
                f,
                (u = a(u, h, _, f, e[s + 4], 6, -145523070)),
                h,
                _,
                e[s + 11],
                10,
                -1120210379,
              )),
              u,
              h,
              e[s + 2],
              15,
              718787259,
            )),
            f,
            u,
            e[s + 9],
            21,
            -343485551,
          )),
          (u = t(u, l)),
          (h = t(h, c)),
          (_ = t(_, p)),
          (f = t(f, d));
      return [u, h, _, f];
    }
    function l(e) {
      var t,
        i = '',
        n = 32 * e.length;
      for (t = 0; t < n; t += 8) i += String.fromCharCode((e[t >> 5] >>> t % 32) & 255);
      return i;
    }
    function c(e) {
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
        return l(s(c(e), 8 * e.length));
      })(d(e));
    }
    function h(e, t) {
      return (function (e, t) {
        var i,
          n,
          o = c(e),
          r = [],
          a = [];
        for (
          r[15] = a[15] = void 0, o.length > 16 && (o = s(o, 8 * e.length)), i = 0;
          i < 16;
          i += 1
        )
          (r[i] = 909522486 ^ o[i]), (a[i] = 1549556828 ^ o[i]);
        return (n = s(r.concat(c(t)), 512 + 8 * t.length)), l(s(a.concat(n), 640));
      })(d(e), d(t));
    }
    function _(e, t, i) {
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
        return _;
      })
      : 'object' == typeof module && module.exports
        ? (module.exports = _)
        : (e.md5 = _);
  })(window),
  (window.format_price = function (e, t) {
    var i = e,
      n = (t = t || {}).mask || '###&nbsp;##0,00';
    currency_grouping_separator && (n = n.replace(',', currency_grouping_separator)),
      currency_decimal_separator && (n = n.replace('.', currency_decimal_separator));
    var o = t.currency || '',
      r = t.currency_space ? ' ' : '',
      a = !!t.currency_before_price;
    if (!n || isNaN(+i)) return i;
    var s = (i = '-' == n.charAt(0) ? -i : +i) < 0 ? (i = -i) : 0,
      l = n.match(/[^\d\-\+#]/g),
      c = (l && l[l.length - 1]) || '.',
      p = (l && l[1] && l[0]) || ',';
    n = n.split(c);
    i = +(i = i.toFixed(n[1] && n[1].length)) + '';
    var d = n[1] && n[1].lastIndexOf('0'),
      u = i.split('.');
    (!u[1] || (u[1] && u[1].length <= d)) && (i = (+i).toFixed(d + 1));
    var h = n[0].split(p);
    n[0] = h.join('');
    var _ = n[0] && n[0].indexOf('0');
    if (_ > -1) for (; u[0].length < n[0].length - _;) u[0] = '0' + u[0];
    else 0 == +u[0] && (u[0] = '');
    (i = i.split('.'))[0] = u[0];
    var f = h[1] && h[h.length - 1].length;
    if (f) {
      for (var m = i[0], g = '', y = m.length % f, v = 0, b = m.length; v < b; v++)
        (g += m.charAt(v)), !((v - y + 1) % f) && v < b - f && (g += p);
      i[0] = g;
    }
    i[1] = n[1] && i[1] ? c + i[1] : '';
    e = (s ? '-' : '') + i[0] + i[1];
    return (e = a ? o + r + e : e + r + o);
  }),
  (function (e) {
    'use strict';
    var t = '[data-toggle="dropdown"]',
      i = function (t) {
        e(t).on('click.bs.dropdown', this.toggle);
      };
    function n(t) {
      var i = t.attr('data-target');
      i || (i = (i = t.attr('href')) && /#[A-Za-z]/.test(i) && i.replace(/.*(?=#[^\s]*$)/, ''));
      var n = i && e(i);
      return n && n.length ? n : t.parent();
    }
    function o(i) {
      (i && 3 === i.which) ||
        (e('.dropdown-backdrop').remove(),
          e(t).each(function () {
            var t = e(this),
              o = n(t),
              r = { relatedTarget: this };
            o.hasClass('open') &&
              ((i &&
                'click' == i.type &&
                /input|textarea/i.test(i.target.tagName) &&
                e.contains(o[0], i.target)) ||
                (o.trigger((i = e.Event('hide.bs.dropdown', r))),
                  i.isDefaultPrevented() ||
                  (t.attr('aria-expanded', 'false'),
                    o.removeClass('open').trigger(e.Event('hidden.bs.dropdown', r)))));
          }));
    }
    (i.VERSION = '3.3.6'),
      (i.prototype.toggle = function (t) {
        var i = e(this);
        if (!i.is('.disabled, :disabled')) {
          var r = n(i),
            a = r.hasClass('open');
          if ((o(), !a)) {
            'ontouchstart' in document.documentElement &&
              !r.closest('.navbar-nav').length &&
              e(document.createElement('div'))
                .addClass('dropdown-backdrop')
                .insertAfter(e(this))
                .on('click', o);
            var s = { relatedTarget: this };
            if ((r.trigger((t = e.Event('show.bs.dropdown', s))), t.isDefaultPrevented())) return;
            i.trigger('focus').attr('aria-expanded', 'true'),
              r.toggleClass('open').trigger(e.Event('shown.bs.dropdown', s));
          }
          return !1;
        }
      }),
      (i.prototype.keydown = function (i) {
        if (/(38|40|27|32)/.test(i.which) && !/input|textarea/i.test(i.target.tagName)) {
          var o = e(this);
          if ((i.preventDefault(), i.stopPropagation(), !o.is('.disabled, :disabled'))) {
            var r = n(o),
              a = r.hasClass('open');
            if ((!a && 27 != i.which) || (a && 27 == i.which))
              return 27 == i.which && r.find(t).trigger('focus'), o.trigger('click');
            var s = r.find('.dropdown-menu li:not(.disabled):visible a');
            if (s.length) {
              var l = s.index(i.target);
              38 == i.which && l > 0 && l--,
                40 == i.which && l < s.length - 1 && l++,
                ~l || (l = 0),
                s.eq(l).trigger('focus');
            }
          }
        }
      });
    var r = e.fn.dropdown;
    (e.fn.dropdown = function (t) {
      return this.each(function () {
        var n = e(this),
          o = n.data('bs.dropdown');
        o || n.data('bs.dropdown', (o = new i(this))), 'string' == typeof t && o[t].call(n);
      });
    }),
      (e.fn.dropdown.Constructor = i),
      (e.fn.dropdown.noConflict = function () {
        return (e.fn.dropdown = r), this;
      }),
      e(document)
        .on('click.bs.dropdown.data-api', o)
        .on('click.bs.dropdown.data-api', '.dropdown form', function (e) {
          e.stopPropagation();
        })
        .on('click.bs.dropdown.data-api', t, i.prototype.toggle)
        .on('keydown.bs.dropdown.data-api', t, i.prototype.keydown)
        .on('keydown.bs.dropdown.data-api', '.dropdown-menu', i.prototype.keydown);
  })(jQuery),
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
        s(e, this);
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
                return void r(t.promise, e);
              }
              o(t.promise, n);
            } else (1 === e._state ? o : r)(t.promise, e._value);
          }))
        : e._deferreds.push(t);
    }
    function o(e, t) {
      try {
        if (t === e) throw new TypeError('A promise cannot be resolved with itself.');
        if (t && ('object' == typeof t || 'function' == typeof t)) {
          var n = t.then;
          if (t instanceof i) return (e._state = 3), (e._value = t), void a(e);
          if ('function' == typeof n)
            return void s(
              (function (e, t) {
                return function () {
                  e.apply(t, arguments);
                };
              })(n, t),
              e,
            );
        }
        (e._state = 1), (e._value = t), a(e);
      } catch (t) {
        r(e, t);
      }
    }
    function r(e, t) {
      (e._state = 2), (e._value = t), a(e);
    }
    function a(e) {
      2 === e._state &&
        0 === e._deferreds.length &&
        i._immediateFn(function () {
          e._handled || i._unhandledRejectionFn(e._value);
        });
      for (var t = 0, o = e._deferreds.length; o > t; t++) n(e, e._deferreds[t]);
      e._deferreds = null;
    }
    function s(e, t) {
      var i = !1;
      try {
        e(
          function (e) {
            i || ((i = !0), o(t, e));
          },
          function (e) {
            i || ((i = !0), r(t, e));
          },
        );
      } catch (e) {
        if (i) return;
        (i = !0), r(t, e);
      }
    }
    var l = setTimeout;
    (i.prototype.catch = function (e) {
      return this.then(null, e);
    }),
      (i.prototype.then = function (e, i) {
        var o = new this.constructor(t);
        return (
          n(
            this,
            new (function (e, t, i) {
              (this.onFulfilled = 'function' == typeof e ? e : null),
                (this.onRejected = 'function' == typeof t ? t : null),
                (this.promise = i);
            })(e, i, o),
          ),
          o
        );
      }),
      (i.prototype.finally = e),
      (i.all = function (e) {
        return new i(function (t, i) {
          function n(e, a) {
            try {
              if (a && ('object' == typeof a || 'function' == typeof a)) {
                var s = a.then;
                if ('function' == typeof s)
                  return void s.call(
                    a,
                    function (t) {
                      n(e, t);
                    },
                    i,
                  );
              }
              (o[e] = a), 0 == --r && t(o);
            } catch (e) {
              i(e);
            }
          }
          if (!e || void 0 === e.length) throw new TypeError('Promise.all accepts an array');
          var o = Array.prototype.slice.call(e);
          if (0 === o.length) return t([]);
          for (var r = o.length, a = 0; o.length > a; a++) n(a, o[a]);
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
          for (var n = 0, o = e.length; o > n; n++) e[n].then(t, i);
        });
      }),
      (i._immediateFn =
        ('function' == typeof setImmediate &&
          function (e) {
            setImmediate(e);
          }) ||
        function (e) {
          l(e, 0);
        }),
      (i._unhandledRejectionFn = function (e) {
        void 0 !== console && console && console.warn('Possible Unhandled Promise Rejection:', e);
      });
    var c = (function () {
      if ('undefined' != typeof self) return self;
      if ('undefined' != typeof window) return window;
      if ('undefined' != typeof global) return global;
      throw Error('unable to locate global object');
    })();
    'Promise' in c
      ? c.Promise.prototype.finally || (c.Promise.prototype.finally = e)
      : (c.Promise = i);
  });
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
        return e.is('[' + t + ']') ? e.attr(t) : '';
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
      (this.formatPrice = function (e, t, i, n, o) {
        return (
          (currency = i || this.currentSizeObj.currency),
          (o = !!o),
          t &&
          (this.configObj.rebateNumber && o && (e = this.configObj.rebateNumber.price),
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
          ($('#' + this.prefix + 'status_gfx').hide(),
            $('#' + this.prefix + 'status').addClass('--status-hide'),
            this.currentSizeObj.amount_mm && this.currentSizeObj.amount_mo && '' != this.txt.ilosc_mm)
        ) {
          var e = this.currentSizeObj.amount_mm,
            t = this.currentSizeObj.amount_mo,
            i = e + ' ' + (e > 1 ? this.currentSizeObj.unit_plural : this.currentSizeObj.unit),
            n = t + ' ' + (t > 1 ? this.currentSizeObj.unit_plural : this.currentSizeObj.unit),
            o = this.txt.ilosc_mm.format(i),
            r = this.txt.ilosc_mo.format(n);
          if (e > 0 && -1 == t)
            return (
              $('#' + this.prefix + 'status_description').html(
                '<div id="#' +
                this.prefix +
                'amount_mm">' +
                o +
                '</div><div id="#' +
                this.prefix +
                'amount_mo">' +
                this.txt.ilosc_mo_inf +
                '</div>',
              ),
              !1
            );
          if (e > 0 && t > 0)
            return (
              $('#' + this.prefix + 'status_description').html(
                '<div id="#' +
                this.prefix +
                'amount_mm">' +
                o +
                '</div><div id="#' +
                this.prefix +
                'amount_mo">' +
                r +
                '</div>',
              ),
              !1
            );
        }
        this.currentSizeObj.availability.delivery_date &&
          'disable' == this.currentSizeObj.availability.status
          ? $('#' + this.prefix + 'status_description').html(
            this.currentSizeObj.availability.status_description +
            ' <span>' +
            this.currentSizeObj.availability.delivery_date +
            '</span>',
          )
          : this.currentSizeObj.availability.status_description
            ? ($('#' + this.prefix + 'status_description').html(
              this.currentSizeObj.availability.status_description,
            ),
              $('#' + this.prefix + 'status').removeClass('--status-hide --phone-disable'))
            : 'disable' == this.currentSizeObj.availability.status
              ? ($('#' + this.prefix + 'status').addClass('--status-hide --phone-disable'),
                $('#' + this.prefix + 'status_description_wrapper').hide())
              : ($('#' + this.prefix + 'status').removeClass('--status-hide --phone-disable'),
                $('#' + this.prefix + 'status_description_wrapper').hide()),
          this.currentSizeObj.availability.status_gfx &&
          ($('#' + this.prefix + 'status_gfx')
            .show()
            .attr('src', this.currentSizeObj.availability.status_gfx),
            $('#' + this.prefix + 'status').removeClass('--status-hide'));
      }),
      (this.sellBy = function (e, t, i) {
        if ('disable' == this.currentSizeObj.availability.status)
          return (
            !this.onDisableAlert ||
            ('product_bundle' == this.currentSizeObj.product_type && 1 == this.firstRun) ||
            this.alert(this.txt.niedostepny),
            e
          );
        if (
          ((e = parseFloat(e)), (t = parseFloat(t)), (i = parseFloat(i)), !$.isNumeric(i) || i <= e)
        ) {
          if (jQuery.isEmptyObject(product_data.order_quantity_range)) return e.toFixed(t);
          e = e.toFixed(t);
        }
        (number = Math.floor(i / e) * e),
          (number =
            ((i / e) * e - number).toFixed(t + 1) > 0
              ? (1 * number + e).toFixed(t)
              : number.toFixed(t)),
          (number = parseFloat(number));
        var n = this.currentSizeObj.amount,
          o = e;
        if (!jQuery.isEmptyObject(product_data.order_quantity_range)) {
          var r = product_data.order_quantity_range;
          if (r.max_quantity_per_order) {
            var a = parseFloat(r.max_quantity_per_order);
            n = n > a || -1 == n ? a : n;
          }
          if (r.max_size_quantity_per_order) {
            var s = parseFloat(r.max_size_quantity_per_order);
            n = n > s || -1 == n ? s : n;
          }
          if (r.min_quantity_per_order) {
            var l = parseFloat(r.min_quantity_per_order);
            o = l > o ? l : o;
          }
          if (r.min_size_quantity_per_order) {
            var c = parseFloat(r.min_size_quantity_per_order);
            o = c > o ? c : o;
          }
          if (r.minimum_quantity_subscription) {
            var p = parseFloat(r.minimum_quantity_subscription);
            o = p > o ? p : o;
          }
        }
        if (o && number < o) {
          if (this.isStarted) {
            const i =
              (Math.ceil(parseFloat(o) / e) * e).toFixed(t) > 1
                ? this.currentSizeObj.unit_plural
                : this.currentSizeObj.unit;
            this.alert(
              this.txt.minimalnie + ' ' + (Math.ceil(parseFloat(o) / e) * e).toFixed(t) + ' ' + i,
            );
          }
          return (this.isStarted = !0), (Math.ceil(parseFloat(o) / e) * e).toFixed(t);
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
        (this.curr_class = $('#' + this.prefix + 'form').attr('class')),
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
          (this.txt.amount = $('#' + this.prefix + 'amount').html()),
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
            const o = new Date();
            o.setHours(o.getHours() + this.options.hoursBeforeOrderBy),
              (i = n.getTime() - o.getTime() < 0);
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
        const o = { key: t, value: result, response: n };
        return this.shippingTimeBuffer.push(o), o;
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
        var o = async function () {
          (product_data.sizes.uniw || product_data.sizes.onesize) && t.setCurrentSizeObj('uniw'),
            'true' === n
              ? (t.currentSizeObj.price =
                product_data.sizes[t.currentSizeObj.type].price_subscription)
              : 'false' === n &&
              (t.currentSizeObj.price = product_data.sizes[t.currentSizeObj.type].price_normal),
            $('#' + t.prefix + 'form').attr(
              'class',
              t.curr_class + ' ' + t.currentSizeObj.availability.status,
            ),
            (t.configObj.displaySize = 'onesize' != t.currentSizeObj.type),
            t.currentSizeObj.availability &&
            (t.configObj.disableNumberInput = 'disable' == t.currentSizeObj.availability.status),
            (t.configObj.disableBuyButton = !1),
            ('disable' != t.currentSizeObj.availability.status &&
              'true' != t.currentSizeObj.phone_price) ||
            (t.configObj.disableBuyButton = !0),
            (t.configObj.displayBuySection = !!t.currentSizeObj.gratis);
          var o = t.currentSizeObj.unit_sellby + '';
          if (
            ($('#' + t.options.contenersPrefix + 'number').size() &&
              (o = $('#' + t.options.contenersPrefix + 'number').val()),
              (t.configObj.valueOfNumberInput = t.sellBy(
                t.currentSizeObj.unit_sellby,
                t.currentSizeObj.unit_precision,
                o.replace(',', '.'),
              )),
              t.currentSizeObj.rebateNumber)
          )
            for (i in ((t.configObj.rabatIndex = -1),
              (t.configObj.rabatIndex_last = -1),
              t.currentSizeObj.rebateNumber)) {
              var r = t.currentSizeObj.rebateNumber[i].threshold_end
                ? t.currentSizeObj.rebateNumber[i].threshold_end
                : t.configObj.valueOfNumberInput;
              if (
                parseFloat(t.configObj.valueOfNumberInput) >=
                parseFloat(t.currentSizeObj.rebateNumber[i].threshold) &&
                parseFloat(t.configObj.valueOfNumberInput) <= parseFloat(r)
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
                ? $('#' + t.prefix + 'sizes_cont').hide()
                : $('#' + t.prefix + 'sizes_cont').show(),
              t.status_description(),
              $('#' + t.prefix + 'amount').size())
          ) {
            $('#' + t.prefix + 'amount').show();
            var a = t.currentSizeObj.amount;
            0 == a
              ? $('#' + t.prefix + 'amount').hide()
              : -1 == a &&
              ((a = t.txt.infinity), '' == t.txt.infinity && $('#' + t.prefix + 'amount').hide()),
              1 == a
                ? (a = a + ' ' + t.currentSizeObj.unit)
                : a > 1 && (a = a + ' ' + t.currentSizeObj.unit_plural),
              $('#' + t.prefix + 'amount').html(t.txt.amount.format(a));
          }
          if (
            (t.currentSizeObj.product_type &&
              'product_virtual' == t.currentSizeObj.product_type &&
              $('#' + t.prefix + 'amount').hide(),
              'y' == t.currentSizeObj.availability.visible &&
                t.currentSizeObj &&
                t.currentSizeObj.availability.status_description
                ? ($('#' + t.prefix + 'status_description_wrapper').show(),
                  t.currentSizeObj.availability.status_gfx && $('#' + t.prefix + 'status_gfx').show(),
                  $('#' + t.prefix + 'status').removeClass('--status-hide'))
                : ($('#' + t.prefix + 'status_description_wrapper').hide(),
                  $('#' + t.prefix + 'status_gfx').hide(),
                  $('#' + t.prefix + 'status').addClass('--status-hide')),
              'true' == t.currentSizeObj.availability.delivery_days_undefined &&
                'true' == t.currentSizeObj.delivery.undefined
                ? $('#' + t.prefix + 'delivery_wrapper').hide()
                : $('#' + t.prefix + 'delivery_wrapper').show(),
              $('#' + t.prefix + 'delivery_days').hide(),
              projectorv3_disable_ajax && 0 == projectorv3_disable_ajax)
          ) {
            if (
              ($('#' + t.prefix + 'delivery_days').hide(),
                t.currentSizeObj && 'true' != t.currentSizeObj.availability.delivery_days_undefined)
            ) {
              $('#' + t.prefix + 'status').addClass('--loading --time-show');
              const e = await t.shippingTime();
              e.value.length
                ? ($('#' + t.prefix + 'delivery_label')
                  .show()
                  .html(e.value[0]),
                  $('#' + t.prefix + 'delivery_days')
                    .show()
                    .html(e.value[1]))
                : $('#' + t.prefix + 'status').removeClass('--time-show'),
                $('#' + t.prefix + 'status_wrapper')
                  .css('min-height', '0px')
                  .css('min-height', `${$('#' + t.prefix + 'status_wrapper').height()}px`),
                $('#' + t.prefix + 'status').removeClass('--loading'),
                t.options.endShippingFunction(e.response);
            }
          } else if ('true' != t.currentSizeObj.availability.delivery_days_undefined) {
            var s = t;
            clearTimeout(s.timeHandle),
              $('#' + s.prefix + 'delivery_days')
                .parents('.product_section')
                .addClass('loading'),
              (s.timeHandle = setTimeout(async function () {
                $('#' + t.prefix + 'status').addClass('--loading --time-show');
                const e = await t.shippingTime();
                e.value.length
                  ? ($('#' + t.prefix + 'delivery_label')
                    .show()
                    .html(e.value[0]),
                    $('#' + t.prefix + 'delivery_days')
                      .show()
                      .html(e.value[1]))
                  : $('#' + t.prefix + 'status').removeClass('--time-show'),
                  $('#' + t.prefix + 'status_wrapper')
                    .css('min-height', '0px')
                    .css('min-height', `${$('#' + t.prefix + 'status_wrapper').height()}px`),
                  $('#' + t.prefix + 'status').removeClass('--loading'),
                  t.options.endShippingFunction(e.response);
              }, 50));
          }
          $('#' + t.prefix + 'shipping_unknown').hide(),
            (t.currentSizeObj.product_type &&
              ('product_virtual' == t.currentSizeObj.product_type ||
                'product_service' == t.currentSizeObj.product_type)) ||
              'disable' == t.currentSizeObj.availability.status
              ? ($('#' + t.prefix + 'shipping_info').hide(),
                $('#' + t.prefix + 'shipping_dialog').hide(),
                t.currentSizeObj.availability.status_description
                  ? $('#' + t.prefix + 'status_description').show()
                  : $('#' + t.prefix + 'status_description').hide())
              : ($('#' + t.prefix + 'shipping_info').show(),
                $('#' + t.prefix + 'shipping_dialog').show(),
                $('#' + t.prefix + 'status_description').hide()),
            t.currentSizeObj.delay_time &&
              'true' == t.currentSizeObj.delay_time.unknown_delivery_time &&
              'order' == t.currentSizeObj.availability.status
              ? ($('#' + t.prefix + 'shipping_info').hide(),
                $('#' + t.prefix + 'shipping_dialog').hide(),
                $('#' + t.prefix + 'status_description').hide(),
                $('#' + t.prefix + 'status_wrapper').hide(),
                $('#' + t.prefix + 'status').addClass('--unknown-show'),
                $('#' + t.prefix + 'shipping_unknown').show())
              : ($('#' + t.prefix + 'status').removeClass('--unknown-show'),
                $('#' + t.prefix + 'status_wrapper').show()),
            0 == t.currentSizeObj.delivery.shipping
              ? $('#' + t.prefix + 'shipping').html(t.txt.gratis)
              : $('#' + t.prefix + 'shipping').html(
                t.txt.koszt_od + t.formatPrice(t.currentSizeObj.delivery.shipping, e),
              ),
            'true' == t.currentSizeObj.delivery.undefined
              ? $('#' + t.prefix + 'shipping').hide()
              : $('#' + t.prefix + 'shipping').show(),
            t.currentSizeObj.price.advanceprice
              ? ($('#' + t.prefix + 'advanceprice_wrapper').show(),
                $('#' + t.prefix + 'advanceprice').html(
                  t.formatPrice(t.currentSizeObj.price.advanceprice, e),
                ))
              : $('#' + t.prefix + 'advanceprice_wrapper').hide(),
            $('#' + t.prefix + 'sellbyprice_wrapper').show(),
            $('#' + t.prefix + 'sellbyprice').html(
              t.nettoPrice
                ? t.currentSizeObj.price.price_net_formatted
                : t.currentSizeObj.price.price_formatted,
            ),
            $('#' + t.prefix + 'prices_wrapper').hide(),
            t.currentSizeObj.price.srp &&
              t.currentSizeObj.price.srp > 0 &&
              t.currentSizeObj.price.srp != t.currentSizeObj.price.value
              ? ($('#' + t.prefix + 'price_srp_wrapper').show(),
                $('#' + t.prefix + 'prices_wrapper').show(),
                $('#' + t.prefix + 'price_srp').html(
                  t.formatPrice(
                    t.nettoPrice ? t.currentSizeObj.price.srp_net : t.currentSizeObj.price.srp,
                    e,
                  ),
                ))
              : $('#' + t.prefix + 'price_srp_wrapper').hide(),
            t.currentSizeObj.price.price_net && t.currentSizeObj.price.price_net > 0
              ? ($('#' + t.prefix + 'price_net_wrapper').show(),
                $('#' + t.prefix + 'price_net').show(),
                $('#' + t.prefix + 'price_net').html(
                  t.formatPrice(
                    t.nettoPrice ? t.currentSizeObj.price.value : t.currentSizeObj.price.price_net,
                    e,
                  ),
                ))
              : ($('#' + t.prefix + 'price_net_wrapper').hide(),
                $('#' + t.prefix + 'price_net').hide());
          let l = '';
          if ('true' == t.currentSizeObj.phone_price)
            t.currentSizeObj.price.points > 0
              ? ($('#' + t.prefix + 'price_value').hide(),
                $('#' + t.prefix + 'prices_wrapper')
                  .show()
                  .addClass('--only-points'))
              : ($('#' + t.prefix + 'price_value').show(),
                $('#' + t.prefix + 'prices_wrapper')
                  .show()
                  .removeClass('--only-points'),
                t.currentSizeObj.availability.status_gfx_tel &&
                  '' != t.currentSizeObj.availability.status_gfx_tel
                  ? $('#' + t.prefix + 'price_value').html(
                    '<a class="projector_prices__contact" target="_blank" href="' +
                    t.options.contact_link +
                    '"><img src="' +
                    t.currentSizeObj.availability.status_gfx_tel +
                    '"/><span>' +
                    t.currentSizeObj.availability.status_description_tel +
                    '</span></a>',
                  )
                  : $('#' + t.prefix + 'price_value').html(
                    '<a class="projector_prices__contact" target="_blank" href="' +
                    t.options.contact_link +
                    '">' +
                    t.currentSizeObj.availability.status_description_tel +
                    '</a>',
                  ));
          else if (
            ($('#' + t.prefix + 'prices_wrapper')
              .show()
              .removeClass('--only-points'),
              $('#' + t.prefix + 'price_value').show(),
              t.currentSizeObj.price.rebateNumber)
          ) {
            const e = t.configObj.valueOfNumberInput;
            if (t.currentSizeObj.price.rebateNumber.items.includes(null))
              +e >= +t.currentSizeObj.price.rebateNumber.nextleft
                ? ($('#' + t.prefix + 'price_value').html(
                  t.formatPrice(
                    t.nettoPrice
                      ? t.currentSizeObj.price.rebateNumber.nextprice_net
                      : t.currentSizeObj.price.rebateNumber.nextprice,
                    !0,
                    !1,
                    !1,
                  ),
                ),
                  (l = t.nettoPrice
                    ? t.currentSizeObj.price.rebateNumber.nextprice_net
                    : t.currentSizeObj.price.rebateNumber.nextprice),
                  (t.rebateThreshold = t.currentSizeObj.price.rebateNumber.nextthreshold))
                : ($('#' + t.prefix + 'price_value').html(
                  t.formatPrice(
                    t.nettoPrice
                      ? t.currentSizeObj.price.price_net
                      : t.currentSizeObj.price.value,
                    !0,
                    !1,
                    !1,
                  ),
                ),
                  (t.rebateThreshold = !1));
            else {
              const i = [...t.currentSizeObj.price.rebateNumber.items]
                .reverse()
                .find(t => e >= +t.left);
              i
                ? ($('#' + t.prefix + 'price_value').html(
                  t.formatPrice(t.nettoPrice ? i.price_net : i.price, !0, !1, !1),
                ),
                  (l = t.nettoPrice ? i.price_net : i.price),
                  (t.rebateThreshold = i.threshold))
                : ($('#' + t.prefix + 'price_value').html(
                  t.formatPrice(
                    t.nettoPrice
                      ? t.currentSizeObj.price.price_net
                      : t.currentSizeObj.price.value,
                    !0,
                    !1,
                    !1,
                  ),
                ),
                  (t.rebateThreshold = !1));
            }
          } else
            $('#' + t.prefix + 'price_value').html(
              t.formatPrice(
                t.nettoPrice ? t.currentSizeObj.price.price_net : t.currentSizeObj.price.value,
                !0,
                !1,
                !1,
              ),
            );
          t.currentSizeObj.price.maxprice
            ? t.currentSizeObj.price.maxprice > 0
              ? ($('#' + t.prefix + 'price_maxprice').show(),
                $('#' + t.prefix + 'price_maxprice').html(
                  t.formatPrice(
                    t.nettoPrice
                      ? t.currentSizeObj.price.maxprice_net
                      : t.currentSizeObj.price.maxprice,
                    e,
                  ),
                ))
              : $('#' + t.prefix + 'price_maxprice').hide()
            : '' != l
              ? ((t.currentSizeObj.price.maxprice = t.currentSizeObj.price.value),
                (t.currentSizeObj.price.maxprice_net = t.currentSizeObj.price.price_net),
                t.currentSizeObj.price.maxprice > 0
                  ? ($('#' + t.prefix + 'price_maxprice').show(),
                    $('#' + t.prefix + 'price_maxprice').html(
                      t.formatPrice(
                        t.nettoPrice
                          ? t.currentSizeObj.price.maxprice_net
                          : t.currentSizeObj.price.maxprice,
                        e,
                      ),
                    ))
                  : $('#' + t.prefix + 'price_maxprice').hide())
              : $('#' + t.prefix + 'price_maxprice').hide(),
            t.currentSizeObj.price.omnibus_price &&
            $('#' + t.prefix + 'omnibus_price_value').html(
              t.formatPrice(
                t.nettoPrice
                  ? t.currentSizeObj.price.omnibus_price_net
                  : t.currentSizeObj.price.omnibus_price,
                e,
              ),
            ),
            t.options.hide_unit
              ? $('#' + t.prefix + 'price_unit_sellby, #' + t.prefix + 'price_unit').hide()
              : 1 == t.configObj.valueOfNumberInput
                ? ($('#' + t.prefix + 'price_unit_sellby')
                  .hide()
                  .html(t.configObj.valueOfNumberInput),
                  $('#' + t.prefix + 'price_unit').html(t.currentSizeObj.unit))
                : ($('#' + t.prefix + 'price_unit_sellby')
                  .show()
                  .html(t.configObj.valueOfNumberInput),
                  $('#' + t.prefix + 'price_unit').html(
                    t.currentSizeObj.unit_plural
                      ? t.currentSizeObj.unit_plural
                      : t.currentSizeObj.unit,
                  )),
            t.currentSizeObj.bundle_price || t.currentSizeObj.price.yousave_percent
              ? $('#' + t.prefix + 'yousave_bundle_wrapper').show()
              : $('#' + t.prefix + 'yousave_bundle_wrapper').hide(),
            (yousaveTmp = t.nettoPrice
              ? t.currentSizeObj.price.yousave_net
              : t.currentSizeObj.price.yousave),
            (yousave_percentTmp = t.currentSizeObj.price.yousave_percent),
            '' != l &&
            ((yousaveTmp = t.nettoPrice
              ? +t.currentSizeObj.price.maxprice_net - +l
              : +t.currentSizeObj.price.maxprice - +l),
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
            'true' != t.currentSizeObj.phone_price &&
              t.currentSizeObj.bundle_price &&
              t.currentSizeObj.bundle_price.amount_diff_gross > 0
              ? $('#' + t.prefix + 'price_yousave')
                .show()
                .html(
                  t.txt.oszczedzasz +
                  t.currentSizeObj.bundle_price.percent_diff +
                  t.txt.taniej +
                  t.formatPrice(
                    t.nettoPrice
                      ? t.currentSizeObj.bundle_price.amount_diff_net
                      : t.currentSizeObj.bundle_price.amount_diff_gross,
                    e,
                  ) +
                  t.txt.wzestawie,
                )
              : 'true' != t.currentSizeObj.phone_price && yousaveTmp
                ? $('#' + t.prefix + 'price_yousave')
                  .show()
                  .html(
                    t.txt.oszczedzasz +
                    yousave_percentTmp +
                    t.txt.taniej +
                    t.formatPrice(yousaveTmp, e) +
                    t.txt.nawias_end,
                  )
                : $('#' + t.prefix + 'price_yousave').hide(),
            $('#' + t.prefix + 'price_points_wrapper').hide(),
            t.currentSizeObj.price.points > 0 &&
            ($('#' + t.prefix + 'price_points')
              .show()
              .html(
                t.formatPrice(t.currentSizeObj.price.points, e, t.txt.pkt, !0).toFixed(2) +
                t.txt.pkt,
              ),
              $('#' + t.prefix + 'points_wrapper').show(),
              $('#' + t.prefix + 'price_points_wrapper').show()),
            t.currentSizeObj.price.points_recive > 0
              ? ($('#' + t.prefix + 'points_wrapper').show(),
                $('#' + t.prefix + 'points_recive_points')
                  .show()
                  .html(
                    t
                      .formatPrice(t.currentSizeObj.price.points_recive, e, t.txt.pkt, !0)
                      .toFixed(2) + t.txt.pkt,
                  ),
                $('#' + t.prefix + 'price_points_recive_wrapper').show())
              : $('#' + t.prefix + 'price_points_recive_wrapper').hide(),
            t.currentSizeObj.for_points,
            $('#' + t.prefix + 'tell_availability').hide(),
            $('#' + t.prefix + 'tell_availability')
              .find('input')
              .prop('disabled', !0);
          var c = t;
          if (t.configObj.addBasketFnBtn)
            $('#' + t.prefix + 'button_basket').off('click'),
              $('#' + t.prefix + 'button_basket')
                .on('click', function () {
                  return c.configObj.addBasketFnBtn(), !1;
                })
                .removeClass('disabled');
          else if (t.configObj.disableBuyButtonTXT) {
            var p = t.configObj.disableBuyButtonTXT;
            $('#' + t.prefix + 'button_basket')
              .on('click', function () {
                return classObj.alert(p), !1;
              })
              .addClass('disabled'),
              $('#' + t.prefix + 'number').prop('disabled', !0);
          } else
            'disable' == t.currentSizeObj.availability.status
              ? ($('#' + t.prefix + 'price_points_wrapper').hide(),
                $('#' + t.prefix + 'button_basket')
                  .on('click', function () {
                    return classObj.alert(classObj.txt.niedostepny), !1;
                  })
                  .addClass('disabled'),
                $('#' + t.prefix + 'number').prop('disabled', !0),
                $('#' + t.prefix + 'tell_availability').show(),
                $('#' + t.prefix + 'tell_availability')
                  .find('input')
                  .prop('disabled', !1))
              : 'true' == t.currentSizeObj.phone_price && t.currentSizeObj.price.points > 0
                ? ($('#' + t.prefix + 'button_basket')
                  .on('click', function () {
                    return classObj.alert(classObj.txt.tylko_punkty), !1;
                  })
                  .addClass('disabled'),
                  $('#' + t.prefix + 'number').prop('disabled', !0))
                : 'true' == t.currentSizeObj.phone_price
                  ? ($('#' + t.prefix + 'number').prop('disabled', !1),
                    $('#' + t.prefix + 'button_basket')
                      .on('click', function () {
                        return classObj.alert(classObj.txt.tylkotel), !1;
                      })
                      .addClass('disabled'),
                    $('#' + t.prefix + 'number').prop('disabled', !0),
                    $('#' + t.prefix + 'form').addClass('--phone'))
                  : ($('#' + t.prefix + 'button_basket')
                    .off('click')
                    .removeClass('disabled'),
                    $('#' + t.prefix + 'number').prop('disabled', !1),
                    $('#' + t.prefix + 'form').removeClass('--phone'));
          return (
            t.currentSizeObj.gratis &&
            ($('#' + t.prefix + 'buy_section').hide(),
              $('#' + t.prefix + 'price_points_wrapper').hide()),
            t.currentSizeObj.price.basket_enable &&
            'y' == t.currentSizeObj.price.basket_enable &&
            'true' == t.currentSizeObj.phone_price &&
            ($('#' + t.prefix + 'button_basket')
              .off('click')
              .removeClass('disabled'),
              $('#' + t.prefix + 'number').prop('disabled', !1),
              $('#' + t.prefix + 'price_value').html(
                '<span class="' + t.prefix + '_price_gratis">' + t.txt.gratis_produkt + '</span>',
              )),
            $('#' + t.options.contenersPrefix + 'number').val(t.configObj.valueOfNumberInput),
            $('#' + t.options.contenersPrefix + 'buy_section .f-dropdown-button').text(
              t.configObj.valueOfNumberInput,
            ),
            t.configObj.rebateNumberNext &&
            ($('#' + t.prefix + 'product_rebatenumber_value').text(
              (t.configObj.rebateNumberNext.value + t.txt.proc).replace(/\.00/gi, ''),
            ),
              $('#' + t.prefix + 'product_rebatenumber_threshold').text(
                t.configObj.rebateNumberNext.threshold.replace(/\.00/gi, ''),
              )),
            (t.firstRun = !1),
            t.options.endStartFunction(),
            !0
          );
        };
        product_data.sizes[t.currentSizeObj.type].availability
          ? 'true' !== n || product_data.sizes[t.currentSizeObj.type].price_subscription
            ? 'false' !== n || product_data.sizes[t.currentSizeObj.type].price_normal
              ? o()
              : $.getJSON(
                '/ajax/projector.php?action=get&product=' +
                product_data.product_id +
                '&size=' +
                t.currentSizeObj.type +
                '&get=sizeprices',
                function (e) {
                  (product_data.sizes[t.currentSizeObj.type].price = e.sizeprices),
                    (product_data.sizes[t.currentSizeObj.type].price_normal = e.sizeprices),
                    o();
                },
              )
            : $.getJSON(
              '/ajax/projector.php?action=get&product=' +
              product_data.product_id +
              '&size=' +
              t.currentSizeObj.type +
              '&get=sizeprices&subscription=1',
              function (e) {
                (product_data.sizes[t.currentSizeObj.type].price = e.sizeprices),
                  (product_data.sizes[t.currentSizeObj.type].price_subscription = e.sizeprices),
                  o();
              },
            )
          : product_data.sizes &&
          ('product_bundle' != product_data.product_type
            ? $.getJSON(
              '/ajax/projector.php?action=get&product=' +
              product_data.product_id +
              '&size=' +
              t.currentSizeObj.type +
              '&get=sizeavailability,sizedelivery,sizeprices' +
              ('true' === n ? '&subscription=1' : ''),
              function (e) {
                (product_data.sizes[t.currentSizeObj.type].availability = e.sizeavailability),
                  (product_data.sizes[t.currentSizeObj.type].delivery = e.sizedelivery),
                  (product_data.sizes[t.currentSizeObj.type].price = e.sizeprices),
                  (product_data.sizes[t.currentSizeObj.type].delay_time =
                    e.sizeavailability.delay_time),
                  'true' === n
                    ? (product_data.sizes[t.currentSizeObj.type].price_subscription =
                      e.sizeprices)
                    : (product_data.sizes[t.currentSizeObj.type].price_normal = e.sizeprices),
                  o();
              },
            )
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
      (this.setCurrentSizeObj = function (e) {
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
          product_data.sizes
            ? i()
            : $.getJSON(
              '/ajax/projector.php?action=get&product=' + product_data.product_id + '&get=sizes',
              function (e) {
                e.sizes &&
                  ((product_data.sizes = {}),
                    $.each(e.sizes.items, function (e, t) {
                      product_data.sizes[t.type] = t;
                    }),
                    i(),
                    t.start());
              },
            ),
            this.options.endSetCurrentSizeFunction();
        }
      }),
      (this.getCurrentSizeObj = function (e) {
        return this.currentSizeObj;
      }),
      (this.getAjaxProductData = function (e) {
        classObj.options.beginGetAjaxProductDataFunction(),
          $.ajax({
            type: 'GET',
            timeout: this.timeoutAjax,
            url: '/projector.php?product=' + e + '&shop_xml=true&getProductXML=true',
            dataType: 'xml',
            success: function (e) {
              classObj.options.clearXMLGetAjaxProductDataFunction(e);
              var t = {},
                i = classObj.getAttr($('product:first', e), 'id');
              (t.currency = shop_currency),
                (t.product_type = classObj.getAttr($('product:first', e), 'product_type')),
                (t.unit = classObj.getAttr($('product sizes_version:first', e), 'unit')),
                (t.unit_plural = classObj.getAttr(
                  $('product sizes_version:first', e),
                  'unit_plural',
                )),
                (t.unit_sellby = classObj.getAttr(
                  $('product sizes_version:first', e),
                  'unit_sellby',
                )),
                (t.unit_precision = classObj.getAttr(
                  $('product sizes_version:first', e),
                  'unit_precision',
                )),
                (t.sizes = {}),
                $('product versions:first version[id=' + i + '] size', e).each(function () {
                  t.sizes[classObj.getAttr($(this), 'type')] = $.xml2json(
                    $('<p/>').append($(this)).html(),
                  );
                }),
                (product_data = t),
                classObj.setCurrentSizeObj(classObj.getIndex(product_data.sizes, 0)),
                projectorObj.start(),
                classObj.options.endGetAjaxProductDataFunction();
            },
            error: function () { },
          });
      });
  };
/*! jQuery UI - v1.13.1 - 2022-01-24
 * http://jqueryui.com
 * Includes: keycode.js, widgets/datepicker.js
 * Copyright jQuery Foundation and other contributors; Licensed MIT */
!(function (e) {
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
      .on('mouseover', i, o);
  }
  function o() {
    e.datepicker._isDisabledDatepicker(t.inline ? t.dpDiv.parent()[0] : t.input[0]) ||
      (e(this).parents('.ui-datepicker-calendar').find('a').removeClass('ui-state-hover'),
        e(this).addClass('ui-state-hover'),
        -1 !== this.className.indexOf('ui-datepicker-prev') &&
        e(this).addClass('ui-datepicker-prev-hover'),
        -1 !== this.className.indexOf('ui-datepicker-next') &&
        e(this).addClass('ui-datepicker-next-hover'));
  }
  function r(t, i) {
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
        return r(this._defaults, e || {}), this;
      },
      _attachDatepicker: function (t, i) {
        var n, o, r;
        (o = 'div' === (n = t.nodeName.toLowerCase()) || 'span' === n),
          t.id || ((this.uuid += 1), (t.id = 'dp' + this.uuid)),
          ((r = this._newInst(e(t), o)).settings = e.extend({}, i || {})),
          'input' === n ? this._connectDatepicker(t, r) : o && this._inlineDatepicker(t, r);
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
          o,
          r,
          a = this._get(i, 'appendText'),
          s = this._get(i, 'isRTL');
        i.append && i.append.remove(),
          a &&
          ((i.append = e('<span>').addClass(this._appendClass).text(a)),
            t[s ? 'before' : 'after'](i.append)),
          t.off('focus', this._showDatepicker),
          i.trigger && i.trigger.remove(),
          ('focus' !== (n = this._get(i, 'showOn')) && 'both' !== n) ||
          t.on('focus', this._showDatepicker),
          ('button' !== n && 'both' !== n) ||
          ((o = this._get(i, 'buttonText')),
            (r = this._get(i, 'buttonImage')),
            this._get(i, 'buttonImageOnly')
              ? (i.trigger = e('<img>')
                .addClass(this._triggerClass)
                .attr({ src: r, alt: o, title: o }))
              : ((i.trigger = e("<button type='button'>").addClass(this._triggerClass)),
                r
                  ? i.trigger.html(e('<img>').attr({ src: r, alt: o, title: o }))
                  : i.trigger.text(o)),
            t[s ? 'before' : 'after'](i.trigger),
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
            o,
            r = new Date(2009, 11, 20),
            a = this._get(e, 'dateFormat');
          a.match(/[DM]/) &&
            ((t = function (e) {
              for (i = 0, n = 0, o = 0; o < e.length; o++)
                e[o].length > i && ((i = e[o].length), (n = o));
              return n;
            }),
              r.setMonth(t(this._get(e, a.match(/MM/) ? 'monthNames' : 'monthNamesShort'))),
              r.setDate(
                t(this._get(e, a.match(/DD/) ? 'dayNames' : 'dayNamesShort')) + 20 - r.getDay(),
              )),
            e.input.attr('size', this._formatDate(e, r).length);
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
      _dialogDatepicker: function (t, i, n, o, a) {
        var s,
          l,
          c,
          p,
          d,
          u = this._dialogInst;
        return (
          u ||
          ((this.uuid += 1),
            (s = 'dp' + this.uuid),
            (this._dialogInput = e(
              "<input type='text' id='" +
              s +
              "' style='position: absolute; top: -100px; width: 0px;'/>",
            )),
            this._dialogInput.on('keydown', this._doKeyDown),
            e('body').append(this._dialogInput),
            ((u = this._dialogInst = this._newInst(this._dialogInput, !1)).settings = {}),
            e.data(this._dialogInput[0], 'datepicker', u)),
          r(u.settings, o || {}),
          (i = i && i.constructor === Date ? this._formatDate(u, i) : i),
          this._dialogInput.val(i),
          (this._pos = a ? (a.length ? a : [a.pageX, a.pageY]) : null),
          this._pos ||
          ((l = document.documentElement.clientWidth),
            (c = document.documentElement.clientHeight),
            (p = document.documentElement.scrollLeft || document.body.scrollLeft),
            (d = document.documentElement.scrollTop || document.body.scrollTop),
            (this._pos = [l / 2 - 100 + p, c / 2 - 150 + d])),
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
          o = e(i),
          r = e.data(i, 'datepicker');
        o.hasClass(this.markerClassName) &&
          ((n = i.nodeName.toLowerCase()),
            e.removeData(i, 'datepicker'),
            'input' === n
              ? (r.append.remove(),
                r.trigger.remove(),
                o
                  .removeClass(this.markerClassName)
                  .off('focus', this._showDatepicker)
                  .off('keydown', this._doKeyDown)
                  .off('keypress', this._doKeyPress)
                  .off('keyup', this._doKeyUp))
              : ('div' !== n && 'span' !== n) || o.removeClass(this.markerClassName).empty(),
            t === r && ((t = null), (this._curInst = null)));
      },
      _enableDatepicker: function (t) {
        var i,
          n,
          o = e(t),
          r = e.data(t, 'datepicker');
        o.hasClass(this.markerClassName) &&
          ('input' === (i = t.nodeName.toLowerCase())
            ? ((t.disabled = !1),
              r.trigger
                .filter('button')
                .each(function () {
                  this.disabled = !1;
                })
                .end()
                .filter('img')
                .css({ opacity: '1.0', cursor: '' }))
            : ('div' !== i && 'span' !== i) ||
            ((n = o.children('.' + this._inlineClass))
              .children()
              .removeClass('ui-state-disabled'),
              n.find('select.ui-datepicker-month, select.ui-datepicker-year').prop('disabled', !1)),
            (this._disabledInputs = e.map(this._disabledInputs, function (e) {
              return e === t ? null : e;
            })));
      },
      _disableDatepicker: function (t) {
        var i,
          n,
          o = e(t),
          r = e.data(t, 'datepicker');
        o.hasClass(this.markerClassName) &&
          ('input' === (i = t.nodeName.toLowerCase())
            ? ((t.disabled = !0),
              r.trigger
                .filter('button')
                .each(function () {
                  this.disabled = !0;
                })
                .end()
                .filter('img')
                .css({ opacity: '0.5', cursor: 'default' }))
            : ('div' !== i && 'span' !== i) ||
            ((n = o.children('.' + this._inlineClass)).children().addClass('ui-state-disabled'),
              n.find('select.ui-datepicker-month, select.ui-datepicker-year').prop('disabled', !0)),
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
        var o,
          a,
          s,
          l,
          c = this._getInst(t);
        if (2 === arguments.length && 'string' == typeof i)
          return 'defaults' === i
            ? e.extend({}, e.datepicker._defaults)
            : c
              ? 'all' === i
                ? e.extend({}, c.settings)
                : this._get(c, i)
              : null;
        (o = i || {}),
          'string' == typeof i && ((o = {})[i] = n),
          c &&
          (this._curInst === c && this._hideDatepicker(),
            (a = this._getDateDatepicker(t, !0)),
            (s = this._getMinMaxDate(c, 'min')),
            (l = this._getMinMaxDate(c, 'max')),
            r(c.settings, o),
            null !== s &&
            void 0 !== o.dateFormat &&
            void 0 === o.minDate &&
            (c.settings.minDate = this._formatDate(c, s)),
            null !== l &&
            void 0 !== o.dateFormat &&
            void 0 === o.maxDate &&
            (c.settings.maxDate = this._formatDate(c, l)),
            'disabled' in o &&
            (o.disabled ? this._disableDatepicker(t) : this._enableDatepicker(t)),
            this._attachments(e(t), c),
            this._autoSize(c),
            this._setDate(c, a),
            this._updateAlternate(c),
            this._updateDatepicker(c));
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
          o,
          r = e.datepicker._getInst(t.target),
          a = !0,
          s = r.dpDiv.is('.ui-datepicker-rtl');
        if (((r._keyEvent = !0), e.datepicker._datepickerShowing))
          switch (t.keyCode) {
            case 9:
              e.datepicker._hideDatepicker(), (a = !1);
              break;
            case 13:
              return (
                (o = e(
                  'td.' + e.datepicker._dayOverClass + ':not(.' + e.datepicker._currentClass + ')',
                  r.dpDiv,
                ))[0] && e.datepicker._selectDay(t.target, r.selectedMonth, r.selectedYear, o[0]),
                (i = e.datepicker._get(r, 'onSelect'))
                  ? ((n = e.datepicker._formatDate(r)),
                    i.apply(r.input ? r.input[0] : null, [n, r]))
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
                  ? -e.datepicker._get(r, 'stepBigMonths')
                  : -e.datepicker._get(r, 'stepMonths'),
                'M',
              );
              break;
            case 34:
              e.datepicker._adjustDate(
                t.target,
                t.ctrlKey
                  ? +e.datepicker._get(r, 'stepBigMonths')
                  : +e.datepicker._get(r, 'stepMonths'),
                'M',
              );
              break;
            case 35:
              (t.ctrlKey || t.metaKey) && e.datepicker._clearDate(t.target),
                (a = t.ctrlKey || t.metaKey);
              break;
            case 36:
              (t.ctrlKey || t.metaKey) && e.datepicker._gotoToday(t.target),
                (a = t.ctrlKey || t.metaKey);
              break;
            case 37:
              (t.ctrlKey || t.metaKey) && e.datepicker._adjustDate(t.target, s ? 1 : -1, 'D'),
                (a = t.ctrlKey || t.metaKey),
                t.originalEvent.altKey &&
                e.datepicker._adjustDate(
                  t.target,
                  t.ctrlKey
                    ? -e.datepicker._get(r, 'stepBigMonths')
                    : -e.datepicker._get(r, 'stepMonths'),
                  'M',
                );
              break;
            case 38:
              (t.ctrlKey || t.metaKey) && e.datepicker._adjustDate(t.target, -7, 'D'),
                (a = t.ctrlKey || t.metaKey);
              break;
            case 39:
              (t.ctrlKey || t.metaKey) && e.datepicker._adjustDate(t.target, s ? -1 : 1, 'D'),
                (a = t.ctrlKey || t.metaKey),
                t.originalEvent.altKey &&
                e.datepicker._adjustDate(
                  t.target,
                  t.ctrlKey
                    ? +e.datepicker._get(r, 'stepBigMonths')
                    : +e.datepicker._get(r, 'stepMonths'),
                  'M',
                );
              break;
            case 40:
              (t.ctrlKey || t.metaKey) && e.datepicker._adjustDate(t.target, 7, 'D'),
                (a = t.ctrlKey || t.metaKey);
              break;
            default:
              a = !1;
          }
        else 36 === t.keyCode && t.ctrlKey ? e.datepicker._showDatepicker(this) : (a = !1);
        a && (t.preventDefault(), t.stopPropagation());
      },
      _doKeyPress: function (t) {
        var i,
          n,
          o = e.datepicker._getInst(t.target);
        if (e.datepicker._get(o, 'constrainInput'))
          return (
            (i = e.datepicker._possibleChars(e.datepicker._get(o, 'dateFormat'))),
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
        var i, n, o, a, s, l, c;
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
            !1 !== (o = (n = e.datepicker._get(i, 'beforeShow')) ? n.apply(t, [t, i]) : {}) &&
            (r(i.settings, o),
              (i.lastVal = null),
              (e.datepicker._lastInput = t),
              e.datepicker._setDateFromField(i),
              e.datepicker._inDialog && (t.value = ''),
              e.datepicker._pos ||
              ((e.datepicker._pos = e.datepicker._findPos(t)),
                (e.datepicker._pos[1] += t.offsetHeight)),
              (a = !1),
              e(t)
                .parents()
                .each(function () {
                  return !(a |= 'fixed' === e(this).css('position'));
                }),
              (s = { left: e.datepicker._pos[0], top: e.datepicker._pos[1] }),
              (e.datepicker._pos = null),
              i.dpDiv.empty(),
              i.dpDiv.css({ position: 'absolute', display: 'block', top: '-1000px' }),
              e.datepicker._updateDatepicker(i),
              (s = e.datepicker._checkOffset(i, s, a)),
              i.dpDiv.css({
                position: e.datepicker._inDialog && e.blockUI ? 'static' : a ? 'fixed' : 'absolute',
                display: 'none',
                left: s.left + 'px',
                top: s.top + 'px',
              }),
              i.inline ||
              ((l = e.datepicker._get(i, 'showAnim')),
                (c = e.datepicker._get(i, 'duration')),
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
                e.effects && e.effects.effect[l]
                  ? i.dpDiv.show(l, e.datepicker._get(i, 'showOptions'), c)
                  : i.dpDiv[l || 'show'](l ? c : null),
                e.datepicker._shouldFocusInput(i) && i.input.trigger('focus'),
                (e.datepicker._curInst = i))));
      },
      _updateDatepicker: function (i) {
        (this.maxRows = 4),
          (t = i),
          i.dpDiv.empty().append(this._generateHTML(i)),
          this._attachHandlers(i);
        var n,
          r = this._getNumberOfMonths(i),
          a = r[1],
          s = i.dpDiv.find('.' + this._dayOverClass + ' a'),
          l = e.datepicker._get(i, 'onUpdateDatepicker');
        s.length > 0 && o.apply(s.get(0)),
          i.dpDiv
            .removeClass('ui-datepicker-multi-2 ui-datepicker-multi-3 ui-datepicker-multi-4')
            .width(''),
          a > 1 && i.dpDiv.addClass('ui-datepicker-multi-' + a).css('width', 17 * a + 'em'),
          i.dpDiv[(1 !== r[0] || 1 !== r[1] ? 'add' : 'remove') + 'Class']('ui-datepicker-multi'),
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
          l && l.apply(i.input ? i.input[0] : null, [i]);
      },
      _shouldFocusInput: function (e) {
        return (
          e.input && e.input.is(':visible') && !e.input.is(':disabled') && !e.input.is(':focus')
        );
      },
      _checkOffset: function (t, i, n) {
        var o = t.dpDiv.outerWidth(),
          r = t.dpDiv.outerHeight(),
          a = t.input ? t.input.outerWidth() : 0,
          s = t.input ? t.input.outerHeight() : 0,
          l = document.documentElement.clientWidth + (n ? 0 : e(document).scrollLeft()),
          c = document.documentElement.clientHeight + (n ? 0 : e(document).scrollTop());
        return (
          (i.left -= this._get(t, 'isRTL') ? o - a : 0),
          (i.left -= n && i.left === t.input.offset().left ? e(document).scrollLeft() : 0),
          (i.top -= n && i.top === t.input.offset().top + s ? e(document).scrollTop() : 0),
          (i.left -= Math.min(i.left, i.left + o > l && l > o ? Math.abs(i.left + o - l) : 0)),
          (i.top -= Math.min(i.top, i.top + r > c && c > r ? Math.abs(r + s) : 0)),
          i
        );
      },
      _findPos: function (t) {
        for (
          var i, n = this._getInst(t), o = this._get(n, 'isRTL');
          t && ('hidden' === t.type || 1 !== t.nodeType || e.expr.pseudos.hidden(t));

        )
          t = t[o ? 'previousSibling' : 'nextSibling'];
        return [(i = e(t).offset()).left, i.top];
      },
      _hideDatepicker: function (t) {
        var i,
          n,
          o,
          r,
          a = this._curInst;
        !a ||
          (t && a !== e.data(t, 'datepicker')) ||
          (this._datepickerShowing &&
            ((i = this._get(a, 'showAnim')),
              (n = this._get(a, 'duration')),
              (o = function () {
                e.datepicker._tidyDialog(a);
              }),
              e.effects && (e.effects.effect[i] || e.effects[i])
                ? a.dpDiv.hide(i, e.datepicker._get(a, 'showOptions'), n, o)
                : a.dpDiv['slideDown' === i ? 'slideUp' : 'fadeIn' === i ? 'fadeOut' : 'hide'](
                  i ? n : null,
                  o,
                ),
              i || o(),
              (this._datepickerShowing = !1),
              (r = this._get(a, 'onClose')) &&
              r.apply(a.input ? a.input[0] : null, [a.input ? a.input.val() : '', a]),
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
        var o = e(t),
          r = this._getInst(o[0]);
        this._isDisabledDatepicker(o[0]) ||
          (this._adjustInstDate(r, i, n), this._updateDatepicker(r));
      },
      _gotoToday: function (t) {
        var i,
          n = e(t),
          o = this._getInst(n[0]);
        this._get(o, 'gotoCurrent') && o.currentDay
          ? ((o.selectedDay = o.currentDay),
            (o.drawMonth = o.selectedMonth = o.currentMonth),
            (o.drawYear = o.selectedYear = o.currentYear))
          : ((i = new Date()),
            (o.selectedDay = i.getDate()),
            (o.drawMonth = o.selectedMonth = i.getMonth()),
            (o.drawYear = o.selectedYear = i.getFullYear())),
          this._notifyChange(o),
          this._adjustDate(n);
      },
      _selectMonthYear: function (t, i, n) {
        var o = e(t),
          r = this._getInst(o[0]);
        (r['selected' + ('M' === n ? 'Month' : 'Year')] = r[
          'draw' + ('M' === n ? 'Month' : 'Year')
        ] = parseInt(i.options[i.selectedIndex].value, 10)),
          this._notifyChange(r),
          this._adjustDate(o);
      },
      _selectDay: function (t, i, n, o) {
        var r,
          a = e(t);
        e(o).hasClass(this._unselectableClass) ||
          this._isDisabledDatepicker(a[0]) ||
          (((r = this._getInst(a[0])).selectedDay = r.currentDay = parseInt(
            e('a', o).attr('data-date'),
          )),
            (r.selectedMonth = r.currentMonth = i),
            (r.selectedYear = r.currentYear = n),
            this._selectDate(t, this._formatDate(r, r.currentDay, r.currentMonth, r.currentYear)));
      },
      _clearDate: function (t) {
        var i = e(t);
        this._selectDate(i, '');
      },
      _selectDate: function (t, i) {
        var n,
          o = e(t),
          r = this._getInst(o[0]);
        (i = null != i ? i : this._formatDate(r)),
          r.input && r.input.val(i),
          this._updateAlternate(r),
          (n = this._get(r, 'onSelect'))
            ? n.apply(r.input ? r.input[0] : null, [i, r])
            : r.input && r.input.trigger('change'),
          r.inline
            ? this._updateDatepicker(r)
            : (this._hideDatepicker(),
              (this._lastInput = r.input[0]),
              'object' != typeof r.input[0] && r.input.trigger('focus'),
              (this._lastInput = null));
      },
      _updateAlternate: function (t) {
        var i,
          n,
          o,
          r = this._get(t, 'altField');
        r &&
          ((i = this._get(t, 'altFormat') || this._get(t, 'dateFormat')),
            (n = this._getDate(t)),
            (o = this.formatDate(i, n, this._getFormatConfig(t))),
            e(document).find(r).val(o));
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
        var o,
          r,
          a,
          s,
          l = 0,
          c = (n ? n.shortYearCutoff : null) || this._defaults.shortYearCutoff,
          p = 'string' != typeof c ? c : (new Date().getFullYear() % 100) + parseInt(c, 10),
          d = (n ? n.dayNamesShort : null) || this._defaults.dayNamesShort,
          u = (n ? n.dayNames : null) || this._defaults.dayNames,
          h = (n ? n.monthNamesShort : null) || this._defaults.monthNamesShort,
          _ = (n ? n.monthNames : null) || this._defaults.monthNames,
          f = -1,
          m = -1,
          g = -1,
          y = -1,
          v = !1,
          b = function (e) {
            var i = o + 1 < t.length && t.charAt(o + 1) === e;
            return i && o++, i;
          },
          w = function (e) {
            var t = b(e),
              n = '@' === e ? 14 : '!' === e ? 20 : 'y' === e && t ? 4 : 'o' === e ? 3 : 2,
              o = new RegExp('^\\d{' + ('y' === e ? n : 1) + ',' + n + '}'),
              r = i.substring(l).match(o);
            if (!r) throw 'Missing number at position ' + l;
            return (l += r[0].length), parseInt(r[0], 10);
          },
          k = function (t, n, o) {
            var r = -1,
              a = e
                .map(b(t) ? o : n, function (e, t) {
                  return [[t, e]];
                })
                .sort(function (e, t) {
                  return -(e[1].length - t[1].length);
                });
            if (
              (e.each(a, function (e, t) {
                var n = t[1];
                if (i.substr(l, n.length).toLowerCase() === n.toLowerCase())
                  return (r = t[0]), (l += n.length), !1;
              }),
                -1 !== r)
            )
              return r + 1;
            throw 'Unknown name at position ' + l;
          },
          x = function () {
            if (i.charAt(l) !== t.charAt(o)) throw 'Unexpected literal at position ' + l;
            l++;
          };
        for (o = 0; o < t.length; o++)
          if (v) "'" !== t.charAt(o) || b("'") ? x() : (v = !1);
          else
            switch (t.charAt(o)) {
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
                m = w('m');
                break;
              case 'M':
                m = k('M', h, _);
                break;
              case 'y':
                f = w('y');
                break;
              case '@':
                (f = (s = new Date(w('@'))).getFullYear()),
                  (m = s.getMonth() + 1),
                  (g = s.getDate());
                break;
              case '!':
                (f = (s = new Date((w('!') - this._ticksTo1970) / 1e4)).getFullYear()),
                  (m = s.getMonth() + 1),
                  (g = s.getDate());
                break;
              case "'":
                b("'") ? x() : (v = !0);
                break;
              default:
                x();
            }
        if (l < i.length && ((a = i.substr(l)), !/^\s+/.test(a)))
          throw 'Extra/unparsed characters found in date: ' + a;
        if (
          (-1 === f
            ? (f = new Date().getFullYear())
            : f < 100 &&
            (f +=
              new Date().getFullYear() - (new Date().getFullYear() % 100) + (f <= p ? 0 : -100)),
            y > -1)
        )
          for (m = 1, g = y; ;) {
            if (g <= (r = this._getDaysInMonth(f, m - 1))) break;
            m++, (g -= r);
          }
        if (
          (s = this._daylightSavingAdjust(new Date(f, m - 1, g))).getFullYear() !== f ||
          s.getMonth() + 1 !== m ||
          s.getDate() !== g
        )
          throw 'Invalid date';
        return s;
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
          o = (i ? i.dayNamesShort : null) || this._defaults.dayNamesShort,
          r = (i ? i.dayNames : null) || this._defaults.dayNames,
          a = (i ? i.monthNamesShort : null) || this._defaults.monthNamesShort,
          s = (i ? i.monthNames : null) || this._defaults.monthNames,
          l = function (t) {
            var i = n + 1 < e.length && e.charAt(n + 1) === t;
            return i && n++, i;
          },
          c = function (e, t, i) {
            var n = '' + t;
            if (l(e)) for (; n.length < i;) n = '0' + n;
            return n;
          },
          p = function (e, t, i, n) {
            return l(e) ? n[t] : i[t];
          },
          d = '',
          u = !1;
        if (t)
          for (n = 0; n < e.length; n++)
            if (u) "'" !== e.charAt(n) || l("'") ? (d += e.charAt(n)) : (u = !1);
            else
              switch (e.charAt(n)) {
                case 'd':
                  d += c('d', t.getDate(), 2);
                  break;
                case 'D':
                  d += p('D', t.getDay(), o, r);
                  break;
                case 'o':
                  d += c(
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
                  d += c('m', t.getMonth() + 1, 2);
                  break;
                case 'M':
                  d += p('M', t.getMonth(), a, s);
                  break;
                case 'y':
                  d += l('y')
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
                  l("'") ? (d += "'") : (u = !0);
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
          o = function (i) {
            var n = t + 1 < e.length && e.charAt(t + 1) === i;
            return n && t++, n;
          };
        for (t = 0; t < e.length; t++)
          if (n) "'" !== e.charAt(t) || o("'") ? (i += e.charAt(t)) : (n = !1);
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
                o("'") ? (i += "'") : (n = !0);
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
            o = this._getDefaultDate(e),
            r = o,
            a = this._getFormatConfig(e);
          try {
            r = this.parseDate(i, n, a) || o;
          } catch (e) {
            n = t ? '' : n;
          }
          (e.selectedDay = r.getDate()),
            (e.drawMonth = e.selectedMonth = r.getMonth()),
            (e.drawYear = e.selectedYear = r.getFullYear()),
            (e.currentDay = n ? r.getDate() : 0),
            (e.currentMonth = n ? r.getMonth() : 0),
            (e.currentYear = n ? r.getFullYear() : 0),
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
        var o =
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
                    (i.toLowerCase().match(/^c/) ? e.datepicker._getDate(t) : null) || new Date(),
                  o = n.getFullYear(),
                  r = n.getMonth(),
                  a = n.getDate(),
                  s = /([+\-]?[0-9]+)\s*(d|D|w|W|m|M|y|Y)?/g,
                  l = s.exec(i);
                  l;

                ) {
                  switch (l[2] || 'd') {
                    case 'd':
                    case 'D':
                      a += parseInt(l[1], 10);
                      break;
                    case 'w':
                    case 'W':
                      a += 7 * parseInt(l[1], 10);
                      break;
                    case 'm':
                    case 'M':
                      (r += parseInt(l[1], 10)),
                        (a = Math.min(a, e.datepicker._getDaysInMonth(o, r)));
                      break;
                    case 'y':
                    case 'Y':
                      (o += parseInt(l[1], 10)),
                        (a = Math.min(a, e.datepicker._getDaysInMonth(o, r)));
                  }
                  l = s.exec(i);
                }
                return new Date(o, r, a);
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
          (o = o && 'Invalid Date' === o.toString() ? n : o) &&
          (o.setHours(0), o.setMinutes(0), o.setSeconds(0), o.setMilliseconds(0)),
          this._daylightSavingAdjust(o)
        );
      },
      _daylightSavingAdjust: function (e) {
        return e ? (e.setHours(e.getHours() > 12 ? e.getHours() + 2 : 0), e) : null;
      },
      _setDate: function (e, t, i) {
        var n = !t,
          o = e.selectedMonth,
          r = e.selectedYear,
          a = this._restrictMinMax(e, this._determineDate(e, t, new Date()));
        (e.selectedDay = e.currentDay = a.getDate()),
          (e.drawMonth = e.selectedMonth = e.currentMonth = a.getMonth()),
          (e.drawYear = e.selectedYear = e.currentYear = a.getFullYear()),
          (o === e.selectedMonth && r === e.selectedYear) || i || this._notifyChange(e),
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
          o,
          r,
          a,
          s,
          l,
          c,
          p,
          d,
          u,
          h,
          _,
          f,
          m,
          g,
          y,
          v,
          b,
          w,
          k,
          x,
          $,
          C,
          S,
          z,
          j,
          T,
          D,
          A,
          E,
          L,
          O,
          M,
          P,
          N,
          I,
          q,
          F,
          H = new Date(),
          B = this._daylightSavingAdjust(new Date(H.getFullYear(), H.getMonth(), H.getDate())),
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
          o = this._canAdjustMonth(t, -1, te, ee)
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
          r = this._get(t, 'nextText'),
          r = U
            ? this.formatDate(
              r,
              this._daylightSavingAdjust(new Date(te, ee + G, 1)),
              this._getFormatConfig(t),
            )
            : r,
          a = this._canAdjustMonth(t, 1, te, ee)
            ? e('<a>')
              .attr({
                class: 'ui-datepicker-next ui-corner-all',
                'data-handler': 'next',
                'data-event': 'click',
                title: r,
              })
              .append(
                e('<span>')
                  .addClass('ui-icon ui-icon-circle-triangle-' + (R ? 'w' : 'e'))
                  .text(r),
              )[0].outerHTML
            : Y
              ? ''
              : e('<a>')
                .attr({ class: 'ui-datepicker-next ui-corner-all ui-state-disabled', title: r })
                .append(
                  e('<span>')
                    .attr('class', 'ui-icon ui-icon-circle-triangle-' + (R ? 'w' : 'e'))
                    .text(r),
                )[0].outerHTML,
          s = this._get(t, 'currentText'),
          l = this._get(t, 'gotoCurrent') && t.currentDay ? Z : B,
          s = U ? this.formatDate(s, l, this._getFormatConfig(t)) : s,
          c = '',
          t.inline ||
          (c = e('<button>')
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
            .append(R ? c : '')
            .append(
              this._isInRange(t, l)
                ? e('<button>')
                  .attr({
                    type: 'button',
                    class:
                      'ui-datepicker-current ui-state-default ui-priority-secondary ui-corner-all',
                    'data-handler': 'today',
                    'data-event': 'click',
                  })
                  .text(s)
                : '',
            )
            .append(R ? '' : c)[0].outerHTML),
          d = parseInt(this._get(t, 'firstDay'), 10),
          d = isNaN(d) ? 0 : d,
          u = this._get(t, 'showWeek'),
          h = this._get(t, 'dayNames'),
          _ = this._get(t, 'dayNamesMin'),
          f = this._get(t, 'monthNames'),
          m = this._get(t, 'monthNamesShort'),
          g = this._get(t, 'beforeShowDay'),
          y = this._get(t, 'showOtherMonths'),
          v = this._get(t, 'selectOtherMonths'),
          b = this._getDefaultDate(t),
          w = '',
          x = 0;
          x < Q[0];
          x++
        ) {
          for ($ = '', this.maxRows = 4, C = 0; C < Q[1]; C++) {
            if (
              ((S = this._daylightSavingAdjust(new Date(te, ee, t.selectedDay))),
                (z = ' ui-corner-all'),
                (j = ''),
                J)
            ) {
              if (((j += "<div class='ui-datepicker-group"), Q[1] > 1))
                switch (C) {
                  case 0:
                    (j += ' ui-datepicker-group-first'),
                      (z = ' ui-corner-' + (R ? 'right' : 'left'));
                    break;
                  case Q[1] - 1:
                    (j += ' ui-datepicker-group-last'),
                      (z = ' ui-corner-' + (R ? 'left' : 'right'));
                    break;
                  default:
                    (j += ' ui-datepicker-group-middle'), (z = '');
                }
              j += "'>";
            }
            for (
              j +=
              "<div class='ui-datepicker-header ui-widget-header ui-helper-clearfix" +
              z +
              "'>" +
              (/all|left/.test(z) && 0 === x ? (R ? a : o) : '') +
              (/all|right/.test(z) && 0 === x ? (R ? o : a) : '') +
              this._generateMonthYearHeader(t, ee, te, K, X, x > 0 || C > 0, f, m) +
              "</div><table class='ui-datepicker-calendar'><thead><tr>",
              T = u
                ? "<th class='ui-datepicker-week-col'>" + this._get(t, 'weekHeader') + '</th>'
                : '',
              k = 0;
              k < 7;
              k++
            )
              T +=
                "<th scope='col'" +
                ((k + d + 6) % 7 >= 5 ? " class='ui-datepicker-week-end'" : '') +
                "><span title='" +
                h[(D = (k + d) % 7)] +
                "'>" +
                _[D] +
                '</span></th>';
            for (
              j += T + '</tr></thead><tbody>',
              A = this._getDaysInMonth(te, ee),
              te === t.selectedYear &&
              ee === t.selectedMonth &&
              (t.selectedDay = Math.min(t.selectedDay, A)),
              E = (this._getFirstDayOfMonth(te, ee) - d + 7) % 7,
              L = Math.ceil((E + A) / 7),
              O = J && this.maxRows > L ? this.maxRows : L,
              this.maxRows = O,
              M = this._daylightSavingAdjust(new Date(te, ee, 1 - E)),
              P = 0;
              P < O;
              P++
            ) {
              for (
                j += '<tr>',
                N = u
                  ? "<td class='ui-datepicker-week-col'>" +
                  this._get(t, 'calculateWeek')(M) +
                  '</td>'
                  : '',
                k = 0;
                k < 7;
                k++
              )
                (I = g ? g.apply(t.input ? t.input[0] : null, [M]) : [!0, '']),
                  (F = ((q = M.getMonth() !== ee) && !v) || !I[0] || (K && M < K) || (X && M > X)),
                  (N +=
                    "<td class='" +
                    ((k + d + 6) % 7 >= 5 ? ' ui-datepicker-week-end' : '') +
                    (q ? ' ui-datepicker-other-month' : '') +
                    ((M.getTime() === S.getTime() && ee === t.selectedMonth && t._keyEvent) ||
                      (b.getTime() === M.getTime() && b.getTime() === S.getTime())
                      ? ' ' + this._dayOverClass
                      : '') +
                    (F ? ' ' + this._unselectableClass + ' ui-state-disabled' : '') +
                    (q && !y
                      ? ''
                      : ' ' +
                      I[1] +
                      (M.getTime() === Z.getTime() ? ' ' + this._currentClass : '') +
                      (M.getTime() === B.getTime() ? ' ui-datepicker-today' : '')) +
                    "'" +
                    ((q && !y) || !I[2] ? '' : " title='" + I[2].replace(/'/g, '&#39;') + "'") +
                    (F
                      ? ''
                      : " data-handler='selectDay' data-event='click' data-month='" +
                      M.getMonth() +
                      "' data-year='" +
                      M.getFullYear() +
                      "'") +
                    '>' +
                    (q && !y
                      ? '&#xa0;'
                      : F
                        ? "<span class='ui-state-default'>" + M.getDate() + '</span>'
                        : "<a class='ui-state-default" +
                        (M.getTime() === B.getTime() ? ' ui-state-highlight' : '') +
                        (M.getTime() === Z.getTime() ? ' ui-state-active' : '') +
                        (q ? ' ui-priority-secondary' : '') +
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
              j += N + '</tr>';
            }
            ++ee > 11 && ((ee = 0), te++),
              ($ += j +=
                '</tbody></table>' +
                (J
                  ? '</div>' +
                  (Q[0] > 0 && C === Q[1] - 1
                    ? "<div class='ui-datepicker-row-break'></div>"
                    : '')
                  : ''));
          }
          w += $;
        }
        return (w += p), (t._keyEvent = !1), w;
      },
      _generateMonthYearHeader: function (e, t, i, n, o, r, a, s) {
        var l,
          c,
          p,
          d,
          u,
          h,
          _,
          f,
          m = this._get(e, 'changeMonth'),
          g = this._get(e, 'changeYear'),
          y = this._get(e, 'showMonthAfterYear'),
          v = this._get(e, 'selectMonthLabel'),
          b = this._get(e, 'selectYearLabel'),
          w = "<div class='ui-datepicker-title'>",
          k = '';
        if (r || !m) k += "<span class='ui-datepicker-month'>" + a[t] + '</span>';
        else {
          for (
            l = n && n.getFullYear() === i,
            c = o && o.getFullYear() === i,
            k +=
            "<select class='ui-datepicker-month' aria-label='" +
            v +
            "' data-handler='selectMonth' data-event='change'>",
            p = 0;
            p < 12;
            p++
          )
            (!l || p >= n.getMonth()) &&
              (!c || p <= o.getMonth()) &&
              (k +=
                "<option value='" +
                p +
                "'" +
                (p === t ? " selected='selected'" : '') +
                '>' +
                s[p] +
                '</option>');
          k += '</select>';
        }
        if ((y || (w += k + (!r && m && g ? '' : '&#xa0;')), !e.yearshtml))
          if (((e.yearshtml = ''), r || !g))
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
              _ = h(d[0]),
              f = Math.max(_, h(d[1] || '')),
              _ = n ? Math.max(_, n.getFullYear()) : _,
              f = o ? Math.min(f, o.getFullYear()) : f,
              e.yearshtml +=
              "<select class='ui-datepicker-year' aria-label='" +
              b +
              "' data-handler='selectYear' data-event='change'>";
              _ <= f;
              _++
            )
              e.yearshtml +=
                "<option value='" +
                _ +
                "'" +
                (_ === i ? " selected='selected'" : '') +
                '>' +
                _ +
                '</option>';
            (e.yearshtml += '</select>'), (w += e.yearshtml), (e.yearshtml = null);
          }
        return (
          (w += this._get(e, 'yearSuffix')),
          y && (w += (!r && m && g ? '' : '&#xa0;') + k),
          (w += '</div>')
        );
      },
      _adjustInstDate: function (e, t, i) {
        var n = e.selectedYear + ('Y' === i ? t : 0),
          o = e.selectedMonth + ('M' === i ? t : 0),
          r = Math.min(e.selectedDay, this._getDaysInMonth(n, o)) + ('D' === i ? t : 0),
          a = this._restrictMinMax(e, this._daylightSavingAdjust(new Date(n, o, r)));
        (e.selectedDay = a.getDate()),
          (e.drawMonth = e.selectedMonth = a.getMonth()),
          (e.drawYear = e.selectedYear = a.getFullYear()),
          ('M' !== i && 'Y' !== i) || this._notifyChange(e);
      },
      _restrictMinMax: function (e, t) {
        var i = this._getMinMaxDate(e, 'min'),
          n = this._getMinMaxDate(e, 'max'),
          o = i && t < i ? i : t;
        return n && o > n ? n : o;
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
        var o = this._getNumberOfMonths(e),
          r = this._daylightSavingAdjust(new Date(i, n + (t < 0 ? t : o[0] * o[1]), 1));
        return (
          t < 0 && r.setDate(this._getDaysInMonth(r.getFullYear(), r.getMonth())),
          this._isInRange(e, r)
        );
      },
      _isInRange: function (e, t) {
        var i,
          n,
          o = this._getMinMaxDate(e, 'min'),
          r = this._getMinMaxDate(e, 'max'),
          a = null,
          s = null,
          l = this._get(e, 'yearRange');
        return (
          l &&
          ((i = l.split(':')),
            (n = new Date().getFullYear()),
            (a = parseInt(i[0], 10)),
            (s = parseInt(i[1], 10)),
            i[0].match(/[+\-].*/) && (a += n),
            i[1].match(/[+\-].*/) && (s += n)),
          (!o || t.getTime() >= o.getTime()) &&
          (!r || t.getTime() <= r.getTime()) &&
          (!a || t.getFullYear() >= a) &&
          (!s || t.getFullYear() <= s)
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
        var o = t
          ? 'object' == typeof t
            ? t
            : this._daylightSavingAdjust(new Date(n, i, t))
          : this._daylightSavingAdjust(new Date(e.currentYear, e.currentMonth, e.currentDay));
        return this.formatDate(this._get(e, 'dateFormat'), o, this._getFormatConfig(e));
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
  }),
  (WebFontConfig = {
    google: { families: ['Open+Sans:400,600,700:latin,latin-ext&display=swap'] },
    active: app_shop.fn.fontCallback,
  }),
  (function () {
    var e = document.createElement('script');
    (e.src =
      ('https:' == document.location.protocol ? 'https' : 'http') +
      '://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js'),
      (e.async = 'true');
    var t = document.getElementsByTagName('script')[0];
    t.parentNode.insertBefore(e, t);
  })();
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
          $('.hotspot:not(.--list):not(.--slider):not(.--bundle):not(.--added)').each(function () {
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
            (app_shop.fn.hotspotSlick = new HotspotSlider({
              selector:
                '.hotspot:not(.--list):not(.--slider):not(.--bundle):not(.--added) .products:not(.slick-initialized)',
              options: {
                slidesToShow: 4,
                slidesToScroll: 1,
                dots: !1,
                arrows: !0,
                prevArrow: '<a class="slick-prev" href=""><i class="icon-angle-left"></i></a>',
                nextArrow: '<a class="slick-next" href=""><i class="icon-angle-right"></i></a>',
                infinite: !1,
                responsive: [],
              },
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
            1 === app_shop.vars.view &&
            $(
              '.hotspot:not(.--list):not(.--slider):not(.--bundle):not(.--added) .products.slick-initialized',
            ).slick('unslick'),
            app_shop.fn.projectorTabs && app_shop.fn.projectorTabs.init(),
            $('.hotspot .products').scroll(function () {
              app_shop.vars.bLazy && app_shop.vars.bLazy.revalidate();
            }),
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
      app_shop.fn.hotspotSlick = new HotspotSlider({
        selector:
          '.hotspot:not(.--list):not(.--slider):not(.--bundle):not(.--added) .products:not(.slick-initialized)',
        options: {
          slidesToShow: 4,
          slidesToScroll: 1,
          dots: !1,
          arrows: !0,
          prevArrow: '<a class="slick-prev" href=""><i class="icon-angle-left"></i></a>',
          nextArrow: '<a class="slick-next" href=""><i class="icon-angle-right"></i></a>',
          infinite: !1,
          responsive: [],
        },
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
    '.hotspot',
  ),
  app_shop.run(
    function () {
      $('.hotspot:not(.--list):not(.--slider):not(.--bundle):not(.--added)').each(function () {
        $(this).find('.product__name').setHeight($(this).find('.products')),
          $(this).find('.product__prices').setHeight($(this).find('.products'));
      }),
        1 === app_shop.vars.view
          ? $(
            '.hotspot:not(.--list):not(.--slider):not(.--bundle):not(.--added) .products.slick-initialized',
          ).slick('unslick')
          : app_shop.fn.hotspotSlick.init();
    },
    [1, 2, 3, 4],
    '.hotspot',
  ),
  app_shop.run(
    function () {
      $('.hotspot .products').scroll(function () {
        app_shop.vars.bLazy && app_shop.vars.bLazy.revalidate();
      });
    },
    1,
    '.hotspot .products',
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
    function () {
      $('.cm')
        .find('img.rwd-src')
        .each(function () {
          ($this = $(this)), $this.attr('src', app_shop.fn.getRwdSrc($this));
        });
    },
    [1, 2, 3, 4],
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
            }, 100);
        },
      })),
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
      $('.article__date').each(function () {
        const e = $(this),
          t = app_shop.fn.news_data({
            data: e.text(),
            month_names: iaical_shortNames,
            format: '<div>%d</div><span>%m</span>',
          });
        t && e.html(t);
      });
    },
    'all',
    '.article__date',
  ),
  (app_shop.fn.fixed_scroll = (e, t) => {
    let i = window.scrollY;
    const n = window;
    window.addEventListener('scroll', function (o) {
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
          for (var n = 0, o = t.length; n < o; n += i.numCol)
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
      o = new Image();
    (o.onload = () => t({ width: o.width, height: o.height })), (o.onerror = i), (o.src = n);
  });
$(document).on('change', 'input[type=file]', function () {
  if (!(window.File && window.FileReader && window.FileList && window.Blob)) return !1;
  const e = this.files[0],
    { name: t, size: i, type: n } = e || {},
    [o] = t.split('.').reverse(),
    r = $(this).data('max_filesize'),
    a = r && i <= Number(r),
    s = app_shop.vars.blacklist_mime && app_shop.vars.blacklist_mime.includes(n),
    l = app_shop.vars.blacklist_extension && app_shop.vars.blacklist_extension.includes(o);
  let c = '';
  return (
    s || (l && app_shop.txt.txt_77752_2)
      ? (c = app_shop.txt.txt_77752_2.format(t))
      : !a &&
      app_shop.txt.txt_77752_1 &&
      r &&
      (c = app_shop.txt.txt_77752_1.format(t, (r / 1048576).toFixed(2))),
    c ? ($(this).val(''), Alertek.Start(c), !1) : void 0
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
        o = 2 * e(window).height(),
        r = i.speed;
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
          e(window).scrollTop() >= o ? n.fadeIn(r) : n.fadeOut(r);
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
    function o(e) {
      var t = x.className,
        i = b._config.classPrefix || '';
      if (($ && (t = t.baseVal), b._config.enableJSClass)) {
        var n = new RegExp('(^|\\s)' + i + 'no-js(\\s|$)');
        t = t.replace(n, '$1' + i + 'js$2');
      }
      b._config.enableClasses &&
        ((t += ' ' + i + e.join(' ' + i)), $ ? (x.className.baseVal = t) : (x.className = t));
    }
    function r(e, t) {
      if ('object' == typeof e) for (var i in e) k(e, i) && r(i, e[i]);
      else {
        var n = (e = e.toLowerCase()).split('.'),
          a = b[n[0]];
        if ((2 == n.length && (a = a[n[1]]), void 0 !== a)) return b;
        (t = 'function' == typeof t ? t() : t),
          1 == n.length
            ? (b[n[0]] = t)
            : (!b[n[0]] || b[n[0]] instanceof Boolean || (b[n[0]] = new Boolean(b[n[0]])),
              (b[n[0]][n[1]] = t)),
          o([(t && 0 != t ? '' : 'no-') + n.join('-')]),
          b._trigger(e, t);
      }
      return b;
    }
    function a(e) {
      return e
        .replace(/([a-z])-([a-z])/g, function (e, t, i) {
          return t + i.toUpperCase();
        })
        .replace(/^-/, '');
    }
    function s() {
      return 'function' != typeof t.createElement
        ? t.createElement(arguments[0])
        : $
          ? t.createElementNS.call(t, 'http://www.w3.org/2000/svg', arguments[0])
          : t.createElement.apply(t, arguments);
    }
    function l(t, i, n) {
      var o;
      if ('getComputedStyle' in e) {
        o = getComputedStyle.call(e, t, i);
        var r = e.console;
        if (null !== o) n && (o = o.getPropertyValue(n));
        else if (r) {
          r[r.error ? 'error' : 'log'].call(
            r,
            'getComputedStyle returning null, its possible modernizr test results are inaccurate',
          );
        }
      } else o = !i && t.currentStyle && t.currentStyle[n];
      return o;
    }
    function c(e, t) {
      return !!~('' + e).indexOf(t);
    }
    function p(e, t) {
      return function () {
        return e.apply(t, arguments);
      };
    }
    function d(e, i, n, o) {
      var r,
        a,
        l,
        c,
        p = 'modernizr',
        d = s('div'),
        u = (function () {
          var e = t.body;
          return e || ((e = s($ ? 'svg' : 'body')).fake = !0), e;
        })();
      if (parseInt(n, 10))
        for (; n--;) ((l = s('div')).id = o ? o[n] : p + (n + 1)), d.appendChild(l);
      return (
        ((r = s('style')).type = 'text/css'),
        (r.id = 's' + p),
        (u.fake ? u : d).appendChild(r),
        u.appendChild(d),
        r.styleSheet ? (r.styleSheet.cssText = e) : r.appendChild(t.createTextNode(e)),
        (d.id = p),
        u.fake &&
        ((u.style.background = ''),
          (u.style.overflow = 'hidden'),
          (c = x.style.overflow),
          (x.style.overflow = 'hidden'),
          x.appendChild(u)),
        (a = i(d, e)),
        u.fake
          ? (u.parentNode.removeChild(u), (x.style.overflow = c), x.offsetHeight)
          : d.parentNode.removeChild(d),
        !!a
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
      var o = t.length;
      if ('CSS' in e && 'supports' in e.CSS) {
        for (; o--;) if (e.CSS.supports(u(t[o]), n)) return !0;
        return !1;
      }
      if ('CSSSupportsRule' in e) {
        for (var r = []; o--;) r.push('(' + u(t[o]) + ':' + n + ')');
        return d(
          '@supports (' + (r = r.join(' or ')) + ') { #modernizr { position: absolute; } }',
          function (e) {
            return 'absolute' == l(e, null, 'position');
          },
        );
      }
      return i;
    }
    function _(e, t, o, r) {
      function l() {
        d && (delete A.style, delete A.modElem);
      }
      if (((r = !n(r, 'undefined') && r), !n(o, 'undefined'))) {
        var p = h(e, o);
        if (!n(p, 'undefined')) return p;
      }
      for (var d, u, _, f, m, g = ['modernizr', 'tspan', 'samp']; !A.style && g.length;)
        (d = !0), (A.modElem = s(g.shift())), (A.style = A.modElem.style);
      for (_ = e.length, u = 0; _ > u; u++)
        if (((f = e[u]), (m = A.style[f]), c(f, '-') && (f = a(f)), A.style[f] !== i)) {
          if (r || n(o, 'undefined')) return l(), 'pfx' != t || f;
          try {
            A.style[f] = o;
          } catch (e) { }
          if (A.style[f] != m) return l(), 'pfx' != t || f;
        }
      return l(), !1;
    }
    function f(e, t, i, o, r) {
      var a = e.charAt(0).toUpperCase() + e.slice(1),
        s = (e + ' ' + z.join(a + ' ') + a).split(' ');
      return n(t, 'string') || n(t, 'undefined')
        ? _(s, t, o, r)
        : (function (e, t, i) {
          var o;
          for (var r in e)
            if (e[r] in t)
              return !1 === i ? e[r] : n((o = t[e[r]]), 'function') ? p(o, i || t) : o;
          return !1;
        })((s = (e + ' ' + S.join(a + ' ') + a).split(' ')), t, i);
    }
    function m(e, t, n) {
      return f(e, i, i, t, n);
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
      $ = 'svg' === x.nodeName.toLowerCase(),
      C = 'Moz O ms Webkit',
      S = v._config.usePrefixes ? C.toLowerCase().split(' ') : [];
    (v._domPrefixes = S),
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
        v.addTest = r;
      }),
      b.addTest('canvas', function () {
        var e = s('canvas');
        return !(!e.getContext || !e.getContext('2d'));
      });
    var z = v._config.usePrefixes ? C.split(' ') : [];
    v._cssomPrefixes = z;
    var j = function (t) {
      var n,
        o = w.length,
        r = e.CSSRule;
      if (void 0 === r) return i;
      if (!t) return !1;
      if ((n = (t = t.replace(/^@/, '')).replace(/-/g, '_').toUpperCase() + '_RULE') in r)
        return '@' + t;
      for (var a = 0; o > a; a++) {
        var s = w[a];
        if (s.toUpperCase() + '_' + n in r) return '@-' + s.toLowerCase() + '-' + t;
      }
      return !1;
    };
    v.atRule = j;
    var T = (v.testStyles = d);
    T('#modernizr { width: 50vw; }', function (t) {
      var i = parseInt(e.innerWidth / 2, 10),
        n = parseInt(l(t, null, 'width'), 10);
      b.addTest('cssvwunit', n == i);
    });
    var D = { elem: s('modernizr') };
    b._q.push(function () {
      delete D.elem;
    });
    var A = { style: D.elem.style };
    b._q.unshift(function () {
      delete A.style;
    }),
      (v.testAllProps = f),
      (v.prefixed = function (e, t, i) {
        return 0 === e.indexOf('@')
          ? j(e)
          : (-1 != e.indexOf('-') && (e = a(e)), t ? f(e, t, i) : f(e, 'pfx'));
      }),
      (v.testAllProps = m),
      b.addTest('flexbox', m('flexBasis', '1px', !0)),
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
          T(n, function (e) {
            i = 9 === e.offsetTop;
          });
        }
        return i;
      }),
      (function () {
        var e, t, i, o, r, a;
        for (var s in y)
          if (y.hasOwnProperty(s)) {
            if (
              ((e = []),
                (t = y[s]).name &&
                (e.push(t.name.toLowerCase()),
                  t.options && t.options.aliases && t.options.aliases.length))
            )
              for (i = 0; i < t.options.aliases.length; i++)
                e.push(t.options.aliases[i].toLowerCase());
            for (o = n(t.fn, 'function') ? t.fn() : t.fn, r = 0; r < e.length; r++)
              1 === (a = e[r].split('.')).length
                ? (b[a[0]] = o)
                : (!b[a[0]] || b[a[0]] instanceof Boolean || (b[a[0]] = new Boolean(b[a[0]])),
                  (b[a[0]][a[1]] = o)),
                g.push((o ? '' : 'no-') + a.join('-'));
          }
      })(),
      o(g),
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
            c(e, 'scroll', i.validateT);
          }),
          c(window, 'resize', i.saveViewportOffsetT),
          c(window, 'resize', i.validateT),
          c(window, 'scroll', i.validateT)),
        t(e);
    }
    function t(e) {
      for (var t = e._util, n = 0; n < t.count; n++) {
        var o,
          r = t.elements[n],
          s = r;
        o = e.options;
        var l = s.getBoundingClientRect();
        o.container && m && (s = s.closest(o.containerClass))
          ? (o =
            !!i((s = s.getBoundingClientRect()), _) &&
            i(l, {
              top: s.top - o.offset,
              right: s.right + o.offset,
              bottom: s.bottom + o.offset,
              left: s.left - o.offset,
            }))
          : (o = i(l, _)),
          (o || a(r, e.options.successClass)) &&
          (e.load(r), t.elements.splice(n, 1), t.count--, n--);
      }
      0 === t.count && e.destroy();
    }
    function i(e, t) {
      return e.right >= t.left && e.bottom >= t.top && e.left <= t.right && e.top <= t.bottom;
    }
    function n(e, t, i) {
      if (
        !a(e, i.successClass) &&
        (t || i.loadInvisible || (0 < e.offsetWidth && 0 < e.offsetHeight))
      )
        if ((t = e.getAttribute(h) || e.getAttribute(i.src))) {
          var n = (t = t.split(i.separator))[f && 1 < t.length ? 1 : 0],
            l = e.getAttribute(i.srcset),
            u = 'img' === e.nodeName.toLowerCase(),
            _ = (t = e.parentNode) && 'picture' === t.nodeName.toLowerCase();
          if (u || void 0 === e.src) {
            var m = new Image(),
              g = function () {
                i.error && i.error(e, 'invalid'),
                  s(e, i.errorClass),
                  p(m, 'error', g),
                  p(m, 'load', y);
              },
              y = function () {
                u ? _ || r(e, n, l) : (e.style.backgroundImage = 'url("' + n + '")'),
                  o(e, i),
                  p(m, 'load', y),
                  p(m, 'error', g);
              };
            _ &&
              ((m = e),
                d(t.getElementsByTagName('source'), function (e) {
                  var t = i.srcset,
                    n = e.getAttribute(t);
                  n && (e.setAttribute('srcset', n), e.removeAttribute(t));
                })),
              c(m, 'error', g),
              c(m, 'load', y),
              r(m, n, l);
          } else (e.src = n), o(e, i);
        } else
          'video' === e.nodeName.toLowerCase()
            ? (d(e.getElementsByTagName('source'), function (e) {
              var t = i.src,
                n = e.getAttribute(t);
              n && (e.setAttribute('src', n), e.removeAttribute(t));
            }),
              e.load(),
              o(e, i))
            : (i.error && i.error(e, 'missing'), s(e, i.errorClass));
    }
    function o(e, t) {
      s(e, t.successClass),
        t.success && t.success(e),
        e.removeAttribute(t.src),
        e.removeAttribute(t.srcset),
        d(t.breakpoints, function (t) {
          e.removeAttribute(t.src);
        });
    }
    function r(e, t, i) {
      i && e.setAttribute('srcset', i), (e.src = t);
    }
    function a(e, t) {
      return -1 !== (' ' + e.className + ' ').indexOf(' ' + t + ' ');
    }
    function s(e, t) {
      a(e, t) || (e.className += ' ' + t);
    }
    function l(e) {
      (_.bottom = (window.innerHeight || document.documentElement.clientHeight) + e),
        (_.right = (window.innerWidth || document.documentElement.clientWidth) + e);
    }
    function c(e, t, i) {
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
        var o = +new Date();
        o - n < t || ((n = o), e.apply(i, arguments));
      };
    }
    var h, _, f, m;
    return function (i) {
      if (!document.querySelectorAll) {
        var o = document.createStyleSheet();
        document.querySelectorAll = function (e, t, i, n, r) {
          for (
            r = document.all,
            t = [],
            i = (e = e.replace(/\[for\b/gi, '[htmlFor').split(',')).length;
            i--;

          ) {
            for (o.addRule(e[i], 'k:v'), n = r.length; n--;) r[n].currentStyle.k && t.push(r[n]);
            o.removeRule(0);
          }
          return t;
        };
      }
      var r = this,
        a = (r._util = {});
      (a.elements = []),
        (a.destroyed = !0),
        (r.options = i || {}),
        (r.options.error = r.options.error || !1),
        (r.options.offset = r.options.offset || 100),
        (r.options.root = r.options.root || document),
        (r.options.success = r.options.success || !1),
        (r.options.selector = r.options.selector || '.b-lazy'),
        (r.options.separator = r.options.separator || '|'),
        (r.options.containerClass = r.options.container),
        (r.options.container =
          !!r.options.containerClass && document.querySelectorAll(r.options.containerClass)),
        (r.options.errorClass = r.options.errorClass || 'b-error'),
        (r.options.breakpoints = r.options.breakpoints || !1),
        (r.options.loadInvisible = r.options.loadInvisible || !1),
        (r.options.successClass = r.options.successClass || 'b-loaded'),
        (r.options.validateDelay = r.options.validateDelay || 25),
        (r.options.saveViewportOffsetDelay = r.options.saveViewportOffsetDelay || 50),
        (r.options.srcset = r.options.srcset || 'data-srcset'),
        (r.options.src = h = r.options.src || 'data-src'),
        (m = Element.prototype.closest),
        (f = 1 < window.devicePixelRatio),
        ((_ = {}).top = 0 - r.options.offset),
        (_.left = 0 - r.options.offset),
        (r.revalidate = function () {
          e(this);
        }),
        (r.load = function (e, t) {
          var i = this.options;
          void 0 === e.length
            ? n(e, t, i)
            : d(e, function (e) {
              n(e, t, i);
            });
        }),
        (r.destroy = function () {
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
        (a.validateT = u(
          function () {
            t(r);
          },
          r.options.validateDelay,
          r,
        )),
        (a.saveViewportOffsetT = u(
          function () {
            l(r.options.offset);
          },
          r.options.saveViewportOffsetDelay,
          r,
        )),
        l(r.options.offset),
        d(r.options.breakpoints, function (e) {
          if (e.width >= window.screen.width) return (h = e.src), !1;
        }),
        setTimeout(function () {
          e(r);
        });
    };
  }),
  (function (e) {
    var t,
      i,
      n = 'center',
      o = 'left',
      r = 'right',
      a = 'auto';
    function s(t) {
      (this.$element = e(t)),
        (this.original_text = this.$element.html()),
        (this.settings = e.extend({}, e.fn.trunk8.defaults));
    }
    function l() {
      var t,
        n,
        o,
        r,
        s = this.data('trunk8'),
        l = s.settings,
        c = l.width,
        p = l.side,
        d = l.fill,
        u = i.getLineHeight(this) * l.lines,
        h = s.original_text,
        _ = h.length,
        f = '';
      if ((this.html(h), c === a)) {
        if (this.height() <= u) return;
        for (t = 0, n = _ - 1; t <= n;)
          (o = t + ((n - t) >> 1)),
            (r = i.eatStr(h, p, _ - o, d)),
            this.html(r),
            this.height() > u ? (n = o - 1) : ((t = o + 1), (f = f.length > r.length ? f : r));
        this.html(''), this.html(f), l.tooltip && this.attr('title', h);
      } else
        isNaN(c)
          ? e.error('Invalid width "' + c + '".')
          : ((o = _ - c),
            (r = i.eatStr(h, p, o, d)),
            this.html(r),
            l.tooltip && this.attr('title', h));
    }
    (s.prototype.updateSettings = function (t) {
      this.settings = e.extend(this.settings, t);
    }),
      (t = {
        init: function (t) {
          return this.each(function () {
            var i = e(this),
              n = i.data('trunk8');
            n || i.data('trunk8', (n = new s(this))), n.updateSettings(t), l.call(i);
          });
        },
        update: function (t) {
          return this.each(function () {
            var i = e(this);
            t && (i.data('trunk8').original_text = t), l.call(i);
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
        eatStr: function (t, a, s, l) {
          var c,
            p,
            d = t.length,
            u = i.eatStr.generateKey.apply(null, arguments);
          if (i.eatStr.cache[u]) return i.eatStr.cache[u];
          if (
            (('string' == typeof t && 0 !== d) || e.error('Invalid source string "' + t + '".'),
              s < 0 || s > d)
          )
            e.error('Invalid bite size "' + s + '".');
          else if (0 === s) return t;
          switch (
          ('string' != typeof (l + '') && e.error('Fill unable to be converted to a string.'), a)
          ) {
            case r:
              return (i.eatStr.cache[u] = e.trim(t.substr(0, d - s)) + l);
            case o:
              return (i.eatStr.cache[u] = l + e.trim(t.substr(s)));
            case n:
              return (
                (c = d >> 1),
                (p = s >> 1),
                (i.eatStr.cache[u] =
                  e.trim(i.eatStr(t.substr(0, d - c), r, s - p, '')) +
                  l +
                  e.trim(i.eatStr(t.substr(d - c), o, p, '')))
              );
            default:
              e.error('Invalid side "' + a + '".');
          }
        },
        getLineHeight: function (t) {
          var i,
            n = e(t),
            o = n.css('float'),
            r = n.css('position'),
            a = n.html(),
            s = 'line-height-test';
          return (
            'none' !== o && n.css('float', 'none'),
            'absolute' === r && n.css('position', 'static'),
            n.html('i').wrap('<div id="' + s + '" />'),
            (i = e('#' + s).innerHeight()),
            n.html(a).css({ float: o, position: r }).unwrap(),
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
      (e.fn.trunk8.defaults = { fill: '&hellip;', lines: 1, side: r, tooltip: !0, width: a });
  })(jQuery);
var responsiveSwitch = (function () {
  var e = parseInt(window.responsiveSwitchBreakpoint) || 1024,
    t = 'ResponsiveSwitch',
    i = 'content',
    n = 'data-rs',
    o = 'rs-link-to-desktop',
    r = 'rs-link-to-responsive',
    a = 'rs-link-inactive',
    s = 'rs-link-active';
  function l() {
    var o = document.querySelector('meta[name="viewport"]');
    return (
      null == o.getAttribute(n) && o.setAttribute(n, o.getAttribute(i)),
      o.getAttribute(i) == o.getAttribute(n)
        ? ((document.cookie = t + '=true;path=/'),
          document.documentElement.clientWidth != window.innerWidth
            ? (document.location.href = f())
            : o.setAttribute(
              i,
              'width=' + e + 'px, initial-scale=' + document.documentElement.clientWidth / e,
            ))
        : ((document.cookie = t + '=false;path=/;expires=Thu, 01 Jan 1970 00:00:01 GMT'),
          document.documentElement.clientWidth != window.innerWidth
            ? (document.location.href = f())
            : o.setAttribute(i, o.getAttribute(n))),
      !1
    );
  }
  var c = !1;
  function p() {
    for (var t = document.querySelectorAll('.rs-link'), i = 0; i < t.length; i++) {
      var n = t[i];
      null != n &&
        (_(n, r),
          _(n, o),
          _(n, a),
          _(n, s),
          u()
            ? (h(n, r), h(n, s), (n.innerHTML = n.getAttribute('data-link-responsive')))
            : document.documentElement &&
              (document.documentElement.clientWidth < e ||
                'true' == n.getAttribute('data-always-visible'))
              ? (h(n, o), h(n, s), (n.innerHTML = n.getAttribute('data-link-desktop')))
              : (h(n, a), (n.innerHTML = '')),
          c ||
          n.addEventListener(
            'click',
            function (e) {
              (e = e || window.event).preventDefault(), d();
            },
            !1,
          ));
    }
    c = !0;
  }
  function d() {
    l(), p();
  }
  function u() {
    return document.cookie.search(t + '=true') > -1;
  }
  function h(e, t) {
    e.className += ' ' + t;
  }
  function _(e, t) {
    (e.className = ' ' + e.className + ' '), (e.className = e.className.replace(' ' + t + ' ', ''));
  }
  function f() {
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
    u() && l(),
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
    email: /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/,
  },
  timeHandle: '',
  ajaxValidation: function (e, t, i, n, o) {
    var r, a, s, l, c, p;
    if (
      ((a = this),
        (s = e.parent()),
        (l = e.data('validation')),
        (p = e.data('ajaxtype')),
        (r = l + '=' + t),
        e.data('serialize') &&
        e.data('serialize').indexOf('data-') > -1 &&
        (r += '&' + e.attr(e.data('serialize'))),
        '' == t)
    )
      return a.clearValidation(s), a.resetRequiredClass(s), !1;
    'get' == p
      ? $.get(
        i,
        r,
        function (t) {
          t.errno
            ? ('bankAccount' == l && (c = a.vars.bankAccount), a.addError(e, c), o && o())
            : (a.addSuccess(e), n && n());
        },
        'json',
      )
      : $.post(
        i,
        r,
        function (t) {
          t.errno
            ? ('bankAccount' == l && (c = a.vars.bankAccount), a.addError(e, c), o && o())
            : (a.addSuccess(e), n && n());
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
    var i, n, o, r, a, s, l;
    if (
      ((o = e.parent()),
        (i = e.attr('type')),
        (n = e.val()),
        this.patterns.email,
        (r = e.attr('minlength')),
        (a = e.attr('maxlength')),
        (s = e.data('validate')),
        (l = e.data('validation-url')),
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
    else if (l) this.ajaxValidation(e, n, l);
    else {
      if (r) {
        if (n.length < r) return this.addError(e, this.vars.minLength(r)), !1;
        this.addSuccess(e);
      }
      if (a) {
        if (n.length > a) return this.addError(e, this.vars.minLength(a)), !1;
        this.addSuccess(e);
      }
      'email' == i && this.checkMail(e),
        s &&
        'text' == i &&
        (s.indexOf('phone') > -1 || s.indexOf('email') > -1) &&
        (this.isNumeric(n)
          ? n.length < 9
            ? this.addError(e, this.vars.phone)
            : this.addSuccess(e)
          : s.indexOf('email') > -1
            ? this.checkMail(e)
            : s.indexOf('phone') > -1 && this.addError(e, this.vars.phone)),
        n || t || (this.clearValidation(o), this.resetRequiredClass(o));
    }
  },
  checkMail: function (e) {
    e.val().match(this.patterns.email) ? this.addSuccess(e) : this.addError(e, this.vars.email);
  },
  checkForm: function (e, t) {
    var i, n, o;
    return (
      (i = e.find(
        'input.validate:enabled:visible, textarea.validate:enabled:visible, input.--validate:enabled:visible, textarea.--validate:enabled:visible',
      )),
      e.find('input[type="checkbox"]').not('[disabled]').not(':checked'),
      !0,
      !0,
      (o = this),
      !i.length ||
      (i.each(function () {
        o.validate($(this), !0);
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
      o = !0;
    if (
      ((that = this), this.resetRequiredClass(i), i.length) &&
      (i.each(function () {
        ($this = $(this)),
          (o = !$.trim($this.val())),
          $this.is('[required]') &&
          o &&
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
        var o = e.children().slice(n, n + t);
        o.find(this).length && (o = o.find(this)),
          o.removeAttr('style'),
          o.css('min-height', o.maxHeightO());
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
        disableMobileView: o,
      } = this.params;
      (this.selects = document.querySelectorAll(e)),
        (this.generateDropdownCallback = t),
        (this.clickDropdownCallback = i),
        (this.afterClickDropdownCallback = n),
        (this.disableMobileView = o),
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
              o = e.querySelectorAll('.f-dropdown-item'),
              r = n.getAttribute('data-index'),
              a = n.innerHTML,
              s = e.querySelector('select'),
              l = e.querySelector('button.f-dropdown-toggle'),
              c = l.querySelector('.f-dropdown-button'),
              p = e.querySelector('.f-dropdown-item.--selected');
            o.forEach(e => e.classList.remove('--selected', '--prev')),
              p.classList.add('--prev'),
              n.classList.add('--selected'),
              (s.selectedIndex = r),
              (c.innerHTML = a),
              l.setAttribute('data-indexcurrent', n.getAttribute('data-index')),
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
    o = e % 100,
    r = [];
  return (
    !0 !== i && r.push(e),
    1 === e && t[1]
      ? r.push(t[1])
      : (0 === e || (n >= 0 && n <= 1) || (n >= 5 && n <= 9) || (o > 10 && o < 20)) && t[0]
        ? r.push(t[0])
        : (o < 10 || o > 20) && n >= 2 && n <= 4 && t[2] && r.push(t[2]),
    r.join(' ')
  );
};
const HotspotAjaxInit = function (e) {
  const t = this;
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
        o = `/ajax/hotspots.php?action=get-hotspots-html&zones-names=${n}&components=${n}&zones-types=${[
          ...this.vars.hotspotElements,
        ]
          .map(e => e.getAttribute('data-pagetype'))
          .join(',')}&product=${e}&products=${i.join(';')}`;
      this.vars.hotspotElements.forEach(e => {
        e.classList.add('load-content');
      });
      const r = await this.fetchHotspots(o);
      r
        ? (this.vars.hotspotElements.forEach(e => {
          e.classList.remove('load-content');
        }),
          Object.keys(r).forEach(e => {
            const i = document.getElementById(e);
            '' !== r[e] ? i && (i.outerHTML = r[e]) : i && i.parentNode.removeChild(i),
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
function FixedElement(e = 'element', t = '--fixed', i = 'spacerClass', n = 'top', o = () => { }) {
  const r = this;
  let a = !1;
  const s = document.querySelector(e),
    l = {
      elH: s.getBoundingClientRect().height,
      elOffset: s.getBoundingClientRect().top + s.ownerDocument.defaultView.pageYOffset,
    };
  (this.revalidate = () => {
    l.elH = s.getBoundingClientRect().height;
    const e = document.querySelector(`.${i}`);
    (l.elOffset = e
      ? e.getBoundingClientRect().top + e.ownerDocument.defaultView.pageYOffset
      : s.getBoundingClientRect().top + s.ownerDocument.defaultView.pageYOffset),
      (a = !0);
  }),
    (this.modifyElement = () => {
      (
        'top' === n
          ? window.scrollY > l.elOffset
          : 'bottom' === n
            ? window.scrollY - l.elH + window.screen.height < l.elOffset
            : void 0
      )
        ? !s.classList.contains(t) &&
        (s.classList.add(t),
          (e => {
            let t = document.createElement('div');
            (t.className = i), (t.style.paddingTop = `${e}px`), s.after(t);
          })(l.elH),
          o(!0))
        : s.classList.contains(t) &&
        (s.classList.remove(t),
          (() => {
            const e = document.querySelector(`.${i}`);
            e && e.parentNode.removeChild(e);
          })(),
          o(!1));
    }),
    (this.init = () => {
      if (null === s) return !1;
      window.addEventListener('scroll', () => {
        a = !0;
      }),
        (scroll = setInterval(function () {
          a && ((a = !1), r.modifyElement());
        }, 30)),
        r.modifyElement();
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
        const { element: t, classes: i, id: n, href: o } = e,
          r = document.createElement(t);
        return (
          void 0 !== i && (r.className = i),
          void 0 !== n && (r.id = n),
          void 0 !== o && (r.href = o),
          r
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
          o = this.createElement({ element: 'div', classes: 'modal__content' });
        this.element
          ? this.element instanceof jQuery && this.element.length
            ? (document.body.contains(this.element[0]) &&
              this.element[0].insertAdjacentElement('afterend', i),
              o.appendChild(this.element[0]))
            : this.element instanceof jQuery ||
            (document.body.contains(this.element) &&
              this.element.insertAdjacentElement('afterend', i),
              o.appendChild(this.element))
          : this.html && (o.innerHTML = this.html),
          t.appendChild(n),
          t.appendChild(o),
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
            o = !(
              !document.querySelector('#iai_cookie_wrapper') ||
              document.querySelector('#iai_cookie_wrapper').classList.contains('d-none')
            );
          for (const t of this.notCloseSelectors) if (e.target.closest(t)) return !1;
          return (
            ((i &&
              !i.querySelector('.modal__wrapper').contains(e.target) &&
              !n &&
              !o &&
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
          afterShow: o,
          beforeClose: r,
          afterClose: a,
          notCloseSelectors: s,
        } = this.params;
        (this.element = e || !1),
          (this.html = t || !1),
          (this.beforeShow = n || !1),
          (this.afterShow = o || !1),
          (this.beforeClose = r || !1),
          (this.afterClose = a || !1),
          (this.classList = i || !1),
          (this.notCloseSelectors = s || []),
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
        const o = !e && i,
          r = !o && i,
          a = document.createElement('div');
        a.classList.add('region_forced'),
          (a.innerHTML = `<div class="region_forced__label">\n      <span class="region_forced__label_text">${o ? this.txt.labelZipcode : this.txt.label
            }</span>\n      <strong class="region_forced__label_value">${o ? i : e
            }</strong>\n    </div>\n    <div class="region_forced__body">\n      <div class="region_forced__item --currency">\n        <span classs="region_forced__item_text">${this.txt.currency
            }</span>\n        <strong class="region_forced__item_value">${app_shop?.vars?.currency?.id
            }</strong>\n      </div>\n      <div class="region_forced__item --delivery">\n        <span classs="region_forced__item_text">${o ? this.txt.timeAndCostsZipcode : this.txt.timeAndCosts
            }</span>\n        <strong class="region_forced__item_value">${o ? i : e
            }</strong>\n        ${r
              ? `<span class="region_forced__and_region">${this.txt.andRegion}<strong>${i}</strong></span>`
              : ''
            }\n      </div>\n    </div>\n    <div class="region_forced__buttons">\n      <button class="region_forced__continue btn --solid --large" type="button">${this.txt.continue
            }</button>\n      <a href="#unsetTemporaryRegion" class="region_forced__unset">${o ? this.txt.restoreDefaultZipcode : this.txt.restoreDefault
            }<strong>${o ? n : t}</strong></a>\n    </div>`),
          (this.modal = new Modal({ element: a, classList: '--region-forced' }));
        let s = 'region';
        o && (s = 'zipcode'), r && (s = 'regionAndZipcode'), this.initEvents({ type: s });
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
          { currentCountry: o, defaultCountry: r, showModal: a } = i || {},
          { currentZipcode: s, defaultZipcode: l, showModal: c } = n || {};
        (a || c) &&
          this.create({
            currentCountry: o,
            defaultCountry: r,
            currentZipcode: s,
            defaultZipcode: l,
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
  app_shop.txt.formValidation || (app_shop.txt.formValidation = {}),
  (app_shop.txt.formValidation.mandatoryField = 'ProszÄ wypeĹniÄ to pole.'),
  (app_shop.txt.formValidation.zipcodeFormat =
    'Poprawne formaty kodu pocztowego dla wybranego kraju to [X - cyfra; Y - litera]:'),
  (app_shop.txt.formValidation.characters = 'znakĂłw).'),
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
                o = t.resultsWrapper.querySelector('.search_result__item.--query'),
                r = t.resultsWrapper.querySelector(
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
                  1 !== app_shop.vars.view && o && r && t.updateFocusElement(o);
                  break;
                case 39:
                  1 !== app_shop.vars.view && o && r && t.updateFocusElement(r);
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
        afterBuildResult: o,
        buttonAllClass: r,
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
        (this.afterBuildResult = o || !1),
        (this.buttonAllClass = r || ' btn --outline'),
        this.initEvents();
    }),
    this.init()
  );
}),
  app_shop.run(
    function () {
      $(document).on(
        'click',
        '.open_trigger, #menu_settings li:first-child .form-group:first-child > label',
        function () {
          return $('#menu_settings form').toggleClass('active'), !1;
        },
      ),
        (app_shop.fn.selectPaging = new SelectToDropdown({
          selector: '#menu_settings  select.form-control:not(.f-dropdown)',
          generateDropdownCallback: e => {
            e.classList.remove('form-control');
          },
        }));
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
  (app_shop.fn.basketCacheCallBack = function (e) {
    $('#menu_basket')
      .not('.--hide')
      .hover(function () {
        $('.topBasket__sub').toggleClass('--hover');
      }),
      void 0 !== e.user && (app_shop.vars.user = e.user);
  }),
  (app_shop.txt.txt_76942_summary = ''),
  (app_shop.txt.txt_76942_basket = ''),
  (app_shop.txt.txt_76942_basket_list = '10'),
  (app_shop.txt.txt_76942_basket_hide = '22');
var menu_basket_cache = function (e) {
  app_shop.fn.customBusket ||
    (app_shop.fn.customBusket = function (e) {
      return `\n    <div class="topBasket__row">\n      <a class="topBasket__item --photo" href="${e.link
        }">\n        ${void 0 !== e.icon_second
          ? `<picture>\n            <source type="image/webp" srcset="${e.icon}"/>\n            <img src="${e.icon_second}" alt="${e.name}">\n          </picture>`
          : `<img src="${e.icon}" alt="${e.name}">`
        }\n      </a>\n      <a class="topBasket__item --name" href="${e.link
        }">\n        <span class="topBasket__name">${e.name}</span>\n        ${'uniw' != e.size ? '<span class="topBasket__size">' + e.size_name + '</span>' : ''
        }${e.product_version_name
          ? '<span class="topBasket__version">' + e.product_version_name + '</span>'
          : ''
        }\n      </a>\n      <span class="topBasket__item --sum">\n        <span class="value">${e.count
        }</span>\n        <span class="unit">${e.worth_unit
        }</span>\n      </span>\n      <span class="topBasket__item --prices">${'net' === app_shop.vars.priceType
          ? e.prices.worth_net_formatted
          : e.prices.worth_gros_formatted
        }</span>\n    </div>`;
    }),
    app_shop.fn.basketCacheCallBack ||
    (app_shop.fn.basketCacheCallBack = function () {
      $('#menu_basket')
        .not('.--hide')
        .hover(function () {
          $('.topBasket__sub').toggleClass('--hover');
        });
    }),
    $.ajax({
      type: 'GET',
      url: '/ajax/basket.php?&getAjax=true',
      dataType: 'JSON',
      success: function (e) {
        if (
          (0 == (e = e.basket).products.length && $('#menu_basket').addClass('--hide'),
            e.products.length >= parseFloat(app_shop.txt.txt_76942_basket_list) &&
            ($('.topBasket__details.--products').addClass('--list'),
              $('#menu_basket').removeClass('--hide')),
            e.products.length > parseFloat(app_shop.txt.txt_76942_basket_hide) &&
            $('#menu_basket').addClass('--hide'),
            $('#menu_basket .topBasket__price').html(
              'net' === app_shop.vars.priceType ? e.worth_net_formatted : e.worth_formatted,
            ),
            e.productsCounter > 0
              ? $('#menu_basket .badge').html(e.productsCounter)
              : $('#menu_basket .badge').html(''),
            $('#menu_basket #shipppingCost').text(
              'net' === app_shop.vars.priceType
                ? e.shippingCost_net_formatted
                : e.shippingCost_formatted,
            ),
            $('#freeShipping').length > 0 && 0 == parseFloat(e.toShippingFree)
              ? $('#freeShipping').addClass('--active')
              : $('#freeShipping').length > 0 &&
              parseFloat(e.toShippingFree) >= 0 &&
              $('#freeShipping').removeClass('--active'),
            0 != e.products.length)
        ) {
          let t = '';
          const n = [...e.products];
          for (i in e.products) t += app_shop.fn.customBusket(n[i]);
          $('.topBasket__block.--products').html(t);
          e.products.filter(e => '' === e.name).length &&
            document.getElementById('menu_basket').classList.add('--oneclick-hide');
          e.products.filter(e => '0' !== e.subscription_period).length &&
            document.getElementById('menu_basket').classList.add('--oneclick-hide');
        } else $('.topBasket__details').hide();
        $('.topBasket__details').removeAttr('style'),
          $('.topBasket').removeClass('--skeleton'),
          window.screen.width < 979 && $('topBasket__details').remove(),
          app_shop.fn.basketCacheCallBack(e);
      },
    }),
    e &&
    iaiGet.wishlist(function (e) {
      if (!e.Wishlist.response.attributes) return !1;
      var t = $('#menu_basket .wishes_link span.hidden-phone'),
        i = t.text(),
        n = e.Wishlist.response.attributes.count;
      t.text(i.replace(/\(.{1,3}\)/, '(' + n + ')')),
        t.next('.badge').remove(),
        n > 0 && t.after('<span class="badge badge-important visible-phone">' + n + '</span>');
    });
};
(app_shop.fn.sesion2link = function () {
  var e = $.cookie('client'),
    t = new RegExp('[\\?&]client=([^&#]*)');
  if (
    !e ||
    $.isEmptyObject(app_shop.vars.sites) ||
    !app_shop.vars.session_share ||
    'true' != app_shop.vars.session_share
  )
    return !1;
  $('a[href*="http://"],a[href*="https://"],a[href^="//"]').each(function () {
    if (-1 != $.inArray(this.hostname, app_shop.vars.sites)) {
      var i = $(this).get(0),
        n = i.href;
      null == t.exec(n) &&
        (-1 != n.indexOf('?') ? (i.pathname += '&client=' + e) : (i.pathname += '?client=' + e));
    }
    // nowa linijka test
  });
}),
  app_shop.run(function () {
    app_shop.vars.cache_html ? menu_basket_cache(!0) : menu_basket_cache(!1),
      $('.topBasket__price').removeAttr('style');
  }, 'all');
var submenuWidth = '200',
  dlmenu_showmore = '1',
  dlmenu_shownumber = '10',
  dlmenu_columnHeight = '320',
  dlmenu_columnConcat = '1',
  dlmenu_padding = '30',
  dlmenu_columns = '5',
  dlmenu_wide = 'true';
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
  // $(document).on('click', '.navbar-toggler', function (e) {
  //   return (
  //     e.preventDefault(),
  //     $('html').hasClass('filters_open') || $('html').hasClass('sidebar_open')
  //       ? ($('html').removeClass('filters_open').removeClass('sidebar_open'),
  //         $('header .handler[data-item="menu_search"]').before($('#menu_search')),
  //         $('header .handler[data-item="menu_search"]').remove())
  //       : ($('html').addClass('sidebar_open'),
  //         $('#menu_search').before(
  //           '<del class="handler" data-item="menu_search" style="display:none"></del>',
  //         ),
  //         'object' == typeof app_shop.fn.shoppingList
  //           ? $('aside .setMobileGrid[data-item="#menu_navbar"]').before($('#menu_search'))
  //           : $('aside .setMobileGrid[data-item="#menu_navbar"]').after($('#menu_search'))),
  //     $('aside .navbar-subnav, aside .navbar-subsubnav, aside, #menu_settings form').scrollTop(0),
  //     app_shop.fn.mobileGen(),
  //     app_shop.fn.setMobileCategories && app_shop.fn.setMobileCategories(),
  //     !1
  //   );
  // }),
  $(document).on('click', '.navbar-toggler', function (e) {
    e.preventDefault();

    const html = $('html');
    const menuSearch = $('#menu_search');

    if (html.hasClass('filters_open') || html.hasClass('sidebar_open')) {
      html.removeClass('filters_open sidebar_open');
      $('body').removeClass('mobile_menu_open');
      $('header .handler[data-item="menu_search"]').before(menuSearch);
      $('header .handler[data-item="menu_search"]').remove();
    } else {
      html.addClass('sidebar_open');
      $('body').addClass('mobile_menu_open');
      menuSearch.before('<del class="handler" data-item="menu_search" style="display:none"></del>');

      if (typeof app_shop.fn.shoppingList === 'object') {
        $('aside .setMobileGrid[data-item="#menu_navbar"]').before(menuSearch);
      } else {
        $('aside .setMobileGrid[data-item="#menu_navbar"]').after(menuSearch);
      }
    }

    $('aside .navbar-subnav, aside .navbar-subsubnav, aside, #menu_settings form').scrollTop(0);
    app_shop.fn.mobileGen();

    if (app_shop.fn.setMobileCategories) {
      app_shop.fn.setMobileCategories();
    }

    return false;
  });

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
      $('html').removeClass('sidebar_open filters_open');
      $('.nav-open').removeClass('nav-open');
      $('#menu_settings form').removeClass('active');
      $('header .handler[data-item="menu_search"]').before($('#menu_search'));
      $('header .handler[data-item="menu_search"]').remove();
      $('#menu_search').hide(); // Ukryj pasek wyszukiwania
      if (app_shop.fn.setMobileCategories) {
        app_shop.fn.setMobileCategories();
      }
      e.preventDefault();
      return false;
    },
  );
app_shop.run(
  function () {
    console.log('moja funkcja')
  });

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
        // szuba 20-11-2023
        // search page
        // switch + filters dropdown;



        // Event listener dla zmiany stanu przełącznika
        $('#switch').on('change', function () {
          console.log('switched from main.js', $(this).is(':checked'));
          if ($(this).is(':checked')) {
            // Gdy przełącznik jest w pozycji "on"
            console.log("🚀 ~ file: main.js:16171 ~ on")
            $('#produkty').css('color', 'black');
            $('#smaki').css('color', 'orange');
            $('.graph-background').show();
            $('picture').hide();
          } else {
            // Gdy przełącznik jest w pozycji "off"
            console.log("🚀 ~ file: main.js:16176 ~ off:")
            $('#produkty').css('color', 'orange');
            $('#smaki').css('color', 'black');
            $('.graph-background').hide();
            $('picture').show();
          }
        }),


        // mega menu szuba
        $('.nav-item.mega-menu-content-category').on('mouseover', function () {
          const title = $(this).find('a').attr('title');
          console.log("🚀 ~ file: main.js:16101 ~ title:")
          const imgNum = $(this).find('a').data('img-num');

          $('#mega-menu-content').html(
            `<li class="bg-danger"><a href="#" class="bg-danger">${title}</a></li>`,
          );
          const newImageSrc = `./img/kawa-zdj-${imgNum}.jpg`;
          $('.mega-menu-photo img').attr('src', newImageSrc);
        }),
        $('.nav-item.mega-menu-content-category').on('mouseleave', function () {
          $('#mega-menu-content').empty();
          $('.mega-menu-photo img').attr('src', './img/Kawa.jpg');
        }),
        $('#mega-menu-content')
          .html(`<li class="bg-danger"><a href="#" class="bg-danger">${title}</a></li>`)
          .on('mouseleave', function () {
            // Gdy opuścimy element 'nav-item' myszką, usuniemy zawartość z 'mega-menu-content'
            $('#mega-menu-content').empty();
          }),
        $('.navbar-subnav').removeClass('--hover'),
        // Dodatkowo, jeśli chcesz usunąć klasę '--hover' z poprzednio najechanego elementu
        // i dodać ją do aktualnie najechanego elementu, możesz użyć poniższej logiki
        $('.nav-item.mega-menu-content-category').on('mouseover', function () {
          $('.navbar-subnav').removeClass('--hover');
          $(this).closest('.navbar-subnav').addClass('--hover');
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
                o = e.next().height();
              !e.hasClass('nav-merge') && (n = e.height()),
                !e.next().hasClass('nav-merge') && (o = e.next().height()),
                e.hasClass('--all') && (i = 0),
                n < i && o + n < i
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
            let o = t - (i.width() + n),
              r = n - -1 * o;
            (r = o > 0 ? n : r), i.css('left', r + 'px');
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
    function () {
      $('header').append($('.breadcrumbs'));
    },
    [3, 4],
    '.breadcrumbs',
  ),
  app_shop.run(
    function () {
      $('#layout').prepend($('.breadcrumbs'));
    },
    [1, 2],
    '.breadcrumbs',
  ),
  app_shop.run(
    function () {
      $('.breadcrumbs').on('click', '#back_button', function () {
        return window.history.back(), !1;
      });
    },
    'all',
    '.breadcrumbs',
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
  });
const filtersActionsCall = () => {
  $('.filters__options .--show-hidden').on('click', function () {
    const e = $(this).data('id');
    return $(`#${e}_content`).toggleClass('--shown'), $(this).toggleClass('--shown'), !1;
  }),
    $('.filters__toggler:not(.--not-expandable)').on('click', function () {
      const e = $(this).data('id');
      return $(`#${e}_expand`).slideToggle('fast'), $(this).toggleClass('--not-expanded'), !1;
    }),
    $('.filters__item .f-control[type=checkbox]').on('change', function () {
      const e = $(this)
        .parents('.filters__content:not(.--group)')
        .siblings()
        .find('.--submit.d-none');
      e.length && e.removeClass('d-none');
    }),
    $('#PriceRangeFrom, #PriceRangeTo').on('keyup', function () {
      const e = $(this),
        t = $(this).parent(),
        i = e.val();
      e.val(e.val().replace(/[^0-9]/g, ''));
      const n = $.fn.textWidth(i, '14px Arial');
      n > t.width() - 30 ? e.width(t.width() - 30) : e.width(n + 10);
    }),
    $('#PriceRangeFrom, #PriceRangeTo').keyup(),
    $('#filter_xpress_expand input').on('change', function (e) {
      e.stopPropagation();
      const t = $(this);
      (app_shop.vars.clickedXPRESS = t.attr('name').split('_')[1]),
        t.is(':checked') &&
        'false' === t.attr('data-localized') &&
        Modal({ html: $('#xpress_toplayer').html(), classList: 'xpress_zipcode_verification' });
    });
  document.querySelector('.filters__form').addEventListener('submit', function (e) {
    const t = document.querySelector('#PriceRangeFrom'),
      i = document.querySelector('#PriceRangeTo');
    if (parseFloat(t?.value) > parseFloat(i?.value))
      return (
        e.preventDefault(), document.querySelector('.filters__price').classList.add('has-error'), !1
      );
  });
};
app_shop.run(
  function () {
    app_shop.vars.filtersRef = new Filters({
      funcActionCall: filtersActionsCall,
      getQuantity: app_shop.vars.getQuantity || !0,
    });
  },
  'all',
  '#Filters',
  !0,
),
  app_shop.run(
    function () {
      app_shop.fn.xpressCouriersInit();
    },
    'all',
    '#xpress_toplayer',
    !0,
  );
const xpress_txt = {};
function simple_tooltip(e, t, i) {
  var n = '',
    o = '';
  $(document).on('mouseover', e, function () {
    $(this).next().is('.tooltipContent')
      ? (n = $(this).next().html())
      : $(this).prop('title') && ((n = $(this).prop('title')), $(this).removeAttr('title')),
      $('#' + t).remove(),
      clearTimeout(o),
      $('body').append("<div style='display:none;' class='" + t + "' id='" + t + "'><p></p></div>"),
      $('#' + t).hover(
        function () {
          clearTimeout(o);
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
        o,
        r = $(window).scrollTop(),
        a = $(window).width(),
        s = 15;
      i || !1
        ? ((n =
          e.pageX - $('#' + t).outerWidth(!0) - s <= 0
            ? e.pageX + s
            : e.pageX - s - $('#' + t).outerWidth(!0)),
          (o =
            r + 30 >= e.pageY - $('#' + t).height()
              ? r + s
              : e.pageY - $('#' + t).outerHeight(!0) - s))
        : ((n = a - 30 >= $('#' + t).width() + e.pageX ? e.pageX + s : a - $('#' + t).width() - s),
          (o =
            r + 30 >= e.pageY - $('#' + t).height() ? r + s : e.pageY - $('#' + t).height() - s)),
        $('#' + t).css({ left: n, top: o });
    }),
    $(document).on('mouseout', e, function () {
      $(this).next().is('.tooltipContent') || $(this).prop('title', n),
        (o = setTimeout(function () {
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
(xpress_txt.zipcode_invalid = 'Podany kod pocztowy jest nieprawidĹowy.'),
  (xpress_txt.localization = 'Lokalizacja'),
  (xpress_txt.courier_not_available =
    'Przykro nam, ale nasz ekspresowy kurier nie obsĹuguje tej okolicy. '),
  (xpress_txt.courier_not_available2 =
    'Twoje zamĂłwienie zostanie dostarczone w standardowym czasie, a kuriera wybierzesz podczas skĹadania zamĂłwienia.'),
  (xpress_txt.courier_not_available3 = 'OK'),
  (xpress_txt.ajax_error = 'WystÄpiĹ nieoczekiwany bĹÄd. ProszÄ sprĂłbowaÄ ponownie. '),
  (xpress_txt.geolocation_error =
    'WystÄpiĹ bĹÄd poczas sprawdzania kodu pocztowego. ProszÄ sprĂłbowaÄ ponownie.'),
  (xpress_txt.geolocation_error2 = 'Nie moĹźna pobraÄ kodu pocztowego. '),
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
    function () {
      $('.footer_links_label:not(:only-child)').on('click', function (e) {
        return (
          e.preventDefault(),
          $(this).next().slideToggle('fast'),
          $(this).parents('.footer_links').toggleClass('--open'),
          !1
        );
      }),
        $('#footer_links .footer_links#menu_orders').addClass('--open');
    },
    '1',
    '.footer_links_label',
  ),
  app_shop.run(
    function () {
      $('.footer_links_label').off('click'), $('.footer_links_label').next().show();
    },
    [2, 3, 4],
    '.footer_links_label',
  ),
  app_shop.run(
    function () {
      $('.footer_links_sub a').on({
        mouseenter() {
          const e = $(this).find('img');
          e.data('onmouseover') &&
            (e.attr('data-tmp_img', e.attr('src')), e.attr('src', e.data('onmouseover')));
        },
        mouseleave() {
          const e = $(this).find('img'),
            t = e.data('tmp_img');
          t && (e.attr('src', t), e.removeAttr('data-tmp_img'));
        },
      });
    },
    'all',
    '.footer_links',
  ),
  app_shop.fn.rwdBanner('.platnosci_54388', [1, 2, 3, 4]),
  app_shop.run(function () {
    simple_tooltip('.showTip', 'n59581_tooltip_dictionary'),
      simple_tooltip('#contentcolumn_order1 .showTip_order1', 'n59581_tooltip'),
      simple_tooltip('#basketedit_gifts .showTip_gift', 'n59581_tooltip'),
      simple_tooltip('#basketedit_productslist .showTip_basket', 'n59581_tooltip'),
      simple_tooltip('span.btn_note', 'n59581_instalment_note');
  }, 'all');
var iaical_dateFormat = 'yy-mm-dd',
  iaical_firstDay = '1';
(days_01_txt = 'n'),
  (days_02_txt = 'pn'),
  (days_03_txt = 'wt'),
  (days_04_txt = 'Ĺr'),
  (days_05_txt = 'czw'),
  (days_06_txt = 'pt'),
  (days_07_txt = 'so'),
  (month_01_txt = 'StyczeĹ'),
  (month_02_txt = 'Luty'),
  (month_03_txt = 'Marzec'),
  (month_04_txt = 'KwiecieĹ'),
  (month_05_txt = 'Maj'),
  (month_06_txt = 'Czerwiec'),
  (month_07_txt = 'Lipiec'),
  (month_08_txt = 'SierpieĹ'),
  (month_09_txt = 'WrzesieĹ'),
  (month_10_txt = 'PaĹşdziernik'),
  (month_11_txt = 'Listopad'),
  (month_12_txt = 'GrudzieĹ'),
  (month_2_01_txt = 'Stycznia'),
  (month_2_02_txt = 'Lutego'),
  (month_2_03_txt = 'Marca'),
  (month_2_04_txt = 'Kwietnia'),
  (month_2_05_txt = 'Maja'),
  (month_2_06_txt = 'Czerwca'),
  (month_2_07_txt = 'Lipca'),
  (month_2_08_txt = 'Sierpnia'),
  (month_2_09_txt = 'WrzeĹnia'),
  (month_2_10_txt = 'PaĹşdziernika'),
  (month_2_11_txt = 'Listopada'),
  (month_2_12_txt = 'Grudnia'),
  (month_3_01_txt = 'STY'),
  (month_3_02_txt = 'LUT'),
  (month_3_03_txt = 'MAR'),
  (month_3_04_txt = 'KWI'),
  (month_3_05_txt = 'MAJ'),
  (month_3_06_txt = 'CZE'),
  (month_3_07_txt = 'LIP'),
  (month_3_08_txt = 'SIE'),
  (month_3_09_txt = 'WRZ'),
  (month_3_10_txt = 'PAĹš'),
  (month_3_11_txt = 'LIS'),
  (month_3_12_txt = 'GRU'),
  (iaical_monthNext = 'NastÄpny miesiÄc'),
  (iaical_monthPrev = 'Poprzedni miesiÄc');
var iaical_daysShort = [
  days_01_txt,
  days_02_txt,
  days_03_txt,
  days_04_txt,
  days_05_txt,
  days_06_txt,
  days_07_txt,
],
  iaical_monthNames = [
    month_01_txt,
    month_02_txt,
    month_03_txt,
    month_04_txt,
    month_05_txt,
    month_06_txt,
    month_07_txt,
    month_08_txt,
    month_09_txt,
    month_10_txt,
    month_11_txt,
    month_12_txt,
  ],
  iaical_monthNames2 = [
    month_2_01_txt,
    month_2_02_txt,
    month_2_03_txt,
    month_2_04_txt,
    month_2_05_txt,
    month_2_06_txt,
    month_2_07_txt,
    month_2_08_txt,
    month_2_09_txt,
    month_2_10_txt,
    month_2_11_txt,
    month_2_12_txt,
  ],
  iaical_shortNames = [
    month_3_01_txt,
    month_3_02_txt,
    month_3_03_txt,
    month_3_04_txt,
    month_3_05_txt,
    month_3_06_txt,
    month_3_07_txt,
    month_3_08_txt,
    month_3_09_txt,
    month_3_10_txt,
    month_3_11_txt,
    month_3_12_txt,
  ],
  shopCalendar = {
    getMonthDays: function (e, t) {
      return new Date(e, t, 0).getDate();
    },
    printDays: function (e, t, i, n, o, r, a) {
      var s = window.Working_days || {},
        l = new Date(i, t - 1, e);
      l.setDate(l.getDate() + parseInt(n)),
        $('#pickupl_calbind').length &&
        $('#pickupl_calbind').datepicker({ defaultDate: l, minDate: l }),
        $(o + '1').length && document.getElementById(o + '1').onclick();
      for (var c = 1; c <= r; c++) {
        for (
          _year = l.getFullYear(), _month = l.getMonth() + 1, _day = l.getDate();
          a && Holidays[_day + '_' + _month + '_' + _year];

        )
          l.setDate(l.getDate() + 1),
            (_year = l.getFullYear()),
            (_month = l.getMonth() + 1),
            (_day = l.getDate());
        var p = 100;
        if (!$.isEmptyObject(s))
          for (; --p;) {
            if (-1 != $.inArray(l.getDay(), s)) {
              (_year = l.getFullYear()), (_month = l.getMonth() + 1), (_day = l.getDate());
              break;
            }
            l.setDate(l.getDate() + 1);
          }
        (_month = _month < 10 ? '0' + _month : _month),
          (_day = _day < 10 ? '0' + _day : _day),
          p
            ? ($('#' + o + c + ' input').val([_year, _month, _day].join('-')),
              $('#' + o + c + ' > div > *')
                .eq(1)
                .html(_day),
              $('#' + o + c + ' > div > *')
                .eq(2)
                .html(iaical_monthNames2[parseInt(_month) - 1]))
            : ($('#' + o + c + ' input').val('-'),
              $('#' + o + c + ' > div > *')
                .eq(1)
                .html('-'),
              $('#' + o + c + ' > div > *')
                .eq(2)
                .html('')),
          l.setDate(l.getDate() + 1);
      }
    },
    setHolidays: function (e) {
      var t = window.Holidays || {},
        i = window.Working_days || {};
      if (null != t)
        for (holiday in t)
          if (e.getDate() + '_' + (e.getMonth() + 1) + '_' + e.getFullYear() == holiday)
            return [!1, ''];
      if (null != i && i.length) {
        var n = e.getDay();
        if (-1 == $.inArray(n, i)) return [!1, ''];
      }
      return [!0, ''];
    },
  };
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
      o = $('.basket__item.--actions.--active, .basket__item.--actions.--active-comment'),
      r = $('.basket__form');
    switch (t) {
      case '#showActions':
        (!i.hasClass('--special') || i.hasClass('--special_quantity')) &&
          (n.toggleClass('--active'), e.toggleClass('--open'));
        break;
      case '#editComment':
        app_shop.vars.view < 3
          ? n.addClass('--active --active-comment')
          : (o.not(n).removeClass('--active-comment'), n.toggleClass('--active-comment'));
        break;
      case '#addComment':
        o.not(n).removeClass('--active-comment'), n.toggleClass('--active-comment');
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
          o =
            '#delQuantity' === t
              ? parseFloat(e.val()) - parseFloat(n)
              : parseFloat(e.val()) + parseFloat(n);
        e.val(o).change(), e.keyup();
        break;
      }
      case '#remove':
        i.find('.quantity__input').val(0), r.submit();
        break;
      case '#removeAll':
        $('.basket__action .quantity__input').val(0), r.submit();
        break;
      case '#removeSelected':
        $('.basket__product_checkbox').each(function () {
          $(this).is(':checked') &&
            $('.basket__block[data-product-checkbox-id="' + $(this).val() + '"]')
              .find('.quantity__input')
              .val(0);
        }),
          r.submit();
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
      const o = t.parents('.basket__block').attr('data-product-id'),
        r = t.parents('.basket__block').attr('data-product-size');
      $('.basket__block').each(function () {
        $(this).attr('data-product-id') == o &&
          $(this).attr('data-product-size') == r &&
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
      orderTxt.week3, orderTxt.week1, orderTxt.week2;
      const e = [orderTxt.days, orderTxt.day, orderTxt.days],
        t = $('.basket__division').data('weeks'),
        i = $('.basket__division').data('days'),
        n = $('.basket__division').data('week_day'),
        o = $('.basket__division').data('today');
      0 === parseInt(t, 10)
        ? ($('.basket__division_literal').hide(),
          o
            ? $('strong.basket__division_weeks').html(orderTxtShipping[0])
            : $('strong.basket__division_weeks').html(orderTxtShipping[parseInt(n, 10)]))
        : $('strong.basket__division_weeks').html(
          app_shop.fn.changeLiteral(parseInt(i, 10), e, !1),
        ),
        $('input[name="allow_division_order"]').on('change', function () {
          $(this).parents('form').submit();
        });
    },
    'all',
    '.basket__division',
  ),
  app_shop.run(
    function () {
      document.querySelectorAll('.basketedit_oneclick__item').forEach(e => {
        if (
          'undefined' != typeof expressCheckoutApi &&
          'function' == typeof expressCheckoutApi.basketCheckout
        ) {
          const t = e.getAttribute('data-id');
          expressCheckoutApi.basketCheckout(t, e);
        }
      });
    },
    'all',
    '.basketedit_oneclick__item',
  );
var basket_gross_txt = ' brutto';
function countAnnuityEraty(e, t, i) {
  window.open(
    'https://www.eraty.pl/symulator/oblicz.php?numerSklepu=' +
    e +
    '&wariantSklepu=' +
    t +
    '&typProduktu=0&wartoscTowarow=' +
    i,
    'count_zagiel',
    'width=630,height=500,directories=no,location=no,menubar=no,resizable=yes,scrollbars=yes,status=no,toolbar=no',
  );
}
function init_basketedit_summary() {
  $('div.n68242_instalment_wrapper_close').click(function () {
    $('div.n68242_instalment_list').hide();
  }),
    $('a.n68242_instalment_button').click(function () {
      return (
        parseInt($(this).attr('data-bankcount')) > 1
          ? $('#n66734_instalment div.n68242_instalment_list').toggle()
          : 1 == parseInt($(this).attr('data-bankcount')) &&
          (cena_raty > 0
            ? $('a.n68242_single_instalment_action').click()
            : $('#n66734_instalment div.n68242_instalment_list').show('fast')),
        !1
      );
    }),
    $('a.n68242_single_instalment').click(function () {
      return (
        cena_raty > 0
          ? $('a.n68242_single_instalment_action').click()
          : $('#n66734_instalment div.n68242_instalment_list').toggle('fast'),
        !1
      );
    }),
    $('div.basketedit_calculations').children().length < 3 &&
    $('div.basketedit_calculations').hide(),
    $('#basket_go_next, #basket_go_next_phone').on('click', function () {
      return (
        $(this).attr('data-disabled') ||
        ($('form.basket__form , form.basketedit_productslist').append(
          '<input type="hidden" name="after_basket_change" value="order"/>',
        ),
          $('form.basket__form , form.basketedit_productslist').submit()),
        !($('form.basket__form').length > 0 || $('form.basketedit_productslist').length > 0)
      );
    });
}
function setGiftsItems() {
  function e() {
    $.each($('#basketedit_gifts li.gift_enable'), function () {
      $(this).removeClass('gift_active'),
        $(this).find('input[type=radio]').removeAttr('checked'),
        $('.basket__gift_inputs input[name="set_quantity[0]"]').val(0),
        $(this).find('input[name="set_quantity[0]"]').val(0),
        $(this).find('#your_gift_txt').remove();
    }),
      $('.basket__form').submit();
  }
  $('div.gift_tooltip div.gift_choose').click(function (t) {
    e(),
      $(this).parents('.gift_enable').addClass('gift_active'),
      $(this).parents('.gift_enable').find('input[type=radio]').attr('checked', !0),
      $(this).parents('.gift_enable').find('input[name="set_quantity[0]"]').val(1),
      $('.basket__gift_inputs').remove(),
      $('form.basketedit_productslist').length
        ? $('<div class="basket__gift_inputs d-none"></div>').appendTo(
          'form.basketedit_productslist',
        )
        : $('<div class="basket__gift_inputs d-none"></div>').appendTo('form.basket__form'),
      $(this)
        .parents('.gift_enable')
        .find('input[type=hidden]')
        .clone()
        .appendTo('.basket__gift_inputs'),
      $('div.gift_tooltip').hide(),
      $('.basket__form').submit(),
      t.stopImmediatePropagation();
  }),
    $('div.gift_tooltip div.gift_resign').click(function (t) {
      e(), $('div.gift_tooltip').hide(), t.stopImmediatePropagation();
    }),
    $.each($('#basketedit_gifts li.gift_enable'), function () {
      $(this).find('div.gift_tooltip');
      $(this).find('div.gift_tooltip').length
        ? $(this).click(function () {
          $(this).hasClass('gift_active')
            ? ($(this).find('div.gift_choose').hide(), $(this).find('div.gift_resign').show())
            : ($(this).find('div.gift_choose').show(), $(this).find('div.gift_resign').hide()),
            $('#basketedit_gifts li.gift_enable').not(this).find('div.gift_tooltip').hide(),
            $(this).find('div.gift_tooltip').toggle();
        })
        : $(this).click(function () {
          $(this).is('.gift_active')
            ? e()
            : (e(),
              $(this)
                .addClass('gift_active')
                .find('h3')
                .prepend('<div id="your_gift_txt">' + twoj_prezent_txt),
              $(this).find('input[type=radio]').attr('checked', !0),
              $(this).parents('.gift_enable').find('input[name="set_quantity[0]"]').val(1),
              $('.basket__gift_inputs').remove(),
              $('form.basketedit_productslist').length
                ? $('<div class="basket__gift_inputs d-none"></div>').appendTo(
                  'form.basketedit_productslist',
                )
                : $('<div class="basket__gift_inputs d-none"></div>').appendTo(
                  'form.basket__form',
                ),
              $(this).find('input[type=hidden]').clone().appendTo('.basket__gift_inputs'));
        });
    }),
    $('#basketedit_gifts li.gift_enable select').click(function (e) {
      $('#basketedit_gifts li.gift_enable').removeClass('gift_active'),
        $(this).parents('li').addClass('gift_active'),
        $(this).parents('li').find('input[type=radio]').attr('checked', !0),
        $('.basket__gift_inputs').remove(),
        $('form.basketedit_productslist').length
          ? $('<div class="basket__gift_inputs d-none"></div>').appendTo(
            'form.basketedit_productslist',
          )
          : $('<div class="basket__gift_inputs d-none"></div>').appendTo('form.basket__form'),
        $(this).parents('li').find('input[type=hidden]').clone().appendTo('.basket__gift_inputs'),
        $(this).parents('.gift_enable').hasClass('gift_active')
          ? ($(this).parents('.gift_enable').find('div.gift_choose').hide(),
            $(this).parents('.gift_enable').find('div.gift_resign').show())
          : ($(this).parents('.gift_enable').find('div.gift_choose').show(),
            $(this).parents('.gift_enable').find('div.gift_resign').hide()),
        e.stopImmediatePropagation();
    }),
    $('#basketedit_gifts li.gift_enable select').change(function () {
      $('#basketedit_gifts li.gift_enable').removeClass('gift_active'),
        $(this).next().val($(this).val()),
        $('.basket__gift_inputs').remove(),
        $('form.basketedit_productslist').length
          ? $('<div class="basket__gift_inputs d-none"></div>').appendTo(
            'form.basketedit_productslist',
          )
          : $('<div class="basket__gift_inputs d-none"></div>').appendTo('form.basket__form'),
        $(this).parents('li').find('input[type=hidden]').clone().appendTo('.basket__gift_inputs');
    });
}
app_shop.run(
  function () {
    init_basketedit_summary();
  },
  'all',
  '.basketedit_summary_container',
),
  app_shop.run(
    function () {
      $('#basketedit_gifts').on('click', '.basketedit_gifts_btn', function () {
        $('div.basketedit_gifts_wrapper').toggle(),
          $(this).toggleClass('active'),
          $('#basketedit_gifts')
            .find('.gift_item_icon')
            .css(
              'height',
              $('.basketedit_gifts_wrapper > ul > li').find('.gift_item_icon').maxHeight(),
            );
      }),
        $(function () {
          $('#basketedit_gifts')
            .find('.gift_item_icon')
            .css(
              'height',
              $('.basketedit_gifts_wrapper > ul > li').find('.gift_item_icon').maxHeight(),
            );
        });
    },
    'all',
    '#basketedit_gifts',
  ),
  $(function () {
    $('#a_change_code').click(function () {
      return $('#change_code').toggle(), !1;
    }),
      $('#a_remove_code').click(function () {
        return $('input.basketedit_rebatecode_input').val(' '), $('#change_code').submit(), !1;
      });
  }),
  (twoj_prezent_txt = 'TWĂJ PREZENT:'),
  app_shop.run(
    function () {
      setGiftsItems();
    },
    'all',
    '#basketedit_gifts',
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
        o = e;
      ($selectValue = n.val()),
        ($selectName = n.attr('name')),
        ($labelName = ''),
        n.data('label') && ($labelName = '<b>' + n.data('label') + '</b>'),
        ($ul = $(
          '<div class="dropdown dropdownsearching form-group ' +
          n.attr('class') +
          '"><ul class="dropdown-menu" aria-labelledby="' +
          t +
          o +
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
            o +
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
  $(function () {
    $('.article_wrapper .datasquare').each(function () {
      var e = $(this),
        t = app_shop.fn.news_data({
          data: e.text(),
          month_names: iaical_shortNames,
          format: '<div>%d</div><span>%m</span>',
        });
      t && e.html(t);
    });
  }),
  app_shop.run(
    function () {
      app_shop.fn.categoryDivider('.navigation_desc.--top .navigation_desc__wrapper');
    },
    'all',
    '.navigation_desc.--top',
  ),
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
  ),
  app_shop.run(
    function () {
      app_shop.fn.categoryDivider('.navigation_desc.--bottom .navigation_desc__wrapper');
    },
    'all',
    '.navigation_desc.--bottom',
  ),
  app_shop.run(
    function () {
      $('.news__date').each(function () {
        const e = $(this),
          t = app_shop.fn.news_data({
            data: e.text(),
            month_names: iaical_shortNames,
            format: '<div>%d %m</div><span>%y</span>',
          });
        t && e.html(t);
      });
    },
    'all',
    '.news__date',
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
        o = $('.shipping_time_division').data('today');
      0 === parseInt(t, 10)
        ? ($('.order2__division_literal').hide(),
          o
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
        let o = new Image();
        return (
          (o.src = i),
          (o.onload = function () {
            Modal({
              html: `<div id="ui-dialogimg"><img alt="${n}" src="${i}" /></div>`,
              classList: '--medium',
            });
          }),
          (o.onerror = function () {
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
  );
var pickupl_animspeed = 500,
  pickupl_alert = 'Nie wybrano punktu odbioru',
  pickupl_alertPoczta = 'Nie wybrano urzÄdu pocztowego',
  pickupl_linktxt = 'wiÄcej informacji',
  pickupl_linktitle = 'Zobacz szczegĂłĹowe informacje',
  pickupl_requires_client_number = 'Nie wprowadzono numeru klienta w systemie kuriera.',
  pickupl_select_adress = 'Wpisz poprawny adres.',
  pickupl_select_route = 'Wpisz nazwÄ miasta',
  pickupl_nopoints = 'Wpisz inny adres, brak punktĂłw odbioru.',
  pickupl_error = 'WystÄpiĹ bĹÄd. ProszÄ odĹwieĹźyÄ stronÄ i sprĂłbowaÄ ponownie',
  pickupl_nopoints_in_area = 'Nie znaleziono punktĂłw odbioru na danym obszarze. ',
  stocks_list_more_txt = '',
  stocks_list_on_map_txt = '';
if (void 0 === selected_pickup_point) var selected_pickup_point = {};
app_shop.run(
  function () {
    void 0 !== app_shop.fn.fixedElement &&
      ((app_shop.fn.fixedElement = new FixedElement(
        '.pickupl_submit',
        '--fixed',
        'pickuplSpacer',
        'bottom',
      )),
        app_shop.fn.fixedElement.init());
  },
  [1, 2],
  '#pickup_site',
);
var txt_62619_label = 'WpĹaty ',
  txt_62619_wybrales_curr = 'WybraĹeĹ',
  txt_62619_wybrales = 'WybraĹeĹ, ale zrezygnowaĹeĹ z pĹatnoĹci',
  txt_62619_nakwote = ' na kwotÄ ',
  txt_62619_wybrales2_curr = '',
  txt_62619_wybrales2 = 'Wybrano',
  txt_62619_jako = ' jako formÄ pĹatnoĹci. ',
  txt_62619_jako_zwrot = ' jako formÄ zwrotu.',
  txt_62619_kwota = 'Kwota do wpĹaty to ',
  txt_62619_kwota_zwrot = ' Kwota do zwrotu to ',
  txt_62619_auto = '<br/>WpĹata zostanie zaksiÄgowana <b>automatycznie</b>.',
  txt_62619_dokoncz = '',
  txt_62619_title = 'JeĹźeli proces opĹacania zostaĹ przerwany, ponĂłw tÄ pĹatnoĹÄ.',
  txt_62619_ponow = 'PonĂłw wpĹatÄ',
  txt_62619_bedz = '',
  txt_62619_bedz2 = '<br />MoĹźesz zmieniÄ sposĂłb zapĹaty.',
  txt_62619_w_inny = '<br/>Dokonaj wpĹaty na poniĹźsze dane lub wybierz inny sposĂłb zapĹaty. ',
  txt_62619_w_inny2 = 'ZmieĹ formÄ pĹatnoĹci',
  txt_62619_rezygnacja = 'ZrezygnowaĹeĹ z tej formy pĹatnoĹci.',
  txt_62619_przyj_wplata = 'Twoja wpĹata zostaĹa przyjÄta.',
  txt_62619_przyj_zwrot = 'Zwrot zostaĹ wykonany.',
  txt_62619_paymentError =
    'WystÄpiĹ bĹÄd pĹatnoĹci. SprĂłbuj ponownie opĹaciÄ zamĂłwienie za chwilÄ lub  <a href="contact.php">skontaktuj siÄ z nami</a>.',
  txt_62619_od_nazwa = 'Nazwa odbiorcy: ',
  txt_62619_konto = 'Numer konta: ',
  txt_62619_swit = 'SWIFT: ',
  txt_62619_bank = 'Bank:  ',
  txt_62619_tytulem = 'TytuĹ przelewu: ',
  txt_62619_do_zaplaty = 'Kwota przelewu: ',
  txt_62619_wplata_dane = '<br/>Dokonaj wpĹaty na poniĹźsze dane.',
  txt_62619_close_window = 'Zamknij okno',
  txt_62619_https_error =
    'DokonaÄ pĹatnoĹci kartÄ kredytowÄ moĹźna tylko przy uĹźyciu szyfrowanego poĹÄczenia. SprawdĹş czy adres sklepu poprzedzony jest protokoĹem HTTPS lub skontaktuj siÄ z obsĹugÄ sklepu.',
  txt_62619_voucher_error = 'WystÄpiĹy bĹÄdy pĹatnoĹci bonem. ',
  txt_62619_voucher_error_v1 = 'W tym sklepie, ten bon jest niewaĹźny.',
  txt_62619_voucher_error_v2 =
    'Numer bonu jest niepoprawny. Nie istnieje bon o takim identyfikatorze. SprĂłbuj wpisaÄ identyfikator ponownie, upewniajÄc siÄ, Ĺźe jest on poprawny.',
  txt_62619_giftcard_error_v2 = 'Dane karty podarunkowej sÄ niepoprawne.',
  txt_62619_voucher_error_v3 = 'Ten bon jest zablokowany.',
  txt_62619_voucher_error_v4 = 'Ten bon zostaĹ juĹź wykorzystany.',
  txt_62619_voucher_error_v5 = 'Ten bon jest juĹź niewaĹźny - termin waĹźnoĹci minÄĹ.',
  txt_62619_voucher_error_v6 = '',
  txt_62619_voucher_error_v7 =
    'Bon o podanym identyfikatorze nie istnieje. SprĂłbuj wpisaÄ identyfikator ponownie.',
  txt_62619_voucher_error_v8 = 'Nie podano identyfikatora bonu.',
  txt_62619_payment_title = 'Dokonaj pĹatnoĹci',
  txt_62619_loader_message = 'Pobieram dane o pĹatnoĹci',
  txt_62619_loader_message2 = 'DodajÄ pĹatnoĹÄ',
  txt_62619_loader_message3 = 'Pobieram historiÄ pĹatnoĹci',
  txt_62619_hhtransfer_error = 'WystÄpiĹy bĹÄdy pĹatnoĹci punktami.',
  txt_62619_incorrect_paymentid = 'WystÄpiĹy bĹÄdy - wybierz innÄ formÄ pĹatnoĹci.',
  txt_62619_newpayment_error =
    'WystÄpiĹy bĹÄdy pĹatnoĹci. SprĂłbuj ponownie opĹaciÄ zamĂłwienie za chwilÄ.',
  txt_62619_newpayment_points_error =
    'Nie masz wystarczajÄcej iloĹci punktĂłw lojalnoĹciowych aby opĹaciÄ to zamĂłwienie- wybierz innÄ formÄ pĹatnoĹci.',
  txt_62619_mozesz_row = ' MoĹźesz rĂłwnieĹź ',
  txt_62619_anuluj_wplate = ' anulowaÄ tÄ wpĹatÄ',
  txt_62619_paymentCancelError =
    'WystÄpiĹ bĹÄd podczas anulowania pĹatnoĹci. SprĂłbuj ponownie  za chwilÄ lub  <a href="contact.php">skontaktuj siÄ z nami</a>.',
  txt_62619_loader_message_4 = 'Trwa anulowanie pĹatnoĹci',
  txt_62619_wypelnij_wniosek = 'WypeĹnij wniosek',
  txt_62619_dokonaj_platnosci = 'ZapĹaÄ ',
  txt_62619_paypo_dokonaj_platnosci = ' PrzejdĹş do pĹatnoĹci odroczonej',
  txt_62619_do_oplacenia = 'Do opĹacenia zamĂłwienia pozostaĹo Ci ',
  txt_62619_dodatkowa_opl = 'Dodatkowa opĹata ',
  txt_62619_l_nawias = ' (',
  txt_62619_r_nawias = ')',
  txt_62619_payment_success = 'Dyspozycja dokonania pĹatnoĹci internetowej zostaĹa przyjÄta.',
  txt_62619_select_payment_method = 'Wybierz sposĂłb zapĹaty',
  txt_62619_select_firstData =
    'Transakcja zostanie zrealizowana przez system pĹatnoĹci FirstData International',
  txt_prepaid0011_kredyt = 'Kredyt Kupiecki',
  txt_prepaid0011_saldo = 'saldo (nadpĹata na koncie klienta)',
  txt_prepaid0019_upper = 'Wybierz innÄ formÄ pĹatnoĹci',
  txt_blikCode = 'Podaj 6-cyfrowy kod BLIK:',
  lukasnotconfirmed = 'ProszÄ zaznaczyÄ pole z wyraĹźeniem zgody.',
  zagielnotconfirmed = 'Przed zatwierdzeniem pĹatnoĹci eRaty zapoznaj siÄ z regulaminem.',
  next_voucher_text = '<span>+</span> UĹźyj kolejnego bonu',
  blik_js_txt_confirm = 'PotwierdĹş transakcjÄ za pomocÄ aplikacji na swoim urzÄdzeniu mobilnym.',
  blik_code_empty = '',
  txt_terms_title = 'PĹatnoĹÄ jednorazowa IdoPay',
  txt_terms_link = 'regulamin pĹatnoĹci jednorazowej IdoPay',
  txt_terms_checkbox = 'OĹwiadczam, Ĺźe zapoznaĹam / zapoznaĹem siÄ i w peĹni akceptujÄ Regulamin.',
  txt_terms_checkbox1 = 'ZapoznaĹem siÄ i akceptujÄ ',
  txt_terms_checkbox2 = ', przez ktĂłrÄ bÄdzie realizowana pĹatnoĹÄ.',
  txt_62619_restartPayment = 'PonĂłw pĹatnoĹÄ',
  txt_62619_card_not_supported = 'Przepraszamy, ale nie obsĹugujemy tego rodzaju kart',
  txt_62619_blik_length_error = 'Kod BLIK powinien zawieraÄ 6 cyfr',
  orderdetails_payments = {
    ajaxLoadSite: function (e, t = !1) {
      const i = t ? '--loading-page-overlay' : '--loading-page';
      if (e) document.querySelector('html').classList.add(i);
      else {
        document.querySelector('html').classList.remove('--loading-page'),
          document.querySelector('html').classList.remove('--loading-page-overlay');
        const e = document.querySelector('.orderdetails_summary');
        e && e.classList.remove('--pay_overlay');
      }
    },
    ajaxLoadSiteMessage: function (e) { },
  };
app_shop.run(
  function () {
    $('#prepaid_order_products .ordered-files ul li a').on('click', function (e) {
      e.preventDefault();
      const t = $(this),
        i = t.attr('href'),
        n = t.parent().find('span').text();
      let o = new Image();
      return (
        (o.src = i),
        (o.onload = function () {
          Modal({
            html: `<div id="ui-dialogimg"><img alt="${n}" src="${i}" /></div>`,
            classList: '--medium',
          });
        }),
        (o.onerror = function () {
          window.open(i);
        }),
        !1
      );
    });
  },
  'all',
  '#prepaid_order_products .ordered-files',
);
const prepaidTxt = { week1: ' tydzieĹ', week2: ' tygodnie', week3: ' tygodni' };
(prepaidTxtWeek = [prepaidTxt.week3, prepaidTxt.week1, prepaidTxt.week2]),
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
            o = n.data('position') - 1;
          return (
            $('#product_compare_list tr').each(function () {
              $(this).find('td').eq(o).toggleClass('hideCol');
            }),
            setTimeout(function () {
              t.hasScrollBar() ? e.addClass('hasScrollBar') : e.removeClass('hasScrollBar'), i();
              var o = n.data('toggletxt').trim(),
                r = decodeURIComponent(n.html().trim());
              n.html(o), n.data('toggletxt', r);
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
  app_shop.run(
    function () {
      app_shop.fn.selectPaging = new SelectToDropdown({
        selector: '.pb_paging__select:not(.f-dropdown)',
        afterClickDropdownCallback: e => {
          e.closest('form').submit();
        },
      });
    },
    'all',
    '.products-bought .s_paging select',
  ),
  app_shop.run(
    function () {
      $('.products-bought__product-button .btn-disabled').on('click', function (e) {
        return e.preventDefault(), !1;
      });
    },
    'all',
    '.products-bought__product-button .btn-disabled',
    !0,
  ),
  app_shop.run(
    function () {
      $('.products-bought__product-icon img.rwd-src').each(function () {
        ($this = $(this)), $this.attr('src', app_shop.fn.getRwdSrc($this));
      });
      const e = document.querySelector('.products-bought__input-checkbox-all + .f-label'),
        t = document.querySelectorAll('.products-bought__input-checkbox + .f-label'),
        i = document.querySelector('.products-bought__products-button .btn');
      (e.onclick = () =>
        (e => {
          const t = e.previousSibling,
            i = document.querySelectorAll(
              '.products-bought__checkbox:not(.--unavailable) .products-bought__input-checkbox',
            );
          t.checked
            ? ((t.checked = !1),
              i.forEach(e => {
                e.checked = !1;
              }))
            : ((t.checked = !0),
              i.forEach(e => {
                e.checked = !0;
              }));
        })(e)),
        t.forEach(e => {
          e.onclick = () =>
            (e => {
              const t = e.previousSibling,
                { id: i, size: n } = t.dataset;
              if (!i || !n) return Alertek.Error(app_shop.txt.txt_1000_products_bought_error);
              t.checked ? (t.checked = !1) : (t.checked = !0);
            })(e);
        }),
        (i.onclick = async () => {
          const e = new FormData(),
            t = document.querySelectorAll(
              '.products-bought__checkbox:not(.--unavailable) .products-bought__input-checkbox',
            );
          [...document.querySelectorAll('.products-bought__product-button .btn')]
            .map((e, i) =>
              t[i].checked
                ? e.href
                : (updatedHref = e.href
                  .split('&')
                  .map(e => (e.includes('number') ? 'number=0' : e))
                  .join('&')),
            )
            .forEach((t, i) => {
              t.split('?')[1]
                .split('&')
                .filter(e => !e.includes('mode') && !e.includes('bundled'))
                .forEach(t => {
                  let n =
                    'number' === t.split('=')[0]
                      ? `set_quantity[${i + 1}]`
                      : `${t.split('=')[0]}[${i + 1}]`;
                  const o = t.split('=')[1];
                  e.append(`${n}`, `${o}`);
                });
            });
          try {
            await fetch('basketchange.php?type=multiproduct', { method: 'POST', body: e }),
              window.location.reload();
          } catch (e) {
            throw new Error(e);
          }
        });
    },
    'all',
    '#products-bought',
  ),
  app_shop.run(
    function () {
      const e = document.querySelector('#paging_setting_bottom'),
        t = document.querySelector('.products-bought__products-button');
      e && t && t.append(e);
    },
    [3, 4],
    '#products-bought',
    !0,
  ),
  $(document).on(
    'hover.zoomContainer',
    '.zoomContainer, .photos__slider .photos__link',
    function () { },
  ),
  $(document).on('click', '#photos_slider .photos__link, #photos_nav a.--more', function (e) {
    e.preventDefault();
    const t = $(this).hasClass('--more')
      ? parseInt($(this).data('slick-index'), 10)
      : parseInt($(this).parent().data('slick-index'), 10);
    return app_shop.vars.projectorPhotoSwipe.init(t), document.activeElement.blur(), !1;
  }),
  app_shop.run(
    function () {
      (app_shop.vars.projectorElevate = new ProjectorElevate({
        selector: '.no-touch .photos__slider .slick-active .photos__photo[data-zoom-image]',
      })),
        (app_shop.vars.projectorSlider = new ProjectorSlider({
          selector: '.photos__slider .photos___slider_wrapper:not(.slick-initialized)',
          options: { responsive: [{ breakpoint: 979, settings: { dots: !0, arrows: !1 } }] },
          callbackBefore: e => {
            e.on('init', function () {
              app_shop.vars.projectorElevate.init();
            })
              .on('afterChange', function () {
                app_shop.vars.projectorElevate.reset();
                const t = document.querySelector(
                  '.photos__figure.--video.slick-active video[data-src]',
                );
                if (t) {
                  const i = t.getAttribute('data-src');
                  t.setAttribute('src', i),
                    t.removeAttribute('data-src'),
                    t.addEventListener('loadeddata', function () {
                      e.slick('setOption', '', '', !0);
                    });
                }
                const i = document.querySelector(
                  '.photos__figure.--video:not(.slick-active) video[src]',
                );
                i && i.pause();
                const n =
                  document
                    .querySelector('#photos_nav .photos__link.--active')
                    .getBoundingClientRect().top -
                  document.querySelector('#photos_nav').getBoundingClientRect().top +
                  document.querySelector('#photos_nav').scrollTop;
                document.querySelector('#photos_nav').scroll({ top: n, behavior: 'smooth' });
              })
              .on('lazyLoaded', function () {
                $('#photos_slider').removeAttr('data-skeleton');
              });
          },
        })),
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
        closeElClasses: ['caption', 'zoom-wrap', 'ui'],
      }),
      (this.init = e => {
        const { selector: t, options: i, pswp: n, itemsArray: o, thumbnailsFunc: r } = this.params;
        (this.settings = _objectSpread({}, this.defaults, {}, i)),
          (this.selector = t),
          (this.pswp = document.querySelectorAll(n)[0]),
          (this.items = []);
        let a = document.createElement('span');
        a.classList.add('photoSwipe_overlay'),
          document.body.appendChild(a),
          document.querySelector('.photoSwipe_overlay').addEventListener('click', function () {
            document.querySelector('.pswp__button--close').click();
          }),
          o ? (this.items = o) : this.setItemsArray(),
          e && (this.settings.index = e);
        const s = new PhotoSwipe(this.pswp, PhotoSwipeUI_Default, this.items, this.settings);
        s.listen('gettingData', function (e, t) {
          if (t.w < 1 || t.h < 1) {
            const e = new Image();
            (e.onload = function () {
              (t.w = this.width), (t.h = this.height), s.updateSize(!0);
            }),
              (e.src = t.src);
          }
        }),
          s.init(),
          'function' == typeof r ? r(s) : this.setThumbnails(s),
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
        const o =
          document
            .querySelector('div.photoSwipe_innerthumbs .photos__link.--active')
            .getBoundingClientRect().top -
          document.querySelector('div.photoSwipe_innerthumbs').getBoundingClientRect().top +
          document.querySelector('div.photoSwipe_innerthumbs').scrollTop;
        document.querySelector('div.photoSwipe_innerthumbs').scroll({ top: o, behavior: 'smooth' });
        let r = document.createElement('span');
        r.classList.add('photoSwipe_name'),
          (r.innerHTML = `${document.querySelector('.product_name__name').innerText}`),
          document.querySelector('.pswp__top-bar').append(r);
        const a = () => {
          let e = document.createElement('span'),
            t = document.querySelector('.pswp__counter').innerText;
          (t = t.replaceAll(' ', '')),
            (t = t.split('/')),
            (t[0] = `<b>${t[0]}</b>`),
            (e.innerHTML = t.join('/')),
            (document.querySelector('.pswp__counter').innerHTML = ''),
            document.querySelector('.pswp__counter').append(e);
        };
        a(),
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
            const o = e.currItem.container.querySelector('video[data-src]');
            if (o) {
              const e = o.getAttribute('data-src');
              o.setAttribute('src', e), o.removeAttribute('data-src');
            }
            document.querySelector('.pswp video[src]') &&
              document.querySelector('.pswp video[src]').pause(),
              a();
          });
      });
  }),
  (app_shop.fn.createExpressAutofillConsent = async (e = 'pin') => {
    const t = document.querySelector('#projector_form');
    if (!t) return !1;
    if (!app_shop.fn.checkProjectorData()) return !1;
    const i = new FormData(t),
      n = {};
    for (let [e, t] of i.entries()) n[e] = t;
    sessionStorage.setItem('productData', JSON.stringify(n));
    const o = !('product_virtual' !== product_data?.product_type),
      r = !('product_service' !== product_data?.product_type);
    return (
      app_shop.vars.isLogged
        ? await app_shop.fn.expChck.goStep('summary', {
          previousStep: null,
          virtualProduct: o,
          serviceProduct: r,
        })
        : 'pin' === e
          ? await app_shop.fn.expChck.goStep('login', {
            previousStep: null,
            virtualProduct: o,
            serviceProduct: r,
          })
          : await app_shop.fn.expChck.goStep('loginServices', {
            previousStep: null,
            virtualProduct: o,
            serviceProduct: r,
          }),
      !1
    );
  }),
  app_shop.run(
    async function () {
      const e = document.querySelector('#projector_express_checkout');
      if (
        (e.addEventListener('click', async () => {
          e.classList.add('--loading'),
            e.getAttribute('data-login') &&
            sessionStorage.setItem('expressCheckoutLogin', e.getAttribute('data-login')),
            e.getAttribute('data-type') &&
            sessionStorage.setItem('expressCheckoutLoginType', e.getAttribute('data-type')),
            await app_shop.fn.createExpressAutofillConsent(e.getAttribute('data-type')),
            e.classList.remove('--loading');
        }),
          !app_shop.fn.webAuthnExpChck)
      )
        return;
      (await app_shop.fn.webAuthnExpChck.checkBrowserSupport()) &&
        (document.documentElement.addEventListener('change', t => {
          const { target: i } = t;
          if (i.closest('#expchck_save_device')) {
            const { checked: t } = i,
              n = t && 'true' === localStorage.getItem('expchckDeviceRegistered');
            e.classList.toggle('--web-authn', n);
          }
        }),
          'true' === localStorage.getItem('expchckDeviceRegistered') &&
          'false' !== localStorage.getItem('expchckSaveDevice') &&
          e.classList.add('--web-authn'));
    },
    'all',
    '#projector_express_section',
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
      const t = new URLSearchParams(new FormData(document.getElementById('projector_form'))),
        i = (e.target ? e.target : e).closest('.projector_oneclick__item').getAttribute('data-id');
      await expressCheckoutApi.initCheckout(i, t);
    }
  }),
  (app_shop.fn.checkProjectorData = e => {
    if (!app_shop.fn.projectorForm.sizeSelected())
      return e || app_shop.fn.projectorForm.alertProjector(), !1;
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
    return (
      document.querySelectorAll('.projector_oneclick__item').forEach(e => {
        i && 0 === i.textContent.length
          ? (e.classList.remove('--checked'), n && n.setAttribute('data-hide', !0))
          : e.classList.add('--checked');
      }),
      !0
    );
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
  const { amount: t } = projectorObj.currentSizeObj;
  if (void 0 !== t && +t > 0) {
    const e = document.getElementById('projector_number'),
      i =
        e.getAttribute('data-minimum-quantity-subscription') ||
        e.getAttribute('data-minimum-quantity') ||
        e.getAttribute('data-sellby'),
      n = document.getElementById('projector_form');
    +i > +t && n.classList.add('disable');
  }
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
      $('.projector_smile__link, .smile_basket__link').on('click', function (e) {
        return e.stopPropagation(), Modal({ element: $('.smile_info'), classList: '--smile' }), !1;
      });
    },
    'all',
    '.smile_info',
    !0,
  ),
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
      $('.projector_paypo__link, .paypo_basket__link').on('click', function (e) {
        return e.stopPropagation(), Modal({ element: $('.paypo_info'), classList: '--paypo' }), !1;
      });
    },
    'all',
    '.paypo_info',
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
  ),
  app_shop.run(
    function () {
      $('.projector_buy__shopping_list, .projector_tell_availability__shopping_list').on(
        'click',
        function (e) {
          return app_shop.fn.projectorForm.sizeSelected()
            ? !(
              'function' == typeof app_shop.fn.bundleSizeSelected &&
              !app_shop.fn.bundleSizeSelected()
            ) &&
            (app_shop.fn.shoppingList.addProductToList([
              [
                document.getElementById('projector_product_hidden').value,
                document.getElementById('projector_size_hidden').value,
              ],
            ]),
              !1)
            : (app_shop.fn.projectorForm.alertProjector(), !1);
        },
      );
    },
    'all',
    '.projector_buy__shopping_list',
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
        o = Math.floor(((this.tl - t) % 864e5) / 6e4) % 60,
        r = (Math.floor(((this.tl - t) % 864e5) / 1e3) % 60) % 60,
        a = this;
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
          this.addZero(o) +
          '</span></span><span class="number-wrapper"><div class="line"></div><div class="caption">' +
          app_shop.txt.txt_74629_6 +
          '</div><span class="number sec">' +
          this.addZero(r) +
          '</span></span></div>'),
        this.elem.html(e),
        (this.tid = setTimeout(function () {
          a.countDown();
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
          o = new Date();
        return (
          void 0 !== t && o.setDate(o.getDate() + parseInt(t, 10)),
          void 0 !== i && o.setHours(o.getHours() + parseInt(i, 10)),
          void 0 !== n && o.setMinutes(o.getMinutes() + parseInt(n, 10)),
          o.toJSON().slice(0, 10).split('-').reverse().slice(0, -1).join('.')
        );
      }),
      (this.getCourierHtml = e => {
        const i = document.createElement('div');
        i.classList.add('shipping_info__courier');
        const n = e.courier.icon,
          o = e.courier.name,
          r = e.deliveryTime.today
            ? app_shop.txt.daysOfWeek[0]
            : app_shop.txt.daysOfWeek[e.deliveryTime.weekDay],
          a =
            e.deliveryTime.weekAmount > 0
              ? `Â (${t.calculateDate({
                days: e.deliveryTime.time.days,
                hours: e.deliveryTime.time.hours,
                minutes: e.deliveryTime.time.minutes,
              })})`
              : '',
          s = e.cost.value > 0 ? e.cost.formatted : gratis_txt;
        return (
          (i.innerHTML = `<span class="shipping_info__item --icon"><img src="${n}" alt="${o}"/></span>\n    <span class="shipping_info__item --name">${o}</span>\n    <span class="shipping_info__item --delivery">${r}${a}</span>\n    <strong class="shipping_info__item --cost">${s}</strong>`),
          i
        );
      }),
      (this.createRegionForcedMessage = () => {
        const e = this.getCookieByName('setRegionForced'),
          t = this.getCookieByName('setZipcodeForced');
        if (!e && !t) return '';
        const i = JSON.parse(e),
          n = JSON.parse(t),
          { currentCountry: o, defaultCountry: r, showModal: a } = i || {},
          { currentZipcode: s, defaultZipcode: l, showModal: c } = n || {};
        if (!a && !c) return '';
        const p = !o && s,
          d = !p && s;
        return `<div class="shipping_info__top">\n      <span class="shipping_info__current_region">${p ? app_shop.txt.shippingInfoCurrentZipcode : app_shop.txt.shippingInfoCurrentRegion
          }<strong class="shipping_info__region_name">${p ? s : o}</strong>${d
            ? `<span class="shipping_info__and_region">${app_shop.txt.shippingInfoAndRegion}<strong>${s}</strong></span>`
            : ''
          }</span>\n      <a href="#unsetTemporaryRegion" class="shipping_info__default_region">${p ? app_shop.txt.shippingInfoDefaultZipcode : app_shop.txt.shippingInfoDefaultRegion
          }<strong class="shipping_info__region_name">${p ? l : r}</strong></a>\n    </div>`;
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
            o = i.filter(e => 'dvp' === e.prepaid),
            r = i.filter(e => 'prepaid' === e.prepaid),
            a = document.createElement('div');
          a.classList.add('shipping_info'),
            (a.id = 'shipping_info'),
            (a.innerHTML = `${e}<div class="shipping_info__body">\n        ${r.length
              ? `<div class="shipping_info__block --prepaid">\n          <strong class="shipping_info__label">${app_shop.txt.shippingInfoPrepaid
              }</strong>\n          <div class="shipping_info__header">\n            <span class="shipping_info__header_item --icon-name">${app_shop.txt.shippingInfoHeaderName
              }</span>\n            <span class="shipping_info__header_item --delivery">${app_shop.txt.shippingInfoHeaderDelivery
              }</span>\n            <span class="shipping_info__header_item --cost">${app_shop.txt.shippingInfoHeaderCost
              }</span>\n          </div>\n          <div class="shipping_info__couriers">\n            ${r
                .map(e => t.getCourierHtml(e).outerHTML)
                .join('')}\n          </div>\n        </div>`
              : ''
              }\n        ${o.length
                ? `<div class="shipping_info__block --prepaid">\n          <strong class="shipping_info__label">${app_shop.txt.shippingInfoDvp
                }</strong>\n          <div class="shipping_info__header">\n            <span class="shipping_info__header_item --icon-name">${app_shop.txt.shippingInfoHeaderName
                }</span>\n            <span class="shipping_info__header_item --delivery">${app_shop.txt.shippingInfoHeaderDelivery
                }</span>\n            <span class="shipping_info__header_item --cost">${app_shop.txt.shippingInfoHeaderCost
                }</span>\n          </div>\n          <div class="shipping_info__couriers">\n            ${o
                  .map(e => t.getCourierHtml(e).outerHTML)
                  .join('')}\n          </div>\n        </div>`
                : ''
              }\n      </div>\n      <div class="shipping_info__footer">\n        <span class="shipping_info__vat">${app_shop.txt.shippingInfoVat
              }</span>\n      </div>`),
            this.onlyHtml
              ? this.onlyHtml(a)
              : Modal({
                element: a,
                classList: '--shipping-info --large',
                afterShow: this.afterShowModal,
              });
          const s = this.getCookieByName('setRegionForced'),
            l = this.getCookieByName('setZipcodeForced');
          let c = 'region';
          !s && l && (c = 'zipcode'),
            s && l && (c = 'regionAndZipcode'),
            this.initEvents({ type: c });
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
          afterShowModal: o,
          onlyHtml: r,
        } = this.params;
        (this.getCouriersFunction = i || !1),
          (this.productParamsFunction = n || !1),
          (this.afterShowModal = o || !1),
          (this.onlyHtml = r || !1),
          this.create();
      });
  }),
  app_shop.run(
    function () {
      $('.configurator:not(.--skeleton)').insertBefore($('.configurator.--skeleton')),
        $('.configurator.--skeleton').remove(),
        (app_shop.fn.configurator = new Configurator()),
        app_shop.fn.configurator.init();
      const e = projectorEndStartCallback;
      (projectorEndStartCallback = function () {
        e(), app_shop.fn.configurator.setPrice(!0);
      }),
        (projectorInitObject = { endStartFunction: projectorEndStartCallback }),
        projectorObj.projectorInit(projectorInitObject);
    },
    'all',
    '.configurator',
    !0,
  ),
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
      const e = `<span class="opinions_tabs__count">(${document.querySelectorAll('#opinions_section .opinions_list .opinions_element').length
        })</span>${document.querySelector('#opinions_section .average_opinions_box .comments .note span')
          ? `<span class="opinions_tabs__icons note">${document.querySelector('#opinions_section .average_opinions_box .comments .note span')
            .innerHTML
          }</span>`
          : ''
        }${document.querySelector('#opinions_section .average_opinions_score')
          ? `<span class="opinions_tabs__score">${document.querySelector('#opinions_section .average_opinions_score').innerHTML
          }</span>`
          : ''
        }`;
      app_shop.fn.projectorTabs = new ProjectorTabs({
        mobileTabs: [
          { selector: '#projector_longdescription', name: projectorTabsTxt.description },
          { selector: '#projector_producttraits', name: projectorTabsTxt.traits },
          { selector: '#projector_dictionary', name: projectorTabsTxt.dictionary },
          { selector: '#projector_enclosures', name: projectorTabsTxt.enclosures },
          { selector: '#projector_warranty', name: projectorTabsTxt.warranty },
          { selector: '#opinions_section', name: projectorTabsTxt.opinions, additionalInfo: e },
        ],
        fixedSelector: 'html.--fixed-header header',
      });
    },
    'all',
    '.projector_tabs',
  ),
  app_shop.run(
    function () {
      app_shop.fn.projectorTabs.init(),
        $(window).off('scroll.fixedProjector'),
        $('.projector_tabs').removeAttr('style'),
        setTimeout(function () {
          if (app_shop.vars.view > 4) {
            let e, t;
            $(window).on('scroll.fixedProjector', function () {
              (void 0 !== e && void 0 !== t) ||
                ((e = $('html.--fixed-header header').length
                  ? $('html.--fixed-header header').outerHeight()
                  : 0),
                  (t = $('.projector_tabs__tabs').outerHeight()));
              const i = $('.projector_tabs__tabs').offset().top,
                n = $('.projector_tabs__tabs.--fixed')
                  ? $('.projector_tabs').offset().top + e
                  : $('.projector_tabs').offset().top,
                o = $(window).scrollTop();
              o >= i - e && i - n + e + t > 0
                ? ($('.projector_tabs__tabs').addClass('--fixed').css('top', e),
                  $('.projector_tabs__tabs').addClass('--fixed'),
                  $('.projector_tabs').css('margin-top', t),
                  $('.projector_tabs__tab:first-child').addClass('--active'))
                : ($('.projector_tabs__tabs').removeClass('--fixed').removeAttr('style'),
                  $('.projector_tabs').removeAttr('style'),
                  $('.projector_tabs__tab').removeClass('--active')),
                $('.projector_tabs__tab').each(function () {
                  const i = $($(this).data('target')).offset().top;
                  o >= i - e - t - 55 &&
                    ($('.projector_tabs__tab').removeClass('--active'),
                      $(this).addClass('--active'));
                });
            });
          } else
            $(window).off('scroll.fixedProjector'),
              $('.projector_tabs__tabs').removeClass('--fixed'),
              $('.projector_tabs').removeAttr('style'),
              $('.projector_tabs__tab').removeClass('--active');
        }, 200);
    },
    [1, 2, 3, 4],
    '.projector_tabs',
  );
const projectorTabsTxt = {
  traits: 'GĹĂłwne parametry',
  dictionary: 'SzczegĂłĹowe dane',
  warranty: 'Gwarancja',
  description: 'Opis',
  video: 'Video',
  enclosures: 'Do pobrania',
  opinions: 'Opinie',
  blog: 'Z naszego bloga',
  questions: 'Pytania',
  zone1: '',
  zone2: '',
  zone3: '',
  custom1: '',
  custom2: '',
  custom3: '',
  custom4: '',
};
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
          o = new Image();
        return (
          (o.src = i),
          (o.onload = function () {
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
var txt_1_69260_1 = 'Wybierz produkty do zwrotu',
  txt_1_odznacz_w_p = 'Odznacz wszystkie produkty ',
  txt_1_zaznacz_w_p = 'Zaznacz wszystkie produkty',
  txt_1_max_ret_amount = 'Maksymalnie moĹźesz zwrĂłciÄ ',
  txt_1_new_button = 'true';
app_shop.run(
  function () {
    (goNext = function () {
      var e = !1;
      return (
        $('.productslist_item').each(function () {
          $(this).find('.productslist_product_action input:checked').size() &&
            0 != $(this).find('.productslist_product_quantity input[type="text"]').val() &&
            (e = !0);
        }),
        e
      );
    }),
      (Basketedit.getValues = function (e) {
        var t = e.parent(),
          i = t.find('input[name=data_amount]').val(),
          n = t.find('input[name=data_unit_sellby]').val(),
          o = t.find('input[name=data_unit]').val();
        return {
          precision: t.find('input[name=data_unit_precision]').val(),
          unit_sellby: n,
          unit: o,
          amount: i,
        };
      }),
      (Basketedit.number_check = function (e, t) {
        var i = e,
          n = Basketedit.getValues(e);
        t = t || !0;
        if ('' == n.unit_sellby) var o = 1;
        else o = n.unit_sellby;
        var r = n.unit,
          a = n.precision,
          s = n.amount,
          l = i.val();
        (l = (l = parseFloat(l)).toFixed(6)), (l = parseFloat(l));
        var c = i.parents('.productslist_item').find('.productslist_product_action input');
        if ((t && (l > 0 ? c.prop('checked', !0) : c.prop('checked', !1)), l <= 0))
          return i.val(0), !0;
        if ((i.val(p), '1' == o))
          Math.round(l) > parseInt(s) && isFinite(s) && '-1' != s
            ? (Alertek.show_alert(txt_1_max_ret_amount + ' ' + s + ' ' + r), i.val(s))
            : i.val(Basketedit.roundNumber(Basketedit.if_isanumber(l, o), a));
        else if (((a = parseInt(a)), l >= parseInt(s) && isFinite(s) && '-1' != s))
          Alertek.show_alert(
            txt_1_max_ret_amount + Basketedit.roundNumber(Math.floor(s / o) * o, a) + ' ' + r,
          ),
            i.val(Basketedit.roundNumber(Math.floor(s / o) * o, a));
        else {
          var p,
            d = Math.abs(Math.floor((l / o).toFixed(6)));
          (p = d
            ? parseFloat((d * o).toFixed(6)) == l
              ? (d * o).toFixed(a)
              : d * o < l
                ? ((d + 1) * o).toFixed(a)
                : Math.abs((Math.ceil(l) * o).toFixed(a))
            : o),
            i.val(p);
        }
      }),
      $(document).on('click', '.productslist_product_action input', function () {
        var e = $(this)
          .parents('.productslist_item')
          .find('.productslist_product_quantity input[type="text"]');
        if ($(this).is(':checked')) {
          var t = e.nextAll('input[name="data_unit_sellby"]').val();
          e.val(t), Basketedit.number_check(e, !1);
        } else e.val(0);
      }),
      $('.productslist_product_action input').not(':checked').size()
        ? ($('.step2 .select_all').html(txt_1_zaznacz_w_p),
          '' !== txt_1_new_button &&
          $('.step2 .select_all').removeClass('icon-minus').addClass('icon-plus'))
        : ($('.step2 .select_all').html(txt_1_odznacz_w_p),
          '' !== txt_1_new_button &&
          $('.step2 .select_all').removeClass('icon-plus').addClass('icon-minus')),
      $(document).on('click', '.step2 .select_all', function () {
        return (
          $('.productslist_product_action input').not(':checked').size()
            ? ($('.productslist_product_action input').prop('checked', !0),
              $('.step2 .select_all').html(txt_1_odznacz_w_p),
              '' !== txt_1_new_button &&
              $('.step2 .select_all').removeClass('icon-plus').addClass('icon-minus'))
            : ($('.productslist_product_action input').prop('checked', !1),
              $('.step2 .select_all').html(txt_1_zaznacz_w_p),
              '' !== txt_1_new_button &&
              $('.step2 .select_all').removeClass('icon-minus').addClass('icon-plus')),
          $('.productslist_product_action input').each(function () {
            var e = $(this)
              .parents('.productslist_item')
              .find('.productslist_product_quantity input[type="text"]');
            if ($(this).is(':checked')) {
              var t = e.nextAll('input[name="data_unit_sellby"]').val();
              e.val(t), Basketedit.number_check(e, !1);
            } else e.val(0);
          }),
          !1
        );
      }),
      $(document).on('click', '.step2 #return_go_next', function () {
        if (!goNext())
          return (
            $('.rma_products_page').length
              ? Alertek.show_alert(txt_1_69260)
              : Alertek.show_alert(txt_1_69260_1),
            !1
          );
        $('div.progress_bar_wrapper').removeClass('pb_step2').addClass('pb_step3');
      }),
      $('.productslist_comment a.addMoreFiles')
        .unbind()
        .on('click', function () {
          var e = $(this).parents('.prodl_comment_right').find('div.prodl_comment_foto').last();
          return e.after(e.clone()), e.next().find('input').val(''), !1;
        });
  },
  'all',
  '.returns_productslist',
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
        (document.querySelector('.rma_questions').innerHTML = t.querySelector(
          '.rma_questions',
        ).innerHTML),
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
const rmaTxt = {
  chooseProducts: 'Wybierz towary',
  complain: 'Reklamuj',
  product: ' towar',
  products: ' towary',
  noDetailsOnComplain: 'ProszÄ o podanie opisu usterki i powodu reklamacji',
  noFileSelected: 'Nie wybrano pliku',
  mobile_complain: 'Reklamuj towar',
  cancel_complain: 'Zrezygnuj z reklamacji',
},
  RmaProductList = function (e) {
    (this.params = e), (this.vars = { productsToComplain: 0, dropdowns: null });
    const t = this;
    return (
      (this.generateDropdowns = () => {
        this.vars.dropdowns = new SelectToDropdown({
          selector: '.productslist_quantity .f-select',
          generateDropdownCallback: e => {
            e.nextSibling.classList.remove('d-none');
          },
          afterClickDropdownCallback: e => {
            'more' != e.querySelector('.--selected').dataset.value
              ? ((e
                .closest('.productslist_item')
                .querySelector('.productslist_product_action input').checked = !0),
                (e
                  .closest('.productslist_quantity')
                  .querySelector('.productslist_quantity__more_input').value = parseFloat(
                    e.closest('.productslist_quantity').querySelector('select').value,
                  )),
                this.countProductsToComplain())
              : ((e
                .closest('.productslist_quantity')
                .querySelector('.productslist_quantity__more_input').value = ''),
                e
                  .closest('.productslist_quantity')
                  .querySelector('.productslist_quantity__more_input')
                  .focus());
          },
          disableMobileView: !0,
        });
      }),
      (this.validateNumber = e => {
        const t = parseFloat(e.dataset.max),
          i = parseFloat(e.attributes.step.value);
        return (
          (output = e.value % i != 0 ? e.value - (e.value % i) + i : e.value),
          (output = output > t || output < 0 ? (output < 0 ? e.dataset.prev : t) : output),
          (e.dataset.prev = output),
          (e.value = output),
          output
        );
      }),
      (this.inputHandler = () => {
        document.querySelectorAll('.productslist_quantity__more_input').forEach(e => {
          let i = null;
          e.addEventListener('keyup', () => {
            clearTimeout(i),
              (i = setTimeout(function () {
                t.validateNumber(e),
                  (e
                    .closest('.productslist_item')
                    .querySelector('.productslist_product_action input').checked = e.value > 0),
                  t.countProductsToComplain();
              }, 750));
          }),
            e.addEventListener('blur', () => {
              e.value = e.dataset.prev;
            });
        });
      }),
      (this.countProductsToComplain = () => {
        (this.vars.productsToComplain = 0),
          document.querySelectorAll('input.productslist_quantity__more_input').forEach(e => {
            this.vars.productsToComplain =
              parseFloat(this.vars.productsToComplain) + parseFloat(e.value);
          }),
          this.changeNextButton(this.vars.productsToComplain);
      }),
      (this.changeNextButton = e => {
        e > 0
          ? ((document.querySelector('#return_go_next').innerHTML = `${rmaTxt.complain} (${e}) ${1 == e ? rmaTxt.product : rmaTxt.products
            }`),
            document.querySelector('#return_go_next').classList.remove('disabled'))
          : ((document.querySelector('#return_go_next').innerHTML = rmaTxt.chooseProducts),
            document.querySelector('#return_go_next').classList.add('disabled'));
      }),
      (this.validateForm = () => {
        let e = !0;
        return null == document.querySelector('.productslist_product_action input:checked')
          ? (Alertek.show_alert(txt_1_69260), (e = !0), !1)
          : ((e = !1),
            document.querySelectorAll('.productslist_item').forEach(t => {
              null !== t.querySelector('.productslist_product_action input:checked') &&
                0 == t.querySelector('.productslist_product_comment textarea').textLength &&
                (null == t.querySelector('.productslist_product_comment .help-block') &&
                  t
                    .querySelector('.productslist_product_comment')
                    .insertAdjacentHTML(
                      'beforeend',
                      `<span class="help-block validate_message text-danger">${rmaTxt.noDetailsOnComplain}</span>`,
                    ),
                  t.querySelector('.productslist_product_comment').classList.add('has-error'),
                  (e = !0));
            }),
            !e);
      }),
      (this.submitFormHandler = () => {
        document.querySelector('#return_go_next').addEventListener('click', e => {
          e.preventDefault(),
            t.validateForm() && document.querySelector('.returns_productslist').submit();
        });
      }),
      (this.attachmentsShowHandler = () => {
        document
          .querySelectorAll('.productslist_product_attachments a[href="#addComment"]')
          .forEach(e => {
            e.addEventListener('click', () => {
              e.classList.add('d-none'),
                e
                  .closest('.productslist_product_attachments')
                  .querySelector('.rma__attachment')
                  .classList.remove('d-none');
            });
          });
      }),
      (this.addMoreFilesEvent = () => {
        document.querySelectorAll('.addMoreFiles').forEach(function (e) {
          e.addEventListener('click', e => {
            const i = e.target.closest('.rma__attachment'),
              n =
                i.querySelector('.prodl_comment_foto').lastElementChild.attributes.for.value +
                '_clone';
            let o = i.querySelector('.prodl_comment_foto').lastElementChild.cloneNode(!0);
            (o.attributes.for.value = n),
              (o.querySelector('input').id = n),
              (o.querySelector('input').dataset.events = !1),
              (o.querySelector('input').value = ''),
              (o.querySelector('.prodl_comment_foto__imageName').innerHTML = rmaTxt.noFileSelected),
              i.querySelector('.prodl_comment_foto').lastElementChild.after(o),
              t.fakeFileInput();
          });
        });
      }),
      (this.fakeFileInput = () => {
        document.querySelectorAll('input[data-events="false"]').forEach(e => {
          e.addEventListener('change', t => {
            let i = t.target.files[0].name;
            e.closest('label').querySelector('.prodl_comment_foto__imageName').innerHTML = i;
          }),
            (e.dataset.events = !0);
        });
      }),
      (this.mobileToggleComplainHandler = () => {
        document.querySelectorAll('.rma__toggleComplain').forEach(e => {
          const t = e.closest('.productslist_item');
          e.addEventListener('click', () => {
            t.classList.toggle('--opened'),
              t.classList.contains('--opened')
                ? ((e.querySelector('span').innerHTML = rmaTxt.cancel_complain),
                  t.querySelector('.f-dropdown-item[data-index="1"]').click())
                : ((e.querySelector(
                  'span',
                ).innerHTML = `<i class="icon-plus"></i> ${rmaTxt.mobile_complain}`),
                  t.querySelector('.f-dropdown-item[data-index="0"]').click());
          });
        });
      }),
      (this.showWarrantyInfo = () => {
        app_shop.vars.view > 2 &&
          document.querySelectorAll('.productslist_warranty_info__show').forEach(e => {
            e.addEventListener('click', () => {
              Modal({
                html: e.nextSibling.innerHTML,
                classList: 'productslist_warranty_info__modal',
              });
            });
          });
      }),
      (this.init = () => {
        this.generateDropdowns(),
          this.countProductsToComplain(),
          this.submitFormHandler(),
          this.attachmentsShowHandler(),
          this.fakeFileInput(),
          this.addMoreFilesEvent(),
          this.mobileToggleComplainHandler(),
          this.showWarrantyInfo(),
          this.inputHandler();
      }),
      this.init()
    );
  };
app_shop.run(
  function () {
    app_shop.fn.rma_products_list = new RmaProductList();
  },
  'all',
  '.return_productslist.rma',
),
  $(function () {
    $('div.prodl_comment_right ol a.previewFile').each(function () {
      var e = $(this).text();
      e.length >= 26 &&
        (e.indexOf('.') > 0
          ? $(this).text(
            e.substring(0, 26 < e.lastIndexOf('.') ? 20 : e.indexOf('.') - 6) +
            '[...].' +
            e.split('.').pop(),
          )
          : $(this).text(e.substring(0, 26)));
    }),
      $(document).on('click', 'a.previewFile[href="#previewFile"]', function (e) {
        e.preventDefault(), e.stopPropagation();
        const t = $(this),
          i = t.attr('rel'),
          n = t.parent().find('span').text();
        let o = new Image();
        return (
          (o.src = i),
          (o.onload = function () {
            Modal({
              html: `<div id="ui-dialogimg"><img alt="${n}" src="${i}" /></div>`,
              classList: '--medium',
            });
          }),
          !1
        );
      }),
      $('.rma_products_page a.choose_prod, .rma_products_page .allowReturn_2 a').click(function () {
        app_shop.fn.ajaxLoadSite(1), app_shop.fn.ajaxLoadSiteMessage('');
        var e = $(this).closest('td').find('a.addQuantity'),
          t = parseFloat(Basketedit.getValues(e.parent().find('input[type=text]')).unit_sellby);
        if (0 == e.parent().find('input[type=text]').val()) {
          var i = t;
          e.parent().find('input[type=text]').val(i).change();
        }
        return $(this).closest('form').submit(), !1;
      });
  });
var txt_1_69260 = 'Wybierz produkty do reklamacji';
(productslist_03a_txt = 'Uwagi mogÄ mieÄ maksymalnie '),
  (productslist_03b_txt = ' znakĂłw. '),
  (productslist_maxvalue_04_txt = '255');
var Basketedit = {
  getValues: function (e) {
    var t = e.attr('data-amount'),
      i = e.attr('data-unit_sellby'),
      n = e.attr('data-unit');
    return {
      precision: e.attr('data-unit_precision'),
      unit_sellby: i,
      unit: n,
      amount: t,
      max_q: e.attr('data-max_q'),
      max_s: e.attr('data-max_s'),
      min_q: e.attr('data-min_q'),
      min_s: e.attr('data-min_s'),
    };
  },
  roundNumber: function (e, t) {
    return (num = parseFloat(e)), (result = Math.abs(num.toFixed(t))), result;
  },
  if_isanumber: function (e, t) {
    return isNaN(e) ? 1 : 1 == t ? e : t;
  },
  sellby_recount: function (e, t, i) {
    return 'up' == i ? e * t : Math.round(i / t) * t;
  },
  number_check: function (e) {
    console.log('test');
    var t = e,
      i = Basketedit.getValues(e),
      n = parseFloat(i.unit_sellby),
      o = parseFloat(i.precision),
      r = parseFloat(i.amount),
      a = i.unit;
    console.log(s);
    var s = parseFloat(t.val());
    if (s < 0) return t.val(0), !1;
    if (0 === (s = parseFloat(s))) return t.val(0), !1;
    var l = parseFloat(i.max_q),
      c = parseFloat(i.max_s),
      p = parseFloat(i.min_q),
      d = parseFloat(i.min_s);
    if (!$.isNumeric(s) || s <= n) {
      if (isNaN(l) && isNaN(c) && isNaN(p) && isNaN(d)) return t.val(n.toFixed(o)), !0;
      n = n.toFixed(o);
    }
    (number = Math.floor(s / n) * n),
      (number =
        ((s / n) * n - number).toFixed(o + 1) > 0
          ? (1 * number + n).toFixed(o)
          : number.toFixed(o)),
      (number = parseFloat(number));
    var u = r,
      h = n,
      _ = -1;
    if (!isNaN(l)) {
      _ =
        (_ =
          l -
          (_ = $.map($('.' + t.attr('class')), function (e) {
            return parseFloat($(e).val());
          }).reduce(function (e, t) {
            return e + t;
          }))) < 0
          ? 'end'
          : _;
      var f = $('.' + t.attr('class')).not(t);
      f.size() &&
        l -
        $.map(f, function (e) {
          return parseFloat($(e).val());
        }).reduce(function (e, t) {
          return e + t;
        }),
        (u = u > l ? l : u);
    }
    return (
      isNaN(c) || (u = u > c ? c : u),
      isNaN(p) || (h = p > h ? p : h),
      isNaN(d) || (h = d > h ? d : h),
      -1 != u && (h = u > h ? h : n),
      h && number < h
        ? (Alertek.show_alert(
          Projector_txt_minimalnie + ' ' + Math.ceil(parseFloat(h) / n) * n + ' ' + a,
        ),
          t.val(Math.ceil(parseFloat(h) / n) * n),
          !0)
        : 'end' == _
          ? (Alertek.show_alert(
            Projector_txt_maksymalnie + ' ' + Math.floor(parseFloat(l) / n) * n + ' ' + a,
          ),
            t.val(Math.floor(parseFloat(l) / n) * n),
            !0)
          : number > u && -1 != u
            ? (Alertek.show_alert(
              Projector_txt_maksymalnie + ' ' + Math.floor(parseFloat(u) / n) * n + ' ' + a,
            ),
              t.val(Math.floor(parseFloat(u) / n) * n),
              !0)
            : (t.val(number), !0)
    );
  },
},
  basketedit_productslist_init = function () {
    $('#basketedit_productslist .productslist_product_quantity input[type=text]').each(function () {
      var e = $(this).parent().find('.delQuantity');
      $(this).val() == parseFloat($(this).attr('data-min_q'))
        ? e.addClass('disabled')
        : e.removeClass('disabled');
    }),
      $('#basketedit_productslist textarea').blur(function () {
        var e = $(this).val().length,
          t = productslist_maxvalue_04_txt;
        e > t &&
          ($(this).val($(this).val().substring(0, t)),
            Alertek.show_alert(productslist_03a_txt + t + productslist_03b_txt));
      }),
      $('#basketedit_productslist .productslist_product_quantity input[type=text]').change(
        function () {
          Basketedit.number_check($(this));
          var e = $(this).parent().find('.delQuantity');
          $(this).val() == parseFloat($(this).attr('data-min_q'))
            ? e.addClass('disabled')
            : e.removeClass('disabled');
        },
      ),
      $('.productslist_quantity > input').on('click', function () {
        if (1 === app_shop.vars.view)
          return (
            $(this).parent().parent().parent().parent().next().show(),
            $(this)
              .parent()
              .parent()
              .parent()
              .siblings('.productslist_product_toggler')
              .children('a')
              .addClass('open'),
            !1
          );
      }),
      $('.productslist_quantity > input').on('input', function () {
        1 === app_shop.vars.view &&
          $(this)
            .parent()
            .parent()
            .parent()
            .parent()
            .next()
            .find('button.product_calculate')
            .show();
      }),
      $('.productslist_quantity > input').on('change', function () {
        1 === app_shop.vars.view &&
          $(this)
            .parent()
            .parent()
            .parent()
            .parent()
            .next()
            .find('button.product_calculate')
            .show();
      }),
      $('.basketedit_productslist a').click(function () {
        switch ($(this).attr('href')) {
          case '#addComment':
            var e;
            return (
              $(this).parents('.rma__row').next().next().find('div.prodl_comment').length
                ? (e = $(this).parents('.rma__row').next().next())
                : $(this).parents('.rma__row').next().find('div.prodl_comment').length &&
                (e = $(this).parents('.rma__row').next()),
              void 0 !== e &&
              (e.find('div.prodl_comment').toggle(), e.find('div.prodl_comment_top').toggle()),
              !1
            );
          case '#clearComment':
            return $(this).prevAll('textarea').val(''), !1;
          case '#addQuantity':
            var t = parseFloat(
              Basketedit.getValues($(this).parent().find('input[type=text]')).unit_sellby,
            ),
              i = parseFloat($(this).parent().find('input[type=text]').val()) + t;
            return $(this).parent().find('input[type=text]').val(i).change(), !1;
          case '#delQuantity':
            t = parseFloat(
              Basketedit.getValues($(this).parent().find('input[type=text]')).unit_sellby,
            );
            return (
              (i = parseFloat($(this).parent().find('input[type=text]').val()) - t) < 0 && (i = 0),
              $(this).parent().find('input[type=text]').val(i).change(),
              !1
            );
        }
      }),
      $('.basketedit_page #basketedit_productslist a').click(function () {
        switch ($(this).attr('href')) {
          case '#addComment':
            return (
              $(this).parents('.productslist_item').find('.prodl_comment').length > 0 &&
              ($(this).parents('.productslist_item').find('.prodl_comment_top').toggle(),
                $(this).parents('.productslist_item').find('.prodl_comment').toggle()),
              !1
            );
          case '#clearComment':
            return $(this).prevAll('textarea').val(''), !1;
          case '#removeSelected':
            return (
              $('td.procuctCheckbox_sub input:checked').length > 0
                ? ($('td.procuctCheckbox_sub input:checked')
                  .parents('tr.productslist_product_sizes')
                  .find('.productslist_product_quantity input[type=text]')
                  .val(0),
                  $('form.basketedit_productslist').submit())
                : Alertek.show_alert(productslist_01_txt),
              !1
            );
          case '#saveQuantity':
            return $('form.basketedit_productslist').submit(), !1;
        }
      }),
      $('.basketedit_page input.selectAllCheckbox').click(function () {
        $(this).is(':checked')
          ? ($('td.procuctCheckbox input').prop('checked', !0),
            $('td.procuctCheckbox').addClass('procuctCheckboxSelect'),
            $('td.procuctCheckbox_sub input').prop('checked', !0),
            $('td.procuctCheckbox_sub').addClass('procuctCheckboxSelect'))
          : ($('td.procuctCheckbox input').removeAttr('checked'),
            $('td.procuctCheckbox').removeClass('procuctCheckboxSelect'),
            $('td.procuctCheckbox_sub input').removeAttr('checked', 'checked'),
            $('td.procuctCheckbox_sub').removeClass('procuctCheckboxSelect'));
      }),
      $('.basketedit_page td.procuctCheckbox input').click(function () {
        $('td.procuctCheckbox input').not(':checked').length > 0 &&
          $('input.selectAllCheckbox').removeAttr('checked'),
          $('td.procuctCheckbox input:checked').length == $('td.procuctCheckbox input').length &&
          $('input.selectAllCheckbox').prop('checked', !0),
          $(this).is(':checked')
            ? ($(this).parent().addClass('procuctCheckboxSelect'),
              $(this)
                .parent()
                .siblings('.productslist_product_sizes_wrapper')
                .children()
                .children()
                .children()
                .children('td.procuctCheckbox_sub')
                .each(function () {
                  $(this).addClass('procuctCheckboxSelect'),
                    $(this).children('input.procuctCheckbox_sub').prop('checked', !0);
                }))
            : ($(this).parent().removeClass('procuctCheckboxSelect'),
              $(this)
                .parent()
                .siblings('.productslist_product_sizes_wrapper')
                .children()
                .children()
                .children()
                .children('td.procuctCheckbox_sub')
                .each(function () {
                  $(this).removeClass('procuctCheckboxSelect'),
                    $(this).children('input.procuctCheckbox_sub').removeAttr('checked');
                }));
      }),
      $('.basketedit_page td.procuctCheckbox_sub input').click(function () {
        $('td.procuctCheckbox_sub input').not(':checked').length > 0 &&
          $('input.selectAllCheckbox').removeAttr('checked'),
          $('td.procuctCheckbox_sub input:checked').length ==
          $('td.procuctCheckbox_sub input').length &&
          $('input.selectAllCheckbox').prop('checked', !0),
          $(this)
            .parents('table.productslist_product_sizes')
            .find('td.procuctCheckbox_sub input')
            .not(':checked').length > 0 &&
          ($(this)
            .parents('td.productslist_product_sizes_wrapper')
            .siblings('td.procuctCheckbox')
            .removeClass('procuctCheckboxSelect'),
            $(this)
              .parents('td.productslist_product_sizes_wrapper')
              .siblings('td.procuctCheckbox')
              .children('input')
              .removeAttr('checked')),
          $(this)
            .parents('table.productslist_product_sizes')
            .find('td.procuctCheckbox_sub input:checked').length ==
          $(this).parents('table.productslist_product_sizes').find('td.procuctCheckbox_sub input')
            .length &&
          ($(this)
            .parents('td.productslist_product_sizes_wrapper')
            .siblings('td.procuctCheckbox')
            .addClass('procuctCheckboxSelect'),
            $(this)
              .parents('td.productslist_product_sizes_wrapper')
              .siblings('td.procuctCheckbox')
              .children('input')
              .prop('checked', !0)),
          $(this).is(':checked')
            ? $(this).parent().addClass('procuctCheckboxSelect')
            : $(this).parent().removeClass('procuctCheckboxSelect');
      });
  };
app_shop.run(
  function () {
    basketedit_productslist_init();
  },
  'all',
  '.basketedit_productslist',
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
        var o = -1 * (n - i.innerText.length);
        n - i.innerText.length <= 0 &&
          o >= n &&
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
      (app_shop.fn.selectPaging = new SelectToDropdown({
        selector: '.s_paging__select:not(.f-dropdown)',
        afterClickDropdownCallback: e => {
          $(e).parents('form').submit();
        },
      })),
        $('.s_paging__item.--filters a').on('click', function (e) {
          return $('html').addClass('filters_open'), e.preventDefault(), !1;
        });
    },
    'all',
    '.s_paging',
    !0,
  ),
  app_shop.run(
    function () {
      $('#menu_messages_warning').length &&
        $('#filter_list').length &&
        $('#menu_messages_warning').appendTo('#filter_list');
    },
    'all',
    '#menu_messages_warning',
    !0,
  ),
  app_shop.run(
    function () {
      $('#search .product__prices').setHeight($('#search')),
        $('#search .product__name').setHeight($('#search'));
    },
    [1, 2, 3, 4],
    '#search',
    !0,
  ),
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
      (app_shop.fn.searchAjax = new SearchAjax({
        onClickSelectors:
          '#search a.product__compare_item, #menu_compare_product a.--remove, .pagination a, #Filters .filters__buttons a, #filter_list a',
        onSubmitSelectors: '#paging_setting_top form, .filters__form',
        updateDomCallback: () => {
          app_shop.fn.infiniteScroll && app_shop.fn.infiniteScroll.reInit(),
            $('html, body').animate({ scrollTop: $('.search_name').offset().top - 20 }, 'fast');
        },
      })),
        window._additional_ajax && app_shop.fn.searchAjax.init();
    },
    'all',
    '#search',
  ),
  app_shop.run(
    function () {
      (app_shop.fn.infiniteScroll = new InfiniteScroll({
        updateDomCallback: () => {
          app_shop.vars.bLazy.revalidate(),
            $('#search .product__prices').setHeight($('#search')),
            $('#search .product__name').setHeight($('#search')),
            void 0 !== runOmnibusFallback &&
            'function' == typeof runOmnibusFallback &&
            runOmnibusFallback();
        },
      })),
        app_shop.fn.infiniteScroll.init();
    },
    'all',
    '.search_page #paging_setting_bottom .pagination',
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
  app_shop.run(
    function () {
      (app_shop.fn.shoppingListPage = new ShoppingListPage()),
        (app_shop.fn.shoppingListPageSelects = new SelectToDropdown({
          selector: '.sl_settings__select',
          afterClickDropdownCallback: e => {
            e.closest('form').submit();
          },
        }));
    },
    'all',
    '.shopping_list',
  ),
  app_shop.run(
    function () {
      $('.sl_products__item.--name').setHeight($('.sl_products')),
        $('.sl_products__item.--prices').setHeight($('.sl_products'));
    },
    [1, 2, 3, 4],
    '.shopping_list',
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
