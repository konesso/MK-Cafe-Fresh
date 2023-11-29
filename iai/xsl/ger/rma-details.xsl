<?xml version="1.0" encoding="UTF-8"?>
<iaixsl:stylesheet xmlns:php="http://php.net/xsl" xmlns:iaixsl="http://www.w3.org/1999/XSL/Transform" xmlns:iaielement="http://iai-system.com/ddd" xmlns:fb="http://www.facebook.com/2008/fbml" version="1.0" exclude-result-prefixes="php iaielement fb"><iaixsl:output indent="no" method="html" doctype-system="about:legacy-compat" version="1.0" encoding="UTF-8"/><iaixsl:strip-space elements="table tr td img"/><iaixsl:decimal-format name="yen" NaN="" grouping-separator="," decimal-separator="."/><iaixsl:template match="shop"><!-- (envelope, 60dd8eb7808547.00364708.18)-->
	<iaixsl:variable name="priceTypeVat"><iaixsl:if test="(/shop/basket/@login and not(/shop/client_data/@uses_vat='false') or not(/shop/basket/@login)) and not(/shop/contact/owner/@vat_registered = 'false') and not(/shop/page/@price_type = 'hidden')">true</iaixsl:if></iaixsl:variable>
	<iaixsl:variable name="priceTypeText"><iaixsl:if test="not($priceTypeVat = '')"><iaixsl:choose><iaixsl:when test="/shop/page/@price_type = 'net'"> Netto</iaixsl:when><iaixsl:when test="/shop/page/@price_type = 'gross'"> inkl. MwSt</iaixsl:when></iaixsl:choose></iaixsl:if></iaixsl:variable>
	<iaixsl:variable name="meta_langcode_iso639">de</iaixsl:variable>
	<iaixsl:variable name="html5_layout">1</iaixsl:variable>
	<iaixsl:variable name="asyncJS"/>
	<iaixsl:variable name="themeColor">#0090f6</iaixsl:variable>
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
			
			<link rel="shortcut icon" href="/gfx/ger/favicon.ico" />
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
							<link rel="preload stylesheet" as="style"><iaixsl:attribute name="href">/gfx/<iaixsl:value-of select="language/@id"/>/<iaixsl:value-of select="/shop/@preview"/>/style.css</iaixsl:attribute></link>
						</iaixsl:when>
						<iaixsl:otherwise>
							<link rel="preload stylesheet" as="style"><iaixsl:attribute name="href">/gfx/<iaixsl:value-of select="language/@id"/>/style.css.gzip?r=1696937760</iaixsl:attribute></link>
						</iaixsl:otherwise>
					</iaixsl:choose>
				</iaixsl:when>
				<iaixsl:otherwise>
					<iaixsl:choose>
						<iaixsl:when test="/shop/@preview &gt; 0">
							<link rel="preload stylesheet" as="style"><iaixsl:attribute name="href">/gfx/<iaixsl:value-of select="language/@id"/>/<iaixsl:value-of select="/shop/@preview"/>/style.css</iaixsl:attribute></link>
						</iaixsl:when>
						<iaixsl:otherwise>
							<link rel="preload stylesheet" as="style"><iaixsl:attribute name="href">/gfx/<iaixsl:value-of select="language/@id"/>/style.css.gzip?r=1696937760</iaixsl:attribute></link>
						</iaixsl:otherwise>
					</iaixsl:choose>
				</iaixsl:otherwise>
			</iaixsl:choose>
			<script>var app_shop={urls:{prefix:&apos;data=&quot;/gfx/&apos;.replace(&apos;data=&quot;&apos;, &apos;&apos;)+&apos;<iaixsl:value-of select="language/@id"/>/&apos;,graphql:&apos;/graphql/v1/&apos;},vars:{priceType:&apos;<iaixsl:choose><iaixsl:when test="/shop/page/@price_type = 'hidden'">gross</iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="/shop/page/@price_type"/></iaixsl:otherwise></iaixsl:choose>&apos;,priceTypeVat:<iaixsl:choose><iaixsl:when test="not($priceTypeVat = '')">true</iaixsl:when><iaixsl:otherwise>false</iaixsl:otherwise></iaixsl:choose>,productDeliveryTimeAndAvailabilityWithBasket:false,geoipCountryCode:&apos;<iaixsl:value-of select="/shop/@geoip_country_code"/>&apos;,currency:{id:&apos;<iaixsl:value-of select="/shop/currency/option[@selected='true']/@id"/>&apos;,symbol:&apos;<iaixsl:value-of select="/shop/currency/option[@selected='true']/@symbol"/>&apos;,country:&apos;<iaixsl:value-of select="/shop/currency/option[@selected='true']/@country"/>&apos;,format:&apos;<iaixsl:value-of select="/shop/currency/option[@selected='true']/@currency_format"/>&apos;,beforeValue:<iaixsl:value-of select="/shop/currency/option[@selected='true']/@currency_before_value"/>,space:<iaixsl:value-of select="/shop/currency/option[@selected='true']/@currency_space"/>,decimalSeparator:&apos;<iaixsl:value-of select="/shop/currency/option[@selected='true']/@currency_decimal_separator"/>&apos;,groupingSeparator:&apos;<iaixsl:value-of select="/shop/currency/option[@selected='true']/@currency_grouping_separator"/>&apos;},language:{id:&apos;<iaixsl:value-of select="/shop/language/option[@selected='true']/@id"/>&apos;,symbol:&apos;<iaixsl:value-of select="/shop/language/option[@selected='true']/@name"/>&apos;,name:&apos;<iaixsl:value-of select="/shop/language/@name"/>&apos;},},txt:{priceTypeText:&apos;<iaixsl:value-of select="$priceTypeText"/>&apos;,},fn:{},fnrun:{},files:[],graphql:{}};const getCookieByName=(name)=&gt;{const value=`; ${document.cookie}`;const parts = value.split(`; ${name}=`);if(parts.length === 2) return parts.pop().split(&apos;;&apos;).shift();return false;};if(getCookieByName(&apos;freeeshipping_clicked&apos;)){document.documentElement.classList.remove(&apos;--freeShipping&apos;);}if(getCookieByName(&apos;rabateCode_clicked&apos;)){document.documentElement.classList.remove(&apos;--rabateCode&apos;);}function hideClosedBars(){const closedBarsArray=JSON.parse(localStorage.getItem(&apos;closedBars&apos;))||[];if(closedBarsArray.length){const styleElement=document.createElement(&apos;style&apos;);styleElement.textContent=`${closedBarsArray.map((el)=&gt;`#${el}`).join(&apos;,&apos;)}{display:none !important;}`;document.head.appendChild(styleElement);}}hideClosedBars();</script>
			<iaixsl:variable name="projector_script_bottom">true</iaixsl:variable>
			<iaixsl:if test="not(/shop/page/@type = 'main') and not(/shop/page/@type = 'search') and not(/shop/page/@type = 'place-order') and not(/shop/page/@type = 'noproduct') and not($projector_script_bottom and /shop/page/@type = 'projector')">
				<iaixsl:choose>
					<iaixsl:when test="/shop/@preview &gt; 0">
						<script><iaixsl:attribute name="src">/gfx/<iaixsl:value-of select="language/@id"/>/<iaixsl:value-of select="/shop/@preview"/>/shop.js</iaixsl:attribute></script>
					</iaixsl:when>
					<iaixsl:otherwise>
						<script><iaixsl:attribute name="src">/gfx/<iaixsl:value-of select="language/@id"/>/shop.js.gzip?r=1696937760</iaixsl:attribute></script>
					</iaixsl:otherwise>
				</iaixsl:choose>
				
				
			</iaixsl:if>
			
			
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
	<iaixsl:variable name="valuepricedesc">Preis für Sie</iaixsl:variable>
	<iaixsl:variable name="discountpricedesc">Preisreduzierung</iaixsl:variable>
	<iaixsl:variable name="promopricedesc">Sonderangebot</iaixsl:variable>
	<iaixsl:variable name="detalpricedesc">Einzelhandelspreis</iaixsl:variable>
	<iaixsl:variable name="rebatepricedesc">Rabatt</iaixsl:variable>
	<iaixsl:variable name="nettopricedesc">Nettopreis</iaixsl:variable>
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
			<span class="rabateCode__info">Aktiver Rabattcode: </span>
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
			<span class="freeShipping__info">Gratisversand</span>
			<strong class="freeShipping__val">
				ab 
				<iaixsl:value-of select="/shop/basket/@shippinglimitfree_formatted"/>
			</strong>
			
			<iaixsl:if test="not($disableReturns) and /shop/returns/@freereturnsactive='y'">
				<span class="freeShipping__return">
					Tage
					<iaixsl:value-of select="/shop/returns/@days_to_return"/>
					Tage 
				</span>
			</iaixsl:if>
			
			<a href="" class="freeShipping__close"/>
		</div>
	</iaixsl:if>
<!-- (menu_top, 614c5d30adc291.84869744.4)-->
	<div id="logo" class="d-flex align-items-center">
		<iaixsl:if test="mask/top2/link/image/@src and (mask/top2/link/image/@width&gt;1 or mask/top2/link/image/@height &gt; 1)"><iaixsl:attribute name="data-bg"><iaixsl:value-of select="mask/top2/link/image/@src"/></iaixsl:attribute></iaixsl:if>
		<a>
			<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/mask/top/link/@href"/></iaixsl:attribute>
			<iaixsl:attribute name="target"><iaixsl:value-of select="/shop/mask/top/link/@target"/></iaixsl:attribute>
			<iaixsl:choose>
				<iaixsl:when test="/shop/mask/top/link/image_mobile/@src and /shop/mask/top/link/image_tablet/@src">
					<picture>
						<iaixsl:if test="/shop/mask/top/link/image/@src">
							<source>
								<iaixsl:attribute name="media">(min-width:979px)</iaixsl:attribute>
								<iaixsl:attribute name="srcset"><iaixsl:value-of select="/shop/mask/top/link/image/@src"/></iaixsl:attribute>
								<iaixsl:attribute name="widthset"><iaixsl:value-of select="/shop/mask/top/link/image/@width"/></iaixsl:attribute>
								<iaixsl:attribute name="heightset"><iaixsl:value-of select="/shop/mask/top/link/image/@height"/></iaixsl:attribute>
							</source>
						</iaixsl:if>
						<iaixsl:if test="/shop/mask/top/link/image_tablet/@src">
							<source>
								<iaixsl:attribute name="media">(min-width:757px)</iaixsl:attribute>
								<iaixsl:attribute name="srcset"><iaixsl:value-of select="/shop/mask/top/link/image_tablet/@src"/></iaixsl:attribute>
								<iaixsl:attribute name="widthset"><iaixsl:value-of select="/shop/mask/top/link/image_tablet/@width"/></iaixsl:attribute>
								<iaixsl:attribute name="heightset"><iaixsl:value-of select="/shop/mask/top/link/image_tablet/@height"/></iaixsl:attribute>
							</source>
						</iaixsl:if>
						<img>
							<iaixsl:attribute name="src"><iaixsl:value-of select="/shop/mask/top/link/image_mobile/@src"/></iaixsl:attribute>
							<iaixsl:attribute name="alt"><iaixsl:value-of select="/shop/mask/top/link/description"/></iaixsl:attribute>
							<iaixsl:attribute name="width"><iaixsl:value-of select="/shop/mask/top/link/image_mobile/@width"/></iaixsl:attribute>
							<iaixsl:attribute name="height"><iaixsl:value-of select="/shop/mask/top/link/image_mobile/@height"/></iaixsl:attribute>
						</img>
					</picture>
				</iaixsl:when>
				<iaixsl:otherwise>
					<img>
						<iaixsl:attribute name="src"><iaixsl:value-of select="/shop/mask/top/link/image/@src"/></iaixsl:attribute>
						<iaixsl:attribute name="alt"><iaixsl:value-of select="/shop/mask/top/link/description"/></iaixsl:attribute>
						<iaixsl:attribute name="width"><iaixsl:value-of select="/shop/mask/top/link/image/@width"/></iaixsl:attribute>
						<iaixsl:attribute name="height"><iaixsl:value-of select="/shop/mask/top/link/image/@height"/></iaixsl:attribute>
					</img>
				</iaixsl:otherwise>
			</iaixsl:choose>
		</a>
	</div>
	
	<iaixsl:if test="/shop/mask/@rwd_pc">
		<iaixsl:if test="/shop/mask/@rwd_tablet"/>
		<iaixsl:if test="/shop/mask/@rwd_smartphone"/>
	</iaixsl:if>
<!-- (menu_search, 614c5d2b6852b4.42348920.5)-->
	<form action="/search.php" method="get" id="menu_search" class="menu_search">
		<iaixsl:if test="/shop/action/search/@url"><iaixsl:attribute name="action"><iaixsl:value-of select="/shop/action/search/@url"/></iaixsl:attribute></iaixsl:if>
		<a href="#showSearchForm" class="menu_search__mobile"/>

		<div class="menu_search__block">
			<div class="menu_search__item --input">
				<input class="menu_search__input" type="text" name="text" autocomplete="off">
					<iaixsl:attribute name="placeholder">Geben Sie ein, wonach Sie suchen</iaixsl:attribute>
					<iaixsl:if test="/shop/page/search_params/text">
						<iaixsl:attribute name="placeholder"><iaixsl:value-of select="/shop/page/search_params/text/@value"/></iaixsl:attribute>
					</iaixsl:if>
				</input>
				<button class="menu_search__submit" type="submit">
					
				</button>
			</div>
			<div class="menu_search__item --results search_result"/>
		</div>
	</form>
<!-- (menu_settings, 60dd8ecf1ed667.18940728.9)-->

	<iaixsl:variable name="display_menu_additional">Einloggen</iaixsl:variable>
	<iaixsl:variable name="login_title"/>
	<iaixsl:variable name="account_title"/>
	<iaixsl:variable name="list_title"/>

	<div id="menu_settings" class="align-items-center justify-content-center justify-content-lg-end">
		<iaixsl:if test="(count(/shop/currency/option) &gt; 1) or (count(/shop/language/option) &gt; 1) or (count(/shop/countries/country) &gt; 1)">
			<div class="open_trigger">
				<span>
					<iaixsl:choose>
						<iaixsl:when test="count(/shop/language/option) &gt; 1">
							<iaixsl:attribute name="class">d-none d-md-inline-block flag flag_<iaixsl:value-of select="/shop/language/option[@selected='true']/@id"/></iaixsl:attribute>
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
								Sprache und Währung: 
							</div>
							<div class="menu_settings_content">
								<span class="menu_settings_flag">
									<iaixsl:attribute name="class">menu_settings_flag flag flag_<iaixsl:value-of select="/shop/language/option[@selected='true']/@id"/></iaixsl:attribute>
								</span>
								<strong class="menu_settings_value">
									<span class="menu_settings_language"><iaixsl:value-of select="/shop/language/option[@selected='true']/@name"/></span>
									<span><iaixsl:text> | </iaixsl:text></span>
									<span class="menu_settings_currency"><iaixsl:value-of select="/shop/currency/option[@selected='true']/@symbol"/></span>
								</strong>
							</div>
						</div>
					</iaixsl:if>
					<iaixsl:if test="/shop/countries/country/@selected">
						<div class="menu_settings_inline">
							<div class="menu_settings_header">
								Lieferland: 
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
						<iaixsl:attribute name="action"><iaixsl:value-of select="/shop/action/settings/@url"/></iaixsl:attribute>
					</iaixsl:if>

					<ul>
						
						<iaixsl:if test="count(/shop/language/option) &gt; 1">
							<li>
								<div class="form-group">
									<label class="menu_settings_lang_label">Sprache</label>

									<iaixsl:for-each select="/shop/language/option">
										<div class="radio">
											<label>
												<input type="radio" name="lang">
													<iaixsl:if test="@selected='true'"><iaixsl:attribute name="checked">checked</iaixsl:attribute></iaixsl:if>
													<iaixsl:attribute name="value"><iaixsl:value-of select="@id"/></iaixsl:attribute>
												</input>
												<span>
													<iaixsl:attribute name="class">flag flag_<iaixsl:value-of select="@id"/></iaixsl:attribute>
												</span>
												<span><iaixsl:value-of select="@name"/></span>
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
										<label for="menu_settings_curr">Währung</label>

										<div class="select-after">
											<select class="form-control" name="curr" id="menu_settings_curr">
												<iaixsl:for-each select="/shop/currency/option">
													<option>
														<iaixsl:attribute name="value"><iaixsl:value-of select="@id"/></iaixsl:attribute>
														<iaixsl:choose>
															<iaixsl:when test="@selected='true'">
																<iaixsl:attribute name="selected">selected</iaixsl:attribute>
																<iaixsl:value-of select="@symbol"/>
															</iaixsl:when>
															<iaixsl:otherwise>
																<iaixsl:value-of select="@symbol"/> (1 <iaixsl:value-of select="/shop/currency/option[@selected='true']/@symbol"/> = <iaixsl:value-of select="@rate"/>  <iaixsl:value-of select="@symbol"/>)
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
										<label for="menu_settings_country">Lieferland</label>

										<div class="select-after">
											<select class="form-control" name="country" id="menu_settings_country">
												<iaixsl:for-each select="/shop/countries/country">
													<option>
														<iaixsl:if test="@selected='true'"><iaixsl:attribute name="selected">selected</iaixsl:attribute></iaixsl:if>
														<iaixsl:attribute name="value"><iaixsl:value-of select="@id"/></iaixsl:attribute>
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
								Änderungen übernehmen
							</button>
						</li>
					</ul>
				</form>
			</iaixsl:if>
		</iaixsl:if>

		<iaixsl:if test="$display_menu_additional">
			<div id="menu_additional">
				<a class="account_link">
					<iaixsl:if test="/shop/action/login/@url">
						<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/login/@url"/></iaixsl:attribute>
					</iaixsl:if>
					<iaixsl:choose>
						<iaixsl:when test="basket/@login and not(basket/@login = '')">
							<iaixsl:if test="$account_title != ''"><iaixsl:attribute name="title"><iaixsl:value-of select="$account_title"/></iaixsl:attribute></iaixsl:if>
							Login
						</iaixsl:when>
						<iaixsl:otherwise>
							<iaixsl:if test="$login_title != ''"><iaixsl:attribute name="title"><iaixsl:value-of select="$login_title"/></iaixsl:attribute></iaixsl:if>
							<iaixsl:value-of disable-output-escaping="yes" select="$display_menu_additional"/>
						</iaixsl:otherwise>
					</iaixsl:choose>
				</a>
				<div class="shopping_list_top" data-empty="false">
					<iaixsl:if test="not(/shop/shopping_lists/list)">
						<iaixsl:attribute name="data-empty">true</iaixsl:attribute>
					</iaixsl:if>
					<a href="/shoppinglist.php" class="wishlist_link slt_link"><iaixsl:if test="not(/shop/shopping_lists/list)"><iaixsl:attribute name="class">wishlist_link slt_link --empty</iaixsl:attribute></iaixsl:if><iaixsl:if test="/shop/action/shoppinglist"><iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/shoppinglist/@url"/></iaixsl:attribute></iaixsl:if>Einkaufslisten</a>
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
										<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/shoppinglist/@url"/></iaixsl:attribute>
										<span class="slt_lists__nav_name" data-list_name="true">Einkaufsliste</span>
										<span class="slt_lists__count" data-list_count="true">0</span>
									</a>
								</li>
              </iaixsl:if>
							<iaixsl:for-each select="/shop/shopping_lists/list">
								<li class="slt_lists__nav_item">
									<iaixsl:attribute name="data-list_id"><iaixsl:value-of select="@id"/></iaixsl:attribute>
									<iaixsl:if test="@id = /shop/page/list/@id">
										<iaixsl:attribute name="data-current">true</iaixsl:attribute>
									</iaixsl:if>
									<iaixsl:if test="@shared = 'true'">
										<iaixsl:attribute name="data-shared">true</iaixsl:attribute>
									</iaixsl:if>
									<a class="slt_lists__nav_link">
										<iaixsl:attribute name="href"><iaixsl:value-of select="@link"/></iaixsl:attribute>
										<span class="slt_lists__nav_name" data-list_name="true"><iaixsl:value-of disable-output-escaping="yes" select="@name"/></span>
										<span class="slt_lists__count" data-list_count="true"><iaixsl:value-of select="@count"/></span>
									</a>
								</li>
							</iaixsl:for-each>
						</ul>
						
					</div>
				</div>
			</div>
		</iaixsl:if>
	</div>

	<div class="shopping_list_top_mobile" data-empty="false">
		<iaixsl:if test="not(/shop/shopping_lists/list)">
			<iaixsl:attribute name="data-empty">true</iaixsl:attribute>
		</iaixsl:if>
		<a href="/shoppinglist.php" class="sltm_link"><iaixsl:if test="not(/shop/shopping_lists/list)"><iaixsl:attribute name="class">sltm_link --empty</iaixsl:attribute></iaixsl:if><iaixsl:if test="/shop/action/shoppinglist"><iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/shoppinglist/@url"/></iaixsl:attribute></iaixsl:if></a>
	</div>

	<div class="sl_choose sl_dialog">
		<div class="sl_choose__wrapper sl_dialog__wrapper">
			<div class="sl_choose__item --top sl_dialog_close mb-2">
				<strong class="sl_choose__label">In Einkaufsliste speichern</strong>
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
					<button type="button" class="sl_choose__button --desktop btn --solid">Speichern</button>
				</div>
				<iaixsl:for-each select="/shop/shopping_lists/list">
					<div class="sl_choose__list f-group --radio m-0 d-md-flex align-items-md-center justify-content-md-between">
						<iaixsl:attribute name="data-list_id"><iaixsl:value-of select="@id"/></iaixsl:attribute>
						<iaixsl:if test="@shared = 'true'">
							<iaixsl:attribute name="data-shared">true</iaixsl:attribute>
						</iaixsl:if>
						<iaixsl:if test="@id = /shop/page/list/@id">
							<iaixsl:attribute name="data-current">true</iaixsl:attribute>
						</iaixsl:if>
						<input type="radio" name="add" class="sl_choose__input f-control">
							<iaixsl:attribute name="id">slChooseRadioSelect<iaixsl:value-of select="position()"/></iaixsl:attribute>
							<iaixsl:if test="position() = 1">
								<iaixsl:attribute name="checked">checked</iaixsl:attribute>
							</iaixsl:if>
						</input>
						<label class="sl_choose__group_label f-label py-4">
							<iaixsl:attribute name="for">slChooseRadioSelect<iaixsl:value-of select="position()"/></iaixsl:attribute>
							<span class="sl_choose__sub d-flex align-items-center">
								<span class="sl_choose__name" data-list_name="true"><iaixsl:value-of disable-output-escaping="yes" select="@name"/></span>
								<span class="sl_choose__count" data-list_count="true"><iaixsl:value-of select="@count"/></span>
							</span>
						</label>
						<button type="button" class="sl_choose__button --desktop btn --solid">Speichern</button>
					</div>
				</iaixsl:for-each>
			</div>
			<div class="sl_choose__item --create sl_create mt-4">
				<a href="#new" class="sl_create__link  align-items-center">Eine neue Einkaufsliste erstellen</a>
				<form class="sl_create__form align-items-center">
					<div class="sl_create__group f-group --small mb-0">
						<input type="text" class="sl_create__input f-control" required="required"/>
						<label class="sl_create__label f-label">Neuer Listenname</label>
					</div>
					<button type="submit" class="sl_create__button btn --solid ml-2 ml-md-3">Eine Liste erstellen</button>
				</form>
			</div>
			<div class="sl_choose__item --mobile mt-4 d-flex justify-content-center d-md-none">
				<button class="sl_choose__button --mobile btn --solid --large">Speichern</button>
			</div>
		</div>
	</div>
<!-- (menu_basket, 61e92b2a80d577.36778055.6)-->
			<iaixsl:variable name="basket_title"/>

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
						<label class="topBasket__item --sum">Menge</label>
						<label class="topBasket__item --prices">Preis</label>
					</div>
					<div class="topBasket__block --products"/>
					<iaixsl:if test="/shop/oneclick/payment">
						<div class="topBasket__block --oneclick topBasket_oneclick">
							<iaixsl:attribute name="data-lang"><iaixsl:value-of select="/shop/language/option[@selected ='true']/@id"/></iaixsl:attribute>
							<div class="topBasket_oneclick__label">
								<span class="topBasket_oneclick__text --fast">Schnelles Einkaufen <strong>1-Click</strong></span>
								<span class="topBasket_oneclick__text --registration"> (ohne Registrierung)</span>
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
					<span class="topBasket__name">Versandkosten ab</span>
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
			<iaixsl:if test="wishes/@count"> </iaixsl:if>
		<!-- (menu_categories, 614c5d2d149061.30454363.8)-->
	<iaixsl:variable name="dlmenu_showall">+ Alle anzeigen</iaixsl:variable>
	<iaixsl:variable name="dlmenu_extend">+ Alle anzeigen</iaixsl:variable>
	<iaixsl:variable name="dlmenu_hide">- Ausblenden</iaixsl:variable>
	<iaixsl:variable name="gfx_2lvl_show">1</iaixsl:variable>
	<iaixsl:variable name="gfx_3lvl_show">1</iaixsl:variable>
	<iaixsl:variable name="menu_categories_label"/>
	<iaixsl:variable name="dlmenu_showmore">1</iaixsl:variable>
	<iaixsl:variable name="dlmenu_shownumber">10</iaixsl:variable>
	<iaixsl:variable name="current_item"><iaixsl:value-of select="/shop/navigation/current/@ni"/></iaixsl:variable>

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
					</li>
				</iaixsl:for-each>
			</ul>
		</div>
	</nav>
	<iaixsl:if test="/shop/page/navigation/item/@gfx_active_desktop"> </iaixsl:if>
<!-- (menu_security_policy_top, 648ca66b2a3810.48166522.2)-->
	<div class="order_process_security show_tip">
		<iaixsl:choose>
			<iaixsl:when test="/shop/@trust_level = '1'">
				<iaixsl:attribute name="class">order_process_security show_tip --super</iaixsl:attribute>
				<iaixsl:attribute name="title"><p>Wir benützen das IdoSell Shopsystem, dies erlaubt den Kunden eine übersichtliche Kontrolle über die Bestellung und den Bestellvorgang. <b>Wir schützen Ihre Rechte und Daten.</b> IdoSell unser Geschäft prüft und bestätigt, dass wir die Sendung erklärt in Bezug auf die Nutzung und mögliche Lösungen zu erleichtern Käufe und erhöhen die Sicherheit der Kunden zu senden.</p></iaixsl:attribute>
			</iaixsl:when>
			<iaixsl:otherwise>
				<iaixsl:attribute name="title"><p>Wir nutzen das System <b>IdoSell</b> Kunden Erfüllungsprozess Kontrolle über die Reihenfolge und Ordnung zu geben. <b>Wir schützen Ihre Rechte und Daten.</b>.</p></iaixsl:attribute>
			</iaixsl:otherwise>
		</iaixsl:choose>
		<h5 class="order_process_security__label">
			<iaixsl:choose>
				<iaixsl:when test="/shop/@trust_level = '1'">
					SuperBezpieczne<sup>TM</sup> zakupy
				</iaixsl:when>
				<iaixsl:otherwise>
					Sicher einkaufen
				</iaixsl:otherwise>
			</iaixsl:choose>
		</h5>
		<div class="order_process_security__img">
			<iaixsl:choose>
				<iaixsl:when test="/shop/@trust_level = '1'">
					<img src="/gfx/standards/superfair_light.svg?r=1696937716" alt="SuperFair.Shop badge"/>
				</iaixsl:when>
				<iaixsl:otherwise>
					<img src="/gfx/standards/safe_light.svg?r=1696937716" alt="Idosell security badge"/>
				</iaixsl:otherwise>
			</iaixsl:choose>
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
			<span class="slm_lists__label">Einkaufslisten</span>
			<ul class="slm_lists__nav">
				<li class="slm_lists__nav_item" data-list_skeleton="true" data-list_id="true" data-shared="true">
					<a class="slm_lists__nav_link" data-list_href="true">
						<span class="slm_lists__nav_name" data-list_name="true"/>
						<span class="slm_lists__count" data-list_count="true">0</span>
					</a>
				</li>
				<li class="slm_lists__nav_header">
					<span class="slm_lists__label">Einkaufslisten</span>
				</li>
				<iaixsl:if test="not(/shop/shopping_lists/list)">
					<li class="slm_lists__nav_item --empty">
						<a class="slm_lists__nav_link --empty">
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/shoppinglist/@url"/></iaixsl:attribute>
							<span class="slm_lists__nav_name" data-list_name="true">Einkaufsliste</span>
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
			<a href="#manage" class="slm_lists__manage d-none align-items-center d-md-flex">Verwalten Sie Ihre Listen</a>
		</div>
		<div class="shopping_list_menu__block --bought slm_bought">
			<a class="slm_bought__link d-flex">
				<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/productsBought/@url"/></iaixsl:attribute>
				Liste der gekauften Waren
			</a>
		</div>
		<div class="shopping_list_menu__block --info slm_info">
			<strong class="slm_info__label d-block mb-3">Wie funktioniert eine Einkaufsliste?</strong>
			<ul class="slm_info__list">
				<li class="slm_info__list_item d-flex mb-3">
					Einmal eingeloggt, können Sie beliebig viele Produkte auf Ihre Einkaufsliste setzen und unbegrenzt speichern.
				</li>
				<li class="slm_info__list_item d-flex mb-3">
					Wenn Sie ein Produkt zu Ihrer Einkaufsliste hinzufügen, bedeutet dies nicht automatisch, dass Sie es reserviert haben.
				</li>
				<li class="slm_info__list_item d-flex mb-3">
					Für nicht eingeloggte Kunden wird die Einkaufsliste gespeichert, bis die Sitzung abläuft (ca. 24h).
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
                            Menü
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
                                Einstellungen
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
                            <i class="icon-cog"/>  <span>Login</span>
                            
                        </a>
                        <a class="order_status_link" href="/order-open.php">
                            <iaixsl:attribute name="title">
                                
                                
                            </iaixsl:attribute>
                            <i class="icon-globe"/>  <span>Bestellstatus prüfen</span>
                            
                        </a>
                        <iaixsl:if test="(/shop/basket/@client_id_upc != '') ">
                            <a class="client_card_link" href="##">
                                <iaixsl:attribute name="href">
                                    <iaixsl:value-of disable-output-escaping="yes" select="action/login/@url"/>
                                </iaixsl:attribute>
                                 <i class="icon-barcode"/>  <span>Stammkundenausweis</span>
                            </a>
                        </iaixsl:if>
                        <a class="rabates_link" href="/client-rebate.php">
                            <iaixsl:attribute name="title">
                                
                                
                            </iaixsl:attribute>
                            <span class="font_icon">%</span> <span>Ihre Rabatte</span>
                            
                        </a>
                        <a class="logout_link" href="/login.php?operation=logout">
                            <iaixsl:attribute name="title">
                                
                                
                            </iaixsl:attribute>
                            <i class="icon-off" style="color: #CC0000;"/>  <span>Ausloggen</span>
                            
                        </a>
                        <iaixsl:if test="action/personalized_recommendations/@url">
                            <a class="recommendation_link">
                                <iaixsl:attribute name="href">
                                    <iaixsl:value-of disable-output-escaping="yes" select="action/personalized_recommendations/@url"/>
                                </iaixsl:attribute>

                                <i class="icon-thumbs-up" style="color: #0099D0;"/> <span>Für Sie empfohlen</span>
                                
                            </a>
                        </iaixsl:if>
                    </iaixsl:when>
                    <iaixsl:otherwise>
                        <a class="sign_in_link" href="/login.php">
                            <iaixsl:attribute name="title">
                                
                                
                            </iaixsl:attribute>
                            <i class="icon-user"/>  <span>Einloggen</span>
                            
                        </a>
                        <a class="registration_link" href="/client-new.php?register">
                            <iaixsl:attribute name="title">
                                
                                
                            </iaixsl:attribute>
                            <i class="icon-lock"/>  <span>Registrieren</span>
                            
                        </a>
                        <a class="order_status_link" href="/order-open.php">
                            <iaixsl:attribute name="title">
                                
                                
                            </iaixsl:attribute>
                            <i class="icon-globe"/>  <span>Bestellstatus prüfen</span>
                            
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
        
				</aside>
			</iaixsl:if>
			

			
			<iaixsl:if test="not(action/set_render/item) or (action/set_render/item/@name = 'content')">
				<div id="content" class="span9">
					<iaixsl:choose>
						<iaixsl:when test="page/@type = 'projector'">
							<iaixsl:attribute name="class">col-12</iaixsl:attribute>
						</iaixsl:when>
						<iaixsl:when test="page/@type = 'search'">
							<iaixsl:attribute name="class">col-xl-10 col-md-9 col-12</iaixsl:attribute>
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

        <iaixsl:variable name="rebates_code_used">Dieser Rabatt Code bereits verwendet wurde.</iaixsl:variable>

        <iaixsl:variable name="change_success">Die Änderungen wurden gespeichert.</iaixsl:variable>

        <iaixsl:variable name="change_success_despite_no_change">Das Formular wurde gespeichert, Sie haben jedoch keine Daten geändert. </iaixsl:variable>


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


                                <iaixsl:when test="@type='file_upload_invalid_type'">Die Datei <span class="invalidFileName"><iaixsl:value-of select="@value"/></span>, kann nicht hochgeladen werden, weil dieser Dateityp nicht unterstützt wird.</iaixsl:when>
                                <iaixsl:when test="@type='file_upload_invalid_extension'">Die Datei <span class="invalidFileName"><iaixsl:value-of select="@value"/></span>, kann nicht hochgeladen werden, weil dieser Dateityp nicht unterstützt wird.</iaixsl:when>
                                <iaixsl:when test="@type='file_upload_size_exceeded'">Die Datei <span class="invalidFileName"><iaixsl:value-of select="@value"/></span>, kann nicht hochgeladen werden, weil sie die maximale Größenbeschränkung von 10 MB überschreitet.</iaixsl:when>
                                <iaixsl:when test="@type='file_uploaded_remove_fail'">Beim Hochladen der folgenden Datei ist ein Fehler aufgetreten <span class="invalidFileName"><iaixsl:value-of select="@value"/></span>.</iaixsl:when>


                                <iaixsl:when test="@type='rebates_code_expired'">Der eingegebene Rabattcode ist abgelaufen und ist nicht mehr aktiv.</iaixsl:when>
                                <iaixsl:when test="@type='rebates_code_notbegun'">Der eingegebene Rabattcode ist noch nicht aktiv. Dieses Sonderangebot wurde noch nicht gestartet.</iaixsl:when>

                               <iaixsl:when test="@type='order_minimal_wholesale_blocked'">Der Mindestbestellwert für Großhändler beträgt: <iaixsl:if test="$signbeforeprice = 'true'">
                                            <iaixsl:value-of select="/shop/currency/@name"/>
                                            <iaixsl:value-of select="$signbetweenpricecurrency"/>
                                        </iaixsl:if>
                                        <iaixsl:value-of select="@value"/>
                                        <iaixsl:if test="$signbeforeprice = 'false'">
                                            <iaixsl:value-of select="$signbetweenpricecurrency"/>
                                            <iaixsl:value-of select="/shop/currency/@name"/>
                                        </iaixsl:if>
                                </iaixsl:when>

                            <iaixsl:when test="@type='order_minimal_wholesale_changed'">Obwohl Sie ein Großhändler sind, sehen Sie in der Bestellübersicht nur Einzelhandelspreise. Der Grund dafür ist die Tatsache, dass Sie den Mindestbestellwert für Großhändler nicht erreicht haben. Geben Sie Ihre Bestellung in dieser Form aus, wird es als Einzelhandelsbestellung behandelt.</iaixsl:when>




                                <iaixsl:when test="@type='openid_invalid_authorization'">Berechtigungsfehler.</iaixsl:when>
                                <iaixsl:when test="@type='suggest_sent'">Die Einladung zum Besuch unseres Shops wurde versandt an <iaixsl:value-of select="@value"/>.</iaixsl:when>
                                <iaixsl:when test="@type='search_to_many_products'">Es wurden zu viele Produkte gefunden. Bitte verwenden Sie die Suchmaschine, um die Suchergebnisse einzuschränken.</iaixsl:when>
                                <iaixsl:when test="@type='search_products_not_found'">Das von Ihnen gesuchte Produkt wurde nicht gefunden. Verwenden Sie <a href="/searching.php" title="Kliknij, aby przejść do wyszukiwarki zaawansowanej">Suchmaschine</a>.</iaixsl:when>
                                <iaixsl:when test="@type='search_text_to_short'">Der eingegebene Text ist zu kurz. Bitte geben Sie einen längeren Text ein oder verwenden Sie die Suchmaschine.</iaixsl:when>
                                <iaixsl:when test="@type='login taken'">Der eingegebene Benutzername wurde bereits von einem anderen Kunden registriert. Bitte wählen Sie einen anderen Benutzernamen.</iaixsl:when>
                                <iaixsl:when test="@type='account_not_added'">Es sind Fehler aufgetreten und das Kundenkonto wurde nicht hinzugefügt – bitte versuchen Sie es später noch einmal</iaixsl:when>
                                <iaixsl:when test="@type='exists such account'">Ein Konto mit ähnlichen Angaben existiert bereits in unserem Shop. Wenn Sie sich in unserem Shop schon früher registriert haben und Sie sich an das Passwort nicht mehr erinnern können, benutzen Sie bitte die Option der <a href="/password-recover.php">Passworterinnerung</a></iaixsl:when>
                                <iaixsl:when test="@type='deliv_addr_not_deleted'">Die ausgewählte Lieferadresse kann nicht gelöscht werden.</iaixsl:when>
                                <iaixsl:when test="@type='deliv_addr_not_selected'">Die ausgewählte Lieferadresse kann nicht als Standardadresse verwendet werden.</iaixsl:when>
                                <iaixsl:when test="@type='no login'">Sie haben keinen Benutzernamen eingegeben.</iaixsl:when>
                                <iaixsl:when test="@type='incorect login'">Der von Ihnen ausgewählte Benutzername ist ungültig. Das Login muss mindestens 3 und maximal 40 Zeichen (nur Buchstaben oder Zahlen) enthalten.</iaixsl:when>
                                <iaixsl:when test="@type='no password'">Sie haben kein Passwort eingegeben.</iaixsl:when>
                                <iaixsl:when test="@type='password to short'">Das Passwort muss aus mindestens 6 und nicht mehr als 15 Zeichen bestehen.</iaixsl:when>


                                <iaixsl:when test="@type='password_to_long'">Das Passwort muss aus mindestens 6 und nicht mehr als 15 Zeichen bestehen.</iaixsl:when>


                                <iaixsl:when test="@type='login equals password'">Das Passwort und der Benutzername dürfen nicht identisch sein.</iaixsl:when>
                                <iaixsl:when test="@type='not equal passwords'">Das Passwort und die Passwort-Wiederholung stimmen nicht überein.</iaixsl:when>
                                <iaixsl:when test="@type='no firstname'">Der eingegebene Vorname ist zu kurz.</iaixsl:when>
                                <iaixsl:when test="@type='no name'">Der Vorname oder der Nachname fehlt.</iaixsl:when>
                                <iaixsl:when test="@type='birth_date'">Das Geburtsdatum enthält ungültige Werte oder wurde in einem falschen Format gespeichert.</iaixsl:when>
                                <iaixsl:when test="@type='incorect email'">Die E-Mail-Adresse ist ungültig.</iaixsl:when>
                                <iaixsl:when test="@type='incorect nip'">Achten Sie bei der Eingabe von USt-IdNr. darauf, dass Sie das passende Format für das gewählte Land verwenden, z.B. XXXXXXXXXX für polnische USt-IdNr. oder PLXXXXXXXXXX für USt-IdNr. EU.</iaixsl:when>

                                <iaixsl:when test="@type='no firmname'">Der eingegebene Firmenname ist ungültig.</iaixsl:when>

                                <iaixsl:when test="@type='incorrect region'">Die eingegebene Region ist ungültig.</iaixsl:when>
                                <iaixsl:when test="@type='no city'">Die eingegebene Stadt ist ungültig.</iaixsl:when>
                                <iaixsl:when test="@type='no street'">Die eingegebene Adresse ist ungültig.</iaixsl:when>

                               <iaixsl:when test="@type='no_street_number'">Die eingegebene Adresse ist ungültig.</iaixsl:when>


                                <iaixsl:when test="@type='incorect phone'">Die eingegebene Telefonnummer ist ungültig.</iaixsl:when>
                                <iaixsl:when test="@type='incorect spare phone'">Die eingegebene weitere Telefonnummer ist ungültig.</iaixsl:when>
                                <iaixsl:when test="@type='incorect zipcode'">Die eingegebene Postleitzahl ist ungültig.</iaixsl:when>
                                <iaixsl:when test="@type='double_address_error'">Wenn die Lieferadresse mit der Rechnungsadresse des Käufers identisch ist, markieren Sie bitte die entsprechende Option.</iaixsl:when>
                                <iaixsl:when test="@type='no delivery firstname'">Der eingegebene Vorname des Empfängers ist zu kurz.</iaixsl:when>
                                <iaixsl:when test="@type='no delivery lastname'">Der eingegebene Nachname des Empfängers ist zu kurz.</iaixsl:when>
                                <iaixsl:when test="@type='no delivery city'">Die eingegebene Stadt des Empfängers ist ungültig.</iaixsl:when>
                                <iaixsl:when test="@type='no delivery street'">Die eingegebene Adresse des Empfängers ist ungültig.</iaixsl:when>
                                <iaixsl:when test="@type='incorect delivery region'">Die eingegebene Region des Empfängers ist ungültig.</iaixsl:when>
                                <iaixsl:when test="@type='incorect delivery zipcode'">Die eingegebene Postleitzahl des Empfängers ist ungültig.</iaixsl:when>
                                <iaixsl:when test="@type='order_newpayment_hhtransfer_error'">Beim Zahlen mit der von Ihnen ausgewählten Zahlungsart (Treuepunkte) sind Fehler aufgetreten.</iaixsl:when>
                                <iaixsl:when test="@type='order_newpayment_voucher_error'">Beim Zahlen mit der von Ihnen ausgewählten Zahlungsart (Gutschein) sind Fehler aufgetreten.
                                    <iaixsl:if test="@value='v1'">In diesem Shop ist dieser Gutschein ungültig.</iaixsl:if>
                                    <iaixsl:if test="@value='v2'">Die Gutscheinnummer ist nicht korrekt. Es existiert kein Gutschein mit der eingegebenen ID. Bitte geben Sie die ID erneut ein.</iaixsl:if>
                                    <iaixsl:if test="@value='v3'">Dieser Gutschein wurde gesperrt.</iaixsl:if>
                                    <iaixsl:if test="@value='v4'">Dieser Gutschein wurde bereits eingelöst.</iaixsl:if>
                                    <iaixsl:if test="@value='v5'">Dieser Gutschein ist bereits abgelaufen.</iaixsl:if>
                                    <iaixsl:if test="@value='v7'">Es existiert kein Gutschein mit der angegebenen ID. Bitte geben Sie die ID erneut an.</iaixsl:if>
                                    <iaixsl:if test="@value='v8'">Es wurde keine Gutschein-ID eingegeben.</iaixsl:if>
                                </iaixsl:when>
                                <iaixsl:when test="@type='order_newpayment_incorrect_paymentid'">Es sind Fehler aufgetreten - bitte wählen Sie eine andere Zahlungsart.</iaixsl:when>
                                <iaixsl:when test="@type='order_newpayment_error'">Beim Zahlen sind Fehler aufgetreten. Bitte versuchen Sie gleich noch einmal, die Bestellung zu bezahlen.</iaixsl:when>
                                <iaixsl:when test="@type='order_newpayment_points_error'">Sie haben nicht genug Treuepunkte für diese Bestellung - bitte wählen Sie eine andere Zahlungsart.</iaixsl:when>

                                <iaixsl:when test="@type='filter_products_not_found'">Es wurden keine Produkte gefunden, die die eingestellten Filterkriterien erfüllen. Bitte ändern Sie Ihre Filterparameter.</iaixsl:when>
                                <iaixsl:when test="@type='questionnaire_error'">Ein unbekannter Fehler ist aufgetreten. Der Fragebogen wurde nicht abgeschickt.</iaixsl:when>
                                <iaixsl:when test="@type='questionnaire_sent'">Der Fragebogen wurde abgeschickt. Vielen Dank für Ihre Teilnahme an unserer Umfrage!</iaixsl:when>

                                <iaixsl:when test="@type='orderopen_not_found'">Die von Ihnen eingegebenen Daten sind leider falsch. Bitte versuchen Sie die Telefonnummer bzw. die E-Mail-Adresse zu finden, die Sie bei der Bestellung angegeben haben, oder überprüfen Sie noch einmal die Bestellungs-ID. Sollte es weiterhin nicht möglich sein, Ihre Bestellung über diese Seite zu öffnen, kontaktieren Sie bitte <a href="/contact.php">Kontakt</a>.</iaixsl:when>

                                <iaixsl:when test="@type='order_nonstandard_inactive'">Es tut uns leid. Leider ist derzeit keine Berechnung Ihrer Versandkosten möglich. Wir würden uns aber freuen, wenn Sie sich trotzdem für den Kauf in unserem Shop entscheiden würden. Bitte kontaktieren Sie <a href="/contact.php">unseren Kundenservice</a> , um alle Fragen bezüglich der Annahme und Realisierung Ihrer Bestellung zu klären.</iaixsl:when>
                                <iaixsl:when test="@type='order_nonstandard_inactive_worth'">Es tut uns leid. Leider wird derzeit die Bestellung in dieser Höhe nicht unterstützt. Wir würden uns aber freuen, wenn Sie sich trotzdem für den Kauf in unserem Shop entscheiden würden. Bitte kontaktieren Sie <a href="/contact.php">unseren Kundenservice</a> , um alle Fragen bezüglich der Annahme und Realisierung Ihrer Bestellung zu klären.</iaixsl:when>
                                <iaixsl:when test="@type='order_nonstandard_inactive_weight'">Es tut uns leid. Leider wird derzeit die Bestellung mit diesem Gewicht nicht unterstützt. Wir würden uns aber freuen, wenn Sie sich trotzdem für den Kauf in unserem Shop entscheiden würden. Bitte kontaktieren Sie <a href="/contact.php">unseren Kundenservice</a> , um alle Fragen bezüglich der Annahme und Realisierung Ihrer Bestellung zu klären.</iaixsl:when>
                                

                                <iaixsl:when test="@type='no-auction-info'">
                                    Keine Informationen zur Auktion.
                                </iaixsl:when>
                                <iaixsl:when test="@type='no-auction-account'">
                                    Keine Informationen zum Konto.
                                </iaixsl:when>
                                <iaixsl:when test="@type='no-allegro-item'">
                                    Keine Informationen zum Auktionsgegenstand.
                                </iaixsl:when>
                                <iaixsl:when test="@type='no-buyer-info'">
                                    Keine Informationen zum Käufer.
                                </iaixsl:when>
                                <iaixsl:when test="@type='no-seller-info'">
                                    Keine Informationen zum Verkäufer.
                                </iaixsl:when>
                                <iaixsl:when test="@type='no-shipping'">
                                    Keine Informationen zu den verfügbaren Sendungen.
                                </iaixsl:when>
                                <iaixsl:when test="@type='no-order'">
                                    Keine Informationen zur Bestellung.
                                </iaixsl:when>
                                <iaixsl:when test="@type='less_del'">
                                    Das Entfernen sämtlicher Stückzahl ist nicht möglich. Die Bestellung muss mindestens die Warenstückzahl enthalten, die Sie ersteigert haben. 
                                </iaixsl:when>
                                <iaixsl:when test="@type='cant_del'">
                                    Die Waren lassen sich aus der Bestellung nicht entfernen, da ihre Stückzahl der ersteigerten Stückzahl gleicht ist.
                                </iaixsl:when>
                                <iaixsl:when test="@type='rebates_code_ok'">
                                    Es wurde ein korrekter Rabattcode eingegeben.
                                </iaixsl:when>
                                <iaixsl:when test="@type='rebates_code_undefined'">
                                    Der eingegebene Rabattcode existiert nicht.
                                </iaixsl:when>

                                <iaixsl:when test="@type='rebates_code_used' and $rebates_code_used">
                                     <iaixsl:value-of select="$rebates_code_used"/>
                                </iaixsl:when>

                                <iaixsl:when test="@type='rebates_code_begins'">
                                    Das Sonderangebot für diesen Rabattcode wurde noch nicht gestartet.
                                </iaixsl:when>
                                <iaixsl:when test="@type='rebates_code_expires'">
                                    Das Sonderangebot für diesen Rabattcode wurde bereits beendet.
                                </iaixsl:when>
                                <iaixsl:when test="@type='membershipcard_undefined'">
                                    Die angegebene Kartennummer ist ungültig. Bitte geben Sie sie erneut ein oder <a href="/contact.php">kontaktieren Sie den Shopservice</a>.
                                </iaixsl:when>
                                <iaixsl:when test="@type='membershipcard_expires'">
                                    Das Ablaufdatum der Karte wurde erreicht.
                                </iaixsl:when>
                                <iaixsl:when test="@type='membershipcard_blocked'">
                                    Die Karte wurde gesperrt. <a href="/contact.php">Kontaktieren Sie den Shopservice</a>.
                                </iaixsl:when>
                                <iaixsl:when test="@type='membershipcard_ok'">
                                    Die Karte wurde aktiviert.
                                </iaixsl:when>
                                <iaixsl:when test="@type='client_wholesale_application_error'">
                                    Beim Registrieren der Meldung ist ein Fehler aufgetreten.
                                </iaixsl:when>
                                <iaixsl:when test="@type='client_wholesale_registered'">
                                    Ihr Konto wurde als Großhandelskonto registriert. Sie können keine weiteren Meldungen einreichen.
                                </iaixsl:when>
                                <iaixsl:when test="@type='ordered_empty'">
                                    Ihre Liste der gekauften Produkte ist leer.
                                </iaixsl:when>

                                <iaixsl:when test="@type='shipping_error'">
                                    Ihr Land liegt außerhalb unseres Liefergebiets.
                                </iaixsl:when>
                                <iaixsl:when test="@type='basket_empty'">
                                    Ihr Warenkorb enthält noch keine Produkte.
                                </iaixsl:when>
                                <iaixsl:when test="@type='order_minimum'">
                                    Der Bestellwert ist zu niedrig.
                                    <iaixsl:if test="@value&gt;0">
                                        Der Mindestbestellwert beträgt 
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
                                    Ihr Bestellwert ist zu hoch.
                                    <iaixsl:if test="@value&gt;0">
                                        Der maximale Bestellwert beträgt                <iaixsl:if test="$signbeforeprice = 'true'">
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
                                    Die ausgewählte Lieferungsart erfordert die Angabe der Telefonnummer und der E-Mail-Adresse. Um diese Informationen zu ergänzen, verwenden Sie bitte 
                                    <a>
                                        <iaixsl:attribute name="href"><iaixsl:value-of select="@value"/></iaixsl:attribute>
                                        <iaixsl:attribute name="title">Klicken Sie hier, um die erforderlichen Daten zu ergänzen.</iaixsl:attribute>
                                        das Formular zum Bearbeiten der Kundendaten
                                    </a>
                                    .
                                </iaixsl:when>
                                <iaixsl:when test="@type='noPickupSites'">
                                    Die Abholung der Bestellung an einer Packstation ist zurzeit nicht möglich. Bitte 
                                    <a>
                                        <iaixsl:attribute name="href"><iaixsl:value-of select="@value"/></iaixsl:attribute>
                                        <iaixsl:attribute name="title">Klicken Sie hier, um zur Wahl der Lieferungsarten zurückzukehren.</iaixsl:attribute>
                                        wählen Sie eine andere Lieferungsart.
                                    </a>
                                    .
                                </iaixsl:when>
                                <iaixsl:when test="@type='noPickupStocks'">
                                    Die Selbstabholung der Bestellung ist zurzeit nicht möglich. Bitte 
                                    <a>
                                        <iaixsl:attribute name="href"><iaixsl:value-of select="@value"/></iaixsl:attribute>
                                        <iaixsl:attribute name="title">Klicken Sie hier, um zur Wahl der Lieferungsarten zurückzukehren.</iaixsl:attribute>
                                        wählen Sie eine andere Lieferungsart.
                                    </a>
                                    .
                                </iaixsl:when>

                                <iaixsl:when test="@type='rma_edit_error'">Beim Bearbeiten der Reklamation ist ein Fehler aufgetreten.</iaixsl:when>

                                <iaixsl:when test="@type='onlyHttps'">Die Kreditkartenzahlung kann nur mittels einer verschlüsselten Verbindung durchgeführt werden. Überprüfen Sie, ob die Adresse unseres Shops mit HTTPS anfängt oder kontaktieren Sie unseren Kundenservice.</iaixsl:when>

                                <iaixsl:when test="@type='login_unavailable'">Das Konto kann nicht mit dem anderen Konto verbunden sein, weil es schon mit einem anderen Konto in unserem Shop verbunden ist. Sie können sich von Ihrem Konto abmelden und sich anschließend wieder mit Daten von externen Service anmelden<iaixsl:value-of select="@value"/>.</iaixsl:when>

                                <iaixsl:when test="@type='token_expired'">Der Link für den Zugriff auf Ihre Daten ist jetzt abgelaufen. Sie können sich bei einem anderen Konto anmelden oder einen neuen Link erstellen, indem Sie die Option <a class="password_reminder_signin" href="#signin-form_radio2">Benutzername oder Passwort vergessen.</a></iaixsl:when>

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

                                <iaixsl:when test="@type='affiliate_not_active'">Sie sind nicht eingeloggt oder der Shop besitzt kein aktives Partnerprogramm.</iaixsl:when>
                                <iaixsl:when test="@type='deliv_addr_deleted'">Die ausgewählte Lieferadresse wurde entfernt.</iaixsl:when>
                                <iaixsl:when test="@type='affiliate_off'">Ihr Partnerprogramm wurde noch nicht aktiviert. Wenn Sie das Partnerprogramm aktivieren möchten, kontaktieren Sie bitte unseren Kundenservice.</iaixsl:when>
                                <iaixsl:when test="@type='affiliate_blocked'">Ihr Partnerprogramm wurde gesperrt.</iaixsl:when>
                                <iaixsl:when test="@type='deliv_addr_selected'">Die angegebene Andresse wurde als Standardadresse für Ihre Bestellungen eingestellt.</iaixsl:when>
                                <iaixsl:when test="@type='rebates_code_ok'">Es wurde ein korrekter Rabattcode eingegeben.</iaixsl:when>
                                <iaixsl:when test="@type='client_wholesale_application_added'">Die Meldung wurde registriert.</iaixsl:when>
                                <iaixsl:when test="@type='login_connected'">Das Formular wurde mit den Daten ergänzt, die vom folgenden Service übergeben wurden <iaixsl:value-of select="@value"/>.</iaixsl:when>
                                <iaixsl:when test="@type='login_disconnected'">Das Konto wurde getrennt von <iaixsl:value-of select="@value"/>.</iaixsl:when>
                                <iaixsl:when test="@type='login_unavailable'">Das Konto kann nicht mit dem anderen Konto verbunden sein, weil es schon mit einem anderen Konto in unserem Shop verbunden ist. Sie können sich von Ihrem Konto abmelden und sich anschließend wieder mit Daten von externen Service anmelden<iaixsl:value-of select="@value"/>.</iaixsl:when>
                                <iaixsl:when test="@type='openid_login_canceled'">Login abgebrochen.</iaixsl:when>
                                <iaixsl:when test="@type='client_wholesale_application_changed'">Die Meldung wurde geändert.</iaixsl:when>
                                <iaixsl:when test="@type='wisheslist_empty'">Ihre Einkaufsliste ist leer.</iaixsl:when>
                                <iaixsl:when test="@type='products_requests_empty'">Ihre Liste der gesuchten Produkte ist leer.</iaixsl:when>
                                <iaixsl:when test="@type='products_requests_added'">Die Anmeldung des gesuchten Artikels wurde angenommen. Per E-Mail bekommen Sie eine Antwort, ob die Erweiterung der Warenliste um dieses Artikel möglich ist.</iaixsl:when>
                                <iaixsl:when test="@type='products_requests_removed'">Der Produktvorschlag wurde gelöscht.</iaixsl:when>
                                <iaixsl:when test="@type='rma_add'">Die Reklamation wurde hinzugefügt.</iaixsl:when>
                                <iaixsl:when test="@type='return_add'">Die Anmeldung einer Retoure wurde hinzugefügt.</iaixsl:when>
                                <iaixsl:when test="@type='return_edit'">Änderungen in der Retoure wurden gespeichert</iaixsl:when>
                                <iaixsl:when test="@type='rma_edit'">Die Änderungen in der Reklamation wurden gespeichert.</iaixsl:when>
                                <iaixsl:when test="@type='order_nonstandard_reason'">Es tut uns leid, aber wir haben keine Standard-Lieferkosten für Ihre Bestellung festgelegt. Sie können Ihre Bestellung weiterhin aufgeben, aber wir können Ihnen zu diesem Zeitpunkt keine verbindlichen Lieferkosten nennen. Sie werden von unseren Mitarbeitern nach der Annahme Ihrer Bestellung individuell festgelegt und dann von uns bestätigt. Wenn Ihnen das nicht passt, <a href="/contact.php">kontaktieren unseren Kundenservice</a> für genauere Informationen über die Lieferkosten oder für eine individuelle Bestellung.</iaixsl:when>
                                <iaixsl:when test="@type='order_nonstandard_reason_worth'">Przepraszamy, ale nie zdefiniowaliśmy standardowego kosztu dostawy dla takiej wartości zamówienia. Możesz kontynuować składanie zamówienia, jednak nie zostanie w tej chwili podany wiążący nas koszt dostawy. Zostanie on ustalony indywidualnie przez naszą obsługę po przyjęciu zamówienia, po czym skontaktujemy się z Tobą w celu jego potwierdzenia. Jeżeli takie rozwiązanie nie odpowiada Ci, <a href="/contact.php">kontaktieren unseren Kundenservice</a> für genauere Informationen über die Lieferkosten oder für eine individuelle Bestellung.</iaixsl:when>
                                <iaixsl:when test="@type='order_nonstandard_reason_weight'">Przepraszamy, ale nie zdefiniowaliśmy standardowego kosztu dostawy dla takiej wagi zamówienia. Możesz kontynuować składanie zamówienia, jednak nie zostanie w tej chwili podany wiążący nas koszt dostawy. Zostanie on ustalony indywidualnie przez naszą obsługę po przyjęciu zamówienia, po czym skontaktujemy się z Tobą w celu jego potwierdzenia. Jeżeli takie rozwiązanie nie odpowiada Ci, <a href="/contact.php">kontaktieren unseren Kundenservice</a> für genauere Informationen über die Lieferkosten oder für eine individuelle Bestellung.</iaixsl:when>
                                <iaixsl:when test="@type='mailing_addsuccess'">Die E-Mail-Adresse wurde zur Mailingliste hinzugefügt.</iaixsl:when>
                                <iaixsl:when test="@type='mailing_removesuccess'">Die E-Mail-Adresse wurde aus der Mailingliste entfernt.</iaixsl:when>
                                <iaixsl:when test="@type = 'mailing_nosuchemail'">Die von Ihnen angegebene E-Mail-Adresse wurde in unserer Mailingdatenbank nicht gefunden.</iaixsl:when>
                                <iaixsl:when test="@type = 'mailing_sendingconfirm'">Eine E-mail wurde an Ihre E-mail-Adresse geschickt!.</iaixsl:when>
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
                        Sie bearbeiten die Bestellung Nr <iaixsl:value-of select="/shop/order_edit/@order_number"/>. Ändern Sie Ihre Bestellung oder gehen Sie zurück zur 
                        <a>
                            <iaixsl:attribute name="href"><iaixsl:value-of select="/shop/order_edit/@cancel_lik"/></iaixsl:attribute>
                            Bestellübersicht</a>.
                    </p>
                </div>
            </div>
        </iaixsl:if>


         <iaixsl:if test="/shop/return_edit/@return_id">
            <div class="menu_messages_message" id="menu_messages_warning">
                <div class="menu_messages_message_sub">
                    <p>
                        Sie bearbeiten die Retoure Nummer <iaixsl:value-of select="/shop/return_edit/@return_id"/>. Nehmen Sie die Änderungen in der Retoure vor oder gehen 
                        <a>
                            <iaixsl:attribute name="href"><iaixsl:value-of select="/shop/return_edit/@cancel_link"/></iaixsl:attribute>
                             Sie zurück zur Details der Retoure</a>.
                    </p>
                </div>
            </div>
        </iaixsl:if>

        <!-- (rma_details_cms, 60dd8e782c64b8.20569934.2)-->
    <iaixsl:if test="/shop/page/text/body">

        <div class="returns_cms">
            <div class="returns_cms_sub">
                <iaixsl:value-of disable-output-escaping="yes" select="page/text/body"/>
            </div>    
        </div>
    </iaixsl:if>
    <!-- (rma_details_form, 61f913c73a10f4.46187235.4)-->
        <iaixsl:variable name="nettoPriceRmaDetails"><iaixsl:if test="/shop/page/@price_type = 'net'">true</iaixsl:if></iaixsl:variable>
        <iaixsl:variable name="grossPriceRmaDetails"/>

        <iaixsl:if test="page/@display = 'details'">
            <div class="step_confirmation">


                <iaixsl:if test="/shop/page/details/@status=1">
                    <div class="progress_bar_wrapper pb_step confirmation rma_progress_bar">
                        <div class="_progress_bar"/>
                        <div class="_step _step1">
                            <span>1</span>
                            <p>
                                <i/>
                                <b>auswählen</b> Bestellung
                            </p>
                        </div>
                        <div class="_step _step2">
                            <span>2</span>
                            <p>
                                <i/>
                                <b>auswählen</b> für Zurückgeben
                            </p>
                        </div>
                        <div class="_step _step3">
                            <span>3</span>
                            <p>
                                <i/>
                                <b>auswählen</b> Lieferung
                            </p>
                        </div>
                        <div class="_step _step4">
                            <span>4</span>
                            <p>
                                <i/>
                                <b>auswählen</b> Lieferung des Produkts
                            </p>
                        </div>
                        <div class="_step _step5">
                            <span>5</span>
                            <p>
                                <i/>
                                <b>Wählen Sie, wie und in welcher Form</b> Sie Ihre Beschwerde einreichen möchten
                            </p>
                        </div>
                        <div class="_step _step6">
                            <span>6</span>
                            <p>
                                <i/>
                                <b>bestätigen</b> der Beschwerde
                            </p>
                        </div>
                    </div>
                </iaixsl:if>







                <div id="orderdetails_info" class="rma_orderdetails_info">

                    <h2 class="big_label">
                        <span>Einzelheiten der Beschwerde</span>
                        <span class="order-date">
                            Datum der Erzeugung der Beschwerde: <iaixsl:value-of select="page/details/@datetime"/>
                        </span>
                    </h2>
                    <div id="orderdetails_info_status">
                        <div class="prepaid-icon">
                            <iaixsl:attribute name="class">prepaid-icon status-<iaixsl:value-of select="page/details/@status"/></iaixsl:attribute>

                            <i>
                                <iaixsl:attribute name="class">
                                    <iaixsl:choose>
                                        <iaixsl:when test="page/details/@status=1">
                                            icon-clock
                                        </iaixsl:when>
                                        <iaixsl:when test="page/details/@status=2">
                                            icon-ok
                                        </iaixsl:when>
                                        <iaixsl:when test="page/details/@status=3">
                                            icon-remove
                                        </iaixsl:when>
                                        <iaixsl:when test="page/details/@status=4">
                                            icon-clock
                                        </iaixsl:when>
                                        <iaixsl:when test="page/details/@status=5">
                                            icon-clock
                                        </iaixsl:when>
                                        <iaixsl:when test="page/details/@status=6">
                                            icon-clock
                                        </iaixsl:when>
                                        <iaixsl:when test="page/details/@status=7">
                                            icon-remove
                                        </iaixsl:when>
                                        <iaixsl:when test="page/details/@status=8">
                                            icon-remove
                                        </iaixsl:when>
                                        <iaixsl:when test="page/details/@status=9">
                                            icon-remove
                                        </iaixsl:when>
                                        <iaixsl:when test="page/details/@status=10">
                                            icon-ok
                                        </iaixsl:when>
                                        <iaixsl:when test="page/details/@status=11">
                                            icon-ok
                                        </iaixsl:when>
                                        <iaixsl:when test="page/details/@status=12">
                                            icon-ok
                                        </iaixsl:when>
                                        <iaixsl:when test="page/details/@status=13">
                                            icon-ok
                                        </iaixsl:when>
                                        <iaixsl:when test="page/details/@status=14">
                                            icon-remove
                                        </iaixsl:when>
                                        <iaixsl:when test="page/details/@status=15">
                                            icon-clock
                                        </iaixsl:when>
                                        
                                        <iaixsl:when test="page/details/@status=16">
                                            icon-remove
                                        </iaixsl:when>
                                        <iaixsl:when test="page/details/@status=17">
                                            icon-remove
                                        </iaixsl:when>
                                        <iaixsl:when test="page/details/@status=18">
                                            icon-remove
                                        </iaixsl:when>
                                        <iaixsl:when test="page/details/@status=19">
                                            icon-ok
                                        </iaixsl:when>
                                        <iaixsl:when test="page/details/@status=20">
                                            icon-clock
                                        </iaixsl:when>
                                        <iaixsl:when test="page/details/@status=21">
                                            icon-remove
                                        </iaixsl:when>
                                        <iaixsl:when test="page/details/@status=22">
                                            icon-remove
                                        </iaixsl:when>
                                        <iaixsl:when test="page/details/@status=23">
                                            icon-remove
                                        </iaixsl:when>
                                        <iaixsl:when test="page/details/@status=24">
                                            icon-remove
                                        </iaixsl:when>
                                        <iaixsl:when test="page/details/@status=25">
                                            icon-ok
                                        </iaixsl:when>
                                        <iaixsl:when test="page/details/@status=26">
                                            icon-ok
                                        </iaixsl:when>
                                        <iaixsl:when test="page/details/@status=27">
                                            icon-ok
                                        </iaixsl:when>
                                        <iaixsl:when test="page/details/@status=28">
                                            icon-clock
                                        </iaixsl:when>
                                        <iaixsl:when test="page/details/@status=29">
                                            icon-clock
                                        </iaixsl:when>
                                        <iaixsl:when test="page/details/@status=30">
                                            icon-remove
                                        </iaixsl:when>
                                    </iaixsl:choose>
                                </iaixsl:attribute>
                            </i>
                        </div>

                        <div class="prepaid-status">
													<div class="orderdetails-label">
                            <strong>
                                <iaixsl:choose>
                                    <iaixsl:when test="page/details/@status=1">
                                        Beanstandung wird geprüft 
                                    </iaixsl:when>
                                    <iaixsl:when test="page/details/@status=2">
                                        Beanstandung angenommen
                                    </iaixsl:when>
                                    <iaixsl:when test="page/details/@status=3">
                                        Beanstandung abgelehnt
                                    </iaixsl:when>
                                    <iaixsl:when test="page/details/@status=4">
                                        Beanstandung wird geprüft – zu den Tests weitergeleitet
                                    </iaixsl:when>
                                    <iaixsl:when test="page/details/@status=5">
                                        Beanstandung wird geprüft – das Produkt wurde an den Hersteller geschickt
                                    </iaixsl:when>
                                    <iaixsl:when test="page/details/@status=6">
                                        Beanstandung wird geprüft – Reparatur dauert an
                                    </iaixsl:when>
                                    <iaixsl:when test="page/details/@status=7">
                                        Beanstandung abgelehnt – kein Mangel festgestellt
                                    </iaixsl:when>
                                    <iaixsl:when test="page/details/@status=8">
                                        Beanstandung abgelehnt – Fehler durch falsche Nutzung
                                    </iaixsl:when>
                                    <iaixsl:when test="page/details/@status=9">
                                        Beanstandung abgelehnt – Garantiefrist überschritten
                                    </iaixsl:when>
                                    <iaixsl:when test="page/details/@status=10">
                                        Beanstandung angenommen – Geldrückgabe – zur Zahlung weitergeleitet
                                    </iaixsl:when>
                                    <iaixsl:when test="page/details/@status=11">
                                        Beanstandung angenommen – Geldrückgabe – Auszahlung
                                    </iaixsl:when>
                                    <iaixsl:when test="page/details/@status=12">
                                        Beanstandung angenommen – Umtausch gegen ein neues Produkt
                                    </iaixsl:when>
                                    <iaixsl:when test="page/details/@status=13">
                                        Durch den Kunden stornierte Retoure
                                    </iaixsl:when>
                                    <iaixsl:when test="page/details/@status=14">
                                        Beanstandung nicht erhalten
                                    </iaixsl:when>
                                    <iaixsl:when test="page/details/@status=15">
                                        Beschwerde erstellt - Antwort des Geschäfts abwarten
                                    </iaixsl:when>
                                    
                                    <iaixsl:when test="page/details/@status=16">
                                        Erneuter Versand der Bestellung unterlassen 
                                    </iaixsl:when>
                                    <iaixsl:when test="page/details/@status=17">
                                        Beanstandung storniert
                                    </iaixsl:when>
                                    <iaixsl:when test="page/details/@status=18">
                                        Beanstandung vom Kunden storniert
                                    </iaixsl:when>
                                    <iaixsl:when test="page/details/@status=19">
                                        Beschwerde vorläufig geprüft - wir warten auf die Zusendung der reklamierten Produkte
                                    </iaixsl:when>
                                    <iaixsl:when test="page/details/@status=20">
                                        Beanstandung nicht bearbeitet
                                    </iaixsl:when>
                                    <iaixsl:when test="page/details/@status=21">
                                        Beanstandung abgelehnt
                                    </iaixsl:when>
                                    <iaixsl:when test="page/details/@status=22">
                                        Beanstandung abgelehnt – kein Mangel festgestellt
                                    </iaixsl:when>
                                    <iaixsl:when test="page/details/@status=23">
                                        Beanstandung abgelehnt – Garantiefrist überschritten
                                    </iaixsl:when>
                                    <iaixsl:when test="page/details/@status=24">
                                        Die durch schlechte Bedienung verursacht Defekt
                                    </iaixsl:when>
                                    <iaixsl:when test="page/details/@status=25">
                                        Beanstandung angenommen – Rücksendung wurde an den Kurierdienst geschickt
                                    </iaixsl:when>
                                    <iaixsl:when test="page/details/@status=26">
                                        Beanstandung angenommen – neue Ware wurde gesendet, ohne auf die ursprüngliche Ware zu warten
                                    </iaixsl:when>
                                    <iaixsl:when test="page/details/@status=27">
                                        Beanstandung angenommen – Änderung der Empfängerangaben auf dem Verkaufsdokument
                                    </iaixsl:when>
                                    <iaixsl:when test="page/details/@status=28">
                                        Beanstandung wird bearbeitet – Reparatur abgeschlossen
                                    </iaixsl:when>
                                    <iaixsl:when test="page/details/@status=29">
                                        Beanstandung wird bearbeitet – zusätzliche Kundeninformationen erforderlich
                                    </iaixsl:when>
                                    <iaixsl:when test="page/details/@status=30">
                                        Beanstandung abgelehnt – Rücksendung an den Kunden geschickt
                                    </iaixsl:when>
                                </iaixsl:choose>
                            </strong>
														<iaixsl:if test="not(page/details/@status_description = '')">
															<div class="moreInfo orderdetails_info__more d-none d-md-flex">
																	<a href="#showDescription" class="moreInfo__show"><i class="icon-question"/></a>
																	<div style="display:none;" class="moreInfo__desc"><iaixsl:value-of disable-output-escaping="yes" select="page/details/@status_description"/></div>
															</div>
													</iaixsl:if>
							</div>
                            <div class="orderdetails_info__dates">
                                <span>der Beschwerden ID: <iaixsl:value-of select="page/details/@id"/></span>
                                <iaixsl:if test="not(page/details/@status_description = '')">
                                <a href="#showDescription" class="moreInfo__show d-md-none">Mehr</a>
                                    <div class="moreInfo orderdetails_info__more d-md-none">
                                        <div style="display:none;" class="moreInfo__desc"><iaixsl:value-of disable-output-escaping="yes" select="page/details/@status_description"/></div>
                                    </div>
                                </iaixsl:if>
                            </div>
                        </div>

                    </div>
                </div>
                <iaixsl:if test="/shop/page/documentlink/@url">
                    <div class="orderdetails_documentlink">
                        <h2 class="orderdetails_label">
                            <span>Drucken Beschwerde</span>
                        </h2>
                        <div class="documentlink_image row">
                            <div class="document_img_1 col-12 col-sm-4">
                                <img src="/gfx/standards/documentlink_1.png?r=1696937716" alt=""/>
                                <span>Drucken Mitteilung der Beschwerde und Etiketten</span>
                            </div>
                            <div class="document_img_2 col-12 col-sm-4">
                                <img src="/gfx/standards/documentlink_2.png?r=1696937716" alt=""/>
                                <span>Bereiten Sie das Paket. Registriert Beschwerdeformular.</span>
                            </div>
                            <div class="document_img_3 col-12 col-sm-4">
                                <img src="/gfx/standards/documentlink_3.png?r=1696937716" alt=""/>
                                <span>Schicken Sie das Paket mit den reklamierten Produkten.</span>
                            </div>
                        </div>
                        <iaixsl:if test="/shop/page/documentlink/@url">
                            <div class="return_wrapper2">
                                <a class="btn --solid --large" target="blank">
                                    <iaixsl:attribute name="href"><iaixsl:value-of select="/shop/page/documentlink/@url"/></iaixsl:attribute>
                                    Retourenantrag Nicht bearbeitete Retoure
                                    
                                </a>
                            </div>
                        </iaixsl:if>
                    </div>
                </iaixsl:if>

                <iaixsl:if test="/shop/page/rma_questions">
                    <div class="rma_questions">
                        <h2 class="orderdetails_label">
                            <span>Korrespondenz über die Beschwerde</span>
                        </h2>
                        <iaixsl:if test="/shop/page/rma_questions/rma_question">
                        <ul class="rma_questions">
                            <iaixsl:for-each select="/shop/page/rma_questions/rma_question">
                                <li class="rma_question">
                                    <div class="rma_client">
                                        <strong><iaixsl:value-of select="@client"/></strong>
                                        <span class="rma_date"><iaixsl:value-of select="@date"/> <span class="rma_hour"><iaixsl:value-of select="@hour"/></span></span>
                                    </div>
                                    <div class="rma_description">
                                        <iaixsl:value-of select="description"/>
                                    </div>
                                    <iaixsl:if test="added_files/file">
                                        <div class="rma_af_files">
                                            <ol>
                                                <iaixsl:for-each select="added_files/file">
                                                    <li>
                                                        <a class="previewFile" href="#previewFile">
                                                            <iaixsl:choose>
                                                                <iaixsl:when test="@preview = 'true'">
                                                                    <iaixsl:attribute name="rel"><iaixsl:value-of select="@path"/></iaixsl:attribute>
                                                                </iaixsl:when>
                                                                <iaixsl:otherwise>
                                                                    <iaixsl:attribute name="href"><iaixsl:value-of select="@path"/></iaixsl:attribute>
                                                                    <iaixsl:attribute name="target">_blank</iaixsl:attribute>
                                                                </iaixsl:otherwise>
                                                            </iaixsl:choose>
                                                            <iaixsl:value-of select="@file"/>
                                                        </a>

                                                    </li>
                                                </iaixsl:for-each>
                                            </ol>
                                        </div>
                                    </iaixsl:if>
                                </li>
                            </iaixsl:for-each>
                        </ul>
                     </iaixsl:if>

                        <form class="rma_added_files" method="post" enctype="multipart/form-data">

                            <div class="rma_af_input">

                                <div class="form-group">
                                    <label for="comment" class="control-label">
                                        <div class="rma_af_info">
                                            <strong>Fügen Sie eine Nachricht</strong>
                                            <span>Service-Geschäft wird in der kürzest möglichen Zeit.</span>
                                        </div>
                                    </label>
                                    <div class="control-label has-feedback has-required">
                                        <textarea name="comment" id="comment" class="form-control validate" minlength="3">
                                            <iaixsl:attribute name="required">required</iaixsl:attribute>
                                            <iaixsl:if test="comment">
                                                <iaixsl:value-of select="comment"/>
                                            </iaixsl:if>
                                        </textarea>
                                        <span class="form-control-feedback"/>
                                    </div>
                                </div>

                                <div class="rma_af_files">
                                    <span>Datei hinzufügen: </span>

                                    <iaixsl:if test="/shop/page/rma_questions/rma_files/file">
                                        <ol>
                                            <iaixsl:for-each select="/shop/page/rma_questions/rma_files/file">
                                                <li>
                                                    <a class="previewFile" href="#previewFile">
                                                        <iaixsl:choose>
                                                            <iaixsl:when test="@preview = 'true'">
                                                                <iaixsl:attribute name="rel"><iaixsl:value-of select="@path"/></iaixsl:attribute>
                                                            </iaixsl:when>
                                                            <iaixsl:otherwise>
                                                                <iaixsl:attribute name="href"><iaixsl:value-of select="@path"/></iaixsl:attribute>
                                                                <iaixsl:attribute name="target">_blank</iaixsl:attribute>
                                                            </iaixsl:otherwise>
                                                        </iaixsl:choose>
                                                        <iaixsl:value-of select="@file"/>
                                                    </a>
                                                    <a class="deleteFile">
                                                        <iaixsl:attribute name="href"><iaixsl:value-of select="@delete_link"/></iaixsl:attribute>
                                                        <iaixsl:attribute name="title">Löschen Sie die Datei</iaixsl:attribute>
                                                        Löschen Sie die Datei
                                                    </a>
                                                </li>
                                            </iaixsl:for-each>
                                        </ol>
                                    </iaixsl:if>
                                    <div class="rma_af_foto">
                                        <input type="file" name="comment_photo[]">
                                            <iaixsl:if test="/shop/form_data/upload_file/max_filesize/@bytes">
                                                <iaixsl:attribute name="data-max_filesize"><iaixsl:value-of select="/shop/form_data/upload_file/max_filesize/@bytes"/></iaixsl:attribute>
                                            </iaixsl:if>
                                            <iaixsl:attribute name="size">20</iaixsl:attribute>
                                        </input>
                                    </div>

                                    <a href="#addMoreAttachments" class="rma_af_addMoreAttachments">Einen weiteren Anhang hinzufügen</a>

                                </div>
                                <div class="rma_af_buttons">
                                    <a class="btn --icon-left icon-paperclip rma_attach_file">
                                        Fügen Sie Fotos bei, die den Mangel dokumentieren
                                    </a>

                                    <button class="btn --solid --medium" type="submit">
                                        Senden
                                    </button>
                                    <div class="button_legend">
                                        <i class="icon-need"/> Felder mit einem Stern gekennzeichneten Felder sind Pflicht
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </iaixsl:if>
            </div>
        </iaixsl:if>


        	
            <iaixsl:if test="page/returnproducts/products">

                
                <iaixsl:variable name="setIconLarge"/>


                <div id="return_order_products" class="mb-4 pb-md-1">
                    <h2 class="orderdetails_label"><span>Defekte Waren</span></h2>
                    <iaixsl:for-each select="page/returnproducts/products/product">
                        <div class="ordered_product">
                            <div class="ordered_product__icon">
                                <iaixsl:choose>
                                    <iaixsl:when test="@link">
                                        <a>
                                          <iaixsl:attribute name="href"><iaixsl:value-of select="@link"/></iaixsl:attribute>
                                          <iaixsl:choose>
                                            <iaixsl:when test="icon_second and not(icon_second = '' or icon_second = '/')">
                                              <picture>
                                                <source type="image/webp">
                                                  <iaixsl:choose>
                                                    <iaixsl:when test="$setIconLarge">
                                                      <iaixsl:attribute name="srcset"><iaixsl:value-of select="icon"/></iaixsl:attribute>
                                                    </iaixsl:when>
                                                    <iaixsl:otherwise>
                                                      <iaixsl:attribute name="srcset"><iaixsl:value-of select="iconsmall"/></iaixsl:attribute>
                                                    </iaixsl:otherwise>
                                                  </iaixsl:choose>
                                                </source>
                                                <img>
                                                  <iaixsl:choose>
                                                    <iaixsl:when test="$setIconLarge">
                                                      <iaixsl:attribute name="src"><iaixsl:value-of select="icon_second"/></iaixsl:attribute>
                                                    </iaixsl:when>
                                                    <iaixsl:otherwise>
                                                      <iaixsl:attribute name="src"><iaixsl:value-of select="icon_small_second"/></iaixsl:attribute>
                                                    </iaixsl:otherwise>
                                                  </iaixsl:choose>
                                                  <iaixsl:attribute name="alt"><iaixsl:value-of disable-output-escaping="yes" select="name/text()"/></iaixsl:attribute>
                                                </img>
                                              </picture>
                                            </iaixsl:when>
                                            <iaixsl:otherwise>
                                              <iaixsl:choose>
                                                <iaixsl:when test="icon_second and not(icon_second = '' or icon_second = '/')">
                                                  <picture>
                                                    <source type="image/webp">
                                                      <iaixsl:choose>
                                                        <iaixsl:when test="$setIconLarge">
                                                          <iaixsl:attribute name="srcset"><iaixsl:value-of select="icon"/></iaixsl:attribute>
                                                        </iaixsl:when>
                                                        <iaixsl:otherwise>
                                                          <iaixsl:attribute name="srcset"><iaixsl:value-of select="iconsmall"/></iaixsl:attribute>
                                                        </iaixsl:otherwise>
                                                      </iaixsl:choose>
                                                    </source>
                                                    <img>
                                                      <iaixsl:choose>
                                                        <iaixsl:when test="$setIconLarge">
                                                          <iaixsl:attribute name="src"><iaixsl:value-of select="icon_second"/></iaixsl:attribute>
                                                        </iaixsl:when>
                                                        <iaixsl:otherwise>
                                                          <iaixsl:attribute name="src"><iaixsl:value-of select="icon_small_second"/></iaixsl:attribute>
                                                        </iaixsl:otherwise>
                                                      </iaixsl:choose>
                                                      <iaixsl:attribute name="alt"><iaixsl:value-of disable-output-escaping="yes" select="name/text()"/></iaixsl:attribute>
                                                    </img>
                                                  </picture>
                                                </iaixsl:when>
                                                <iaixsl:otherwise>
                                                  <img>
                                                    <iaixsl:choose>
                                                      <iaixsl:when test="$setIconLarge">
                                                        <iaixsl:attribute name="src"><iaixsl:value-of select="icon"/></iaixsl:attribute>
                                                      </iaixsl:when>
                                                      <iaixsl:otherwise>
                                                        <iaixsl:attribute name="src"><iaixsl:value-of select="iconsmall"/></iaixsl:attribute>
                                                      </iaixsl:otherwise>
                                                    </iaixsl:choose>
                                                    <iaixsl:attribute name="alt"><iaixsl:value-of disable-output-escaping="yes" select="name/text()"/></iaixsl:attribute>
                                                  </img>
                                                </iaixsl:otherwise>
                                              </iaixsl:choose>
                                            </iaixsl:otherwise>
                                          </iaixsl:choose>
                                        </a>
                                    </iaixsl:when>
                                    <iaixsl:otherwise>
                                       <iaixsl:choose>
                                          <iaixsl:when test="icon_second and not(icon_second = '' or icon_second = '/')">
                                            <picture>
                                              <source type="image/webp">
                                                <iaixsl:choose>
                                                  <iaixsl:when test="$setIconLarge">
                                                    <iaixsl:attribute name="srcset"><iaixsl:value-of select="icon"/></iaixsl:attribute>
                                                  </iaixsl:when>
                                                  <iaixsl:otherwise>
                                                    <iaixsl:attribute name="srcset"><iaixsl:value-of select="iconsmall"/></iaixsl:attribute>
                                                  </iaixsl:otherwise>
                                                </iaixsl:choose>
                                              </source>
                                              <img>
                                                <iaixsl:choose>
                                                  <iaixsl:when test="$setIconLarge">
                                                    <iaixsl:attribute name="src"><iaixsl:value-of select="icon_second"/></iaixsl:attribute>
                                                  </iaixsl:when>
                                                  <iaixsl:otherwise>
                                                    <iaixsl:attribute name="src"><iaixsl:value-of select="icon_small_second"/></iaixsl:attribute>
                                                  </iaixsl:otherwise>
                                                </iaixsl:choose>
                                                <iaixsl:attribute name="alt"><iaixsl:value-of disable-output-escaping="yes" select="name/text()"/></iaixsl:attribute>
                                              </img>
                                            </picture>
                                          </iaixsl:when>
                                          <iaixsl:otherwise>
                                            <iaixsl:choose>
                                              <iaixsl:when test="icon_second and not(icon_second = '' or icon_second = '/')">
                                                <picture>
                                                  <source type="image/webp">
                                                    <iaixsl:choose>
                                                      <iaixsl:when test="$setIconLarge">
                                                        <iaixsl:attribute name="srcset"><iaixsl:value-of select="icon"/></iaixsl:attribute>
                                                      </iaixsl:when>
                                                      <iaixsl:otherwise>
                                                        <iaixsl:attribute name="srcset"><iaixsl:value-of select="iconsmall"/></iaixsl:attribute>
                                                      </iaixsl:otherwise>
                                                    </iaixsl:choose>
                                                  </source>
                                                  <img>
                                                    <iaixsl:choose>
                                                      <iaixsl:when test="$setIconLarge">
                                                        <iaixsl:attribute name="src"><iaixsl:value-of select="icon_second"/></iaixsl:attribute>
                                                      </iaixsl:when>
                                                      <iaixsl:otherwise>
                                                        <iaixsl:attribute name="src"><iaixsl:value-of select="icon_small_second"/></iaixsl:attribute>
                                                      </iaixsl:otherwise>
                                                    </iaixsl:choose>
                                                    <iaixsl:attribute name="alt"><iaixsl:value-of disable-output-escaping="yes" select="name/text()"/></iaixsl:attribute>
                                                  </img>
                                                </picture>
                                              </iaixsl:when>
                                              <iaixsl:otherwise>
                                                <img>
                                                  <iaixsl:choose>
                                                    <iaixsl:when test="$setIconLarge">
                                                      <iaixsl:attribute name="src"><iaixsl:value-of select="icon"/></iaixsl:attribute>
                                                    </iaixsl:when>
                                                    <iaixsl:otherwise>
                                                      <iaixsl:attribute name="src"><iaixsl:value-of select="iconsmall"/></iaixsl:attribute>
                                                    </iaixsl:otherwise>
                                                  </iaixsl:choose>
                                                  <iaixsl:attribute name="alt"><iaixsl:value-of disable-output-escaping="yes" select="name/text()"/></iaixsl:attribute>
                                                </img>
                                              </iaixsl:otherwise>
                                            </iaixsl:choose>
                                          </iaixsl:otherwise>
                                        </iaixsl:choose>
                                    </iaixsl:otherwise>
                                </iaixsl:choose>
                            </div>
                            <div class="ordered_product__content">
                                <div class="ordered_product__name">
                                    <iaixsl:choose>
                                        <iaixsl:when test="@link">
                                            <a class="ordered__name --link">
                                                <iaixsl:attribute name="href"><iaixsl:value-of select="@link"/></iaixsl:attribute>
                                                <iaixsl:attribute name="title"><iaixsl:value-of select="@name"/></iaixsl:attribute>
                                                <iaixsl:choose>
                                                    <iaixsl:when test="/shop/allow_division_order/@turn_on = 'yes' and @division = 'now'">
                                                        <iaixsl:attribute name="class">ordered__name --link --now</iaixsl:attribute>
                                                    </iaixsl:when>
                                                    <iaixsl:when test="/shop/allow_division_order/@turn_on = 'yes' and @division = 'later'">
                                                        <iaixsl:attribute name="class">ordered__name --link --later showTip</iaixsl:attribute>
                                                    </iaixsl:when>
                                                </iaixsl:choose>
                                                <iaixsl:value-of select="@name"/><iaixsl:if test="version">, <iaixsl:value-of select="version/@product_name"/></iaixsl:if><iaixsl:if test="not(@size = 'uniw')">, <iaixsl:value-of select="@size_desc"/></iaixsl:if><iaixsl:choose><iaixsl:when test="@quantity &gt; '1'">, <iaixsl:value-of select="@quantity"/><iaixsl:text> </iaixsl:text><iaixsl:value-of select="@unit"/></iaixsl:when><iaixsl:otherwise>, <iaixsl:value-of select="@quantity"/><iaixsl:text> </iaixsl:text><iaixsl:value-of select="@unit_s"/></iaixsl:otherwise></iaixsl:choose>
                                            </a>
                                        </iaixsl:when>
                                        <iaixsl:otherwise>
                                            <span class="ordered__name">
                                                <iaixsl:choose>
                                                    <iaixsl:when test="/shop/allow_division_order/@turn_on = 'yes' and @division = 'now'">
                                                        <iaixsl:attribute name="class">ordered__name --now</iaixsl:attribute>
                                                    </iaixsl:when>
                                                    <iaixsl:when test="/shop/allow_division_order/@turn_on = 'yes' and @division = 'later'">
                                                        <iaixsl:attribute name="class">ordered__name --later showTip</iaixsl:attribute>
                                                    </iaixsl:when>
                                                </iaixsl:choose>
                                                <iaixsl:value-of select="@name"/><iaixsl:if test="version">, <iaixsl:value-of select="version/@product_name"/></iaixsl:if><iaixsl:if test="not(@size_id = 'uniw')">, <iaixsl:value-of select="@size_desc"/></iaixsl:if><iaixsl:choose><iaixsl:when test="@quantity &gt; '1'">, <iaixsl:value-of select="@quantity"/><iaixsl:text> </iaixsl:text><iaixsl:value-of select="@unit"/></iaixsl:when><iaixsl:otherwise>, <iaixsl:value-of select="@quantity"/><iaixsl:text> </iaixsl:text><iaixsl:value-of select="@unit_s"/></iaixsl:otherwise></iaixsl:choose>
                                            </span>
                                        </iaixsl:otherwise>
                                    </iaixsl:choose>
                                    <iaixsl:if test="/shop/allow_division_order/@turn_on = 'yes' and @division = 'later'">
                                        <div class="tooltipContent">
                                                                                    <iaixsl:attribute name="data-weeks"><iaixsl:value-of select="/shop/basket/shipping_division_time/@week_amount"/></iaixsl:attribute>
                                                                                    <iaixsl:attribute name="data-days"><iaixsl:value-of select="/shop/basket/shipping_division_time/@days"/></iaixsl:attribute>
                                                                                    <iaixsl:attribute name="data-week_day"><iaixsl:value-of select="/shop/basket/shipping_division_time/@week_day"/></iaixsl:attribute>
                                                                                    <iaixsl:attribute name="data-today"><iaixsl:value-of select="/shop/basket/shipping_division_time/@today"/></iaixsl:attribute>
                                            <span class="prepaid__division_literal"/>
                                            <strong/>
                                        </div>
                                    </iaixsl:if>
                                    <iaixsl:if test="priceformula/parameters">
                                        <ul>
                                            <iaixsl:for-each select="priceformula/parameters/parameter">
                                                <li class="orderdetails_priceformula">
                                                    <b><iaixsl:value-of select="name"/>: </b>
                                                    <iaixsl:value-of select="values/value"/>
                                                </li>
                                            </iaixsl:for-each>
                                        </ul>
                                    </iaixsl:if>
                                    <iaixsl:if test="serial_number">
                                        <ul>
                                            
                                            <li>
                                                <iaixsl:choose>
                                                    <iaixsl:when test="count(serial_number/number) = 1">
                                                        <b>Seriennummer:</b>
                                                    </iaixsl:when>
                                                    <iaixsl:otherwise>
                                                        <b>Seriennummer:</b>
                                                    </iaixsl:otherwise>
                                                </iaixsl:choose>
                                                <iaixsl:for-each select="serial_number/number">
                                                    <iaixsl:value-of select="@value"/><iaixsl:if test="not(position()=last())">,</iaixsl:if>
                                                </iaixsl:for-each>
                                            </li>
                                        </ul>
                                    </iaixsl:if>
                                    
                                    <iaixsl:if test="@product_type = 'product_bundle'">
                                        <div class="ordered-product_bundle">
                                            <label>
                                                Produkt im Set:
                                            </label>
                                            <ul>
                                                <iaixsl:for-each select="bundled/product">
                                                    <li>
                                                        <iaixsl:if test="@quantity &gt; 1">
                                                            <iaixsl:value-of select="@quantity"/>x 
                                                        </iaixsl:if>
                                                        <iaixsl:value-of select="@name"/>
                                                        <iaixsl:if test="not(@size_id = 'uniw') or ((version) and (not(version/@product_name='')))">
                                                            (<iaixsl:if test="not(@size_id = 'uniw')">Größe: <b><iaixsl:value-of select="@size_desc"/></b></iaixsl:if>
                                                            <iaixsl:if test="not(@size_id = 'uniw') and ((version) and (not(version/@product_name='')))">
                                                                ,
                                                            </iaixsl:if>
                                                            <iaixsl:if test="(version) and (not(version/@product_name=''))"><iaixsl:value-of select="version/@name"/>: <b><iaixsl:value-of select="version/@product_name"/></b></iaixsl:if>)
                                                        </iaixsl:if>
                                                    </li>
                                                </iaixsl:for-each>
                                            </ul>
                                        </div>
                                    </iaixsl:if>

                                    
                                    <iaixsl:if test="order_files/file">
                                        <div class="ordered-files">
                                            <label>
                                                Angehängte Dateien:
                                            </label>
                                            <ul>
                                                <iaixsl:for-each select="order_files/file">
                                                    <li>
                                                        <span><iaixsl:value-of select="@file"/></span>

                                                        <iaixsl:if test="@path">
                                                            [
                                                            <a>
                                                                <iaixsl:attribute name="href"><iaixsl:value-of select="@path"/></iaixsl:attribute>

                                                                <iaixsl:choose>
                                                                    <iaixsl:when test="@preview = 'true'">
                                                                        <iaixsl:attribute name="data-imagelightbox">f</iaixsl:attribute>
                                                                    </iaixsl:when>
                                                                    <iaixsl:otherwise>
                                                                        <iaixsl:attribute name="target">_blank</iaixsl:attribute>
                                                                    </iaixsl:otherwise>
                                                                </iaixsl:choose>
                                                                Vorschau</a> ]</iaixsl:if></li>
                                                </iaixsl:for-each>
                                            </ul>
                                        </div>
                                    </iaixsl:if>
                                    
                                    <iaixsl:if test="@product_type = 'product_virtual'">
                                        <div class="ordered-info">
                                            Nachdem die Produkte bezahlt wurde, wird es auf der Registerkarte
                                            <a>
                                                <iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/clientFiles/@url"/></iaixsl:attribute>
                                                &quot;Meine Dateien&quot;
                                            </a>
                                            verfügbar sein.
                                        </div>
                                    </iaixsl:if>
                                    <iaixsl:if test="comment != ''">
                                        <div class="ordered-comment">
                                            <iaixsl:value-of select="comment"/>
                                        </div>
                                    </iaixsl:if>

                                    <div class="ordered-price">
                                        
                                        <strong>
                                            <iaixsl:choose>
                                                <iaixsl:when test="@quantity != '1'">
                                                    <iaixsl:choose>
                                                        <iaixsl:when test="@forpoints='true'">
                                                            <iaixsl:value-of select="@points_sum"/>
                                                            Pkt.
                                                        </iaixsl:when>
                                                        <iaixsl:otherwise>
                                                            <iaixsl:choose>
                                                                <iaixsl:when test="not($nettoPriceRmaDetails = '') and not($priceTypeVat = '')">
                                                                    <span class="ordered_product__price_net"><iaixsl:value-of select="@nettoworth_formatted"/><span class="price_vat"><iaixsl:value-of select="$priceTypeText"/></span></span>
                                                                    <span class="ordered_product__price_gross gross_price">(<span class="price_vat"><iaixsl:value-of select="@bruttoworth_formatted"/></span><iaixsl:value-of select="$grossPriceRmaDetails"/>)</span>
                                                                </iaixsl:when>
                                                                <iaixsl:otherwise>
                                                                    <iaixsl:value-of select="@bruttoworth_formatted"/>
                                                                </iaixsl:otherwise>
                                                            </iaixsl:choose>
                                                        </iaixsl:otherwise>
                                                    </iaixsl:choose>
                                                </iaixsl:when>
                                                <iaixsl:otherwise>
                                                    <iaixsl:choose>
                                                        <iaixsl:when test="@gratis='y'">
                                                            Gratis!
                                                        </iaixsl:when>
                                                        <iaixsl:when test="@forpoints='true'">
                                                            <iaixsl:value-of select="@points"/>
                                                            Pkt.
                                                        </iaixsl:when>
                                                        <iaixsl:otherwise>
                                                            <iaixsl:choose>
                                                                <iaixsl:when test="not($nettoPriceRmaDetails = '') and not($priceTypeVat = '')">
                                                                    <span class="ordered_product__price_net"><iaixsl:value-of select="@nettoworth_formatted"/><span class="price_vat"><iaixsl:value-of select="$priceTypeText"/></span></span>
                                                                    <span class="ordered_product__price_gross gross_price">(<span class="price_vat"><iaixsl:value-of select="@bruttoworth_formatted"/></span><iaixsl:value-of select="$grossPriceRmaDetails"/>)</span>
                                                                </iaixsl:when>
                                                                <iaixsl:otherwise>
                                                                    <iaixsl:value-of select="@bruttoworth_formatted"/>
                                                                </iaixsl:otherwise>
                                                            </iaixsl:choose>
                                                        </iaixsl:otherwise>
                                                    </iaixsl:choose>
                                                </iaixsl:otherwise>
                                            </iaixsl:choose>
                                        </strong>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </iaixsl:for-each>
                </div>
            </iaixsl:if>

            				
			<iaixsl:if test="/shop/page/repayment_method">
                <div id="returnDetails_repaymentMethod" class="mb-5 pb-md-2">
                    <h3 class="orderdetails_label">
                        <span>Form der Rückgabe</span>
                    </h3>
                    <div class="returnDetails__repaymentSub">
                        <div class="returnDetails__repaymenticon">
                            <img class="return_detials_shipment_icon">
                                <iaixsl:attribute name="src">
                                    <iaixsl:value-of select="/shop/page/repayment_method/@icon"/>
                                </iaixsl:attribute>
                                <iaixsl:attribute name="alt">
                                    <iaixsl:value-of select="/shop/page/repayment_method/@name"/>
                                </iaixsl:attribute>
                            </img>
                        </div>
                        <div class="return_detials_shipment_desc">
                            <iaixsl:choose>
                                <iaixsl:when test="/shop/page/repayment_method/@id = 't'">
                                    <b class="product_name">Kundensaldo</b>
                                    <div class="return_description">
                                        Der Gegenwert Ihrer Bestellung wird Ihrem Kundenkonto gutgeschrieben. Sie können diese Gutschrift für den nächsten Einkauf verwenden.
                                    </div>
                                </iaixsl:when>
                                <iaixsl:when test="/shop/page/repayment_method/@id = 'b'">
                                    <b class="product_name">Überweisung</b>
                                    <div class="return_description">
                                        Wenn eine Reparatur oder ein Ersatz des Produkts nicht möglich ist, wird die Rückerstattung per Überweisung auf die angegebene Kontonummer erfolgen.
                                    </div>
                                </iaixsl:when>
                                <iaixsl:when test="/shop/page/repayment_method/@id = 'tc'">
                                    <b class="product_name">Handelskredit wiederherstellen</b>
                                    <div class="return_description">
                                        Der Gegenwert Ihrer Bestellung wird Ihrem Kundenkonto in Form eines Handelskredits gutgeschrieben.
                                    </div>
                                </iaixsl:when>
                                <iaixsl:otherwise>
                                    <b class="product_name">
                                        <iaixsl:value-of select="/shop/page/repayment_method/@name"/>
                                    </b>
                                    <div class="return_description">
                                        <iaixsl:value-of select="/shop/page/repayment_method/@description"/>
                                    </div>
                                </iaixsl:otherwise>
                            </iaixsl:choose>
                        </div>
                    </div>
                </div>
            </iaixsl:if>

            
            <iaixsl:if test="/shop/page/remarks">
                <div id="returnDetails_remarks" class="mb-5">
                    <h3 class="orderdetails_label">
                        <span>Bemerkungen an den Shop</span>
                    </h3>
                    <div>
                        <iaixsl:value-of disable-output-escaping="yes" select="/shop/page/remarks"/>
                    </div>
                </div>
            </iaixsl:if>


            
            <iaixsl:if test="/shop/page/pickup/name">
                <div id="returnDetails_adress" class="mb-5 pb-md-3">
                    <h3 class="orderdetails_label">
                        <span>Standort für die Rückgabe der Bestellung</span>
                    </h3>
                    <div class="returnDetails__adres">
                        <div>
                            <b><iaixsl:value-of select="/shop/page/pickup/name"/></b>
                        </div>
                        <div>
                            <span><iaixsl:value-of select="/shop/page/pickup/address"/></span>
                        </div>
                        <div>
                            <span>
                                <iaixsl:value-of select="/shop/page/pickup/zipcode"/>
                                <iaixsl:text disable-output-escaping="yes"> </iaixsl:text>
                                <iaixsl:value-of select="/shop/page/pickup/city"/>
                                 (<iaixsl:value-of select="/shop/page/pickup/country"/>)
                            </span>
                        </div>
                        <div class="mt-3">
                            <a>
                                <iaixsl:attribute name="title">Detaillierte Informationen anzeigen</iaixsl:attribute>
                                <iaixsl:attribute name="href">
                                    <iaixsl:value-of select="/shop/page/pickup/link"/>
                                </iaixsl:attribute>
                                Detaillierte Informationen anzeigen
                            </a>
                        </div>
                    </div>
                </div>
            </iaixsl:if>

            
			<iaixsl:variable name="txt_54116_1">Dokumente zu dieser Beschwerde ausgestellt</iaixsl:variable>
            <iaixsl:if test="$txt_54116_1 and count(page/documents/document) &gt; 0">
                <div id="returnDetails_documents" class="mb-4">
                    <h3 class="orderdetails_label">
                        <span><iaixsl:value-of select="$txt_54116_1"/></span>
                    </h3>
                    <div class="n55542_main_outline">
                        <div class="n55542_main">
                            <ul class="n54116_list">
                                <iaixsl:for-each select="page/documents/document">
                                    <li class="n54116_item">
                                        <a class="n54116_item" target="_blank">
                                            <iaixsl:attribute name="title">Herunterladen oder das Dokument drucken</iaixsl:attribute>
                                            <iaixsl:attribute name="href"><iaixsl:value-of select="@link"/></iaixsl:attribute>
                                            <iaixsl:value-of select="@id"/>
                                        </a>
                                    </li>
                                </iaixsl:for-each>
                            </ul>
                        </div>
                    </div>
                </div>
            </iaixsl:if>

        		
		<div id="returnDetails_summary" class="returnDetails__summary">
			<div class="returnDetails__summarySub">
				<iaixsl:if test="/shop/page/costs/cost[@type='products']/@value_formatted">
					<div class="returnDetails__summaryItem">
						<label>Der Wert des Produkts geworben wird: </label>
						<strong><iaixsl:value-of select="/shop/page/costs/cost[@type='products']/@value_formatted"/></strong>
					</div>
				</iaixsl:if>

				<iaixsl:if test="/shop/page/costs/cost[@type='shipping']/@value_formatted">
					<div class="returnDetails__summaryItem">
						<label>Kosten für den Kurierversand: </label>
						<strong id="additional_cost_prepaid"><iaixsl:value-of select="/shop/page/costs/cost[@type='shipping']/@value_formatted"/></strong>
					</div>
				</iaixsl:if>

				<iaixsl:if test="/shop/page/costs/cost[@type='shop_shipping']/@value_formatted">
					<div class="returnDetails__summaryItem">
						<label>Kosten der Rücksendung: </label>
						<strong id="additional_cost_prepaid"><iaixsl:value-of select="/shop/page/costs/cost[@type='shop_shipping']/@value_formatted"/></strong>
					</div>
				</iaixsl:if>

				<iaixsl:if test="/shop/page/costs/@value_formatted">
					<div class="returnDetails__summaryItem --sum">
						<label>
							Total: 
							
						</label>
						<strong id="currencytotal_prepaid"><iaixsl:value-of select="/shop/page/costs/@value_formatted"/><span class="price_vat"><iaixsl:value-of select="$grossPriceRmaDetails"/></span></strong>
					</div>
				</iaixsl:if>
			</div>
			<div class="prepaid-buttons">
				<div class="returnDetails__buttons">
					<iaixsl:if test="/shop/page/editlink/@url">
						<a class="btn --solid --large --outline prepaid-edit">
							<iaixsl:attribute name="title">Klicken Sie auf die Bearbeitung der Beschwerde zu gehen.</iaixsl:attribute>
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/page/editlink/@url"/></iaixsl:attribute>ändern Beschwerde
						</a>
					</iaixsl:if>
					<iaixsl:if test="/shop/page/cancellink/@url">
						<a class="btn --large --outline prepaid-cancel">
							<iaixsl:attribute name="onclick">return confirm(&apos;Stornierung der Beschwerde kann nicht rückgängig gemacht werden. Um fortzufahren, drücken Sie "die Beschwerde Abbrechen&quot;.&gt;&apos;)</iaixsl:attribute>
							<iaixsl:attribute name="title">Reklamation stornieren</iaixsl:attribute>
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/page/cancellink/@url"/></iaixsl:attribute>
							Reklamation stornieren
						</a>
					</iaixsl:if>
				</div>
			</div>
		</div>

        <iaixsl:if test="/shop/page/details/@status=1">
            <div class="prepaid_summary_buttons">
                <iaixsl:if test="page/backlink/@url">
                    <a class="btn --solid --medium">
                        <iaixsl:attribute name="href"><iaixsl:value-of select="page/backlink/@url"/></iaixsl:attribute>
                        Beschwerde andere Ware
                    </a>
                </iaixsl:if>
                <iaixsl:if test="page/backlink_other/@url">
                    <a class="btn --solid --medium">
                        <iaixsl:attribute name="href"><iaixsl:value-of select="page/backlink_other/@url"/></iaixsl:attribute>
                        Beschwerde andere Waren dieser Reihenfolge
                    </a>
                </iaixsl:if>
            </div>
        </iaixsl:if>

        
        <div id="alert_cover" class="projector_alert_55916" style="display:none" onclick="Alertek.hide_alert();">NIE DA SIE
        </div>
        
				</div>
			</iaixsl:if>
		</div>
	</div>

	
	<iaixsl:if test="not(action/set_render/item) or (action/set_render/item/@name = 'footer')">
		<footer>
			<iaixsl:attribute name="class">max-width-1200</iaixsl:attribute>
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
					BESTELLUNGEN
				</a>
				<ul class="footer_links_sub">
					<li id="order_status" class="menu_orders_item">
						<i class="icon-battery"/>
						<a>
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/orderOpen/@url"/></iaixsl:attribute>
							Bestellungsstatus
						</a>
					</li>
					<li id="order_status2" class="menu_orders_item">
						<i class="icon-truck"/>
						<a>
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/orderOpen/@url"/></iaixsl:attribute>
							Track-Paket
						</a>
					</li>
					<li id="order_rma" class="menu_orders_item">
						<i class="icon-sad-face"/>
						<a>
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/addRma/@url"/></iaixsl:attribute>
							Ich möchte die Ware reklamieren
						</a>
					</li>
					<li id="order_returns" class="menu_orders_item">
						<i class="icon-refresh-dollar"/>
						<a>
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/addReturn/@url"/></iaixsl:attribute>
							Ich möchte die Ware zurückgeben
						</a>
					</li>
					<li id="order_exchange" class="menu_orders_item">
						<i class="icon-return-box"/>
						<a>
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/returnExchangeLink/@url"/></iaixsl:attribute>
							Ich möchte die Ware umtauschen
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
									Rechnungsdaten und Lieferadresse
								</a>
							</li>
						</iaixsl:when>
						<iaixsl:otherwise>
							<iaixsl:for-each select="/shop/action/registration_options/wholesale">
								<li id="account_register_wholesale" class="menu_orders_item">
									<i class="icon-wholesaler-register"/>
									<a>
										<iaixsl:attribute name="href"><iaixsl:value-of select="@registration_url"/></iaixsl:attribute>
										Registrieren Sie sich als Großhändler
									</a>
								</li>
							</iaixsl:for-each>
							<iaixsl:for-each select="/shop/action/registration_options/retail">
								<li id="account_register_retail" class="menu_orders_item">
									<i class="icon-register-card"/>
									<a>
										<iaixsl:attribute name="href"><iaixsl:value-of select="@registration_url"/></iaixsl:attribute>
										Registrieren
									</a>
								</li>
							</iaixsl:for-each>
						</iaixsl:otherwise>
					</iaixsl:choose>
					<li id="account_basket" class="menu_orders_item">
						<i class="icon-basket"/>
						<a>
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/basket/@url"/></iaixsl:attribute>
							Warenkorb
						</a>
					</li>
					<li id="account_observed" class="menu_orders_item">
						<i class="icon-heart-empty"/>
						<a>
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/shoppinglist/@url"/></iaixsl:attribute>
							Einkaufslisten
						</a>
					</li>
												<li id="account_boughts" class="menu_orders_item">
						<i class="icon-menu-lines"/>
						<a>
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/productsBought/@url"/></iaixsl:attribute>
							Liste der gekauften Waren
						</a>
					</li>
					<li id="account_history" class="menu_orders_item">
						<i class="icon-clock"/>
						<a>
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/clientOrders/@url"/></iaixsl:attribute>
							Transaktionsverlauf
						</a>
					</li>
					<li id="account_rebates" class="menu_orders_item">
						<i class="icon-scissors-cut"/>
						<a>
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/clientRebate/@url"/></iaixsl:attribute>
							Ihre Rabatte
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
				<li><span class="footer_links_label">Informationen</span>
					<ul class="footer_links_sub">
						<iaixsl:if test="/shop/action/shop_information/@order_link_active='y' and not(/shop/action/shop_information/@url = '')">
							<li>
								<a>
									<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/shop_information/@url"/></iaixsl:attribute>
									Impressum
								</a>
							</li>
						</iaixsl:if>
						<iaixsl:if test="/shop/action/shipping_cost/@order_link_active='y' and not(/shop/action/shipping_cost/@url = '')">
							<li>
								<a>
									<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/shipping_cost/@url"/></iaixsl:attribute>
									Versand
								</a>
							</li>
						</iaixsl:if>
						<iaixsl:if test="/shop/action/payment_methods/@order_link_active='y' and not(/shop/action/payment_methods/@url = '')">
							<li>
								<a>
									<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/payment_methods/@url"/></iaixsl:attribute>
									Zahlungsbedingungen
								</a>
							</li>
						</iaixsl:if>
						<iaixsl:if test="/shop/action/terms/@order_link_active='y' and not(/shop/action/terms/@url = '')">
							<li>
								<a>
									<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/terms/@url"/></iaixsl:attribute>
									AGB
								</a>
							</li>
						</iaixsl:if>
						<iaixsl:if test="/shop/action/private_policy/@order_link_active='y' and not(/shop/action/private_policy/@url = '')">
							<li>
								<a>
									<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/private_policy/@url"/></iaixsl:attribute>
									Datenschutz
								</a>
							</li>
						</iaixsl:if>
						<iaixsl:if test="/shop/action/order_cancel/@order_link_active='y' and not(/shop/action/order_cancel/@url = '')">
							<li>
								<a>
									<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/order_cancel/@url"/></iaixsl:attribute>
									Widerruf
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
										Im Shop präsentieren wir die Nettopreise (exkl. MwSt.).
									</iaixsl:when>
									<iaixsl:otherwise>
										Im Shop präsentieren wir die Bruttopreise (inkl. MwSt.).
									</iaixsl:otherwise>
								</iaixsl:choose>
							</span>
							<iaixsl:if test="/shop/page/@price_type = 'gross' and /shop/page/@tax_region_name">
								<span class="price_info__text --region">Mehrwertsteuersätze für inländische Verbraucher: <span class="price_info__region"><iaixsl:value-of select="/shop/page/@tax_region_name"/></span>. </span>
							</iaixsl:if>
						</iaixsl:if>
						<iaixsl:if test="/shop/page/@customs_duty_required = 'y'">
							<span class="price_info__text --customs">Zu den angegebenen Preisen kommen noch die Zölle hinzu. </span>
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
<!-- (menu_banners2, 60dd8e7eb6d737.92314820.6)-->
	<iaixsl:if test="count(commercial_banner2/link)">
		<section id="menu_banners2" class="container">
			<iaixsl:for-each select="commercial_banner2/link">
				<div class="menu_button_wrapper">
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
		</section>
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
		<iaixsl:if test="((/shop/page/projector/product/versions/version[@id = /shop/page/projector/product/@id]/size/price/@value != 0 or /shop/basket/@wholesaler = 'true') and $menu_structured_data_hurt != '') or not($menu_structured_data_hurt != '')">,
		&quot;offers&quot;: [<iaixsl:variable name="isSizesPricesSet"><iaixsl:choose><iaixsl:when test="(not(count(/shop/page/projector/product/sizes/size) = count(/shop/page/projector/product/sizes/size/price[@value = /shop/page/projector/product/sizes/prices/@price_unit_sellby]))) and not(count(/shop/page/projector/product/sizes/size) = 1)">true</iaixsl:when><iaixsl:otherwise>false</iaixsl:otherwise></iaixsl:choose></iaixsl:variable><iaixsl:for-each select="page/projector/product/sizes/size">
			<iaixsl:if test="not(position() = 1)">,</iaixsl:if>
			{
			&quot;@type&quot;: &quot;Offer&quot;,
			&quot;availability&quot;: &quot;<iaixsl:choose><iaixsl:when test="availability[(@status = 'enable') or (@status = 'order')]">http://schema.org/InStock</iaixsl:when><iaixsl:otherwise>http://schema.org/OutOfStock</iaixsl:otherwise></iaixsl:choose>&quot;,
			<iaixsl:choose>
				<iaixsl:when test="price/@maxprice">
					&quot;priceSpecification&quot;: [
					<iaixsl:if test="price/@srp">
						{
							&quot;@type&quot;: &quot;PriceSpecification&quot;,
							&quot;priceType&quot;: &quot;https://schema.org/MSRP&quot;,
							&quot;price&quot;: &quot;<iaixsl:value-of select="price/@srp"/>&quot;,
              &quot;priceCurrency&quot;: &quot;<iaixsl:value-of select="/shop/currency/@id"/>&quot;
						},
					</iaixsl:if>
					{
					&quot;@type&quot;: &quot;PriceSpecification&quot;,
					&quot;priceType&quot;: &quot;https://schema.org/ListPrice&quot;,
					&quot;price&quot;: &quot;<iaixsl:value-of select="price/@maxprice"/>&quot;,
          &quot;priceCurrency&quot;: &quot;<iaixsl:value-of select="/shop/currency/@id"/>&quot;
					},
					{
					&quot;@type&quot;: &quot;UnitPriceSpecification&quot;,
					&quot;priceType&quot;: &quot;https://schema.org/SalePrice&quot;,
					<iaixsl:if test="price/@promotiontilldate or price/@discounttilldate or price/@distinguishedtilldate or price/@specialtilldate">
						&quot;validThrough&quot;: &quot;<iaixsl:choose><iaixsl:when test="price/@promotiontilldate"><iaixsl:value-of select="price/@promotiontilldate"/></iaixsl:when><iaixsl:when test="price/@discounttilldate"><iaixsl:value-of select="price/@discounttilldate"/></iaixsl:when><iaixsl:when test="price/@distinguishedtilldate"><iaixsl:value-of select="price/@distinguishedtilldate"/></iaixsl:when><iaixsl:when test="price/@specialtilldate"><iaixsl:value-of select="price/@specialtilldate"/></iaixsl:when></iaixsl:choose>&quot;,
					</iaixsl:if>
					&quot;price&quot;: &quot;<iaixsl:choose><iaixsl:when test="($isSizesPricesSet = 'true') and price/@value"><iaixsl:value-of select="price/@value"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="../prices/@price_unit_sellby"/></iaixsl:otherwise></iaixsl:choose>&quot;,
          &quot;priceCurrency&quot;: &quot;<iaixsl:value-of select="/shop/currency/@id"/>&quot;
					}
					],
          
				</iaixsl:when>
				<iaixsl:otherwise>
					&quot;price&quot;: &quot;<iaixsl:choose><iaixsl:when test="($isSizesPricesSet = 'true') and price/@value"><iaixsl:value-of select="price/@value"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="../prices/@price_unit_sellby"/></iaixsl:otherwise></iaixsl:choose>&quot;,
          &quot;priceCurrency&quot;: &quot;<iaixsl:value-of select="/shop/currency/@id"/>&quot;,
				</iaixsl:otherwise>
			</iaixsl:choose>
			&quot;eligibleQuantity&quot;: {
			&quot;value&quot;:  &quot;<iaixsl:value-of select="/shop/page/projector/product/sizes/@unit_sellby"/>&quot;,
			&quot;unitCode&quot;: &quot;<iaixsl:value-of select="/shop/page/projector/product/sizes/@unit_single"/>&quot;,
			&quot;@type&quot;: [
			&quot;QuantitativeValue&quot;
			]
			},
			&quot;url&quot;: &quot;<iaixsl:value-of select="substring($curr_url,1,($url_length - 1))"/><iaixsl:value-of select="/shop/page/projector/product/@link"/><iaixsl:if test="/shop/page/projector/product/sizes/size/@type != 'onesize' and /shop/page/projector/product/sizes/size/@type != 'uniw'">?selected_size=<iaixsl:value-of select="@type"/></iaixsl:if>&quot;
			}
			</iaixsl:for-each>
		]</iaixsl:if>
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
				<h2>Bestellung bearbeiten</h2>
				<p>
					<iaixsl:choose>
						<iaixsl:when test="/shop/action_alert/@type = 'order_edit'">
							Sie befinden sich im Bearbeiten-Modus der angelegten Bestellung. Um die Bestellung zu ändern, müssen Sie alle Schritte der Bestellung folgen. Wenn Sie nicht durch alle Schritte der Bestellung folgen, verändert sich die zuvor erteilte Bestellung nicht.
						</iaixsl:when>
						<iaixsl:when test="/shop/action_alert/@type = 'order_edit_auction'">
							Sie befinden sich im Bearbeiten-Modus der angelegten Bestellung. Sie können das Element, um eine andere zu ersetzen innerhalb der gleichen Gruppe (z.B. andere Farbe oder Größe) oder fügen Sie mehr Waren hinzu, um die Bestellung zu erhöhen. Um die Bestellung zu ändern müssen Sie alle Schritte der Bestellung folgen.
						</iaixsl:when>
						<iaixsl:when test="/shop/action_alert/@type = 'order1'">
							Sie befinden sich im Bearbeiten-Modus der angelegten Bestellung. Die vorher ausgewählte Versand- und Zahlungseinstellungen sind markiert. Sie können sie ändern. Um die Bestellung zu ändern müssen Sie alle Schritte der Bestellung folgen.
						</iaixsl:when>
						<iaixsl:when test="/shop/page/@type = 'order2'">
							Überprüfen Sie, ob Ihre Bestellung jetzt korrekt ist. Falls ja, klicken Sie bitte auf die Schaltfläche Bestellung ändern, um die Änderungen zu übernehmen. Falls nein, kehren Sie zum Warenkorb zurück und wiederholen Sie den gesamten Vorgang.
						</iaixsl:when>
						<iaixsl:when test="/shop/page/@type = 'order-wrappers'">
							In diesem Bearbeitungsschritt können Sie eine Verpackung auswählen. Um die Änderungen übernehmen zu können, müssen Sie alle Schritte der Bestellvorgangs erneut durchlaufen.
						</iaixsl:when>
						<iaixsl:when test="/shop/action_alert/@type = 'add_basket' or /shop/action_alert/@type = 'change_basket'">
							Sie haben den Inhalt Ihres Warenkorbs geändert. Bitte denken Sie daran, dass Sie alle Schritte des Bestellvorgangs erneut durchlaufen müssen, um diese Änderungen zu übernehmen.
						</iaixsl:when>
						<iaixsl:when test="/shop/page/projector/product/exchange/@exchange_id">
							Sie können das Produkt in Ihrem Warenkorb ersetzen, zum Beispiel die Farbe oder Größe der gleichen Ware wechseln, und das System wird es automatisch mit dem ausgewählten Produkt ersetzen.
						</iaixsl:when>
					</iaixsl:choose>
				</p>
			</div>
		</iaixsl:if>
	</iaixsl:if>

	<iaixsl:if test="/shop/page/@type = 'search' and ((/shop/page/sameday/@couriers_available = 'true' and /shop/page/sameday/@client_localized = 'false') or (/shop/page/nextday/@couriers_available = 'true' and /shop/page/nextday/@client_localized = 'false'))">
			<div id="xpress_toplayer">
					<div class="header_wrapper col-md-12">
							<h2>Lage</h2>
					</div>
					<div id="xpress_zipcode">
							<p class="col-md-12">Geben Sie eine Postleitzahl Zustelladresse</p>
							<div class="form-group">
									<div class="has-feedback has-required col-md-12 col-xs-12">
											<input id="xpress_zipcode" class="form-control validate" name="client_zipcode" data-validation="client_zipcode" data-validation-url="/ajax/client-new.php?validAjax=true" data-serialize="data-region" value="" required="required" type="text" data-region="client_region=1143020003">
													<iaixsl:attribute name="placeholder">Postleitzahl</iaixsl:attribute>
											</input>
											<span class="form-control-feedback"/>
									</div>
							</div>
							<div class="xpress_button_sub col-md-12"><a id="xpress_zipcode_submit" class="btn --solid">OK</a></div>
							<p class="col-md-12">oder den Standort gemeinsam nutzen, so dass wir, ob dieser Ort für Expresslieferungen bestimmen können zur Verfügung steht.</p>
							<div class="xpress_button_sub col-md-12"><a id="xpress_zipcode_geolocation" class="btn --solid">Aktie Position</a></div>
					</div>
			</div>
			<div id="xpress_toplayer_error">
					<div class="header_wrapper col-md-12">
							<h2>Lage</h2>
					</div>
					<div id="xpress_zipcode">
							<p class="col-md-12">Es tut uns leid, aber unser Express-Kurier hat diesen Bereich nicht unterstützen. </p>
							<p class="col-md-12">Ihre Bestellung wird in der Standardzeit geliefert werden, und den Kurier wählt bei der Bestellung.</p>
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
        
		</footer>
	</iaixsl:if>
	<iaixsl:variable name="projector_script_bottom">true</iaixsl:variable>
	<iaixsl:if test="/shop/page/@type = 'main' or /shop/page/@type = 'search' or /shop/page/@type = 'place-order' or /shop/page/@type = 'noproduct' or ($projector_script_bottom and /shop/page/@type = 'projector')">
		<iaixsl:choose>
			<iaixsl:when test="/shop/@preview &gt; 0">
				<script><iaixsl:attribute name="src">/gfx/<iaixsl:value-of select="language/@id"/>/<iaixsl:value-of select="/shop/@preview"/>/shop.js</iaixsl:attribute></script>
			</iaixsl:when>
			<iaixsl:otherwise>
				<script><iaixsl:attribute name="src">/gfx/<iaixsl:value-of select="language/@id"/>/shop.js.gzip?r=1696937760</iaixsl:attribute></script>
			</iaixsl:otherwise>
		</iaixsl:choose>

		
		
	</iaixsl:if>
  
  
  

	
	<script src="/gfx/ger/envelope.js.gzip?r=1696937760"></script><script src="/gfx/ger/menu_suggested_shop_for_language.js.gzip?r=1696937760"></script>

	
	<iaixsl:value-of disable-output-escaping="yes" select="php:functionString('additionalContent', 'additional_body_scripts')"/>
  
	<script>app_shop.runApp();</script>
	
	<iaixsl:if test="/shop/page/seolink_with_language_directory"/>

	<iaixsl:if test="(action/set_render/item/@name = 'popup') or not(action/set_render/item)">
		<iaixsl:text disable-output-escaping="yes">&lt;/body&gt;&lt;/html&gt;</iaixsl:text>
	</iaixsl:if>
</iaixsl:template><iaixsl:template match="//image"><iaixsl:if test="@type='swf'"><object type="application/x-shockwave-flash"><iaixsl:attribute name="data"><iaixsl:value-of select="@src"/></iaixsl:attribute><iaixsl:attribute name="data"><iaixsl:value-of select="@src"/></iaixsl:attribute><iaixsl:attribute name="width"><iaixsl:value-of select="@width"/></iaixsl:attribute><iaixsl:attribute name="height"><iaixsl:value-of select="@height"/></iaixsl:attribute><param name="movie"><iaixsl:attribute name="value"><iaixsl:value-of select="@src"/></iaixsl:attribute></param><param name="bgcolor"><iaixsl:attribute name="bgcolor"><iaixsl:value-of select="@bgcolor"/></iaixsl:attribute></param></object></iaixsl:if><iaixsl:if test="not(@type='swf')"><img alt="" class="pic"><iaixsl:attribute name="src"><iaixsl:value-of select="@src"/></iaixsl:attribute><iaixsl:if test="@width &gt; 0"><iaixsl:attribute name="width"><iaixsl:value-of select="@width"/></iaixsl:attribute></iaixsl:if><iaixsl:if test="@height &gt; 0"><iaixsl:attribute name="height"><iaixsl:value-of select="@height"/></iaixsl:attribute></iaixsl:if></img></iaixsl:if></iaixsl:template><iaixsl:template name="escape-backslash"><iaixsl:param name="str" select="."/><iaixsl:choose><iaixsl:when test="contains($str, '\')"><iaixsl:value-of select="concat(substring-before($str, '\'), '\\' )"/><iaixsl:call-template name="escape-backslash"><iaixsl:with-param name="str" select="substring-after($str, '\')"/></iaixsl:call-template></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="$str"/></iaixsl:otherwise></iaixsl:choose></iaixsl:template><iaixsl:template name="escape-quote-string"><iaixsl:param name="str"/><iaixsl:param name="escape_backslash"/><iaixsl:param name="escape" select="'quot'"/><iaixsl:param name="quoting" select="'1'"/><iaixsl:variable name="escape_sign"><iaixsl:choose><iaixsl:when test="$escape=&quot;apos&quot;"><iaixsl:value-of select="&quot;'&quot;"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="string('&quot;')"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable><iaixsl:if test="$quoting"><iaixsl:value-of select="$escape_sign"/></iaixsl:if><iaixsl:choose><iaixsl:when test="contains($str,$escape_sign)"><iaixsl:variable name="before-first-apostrophe" select="substring-before($str,$escape_sign)"/><iaixsl:variable name="after-first-apostrophe" select="substring-after($str,$escape_sign)"/><iaixsl:value-of select="$before-first-apostrophe"/>\<iaixsl:value-of select="$escape_sign"/><iaixsl:text/><iaixsl:call-template name="escape-quote-string"><iaixsl:with-param name="str" select="$after-first-apostrophe"/><iaixsl:with-param name="escape" select="$escape"/><iaixsl:with-param name="quoting" select="0"/></iaixsl:call-template></iaixsl:when><iaixsl:otherwise><iaixsl:choose><iaixsl:when test="not($escape_backslash)"><iaixsl:value-of select="$str"/></iaixsl:when><iaixsl:otherwise><iaixsl:call-template name="escape-backslash"><iaixsl:with-param name="str" select="$str"/></iaixsl:call-template></iaixsl:otherwise></iaixsl:choose></iaixsl:otherwise></iaixsl:choose><iaixsl:if test="$quoting"><iaixsl:value-of select="$escape_sign"/></iaixsl:if></iaixsl:template></iaixsl:stylesheet>