<?xml version="1.0" encoding="UTF-8"?>
<iaixsl:stylesheet xmlns:php="http://php.net/xsl" xmlns:iaixsl="http://www.w3.org/1999/XSL/Transform" xmlns:iaielement="http://iai-system.com/ddd" xmlns:fb="http://www.facebook.com/2008/fbml" version="1.0" exclude-result-prefixes="php iaielement fb"><iaixsl:output indent="no" method="html" doctype-system="about:legacy-compat" version="1.0" encoding="UTF-8"/><iaixsl:strip-space elements="table tr td img"/><iaixsl:decimal-format name="yen" NaN="" grouping-separator="," decimal-separator="."/><iaixsl:template match="shop"><!-- (envelope, 60dd8eb7808547.00364708.18)-->
	<iaixsl:variable name="priceTypeVat"><iaixsl:if test="(/shop/basket/@login and not(/shop/client_data/@uses_vat='false') or not(/shop/basket/@login)) and not(/shop/contact/owner/@vat_registered = 'false') and not(/shop/page/@price_type = 'hidden')">true</iaixsl:if></iaixsl:variable>
	<iaixsl:variable name="priceTypeText"><iaixsl:if test="not($priceTypeVat = '')"><iaixsl:choose><iaixsl:when test="/shop/page/@price_type = 'net'"> netto</iaixsl:when><iaixsl:when test="/shop/page/@price_type = 'gross'"> brutto</iaixsl:when></iaixsl:choose></iaixsl:if></iaixsl:variable>
	<iaixsl:variable name="meta_langcode_iso639">pl</iaixsl:variable>
	<iaixsl:variable name="html5_layout">1</iaixsl:variable>
	<iaixsl:variable name="asyncJS"/>
	<iaixsl:variable name="themeColor">#b29370</iaixsl:variable>
	<iaixsl:if test="(action/set_render/item/@name = 'popup') or not(action/set_render/item)">
		<iaixsl:text disable-output-escaping="yes">&lt;html lang=&quot;</iaixsl:text><iaixsl:value-of select="/shop/language/option[@selected = 'true']/@name"/><iaixsl:text disable-output-escaping="yes">&quot;</iaixsl:text><iaixsl:text disable-output-escaping="yes"> class=&quot;</iaixsl:text><iaixsl:if test="(/shop/page/@type = 'prepaid' and /shop/page/prepaid/details/@msg = 'order') or /shop/page/@type = 'order-nonstandardized' or /shop/page/@type = 'order1' or /shop/page/@type = 'order2' or /shop/page/@type = 'pickup-sites' or /shop/page/@type = 'place-order' or (/shop/page/@type = 'login' and /shop/page/login/response/@type = 'no login') or /shop/page/@type = 'client-new'"><iaixsl:text disable-output-escaping="yes">order_process </iaixsl:text></iaixsl:if><iaixsl:if test="/shop/page/@type = 'place-order'"> --place-order-page </iaixsl:if><iaixsl:if test="/shop/page/@type = 'return'"><iaixsl:value-of select="/shop/page/return/@type"/><iaixsl:text disable-output-escaping="yes"> </iaixsl:text></iaixsl:if><iaixsl:if test="/shop/basket/@toshippingfree != ''"><iaixsl:text disable-output-escaping="yes">--freeShipping </iaixsl:text></iaixsl:if><iaixsl:if test="/shop/rebatecode/@code"><iaixsl:text disable-output-escaping="yes">--rabateCode </iaixsl:text></iaixsl:if><iaixsl:if test="not($priceTypeVat = '')"><iaixsl:text disable-output-escaping="yes">--vat --</iaixsl:text><iaixsl:value-of select="/shop/page/@price_type"/><iaixsl:text disable-output-escaping="yes"> </iaixsl:text></iaixsl:if><iaixsl:text disable-output-escaping="yes">&quot;</iaixsl:text><iaixsl:text disable-output-escaping="yes"> &gt;</iaixsl:text>
		<iaixsl:if test="$meta_langcode_iso639"><iaixsl:attribute name="lang"><iaixsl:value-of select="$meta_langcode_iso639"/></iaixsl:attribute></iaixsl:if>
		<head>
			<iaixsl:text disable-output-escaping="yes">&lt;meta name=&apos;viewport&apos; content=&apos;user-scalable=no, initial-scale = 1.0, maximum-scale = 1.0, width=device-width, viewport-fit=cover&apos;/&gt; &lt;link rel=&quot;preload&quot; crossorigin=&quot;anonymous&quot; as=&quot;font&quot; href=&quot;/gfx/standards/fontello.woff?v=2&quot;&gt;</iaixsl:text>
			<iaixsl:variable name="meta_breadcrumb">
				<iaixsl:if test="(page/@type='search') or (page/@type='navigation') or (page/@type='projector')">
					<iaixsl:choose>
						<iaixsl:when test="page/@type='navigation'">
							<iaixsl:for-each select="bc/item"><iaixsl:value-of select="@title"/> | </iaixsl:for-each>
						</iaixsl:when>
						<iaixsl:otherwise>
							<iaixsl:for-each select="bc/item[not(position() = last())]"><iaixsl:value-of select="@title"/> | </iaixsl:for-each>
						</iaixsl:otherwise>
					</iaixsl:choose>
					
				</iaixsl:if>
			</iaixsl:variable>
			<iaixsl:variable name="meta_breadcrumb_full">
				<iaixsl:if test="(page/@type='search') or (page/@type='navigation') or (page/@type='projector')">
					<iaixsl:for-each select="bc/item"><iaixsl:value-of select="@title"/> | </iaixsl:for-each>
					
				</iaixsl:if>
			</iaixsl:variable>
			<iaixsl:variable name="meta_subcategories">
				<iaixsl:if test="((page/@type='search') or (page/@type='navigation') or (page/@type='projector')) and (/shop/navigation/current/@ni)">
					<iaixsl:for-each select="navigation/descendant-or-self::item[@ni=/shop/navigation/current/@ni]/item"><iaixsl:value-of select="@name"/>, </iaixsl:for-each>
				</iaixsl:if>
			</iaixsl:variable>
			<iaixsl:variable name="meta_variable_emulate_ie">IE=edge</iaixsl:variable>
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
			<iaixsl:if test="$meta_variable_emulate_ie">
				<meta http-equiv="X-UA-Compatible"><iaixsl:attribute name="content"><iaixsl:value-of select="$meta_variable_emulate_ie"/></iaixsl:attribute></meta>
			</iaixsl:if>
			<iaixsl:choose>
				<iaixsl:when test="page/@search_title">
					<title><iaixsl:value-of select="page/@search_title" disable-output-escaping="yes"/></title>
				</iaixsl:when>
				<iaixsl:when test="page/@projector_title">
					<title><iaixsl:value-of select="page/@projector_title" disable-output-escaping="yes"/> | <iaixsl:value-of select="$meta_breadcrumb_full" disable-output-escaping="yes"/><iaixsl:value-of select="page/@title" disable-output-escaping="yes"/></title>
				</iaixsl:when>
				<iaixsl:otherwise>
					<title><iaixsl:value-of select="$meta_breadcrumb" disable-output-escaping="yes"/><iaixsl:value-of select="page/@title" disable-output-escaping="yes"/><iaixsl:if test="page/@title2"> | <iaixsl:value-of select="page/@title2" disable-output-escaping="yes"/></iaixsl:if></title>
				</iaixsl:otherwise>
			</iaixsl:choose>
			<iaixsl:choose>
				<iaixsl:when test="page/@search_keywords">
					<meta name="keywords"><iaixsl:attribute name="content"><iaixsl:value-of select="page/@search_keywords"/></iaixsl:attribute></meta>
				</iaixsl:when>
				<iaixsl:when test="page/@projector_keywords">
					<meta name="keywords"><iaixsl:attribute name="content"><iaixsl:value-of select="page/@projector_keywords"/> | <iaixsl:value-of select="$meta_breadcrumb_full"/><iaixsl:value-of select="$meta_subcategories"/><iaixsl:value-of select="page/@keywords"/></iaixsl:attribute></meta>
				</iaixsl:when>
				<iaixsl:when test="not(page/@keywords='')">
					<meta name="keywords">
						<iaixsl:attribute name="content">
							<iaixsl:value-of select="$meta_breadcrumb_full"/>
							<iaixsl:value-of select="$meta_subcategories"/>
							<iaixsl:choose>
								<iaixsl:when test="not(page/@keywords='') ">
									<iaixsl:value-of select="page/@keywords"/>
								</iaixsl:when>
								<iaixsl:otherwise>
									
								</iaixsl:otherwise>
							</iaixsl:choose>
						</iaixsl:attribute>
					</meta>
				</iaixsl:when>
				<iaixsl:otherwise>
				</iaixsl:otherwise>
			</iaixsl:choose>
			<iaixsl:choose>
				<iaixsl:when test="page/@search_description">
					<meta name="description"><iaixsl:attribute name="content"><iaixsl:value-of select="page/@search_description"/></iaixsl:attribute></meta>
				</iaixsl:when>
				<iaixsl:when test="page/@projector_description">
					<meta name="description"><iaixsl:attribute name="content"><iaixsl:value-of select="page/@projector_description"/> | <iaixsl:value-of select="$meta_breadcrumb_full"/><iaixsl:value-of select="$meta_subcategories"/><iaixsl:value-of select="page/@description"/></iaixsl:attribute></meta>
				</iaixsl:when>
				<iaixsl:otherwise>
					<meta name="description"><iaixsl:attribute name="content"><iaixsl:value-of select="$meta_breadcrumb"/><iaixsl:value-of select="$meta_subcategories"/><iaixsl:value-of select="page/@description"/></iaixsl:attribute></meta>
				</iaixsl:otherwise>
			</iaixsl:choose>
			
			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"/>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
			<link rel="shortcut icon" href="/data/designs/xsl/11_1/gfx/assets/favicon.ico" />
		
			
			<iaixsl:choose>
				<iaixsl:when test="/shop/mask/@scheme_color">
					<meta name="theme-color"><iaixsl:attribute name="content"><iaixsl:value-of select="/shop/mask/@scheme_color"/></iaixsl:attribute></meta>
					<meta name="msapplication-navbutton-color"><iaixsl:attribute name="content"><iaixsl:value-of select="/shop/mask/@scheme_color"/></iaixsl:attribute></meta>
					<meta name="apple-mobile-web-app-status-bar-style"><iaixsl:attribute name="content"><iaixsl:value-of select="/shop/mask/@scheme_color"/></iaixsl:attribute></meta>
				</iaixsl:when>
				<iaixsl:when test="$themeColor">
					<meta name="theme-color"><iaixsl:attribute name="content"><iaixsl:value-of select="$themeColor"/></iaixsl:attribute></meta>
					<meta name="msapplication-navbutton-color"><iaixsl:attribute name="content"><iaixsl:value-of select="$themeColor"/></iaixsl:attribute></meta>
					<meta name="apple-mobile-web-app-status-bar-style"><iaixsl:attribute name="content"><iaixsl:value-of select="$themeColor"/></iaixsl:attribute></meta>
				</iaixsl:when>
			</iaixsl:choose>

       
      
      
			<iaixsl:choose>
				<iaixsl:when test="$asyncJS">
					<iaixsl:choose>
						<iaixsl:when test="/shop/@preview &gt; 0">
							<link rel="preload stylesheet" as="style"><iaixsl:attribute name="href">/gfx/<iaixsl:value-of select="language/@id"/>/style.css</iaixsl:attribute></link>
						</iaixsl:when>
						<iaixsl:otherwise>
							<link rel="preload stylesheet" as="style"><iaixsl:attribute name="href">/gfx/<iaixsl:value-of select="language/@id"/>/style.css.gzip?r=1696937761</iaixsl:attribute></link>
						</iaixsl:otherwise>
					</iaixsl:choose>
				</iaixsl:when>
				<iaixsl:otherwise>
					<iaixsl:choose>
						<iaixsl:when test="/shop/@preview &gt; 0">
							<link rel="preload stylesheet" as="style"><iaixsl:attribute name="href">/gfx/<iaixsl:value-of select="language/@id"/>/style.css</iaixsl:attribute></link>
						</iaixsl:when>
						<iaixsl:otherwise>
							<link rel="preload stylesheet" as="style"><iaixsl:attribute name="href">/gfx/<iaixsl:value-of select="language/@id"/>/style.css</iaixsl:attribute></link>
						</iaixsl:otherwise>
					</iaixsl:choose>
				</iaixsl:otherwise>
			</iaixsl:choose>
			<script>var app_shop={urls:{prefix:&apos;data=&quot;/gfx/&apos;.replace(&apos;data=&quot;&apos;, &apos;&apos;)+&apos;<iaixsl:value-of select="language/@id"/>/&apos;,graphql:&apos;/graphql/v1/&apos;},vars:{priceType:&apos;<iaixsl:choose><iaixsl:when test="/shop/page/@price_type = 'hidden'">gross</iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="/shop/page/@price_type"/></iaixsl:otherwise></iaixsl:choose>&apos;,priceTypeVat:<iaixsl:choose><iaixsl:when test="not($priceTypeVat = '')">true</iaixsl:when><iaixsl:otherwise>false</iaixsl:otherwise></iaixsl:choose>,productDeliveryTimeAndAvailabilityWithBasket:false,geoipCountryCode:&apos;<iaixsl:value-of select="/shop/@geoip_country_code"/>&apos;,currency:{id:&apos;<iaixsl:value-of select="/shop/currency/option[@selected='true']/@id"/>&apos;,symbol:&apos;<iaixsl:value-of select="/shop/currency/option[@selected='true']/@symbol"/>&apos;,country:&apos;<iaixsl:value-of select="/shop/currency/option[@selected='true']/@country"/>&apos;,format:&apos;<iaixsl:value-of select="/shop/currency/option[@selected='true']/@currency_format"/>&apos;,beforeValue:<iaixsl:value-of select="/shop/currency/option[@selected='true']/@currency_before_value"/>,space:<iaixsl:value-of select="/shop/currency/option[@selected='true']/@currency_space"/>,decimalSeparator:&apos;<iaixsl:value-of select="/shop/currency/option[@selected='true']/@currency_decimal_separator"/>&apos;,groupingSeparator:&apos;<iaixsl:value-of select="/shop/currency/option[@selected='true']/@currency_grouping_separator"/>&apos;},language:{id:&apos;<iaixsl:value-of select="/shop/language/option[@selected='true']/@id"/>&apos;,symbol:&apos;<iaixsl:value-of select="/shop/language/option[@selected='true']/@name"/>&apos;,name:&apos;<iaixsl:value-of select="/shop/language/@name"/>&apos;},},txt:{priceTypeText:&apos;<iaixsl:value-of select="$priceTypeText"/>&apos;,},fn:{},fnrun:{},files:[],graphql:{}};const getCookieByName=(name)=&gt;{const value=`; ${document.cookie}`;const parts = value.split(`; ${name}=`);if(parts.length === 2) return parts.pop().split(&apos;;&apos;).shift();return false;};if(getCookieByName(&apos;freeeshipping_clicked&apos;)){document.documentElement.classList.remove(&apos;--freeShipping&apos;);}if(getCookieByName(&apos;rabateCode_clicked&apos;)){document.documentElement.classList.remove(&apos;--rabateCode&apos;);}function hideClosedBars(){const closedBarsArray=JSON.parse(localStorage.getItem(&apos;closedBars&apos;))||[];if(closedBarsArray.length){const styleElement=document.createElement(&apos;style&apos;);styleElement.textContent=`${closedBarsArray.map((el)=&gt;`#${el}`).join(&apos;,&apos;)}{display:none !important;}`;document.head.appendChild(styleElement);}}hideClosedBars();</script>
			<iaixsl:variable name="projector_script_bottom">true</iaixsl:variable>
			<iaixsl:if test="/shop/page/@type = 'main' or /shop/page/@type = 'search' or /shop/page/@type = 'place-order' or /shop/page/@type = 'noproduct' or ($projector_script_bottom and /shop/page/@type = 'projector')">
		<iaixsl:choose>
			<iaixsl:when test="/shop/@preview &gt; 0">
				<script id="scriptmain"><iaixsl:attribute name="src">/gfx/<iaixsl:value-of select="language/@id"/>/<iaixsl:value-of select="/shop/@preview"/>/shop.js</iaixsl:attribute></script>
				
			</iaixsl:when>
			<iaixsl:otherwise>
				<script id="scriptmain"><iaixsl:attribute name="src">/gfx/<iaixsl:value-of select="language/@id"/>/shop.js.gzip?r=1696937761</iaixsl:attribute></script>
				
			</iaixsl:otherwise>
		</iaixsl:choose>

		
		
	</iaixsl:if>

	
			<script>
		 let a = document.querySelector('#scriptmain').src.split('/');
		 a.splice(-1)
		 const mainGfxUrl = a.join('/') + '/gfx/'
		 a.splice(-1)
		 const mainAssetsUrl = a.join('/') + '/assets/'
			</script>
			
			
			
			<iaixsl:text disable-output-escaping="yes"></iaixsl:text>
			<iaixsl:variable name="meta_variable_expires">never</iaixsl:variable>
			<iaixsl:variable name="meta_variable_distribution">global</iaixsl:variable>
			<iaixsl:variable name="meta_variable_rating">general</iaixsl:variable>
			<iaixsl:choose>
				<iaixsl:when test="/shop/page/@meta_robots">
					<meta name="robots">
						<iaixsl:attribute name="content"><iaixsl:value-of select="/shop/page/@meta_robots"/></iaixsl:attribute>
					</meta>
				</iaixsl:when>
				<iaixsl:otherwise>
					<meta name="robots">
						<iaixsl:attribute name="content">INDEX,FOLLOW</iaixsl:attribute>
					</meta>
				</iaixsl:otherwise>
			</iaixsl:choose>
			<iaixsl:if test="not($html5_layout)">
				<iaixsl:if test="$meta_variable_expires">
					<meta name="expires"><iaixsl:attribute name="content"><iaixsl:value-of select="$meta_variable_expires"/></iaixsl:attribute></meta>
				</iaixsl:if>
				<iaixsl:if test="$meta_variable_distribution">
					<meta name="distribution"><iaixsl:attribute name="content"><iaixsl:value-of select="$meta_variable_distribution"/></iaixsl:attribute></meta>
				</iaixsl:if>
			</iaixsl:if>
			<iaixsl:if test="$meta_variable_rating">
				<meta name="rating"><iaixsl:attribute name="content"><iaixsl:value-of select="$meta_variable_rating"/></iaixsl:attribute></meta>
			</iaixsl:if>
			<iaixsl:if test="/shop/iai/@meta_author">
				<meta name="Author">
					<iaixsl:attribute name="content"><iaixsl:value-of select="/shop/iai/@meta_author"/></iaixsl:attribute>
				</meta>
			</iaixsl:if>
			<iaixsl:if test="page/facebook_comments">
				<meta property="fb:admins">
					<iaixsl:attribute name="content"><iaixsl:value-of select="/shop/page/facebook_comments/@admin_id"/></iaixsl:attribute>
				</meta>
				<meta property="fb:app_id">
					<iaixsl:attribute name="content"><iaixsl:value-of select="/shop/page/facebook_comments/@app_id"/></iaixsl:attribute>
				</meta>
			</iaixsl:if>
			<iaixsl:value-of disable-output-escaping="yes" select="php:functionString('additionalContent', 'additional_meta_tags')"/>

			
			
			<iaixsl:if test="/shop/page/@type = 'main' and count(commercial_banner/link[not(html)]) &gt; 0">
				<iaixsl:choose>
					<iaixsl:when test="/shop/commercial_banner/link[1]/image">
						<link rel="preload" as="image">
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/commercial_banner/link[1]/image/@src"/></iaixsl:attribute>
						</link>
					</iaixsl:when>
					<iaixsl:otherwise>
						<link rel="preload" as="image" media="(max-width: 756.9px)">
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/commercial_banner/link[1]/image_mobile/@src"/></iaixsl:attribute>
						</link>
						<link rel="preload" as="image" media="(min-width: 757px) and (max-width: 978.9px)">
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/commercial_banner/link[1]/image_tablet/@src"/></iaixsl:attribute>
						</link>
						<link rel="preload" as="image" media="(min-width: 979px)">
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/commercial_banner/link[1]/image_desktop/@src"/></iaixsl:attribute>
						</link>
					</iaixsl:otherwise>
				</iaixsl:choose>
			</iaixsl:if>
			
			<iaixsl:if test="/shop/page/@type = 'search' and /shop/page/products/display_mode/@active = 'normal' and /shop/page/products/product">
				<link rel="preload" as="image" media="(max-width: 420px)">
					<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/page/products/product[1]/icon_small"/></iaixsl:attribute>
				</link>
				<link rel="preload" as="image" media="(min-width: 420.1px)">
					<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/page/products/product[1]/icon"/></iaixsl:attribute>
				</link>
				<iaixsl:if test="/shop/page/products/product[2]">
					<link rel="preload" as="image" media="(max-width: 420px)">
						<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/page/products/product[2]/icon_small"/></iaixsl:attribute>
					</link>
					<link rel="preload" as="image" media="(min-width: 420.1px)">
						<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/page/products/product[2]/icon"/></iaixsl:attribute>
					</link>
				</iaixsl:if>
			</iaixsl:if>
			
			<iaixsl:if test="/shop/page/@type = 'projector'">
				<link rel="preload" as="image">
					<iaixsl:choose>
						<iaixsl:when test="count(/shop/page/projector/product/enclosures/images/enclosure) &gt; 0">
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/page/projector/product/enclosures/images/enclosure[1]/@medium"/></iaixsl:attribute>
						</iaixsl:when>
						<iaixsl:when test="/shop/page/projector/bundled/product[enclosures/images/enclosure[1]/@icon]">
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/page/projector/bundled/product[enclosures/images/enclosure[1]/@icon]/enclosures/images/enclosure[1]/@medium"/></iaixsl:attribute>
						</iaixsl:when>
						<iaixsl:otherwise>
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/page/projector/product/icon"/></iaixsl:attribute>
						</iaixsl:otherwise>
					</iaixsl:choose>
				</link>
			</iaixsl:if>

			
			<iaixsl:if test="/shop/page/@type = 'projector' and (count(/shop/page/projector/product/enclosures/images/enclosure) &gt; 0 or /shop/page/projector/bundled/product[enclosures/images/enclosure[1]/@icon])">
				<style>
					<iaixsl:choose>
						<iaixsl:when test="count(/shop/page/projector/product/enclosures/images/enclosure) &gt; 0">
							#photos_slider[data-skeleton] .photos__link:before {
								padding-top: calc(<iaixsl:value-of select="/shop/page/projector/product/enclosures/images/enclosure[1]/@medium_height"/>/<iaixsl:value-of select="/shop/page/projector/product/enclosures/images/enclosure[1]/@medium_width"/>* 100%);
							}
							@media (min-width: 979px) {.photos__slider[data-skeleton] .photos__figure:not(.--nav):first-child .photos__link {
								max-height: <iaixsl:value-of select="/shop/page/projector/product/enclosures/images/enclosure[1]/@medium_height"/>px;
							}}
						</iaixsl:when>
						<iaixsl:when test="/shop/page/projector/bundled/product[enclosures/images/enclosure[1]/@icon]">
							#photos_slider[data-skeleton] .photos__link:before {
								padding-top: calc(<iaixsl:value-of select="/shop/page/projector/bundled/product[enclosures/images/enclosure[1]/@icon]/enclosures/images/enclosure[1]/@medium_height"/>/<iaixsl:value-of select="/shop/page/projector/bundled/product[enclosures/images/enclosure[1]/@icon]/enclosures/images/enclosure[1]/@medium_width"/>* 100%);
							}
							@media (min-width: 979px) {.photos__slider[data-skeleton] .photos__figure:not(.--nav):first-child .photos__link {
								max-height: <iaixsl:value-of select="/shop/page/projector/bundled/product[enclosures/images/enclosure[1]/@icon]/enclosures/images/enclosure[1]/@medium_height"/>px;
							}}
						</iaixsl:when>
					</iaixsl:choose>
				</style>
			</iaixsl:if>
		</head>
		<iaixsl:variable name="meta_body_id"/>
		<iaixsl:text disable-output-escaping="yes">&lt;body</iaixsl:text><iaixsl:if test="action/set_render/item/@name = 'popup'"><iaixsl:text disable-output-escaping="yes"> class=&quot;popup&quot; </iaixsl:text></iaixsl:if><iaixsl:text disable-output-escaping="yes">&gt;</iaixsl:text>

		<iaixsl:if test="$meta_body_id">
			<iaixsl:attribute name="id"><iaixsl:value-of select="$meta_body_id"/></iaixsl:attribute>
		</iaixsl:if>
		<iaixsl:value-of disable-output-escaping="yes" select="php:functionString('additionalContent', 'additional_body_top_scripts')"/>
	</iaixsl:if>
	<iaixsl:variable name="valuepricedesc">Cena dla Ciebie</iaixsl:variable>
	<iaixsl:variable name="discountpricedesc">Przecena</iaixsl:variable>
	<iaixsl:variable name="promopricedesc">Promocja</iaixsl:variable>
	<iaixsl:variable name="detalpricedesc">Cena detaliczna</iaixsl:variable>
	<iaixsl:variable name="rebatepricedesc">Rabat</iaixsl:variable>
	<iaixsl:variable name="nettopricedesc">Cena netto</iaixsl:variable>
	<iaixsl:variable name="signbeforeprice">false</iaixsl:variable>
	<iaixsl:variable name="signbetweenpricecurrency"> </iaixsl:variable>
	<iaixsl:variable name="showcomparelink">1</iaixsl:variable>

	<!-- (layout, 60dd8eb774ca31.02018519.14)-->
	<div id="container">
		<iaixsl:attribute name="class"><iaixsl:value-of select="page/@type"/>_page <iaixsl:if test="/shop/page/login/@shop_registration = 'true'">registration_page </iaixsl:if>container max-width-1200</iaixsl:attribute>

		<iaixsl:if test="not(action/set_render/item) or (action/set_render/item/@name = 'head')">
			<header>
				<iaixsl:attribute name="class"><iaixsl:if test="count(commercial_banner/link) &gt; 0"> commercial_banner</iaixsl:if></iaixsl:attribute>
				<!-- (menu_javascript, 60dd8ed0d39928.25251110.22)-->
				<script class="ajaxLoad">app_shop.vars.vat_registered=&quot;<iaixsl:value-of select="/shop/contact/owner/@vat_registered"/>&quot;;app_shop.vars.currency_format=&quot;<iaixsl:value-of select="/shop/currency/option[@selected='true']/@currency_format"/>&quot;;<iaixsl:if test="/shop/currency/option[@selected='true']/@currency_before_value">app_shop.vars.currency_before_value=<iaixsl:value-of select="/shop/currency/option[@selected='true']/@currency_before_value"/>;</iaixsl:if><iaixsl:if test="/shop/currency/option[@selected='true']/@currency_space">app_shop.vars.currency_space=<iaixsl:value-of select="/shop/currency/option[@selected='true']/@currency_space"/>;</iaixsl:if>app_shop.vars.symbol=&quot;<iaixsl:value-of select="/shop/currency/option[@selected='true']/@symbol"/>&quot;;app_shop.vars.id=&quot;<iaixsl:value-of select="/shop/currency/option[@selected='true']/@id"/>&quot;;app_shop.vars.baseurl=&quot;<iaixsl:value-of select="/shop/@baseurl"/>&quot;;app_shop.vars.sslurl=&quot;<iaixsl:value-of select="/shop/@sslurl"/>&quot;;app_shop.vars.curr_url=&quot;<iaixsl:value-of select="/shop/navigation/current/@curr_url"/>&quot;;<iaixsl:if test="/shop/basket/@login">app_shop.vars.logged=1;</iaixsl:if>var currency_decimal_separator=&apos;<iaixsl:value-of select="/shop/currency/option[@selected='true']/@currency_decimal_separator"/>&apos;;var currency_grouping_separator=&apos;<iaixsl:value-of select="/shop/currency/option[@selected='true']/@currency_grouping_separator"/>&apos;;<iaixsl:if test="/shop/form_data/upload_file/blacklist_extension/param">app_shop.vars.blacklist_extension=[<iaixsl:for-each select="/shop/form_data/upload_file/blacklist_extension/param"><iaixsl:if test="not(position()=1)">,</iaixsl:if>&quot;<iaixsl:value-of select="@type"/>&quot;</iaixsl:for-each>];</iaixsl:if><iaixsl:if test="/shop/form_data/upload_file/blacklist_mime/param">app_shop.vars.blacklist_mime=[<iaixsl:for-each select="/shop/form_data/upload_file/blacklist_mime/param"><iaixsl:if test="not(position()=1)">,</iaixsl:if>&quot;<iaixsl:value-of select="@type"/>&quot;</iaixsl:for-each>];</iaixsl:if><iaixsl:if test="/shop/contact/link/@url">app_shop.urls.contact=&quot;<iaixsl:value-of select="/shop/contact/link/@url"/>&quot;;</iaixsl:if></script>
				<div id="viewType" style="display:none"/>
				<!-- (menu_suggested_shop_for_language, 60dd8e83bf9068.60920781.4)-->
					<iaixsl:if test="count(/shop/select_language/language/option) &gt; 1">
						<div class="redirection">
						<span class="redirection__close"/>
							<div class="redirection__suggestions row">
								<div class="redirection__wrapper --title col-12 col-md-6 ">
									<strong class="redirection__title"><span>Choose your language</span><span>and country</span></strong>
								</div>
								<div class="redirection__wrapper --configurator col-12 col-md-6">
									<div class="redirection__selector --language">
										<iaixsl:for-each select="/shop/select_language/language">
											<div class="redirection__language">
												<iaixsl:if test="option/@selected">
													<iaixsl:attribute name="class">redirection__language --active</iaixsl:attribute>
												</iaixsl:if>
												<strong>
													<span>
														<iaixsl:attribute name="class">flag flag_<iaixsl:value-of select="@id"/></iaixsl:attribute>
													</span>
													<span class="redirection__language_name"><iaixsl:value-of select="@name"/></span>
												</strong>
												<div class="redirection__selector --country">
													<iaixsl:if test="count(option) = 1 and option = ''">
														<iaixsl:attribute name="data-link"><iaixsl:value-of select="option/@site"/>?redirection=redirected</iaixsl:attribute>
														<iaixsl:attribute name="class">redirection__selector --country --any</iaixsl:attribute>
													</iaixsl:if>
													<iaixsl:for-each select="option[not(. = '')]">
														<div class="f-group --radio --small">
															<input type="radio" name="shop_country" class="f-control">
																<iaixsl:attribute name="id"><iaixsl:value-of select="../@id"/>_<iaixsl:value-of select="."/></iaixsl:attribute>
																<iaixsl:attribute name="data-link"><iaixsl:value-of select="@site"/>?redirection=redirected</iaixsl:attribute>
																<iaixsl:if test="@selected">
																	<iaixsl:attribute name="checked">true</iaixsl:attribute>
																</iaixsl:if>
															</input>
															<label class="f-label">
																<iaixsl:attribute name="for"><iaixsl:value-of select="../@id"/>_<iaixsl:value-of select="."/></iaixsl:attribute>
																<iaixsl:value-of select="."/>
															</label>
														</div>
													</iaixsl:for-each>
												</div>
											</div>
										</iaixsl:for-each>
									</div>
									<div class="redirection__submit">
										<a class="redirection__button btn --medium --solid" href="#redirect">
											<iaixsl:if test="/shop/select_language/language/option[@selected = 'true']">
												<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/select_language/language/option[@selected = 'true']/@site"/>?redirection=redirected</iaixsl:attribute>
											</iaixsl:if>
											<iaixsl:attribute name="title">OK</iaixsl:attribute>
											OK
										</a>
									</div>
								</div>
							</div>
						</div>
					</iaixsl:if>
				<!-- (bars_top, 62e7a5fa10fd24.34671527.2)-->
					<iaixsl:if test="/shop/page/bars/bar[@position = 'top']">
						<div class="bars_top bars">
							<iaixsl:for-each select="/shop/page/bars/bar[@position = 'top']">
								<div class="bars__item">
									<iaixsl:attribute name="id">bar<iaixsl:value-of select="@id"/></iaixsl:attribute>
									<iaixsl:if test="@possibilityToClose = 'true'">
										<iaixsl:attribute name="data-close">true</iaixsl:attribute>
									</iaixsl:if>
									<iaixsl:if test="@fixed = 'true'">
										<iaixsl:attribute name="data-fixed">true</iaixsl:attribute>
									</iaixsl:if>
									<iaixsl:attribute name="style">--background-color:<iaixsl:value-of select="@backgroundColor"/>;--border-color:<iaixsl:value-of select="@borderColor"/>;--font-color:<iaixsl:value-of select="@fontColor"/>;</iaixsl:attribute>
									<div class="bars__wrapper">
										<div class="bars__content"><iaixsl:value-of disable-output-escaping="yes" select="."/></div>
										<iaixsl:if test="@possibilityToClose = 'true'">
											<a href="#closeBar" class="bars__close"/>
										</iaixsl:if>
									</div>
								</div>
							</iaixsl:for-each>
						</div>
						<script>document.documentElement.style.setProperty(&apos;--bars-height&apos;,`${document.querySelector(&apos;.bars_top&apos;).offsetHeight}px`);</script>
					</iaixsl:if>
				<!-- (menu_rebates_codes, 61b0b1afcdfdf5.19170359.3)-->
					<iaixsl:variable name="disableRebatesCodes"/>
					<iaixsl:if test="not($disableRebatesCodes) and /shop/rebatecode/@code">
						<div id="rabateCode" class="rabateCode">
							<span class="rabateCode__info">Aktywny kod rabatowy: </span>
							<strong>
								<span><iaixsl:value-of select="number(/shop/rebatecode/@value)"/></span>
								<span>
									<iaixsl:choose>
										<iaixsl:when test="/shop/rebatecode/@price_type = 'fixed_amount' or /shop/rebatecode/@price_type = 'c'"> <iaixsl:value-of select="/shop/currency/@name"/></iaixsl:when>
										<iaixsl:when test="/shop/rebatecode/@price_type = 'p'">%</iaixsl:when>
									</iaixsl:choose>
								</span>
							</strong>
							<a href="" class="rabateCode__close"/>
						</div>
					</iaixsl:if>
				<!-- (menu_delivery_cost, 60dd8f2ee8f533.38237884.6)-->
					<iaixsl:variable name="disableBar"/>
					<iaixsl:variable name="disableReturns"/>
					<iaixsl:if test="not($disableBar) and /shop/basket/@toshippingfree != ''">
						<div id="freeShipping" class="freeShipping">
							<iaixsl:if test="/shop/basket/@toshippingfree = 0">
								<iaixsl:attribute name="class">freeShipping --active</iaixsl:attribute>
							</iaixsl:if>
							<span class="freeShipping__info">Darmowa dostawa</span>
							<strong class="freeShipping__val">
								od 
								<iaixsl:value-of select="/shop/basket/@shippinglimitfree_formatted"/>
							</strong>
							
							<iaixsl:if test="not($disableReturns) and /shop/returns/@freereturnsactive='y'">
								<span class="freeShipping__return">
									dni
									<iaixsl:value-of select="/shop/returns/@days_to_return"/>
									i darmowy zwrot od 
								</span>
							</iaixsl:if>
							
							<a href="" class="freeShipping__close"/>
						</div>
					</iaixsl:if>
<!-- START HEADER TOP ROW -->
			<div class="row align-items-center">
				<div class="d-none d-md-flex col-md-4">
					<div id="contactInfo" class="">
						<span class="contact__info">Infolinia:
							<iaixsl:for-each select="/shop/contact/contact_nodes/node[@type='phone'][1]">
								<iaixsl:choose>
									<iaixsl:when test="@link">
										<a>
											<iaixsl:attribute name="href">
												<iaixsl:value-of select="@link"/>
											</iaixsl:attribute>
											<iaixsl:value-of select="@value"/>
										</a>
									</iaixsl:when>
									<iaixsl:otherwise>
										<span>
											<iaixsl:value-of select="@value"/>
										</span>
									</iaixsl:otherwise>
								</iaixsl:choose>
							</iaixsl:for-each>
							<iaixsl:for-each select="/shop/contact/contact_nodes/node[@type='text'][1]">
								<span class="ml-2">
									<iaixsl:value-of select="@value"/>
								</span>
							</iaixsl:for-each>
						</span>
						
					</div>
				</div>
				<div class="align-items-center col d-none d-md-flex justify-content-end">
					<!-- (menu_search, 614c5d2b6852b4.42348920.5)-->
					<form action="/search.php" method="get" id="menu_search" class="menu_search">
						<iaixsl:if test="/shop/action/search/@url">
							<iaixsl:attribute name="action">
								<iaixsl:value-of select="/shop/action/search/@url"/>
							</iaixsl:attribute>
						</iaixsl:if>
						<a href="#showSearchForm" class="menu_search__mobile"/>
						<div class="menu_search__block">
							<div class="menu_search__item --input">
								<input class="menu_search__input" type="text" name="text" autocomplete="off">
									<iaixsl:attribute name="placeholder">Wpisz czego szukasz</iaixsl:attribute>
									<iaixsl:if test="/shop/page/search_params/text">
										<iaixsl:attribute name="placeholder">
											<iaixsl:value-of select="/shop/page/search_params/text/@value"/>
										</iaixsl:attribute>
									</iaixsl:if>
								</input>
								<button class="menu_search__submit" type="submit">
											
														</button>
							</div>
							<div class="menu_search__item --results search_result"/>
											</div>
					</form>
					<!-- (menu_settings, 60dd8ecf1ed667.18940728.9)-->
					<iaixsl:variable name="display_menu_additional">Zaloguj się</iaixsl:variable>
					<iaixsl:variable name="login_title"/>
					<iaixsl:variable name="account_title"/>
					<iaixsl:variable name="list_title"/>
					<div id="menu_settings">
						<a href="/Porady-i-przepisy-bloglist-pol-40.html" class="text-l">Porady i przepisy</a>
						<a href="/Blog-bloglist-pol-37.html" class="text-l">Blog</a>
						<iaixsl:if test="(count(/shop/currency/option) &gt; 1) or (count(/shop/language/option) &gt; 1) or (count(/shop/countries/country) &gt; 1)">
							<div class="open_trigger">
								<span>
									<iaixsl:choose>
										<iaixsl:when test="count(/shop/language/option) &gt; 1">
											<iaixsl:attribute name="class">d-none d-md-inline-block flag flag_
												<iaixsl:value-of select="/shop/language/option[@selected='true']/@id"/>
											</iaixsl:attribute>
										</iaixsl:when>
										<iaixsl:when test="count(/shop/currency/option) &gt; 1">
											<iaixsl:attribute name="class">d-none d-md-inline-block flag_txt</iaixsl:attribute>
											<iaixsl:value-of select="/shop/currency/option[@selected='true']/@symbol"/>
										</iaixsl:when>
										<iaixsl:when test="count(/shop/countries/country) &gt; 1">
											<iaixsl:attribute name="class">d-none d-md-inline-block flag_txt</iaixsl:attribute>
											<i class="icon-truck"/>
										</iaixsl:when>
									</iaixsl:choose>
								</span>
								<div class="menu_settings_wrapper d-md-none">
									<iaixsl:if test="/shop/language/option/@selected or /shop/currency/option/@selected">
										<div class="menu_settings_inline">
											<div class="menu_settings_header">
													Język i waluta: 
												</div>
											<div class="menu_settings_content">
												<span class="menu_settings_flag">
													<iaixsl:attribute name="class">menu_settings_flag flag flag_
														<iaixsl:value-of select="/shop/language/option[@selected='true']/@id"/>
													</iaixsl:attribute>
												</span>
												<strong class="menu_settings_value">
													<span class="menu_settings_language">
														<iaixsl:value-of select="/shop/language/option[@selected='true']/@name"/>
													</span>
													<span>
														<iaixsl:text> | </iaixsl:text>
													</span>
													<span class="menu_settings_currency">
														<iaixsl:value-of select="/shop/currency/option[@selected='true']/@symbol"/>
													</span>
												</strong>
											</div>
										</div>
									</iaixsl:if>
									<iaixsl:if test="/shop/countries/country/@selected">
										<div class="menu_settings_inline">
											<div class="menu_settings_header">
													Dostawa do: 
												</div>
											<div class="menu_settings_content">
												<strong class="menu_settings_value">
													<iaixsl:value-of select="/shop/countries/country[@selected='true']/@name"/>
												</strong>
											</div>
										</div>
									</iaixsl:if>
								</div>
								<i class="icon-angle-down d-none d-md-inline-block"/>
							</div>
							<iaixsl:if test="(count(/shop/currency/option) &gt; 1) or (count(/shop/language/option) &gt; 1) or (count(/shop/countries/country) &gt; 1)">
								<form action="/settings.php" method="post">
									<iaixsl:if test="/shop/action/settings/@url">
										<iaixsl:attribute name="action">
											<iaixsl:value-of select="/shop/action/settings/@url"/>
										</iaixsl:attribute>
									</iaixsl:if>
									<ul>
										<iaixsl:if test="count(/shop/language/option) &gt; 1">
											<li>
												<div class="form-group">
													<label class="menu_settings_lang_label">Język</label>
													<iaixsl:for-each select="/shop/language/option">
														<div class="radio">
															<label>
																<input type="radio" name="lang">
																	<iaixsl:if test="@selected='true'">
																		<iaixsl:attribute name="checked">checked</iaixsl:attribute>
																	</iaixsl:if>
																	<iaixsl:attribute name="value">
																		<iaixsl:value-of select="@id"/>
																	</iaixsl:attribute>
																</input>
																<span>
																	<iaixsl:attribute name="class">flag flag_
																		<iaixsl:value-of select="@id"/>
																	</iaixsl:attribute>
																</span>
																<span>
																	<iaixsl:value-of select="@name"/>
																</span>
															</label>
														</div>
													</iaixsl:for-each>
												</div>
											</li>
										</iaixsl:if>
										<iaixsl:if test="count(/shop/currency/option) &gt; 1 or count(/shop/countries/country) &gt; 1">
											<li>
												<iaixsl:if test="count(/shop/currency/option) &gt; 1">
													<div class="form-group">
														<label for="menu_settings_curr">Waluta</label>
														<div class="select-after">
															<select class="form-control" name="curr" id="menu_settings_curr">
																<iaixsl:for-each select="/shop/currency/option">
																	<option>
																		<iaixsl:attribute name="value">
																			<iaixsl:value-of select="@id"/>
																		</iaixsl:attribute>
																		<iaixsl:choose>
																			<iaixsl:when test="@selected='true'">
																				<iaixsl:attribute name="selected">selected</iaixsl:attribute>
																				<iaixsl:value-of select="@symbol"/>
																			</iaixsl:when>
																			<iaixsl:otherwise>
																				<iaixsl:value-of select="@symbol"/> (1
																				<iaixsl:value-of select="/shop/currency/option[@selected='true']/@symbol"/> =
																				<iaixsl:value-of select="@rate"/>
																				<iaixsl:value-of select="@symbol"/>)
																			</iaixsl:otherwise>
																		</iaixsl:choose>
																	</option>
																</iaixsl:for-each>
															</select>
														</div>
													</div>
												</iaixsl:if>
												<iaixsl:if test="count(/shop/countries/country) &gt; 1">
													<div class="form-group">
														<label for="menu_settings_country">Dostawa do</label>
														<div class="select-after">
															<select class="form-control" name="country" id="menu_settings_country">
																<iaixsl:for-each select="/shop/countries/country">
																	<option>
																		<iaixsl:if test="@selected='true'">
																			<iaixsl:attribute name="selected">selected</iaixsl:attribute>
																		</iaixsl:if>
																		<iaixsl:attribute name="value">
																			<iaixsl:value-of select="@id"/>
																		</iaixsl:attribute>
																		<iaixsl:value-of select="@name"/>
																	</option>
																</iaixsl:for-each>
															</select>
														</div>
													</div>
												</iaixsl:if>
											</li>
										</iaixsl:if>
										<li class="buttons">
											<button class="btn --solid --large" type="submit">
													Zastosuj zmiany
												</button>
										</li>
									</ul>
								</form>
							</iaixsl:if>
						</iaixsl:if>
						<iaixsl:if test="$display_menu_additional">
							<div id="menu_additional">
								
								<div class="shopping_list_top d-flex" data-empty="false">
									<iaixsl:if test="not(/shop/shopping_lists/list)">
										<iaixsl:attribute name="data-empty">true</iaixsl:attribute>
									</iaixsl:if>
									<a href="/shoppinglist.php" class="wishlist_link slt_link d-flex flex-column justify-content-center align-items-center">
										<iaixsl:if test="not(/shop/shopping_lists/list)">
											<iaixsl:attribute name="class">wishlist_link slt_link d-flex flex-column justify-content-center align-items-center --empty</iaixsl:attribute>
										</iaixsl:if>
										<iaixsl:if test="/shop/action/shoppinglist">
											<iaixsl:attribute name="href">
												<iaixsl:value-of select="/shop/action/shoppinglist/@url"/>
											</iaixsl:attribute>
										</iaixsl:if><i class="icon-heart"/> <span>Listy zakupowe</span>
									</a>
									<div class="slt_lists">
										<ul class="slt_lists__nav">
											<li class="slt_lists__nav_item" data-list_skeleton="true" data-list_id="true" data-shared="true">
												<a class="slt_lists__nav_link" data-list_href="true">
													<span class="slt_lists__nav_name" data-list_name="true"/>
													<span class="slt_lists__count" data-list_count="true">0</span>
												</a>
											</li>
											<iaixsl:if test="not(/shop/shopping_lists/list)">
												<li class="slt_lists__nav_item --empty">
													<a class="slt_lists__nav_link --empty">
														<iaixsl:attribute name="href">
															<iaixsl:value-of select="/shop/action/shoppinglist/@url"/>
														</iaixsl:attribute>
														<span class="slt_lists__nav_name" data-list_name="true">Lista zakupowa</span>
														<span class="slt_lists__count" data-list_count="true">0</span>
													</a>
												</li>
											</iaixsl:if>
											<iaixsl:for-each select="/shop/shopping_lists/list">
												<li class="slt_lists__nav_item">
													<iaixsl:attribute name="data-list_id">
														<iaixsl:value-of select="@id"/>
													</iaixsl:attribute>
													<iaixsl:if test="@id = /shop/page/list/@id">
														<iaixsl:attribute name="data-current">true</iaixsl:attribute>
													</iaixsl:if>
													<iaixsl:if test="@shared = 'true'">
														<iaixsl:attribute name="data-shared">true</iaixsl:attribute>
													</iaixsl:if>
													<a class="slt_lists__nav_link">
														<iaixsl:attribute name="href">
															<iaixsl:value-of select="@link"/>
														</iaixsl:attribute>
														<span class="slt_lists__nav_name" data-list_name="true">
															<iaixsl:value-of disable-output-escaping="yes" select="@name"/>
														</span>
														<span class="slt_lists__count" data-list_count="true">
															<iaixsl:value-of select="@count"/>
														</span>
													</a>
												</li>
											</iaixsl:for-each>
										</ul>
									</div>
									
									<a class="account_link d-flex flex-column-reverse justify-content-center align-items-center">
									
									<iaixsl:if test="/shop/action/login/@url">
										<iaixsl:attribute name="href">
											<iaixsl:value-of select="/shop/action/login/@url"/>
										</iaixsl:attribute>
									</iaixsl:if>
									<iaixsl:choose>
										<iaixsl:when test="basket/@login and not(basket/@login = '')">
											<iaixsl:if test="$account_title != ''">
												<iaixsl:attribute name="title">
													<iaixsl:value-of select="$account_title"/>
												</iaixsl:attribute>
											</iaixsl:if>
												Twoje konto
										</iaixsl:when>
										<iaixsl:otherwise>
											<iaixsl:if test="$login_title != ''">
												<iaixsl:attribute name="title">
													<iaixsl:value-of select="$login_title"/>
												</iaixsl:attribute>
											</iaixsl:if>
											<iaixsl:value-of disable-output-escaping="yes" select="$display_menu_additional"/>
										</iaixsl:otherwise>
									</iaixsl:choose>
								<i class="icon-user"/>
								</a> 
								
								</div>
							</div>
						</iaixsl:if>
					</div>
					<div class="shopping_list_top_mobile" data-empty="false">
						<iaixsl:if test="not(/shop/shopping_lists/list)">
							<iaixsl:attribute name="data-empty">true</iaixsl:attribute>
						</iaixsl:if>
						<a href="/shoppinglist.php" class="sltm_link">
							<iaixsl:if test="not(/shop/shopping_lists/list)">
								<iaixsl:attribute name="class">sltm_link --empty</iaixsl:attribute>
							</iaixsl:if>
							<iaixsl:if test="/shop/action/shoppinglist">
								<iaixsl:attribute name="href">
									<iaixsl:value-of select="/shop/action/shoppinglist/@url"/>
								</iaixsl:attribute>
							</iaixsl:if>
						</a>
					</div>
					<div class="sl_choose sl_dialog">
						<div class="sl_choose__wrapper sl_dialog__wrapper">
							<div class="sl_choose__item --top sl_dialog_close mb-2">
								<strong class="sl_choose__label">Zapisz na liście zakupowej</strong>
							</div>
							<div class="sl_choose__item --lists" data-empty="false">
								<iaixsl:if test="not(/shop/shopping_lists/list)">
									<iaixsl:attribute name="data-empty">true</iaixsl:attribute>
								</iaixsl:if>
								<div class="sl_choose__list f-group --radio m-0 d-md-flex align-items-md-center justify-content-md-between" data-list_skeleton="true" data-list_id="true" data-shared="true">
									<input type="radio" name="add" class="sl_choose__input f-control" id="slChooseRadioSelect" data-list_position="true"/>
									<label for="slChooseRadioSelect" class="sl_choose__group_label f-label py-4" data-list_position="true">
										<span class="sl_choose__sub d-flex align-items-center">
											<span class="sl_choose__name" data-list_name="true"/>
											<span class="sl_choose__count" data-list_count="true">0</span>
										</span>
									</label>
									<button type="button" class="sl_choose__button --desktop btn --solid">Zapisz</button>
								</div>
								<iaixsl:for-each select="/shop/shopping_lists/list">
									<div class="sl_choose__list f-group --radio m-0 d-md-flex align-items-md-center justify-content-md-between">
										<iaixsl:attribute name="data-list_id">
											<iaixsl:value-of select="@id"/>
										</iaixsl:attribute>
										<iaixsl:if test="@shared = 'true'">
											<iaixsl:attribute name="data-shared">true</iaixsl:attribute>
										</iaixsl:if>
										<iaixsl:if test="@id = /shop/page/list/@id">
											<iaixsl:attribute name="data-current">true</iaixsl:attribute>
										</iaixsl:if>
										<input type="radio" name="add" class="sl_choose__input f-control">
											<iaixsl:attribute name="id">slChooseRadioSelect
												<iaixsl:value-of select="position()"/>
											</iaixsl:attribute>
											<iaixsl:if test="position() = 1">
												<iaixsl:attribute name="checked">checked</iaixsl:attribute>
											</iaixsl:if>
										</input>
										<label class="sl_choose__group_label f-label py-4">
											<iaixsl:attribute name="for">slChooseRadioSelect
												<iaixsl:value-of select="position()"/>
											</iaixsl:attribute>
											<span class="sl_choose__sub d-flex align-items-center">
												<span class="sl_choose__name" data-list_name="true">
													<iaixsl:value-of disable-output-escaping="yes" select="@name"/>
												</span>
												<span class="sl_choose__count" data-list_count="true">
													<iaixsl:value-of select="@count"/>
												</span>
											</span>
										</label>
										<button type="button" class="sl_choose__button --desktop btn --solid">Zapisz</button>
									</div>
								</iaixsl:for-each>
							</div>
							<div class="sl_choose__item --create sl_create mt-4">
								<a href="#new" class="sl_create__link  align-items-center">Stwórz nową listę zakupową</a>
								<form class="sl_create__form align-items-center">
									<div class="sl_create__group f-group --small mb-0">
										<input type="text" class="sl_create__input f-control" required="required"/>
										<label class="sl_create__label f-label">Nazwa nowej listy</label>
									</div>
									<button type="submit" class="sl_create__button btn --solid ml-2 ml-md-3">Utwórz listę</button>
								</form>
							</div>
							<div class="sl_choose__item --mobile mt-4 d-flex justify-content-center d-md-none">
								<button class="sl_choose__button --mobile btn --solid --large">Zapisz</button>
							</div>
						</div>
					</div>
					
				</div>
			</div>

			<div class="hrline"></div>
			<!-- END HEADER TOP ROW -->


		
			<!-- START LOGO -->
			<div class="row align-items-center justify-content-around main-holder">
				
				<div class="col col-md-2">
					<div id="logo" class=""><a href="https://mkfresh.pl/" target="_self">
							<div class="large"></div>
							<div class="small "></div>
						</a></div>
				</div>
			
				<!-- END LOGO -->
		
				<iaixsl:if test="/shop/mask/@rwd_pc">
					<iaixsl:if test="/shop/mask/@rwd_tablet"/>
					<iaixsl:if test="/shop/mask/@rwd_smartphone"/>
				</iaixsl:if>


		
					<!-- (menu_basket, 61e92b2a80d577.36778055.6)-->
					<!-- START KOSZYK -->
				<iaixsl:variable name="basket_title"/>
				<iaixsl:if test="wishes/@count"> </iaixsl:if>
					<!-- (menu_categories, 614c5d2d149061.30454363.8)-->
				<iaixsl:variable name="dlmenu_showall">+ Pokaż wszystkie</iaixsl:variable>
				<iaixsl:variable name="dlmenu_extend">+ Rozwiń</iaixsl:variable>
				<iaixsl:variable name="dlmenu_hide">- Zwiń</iaixsl:variable>
				<iaixsl:variable name="gfx_2lvl_show">1</iaixsl:variable>
				<iaixsl:variable name="gfx_3lvl_show">1</iaixsl:variable>
				<iaixsl:variable name="menu_categories_label"/>
				<iaixsl:variable name="dlmenu_showmore">1</iaixsl:variable>
				<iaixsl:variable name="dlmenu_shownumber">10</iaixsl:variable>
				<iaixsl:variable name="current_item"><iaixsl:value-of select="/shop/navigation/current/@ni"/></iaixsl:variable>
				
				
				<!-- END KOSZYK -->

				<!--  KATEGORIE + MEGAMENU -->
				<div class="col">
					<nav id="menu_categories" class="wide">
					
						<iaixsl:if test="$menu_categories_label and not($menu_categories_label = '')">
							<h2 class="big_label">
								<a href="/categories.php">
									<iaixsl:attribute name="title"/>
									<iaixsl:value-of select="$menu_categories_label"/>
								</a>
							</h2>
						</iaixsl:if>
						<button type="button" class="navbar-toggler">
							<i class="icon-reorder"/>
						</button>
						<div class="navbar-collapse" id="menu_navbar">
							<ul class="navbar-nav mx-md-n2">
								<iaixsl:for-each select="navigation/item">
									<li class="nav-item">
										
										<iaixsl:if test="( (@ni = $current_item) or (item/@ni = $current_item)  or (item/item/@ni = $current_item)  or (item/item/item/@ni = $current_item) )">
											<iaixsl:attribute name="class">nav-item active</iaixsl:attribute>
										</iaixsl:if>
										<iaixsl:choose>
											<iaixsl:when test="@link and @link != '##'">
												<iaixsl:text disable-output-escaping="yes">&lt;a  href=&quot;</iaixsl:text>
												<iaixsl:value-of select="@link"/><iaixsl:text disable-output-escaping="yes">&quot; target=&quot;</iaixsl:text><iaixsl:value-of select="@target"/>
												<iaixsl:text disable-output-escaping="yes">&quot; title=&quot;</iaixsl:text><iaixsl:value-of select="@name"/>
											</iaixsl:when>
											<iaixsl:otherwise>
												<iaixsl:text disable-output-escaping="yes">&lt;span</iaixsl:text>
												<iaixsl:text disable-output-escaping="yes"> title=&quot;</iaixsl:text>
												<iaixsl:value-of select="@name"/>
											</iaixsl:otherwise>
										</iaixsl:choose>
										<iaixsl:text disable-output-escaping="yes">&quot; class=&quot;nav-link</iaixsl:text>
										<iaixsl:if test="(@ni = /shop/navigation/current/@ni) or (item//@ni = /shop/navigation/current/@ni)">
											<iaixsl:text disable-output-escaping="yes"> active</iaixsl:text>
										</iaixsl:if>
										<iaixsl:if test="@reload and @reload = 'y'">
											<iaixsl:text disable-output-escaping="yes"> noevent</iaixsl:text>
										</iaixsl:if>
										<iaixsl:if test="(@gfx_inactive_type = 'img' and @gfx) or (@gfx_inactive_type = 'img_rwd' and (@gfx_inactive_desktop or @gfx_inactive_tablet or @gfx_inactive_mobile))">
											<iaixsl:text disable-output-escaping="yes"> nav-gfx</iaixsl:text>
										</iaixsl:if>
										<iaixsl:text disable-output-escaping="yes">&quot; &gt;</iaixsl:text>
										<iaixsl:choose>
											<iaixsl:when test="(@gfx_inactive_type = 'img' and @gfx) or (@gfx_inactive_type = 'img_rwd' and (@gfx_inactive_desktop or @gfx_inactive_tablet or @gfx_inactive_mobile))">
												<img>
													<iaixsl:attribute name="alt"><iaixsl:value-of disable-output-escaping="yes" select="@name"/></iaixsl:attribute>
													<iaixsl:attribute name="title"><iaixsl:value-of disable-output-escaping="yes" select="@name"/></iaixsl:attribute>
													<iaixsl:choose>
														<iaixsl:when test="@gfx_inactive_type = 'img_rwd'">
															<iaixsl:attribute name="class">rwd-src</iaixsl:attribute>
															<iaixsl:if test="@gfx_inactive_desktop">
																<iaixsl:attribute name="data-src_desktop"><iaixsl:value-of select="@gfx_inactive_desktop"/></iaixsl:attribute>
															</iaixsl:if>
															<iaixsl:if test="@gfx_inactive_tablet">
																<iaixsl:attribute name="data-src_tablet"><iaixsl:value-of select="@gfx_inactive_tablet"/></iaixsl:attribute>
															</iaixsl:if>
															<iaixsl:if test="@gfx_inactive_mobile">
																<iaixsl:attribute name="data-src_mobile"><iaixsl:value-of select="@gfx_inactive_mobile"/></iaixsl:attribute>
															</iaixsl:if>
														</iaixsl:when>
														<iaixsl:otherwise>
															<iaixsl:attribute name="src"><iaixsl:value-of select="@gfx"/></iaixsl:attribute>
														</iaixsl:otherwise>
													</iaixsl:choose>
													<iaixsl:if test="(@gfx_omo_type = 'img' and @gfx_onmouseover) or (@gfx_omo_type = 'img_rwd' and (@gfx_omo_desktop or @gfx_omo_tablet or @gfx_omo_mobile))">
														<iaixsl:attribute name="data-omo"><iaixsl:choose><iaixsl:when test="@gfx_omo_type = 'img' and @gfx_onmouseover">img</iaixsl:when><iaixsl:otherwise>img_rwd</iaixsl:otherwise></iaixsl:choose></iaixsl:attribute>
														<iaixsl:choose>
															<iaixsl:when test="@gfx_omo_type = 'img_rwd'">
																<iaixsl:if test="@gfx_omo_desktop">
																	<iaixsl:attribute name="data-omo_desktop"><iaixsl:value-of select="@gfx_omo_desktop"/></iaixsl:attribute>
																</iaixsl:if>
																<iaixsl:if test="@gfx_omo_tablet">
																	<iaixsl:attribute name="data-omo_tablet"><iaixsl:value-of select="@gfx_omo_tablet"/></iaixsl:attribute>
																</iaixsl:if>
																<iaixsl:if test="@gfx_omo_mobile">
																	<iaixsl:attribute name="data-omo_mobile"><iaixsl:value-of select="@gfx_omo_mobile"/></iaixsl:attribute>
																</iaixsl:if>
															</iaixsl:when>
															<iaixsl:otherwise>
																<iaixsl:attribute name="data-omo_img"><iaixsl:value-of select="@gfx_onmouseover"/></iaixsl:attribute>
															</iaixsl:otherwise>
														</iaixsl:choose>
													</iaixsl:if>
												</img>
												<span class="gfx_lvl_1 d-none"><iaixsl:value-of disable-output-escaping="yes" select="@name"/></span>
											</iaixsl:when>
											<iaixsl:when test="(@gfx_omo_type = 'img' and @gfx_onmouseover) or (@gfx_omo_type = 'img_rwd' and (@gfx_omo_desktop or @gfx_omo_tablet or @gfx_omo_mobile))">
												<span class="gfx_lvl_1 --omo"><iaixsl:value-of disable-output-escaping="yes" select="@name"/></span>
												<img class="gfx_lvl_1 --omo">
													<iaixsl:attribute name="alt"><iaixsl:value-of disable-output-escaping="yes" select="@name"/></iaixsl:attribute>
													<iaixsl:attribute name="title"><iaixsl:value-of disable-output-escaping="yes" select="@name"/></iaixsl:attribute>
													<iaixsl:choose>
														<iaixsl:when test="@gfx_omo_type = 'img_rwd'">
															<iaixsl:attribute name="class">rwd-src gfx_lvl_1 --omo</iaixsl:attribute>
															<iaixsl:if test="@gfx_omo_desktop">
																<iaixsl:attribute name="data-src_desktop"><iaixsl:value-of select="@gfx_omo_desktop"/></iaixsl:attribute>
															</iaixsl:if>
															<iaixsl:if test="@gfx_omo_tablet">
																<iaixsl:attribute name="data-src_tablet"><iaixsl:value-of select="@gfx_omo_tablet"/></iaixsl:attribute>
															</iaixsl:if>
															<iaixsl:if test="@gfx_omo_mobile">
																<iaixsl:attribute name="data-src_mobile"><iaixsl:value-of select="@gfx_omo_mobile"/></iaixsl:attribute>
															</iaixsl:if>
														</iaixsl:when>
														<iaixsl:otherwise>
															<iaixsl:attribute name="src"><iaixsl:value-of select="@gfx_onmouseover"/></iaixsl:attribute>
														</iaixsl:otherwise>
													</iaixsl:choose>
												</img>
											</iaixsl:when>
											<iaixsl:otherwise>
												<iaixsl:value-of disable-output-escaping="yes" select="@name"/>
											</iaixsl:otherwise>
										</iaixsl:choose>
										<iaixsl:choose>
											<iaixsl:when test="@link and @link != '##'">
												<iaixsl:text disable-output-escaping="yes">&lt;/a&gt;</iaixsl:text>
											</iaixsl:when>
											<iaixsl:otherwise>
												<iaixsl:text disable-output-escaping="yes">&lt;/span&gt;</iaixsl:text>
											</iaixsl:otherwise>
										</iaixsl:choose>
										<iaixsl:if test="item">
										<ul class="navbar-subnav">
											<iaixsl:for-each select="item">
												<li class="nav-item">
													<iaixsl:if test="((count(item) = 0) and $dlmenu_showmore)">
														<iaixsl:attribute name="class">nav-item empty</iaixsl:attribute>
													</iaixsl:if>
													<iaixsl:if test="( (@ni = $current_item) or (item/@ni = $current_item)  or (item/item/@ni = $current_item)  or (item/item/item/@ni = $current_item) )">
														<iaixsl:attribute name="class">nav-item active</iaixsl:attribute>
													</iaixsl:if>
													<iaixsl:if test="( (@ni = $current_item) or (item/@ni = $current_item)  or (item/item/@ni = $current_item)  or (item/item/item/@ni = $current_item) ) and ((count(item) = 0) and $dlmenu_showmore)">
														<iaixsl:attribute name="class">nav-item active empty</iaixsl:attribute>
													</iaixsl:if>
													<iaixsl:choose>
														<iaixsl:when test="@link and @link != '##'">
															<iaixsl:text disable-output-escaping="yes">&lt;a  href=&quot;</iaixsl:text>
															<iaixsl:value-of select="@link"/><iaixsl:text disable-output-escaping="yes">&quot; target=&quot;</iaixsl:text><iaixsl:value-of select="@target"/>
															<iaixsl:text disable-output-escaping="yes">&quot; title=&quot;</iaixsl:text><iaixsl:value-of select="@name"/>
														</iaixsl:when>
														<iaixsl:otherwise>
															<iaixsl:text disable-output-escaping="yes">&lt;span</iaixsl:text>
															<iaixsl:text disable-output-escaping="yes"> title=&quot;</iaixsl:text>
															<iaixsl:value-of select="@name"/>
														</iaixsl:otherwise>
													</iaixsl:choose>
													<iaixsl:text disable-output-escaping="yes">&quot; class=&quot;nav-link</iaixsl:text>
													<iaixsl:choose>
														<iaixsl:when test="((@ni = /shop/navigation/current/@ni) or (item//@ni = /shop/navigation/current/@ni)) and (((@gfx_inactive_type = 'img' and @gfx) or (@gfx_inactive_type = 'img_rwd' and (@gfx_inactive_desktop or @gfx_inactive_tablet or @gfx_inactive_mobile))) and $gfx_2lvl_show)">
															<iaixsl:text disable-output-escaping="yes"> nav-gfx active</iaixsl:text>
														</iaixsl:when>
														<iaixsl:when test="(@ni = /shop/navigation/current/@ni) or (item//@ni = /shop/navigation/current/@ni)">
															<iaixsl:text disable-output-escaping="yes"> active</iaixsl:text>
														</iaixsl:when>
														<iaixsl:when test="((@gfx_inactive_type = 'img' and @gfx) or (@gfx_inactive_type = 'img_rwd' and (@gfx_inactive_desktop or @gfx_inactive_tablet or @gfx_inactive_mobile))) and $gfx_2lvl_show">
															<iaixsl:text disable-output-escaping="yes"> nav-gfx</iaixsl:text>
														</iaixsl:when>
													</iaixsl:choose>

													<iaixsl:text disable-output-escaping="yes">&quot; &gt;</iaixsl:text>

													<iaixsl:choose>
														<iaixsl:when test="((@gfx_inactive_type = 'img' and @gfx) or (@gfx_inactive_type = 'img_rwd' and (@gfx_inactive_desktop or @gfx_inactive_tablet or @gfx_inactive_mobile))) and $gfx_2lvl_show">
															<img class="gfx_lvl_2">
																<iaixsl:attribute name="alt"><iaixsl:value-of disable-output-escaping="yes" select="@name"/></iaixsl:attribute>
																<iaixsl:attribute name="title"><iaixsl:value-of disable-output-escaping="yes" select="@name"/></iaixsl:attribute>
																<iaixsl:choose>
																	<iaixsl:when test="@gfx_inactive_type = 'img_rwd'">
																		<iaixsl:attribute name="class">rwd-src gfx_lvl_2</iaixsl:attribute>
																		<iaixsl:if test="@gfx_inactive_desktop">
																			<iaixsl:attribute name="data-src_desktop"><iaixsl:value-of select="@gfx_inactive_desktop"/></iaixsl:attribute>
																		</iaixsl:if>
																		<iaixsl:if test="@gfx_inactive_tablet">
																			<iaixsl:attribute name="data-src_tablet"><iaixsl:value-of select="@gfx_inactive_tablet"/></iaixsl:attribute>
																		</iaixsl:if>
																		<iaixsl:if test="@gfx_inactive_mobile">
																			<iaixsl:attribute name="data-src_mobile"><iaixsl:value-of select="@gfx_inactive_mobile"/></iaixsl:attribute>
																		</iaixsl:if>
																	</iaixsl:when>
																	<iaixsl:otherwise>
																		<iaixsl:attribute name="src"><iaixsl:value-of select="@gfx"/></iaixsl:attribute>
																	</iaixsl:otherwise>
																</iaixsl:choose>
																<iaixsl:if test="(@gfx_omo_type = 'img' and @gfx_onmouseover) or (@gfx_omo_type = 'img_rwd' and (@gfx_omo_desktop or @gfx_omo_tablet or @gfx_omo_mobile))">
																	<iaixsl:attribute name="data-omo"><iaixsl:choose><iaixsl:when test="@gfx_omo_type = 'img' and @gfx_onmouseover">img</iaixsl:when><iaixsl:otherwise>img_rwd</iaixsl:otherwise></iaixsl:choose></iaixsl:attribute>
																	<iaixsl:choose>
																		<iaixsl:when test="@gfx_omo_type = 'img_rwd'">
																			<iaixsl:if test="@gfx_omo_desktop">
																				<iaixsl:attribute name="data-omo_desktop"><iaixsl:value-of select="@gfx_omo_desktop"/></iaixsl:attribute>
																			</iaixsl:if>
																			<iaixsl:if test="@gfx_omo_tablet">
																				<iaixsl:attribute name="data-omo_tablet"><iaixsl:value-of select="@gfx_omo_tablet"/></iaixsl:attribute>
																			</iaixsl:if>
																			<iaixsl:if test="@gfx_omo_mobile">
																				<iaixsl:attribute name="data-omo_mobile"><iaixsl:value-of select="@gfx_omo_mobile"/></iaixsl:attribute>
																			</iaixsl:if>
																		</iaixsl:when>
																		<iaixsl:otherwise>
																			<iaixsl:attribute name="data-omo_img"><iaixsl:value-of select="@gfx_onmouseover"/></iaixsl:attribute>
																		</iaixsl:otherwise>
																	</iaixsl:choose>
																</iaixsl:if>
															</img>
															<span class="gfx_lvl_2 d-none"><iaixsl:value-of disable-output-escaping="yes" select="@name"/></span>
														</iaixsl:when>
														<iaixsl:when test="(@gfx_omo_type = 'img' and @gfx_onmouseover) or (@gfx_omo_type = 'img_rwd' and (@gfx_omo_desktop or @gfx_omo_tablet or @gfx_omo_mobile))">
															<span class="gfx_lvl_2 --omo"><iaixsl:value-of disable-output-escaping="yes" select="@name"/></span>
															<img class="gfx_lvl_2 --omo">
																<iaixsl:attribute name="alt"><iaixsl:value-of disable-output-escaping="yes" select="@name"/></iaixsl:attribute>
																<iaixsl:attribute name="title"><iaixsl:value-of disable-output-escaping="yes" select="@name"/></iaixsl:attribute>
																<iaixsl:choose>
																	<iaixsl:when test="@gfx_omo_type = 'img_rwd'">
																		<iaixsl:attribute name="class">rwd-src gfx_lvl_2 --omo</iaixsl:attribute>
																		<iaixsl:if test="@gfx_omo_desktop">
																			<iaixsl:attribute name="data-src_desktop"><iaixsl:value-of select="@gfx_omo_desktop"/></iaixsl:attribute>
																		</iaixsl:if>
																		<iaixsl:if test="@gfx_omo_tablet">
																			<iaixsl:attribute name="data-src_tablet"><iaixsl:value-of select="@gfx_omo_tablet"/></iaixsl:attribute>
																		</iaixsl:if>
																		<iaixsl:if test="@gfx_omo_mobile">
																			<iaixsl:attribute name="data-src_mobile"><iaixsl:value-of select="@gfx_omo_mobile"/></iaixsl:attribute>
																		</iaixsl:if>
																	</iaixsl:when>
																	<iaixsl:otherwise>
																		<iaixsl:attribute name="src"><iaixsl:value-of select="@gfx_onmouseover"/></iaixsl:attribute>
																	</iaixsl:otherwise>
																</iaixsl:choose>
															</img>
														</iaixsl:when>
														<iaixsl:otherwise>
															<iaixsl:value-of disable-output-escaping="yes" select="@name"/>
														</iaixsl:otherwise>
													</iaixsl:choose>
													<iaixsl:choose>
														<iaixsl:when test="@link and @link != '##'">
															<iaixsl:text disable-output-escaping="yes">&lt;/a&gt;</iaixsl:text>
														</iaixsl:when>
														<iaixsl:otherwise>
															<iaixsl:text disable-output-escaping="yes">&lt;/span&gt;</iaixsl:text>
														</iaixsl:otherwise>
													</iaixsl:choose>
													<iaixsl:if test="item">
														<ul class="navbar-subsubnav">
															<iaixsl:if test="((count(item) &gt; $dlmenu_shownumber) and $dlmenu_showmore)">
																<iaixsl:attribute name="class">navbar-subsubnav more</iaixsl:attribute>
															</iaixsl:if>
															<iaixsl:for-each select="item">
																<li class="nav-item">
																	<iaixsl:if test="( (@ni = $current_item) or (item/@ni = $current_item)  or (item/item/@ni = $current_item)  or (item/item/item/@ni = $current_item) )">
																		<iaixsl:attribute name="class">nav-item active</iaixsl:attribute>
																	</iaixsl:if>
																	<iaixsl:choose>
																		<iaixsl:when test="@link and @link != '##'">
																			<iaixsl:text disable-output-escaping="yes">&lt;a  href=&quot;</iaixsl:text>
																			<iaixsl:value-of select="@link"/><iaixsl:text disable-output-escaping="yes">&quot; target=&quot;</iaixsl:text><iaixsl:value-of select="@target"/>
																			<iaixsl:text disable-output-escaping="yes">&quot; title=&quot;</iaixsl:text><iaixsl:value-of select="@name"/>
																		</iaixsl:when>
																		<iaixsl:otherwise>
																			<iaixsl:text disable-output-escaping="yes">&lt;span</iaixsl:text>
																			<iaixsl:text disable-output-escaping="yes"> title=&quot;</iaixsl:text>
																			<iaixsl:value-of select="@name"/>
																		</iaixsl:otherwise>
																	</iaixsl:choose>
																	<iaixsl:text disable-output-escaping="yes">&quot; class=&quot;nav-link</iaixsl:text>
																	<iaixsl:if test="(@ni = /shop/navigation/current/@ni) or (item//@ni = /shop/navigation/current/@ni)">
																		<iaixsl:text disable-output-escaping="yes"> active</iaixsl:text>
																	</iaixsl:if>
																	<iaixsl:if test="((@gfx_inactive_type = 'img' and @gfx) or (@gfx_inactive_type = 'img_rwd' and (@gfx_inactive_desktop or @gfx_inactive_tablet or @gfx_inactive_mobile))) and $gfx_3lvl_show">
																		<iaixsl:text disable-output-escaping="yes"> nav-gfx</iaixsl:text>
																	</iaixsl:if>

																	<iaixsl:text disable-output-escaping="yes">&quot; &gt;</iaixsl:text>

																	<iaixsl:choose>
																		<iaixsl:when test="((@gfx_inactive_type = 'img' and @gfx) or (@gfx_inactive_type = 'img_rwd' and (@gfx_inactive_desktop or @gfx_inactive_tablet or @gfx_inactive_mobile))) and $gfx_3lvl_show">
																			<img class="gfx_lvl_3">
																				<iaixsl:attribute name="alt"><iaixsl:value-of disable-output-escaping="yes" select="@name"/></iaixsl:attribute>
																				<iaixsl:attribute name="title"><iaixsl:value-of disable-output-escaping="yes" select="@name"/></iaixsl:attribute>
																				<iaixsl:choose>
																					<iaixsl:when test="@gfx_inactive_type = 'img_rwd'">
																						<iaixsl:attribute name="class">rwd-src gfx_lvl_3</iaixsl:attribute>
																						<iaixsl:if test="@gfx_inactive_desktop">
																							<iaixsl:attribute name="data-src_desktop"><iaixsl:value-of select="@gfx_inactive_desktop"/></iaixsl:attribute>
																						</iaixsl:if>
																						<iaixsl:if test="@gfx_inactive_tablet">
																							<iaixsl:attribute name="data-src_tablet"><iaixsl:value-of select="@gfx_inactive_tablet"/></iaixsl:attribute>
																						</iaixsl:if>
																						<iaixsl:if test="@gfx_inactive_mobile">
																							<iaixsl:attribute name="data-src_mobile"><iaixsl:value-of select="@gfx_inactive_mobile"/></iaixsl:attribute>
																						</iaixsl:if>
																					</iaixsl:when>
																					<iaixsl:otherwise>
																						<iaixsl:attribute name="src"><iaixsl:value-of select="@gfx"/></iaixsl:attribute>
																					</iaixsl:otherwise>
																				</iaixsl:choose>
																				<iaixsl:if test="(@gfx_omo_type = 'img' and @gfx_onmouseover) or (@gfx_omo_type = 'img_rwd' and (@gfx_omo_desktop or @gfx_omo_tablet or @gfx_omo_mobile))">
																					<iaixsl:attribute name="data-omo"><iaixsl:choose><iaixsl:when test="@gfx_omo_type = 'img' and @gfx_onmouseover">img</iaixsl:when><iaixsl:otherwise>img_rwd</iaixsl:otherwise></iaixsl:choose></iaixsl:attribute>
																					<iaixsl:choose>
																						<iaixsl:when test="@gfx_omo_type = 'img_rwd'">
																							<iaixsl:if test="@gfx_omo_desktop">
																								<iaixsl:attribute name="data-omo_desktop"><iaixsl:value-of select="@gfx_omo_desktop"/></iaixsl:attribute>
																							</iaixsl:if>
																							<iaixsl:if test="@gfx_omo_tablet">
																								<iaixsl:attribute name="data-omo_tablet"><iaixsl:value-of select="@gfx_omo_tablet"/></iaixsl:attribute>
																							</iaixsl:if>
																							<iaixsl:if test="@gfx_omo_mobile">
																								<iaixsl:attribute name="data-omo_mobile"><iaixsl:value-of select="@gfx_omo_mobile"/></iaixsl:attribute>
																							</iaixsl:if>
																						</iaixsl:when>
																						<iaixsl:otherwise>
																							<iaixsl:attribute name="data-omo_img"><iaixsl:value-of select="@gfx_onmouseover"/></iaixsl:attribute>
																						</iaixsl:otherwise>
																					</iaixsl:choose>
																				</iaixsl:if>
																			</img>
																			<span class="gfx_lvl_3 d-none"><iaixsl:value-of disable-output-escaping="yes" select="@name"/></span>
																		</iaixsl:when>
																		<iaixsl:when test="(@gfx_omo_type = 'img' and @gfx_onmouseover) or (@gfx_omo_type = 'img_rwd' and (@gfx_omo_desktop or @gfx_omo_tablet or @gfx_omo_mobile))">
																			<span class="gfx_lvl_3 --omo"><iaixsl:value-of disable-output-escaping="yes" select="@name"/></span>
																			<img class="gfx_lvl_3 --omo">
																				<iaixsl:attribute name="alt"><iaixsl:value-of disable-output-escaping="yes" select="@name"/></iaixsl:attribute>
																				<iaixsl:attribute name="title"><iaixsl:value-of disable-output-escaping="yes" select="@name"/></iaixsl:attribute>
																				<iaixsl:choose>
																					<iaixsl:when test="@gfx_omo_type = 'img_rwd'">
																						<iaixsl:attribute name="class">rwd-src gfx_lvl_3 --omo</iaixsl:attribute>
																						<iaixsl:if test="@gfx_omo_desktop">
																							<iaixsl:attribute name="data-src_desktop"><iaixsl:value-of select="@gfx_omo_desktop"/></iaixsl:attribute>
																						</iaixsl:if>
																						<iaixsl:if test="@gfx_omo_tablet">
																							<iaixsl:attribute name="data-src_tablet"><iaixsl:value-of select="@gfx_omo_tablet"/></iaixsl:attribute>
																						</iaixsl:if>
																						<iaixsl:if test="@gfx_omo_mobile">
																							<iaixsl:attribute name="data-src_mobile"><iaixsl:value-of select="@gfx_omo_mobile"/></iaixsl:attribute>
																						</iaixsl:if>
																					</iaixsl:when>
																					<iaixsl:otherwise>
																						<iaixsl:attribute name="src"><iaixsl:value-of select="@gfx_onmouseover"/></iaixsl:attribute>
																					</iaixsl:otherwise>
																				</iaixsl:choose>
																			</img>
																		</iaixsl:when>
																		<iaixsl:otherwise>
																			<iaixsl:value-of disable-output-escaping="yes" select="@name"/>
																		</iaixsl:otherwise>
																	</iaixsl:choose>
																<iaixsl:choose>
																	<iaixsl:when test="@link and @link != '##'">
																		<iaixsl:text disable-output-escaping="yes">&lt;/a&gt;</iaixsl:text>
																	</iaixsl:when>
																	<iaixsl:otherwise>
																		<iaixsl:text disable-output-escaping="yes">&lt;/span&gt;</iaixsl:text>
																	</iaixsl:otherwise>
																</iaixsl:choose>
																</li>
															</iaixsl:for-each>
															<iaixsl:if test="(count(item) &gt; 1) and @link and @display_all = 'y' and $dlmenu_showall">
																<li class="nav-item --all">
																	<a class="nav-link">
																		<iaixsl:attribute name="href">
																			<iaixsl:choose>
																				<iaixsl:when test="@display_all_link">
																					<iaixsl:value-of select="@display_all_link"/>
																				</iaixsl:when>
																				<iaixsl:otherwise>
																					<iaixsl:value-of select="@link"/>
																				</iaixsl:otherwise>
																			</iaixsl:choose>
																		</iaixsl:attribute>
																		<iaixsl:value-of select="$dlmenu_showall"/>
																	</a>
																</li>
															</iaixsl:if>
															<iaixsl:if test="(count(item) &gt; $dlmenu_shownumber) and $dlmenu_showmore">
																<li class="nav-item --extend">
																	<a href="" class="nav-link">
																		<iaixsl:attribute name="txt_alt"><iaixsl:value-of select="$dlmenu_hide"/></iaixsl:attribute>
																		<iaixsl:value-of select="$dlmenu_extend"/>
																	</a>
																</li>
															</iaixsl:if>
														</ul>
													</iaixsl:if>
												</li>
											</iaixsl:for-each>
											<iaixsl:if test="(count(item) &gt; 1) and @link and @display_all = 'y' and $dlmenu_showall">
												<li class="nav-item --all empty">
													<a class="nav-link">
														<iaixsl:attribute name="href">
															<iaixsl:choose>
																<iaixsl:when test="@display_all_link">
																	<iaixsl:value-of select="@display_all_link"/>
																</iaixsl:when>
																<iaixsl:otherwise>
																	<iaixsl:value-of select="@link"/>
																</iaixsl:otherwise>
															</iaixsl:choose>
														</iaixsl:attribute>
														<iaixsl:value-of select="$dlmenu_showall"/>
													</a>
												</li>
											</iaixsl:if>
										</ul>
									</iaixsl:if>
										<hr class="menu-item-underline"/>
									</li>
								</iaixsl:for-each>
							</ul>
						</div>
					</nav>
				</div>
				<!-- END KATEGORIE + MEGAMENU -->
				<div class="basket-wrapper col col-md-3">
					<div id="menu_basket" class="topBasket">
							<iaixsl:if test="/shop/page/@cache_html = 'true' ">
								<iaixsl:attribute name="class">topBasket --skeleton</iaixsl:attribute>
							</iaixsl:if>
							<a class="topBasket__sub">
								<iaixsl:if test="$basket_title != ''"><iaixsl:attribute name="title"><iaixsl:value-of select="$basket_title"/></iaixsl:attribute></iaixsl:if>
								<iaixsl:attribute name="href"><iaixsl:value-of select="basket/@link"/></iaixsl:attribute>

								<span class="badge badge-info"><iaixsl:if test="basket/@count &gt; 0"><iaixsl:value-of disable-output-escaping="yes" select="basket/@count"/></iaixsl:if></span>
								<strong class="topBasket__price">
									<iaixsl:choose>
										<iaixsl:when test="/shop/page/@price_type = 'net'">
											<iaixsl:value-of disable-output-escaping="yes" select="basket/@cost_net_formatted"/>
										</iaixsl:when>
										<iaixsl:otherwise>
											<iaixsl:value-of disable-output-escaping="yes" select="basket/@cost_formatted"/>
										</iaixsl:otherwise>
									</iaixsl:choose>
									<iaixsl:if test="@points_used &gt; 0">
										<small>
												+ <iaixsl:value-of disable-output-escaping="yes" select="basket/@points_used"/>
												PKT
										</small>
									</iaixsl:if>
								</strong>
							</a>

							<div class="topBasket__details --products" style="display: none;">
								<div class="topBasket__block --labels">
									<label class="topBasket__item --name">Produkt</label>
									<label class="topBasket__item --sum">Ilość</label>
									<label class="topBasket__item --prices">Cena</label>
								</div>
								<div class="topBasket__block --products"/>
								<iaixsl:if test="/shop/oneclick/payment">
									<div class="topBasket__block --oneclick topBasket_oneclick">
										<iaixsl:attribute name="data-lang"><iaixsl:value-of select="/shop/language/option[@selected ='true']/@id"/></iaixsl:attribute>
										<div class="topBasket_oneclick__label">
											<span class="topBasket_oneclick__text --fast">Szybkie zakupy <strong>1-Click</strong></span>
											<span class="topBasket_oneclick__text --registration"> (bez rejestracji)</span>
										</div>
										<div class="topBasket_oneclick__items">
											<iaixsl:for-each select="/shop/oneclick/payment">
												<span>
													<iaixsl:attribute name="class">topBasket_oneclick__item --<iaixsl:value-of select="@id"/></iaixsl:attribute>
													<iaixsl:attribute name="title"><iaixsl:value-of select="@name"/></iaixsl:attribute>
													<img class="topBasket_oneclick__icon">
														<iaixsl:attribute name="src"><iaixsl:value-of select="@icon"/></iaixsl:attribute>
														<iaixsl:attribute name="alt"><iaixsl:value-of select="@name"/></iaixsl:attribute>
													</img>
												</span>
											</iaixsl:for-each>
										</div>
									</div>
								</iaixsl:if>
							</div>
							<div class="topBasket__details --shipping" style="display: none;">
								<span class="topBasket__name">Koszt dostawy od</span>
								<span id="shipppingCost"/>
							</div>

							<iaixsl:if test="/shop/action/sites/@session_share_disabled">
								<script>
									app_shop.vars.session_share = &quot;<iaixsl:value-of select="/shop/action/sites/@session_share"/>&quot;;
									<iaixsl:if test="/shop/action/sites/site">
									app_shop.vars.sites = [<iaixsl:for-each select="/shop/action/sites/site"><iaixsl:if test="not(position()=1)">,</iaixsl:if>&quot;<iaixsl:value-of select="@url"/>&quot;</iaixsl:for-each>];
									</iaixsl:if>
								</script>
							</iaixsl:if>

							<iaixsl:if test="/shop/page/@cache_html = 'true' ">
								<script>
									app_shop.vars.cache_html = true;
								</script>
							</iaixsl:if>

							<iaixsl:if test="/shop/basket/product">
								<iaixsl:if test="/shop/page/@cache_basketwishes"> </iaixsl:if>
								<iaixsl:if test="/shop/page/@cache_basket"> </iaixsl:if>
							</iaixsl:if>
					</div>
				</div>
			</div>
				<!-- breadcrumbs -->
				<iaixsl:if test="/shop/page/navigation/item/@gfx_active_desktop"> </iaixsl:if>	
				<!-- (projector_stepper, 60dd8ed08958b2.10218397.8)-->
				<iaixsl:variable name="searchResults_title"/>
				<iaixsl:variable name="breadcrumbs_label">Jesteś tutaj:  </iaixsl:variable>
				<div id="breadcrumbs" class="breadcrumbs">
					<div class="back_button">
					<iaixsl:attribute name="class">back_button</iaixsl:attribute>
					<button id="back_button"/>
					</div>
					<div class="list_wrapper">
					<ol>
						<iaixsl:if test="$breadcrumbs_label">
						<li>
							<span><iaixsl:value-of select="$breadcrumbs_label"/></span>
						</li>
						</iaixsl:if>
						<li class="bc-main">
						<span><a href="/">Strona główna</a></span>
						</li>
						<iaixsl:choose>
						<iaixsl:when test="page/@type = 'main'">
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'wishesedit' or page/@type = 'shoppinglist'">
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span>Listy zakupowe</span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'basketedit'">
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span>Koszyk</span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'product-stocks'">
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span>Dostępność produktu w sklepach</span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'blog-list'">
							<iaixsl:choose>
							<iaixsl:when test="page/navigation/bycategories/item[@current='active']">
								<li>
								<iaixsl:attribute name="class">bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
								<a href="/blog-list.php">
									<iaixsl:if test="/shop/action/blogList/@url">
									<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/blogList/@url"/></iaixsl:attribute>
									</iaixsl:if>
									Blog
								</a>
								</li>
								<li>
								<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
								<span><iaixsl:value-of select="page/navigation/bycategories/item[@current='active']/@value"/></span>
								</li>
							</iaixsl:when>
							<iaixsl:otherwise>
								<li>
								<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
								<span>Blog</span>
								</li>
							</iaixsl:otherwise>
							</iaixsl:choose>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'blog-item'">
							<li>
							<iaixsl:attribute name="class">bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<a href="/blog-list.php">
								<iaixsl:if test="/shop/action/blogList/@url">
								<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/blogList/@url"/></iaixsl:attribute>
								</iaixsl:if>
								Blog
							</a>
							</li>
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span><iaixsl:value-of select="page/blogitem/title/text()"/></span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'opinions-photos'">
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span>Opinie</span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'opinions-shop'">
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span>Opinie o sklepie</span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'categories-list'">
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span>Lista kategorii</span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'order-payment'">
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span>Płatności</span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'order-newpayment'">
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span>Płatności</span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'order-wrappers'">
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span>Wybierz opakowanie</span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'news'">
							<iaixsl:choose>
							<iaixsl:when test="/shop/page/news/title">
								<li>
								<iaixsl:attribute name="class">bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
								<a>
									<iaixsl:attribute name="href">/news.php</iaixsl:attribute>
									Aktualności
								</a>
								</li>
								<li>
								<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
								<span><iaixsl:value-of disable-output-escaping="yes" select="/shop/page/news/title"/></span>
								</li>
							</iaixsl:when>
							<iaixsl:otherwise>
								<li>
								<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
								<span>Aktualności</span>
								</li>
							</iaixsl:otherwise>
							</iaixsl:choose>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'client-rebates'">
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span>Twoje rabaty</span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'sitemap'">
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span>Mapa strony</span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'client-save'">
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span>Logowanie</span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="((page/@type = 'client-new') and not(page/client-data/@register='true') and not(page/client-data/@edit='true'))">
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span>Rejestracja</span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="((page/@type = 'client-new') and (page/client-data/@register='true'))">
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span>Rejestracja</span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="((page/@type = 'client-new') and (page/client-data/@edit='true'))">
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span>Edycja danych</span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'order-nonstandardized'">
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span>Zamówienie niestandardowe</span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'pickup-sites'">
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span>Wybierz punkt odbioru</span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'contact'">
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span>Kontakt</span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'links'">
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span>Linki</span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'login'">
							<iaixsl:if test="page/login/response/@type = 'give login'">
							<li>
								<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
								<span>Przypomnij hasło</span>
							</li>
							</iaixsl:if>
							<iaixsl:if test="not(page/login/response/@type = 'give login')">
							<iaixsl:choose>
								<iaixsl:when test="/shop/basket/@login">
								<li>
									<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
									<span>Twoje konto</span>
								</li>
								</iaixsl:when>
								<iaixsl:when test="page/login/response/@type = 'no login'">
								<li>
									<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
									<span>Logowanie</span>
								</li>
								</iaixsl:when>
							</iaixsl:choose>
							</iaixsl:if>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'rma-add'">
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span>Dodaj reklamację</span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'rma_products'">
							<iaixsl:choose>
							<iaixsl:when test="page/@display = 'confirmation'">
								<li>
								<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
								<span/>
								</li>
							</iaixsl:when>
							<iaixsl:when test="page/@display = 'details'">
								<li>
								<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
								<span/>
								</li>
							</iaixsl:when>
							<iaixsl:when test="page/@display = 'add'">
								<li>
								<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
								<span/>
								</li>
							</iaixsl:when>
							<iaixsl:when test="page/@display = 'stock'">
								<li>
								<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
								<span/>
								</li>
							</iaixsl:when>
							</iaixsl:choose>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'rma-list'">
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span>Lista reklamacji</span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'stock'">
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span>Punkt odbioru</span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'order1'">
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span>Dostawa i płatności</span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'order2'">
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span>Potwierdzenie danych</span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'prepaid'">
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span>Podsumowanie zamówienia</span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'producers-list'">
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span>Marki</span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'searching'">
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span>Szukaj</span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'text'">
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span><iaixsl:value-of select="page/text/@name"/></span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'return'">
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span>Uwaga</span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'client-orders'">
							<li>
							<iaixsl:attribute name="class">bc-active bc-login</iaixsl:attribute>
							<a><iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/login/@url"/></iaixsl:attribute>Twoje konto</a>
							</li>
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span>Twoje zamówienia</span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'order-open'">
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span>Status zamówienia</span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'product-compare'">
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span>Porównywarka</span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'products-bought'">
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span>Lista zakupionych produktów</span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'return_products'">
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span>Zwrot zamówienia</span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'client-cards'">
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span>Karty stałego klienta</span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'navigation' or page/@type = 'search'">
							<iaixsl:choose>
							<iaixsl:when test="bc/item">
								<iaixsl:for-each select="bc/item">
								<iaixsl:variable name="current_ni"><iaixsl:value-of select="@ni"/></iaixsl:variable>
								
									<iaixsl:variable name="current_navi">
									<iaixsl:choose>
										<iaixsl:when test="( count(/shop/navigation//item[@ni = $current_ni]/item) &gt; 1 and not(position() = last()) )">navigation</iaixsl:when>
										<iaixsl:when test="( count(/shop/navigation2//item[@ni = $current_ni]/item) &gt; 1 and not(position() = last()) )">navigation2</iaixsl:when>
										<iaixsl:when test="( count(/shop/navigation3//item[@ni = $current_ni]/item) &gt; 1 and not(position() = last()) )">navigation3</iaixsl:when>
										<iaixsl:when test="( count(/shop/navigation4//item[@ni = $current_ni]/item) &gt; 1 and not(position() = last()) )">navigation4</iaixsl:when>
										<iaixsl:when test="( count(/shop/navigation5//item[@ni = $current_ni]/item) &gt; 1 and not(position() = last()) )">navigation5</iaixsl:when>
										<iaixsl:otherwise>0</iaixsl:otherwise>
									</iaixsl:choose>
									</iaixsl:variable>
								<li>
									<iaixsl:attribute name="class">bc-item-<iaixsl:value-of select="position()"/><iaixsl:if test="position() = last()"> bc-active</iaixsl:if><iaixsl:if test="count(/shop/*[name()=$current_navi]//item[@ni = $current_ni]/item) &gt; 1 and not(position() = last())"> --more</iaixsl:if></iaixsl:attribute>
									<iaixsl:choose>
									<iaixsl:when test="not(position() = last()) and /shop/navigation//item[@ni = $current_ni]/@link">
										<a>
										<iaixsl:attribute name="href"><iaixsl:value-of select="@link"/></iaixsl:attribute>
										<iaixsl:value-of disable-output-escaping="yes" select="@title"/>
										</a>
									</iaixsl:when>
									<iaixsl:otherwise>
										<span>
										<iaixsl:value-of disable-output-escaping="yes" select="@title"/>
										</span>
									</iaixsl:otherwise>
									</iaixsl:choose>

									
									<iaixsl:if test="$current_navi != 0">
									<ul class="breadcrumbs__sub">
										<iaixsl:for-each select="/shop/*[name()=$current_navi]//item[@ni = $current_ni]/item">
										<li class="breadcrumbs__item">
											<iaixsl:choose>
											<iaixsl:when test="@link and @link != '##'">
												<a class="breadcrumbs__link --link">
												<iaixsl:attribute name="href"><iaixsl:value-of select="@link"/></iaixsl:attribute>
												<iaixsl:value-of disable-output-escaping="yes" select="@name"/>
												</a>
											</iaixsl:when>
											<iaixsl:otherwise>
												<span class="breadcrumbs__link"><iaixsl:value-of disable-output-escaping="yes" select="@name"/></span>
											</iaixsl:otherwise>
											</iaixsl:choose>
										</li>
										</iaixsl:for-each>
									</ul>
									</iaixsl:if>
								</li>
								</iaixsl:for-each>
							</iaixsl:when>
							<iaixsl:otherwise>
								<iaixsl:if test="$searchResults_title">
								<li>
									<span>
									<iaixsl:value-of select="$searchResults_title"/>
									<iaixsl:if test="page/search_params/text/@value and not(page/search_params/text/@value='')">
										<iaixsl:value-of select="page/search_params/text/@value"/>
									</iaixsl:if>
									</span>
								</li>
								</iaixsl:if>
							</iaixsl:otherwise>
							</iaixsl:choose>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'projector'">
							<iaixsl:for-each select="bc/item">
							<iaixsl:variable name="current_ni"><iaixsl:value-of select="@ni"/></iaixsl:variable>
							
							<iaixsl:variable name="current_navi">
								<iaixsl:choose>
								<iaixsl:when test="( count(/shop/navigation//item[@ni = $current_ni]/item) &gt; 1 and not(position() = last()) )">navigation</iaixsl:when>
								<iaixsl:when test="( count(/shop/navigation2//item[@ni = $current_ni]/item) &gt; 1 and not(position() = last()) )">navigation2</iaixsl:when>
								<iaixsl:when test="( count(/shop/navigation3//item[@ni = $current_ni]/item) &gt; 1 and not(position() = last()) )">navigation3</iaixsl:when>
								<iaixsl:when test="( count(/shop/navigation4//item[@ni = $current_ni]/item) &gt; 1 and not(position() = last()) )">navigation4</iaixsl:when>
								<iaixsl:when test="( count(/shop/navigation5//item[@ni = $current_ni]/item) &gt; 1 and not(position() = last()) )">navigation5</iaixsl:when>
								<iaixsl:otherwise>0</iaixsl:otherwise>
								</iaixsl:choose>
							</iaixsl:variable>
							<li>
								<iaixsl:attribute name="class">category bc-item-<iaixsl:value-of select="position()"/><iaixsl:if test="position() = last()"> bc-active</iaixsl:if><iaixsl:if test="count(/shop/*[name()=$current_navi]//item[@ni = $current_ni]/item) &gt; 1 and not(position() = last())"> --more</iaixsl:if></iaixsl:attribute>
								<iaixsl:choose>
								<iaixsl:when test="/shop/navigation//item[@ni = $current_ni]/@link">
									<a>
									<iaixsl:attribute name="class">category</iaixsl:attribute>
									<iaixsl:attribute name="href"><iaixsl:value-of select="@link"/></iaixsl:attribute>
									<iaixsl:value-of disable-output-escaping="yes" select="@title"/>
									</a>
								</iaixsl:when>
								<iaixsl:otherwise>
									<span>
									<iaixsl:attribute name="class">category</iaixsl:attribute>
									<iaixsl:value-of disable-output-escaping="yes" select="@title"/>
									</span>
								</iaixsl:otherwise>
								</iaixsl:choose>

								<iaixsl:if test="$current_navi != 0">
								<ul class="breadcrumbs__sub">
									<iaixsl:for-each select="/shop/*[name()=$current_navi]//item[@ni = $current_ni]/item">
									<li class="breadcrumbs__item">
										<iaixsl:choose>
										<iaixsl:when test="@link and @link != '##'">
											<a class="breadcrumbs__link --link">
											<iaixsl:attribute name="href"><iaixsl:value-of select="@link"/></iaixsl:attribute>
											<iaixsl:value-of disable-output-escaping="yes" select="@name"/>
											</a>
										</iaixsl:when>
										<iaixsl:otherwise>
											<span class="breadcrumbs__link"><iaixsl:value-of disable-output-escaping="yes" select="@name"/></span>
										</iaixsl:otherwise>
										</iaixsl:choose>
									</li>
									</iaixsl:for-each>
								</ul>
								</iaixsl:if>
							</li>
							</iaixsl:for-each>
							<li class="bc-active bc-product-name">
							<span><iaixsl:value-of disable-output-escaping="yes" select="page/projector/product/name"/></span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'place-order'">
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span>Jednokrokowy proces zakupowy</span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'rma-open'">
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span>Reklamacja bez logowania</span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'returns-open'">
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span>Zwrot bez logowania</span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'opinions-add'">
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span>Dodawanie opinii</span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'noproduct'">
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span>Brak produktu</span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'subscriptions'">
							<li>
							<iaixsl:attribute name="class">bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<a><iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/login/@url"/></iaixsl:attribute>Twoje konto</a>
							</li>
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span><iaixsl:choose><iaixsl:when test="/shop/page/subscriptions/@display = 'active'">Lista aktywnych subskrypcji</iaixsl:when><iaixsl:otherwise>Lista zakończonych subskrypcji</iaixsl:otherwise></iaixsl:choose></span>
							</li>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'subscription'">
							<li>
							<iaixsl:attribute name="class">bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<a><iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/login/@url"/></iaixsl:attribute>Twoje konto</a>
							</li>
							<li>
							<iaixsl:attribute name="class">bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<a><iaixsl:choose><iaixsl:when test="/shop/page/subscription/@status != 'finished'"><iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/subscriptions_active/@url"/></iaixsl:attribute>Lista aktywnych subskrypcji</iaixsl:when><iaixsl:otherwise><iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/subscriptions_terminated/@url"/></iaixsl:attribute>Lista zakończonych subskrypcji</iaixsl:otherwise></iaixsl:choose></a>
							</li>
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span>Subskrypcja nr<iaixsl:text> </iaixsl:text><iaixsl:value-of select="/shop/page/subscription/@id"/></span>
							</li>
						</iaixsl:when>
						
						<iaixsl:otherwise>
							<li>
							<iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
							<span><iaixsl:value-of select="page/@type"/></span>
							</li>
						</iaixsl:otherwise>
						</iaixsl:choose>
					</ol>
					</div>
				</div>	
			</header>
		</iaixsl:if>
		<div id="layout">
			<iaixsl:attribute name="class">row clearfix</iaixsl:attribute>
			<iaixsl:if test="not(action/set_render/item) or (action/set_render/item/@name = 'aside')">
				<aside class="span3">
					<iaixsl:choose>
						<iaixsl:when test="page/@type = 'projector'">
							<iaixsl:attribute name="class">col-3</iaixsl:attribute>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'search'">
							<iaixsl:attribute name="class">col-3 col-xl-2</iaixsl:attribute>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'main'">
							<iaixsl:attribute name="class">col-3</iaixsl:attribute>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'blog-item'">
							<iaixsl:attribute name="class">col-3 col-xl-2</iaixsl:attribute>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'blog-list'">
							<iaixsl:attribute name="class">col-3 col-xl-2</iaixsl:attribute>
						</iaixsl:when>
						<iaixsl:otherwise>
							<iaixsl:attribute name="class">col-3</iaixsl:attribute>
						</iaixsl:otherwise>
					</iaixsl:choose>
					<!-- (menu_wishlist, 60dd8ecf0ff704.93839526.3)-->
	<section class="shopping_list_menu">
		<div class="shopping_list_menu__block --lists slm_lists" data-empty="false">
			<iaixsl:if test="not(/shop/shopping_lists/list)">
				<iaixsl:attribute name="data-empty">true</iaixsl:attribute>
			</iaixsl:if>
			<span class="slm_lists__label">Listy zakupowe</span>
			<ul class="slm_lists__nav">
				<li class="slm_lists__nav_item" data-list_skeleton="true" data-list_id="true" data-shared="true">
					<a class="slm_lists__nav_link" data-list_href="true">
						<span class="slm_lists__nav_name" data-list_name="true"/>
						<span class="slm_lists__count" data-list_count="true">0</span>
					</a>
				</li>
				<li class="slm_lists__nav_header">
					<span class="slm_lists__label">Listy zakupowe</span>
				</li>
				<iaixsl:if test="not(/shop/shopping_lists/list)">
					<li class="slm_lists__nav_item --empty">
						<a class="slm_lists__nav_link --empty">
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/shoppinglist/@url"/></iaixsl:attribute>
							<span class="slm_lists__nav_name" data-list_name="true">Lista zakupowa</span>
							<span class="slm_lists__count" data-list_count="true">0</span>
						</a>
					</li>
				</iaixsl:if>
				<iaixsl:for-each select="/shop/shopping_lists/list">
					<li class="slm_lists__nav_item">
						<iaixsl:attribute name="data-list_id"><iaixsl:value-of select="@id"/></iaixsl:attribute>
						<iaixsl:if test="@id = /shop/page/list/@id">
							<iaixsl:attribute name="data-current">true</iaixsl:attribute>
						</iaixsl:if>
						<iaixsl:if test="@shared = 'true'">
							<iaixsl:attribute name="data-shared">true</iaixsl:attribute>
						</iaixsl:if>
						<a class="slm_lists__nav_link">
							<iaixsl:attribute name="href"><iaixsl:value-of select="@link"/></iaixsl:attribute>
							<span class="slm_lists__nav_name" data-list_name="true"><iaixsl:value-of disable-output-escaping="yes" select="@name"/></span>
							<span class="slm_lists__count" data-list_count="true"><iaixsl:value-of select="@count"/></span>
						</a>
					</li>
				</iaixsl:for-each>
			</ul>
			<a href="#manage" class="slm_lists__manage d-none align-items-center d-md-flex">Zarządzaj listami</a>
		</div>
		<div class="shopping_list_menu__block --bought slm_bought">
			<a class="slm_bought__link d-flex">
				<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/productsBought/@url"/></iaixsl:attribute>
				Lista dotychczas zamówionych produktów
			</a>
		</div>
		<div class="shopping_list_menu__block --info slm_info">
			<strong class="slm_info__label d-block mb-3">Jak działa lista zakupowa?</strong>
			<ul class="slm_info__list">
				<li class="slm_info__list_item d-flex mb-3">
					Po zalogowaniu możesz umieścić i przechowywać na liście zakupowej dowolną liczbę produktów nieskończenie długo.
				</li>
				<li class="slm_info__list_item d-flex mb-3">
					Dodanie produktu do listy zakupowej nie oznacza automatycznie jego rezerwacji.
				</li>
				<li class="slm_info__list_item d-flex mb-3">
					Dla niezalogowanych klientów lista zakupowa przechowywana jest do momentu wygaśnięcia sesji (około 24h).
				</li>
			</ul>
		</div>
	</section>
<!-- (menu_additional1, 614c5d2d239131.78356405.2)-->
            <iaixsl:variable name="SET_filters"/>
            <iaixsl:variable name="SET_categories">1</iaixsl:variable>
            <iaixsl:if test="$SET_categories and not($SET_categories = '')">
                <div id="mobileCategories" class="mobileCategories">
                    <div class="mobileCategories__item --menu">
                        <a class="mobileCategories__link --active" href="#">
                            <iaixsl:attribute name="data-ids">#menu_search,.shopping_list_menu,#menu_search,#menu_navbar,#menu_navbar3, #menu_blog</iaixsl:attribute>
                            Menu
                        </a>
                    </div>
                    <div class="mobileCategories__item --account">
                        <a class="mobileCategories__link" href="#">
                            <iaixsl:attribute name="data-ids">#menu_contact,#login_menu_block</iaixsl:attribute>
                            Konto
                        </a>
                    </div>
                    <iaixsl:if test="(count(/shop/currency/option) &gt; 1) or (count(/shop/language/option) &gt; 1) or (count(/shop/countries/country) &gt; 1)">
                        <div class="mobileCategories__item --settings">
                            <a class="mobileCategories__link" href="#">
                                <iaixsl:attribute name="data-ids">#menu_settings</iaixsl:attribute>
                                Ustawienia
                            </a>
                        </div>
                    </iaixsl:if>
                </div>
            </iaixsl:if>
            <div class="setMobileGrid" data-item="#menu_navbar"/>
            <div class="setMobileGrid" data-item="#menu_navbar3">
				<iaixsl:if test="navigation/item">
					<iaixsl:attribute name="data-ismenu1">true</iaixsl:attribute>
				</iaixsl:if>
			</div>
            <div class="setMobileGrid" data-item="#menu_blog"/>
            <div class="login_menu_block d-lg-none" id="login_menu_block">
                <iaixsl:choose>
                    <iaixsl:when test="basket/@login">
                        <a class="your_account_link" href="/login.php">
                            <iaixsl:attribute name="title">
                                
                                
                            </iaixsl:attribute>
                            <i class="icon-cog"/>  <span>Twoje konto</span>
                            
                        </a>
                        <a class="order_status_link" href="/order-open.php">
                            <iaixsl:attribute name="title">
                                
                                
                            </iaixsl:attribute>
                            <i class="icon-globe"/>  <span>Sprawdź status zamówienia</span>
                            
                        </a>
                        <iaixsl:if test="(/shop/basket/@client_id_upc != '') ">
                            <a class="client_card_link" href="##">
                                <iaixsl:attribute name="href">
                                    <iaixsl:value-of disable-output-escaping="yes" select="action/login/@url"/>
                                </iaixsl:attribute>
                                 <i class="icon-barcode"/>  <span>Identyfikator stałego klienta</span>
                            </a>
                        </iaixsl:if>
                        <a class="rabates_link" href="/client-rebate.php">
                            <iaixsl:attribute name="title">
                                
                                
                            </iaixsl:attribute>
                            <span class="font_icon">%</span> <span>Moje rabaty</span>
                            
                        </a>
                        <a class="logout_link" href="/login.php?operation=logout">
                            <iaixsl:attribute name="title">
                                
                                
                            </iaixsl:attribute>
                            <i class="icon-off" style="color: #CC0000;"/>  <span>Wyloguj się</span>
                            
                        </a>
                        <iaixsl:if test="action/personalized_recommendations/@url">
                            <a class="recommendation_link">
                                <iaixsl:attribute name="href">
                                    <iaixsl:value-of disable-output-escaping="yes" select="action/personalized_recommendations/@url"/>
                                </iaixsl:attribute>

                                <i class="icon-thumbs-up" style="color: #0099D0;"/> <span>Rekomendowane dla Ciebie</span>
                                
                            </a>
                        </iaixsl:if>
                    </iaixsl:when>
                    <iaixsl:otherwise>
                        <a class="sign_in_link" href="/login.php">
                            <iaixsl:attribute name="title">
                                
                                
                            </iaixsl:attribute>
                            <i class="icon-user"/>  <span>Zaloguj się</span>
                            
                        </a>
                        <a class="registration_link" href="/client-new.php?register">
                            <iaixsl:attribute name="title">
                                
                                
                            </iaixsl:attribute>
                            <i class="icon-lock"/>  <span>Zarejestruj się</span>
                            
                        </a>
                        <a class="order_status_link" href="/order-open.php">
                            <iaixsl:attribute name="title">
                                
                                
                            </iaixsl:attribute>
                            <i class="icon-globe"/>  <span>Sprawdź status zamówienia</span>
                            
                        </a>
                    </iaixsl:otherwise>
                </iaixsl:choose>
            </div>
            <div class="setMobileGrid" data-item="#menu_contact"/>
            <div class="setMobileGrid" data-item="#menu_settings"/>
            <iaixsl:if test="$SET_filters and not($SET_filters = '')">
                <div class="setMobileGrid">
                  <iaixsl:attribute name="data-item"><iaixsl:value-of select="$SET_filters"/></iaixsl:attribute>
                </div>
            </iaixsl:if>
        <!-- (menu_additional2, 60dd8ece834f78.49107646.3)-->
            <div id="menu_categories2" class="mb-4">
                <iaixsl:choose>
                    <iaixsl:when test="navigation/descendant::item[@ni=/shop/navigation/current/@ni]/item and page/@type='search'">
                            <iaixsl:choose>
                                <iaixsl:when test="navigation/descendant::item[@ni=/shop/navigation/current/@ni]/../@link">
                                    <a class="menu_categories_label menu_go_up">
                                      <iaixsl:attribute name="href"><iaixsl:value-of select="navigation/descendant::item[@ni=/shop/navigation/current/@ni]/../@link"/></iaixsl:attribute>
                                      <iaixsl:value-of disable-output-escaping="yes" select="navigation/descendant::item[@ni=/shop/navigation/current/@ni]/@name"/>
                                    </a>
                                </iaixsl:when>
                                <iaixsl:otherwise>
                                    <span class="menu_categories_label"><iaixsl:value-of disable-output-escaping="yes" select="navigation/descendant::item[@ni=/shop/navigation/current/@ni]/@name"/></span>
                                </iaixsl:otherwise>
                            </iaixsl:choose>
                        
                        <ul>
                          <iaixsl:if test="not(navigation/descendant::item[@ni=/shop/navigation/current/@ni]/item[@ni = /shop/navigation/current/@ni])">
                            <iaixsl:attribute name="class">no_active</iaixsl:attribute>
                          </iaixsl:if>
                            <iaixsl:for-each select="navigation/descendant::item[@ni=/shop/navigation/current/@ni]/item">
                                <li>
                                    <a>
                                        <iaixsl:if test="@link"><iaixsl:attribute name="href"><iaixsl:value-of select="@link"/></iaixsl:attribute></iaixsl:if>
                                        <iaixsl:if test="@target"><iaixsl:attribute name="target"><iaixsl:value-of select="@target"/></iaixsl:attribute></iaixsl:if>
                                        <iaixsl:if test="@ni = /shop/navigation/current/@ni"><iaixsl:attribute name="class">active</iaixsl:attribute></iaixsl:if>
                                        <iaixsl:value-of disable-output-escaping="yes" select="@name"/>
                                    </a>
                                </li>
                            </iaixsl:for-each>
                        </ul>
                    </iaixsl:when>
                    <iaixsl:when test="navigation/descendant::item[@ni=/shop/navigation/current/@ni] and not(navigation/descendant::item[@ni=/shop/navigation/current/@ni]/item) and page/@type='search'">
                        <iaixsl:choose>
                            <iaixsl:when test="navigation/descendant::item[@ni=/shop/navigation/current/@ni]/../@ni">
                                    <iaixsl:choose>
                                        <iaixsl:when test="navigation/descendant::item[@ni=/shop/navigation/current/@ni]/../@link">
                                          <a class="menu_categories_label menu_go_up">
                                            <iaixsl:attribute name="href"><iaixsl:value-of select="navigation/descendant::item[@ni=/shop/navigation/current/@ni]/../@link"/></iaixsl:attribute>
                                            <iaixsl:value-of disable-output-escaping="yes" select="navigation/descendant::item[@ni=/shop/navigation/current/@ni]/../@name"/>
                                          </a>
                                        </iaixsl:when>
                                        <iaixsl:otherwise>
                                          <span class="menu_categories_label"><iaixsl:value-of disable-output-escaping="yes" select="navigation/descendant::item[@ni=/shop/navigation/current/@ni]/../@name"/></span>
                                        </iaixsl:otherwise>
                                    </iaixsl:choose>
                            </iaixsl:when>
                            <iaixsl:otherwise>
                                <a class="menu_categories_label" href="/categories.php">Kategorie </a>
                            </iaixsl:otherwise>
                        </iaixsl:choose>
                        <ul>
                          <iaixsl:if test="not(navigation/descendant::item[@ni=/shop/navigation/current/@ni]/../item[@ni = /shop/navigation/current/@ni])">
                            <iaixsl:attribute name="class">no_active</iaixsl:attribute>
                          </iaixsl:if>
                            <iaixsl:for-each select="navigation/descendant::item[@ni=/shop/navigation/current/@ni]/../item">
                                <li>
                                    <a>
                                        <iaixsl:if test="@link"><iaixsl:attribute name="href"><iaixsl:value-of select="@link"/></iaixsl:attribute></iaixsl:if>
                                        <iaixsl:if test="@target"><iaixsl:attribute name="target"><iaixsl:value-of select="@target"/></iaixsl:attribute></iaixsl:if>
                                        <iaixsl:if test="@ni = /shop/navigation/current/@ni"><iaixsl:attribute name="class">active</iaixsl:attribute></iaixsl:if>
                                        <iaixsl:value-of disable-output-escaping="yes" select="@name"/>
                                    </a>
                                </li>
                            </iaixsl:for-each>
                        </ul>
                    </iaixsl:when>
                    <iaixsl:otherwise>
                        <a class="menu_categories_label" href="/categories.php">Kategorie </a>
                        <ul>
                        <iaixsl:if test="not(navigation/item[@ni = /shop/navigation/current/@ni])">
                          <iaixsl:attribute name="class">no_active</iaixsl:attribute>
                        </iaixsl:if>
                            <iaixsl:for-each select="navigation/item">
                                <li>
                                    <iaixsl:if test="@ni = /shop/navigation/current/@ni"><iaixsl:attribute name="class">active</iaixsl:attribute></iaixsl:if>
                                    <a>
                                        <iaixsl:if test="@link"><iaixsl:attribute name="href"><iaixsl:value-of select="@link"/></iaixsl:attribute></iaixsl:if>
                                        <iaixsl:if test="@target"><iaixsl:attribute name="target"><iaixsl:value-of select="@target"/></iaixsl:attribute></iaixsl:if>
                                        <iaixsl:value-of disable-output-escaping="yes" select="@name"/>
                                    </a>
                                </li>
                            </iaixsl:for-each>
                        </ul>
                    </iaixsl:otherwise>
                </iaixsl:choose>
            </div>
        <!-- (menu_filter, 60dd8ecd6c73c9.01119962.11)-->
	
	<iaixsl:variable name="showAll">5</iaixsl:variable>
	<iaixsl:variable name="showPriceRange">TRUE</iaixsl:variable>
	
	<iaixsl:variable name="samedayCouriersAvail"><iaixsl:value-of select="/shop/page/sameday/@couriers_available"/></iaixsl:variable>
	<iaixsl:variable name="samedayClientLocal"><iaixsl:value-of select="/shop/page/sameday/@client_localized"/></iaixsl:variable>
	<iaixsl:variable name="samedayServiceAvail"><iaixsl:value-of select="/shop/page/sameday/@service_available_for_current_location"/></iaixsl:variable>
	
	<iaixsl:variable name="nextdayCouriersAvail"><iaixsl:value-of select="/shop/page/nextday/@couriers_available"/></iaixsl:variable>
	<iaixsl:variable name="nextdayClientLocal"><iaixsl:value-of select="/shop/page/nextday/@client_localized"/></iaixsl:variable>
	<iaixsl:variable name="nextdayServiceAvail"><iaixsl:value-of select="/shop/page/nextday/@service_available_for_current_location"/></iaixsl:variable>
	

	<iaixsl:if test="count(/shop/page/products/navigation/filtering/filter)">
		<section id="Filters" class="filters mb-4">
			<form class="filters__form" method="get">
				<iaixsl:attribute name="action"><iaixsl:value-of select="/shop/page/products/navigation/search_link/@value"/></iaixsl:attribute>

				
				<iaixsl:for-each select="/shop/page/products/navigation/filtering/filter[not(@id = 'filter_nextday' or @id = 'filter_sameday')]">
					<iaixsl:variable name="firstDual"><iaixsl:value-of select="/shop/page/products/navigation/filtering/filter[@type = 'dual'][not(@id = 'filter_nextday' or @id = 'filter_sameday')][1]/@id"/></iaixsl:variable>

					<iaixsl:if test="(@type = 'dual' and @id = $firstDual) or not(@type = 'dual')">
						
						<iaixsl:variable name="id"><iaixsl:choose><iaixsl:when test="@type = 'dual'">filter_dual</iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="translate (@id, '[]', '')"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>

						<div class="filters__block mb-1">
							
							<iaixsl:if test="not(@type = 'text') and not(@type = 'dual')">
								<input type="hidden" class="__serialize">
									<iaixsl:attribute name="id"><iaixsl:value-of select="$id"/>_input</iaixsl:attribute>
									<iaixsl:attribute name="name"><iaixsl:value-of select="@id"/></iaixsl:attribute>
									<iaixsl:attribute name="value"><iaixsl:for-each select="item[@selected]"><iaixsl:value-of select="@value"/><iaixsl:if test="not(position() = last())">,</iaixsl:if></iaixsl:for-each><iaixsl:for-each select="group"><iaixsl:for-each select="item[@selected]"><iaixsl:value-of select="@value"/><iaixsl:if test="not(position() = last())">,</iaixsl:if></iaixsl:for-each><iaixsl:if test="not(position() = last())">,</iaixsl:if></iaixsl:for-each></iaixsl:attribute>
									<iaixsl:if test="$id = 'filter_price' and (@selected and not(@selected) = '')">
										<iaixsl:attribute name="value"><iaixsl:value-of select="@selected"/></iaixsl:attribute>
									</iaixsl:if>
								</input>
							</iaixsl:if>

							
							<a class="filters__toggler">
								<iaixsl:attribute name="data-id"><iaixsl:value-of select="$id"/></iaixsl:attribute>

								<iaixsl:attribute name="class">filters__toggler
									<iaixsl:choose>
										<iaixsl:when test="@type = 'dual' and /shop/page/products/navigation/filtering/filter[@type = 'dual'][not(@id = 'filter_nextday' or @id = 'filter_sameday')]/@selected">
											 --selected
										</iaixsl:when>
										<iaixsl:when test="@selected">
											 --selected
										</iaixsl:when>
									</iaixsl:choose>
										<iaixsl:if test="@selected"/>
								</iaixsl:attribute>

								
								<div class="btn --icon-right d-block pr-4">
									<iaixsl:choose>
										<iaixsl:when test="@type = 'dual'">
											<span>Pokaż tylko</span>
										</iaixsl:when>
										<iaixsl:otherwise>
											<span><iaixsl:value-of select="@name"/></span>
										</iaixsl:otherwise>
									</iaixsl:choose>
								</div>
							</a>

							
							<div class="filters__expand">
								<iaixsl:attribute name="id"><iaixsl:value-of select="$id"/>_expand</iaixsl:attribute>

								<iaixsl:choose>
									
									<iaixsl:when test="@type = 'text'">
										<div class="filters__content --search">
											<div class="f-group mb-0">
												<input type="text" class="f-control --search_by_text __serialize">
													<iaixsl:attribute name="id"><iaixsl:value-of select="$id"/>_input</iaixsl:attribute>
													<iaixsl:attribute name="name"><iaixsl:value-of select="$id"/></iaixsl:attribute>

													<iaixsl:if test="(@selected) and not (@selected = '')">
														<iaixsl:attribute name="value"><iaixsl:value-of select="@selected"/></iaixsl:attribute>
													</iaixsl:if>

													<iaixsl:attribute name="placeholder">Wpisz czego szukasz</iaixsl:attribute>
												</input>
												<button type="submit" class="btn --secondary">
													<i class="icon-search"/>
												</button>
											</div>
										</div>
									</iaixsl:when>

									
									<iaixsl:when test="@display = 'gfx' or @display = 'name_gfx'">
										<ul class="filters__content d-flex">
											<iaixsl:attribute name="id"><iaixsl:value-of select="$id"/>_content</iaixsl:attribute>
											<iaixsl:attribute name="class">filters__content
												<iaixsl:if test="@display = 'gfx'"> --gfx d-flex flex-wrap</iaixsl:if>
												<iaixsl:if test="@display = 'name_gfx'"> --gfx-name</iaixsl:if>
											</iaixsl:attribute>

											<iaixsl:for-each select="item">
												<iaixsl:sort select="@selected" order="descending"/>

												<li class="filters__item">
													<iaixsl:attribute name="class">filters__item 
														<iaixsl:if test="position() = $showAll and ../@display = 'name_gfx'"> --last-not-hidden</iaixsl:if>
														<iaixsl:if test="position() &gt; $showAll and ../@display = 'name_gfx'"> --hidden</iaixsl:if>
													</iaixsl:attribute>
													<div class="f-group --small --checkbox mb-0">
														<input type="checkbox" class="f-control">
															<iaixsl:attribute name="id"><iaixsl:value-of select="$id"/>_<iaixsl:value-of select="@value"/></iaixsl:attribute>
															<iaixsl:attribute name="data-id"><iaixsl:value-of select="$id"/></iaixsl:attribute>

															<iaixsl:attribute name="value"><iaixsl:value-of select="@value"/></iaixsl:attribute>

															<iaixsl:if test="@selected='selected'">
																<iaixsl:attribute name="checked">checked</iaixsl:attribute>
															</iaixsl:if>

															<iaixsl:if test="@quantity = '0'">
																<iaixsl:attribute name="disabled">disabled</iaixsl:attribute>
															</iaixsl:if>
														</input>

														<label class="f-label">
															<iaixsl:attribute name="for"><iaixsl:value-of select="$id"/>_<iaixsl:value-of select="@value"/></iaixsl:attribute>

															
															<span class="--name">
																<iaixsl:if test="@gfx_normal">
																	<img class="--img">
																		<iaixsl:attribute name="src"><iaixsl:value-of select="@gfx_normal"/></iaixsl:attribute>
																		<iaixsl:attribute name="alt"><iaixsl:value-of select="@name"/></iaixsl:attribute>
																		<iaixsl:attribute name="title"><iaixsl:value-of select="@name"/></iaixsl:attribute>
																	</img>
																</iaixsl:if>
																<iaixsl:if test="../@display = 'name_gfx'">
																	<span><iaixsl:value-of select="@name"/></span>
																</iaixsl:if>
															</span>

															
															<span class="--quantity">
																<iaixsl:if test="not(@quantity)">
																	<iaixsl:attribute name="class">--quantity d-none</iaixsl:attribute>
																</iaixsl:if>
																<iaixsl:choose>
																	<iaixsl:when test="@quantity">
																		<iaixsl:value-of select="@quantity"/>
																	</iaixsl:when>
																	<iaixsl:otherwise>0</iaixsl:otherwise>
																</iaixsl:choose>
															</span>
														</label>
													</div>
												</li>

											</iaixsl:for-each>
										</ul>
										
										<div class="filters__options">
											
											<button type="submit" class="--submit d-none btn py-0 pl-0 pr-3">
												Zastosuj
											</button>

											
											<iaixsl:if test="count(item) &gt; $showAll and @display = 'name_gfx'">
												<a class="--show-hidden btn py-0 pl-3 pr-0">
													<iaixsl:attribute name="data-id"><iaixsl:value-of select="$id"/></iaixsl:attribute>

													<span class="--show">+ Rozwiń</span>
													<span class="--hide">- Ukryj</span>
												</a>
											</iaixsl:if>
										</div>
									</iaixsl:when>

									
									<iaixsl:when test="(@id = 'filter_price' or @id = 'filter_pricenet') and not($showPriceRange = '')">
										<div class="filters__content --range">
													<iaixsl:if test="/shop/page/products/navigation/filtering/filter[(@id = 'filter_price')]/@selected">
															<input type="hidden" id="min_price_set"><iaixsl:attribute name="value"><iaixsl:value-of select="substring-before(/shop/page/products/navigation/filtering/filter[(@id = 'filter_price')]/@selected,'-')"/></iaixsl:attribute></input>
															<input type="hidden" id="max_price_set"><iaixsl:attribute name="value"><iaixsl:value-of select="substring-after(/shop/page/products/navigation/filtering/filter[(@id = 'filter_price')]/@selected,'-')"/></iaixsl:attribute></input>
													</iaixsl:if>
													<input type="hidden" id="min_price_start"><iaixsl:attribute name="value">0</iaixsl:attribute></input>
													<input type="hidden" id="max_price_start"><iaixsl:attribute name="value"><iaixsl:value-of select="substring-before(substring-after(/shop/page/products/navigation/filtering/filter[@id = 'filter_price']/item[position() = last()]/@name,'- '), '.')"/></iaixsl:attribute></input>

													<div class="filters__price-slider"><div class="--price"/></div>
													<div class="filters__price">
															<div class="filters__range d-flex justify-content-between align-items-center">
																	<label for="PriceRangeFrom" class="--from">
																			<input id="PriceRangeFrom" type="text" class="--input-from">
																					<iaixsl:choose>
																							<iaixsl:when test="not(item[@selected = 'selected']) and (@selected and not(@selected = ''))">
																									<iaixsl:attribute name="value"><iaixsl:value-of select="substring-before(@selected, '-')"/></iaixsl:attribute>
																							</iaixsl:when>
																							<iaixsl:otherwise>
																									<iaixsl:attribute name="value">0</iaixsl:attribute>
																							</iaixsl:otherwise>
																					</iaixsl:choose>
																			</input>
																			<span class="--currency"><iaixsl:value-of select="/shop/currency/option[@selected = 'true']/@symbol"/></span>
																	</label>
																	<span class="--gap">
																			-
																	</span>
																	<label for="PriceRangeTo" class="--to">
																			<input id="PriceRangeTo" type="text" class="--input-to">
																					<iaixsl:choose>
																							<iaixsl:when test="not(item[@selected = 'selected']) and (@selected and not(@selected = ''))">
																									<iaixsl:attribute name="value"><iaixsl:value-of select="substring-after(@selected, '-')"/></iaixsl:attribute>
																							</iaixsl:when>
																							<iaixsl:otherwise>
																									<iaixsl:attribute name="value"><iaixsl:value-of select="substring-before(substring-after(/shop/page/products/navigation/filtering/filter[@id = 'filter_price']/item[position() = last()]/@name,'- '), '.')"/></iaixsl:attribute>
																							</iaixsl:otherwise>
																					</iaixsl:choose>
																			</input>
																			<span class="--currency"><iaixsl:value-of select="/shop/currency/option[@selected = 'true']/@symbol"/></span>
																	</label>
															</div>
															<div class="filters_options">
																	<button type="submit" class="btn p-md-0 mt-md-2">
																			Zastosuj zakres cen
																	</button>
															</div>
													</div>
										</div>
									</iaixsl:when>

									
									<iaixsl:when test="@id = 'filter_date'">
										<ul class="filters__content --date">
											<iaixsl:for-each select="item[@desc = '1week' or @desc = '1month' or @desc = '3months' or @desc = '6months' or @desc = '1year']">
												<li class="filters__item mb-2">
													<div class="f-group --small --checkbox mb-0">
														<input type="checkbox" class="f-control">
															<iaixsl:attribute name="id"><iaixsl:value-of select="$id"/>_<iaixsl:value-of select="@value"/></iaixsl:attribute>
															<iaixsl:attribute name="data-id"><iaixsl:value-of select="$id"/></iaixsl:attribute>

															<iaixsl:attribute name="value"><iaixsl:value-of select="@value"/></iaixsl:attribute>

															<iaixsl:if test="@selected='selected'">
																<iaixsl:attribute name="checked">checked</iaixsl:attribute>
															</iaixsl:if>

															<iaixsl:if test="@quantity = '0'">
																<iaixsl:attribute name="disabled">disabled</iaixsl:attribute>
															</iaixsl:if>
														</input>
														<label class="f-label">
															<iaixsl:attribute name="for"><iaixsl:value-of select="$id"/>_<iaixsl:value-of select="@value"/></iaixsl:attribute>

															
															<span class="--name">
																<iaixsl:choose>
																	<iaixsl:when test="@desc = '1week'">Ostatni tydzień</iaixsl:when>
																	<iaixsl:when test="@desc = '1month'">Ostatni miesiąc</iaixsl:when>
																	<iaixsl:when test="@desc = '3months'">Ostatnie 3 miesiące</iaixsl:when>
																	<iaixsl:when test="@desc = '6months'">Ostatnie pół roku</iaixsl:when>
																	<iaixsl:when test="@desc = '1year'">Ostatni rok</iaixsl:when>
																</iaixsl:choose>
															</span>

															
															<span class="--quantity">
																<iaixsl:if test="not(@quantity)">
																	<iaixsl:attribute name="class">--quantity d-none</iaixsl:attribute>
																</iaixsl:if>
																<iaixsl:choose>
																	<iaixsl:when test="@quantity">
																		<iaixsl:value-of select="@quantity"/>
																	</iaixsl:when>
																	<iaixsl:otherwise>0</iaixsl:otherwise>
																</iaixsl:choose>
															</span>
														</label>
													</div>
												</li>
											</iaixsl:for-each>
										</ul>
										
										<div class="filters__options">
											
											<button type="submit" class="--submit d-none btn py-0 pl-0 pr-3">
												Zastosuj
											</button>
										</div>
									</iaixsl:when>

									
									<iaixsl:otherwise>
										<iaixsl:choose>
											
											<iaixsl:when test="group">
												<ul class="filters__content --group">
													<iaixsl:for-each select="group">
														<li class="filters__item mb-1">
															<iaixsl:if test="not(@id = -1)">
																<a class="filters__toggler">
																	<div class="btn d-block">
																		<span>
																			<iaixsl:choose>
																				<iaixsl:when test="@title and not(@title = '')">
																					<iaixsl:value-of select="@title"/>
																				</iaixsl:when>
																				<iaixsl:otherwise>
																					Pozostałe
																				</iaixsl:otherwise>
																			</iaixsl:choose>
																		</span>
																	</div>
																</a>
															</iaixsl:if>
															<ul class="filters__content --list">
																<iaixsl:attribute name="id"><iaixsl:value-of select="$id"/><iaixsl:value-of select="position()"/>_content</iaixsl:attribute>

																<iaixsl:for-each select="item">
																	<iaixsl:sort select="@selected" order="descending"/>

																	<li class="filters__item mb-2">
																		<iaixsl:attribute name="class">filters__item mb-2
																			<iaixsl:if test="position() = $showAll"> --last-not-hidden</iaixsl:if>
																			<iaixsl:if test="position() &gt; $showAll"> --hidden</iaixsl:if>
																		</iaixsl:attribute>

																		<div class="f-group --small --checkbox mb-0">
																			<input type="checkbox" class="f-control">
																				<iaixsl:attribute name="id"><iaixsl:value-of select="$id"/>_<iaixsl:value-of select="@value"/></iaixsl:attribute>
																				<iaixsl:attribute name="data-id"><iaixsl:value-of select="$id"/></iaixsl:attribute>

																				<iaixsl:attribute name="value"><iaixsl:value-of select="@value"/></iaixsl:attribute>

																				<iaixsl:if test="@selected='selected'">
																					<iaixsl:attribute name="checked">checked</iaixsl:attribute>
																				</iaixsl:if>

																				<iaixsl:if test="@quantity = '0'">
																					<iaixsl:attribute name="disabled">disabled</iaixsl:attribute>
																				</iaixsl:if>
																			</input>

																			<label class="f-label">
																				<iaixsl:attribute name="for"><iaixsl:value-of select="$id"/>_<iaixsl:value-of select="@value"/></iaixsl:attribute>

																				
																				<span class="--name">
																					<iaixsl:value-of select="@name"/>
																				</span>

																				
																				<span class="--quantity">
																					<iaixsl:if test="not(@quantity)">
																						<iaixsl:attribute name="class">--quantity d-none</iaixsl:attribute>
																					</iaixsl:if>
																					<iaixsl:choose>
																						<iaixsl:when test="@quantity">
																							<iaixsl:value-of select="@quantity"/>
																						</iaixsl:when>
																						<iaixsl:otherwise>0</iaixsl:otherwise>
																					</iaixsl:choose>
																				</span>
																			</label>
																		</div>
																	</li>
																</iaixsl:for-each>
															</ul>
															
															<div class="filters__options">
																
																<button type="submit" class="--submit d-none btn py-0 pl-0 pr-3">
																	Zastosuj
																</button>

																
																<iaixsl:if test="count(item) &gt; $showAll">
																	<a class="--show-hidden btn py-0 pl-3 pr-0">
																		<iaixsl:attribute name="data-id"><iaixsl:value-of select="$id"/><iaixsl:value-of select="position()"/></iaixsl:attribute>

																		<span class="--show">+ Rozwiń</span>
																		<span class="--hide">- Ukryj</span>
																	</a>
																</iaixsl:if>
															</div>
														</li>
													</iaixsl:for-each>
												</ul>
											</iaixsl:when>

											
											<iaixsl:otherwise>
												<ul class="filters__content --list">
													<iaixsl:attribute name="id"><iaixsl:value-of select="$id"/>_content</iaixsl:attribute>

													<iaixsl:choose>
														<iaixsl:when test="@type = 'dual'">
															<iaixsl:for-each select="/shop/page/products/navigation/filtering/filter[@type = 'dual'][not(@id = 'filter_nextday' or @id = 'filter_sameday')]">
																
																<iaixsl:variable name="id_dual"><iaixsl:value-of select="translate (@id, '[]', '')"/></iaixsl:variable>

																<iaixsl:for-each select="item[@value = 'y']">
																	<li class="filters__item mb-2">
																		<div class="f-group --small --checkbox mb-0">
																			<input type="checkbox" class="f-control __serialize">
																				<iaixsl:attribute name="id"><iaixsl:value-of select="$id_dual"/>_<iaixsl:value-of select="@value"/></iaixsl:attribute>
																				<iaixsl:attribute name="value"><iaixsl:value-of select="@value"/></iaixsl:attribute>
																				<iaixsl:attribute name="name"><iaixsl:value-of select="$id_dual"/></iaixsl:attribute>

																				<iaixsl:if test="@selected='selected'">
																					<iaixsl:attribute name="checked">checked</iaixsl:attribute>
																				</iaixsl:if>

																				<iaixsl:if test="@quantity = '0'">
																					<iaixsl:attribute name="disabled">disabled</iaixsl:attribute>
																				</iaixsl:if>
																			</input>
																			<label class="f-label">
																				<iaixsl:attribute name="for"><iaixsl:value-of select="$id_dual"/>_<iaixsl:value-of select="@value"/></iaixsl:attribute>

																				
																				<span class="--name">
																					<iaixsl:value-of select="../@name"/>
																				</span>

																				
																				<span class="--quantity">
																					<iaixsl:if test="not(@quantity)">
																						<iaixsl:attribute name="class">--quantity d-none</iaixsl:attribute>
																					</iaixsl:if>
																					<iaixsl:choose>
																						<iaixsl:when test="@quantity">
																							<iaixsl:value-of select="@quantity"/>
																						</iaixsl:when>
																						<iaixsl:otherwise>0</iaixsl:otherwise>
																					</iaixsl:choose>
																				</span>
																			</label>
																		</div>
																	</li>
																</iaixsl:for-each>
															</iaixsl:for-each>
														</iaixsl:when>
														<iaixsl:otherwise>
															<iaixsl:for-each select="item">
																<iaixsl:sort select="@selected" order="descending"/>

																<li class="filters__item mb-2">
																	<iaixsl:attribute name="class">filters__item mb-2
																		<iaixsl:if test="position() = $showAll"> --last-not-hidden</iaixsl:if>
																		<iaixsl:if test="position() &gt; $showAll"> --hidden</iaixsl:if>
																	</iaixsl:attribute>

																	<div class="f-group --small --checkbox mb-0">
																		<input type="checkbox" class="f-control">
																			<iaixsl:attribute name="id"><iaixsl:value-of select="$id"/>_<iaixsl:value-of select="@value"/></iaixsl:attribute>
																			<iaixsl:attribute name="data-id"><iaixsl:value-of select="$id"/></iaixsl:attribute>

																			<iaixsl:attribute name="value"><iaixsl:value-of select="@value"/></iaixsl:attribute>

																			<iaixsl:if test="@selected='selected'">
																				<iaixsl:attribute name="checked">checked</iaixsl:attribute>
																			</iaixsl:if>

																			<iaixsl:if test="@quantity = '0'">
																				<iaixsl:attribute name="disabled">disabled</iaixsl:attribute>
																			</iaixsl:if>
																		</input>

																		<label class="f-label">
																			<iaixsl:attribute name="for"><iaixsl:value-of select="$id"/>_<iaixsl:value-of select="@value"/></iaixsl:attribute>

																			
																			<span class="--name">
																				<iaixsl:value-of select="@name"/>
																			</span>

																			
																			<span class="--quantity">
																				<iaixsl:if test="not(@quantity)">
																					<iaixsl:attribute name="class">--quantity d-none</iaixsl:attribute>
																				</iaixsl:if>
																				<iaixsl:choose>
																					<iaixsl:when test="@quantity">
																						<iaixsl:value-of select="@quantity"/>
																					</iaixsl:when>
																					<iaixsl:otherwise>0</iaixsl:otherwise>
																				</iaixsl:choose>
																			</span>
																		</label>
																	</div>
																</li>
															</iaixsl:for-each>
														</iaixsl:otherwise>
													</iaixsl:choose>
												</ul>

												
												<div class="filters__options">
													
													<button type="submit" class="--submit d-none btn py-0 pl-0 pr-3">
														Zastosuj
													</button>

													
													<iaixsl:if test="count(item) &gt; $showAll">
														<a class="--show-hidden btn py-0 pl-3 pr-0">
															<iaixsl:attribute name="data-id"><iaixsl:value-of select="$id"/></iaixsl:attribute>

															<span class="--show">+ Rozwiń</span>
															<span class="--hide">- Ukryj</span>
														</a>
													</iaixsl:if>
												</div>
											</iaixsl:otherwise>
										</iaixsl:choose>
									</iaixsl:otherwise>
								</iaixsl:choose>
							</div>
						</div>
					</iaixsl:if>
				</iaixsl:for-each>

				
				<iaixsl:if test="/shop/page/products/navigation/filtering/filter[@type='dual'] and ($samedayCouriersAvail = 'true' and $samedayClientLocal = 'false') or ($samedayCouriersAvail = 'true' and $samedayClientLocal = 'true' and $samedayServiceAvail = 'true') or ($nextdayCouriersAvail = 'true' and $nextdayClientLocal = 'false') or ($nextdayCouriersAvail = 'true' and $nextdayClientLocal = 'true' and $nextdayServiceAvail = 'true')">
					
					<iaixsl:variable name="id">filter_xpress</iaixsl:variable>

					<div class="filters__block mb-1">
						<a class="filters__toggler">
							<iaixsl:attribute name="data-id"><iaixsl:value-of select="$id"/></iaixsl:attribute>

							<iaixsl:attribute name="class">filters__toggler
								<iaixsl:if test="@selected"> --selected</iaixsl:if>
							</iaixsl:attribute>

							
							<div class="btn --icon-right d-block pr-4">
								<span>Ekspresowa dostawa</span>
							</div>
						</a>

						
						<div class="filters__expand">
							<iaixsl:attribute name="id"><iaixsl:value-of select="$id"/>_expand</iaixsl:attribute>

							<ul class="filters__content --dual">
								
								<iaixsl:if test="($nextdayCouriersAvail = 'true' and $nextdayClientLocal = 'false') or ($nextdayCouriersAvail = 'true' and $nextdayClientLocal = 'true' and $nextdayServiceAvail = 'true')">
									<li class="filters__item mb-2">
										<div class="f-group --small --checkbox mb-0">
											<input name="filter_nextday" type="checkbox" class="f-control __serialize">
												<iaixsl:attribute name="id">filter_nextday_form</iaixsl:attribute>
												<iaixsl:attribute name="value">y</iaixsl:attribute>
												<iaixsl:attribute name="name">filter_nextday</iaixsl:attribute>

												<iaixsl:attribute name="data-xpress">true</iaixsl:attribute>
												<iaixsl:attribute name="data-localized"><iaixsl:value-of select="$nextdayClientLocal"/></iaixsl:attribute>
												<iaixsl:attribute name="data-available"><iaixsl:value-of select="$nextdayCouriersAvail"/></iaixsl:attribute>

												<iaixsl:if test="/shop/page/products/navigation/filtering/filter[@id = 'filter_nextday']/@selected">
													<iaixsl:attribute name="checked">checked</iaixsl:attribute>
												</iaixsl:if>
											</input>

											<label for="filter_nextday_form" class="f-label">
												
												<span class="--name">
													Następnego dnia <strong>24h</strong>
												</span>
											</label>
										</div>
									</li>
								</iaixsl:if>

								
								<iaixsl:if test="($samedayCouriersAvail = 'true' and $samedayClientLocal = 'false') or ($samedayCouriersAvail = 'true' and $samedayClientLocal = 'true' and $samedayServiceAvail = 'true')">
									<li class="filters__item mb-2">
										<div class="f-group --small --checkbox mb-0">
											<input name="filter_sameday" type="checkbox" class="f-control __serialize">
												<iaixsl:attribute name="id">filter_sameday_form</iaixsl:attribute>
												<iaixsl:attribute name="value">y</iaixsl:attribute>
												<iaixsl:attribute name="name">filter_sameday</iaixsl:attribute>

												<iaixsl:attribute name="data-xpress">true</iaixsl:attribute>
												<iaixsl:attribute name="data-localized"><iaixsl:value-of select="$samedayClientLocal"/></iaixsl:attribute>
												<iaixsl:attribute name="data-available"><iaixsl:value-of select="$samedayCouriersAvail"/></iaixsl:attribute>

												<iaixsl:if test="/shop/page/products/navigation/filtering/filter[@id = 'filter_sameday']/@selected">
													<iaixsl:attribute name="checked">checked</iaixsl:attribute>
												</iaixsl:if>
											</input>

											<label for="filter_sameday_form" class="f-label">
												
												<span class="--name">
													Tego samego dnia <i class="icon-clock"/>
												</span>
											</label>
										</div>
									</li>
								</iaixsl:if>
							</ul>
							
							<div class="filters__options">
								
								<button type="submit" class="--submit d-none btn py-0 pl-0 pr-3">
									Zastosuj
								</button>
							</div>
						</div>
					</div>

					
					<script src="//maps.googleapis.com/maps/api/js?sensor=false"/>
				</iaixsl:if>

				
				<div class="f-group filters__buttons mt-3 row">
					
					
						<button type="submit" class="btn --large --solid d-block">
							<iaixsl:attribute name="title">Kliknij aby zastosować wybrane filtry</iaixsl:attribute>
							Zastosuj wybrane filtry
						</button>
					

					
					
						<iaixsl:if test="(/shop/page/products/navigation/filtering/filter/item/@selected='selected') or count(/shop/page/products/navigation/filtering/filter/@selected)">
							<a class="btn d-block" href="/settings.php?filter_remove=all">
								<iaixsl:if test="/shop/page/products/navigation/search_link/@value">
									<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/page/products/navigation/search_link/@value "/></iaixsl:attribute>
								</iaixsl:if>
								<iaixsl:attribute name="title">Kliknij aby wyczyścić listę aktywnych filtrów</iaixsl:attribute>
								Usuń wszystkie filtry
							</a>
						</iaixsl:if>
				
				</div>
			</form>
		</section>
	</iaixsl:if>
	<section id="Filters2" style="position: absolute; width: 0; height: 0; overflow: hidden;" class="filters mb-4">
			<form class="filters__form" method="get">
				<iaixsl:attribute name="action"><iaixsl:value-of select="/shop/page/products/navigation/search_link/@value"/></iaixsl:attribute>

				
				<iaixsl:for-each select="/shop/page/products/navigation/filtering/filter[not(@id = 'filter_nextday' or @id = 'filter_sameday')]">
					<iaixsl:variable name="firstDual"><iaixsl:value-of select="/shop/page/products/navigation/filtering/filter[@type = 'dual'][not(@id = 'filter_nextday' or @id = 'filter_sameday')][1]/@id"/></iaixsl:variable>

					<iaixsl:if test="(@type = 'dual' and @id = $firstDual) or not(@type = 'dual')">
						
						<iaixsl:variable name="id"><iaixsl:choose><iaixsl:when test="@type = 'dual'">filter_dual</iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="translate (@id, '[]', '')"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>

						<div class="filters__block mb-1">
							
							<iaixsl:if test="not(@type = 'text') and not(@type = 'dual')">
								<input type="hidden" class="__serialize">
									<iaixsl:attribute name="id"><iaixsl:value-of select="$id"/>_input</iaixsl:attribute>
									<iaixsl:attribute name="name"><iaixsl:value-of select="@id"/></iaixsl:attribute>
									<iaixsl:attribute name="value"><iaixsl:for-each select="item[@selected]"><iaixsl:value-of select="@value"/><iaixsl:if test="not(position() = last())">,</iaixsl:if></iaixsl:for-each><iaixsl:for-each select="group"><iaixsl:for-each select="item[@selected]"><iaixsl:value-of select="@value"/><iaixsl:if test="not(position() = last())">,</iaixsl:if></iaixsl:for-each><iaixsl:if test="not(position() = last())">,</iaixsl:if></iaixsl:for-each></iaixsl:attribute>
									<iaixsl:if test="$id = 'filter_price' and (@selected and not(@selected) = '')">
										<iaixsl:attribute name="value"><iaixsl:value-of select="@selected"/></iaixsl:attribute>
									</iaixsl:if>
								</input>
							</iaixsl:if>

							
							<a class="filters__toggler">
								<iaixsl:attribute name="data-id"><iaixsl:value-of select="$id"/></iaixsl:attribute>

								<iaixsl:attribute name="class">filters__toggler
									<iaixsl:choose>
										<iaixsl:when test="@type = 'dual' and /shop/page/products/navigation/filtering/filter[@type = 'dual'][not(@id = 'filter_nextday' or @id = 'filter_sameday')]/@selected">
											 --selected
										</iaixsl:when>
										<iaixsl:when test="@selected">
											 --selected
										</iaixsl:when>
									</iaixsl:choose>
										<iaixsl:if test="@selected"/>
								</iaixsl:attribute>

								
								<div class="btn --icon-right d-block pr-4">
									<iaixsl:choose>
										<iaixsl:when test="@type = 'dual'">
											<span>Pokaż tylko</span>
										</iaixsl:when>
										<iaixsl:otherwise>
											<span><iaixsl:value-of select="@name"/></span>
										</iaixsl:otherwise>
									</iaixsl:choose>
								</div>
							</a>

							
							<div class="filters__expand">
								<iaixsl:attribute name="id"><iaixsl:value-of select="$id"/>_expand</iaixsl:attribute>

								<iaixsl:choose>
									
									<iaixsl:when test="@type = 'text'">
										<div class="filters__content --search">
											<div class="f-group mb-0">
												<input type="text" class="f-control --search_by_text __serialize">
													<iaixsl:attribute name="id"><iaixsl:value-of select="$id"/>_input</iaixsl:attribute>
													<iaixsl:attribute name="name"><iaixsl:value-of select="$id"/></iaixsl:attribute>

													<iaixsl:if test="(@selected) and not (@selected = '')">
														<iaixsl:attribute name="value"><iaixsl:value-of select="@selected"/></iaixsl:attribute>
													</iaixsl:if>

													<iaixsl:attribute name="placeholder">Wpisz czego szukasz</iaixsl:attribute>
												</input>
												<button type="submit" class="btn --secondary">
													<i class="icon-search"/>
												</button>
											</div>
										</div>
									</iaixsl:when>

									
									<iaixsl:when test="@display = 'gfx' or @display = 'name_gfx'">
										<ul class="filters__content d-flex">
											<iaixsl:attribute name="id"><iaixsl:value-of select="$id"/>_content</iaixsl:attribute>
											<iaixsl:attribute name="class">filters__content
												<iaixsl:if test="@display = 'gfx'"> --gfx d-flex flex-wrap</iaixsl:if>
												<iaixsl:if test="@display = 'name_gfx'"> --gfx-name</iaixsl:if>
											</iaixsl:attribute>

											<iaixsl:for-each select="item">
												<iaixsl:sort select="@selected" order="descending"/>

												<li class="filters__item">
													<iaixsl:attribute name="class">filters__item 
														<iaixsl:if test="position() = $showAll and ../@display = 'name_gfx'"> --last-not-hidden</iaixsl:if>
														<iaixsl:if test="position() &gt; $showAll and ../@display = 'name_gfx'"> --hidden</iaixsl:if>
													</iaixsl:attribute>
													<div class="f-group --small --checkbox mb-0">
														<input type="checkbox" class="f-control">
															<iaixsl:attribute name="id"><iaixsl:value-of select="$id"/>_<iaixsl:value-of select="@value"/></iaixsl:attribute>
															<iaixsl:attribute name="data-id"><iaixsl:value-of select="$id"/></iaixsl:attribute>

															<iaixsl:attribute name="value"><iaixsl:value-of select="@value"/></iaixsl:attribute>

															<iaixsl:if test="@selected='selected'">
																<iaixsl:attribute name="checked">checked</iaixsl:attribute>
															</iaixsl:if>

															<iaixsl:if test="@quantity = '0'">
																<iaixsl:attribute name="disabled">disabled</iaixsl:attribute>
															</iaixsl:if>
														</input>

														<label class="f-label">
															<iaixsl:attribute name="for"><iaixsl:value-of select="$id"/>_<iaixsl:value-of select="@value"/></iaixsl:attribute>

															
															<span class="--name">
																<iaixsl:if test="@gfx_normal">
																	<img class="--img">
																		<iaixsl:attribute name="src"><iaixsl:value-of select="@gfx_normal"/></iaixsl:attribute>
																		<iaixsl:attribute name="alt"><iaixsl:value-of select="@name"/></iaixsl:attribute>
																		<iaixsl:attribute name="title"><iaixsl:value-of select="@name"/></iaixsl:attribute>
																	</img>
																</iaixsl:if>
																<iaixsl:if test="../@display = 'name_gfx'">
																	<span><iaixsl:value-of select="@name"/></span>
																</iaixsl:if>
															</span>

															
															<span class="--quantity">
																<iaixsl:if test="not(@quantity)">
																	<iaixsl:attribute name="class">--quantity d-none</iaixsl:attribute>
																</iaixsl:if>
																<iaixsl:choose>
																	<iaixsl:when test="@quantity">
																		<iaixsl:value-of select="@quantity"/>
																	</iaixsl:when>
																	<iaixsl:otherwise>0</iaixsl:otherwise>
																</iaixsl:choose>
															</span>
														</label>
													</div>
												</li>

											</iaixsl:for-each>
										</ul>
										
										<div class="filters__options">
											
											<button type="submit" class="--submit d-none btn py-0 pl-0 pr-3">
												Zastosuj
											</button>

											
											<iaixsl:if test="count(item) &gt; $showAll and @display = 'name_gfx'">
												<a class="--show-hidden btn py-0 pl-3 pr-0">
													<iaixsl:attribute name="data-id"><iaixsl:value-of select="$id"/></iaixsl:attribute>

													<span class="--show">+ Rozwiń</span>
													<span class="--hide">- Ukryj</span>
												</a>
											</iaixsl:if>
										</div>
									</iaixsl:when>

									
									<iaixsl:when test="(@id = 'filter_price' or @id = 'filter_pricenet') and not($showPriceRange = '')">
										<div class="filters__content --range">
													<iaixsl:if test="/shop/page/products/navigation/filtering/filter[(@id = 'filter_price')]/@selected">
															<input type="hidden" id="min_price_set"><iaixsl:attribute name="value"><iaixsl:value-of select="substring-before(/shop/page/products/navigation/filtering/filter[(@id = 'filter_price')]/@selected,'-')"/></iaixsl:attribute></input>
															<input type="hidden" id="max_price_set"><iaixsl:attribute name="value"><iaixsl:value-of select="substring-after(/shop/page/products/navigation/filtering/filter[(@id = 'filter_price')]/@selected,'-')"/></iaixsl:attribute></input>
													</iaixsl:if>
													<input type="hidden" id="min_price_start"><iaixsl:attribute name="value">0</iaixsl:attribute></input>
													<input type="hidden" id="max_price_start"><iaixsl:attribute name="value"><iaixsl:value-of select="substring-before(substring-after(/shop/page/products/navigation/filtering/filter[@id = 'filter_price']/item[position() = last()]/@name,'- '), '.')"/></iaixsl:attribute></input>

													<div class="filters__price-slider"><div class="--price"/></div>
													<div class="filters__price">
															<div class="filters__range d-flex justify-content-between align-items-center">
																	<label for="PriceRangeFrom" class="--from">
																			<input id="PriceRangeFrom" type="text" class="--input-from">
																					<iaixsl:choose>
																							<iaixsl:when test="not(item[@selected = 'selected']) and (@selected and not(@selected = ''))">
																									<iaixsl:attribute name="value"><iaixsl:value-of select="substring-before(@selected, '-')"/></iaixsl:attribute>
																							</iaixsl:when>
																							<iaixsl:otherwise>
																									<iaixsl:attribute name="value">0</iaixsl:attribute>
																							</iaixsl:otherwise>
																					</iaixsl:choose>
																			</input>
																			<span class="--currency"><iaixsl:value-of select="/shop/currency/option[@selected = 'true']/@symbol"/></span>
																	</label>
																	<span class="--gap">
																			-
																	</span>
																	<label for="PriceRangeTo" class="--to">
																			<input id="PriceRangeTo" type="text" class="--input-to">
																					<iaixsl:choose>
																							<iaixsl:when test="not(item[@selected = 'selected']) and (@selected and not(@selected = ''))">
																									<iaixsl:attribute name="value"><iaixsl:value-of select="substring-after(@selected, '-')"/></iaixsl:attribute>
																							</iaixsl:when>
																							<iaixsl:otherwise>
																									<iaixsl:attribute name="value"><iaixsl:value-of select="substring-before(substring-after(/shop/page/products/navigation/filtering/filter[@id = 'filter_price']/item[position() = last()]/@name,'- '), '.')"/></iaixsl:attribute>
																							</iaixsl:otherwise>
																					</iaixsl:choose>
																			</input>
																			<span class="--currency"><iaixsl:value-of select="/shop/currency/option[@selected = 'true']/@symbol"/></span>
																	</label>
															</div>
															<div class="filters_options">
																	<button type="submit" class="btn p-md-0 mt-md-2">
																			Zastosuj zakres cen
																	</button>
															</div>
													</div>
										</div>
									</iaixsl:when>

									
									<iaixsl:when test="@id = 'filter_date'">
										<ul class="filters__content --date">
											<iaixsl:for-each select="item[@desc = '1week' or @desc = '1month' or @desc = '3months' or @desc = '6months' or @desc = '1year']">
												<li class="filters__item mb-2">
													<div class="f-group --small --checkbox mb-0">
														<input type="checkbox" class="f-control">
															<iaixsl:attribute name="id"><iaixsl:value-of select="$id"/>_<iaixsl:value-of select="@value"/></iaixsl:attribute>
															<iaixsl:attribute name="data-id"><iaixsl:value-of select="$id"/></iaixsl:attribute>

															<iaixsl:attribute name="value"><iaixsl:value-of select="@value"/></iaixsl:attribute>

															<iaixsl:if test="@selected='selected'">
																<iaixsl:attribute name="checked">checked</iaixsl:attribute>
															</iaixsl:if>

															<iaixsl:if test="@quantity = '0'">
																<iaixsl:attribute name="disabled">disabled</iaixsl:attribute>
															</iaixsl:if>
														</input>
														<label class="f-label">
															<iaixsl:attribute name="for"><iaixsl:value-of select="$id"/>_<iaixsl:value-of select="@value"/></iaixsl:attribute>

															
															<span class="--name">
																<iaixsl:choose>
																	<iaixsl:when test="@desc = '1week'">Ostatni tydzień</iaixsl:when>
																	<iaixsl:when test="@desc = '1month'">Ostatni miesiąc</iaixsl:when>
																	<iaixsl:when test="@desc = '3months'">Ostatnie 3 miesiące</iaixsl:when>
																	<iaixsl:when test="@desc = '6months'">Ostatnie pół roku</iaixsl:when>
																	<iaixsl:when test="@desc = '1year'">Ostatni rok</iaixsl:when>
																</iaixsl:choose>
															</span>

															
															<span class="--quantity">
																<iaixsl:if test="not(@quantity)">
																	<iaixsl:attribute name="class">--quantity d-none</iaixsl:attribute>
																</iaixsl:if>
																<iaixsl:choose>
																	<iaixsl:when test="@quantity">
																		<iaixsl:value-of select="@quantity"/>
																	</iaixsl:when>
																	<iaixsl:otherwise>0</iaixsl:otherwise>
																</iaixsl:choose>
															</span>
														</label>
													</div>
												</li>
											</iaixsl:for-each>
										</ul>
										
										<div class="filters__options">
											
											<button type="submit" class="--submit d-none btn py-0 pl-0 pr-3">
												Zastosuj
											</button>
										</div>
									</iaixsl:when>

									
									<iaixsl:otherwise>
										<iaixsl:choose>
											
											<iaixsl:when test="group">
												<ul class="filters__content --group">
													<iaixsl:for-each select="group">
														<li class="filters__item mb-1">
															<iaixsl:if test="not(@id = -1)">
																<a class="filters__toggler">
																	<div class="btn d-block">
																		<span>
																			<iaixsl:choose>
																				<iaixsl:when test="@title and not(@title = '')">
																					<iaixsl:value-of select="@title"/>
																				</iaixsl:when>
																				<iaixsl:otherwise>
																					Pozostałe
																				</iaixsl:otherwise>
																			</iaixsl:choose>
																		</span>
																	</div>
																</a>
															</iaixsl:if>
															<ul class="filters__content --list">
																<iaixsl:attribute name="id"><iaixsl:value-of select="$id"/><iaixsl:value-of select="position()"/>_content</iaixsl:attribute>

																<iaixsl:for-each select="item">
																	<iaixsl:sort select="@selected" order="descending"/>

																	<li class="filters__item mb-2">
																		<iaixsl:attribute name="class">filters__item mb-2
																			<iaixsl:if test="position() = $showAll"> --last-not-hidden</iaixsl:if>
																			<iaixsl:if test="position() &gt; $showAll"> --hidden</iaixsl:if>
																		</iaixsl:attribute>

																		<div class="f-group --small --checkbox mb-0">
																			<input type="checkbox" class="f-control">
																				<iaixsl:attribute name="id"><iaixsl:value-of select="$id"/>_<iaixsl:value-of select="@value"/></iaixsl:attribute>
																				<iaixsl:attribute name="data-id"><iaixsl:value-of select="$id"/></iaixsl:attribute>

																				<iaixsl:attribute name="value"><iaixsl:value-of select="@value"/></iaixsl:attribute>

																				<iaixsl:if test="@selected='selected'">
																					<iaixsl:attribute name="checked">checked</iaixsl:attribute>
																				</iaixsl:if>

																				<iaixsl:if test="@quantity = '0'">
																					<iaixsl:attribute name="disabled">disabled</iaixsl:attribute>
																				</iaixsl:if>
																			</input>

																			<label class="f-label">
																				<iaixsl:attribute name="for"><iaixsl:value-of select="$id"/>_<iaixsl:value-of select="@value"/></iaixsl:attribute>

																				
																				<span class="--name">
																					<iaixsl:value-of select="@name"/>
																				</span>

																				
																				<span class="--quantity">
																					<iaixsl:if test="not(@quantity)">
																						<iaixsl:attribute name="class">--quantity d-none</iaixsl:attribute>
																					</iaixsl:if>
																					<iaixsl:choose>
																						<iaixsl:when test="@quantity">
																							<iaixsl:value-of select="@quantity"/>
																						</iaixsl:when>
																						<iaixsl:otherwise>0</iaixsl:otherwise>
																					</iaixsl:choose>
																				</span>
																			</label>
																		</div>
																	</li>
																</iaixsl:for-each>
															</ul>
															
															<div class="filters__options">
																
																<button type="submit" class="--submit d-none btn py-0 pl-0 pr-3">
																	Zastosuj
																</button>

																
																<iaixsl:if test="count(item) &gt; $showAll">
																	<a class="--show-hidden btn py-0 pl-3 pr-0">
																		<iaixsl:attribute name="data-id"><iaixsl:value-of select="$id"/><iaixsl:value-of select="position()"/></iaixsl:attribute>

																		<span class="--show">+ Rozwiń</span>
																		<span class="--hide">- Ukryj</span>
																	</a>
																</iaixsl:if>
															</div>
														</li>
													</iaixsl:for-each>
												</ul>
											</iaixsl:when>

											
											<iaixsl:otherwise>
												<ul class="filters__content --list">
													<iaixsl:attribute name="id"><iaixsl:value-of select="$id"/>_content</iaixsl:attribute>

													<iaixsl:choose>
														<iaixsl:when test="@type = 'dual'">
															<iaixsl:for-each select="/shop/page/products/navigation/filtering/filter[@type = 'dual'][not(@id = 'filter_nextday' or @id = 'filter_sameday')]">
																
																<iaixsl:variable name="id_dual"><iaixsl:value-of select="translate (@id, '[]', '')"/></iaixsl:variable>

																<iaixsl:for-each select="item[@value = 'y']">
																	<li class="filters__item mb-2">
																		<div class="f-group --small --checkbox mb-0">
																			<input type="checkbox" class="f-control __serialize">
																				<iaixsl:attribute name="id"><iaixsl:value-of select="$id_dual"/>_<iaixsl:value-of select="@value"/></iaixsl:attribute>
																				<iaixsl:attribute name="value"><iaixsl:value-of select="@value"/></iaixsl:attribute>
																				<iaixsl:attribute name="name"><iaixsl:value-of select="$id_dual"/></iaixsl:attribute>

																				<iaixsl:if test="@selected='selected'">
																					<iaixsl:attribute name="checked">checked</iaixsl:attribute>
																				</iaixsl:if>

																				<iaixsl:if test="@quantity = '0'">
																					<iaixsl:attribute name="disabled">disabled</iaixsl:attribute>
																				</iaixsl:if>
																			</input>
																			<label class="f-label">
																				<iaixsl:attribute name="for"><iaixsl:value-of select="$id_dual"/>_<iaixsl:value-of select="@value"/></iaixsl:attribute>

																				
																				<span class="--name">
																					<iaixsl:value-of select="../@name"/>
																				</span>

																				
																				<span class="--quantity">
																					<iaixsl:if test="not(@quantity)">
																						<iaixsl:attribute name="class">--quantity d-none</iaixsl:attribute>
																					</iaixsl:if>
																					<iaixsl:choose>
																						<iaixsl:when test="@quantity">
																							<iaixsl:value-of select="@quantity"/>
																						</iaixsl:when>
																						<iaixsl:otherwise>0</iaixsl:otherwise>
																					</iaixsl:choose>
																				</span>
																			</label>
																		</div>
																	</li>
																</iaixsl:for-each>
															</iaixsl:for-each>
														</iaixsl:when>
														<iaixsl:otherwise>
															<iaixsl:for-each select="item">
																<iaixsl:sort select="@selected" order="descending"/>

																<li class="filters__item mb-2">
																	<iaixsl:attribute name="class">filters__item mb-2
																		<iaixsl:if test="position() = $showAll"> --last-not-hidden</iaixsl:if>
																		<iaixsl:if test="position() &gt; $showAll"> --hidden</iaixsl:if>
																	</iaixsl:attribute>

																	<div class="f-group --small --checkbox mb-0">
																		<input type="checkbox" class="f-control">
																			<iaixsl:attribute name="id"><iaixsl:value-of select="$id"/>_<iaixsl:value-of select="@value"/></iaixsl:attribute>
																			<iaixsl:attribute name="data-id"><iaixsl:value-of select="$id"/></iaixsl:attribute>

																			<iaixsl:attribute name="value"><iaixsl:value-of select="@value"/></iaixsl:attribute>

																			<iaixsl:if test="@selected='selected'">
																				<iaixsl:attribute name="checked">checked</iaixsl:attribute>
																			</iaixsl:if>

																			<iaixsl:if test="@quantity = '0'">
																				<iaixsl:attribute name="disabled">disabled</iaixsl:attribute>
																			</iaixsl:if>
																		</input>

																		<label class="f-label">
																			<iaixsl:attribute name="for"><iaixsl:value-of select="$id"/>_<iaixsl:value-of select="@value"/></iaixsl:attribute>

																			
																			<span class="--name">
																				<iaixsl:value-of select="@name"/>
																			</span>

																			
																			<span class="--quantity">
																				<iaixsl:if test="not(@quantity)">
																					<iaixsl:attribute name="class">--quantity d-none</iaixsl:attribute>
																				</iaixsl:if>
																				<iaixsl:choose>
																					<iaixsl:when test="@quantity">
																						<iaixsl:value-of select="@quantity"/>
																					</iaixsl:when>
																					<iaixsl:otherwise>0</iaixsl:otherwise>
																				</iaixsl:choose>
																			</span>
																		</label>
																	</div>
																</li>
															</iaixsl:for-each>
														</iaixsl:otherwise>
													</iaixsl:choose>
												</ul>

												
												<div class="filters__options">
													
													<button type="submit" class="--submit d-none btn py-0 pl-0 pr-3">
														Zastosuj
													</button>

													
													<iaixsl:if test="count(item) &gt; $showAll">
														<a class="--show-hidden btn py-0 pl-3 pr-0">
															<iaixsl:attribute name="data-id"><iaixsl:value-of select="$id"/></iaixsl:attribute>

															<span class="--show">+ Rozwiń</span>
															<span class="--hide">- Ukryj</span>
														</a>
													</iaixsl:if>
												</div>
											</iaixsl:otherwise>
										</iaixsl:choose>
									</iaixsl:otherwise>
								</iaixsl:choose>
							</div>
						</div>
					</iaixsl:if>
				</iaixsl:for-each>

				
				<iaixsl:if test="/shop/page/products/navigation/filtering/filter[@type='dual'] and ($samedayCouriersAvail = 'true' and $samedayClientLocal = 'false') or ($samedayCouriersAvail = 'true' and $samedayClientLocal = 'true' and $samedayServiceAvail = 'true') or ($nextdayCouriersAvail = 'true' and $nextdayClientLocal = 'false') or ($nextdayCouriersAvail = 'true' and $nextdayClientLocal = 'true' and $nextdayServiceAvail = 'true')">
					
					<iaixsl:variable name="id">filter_xpress</iaixsl:variable>

					<div class="filters__block mb-1">
						<a class="filters__toggler">
							<iaixsl:attribute name="data-id"><iaixsl:value-of select="$id"/></iaixsl:attribute>

							<iaixsl:attribute name="class">filters__toggler
								<iaixsl:if test="@selected"> --selected</iaixsl:if>
							</iaixsl:attribute>

							
							<div class="btn --icon-right d-block pr-4">
								<span>Ekspresowa dostawa</span>
							</div>
						</a>

						
						<div class="filters__expand">
							<iaixsl:attribute name="id"><iaixsl:value-of select="$id"/>_expand</iaixsl:attribute>

							<ul class="filters__content --dual">
								
								<iaixsl:if test="($nextdayCouriersAvail = 'true' and $nextdayClientLocal = 'false') or ($nextdayCouriersAvail = 'true' and $nextdayClientLocal = 'true' and $nextdayServiceAvail = 'true')">
									<li class="filters__item mb-2">
										<div class="f-group --small --checkbox mb-0">
											<input name="filter_nextday" type="checkbox" class="f-control __serialize">
												<iaixsl:attribute name="id">filter_nextday_form</iaixsl:attribute>
												<iaixsl:attribute name="value">y</iaixsl:attribute>
												<iaixsl:attribute name="name">filter_nextday</iaixsl:attribute>

												<iaixsl:attribute name="data-xpress">true</iaixsl:attribute>
												<iaixsl:attribute name="data-localized"><iaixsl:value-of select="$nextdayClientLocal"/></iaixsl:attribute>
												<iaixsl:attribute name="data-available"><iaixsl:value-of select="$nextdayCouriersAvail"/></iaixsl:attribute>

												<iaixsl:if test="/shop/page/products/navigation/filtering/filter[@id = 'filter_nextday']/@selected">
													<iaixsl:attribute name="checked">checked</iaixsl:attribute>
												</iaixsl:if>
											</input>

											<label for="filter_nextday_form" class="f-label">
												
												<span class="--name">
													Następnego dnia <strong>24h</strong>
												</span>
											</label>
										</div>
									</li>
								</iaixsl:if>

								
								<iaixsl:if test="($samedayCouriersAvail = 'true' and $samedayClientLocal = 'false') or ($samedayCouriersAvail = 'true' and $samedayClientLocal = 'true' and $samedayServiceAvail = 'true')">
									<li class="filters__item mb-2">
										<div class="f-group --small --checkbox mb-0">
											<input name="filter_sameday" type="checkbox" class="f-control __serialize">
												<iaixsl:attribute name="id">filter_sameday_form</iaixsl:attribute>
												<iaixsl:attribute name="value">y</iaixsl:attribute>
												<iaixsl:attribute name="name">filter_sameday</iaixsl:attribute>

												<iaixsl:attribute name="data-xpress">true</iaixsl:attribute>
												<iaixsl:attribute name="data-localized"><iaixsl:value-of select="$samedayClientLocal"/></iaixsl:attribute>
												<iaixsl:attribute name="data-available"><iaixsl:value-of select="$samedayCouriersAvail"/></iaixsl:attribute>

												<iaixsl:if test="/shop/page/products/navigation/filtering/filter[@id = 'filter_sameday']/@selected">
													<iaixsl:attribute name="checked">checked</iaixsl:attribute>
												</iaixsl:if>
											</input>

											<label for="filter_sameday_form" class="f-label">
												
												<span class="--name">
													Tego samego dnia <i class="icon-clock"/>
												</span>
											</label>
										</div>
									</li>
								</iaixsl:if>
							</ul>
							
							<div class="filters__options">
								
								<button type="submit" class="--submit d-none btn py-0 pl-0 pr-3">
									Zastosuj
								</button>
							</div>
						</div>
					</div>

					
					<script src="//maps.googleapis.com/maps/api/js?sensor=false"/>
				</iaixsl:if>

				
				<div class="f-group filters__buttons mt-3 row">
					
					
						<button type="submit" class="btn --large --solid d-block">
							<iaixsl:attribute name="title">Kliknij aby zastosować wybrane filtry</iaixsl:attribute>
							Zastosuj wybrane filtry
						</button>
					

					
					
						<iaixsl:if test="(/shop/page/products/navigation/filtering/filter/item/@selected='selected') or count(/shop/page/products/navigation/filtering/filter/@selected)">
							<a class="btn d-block" href="/settings.php?filter_remove=all">
								<iaixsl:if test="/shop/page/products/navigation/search_link/@value">
									<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/page/products/navigation/search_link/@value "/></iaixsl:attribute>
								</iaixsl:if>
								<iaixsl:attribute name="title">Kliknij aby wyczyścić listę aktywnych filtrów</iaixsl:attribute>
								Usuń wszystkie filtry
							</a>
						</iaixsl:if>
				
				</div>
			</form>
		</section>
	<iaixsl:if test="/shop/page/products/navigation/filtering/filter/@mode"> </iaixsl:if>
	<iaixsl:if test="/shop/page/products/navigation/filtering/filter/@id='filter_instock'"> </iaixsl:if>
<!-- (menu_buttons3, 60dd8e7e6e3ca3.91526215.5)-->
	
				</aside>
			</iaixsl:if>
			

			
			<iaixsl:if test="not(action/set_render/item) or (action/set_render/item/@name = 'content')">
				<div id="content" class="span9">
					<iaixsl:choose>
						<iaixsl:when test="page/@type = 'projector'">
							<iaixsl:attribute name="class">col-12</iaixsl:attribute>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'search'">
							<iaixsl:attribute name="class">col-12</iaixsl:attribute>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'main'">
							<iaixsl:attribute name="class">col-12</iaixsl:attribute>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'navigation'">
							<iaixsl:attribute name="class">col-12</iaixsl:attribute>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'blog-list'">
							<iaixsl:attribute name="class">col-xl-10 col-md-9 col-12</iaixsl:attribute>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'blog-item'">
							<iaixsl:attribute name="class">col-xl-10 col-md-9 col-12</iaixsl:attribute>
						</iaixsl:when>
						<iaixsl:otherwise>
							<iaixsl:attribute name="class">col-12</iaixsl:attribute>
						</iaixsl:otherwise>
					</iaixsl:choose>

					<!-- (menu_messages, 60dd8eb71231d1.14665052.7)-->

        <iaixsl:variable name="rebates_code_used">Podany kod rabatowy został już wykorzystany.</iaixsl:variable>

        <iaixsl:variable name="change_success">Zmiany zostały zapisane.</iaixsl:variable>

        <iaixsl:variable name="change_success_despite_no_change">Formularz został zapisany, ale żadne dane nie zostały przez Ciebie zmienione. </iaixsl:variable>


        <iaixsl:if test="count(/shop/page/communicates/warning)">

            <div class="menu_messages_warning" id="menu_messages_warning">


            <iaixsl:choose>
                <iaixsl:when test="/shop/page/communicates/communicate/@messageType = 'message'">
                    <iaixsl:attribute name="class">menu_messages_message</iaixsl:attribute>
                </iaixsl:when>
                <iaixsl:when test="/shop/page/communicates/communicate/@messageType = 'warning'">
                    <iaixsl:attribute name="class">menu_messages_warning</iaixsl:attribute>
                </iaixsl:when>
                <iaixsl:when test="/shop/page/communicates/communicate/@messageType = 'error'">
                    <iaixsl:attribute name="class">menu_messages_error</iaixsl:attribute>
                </iaixsl:when>
                <iaixsl:when test="/shop/page/communicates/communicate/@messageType = 'success'">
                    <iaixsl:attribute name="class">menu_messages_success</iaixsl:attribute>
                </iaixsl:when>
                <iaixsl:otherwise/>
            </iaixsl:choose>


                <div class="menu_messages_warning_sub">
                    <iaixsl:for-each select="/shop/page/communicates/warning">
                        <p><iaixsl:choose>


                                <iaixsl:when test="@type='file_upload_invalid_type'">Nie można wgrać pliku <span class="invalidFileName"><iaixsl:value-of select="@value"/></span>, ponieważ załączanie plików tego typu jest niedozwolone.</iaixsl:when>
                                <iaixsl:when test="@type='file_upload_invalid_extension'">Nie można wgrać pliku <span class="invalidFileName"><iaixsl:value-of select="@value"/></span>, ponieważ załączanie plików tego typu jest niedozwolone.</iaixsl:when>
                                <iaixsl:when test="@type='file_upload_size_exceeded'">Nie można wgrać pliku <span class="invalidFileName"><iaixsl:value-of select="@value"/></span>, ponieważ przekracza maksymalny dozwolony rozmiar 10 MB.</iaixsl:when>
                                <iaixsl:when test="@type='file_uploaded_remove_fail'">Wystąpił bład podczas wgrywania pliku <span class="invalidFileName"><iaixsl:value-of select="@value"/></span>.</iaixsl:when>


                                <iaixsl:when test="@type='rebates_code_expired'">Termin ważności podanego kodu rabatowego już upłynął i jest on nieaktywny.</iaixsl:when>
                                <iaixsl:when test="@type='rebates_code_notbegun'">Podany kod rabatowy nie jest jeszcze aktywny. Ta promocja jeszcze się nie rozpoczęła.</iaixsl:when>

                               <iaixsl:when test="@type='order_minimal_wholesale_blocked'">Minimalna wartość zakupów hurtowych wynosi: <iaixsl:if test="$signbeforeprice = 'true'">
                                            <iaixsl:value-of select="/shop/currency/@name"/>
                                            <iaixsl:value-of select="$signbetweenpricecurrency"/>
                                        </iaixsl:if>
                                        <iaixsl:value-of select="@value"/>
                                        <iaixsl:if test="$signbeforeprice = 'false'">
                                            <iaixsl:value-of select="$signbetweenpricecurrency"/>
                                            <iaixsl:value-of select="/shop/currency/@name"/>
                                        </iaixsl:if>
                                </iaixsl:when>

                            <iaixsl:when test="@type='order_minimal_wholesale_changed'">Mimo, że jesteś hurtownikiem, widzisz w podsumowaniu zamówienia ceny detaliczne. Wynika to z tego, że minimalna wartość dla zamówienia hurtowego nie została osiągnięta. Składając zamówienie w oparciu o aktualny koszyk złożysz zamówienie detaliczne.</iaixsl:when>




                                <iaixsl:when test="@type='openid_invalid_authorization'">Błąd autoryzacji.</iaixsl:when>
                                <iaixsl:when test="@type='suggest_sent'">Zaproszenie do odwiedzenia sklepu zostało wysłane do <iaixsl:value-of select="@value"/>.</iaixsl:when>
                                <iaixsl:when test="@type='search_to_many_products'">Znaleziono zbyt wiele produktów. Skorzystaj z wyszukiwarki aby zawęzić wyniki wyszukiwania.</iaixsl:when>
                                <iaixsl:when test="@type='search_products_not_found'">Szukany produkt nie został znaleziony. Skorzystaj z <a href="/searching.php" title="Kliknij, aby przejść do wyszukiwarki zaawansowanej">wyszukiwarki</a>.</iaixsl:when>
                                <iaixsl:when test="@type='search_text_to_short'">Podany tekst jest zbyt krótki. Spróbuj podać dłuższy tekst lub skorzystaj z wyszukiwarki.</iaixsl:when>
                                <iaixsl:when test="@type='login taken'">Podany login został już zarejestrowany przez innego klienta. Wybierz proszę inną nazwę lub zmodyfikuj tą dodając np. cyfry.</iaixsl:when>
                                <iaixsl:when test="@type='account_not_added'">Wystąpiły błędy i konto klienta nie zostało dodane - spróbuj ponownie później</iaixsl:when>
                                <iaixsl:when test="@type='exists such account'">Konto o podobnych danych już istnieje w naszym sklepie. Jeżeli zakładałeś wcześniej konto w naszym sklepie a nie pamiętasz hasła, skorzystaj z <a href="/password-recover.php">przypominania hasła</a></iaixsl:when>
                                <iaixsl:when test="@type='deliv_addr_not_deleted'">Wskazany adres dostawy nie może być usuniety.</iaixsl:when>
                                <iaixsl:when test="@type='deliv_addr_not_selected'">Wskazany adres dostawy nie może zostać adresem domyślnym.</iaixsl:when>
                                <iaixsl:when test="@type='no login'">Nie podałeś loginu.</iaixsl:when>
                                <iaixsl:when test="@type='incorect login'">Wybrany login jest niepoprawny. Login musi mieć minimum 3, a maksimum 40 znaków (tylko litery lub cyfry).</iaixsl:when>
                                <iaixsl:when test="@type='no password'">Nie podałeś hasła.</iaixsl:when>
                                <iaixsl:when test="@type='password to short'">Poprawne hasło musi składać się przynajmniej z 6 znaków i nie więcej niż 15 znaków.</iaixsl:when>


                                <iaixsl:when test="@type='password_to_long'">Poprawne hasło musi składać się przynajmniej z 6 znaków i nie więcej niż 15 znaków.</iaixsl:when>


                                <iaixsl:when test="@type='login equals password'">Poprawne hasło musi być różne od loginu.</iaixsl:when>
                                <iaixsl:when test="@type='not equal passwords'">Hasło i potwierdzenie hasła są różne.</iaixsl:when>
                                <iaixsl:when test="@type='no firstname'">Podane imię jest za krótkie.</iaixsl:when>
                                <iaixsl:when test="@type='no name'">Brakuje imienia lub nazwiska.</iaixsl:when>
                                <iaixsl:when test="@type='birth_date'">Data urodzenia zawiera nieprawidłowe wartości lub zapisana jest w nieprawidłowym formacie.</iaixsl:when>
                                <iaixsl:when test="@type='incorect email'">Adres e-mail jest błędny.</iaixsl:when>
                                <iaixsl:when test="@type='incorect nip'">Wpisując NIP upewnij się, że używasz odpowiedniego formatu dla wybranego kraju, np. XXXXXXXXXX dla NIP polskiego lub PLXXXXXXXXXX dla NIP EU.</iaixsl:when>

                                <iaixsl:when test="@type='no firmname'">Nazwa firmy nie została podana prawidłowo.</iaixsl:when>

                                <iaixsl:when test="@type='incorrect region'">Podany region jest błędny.</iaixsl:when>
                                <iaixsl:when test="@type='no city'">Podane miasto jest błędne.</iaixsl:when>
                                <iaixsl:when test="@type='no street'">Podany adres jest błędny.</iaixsl:when>

                               <iaixsl:when test="@type='no_street_number'">Podany adres jest błędny.</iaixsl:when>


                                <iaixsl:when test="@type='incorect phone'">Podany telefon jest błędny.</iaixsl:when>
                                <iaixsl:when test="@type='incorect spare phone'">Podany telefon zapasowy jest błędny.</iaixsl:when>
                                <iaixsl:when test="@type='incorect zipcode'">Niepoprawny kod pocztowy.</iaixsl:when>
                                <iaixsl:when test="@type='double_address_error'">Jeżeli adres dostawy ma być taki sam jak adres kupującego zaznacz odpowiednią opcję.</iaixsl:when>
                                <iaixsl:when test="@type='no delivery firstname'">Podane imię odbiorcy jest za krótkie.</iaixsl:when>
                                <iaixsl:when test="@type='no delivery lastname'">Podane nazwisko odbiorcy jest za krótkie.</iaixsl:when>
                                <iaixsl:when test="@type='no delivery city'">Podane miasto odbiorcy jest błędne.</iaixsl:when>
                                <iaixsl:when test="@type='no delivery street'">Podany adres odbiorcy jest błędny.</iaixsl:when>
                                <iaixsl:when test="@type='incorect delivery region'">Podany region odbiorcy jest błędny.</iaixsl:when>
                                <iaixsl:when test="@type='incorect delivery zipcode'">Niepoprawny kod pocztowy odbiorcy.</iaixsl:when>
                                <iaixsl:when test="@type='order_newpayment_hhtransfer_error'">Wystąpiły błędy płatności punktami.</iaixsl:when>
                                <iaixsl:when test="@type='order_newpayment_voucher_error'">Wystąpiły błędy płatności bonem.
                                    <iaixsl:if test="@value='v1'">W tym sklepie, ten bon jest nieważny.</iaixsl:if>
                                    <iaixsl:if test="@value='v2'">Numer bonu jest niepoprawny. Nie istnieje bon o takim identyfikatorze. Spróbuj wpisać identyfikator ponownie, upewniając się, że jest on poprawny.</iaixsl:if>
                                    <iaixsl:if test="@value='v3'">Ten bon jest zablokowany.</iaixsl:if>
                                    <iaixsl:if test="@value='v4'">Ten bon został już wykorzystany.</iaixsl:if>
                                    <iaixsl:if test="@value='v5'">Ten bon jest już nieważny - termin ważności minął.</iaixsl:if>
                                    <iaixsl:if test="@value='v7'">Bon o podanym identyfikatorze nie istnieje. Spróbuj wpisać identyfikator ponownie.</iaixsl:if>
                                    <iaixsl:if test="@value='v8'">Nie podano identyfikatora bonu.</iaixsl:if>
                                </iaixsl:when>
                                <iaixsl:when test="@type='order_newpayment_incorrect_paymentid'">Wystąpiły błędy - wybierz inną formę płatności.</iaixsl:when>
                                <iaixsl:when test="@type='order_newpayment_error'">Wystąpiły błędy płatności. Spróbuj ponownie opłacić zamówenie za chwilę.</iaixsl:when>
                                <iaixsl:when test="@type='order_newpayment_points_error'">Nie masz wystarczającej ilości punktów lojalnościowych aby opłacić to zamówienie- wybierz inną formę płatności.</iaixsl:when>

                                <iaixsl:when test="@type='filter_products_not_found'">Nie znaleziono produktów o zadanych kryteriach filtrowania. Zmień parametry filtrów.</iaixsl:when>
                                <iaixsl:when test="@type='questionnaire_error'">Wystąpił nieznany błąd. Ankieta nie została wysłana.</iaixsl:when>
                                <iaixsl:when test="@type='questionnaire_sent'">Ankieta została wysłana. Dziękujemy!</iaixsl:when>

                                <iaixsl:when test="@type='orderopen_not_found'">Podane przez Ciebie dane są nieprawidłowe. Postaraj się odszukać telefon lub e-mail który podałeś przy składaniu zamówienia lub sprawdź czy podawany identyfikator zamówienia jest poprawny. Jeżeli mimo kilku prób nie możesz otworzyć zamówienia poprzez tą stronę, prosimy o <a href="/contact.php">kontakt</a>.</iaixsl:when>

                                <iaixsl:when test="@type='order_nonstandard_inactive'">Przepraszamy, ale nie przewidzieliśmy kosztów dostawy dla Twojego zamówienia. Chcielibyśmy je jednak przyjąć. Dlatego prosimy Ciebie o kontakt z <a href="/contact.php">obsługą naszego sklepu</a> w celu ustalenia możliwości przyjęcia i realizacji zamówienia.</iaixsl:when>
                                <iaixsl:when test="@type='order_nonstandard_inactive_worth'">Przepraszamy, ale nie przewidzieliśmy możliwości składania zamówienia z taką wartością zamówienia. Chcielibyśmy je jednak przyjąć. Dlatego prosimy Ciebie o kontakt z <a href="/contact.php">obsługą naszego sklepu</a> w celu ustalenia możliwości przyjęcia i realizacji zamówienia.</iaixsl:when>
                                <iaixsl:when test="@type='order_nonstandard_inactive_weight'">Przepraszamy, ale nie przewidzieliśmy możliwości składania zamówienia z taką wagą zamówienia. Chcielibyśmy je jednak przyjąć. Dlatego prosimy Ciebie o kontakt z <a href="/contact.php">obsługą naszego sklepu</a> w celu ustalenia możliwości przyjęcia i realizacji zamówienia.</iaixsl:when>
                                

                                <iaixsl:when test="@type='no-auction-info'">
                                    Brak informacji o aukcji.
                                </iaixsl:when>
                                <iaixsl:when test="@type='no-auction-account'">
                                    Brak informacji o koncie.
                                </iaixsl:when>
                                <iaixsl:when test="@type='no-allegro-item'">
                                    Brak informacji o przedmiocie aukcji.
                                </iaixsl:when>
                                <iaixsl:when test="@type='no-buyer-info'">
                                    Brak informacji o kupującym.
                                </iaixsl:when>
                                <iaixsl:when test="@type='no-seller-info'">
                                    Brak informacji o sprzedającym.
                                </iaixsl:when>
                                <iaixsl:when test="@type='no-shipping'">
                                    Brak informacji o dostępnych przesyłkach.
                                </iaixsl:when>
                                <iaixsl:when test="@type='no-order'">
                                    Brak informacji o zamówieniu.
                                </iaixsl:when>
                                <iaixsl:when test="@type='less_del'">
                                    Usunięcie wszystkich sztuk nie jest możliwe. Zamówienie musi zawierać minimum tyle sztuk produktów ile zakupiłeś na aukcji. 
                                </iaixsl:when>
                                <iaixsl:when test="@type='cant_del'">
                                    Nie można usunąć produktów z zamówienia, gdyż ich ilość jest równa wylicytowanej.
                                </iaixsl:when>
                                <iaixsl:when test="@type='rebates_code_ok'">
                                    Podano poprawny kod rabatowy.
                                </iaixsl:when>
                                <iaixsl:when test="@type='rebates_code_undefined'">
                                    Podany kod rabatowy / numer karty rabatowej nie istnieje.
                                </iaixsl:when>

                                <iaixsl:when test="@type='rebates_code_used' and $rebates_code_used">
                                     <iaixsl:value-of select="$rebates_code_used"/>
                                </iaixsl:when>

                                <iaixsl:when test="@type='rebates_code_begins'">
                                    Promocja dla tego kodu rabatowego jeszcze się nie rozpoczeła.
                                </iaixsl:when>
                                <iaixsl:when test="@type='rebates_code_expires'">
                                    Promocja dla tego kodu rabatowego już się skończyła.
                                </iaixsl:when>
                                <iaixsl:when test="@type='membershipcard_undefined'">
                                    Podany numer karty jest nieprawidłowy. Spróbuj ponownie lub <a href="/contact.php">skontaktuj się z obsługą sklepu</a>.
                                </iaixsl:when>
                                <iaixsl:when test="@type='membershipcard_expires'">
                                    Termin ważności karty upłynął.
                                </iaixsl:when>
                                <iaixsl:when test="@type='membershipcard_blocked'">
                                    Ta karta została zablokowana. <a href="/contact.php">Skontaktuj się z obsługą sklepu</a>.
                                </iaixsl:when>
                                <iaixsl:when test="@type='membershipcard_ok'">
                                    Karta została aktywowana.
                                </iaixsl:when>
                                <iaixsl:when test="@type='client_wholesale_application_error'">
                                    Wystąpił błąd przy próbie rejestracji zgłoszenia.
                                </iaixsl:when>
                                <iaixsl:when test="@type='client_wholesale_registered'">
                                    Twoje konto zostało zarejestrowane jako hurtowe. Nie możesz złożyć kolejnego zgłoszenia.
                                </iaixsl:when>
                                <iaixsl:when test="@type='ordered_empty'">
                                    Twoja lista zakupionych produktów jest pusta.
                                </iaixsl:when>

                                <iaixsl:when test="@type='shipping_error'">
                                    Nie wysyłamy do twojego kraju.
                                </iaixsl:when>
                                <iaixsl:when test="@type='basket_empty'">
                                    Twój koszyk jest pusty.
                                </iaixsl:when>
                                <iaixsl:when test="@type='order_minimum'">
                                    Za mała wartość zamówienia.
                                    <iaixsl:if test="@value&gt;0">
                                        Minimalna wartość zamówienia to 
                                        <iaixsl:if test="$signbeforeprice = 'true'">
                                            <iaixsl:value-of select="/shop/currency/@name"/>
                                            <iaixsl:value-of select="$signbetweenpricecurrency"/>
                                        </iaixsl:if>
                                        <iaixsl:value-of select="@value"/>
                                        <iaixsl:if test="$signbeforeprice = 'false'">
                                            <iaixsl:value-of select="$signbetweenpricecurrency"/>
                                            <iaixsl:value-of select="/shop/currency/@name"/>
                                        </iaixsl:if>

                                        
                                    </iaixsl:if>
                                </iaixsl:when>
                                <iaixsl:when test="@type='order_tomuch'">
                                    Wartość zamówienia jest zbyt duża.
                                    <iaixsl:if test="@value&gt;0">
                                        Maksymalna wartość zamówienia to                <iaixsl:if test="$signbeforeprice = 'true'">
                                            <iaixsl:value-of select="/shop/currency/@name"/>
                                            <iaixsl:value-of select="$signbetweenpricecurrency"/>
                                        </iaixsl:if>
                                        <iaixsl:value-of select="@value"/>
                                        <iaixsl:if test="$signbeforeprice = 'false'">
                                            <iaixsl:value-of select="$signbetweenpricecurrency"/>
                                            <iaixsl:value-of select="/shop/currency/@name"/>
                                        </iaixsl:if>
                                    </iaixsl:if>
                                </iaixsl:when>
                                <iaixsl:when test="@type='requiredPhoneAndEmail'">
                                    Wybrana opcja dostawy wymaga podania numeru telefonu oraz adresu e-mail. Aby uzupełnić te informacje skorzystaj z 
                                    <a>
                                        <iaixsl:attribute name="href"><iaixsl:value-of select="@value"/></iaixsl:attribute>
                                        <iaixsl:attribute name="title">Kliknij, aby przejść do edycji danych i uzupełnić niezbędne informacje.</iaixsl:attribute>
                                        formularza edycji danych klienta
                                    </a>
                                    .
                                </iaixsl:when>
                                <iaixsl:when test="@type='noPickupSites'">
                                    Ten rodzaj dostawy nie jest aktualnie dostępny. Prosimy o 
                                    <a>
                                        <iaixsl:attribute name="href"><iaixsl:value-of select="@value"/></iaixsl:attribute>
                                        <iaixsl:attribute name="title">Kliknij, aby wrócić do wyboru formy dostawy.</iaixsl:attribute>
                                        wybranie innej formy dostawy lub sposobu płatności.
                                    </a>
                                    .
                                </iaixsl:when>
                                <iaixsl:when test="@type='noPickupStocks'">
                                    Odbiór osobisty zamówienia jest w tej chwili niemożliwy. Prosimy o 
                                    <a>
                                        <iaixsl:attribute name="href"><iaixsl:value-of select="@value"/></iaixsl:attribute>
                                        <iaixsl:attribute name="title">Kliknij, aby wrócić do wyboru formy dostawy.</iaixsl:attribute>
                                        wybranie innej formy dostawy lub sposobu płatności.
                                    </a>
                                    .
                                </iaixsl:when>

                                <iaixsl:when test="@type='rma_edit_error'">Wystąpił błąd podczas edycji reklamacji.</iaixsl:when>

                                <iaixsl:when test="@type='onlyHttps'">Dokonać płatności kartą kredytową można tylko przy użyciu szyfrowanego połączenia. Sprawdź czy adres sklepu poprzedzony jest protokołem HTTPS lub skontaktuj się z obsługą sklepu.</iaixsl:when>

                                <iaixsl:when test="@type='login_unavailable'">Nie można połączyć z podanym kontem z innego serwisu, ponieważ podane konto jest już połączone z innym kontem klienta w naszym sklepie. Możesz wylogować się z tego konta klienta i zalogować ponownie danymi z serwisu zewnętrznego<iaixsl:value-of select="@value"/>.</iaixsl:when>

                                <iaixsl:when test="@type='token_expired'">Link dostępu do Twoich danych stracił już ważność. Możesz zalogować się na inne konto lub wygenerować nowy link korzystając z opcji <a class="password_reminder_signin" href="#signin-form_radio2">Nie pamiętam loginu lub hasła.</a></iaixsl:when>

                                <iaixsl:otherwise>
                                    <iaixsl:value-of disable-output-escaping="yes" select="description"/>
                                </iaixsl:otherwise>

                        </iaixsl:choose></p>
                    </iaixsl:for-each>
            </div></div>
        </iaixsl:if>


        <iaixsl:if test="count(/shop/page/communicates/message) and not(/shop/page/communicates/message/@type = 'login_connect')">
            <div class="menu_messages_message" id="menu_messages_warning">


            <iaixsl:choose>
                <iaixsl:when test="/shop/page/communicates/communicate/@messageType = 'message'">
                    <iaixsl:attribute name="class">menu_messages_message</iaixsl:attribute>
                </iaixsl:when>
                <iaixsl:when test="/shop/page/communicates/communicate/@messageType = 'warning'">
                    <iaixsl:attribute name="class">menu_messages_warning</iaixsl:attribute>
                </iaixsl:when>
                <iaixsl:when test="/shop/page/communicates/communicate/@messageType = 'error'">
                    <iaixsl:attribute name="class">menu_messages_error</iaixsl:attribute>
                </iaixsl:when>
                <iaixsl:when test="/shop/page/communicates/communicate/@messageType = 'success'">
                    <iaixsl:attribute name="class">menu_messages_success</iaixsl:attribute>
                </iaixsl:when>
                <iaixsl:otherwise/>
            </iaixsl:choose>


                <div class="menu_messages_message_sub">
                    <iaixsl:for-each select="/shop/page/communicates/message">
                        <p><iaixsl:choose>
                                <iaixsl:when test="@type='change_success' and $change_success">
                                     <iaixsl:value-of select="$change_success"/>
                                </iaixsl:when>
                                <iaixsl:when test="@type='change_success_despite_no_change' and $change_success_despite_no_change">
                                     <iaixsl:value-of select="$change_success_despite_no_change"/>
                                </iaixsl:when>

                                <iaixsl:when test="@type='affiliate_not_active'">Nie jesteś zalogowany lub sklep nie posiada aktywnego programu partnerskiego.</iaixsl:when>
                                <iaixsl:when test="@type='deliv_addr_deleted'">Wskazany adres dostawy został usunięty.</iaixsl:when>
                                <iaixsl:when test="@type='affiliate_off'">Nie masz aktywowanego programu partnerskiego. Jeżeli chcesz aktywować taką możliwość musisz skontaktować się z obsługą sklepu.</iaixsl:when>
                                <iaixsl:when test="@type='affiliate_blocked'">Twój program partnerski został zablokowany.</iaixsl:when>
                                <iaixsl:when test="@type='deliv_addr_selected'">Wskazany adres dostawy został ustawiony jako domyślny.</iaixsl:when>
                                <iaixsl:when test="@type='rebates_code_ok'">Podano poprawny kod rabatowy.</iaixsl:when>
                                <iaixsl:when test="@type='client_wholesale_application_added'">Zgłoszenie zostało zarejestrowane.</iaixsl:when>
                                <iaixsl:when test="@type='login_connected'">Pomyślnie połączono konto w sklepie z kontem w serwisie <iaixsl:value-of select="@value"/>.</iaixsl:when>
                                <iaixsl:when test="@type='login_disconnected'">Konto zostało rozłączone z <iaixsl:value-of select="@value"/>.</iaixsl:when>
                                <iaixsl:when test="@type='login_unavailable'">Nie można połączyć z podanym kontem z innego serwisu, ponieważ podane konto jest już połączone z innym kontem klienta w naszym sklepie. Możesz wylogować się z tego konta klienta i zalogować ponownie danymi z serwisu zewnętrznego<iaixsl:value-of select="@value"/>.</iaixsl:when>
                                <iaixsl:when test="@type='openid_login_canceled'">Logowanie anulowane.</iaixsl:when>
                                <iaixsl:when test="@type='client_wholesale_application_changed'">Zgłoszenie zostało zmienione.</iaixsl:when>
                                <iaixsl:when test="@type='wisheslist_empty'">Twoja lista zakupowa jest pusta.</iaixsl:when>
                                <iaixsl:when test="@type='products_requests_empty'">Twoja lista poszukiwanych produktów jest pusta.</iaixsl:when>
                                <iaixsl:when test="@type='products_requests_added'">Zgłoszenie poszukiwanego produktu zostało zarejestrowane. Otrzymasz odpowiedź e-mailem czy jest możliwe poszerzenie oferty o ten produkt.</iaixsl:when>
                                <iaixsl:when test="@type='products_requests_removed'">Zgłoszenie poszukiwanego produktu zostało usunięte.</iaixsl:when>
                                <iaixsl:when test="@type='rma_add'">Zgłoszenie reklamacyjne zostało dodane.</iaixsl:when>
                                <iaixsl:when test="@type='return_add'">Zgłoszenie zwrotu zostało dodane.</iaixsl:when>
                                <iaixsl:when test="@type='return_edit'">Zmiany w zwrocie zostały zapisane</iaixsl:when>
                                <iaixsl:when test="@type='rma_edit'">Zmiany w reklamacji zostały zapisane.</iaixsl:when>
                                <iaixsl:when test="@type='order_nonstandard_reason'">Przepraszamy, ale nie zdefiniowaliśmy standardowego kosztu dostawy dla Twojego zamówienia. Możesz kontynuować składanie zamówienia, jednak nie zostanie w tej chwili podany wiążący nas koszt dostawy. Zostanie on ustalony indywidualnie przez naszą obsługę po przyjęciu zamówienia, po czym skontaktujemy się z Tobą w celu jego potwierdzenia. Jeżeli takie rozwiązanie nie odpowiada Ci, <a href="/contact.php">skontaktuj się z nami</a> w celu uzyskania bardziej szczegółowych informacji na temat kosztu dostawy lub możliwości złożenia zamówienia indywidualnie.</iaixsl:when>
                                <iaixsl:when test="@type='order_nonstandard_reason_worth'">Przepraszamy, ale nie zdefiniowaliśmy standardowego kosztu dostawy dla takiej wartości zamówienia. Możesz kontynuować składanie zamówienia, jednak nie zostanie w tej chwili podany wiążący nas koszt dostawy. Zostanie on ustalony indywidualnie przez naszą obsługę po przyjęciu zamówienia, po czym skontaktujemy się z Tobą w celu jego potwierdzenia. Jeżeli takie rozwiązanie nie odpowiada Ci, <a href="/contact.php">skontaktuj się z nami</a> w celu uzyskania bardziej szczegółowych informacji na temat kosztu dostawy lub możliwości złożenia zamówienia indywidualnie.</iaixsl:when>
                                <iaixsl:when test="@type='order_nonstandard_reason_weight'">Przepraszamy, ale nie zdefiniowaliśmy standardowego kosztu dostawy dla takiej wagi zamówienia. Możesz kontynuować składanie zamówienia, jednak nie zostanie w tej chwili podany wiążący nas koszt dostawy. Zostanie on ustalony indywidualnie przez naszą obsługę po przyjęciu zamówienia, po czym skontaktujemy się z Tobą w celu jego potwierdzenia. Jeżeli takie rozwiązanie nie odpowiada Ci, <a href="/contact.php">skontaktuj się z nami</a> w celu uzyskania bardziej szczegółowych informacji na temat kosztu dostawy lub możliwości złożenia zamówienia indywidualnie.</iaixsl:when>
                                <iaixsl:when test="@type='mailing_addsuccess'">Adres e-mail został dodany do listy mailingowej.</iaixsl:when>
                                <iaixsl:when test="@type='mailing_removesuccess'">Adres e-mail został usunięty z listy mailingowej.</iaixsl:when>
                                <iaixsl:when test="@type = 'mailing_nosuchemail'">Nie znaleźliśmy podanego przez Ciebie adresu e-mail w naszej bazie mailingowej.</iaixsl:when>
                                <iaixsl:when test="@type = 'mailing_sendingconfirm'">Na podany adres e-mail wysłany został list z potwierdzeniem zmian w naszej liście mailingowej. Odbierz pocztę i podążaj za wskazówkami zawartymi w wiadomości.</iaixsl:when>
                                <iaixsl:otherwise>
                                        <iaixsl:value-of disable-output-escaping="yes" select="description"/>
                                </iaixsl:otherwise>
                        </iaixsl:choose></p>
                    </iaixsl:for-each>
            </div></div>
        </iaixsl:if>


        <iaixsl:if test="/shop/order_edit/@order_number">
            <div class="menu_messages_message" id="menu_messages_warning">
                <div class="menu_messages_message_sub">
                    <p>
                        Edytujesz zamówienie numer <iaixsl:value-of select="/shop/order_edit/@order_number"/>. Dokonaj zmian w zamówieniu bądź 
                        <a>
                            <iaixsl:attribute name="href"><iaixsl:value-of select="/shop/order_edit/@cancel_lik"/></iaixsl:attribute>
                            wróć do szczegółów zamówienia</a>.
                    </p>
                </div>
            </div>
        </iaixsl:if>


         <iaixsl:if test="/shop/return_edit/@return_id">
            <div class="menu_messages_message" id="menu_messages_warning">
                <div class="menu_messages_message_sub">
                    <p>
                        Edytujesz zwrot numer <iaixsl:value-of select="/shop/return_edit/@return_id"/>. Dokonaj zmian w zwrocie bądź wróć do 
                        <a>
                            <iaixsl:attribute name="href"><iaixsl:value-of select="/shop/return_edit/@cancel_link"/></iaixsl:attribute>
                             szczegółów zwrotu</a>.
                    </p>
                </div>
            </div>
        </iaixsl:if>

        <!-- (search_categoriesdescription, 61b0b16a502885.53008740.3)-->
			<section class="search_name pb-5">
				<h1 class="search_name__label headline">
					<span class="headline__name">
						<iaixsl:choose>
							<iaixsl:when test="not(/shop/page/products/additional/category_list/name = '')">
								<iaixsl:value-of disable-output-escaping="yes" select="/shop/page/products/additional/category_list/name"/>
							</iaixsl:when>
							<iaixsl:otherwise>
								Wyniki wyszukiwania
							</iaixsl:otherwise>
						</iaixsl:choose>
					</span>
				</h1>
				<iaixsl:if test="not(/shop/page/products/@hideproducts = 'true')">
					<span class="search_name__total">( ilość produktów: <span class="search_name__total_value"><iaixsl:value-of select="/shop/page/products/navigation/@total"/></span> )</span>
				</iaixsl:if>
			</section>
			<hr/>
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
						<iaixsl:if test="count(/shop/page/products/navigation/filtering/filter)">
							<div class="filter float-left md:float-none">
								<button class="filter-dropdown-trigger px-2 py-1">
									<span class="mr-2"> Filtrowanie</span> <i class="fa fa-chevron-down"></i>
								</button>

							</div>
						</iaixsl:if>
                        <div class="sort ml-5">
                            <button class="sort-dropdown-trigger py-1">
                                <span class="mr-2"> Sortowanie</span> <i class="fa fa-chevron-down"></i>
                            </button>

                        </div>
                    </div>
                </div>
			<iaixsl:if test="not(/shop/page/products/additional/category_list/description = '') and (/shop/page/products/additional/category_list/description)">
				<iaixsl:if test="(/shop/page/products/@hideproducts = 'true' ) or ((/shop/page/products/navigation/item[1]/@counter = 1) and (/shop/page/products/navigation/item[1]/@type = 'current'))">
					<section class="search_description --top --skeleton cm">
						<div class="search_description__wrapper">
							<iaixsl:value-of disable-output-escaping="yes" select="/shop/page/products/additional/category_list/description"/>
						</div>
					</section>
				</iaixsl:if>
			</iaixsl:if>
		<!-- (search_paging, 61b0b16dc07a33.01252614.4)-->

        <iaixsl:variable name="select_sort_label"/>
        <iaixsl:variable name="select_portions_label"/>
        <iaixsl:variable name="prev_page">Poprzednia strona</iaixsl:variable>
        <iaixsl:variable name="next_page">Następna strona</iaixsl:variable>

        <iaixsl:if test="not(page/products/@hideproducts = 'true')">
            <div id="paging_setting_top" class="s_paging">
                <iaixsl:if test="not(/shop/page/products/navigation/@disable_sort_change = 'y')">
                    <form class="s_paging__item --sort" action="/settings.php">
                        <iaixsl:if test="$select_sort_label">
                            <label for="select_top_sort"><iaixsl:value-of disable-output-escaping="yes" select="$select_sort_label"/></label>
                        </iaixsl:if>
                        <select class="s_paging__select --order --small-md" id="select_top_sort" name="sort_order">
														<option value="relevance-d" class="option_relevance-d"><iaixsl:if test="page/products/navigation/@sort = 'relevance' and page/products/navigation/@order = 'd'"><iaixsl:attribute name="selected">selected</iaixsl:attribute></iaixsl:if>Najlepsza trafność</option>
                            <option value="name-a" class="option_name-a"><iaixsl:if test="page/products/navigation/@sort = 'name' and page/products/navigation/@order = 'a'"><iaixsl:attribute name="selected">selected</iaixsl:attribute></iaixsl:if>Sortuj po nazwie rosnąco</option>
                            <option value="name-d" class="option_name-d"><iaixsl:if test="page/products/navigation/@sort = 'name' and page/products/navigation/@order = 'd'"><iaixsl:attribute name="selected">selected</iaixsl:attribute></iaixsl:if>Sortuj po nazwie malejąco</option>
                            <option value="price-a" class="option_price-a"><iaixsl:if test="page/products/navigation/@sort = 'price' and page/products/navigation/@order = 'a'"><iaixsl:attribute name="selected">selected</iaixsl:attribute></iaixsl:if>Sortuj po cenie rosnąco</option>
                            <option value="price-d" class="option_price-d"><iaixsl:if test="page/products/navigation/@sort = 'price' and page/products/navigation/@order = 'd'"><iaixsl:attribute name="selected">selected</iaixsl:attribute></iaixsl:if>Sortuj po cenie malejąco</option>
                            <option value="date-a" class="option_date-a"><iaixsl:if test="page/products/navigation/@sort = 'date' and page/products/navigation/@order = 'a'"><iaixsl:attribute name="selected">selected</iaixsl:attribute></iaixsl:if>Sortuj po dacie rosnąco</option>
                            <option value="date-d" class="option_date-d"><iaixsl:if test="page/products/navigation/@sort = 'date' and page/products/navigation/@order = 'd'"><iaixsl:attribute name="selected">selected</iaixsl:attribute></iaixsl:if>Sortuj po dacie malejąco</option>
                        </select>
                    </form>
                </iaixsl:if>

                <iaixsl:if test="not(/shop/page/products/navigation/@disable_portions_change = 'y') and count(page/products/navigation/portions) &gt; 1">
                    <form class="s_paging__item --portions d-none d-md-block" action="/settings.php">
                        <iaixsl:if test="$select_portions_label">
                            <label for="select_top_portions"><iaixsl:value-of disable-output-escaping="yes" select="$select_portions_label"/></label>
                        </iaixsl:if>
                        <select class="s_paging__select --portions --small-md" id="select_top_portions" name="portions">
                            <iaixsl:for-each select="page/products/navigation/portions">
                                <option><iaixsl:attribute name="value"><iaixsl:value-of select="@counter"/></iaixsl:attribute><iaixsl:if test="@selected = 'true'"><iaixsl:attribute name="selected">selected</iaixsl:attribute></iaixsl:if>Pokaż <iaixsl:value-of select="@counter"/>
                                </option>
                            </iaixsl:for-each>
                        </select>
                    </form>
                </iaixsl:if>

                <iaixsl:if test="count(/shop/page/products/navigation/filtering/filter)">
                    <div class="s_paging__item --filters d-md-none mb-2 mb-sm-3">
                        <a class="btn --solid --large" href="#menu_filter">
                            Filtrowanie
                        </a>
                    </div>
                </iaixsl:if>

                
            </div>
        </iaixsl:if>
        <!-- (search_filters, 60dd8e79c0ea13.64200683.5)-->
            <iaixsl:if test="(count(/shop/page/products/navigation/filtering/filter/@selected) &gt; 0) or count(/shop/page/products/navigation/filtering/filter/item/@selected) &gt; 0">
                <iaixsl:variable name="show_remove_button">true</iaixsl:variable>
                <div id="filter_list">
                    <div class="filter_list_content">
                        <iaixsl:if test="$show_remove_button">
                            <a class="remove_all_list_filters btn --solid --secondary mr-2 mr-sm-3" href="/settings.php?filter_remove=all">
                                <iaixsl:if test="/shop/page/products/navigation/search_link/@value">
                                    <iaixsl:attribute name="href"><iaixsl:value-of select="/shop/page/products/navigation/search_link/@value "/></iaixsl:attribute>
                                </iaixsl:if>
                                <iaixsl:attribute name="title">Usuń wszystkie filtry</iaixsl:attribute>
                                Usuń filtry
                            </a>
                        </iaixsl:if>
                        <iaixsl:for-each select="/shop/page/products/navigation/filtering/filter[(@type='list') or (@type='text')]">
                            <iaixsl:if test="(@selected != '') or count(item/@selected) &gt; 0">
                                <iaixsl:choose>
                                    
                                    <iaixsl:when test="(@id = 'filter_price') and (@selected) and not(@selected = '')">
                                        <iaixsl:choose>
                                            <iaixsl:when test="item[@selected = 'selected']">
                                                <iaixsl:for-each select="item[@selected = 'selected']">
                                                    <a class="filter_list_remove btn --solid --icon-right icon-x mr-2 mr-sm-3">
                                                        <iaixsl:attribute name="href"><iaixsl:value-of select="@link_remove"/></iaixsl:attribute>
                                                        <span><iaixsl:value-of select="@name_formatted"/></span>
                                                    </a>
                                                </iaixsl:for-each>
                                            </iaixsl:when>
                                            <iaixsl:otherwise>
                                                <a class="filter_list_remove btn --solid --icon-right icon-x mr-2 mr-sm-3">
                                                    <iaixsl:attribute name="href"><iaixsl:value-of select="@link_remove"/></iaixsl:attribute>
                                                    <span>
                                                        <iaixsl:if test="substring-before(@selected, '-') != ''">
                                                            <iaixsl:value-of select="substring-before(@selected, '-')"/> <iaixsl:value-of select="/shop/currency/@name"/>
                                                        </iaixsl:if>
                                                         - 
                                                        <iaixsl:if test="substring-after(@selected, '-') != ''">
                                                            <iaixsl:value-of select="substring-after(@selected, '-')"/> <iaixsl:value-of select="/shop/currency/@name"/>
                                                        </iaixsl:if>
                                                    </span>
                                                </a>		
                                            </iaixsl:otherwise>
                                        </iaixsl:choose>
                                    </iaixsl:when>
                                    
                                    <iaixsl:when test="(@id = 'filter_date') and (@selected) and not(@selected = '')">
                                        <iaixsl:choose>
                                            <iaixsl:when test="item[@selected = 'selected']">
                                                <iaixsl:for-each select="item[@selected = 'selected']">
                                                    <a class="filter_list_remove btn --solid --icon-right icon-x mr-2 mr-sm-3">
                                                        <iaixsl:attribute name="href"><iaixsl:value-of select="@link_remove"/></iaixsl:attribute>
                                                        <span>
                                                            <iaixsl:choose>
                                                                <iaixsl:when test="@desc = '1week'">Ostatni tydzień</iaixsl:when>
                                                                <iaixsl:when test="@desc = '1month'">Ostatni miesiąc</iaixsl:when>
                                                                <iaixsl:when test="@desc = '3months'">Ostatnie 3 miesiące</iaixsl:when>
                                                                <iaixsl:when test="@desc = '6months'">Ostatnie pół roku</iaixsl:when>
                                                                <iaixsl:when test="@desc = '1year'">Ostatni rok</iaixsl:when>
                                                            </iaixsl:choose>
                                                        </span>
                                                    </a>
                                                </iaixsl:for-each>
                                            </iaixsl:when>
                                            <iaixsl:otherwise>
                                                <a class="filter_list_remove btn --solid --icon-right icon-x mr-2 mr-sm-3">
                                                    <iaixsl:attribute name="href"><iaixsl:value-of select="@link_remove"/></iaixsl:attribute>
                                                    <span><iaixsl:value-of select="@selected"/></span>
                                                </a>
                                            </iaixsl:otherwise>
                                        </iaixsl:choose>
                                    </iaixsl:when>
                                    <iaixsl:when test="(@id = 'filter_text') and (@selected) and not(@selected = '')">
                                        <a class="filter_list_remove btn --solid --icon-right icon-x mr-2 mr-sm-3">
                                            <iaixsl:attribute name="href"><iaixsl:value-of select="@link_remove"/></iaixsl:attribute>
                                            <span><iaixsl:value-of select="@selected"/></span>
                                        </a>
                                    </iaixsl:when>
                                    <iaixsl:otherwise>
                                        <iaixsl:for-each select="item[@selected = 'selected']">
                                            <a class="filter_list_remove btn --solid --icon-right icon-x mr-2 mr-sm-3">
                                                <iaixsl:attribute name="href"><iaixsl:value-of select="@link_remove"/></iaixsl:attribute>
                                                <span><iaixsl:value-of select="@name"/></span>
                                            </a>
                                        </iaixsl:for-each>
                                    </iaixsl:otherwise>
                                </iaixsl:choose>
                            </iaixsl:if>
                        </iaixsl:for-each>
                        <iaixsl:for-each select="/shop/page/products/navigation/filtering/filter[@type='dual']/item[@selected = 'selected']">
                            <a class="filter_list_remove btn --solid --icon-right icon-x mr-2 mr-sm-3">
                                <iaixsl:attribute name="href"><iaixsl:value-of select="../@link_remove"/></iaixsl:attribute>
                                <span><iaixsl:value-of select="../@name"/></span>
                            </a>
                        </iaixsl:for-each>
                        <iaixsl:for-each select="/shop/page/products/navigation/filtering/filter[@selected != '' or count(item/@selected) &gt; 0]/group/item[@selected = 'selected']">
                            <a class="filter_list_remove btn --solid --icon-right icon-x mr-2 mr-sm-3">
                                <iaixsl:attribute name="href"><iaixsl:value-of select="@link_remove"/></iaixsl:attribute>
                                <span><iaixsl:value-of select="@name"/></span>
                            </a>
                        </iaixsl:for-each>
                    </div>
                </div>
            </iaixsl:if>
        <!-- (search_settings, 60dd8e7eed6f96.87778143.7)-->
        <iaixsl:if test="compare/@count &gt; 0 or /shop/page/@cache_html = 'true'">
            <div id="menu_compare_product" class="compare pt-2 mb-2 pt-sm-3 mb-sm-3">
                <iaixsl:if test="/shop/page/@cache_html = 'true'">
                    <iaixsl:attribute name="style">display: none;</iaixsl:attribute>
                </iaixsl:if>

                <div class="compare__label d-none d-sm-block">Dodane do porównania</div>

                <div class="compare__sub">
                    <iaixsl:for-each select="compare/product">
                        <a class="compare__item --solid --icon-right icon-x">
                            <iaixsl:attribute name="href"><iaixsl:value-of select="@removelink"/></iaixsl:attribute>
                            <iaixsl:attribute name="data-remove_link"><iaixsl:value-of select="@removelink"/></iaixsl:attribute>
                            <iaixsl:attribute name="data-link"><iaixsl:value-of select="@link"/></iaixsl:attribute>
                            <iaixsl:choose>
                              <iaixsl:when test="iconsmall_second and not(iconsmall_second = '' or iconsmall_second = '/')">
                                <picture>
                                  <source type="image/webp">
                                    <iaixsl:attribute name="srcset"><iaixsl:value-of select="iconsmall"/></iaixsl:attribute>
                                  </source>
                                  <img>
                                    <iaixsl:attribute name="src"><iaixsl:value-of select="iconsmall_second"/></iaixsl:attribute>
                                    <iaixsl:attribute name="alt"><iaixsl:value-of select="@name"/></iaixsl:attribute>
                                  </img>
                                </picture>
                              </iaixsl:when>
                              <iaixsl:otherwise>
                                <img>
                                  <iaixsl:attribute name="src"><iaixsl:value-of select="iconsmall"/></iaixsl:attribute>
                                  <iaixsl:attribute name="alt"><iaixsl:value-of disable-output-escaping="yes" select="name"/></iaixsl:attribute>
                                </img>
                              </iaixsl:otherwise>
                            </iaixsl:choose>
                        </a>
                    </iaixsl:for-each>
                </div>

                <div class="compare__buttons">
                    <iaixsl:if test="compare/@count = 1">
                        <iaixsl:attribute name="class">compare__buttons --one</iaixsl:attribute>
                    </iaixsl:if>
                    <iaixsl:if test="compare/@count &gt; 1 or /shop/page/@cache_html = 'true'">
                        <a class="compare__button btn --solid --secondary" href="product-compare.php">
                            <iaixsl:if test="/shop/action/productCompare/@url">
                                <iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/productCompare/@url"/></iaixsl:attribute>
                            </iaixsl:if>
                            <iaixsl:attribute name="title">Porównaj wszystkie produkty</iaixsl:attribute>
                            <iaixsl:attribute name="target">_blank</iaixsl:attribute>
                            <span>Porównaj produkty </span><span class="d-sm-none">(<iaixsl:value-of select="compare/@count"/>)</span>
                        </a>
                    </iaixsl:if>

                    <a class="compare__button --remove btn d-none d-sm-block">
                        <iaixsl:attribute name="href"><iaixsl:choose><iaixsl:when test="/shop/action/settings/@url"><iaixsl:value-of select="/shop/action/settings/@url"/></iaixsl:when><iaixsl:otherwise>settings.php</iaixsl:otherwise></iaixsl:choose>?comparers=remove&amp;product=<iaixsl:choose><iaixsl:when test="/shop/page/@cache_html = 'true'">###</iaixsl:when><iaixsl:otherwise><iaixsl:for-each select="compare/product"><iaixsl:value-of select="@id"/><iaixsl:if test="not(count(../product) = position())">,</iaixsl:if></iaixsl:for-each></iaixsl:otherwise></iaixsl:choose></iaixsl:attribute>

                        <iaixsl:attribute name="title">Usuń wszystkie produkty</iaixsl:attribute>
                        Usuń produkty
                    </a>
                </div>

                <iaixsl:if test="/shop/page/@cache_html = 'true'">
                    <script>
                        var cache_html = true;
                    </script>
                </iaixsl:if>
            </div>
        </iaixsl:if>
    <!-- (search, 614c5d2fce57f6.27912971.8)-->
	
	<iaixsl:variable name="param_search">true</iaixsl:variable>
	<iaixsl:variable name="param_search_gfx">true</iaixsl:variable>
	<iaixsl:variable name="versions_search"/>
	<iaixsl:variable name="var_yousave_search"/>
	<iaixsl:variable name="var_net_prices_search"><iaixsl:if test="/shop/page/@price_type = 'net'"><iaixsl:value-of select="$priceTypeText"/></iaixsl:if></iaixsl:variable>
	<iaixsl:variable name="var_gross_prices_search"><iaixsl:if test="/shop/page/@price_type = 'gross'"><iaixsl:value-of select="$priceTypeText"/></iaixsl:if></iaixsl:variable>
	<iaixsl:variable name="var_b2b_search"/>
	
	<iaixsl:variable name="addcompare_txt"><i class="fa fa-plus"></i> porównaj</iaixsl:variable>

	<iaixsl:if test="/shop/page/products/display_mode/@active = 'normal'">
		<section id="search" class="search-product search products d-flex flex-wrap mb-2 mb-sm-3">

    	
			
    	<iaixsl:variable name="var_omnibus_enabled"><iaixsl:if test="/shop/@omnibus = 1">true</iaixsl:if></iaixsl:variable>
    	

			<iaixsl:for-each select="/shop/page/products/product">
				<div class="product position-relative col-12 col-sm-6 col-lg-4 pt-4  my-md-5 ">
					<iaixsl:attribute name="data-product_id"><iaixsl:value-of select="@id"/></iaixsl:attribute>
					<iaixsl:attribute name="data-product_page"><iaixsl:value-of select="/shop/page/products/navigation/item[@type = 'current']/@counter - 1"/></iaixsl:attribute>
					<iaixsl:if test="position() = 1">
						<iaixsl:attribute name="data-product_first">true</iaixsl:attribute>
					</iaixsl:if>
					<iaixsl:if test="sizes/availability/@status = 'disable'">
						<iaixsl:attribute name="data-product_disable">true</iaixsl:attribute>
					</iaixsl:if>
					
					<iaixsl:if test="/shop/page/@ecommerce_module_class">
						<iaixsl:attribute name="class">
							product col-6 col-sm-4 py-3

							<iaixsl:variable name="ecommerce_module_separator">{productId}</iaixsl:variable>

							<iaixsl:variable name="ecommerce_module_class_before"><iaixsl:value-of select="substring-before(/shop/page/@ecommerce_module_class, $ecommerce_module_separator)"/></iaixsl:variable>
							<iaixsl:variable name="ecommerce_module_class_after"><iaixsl:value-of select="substring-after(/shop/page/@ecommerce_module_class, $ecommerce_module_separator)"/></iaixsl:variable>

							<iaixsl:value-of select="$ecommerce_module_class_before"/><iaixsl:value-of select="@id"/><iaixsl:value-of select="$ecommerce_module_class_after"/>
						</iaixsl:attribute>
					</iaixsl:if>

					
					<iaixsl:if test="$var_yousave_search and not($var_yousave_search = '') and price/@yousave_formatted != ''">
						<div class="product__yousave">
							<span class="product__yousave --label"><iaixsl:value-of select="$var_yousave_search"/></span>
							<span class="product__yousave --value"><iaixsl:value-of select="price/@yousave_formatted"/></span>
						</div>
					</iaixsl:if>

					<div class="graph-background p-2 d-none">
							<div class="graph-title d-none">Najedź myszką by poznać włąściwości smaku</div>
						<div>
							<canvas class="radar-chart" width="100%" height="100%" style=""></canvas>
						</div>
						</div>
					<a class="product__icon d-flex justify-content-center align-items-center">
						<iaixsl:attribute name="data-product-id"><iaixsl:value-of select="@id"/></iaixsl:attribute>
						<iaixsl:attribute name="href"><iaixsl:value-of select="@link"/></iaixsl:attribute>
						<iaixsl:attribute name="title"><iaixsl:value-of disable-output-escaping="yes" select="name"/></iaixsl:attribute>
						<iaixsl:choose>
							<iaixsl:when test="icon_small_second and not(icon_small_second = '' or icon_small_second = '/')">
								<picture>
								<source media="(min-width: 421px)" type="image/webp">
									<iaixsl:attribute name="srcset"><iaixsl:value-of select="icon"/></iaixsl:attribute>
								</source>
								<source media="(min-width: 421px)" type="image/jpeg">
									<iaixsl:attribute name="srcset"><iaixsl:value-of select="icon_src_second"/></iaixsl:attribute>
								</source>
								<source type="image/webp">
									<iaixsl:attribute name="srcset"><iaixsl:value-of select="icon_small_second"/></iaixsl:attribute>
								</source>
								<img src="/gfx/standards/loader.gif?r=1696937716">
									<iaixsl:attribute name="alt"><iaixsl:value-of disable-output-escaping="yes" select="name"/></iaixsl:attribute>
									<iaixsl:choose>
									<iaixsl:when test="position() &gt; 2">
										<iaixsl:attribute name="class">b-lazy</iaixsl:attribute>
										<iaixsl:attribute name="data-src"><iaixsl:value-of disable-output-escaping="yes" select="icon_small_second"/></iaixsl:attribute>
									</iaixsl:when>
									<iaixsl:otherwise>
										<iaixsl:attribute name="src"><iaixsl:value-of disable-output-escaping="yes" select="icon_small_second"/></iaixsl:attribute>
									</iaixsl:otherwise>
									</iaixsl:choose>
								</img>
								</picture>                    
							</iaixsl:when>
							<iaixsl:otherwise>
										<picture>
											<source>
												<iaixsl:attribute name="media">(max-width: 420px)</iaixsl:attribute>
												<iaixsl:choose>
													<iaixsl:when test="position() &gt; 2">
														<iaixsl:attribute name="data-srcset"><iaixsl:value-of disable-output-escaping="yes" select="icon_small"/></iaixsl:attribute>
													</iaixsl:when>
													<iaixsl:otherwise>
														<iaixsl:attribute name="srcset"><iaixsl:value-of disable-output-escaping="yes" select="icon_small"/></iaixsl:attribute>
													</iaixsl:otherwise>
												</iaixsl:choose>
											</source>
											<img src="/gfx/standards/loader.gif?r=1696937716">
												<iaixsl:attribute name="alt"><iaixsl:value-of disable-output-escaping="yes" select="name"/></iaixsl:attribute>
												<iaixsl:choose>
													<iaixsl:when test="position() &gt; 2">
														<iaixsl:attribute name="class">b-lazy</iaixsl:attribute>
														<iaixsl:attribute name="data-src"><iaixsl:value-of disable-output-escaping="yes" select="icon"/></iaixsl:attribute>
													</iaixsl:when>
													<iaixsl:otherwise>
														<iaixsl:attribute name="src"><iaixsl:value-of disable-output-escaping="yes" select="icon"/></iaixsl:attribute>
													</iaixsl:otherwise>
												</iaixsl:choose>
											</img>
										</picture>
							</iaixsl:otherwise>
						</iaixsl:choose>

						
						<iaixsl:variable name="productUnavailable">Chwilowo niedostępny</iaixsl:variable>
						<iaixsl:choose>
							<iaixsl:when test="not($productUnavailable = '') and sizes/availability/@status = 'disable'">
								<strong class="label_icons">
									<span class="label --disable">
										<iaixsl:value-of select="$productUnavailable"/>
									</span>
								</strong>
							</iaixsl:when>
							<iaixsl:when test="@promo or @new or @bestseller or @discount or (@distinguished and not(@bestseller and @discount))">
								<strong class="label_icons">
									<iaixsl:if test="@promo">
										<span class="label --promo">
											W promocji
										</span>
									</iaixsl:if>
									<iaixsl:if test="@new">
										<span class="label --new">
											Nowość
										</span>
									</iaixsl:if>
									<iaixsl:choose>
										<iaixsl:when test="@promo and @new">
										</iaixsl:when>
										<iaixsl:when test="@promo or @new">
											<iaixsl:choose>
												<iaixsl:when test="@bestseller">
													<span class="label --bestseller">
														Nasz bestseller
													</span>
												</iaixsl:when>
												<iaixsl:when test="@discount">
													<span class="label --discount">
														Przecena
													</span>
												</iaixsl:when>
												<iaixsl:when test="@distinguished">
													<span class="label --distinguished">
														Polecany
													</span>
												</iaixsl:when>
											</iaixsl:choose>
										</iaixsl:when>
										<iaixsl:otherwise>
											<iaixsl:if test="@bestseller">
												<span class="label --bestseller">
													Nasz bestseller
												</span>
											</iaixsl:if>
											<iaixsl:if test="@discount">
												<span class="label --discount">
													Przecena
												</span>
											</iaixsl:if>
											<iaixsl:if test="@distinguished and not(@bestseller and @discount)">
												<span class="label --distinguished">
													Polecany
												</span>
											</iaixsl:if>
										</iaixsl:otherwise>
									</iaixsl:choose>
								</strong>
							</iaixsl:when>
						</iaixsl:choose>
					</a>

					
					<h3>
						<a class="product__name">
							<iaixsl:attribute name="href"><iaixsl:value-of select="@link"/></iaixsl:attribute>
							<iaixsl:attribute name="title"><iaixsl:value-of disable-output-escaping="yes" select="name"/></iaixsl:attribute>
							<iaixsl:value-of disable-output-escaping="yes" select="name"/>
						</a>
					</h3>

					
					<iaixsl:choose>
						
						<iaixsl:when test="$var_net_prices_search and not($var_net_prices_search = '')">
							
							
							<iaixsl:variable name="var_omnibus_min"><iaixsl:for-each select="sizes/size[price/@omnibus_price_net]">
								<iaixsl:sort select="price/@omnibus_price_net" data-type="number"/>
								<iaixsl:if test="position() = 1"><iaixsl:value-of select="price/@omnibus_price_net_formatted"/></iaixsl:if>
							</iaixsl:for-each></iaixsl:variable>

							
							<iaixsl:variable name="var_omnibus_max"><iaixsl:for-each select="sizes/size[price/@omnibus_price_net]">
								<iaixsl:sort select="price/@omnibus_price_net" data-type="number" order="descending"/>
								<iaixsl:if test="position() = 1"><iaixsl:value-of select="price/@omnibus_price_net_formatted"/></iaixsl:if>
							</iaixsl:for-each></iaixsl:variable>

							
							<iaixsl:variable name="var_omnibus"><iaixsl:if test="$var_omnibus_enabled = 'true'"><iaixsl:choose>
								<iaixsl:when test="$var_omnibus_min != $var_omnibus_max">
									<span><iaixsl:value-of select="$var_omnibus_min"/></span><b><iaixsl:text> - </iaixsl:text></b><span><iaixsl:value-of select="$var_omnibus_max"/></span>
								</iaixsl:when>
								<iaixsl:when test="$var_omnibus_min != ''">
									<iaixsl:value-of select="$var_omnibus_min"/>
								</iaixsl:when>
								<iaixsl:when test="@product_type = 'virtual' and (count(sizes/size[price/@omnibus_price_net]) = 0) and price/@omnibus_price_net_formatted">
									<iaixsl:value-of select="price/@omnibus_price_net_formatted"/>
								</iaixsl:when>
							</iaixsl:choose></iaixsl:if></iaixsl:variable>

							
							<iaixsl:variable name="var_omnibus_short"><iaixsl:if test="$var_omnibus_enabled = 'true'"><iaixsl:choose>
								<iaixsl:when test="sizes/prices/@size_min_maxprice_net_formatted != sizes/prices/@size_max_maxprice_net_formatted and sizes/prices/@size_min_maxprice_net_formatted = $var_omnibus_min and sizes/prices/@size_max_maxprice_net_formatted = $var_omnibus_max">true</iaixsl:when>
								<iaixsl:when test="price/@maxprice_net_formatted = $var_omnibus">true</iaixsl:when>
							</iaixsl:choose></iaixsl:if></iaixsl:variable>

							
							
							
							<iaixsl:variable name="last_price_change_date"><iaixsl:choose>
								<iaixsl:when test="sizes/size/price and (count(sizes/size) &gt; 1)"><iaixsl:for-each select="sizes/size[price/@last_price_change_date]"><iaixsl:if test="@type and price/@last_price_change_date"><iaixsl:value-of select="price/@last_price_change_date"/>;&apos;<iaixsl:value-of select="@type"/>&apos;<iaixsl:if test="not(position() = last())">#separator#</iaixsl:if></iaixsl:if></iaixsl:for-each></iaixsl:when>
								<iaixsl:when test="price/@last_price_change_date"><iaixsl:value-of select="price/@last_price_change_date"/></iaixsl:when>
							</iaixsl:choose></iaixsl:variable>

							
							<iaixsl:variable name="var_show_omnibus_short_fallback"><iaixsl:choose>
								<iaixsl:when test="($var_omnibus = '' and $var_omnibus_enabled = 'true' and not($last_price_change_date = ''))">true</iaixsl:when>
							</iaixsl:choose></iaixsl:variable>
							
							

							<div class="product__prices">
								<iaixsl:if test="$var_omnibus != ''"><iaixsl:attribute name="class">product__prices --omnibus<iaixsl:if test="$var_omnibus_short = 'true'"> --omnibus-short</iaixsl:if></iaixsl:attribute></iaixsl:if>

								
								
								<iaixsl:if test="$var_show_omnibus_short_fallback = 'true'">

									
									<iaixsl:attribute name="data-last_price_change_date"><iaixsl:value-of select="$last_price_change_date"/></iaixsl:attribute>

									
									
									<iaixsl:attribute name="data-omnibus-type">search</iaixsl:attribute>

									
									<iaixsl:if test="@id">
										<iaixsl:attribute name="data-omnibus_product_id"><iaixsl:value-of select="@id"/></iaixsl:attribute>
									</iaixsl:if>

									
									<iaixsl:if test="price/@maxprice_net">
										<iaixsl:attribute name="data-maxprice"><iaixsl:value-of select="price/@maxprice_net"/></iaixsl:attribute>
									</iaixsl:if>

									
									<iaixsl:if test="sizes/prices/@size_min_maxprice_net">
										<iaixsl:attribute name="data-sizes_min_maxprice"><iaixsl:value-of select="sizes/prices/@size_min_maxprice_net"/></iaixsl:attribute>
									</iaixsl:if>

									
									<iaixsl:if test="sizes/prices/@size_max_maxprice_net">
										<iaixsl:attribute name="data-sizes_max_maxprice"><iaixsl:value-of select="sizes/prices/@size_max_maxprice_net"/></iaixsl:attribute>
									</iaixsl:if>
								</iaixsl:if>
								

								<iaixsl:choose>
									<iaixsl:when test="(sizes/prices/@minprice_net_formatted != sizes/prices/@maxprice_net_formatted) or (sizes/prices/@minprice_unit_formatted != sizes/prices/@maxprice_unit_formatted)">
										<iaixsl:if test="(sizes/prices/@size_min_maxprice_net_formatted != sizes/prices/@size_max_maxprice_net_formatted) or (sizes/prices/@size_min_maxprice_unit_formatted != sizes/prices/@size_max_maxprice_unit_formatted)">
											<span class="price --max">
												
												<iaixsl:if test="($var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
													<span class="omnibus_label --hidden"><iaixsl:if test="$var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Cena regularna: </span>
												</iaixsl:if>
												
												<del>
													<iaixsl:choose>
														<iaixsl:when test="sizes/prices/@size_min_maxprice_unit_formatted">
															<span><iaixsl:value-of select="sizes/prices/@size_min_maxprice_unit_formatted"/></span><b> - </b><span><iaixsl:value-of select="sizes/prices/@size_max_maxprice_unit_formatted"/></span><span class="price_vat"><iaixsl:value-of select="$var_net_prices_search"/></span>
														</iaixsl:when>
														<iaixsl:otherwise>
															<span><iaixsl:value-of select="sizes/prices/@size_min_maxprice_net_formatted"/></span><b> - </b><span><iaixsl:value-of select="sizes/prices/@size_max_maxprice_net_formatted"/></span><span class="price_vat"><iaixsl:value-of select="$var_net_prices_search"/></span>
														</iaixsl:otherwise>
													</iaixsl:choose>
												</del>
												
												<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short = 'true') or ($var_show_omnibus_short_fallback = 'true')">
													<span class="omnibus_short --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short = 'true'"><iaixsl:attribute name="class">omnibus_short</iaixsl:attribute></iaixsl:if>Najniższa cena z 30 dni przed obniżką</span>
												</iaixsl:if>
												
											</span>
										</iaixsl:if>
										<strong class="price">
											<iaixsl:choose>
												<iaixsl:when test="sizes/prices/@minprice_unit_formatted">
													<iaixsl:value-of select="sizes/prices/@minprice_unit_formatted"/>
												</iaixsl:when>
												<iaixsl:otherwise>
													<iaixsl:value-of select="sizes/prices/@minprice_net_formatted"/>
												</iaixsl:otherwise>
											</iaixsl:choose>
												-
											<iaixsl:choose>
												<iaixsl:when test="sizes/prices/@maxprice_unit_formatted">
													<iaixsl:value-of select="sizes/prices/@maxprice_unit_formatted"/>
												</iaixsl:when>
												<iaixsl:otherwise>
													<iaixsl:value-of select="sizes/prices/@maxprice_net_formatted"/>
												</iaixsl:otherwise>
											</iaixsl:choose>

											<iaixsl:if test="sizes/prices/@minprice_unit_formatted">
												<iaixsl:text> / </iaixsl:text><iaixsl:value-of select="sizes/@unit_sellby"/><iaixsl:text> </iaixsl:text><iaixsl:value-of select="sizes/@unit"/>
											</iaixsl:if>
											<span class="price_vat"><iaixsl:value-of select="$var_net_prices_search"/></span>
										</strong>
										
										<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
											<span class="omnibus_price --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_price</iaixsl:attribute></iaixsl:if><span class="omnibus_price__text">Najniższa cena z 30 dni przed obniżką: </span><span class="omnibus_price__value"><iaixsl:value-of select="$var_omnibus"/></span></span>
										</iaixsl:if>
										
									</iaixsl:when>
									<iaixsl:when test="price/@price_net = 0 and not(/shop/basket/@wholesaler = 'true') and $var_b2b_search and not($var_b2b_search = '')">
										<a class="price --hurt">
											<iaixsl:attribute name="title"><iaixsl:value-of select="$var_b2b_search"/></iaixsl:attribute>
											<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/signin/@url"/></iaixsl:attribute>
											<iaixsl:value-of select="$var_b2b_search"/>
										</a>
									</iaixsl:when>
									<iaixsl:when test="(sizes/prices/@minprice_net = 0) and not(price/@points)">
										<a class="price --phone">
											<iaixsl:attribute name="title">Kliknij, by przejść do formularza kontaktu</iaixsl:attribute>
											<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/contact/@url"/></iaixsl:attribute>
											Cena na telefon
										</a>
									</iaixsl:when>
									<iaixsl:otherwise>
										<iaixsl:if test="price/@maxprice_net or price/@maxprice_unit">
											<span class="price --max">
												
												<iaixsl:if test="($var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
													<span class="omnibus_label --hidden"><iaixsl:if test="$var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Cena regularna: </span>
												</iaixsl:if>
												
												<del>
													<iaixsl:choose>
														<iaixsl:when test="price/@maxprice_unit_formatted">
															<iaixsl:value-of select="price/@maxprice_unit_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_net_prices_search"/></span>
														</iaixsl:when>
														<iaixsl:otherwise>
															<iaixsl:value-of select="price/@maxprice_net_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_net_prices_search"/></span>
														</iaixsl:otherwise>
													</iaixsl:choose>
												</del>
												
												<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short = 'true') or ($var_show_omnibus_short_fallback = 'true')">
													<span class="omnibus_short --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short = 'true'"><iaixsl:attribute name="class">omnibus_short</iaixsl:attribute></iaixsl:if>Najniższa cena z 30 dni przed obniżką</span>
												</iaixsl:if>
												
											</span>
										</iaixsl:if>
										<strong class="price">
											<iaixsl:choose>
												<iaixsl:when test="price/@price_unit_net_formatted">
													<iaixsl:value-of select="price/@price_unit_net_formatted"/><iaixsl:text> / </iaixsl:text><iaixsl:value-of select="sizes/@unit_sellby"/><iaixsl:text> </iaixsl:text><iaixsl:value-of select="sizes/@unit"/>
												</iaixsl:when>
												<iaixsl:otherwise>
													<iaixsl:value-of select="price/@price_net_formatted"/>
												</iaixsl:otherwise>
											</iaixsl:choose>
											<span class="price_vat"><iaixsl:value-of select="$var_net_prices_search"/></span>
										</strong>
										<iaixsl:if test="price/@points">
											<span class="price --points"><iaixsl:value-of select="price/@points"/><span class="currency"> PKT</span></span>
										</iaixsl:if>
										
										<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
											<span class="omnibus_price --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_price</iaixsl:attribute></iaixsl:if><span class="omnibus_price__text">Najniższa cena z 30 dni przed obniżką: </span><span class="omnibus_price__value"><iaixsl:value-of select="$var_omnibus"/></span></span>
										</iaixsl:if>
										
									</iaixsl:otherwise>
								</iaixsl:choose>

								
								<iaixsl:if test="price/@unit_converted_price_net_formatted"><small class="price --convert"><iaixsl:value-of select="price/@unit_converted_price_net_formatted"/><iaixsl:text> / </iaixsl:text><iaixsl:value-of select="price/@unit_converted_format"/><span class="price_vat"><iaixsl:value-of select="$var_net_prices_search"/></span></small>
								</iaixsl:if>
							</div>
						</iaixsl:when>
						
						<iaixsl:otherwise>
							
							
							<iaixsl:variable name="var_omnibus_min"><iaixsl:for-each select="sizes/size[price/@omnibus_price]">
								<iaixsl:sort select="price/@omnibus_price" data-type="number"/>
								<iaixsl:if test="position() = 1"><iaixsl:value-of select="price/@omnibus_price_formatted"/></iaixsl:if>
							</iaixsl:for-each></iaixsl:variable>

							
							<iaixsl:variable name="var_omnibus_max"><iaixsl:for-each select="sizes/size[price/@omnibus_price]">
								<iaixsl:sort select="price/@omnibus_price" data-type="number" order="descending"/>
								<iaixsl:if test="position() = 1"><iaixsl:value-of select="price/@omnibus_price_formatted"/></iaixsl:if>
							</iaixsl:for-each></iaixsl:variable>

							
							<iaixsl:variable name="var_omnibus"><iaixsl:if test="$var_omnibus_enabled = 'true'"><iaixsl:choose>
								<iaixsl:when test="$var_omnibus_min != $var_omnibus_max">
									<span><iaixsl:value-of select="$var_omnibus_min"/></span><b><iaixsl:text> - </iaixsl:text></b><span><iaixsl:value-of select="$var_omnibus_max"/></span>
								</iaixsl:when>
								<iaixsl:when test="$var_omnibus_min != ''">
									<iaixsl:value-of select="$var_omnibus_min"/>
								</iaixsl:when>
								<iaixsl:when test="@product_type = 'virtual' and (count(sizes/size[price/@omnibus_price]) = 0) and price/@omnibus_price_formatted">
									<iaixsl:value-of select="price/@omnibus_price_formatted"/>
								</iaixsl:when>
							</iaixsl:choose></iaixsl:if></iaixsl:variable>

							
							<iaixsl:variable name="var_omnibus_short"><iaixsl:if test="$var_omnibus_enabled = 'true'"><iaixsl:choose>
								<iaixsl:when test="sizes/prices/@size_min_maxprice_formatted != sizes/prices/@size_max_maxprice_formatted and sizes/prices/@size_min_maxprice_formatted = $var_omnibus_min and sizes/prices/@size_max_maxprice_formatted = $var_omnibus_max">true</iaixsl:when>
								<iaixsl:when test="price/@maxprice_formatted = $var_omnibus">true</iaixsl:when>
							</iaixsl:choose></iaixsl:if></iaixsl:variable>

							
							
							
							<iaixsl:variable name="last_price_change_date"><iaixsl:choose>
								<iaixsl:when test="sizes/size/price and (count(sizes/size) &gt; 1)"><iaixsl:for-each select="sizes/size[price/@last_price_change_date]"><iaixsl:if test="@type and price/@last_price_change_date"><iaixsl:value-of select="price/@last_price_change_date"/>;&apos;<iaixsl:value-of select="@type"/>&apos;<iaixsl:if test="not(position() = last())">#separator#</iaixsl:if></iaixsl:if></iaixsl:for-each></iaixsl:when>
								<iaixsl:when test="price/@last_price_change_date"><iaixsl:value-of select="price/@last_price_change_date"/></iaixsl:when>
							</iaixsl:choose></iaixsl:variable>

							
							<iaixsl:variable name="var_show_omnibus_short_fallback"><iaixsl:choose>
								<iaixsl:when test="($var_omnibus = '' and $var_omnibus_enabled = 'true' and not($last_price_change_date = ''))">true</iaixsl:when>
							</iaixsl:choose></iaixsl:variable>
							
							

							<div class="product__prices">
								<iaixsl:if test="$var_omnibus != ''"><iaixsl:attribute name="class">product__prices --omnibus<iaixsl:if test="$var_omnibus_short = 'true'"> --omnibus-short</iaixsl:if></iaixsl:attribute></iaixsl:if>

								
								
								<iaixsl:if test="$var_show_omnibus_short_fallback = 'true'">

									
									<iaixsl:attribute name="data-last_price_change_date"><iaixsl:value-of select="$last_price_change_date"/></iaixsl:attribute>

									
									
									<iaixsl:attribute name="data-omnibus-type">search</iaixsl:attribute>

									
									<iaixsl:if test="@id">
										<iaixsl:attribute name="data-omnibus_product_id"><iaixsl:value-of select="@id"/></iaixsl:attribute>
									</iaixsl:if>

									
									<iaixsl:if test="price/@maxprice">
										<iaixsl:attribute name="data-maxprice"><iaixsl:value-of select="price/@maxprice"/></iaixsl:attribute>
									</iaixsl:if>

									
									<iaixsl:if test="sizes/prices/@size_min_maxprice">
										<iaixsl:attribute name="data-sizes_min_maxprice"><iaixsl:value-of select="sizes/prices/@size_min_maxprice"/></iaixsl:attribute>
									</iaixsl:if>

									
									<iaixsl:if test="sizes/prices/@size_max_maxprice">
										<iaixsl:attribute name="data-sizes_max_maxprice"><iaixsl:value-of select="sizes/prices/@size_max_maxprice"/></iaixsl:attribute>
									</iaixsl:if>
								</iaixsl:if>
								

								<iaixsl:choose>
									<iaixsl:when test="(sizes/prices/@minprice_formatted != sizes/prices/@maxprice_formatted) or (sizes/prices/@minprice_unit_formatted != sizes/prices/@maxprice_unit_formatted)">
										<iaixsl:if test="(sizes/prices/@size_min_maxprice_formatted != sizes/prices/@size_max_maxprice_formatted) or (sizes/prices/@size_min_maxprice_unit_formatted != sizes/prices/@size_max_maxprice_unit_formatted)">
											<span class="price --max">
												
												<iaixsl:if test="($var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
													<span class="omnibus_label --hidden"><iaixsl:if test="$var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Cena regularna: </span>
												</iaixsl:if>
												
												<del>
													<iaixsl:choose>
														<iaixsl:when test="sizes/prices/@size_min_maxprice_unit_formatted">
															<span><iaixsl:value-of select="sizes/prices/@size_min_maxprice_unit_formatted"/></span><b> - </b><span><iaixsl:value-of select="sizes/prices/@size_max_maxprice_unit_formatted"/></span><span class="price_vat"><iaixsl:value-of select="$var_gross_prices_search"/></span>
														</iaixsl:when>
														<iaixsl:otherwise>
															<span><iaixsl:value-of select="sizes/prices/@size_min_maxprice_formatted"/></span><b> - </b><span><iaixsl:value-of select="sizes/prices/@size_max_maxprice_formatted"/></span><span class="price_vat"><iaixsl:value-of select="$var_gross_prices_search"/></span>
														</iaixsl:otherwise>
													</iaixsl:choose>
												</del>
												
												<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short = 'true') or ($var_show_omnibus_short_fallback = 'true')">
													<span class="omnibus_short --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short = 'true'"><iaixsl:attribute name="class">omnibus_short</iaixsl:attribute></iaixsl:if>Najniższa cena z 30 dni przed obniżką</span>
												</iaixsl:if>
												
											</span>
										</iaixsl:if>
										<strong class="price">
											<iaixsl:choose>
												<iaixsl:when test="sizes/prices/@minprice_unit_formatted">
													<iaixsl:value-of select="sizes/prices/@minprice_unit_formatted"/>
												</iaixsl:when>
												<iaixsl:otherwise>
													<iaixsl:value-of select="sizes/prices/@minprice_formatted"/>
												</iaixsl:otherwise>
											</iaixsl:choose>
												-
											<iaixsl:choose>
												<iaixsl:when test="sizes/prices/@maxprice_unit_formatted">
													<iaixsl:value-of select="sizes/prices/@maxprice_unit_formatted"/>
												</iaixsl:when>
												<iaixsl:otherwise>
													<iaixsl:value-of select="sizes/prices/@maxprice_formatted"/>
												</iaixsl:otherwise>
											</iaixsl:choose>

											<iaixsl:if test="sizes/prices/@minprice_unit_formatted">
												<iaixsl:text> / </iaixsl:text><iaixsl:value-of select="sizes/@unit_sellby"/><iaixsl:text> </iaixsl:text><iaixsl:value-of select="sizes/@unit"/>
											</iaixsl:if>
											<span class="price_vat"><iaixsl:value-of select="$var_gross_prices_search"/></span>
										</strong>
										
										<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
											<span class="omnibus_price --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_price</iaixsl:attribute></iaixsl:if><span class="omnibus_price__text">Najniższa cena z 30 dni przed obniżką: </span><span class="omnibus_price__value"><iaixsl:value-of select="$var_omnibus"/></span></span>
										</iaixsl:if>
										
									</iaixsl:when>
									<iaixsl:when test="(sizes/prices/@minprice = 0) and not(price/@points)">
										<a class="price --phone">
											<iaixsl:attribute name="title">Kliknij, by przejść do formularza kontaktu</iaixsl:attribute>
											<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/contact/@url"/></iaixsl:attribute>
											Cena na telefon
										</a>
									</iaixsl:when>
									<iaixsl:otherwise>
										<iaixsl:if test="price/@maxprice or price/@maxprice_unit">
											<span class="price --max">
												
												<iaixsl:if test="($var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
													<span class="omnibus_label --hidden"><iaixsl:if test="$var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Cena regularna: </span>
												</iaixsl:if>
												
												<del>
													<iaixsl:choose>
														<iaixsl:when test="price/@maxprice_unit_formatted">
															<iaixsl:value-of select="price/@maxprice_unit_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_gross_prices_search"/></span>
														</iaixsl:when>
														<iaixsl:otherwise>
															<iaixsl:value-of select="price/@maxprice_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_gross_prices_search"/></span>
														</iaixsl:otherwise>
													</iaixsl:choose>
												</del>
												
												<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short = 'true') or ($var_show_omnibus_short_fallback = 'true')">
													<span class="omnibus_short --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short = 'true'"><iaixsl:attribute name="class">omnibus_short</iaixsl:attribute></iaixsl:if>Najniższa cena z 30 dni przed obniżką</span>
												</iaixsl:if>
												
											</span>
										</iaixsl:if>
										<strong class="price">
											<iaixsl:choose>
												<iaixsl:when test="price/@price_unit_formatted">
													<iaixsl:value-of select="price/@price_unit_formatted"/><iaixsl:text> / </iaixsl:text><iaixsl:value-of select="sizes/@unit_sellby"/><iaixsl:text> </iaixsl:text><iaixsl:value-of select="sizes/@unit"/>
												</iaixsl:when>
												<iaixsl:otherwise>
													<iaixsl:value-of select="sizes/prices/@minprice_formatted"/>
													<span class="price__unit"><iaixsl:text> / </iaixsl:text><iaixsl:value-of select="sizes/@unit"/></span>
												</iaixsl:otherwise>
											</iaixsl:choose>
											<span class="price_vat"><iaixsl:value-of select="$var_gross_prices_search"/></span>
										</strong>

										<iaixsl:if test="price/@points">
											<span class="price --points"><iaixsl:value-of select="price/@points"/><span class="currency"> PKT</span></span>
										</iaixsl:if>
										
										<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
											<span class="omnibus_price --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_price</iaixsl:attribute></iaixsl:if><span class="omnibus_price__text">Najniższa cena z 30 dni przed obniżką: </span><span class="omnibus_price__value"><iaixsl:value-of select="$var_omnibus"/></span></span>
										</iaixsl:if>
										
									</iaixsl:otherwise>
								</iaixsl:choose>

								
								<iaixsl:if test="price/@unit_converted_price_formatted"><small class="price --convert"><iaixsl:value-of select="price/@unit_converted_price_formatted"/><iaixsl:text> / </iaixsl:text><iaixsl:value-of select="price/@unit_converted_format"/><span class="price_vat"><iaixsl:value-of select="$var_gross_prices_search"/></span></small>
								</iaixsl:if>
							</div>
						</iaixsl:otherwise>
					</iaixsl:choose>

					
					

					
					<iaixsl:if test="true()">
						<div class="product__traits d-none d-md-block mt-2">
							<ul>
								<iaixsl:for-each select="traits/trait[not(@gfx)]">
									<iaixsl:if test="not(@groupid = preceding-sibling::trait/@groupid)">
										<li class="trait">
											<span class="trait__name"><iaixsl:value-of select="@groupdescription"/>: </span>
											<div class="trait__values">
												<a class="trait__value"><iaixsl:attribute name="href"><iaixsl:value-of select="@link"/></iaixsl:attribute><iaixsl:value-of select="@traitdescription"/></a>
											</div>
										</li>
									</iaixsl:if>
								</iaixsl:for-each>
							</ul>
						</div>
					</iaixsl:if>

					<iaixsl:if test="true()"> 
						<div class="product__traits --gfx my-2 mb-md-0">
							<ul>
								<iaixsl:for-each select="traits/trait[@gfx2]">
									<li class="trait">
										<a class="trait__gfx">
											<iaixsl:attribute name="title"><iaixsl:value-of select="@groupdescription"/><iaixsl:text> </iaixsl:text><iaixsl:value-of select="@traitdescription"/></iaixsl:attribute>
											<iaixsl:attribute name="href"><iaixsl:value-of select="@link"/></iaixsl:attribute>
											<img class="trait__img">
												<iaixsl:attribute name="src"><iaixsl:value-of select="@gfx2"/></iaixsl:attribute>
												<iaixsl:attribute name="alt"><iaixsl:value-of select="@traitdescription"/></iaixsl:attribute>
											</img>
										</a>
									</li>
								</iaixsl:for-each>
							</ul>
						</div>
					</iaixsl:if>

					<div class="d-flex justify-content-around align-items-center checkBtns">
						<iaixsl:if test="/shop/compare/@active = 'y' and $addcompare_txt">
								

								<iaixsl:choose>
									<iaixsl:when test="@id = /shop/compare/product/@id">
										<a class="product__compare_item --remove btn" rel="nofollow">
											<iaixsl:attribute name="href">
											<iaixsl:choose>
											<iaixsl:when test="/shop/action/settings/@url">
											<iaixsl:value-of select="/shop/action/settings/@url"/>
											</iaixsl:when>
											<iaixsl:otherwise>settings.php</iaixsl:otherwise>
											</iaixsl:choose>?comparers=remove&amp;product=<iaixsl:value-of select="@id"/>
											</iaixsl:attribute>
											<iaixsl:attribute name="title">Kliknij, aby usunąć produkt z porównywarki</iaixsl:attribute>
											<i class="fa fa-minus mr-2"></i> Usuń z porównania
										</a>
									</iaixsl:when>
									<iaixsl:otherwise>
										<a class="product__compare_item --add btn" rel="nofollow">
											<iaixsl:attribute name="href"><iaixsl:choose><iaixsl:when test="/shop/action/settings/@url"><iaixsl:value-of select="/shop/action/settings/@url"/></iaixsl:when><iaixsl:otherwise>settings.php</iaixsl:otherwise></iaixsl:choose>?comparers=add&amp;product=<iaixsl:value-of select="@id"/></iaixsl:attribute>
											<iaixsl:attribute name="title">Kliknij, aby dodać produkt do porównania</iaixsl:attribute>
											<i class="fa fa-plus mr-2"></i> Porównaj
										</a>
									</iaixsl:otherwise>
								</iaixsl:choose>
							</iaixsl:if>
							<a class=" product__check_item --add btn " rel="nofollow" title="Kliknij, aby zobaczyć produkt " >
							<iaixsl:attribute name="href"><iaixsl:value-of select="@link"/></iaixsl:attribute>
								<div class="d-inline-flex justify-content-center align-items-center"><span class="checkProduct">Sprawdź</span> <span class="fa fa-angle-right ml-2"></span></div>
							</a>
					</div>
					
				</div>
			</iaixsl:for-each>
		</section>
	</iaixsl:if>
	<iaixsl:if test="/shop/page/search_params/*"> </iaixsl:if>
<!-- (search_paging2, 60dd8e7ede9b11.36368455.3)-->

				<iaixsl:variable name="select_sort_label_bottom"/>
				<iaixsl:variable name="select_portions_label_bottom"/>
				<iaixsl:variable name="prev_page_bottom"/>
				<iaixsl:variable name="next_page_bottom">Następna strona</iaixsl:variable>

				<iaixsl:if test="not(page/products/@hideproducts = 'true')">
						<div id="paging_setting_bottom" class="s_paging">
								<iaixsl:if test="not(/shop/page/products/navigation/@disable_sort_change = 'y')">
										<form class="s_paging__item --sort d-none" action="/settings.php">
												<iaixsl:if test="$select_sort_label_bottom">
														<label for="select_bottom_sort"><iaixsl:value-of disable-output-escaping="yes" select="$select_sort_label_bottom"/></label>
												</iaixsl:if>
												<select class="s_paging__select --order --small-md" id="select_bottom_sort" name="sort_order">
														<option value="name-a" class="option_name-a"><iaixsl:if test="page/products/navigation/@sort = 'name' and page/products/navigation/@order = 'a'"><iaixsl:attribute name="selected">selected</iaixsl:attribute></iaixsl:if>Sortuj po nazwie rosnąco</option>
														<option value="name-d" class="option_name-d"><iaixsl:if test="page/products/navigation/@sort = 'name' and page/products/navigation/@order = 'd'"><iaixsl:attribute name="selected">selected</iaixsl:attribute></iaixsl:if>Sortuj po nazwie malejąco</option>
														<option value="price-a" class="option_price-a"><iaixsl:if test="page/products/navigation/@sort = 'price' and page/products/navigation/@order = 'a'"><iaixsl:attribute name="selected">selected</iaixsl:attribute></iaixsl:if>Sortuj po cenie rosnąco</option>
														<option value="price-d" class="option_price-d"><iaixsl:if test="page/products/navigation/@sort = 'price' and page/products/navigation/@order = 'd'"><iaixsl:attribute name="selected">selected</iaixsl:attribute></iaixsl:if>Sortuj po cenie malejąco</option>
														<option value="date-a" class="option_date-a"><iaixsl:if test="page/products/navigation/@sort = 'date' and page/products/navigation/@order = 'a'"><iaixsl:attribute name="selected">selected</iaixsl:attribute></iaixsl:if>Sortuj po dacie rosnąco</option>
														<option value="date-d" class="option_date-d"><iaixsl:if test="page/products/navigation/@sort = 'date' and page/products/navigation/@order = 'd'"><iaixsl:attribute name="selected">selected</iaixsl:attribute></iaixsl:if>Sortuj po dacie malejąco</option>
												</select>
										</form>
								</iaixsl:if>

								<iaixsl:if test="not(/shop/page/products/navigation/@disable_portions_change = 'y') and count(page/products/navigation/portions) &gt; 1">
										<form class="s_paging__item --portions d-none" action="/settings.php">
												<iaixsl:if test="$select_portions_label_bottom">
														<label for="select_bottom_portions"><iaixsl:value-of disable-output-escaping="yes" select="$select_portions_label_bottom"/></label>
												</iaixsl:if>
												<select class="s_paging__select --portions --small-md" id="select_bottom_portions" name="portions">
														<iaixsl:for-each select="page/products/navigation/portions">
																<option><iaixsl:attribute name="value"><iaixsl:value-of select="@counter"/></iaixsl:attribute><iaixsl:if test="@selected = 'true'"><iaixsl:attribute name="selected">selected</iaixsl:attribute></iaixsl:if>Pokaż <iaixsl:value-of select="@counter"/>
																</option>
														</iaixsl:for-each>
												</select>
										</form>
								</iaixsl:if>

								<iaixsl:if test="count(page/products/navigation/item) &gt; 1">
										<ul class="s_paging__item pagination mb-2 mb-sm-3">
											<iaixsl:attribute name="data-total"><iaixsl:value-of select="/shop/page/products/navigation/@total"/></iaixsl:attribute>
											<iaixsl:attribute name="data-from"><iaixsl:value-of select="/shop/page/products/navigation/@from"/></iaixsl:attribute>
											<iaixsl:attribute name="data-to"><iaixsl:value-of select="/shop/page/products/navigation/@to"/></iaixsl:attribute>
											<iaixsl:attribute name="data-portions"><iaixsl:value-of select="/shop/page/products/navigation/@portions"/></iaixsl:attribute>
												
												<iaixsl:if test="page/products/navigation/prev">
														<li class="pagination__element --prev">
																<iaixsl:if test="$prev_page_bottom">
																		 <iaixsl:attribute name="class">pagination__element --prev --button</iaixsl:attribute>
																</iaixsl:if>
																<a class="pagination__link">
																		<iaixsl:attribute name="href"><iaixsl:value-of disable-output-escaping="yes" select="page/products/navigation/path/@value"/><iaixsl:value-of select="page/products/navigation/prev/@counter"/></iaixsl:attribute>
																</a>
																<iaixsl:if test="$prev_page_bottom">
																		<a class="pagination__button --prev btn --secondary --solid --icon-left icon-angle-left d-md-none">
																				<iaixsl:attribute name="href"><iaixsl:value-of disable-output-escaping="yes" select="page/products/navigation/path/@value"/><iaixsl:value-of select="page/products/navigation/prev/@counter"/></iaixsl:attribute>
																				<iaixsl:value-of disable-output-escaping="yes" select="$prev_page_bottom"/>
																		</a>
																</iaixsl:if>
														</li>
												</iaixsl:if>
												
												<iaixsl:if test="not(page/products/navigation/prev)">
														<li class="pagination__element --prev --disabled">
																<iaixsl:if test="$prev_page_bottom">
																		 <iaixsl:attribute name="class">pagination__element --prev --disabled --button</iaixsl:attribute>
																</iaixsl:if>
																<span class="pagination__link"/>
																<iaixsl:if test="$prev_page_bottom">
																		<span class="pagination__button --prev btn --secondary --solid --icon-left icon-angle-left d-md-none"><iaixsl:value-of disable-output-escaping="yes" select="$prev_page_bottom"/></span>
																</iaixsl:if>
														</li>
												</iaixsl:if>
												
												<iaixsl:for-each select="page/products/navigation/item">
														<iaixsl:if test="@gap">
																<li class="pagination__element --gap --disabled">
																		<span class="pagination__link">...</span>
																</li>
														</iaixsl:if>
														<iaixsl:if test="not(@type = 'current') and not(@gap)">
																<li class="pagination__element --item">
																		<a class="pagination__link">
																				<iaixsl:attribute name="href"><iaixsl:value-of disable-output-escaping="yes" select="../path/@value"/><iaixsl:value-of select="@counter - 1"/></iaixsl:attribute>
																				<iaixsl:value-of select="@counter"/>
																		</a>
																</li>
														</iaixsl:if>
														<iaixsl:if test="@type = 'current'">
																<li class="pagination__element --item --active">
																		<span class="pagination__link"><iaixsl:value-of select="@counter"/></span>
																</li>
														</iaixsl:if>
												</iaixsl:for-each>
												
												<iaixsl:if test="page/products/navigation/next">
														<li class="pagination__element --next">
																<iaixsl:if test="$next_page_bottom">
																		 <iaixsl:attribute name="class">pagination__element --next --button</iaixsl:attribute>
																</iaixsl:if>
																<a class="pagination__link">
																		<iaixsl:attribute name="href"><iaixsl:value-of disable-output-escaping="yes" select="page/products/navigation/path/@value"/><iaixsl:value-of select="page/products/navigation/next/@counter"/></iaixsl:attribute>
																</a>
																<iaixsl:if test="$next_page_bottom">
																		<a class="pagination__button --next btn --secondary --solid --icon-right icon-angle-right d-md-none">
																				<iaixsl:attribute name="href"><iaixsl:value-of disable-output-escaping="yes" select="page/products/navigation/path/@value"/><iaixsl:value-of select="page/products/navigation/next/@counter"/></iaixsl:attribute>
																				<iaixsl:value-of disable-output-escaping="yes" select="$next_page_bottom"/>
																		</a>
																</iaixsl:if>
														</li>
												</iaixsl:if>
												
												<iaixsl:if test="not(page/products/navigation/next)">
														<li class="pagination__element --next --disabled">
																<iaixsl:if test="$next_page_bottom">
																		 <iaixsl:attribute name="class">pagination__element --next --disabled --button</iaixsl:attribute>
																</iaixsl:if>
																<span class="pagination__link"/>
																<iaixsl:if test="$next_page_bottom">
																		<span class="pagination__button --next btn --secondary --solid --icon-right icon-angle-right d-md-none"><iaixsl:value-of disable-output-escaping="yes" select="$next_page_bottom"/></span>
																</iaixsl:if>
														</li>
												</iaixsl:if>
										</ul>
								</iaixsl:if>
						</div>
				</iaixsl:if>
			       <!-- (search_filters, 60dd8e79c0ea13.64200683.5)-->
            <iaixsl:if test="(count(/shop/page/products/navigation/filtering/filter/@selected) &gt; 0) or count(/shop/page/products/navigation/filtering/filter/item/@selected) &gt; 0">
                <iaixsl:variable name="show_remove_button">true</iaixsl:variable>
                <div id="filter_list">
                    <div class="filter_list_content">
                        <iaixsl:if test="$show_remove_button">
                            <a class="remove_all_list_filters btn --solid --secondary mr-2 mr-sm-3" href="/settings.php?filter_remove=all">
                                <iaixsl:if test="/shop/page/products/navigation/search_link/@value">
                                    <iaixsl:attribute name="href"><iaixsl:value-of select="/shop/page/products/navigation/search_link/@value "/></iaixsl:attribute>
                                </iaixsl:if>
                                <iaixsl:attribute name="title">Usuń wszystkie filtry</iaixsl:attribute>
                                Usuń filtry
                            </a>
                        </iaixsl:if>
                        <iaixsl:for-each select="/shop/page/products/navigation/filtering/filter[(@type='list') or (@type='text')]">
                            <iaixsl:if test="(@selected != '') or count(item/@selected) &gt; 0">
                                <iaixsl:choose>
                                    
                                    <iaixsl:when test="(@id = 'filter_price') and (@selected) and not(@selected = '')">
                                        <iaixsl:choose>
                                            <iaixsl:when test="item[@selected = 'selected']">
                                                <iaixsl:for-each select="item[@selected = 'selected']">
                                                    <a class="filter_list_remove btn --solid --icon-right icon-x mr-2 mr-sm-3">
                                                        <iaixsl:attribute name="href"><iaixsl:value-of select="@link_remove"/></iaixsl:attribute>
                                                        <span><iaixsl:value-of select="@name_formatted"/></span>
                                                    </a>
                                                </iaixsl:for-each>
                                            </iaixsl:when>
                                            <iaixsl:otherwise>
                                                <a class="filter_list_remove btn --solid --icon-right icon-x mr-2 mr-sm-3">
                                                    <iaixsl:attribute name="href"><iaixsl:value-of select="@link_remove"/></iaixsl:attribute>
                                                    <span>
                                                        <iaixsl:if test="substring-before(@selected, '-') != ''">
                                                            <iaixsl:value-of select="substring-before(@selected, '-')"/> <iaixsl:value-of select="/shop/currency/@name"/>
                                                        </iaixsl:if>
                                                         - 
                                                        <iaixsl:if test="substring-after(@selected, '-') != ''">
                                                            <iaixsl:value-of select="substring-after(@selected, '-')"/> <iaixsl:value-of select="/shop/currency/@name"/>
                                                        </iaixsl:if>
                                                    </span>
                                                </a>		
                                            </iaixsl:otherwise>
                                        </iaixsl:choose>
                                    </iaixsl:when>
                                    
                                    <iaixsl:when test="(@id = 'filter_date') and (@selected) and not(@selected = '')">
                                        <iaixsl:choose>
                                            <iaixsl:when test="item[@selected = 'selected']">
                                                <iaixsl:for-each select="item[@selected = 'selected']">
                                                    <a class="filter_list_remove btn --solid --icon-right icon-x mr-2 mr-sm-3">
                                                        <iaixsl:attribute name="href"><iaixsl:value-of select="@link_remove"/></iaixsl:attribute>
                                                        <span>
                                                            <iaixsl:choose>
                                                                <iaixsl:when test="@desc = '1week'">Ostatni tydzień</iaixsl:when>
                                                                <iaixsl:when test="@desc = '1month'">Ostatni miesiąc</iaixsl:when>
                                                                <iaixsl:when test="@desc = '3months'">Ostatnie 3 miesiące</iaixsl:when>
                                                                <iaixsl:when test="@desc = '6months'">Ostatnie pół roku</iaixsl:when>
                                                                <iaixsl:when test="@desc = '1year'">Ostatni rok</iaixsl:when>
                                                            </iaixsl:choose>
                                                        </span>
                                                    </a>
                                                </iaixsl:for-each>
                                            </iaixsl:when>
                                            <iaixsl:otherwise>
                                                <a class="filter_list_remove btn --solid --icon-right icon-x mr-2 mr-sm-3">
                                                    <iaixsl:attribute name="href"><iaixsl:value-of select="@link_remove"/></iaixsl:attribute>
                                                    <span><iaixsl:value-of select="@selected"/></span>
                                                </a>
                                            </iaixsl:otherwise>
                                        </iaixsl:choose>
                                    </iaixsl:when>
                                    <iaixsl:when test="(@id = 'filter_text') and (@selected) and not(@selected = '')">
                                        <a class="filter_list_remove btn --solid --icon-right icon-x mr-2 mr-sm-3">
                                            <iaixsl:attribute name="href"><iaixsl:value-of select="@link_remove"/></iaixsl:attribute>
                                            <span><iaixsl:value-of select="@selected"/></span>
                                        </a>
                                    </iaixsl:when>
                                    <iaixsl:otherwise>
                                        <iaixsl:for-each select="item[@selected = 'selected']">
                                            <a class="filter_list_remove btn --solid --icon-right icon-x mr-2 mr-sm-3">
                                                <iaixsl:attribute name="href"><iaixsl:value-of select="@link_remove"/></iaixsl:attribute>
                                                <span><iaixsl:value-of select="@name"/></span>
                                            </a>
                                        </iaixsl:for-each>
                                    </iaixsl:otherwise>
                                </iaixsl:choose>
                            </iaixsl:if>
                        </iaixsl:for-each>
                        <iaixsl:for-each select="/shop/page/products/navigation/filtering/filter[@type='dual']/item[@selected = 'selected']">
                            <a class="filter_list_remove btn --solid --icon-right icon-x mr-2 mr-sm-3">
                                <iaixsl:attribute name="href"><iaixsl:value-of select="../@link_remove"/></iaixsl:attribute>
                                <span><iaixsl:value-of select="../@name"/></span>
                            </a>
                        </iaixsl:for-each>
                        <iaixsl:for-each select="/shop/page/products/navigation/filtering/filter[@selected != '' or count(item/@selected) &gt; 0]/group/item[@selected = 'selected']">
                            <a class="filter_list_remove btn --solid --icon-right icon-x mr-2 mr-sm-3">
                                <iaixsl:attribute name="href"><iaixsl:value-of select="@link_remove"/></iaixsl:attribute>
                                <span><iaixsl:value-of select="@name"/></span>
                            </a>
                        </iaixsl:for-each>
                    </div>
                </div>
            </iaixsl:if>

        <iaixsl:if test="/shop/page/products/additional/hotspot/products_zone1/@iairs_ajax"> </iaixsl:if>
        <iaixsl:if test="/shop/page/products/additional/hotspot/products_zone1/@hotspot_ajax"> </iaixsl:if>
        <iaixsl:if test="/shop/page/products/additional/hotspot/products_zone1/@name"> </iaixsl:if>

        <!-- (search_categoriesdescription_bottom, 61b0b16a3ca862.45673090.3)-->
			<iaixsl:if test="not(/shop/page/products/additional/category_list/description_bottom = '') and (/shop/page/products/additional/category_list/description_bottom)">
				<iaixsl:if test="(/shop/page/products/@hideproducts = 'true' ) or ((/shop/page/products/navigation/item[1]/@counter = 1) and (/shop/page/products/navigation/item[1]/@type = 'current'))">
					<section class="search_description --bottom --skeleton cm">
						<div class="search_description__wrapper">
							<iaixsl:value-of disable-output-escaping="yes" select="/shop/page/products/additional/category_list/description_bottom"/>
						</div>
					</section>
				</iaixsl:if>
			</iaixsl:if>
		<!-- (search_promo_products, 61f913c81ea771.79063863.8)-->
        <iaixsl:if test="/shop/page/@dynamic_display = 'true'"> 
            <script>
               var  _additional_ajax = true;
            </script>
        </iaixsl:if>
        
				</div>
			</iaixsl:if>
		</div>
	</div>

	
	<iaixsl:if test="not(action/set_render/item) or (action/set_render/item/@name = 'footer')">
		<footer>
			<iaixsl:attribute name="class">max-width-1200</iaixsl:attribute>
			<!-- (menu_search_hotspot1_bis, 614c5ced8d8668.08340066.6)-->
	
		<iaixsl:if test="page/products/additional/hotspot/products_zone1">
			<section id="search_hotspot_zone1" class="hotspot mb-5 container max-width-1200">
				
				<iaixsl:variable name="headline_after_search_hotspot_zone1">Zobacz wszystkie</iaixsl:variable>
				
				<iaixsl:if test="not(page/products/additional/hotspot/products_zone1/product or page/products/additional/hotspot/products_zone1/opinion)">
					<iaixsl:attribute name="data-ajaxLoad">true</iaixsl:attribute>
					<iaixsl:attribute name="data-pageType">search</iaixsl:attribute>
				</iaixsl:if>

        
				
        <iaixsl:variable name="var_omnibus_enabled"><iaixsl:if test="/shop/@omnibus = 1">true</iaixsl:if></iaixsl:variable>
				

				<iaixsl:choose>
					<iaixsl:when test="page/products/additional/hotspot/products_zone1/product or page/products/additional/hotspot/products_zone1/opinion">

						
						<h2>
							<iaixsl:choose>
								<iaixsl:when test="page/products/additional/hotspot/products_zone1/@link">
									<a class="headline">
										<iaixsl:attribute name="href"><iaixsl:value-of select="page/products/additional/hotspot/products_zone1/@link"/></iaixsl:attribute>
										<iaixsl:attribute name="title">Kliknij aby zobaczyć wszystkie produkty </iaixsl:attribute>

										<span class="headline__name">
											<iaixsl:choose>
												<iaixsl:when test="page/products/additional/hotspot/products_zone1/@name"><iaixsl:value-of select="page/products/additional/hotspot/products_zone1/@name"/></iaixsl:when>
												<iaixsl:otherwise>Promocje</iaixsl:otherwise>
											</iaixsl:choose>
										</span>
										<iaixsl:if test="$headline_after_search_hotspot_zone1">
											<span class="headline__after"><iaixsl:value-of select="$headline_after_search_hotspot_zone1"/></span>
										</iaixsl:if>
									</a>
								</iaixsl:when>
								<iaixsl:otherwise>
									<span class="headline">
										<span class="headline__name">
											<iaixsl:choose>
												<iaixsl:when test="page/products/additional/hotspot/products_zone1/@name"><iaixsl:value-of select="page/products/additional/hotspot/products_zone1/@name"/></iaixsl:when>
												<iaixsl:otherwise>Promocje</iaixsl:otherwise>
											</iaixsl:choose>
										</span>
									</span>
								</iaixsl:otherwise>
							</iaixsl:choose>
						</h2>

						<div class="products d-flex flex-wrap">
							<iaixsl:for-each select="page/products/additional/hotspot/products_zone1/*">
								
								<iaixsl:variable name="var_name"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of disable-output-escaping="yes" select="product/name/text()"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of disable-output-escaping="yes" select="name/text()"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_icon"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/icon"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="icon"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_icon_small"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/icon_small"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="icon_small"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_link"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/@link"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@link"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_yousave"/>
								<iaixsl:variable name="var_net_prices"><iaixsl:if test="/shop/page/@price_type = 'net'"> netto</iaixsl:if></iaixsl:variable>
								<iaixsl:variable name="var_gross_prices"><iaixsl:if test="/shop/page/@price_type = 'gross'"> brutto</iaixsl:if></iaixsl:variable>
								<iaixsl:variable name="var_icon_second"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/icon_second"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="icon_second"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_icon_small_second"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/icon_small_second"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="icon_small_second"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_b2b"/>

								<div class="product col-6 col-sm-3 col-xl-2 py-3 py-3">
									
									<iaixsl:if test="$var_yousave and not($var_yousave = '') and price/@yousave_formatted != ''">
										<div class="product__yousave">
											<span class="product__yousave --label"><iaixsl:value-of select="$var_yousave"/></span>
											<span class="product__yousave --value"><iaixsl:value-of select="price/@yousave_formatted"/></span>
										</div>
									</iaixsl:if>

									
									<a class="product__icon d-flex justify-content-center align-items-center">
										<iaixsl:attribute name="data-product-id"><iaixsl:value-of select="@id"/></iaixsl:attribute>
										<iaixsl:attribute name="href"><iaixsl:value-of select="$var_link"/></iaixsl:attribute>
										<iaixsl:attribute name="title"><iaixsl:value-of select="$var_name"/></iaixsl:attribute>

                    <iaixsl:choose>
                      <iaixsl:when test="$var_icon_second and not($var_icon_second = '/' or $var_icon_second = '') and $var_icon_small_second and not($var_icon_small_second = '/' or $var_icon_small_second = '')">
                        <picture>
                          <source media="(min-width: 421px)" type="image/webp">
                            <iaixsl:attribute name="srcset"><iaixsl:value-of select="$var_icon"/></iaixsl:attribute>
                          </source>
                          <source media="(min-width: 421px)" type="image/jpeg">
                            <iaixsl:attribute name="srcset"><iaixsl:value-of select="$var_icon_second"/></iaixsl:attribute>
                          </source>
                          <source media="(max-width: 420px)" type="image/webp">
                            <iaixsl:attribute name="srcset"><iaixsl:value-of select="$var_icon_small"/></iaixsl:attribute>
                          </source>

                          <img src="/gfx/standards/loader.gif?r=1696937716" class="b-lazy">
                            <iaixsl:attribute name="data-src-small"><iaixsl:value-of disable-output-escaping="yes" select="$var_icon_small_second"/></iaixsl:attribute>
                            <iaixsl:attribute name="data-src"><iaixsl:value-of disable-output-escaping="yes" select="$var_icon_second"/></iaixsl:attribute>
                            <iaixsl:attribute name="alt"><iaixsl:value-of disable-output-escaping="yes" select="$var_name"/></iaixsl:attribute>
                          </img>

                        </picture>
                      </iaixsl:when>
                      <iaixsl:otherwise>
                        <img src="/gfx/standards/loader.gif?r=1696937716" class="b-lazy">
                          <iaixsl:attribute name="data-src-small"><iaixsl:value-of disable-output-escaping="yes" select="$var_icon_small"/></iaixsl:attribute>
                          <iaixsl:attribute name="data-src"><iaixsl:value-of disable-output-escaping="yes" select="$var_icon"/></iaixsl:attribute>
                          <iaixsl:attribute name="alt"><iaixsl:value-of disable-output-escaping="yes" select="$var_name"/></iaixsl:attribute>
                        </img>
                      </iaixsl:otherwise>
                    </iaixsl:choose>
									</a>

									
									<h3>
										<a class="product__name">
											<iaixsl:attribute name="href"><iaixsl:value-of select="$var_link"/></iaixsl:attribute>
											<iaixsl:attribute name="title"><iaixsl:value-of select="$var_name"/></iaixsl:attribute>
											<iaixsl:value-of select="$var_name"/>
										</a>
									</h3>

									<iaixsl:choose>
										
										<iaixsl:when test="$var_net_prices = ''">
											
											
											<iaixsl:variable name="var_size_min"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/price/@size_min"/></iaixsl:when><iaixsl:when test="product and product/sizes/prices/@size_min"><iaixsl:value-of select="product/sizes/prices/@size_min"/></iaixsl:when><iaixsl:when test="sizes/prices/@size_min"><iaixsl:value-of select="sizes/prices/@size_min"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="price/@size_min"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
											<iaixsl:variable name="var_size_max"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/price/@size_max"/></iaixsl:when><iaixsl:when test="product and product/sizes/prices/@size_max"><iaixsl:value-of select="product/sizes/prices/@size_max"/></iaixsl:when><iaixsl:when test="sizes/prices/@size_max"><iaixsl:value-of select="sizes/prices/@size_max"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="price/@size_max"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
											<iaixsl:variable name="var_size_min_maxprice"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/price/@size_min_maxprice"/></iaixsl:when><iaixsl:when test="product and product/sizes/prices/@size_min_maxprice"><iaixsl:value-of select="product/sizes/prices/@size_min_maxprice"/></iaixsl:when><iaixsl:when test="sizes/prices/@size_min_maxprice"><iaixsl:value-of select="sizes/prices/@size_min_maxprice"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="price/@size_min_maxprice"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
											<iaixsl:variable name="var_size_max_maxprice"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/price/@size_max_maxprice"/></iaixsl:when><iaixsl:when test="product and product/sizes/prices/@size_max_maxprice"><iaixsl:value-of select="product/sizes/prices/@size_max_maxprice"/></iaixsl:when><iaixsl:when test="sizes/prices/@size_max_maxprice"><iaixsl:value-of select="sizes/prices/@size_max_maxprice"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="price/@size_max_maxprice"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
											<iaixsl:variable name="var_maxprice"><iaixsl:choose><iaixsl:when test="price/@maxprice_unit"><iaixsl:value-of select="price/@maxprice_unit"/></iaixsl:when><iaixsl:when test="product and product/price/@maxprice_unit"><iaixsl:value-of select="product/price/@maxprice_unit"/></iaixsl:when><iaixsl:when test="product and product/price/@maxprice"><iaixsl:value-of select="product/price/@maxprice"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="price/@maxprice"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
											

											<iaixsl:variable name="var_size_min_formatted"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/price/@size_min_formatted"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="price/@size_min_formatted"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
											<iaixsl:variable name="var_size_max_formatted"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/price/@size_max_formatted"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="price/@size_max_formatted"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
											<iaixsl:variable name="var_size_min_maxprice_formatted"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/price/@size_min_maxprice_formatted"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="price/@size_min_maxprice_formatted"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
											<iaixsl:variable name="var_size_max_maxprice_formatted"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/price/@size_max_maxprice_formatted"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="price/@size_max_maxprice_formatted"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
											<iaixsl:variable name="var_points"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/price/@points"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="price/@points"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>

											<iaixsl:variable name="var_value"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/price/@size_min"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="price/@size_min"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
											<iaixsl:variable name="var_price_formatted">
												<iaixsl:choose>
													<iaixsl:when test="price/@price_unit_formatted and sizes/@unit"><iaixsl:value-of select="price/@price_unit_formatted"/><iaixsl:text> / </iaixsl:text><iaixsl:value-of select="sizes/@unit_sellby"/><iaixsl:text> </iaixsl:text><iaixsl:value-of select="sizes/@unit"/></iaixsl:when>
													<iaixsl:when test="product/price/@price_unit_formatted and product/sizes/@unit"><iaixsl:value-of select="product/price/@price_unit_formatted"/><iaixsl:text> / </iaixsl:text><iaixsl:value-of select="product/sizes/@unit_sellby"/><iaixsl:text> </iaixsl:text><iaixsl:value-of select="product/sizes/@unit"/></iaixsl:when>
													<iaixsl:otherwise><iaixsl:value-of select="$var_size_min_formatted"/></iaixsl:otherwise>
												</iaixsl:choose>
											</iaixsl:variable>

											<iaixsl:variable name="var_maxprice_formatted">
												<iaixsl:choose>
													<iaixsl:when test="price/@maxprice_unit_formatted"><iaixsl:value-of select="price/@maxprice_unit_formatted"/></iaixsl:when>
													<iaixsl:when test="product/price/@maxprice_unit_formatted"><iaixsl:value-of select="product/price/@maxprice_unit_formatted"/></iaixsl:when>
													<iaixsl:when test="product"><iaixsl:value-of select="product/price/@maxprice_formatted"/></iaixsl:when>
													<iaixsl:otherwise><iaixsl:value-of select="price/@maxprice_formatted"/></iaixsl:otherwise>
												</iaixsl:choose>
											</iaixsl:variable>

											
											
											<iaixsl:variable name="var_omnibus_min"><iaixsl:choose>
												<iaixsl:when test="product and product/price/@min_omnibus_price_formatted"><iaixsl:value-of select="product/price/@min_omnibus_price_formatted"/></iaixsl:when>
												<iaixsl:when test="price/@min_omnibus_price_formatted"><iaixsl:value-of select="price/@min_omnibus_price_formatted"/></iaixsl:when>
												<iaixsl:when test="product and product/sizes/size/price">
													<iaixsl:for-each select="product/sizes/size[price/@omnibus_price]">
														<iaixsl:sort select="price/@omnibus_price" data-type="number"/>
														<iaixsl:if test="position() = 1"><iaixsl:value-of select="price/@omnibus_price_formatted"/></iaixsl:if>
													</iaixsl:for-each>
												</iaixsl:when>
												<iaixsl:when test="product">
													<iaixsl:value-of select="product/price/@omnibus_price_formatted"/>
												</iaixsl:when>
												<iaixsl:when test="sizes/size/price">
													<iaixsl:for-each select="sizes/size[price/@omnibus_price]">
														<iaixsl:sort select="price/@omnibus_price" data-type="number"/>
														<iaixsl:if test="position() = 1"><iaixsl:value-of select="price/@omnibus_price_formatted"/></iaixsl:if>
													</iaixsl:for-each>
												</iaixsl:when>
												<iaixsl:otherwise>
													<iaixsl:value-of select="price/@omnibus_price_formatted"/>
												</iaixsl:otherwise>
											</iaixsl:choose></iaixsl:variable>

											
											<iaixsl:variable name="var_omnibus_max"><iaixsl:choose>
												<iaixsl:when test="product and product/price/@max_omnibus_price_formatted"><iaixsl:value-of select="product/price/@max_omnibus_price_formatted"/></iaixsl:when>
												<iaixsl:when test="price/@max_omnibus_price_formatted"><iaixsl:value-of select="price/@max_omnibus_price_formatted"/></iaixsl:when>
												<iaixsl:when test="product and product/sizes/size/price">
													<iaixsl:for-each select="product/sizes/size[price/@omnibus_price]">
														<iaixsl:sort select="price/@omnibus_price" data-type="number" order="descending"/>
														<iaixsl:if test="position() = 1"><iaixsl:value-of select="price/@omnibus_price_formatted"/></iaixsl:if>
													</iaixsl:for-each>
												</iaixsl:when>
												<iaixsl:when test="product">
													<iaixsl:value-of select="product/price/@omnibus_price_formatted"/>
												</iaixsl:when>
												<iaixsl:when test="sizes/size/price">
													<iaixsl:for-each select="sizes/size[price/@omnibus_price]">
														<iaixsl:sort select="price/@omnibus_price" data-type="number" order="descending"/>
														<iaixsl:if test="position() = 1"><iaixsl:value-of select="price/@omnibus_price_formatted"/></iaixsl:if>
													</iaixsl:for-each>
												</iaixsl:when>
												<iaixsl:otherwise>
													<iaixsl:value-of select="price/@omnibus_price_formatted"/>
												</iaixsl:otherwise>
											</iaixsl:choose></iaixsl:variable>

											
											<iaixsl:variable name="var_omnibus"><iaixsl:if test="$var_omnibus_enabled = 'true'"><iaixsl:choose>
												<iaixsl:when test="$var_omnibus_min != $var_omnibus_max">
													<span><iaixsl:value-of select="$var_omnibus_min"/></span><b><iaixsl:text> - </iaixsl:text></b><span><iaixsl:value-of select="$var_omnibus_max"/></span>
												</iaixsl:when>
												<iaixsl:when test="$var_omnibus_min != ''">
													<iaixsl:value-of select="$var_omnibus_min"/>
												</iaixsl:when>
											</iaixsl:choose></iaixsl:if></iaixsl:variable>

											
											<iaixsl:variable name="var_omnibus_short"><iaixsl:if test="$var_omnibus_enabled = 'true'"><iaixsl:choose>
												<iaixsl:when test="$var_size_min_formatted != $var_size_max_formatted and $var_size_min_maxprice_formatted = $var_omnibus_min and $var_size_max_maxprice_formatted = $var_omnibus_max">true</iaixsl:when>
												<iaixsl:when test="$var_maxprice_formatted = $var_omnibus">true</iaixsl:when>
											</iaixsl:choose></iaixsl:if></iaixsl:variable>

											
											
											
											<iaixsl:variable name="last_price_change_date"><iaixsl:choose>
												<iaixsl:when test="product and product/sizes/size/price and (count(product/sizes/size) &gt; 1)"><iaixsl:for-each select="product/sizes/size[price/@last_price_change_date]"><iaixsl:if test="@type and price/@last_price_change_date"><iaixsl:value-of select="price/@last_price_change_date"/>;&apos;<iaixsl:value-of select="@type"/>&apos;<iaixsl:if test="not(position() = last())">#separator#</iaixsl:if></iaixsl:if></iaixsl:for-each></iaixsl:when>
												<iaixsl:when test="product"><iaixsl:value-of select="product/price/@last_price_change_date"/></iaixsl:when>
												<iaixsl:when test="sizes/size/price and (count(sizes/size) &gt; 1)"><iaixsl:for-each select="sizes/size[price/@last_price_change_date]"><iaixsl:if test="@type and price/@last_price_change_date"><iaixsl:value-of select="price/@last_price_change_date"/>;&apos;<iaixsl:value-of select="@type"/>&apos;<iaixsl:if test="not(position() = last())">#separator#</iaixsl:if></iaixsl:if></iaixsl:for-each></iaixsl:when>
												<iaixsl:when test="price/@last_price_change_date"><iaixsl:value-of select="price/@last_price_change_date"/></iaixsl:when>
											</iaixsl:choose></iaixsl:variable>

											
											<iaixsl:variable name="var_show_omnibus_short_fallback"><iaixsl:choose>
												<iaixsl:when test="($var_omnibus = '' and $var_omnibus_enabled = 'true' and not($last_price_change_date = ''))">true</iaixsl:when>
											</iaixsl:choose></iaixsl:variable>
											
											

											<div class="product__prices">
												<iaixsl:if test="$var_omnibus != ''"><iaixsl:attribute name="class">product__prices --omnibus<iaixsl:if test="$var_omnibus_short = 'true'"> --omnibus-short</iaixsl:if></iaixsl:attribute></iaixsl:if>

												
												
												<iaixsl:if test="$var_show_omnibus_short_fallback = 'true'">

													
													<iaixsl:attribute name="data-last_price_change_date"><iaixsl:value-of select="$last_price_change_date"/></iaixsl:attribute>

													
													
													<iaixsl:attribute name="data-omnibus-type">hotspot</iaixsl:attribute>

													
													<iaixsl:if test="product and product/@id">
														<iaixsl:attribute name="data-omnibus_product_id"><iaixsl:value-of select="product/@id"/></iaixsl:attribute>
													</iaixsl:if>

													
													<iaixsl:if test="$var_size_min">
														<iaixsl:attribute name="data-size_min"><iaixsl:value-of select="$var_size_min"/></iaixsl:attribute>
													</iaixsl:if>

													
													<iaixsl:if test="$var_size_max">
														<iaixsl:attribute name="data-size_max"><iaixsl:value-of select="$var_size_max"/></iaixsl:attribute>
													</iaixsl:if>

													
													<iaixsl:if test="$var_size_min_maxprice">
														<iaixsl:attribute name="data-size_min_maxprice"><iaixsl:value-of select="$var_size_min_maxprice"/></iaixsl:attribute>
													</iaixsl:if>

													
													<iaixsl:if test="$var_size_max_maxprice">
														<iaixsl:attribute name="data-size_max_maxprice"><iaixsl:value-of select="$var_size_max_maxprice"/></iaixsl:attribute>
													</iaixsl:if>

													
													<iaixsl:if test="$var_maxprice">
														<iaixsl:attribute name="data-maxprice"><iaixsl:value-of select="$var_maxprice"/></iaixsl:attribute>
													</iaixsl:if>
												</iaixsl:if>
												

												<iaixsl:choose>
													
													<iaixsl:when test="$var_size_min_formatted != $var_size_max_formatted">
														<iaixsl:if test="$var_size_min_maxprice_formatted != ''">
															<span class="price --max">
																
																<iaixsl:if test="($var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_label --hidden"><iaixsl:if test="$var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Cena regularna: </span>
																</iaixsl:if>
																
																<del>
																	<span><iaixsl:value-of select="$var_size_min_maxprice_formatted"/></span><b><iaixsl:text> - </iaixsl:text></b><span><iaixsl:value-of select="$var_size_max_maxprice_formatted"/></span><span class="price_vat"><iaixsl:value-of select="$var_gross_prices"/></span>
																</del>
																
																<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short = 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_short --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short = 'true'"><iaixsl:attribute name="class">omnibus_short</iaixsl:attribute></iaixsl:if>Najniższa cena z 30 dni przed obniżką</span>
																</iaixsl:if>
																
															</span>
														</iaixsl:if>
														<strong class="price">
															<iaixsl:value-of select="$var_size_min_formatted"/><iaixsl:text> - </iaixsl:text><iaixsl:value-of select="$var_size_max_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_gross_prices"/></span>
														</strong>
														<iaixsl:if test="$var_points != ''">
															<span class="price --points">
																<iaixsl:value-of select="$var_points"/><span class="currency"> pkt.</span>
															</span>
														</iaixsl:if>
														
														<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
															<span class="omnibus_price --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_price</iaixsl:attribute></iaixsl:if><span class="omnibus_price__text">Najniższa cena z 30 dni przed obniżką: </span><span class="omnibus_price__value"><iaixsl:value-of select="$var_omnibus"/></span></span>
														</iaixsl:if>
														
													</iaixsl:when>

													
													<iaixsl:when test="(($var_value = 0) and $var_points = '') or ($var_value = 0 and $var_b2b and not($var_b2b = '') and not(/shop/basket/@wholesaler = 'true'))">
														<iaixsl:choose>
															<iaixsl:when test="$var_b2b and not($var_b2b = '')">
																<a class="price --phone" href="/signin.php">
																	<iaixsl:attribute name="title"><iaixsl:value-of select="$var_b2b"/></iaixsl:attribute>
																	<iaixsl:value-of select="$var_b2b"/>
																</a>
															</iaixsl:when>
															<iaixsl:otherwise>
																<a class="price --phone" href="/contact.php">
																	<iaixsl:attribute name="title">Kliknij, by przejść do formularza kontaktu</iaixsl:attribute>
																	Cena na telefon
																</a>
															</iaixsl:otherwise>
														</iaixsl:choose>
													</iaixsl:when>

													
													<iaixsl:otherwise>
														<iaixsl:if test="$var_maxprice_formatted != ''">
															<span class="price --max">
																
																<iaixsl:if test="($var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_label --hidden"><iaixsl:if test="$var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Cena regularna: </span>
																</iaixsl:if>
																
																<del>
																	<iaixsl:value-of select="$var_maxprice_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_gross_prices"/></span>
																</del>
																
																<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short = 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_short --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short = 'true'"><iaixsl:attribute name="class">omnibus_short</iaixsl:attribute></iaixsl:if>Najniższa cena z 30 dni przed obniżką</span>
																</iaixsl:if>
																
															</span>
														</iaixsl:if>
														<strong class="price">
															<iaixsl:value-of select="$var_price_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_gross_prices"/></span>
														</strong>
														<iaixsl:if test="$var_points != ''">
															<span class="price --points">
																<iaixsl:value-of select="$var_points"/><span class="currency"> pkt.</span>
															</span>
														</iaixsl:if>
														
														<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
															<span class="omnibus_price --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_price</iaixsl:attribute></iaixsl:if><span class="omnibus_price__text">Najniższa cena z 30 dni przed obniżką: </span><span class="omnibus_price__value"><iaixsl:value-of select="$var_omnibus"/></span></span>
														</iaixsl:if>
														
													</iaixsl:otherwise>
												</iaixsl:choose>
											</div>
											<iaixsl:if test="price/@unit_converted_price_formatted">
												<small class="s_unit_converted_price"><iaixsl:value-of select="price/@unit_converted_price_formatted"/><iaixsl:text> / </iaixsl:text><iaixsl:value-of select="price/@unit_converted_format"/><span class="price_vat"><iaixsl:value-of select="$var_gross_prices"/></span></small>
											</iaixsl:if>
										</iaixsl:when>

										
										<iaixsl:otherwise>
											
											
											<iaixsl:variable name="var_size_min"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/price/@size_min_net"/></iaixsl:when><iaixsl:when test="product and product/sizes/prices/@size_min_net"><iaixsl:value-of select="product/sizes/prices/@size_min_net"/></iaixsl:when><iaixsl:when test="sizes/prices/@size_min_net"><iaixsl:value-of select="sizes/prices/@size_min_net"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="price/@size_min_net"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
											<iaixsl:variable name="var_size_max"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/price/@size_max_net"/></iaixsl:when><iaixsl:when test="product and product/sizes/prices/@size_max_net"><iaixsl:value-of select="product/sizes/prices/@size_max_net"/></iaixsl:when><iaixsl:when test="sizes/prices/@size_max_net"><iaixsl:value-of select="sizes/prices/@size_max_net"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="price/@size_max_net"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
											<iaixsl:variable name="var_size_min_maxprice"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/price/@size_min_maxprice_net"/></iaixsl:when><iaixsl:when test="product and product/sizes/prices/@size_min_maxprice_net"><iaixsl:value-of select="product/sizes/prices/@size_min_maxprice_net"/></iaixsl:when><iaixsl:when test="sizes/prices/@size_min_maxprice_net"><iaixsl:value-of select="sizes/prices/@size_min_maxprice_net"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="price/@size_min_maxprice_net"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
											<iaixsl:variable name="var_size_max_maxprice"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/price/@size_max_maxprice_net"/></iaixsl:when><iaixsl:when test="product and product/sizes/prices/@size_max_maxprice_net"><iaixsl:value-of select="product/sizes/prices/@size_max_maxprice_net"/></iaixsl:when><iaixsl:when test="sizes/prices/@size_max_maxprice_net"><iaixsl:value-of select="sizes/prices/@size_max_maxprice_net"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="price/@size_max_maxprice_net"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
											<iaixsl:variable name="var_maxprice"><iaixsl:choose><iaixsl:when test="price/@maxprice_unit_net"><iaixsl:value-of select="price/@maxprice_unit_net"/></iaixsl:when><iaixsl:when test="product and product/price/@maxprice_unit_net"><iaixsl:value-of select="product/price/@maxprice_unit_net"/></iaixsl:when><iaixsl:when test="product and product/price/@maxprice_net"><iaixsl:value-of select="product/price/@maxprice_net"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="price/@maxprice_net"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
											

											<iaixsl:variable name="var_size_min_net_formatted"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/price/@size_min_net_formatted"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="price/@size_min_net_formatted"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
											<iaixsl:variable name="var_size_max_net_formatted"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/price/@size_max_net_formatted"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="price/@size_max_net_formatted"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
											<iaixsl:variable name="var_size_min_net_maxprice_formatted"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/price/@size_min_maxprice_net_formatted"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="price/@size_min_maxprice_net_formatted"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
											<iaixsl:variable name="var_size_max_maxprice_net_formatted"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/price/@size_max_maxprice_net_formatted"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="price/@size_max_maxprice_net_formatted"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
											<iaixsl:variable name="var_points_net"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/price/@points"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="price/@points"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>

											<iaixsl:variable name="var_net_value"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/price/@size_min_net"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="price/@size_min_net"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
											<iaixsl:variable name="var_price_formatted">
												<iaixsl:choose>
													<iaixsl:when test="price/@price_unit_net_formatted and sizes/@unit"><iaixsl:value-of select="price/@price_unit_net_formatted"/><iaixsl:text> / </iaixsl:text><iaixsl:value-of select="sizes/@unit_sellby"/><iaixsl:text> </iaixsl:text><iaixsl:value-of select="sizes/@unit"/></iaixsl:when>
													<iaixsl:when test="product/price/@price_unit_net_formatted and product/sizes/@unit"><iaixsl:value-of select="product/price/@price_unit_net_formatted"/><iaixsl:text> / </iaixsl:text><iaixsl:value-of select="product/sizes/@unit_sellby"/><iaixsl:text> </iaixsl:text><iaixsl:value-of select="product/sizes/@unit"/></iaixsl:when>
													<iaixsl:otherwise><iaixsl:value-of select="$var_size_min_net_formatted"/></iaixsl:otherwise>
												</iaixsl:choose>
											</iaixsl:variable>

											<iaixsl:variable name="var_maxprice_net_formatted">
												<iaixsl:choose>
													<iaixsl:when test="price/@maxprice_unit_net_formatted"><iaixsl:value-of select="price/@maxprice_unit_net_formatted"/></iaixsl:when>
													<iaixsl:when test="product/price/@maxprice_unit_net_formatted"><iaixsl:value-of select="product/price/@maxprice_unit_net_formatted"/></iaixsl:when>
													<iaixsl:when test="product"><iaixsl:value-of select="product/price/@maxprice_net_formatted"/></iaixsl:when>
													<iaixsl:otherwise><iaixsl:value-of select="price/@maxprice_net_formatted"/></iaixsl:otherwise>
												</iaixsl:choose>
											</iaixsl:variable>

											
											
											<iaixsl:variable name="var_omnibus_min"><iaixsl:choose>
												<iaixsl:when test="product and product/price/@min_omnibus_price_net_formatted"><iaixsl:value-of select="product/price/@min_omnibus_price_net_formatted"/></iaixsl:when>
												<iaixsl:when test="price/@min_omnibus_price_net_formatted"><iaixsl:value-of select="price/@min_omnibus_price_net_formatted"/></iaixsl:when>
												<iaixsl:when test="product and product/sizes/size/price">
													<iaixsl:for-each select="product/sizes/size[price/@omnibus_price_net]">
														<iaixsl:sort select="price/@omnibus_price_net" data-type="number"/>
														<iaixsl:if test="position() = 1"><iaixsl:value-of select="price/@omnibus_price_net_formatted"/></iaixsl:if>
													</iaixsl:for-each>
												</iaixsl:when>
												<iaixsl:when test="product">
													<iaixsl:value-of select="product/price/@omnibus_price_net_formatted"/>
												</iaixsl:when>
												<iaixsl:when test="sizes/size/price">
													<iaixsl:for-each select="sizes/size[price/@omnibus_price_net]">
														<iaixsl:sort select="price/@omnibus_price_net" data-type="number"/>
														<iaixsl:if test="position() = 1"><iaixsl:value-of select="price/@omnibus_price_net_formatted"/></iaixsl:if>
													</iaixsl:for-each>
												</iaixsl:when>
												<iaixsl:otherwise>
													<iaixsl:value-of select="price/@omnibus_price_net_formatted"/>
												</iaixsl:otherwise>
											</iaixsl:choose></iaixsl:variable>

											
											<iaixsl:variable name="var_omnibus_max"><iaixsl:choose>
												<iaixsl:when test="product and product/price/@max_omnibus_price_net_formatted"><iaixsl:value-of select="product/price/@max_omnibus_price_net_formatted"/></iaixsl:when>
												<iaixsl:when test="price/@max_omnibus_price_net_formatted"><iaixsl:value-of select="price/@max_omnibus_price_net_formatted"/></iaixsl:when>
												<iaixsl:when test="product and product/sizes/size/price">
													<iaixsl:for-each select="product/sizes/size[price/@omnibus_price_net]">
														<iaixsl:sort select="price/@omnibus_price_net" data-type="number" order="descending"/>
														<iaixsl:if test="position() = 1"><iaixsl:value-of select="price/@omnibus_price_net_formatted"/></iaixsl:if>
													</iaixsl:for-each>
												</iaixsl:when>
												<iaixsl:when test="product">
													<iaixsl:value-of select="product/price/@omnibus_price_net_formatted"/>
												</iaixsl:when>
												<iaixsl:when test="sizes/size/price">
													<iaixsl:for-each select="sizes/size[price/@omnibus_price_net]">
														<iaixsl:sort select="price/@omnibus_price_net" data-type="number" order="descending"/>
														<iaixsl:if test="position() = 1"><iaixsl:value-of select="price/@omnibus_price_net_formatted"/></iaixsl:if>
													</iaixsl:for-each>
												</iaixsl:when>
												<iaixsl:otherwise>
													<iaixsl:value-of select="price/@omnibus_price_net_formatted"/>
												</iaixsl:otherwise>
											</iaixsl:choose></iaixsl:variable>

											
											<iaixsl:variable name="var_omnibus"><iaixsl:if test="$var_omnibus_enabled = 'true'"><iaixsl:choose>
												<iaixsl:when test="$var_omnibus_min != $var_omnibus_max">
													<span><iaixsl:value-of select="$var_omnibus_min"/></span><b><iaixsl:text> - </iaixsl:text></b><span><iaixsl:value-of select="$var_omnibus_max"/></span>
												</iaixsl:when>
												<iaixsl:when test="$var_omnibus_min != ''">
													<iaixsl:value-of select="$var_omnibus_min"/>
												</iaixsl:when>
											</iaixsl:choose></iaixsl:if></iaixsl:variable>

											
											<iaixsl:variable name="var_omnibus_short"><iaixsl:if test="$var_omnibus_enabled = 'true'"><iaixsl:choose>
												<iaixsl:when test="$var_size_min_net_formatted != $var_size_max_net_formatted and $var_size_min_net_maxprice_formatted = $var_omnibus_min and $var_size_max_maxprice_net_formatted = $var_omnibus_max">true</iaixsl:when>
												<iaixsl:when test="$var_maxprice_net_formatted = $var_omnibus">true</iaixsl:when>
											</iaixsl:choose></iaixsl:if></iaixsl:variable>

											
											
											
											<iaixsl:variable name="last_price_change_date"><iaixsl:choose>
												<iaixsl:when test="product and product/sizes/size/price and (count(product/sizes/size) &gt; 1)"><iaixsl:for-each select="product/sizes/size[price/@last_price_change_date]"><iaixsl:if test="@type and price/@last_price_change_date"><iaixsl:value-of select="price/@last_price_change_date"/>;&apos;<iaixsl:value-of select="@type"/>&apos;<iaixsl:if test="not(position() = last())">#separator#</iaixsl:if></iaixsl:if></iaixsl:for-each></iaixsl:when>
												<iaixsl:when test="product"><iaixsl:value-of select="product/price/@last_price_change_date"/></iaixsl:when>
												<iaixsl:when test="sizes/size/price and (count(sizes/size) &gt; 1)"><iaixsl:for-each select="sizes/size[price/@last_price_change_date]"><iaixsl:if test="@type and price/@last_price_change_date"><iaixsl:value-of select="price/@last_price_change_date"/>;&apos;<iaixsl:value-of select="@type"/>&apos;<iaixsl:if test="not(position() = last())">#separator#</iaixsl:if></iaixsl:if></iaixsl:for-each></iaixsl:when>
												<iaixsl:when test="price/@last_price_change_date"><iaixsl:value-of select="price/@last_price_change_date"/></iaixsl:when>
											</iaixsl:choose></iaixsl:variable>

											
											<iaixsl:variable name="var_show_omnibus_short_fallback"><iaixsl:choose>
												<iaixsl:when test="($var_omnibus = '' and $var_omnibus_enabled = 'true' and not($last_price_change_date = ''))">true</iaixsl:when>
											</iaixsl:choose></iaixsl:variable>
											
											

											<div class="product__prices">
												<iaixsl:if test="$var_omnibus != ''"><iaixsl:attribute name="class">product__prices --omnibus<iaixsl:if test="$var_omnibus_short = 'true'"> --omnibus-short</iaixsl:if></iaixsl:attribute></iaixsl:if>

												
												
												<iaixsl:if test="$var_show_omnibus_short_fallback = 'true'">

													
													<iaixsl:attribute name="data-last_price_change_date"><iaixsl:value-of select="$last_price_change_date"/></iaixsl:attribute>

													
													
													<iaixsl:attribute name="data-omnibus-type">hotspot</iaixsl:attribute>

													
													<iaixsl:if test="product and product/@id">
														<iaixsl:attribute name="data-omnibus_product_id"><iaixsl:value-of select="product/@id"/></iaixsl:attribute>
													</iaixsl:if>

													
													<iaixsl:if test="$var_size_min">
														<iaixsl:attribute name="data-size_min"><iaixsl:value-of select="$var_size_min"/></iaixsl:attribute>
													</iaixsl:if>

													
													<iaixsl:if test="$var_size_max">
														<iaixsl:attribute name="data-size_max"><iaixsl:value-of select="$var_size_max"/></iaixsl:attribute>
													</iaixsl:if>

													
													<iaixsl:if test="$var_size_min_maxprice">
														<iaixsl:attribute name="data-size_min_maxprice"><iaixsl:value-of select="$var_size_min_maxprice"/></iaixsl:attribute>
													</iaixsl:if>

													
													<iaixsl:if test="$var_size_max_maxprice">
														<iaixsl:attribute name="data-size_max_maxprice"><iaixsl:value-of select="$var_size_max_maxprice"/></iaixsl:attribute>
													</iaixsl:if>

													
													<iaixsl:if test="$var_maxprice">
														<iaixsl:attribute name="data-maxprice"><iaixsl:value-of select="$var_maxprice"/></iaixsl:attribute>
													</iaixsl:if>
												</iaixsl:if>
												

												<iaixsl:choose>
													
													<iaixsl:when test="$var_size_min_net_formatted != $var_size_max_net_formatted">
														<iaixsl:if test="$var_size_min_net_maxprice_formatted != ''">
															<span class="price --max">
																
																<iaixsl:if test="($var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_label --hidden"><iaixsl:if test="$var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Cena regularna: </span>
																</iaixsl:if>
																
																<del>
																	<span><iaixsl:value-of select="$var_size_min_net_maxprice_formatted"/></span><b><iaixsl:text> - </iaixsl:text></b><span><iaixsl:value-of select="$var_size_max_maxprice_net_formatted"/></span><span class="price_vat"><iaixsl:value-of select="$var_net_prices"/></span>
																</del>
																
																<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short = 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_short --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short = 'true'"><iaixsl:attribute name="class">omnibus_short</iaixsl:attribute></iaixsl:if>Najniższa cena z 30 dni przed obniżką</span>
																</iaixsl:if>
																
															</span>
														</iaixsl:if>
														<strong class="price">
															<iaixsl:value-of select="$var_size_min_net_formatted"/><iaixsl:text> - </iaixsl:text><iaixsl:value-of select="$var_size_max_net_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_net_prices"/></span>
														</strong>
														<iaixsl:if test="$var_points_net != ''">
															<span class="price --points">
																<iaixsl:value-of select="$var_points_net"/><span class="currency"> pkt.</span>
															</span>
														</iaixsl:if>
														
														<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
															<span class="omnibus_price --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_price</iaixsl:attribute></iaixsl:if><span class="omnibus_price__text">Najniższa cena z 30 dni przed obniżką: </span><span class="omnibus_price__value"><iaixsl:value-of select="$var_omnibus"/></span></span>
														</iaixsl:if>
														
													</iaixsl:when>

													
													<iaixsl:when test="(($var_net_value = 0) and $var_points_net = '') or ($var_net_value = 0 and $var_b2b and not($var_b2b = '') and not(/shop/basket/@wholesaler = 'true'))">
														<iaixsl:choose>
															<iaixsl:when test="$var_b2b and not($var_b2b = '')">
																<a class="price --phone" href="/signin.php">
																	<iaixsl:attribute name="title"><iaixsl:value-of select="$var_b2b"/></iaixsl:attribute>
																	<iaixsl:value-of select="$var_b2b"/>
																</a>
															</iaixsl:when>
															<iaixsl:otherwise>
																<a class="price --phone" href="/contact.php">
																	<iaixsl:attribute name="title">Kliknij, by przejść do formularza kontaktu</iaixsl:attribute>
																	Cena na telefon
																</a>
															</iaixsl:otherwise>
														</iaixsl:choose>
													</iaixsl:when>

													
													<iaixsl:otherwise>
														<iaixsl:if test="$var_maxprice_net_formatted != ''">
															<span class="price --max">
																
																<iaixsl:if test="($var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_label --hidden"><iaixsl:if test="$var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Cena regularna: </span>
																</iaixsl:if>
																
																<del>
																	<iaixsl:value-of select="$var_maxprice_net_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_net_prices"/></span>
																</del>
																
																<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short = 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_short --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short = 'true'"><iaixsl:attribute name="class">omnibus_short</iaixsl:attribute></iaixsl:if>Najniższa cena z 30 dni przed obniżką</span>
																</iaixsl:if>
																
															</span>
														</iaixsl:if>
														<strong class="price">
															<iaixsl:value-of select="$var_price_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_net_prices"/></span>
														</strong>
														<iaixsl:if test="$var_points_net != ''">
															<span class="price --points">
																<iaixsl:value-of select="$var_points_net"/><span class="currency"> pkt.</span>
															</span>
														</iaixsl:if>
														
														<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
															<span class="omnibus_price --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_price</iaixsl:attribute></iaixsl:if><span class="omnibus_price__text">Najniższa cena z 30 dni przed obniżką: </span><span class="omnibus_price__value"><iaixsl:value-of select="$var_omnibus"/></span></span>
														</iaixsl:if>
														
													</iaixsl:otherwise>
												</iaixsl:choose>
												<iaixsl:if test="price/@unit_converted_price_net_formatted">
													<small class="s_unit_converted_price"><iaixsl:value-of select="price/@unit_converted_price_net_formatted"/><iaixsl:text> / </iaixsl:text><iaixsl:value-of select="price/@unit_converted_format"/><span class="price_vat"><iaixsl:value-of select="$var_net_prices"/></span></small>
												</iaixsl:if>
											</div>
										</iaixsl:otherwise>
									</iaixsl:choose>

									
									<iaixsl:if test="client/@client or @note or content">
										<div class="product__opinion">

											
											<div class="opinions_element_confirmed">
												<iaixsl:attribute name="class">opinions_element_confirmed --<iaixsl:value-of select="@confirmedByPurchase"/></iaixsl:attribute>
												<strong class="opinions_element_confirmed_text"><iaixsl:choose><iaixsl:when test="@confirmedByPurchase = 'true'">Opinia potwierdzona zakupem</iaixsl:when><iaixsl:otherwise>Opinia niepotwierdzona zakupem</iaixsl:otherwise></iaixsl:choose></strong>
											</div>

											
											<iaixsl:if test="client/@client">
												<div class="product__opinion_client"><iaixsl:value-of disable-output-escaping="yes" select="client/@client"/></div>
											</iaixsl:if>

											
											<iaixsl:if test="@note">
												<div class="note">
													<span>
														<i class="icon-star">
															<iaixsl:if test="@note &gt; 0.5"><iaixsl:attribute name="class">icon-star --active</iaixsl:attribute></iaixsl:if>
														</i>
														<i class="icon-star">
															<iaixsl:if test="@note &gt; 1.5"><iaixsl:attribute name="class">icon-star --active</iaixsl:attribute></iaixsl:if>
														</i>
														<i class="icon-star">
															<iaixsl:if test="@note &gt; 2.5"><iaixsl:attribute name="class">icon-star --active</iaixsl:attribute></iaixsl:if>
														</i>
														<i class="icon-star">
															<iaixsl:if test="@note &gt; 3.5"><iaixsl:attribute name="class">icon-star --active</iaixsl:attribute></iaixsl:if>
														</i>
														<i class="icon-star">
															<iaixsl:if test="@note &gt; 4.5"><iaixsl:attribute name="class">icon-star --active</iaixsl:attribute></iaixsl:if>
														</i>
													</span>
													<small>
														Ocena: <iaixsl:value-of disable-output-escaping="yes" select="@note"/>/5
													</small>
												</div>
											</iaixsl:if>

											
											<iaixsl:if test="content">
												<div class="product__opinion_content"><iaixsl:value-of disable-output-escaping="yes" select="content"/></div>
											</iaixsl:if>
										</div>
									</iaixsl:if>
								</div>
							</iaixsl:for-each>
						</div>
					</iaixsl:when>
					<iaixsl:otherwise>
						<div class="hotspot mb-5 skeleton">
							<span class="headline"/>
							<div class="products d-flex flex-wrap">
								<div class="product col-6 col-sm-3 col-xl-2 py-3 py-3">
									<span class="product__icon d-flex justify-content-center align-items-center"/>
									<span class="product__name"/>
									<div class="product__prices"/>
								</div>
								<div class="product col-6 col-sm-3 col-xl-2 py-3 py-3">
									<span class="product__icon d-flex justify-content-center align-items-center"/>
									<span class="product__name"/>
									<div class="product__prices"/>
								</div>
								<div class="product col-6 col-sm-3 col-xl-2 py-3 py-3">
									<span class="product__icon d-flex justify-content-center align-items-center"/>
									<span class="product__name"/>
									<div class="product__prices"/>
								</div>
								<div class="product col-6 col-sm-3 col-xl-2 py-3 py-3">
									<span class="product__icon d-flex justify-content-center align-items-center"/>
									<span class="product__name"/>
									<div class="product__prices"/>
								</div>
							</div>
						</div>
					</iaixsl:otherwise>
				</iaixsl:choose>
			</section>
		</iaixsl:if>
	
<!-- (menu_buttons, 60dd8e83aed159.07618553.6)-->
	<iaixsl:if test="count(commercial_button/link)">
		<div id="menu_buttons" class="container">
			<div class="row menu_buttons_sub">
				<iaixsl:for-each select="commercial_button/link">
					<div class="menu_button_wrapper">
						<iaixsl:choose>
							<iaixsl:when test="count(/shop/commercial_button/link) = 1">
								<iaixsl:attribute name="class">menu_button_wrapper col-12</iaixsl:attribute>
							</iaixsl:when>
							<iaixsl:when test="count(/shop/commercial_button/link) = 2">
								<iaixsl:attribute name="class">menu_button_wrapper col-6</iaixsl:attribute>
							</iaixsl:when>
							<iaixsl:when test="count(/shop/commercial_button/link) = 3">
								<iaixsl:attribute name="class">menu_button_wrapper col-md-4 col-6</iaixsl:attribute>
							</iaixsl:when>
							<iaixsl:otherwise>
								<iaixsl:attribute name="class">menu_button_wrapper col-md-3 col-6</iaixsl:attribute>
							</iaixsl:otherwise>
						</iaixsl:choose>

					<iaixsl:choose>
						<iaixsl:when test="not(html)">
							<iaixsl:choose>
								<iaixsl:when test="@href">
									<a target="_self">
									<iaixsl:if test="@target"><iaixsl:attribute name="target"><iaixsl:value-of select="@target"/></iaixsl:attribute></iaixsl:if>
										<iaixsl:attribute name="href"><iaixsl:value-of select="@href"/></iaixsl:attribute>
										<iaixsl:if test="text"><iaixsl:attribute name="title"><iaixsl:value-of select="text"/></iaixsl:attribute></iaixsl:if>
										<iaixsl:choose>
											<iaixsl:when test="image">
												<iaixsl:if test="image/@src">
													<img class="b-lazy" src="/gfx/standards/loader.gif?r=1696937716">
														<iaixsl:attribute name="width"><iaixsl:value-of select="image/@width"/></iaixsl:attribute>
														<iaixsl:attribute name="height"><iaixsl:value-of select="image/@height"/></iaixsl:attribute>
														<iaixsl:attribute name="alt"><iaixsl:value-of select="text"/></iaixsl:attribute>
														<iaixsl:attribute name="data-src"><iaixsl:value-of select="image/@src"/></iaixsl:attribute>
													</img>
												</iaixsl:if>
											</iaixsl:when>
											<iaixsl:when test="image_desktop or image_tablet or image_mobile">
												<picture>
													<iaixsl:if test="image_desktop/@src">
														<source>
															<iaixsl:attribute name="width"><iaixsl:value-of select="image_desktop/@width"/></iaixsl:attribute>
															<iaixsl:attribute name="height"><iaixsl:value-of select="image_desktop/@height"/></iaixsl:attribute>
															<iaixsl:attribute name="media">(min-width:979px)</iaixsl:attribute>
															<iaixsl:attribute name="data-srcset"><iaixsl:value-of select="image_desktop/@src"/></iaixsl:attribute>
														</source>
													</iaixsl:if>

													<iaixsl:if test="image_tablet/@src">
														<source>
															<iaixsl:attribute name="width"><iaixsl:value-of select="image_tablet/@width"/></iaixsl:attribute>
															<iaixsl:attribute name="height"><iaixsl:value-of select="image_tablet/@height"/></iaixsl:attribute>
															<iaixsl:attribute name="media">(min-width:757px)</iaixsl:attribute>
															<iaixsl:attribute name="data-srcset"><iaixsl:value-of select="image_tablet/@src"/></iaixsl:attribute>
														</source>
													</iaixsl:if>

													<iaixsl:if test="image_mobile/@src">
														<img class="b-lazy" src="/gfx/standards/loader.gif?r=1696937716">
															<iaixsl:attribute name="width"><iaixsl:value-of select="image_mobile/@width"/></iaixsl:attribute>
															<iaixsl:attribute name="height"><iaixsl:value-of select="image_mobile/@height"/></iaixsl:attribute>
															<iaixsl:attribute name="alt"><iaixsl:value-of select="text"/></iaixsl:attribute>
															<iaixsl:attribute name="data-src"><iaixsl:value-of select="image_mobile/@src"/></iaixsl:attribute>
														</img>
													</iaixsl:if>
												</picture>
											</iaixsl:when>
											<iaixsl:otherwise>
												<iaixsl:value-of disable-output-escaping="yes" select="text"/>
											</iaixsl:otherwise>
										</iaixsl:choose>
									</a>
								</iaixsl:when>
								<iaixsl:otherwise>
									<iaixsl:choose>
										<iaixsl:when test="image">
											<iaixsl:if test="image/@src">
												<img class="b-lazy" src="/gfx/standards/loader.gif?r=1696937716">
													<iaixsl:attribute name="width"><iaixsl:value-of select="image/@width"/></iaixsl:attribute>
													<iaixsl:attribute name="height"><iaixsl:value-of select="image/@height"/></iaixsl:attribute>
													<iaixsl:attribute name="alt"><iaixsl:value-of select="text"/></iaixsl:attribute>
													<iaixsl:attribute name="data-src"><iaixsl:value-of select="image/@src"/></iaixsl:attribute>
												</img>
											</iaixsl:if>
										</iaixsl:when>
										<iaixsl:when test="image_desktop or image_tablet or image_mobile">
											<picture>
												<iaixsl:if test="image_desktop/@src">
													<source>
														<iaixsl:attribute name="width"><iaixsl:value-of select="image_desktop/@width"/></iaixsl:attribute>
														<iaixsl:attribute name="height"><iaixsl:value-of select="image_desktop/@height"/></iaixsl:attribute>
														<iaixsl:attribute name="media">(min-width:979px)</iaixsl:attribute>
														<iaixsl:attribute name="data-srcset"><iaixsl:value-of select="image_desktop/@src"/></iaixsl:attribute>
													</source>
												</iaixsl:if>

												<iaixsl:if test="image_tablet/@src">
													<source>
														<iaixsl:attribute name="width"><iaixsl:value-of select="image_tablet/@width"/></iaixsl:attribute>
														<iaixsl:attribute name="height"><iaixsl:value-of select="image_tablet/@height"/></iaixsl:attribute>
														<iaixsl:attribute name="media">(min-width:757px)</iaixsl:attribute>
														<iaixsl:attribute name="data-srcset"><iaixsl:value-of select="image_tablet/@src"/></iaixsl:attribute>
													</source>
												</iaixsl:if>

												<iaixsl:if test="image_mobile/@src">
													<img class="b-lazy" src="/gfx/standards/loader.gif?r=1696937716">
														<iaixsl:attribute name="width"><iaixsl:value-of select="image_mobile/@width"/></iaixsl:attribute>
														<iaixsl:attribute name="height"><iaixsl:value-of select="image_mobile/@height"/></iaixsl:attribute>
														<iaixsl:attribute name="alt"><iaixsl:value-of select="text"/></iaixsl:attribute>
														<iaixsl:attribute name="data-src"><iaixsl:value-of select="image_mobile/@src"/></iaixsl:attribute>
													</img>
												</iaixsl:if>
											</picture>
										</iaixsl:when>
										<iaixsl:otherwise>
											<iaixsl:value-of disable-output-escaping="yes" select="text"/>
										</iaixsl:otherwise>
									</iaixsl:choose>
							</iaixsl:otherwise>
							</iaixsl:choose>
						</iaixsl:when>
						<iaixsl:otherwise>
							<iaixsl:value-of disable-output-escaping="yes" select="html"/>
						</iaixsl:otherwise>
					</iaixsl:choose>
					</div>
				</iaixsl:for-each>
			</div>
		</div>
	</iaixsl:if>
<!-- (menu_tree4, 60dd8ed25e26f0.75652046.6)-->
	<div id="footer_links">
		<iaixsl:choose>
			<iaixsl:when test="count(navigation4/item) = 1 and (/shop/action/shop_information/@order_link_active='y' or /shop/action/shipping_cost/@order_link_active='y' or /shop/action/payment_methods/@order_link_active='y' or /shop/action/terms/@order_link_active='y' or /shop/action/private_policy/@order_link_active='y' or /shop/action/order_cancel/@order_link_active='y')">
				<iaixsl:attribute name="class">row container<iaixsl:text> </iaixsl:text>four_elements</iaixsl:attribute>
			</iaixsl:when>
			
			<iaixsl:when test="count(navigation4/item) = 2 and (/shop/action/shop_information/@order_link_active='n' and /shop/action/shipping_cost/@order_link_active='n' and /shop/action/payment_methods/@order_link_active='n' and /shop/action/terms/@order_link_active='n' and /shop/action/private_policy/@order_link_active='n' and /shop/action/order_cancel/@order_link_active='n')">
				<iaixsl:attribute name="class">row container<iaixsl:text> </iaixsl:text>four_elements</iaixsl:attribute>
			</iaixsl:when>
			<iaixsl:otherwise>
				<iaixsl:attribute name="class">row container</iaixsl:attribute>
			</iaixsl:otherwise>
		</iaixsl:choose>
		
		<ul id="menu_orders" class="footer_links col-md-4 col-sm-6 col-12">
			<iaixsl:choose>
				<iaixsl:when test="count(navigation4/item) = 1 and (/shop/action/shop_information/@order_link_active='y' or /shop/action/shipping_cost/@order_link_active='y' or /shop/action/payment_methods/@order_link_active='y' or /shop/action/terms/@order_link_active='y' or /shop/action/private_policy/@order_link_active='y' or /shop/action/order_cancel/@order_link_active='y')">
					<iaixsl:attribute name="class">footer_links col-md-4 col-sm-6 col-12 orders_bg</iaixsl:attribute>
				</iaixsl:when>
				
				<iaixsl:when test="count(navigation4/item) = 2 and (/shop/action/shop_information/@order_link_active='n' and /shop/action/shipping_cost/@order_link_active='n' and /shop/action/payment_methods/@order_link_active='n' and /shop/action/terms/@order_link_active='n' and /shop/action/private_policy/@order_link_active='n' and /shop/action/order_cancel/@order_link_active='n')">
					<iaixsl:attribute name="class">footer_links col-md-4 col-sm-6 col-12 orders_bg</iaixsl:attribute>
				</iaixsl:when>
				<iaixsl:when test="count(navigation4/item) = 0">
					<iaixsl:attribute name="class">footer_links col-md-4 col-sm-6 col-12 orders_bg</iaixsl:attribute>
				</iaixsl:when>
			</iaixsl:choose>
			<li>
				<a id="menu_orders_header" class=" footer_links_label">
					<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/clientOrders/@url"/></iaixsl:attribute>
					<iaixsl:attribute name="title"/>
					Zamówienia
				</a>
				<ul class="footer_links_sub">
					<li id="order_status" class="menu_orders_item">
						<i class="icon-battery"/>
						<a>
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/orderOpen/@url"/></iaixsl:attribute>
							Status zamówienia
						</a>
					</li>
					<li id="order_status2" class="menu_orders_item">
						<i class="icon-truck"/>
						<a>
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/orderOpen/@url"/></iaixsl:attribute>
							Śledzenie przesyłki
						</a>
					</li>
					<li id="order_rma" class="menu_orders_item">
						<i class="icon-sad-face"/>
						<a>
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/addRma/@url"/></iaixsl:attribute>
							Chcę zareklamować produkt
						</a>
					</li>
					<li id="order_returns" class="menu_orders_item">
						<i class="icon-refresh-dollar"/>
						<a>
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/addReturn/@url"/></iaixsl:attribute>
							Chcę zwrócić produkt
						</a>
					</li>
					<li id="order_exchange" class="menu_orders_item">
						<i class="icon-return-box"/>
						<a>
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/returnExchangeLink/@url"/></iaixsl:attribute>
							Chcę wymienić produkt
						</a>
					</li>
					<iaixsl:variable name="order_contact_literal">true</iaixsl:variable>
					<iaixsl:if test="$order_contact_literal">
						<li id="order_contact" class="menu_orders_item">
							<i class="icon-phone"/>
							<a>
								<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/contact/link/@url"/></iaixsl:attribute>
								Kontakt
							</a>
						</li>
					</iaixsl:if>
				</ul>
			</li>
		</ul>
		
		<ul id="menu_account" class="footer_links col-md-4 col-sm-6 col-12">
			<li>
				<a id="menu_account_header" class=" footer_links_label">
					<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/login/@url"/></iaixsl:attribute>
					<iaixsl:attribute name="title"/>
					Konto
				</a>
				<ul class="footer_links_sub">
					<iaixsl:choose>
						<iaixsl:when test="basket/@login">
							<li id="account_register" class="menu_orders_item">
								<i class="icon-user"/>
								<a>
									<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/loginEdit/@url"/></iaixsl:attribute>
									Twoje dane
								</a>
							</li>
						</iaixsl:when>
						<iaixsl:otherwise>
							<iaixsl:for-each select="/shop/action/registration_options/wholesale">
								<li id="account_register_wholesale" class="menu_orders_item">
									<i class="icon-wholesaler-register"/>
									<a>
										<iaixsl:attribute name="href"><iaixsl:value-of select="@registration_url"/></iaixsl:attribute>
										Zarejestruj się jako hurtownik
									</a>
								</li>
							</iaixsl:for-each>
							<iaixsl:for-each select="/shop/action/registration_options/retail">
								<li id="account_register_retail" class="menu_orders_item">
									<i class="icon-register-card"/>
									<a>
										<iaixsl:attribute name="href"><iaixsl:value-of select="@registration_url"/></iaixsl:attribute>
										Zarejestruj się
									</a>
								</li>
							</iaixsl:for-each>
						</iaixsl:otherwise>
					</iaixsl:choose>
					<li id="account_basket" class="menu_orders_item">
						<i class="icon-basket"/>
						<a>
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/basket/@url"/></iaixsl:attribute>
							Koszyk
						</a>
					</li>
					<li id="account_observed" class="menu_orders_item">
						<i class="icon-heart-empty"/>
						<a>
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/shoppinglist/@url"/></iaixsl:attribute>
							Listy zakupowe
						</a>
					</li>
												<li id="account_boughts" class="menu_orders_item">
						<i class="icon-menu-lines"/>
						<a>
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/productsBought/@url"/></iaixsl:attribute>
							Lista zakupionych produktów
						</a>
					</li>
					<li id="account_history" class="menu_orders_item">
						<i class="icon-clock"/>
						<a>
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/clientOrders/@url"/></iaixsl:attribute>
							Historia transakcji
						</a>
					</li>
					<li id="account_rebates" class="menu_orders_item">
						<i class="icon-scissors-cut"/>
						<a>
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/clientRebate/@url"/></iaixsl:attribute>
							Moje rabaty
						</a>
					</li>
					<li id="account_newsletter" class="menu_orders_item">
						<i class="icon-envelope-empty"/>
						<a>
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/newsletter/@url"/></iaixsl:attribute>
							Newsletter
						</a>
					</li>
				</ul>
			</li>
		</ul>

		
		<iaixsl:if test="/shop/action/shop_information/@order_link_active='y' or /shop/action/shipping_cost/@order_link_active='y' or /shop/action/payment_methods/@order_link_active='y' or /shop/action/terms/@order_link_active='y' or /shop/action/private_policy/@order_link_active='y' or /shop/action/order_cancel/@order_link_active='y'">

			<ul id="menu_regulations" class="footer_links col-md-4 col-sm-6 col-12">
				<li><span class="footer_links_label">Informacje</span>
					<ul class="footer_links_sub">
						<iaixsl:if test="/shop/action/shop_information/@order_link_active='y' and not(/shop/action/shop_information/@url = '')">
							<li>
								<a href="https://mkfresh.pl/O-nas-cabout-pol-250.html">
									<!-- <iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/shop_information/@url"/></iaixsl:attribute> -->
									O Nas
								</a>
							</li>
						</iaixsl:if>
						<iaixsl:if test="/shop/action/shipping_cost/@order_link_active='y' and not(/shop/action/shipping_cost/@url = '')">
							<li>
								<a>
									<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/shipping_cost/@url"/></iaixsl:attribute>
									Wysyłka
								</a>
							</li>
						</iaixsl:if>
						<iaixsl:if test="/shop/action/payment_methods/@order_link_active='y' and not(/shop/action/payment_methods/@url = '')">
							<li>
								<a>
									<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/payment_methods/@url"/></iaixsl:attribute>
									Płatności
								</a>
							</li>
						</iaixsl:if>
						<iaixsl:if test="/shop/action/terms/@order_link_active='y' and not(/shop/action/terms/@url = '')">
							<li>
								<a>
									<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/terms/@url"/></iaixsl:attribute>
									Regulamin
								</a>
							</li>
						</iaixsl:if>
						<iaixsl:if test="/shop/action/private_policy/@order_link_active='y' and not(/shop/action/private_policy/@url = '')">
							<li>
								<a>
									<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/private_policy/@url"/></iaixsl:attribute>
									Polityka prywatności
								</a>
							</li>
						</iaixsl:if>
						<iaixsl:if test="/shop/action/order_cancel/@order_link_active='y' and not(/shop/action/order_cancel/@url = '')">
							<li>
								<a>
									 
								</a>
							</li>
						</iaixsl:if>
					</ul>
				</li>
			</ul>
		</iaixsl:if>


		
		<iaixsl:if test="navigation4/item">
			<iaixsl:for-each select="navigation4/item">
				<ul class="footer_links col-md-4 col-sm-6 col-12">
					<iaixsl:attribute name="id">links_footer_<iaixsl:value-of select="position()"/></iaixsl:attribute>
					<li>
						<iaixsl:choose>
							<iaixsl:when test="@link">
								<iaixsl:text disable-output-escaping="yes">&lt;a href=&quot;</iaixsl:text>
								<iaixsl:value-of select="@link"/>
								<iaixsl:text disable-output-escaping="yes">&quot; target=&quot;</iaixsl:text><iaixsl:value-of select="@target"/>
								<iaixsl:text disable-output-escaping="yes">&quot; title=&quot;</iaixsl:text><iaixsl:value-of select="@name"/>
								<iaixsl:text disable-output-escaping="yes">&quot; class=&quot;footer_links_label</iaixsl:text>
								<iaixsl:if test="@gfx">
									<iaixsl:text disable-output-escaping="yes"> --gfx</iaixsl:text>
								</iaixsl:if>
								<iaixsl:text disable-output-escaping="yes">&quot; &gt;</iaixsl:text>
							</iaixsl:when>
							<iaixsl:otherwise>
								<iaixsl:text disable-output-escaping="yes">&lt;span </iaixsl:text>
								<iaixsl:text disable-output-escaping="yes"> title=&quot;</iaixsl:text><iaixsl:value-of select="@name"/>
								<iaixsl:text disable-output-escaping="yes">&quot; class=&quot;footer_links_label</iaixsl:text>
								<iaixsl:if test="@gfx">
									<iaixsl:text disable-output-escaping="yes"> --gfx</iaixsl:text>
								</iaixsl:if>
								<iaixsl:text disable-output-escaping="yes">&quot; &gt;</iaixsl:text>
							</iaixsl:otherwise>
						</iaixsl:choose>
						<iaixsl:if test="@gfx">
							<img>
								<iaixsl:attribute name="alt"><iaixsl:value-of disable-output-escaping="yes" select="@name"/></iaixsl:attribute>
								<iaixsl:attribute name="src"><iaixsl:value-of select="@gfx"/></iaixsl:attribute>
								<iaixsl:if test="@gfx_onmouseover">
									<iaixsl:attribute name="data-onmouseover"><iaixsl:value-of disable-output-escaping="yes" select="@gfx_onmouseover"/></iaixsl:attribute>
								</iaixsl:if>
							</img>
							<span class="d-none footer_links_label_name"><iaixsl:value-of disable-output-escaping="yes" select="@name"/></span>
						</iaixsl:if>
						<iaixsl:if test="not(@gfx)">
							<span><iaixsl:value-of disable-output-escaping="yes" select="@name"/></span>
						</iaixsl:if>
						<iaixsl:choose>
							<iaixsl:when test="@link">
								<iaixsl:text disable-output-escaping="yes">&lt;/a&gt;</iaixsl:text>
							</iaixsl:when>
							<iaixsl:otherwise>
								<iaixsl:text disable-output-escaping="yes">&lt;/span&gt;</iaixsl:text>
							</iaixsl:otherwise>
						</iaixsl:choose>
						<iaixsl:if test="item">
							<ul class="footer_links_sub">
								<iaixsl:for-each select="item">

									<li>
										<iaixsl:choose>
											<iaixsl:when test="@link">
												<iaixsl:text disable-output-escaping="yes">&lt;a</iaixsl:text>
												<iaixsl:text disable-output-escaping="yes"> href=&quot;</iaixsl:text>
												<iaixsl:value-of select="@link"/>
												<iaixsl:text disable-output-escaping="yes">&quot; target=&quot;</iaixsl:text><iaixsl:value-of select="@target"/>
												<iaixsl:text disable-output-escaping="yes">&quot; title=&quot;</iaixsl:text><iaixsl:value-of select="@name"/>
												<iaixsl:if test="@gfx">
													<iaixsl:text disable-output-escaping="yes">&quot; class=&quot;--gfx</iaixsl:text>
												</iaixsl:if>
												<iaixsl:text disable-output-escaping="yes">&quot; &gt;</iaixsl:text>
											</iaixsl:when>
											<iaixsl:otherwise>
												<iaixsl:text disable-output-escaping="yes">&lt;span</iaixsl:text>
												<iaixsl:if test="@gfx">
													<iaixsl:text disable-output-escaping="yes"> class=&quot;--gfx</iaixsl:text>
												</iaixsl:if>
												<iaixsl:text disable-output-escaping="yes">&quot; &gt;</iaixsl:text>
											</iaixsl:otherwise>
										</iaixsl:choose>

										<iaixsl:if test="@gfx">
											<img>
												<iaixsl:attribute name="alt"><iaixsl:value-of disable-output-escaping="yes" select="@name"/></iaixsl:attribute>
												<iaixsl:attribute name="src"><iaixsl:value-of select="@gfx"/></iaixsl:attribute>
												<iaixsl:if test="@gfx_onmouseover">
													<iaixsl:attribute name="data-onmouseover"><iaixsl:value-of disable-output-escaping="yes" select="@gfx_onmouseover"/></iaixsl:attribute>
												</iaixsl:if>
											</img>
											<span class="d-none footer_links_item_name"><iaixsl:value-of disable-output-escaping="yes" select="@name"/></span>
										</iaixsl:if>
										<iaixsl:if test="not(@gfx)">
											<span><iaixsl:value-of disable-output-escaping="yes" select="@name"/></span>
										</iaixsl:if>
										<iaixsl:choose>
											<iaixsl:when test="@link">
												<iaixsl:text disable-output-escaping="yes">&lt;/a&gt;</iaixsl:text>
											</iaixsl:when>
											<iaixsl:otherwise>
												<iaixsl:text disable-output-escaping="yes">&lt;/span&gt;</iaixsl:text>
											</iaixsl:otherwise>
										</iaixsl:choose>

									</li>
								</iaixsl:for-each>
							</ul>
						</iaixsl:if>
					</li>
				</ul>
			</iaixsl:for-each>
			<iaixsl:if test="opinions/service or insurances/service">
				<iaixsl:if test="insurances/service">
					<div id="menu_insurances" class="col-md-6 col-12 mb-4">
						<iaixsl:for-each select="insurances/service">
							<div class="menu_insurances_item">
								<iaixsl:value-of disable-output-escaping="yes" select="sealbox_html"/>
							</div>
						</iaixsl:for-each>
					</div>
				</iaixsl:if>
			</iaixsl:if>
		</iaixsl:if>
	</div>
<!-- (menu_contact, 614c5cf21f7b08.81498360.3)-->
	<iaixsl:if test="/shop/iai/@button_src or ((/shop/page/@price_type and not($priceTypeVat = '')) or /shop/page/@customs_duty_required = 'y')">
		<div class="footer_settings container d-md-flex justify-content-md-between align-items-md-center mb-md-4">
			<iaixsl:if test="(/shop/page/@price_type and not($priceTypeVat = '')) or /shop/page/@customs_duty_required = 'y'">
				<div id="price_info" class="footer_settings__price_info price_info mb-4 d-md-flex align-items-md-center mb-md-0">
					<div class="price_info__wrapper">
						<iaixsl:if test="not($priceTypeVat = '')">
							<span class="price_info__text --type">
								<iaixsl:choose>
									<iaixsl:when test="/shop/page/@price_type = 'net'">
										W sklepie prezentujemy ceny netto (bez VAT).
									</iaixsl:when>
									<iaixsl:otherwise>
										W sklepie prezentujemy ceny brutto (z VAT).
									</iaixsl:otherwise>
								</iaixsl:choose>
							</span>
							<iaixsl:if test="/shop/page/@price_type = 'gross' and /shop/page/@tax_region_name">
								<span class="price_info__text --region">Stawki VAT dla konsumentów z kraju: <span class="price_info__region"><iaixsl:value-of select="/shop/page/@tax_region_name"/></span>. </span>
							</iaixsl:if>
						</iaixsl:if>
						<iaixsl:if test="/shop/page/@customs_duty_required = 'y'">
							<span class="price_info__text --customs">Do podanych cen należy doliczyć cło. </span>
						</iaixsl:if>
					</div>
				</div>
			</iaixsl:if>
			<iaixsl:if test="/shop/iai/@button_src">
				<div class="footer_settings__idosell idosell mb-4 d-md-flex align-items-md-center mb-md-0 " id="idosell_logo">
					<iaixsl:choose>
						<iaixsl:when test="/shop/iai/@is_mobile_application = 'yes'">
							<span class="idosell__logo">
								<img class="idosell__img mx-auto d-block b-lazy" src="/gfx/standards/loader.gif?r=1696937716">
									<iaixsl:attribute name="data-src"><iaixsl:value-of select="/shop/iai/@button_src"/></iaixsl:attribute>
									<iaixsl:attribute name="alt"><iaixsl:value-of select="/shop/iai/@button_text"/></iaixsl:attribute>
								</img>
							</span>
						</iaixsl:when>
						<iaixsl:otherwise>
							<a class="idosell__logo --link" target="_blank">
								<iaixsl:if test="/shop/iai/@button_target">
									<iaixsl:attribute name="target"><iaixsl:value-of select="/shop/iai/@button_target"/></iaixsl:attribute>
								</iaixsl:if>
								<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/iai/@button_link"/></iaixsl:attribute>
								<iaixsl:attribute name="title"><iaixsl:value-of select="/shop/iai/@button_text"/></iaixsl:attribute>
								<img class="idosell__img mx-auto d-block b-lazy" src="/gfx/standards/loader.gif?r=1696937716">
									<iaixsl:attribute name="data-src"><iaixsl:value-of select="/shop/iai/@button_src"/></iaixsl:attribute>
									<iaixsl:attribute name="alt"><iaixsl:value-of select="/shop/iai/@button_text"/></iaixsl:attribute>
								</img>
							</a>
						</iaixsl:otherwise>
					</iaixsl:choose>
				</div>
			</iaixsl:if>
		</div>
	</iaixsl:if>

	<iaixsl:variable name="hideAdress"/>
	<div id="menu_contact" class="container d-md-flex align-items-md-center justify-content-md-center">
		<ul>
			<li class="contact_type_header">
				<a href="contact.php">
					<iaixsl:if test="/shop/action/contact/@url">
						<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/contact/@url"/></iaixsl:attribute>
					</iaixsl:if>

					<iaixsl:attribute name="title"/>
					Kontakt
				</a>
			</li>
			<iaixsl:for-each select="/shop/contact/contact_nodes/node[@type='phone'][1]">
				<li class="contact_type_phone">
					<iaixsl:choose>
						<iaixsl:when test="@link">
							<a>
								<iaixsl:attribute name="href"><iaixsl:value-of select="@link"/></iaixsl:attribute>
								<iaixsl:value-of select="@value"/>
							</a>
						</iaixsl:when>
						<iaixsl:otherwise>
							<span><iaixsl:value-of select="@value"/></span>
						</iaixsl:otherwise>
					</iaixsl:choose>
				</li>
			</iaixsl:for-each>

			<iaixsl:for-each select="/shop/contact/contact_nodes/node[@type='text'][1]">
				<li class="contact_type_text">
					<span><iaixsl:value-of select="@value"/></span>
				</li>
			</iaixsl:for-each>

			<iaixsl:for-each select="/shop/contact/contact_nodes/node[@type='mail'][1]">
				<li class="contact_type_mail">
					<iaixsl:choose>
						<iaixsl:when test="@link">
							<a>
								<iaixsl:attribute name="href"><iaixsl:value-of select="@link"/></iaixsl:attribute>
								<iaixsl:value-of select="@value"/>
							</a>
						</iaixsl:when>
						<iaixsl:otherwise>
							<span><iaixsl:value-of select="@value"/></span>
						</iaixsl:otherwise>
					</iaixsl:choose>
				</li>
			</iaixsl:for-each>

			<iaixsl:if test="not($hideAdress)">
				<li class="contact_type_adress">
					<span class="shopshortname">
						<iaixsl:value-of select="contact/owner/@shopshortname"/>
						<span>, </span>
					</span>
					<span class="adress_street">
						<iaixsl:value-of select="contact/adress/@street"/>
						<span>, </span>
					</span>
					<span class="adress_zipcode">
						<iaixsl:value-of select="contact/adress/@zipcode"/>
						<span class="n55931_city"><iaixsl:text> </iaixsl:text><iaixsl:value-of select="contact/adress/@city"/></span>
					</span>
				</li>
			</iaixsl:if>
		</ul>
	</div>

	<iaixsl:if test="/shop/iai/@mobile_link">
		<div class="rwdswicher">
			<a class="rs-link">
				<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/iai/@mobile_link"/></iaixsl:attribute>
			</a>
		</div>
	</iaixsl:if>
<!-- (menu_footer, 60dd8e790bf551.68543995.2)-->
             <iaixsl:if test="/shop/iai/@button_src"/>
        <!-- (bars_bottom, 62e7a60add2960.49498572.2)-->
	<iaixsl:if test="/shop/page/bars/bar[@position = 'bottom']">
		<div class="bars_bottom bars">
			<iaixsl:for-each select="/shop/page/bars/bar[@position = 'bottom']">
				<div class="bars__item">
					<iaixsl:attribute name="id">bar<iaixsl:value-of select="@id"/></iaixsl:attribute>
					<iaixsl:if test="@possibilityToClose = 'true'">
						<iaixsl:attribute name="data-close">true</iaixsl:attribute>
					</iaixsl:if>
					<iaixsl:if test="@fixed = 'true'">
						<iaixsl:attribute name="data-fixed">true</iaixsl:attribute>
					</iaixsl:if>
					<iaixsl:attribute name="style">--background-color:<iaixsl:value-of select="@backgroundColor"/>;--border-color:<iaixsl:value-of select="@borderColor"/>;--font-color:<iaixsl:value-of select="@fontColor"/>;</iaixsl:attribute>
					<div class="bars__wrapper">
						<div class="bars__content"><iaixsl:value-of disable-output-escaping="yes" select="."/></div>
						<iaixsl:if test="@possibilityToClose = 'true'">
							<a href="#closeBar" class="bars__close"/>
						</iaixsl:if>
					</div>
				</div>
			</iaixsl:for-each>
		</div>
	</iaixsl:if>
<!-- (menu_tooltip, 60dd8e886840c9.16767093.4)-->
  <iaixsl:if test="(/shop/iai/@is_mobile_application = 'yes')"> 
    <script>app_shop.vars.isMobileApp = true;</script>
  </iaixsl:if>

<!-- (menu_instalment, 60dd8e8af3fa77.78410167.5)-->
	<script>
		const instalmentData = {
			
			currency: &apos;<iaixsl:value-of select="/shop/currency/@name"/>&apos;,
			
			<iaixsl:choose>
				<iaixsl:when test="/shop/page/@type = 'projector'">
					basketCost: parseFloat(<iaixsl:value-of select="/shop/basket/@cost"/>, 10),
				</iaixsl:when>
				<iaixsl:otherwise>
					basketCost: 0,
				</iaixsl:otherwise>
			</iaixsl:choose>
			
			<iaixsl:choose>
				<iaixsl:when test="/shop/page/@type = 'projector'">
					basketCostNet: parseFloat(<iaixsl:value-of select="/shop/basket/@cost_net"/>, 10),
				</iaixsl:when>
				<iaixsl:otherwise>
					basketCostNet: 0,
				</iaixsl:otherwise>
			</iaixsl:choose>
			
			basketCount: parseInt(<iaixsl:value-of select="/shop/basket/@count"/>, 10),
			
			<iaixsl:choose>
				<iaixsl:when test="/shop/page/@type = 'projector'">
					price: parseFloat(<iaixsl:value-of select="/shop/page/projector/product/price/@value"/>, 10),
					priceNet: parseFloat(<iaixsl:value-of select="/shop/page/projector/product/price/@price_net"/>, 10),
				</iaixsl:when>
				<iaixsl:when test="/shop/page/@type = 'basketedit'">
					price: parseFloat(<iaixsl:value-of select="/shop/page/basket-details/summary/money/@to_pay"/>, 10),
					priceNet: parseFloat(<iaixsl:value-of select="/shop/page/basket-details/summary/money/@total_net"/>, 10),
				</iaixsl:when>
				<iaixsl:otherwise>
					price: 0,
					priceNet: 0,
				</iaixsl:otherwise>
			</iaixsl:choose>
		}
	</script>
	<iaixsl:if test="/shop/page/basket-details/summary/payment/instalment"> </iaixsl:if>
	<iaixsl:if test="/shop/page/basket-details/summary/payment/instalment/@price_type"> </iaixsl:if>
	<iaixsl:if test="/shop/page/projector/product/payment/instalment"> </iaixsl:if>
	<iaixsl:if test="/shop/page/projector/product/payment/instalment/@price_type"> </iaixsl:if>
<!-- (menu_structured_data, 60dd8e7d96d3f6.35754398.10)-->

	<iaixsl:variable name="menu_structured_data_hurt"/>
	<iaixsl:variable name="curr_url"><iaixsl:value-of select="/shop/@currurl"/></iaixsl:variable>
	<iaixsl:variable name="url_length"><iaixsl:value-of select="string-length($curr_url)"/></iaixsl:variable>
	<iaixsl:variable name="productLink"><iaixsl:value-of select="substring-after(/shop/page/projector/product/@link, '/')"/></iaixsl:variable>

	<iaixsl:if test="page/@type = 'navigation' or page/@type = 'search' or page/@type = 'projector' or page/@type = 'main'">
		<script type="application/ld+json">
		{
		&quot;@context&quot;: &quot;http://schema.org&quot;,
		&quot;@type&quot;: &quot;Organization&quot;,
		&quot;url&quot;: &quot;<iaixsl:value-of select="/shop/@currurl"/>&quot;,
		&quot;logo&quot;: &quot;<iaixsl:value-of select="substring($curr_url,1,($url_length - 1))"/><iaixsl:value-of select="/shop/mask/top/link/image/@src"/>&quot;
		}
		</script>
	</iaixsl:if>

	<iaixsl:if test="bc/item and (page/@type = 'navigation' or page/@type = 'search' or page/@type = 'projector')">
		<script type="application/ld+json">
		{
			&quot;@context&quot;: &quot;http://schema.org&quot;,
			&quot;@type&quot;: &quot;BreadcrumbList&quot;,
			&quot;itemListElement&quot;: [<iaixsl:for-each select="bc/item"><iaixsl:if test="not(position() = 1)">,</iaixsl:if>
			{
			&quot;@type&quot;: &quot;ListItem&quot;,
			&quot;position&quot;: <iaixsl:value-of select="position()"/>,
			&quot;item&quot;: &quot;<iaixsl:value-of select="substring($curr_url,1,($url_length - 1))"/><iaixsl:value-of select="@link"/>&quot;,
			&quot;name&quot;: <iaixsl:call-template name="escape-quote-string"><iaixsl:with-param name="str" select="@title"/></iaixsl:call-template>
			}
		</iaixsl:for-each>]
		}
	</script>
	</iaixsl:if>
	<script type="application/ld+json">
		{
		&quot;@context&quot;: &quot;http://schema.org&quot;,
		&quot;@type&quot;: &quot;WebSite&quot;,
		<iaixsl:if test="/shop/@shopname">&quot;name&quot;:&quot;<iaixsl:value-of select="/shop/@shopname"/>&quot;,</iaixsl:if>
		<iaixsl:if test="/shop/@shopshortname">&quot;alternateName&quot;: &quot;<iaixsl:value-of select="/shop/@shopshortname"/>&quot;,</iaixsl:if>
		&quot;url&quot;: &quot;<iaixsl:value-of select="/shop/@currurl"/>&quot;,
		&quot;potentialAction&quot;: {
		&quot;@type&quot;: &quot;SearchAction&quot;,
		&quot;target&quot;: &quot;<iaixsl:value-of select="/shop/@currurl"/>search.php?text={search_term_string}&quot;,
		&quot;query-input&quot;: &quot;required name=search_term_string&quot;
		}
		}
	</script>
	<iaixsl:if test="page/@type = 'projector'">
	<script type="application/ld+json">
		{
		&quot;@context&quot;: &quot;http://schema.org&quot;,
		&quot;@type&quot;: &quot;Product&quot;,
		<iaixsl:if test="page/projector/comments/opinions/opinion">
		&quot;aggregateRating&quot;: {
		&quot;@type&quot;: &quot;AggregateRating&quot;,
		&quot;ratingValue&quot;: &quot;<iaixsl:value-of disable-output-escaping="yes" select="page/projector/comments/@avg"/>&quot;,
		&quot;reviewCount&quot;: &quot;<iaixsl:value-of select="page/projector/comments/@all"/>&quot;
		},
		</iaixsl:if>
		&quot;description&quot;: <iaixsl:call-template name="escape-quote-string"><iaixsl:with-param name="str" select="page/projector/product/cleardescription"/></iaixsl:call-template>,
		&quot;name&quot;: <iaixsl:call-template name="escape-quote-string"><iaixsl:with-param name="str" select="/shop/page/projector/product/name"/></iaixsl:call-template>,
		&quot;productID&quot;: &quot;mpn:<iaixsl:value-of select="page/projector/product/@code"/>&quot;,
		&quot;brand&quot;: {
			&quot;@type&quot;: &quot;Brand&quot;,
			&quot;name&quot;: <iaixsl:call-template name="escape-quote-string"><iaixsl:with-param name="str" select="page/projector/product/firm/@name"/></iaixsl:call-template>
		},
		&quot;image&quot;: &quot;<iaixsl:if test="not(contains(/shop/page/projector/product/enclosures/images/enclosure/@url, 'http'))"><iaixsl:value-of select="substring($curr_url,1,($url_length - 1))"/></iaixsl:if><iaixsl:value-of disable-output-escaping="yes" select="/shop/page/projector/product/enclosures/images/enclosure/@url"/>&quot;
	
		<iaixsl:if test="page/projector/comments/opinions/opinion">,
			&quot;review&quot;: [
			<iaixsl:for-each select="page/projector/comments/opinions/opinion">
			<iaixsl:if test="not(position() = 1)">,</iaixsl:if>
			{
			&quot;@type&quot;: &quot;Review&quot;,
			&quot;author&quot;: {
				&quot;@type&quot;: &quot;Person&quot;,
				&quot;name&quot;: <iaixsl:choose><iaixsl:when test="@client_name and not(@client_name = '')"><iaixsl:call-template name="escape-quote-string"><iaixsl:with-param name="str" select="@client_name"/></iaixsl:call-template></iaixsl:when><iaixsl:otherwise><iaixsl:call-template name="escape-quote-string"><iaixsl:with-param name="str" select="@client"/></iaixsl:call-template></iaixsl:otherwise></iaixsl:choose>
			},
			&quot;description&quot;: <iaixsl:call-template name="escape-quote-string"><iaixsl:with-param name="str" select="."/></iaixsl:call-template>,
			&quot;reviewRating&quot;: {
			&quot;@type&quot;: &quot;Rating&quot;,
			&quot;bestRating&quot;: &quot;5&quot;,
			&quot;ratingValue&quot;: &quot;<iaixsl:value-of select="round(@note)"/>&quot;,
			&quot;worstRating&quot;: &quot;1&quot;
			}
			}
			</iaixsl:for-each>
			]
		</iaixsl:if>
		}

		</script>
	</iaixsl:if>
	<iaixsl:if test="page/@type = 'blog-item'">
		<script type="application/ld+json">
		{
		&quot;@context&quot;: &quot;http://schema.org&quot;,
		&quot;@type&quot;: &quot;NewsArticle&quot;,
		&quot;headline&quot;: &quot;<iaixsl:value-of disable-output-escaping="yes" select="/shop/page/blogitem/title/text()"/>&quot;,
		&quot;mainEntityOfPage&quot;: &quot;<iaixsl:value-of disable-output-escaping="yes" select="/shop/page/blogitem/link/@href"/>&quot;,
		&quot;datePublished&quot;: &quot;<iaixsl:value-of disable-output-escaping="yes" select="/shop/page/blogitem/date/text()"/>&quot;,
		&quot;dateModified&quot;: &quot;<iaixsl:value-of disable-output-escaping="yes" select="/shop/page/blogitem/date/text()"/>&quot;,
		&quot;image&quot;: {
		&quot;@type&quot;:&quot;ImageObject&quot;,
		&quot;url&quot;:&quot;<iaixsl:value-of select="substring($curr_url,1,($url_length - 1))"/><iaixsl:value-of disable-output-escaping="yes" select="/shop/page/blogitem/image/@src"/>&quot;,
		&quot;width&quot;:&quot;<iaixsl:value-of disable-output-escaping="yes" select="/shop/page/blogitem/image/@width"/>&quot;,
		&quot;height&quot;:&quot;<iaixsl:value-of disable-output-escaping="yes" select="/shop/page/blogitem/image/@height"/>&quot;
		},
		&quot;description&quot;: &quot;<iaixsl:value-of disable-output-escaping="yes" select="/shop/page/blogitem/description/text()"/>&quot;,
		&quot;author&quot;:{
		&quot;@type&quot;: &quot;Organization&quot;,
		&quot;name&quot;:&quot;<iaixsl:value-of select="/shop/contact/owner/@shopshortname"/>&quot;
		},
		&quot;publisher&quot;:{
		&quot;@type&quot;: &quot;Organization&quot;,
		&quot;name&quot;: &quot;<iaixsl:value-of select="/shop/contact/owner/@shopshortname"/>&quot;,
		&quot;logo&quot;: {
		&quot;@type&quot;:&quot;ImageObject&quot;,
		&quot;url&quot;:&quot;<iaixsl:value-of select="substring($curr_url,1,($url_length - 1))"/><iaixsl:value-of select="/shop/mask/top/link/image/@src"/>&quot;,
		&quot;width&quot;:&quot;<iaixsl:value-of select="/shop/mask/top/link/image/@width"/>&quot;,
		&quot;height&quot;:&quot;<iaixsl:value-of select="/shop/mask/top/link/image/@height"/>&quot;
		}
		}
		}
		</script>
	</iaixsl:if>

<!-- (menu_notice, 60dd8e88d59467.28079152.4)-->
	<iaixsl:if test="/shop/order_edit/@order_number">
		<iaixsl:if test="/shop/action_alert or /shop/page/projector/product/exchange/@exchange_id or (/shop/page/@type = 'order2') or (/shop/page/@type = 'order-wrappers')">
			<div id="menu_notice" class="menu_notice">
				<h2>Edycja zamówienia</h2>
				<p>
					<iaixsl:choose>
						<iaixsl:when test="/shop/action_alert/@type = 'order_edit'">
							Jesteś w trybie edycji złożonego zamówienia. By zmiany zostały zastosowane musisz przejść przez wszystkie kroki składania zamówienia. Jeżeli nie przejdziesz przez wszystkie kroki składania zamówienia to wcześniej złożone zamówienie nie zostanie zmienione.
						</iaixsl:when>
						<iaixsl:when test="/shop/action_alert/@type = 'order_edit_auction'">
							Jesteś w trybie edycji zamówienia złożonego przez system aukcyjny. Możesz wymienić produkt na inny w tej samej grupie (np. inny kolor lub rozmiar) bądź dodać kolejne (dowolne) produkty w celu powiększenia zamówienia. By zmiany zostały zastosowane musisz przejść przez wszystkie kroki składania zamówienia.
						</iaixsl:when>
						<iaixsl:when test="/shop/action_alert/@type = 'order1'">
							Jesteś w trybie edycji złożonego zamówienia. Zaznaczone są wcześniej wybrane ustawienia wysyłki i płatności. Możesz je zmienić. By zmiany zostały zastosowane musisz przejść przez wszystkie kroki składania zamówienia.
						</iaixsl:when>
						<iaixsl:when test="/shop/page/@type = 'order2'">
							Sprawdź czy zamówienie w obecnej postaci Ci odpowiada. Jeżeli tak, kliknij na przycisk zmień zamówienie by zatwierdzić zmiany w zamówieniu. Jeżeli nie, wróć do koszyka i postępuj jak poprzednio.
						</iaixsl:when>
						<iaixsl:when test="/shop/page/@type = 'order-wrappers'">
							W tym kroku edycji zamówienia możesz wybrać interesujące Cię opakowanie. By zmiany zostały zastosowane musisz przejść przez wszystkie kroki składania zamówienia.
						</iaixsl:when>
						<iaixsl:when test="/shop/action_alert/@type = 'add_basket' or /shop/action_alert/@type = 'change_basket'">
							Zmieniłeś zawartość koszyka, pamiętaj by zastosować te zmiany, musisz ponownie przejść przez wszystkie kroki składania zamówienia.
						</iaixsl:when>
						<iaixsl:when test="/shop/page/projector/product/exchange/@exchange_id">
							Aby wymienić produkt w koszyku, możesz wybrać np. inny kolor lub rozmiar tego samego produktu, a system automatycznie podmieni go z produktem wybranym na aukcji.
						</iaixsl:when>
					</iaixsl:choose>
				</p>
			</div>
		</iaixsl:if>
	</iaixsl:if>

	<iaixsl:if test="/shop/page/@type = 'search' and ((/shop/page/sameday/@couriers_available = 'true' and /shop/page/sameday/@client_localized = 'false') or (/shop/page/nextday/@couriers_available = 'true' and /shop/page/nextday/@client_localized = 'false'))">
			<div id="xpress_toplayer">
					<div class="header_wrapper col-md-12">
							<h2>Lokalizacja</h2>
					</div>
					<div id="xpress_zipcode">
							<p class="col-md-12">Podaj kod pocztowy adresu dostawy</p>
							<div class="form-group">
									<div class="has-feedback has-required col-md-12 col-xs-12">
											<input id="xpress_zipcode" class="form-control validate" name="client_zipcode" data-validation="client_zipcode" data-validation-url="/ajax/client-new.php?validAjax=true" data-serialize="data-region" value="" required="required" type="text" data-region="client_region=1143020003">
													<iaixsl:attribute name="placeholder">Kod pocztowy</iaixsl:attribute>
											</input>
											<span class="form-control-feedback"/>
									</div>
							</div>
							<div class="xpress_button_sub col-md-12"><a id="xpress_zipcode_submit" class="btn --solid">OK</a></div>
							<p class="col-md-12">lub udostępnij położenie, abyśmy mogli określić czy dla tego miejsca dostępna jest dostawa ekspresowa.</p>
							<div class="xpress_button_sub col-md-12"><a id="xpress_zipcode_geolocation" class="btn --solid">Udostępnij położenie</a></div>
					</div>
			</div>
			<div id="xpress_toplayer_error">
					<div class="header_wrapper col-md-12">
							<h2>Lokalizacja</h2>
					</div>
					<div id="xpress_zipcode">
							<p class="col-md-12">Przykro nam, ale nasz ekspresowy kurier nie obsługuje tej okolicy. </p>
							<p class="col-md-12">Twoje zamówienie zostanie dostarczone w standardowym czasie, a kuriera wybierzesz podczas składania zamówienia.</p>
							<div class="xpress_button_sub col-md-12"><a id="express_close_dialog" href="#" class="btn --solid">OK</a></div>
					</div>
			</div>
	</iaixsl:if>
<!-- (menu_dynamically_added_content, 60dd8e7a061521.50730639.3)-->
        
            <script>
                app_shop.vars.request_uri = <iaixsl:call-template name="escape-quote-string"><iaixsl:with-param name="str" select="/shop/page/additional_ajax/@request_uri"/></iaixsl:call-template>
                app_shop.vars.additional_ajax = &apos;<iaixsl:value-of select="/shop/page/additional_ajax/@additional_ajax"/>&apos;
            </script>

            
            <iaixsl:if test="/shop/@menu_dynamically_added_content"> </iaixsl:if>
        <!-- (menu_compare, 6374c9a3a9b958.90333095.2)--><!-- (menu_omnibus, 6458e0851cf079.14035433.4)-->


		</footer>
	</iaixsl:if>
	<iaixsl:variable name="projector_script_bottom">true</iaixsl:variable>
	<iaixsl:if test="/shop/page/@type = 'main' or /shop/page/@type = 'search' or /shop/page/@type = 'place-order' or /shop/page/@type = 'noproduct' or ($projector_script_bottom and /shop/page/@type = 'projector')">
		<iaixsl:choose>
			<iaixsl:when test="/shop/@preview &gt; 0">
				<script id="scriptmain"><iaixsl:attribute name="src">/gfx/<iaixsl:value-of select="language/@id"/>/<iaixsl:value-of select="/shop/@preview"/>/shop.js</iaixsl:attribute></script>
			</iaixsl:when>
			<iaixsl:otherwise>
				<script id="scriptmain"><iaixsl:attribute name="src">/gfx/<iaixsl:value-of select="language/@id"/>/shop.js.gzip?r=1696937761</iaixsl:attribute></script>
			</iaixsl:otherwise>
		</iaixsl:choose>

		
		
	</iaixsl:if>

	
			<script>
		 let a = document.querySelector('#scriptmain').src.split('/');
		 a.splice(-1)
		 const mainGfxUrl = a.join('/') + '/gfx/'
		 a.splice(-1)
		 const mainAssetsUrl = '/data/include/cms/MkFresh/theme/'; //a.join('/') + '/assets/'
			</script>
  
  

	
	<script src="/gfx/pol/envelope.js.gzip?r=1696937760"></script><script src="/gfx/pol/menu_suggested_shop_for_language.js.gzip?r=1696937760"></script><script src="/gfx/pol/menu_compare.js.gzip?r=1696937760"></script><script src="/gfx/pol/menu_omnibus.js.gzip?r=1696937760"></script><script src="/gfx/pol/search_promo_products.js?r=1696937760"></script>
	<!-- <script src="/gfx/pol/menu_filter.js.gzip?r=1696937760"></script> -->

	

	
	<iaixsl:value-of disable-output-escaping="yes" select="php:functionString('additionalContent', 'additional_body_scripts')"/>
  
	<script>app_shop.runApp();</script>
	
	<iaixsl:if test="/shop/page/seolink_with_language_directory"/>

	<iaixsl:if test="(action/set_render/item/@name = 'popup') or not(action/set_render/item)">
		<iaixsl:text disable-output-escaping="yes">&lt;/body&gt;&lt;/html&gt;</iaixsl:text>
	</iaixsl:if>
</iaixsl:template><iaixsl:template match="//image"><iaixsl:if test="@type='swf'"><object type="application/x-shockwave-flash"><iaixsl:attribute name="data"><iaixsl:value-of select="@src"/></iaixsl:attribute><iaixsl:attribute name="data"><iaixsl:value-of select="@src"/></iaixsl:attribute><iaixsl:attribute name="width"><iaixsl:value-of select="@width"/></iaixsl:attribute><iaixsl:attribute name="height"><iaixsl:value-of select="@height"/></iaixsl:attribute><param name="movie"><iaixsl:attribute name="value"><iaixsl:value-of select="@src"/></iaixsl:attribute></param><param name="bgcolor"><iaixsl:attribute name="bgcolor"><iaixsl:value-of select="@bgcolor"/></iaixsl:attribute></param></object></iaixsl:if><iaixsl:if test="not(@type='swf')"><img alt="" class="pic"><iaixsl:attribute name="src"><iaixsl:value-of select="@src"/></iaixsl:attribute><iaixsl:if test="@width &gt; 0"><iaixsl:attribute name="width"><iaixsl:value-of select="@width"/></iaixsl:attribute></iaixsl:if><iaixsl:if test="@height &gt; 0"><iaixsl:attribute name="height"><iaixsl:value-of select="@height"/></iaixsl:attribute></iaixsl:if></img></iaixsl:if></iaixsl:template><iaixsl:template name="escape-backslash"><iaixsl:param name="str" select="."/><iaixsl:choose><iaixsl:when test="contains($str, '\')"><iaixsl:value-of select="concat(substring-before($str, '\'), '\\' )"/><iaixsl:call-template name="escape-backslash"><iaixsl:with-param name="str" select="substring-after($str, '\')"/></iaixsl:call-template></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="$str"/></iaixsl:otherwise></iaixsl:choose></iaixsl:template><iaixsl:template name="escape-quote-string"><iaixsl:param name="str"/><iaixsl:param name="escape_backslash"/><iaixsl:param name="escape" select="'quot'"/><iaixsl:param name="quoting" select="'1'"/><iaixsl:variable name="escape_sign"><iaixsl:choose><iaixsl:when test="$escape=&quot;apos&quot;"><iaixsl:value-of select="&quot;'&quot;"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="string('&quot;')"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable><iaixsl:if test="$quoting"><iaixsl:value-of select="$escape_sign"/></iaixsl:if><iaixsl:choose><iaixsl:when test="contains($str,$escape_sign)"><iaixsl:variable name="before-first-apostrophe" select="substring-before($str,$escape_sign)"/><iaixsl:variable name="after-first-apostrophe" select="substring-after($str,$escape_sign)"/><iaixsl:value-of select="$before-first-apostrophe"/>\<iaixsl:value-of select="$escape_sign"/><iaixsl:text/><iaixsl:call-template name="escape-quote-string"><iaixsl:with-param name="str" select="$after-first-apostrophe"/><iaixsl:with-param name="escape" select="$escape"/><iaixsl:with-param name="quoting" select="0"/></iaixsl:call-template></iaixsl:when><iaixsl:otherwise><iaixsl:choose><iaixsl:when test="not($escape_backslash)"><iaixsl:value-of select="$str"/></iaixsl:when><iaixsl:otherwise><iaixsl:call-template name="escape-backslash"><iaixsl:with-param name="str" select="$str"/></iaixsl:call-template></iaixsl:otherwise></iaixsl:choose></iaixsl:otherwise></iaixsl:choose><iaixsl:if test="$quoting"><iaixsl:value-of select="$escape_sign"/></iaixsl:if></iaixsl:template></iaixsl:stylesheet>