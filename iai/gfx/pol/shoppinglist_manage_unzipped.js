const ShoppingListPageTxt={selectProduct:"Zaznacz produkt, który chcesz przenieść/skopiować do innej listy.",startShare:"Włącz udostępnianie tej listy",stopShare:"Wyłącz udostępnianie tej listy",changeQuantity:"Musisz zmienić ilość produktów, aby zaktualizować koszyk",minimumQuantity:"Minimalnie musisz zamówić ",maximumQuantity:"Maksymalnie możesz zamówić: "};ShoppingListPage=function(t){const e=this;return this.params=t||{},this.vars={selectedProducts:[],typingTimer:"",doneTypingInterval:500},this.numberCheck=(t,e)=>{const s=void 0!==e?parseFloat(t.val())+parseFloat(e):parseFloat(t.val()),o=t=>void 0!==e?parseFloat(t)-parseFloat(e):t,{amount:a,unit_sellby:r,unit:l,unit_precision:i,max_q:c,max_s:n,min_q:_,min_s:p}=t.data();let u=parseFloat(r);const d=parseFloat(i),h=parseFloat(a),m=parseFloat(c),g=parseFloat(n),f=parseFloat(_),v=parseFloat(p);if(parseFloat(t.val())<=0)return void 0!==e?t.val(parseFloat(t.val())+u):t.val(0),!1;if(!$.isNumeric(s)||s<=u){if(isNaN(m)&&isNaN(g)&&isNaN(f)&&isNaN(v))return void 0!==e?t.val(o(s)):t.val(o(u.toFixed(d))),!0;u=u.toFixed(d)}let L=Math.floor(s/u)*u;L=(s/u*u-L).toFixed(d+1)>0?(1*L+u).toFixed(d):L.toFixed(d),L=void 0!==e?parseFloat(s):parseFloat(L);let y=h,S=u,k=-1,q=-1;if(!isNaN(m)){k=$.map($("."+t.attr("class")),(function(t){return parseFloat($(t).val())})).reduce((function(t,e){return t+e})),k=m-k,k=k<0?"end":k;const e=$("."+t.attr("class")).not(t);e.size()&&(q=$.map(e,(function(t){return parseFloat($(t).val())})).reduce((function(t,e){return t+e})),q=m-q),y=y>m?m:y}return isNaN(g)||(y=y>g?g:y),isNaN(f)||(S=f>S?f:S),isNaN(v)||(S=v>S?v:S),-1!==y&&(S=y>S?S:u),S&&L<S?(Alertek.show_alert(ShoppingListPageTxt.minimumQuantity+" "+Math.ceil(parseFloat(S)/u)*u+" "+l),t.val(o(Math.ceil(parseFloat(S)/u)*u)),!0):"end"===k?(Alertek.show_alert(ShoppingListPageTxt.maximumQuantity+" "+Math.floor(parseFloat(m)/u)*u+" "+l),t.val(o(Math.floor(parseFloat(m)/u)*u)),!0):(L>y&&-1!==y?(Alertek.show_alert(ShoppingListPageTxt.maximumQuantity+" "+Math.floor(parseFloat(y)/u)*u+" "+l),t.val(o(Math.floor(parseFloat(y)/u)*u))):t.val(o(L)),!0)},this.addToBasketMultiproduct=async()=>{const t=new URLSearchParams(new FormData);this.vars.selectedProducts.forEach(((e,s)=>{const o=document.querySelector(`.sl_products__product[data-product_id="${e[0]}"][data-product_size="${e[1]}"]`);if(o&&!o.hasAttribute("data-disabled")&&!o.hasAttribute("data-bundle")){const a=!!document.querySelector(".shopping_list.--list")?o.querySelector(".sl_products__quantity").value:o.getAttribute("data-set_quantity"),r=o.getAttribute("data-additional");t.append(`set_quantity[${s}]`,a),t.append(`product[${s}]`,e[0]),t.append(`size[${s}]`,e[1]),r&&t.append(`additional[${s}]`,r)}})),t.append("getAjax",!0),t.append("mode",1);try{const e=await fetch("/basketchange.php?type=multiproduct",{method:"POST",headers:{"Content-Type":"application/x-www-form-urlencoded; charset=UTF-8",Accept:"application/json"},body:t});await app_shop.graphql.trackingEvents(e);return await e.json()}catch(t){return console.error("AJAX fetchAddToBasketShoppingList() Error:",t),!1}},this.updateSelectedProducts=t=>{this.vars.selectedProducts=[];const e=document.querySelector(".shopping_list");if(e.classList.contains("--group")){document.querySelectorAll(".sl_products__select_input:checked").forEach((t=>{const s=t.closest(".sl_products__product"),o=s.getAttribute("data-product_id"),a=s.getAttribute("data-product_size");s.classList.contains("--changed")&&e.classList.add("--changed"),this.vars.selectedProducts.push([o,a])}))}else if(t){const e=t.closest("[data-product_id]").getAttribute("data-product_id"),s=t.closest("[data-product_size]").getAttribute("data-product_size");this.vars.selectedProducts.push([e,s])}},this.updateProductsContent=()=>{this.vars.selectedProducts.forEach((t=>{const e=document.querySelector(`.sl_products__product[data-product_id="${t[0]}"][data-product_size="${t[1]}"]`);e&&e.parentNode.removeChild(e)}))},this.checkFixedFooter=()=>{const t=document.querySelector(".sl_footer"),e=document.querySelector(".sl_footer__wrapper").offsetHeight,s=window.innerHeight;return!(t.getBoundingClientRect().top-s+e<=0)},this.fixedFooter=()=>{const t=document.querySelector(".sl_footer__wrapper");this.checkFixedFooter()?t.classList.add("--fixed"):t.classList.remove("--fixed")},this.checkSelectProduct=()=>0!==document.querySelectorAll(".sl_products__select_input:checked").length||(Alertek.Start(ShoppingListPageTxt.selectProduct),!1),this.initEvents=()=>{"list"===localStorage.getItem("shoppingListView")&&document.querySelector(".shopping_list").classList.add("--list"),document.addEventListener("click",(async function(t){if(t.target.closest(".sl_settings__group")){t.preventDefault();const s=document.querySelector(".shopping_list"),o=document.querySelectorAll(".sl_products__select_input"),a=document.querySelector(".sl_footer__all"),r=document.querySelector(".sl_footer__wrapper"),l=document.querySelector(".sl_footer__item.--move.--active"),i=document.querySelector(".sl_products__move.--active");s&&(s.classList.toggle("--group"),s.classList.contains("--group")?(o.forEach((t=>{t.checked=!1})),a.checked=!1,l&&l.classList.remove("--active"),i&&i.classList.remove("--active"),document.addEventListener("scroll",e.fixedFooter,!0),e.checkFixedFooter()&&r.classList.add("--fixed")):(document.removeEventListener("scroll",e.fixedFooter,!0),e.checkFixedFooter()||r.classList.remove("--fixed")))}if(t.target.closest(".sl_footer__label")){const e=t.target.closest(".sl_footer__label").previousElementSibling.checked;document.querySelectorAll(".sl_products__select_input").forEach((t=>{t.checked=!e}))}if(t.target.closest(".sl_products__select_input")){const t=document.querySelector(".sl_footer__label");t&&(t.previousElementSibling.checked=!1);const e=document.querySelectorAll(".sl_products__select_input"),s=document.querySelectorAll(".sl_products__select_input:checked");e&&s&&e.length===s.length&&(t.previousElementSibling.checked=!0);let o=0;const a=document.querySelector(".sl_footer__link.--buy");s.forEach((t=>{(t.closest("[data-disabled]")||t.closest("[data-bundle]"))&&(o+=1)})),0!==o&&s.length===o?a.classList.add("--disabled"):a.classList.remove("--disabled")}if(t.target.closest(".sl_settings__view_link")){t.preventDefault();const e=t.target.closest(".sl_settings__view_link"),s=document.querySelector(".shopping_list");e.classList.contains("--gallery")?(s.classList.remove("--list"),localStorage.setItem("shoppingListView","gallery")):e.classList.contains("--list")&&(s.classList.add("--list"),localStorage.setItem("shoppingListView","list"))}if(t.target.closest(".sl_products__link.--move, .sl_footer__link.--move")){t.preventDefault();const s=t.target.closest(".sl_products__link.--move, .sl_footer__link.--move"),o=s.parentNode,a=document.querySelectorAll(".sl_products__move, .sl_footer__item.--move");return s.classList.contains("sl_footer__link")&&!e.checkSelectProduct()||(a.forEach((t=>{t.classList.remove("--active")})),o.classList.add("--active")),!1}if(t.target.closest(".sl_products__option.--close, .sl_footer__option.--close")){t.preventDefault();t.target.closest(".sl_products__option.--close, .sl_footer__option.--close").closest(".--active").classList.remove("--active")}if(t.target.closest(".sl_products__option:not(.--close), .sl_footer__option:not(.--close)")){t.preventDefault();const s=t.target.closest(".sl_products__option:not(.--close), .sl_footer__option:not(.--close)"),o=document.querySelector(".sl_move"),a=document.querySelector(".sl_products__move.--active"),r=document.querySelector(".sl_footer__item.--move.--active");return o&&(o.querySelectorAll(".--success").forEach((t=>{t.classList.remove("--success")})),o.classList.add("--active"),s.classList.contains("--move")?o.classList.add("--move-now"):o.classList.add("--copy-now"),a&&a.classList.remove("--active"),r&&r.classList.remove("--active"),Modal({element:o,classList:"--sl-move --medium --mobile",afterClose:()=>{o.classList.remove("--active","--move-now","--copy-now")}})),e.updateSelectedProducts(s),!1}if(t.target.closest(".sl_move__button")&&!t.target.closest(".sl_move__button.--loading")){const s=t.target.closest(".sl_move__button"),o=s.closest(".shopping_list__block").querySelector(".sl_move__input:checked"),a=document.querySelector(".shopping_list[data-list_id]").getAttribute("data-list_id"),r=o.closest("[data-list_id]").getAttribute("data-list_id"),l=s.closest(".--copy-now")?o.closest(".sl_move__list"):o.closest(".sl_move__item"),i=s.classList.contains("--mobile");i&&s.closest(".--move-now")&&app_shop.fn.shoppingList.status(s,"loading"),app_shop.fn.shoppingList.status(l,"loading");const c=()=>{app_shop.fn.shoppingList.queryCombo({fetchDataQuery:app_shop.fn.shoppingList.deleteProductQuery(a,e.vars.selectedProducts),afterSuccess:()=>{e.updateProductsContent(),document.querySelector(".sl_products__product")?app_shop.fn.shoppingList.updateListCount({idList:a,afterSuccess:()=>{i&&app_shop.fn.shoppingList.status(s,"success"),app_shop.fn.shoppingList.status(l,"success"),setTimeout((function(){const t=document.querySelector(".sl_move.--active");t&&t.classList.remove("--active","--move-now","--copy-now"),window.closeModal()}),1e3),e.checkFixedFooter()||document.querySelector(".sl_footer__wrapper").classList.remove("--fixed")},afterError:()=>{i&&app_shop.fn.shoppingList.status(s,"error"),app_shop.fn.shoppingList.status(l,"error")}}):window.location.reload()},afterError:()=>{i&&app_shop.fn.shoppingList.status(s,"error"),app_shop.fn.shoppingList.status(l,"error")}})};app_shop.fn.shoppingList.queryCombo({fetchDataQuery:app_shop.fn.shoppingList.addProductQuery(r,e.vars.selectedProducts),afterSuccess:()=>{s.closest(".--move-now")?(c(),app_shop.fn.shoppingList.updateListCount({idList:r})):app_shop.fn.shoppingList.updateListCount({idList:r,afterSuccess:()=>{app_shop.fn.shoppingList.status(l,"success",!0)},afterError:()=>{app_shop.fn.shoppingList.status(l,"error")}})},afterError:()=>{i&&s.closest(".--move-now")&&app_shop.fn.shoppingList.status(s,"error"),app_shop.fn.shoppingList.status(l,"error")}})}if(t.target.closest(".sl_header__mobile, .sl_m_manage__close, .sl_d_manage__close, .slm_lists__manage")){t.preventDefault();const e=document.querySelector(".sl_manage");return e&&e.classList.toggle("--active"),Modal({element:e,classList:"--sl-manage --medium --mobile",afterClose:()=>{e.classList.remove("--active")}}),!1}if(t.target.closest(".sl_change_name__button")){t.preventDefault();const e=t.target.closest(".sl_change_name__button"),s=e.closest(".sl_change_name").querySelector(".sl_change_name__input"),o=e.closest("[data-list_id]").getAttribute("data-list_id");return s.checkValidity()?(app_shop.fn.shoppingList.queryCombo({statusElement:e.closest(".sl_change_name").parentNode,fetchDataQuery:app_shop.fn.shoppingList.updateListQuery({idList:o,nameList:s.value}),afterSuccess:()=>{e.closest(".sl_d_manage__list")?e.closest(".sl_d_manage__list").classList.remove("--active"):e.closest(".sl_m_manage__list")&&e.closest(".sl_m_manage__list").classList.remove("--active"),app_shop.fn.shoppingList.updateListName(o,s.value),s.value=""}}),!1):(s.reportValidity(),!1)}if(t.target.closest(".sl_products__link.--remove, .sl_footer__link.--remove")){t.preventDefault();const s=t.target.closest(".sl_products__link.--remove, .sl_footer__link.--remove"),o=document.querySelector(".shopping_list[data-list_id]").getAttribute("data-list_id"),a=s.classList.contains("sl_footer__link"),r=document.querySelectorAll(".sl_products__select_input:checked"),l=s.closest(".sl_products__product");if(a&&!e.checkSelectProduct())return!1;e.updateSelectedProducts(s),a?r.forEach((t=>{app_shop.fn.shoppingList.status(t.closest(".sl_products__product"),"loading")})):app_shop.fn.shoppingList.status(l,"loading"),app_shop.fn.shoppingList.queryCombo({fetchDataQuery:app_shop.fn.shoppingList.deleteProductQuery(o,e.vars.selectedProducts),afterSuccess:()=>{a?r.forEach((t=>{t.closest(".sl_products__product").parentNode.removeChild(t.closest(".sl_products__product"))})):l.parentNode.removeChild(l),e.checkFixedFooter()||document.querySelector(".sl_footer__wrapper").classList.remove("--fixed"),document.querySelector(".sl_products__product")?app_shop.fn.shoppingList.updateListCount({idList:o}):window.location.reload()},afterError:()=>{a?r.forEach((t=>{app_shop.fn.shoppingList.status(t.closest(".sl_products__product"),"error")})):app_shop.fn.shoppingList.status(l,"error")}})}if(t.target.closest(".sl_m_manage__edit.--remove, .sl_d_manage__edit.--remove, .sl_m_manage__link.--remove")){t.preventDefault();t.target.closest(".sl_m_manage__edit.--remove, .sl_d_manage__edit.--remove, .sl_m_manage__link.--remove").parentNode.classList.toggle("--sure")}if(t.target.closest(".sl_remove__link.--yes")){t.preventDefault();const e=t.target.closest(".sl_remove__link.--yes"),s=e.closest("[data-list_id]"),o=document.querySelector(".shopping_list").getAttribute("data-list_id"),a=s.getAttribute("data-list_id");return app_shop.fn.shoppingList.queryCombo({statusElement:s.classList.contains("shopping_list")?e.closest(".sl_m_manage__option"):s,fetchDataQuery:app_shop.fn.shoppingList.deleteListQuery(a),afterSuccess:()=>{a===o?window.location.href="/shoppinglist.php":app_shop.fn.shoppingList.updateListDelete(a)}}),!1}if(t.target.closest(".sl_remove__link.--no")){t.preventDefault();const e=t.target.closest(".sl_remove__link.--no").closest(".--sure");e&&e.classList.remove("--sure")}if(t.target.closest(".sl_m_manage__link.--share, .sl_header__share")){t.preventDefault();const e=document.querySelector(".sl_share"),s=document.querySelector(".sl_share__option.--copy.--active"),o=document.querySelector(".sl_manage.--active");if(navigator.share&&app_shop.vars.view<3){const t=document.querySelector(".sl_header__headline span").textContent,e=document.querySelector(".sl_share__copy_input").value;navigator.share({title:t,url:e}).catch((t=>{console.error("Navigator.share in ShoppingList shareElements Error:",t)}))}else e&&e.classList.add("--active"),s&&s.classList.remove("--active"),o&&o.classList.remove("--active"),Modal({element:e,classList:"--sl-share --medium --mobile",afterClose:()=>{e.classList.remove("--active")}});return!1}if(t.target.closest(".sl_share__link.--copy, .sl_share__copy_input")){t.preventDefault();const e=t.target.closest(".sl_share__link.--copy, .sl_share__copy_input"),s=document.querySelector(".sl_share__copy_input"),o=e.closest(".sl_share__option");s&&(s.select(),s.setSelectionRange(0,99999),document.execCommand("copy"),o&&o.classList.add("--active"))}if(t.target.closest(".sl_m_manage__link.--stop, .sl_share__link.--stop, .sl_m_manage__link.--start, .sl_share__link.--start")){t.preventDefault();const e=t.target.closest(".sl_m_manage__link.--stop, .sl_share__link.--stop, .sl_m_manage__link.--start, .sl_share__link.--start"),s=document.querySelector(".shopping_list[data-list_id]").getAttribute("data-list_id");return app_shop.fn.shoppingList.queryCombo({statusElement:e.parentNode,fetchDataQuery:app_shop.fn.shoppingList.updateListQuery({idList:s,publicList:!e.classList.contains("--stop")}),afterSuccess:()=>{e.classList.contains("--stop")?(e.classList.remove("--stop"),e.classList.add("--start"),e.textContent=ShoppingListPageTxt.startShare):(e.classList.remove("--start"),e.classList.add("--stop"),e.textContent=ShoppingListPageTxt.stopShare),app_shop.fn.shoppingList.updateListShare(s)}}),!1}if(t.target.closest(".sl_m_manage__edit.--change-name, .sl_d_manage__edit.--change-name, .sl_m_manage__link.--change-name")){t.preventDefault();const e=t.target.closest(".sl_m_manage__edit.--change-name, .sl_d_manage__edit.--change-name, .sl_m_manage__link.--change-name").parentNode;e.classList.toggle("--active"),e.querySelector("input").focus()}if(t.target.closest(".sl_products__buy, .sl_footer__link.--buy")){t.preventDefault();const s=t.target.closest(".sl_products__buy, .sl_footer__link.--buy"),o=s.closest("[data-disabled]"),a=s.closest(".sl_products__product"),r=!!document.querySelector(".shopping_list.--list"),l=!!document.querySelector(".shopping_list.--group");if(o||s.classList.contains("--disabled")||s.classList.contains("sl_footer__link")&&!e.checkSelectProduct())return!1;if(e.updateSelectedProducts(s),r&&(l&&!document.querySelector(".shopping_list.--changed ")||a&&!a.classList.contains("--changed")))return Alertek.Start(ShoppingListPageTxt.changeQuantity),!1;s.classList.contains("sl_footer__link")?app_shop.fn.shoppingList.status(s.closest(".sl_footer__wrapper"),"loading"):app_shop.fn.shoppingList.status(s.closest(".sl_products__product"),"loading");const i=await e.addToBasketMultiproduct();i?(fetch("/return.php"),s.classList.contains("sl_footer__link")?app_shop.fn.shoppingList.status(s.closest(".sl_footer__wrapper"),"success"):app_shop.fn.shoppingList.status(s.closest(".sl_products__product"),"success"),document.querySelector(".topBasket.--hide")&&document.querySelector(".topBasket.--hide").classList.remove("--hide"),"function"==typeof menu_basket_cache?menu_basket_cache():"function"==typeof app_shop.fn.menu_basket_cache&&app_shop.fn.menu_basket_cache(),document.querySelector(".shopping_list").classList.remove("--changed"),e.vars.selectedProducts.forEach((t=>{const s=document.querySelector(`.sl_products__product[data-product_id="${t[0]}"][data-product_size="${t[1]}"]`);if(s&&!s.hasAttribute("data-disabled")&&!s.hasAttribute("data-bundle")){const o=+s.getAttribute("data-sellby");s.classList.remove("--changed");const a=i.basket.products.filter((e=>e.id===t[0]&&e.size===t[1]));a.length?(s.setAttribute("data-set_quantity",a[0].count+o),s.querySelector(".sl_products__quantity").value=a[0].count,s.setAttribute("data-additional",a[0].md5_additional),e.numberCheck($(s.querySelector(".sl_products__quantity")))):(s.setAttribute("data-set_quantity",o),s.querySelector(".sl_products__quantity").value=0)}}))):s.classList.contains("sl_footer__link")?app_shop.fn.shoppingList.status(s.closest(".sl_footer__wrapper"),"error"):app_shop.fn.shoppingList.status(s.closest(".sl_products__product"),"error")}const s=document.querySelector(".sl_footer__item.--move.--active");s&&!s.querySelector(".sl_footer__move_options").contains(t.target)&&s.classList.remove("--active");const o=document.querySelector(".sl_products__move.--active");return o&&!o.querySelector(".sl_products__move_options").contains(t.target)&&o.classList.remove("--active"),!1}));document.querySelectorAll(".sl_products__quantity").forEach((t=>{t.addEventListener("keyup",(function(){clearTimeout(e.vars.typingTimer),e.vars.typingTimer=setTimeout((()=>{if(""!==this.value){this.setAttribute("data-prev",this.value);const t=this.closest(".sl_products__product");e.numberCheck($(this)),t.classList.add("--changed")}}),e.vars.doneTypingInterval)})),t.addEventListener("blur",(function(){""===this.value&&(this.value=this.getAttribute("data-prev"))}))}));document.querySelectorAll(".sl_products__number_down, .sl_products__number_up").forEach((t=>{t.addEventListener("click",(function(t){t.preventDefault();const s=this.closest(".sl_products__number_wrapper").querySelector(".sl_products__quantity"),o=this.closest(".sl_products__product"),a=s.getAttribute("data-unit_sellby"),r=!!this.classList.contains("sl_products__number_up");return s.value=r?parseFloat(s.value,10)+parseFloat(a):parseFloat(s.value,10)-parseFloat(a),e.numberCheck($(s)),o.classList.add("--changed"),!1}))})),document.querySelectorAll(".sl_products__quantity").forEach((t=>{e.numberCheck($(t))}))},this.initEvents()};