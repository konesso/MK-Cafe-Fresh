<?xml version="1.0" encoding="UTF-8"?>
<iaixsl:stylesheet xmlns:php="http://php.net/xsl" xmlns:iaixsl="http://www.w3.org/1999/XSL/Transform" xmlns:iaielement="http://iai-system.com/ddd" xmlns:fb="http://www.facebook.com/2008/fbml" version="1.0" exclude-result-prefixes="php iaielement fb"><iaixsl:output indent="no" method="html" doctype-system="about:legacy-compat" version="1.0" encoding="UTF-8"/><iaixsl:strip-space elements="table tr td img"/><iaixsl:decimal-format name="yen" NaN="" grouping-separator="," decimal-separator="."/><iaixsl:template match="shop"><!-- (envelope, 60dd8eb7808547.00364708.18)-->
	<iaixsl:variable name="priceTypeVat"><iaixsl:if test="(/shop/basket/@login and not(/shop/client_data/@uses_vat='false') or not(/shop/basket/@login)) and not(/shop/contact/owner/@vat_registered = 'false') and not(/shop/page/@price_type = 'hidden')">true</iaixsl:if></iaixsl:variable>
	<iaixsl:variable name="priceTypeText"><iaixsl:if test="not($priceTypeVat = '')"><iaixsl:choose><iaixsl:when test="/shop/page/@price_type = 'net'"> Netto</iaixsl:when><iaixsl:when test="/shop/page/@price_type = 'gross'"> inkl. MwSt</iaixsl:when></iaixsl:choose></iaixsl:if></iaixsl:variable>
	<iaixsl:variable name="meta_langcode_iso639">de</iaixsl:variable>
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
<!-- (projector_stepper, 60dd8ed08958b2.10218397.8)-->
  <iaixsl:variable name="searchResults_title"/>
  <iaixsl:variable name="breadcrumbs_label">Sie sind hier:  </iaixsl:variable>
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
          <span><a href="/">Startseite</a></span>
        </li>
        <iaixsl:choose>
          <iaixsl:when test="page/@type = 'main'">
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'wishesedit' or page/@type = 'shoppinglist'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Einkaufslisten</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'basketedit'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Warenkorb</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'product-stocks'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Produktverfügbarkeit in unseren Shops</span>
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
              <span>Kundenrezensionen</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'opinions-shop'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Meinungen über den Laden</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'categories-list'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Liste der Kategorien</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'order-payment'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Zahlungen</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'order-newpayment'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Zahlungen</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'order-wrappers'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Verpackung auswählen</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'news'">
            <iaixsl:choose>
              <iaixsl:when test="/shop/page/news/title">
                <li>
                  <iaixsl:attribute name="class">bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
                  <a>
                    <iaixsl:attribute name="href">/news.php</iaixsl:attribute>
                    Aktuelles
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
                  <span>Aktuelles</span>
                </li>
              </iaixsl:otherwise>
            </iaixsl:choose>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'client-rebates'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Ihre Rabatte</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'sitemap'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Seitmap</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'client-save'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Einloggen</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="((page/@type = 'client-new') and not(page/client-data/@register='true') and not(page/client-data/@edit='true'))">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Registrieren</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="((page/@type = 'client-new') and (page/client-data/@register='true'))">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Registrieren</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="((page/@type = 'client-new') and (page/client-data/@edit='true'))">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Daten des Bestellers und Shop-Personalisierung</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'order-nonstandardized'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Sonderbestellung</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'pickup-sites'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Wählen Sie einen Abholort</span>
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
              <span>Links</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'login'">
            <iaixsl:if test="page/login/response/@type = 'give login'">
              <li>
                <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
                <span>Passwort vergessen</span>
              </li>
            </iaixsl:if>
            <iaixsl:if test="not(page/login/response/@type = 'give login')">
              <iaixsl:choose>
                <iaixsl:when test="/shop/basket/@login">
                  <li>
                    <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
                    <span>Login</span>
                  </li>
                </iaixsl:when>
                <iaixsl:when test="page/login/response/@type = 'no login'">
                  <li>
                    <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
                    <span>Einloggen</span>
                  </li>
                </iaixsl:when>
              </iaixsl:choose>
            </iaixsl:if>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'rma-add'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Reklamation hinzuzufügen</span>
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
              <span>Liste der Reklamationen</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'stock'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Abholort auswählen</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'order1'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Lieferung und Zahlung</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'order2'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Datenbestätigung</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'prepaid'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Zusammenfassung Ihrer Bestellung</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'producers-list'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Marken</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'searching'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Suchen</span>
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
              <span>Achtung</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'client-orders'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-login</iaixsl:attribute>
              <a><iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/login/@url"/></iaixsl:attribute>Login</a>
            </li>
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Ihre Bestellungen</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'order-open'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Bestellungsstatus</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'product-compare'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Suchmaschine</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'products-bought'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Liste der gekauften Waren</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'return_products'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Rückerstattung bestellen</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'client-cards'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Kundenkarten</span>
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
              <span>One Step Checkout-Prozess</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'rma-open'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Beschwerde ohne Einloggen</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'returns-open'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Rückerstattung offen</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'opinions-add'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Meinungen hinzufügen</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'noproduct'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Mangel an Produkt</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'subscriptions'">
            <li>
              <iaixsl:attribute name="class">bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <a><iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/login/@url"/></iaixsl:attribute>Login</a>
            </li>
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span><iaixsl:choose><iaixsl:when test="/shop/page/subscriptions/@display = 'active'">Liste der aktiven Abonnements</iaixsl:when><iaixsl:otherwise>Liste der abgeschlossenen Abonnements</iaixsl:otherwise></iaixsl:choose></span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'subscription'">
            <li>
              <iaixsl:attribute name="class">bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <a><iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/login/@url"/></iaixsl:attribute>Login</a>
            </li>
            <li>
              <iaixsl:attribute name="class">bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <a><iaixsl:choose><iaixsl:when test="/shop/page/subscription/@status != 'finished'"><iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/subscriptions_active/@url"/></iaixsl:attribute>Liste der aktiven Abonnements</iaixsl:when><iaixsl:otherwise><iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/subscriptions_terminated/@url"/></iaixsl:attribute>Liste der abgeschlossenen Abonnements</iaixsl:otherwise></iaixsl:choose></a>
            </li>
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Abonnement Nr.<iaixsl:text> </iaixsl:text><iaixsl:value-of select="/shop/page/subscription/@id"/></span>
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

        <!-- (projector_productversions, 60dd8e800ee9c0.60080458.3)-->
        <iaixsl:if test="compare/@count &gt; 0 or /shop/page/@cache_html = 'true'">
            <div id="menu_compare_product" class="compare mb-2 pt-sm-3 pb-sm-3 mb-sm-3">
                <iaixsl:if test="/shop/page/@cache_html = 'true'">
                    <iaixsl:attribute name="style">display: none;</iaixsl:attribute>
                </iaixsl:if>

                <div class="compare__label d-none d-sm-block">Hinzu vergleichen</div>

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
                            <iaixsl:attribute name="title">Vergleichen Sie alle Produkte</iaixsl:attribute>
                            <iaixsl:attribute name="target">_blank</iaixsl:attribute>
                            <span>Produkte vergleichen </span><span class="d-sm-none">(<iaixsl:value-of select="compare/@count"/>)</span>
                        </a>
                    </iaixsl:if>

                    <a class="compare__button --remove btn d-none d-sm-block">
                        <iaixsl:attribute name="href"><iaixsl:choose><iaixsl:when test="/shop/action/settings/@url"><iaixsl:value-of select="/shop/action/settings/@url"/></iaixsl:when><iaixsl:otherwise>settings.php</iaixsl:otherwise></iaixsl:choose>?comparers=remove&amp;product=<iaixsl:choose><iaixsl:when test="/shop/page/@cache_html = 'true'">###</iaixsl:when><iaixsl:otherwise><iaixsl:for-each select="compare/product"><iaixsl:value-of select="@id"/><iaixsl:if test="not(count(../product) = position())">,</iaixsl:if></iaixsl:for-each></iaixsl:otherwise></iaixsl:choose></iaixsl:attribute>

                        <iaixsl:attribute name="title">Löschen Sie alle Produkte</iaixsl:attribute>
                        Produkte entfernen
                    </a>
                </div>

                <iaixsl:if test="/shop/page/@cache_html = 'true'">
                    <script>
                        var cache_html = true;
                    </script>
                </iaixsl:if>
            </div>
        </iaixsl:if>
    <!-- (projector_photos, 610bfe0513d944.96943419.14)-->
	<section id="projector_photos" class="photos d-flex align-items-start mb-4 mb-md-6">
		<iaixsl:choose>
			<iaixsl:when test="count(/shop/page/projector/product/enclosures/images/enclosure) &gt; 0 or /shop/page/projector/bundled/product[enclosures/images/enclosure[1]/@icon]">
				
				<iaixsl:variable name="magnify"/>
				
				<iaixsl:variable name="thumbnailsCount">999</iaixsl:variable>
				<iaixsl:variable name="enclosureCount"><iaixsl:value-of select="count(/shop/page/projector/product/enclosures/images/enclosure)"/></iaixsl:variable>
				<iaixsl:variable name="bundledCount"><iaixsl:value-of select="count(/shop/page/projector/bundled/product[enclosures/images/enclosure[1]/@icon])"/></iaixsl:variable>
				<iaixsl:variable name="videoCount"><iaixsl:choose><iaixsl:when test="/shop/page/projector/product/enclosures/video/item">1</iaixsl:when><iaixsl:otherwise>0</iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
				<iaixsl:variable name="imagesSum"><iaixsl:value-of select="$enclosureCount + $bundledCount + $videoCount"/></iaixsl:variable>
				<iaixsl:if test="$imagesSum &gt; 1 or /shop/page/projector/product/enclosures/video/item">
					<iaixsl:attribute name="data-nav">true</iaixsl:attribute>
					
					<div id="photos_nav" class="photos__nav d-none d-md-flex flex-md-column">
						<iaixsl:if test="$imagesSum &gt; ($thumbnailsCount - $videoCount)">
							<iaixsl:attribute name="data-more-slides"><iaixsl:value-of select="$imagesSum - $thumbnailsCount"/></iaixsl:attribute>
						</iaixsl:if>
						<iaixsl:for-each select="page/projector/product/enclosures/images/enclosure">
							<iaixsl:if test="not(position() - 1 &gt; ($thumbnailsCount - $videoCount))">
								<figure class="photos__figure --nav">
									<iaixsl:choose>
										<iaixsl:when test="(position() - 1 = ($thumbnailsCount - $videoCount)) and ($imagesSum &gt; ($thumbnailsCount - $videoCount))">
											<iaixsl:attribute name="class">photos__figure --nav --more</iaixsl:attribute>
											<a class="photos__link --nav --more">
												<iaixsl:attribute name="data-more"><iaixsl:value-of select="$imagesSum - $thumbnailsCount"/></iaixsl:attribute>
												<iaixsl:attribute name="data-slick-index"><iaixsl:value-of select="position() - 1"/></iaixsl:attribute>
												<iaixsl:attribute name="href"><iaixsl:value-of disable-output-escaping="yes" select="@url"/></iaixsl:attribute>
												<span class="photos__more_top">+<span class="photos__more_count"><iaixsl:value-of select="$imagesSum - $thumbnailsCount"/></span></span>
												<span class="photos__more_bottom">mehr</span>
											</a>
										</iaixsl:when>
										<iaixsl:otherwise>
											<a class="photos__link --nav">
												<iaixsl:attribute name="href"><iaixsl:value-of disable-output-escaping="yes" select="@url"/></iaixsl:attribute>
												<iaixsl:attribute name="data-slick-index"><iaixsl:value-of select="position() - 1"/></iaixsl:attribute>
												<iaixsl:attribute name="data-width"><iaixsl:value-of select="@icon_width"/></iaixsl:attribute>
												<iaixsl:attribute name="data-height"><iaixsl:value-of select="@icon_height"/></iaixsl:attribute>
												<iaixsl:choose>
                        
                          <iaixsl:when test="@icon_second and not(@icon_second = '' or @icon_second = '/')">
                            <picture>
                              <source type="image/webp">
                                <iaixsl:attribute name="srcset"><iaixsl:value-of select="@icon"/></iaixsl:attribute>
                              </source>
                              <img class="photos__photo b-lazy --nav">
                                <iaixsl:attribute name="width"><iaixsl:value-of select="@icon_width"/></iaixsl:attribute>
                                <iaixsl:attribute name="height"><iaixsl:value-of select="@icon_height"/></iaixsl:attribute>
                                <iaixsl:attribute name="alt"><iaixsl:value-of disable-output-escaping="yes" select="/shop/page/projector/product/name"/></iaixsl:attribute>
                                <iaixsl:attribute name="data-src"><iaixsl:value-of select="@icon_second"/></iaixsl:attribute>
                              </img>
                            </picture>
                          </iaixsl:when>
                          <iaixsl:otherwise>
                            <img class="photos__photo b-lazy --nav">
                              <iaixsl:attribute name="width"><iaixsl:value-of select="@icon_width"/></iaixsl:attribute>
                              <iaixsl:attribute name="height"><iaixsl:value-of select="@icon_height"/></iaixsl:attribute>
                              <iaixsl:attribute name="alt"><iaixsl:value-of disable-output-escaping="yes" select="/shop/page/projector/product/name"/></iaixsl:attribute>
                              <iaixsl:attribute name="data-src"><iaixsl:value-of select="@icon"/></iaixsl:attribute>
                            </img>
                          </iaixsl:otherwise>
                        </iaixsl:choose>
											</a>
										</iaixsl:otherwise>
									</iaixsl:choose>
								</figure>
							</iaixsl:if>
						</iaixsl:for-each>
						<iaixsl:for-each select="page/projector/bundled/product[enclosures/images/enclosure[1]/@icon]">
							<iaixsl:variable name="positionCount"><iaixsl:value-of select="$enclosureCount + position()"/></iaixsl:variable>
							<iaixsl:if test="not($positionCount - 1 &gt; ($thumbnailsCount - $videoCount))">
								<figure class="photos__figure --nav">
									<iaixsl:choose>
										<iaixsl:when test="($positionCount - 1 = ($thumbnailsCount - $videoCount)) and ($imagesSum &gt; ($thumbnailsCount - $videoCount))">
											<iaixsl:attribute name="class">photos__figure --nav --more</iaixsl:attribute>
											<a class="photos__link --nav --more">
												<iaixsl:attribute name="data-more"><iaixsl:value-of select="$imagesSum - $thumbnailsCount"/></iaixsl:attribute>
												<iaixsl:attribute name="data-slick-index"><iaixsl:value-of select="$positionCount - 1"/></iaixsl:attribute>
												<iaixsl:attribute name="href"><iaixsl:value-of disable-output-escaping="yes" select="enclosures/images/enclosure[1]/@url"/></iaixsl:attribute>
												<span class="photos__more_top">+<span class="photos__more_count"><iaixsl:value-of select="$imagesSum - $thumbnailsCount"/></span></span>
												<span class="photos__more_bottom">mehr</span>
											</a>
										</iaixsl:when>
										<iaixsl:otherwise>
											<a class="photos__link --nav">
												<iaixsl:attribute name="href"><iaixsl:value-of disable-output-escaping="yes" select="enclosures/images/enclosure[1]/@url"/></iaixsl:attribute>
												<iaixsl:attribute name="data-slick-index"><iaixsl:value-of select="$positionCount - 1"/></iaixsl:attribute>
												<iaixsl:attribute name="data-width"><iaixsl:value-of select="enclosures/images/enclosure[1]/@icon_width"/></iaixsl:attribute>
												<iaixsl:attribute name="data-height"><iaixsl:value-of select="enclosures/images/enclosure[1]/@icon_height"/></iaixsl:attribute>
												<iaixsl:choose>
                          
                          <iaixsl:when test="enclosures/images/enclosure[1]/@icon_second and not(enclosures/images/enclosure[1]/@icon_second = '' or enclosures/images/enclosure[1]/@icon_second = '/')">
                            <picture>
                              <source type="image/webp">
                                <iaixsl:attribute name="srcset"><iaixsl:value-of select="enclosures/images/enclosure[1]/@icon"/></iaixsl:attribute>
                              </source>
                              <img class="photos__photo b-lazy --nav">
                                <iaixsl:attribute name="width"><iaixsl:value-of select="enclosures/images/enclosure[1]/@icon_width"/></iaixsl:attribute>
                                <iaixsl:attribute name="height"><iaixsl:value-of select="enclosures/images/enclosure[1]/@icon_height"/></iaixsl:attribute>
                                <iaixsl:attribute name="alt"><iaixsl:value-of disable-output-escaping="yes" select="name"/></iaixsl:attribute>
                                <iaixsl:attribute name="data-src"><iaixsl:value-of select="enclosures/images/enclosure[1]/@icon_second"/></iaixsl:attribute>
                              </img>
                            </picture>
                          </iaixsl:when>
                          <iaixsl:otherwise>
                            <img class="photos__photo b-lazy --nav">
                              <iaixsl:attribute name="width"><iaixsl:value-of select="enclosures/images/enclosure[1]/@icon_width"/></iaixsl:attribute>
                              <iaixsl:attribute name="height"><iaixsl:value-of select="enclosures/images/enclosure[1]/@icon_height"/></iaixsl:attribute>
                              <iaixsl:attribute name="alt"><iaixsl:value-of disable-output-escaping="yes" select="name"/></iaixsl:attribute>
                              <iaixsl:attribute name="data-src"><iaixsl:value-of select="enclosures/images/enclosure[1]/@icon"/></iaixsl:attribute>
                            </img>
                          </iaixsl:otherwise>
                        </iaixsl:choose>
											</a>
										</iaixsl:otherwise>
									</iaixsl:choose>
								</figure>
							</iaixsl:if>
						</iaixsl:for-each>
						<iaixsl:if test="/shop/page/projector/product/enclosures/video/item">
							<figure class="photos__figure --nav --video">
								<a class="photos__link --nav --video">
									<iaixsl:attribute name="data-slick-index"><iaixsl:value-of select="$imagesSum - 1"/></iaixsl:attribute>
									<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/page/projector/product/enclosures/video/item/@url"/></iaixsl:attribute>
								</a>
							</figure>
						</iaixsl:if>
					</div>
				</iaixsl:if>

				
				<div id="photos_slider" class="photos__slider" data-skeleton="true">
					<iaixsl:if test="$imagesSum &gt; 1 or /shop/page/projector/product/enclosures/video/item">
						<iaixsl:attribute name="data-nav">true</iaixsl:attribute>
					</iaixsl:if>

					<div class="photos___slider_wrapper">
						<iaixsl:for-each select="page/projector/product/enclosures/images/enclosure">
							<figure class="photos__figure">
								<a class="photos__link">
									<iaixsl:attribute name="href"><iaixsl:value-of disable-output-escaping="yes" select="@url"/></iaixsl:attribute>
									<iaixsl:attribute name="data-width"><iaixsl:value-of select="@width"/></iaixsl:attribute>
									<iaixsl:attribute name="data-height"><iaixsl:value-of select="@height"/></iaixsl:attribute>
									<iaixsl:if test="@url_second and not(@url_second = '' or @url_second = '/')">
										<iaixsl:attribute name="data-href"><iaixsl:value-of disable-output-escaping="yes" select="@url_second"/></iaixsl:attribute>
									</iaixsl:if>
									<iaixsl:choose>
                  
                    <iaixsl:when test="@medium_second and not(@medium_second = '' or @medium_second = '/')">
                      <picture>
                        <source type="image/webp">
                          <iaixsl:attribute name="srcset"><iaixsl:value-of select="@medium"/></iaixsl:attribute>
                        </source>
                        <img class="photos__photo slick-loading">
                          <iaixsl:attribute name="width"><iaixsl:value-of select="@width"/></iaixsl:attribute>
                          <iaixsl:attribute name="height"><iaixsl:value-of select="@height"/></iaixsl:attribute>
                          <iaixsl:attribute name="alt"><iaixsl:value-of disable-output-escaping="yes" select="/shop/page/projector/product/name"/></iaixsl:attribute>
                          <iaixsl:choose>
                            <iaixsl:when test="position() = 1">
                              <iaixsl:attribute name="class">photos__photo</iaixsl:attribute>
                              <iaixsl:attribute name="src"><iaixsl:value-of select="@medium_second"/></iaixsl:attribute>
                            </iaixsl:when>
                            <iaixsl:otherwise>
                              <iaixsl:attribute name="data-lazy"><iaixsl:value-of select="@medium_second"/></iaixsl:attribute>
                            </iaixsl:otherwise>
                          </iaixsl:choose>
                          <iaixsl:if test="$magnify"><iaixsl:attribute name="data-zoom-image"><iaixsl:value-of select="@url"/></iaixsl:attribute></iaixsl:if>
                        </img>
                      </picture>
                    </iaixsl:when>
                    <iaixsl:otherwise>
                      <img class="photos__photo slick-loading">
                        <iaixsl:attribute name="width"><iaixsl:value-of select="@width"/></iaixsl:attribute>
                        <iaixsl:attribute name="height"><iaixsl:value-of select="@height"/></iaixsl:attribute>
                        <iaixsl:attribute name="alt"><iaixsl:value-of disable-output-escaping="yes" select="/shop/page/projector/product/name"/></iaixsl:attribute>
                        <iaixsl:choose>
                          <iaixsl:when test="position() = 1">
                            <iaixsl:attribute name="class">photos__photo</iaixsl:attribute>
                            <iaixsl:attribute name="src"><iaixsl:value-of select="@medium"/></iaixsl:attribute>
                          </iaixsl:when>
                          <iaixsl:otherwise>
                            <iaixsl:attribute name="data-lazy"><iaixsl:value-of select="@medium"/></iaixsl:attribute>
                          </iaixsl:otherwise>
                        </iaixsl:choose>
                        <iaixsl:if test="$magnify"><iaixsl:attribute name="data-zoom-image"><iaixsl:value-of select="@url"/></iaixsl:attribute></iaixsl:if>
                      </img>
                    </iaixsl:otherwise>
                  </iaixsl:choose>
								</a>
							</figure>
						</iaixsl:for-each>
						<iaixsl:for-each select="page/projector/bundled/product[enclosures/images/enclosure[1]/@icon]">
							<figure class="photos__figure">
								<a class="photos__link">
									<iaixsl:attribute name="href"><iaixsl:value-of disable-output-escaping="yes" select="enclosures/images/enclosure[1]/@url"/></iaixsl:attribute>
									<iaixsl:attribute name="data-width"><iaixsl:value-of select="enclosures/images/enclosure[1]/@width"/></iaixsl:attribute>
									<iaixsl:attribute name="data-height"><iaixsl:value-of select="enclosures/images/enclosure[1]/@height"/></iaixsl:attribute>
									<iaixsl:if test="enclosures/images/enclosure[1]/@url_second and not(enclosures/images/enclosure[1]/@url_second = '' or enclosures/images/enclosure[1]/@url_second = '/')">
										<iaixsl:attribute name="data-href"><iaixsl:value-of disable-output-escaping="yes" select="enclosures/images/enclosure[1]/@url_second"/></iaixsl:attribute>
									</iaixsl:if>
									<iaixsl:choose>
                  
                    <iaixsl:when test="enclosures/images/enclosure[1]/@medium_second and not(enclosures/images/enclosure[1]/@medium_second = '' or enclosures/images/enclosure[1]/@medium_second = '/')">
                      <picture>
                        <source type="image/webp">
                          <iaixsl:attribute name="srcset"><iaixsl:value-of select="enclosures/images/enclosure[1]/@medium"/></iaixsl:attribute>
                        </source>
                        <img class="photos__photo slick-loading">
                          <iaixsl:attribute name="width"><iaixsl:value-of select="enclosures/images/enclosure[1]/@width"/></iaixsl:attribute>
                          <iaixsl:attribute name="height"><iaixsl:value-of select="enclosures/images/enclosure[1]/@height"/></iaixsl:attribute>
                          <iaixsl:attribute name="alt"><iaixsl:value-of disable-output-escaping="yes" select="name"/></iaixsl:attribute>
                          <iaixsl:choose>
                            <iaixsl:when test="not(page/projector/product/enclosures/images/enclosure) and position() = 1">
                              <iaixsl:attribute name="class">photos__photo</iaixsl:attribute>
                              <iaixsl:attribute name="src"><iaixsl:value-of select="enclosures/images/enclosure[1]/@medium_second"/></iaixsl:attribute>
                            </iaixsl:when>
                            <iaixsl:otherwise>
                              <iaixsl:attribute name="data-lazy"><iaixsl:value-of select="enclosures/images/enclosure[1]/@medium_second"/></iaixsl:attribute>
                            </iaixsl:otherwise>
                          </iaixsl:choose>
                          <iaixsl:if test="$magnify"><iaixsl:attribute name="data-zoom-image"><iaixsl:value-of select="enclosures/images/enclosure[1]/@url"/></iaixsl:attribute></iaixsl:if>
                        </img>
                      </picture>
                    </iaixsl:when>
                    <iaixsl:otherwise>
                      <img class="photos__photo slick-loading">
                        <iaixsl:attribute name="width"><iaixsl:value-of select="enclosures/images/enclosure[1]/@width"/></iaixsl:attribute>
                        <iaixsl:attribute name="height"><iaixsl:value-of select="enclosures/images/enclosure[1]/@height"/></iaixsl:attribute>
                        <iaixsl:attribute name="alt"><iaixsl:value-of disable-output-escaping="yes" select="name"/></iaixsl:attribute>
                        <iaixsl:choose>
                          <iaixsl:when test="not(page/projector/product/enclosures/images/enclosure) and position() = 1">
                            <iaixsl:attribute name="class">photos__photo</iaixsl:attribute>
                            <iaixsl:attribute name="src"><iaixsl:value-of select="enclosures/images/enclosure[1]/@medium"/></iaixsl:attribute>
                          </iaixsl:when>
                          <iaixsl:otherwise>
                            <iaixsl:attribute name="data-lazy"><iaixsl:value-of select="enclosures/images/enclosure[1]/@medium"/></iaixsl:attribute>
                          </iaixsl:otherwise>
                        </iaixsl:choose>
                        <iaixsl:if test="$magnify"><iaixsl:attribute name="data-zoom-image"><iaixsl:value-of select="enclosures/images/enclosure[1]/@url"/></iaixsl:attribute></iaixsl:if>
                      </img>
                    </iaixsl:otherwise>
                  </iaixsl:choose>
								</a>
							</figure>
						</iaixsl:for-each>
						<iaixsl:if test="/shop/page/projector/product/enclosures/video/item">
							<figure class="photos__figure --video">
								<a class="photos__link --video">
									<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/page/projector/product/enclosures/video/item/@url"/></iaixsl:attribute>
									<video controls="controls" autoplay="autoplay">
										<iaixsl:attribute name="data-src"><iaixsl:value-of select="/shop/page/projector/product/enclosures/video/item/@url"/></iaixsl:attribute>
									</video>
								</a>
							</figure>
						</iaixsl:if>
					</div>

					
					<iaixsl:if test="$magnify"><span class="photos__magnify"><iaixsl:value-of select="$magnify"/></span></iaixsl:if>
				</div>
			</iaixsl:when>
			<iaixsl:otherwise>
				<div id="photos_default" class="photos__default d-flex justify-content-center">
					<figure class="photos__default_figure">
					  <iaixsl:choose>
            
              <iaixsl:when test="/shop/page/projector/product/icon_second and not(/shop/page/projector/product/icon_second = '' or /shop/page/projector/product/icon_second = '/')">
                <picture>
                  <source type="image/webp">
                    <iaixsl:attribute name="srcset"><iaixsl:value-of select="/shop/page/projector/product/icon"/></iaixsl:attribute>
                  </source>
                  <img class="photos__default_img">
                    <iaixsl:attribute name="src"><iaixsl:value-of select="/shop/page/projector/product/icon_second"/></iaixsl:attribute>
                    <iaixsl:attribute name="alt"><iaixsl:value-of disable-output-escaping="yes" select="/shop/page/projector/product/name"/></iaixsl:attribute>
                  </img>
                </picture>
              </iaixsl:when>
              <iaixsl:otherwise>
                <img class="photos__default_img">
                  <iaixsl:attribute name="src"><iaixsl:value-of select="/shop/page/projector/product/icon"/></iaixsl:attribute>
                  <iaixsl:attribute name="alt"><iaixsl:value-of disable-output-escaping="yes" select="/shop/page/projector/product/name"/></iaixsl:attribute>
                </img>
              </iaixsl:otherwise>
            </iaixsl:choose>
					</figure>
				</div>
			</iaixsl:otherwise>
		</iaixsl:choose>
	</section>

	
	<div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="pswp__bg"/>
		<div class="pswp__scroll-wrap">
			<div class="pswp__container">
				<div class="pswp__item"/>
				<div class="pswp__item"/>
				<div class="pswp__item"/>
			</div>
			<div class="pswp__ui pswp__ui--hidden">
				<div class="pswp__top-bar">
					<div class="pswp__counter"/>
					<button class="pswp__button pswp__button--close" title="Close (Esc)"/>
					<button class="pswp__button pswp__button--share" title="Share"/>
					<button class="pswp__button pswp__button--fs" title="Toggle fullscreen"/>
					<button class="pswp__button pswp__button--zoom" title="Zoom in/out"/>

					<div class="pswp__preloader">
						<div class="pswp__preloader__icn">
						<div class="pswp__preloader__cut">
							<div class="pswp__preloader__donut"/>
						</div>
						</div>
					</div>
				</div>
				<div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
					<div class="pswp__share-tooltip"/>
				</div>

				<button class="pswp__button pswp__button--arrow--left" title="Previous (arrow left)">
				</button>

				<button class="pswp__button pswp__button--arrow--right" title="Next (arrow right)">
				</button>

				<div class="pswp__caption">
					<div class="pswp__caption__center"/>
				</div>
			</div>
		</div>
	</div>
<!-- (projector_productname, 614c5d31745b05.37327639.4)-->
	<section id="projector_productname" class="product_name">
		<iaixsl:if test="(/shop/page/projector/product/@promotion or /shop/page/projector/product/@new or /shop/page/projector/product/@bestseller or /shop/page/projector/product/@discount or (/shop/page/projector/product/@distinguished and not(/shop/page/projector/product/@bestseller and /shop/page/projector/product/@discount)) or /shop/page/projector/product/subscriptions/subscription) or /shop/page/projector/comments/@avg &gt; 0 or (/shop/page/projector/product/firm/@icon and not(/shop/page/projector/product/firm/@icon = ''))">
			<div class="product_name__block --info d-flex mb-2">
				
				<iaixsl:if test="/shop/page/projector/product/@promotion or /shop/page/projector/product/@new or /shop/page/projector/product/@bestseller or /shop/page/projector/product/@discount or (/shop/page/projector/product/@distinguished and not(/shop/page/projector/product/@bestseller and /shop/page/projector/product/@discount)) or /shop/page/projector/product/subscriptions/subscription">
					<div class="product_name__sub --label mr-3">
						<strong class="label_icons">
    					<iaixsl:if test="/shop/page/projector/product/subscriptions/subscription">
    						<span class="label --subscription">
    							Abonnement
    						</span>
    					</iaixsl:if>
							<iaixsl:if test="/shop/page/projector/product/@promotion">
								<span class="label --promo">
									Im Sonderangebot
								</span>
							</iaixsl:if>
							<iaixsl:if test="/shop/page/projector/product/@new">
								<span class="label --new">
									Neu
								</span>
							</iaixsl:if>
							<iaixsl:choose>
								<iaixsl:when test="/shop/page/projector/product/@promotion and /shop/page/projector/product/@new">
								</iaixsl:when>
								<iaixsl:when test="/shop/page/projector/product/@promotion or /shop/page/projector/product/@new">
									<iaixsl:choose>
										<iaixsl:when test="/shop/page/projector/product/@bestseller">
											<span class="label --bestseller">
												Unser Bestseller
											</span>
										</iaixsl:when>
										<iaixsl:when test="/shop/page/projector/product/@discount">
											<span class="label --discount">
												Preisreduzierung
											</span>
										</iaixsl:when>
										<iaixsl:when test="/shop/page/projector/product/@distinguished">
											<span class="label --distinguished">
												Empfohlen
											</span>
										</iaixsl:when>
									</iaixsl:choose>
								</iaixsl:when>
								<iaixsl:otherwise>
									<iaixsl:if test="/shop/page/projector/product/@bestseller">
										<span class="label --bestseller">
											Unser Bestseller
										</span>
									</iaixsl:if>
									<iaixsl:if test="/shop/page/projector/product/@discount">
										<span class="label --discount">
											Preisreduzierung
										</span>
									</iaixsl:if>
									<iaixsl:if test="/shop/page/projector/product/@distinguished and not(/shop/page/projector/product/@bestseller and /shop/page/projector/product/@discount)">
										<span class="label --distinguished">
											Empfohlen
										</span>
									</iaixsl:if>
								</iaixsl:otherwise>
							</iaixsl:choose>
						</strong>
					</div>
				</iaixsl:if>

				
				<iaixsl:if test="/shop/page/projector/comments/@avg &gt; 0">
					<div class="product_name__sub --notes d-flex">
						<span class="product_name__note">
							<i class="icon-star">
								<iaixsl:if test="/shop/page/projector/comments/@avg &gt; 0.5"><iaixsl:attribute name="class">icon-star --active</iaixsl:attribute></iaixsl:if>
							</i>
							<i class="icon-star">
								<iaixsl:if test="/shop/page/projector/comments/@avg &gt; 1.5"><iaixsl:attribute name="class">icon-star --active</iaixsl:attribute></iaixsl:if>
							</i>
							<i class="icon-star">
								<iaixsl:if test="/shop/page/projector/comments/@avg &gt; 2.5"><iaixsl:attribute name="class">icon-star --active</iaixsl:attribute></iaixsl:if>
							</i>
							<i class="icon-star">
								<iaixsl:if test="/shop/page/projector/comments/@avg &gt; 3.5"><iaixsl:attribute name="class">icon-star --active</iaixsl:attribute></iaixsl:if>
							</i>
							<i class="icon-star">
								<iaixsl:if test="/shop/page/projector/comments/@avg &gt; 4.5"><iaixsl:attribute name="class">icon-star --active</iaixsl:attribute></iaixsl:if>
							</i>
						</span>
						<span class="product_name__note_text"><iaixsl:value-of select="/shop/page/projector/comments/@avg"/>/5.00</span>
						<a class="product_name__note_link" href="#opinions_section">Meinungen (<iaixsl:value-of select="/shop/page/projector/comments/@all"/>)</a>
					</div>
				</iaixsl:if>

				
				<iaixsl:if test="/shop/page/projector/product/firm/@icon and not(/shop/page/projector/product/firm/@icon = '')">
					<div class="product_name__sub --firm ml-auto pl-1 d-flex justify-content-end align-items-start">
						<a class="firm_logo d-block">
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/page/projector/product/firm/@productslink"/></iaixsl:attribute>

							<img class="b-lazy" src="/gfx/standards/loader.gif?r=1696937716">
								<iaixsl:attribute name="data-src"><iaixsl:value-of select="/shop/page/projector/product/firm/@icon"/></iaixsl:attribute>
								<iaixsl:attribute name="title"><iaixsl:value-of select="/shop/page/projector/product/firm/@name"/></iaixsl:attribute>
								<iaixsl:attribute name="alt"><iaixsl:value-of select="/shop/page/projector/product/firm/@name"/></iaixsl:attribute>
							</img>
						</a>
					</div>
				</iaixsl:if>
			</div>
		</iaixsl:if>

		
		<div class="product_name__block --name mb-2">
			
			<h1 class="product_name__name m-0">
				<iaixsl:value-of disable-output-escaping="yes" select="/shop/page/projector/product/name"/>
			</h1>
		</div>

		
		<iaixsl:if test="/shop/page/projector/product/description and page/projector/product/description != ''">
			<div class="product_name__block --description mb-3">
				<iaixsl:value-of disable-output-escaping="yes" select="/shop/page/projector/product/description/text()"/>
			</div>
		</iaixsl:if>
	</section>
<!-- (projector_details, 61f9168a131515.56326691.20)-->
	<iaixsl:variable name="selectForSizes">6</iaixsl:variable>
	<iaixsl:variable name="selectForVersions">8</iaixsl:variable>
	<iaixsl:variable name="disable_projectorv3_ajax">1</iaixsl:variable>

	
	<script class="ajaxLoad">
		cena_raty = <iaixsl:value-of select="page/projector/product/price/@value"/>;
		<iaixsl:choose>
			<iaixsl:when test="basket/@login">
				var client_login = &apos;true&apos;
			</iaixsl:when>
			<iaixsl:otherwise>
				var client_login = &apos;false&apos;
			</iaixsl:otherwise>
		</iaixsl:choose>
		var client_points = &apos;<iaixsl:value-of select="/shop/basket/@client_points"/>&apos;;
		var points_used = &apos;<iaixsl:value-of select="/shop/basket/@points_used"/>&apos;;
		var shop_currency = &apos;<iaixsl:value-of select="/shop/currency/@name"/>&apos;;
		var product_data = {
		&quot;product_id&quot;: &apos;<iaixsl:value-of select="/shop/page/projector/product/@id"/>&apos;,
		<iaixsl:if test="/shop/page/projector/product/@for_points = 'true'">
			&quot;for_points&quot;: &apos;<iaixsl:value-of select="/shop/page/projector/product/@for_points"/>&apos;,
		</iaixsl:if>
		&quot;currency&quot;:&quot;<iaixsl:value-of select="/shop/currency/@name"/>&quot;,
		&quot;product_type&quot;:&quot;<iaixsl:value-of select="page/projector/product/@product_type"/>&quot;,
		&quot;unit&quot;:&quot;<iaixsl:value-of disable-output-escaping="yes" select="page/projector/product/sizes/@unit"/>&quot;,
		&quot;unit_plural&quot;:&quot;<iaixsl:value-of disable-output-escaping="yes" select="page/projector/product/sizes/@unit_plural"/>&quot;,

		&quot;unit_sellby&quot;:&quot;<iaixsl:value-of select="page/projector/product/sizes/@unit_sellby"/>&quot;,
		&quot;unit_precision&quot;:&quot;<iaixsl:value-of select="page/projector/product/sizes/@unit_precision"/>&quot;,

		&quot;base_price&quot;:{
		<iaixsl:for-each select="/shop/page/projector/product/sizes/prices/@*">
			&quot;<iaixsl:value-of select="name()"/>&quot;:&quot;<iaixsl:value-of select="."/>&quot;,
		</iaixsl:for-each>
		<iaixsl:for-each select="/shop/page/projector/product/price/@*">
			&quot;<iaixsl:value-of select="name()"/>&quot;:&quot;<iaixsl:value-of select="."/>&quot;<iaixsl:if test="position() != last()">,</iaixsl:if>
		</iaixsl:for-each>
		},

		&quot;order_quantity_range&quot;:{
		<iaixsl:for-each select="/shop/page/projector/product/order_quantity_range/*">
			&quot;<iaixsl:value-of select="name()"/>&quot;:&quot;<iaixsl:value-of select="."/>&quot;<iaixsl:if test="position() != last()">,</iaixsl:if>
		</iaixsl:for-each>
		},

		&quot;sizes&quot;:{
		<iaixsl:for-each select="/shop/page/projector/product/sizes/size">
		&quot;<iaixsl:choose><iaixsl:when test="@type = 'onesize'">uniw</iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@type"/></iaixsl:otherwise></iaixsl:choose>&quot;:
		{
		<iaixsl:for-each select="@*">
			&quot;<iaixsl:value-of select="name()"/>&quot;:<iaixsl:choose><iaixsl:when test=". = 'onesize'">&quot;uniw&quot;</iaixsl:when><iaixsl:when test="starts-with(name(), 'amount')"><iaixsl:value-of select="."/></iaixsl:when><iaixsl:otherwise><iaixsl:call-template name="escape-quote-string"><iaixsl:with-param name="str" select="."/></iaixsl:call-template></iaixsl:otherwise></iaixsl:choose>,
		</iaixsl:for-each>
		<iaixsl:for-each select="/shop/page/projector/product/bundle_price">
			&quot;<iaixsl:value-of select="name()"/>&quot;:{
			<iaixsl:for-each select="@*">
			&quot;<iaixsl:value-of select="name()"/>&quot;:&quot;<iaixsl:value-of select="."/>&quot;<iaixsl:if test="position() != last()">,</iaixsl:if>
			</iaixsl:for-each>
			},
		</iaixsl:for-each>
		<iaixsl:if test="price/rebateNumber">
			&quot;rebateNumber&quot;:{
			<iaixsl:if test="price/rebateNumber/rebate">
				&quot;items&quot;:[
					<iaixsl:for-each select="price/rebateNumber/rebate">
						{
						<iaixsl:for-each select="@*">
							&quot;<iaixsl:value-of select="name()"/>&quot;:&quot;<iaixsl:value-of select="."/>&quot;<iaixsl:if test="position() != last()">,</iaixsl:if>
						</iaixsl:for-each>
						}<iaixsl:if test="position() != last()">,</iaixsl:if>
					</iaixsl:for-each>
				],
			</iaixsl:if>
			<iaixsl:for-each select="price/rebateNumber/@*">
				&quot;<iaixsl:value-of select="name()"/>&quot;:&quot;<iaixsl:value-of select="."/>&quot;<iaixsl:if test="position() != last()">,</iaixsl:if>
			</iaixsl:for-each>
			},
		</iaixsl:if>
		<iaixsl:if test="availability/shipping_time">
			&quot;shipping_time&quot;:{
			<iaixsl:for-each select="availability/shipping_time ">
			<iaixsl:for-each select="@*">
				&quot;<iaixsl:value-of select="name()"/>&quot;:&quot;<iaixsl:value-of disable-output-escaping="yes" select="."/>&quot;<iaixsl:if test="position() != last()">,</iaixsl:if>
			</iaixsl:for-each>
			</iaixsl:for-each>
			},
		</iaixsl:if>
		<iaixsl:if test="availability/delay_time">
			&quot;delay_time&quot;:{
			<iaixsl:for-each select="availability/delay_time">
			<iaixsl:for-each select="@*">
				&quot;<iaixsl:value-of select="name()"/>&quot;:&quot;<iaixsl:value-of disable-output-escaping="yes" select="."/>&quot;<iaixsl:if test="position() != last()">,</iaixsl:if>
			</iaixsl:for-each>
			</iaixsl:for-each>
			},
		</iaixsl:if>

		<iaixsl:if test="$disable_projectorv3_ajax = '0'">
			<iaixsl:for-each select="node()[name() = 'availability']">
				&quot;<iaixsl:value-of select="name()"/>&quot;:{
				<iaixsl:for-each select="@*">
				&quot;<iaixsl:value-of select="name()"/>&quot;:&quot;<iaixsl:value-of select="."/>&quot;<iaixsl:if test="position() != last()">,</iaixsl:if>
				</iaixsl:for-each>
				},
			</iaixsl:for-each>
		</iaixsl:if>

		<iaixsl:for-each select="node()[not(name() = 'availability')]">
			&quot;<iaixsl:value-of select="name()"/>&quot;:{
			<iaixsl:for-each select="@*">
			&quot;<iaixsl:value-of select="name()"/>&quot;:&quot;<iaixsl:value-of select="."/>&quot;<iaixsl:if test="position() != last()">,</iaixsl:if>
			</iaixsl:for-each>
			}<iaixsl:if test="position() != last()">,</iaixsl:if>
		</iaixsl:for-each>
		}<iaixsl:if test="position() != last()">,</iaixsl:if>
		</iaixsl:for-each>
		}

		}
		var  trust_level = &apos;<iaixsl:value-of select="/shop/@trust_level"/>&apos;;
	</script>
	

	<form id="projector_form" class="projector_details is-validated" action="/basketchange.php" method="post">
		<iaixsl:if test="/shop/page/projector/product/price/@value = 0"><iaixsl:attribute name="class">projector_details is-validated --phone</iaixsl:attribute></iaixsl:if>
		<iaixsl:if test="count(/shop/page/projector/product/sizes/size[availability/@status = 'disable']) = count(/shop/page/projector/product/sizes/size)">
			<iaixsl:attribute name="data-sizes_disable">true</iaixsl:attribute>
		</iaixsl:if>
		<iaixsl:if test="/shop/action/basketChange/@url">
			<iaixsl:attribute name="action"><iaixsl:value-of select="/shop/action/basketChange/@url"/></iaixsl:attribute>
		</iaixsl:if>
		<iaixsl:attribute name="data-product_id"><iaixsl:value-of select="/shop/page/projector/product/@id"/></iaixsl:attribute>
		<iaixsl:if test="/shop/page/projector/bundled/@collection = 'true'">
			<iaixsl:attribute name="data-collection">true</iaixsl:attribute>
		</iaixsl:if>
		<iaixsl:attribute name="data-type"><iaixsl:value-of select="/shop/page/projector/product/@product_type"/></iaixsl:attribute>
		<iaixsl:if test="/shop/page/projector/product/@price_from_formula = 'true'">
			<iaixsl:attribute name="data-price_formula">true</iaixsl:attribute>
		</iaixsl:if>
		
		<iaixsl:if test="/shop/page/projector/product/subscriptions/subscription">
			<iaixsl:attribute name="data-subscription"><iaixsl:choose><iaixsl:when test="not(/shop/page/projector/product/subscriptions/@only_subscription)">true</iaixsl:when><iaixsl:otherwise>only</iaixsl:otherwise></iaixsl:choose></iaixsl:attribute>
		</iaixsl:if>
		<iaixsl:variable name="nettoPrice"><iaixsl:if test="/shop/page/@price_type = 'net'">true</iaixsl:if></iaixsl:variable>

    
    
    <iaixsl:variable name="var_omnibus_enabled"><iaixsl:if test="/shop/@omnibus = 1">true</iaixsl:if></iaixsl:variable>
    

		<button style="display:none;" type="submit"/>
		<input id="projector_product_hidden" type="hidden" name="product"><iaixsl:attribute name="value"><iaixsl:value-of select="page/projector/product/@id"/></iaixsl:attribute></input>
		<input id="projector_size_hidden" type="hidden" name="size" autocomplete="off">
			<iaixsl:if test="/shop/page/projector/product/sizes/size/@type = 'onesize'">
				<iaixsl:attribute name="value"><iaixsl:value-of select="/shop/page/projector/product/sizes/size/@type"/></iaixsl:attribute>
			</iaixsl:if>
		</input>
		<input id="projector_mode_hidden" type="hidden" name="mode" value="1"/>
		<iaixsl:if test="/shop/page/projector/product/exchange/@exchange_id">
			<input id="projector_exchange_id_hidden" type="hidden" name="exchange_id">
			<iaixsl:attribute name="value"><iaixsl:value-of select="/shop/page/projector/product/exchange/@exchange_id"/></iaixsl:attribute>
			</input>
			<input id="projector_change_hidden" type="hidden" name="change" value="change"/>
		</iaixsl:if>

		
		<iaixsl:if test="/shop/page/projector/product/subscriptions/subscription and /shop/page/projector/product/subscriptions/@only_subscription">
			<input type="hidden" name="subscription" value="1" id="projector_subscription_hidden"/>
		</iaixsl:if>

		
		<iaixsl:variable name="firstDaysInPeriod"><iaixsl:for-each select="/shop/page/projector/product/subscriptions/subscription"><iaixsl:sort select="@days_in_period" data-type="number"/><iaixsl:if test="position() = 1"><iaixsl:value-of select="@days_in_period"/></iaixsl:if></iaixsl:for-each></iaixsl:variable>
		<iaixsl:if test="/shop/page/projector/product/subscriptions/subscription">
			<input type="hidden" name="days_in_period" id="projector_subscription_days_hidden">
				<iaixsl:attribute name="value"><iaixsl:value-of select="$firstDaysInPeriod"/></iaixsl:attribute>
			</input>
		</iaixsl:if>

    
		<iaixsl:if test="/shop/page/projector/product/subscriptions/subscription and not(/shop/page/projector/product/subscriptions/@only_subscription)">
			<div class="projector_details__purchase --subscription projector_purchase f-group --radio">
				<input type="radio" name="subscription" class="f-control" value="1" id="radioSubscriptionTrue" checked="checked"/>
				<label class="f-label" for="radioSubscriptionTrue">
					<strong class="projector_purchase__label">Abonnement</strong>
					<iaixsl:if test="/shop/page/projector/product/subscriptions/subscription[rebate]">
						<span class="projector_purchase__yousave">
							<iaixsl:if test="/shop/page/projector/product/subscriptions/subscription[1]/rebate">
								<iaixsl:attribute name="class">projector_purchase__yousave --active</iaixsl:attribute>
							</iaixsl:if>
							<span class="projector_purchase__yousave_before">(Rabatt </span>
							<span class="projector_purchase__yousave_value"><iaixsl:value-of select="/shop/page/projector/product/subscriptions/subscription[rebate][1]/rebate/@value_formatted"/></span>
							<span class="projector_purchase__yousave_after"> beim Kauf im Abonnement)</span>
						</span>
					</iaixsl:if>
				</label>
			</div>

			<div class="projector_details__purchase --normal projector_purchase f-group --radio">
				<input type="radio" name="subscription" class="f-control" value="0" id="radioSubscriptionFalse"/>
				<label class="f-label" for="radioSubscriptionFalse">
					<strong class="projector_purchase__label">Einmaliger Kauf</strong>
					<iaixsl:if test="not(/shop/page/projector/product/price/@value = 0)">
						<span class="projector_purchase__price_wrapper">
							<iaixsl:choose>
								<iaixsl:when test="/shop/page/projector/product/sizes/prices and /shop/page/projector/product/sizes/prices/@maxprice_formatted != /shop/page/projector/product/sizes/prices/@minprice_formatted">
									<span class="projector_purchase__price_before">ab</span>
									<span class="projector_purchase__price">
										<iaixsl:choose>
											<iaixsl:when test="not($nettoPrice = '')">
												<iaixsl:value-of select="/shop/page/projector/product/sizes/prices/@minprice_net_formatted"/>
											</iaixsl:when>
											<iaixsl:otherwise>
												<iaixsl:value-of select="/shop/page/projector/product/sizes/prices/@minprice_formatted"/>
											</iaixsl:otherwise>
										</iaixsl:choose>
									</span>
								</iaixsl:when>
								<iaixsl:otherwise>
									<span class="projector_purchase__price">
										<iaixsl:choose>
											<iaixsl:when test="not($nettoPrice = '')">
												<iaixsl:value-of select="page/projector/product/price/@price_net_formatted"/>
											</iaixsl:when>
											<iaixsl:otherwise>
												<iaixsl:value-of select="page/projector/product/price/@price_formatted"/>
											</iaixsl:otherwise>
										</iaixsl:choose>
									</span>
								</iaixsl:otherwise>
							</iaixsl:choose>
							<span class="projector_purchase__price_after">
								<span class="projector_purchase__price_vat">
									<span class="price_vat"><iaixsl:value-of select="$priceTypeText"/></span>
								</span>
								<span class="projector_purchase__price_unit_sep">
										/
								</span>
								<span class="projector_purchase__price_unit"><iaixsl:value-of select="/shop/page/projector/product/sizes/@unit"/></span>
							</span>
						</span>
					</iaixsl:if>
				</label>
			</div>
		</iaixsl:if>

		<div class="projector_details__wrapper">
			
			<iaixsl:if test="/shop/page/projector/subscriptions_rebates/rebate[@renewals_number_from != '1'] and /shop/page/projector/product/subscriptions/subscription">
				<div class="projector_details__subscription_rebates projector_subscription_rebates">
					<iaixsl:variable name="subscriptionRebateValue"><iaixsl:value-of select="/shop/page/projector/subscriptions_rebates/rebate[@renewals_number_from != '1']/@value_formatted"/></iaixsl:variable>
					<iaixsl:variable name="subscriptionRebateRenewals"><iaixsl:value-of select="/shop/page/projector/subscriptions_rebates/rebate[@renewals_number_from != '1']/@renewals_number_from"/></iaixsl:variable>
					<iaixsl:variable name="subcriptionRebateText">Ab der %s. Lieferung in diesem Abonnement beträgt der Rabatt -%s</iaixsl:variable>
					<iaixsl:value-of select="php:function('sprintf', $subcriptionRebateText, $subscriptionRebateRenewals, $subscriptionRebateValue)"/>
				</div>
			</iaixsl:if>

			
			
			<iaixsl:variable name="var_omnibus_min"><iaixsl:choose>
				<iaixsl:when test="not($nettoPrice = '')">
					<iaixsl:for-each select="/shop/page/projector/product/sizes/size[price/@omnibus_price_net]">
						<iaixsl:sort select="price/@omnibus_price_net" data-type="number"/>
						<iaixsl:if test="position() = 1"><iaixsl:value-of select="price/@omnibus_price_net_formatted"/></iaixsl:if>
					</iaixsl:for-each>
				</iaixsl:when>
				<iaixsl:otherwise>
					<iaixsl:for-each select="/shop/page/projector/product/sizes/size[price/@omnibus_price]">
						<iaixsl:sort select="price/@omnibus_price" data-type="number"/>
						<iaixsl:if test="position() = 1"><iaixsl:value-of select="price/@omnibus_price_formatted"/></iaixsl:if>
					</iaixsl:for-each>
				</iaixsl:otherwise>
			</iaixsl:choose></iaixsl:variable>

			
			<iaixsl:variable name="var_omnibus_max"><iaixsl:choose>
				<iaixsl:when test="not($nettoPrice = '')">
					<iaixsl:for-each select="/shop/page/projector/product/sizes/size[price/@omnibus_price_net]">
						<iaixsl:sort select="price/@omnibus_price_net" data-type="number" order="descending"/>
						<iaixsl:if test="position() = 1"><iaixsl:value-of select="price/@omnibus_price_net_formatted"/></iaixsl:if>
					</iaixsl:for-each>
				</iaixsl:when>
				<iaixsl:otherwise>
					<iaixsl:for-each select="/shop/page/projector/product/sizes/size[price/@omnibus_price]">
						<iaixsl:sort select="price/@omnibus_price" data-type="number" order="descending"/>
						<iaixsl:if test="position() = 1"><iaixsl:value-of select="price/@omnibus_price_formatted"/></iaixsl:if>
					</iaixsl:for-each>
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
				<iaixsl:when test="not($nettoPrice = '')">
					<iaixsl:choose>
						<iaixsl:when test="/shop/page/projector/product/@product_type = 'product_bundle' and not(/shop/page/projector/product/bundle_price/@percent_diff = 0) and not(/shop/page/projector/product/bundle_price/@amount_diff_net = 0) and (/shop/page/projector/product/bundle_price/@price_net_formatted = $var_omnibus)">true</iaixsl:when>
						<iaixsl:when test="/shop/page/projector/product/sizes/prices/@size_min_maxprice_net_formatted != /shop/page/projector/product/sizes/prices/@size_max_maxprice_net_formatted and /shop/page/projector/product/sizes/prices/@size_min_maxprice_net_formatted = $var_omnibus_min and /shop/page/projector/product/sizes/prices/@size_max_maxprice_net_formatted = $var_omnibus_max">true</iaixsl:when>
						<iaixsl:when test="/shop/page/projector/product/price/@maxprice_net_formatted = $var_omnibus and not(/shop/page/projector/product/@product_type = 'product_bundle')">true</iaixsl:when>
					</iaixsl:choose>
				</iaixsl:when>
				<iaixsl:otherwise>
					<iaixsl:choose>
						<iaixsl:when test="/shop/page/projector/product/@product_type = 'product_bundle' and not(/shop/page/projector/product/bundle_price/@percent_diff = 0) and not(/shop/page/projector/product/bundle_price/@amount_diff_gross = 0) and (/shop/page/projector/product/bundle_price/@price_gross_formatted = $var_omnibus)">true</iaixsl:when>
						<iaixsl:when test="/shop/page/projector/product/sizes/prices/@size_min_maxprice_formatted != /shop/page/projector/product/sizes/prices/@size_max_maxprice_formatted and /shop/page/projector/product/sizes/prices/@size_min_maxprice_formatted = $var_omnibus_min and /shop/page/projector/product/sizes/prices/@size_max_maxprice_formatted = $var_omnibus_max">true</iaixsl:when>
						<iaixsl:when test="/shop/page/projector/product/price/@maxprice_formatted = $var_omnibus and not(/shop/page/projector/product/@product_type = 'product_bundle')">true</iaixsl:when>
					</iaixsl:choose>
				</iaixsl:otherwise>
			</iaixsl:choose></iaixsl:if></iaixsl:variable>

			
			
			
			<iaixsl:variable name="last_price_change_date"><iaixsl:choose>
				<iaixsl:when test="/shop/page/projector/product/sizes/size/price and (count(/shop/page/projector/product/sizes/size) &gt; 1)"><iaixsl:for-each select="/shop/page/projector/product/sizes/size[price/@last_price_change_date]"><iaixsl:if test="@type and price/@last_price_change_date"><iaixsl:value-of select="price/@last_price_change_date"/>;&apos;<iaixsl:value-of select="@type"/>&apos;<iaixsl:if test="not(position() = last())">#separator#</iaixsl:if></iaixsl:if></iaixsl:for-each></iaixsl:when>
				<iaixsl:when test="/shop/page/projector/product/price/@last_price_change_date"><iaixsl:value-of select="/shop/page/projector/product/price/@last_price_change_date"/></iaixsl:when>
			</iaixsl:choose></iaixsl:variable>

			
			<iaixsl:variable name="var_show_omnibus_short_fallback"><iaixsl:choose>
				<iaixsl:when test="($var_omnibus = '' and $var_omnibus_enabled = 'true' and not($last_price_change_date = ''))">true</iaixsl:when>
			</iaixsl:choose></iaixsl:variable>
			
			

			
			<div id="projector_prices_wrapper" class="projector_details__prices projector_prices">
				<iaixsl:attribute name="class">projector_details__prices projector_prices<iaixsl:if test="/shop/page/projector/product/price/@value = 0 and /shop/page/projector/product/price/@points &gt; 0"> --only-points</iaixsl:if><iaixsl:if test="$var_omnibus != ''"> --omnibus<iaixsl:if test="$var_omnibus_short = 'true'"> --omnibus-short</iaixsl:if></iaixsl:if></iaixsl:attribute>

				
				
				<iaixsl:if test="$var_show_omnibus_short_fallback = 'true'">

					
					<iaixsl:attribute name="data-last_price_change_date"><iaixsl:value-of select="$last_price_change_date"/></iaixsl:attribute>

					
					
					<iaixsl:attribute name="data-omnibus-type">details</iaixsl:attribute>

					
					<iaixsl:if test="/shop/page/projector/product/@id">
						<iaixsl:attribute name="data-omnibus_product_id"><iaixsl:value-of select="/shop/page/projector/product/@id"/></iaixsl:attribute>
					</iaixsl:if>

					
					
					<iaixsl:if test="/shop/page/projector/product/@product_type">
						<iaixsl:attribute name="data-omnibus_product_type"><iaixsl:value-of select="/shop/page/projector/product/@product_type"/></iaixsl:attribute>
					</iaixsl:if>

					
					<iaixsl:if test="/shop/page/projector/product/bundle_price/@percent_diff">
						<iaixsl:attribute name="data-bundle_percent_diff"><iaixsl:value-of select="/shop/page/projector/product/bundle_price/@percent_diff"/></iaixsl:attribute>
					</iaixsl:if>

					
					<iaixsl:if test="/shop/page/projector/product/bundle_price/@amount_diff_net or /shop/page/projector/product/bundle_price/@amount_diff_gross">
						<iaixsl:attribute name="data-bundle_amount_diff"><iaixsl:choose>
							<iaixsl:when test="not($nettoPrice = '') and /shop/page/projector/product/bundle_price/@amount_diff_net"><iaixsl:value-of select="/shop/page/projector/product/bundle_price/@amount_diff_net"/></iaixsl:when>
							<iaixsl:otherwise><iaixsl:value-of select="/shop/page/projector/product/bundle_price/@amount_diff_gross"/></iaixsl:otherwise>
						</iaixsl:choose></iaixsl:attribute>
					</iaixsl:if>

					
					<iaixsl:if test="/shop/page/projector/product/bundle_price/@price_net or /shop/page/projector/product/bundle_price/@price_gross">
						<iaixsl:attribute name="data-bundle_price"><iaixsl:choose>
							<iaixsl:when test="not($nettoPrice = '') and /shop/page/projector/product/bundle_price/@price_net"><iaixsl:value-of select="/shop/page/projector/product/bundle_price/@price_net"/></iaixsl:when>
							<iaixsl:otherwise><iaixsl:value-of select="/shop/page/projector/product/bundle_price/@price_gross"/></iaixsl:otherwise>
						</iaixsl:choose></iaixsl:attribute>
					</iaixsl:if>

					
					<iaixsl:if test="/shop/page/projector/product/price/@maxprice or /shop/page/projector/product/price/@maxprice_net">
						<iaixsl:attribute name="data-maxprice"><iaixsl:choose>
							<iaixsl:when test="not($nettoPrice = '') and /shop/page/projector/product/price/@maxprice_net"><iaixsl:value-of select="/shop/page/projector/product/price/@maxprice_net"/></iaixsl:when>
							<iaixsl:otherwise><iaixsl:value-of select="/shop/page/projector/product/price/@maxprice"/></iaixsl:otherwise>
						</iaixsl:choose></iaixsl:attribute>
					</iaixsl:if>

					
					<iaixsl:if test="/shop/page/projector/product/sizes/prices/@size_min_maxprice or /shop/page/projector/product/sizes/prices/@size_min_maxprice_net">
						<iaixsl:attribute name="data-sizes_min_maxprice"><iaixsl:choose>
							<iaixsl:when test="not($nettoPrice = '') and /shop/page/projector/product/sizes/prices/@size_min_maxprice_net"><iaixsl:value-of select="/shop/page/projector/product/sizes/prices/@size_min_maxprice_net"/></iaixsl:when>
							<iaixsl:otherwise><iaixsl:value-of select="/shop/page/projector/product/sizes/prices/@size_min_maxprice"/></iaixsl:otherwise>
						</iaixsl:choose></iaixsl:attribute>
					</iaixsl:if>

					
					<iaixsl:if test="/shop/page/projector/product/sizes/prices/@size_max_maxprice or /shop/page/projector/product/sizes/prices/@size_max_maxprice_net">
						<iaixsl:attribute name="data-sizes_max_maxprice"><iaixsl:choose>
							<iaixsl:when test="not($nettoPrice = '') and /shop/page/projector/product/sizes/prices/@size_max_maxprice_net"><iaixsl:value-of select="/shop/page/projector/product/sizes/prices/@size_max_maxprice_net"/></iaixsl:when>
							<iaixsl:otherwise><iaixsl:value-of select="/shop/page/projector/product/sizes/prices/@size_max_maxprice"/></iaixsl:otherwise>
						</iaixsl:choose></iaixsl:attribute>
					</iaixsl:if>
				</iaixsl:if>
				

				
				<div class="projector_prices__price_wrapper">
					
					<div class="projector_prices__maxprice_wrapper" id="projector_price_maxprice_wrapper">
						<iaixsl:if test="(not(/shop/page/projector/product/bundle_price/@percent_diff) or not(/shop/page/projector/product/bundle_price/@percent_diff &gt; 0) or not(/shop/page/projector/product/bundle_price/@amount_diff_gross &gt; 0)) and not(/shop/page/projector/product/price/@maxprice_formatted)">
							<iaixsl:attribute name="style">display:none;</iaixsl:attribute>
						</iaixsl:if>
						
						<iaixsl:if test="($var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
							<span class="omnibus_label --hidden"><iaixsl:if test="$var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Normaler Preis: </span>
						</iaixsl:if>
						
						<del class="projector_prices__maxprice" id="projector_price_maxprice">
							<iaixsl:choose>
								<iaixsl:when test="/shop/page/projector/product/bundle_price/@percent_diff and /shop/page/projector/product/bundle_price/@percent_diff &gt; 0 and /shop/page/projector/product/bundle_price/@amount_diff_gross &gt; 0">
									<iaixsl:choose>
										<iaixsl:when test="not($nettoPrice = '')">
											<iaixsl:value-of select="/shop/page/projector/product/bundle_price/@price_net_formatted"/>
										</iaixsl:when>
										<iaixsl:otherwise>
											<iaixsl:value-of select="/shop/page/projector/product/bundle_price/@price_gross_formatted"/>
										</iaixsl:otherwise>
									</iaixsl:choose>
								</iaixsl:when>
								<iaixsl:when test="/shop/page/projector/product/sizes/prices/@size_min_maxprice_formatted != /shop/page/projector/product/sizes/prices/@size_max_maxprice_formatted">
									<span>
										<iaixsl:choose>
											<iaixsl:when test="not($nettoPrice = '')">
												<iaixsl:value-of select="/shop/page/projector/product/sizes/prices/@size_min_maxprice_net_formatted"/>
											</iaixsl:when>
											<iaixsl:otherwise>
												<iaixsl:value-of select="/shop/page/projector/product/sizes/prices/@size_min_maxprice_formatted"/>
											</iaixsl:otherwise>
										</iaixsl:choose>
									</span>
										<b> - </b>
									<span>
										<iaixsl:choose>
											<iaixsl:when test="not($nettoPrice = '')">
												<iaixsl:value-of select="/shop/page/projector/product/sizes/prices/@size_max_maxprice_net_formatted"/>
											</iaixsl:when>
											<iaixsl:otherwise>
												<iaixsl:value-of select="/shop/page/projector/product/sizes/prices/@size_max_maxprice_formatted"/>
											</iaixsl:otherwise>
										</iaixsl:choose>
									</span>
								</iaixsl:when>
								<iaixsl:when test="page/projector/product/price/@maxprice_formatted">
									<iaixsl:choose>
										<iaixsl:when test="not($nettoPrice = '')">
											<iaixsl:value-of select="page/projector/product/price/@maxprice_net_formatted"/>
										</iaixsl:when>
										<iaixsl:otherwise>
											<iaixsl:value-of select="page/projector/product/price/@maxprice_formatted"/>
										</iaixsl:otherwise>
									</iaixsl:choose>
								</iaixsl:when>
							</iaixsl:choose>
						</del>
						
						<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short = 'true') or ($var_show_omnibus_short_fallback = 'true')">
							<span class="omnibus_short --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short = 'true'"><iaixsl:attribute name="class">omnibus_short</iaixsl:attribute></iaixsl:if>Niedrigster Preis in 30 Tagen vor Rabatt</span>
						</iaixsl:if>
						
						<span class="projector_prices__percent" id="projector_price_yousave">
							<iaixsl:if test="(not(/shop/page/projector/product/bundle_price/@percent_diff) or not(/shop/page/projector/product/bundle_price/@percent_diff &gt; 0) or not(/shop/page/projector/product/bundle_price/@amount_diff_gross &gt; 0)) and (not(/shop/page/projector/product/price/@yousave_percent) or not(/shop/page/projector/product/price/@yousave_percent &gt; 0))">
								<iaixsl:attribute name="style">display:none;</iaixsl:attribute>
							</iaixsl:if>
							<span class="projector_prices__percent_before">(Rabatt </span>
							<span class="projector_prices__percent_value">
								<iaixsl:choose>
									<iaixsl:when test="/shop/page/projector/product/bundle_price/@percent_diff and /shop/page/projector/product/bundle_price/@percent_diff &gt; 0 and /shop/page/projector/product/bundle_price/@amount_diff_gross &gt; 0">
										<iaixsl:choose>
											<iaixsl:when test="not(/shop/page/projector/product/bundle_price/@percent_diff &gt; 1)">
												<iaixsl:value-of select="/shop/page/projector/product/bundle_price/@percent_diff"/>
											</iaixsl:when>
											<iaixsl:otherwise>
												<iaixsl:value-of select="substring-before(/shop/page/projector/product/bundle_price/@percent_diff, '.')"/>
											</iaixsl:otherwise>
										</iaixsl:choose>
									</iaixsl:when>
									<iaixsl:when test="/shop/page/projector/product/price/@yousave_percent">
										<iaixsl:value-of select="/shop/page/projector/product/price/@yousave_percent"/>
									</iaixsl:when>
								</iaixsl:choose>
							</span>
							<iaixsl:choose>
								<iaixsl:when test="/shop/page/projector/product/bundle_price/@percent_diff and /shop/page/projector/product/bundle_price/@percent_diff &gt; 0 and /shop/page/projector/product/bundle_price/@amount_diff_gross &gt; 0">
									<iaixsl:choose>
										<iaixsl:when test="/shop/page/projector/bundled/@collection = 'true'">
											<span class="projector_prices__percent_after">% einkauf in Sammlung)</span>
										</iaixsl:when>
										<iaixsl:otherwise>
											<span class="projector_prices__percent_after">% wenn Sie im Set kaufen)</span>
										</iaixsl:otherwise>
									</iaixsl:choose>
								</iaixsl:when>
								<iaixsl:otherwise>
									<span class="projector_prices__percent_after">%)</span>
								</iaixsl:otherwise>
							</iaixsl:choose>
						</span>
					</div>

					<iaixsl:choose>
						<iaixsl:when test="/shop/page/projector/product/price/@value = 0">
							<strong class="projector_prices__price" id="projector_price_value">
								<iaixsl:if test="/shop/page/projector/product/price/@points &gt; 0">
									<iaixsl:attribute name="style">display:none;</iaixsl:attribute>
								</iaixsl:if>
								<a class="projector_prices__contact" href="/contact-pol.html" target="_blank">
									<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/contact/link/@url"/></iaixsl:attribute>
									<img>
										<iaixsl:attribute name="src"><iaixsl:value-of select="/shop/page/projector/product/sizes/size/availability/@status_gfx_tel"/></iaixsl:attribute>
										<iaixsl:attribute name="alt"><iaixsl:value-of select="/shop/page/projector/product/sizes/size/availability/@status_description_tel"/></iaixsl:attribute>
									</img>
									<span><iaixsl:value-of disable-output-escaping="yes" select="/shop/page/projector/product/sizes/size/availability/@status_description_tel"/></span>
								</a>
							</strong>
						</iaixsl:when>
						<iaixsl:otherwise>
							<strong class="projector_prices__price" id="projector_price_value">
								<iaixsl:choose>
									<iaixsl:when test="/shop/page/projector/product/sizes/prices and /shop/page/projector/product/sizes/prices/@maxprice_formatted != /shop/page/projector/product/sizes/prices/@minprice_formatted">
										
										<iaixsl:variable name="minprice"><iaixsl:value-of select="/shop/page/projector/product/sizes/prices/@minprice"/></iaixsl:variable>
										<iaixsl:variable name="maxprice"><iaixsl:value-of select="/shop/page/projector/product/sizes/prices/@maxprice"/></iaixsl:variable>
										<span>
											
											<iaixsl:attribute name="data-subscription-max"><iaixsl:choose>
												<iaixsl:when test="/shop/page/projector/product/sizes/size/price[@value = $minprice]/@maxprice">
													<iaixsl:value-of select="/shop/page/projector/product/sizes/size/price[@value = $minprice]/@maxprice"/>
												</iaixsl:when>
												<iaixsl:otherwise>
													<iaixsl:value-of select="$minprice"/>
												</iaixsl:otherwise>
											</iaixsl:choose></iaixsl:attribute>
											
											<iaixsl:attribute name="data-subscription-max-net"><iaixsl:choose>
												<iaixsl:when test="/shop/page/projector/product/sizes/size/price[@value = $minprice]/@maxprice_net">
													<iaixsl:value-of select="/shop/page/projector/product/sizes/size/price[@value = $minprice]/@maxprice_net"/>
												</iaixsl:when>
												<iaixsl:otherwise>
													<iaixsl:value-of select="/shop/page/projector/product/sizes/prices/@minprice_net"/>
												</iaixsl:otherwise>
											</iaixsl:choose></iaixsl:attribute>
											
											<iaixsl:attribute name="data-subscription-save"><iaixsl:value-of select="/shop/page/projector/product/sizes/size/price[@value = $minprice]/@yousave"/></iaixsl:attribute>
											
											<iaixsl:attribute name="data-subscription-before"><iaixsl:choose>
												<iaixsl:when test="/shop/page/projector/product/sizes/size/price[@value = $minprice]/@beforerebate">
													<iaixsl:value-of select="/shop/page/projector/product/sizes/size/price[@value = $minprice]/@beforerebate"/>
												</iaixsl:when>
												<iaixsl:otherwise>
													<iaixsl:value-of select="$minprice"/>
												</iaixsl:otherwise>
											</iaixsl:choose></iaixsl:attribute>
											<iaixsl:choose>
												<iaixsl:when test="not($nettoPrice = '')">
													<iaixsl:value-of select="/shop/page/projector/product/sizes/prices/@minprice_net_formatted"/>
												</iaixsl:when>
												<iaixsl:otherwise>
													<iaixsl:value-of select="/shop/page/projector/product/sizes/prices/@minprice_formatted"/>
												</iaixsl:otherwise>
											</iaixsl:choose>
										</span>
											 - 
										<span>
											
											<iaixsl:attribute name="data-subscription-max"><iaixsl:choose>
												<iaixsl:when test="/shop/page/projector/product/sizes/size/price[@value = $maxprice]/@maxprice">
													<iaixsl:value-of select="/shop/page/projector/product/sizes/size/price[@value = $maxprice]/@maxprice"/>
												</iaixsl:when>
												<iaixsl:otherwise>
													<iaixsl:value-of select="$maxprice"/>
												</iaixsl:otherwise>
											</iaixsl:choose></iaixsl:attribute>
											
											<iaixsl:attribute name="data-subscription-max-net"><iaixsl:choose>
												<iaixsl:when test="/shop/page/projector/product/sizes/size/price[@value = $maxprice]/@maxprice_net">
													<iaixsl:value-of select="/shop/page/projector/product/sizes/size/price[@value = $maxprice]/@maxprice_net"/>
												</iaixsl:when>
												<iaixsl:otherwise>
													<iaixsl:value-of select="/shop/page/projector/product/sizes/prices/@maxprice_net"/>
												</iaixsl:otherwise>
											</iaixsl:choose></iaixsl:attribute>
											
											<iaixsl:attribute name="data-subscription-save"><iaixsl:value-of select="/shop/page/projector/product/sizes/size/price[@value = $maxprice]/@yousave"/></iaixsl:attribute>
											
											<iaixsl:attribute name="data-subscription-before"><iaixsl:choose>
												<iaixsl:when test="/shop/page/projector/product/sizes/size/price[@value = $maxprice]/@beforerebate">
													<iaixsl:value-of select="/shop/page/projector/product/sizes/size/price[@value = $maxprice]/@beforerebate"/>
												</iaixsl:when>
												<iaixsl:otherwise>
													<iaixsl:value-of select="$maxprice"/>
												</iaixsl:otherwise>
											</iaixsl:choose></iaixsl:attribute>
											<iaixsl:choose>
												<iaixsl:when test="not($nettoPrice = '')">
													<iaixsl:value-of select="/shop/page/projector/product/sizes/prices/@maxprice_net_formatted"/>
												</iaixsl:when>
												<iaixsl:otherwise>
													<iaixsl:value-of select="/shop/page/projector/product/sizes/prices/@maxprice_formatted"/>
												</iaixsl:otherwise>
											</iaixsl:choose>
										</span>
									</iaixsl:when>
									<iaixsl:otherwise>
										<span>
											
											<iaixsl:attribute name="data-subscription-max"><iaixsl:choose>
												<iaixsl:when test="page/projector/product/price/@maxprice">
													<iaixsl:value-of select="page/projector/product/price/@maxprice"/>
												</iaixsl:when>
												<iaixsl:otherwise>
													<iaixsl:value-of select="page/projector/product/price/@value"/>
												</iaixsl:otherwise>
											</iaixsl:choose></iaixsl:attribute>
											
											<iaixsl:attribute name="data-subscription-max-net"><iaixsl:choose>
												<iaixsl:when test="page/projector/product/price/@maxprice_net">
													<iaixsl:value-of select="page/projector/product/price/@maxprice_net"/>
												</iaixsl:when>
												<iaixsl:otherwise>
													<iaixsl:value-of select="page/projector/product/price/@price_net"/>
												</iaixsl:otherwise>
											</iaixsl:choose></iaixsl:attribute>
											
											<iaixsl:attribute name="data-subscription-save"><iaixsl:value-of select="page/projector/product/price/@yousave"/></iaixsl:attribute>
											
											<iaixsl:attribute name="data-subscription-before"><iaixsl:choose>
												<iaixsl:when test="page/projector/product/price/@beforerebate">
													<iaixsl:value-of select="page/projector/product/price/@beforerebate"/>
												</iaixsl:when>
												<iaixsl:otherwise>
													<iaixsl:value-of select="page/projector/product/price/@value"/>
												</iaixsl:otherwise>
											</iaixsl:choose></iaixsl:attribute>
											<iaixsl:choose>
												<iaixsl:when test="not($nettoPrice = '')">
													<iaixsl:value-of select="page/projector/product/price/@price_net_formatted"/>
												</iaixsl:when>
												<iaixsl:otherwise>
													<iaixsl:value-of select="page/projector/product/price/@price_formatted"/>
												</iaixsl:otherwise>
											</iaixsl:choose>
										</span>
									</iaixsl:otherwise>
								</iaixsl:choose>
							</strong>
							<iaixsl:if test="(page/projector/product/sizes/@unit_sellby != '1') and (page/projector/product/sizes/size &gt; 1)">
								<iaixsl:choose>
									<iaixsl:when test="not($nettoPrice = '')">
										<script class="ajaxLoad">
											$(&apos;#projector_price_value&apos;).html(format_price(&quot;<iaixsl:value-of select="/shop/page/projector/product/sizes/prices/@minprice_net * page/projector/product/sizes/@unit_sellby"/>&quot;,{mask: app_shop.vars.currency_format,currency: &quot;<iaixsl:value-of select="/shop/currency/@name"/>&quot;,currency_space: app_shop.vars.currency_space,currency_before_price: app_shop.vars.currency_before_value})+&apos; - &apos;+format_price(&quot;<iaixsl:value-of select="/shop/page/projector/product/sizes/prices/@maxprice_net * page/projector/product/sizes/@unit_sellby"/>&quot;,{mask: app_shop.vars.currency_format,currency: &quot;<iaixsl:value-of select="/shop/currency/@name"/>&quot;,currency_space: app_shop.vars.currency_space,currency_before_price: app_shop.vars.currency_before_value}));
										</script>
									</iaixsl:when>
									<iaixsl:otherwise>
										<script class="ajaxLoad">
											$(&apos;#projector_price_value&apos;).html(format_price(&quot;<iaixsl:value-of select="/shop/page/projector/product/sizes/prices/@minprice * page/projector/product/sizes/@unit_sellby"/>&quot;,{mask: app_shop.vars.currency_format,currency: &quot;<iaixsl:value-of select="/shop/currency/@name"/>&quot;,currency_space: app_shop.vars.currency_space,currency_before_price: app_shop.vars.currency_before_value})+&apos; - &apos;+format_price(&quot;<iaixsl:value-of select="/shop/page/projector/product/sizes/prices/@maxprice * page/projector/product/sizes/@unit_sellby"/>&quot;,{mask: app_shop.vars.currency_format,currency: &quot;<iaixsl:value-of select="/shop/currency/@name"/>&quot;,currency_space: app_shop.vars.currency_space,currency_before_price: app_shop.vars.currency_before_value}));
										</script>
									</iaixsl:otherwise>
								</iaixsl:choose>
							</iaixsl:if>
						</iaixsl:otherwise>
					</iaixsl:choose>

					<div class="projector_prices__info">
						<span class="projector_prices__vat">
							<span class="price_vat"><iaixsl:value-of select="$priceTypeText"/></span>
						</span>
						<span class="projector_prices__unit_sep">
								/
						</span>
						<span class="projector_prices__unit_sellby" id="projector_price_unit_sellby" style="display:none">
							<iaixsl:value-of select="/shop/page/projector/product/sizes/@unit_sellby"/>
						</span>
						<span class="projector_prices__unit" id="projector_price_unit">
							<iaixsl:value-of select="/shop/page/projector/product/sizes/@unit"/>
						</span>
						<iaixsl:if test="/shop/page/projector/bundled/@collection = 'true'">
							<span class="projector_prices__collection_selected"> ausgewählte Produkte</span>
						</iaixsl:if>
						
						<iaixsl:if test="/shop/page/projector/product/subscriptions/subscription">
							<span class="projector_prices__period"> alle <span class="projector_prices__period_value"><iaixsl:attribute name="data-change-literal-days"><iaixsl:value-of select="$firstDaysInPeriod"/></iaixsl:attribute><iaixsl:value-of select="$firstDaysInPeriod"/> Tage</span></span>
						</iaixsl:if>
					</div>
				</div>

				
				<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
					<div class="projector_prices__lowest_price omnibus_price --hidden">
						<iaixsl:if test="$var_omnibus != '' and $var_omnibus_short != 'true'"><iaixsl:attribute name="class">projector_prices__lowest_price omnibus_price</iaixsl:attribute></iaixsl:if>
						<span class="omnibus_price__text">Niedrigster Preis in 30 Tagen vor Rabatt: </span><span id="projector_omnibus_price_value" class="omnibus_price__value"><iaixsl:value-of select="$var_omnibus"/></span>
					</div>
				</iaixsl:if>
				

				
				<iaixsl:if test="/shop/page/projector/product/sizes/@unit_sellby != '1'">
					<div class="projector_prices__sellby">
						<span class="projector_prices__sellby_label">Verkauft für:</span>
						<span class="projector_prices__sellby_value"><iaixsl:value-of select="page/projector/product/sizes/@unit_sellby"/><span class="projector_prices__sellby_unit"><iaixsl:value-of select="page/projector/product/sizes/@unit"/></span></span>
						<span class="projector_prices__sellbyprice_wrapper" id="projector_sellbyprice_wrapper" style="display:none;"> (<span id="projector_sellbyprice"><iaixsl:choose><iaixsl:when test="not($nettoPrice = '')"><iaixsl:value-of select="/shop/page/projector/product/price/@price_net_formatted"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="/shop/page/projector/product/price/@price_formatted"/></iaixsl:otherwise></iaixsl:choose></span> / 1 <iaixsl:value-of select="page/projector/product/sizes/@unit_single"/>)</span>
					</div>
				</iaixsl:if>

				
				<iaixsl:if test="/shop/page/projector/product/price/@unit_converted_price">
					<div class="projector_prices__unit_converted">
						<span class="projector_prices__unit_converted_label">Grundpreis:</span>
						<strong class="projector_prices__unit_converted_price"><iaixsl:choose><iaixsl:when test="not($nettoPrice = '')"><iaixsl:value-of select="/shop/page/projector/product/price/@unit_converted_price_net_formatted"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="/shop/page/projector/product/price/@unit_converted_price_formatted"/></iaixsl:otherwise></iaixsl:choose> / <iaixsl:value-of select="/shop/page/projector/product/price/@unit_converted_format"/></strong>
					</div>
				</iaixsl:if>

				
				<div class="projector_prices__srp_wrapper" id="projector_price_srp_wrapper">
					<iaixsl:if test="not(/shop/page/projector/product/price/@srp)">
						<iaixsl:attribute name="style">display:none;</iaixsl:attribute>
					</iaixsl:if>
					<span class="projector_prices__srp_label">Katalogpreis:</span>
					<strong class="projector_prices__srp" id="projector_price_srp">
						<iaixsl:choose>
							<iaixsl:when test="not($nettoPrice = '')">
								<iaixsl:value-of select="/shop/page/projector/product/price/@srp_net_formatted"/>
							</iaixsl:when>
							<iaixsl:otherwise>
								<iaixsl:value-of select="/shop/page/projector/product/price/@srp_formatted"/>
							</iaixsl:otherwise>
						</iaixsl:choose>
					</strong>
				</div>

				<div class="projector_prices__points" id="projector_points_wrapper">
					<iaixsl:if test="not(/shop/page/projector/product/@for_points='true' or page/projector/product/price/@points &gt; 0 )">
						<iaixsl:attribute name="style">display:none;</iaixsl:attribute>
					</iaixsl:if>
					<div class="projector_prices__points_wrapper" id="projector_price_points_wrapper">
						<iaixsl:choose>
							<iaixsl:when test="not(/shop/basket/@login)">
								<span id="projector_button_points_basket" class="projector_prices__points_buy --span">
									<iaixsl:attribute name="title">Melden Sie sich an, um dieses Produkt mit Punkten zu kaufen</iaixsl:attribute>
									<span class="projector_prices__points_price_text">Sie können für </span>
									<span class="projector_prices__points_price" id="projector_price_points"><iaixsl:value-of select="page/projector/product/price/@points"/><span class="projector_currency"> Pkt.</span></span>
								</span>
							</iaixsl:when>
							<iaixsl:otherwise>
								<button id="projector_button_points_basket" type="submit" name="forpoints" value="1" class="projector_prices__points_buy">
									<span class="projector_prices__points_price_text">Kaufen für </span>
									<span class="projector_prices__points_price" id="projector_price_points"><iaixsl:value-of select="page/projector/product/price/@points"/><span class="projector_currency"> Pkt.</span></span>
								</button>
							</iaixsl:otherwise>
						</iaixsl:choose>
					</div>
				</div>
			</div>

			
			<iaixsl:if test="page/projector/product/sizes/size[1]/price/rebateNumber and not(page/projector/product/@product_type = 'product_virtual')">
				<div class="projector_details__multipack projector_multipack" id="projector_rebateNumber">
					<strong class="projector_multipack__label">Mehr bestellen, weniger bezahlen!</strong>
					<div class="projector_multipack__wrapper">
						<iaixsl:for-each select="page/projector/product/sizes/size[1]/price/rebateNumber/rebate">
							<div class="projector_multipack__item f-group --radio">
								<iaixsl:attribute name="data-value"><iaixsl:choose><iaixsl:when test="contains(@threshold, '.00')"><iaixsl:value-of select="format-number(@threshold, '#')"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@threshold"/></iaixsl:otherwise></iaixsl:choose></iaixsl:attribute>
								<input type="radio" name="multipack_radio" class="f-control">
									<iaixsl:attribute name="id">multipackRadioItem<iaixsl:value-of select="position()"/></iaixsl:attribute>
								</input>
								<label class="f-label">
									<iaixsl:attribute name="for">multipackRadioItem<iaixsl:value-of select="position()"/></iaixsl:attribute>
									<strong class="projector_multipack__from"><iaixsl:choose><iaixsl:when test="contains(@threshold, '.00')"><iaixsl:value-of select="format-number(@threshold, '#')"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@threshold"/></iaixsl:otherwise></iaixsl:choose></strong>
									<strong class="projector_multipack__unit"><iaixsl:value-of select="/shop/page/projector/product/sizes/@unit"/></strong>
									<span class="projector_multipack__price"><iaixsl:choose><iaixsl:when test="not($nettoPrice = '')"><iaixsl:value-of select="@price_net_formatted"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@price_formatted"/></iaixsl:otherwise></iaixsl:choose></span>
									<span class="projector_multipack__literal --first">(-</span>
									<span class="projector_multipack__percent"><iaixsl:choose><iaixsl:when test="contains(@value, '.00')"><iaixsl:value-of select="format-number(@value, '#')"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@value"/></iaixsl:otherwise></iaixsl:choose></span>
									<span class="projector_multipack__literal --second">%)</span>
								</label>
							</div>
						</iaixsl:for-each>
					</div>
				</div>
			</iaixsl:if>

			
			<iaixsl:if test="/shop/page/projector/product/subscriptions/subscription">
				<div class="projector_details__subscription projector_subscription">
					<iaixsl:if test="(/shop/page/projector/product/@product_type = 'product_configurable' and /shop/page/projector/product/priceFormula) or /shop/page/projector/bundled/product or /shop/page/projector/product/versions/@count &gt; 0 or not(/shop/page/projector/product/sizes/size/@type = 'onesize' or /shop/page/projector/product/sizes/size/@type = 'uniw')">
						<iaixsl:attribute name="data-border">true</iaixsl:attribute>
					</iaixsl:if>
					<span class="projector_subscription__label">Versand alle</span>
					<div class="projector_subscription__sub">
						<iaixsl:for-each select="/shop/page/projector/product/subscriptions/subscription">
							<iaixsl:sort select="@days_in_period" data-type="number"/>
							<a class="projector_subscription__item">
								<iaixsl:attribute name="class">projector_subscription__item<iaixsl:if test="position() = 1"> --selected</iaixsl:if></iaixsl:attribute>
								<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/page/projector/product/@link"/>?selected_subscription=<iaixsl:value-of select="@days_in_period"/></iaixsl:attribute>
								<iaixsl:attribute name="data-days"><iaixsl:value-of select="@days_in_period"/></iaixsl:attribute>
								<iaixsl:if test="rebate">
									<iaixsl:attribute name="data-rebate-type"><iaixsl:value-of select="rebate/@type"/></iaixsl:attribute>
									<iaixsl:attribute name="data-rebate-value"><iaixsl:value-of select="rebate/@value"/></iaixsl:attribute>
									<iaixsl:attribute name="data-rebate-value-formatted"><iaixsl:value-of select="rebate/@value_formatted"/></iaixsl:attribute>
								</iaixsl:if>
								<span class="projector_subscription__name"><iaixsl:attribute name="data-change-literal-days"><iaixsl:value-of select="@days_in_period"/></iaixsl:attribute><iaixsl:value-of select="@days_in_period"/> Tage</span>
							</a>
						</iaixsl:for-each>
					</div>
				</div>
			</iaixsl:if>

			
			<iaixsl:if test="/shop/page/projector/product/@product_type = 'product_configurable' and /shop/page/projector/product/priceFormula">
				<div class="configurator --skeleton">
					<iaixsl:for-each select="/shop/page/projector/product/priceFormula/parameters/parameter">
						<div class="configurator__item">
							<iaixsl:attribute name="data-type"><iaixsl:value-of select="type"/></iaixsl:attribute>
							<span class="configurator__label"/>
							<div class="configurator__sub">
								<iaixsl:attribute name="data-type"><iaixsl:value-of select="type"/></iaixsl:attribute>
								<iaixsl:choose>
									<iaixsl:when test="type = 'radio'">
										<iaixsl:for-each select="values/value">
											<div class="f-group --radio"/>
										</iaixsl:for-each>
									</iaixsl:when>
									<iaixsl:when test="type = 'select'">
										<div class="f-select"/>
									</iaixsl:when>
									<iaixsl:when test="type = 'checkbox'">
										<iaixsl:for-each select="values/value">
											<div class="f-group --checkbox"/>
										</iaixsl:for-each>
									</iaixsl:when>
									<iaixsl:when test="type = 'input'">
										<div class="f-group"/>
										<iaixsl:if test="settings/min or settings/max">
											<div class="configurator__limits"/>
										</iaixsl:if>
									</iaixsl:when>
								</iaixsl:choose>
							</div>
						</div>
					</iaixsl:for-each>
				</div>
			</iaixsl:if>

			
			<iaixsl:if test="page/projector/bundled/product">
				<div class="projector_bundle --skeleton">
					<iaixsl:if test="/shop/page/projector/bundled/@collection = 'true'">
						<iaixsl:attribute name="data-collection">true</iaixsl:attribute>
					</iaixsl:if>
					<iaixsl:if test="/shop/page/projector/bundled/@left_quantity and not(/shop/page/projector/product/bundle_price/@amount_diff_gross = '0.00')">
						<div class="projector_bundle__rebate">
							<h2 class="projector_bundle__rebate_label"/>
							<div class="projector_bundle__rebate_wrapper">
								<span class="projector_bundle__rebate_description"/>
							</div>
						</div>
					</iaixsl:if>

					<h2 class="projector_bundle__label"/>

					<div class="projector_bundle__block">
						<iaixsl:for-each select="page/projector/bundled/product">
							<div class="projector_bundle__item">
								<iaixsl:if test="/shop/page/projector/bundled/@collection='true'">
									<div class="projector_bundle__checkbox_group f-group --checkbox"/>
								</iaixsl:if>

								<a class="projector_bundle__icon"/>

								<div class="projector_bundle__info">
									<a class="projector_bundle__name"/>

									<div class="projector_bundle__price_wrapper"/>

									<div class="projector_bundle__options">
										<iaixsl:if test="sizes/size/@type='onesize' and not(multiversions and versions/@version_choice='true') and not(sizes_chart)">
											<iaixsl:attribute name="data-only_onesize">true</iaixsl:attribute>
										</iaixsl:if>
										<iaixsl:if test="multiversions and versions/@version_choice='true'">
											<iaixsl:for-each select="multiversions/multi_version">
												<div class="projector_bundle__option --versions">
													<div class="projector_bundle__version"/>
												</div>
											</iaixsl:for-each>
										</iaixsl:if>

										<div class="projector_bundle__option --sizes">
											<iaixsl:if test="multiversions and versions/@version_choice='true'">
												<iaixsl:attribute name="data-hide">true</iaixsl:attribute>
											</iaixsl:if>
											<iaixsl:if test="sizes/size/@type='onesize'">
												<iaixsl:attribute name="data-onesize">true</iaixsl:attribute>
											</iaixsl:if>
											<div class="projector_bundle__size"/>
										</div>

										<iaixsl:if test="sizes_chart">
											<div class="projector_bundle__option --chart">
												<div class="projector_bundle__chart_link"/>
											</div>
										</iaixsl:if>
									</div>
								</div>
							</div>
						</iaixsl:for-each>
					</div>
				</div>
			</iaixsl:if>

			
			<iaixsl:if test="(/shop/page/projector/product/multiversions) and (count(/shop/page/projector/product/multiversions/multi_version) &gt; 1)">
				<div id="multi_versions" class="projector_details__multiversions projector_multiversions">
					<iaixsl:for-each select="/shop/page/projector/product/multiversions/multi_version">
						<div class="projector_multiversions__item">
							<iaixsl:attribute name="data-id"><iaixsl:value-of select="@id"/></iaixsl:attribute>
							<span class="projector_multiversions__label"><iaixsl:value-of disable-output-escaping="yes" select="@name"/></span>
							<div class="projector_multiversions__sub">
								<select class="projector_multiversions__select f-select">
									<iaixsl:for-each select="item">
										<option>
											<iaixsl:variable name="value_name"><iaixsl:for-each select="values/value"><iaixsl:if test="not(position() = 1)"> / </iaixsl:if><iaixsl:value-of disable-output-escaping="yes" select="@name"/></iaixsl:for-each></iaixsl:variable>
											<iaixsl:if test="@selected = 'true'">
												<iaixsl:attribute name="selected">selected</iaixsl:attribute>
											</iaixsl:if>
											<iaixsl:if test="@disabled = 'true'">
												<iaixsl:attribute name="class">--dependent</iaixsl:attribute>
											</iaixsl:if>
											<iaixsl:attribute name="data-values_id"><iaixsl:value-of select="values/@id"/></iaixsl:attribute>
											<iaixsl:attribute name="data-value"><iaixsl:value-of select="position()"/></iaixsl:attribute>
											<iaixsl:attribute name="data-title"><iaixsl:value-of select="$value_name"/></iaixsl:attribute>
											<iaixsl:attribute name="data-product"><iaixsl:value-of select="products/product/@product_id"/></iaixsl:attribute>
											<iaixsl:attribute name="data-link"><iaixsl:value-of select="products/product/@url"/></iaixsl:attribute>
											<iaixsl:if test="values/value[@gfx]">
												<iaixsl:attribute name="data-gfx"><iaixsl:for-each select="values/value[@gfx]"><iaixsl:if test="not(position() = 1)">|next|</iaixsl:if><iaixsl:value-of select="@gfx"/></iaixsl:for-each></iaixsl:attribute>
											</iaixsl:if>
											<iaixsl:if test="values/value[@gfx_second]">
												<iaixsl:attribute name="data-gfx_second"><iaixsl:for-each select="values/value[@gfx_second]"><iaixsl:if test="not(position() = 1)">|next|</iaixsl:if><iaixsl:value-of select="@gfx_second"/></iaixsl:for-each></iaixsl:attribute>
											</iaixsl:if>
											<iaixsl:value-of select="$value_name"/>
										</option>
									</iaixsl:for-each>
								</select>
							</div>
						</div>
					</iaixsl:for-each>
				</div>
			</iaixsl:if>

			
			<iaixsl:if test="(/shop/page/projector/product/versions/@count &gt; 0) and not(count(/shop/page/projector/product/multiversions/multi_version) &gt; 1)">
				<div id="versions" class="projector_details__versions projector_versions">
					<iaixsl:if test="(not($selectForVersions = '') and /shop/page/projector/product/versions/@count &gt; $selectForVersions) or count(/shop/page/projector/product/versions/version[not(@gfx)]) &gt; 0">
						<iaixsl:attribute name="data-select">true</iaixsl:attribute>
					</iaixsl:if>
					<span class="projector_versions__label"><iaixsl:value-of disable-output-escaping="yes" select="/shop/page/projector/product/versions/@name"/></span>
					<div class="projector_versions__sub">
						<iaixsl:choose>
							<iaixsl:when test="(not($selectForVersions = '') and /shop/page/projector/product/versions/@count &gt; $selectForVersions) or count(/shop/page/projector/product/versions/version[not(@gfx)]) &gt; 0">
								<select class="projector_versions__select f-select">
									<iaixsl:for-each select="/shop/page/projector/product/versions/version">
										<option>
											<iaixsl:if test="@id = /shop/page/projector/product/@id">
												<iaixsl:attribute name="selected">selected</iaixsl:attribute>
											</iaixsl:if>
											<iaixsl:if test="@amount = '0'">
												<iaixsl:attribute name="class">--disabled</iaixsl:attribute>
												<iaixsl:attribute name="label"><iaixsl:value-of select="@name"/> (ausverkauft)</iaixsl:attribute>
											</iaixsl:if>
											<iaixsl:attribute name="data-link"><iaixsl:value-of select="@link"/></iaixsl:attribute>
											<iaixsl:if test="@gfx">
												<iaixsl:attribute name="data-gfx"><iaixsl:value-of select="@gfx"/></iaixsl:attribute>
											</iaixsl:if>
											<iaixsl:if test="@gfx_second">
                        <iaixsl:attribute name="data-gfx_second"><iaixsl:value-of select="@gfx_second"/></iaixsl:attribute>
											</iaixsl:if>
											<iaixsl:value-of select="@name"/>
										</option>
									</iaixsl:for-each>
								</select>
							</iaixsl:when>
							<iaixsl:otherwise>
								<iaixsl:for-each select="/shop/page/projector/product/versions/version">
									<a class="projector_versions__item">
										<iaixsl:attribute name="class">projector_versions__item<iaixsl:if test="@id = /shop/page/projector/product/@id"> --selected</iaixsl:if><iaixsl:if test="@amount = '0'"> --disabled</iaixsl:if></iaixsl:attribute>
										<iaixsl:attribute name="href"><iaixsl:value-of select="@link"/></iaixsl:attribute>
										<iaixsl:attribute name="title"><iaixsl:value-of select="@name"/></iaixsl:attribute>
										<iaixsl:if test="@gfx">
											<span class="projector_versions__gfx">
                       <iaixsl:choose>
                          <iaixsl:when test="@gfx_second and not(@gfx_second = '' or @gfx_second = '/')">
                            <picture>
                              <source type="image/webp">
                                <iaixsl:attribute name="srcset"><iaixsl:value-of select="@gfx"/></iaixsl:attribute>
                              </source>
                              <img>
                                <iaixsl:attribute name="src"><iaixsl:value-of select="@gfx_second"/></iaixsl:attribute>
                                <iaixsl:attribute name="alt"><iaixsl:value-of select="@name"/></iaixsl:attribute>
                              </img>
                            </picture>
                          </iaixsl:when>
                          <iaixsl:otherwise>
                            <img>
													    <iaixsl:attribute name="src"><iaixsl:value-of select="@gfx"/></iaixsl:attribute>
													    <iaixsl:attribute name="alt"><iaixsl:value-of select="@name"/></iaixsl:attribute>
												    </img>
                          </iaixsl:otherwise>
                        </iaixsl:choose>
											</span>
										</iaixsl:if>
										<span class="projector_versions__name"><iaixsl:value-of disable-output-escaping="yes" select="@name"/></span>
									</a>
								</iaixsl:for-each>
							</iaixsl:otherwise>
						</iaixsl:choose>
					</div>
				</div>
			</iaixsl:if>

			
			<iaixsl:if test="(/shop/page/projector/text_sizesgroup and /shop/page/projector/text_sizesgroup != '') or /shop/page/projector/product/sizes_chart">
				<div id="projector_chart" class="projector_details__chart projector_chart">
					<a href="#showSizesCms" class="projector_chart__link">Prüfen Sie die Produktabmessungen</a>
				</div>
			</iaixsl:if>

			
			<div id="projector_sizes_cont" class="projector_details__sizes projector_sizes">
				<iaixsl:if test="/shop/page/projector/product/sizes/size/@type = 'onesize' or /shop/page/projector/product/sizes/size/@type = 'uniw'">
					<iaixsl:attribute name="data-onesize">true</iaixsl:attribute>
				</iaixsl:if>
				<iaixsl:if test="not($selectForSizes = '') and count(/shop/page/projector/product/sizes/size) &gt; $selectForSizes">
					<iaixsl:attribute name="data-select">true</iaixsl:attribute>
				</iaixsl:if>
				<span class="projector_sizes__label">Größe</span>
				<div class="projector_sizes__sub">
					<iaixsl:choose>
						<iaixsl:when test="not($selectForSizes = '') and count(/shop/page/projector/product/sizes/size) &gt; $selectForSizes">
							<select name="projector_sizes" id="projector_sizes_select" class="projector_sizes__select f-select --placeholder">
								<option>Größe auswählen</option>
								<iaixsl:for-each select="/shop/page/projector/product/sizes/size">
									<option>
										<iaixsl:if test="@selected = 'true'">
											<iaixsl:attribute name="selected">selected</iaixsl:attribute>
										</iaixsl:if>
										<iaixsl:if test="@amount = '0'">
											<iaixsl:attribute name="class">--disabled</iaixsl:attribute>
											<iaixsl:attribute name="label"><iaixsl:value-of select="@description"/> (ausverkauft)</iaixsl:attribute>
										</iaixsl:if>
										<iaixsl:attribute name="value"><iaixsl:value-of select="@type"/></iaixsl:attribute>
										<iaixsl:attribute name="data-count"><iaixsl:value-of select="@amount"/></iaixsl:attribute>
										<iaixsl:if test="availability/@status_id">
											<iaixsl:attribute name="data-statusid"><iaixsl:value-of select="availability/status_id"/></iaixsl:attribute>
										</iaixsl:if>

										
										
										<iaixsl:if test="$var_omnibus_enabled = 'true'">
											<iaixsl:if test="(not($nettoPrice = '') and price/@omnibus_price_net_formatted) or ($nettoPrice = '' and price/@omnibus_price_formatted)">
												
												<iaixsl:attribute name="data-omnibus"><iaixsl:choose>
													<iaixsl:when test="not($nettoPrice = '')">
														<iaixsl:value-of select="price/@omnibus_price_net_formatted"/>
													</iaixsl:when>
													<iaixsl:otherwise>
														<iaixsl:value-of select="price/@omnibus_price_formatted"/>
													</iaixsl:otherwise>
												</iaixsl:choose></iaixsl:attribute>
											</iaixsl:if>

											
											
											<iaixsl:if test="(not(price/@omnibus_price) or not(price/@omnibus_price_net)) and price/@last_price_change_date">
												<iaixsl:attribute name="data-last_price_change_date"><iaixsl:value-of select="price/@last_price_change_date"/></iaixsl:attribute>

												
												
												<iaixsl:attribute name="data-omnibus-type">sizes</iaixsl:attribute>

												
												<iaixsl:if test="../../@id">
													<iaixsl:attribute name="data-omnibus_product_id"><iaixsl:value-of select="../../@id"/></iaixsl:attribute>
												</iaixsl:if>
											</iaixsl:if>
											

										</iaixsl:if>
										

										<iaixsl:value-of select="@description"/>
									</option>
								</iaixsl:for-each>
							</select>
						</iaixsl:when>
						<iaixsl:otherwise>
							<iaixsl:for-each select="/shop/page/projector/product/sizes/size">
								<a class="projector_sizes__item">
									<iaixsl:attribute name="class">projector_sizes__item<iaixsl:if test="not(@amount &gt; 0 or @amount = '-1')"> --disabled</iaixsl:if><iaixsl:if test="@selected = 'true'"> --selected</iaixsl:if></iaixsl:attribute>
									<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/page/projector/product/@link"/>?selected_size=<iaixsl:value-of select="@type"/></iaixsl:attribute>
									<iaixsl:attribute name="data-type"><iaixsl:value-of select="@type"/></iaixsl:attribute>

									
									
									<iaixsl:if test="$var_omnibus_enabled = 'true'">
										<iaixsl:if test="(not($nettoPrice = '') and price/@omnibus_price_net_formatted) or ($nettoPrice = '' and price/@omnibus_price_formatted)">
											
											<iaixsl:attribute name="data-omnibus"><iaixsl:choose>
												<iaixsl:when test="not($nettoPrice = '')">
													<iaixsl:value-of select="price/@omnibus_price_net_formatted"/>
												</iaixsl:when>
												<iaixsl:otherwise>
													<iaixsl:value-of select="price/@omnibus_price_formatted"/>
												</iaixsl:otherwise>
											</iaixsl:choose></iaixsl:attribute>
										</iaixsl:if>

										
										
										<iaixsl:if test="(not(price/@omnibus_price) or not(price/@omnibus_price_net)) and price/@last_price_change_date">
											<iaixsl:attribute name="data-last_price_change_date"><iaixsl:value-of select="price/@last_price_change_date"/></iaixsl:attribute>

											
											
											<iaixsl:attribute name="data-omnibus-type">sizes</iaixsl:attribute>

											
											<iaixsl:if test="../../@id">
												<iaixsl:attribute name="data-omnibus_product_id"><iaixsl:value-of select="../../@id"/></iaixsl:attribute>
											</iaixsl:if>
										</iaixsl:if>
										

									</iaixsl:if>
									

									<span class="projector_sizes__name"><iaixsl:value-of select="@description"/></span>
								</a>
							</iaixsl:for-each>
						</iaixsl:otherwise>
					</iaixsl:choose>
				</div>
			</div>

			
			<iaixsl:if test="page/projector/product/price/@advanceprice_formatted">
				<div class="projector_details__advanceprice" id="projector_advanceprice_wrapper">
					Vor der Realisierung der Bestellung mit dieser Ware, kann es notwendig sein, eine Anzahlung in Höhe von <b id="projector_advanceprice"><iaixsl:choose><iaixsl:when test="not($nettoPrice = '')"><iaixsl:value-of select="page/projector/product/price/@advanceprice_net_formatted"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="page/projector/product/price/@advanceprice_formatted"/></iaixsl:otherwise></iaixsl:choose></b>. einzuzahlen. Genaue Informationen erhalten Sie in der Zusammenfassung der Bestellung, vor deren Abschicken.
				</div>
			</iaixsl:if>

			
			<div class="projector_details__buy projector_buy" id="projector_buy_section">
        <div class="projector_buy__wrapper">
          <iaixsl:if test="not((/shop/page/projector/product/@product_type = 'product_virtual') or (/shop/page/projector/product/@product_type = 'product_bundle' and not(count(/shop/page/projector/bundled/product[@product_type = 'product_virtual']) = 0)))">
						<div class="projector_buy__number_wrapper">
							<select class="projector_buy__number f-select">
								<iaixsl:if test="page/projector/product/exchange/@exchange_id">
									<iaixsl:attribute name="disabled">disabled</iaixsl:attribute>
								</iaixsl:if>
							
							<option>
									<iaixsl:attribute name="value"><iaixsl:value-of select="1 * /shop/page/projector/product/sizes/@unit_sellby"/></iaixsl:attribute>
								
                <iaixsl:if test="(1 * /shop/page/projector/product/sizes/@unit_sellby) = /shop/page/projector/product/subscriptions/@minimum_quantity or not(/shop/page/projector/product/subscriptions/@minimum_quantity)">
                  <iaixsl:attribute name="selected">selected</iaixsl:attribute>
                </iaixsl:if>
									<iaixsl:value-of select="1 * /shop/page/projector/product/sizes/@unit_sellby"/>
								</option>
								<option>
									<iaixsl:attribute name="value"><iaixsl:value-of select="2 * /shop/page/projector/product/sizes/@unit_sellby"/></iaixsl:attribute>
								
                <iaixsl:if test="(2 * /shop/page/projector/product/sizes/@unit_sellby) = /shop/page/projector/product/subscriptions/@minimum_quantity">
                  <iaixsl:attribute name="selected">selected</iaixsl:attribute>
                </iaixsl:if>
									<iaixsl:value-of select="2 * /shop/page/projector/product/sizes/@unit_sellby"/>
								</option>
								<option>
									<iaixsl:attribute name="value"><iaixsl:value-of select="3 * /shop/page/projector/product/sizes/@unit_sellby"/></iaixsl:attribute>
								
                <iaixsl:if test="(3 * /shop/page/projector/product/sizes/@unit_sellby) = /shop/page/projector/product/subscriptions/@minimum_quantity">
                  <iaixsl:attribute name="selected">selected</iaixsl:attribute>
                </iaixsl:if>
									<iaixsl:value-of select="3 * /shop/page/projector/product/sizes/@unit_sellby"/>
								</option>
								<option>
									<iaixsl:attribute name="value"><iaixsl:value-of select="4 * /shop/page/projector/product/sizes/@unit_sellby"/></iaixsl:attribute>
								
                <iaixsl:if test="(4 * /shop/page/projector/product/sizes/@unit_sellby) = /shop/page/projector/product/subscriptions/@minimum_quantity">
                  <iaixsl:attribute name="selected">selected</iaixsl:attribute>
                </iaixsl:if>
									<iaixsl:value-of select="4 * /shop/page/projector/product/sizes/@unit_sellby"/>
								</option>
								<option>
									<iaixsl:attribute name="value"><iaixsl:value-of select="5 * /shop/page/projector/product/sizes/@unit_sellby"/></iaixsl:attribute>
								
                <iaixsl:if test="(5 * /shop/page/projector/product/sizes/@unit_sellby) = /shop/page/projector/product/subscriptions/@minimum_quantity">
                  <iaixsl:attribute name="selected">selected</iaixsl:attribute>
                </iaixsl:if>
									<iaixsl:value-of select="5 * /shop/page/projector/product/sizes/@unit_sellby"/>
								</option>
								<option>
									<iaixsl:attribute name="data-more">true</iaixsl:attribute>
									mehr
								</option>
							</select>
							<div class="projector_buy__more">
								<input class="projector_buy__more_input" type="number" name="number" id="projector_number">
									
									<iaixsl:choose>
										<iaixsl:when test="/shop/page/projector/product/subscriptions/@minimum_quantity">
											<iaixsl:attribute name="data-prev"><iaixsl:value-of select="/shop/page/projector/product/subscriptions/@minimum_quantity"/></iaixsl:attribute>
											<iaixsl:attribute name="value"><iaixsl:value-of select="/shop/page/projector/product/subscriptions/@minimum_quantity"/></iaixsl:attribute>
											<iaixsl:attribute name="data-minimum-quantity-subscription"><iaixsl:value-of select="/shop/page/projector/product/subscriptions/@minimum_quantity"/></iaixsl:attribute>
										</iaixsl:when>
										<iaixsl:otherwise>
											<iaixsl:attribute name="data-prev"><iaixsl:value-of select="/shop/page/projector/product/sizes/@unit_sellby"/></iaixsl:attribute>
											<iaixsl:attribute name="value"><iaixsl:value-of select="/shop/page/projector/product/sizes/@unit_sellby"/></iaixsl:attribute>
										</iaixsl:otherwise>
									</iaixsl:choose>
									
									<iaixsl:if test="/shop/page/projector/product/order_quantity_range/min_quantity_per_order">
										<iaixsl:attribute name="data-minimum-quantity"><iaixsl:value-of select="/shop/page/projector/product/order_quantity_range/min_quantity_per_order/text()"/></iaixsl:attribute>
									</iaixsl:if>
									<iaixsl:attribute name="data-sellby"><iaixsl:value-of select="/shop/page/projector/product/sizes/@unit_sellby"/></iaixsl:attribute>
									<iaixsl:attribute name="step"><iaixsl:value-of select="/shop/page/projector/product/sizes/@unit_sellby"/></iaixsl:attribute>
								</input>
							</div>
						</div>
					</iaixsl:if>
					<button class="projector_buy__button btn --solid --large" id="projector_button_basket" type="submit">
            <iaixsl:if test="not(count(/shop/expressCheckout/payment[@id = 'idoPay']) = 0)">
              <iaixsl:attribute name="data-express-checkout">true</iaixsl:attribute>
            </iaixsl:if>
            <iaixsl:choose>
						
						<iaixsl:when test="/shop/page/projector/product/subscriptions/subscription">
              <iaixsl:attribute name="data-subscription-name">Abonnieren</iaixsl:attribute>
              <iaixsl:attribute name="data-normal-name">In den Warenkorb</iaixsl:attribute>
							Abonnieren
						</iaixsl:when>
							<iaixsl:when test="page/projector/product/exchange/@exchange_id">
								Produkt wechseln
							</iaixsl:when>
							<iaixsl:when test="/shop/page/projector/bundled/@collection = 'true'">
								In den Warenkorb
							</iaixsl:when>
							<iaixsl:otherwise>
								In den Warenkorb
							</iaixsl:otherwise>
						</iaixsl:choose>
					</button>
					
					<a class="projector_buy__shopping_list" href="#addToShoppingList">
						<iaixsl:attribute name="title">Klicken Sie, um ein Produkt zu Ihrer Einkaufsliste hinzuzufügen</iaixsl:attribute>
					</a>
				</div>
        
				<iaixsl:if test="not(count(/shop/expressCheckout/payment[@id = 'idoPay']) = 0)">
					<div class="projector_details__express projector_express" id="projector_express_section">
						<button class="projector_express_checkout__button btn --solid --large" id="projector_express_checkout" type="button">
						  <iaixsl:if test="/shop/client_data/express_checkout_login/@login">
						    <iaixsl:attribute name="data-login"><iaixsl:value-of select="/shop/client_data/express_checkout_login/@login"/></iaixsl:attribute>
						  </iaixsl:if>
						  <iaixsl:if test="/shop/expressCheckout/payment[@id = 'idoPay']/@type">
						    <iaixsl:attribute name="data-type"><iaixsl:value-of select="/shop/expressCheckout/payment[@id = 'idoPay']/@type"/></iaixsl:attribute>
						  </iaixsl:if>
							<span>Kaufen Sie jetzt</span>
						</button>
					</div>
				</iaixsl:if>
			</div>

			
			<div class="projector_details__tell_availability projector_tell_availability" id="projector_tell_availability">
				<iaixsl:attribute name="style">display:none</iaixsl:attribute>
				<div class="projector_tell_availability__block --link">
					<a class="projector_tell_availability__link btn --solid --outline --solid --extrasmall" href="#tellAvailability">Verfügbarkeit benachrichtigen</a>
				</div>
				<div class="projector_tell_availability__block --dialog" id="tell_availability_dialog">
					<h6 class="headline">
						<span class="headline__name">Produkt ausverkauft</span>
					</h6>
					<div class="projector_tell_availability__info_top">
						<span>Sie erhalten von uns eine E-Mail-Benachrichtigung, sobald das Produkt wieder verfügbar ist.</span>
					</div>
					<div class="projector_tell_availability__email f-group --small">
						<div class="f-feedback --required">
							<input type="text" class="f-control validate" name="email" data-validation-url="/ajax/client-new.php?validAjax=true" data-validation="client_email" required="required" disabled="disabled" id="tellAvailabilityEmail">
								<iaixsl:if test="/shop/client_data/@email">
									<iaixsl:attribute name="value"><iaixsl:value-of select="/shop/client_data/@email"/></iaixsl:attribute>
								</iaixsl:if>
							</input>
							<label class="f-label" for="tellAvailabilityEmail">Ihre E-Mail-Adresse</label>
							<span class="f-control-feedback"/>
						</div>
					</div>
					<div class="projector_tell_availability__button_wrapper">
						<button type="submit" class="projector_tell_availability__button btn --solid --large">
							über die Verfügbarkeit informieren
						</button>
					</div>
					<div class="projector_tell_availability__info1">
						<span>Deine Daten werden gemäß </span><a><iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/private_policy/@url"/></iaixsl:attribute>der Datenschutzerklärung</a><span>. bearbeitet. </span>
					</div>
					<div class="projector_tell_availability__info2">
						<span>Diese Daten werden nicht für den Versand von Newslettern oder sonstiger Werbung verwendet. Sie stimmen zu, eine einmalige Benachrichtigung über die Verfügbarkeit dieses Produkts zu erhalten. </span>
					</div>
				</div>
			</div>

			
			<iaixsl:if test="/shop/oneclick/payment">
				<div class="projector_details__oneclick projector_oneclick">
          <iaixsl:if test="count(/shop/oneclick/payment) = 2">
				    <iaixsl:attribute name="data-columns">2</iaixsl:attribute>
				  </iaixsl:if>
          <iaixsl:attribute name="data-lang"><iaixsl:value-of select="/shop/language/option[@selected ='true']/@id"/></iaixsl:attribute>
					<iaixsl:if test="/shop/page/projector/product/name = ''">
						<iaixsl:attribute name="data-hide">true</iaixsl:attribute>
					</iaixsl:if>
					<div class="projector_oneclick__label">
						<div class="projector_oneclick__info">
							<span class="projector_oneclick__text --fast">Schnelles Einkaufen <strong>1-Click</strong></span>
							<span class="projector_oneclick__text --registration">(ohne Registrierung)</span>
						</div>
					</div>
					<div class="projector_oneclick__items">
						<iaixsl:for-each select="/shop/oneclick/payment">
							<div>
								<iaixsl:attribute name="class">projector_oneclick__item --<iaixsl:value-of select="@id"/><iaixsl:if test="@preloading"> --loading</iaixsl:if></iaixsl:attribute>
								<iaixsl:attribute name="title">Dieses Produkt mit <iaixsl:value-of select="@name"/></iaixsl:attribute>
								<iaixsl:attribute name="id">oneclick_<iaixsl:value-of select="@id"/></iaixsl:attribute>
								<iaixsl:attribute name="data-id"><iaixsl:value-of select="@id"/></iaixsl:attribute>
								<iaixsl:if test="not(@basket_only = 'true')">
									<img class="projector_oneclick__icon">
										<iaixsl:attribute name="src"><iaixsl:value-of select="@icon"/></iaixsl:attribute>
										<iaixsl:attribute name="alt"><iaixsl:value-of select="@name"/></iaixsl:attribute>
									</img>
								</iaixsl:if>
							</div>
						</iaixsl:for-each>
					</div>
				</div>
			</iaixsl:if>

			<div class="projector_details__info projector_info">
				
				<div id="projector_status" class="projector_info__item --status projector_status">
					<iaixsl:choose>
						<iaixsl:when test="/shop/page/projector/product/sizes/size[not(@amount_mw = 0)]">
							<iaixsl:if test="/shop/page/projector/product/sizes/size[not(@amount_mw = 0)]/availability/@visible = 'n'">
								<iaixsl:attribute name="class">projector_info__item --status projector_status --status-hide</iaixsl:attribute>
							</iaixsl:if>
						</iaixsl:when>
						<iaixsl:when test="/shop/page/projector/product/sizes/size[not(@amount = 0)]">
							<iaixsl:if test="/shop/page/projector/product/sizes/size[not(@amount = 0)]/availability/@visible = 'n'">
								<iaixsl:attribute name="class">projector_info__item --status projector_status --status-hide</iaixsl:attribute>
							</iaixsl:if>
						</iaixsl:when>
						<iaixsl:when test="/shop/page/projector/product/sizes/size/availability/@visible = 'n'">
								<iaixsl:attribute name="class">projector_info__item --status projector_status --status-hide</iaixsl:attribute>
						</iaixsl:when>
					</iaixsl:choose>
					<span id="projector_status_gfx_wrapper" class="projector_status__gfx_wrapper projector_info__icon">
						<img id="projector_status_gfx" class="projector_status__gfx">
							<iaixsl:choose>
								<iaixsl:when test="/shop/page/projector/product/sizes/size[not(@amount_mw = 0)]/availability/@status_gfx">
									<iaixsl:attribute name="src"><iaixsl:value-of select="/shop/page/projector/product/sizes/size[not(@amount_mw = 0)]/availability/@status_gfx"/></iaixsl:attribute>
									<iaixsl:attribute name="alt"><iaixsl:value-of select="/shop/page/projector/product/sizes/size[not(@amount_mw = 0)]/availability/@status_description"/></iaixsl:attribute>
								</iaixsl:when>
								<iaixsl:when test="/shop/page/projector/product/sizes/size[not(@amount = 0)]/availability/@status_gfx">
									<iaixsl:attribute name="src"><iaixsl:value-of select="/shop/page/projector/product/sizes/size[not(@amount = 0)]/availability/@status_gfx"/></iaixsl:attribute>
									<iaixsl:attribute name="alt"><iaixsl:value-of select="/shop/page/projector/product/sizes/size[not(@amount = 0)]/availability/@status_description"/></iaixsl:attribute>
								</iaixsl:when>
								<iaixsl:otherwise>
									<iaixsl:attribute name="src"><iaixsl:value-of select="/shop/page/projector/product/sizes/size/availability/@status_gfx"/></iaixsl:attribute>
									<iaixsl:attribute name="alt"><iaixsl:value-of select="/shop/page/projector/product/sizes/size/availability/@status_description"/></iaixsl:attribute>
								</iaixsl:otherwise>
							</iaixsl:choose>
						</img>
					</span>

					
					<div id="projector_shipping_unknown" class="projector_status__unknown">
						<iaixsl:attribute name="style">display:none</iaixsl:attribute>
						<span class="projector_status__unknown_text">
							<a target="_blank"><iaixsl:attribute name="href"><iaixsl:value-of select="/shop/contact/link/@url"/></iaixsl:attribute>Kontaktieren Sie den Shopservice</a>, um die für die Vorbereitung dieser Ware zum Versand benötigte Zeit einzuschätzen.
						</span>
					</div>

					<div id="projector_status_wrapper" class="projector_status__wrapper">
						
						<div class="projector_status__description" id="projector_status_description">
							<iaixsl:choose>
								<iaixsl:when test="/shop/page/projector/product/sizes/size[not(@amount_mw = 0)]/availability/@status_description">
									<iaixsl:value-of disable-output-escaping="yes" select="/shop/page/projector/product/sizes/size[not(@amount_mw = 0)]/availability/@status_description"/>
								</iaixsl:when>
								<iaixsl:when test="/shop/page/projector/product/sizes/size[not(@amount = 0)]/availability/@status_description">
									<iaixsl:value-of disable-output-escaping="yes" select="/shop/page/projector/product/sizes/size[not(@amount = 0)]/availability/@status_description"/>
								</iaixsl:when>
								<iaixsl:otherwise>
									<iaixsl:value-of disable-output-escaping="yes" select="/shop/page/projector/product/sizes/size/availability/@status_description"/>
								</iaixsl:otherwise>
							</iaixsl:choose>
						</div>

						
						<iaixsl:if test="not(/shop/page/projector/product/@product_type = 'product_service')">
							<div id="projector_shipping_info" class="projector_status__info">
								<iaixsl:attribute name="style">display:none</iaixsl:attribute>
								<strong class="projector_status__info_label" id="projector_delivery_label">Versand </strong>
								<strong class="projector_status__info_days" id="projector_delivery_days"/>
								<iaixsl:if test="not(/shop/page/projector/product/@product_type = 'product_bundle')">
									<span class="projector_status__info_amount" id="projector_amount"><iaixsl:attribute name="style">display:none</iaixsl:attribute> (%d auf Lager)</span>
								</iaixsl:if>
							</div>
						</iaixsl:if>
					</div>
				</div>

				
				<div class="projector_info__item --shipping projector_shipping" id="projector_shipping_dialog">
					<iaixsl:if test="(/shop/page/projector/product/sizes/size/availability/delay_time/@unknown_delivery_time = 'true') or (/shop/page/projector/bundled/product/sizes/size/availability/delay_time/@unknown_delivery_time = 'true') or /shop/page/projector/product/@product_type = 'product_service'">
						<iaixsl:attribute name="style">display:none;</iaixsl:attribute>
					</iaixsl:if>
					<span class="projector_shipping__icon projector_info__icon"/>
					<a class="projector_shipping__info projector_info__link" href="#shipping_info">
						<iaixsl:choose>
							<iaixsl:when test="/shop/page/projector/product/smile or (/shop/basket/@shipping = '0.00' and /shop/page/projector/product/sizes/size/delivery/@shipping = '0.00') or (/shop/basket/@shippinglimitfree &gt; 0 and /shop/page/projector/product/sizes/size/delivery/@limitfree &gt; 0)">
								<span class="projector_shipping__text">Kostenlose und schnelle Lieferung</span><iaixsl:if test="/shop/basket/@shippinglimitfree &gt; 0 and /shop/basket/@toshippingfree &gt; 0 and /shop/page/projector/product/sizes/size/delivery/@limitfree &gt; 0"><span class="projector_shipping__text_from"> ab </span><span class="projector_shipping__price"><iaixsl:value-of select="/shop/basket/@shippinglimitfree_formatted"/></span></iaixsl:if>
							</iaixsl:when>
							<iaixsl:otherwise>
								Günstige und schnelle Lieferung
							</iaixsl:otherwise>
						</iaixsl:choose>
					</a>
				</div>

				
				
				<iaixsl:variable name="allow_returns_projector"><iaixsl:choose><iaixsl:when test="/shop/basket/@wholesaler = 'true' and /shop/basket/@blocked_wholesale_returns = 'true'">false</iaixsl:when><iaixsl:otherwise>true</iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
				<iaixsl:if test="page/projector/returns_config/@active='y' and not(page/projector/product/@product_type = 'product_virtual' or page/projector/product/@product_type = 'product_service') and $allow_returns_projector = 'true'">
					<div class="projector_info__item --returns projector_returns">
						<span class="projector_returns__icon projector_info__icon"/>
						<span class="projector_returns__info projector_info__link"><span class="projector_returns__days"><iaixsl:value-of select="page/projector/returns_config/@days_to_return"/></span><iaixsl:choose><iaixsl:when test="/shop/page/projector/returns_config/@returns_shop_shipping_cost != 'client'"> Tage für kostenlose Rücksendungen</iaixsl:when><iaixsl:otherwise> Tage für einfache Rückgabe</iaixsl:otherwise></iaixsl:choose></span>
					</div>
				</iaixsl:if>

				
				<iaixsl:if test="not(/shop/action/stocks/@available = 'false')">
					<div class="projector_info__item --stocks projector_stocks">
						<span class="projector_stocks__icon projector_info__icon"/>
						<iaixsl:choose>
							<iaixsl:when test="page/projector/product/sizes_version/@stocks_link or page/projector/product/sizes/@stocks_link">
								<a class="projector_stocks__info projector_info__link --link">
									<iaixsl:choose>
										<iaixsl:when test="page/projector/product/sizes_version/@stocks_link">
											<iaixsl:attribute name="href"><iaixsl:value-of select="page/projector/product/sizes_version/@stocks_link"/></iaixsl:attribute>
										</iaixsl:when>
										<iaixsl:otherwise>
											<iaixsl:attribute name="href"><iaixsl:value-of select="page/projector/product/sizes/@stocks_link"/></iaixsl:attribute>
										</iaixsl:otherwise>
									</iaixsl:choose>
									Finden Sie heraus, in welchem Shop es sofort verfügbar ist
								</a>
							</iaixsl:when>
							<iaixsl:otherwise>
								<span class="projector_stocks__info projector_info__link">Dieses Produkt ist nicht in einem stationären Geschäft erhältlich</span>
							</iaixsl:otherwise>
						</iaixsl:choose>
						<iaixsl:if test="page/projector/product/sizes_version/@stocks_link or page/projector/product/sizes/@stocks_link">
							<div id="product_stocks" class="product_stocks">
								<div class="product_stocks__block --product pb-3">
									<div class="product_stocks__product d-flex align-items-center">
										<iaixsl:if test="/shop/page/projector/product/icon">
											<img class="product_stocks__icon mr-4">
												<iaixsl:attribute name="src"><iaixsl:value-of select="/shop/page/projector/product/icon"/></iaixsl:attribute>
												<iaixsl:attribute name="alt"><iaixsl:value-of select="/shop/page/projector/product/name"/></iaixsl:attribute>
											</img>
										</iaixsl:if>
										<div class="product_stocks__details">
											<strong class="product_stocks__name d-block pr-2"><iaixsl:value-of select="/shop/page/projector/product/name"/></strong>
											<iaixsl:if test="(page/projector/product/multiversions) and (count(page/projector/product/multiversions/multi_version) &gt; 1)">
												<div class="product_stocks__versions">
													<iaixsl:for-each select="page/projector/product/multiversions/multi_version">
														<div class="product_stocks__version">
															<span class="product_stocks__version_name"><iaixsl:value-of disable-output-escaping="yes" select="@name"/>:</span>
															<span class="product_stocks__version_value">
																<iaixsl:for-each select="item[@selected='true']/values/value">
																	<iaixsl:if test="not(position() = 1)">
																		 / 
																	</iaixsl:if>
																	<iaixsl:value-of disable-output-escaping="yes" select="@name"/>
																</iaixsl:for-each>
															</span>
														</div>
													</iaixsl:for-each>
												</div>
											</iaixsl:if>
											<iaixsl:if test="(page/projector/product/versions/@count &gt; 0) and (count(page/projector/product/multiversions/multi_version) = 1)">
												<div class="product_stocks__versions">
													<div class="product_stocks__version">
														<span class="product_stocks__version_name"><iaixsl:value-of disable-output-escaping="yes" select="page/projector/product/versions/@name"/>:</span>
														<span class="product_stocks__version_value"><iaixsl:value-of disable-output-escaping="yes" select="page/projector/product/versions/version[@id = /shop/page/projector/product/@id]/@name"/></span>
													</div>
												</div>
											</iaixsl:if>
											<div class="product_stocks__sizes row mx-n1">
												<iaixsl:for-each select="/shop/page/projector/product/sizes/size">
													<a class="product_stocks__size select_button col mx-1 mt-2 flex-grow-0 flex-shrink-0">
														<iaixsl:if test="@amount = '0'">
															<iaixsl:attribute name="data-disabled">true</iaixsl:attribute>
														</iaixsl:if>
														<iaixsl:attribute name="href">#<iaixsl:value-of select="@type"/></iaixsl:attribute>
														<iaixsl:attribute name="data-type"><iaixsl:value-of select="@type"/></iaixsl:attribute>
														<iaixsl:value-of select="@description"/>
													</a>
												</iaixsl:for-each>
											</div>
										</div>
									</div>
								</div>
								<div class="product_stocks__block --stocks --skeleton"/>
							</div>
						</iaixsl:if>
					</div>
				</iaixsl:if>

				
				<iaixsl:if test="/shop/page/projector/product/subscriptions/subscription">
					<div class="projector_info__item --subscription projector_subscription_info">
						<span class="projector_subscription_info__icon projector_info__icon"/>
						<span class="projector_subscription_info__info projector_info__link">Das Abonnement, also ein wiederkehrender Kauf, verlängert sich automatisch</span>
					</div>
				</iaixsl:if>

				
				<iaixsl:if test="/shop/page/projector/product/subscriptions/subscription">
					<div class="projector_info__item --abort-subscription projector_abort_subscription_info">
						<span class="projector_abort_subscription_info__icon projector_info__icon"/>
						<span class="projector_abort_subscription_info__info projector_info__link">Jederzeitiger Abbruch ohne Kündigungsfrist</span>
					</div>
				</iaixsl:if>

				
				<div class="projector_info__item --safe projector_safe">
					<span class="projector_safe__icon projector_info__icon"/>
					<span class="projector_safe__info projector_info__link">Sicher einkaufen</span>
				</div>

				
				<iaixsl:if test="page/projector/product/payment/instalment">
					<div class="projector_info__item --instalments projector_instalments">
						<span class="projector_instalments__icon projector_info__icon"/>
						<span class="projector_instalments__info projector_info__link">Kauf auf Raten (<a class="projector_instalments__link" href="#showInstalments">Rate berechnen</a>)</span>
						<div class="projector_instalments__items">
							<iaixsl:for-each select="page/projector/product/payment/instalment">
								<a class="projector_instalments__item">
									<iaixsl:attribute name="data-instalments"><iaixsl:value-of disable-output-escaping="yes" select="@name"/></iaixsl:attribute>
									<iaixsl:attribute name="onclick">event.stopPropagation(); calculate_instalments(&apos;<iaixsl:value-of select="@minprice"/>&apos;,&apos;<iaixsl:value-of select="@maxprice"/>&apos;,&apos;<iaixsl:value-of select="@priceTotal"/>&apos;,&apos;<iaixsl:value-of select="@alert"/>&apos;,$(this).attr(&apos;data-window&apos;),&apos;<iaixsl:value-of select="@maxquantity"/>&apos;,&apos;<iaixsl:value-of select="@name"/>&apos;,&apos;&apos;,&apos;<iaixsl:value-of select="@price_type"/>&apos;); return false;</iaixsl:attribute>
									<iaixsl:attribute name="href">javascript:<iaixsl:value-of select="@calculate"/></iaixsl:attribute>
									<iaixsl:attribute name="data-window"><iaixsl:value-of select="@calculatePrice"/></iaixsl:attribute>
									<iaixsl:if test="@gfx">
										<img class="projector_instalments__item_icon b-lazy" src="/gfx/standards/loader.gif?r=1696937716">
											<iaixsl:attribute name="data-src"><iaixsl:value-of select="@gfx"/></iaixsl:attribute>
											<iaixsl:attribute name="alt"><iaixsl:value-of select="@name"/></iaixsl:attribute>
										</img>
									</iaixsl:if>
									<span class="projector_instalments__item_text"><iaixsl:value-of disable-output-escaping="yes" select="@name"/></span>
								</a>
							</iaixsl:for-each>
						</div>
					</div>
				</iaixsl:if>

				
				<iaixsl:if test="/shop/page/projector/product/payment/delayed[@id = '203']">
					<iaixsl:variable name="paypoLiteralWithoutReturns">. Jetzt kaufen, in 30 Tagen bezahlen</iaixsl:variable>
					<iaixsl:variable name="paypoLiteral"><iaixsl:choose><iaixsl:when test="not(page/projector/returns_config/@active='y' and not(page/projector/product/@product_type = 'product_virtual' or page/projector/product/@product_type = 'product_service') and $allow_returns_projector = 'true') and not($paypoLiteralWithoutReturns = '')"><iaixsl:value-of select="$paypoLiteralWithoutReturns"/></iaixsl:when><iaixsl:otherwise>. Jetzt kaufen, in 30 Tagen bezahlen,  wenn Sie es nicht zurückgeben</iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
					<div class="projector_info__item --paypo projector_paypo">
						<span class="projector_paypo__icon projector_info__icon"/>
						<span class="projector_paypo__info projector_info__link"><a class="projector_paypo__link" href="#showPaypo">Aufgeschobene Zahlungen</a><iaixsl:value-of select="$paypoLiteral"/></span>
						<div class="paypo_info">
							<h6 class="headline">
								<span class="headline__name">Jetzt kaufen, später bezahlen - 4 Schritte</span>
							</h6>
							<div class="paypo_info__block">
								<div class="paypo_info__item --first">
									<span class="paypo_info__text">Wählen Sie bei der Auswahl einer Zahlungsmethode PayPo.</span>
									<iaixsl:if test="/shop/page/projector/product/payment/delayed[@id = '203']/@gfx">
										<span class="paypo_info__img">
											<img class="b-lazy" src="/gfx/standards/loader.gif?r=1696937716">
												<iaixsl:attribute name="data-src"><iaixsl:value-of select="/shop/page/projector/product/payment/delayed[@id = '203']/@gfx"/></iaixsl:attribute>
												<iaixsl:attribute name="alt"><iaixsl:value-of select="/shop/page/projector/product/payment/delayed[@id = '203']/@name"/></iaixsl:attribute>
											</img>
										</span>
									</iaixsl:if>
								</div>
								<div class="paypo_info__item --second">
									<span class="paypo_info__text">PayPo bezahlt Ihre Rechnung in der Filiale.<br/>Überprüfen Sie auf der PayPo-Website Ihre Daten und geben Sie Ihre Sozialversicherungsnummer ein.</span>
								</div>
								<div class="paypo_info__item --third">
									<span class="paypo_info__text">Nach Erhalt Ihres Einkaufs entscheiden Sie, was Ihnen passt und was nicht. Sie können Ihre Bestellung ganz oder teilweise zurückgeben - dann reduziert sich auch der an PayPo zu zahlende Betrag.</span>
								</div>
								<div class="paypo_info__item --fourth">
									<span class="paypo_info__text">Innerhalb von 30 Tagen nach dem Kauf bezahlen Sie PayPo für Ihre Einkäufe <strong>ohne zusätzliche Kosten</strong>. Wenn Sie möchten, verteilen Sie Ihre Zahlung auf Raten.</span>
								</div>
							</div>
						</div>
					</div>
				</iaixsl:if>

				
				<div class="projector_info__item --points projector_points_recive" id="projector_price_points_recive_wrapper">
					<iaixsl:if test="not(page/projector/product/price/@points_recive and page/projector/product/price/@points_recive &gt; 0)">
						<iaixsl:attribute name="style">display:none;</iaixsl:attribute>
					</iaixsl:if>
					<span class="projector_points_recive__icon projector_info__icon"/>
					<span class="projector_points_recive__info projector_info__link"><span class="projector_points_recive__text">Nach dem Kauf erhalten Sie </span><span class="projector_points_recive__value" id="projector_points_recive_points"><iaixsl:value-of select="page/projector/product/price/@points_recive"/> Pkt.</span></span>
				</div>
			</div>
		</div>

		
		<iaixsl:if test="/shop/page/projector/product/smile">
			<div class="projector_smile">
				<div class="projector_smile__block --main">
					<img class="projector_smile__logo b-lazy" src="/gfx/standards/loader.gif?r=1696937716" data-src="/gfx/standards/smile_logo.svg?r=1652092768">
						<iaixsl:attribute name="alt">Sie kaufen und die Lieferung ist kostenlos!</iaixsl:attribute>
					</img>
					<span class="projector_smile__inpost">
						<span class="projector_smile__inpost_text">Kostenlose Lieferung an Paketautomaten</span>
						<img class="projector_smile__inpost_logo b-lazy" src="/gfx/standards/loader.gif?r=1696937716" data-src="/gfx/standards/logo_inpost.svg?r=1652092768">
							<iaixsl:attribute name="alt"><iaixsl:value-of select="/shop/page/projector/product/smile/delivery/@name"/></iaixsl:attribute>
						</img>
					</span>
				</div>
				<div class="projector_smile__block --desc">
					<a class="projector_smile__link" href="#more">Mehr Informationen</a>
				</div>
			</div>
			<div class="smile_info">
				<h6 class="headline">
					<span class="headline__name">Sie kaufen und die Lieferung ist kostenlos!</span>
				</h6>
				<div class="smile_info__item --smile">
					<img class="smile_info__logo b-lazy" src="/gfx/standards/loader.gif?r=1696937716" data-src="/gfx/standards/smile_logo.svg?r=1652092768">
						<iaixsl:attribute name="alt">Sie kaufen und die Lieferung ist kostenlos!</iaixsl:attribute>
					</img>
					<div class="smile_info__sub">
						<span class="smile_info__text">
							Die Lieferungen von Online-Shops
						</span>
						<strong class="smile_info__strong">
							sind bei einer Bestellung von
							<span class="smile_info__price"><iaixsl:value-of select="/shop/page/projector/product/smile/delivery/@minprice_formatted"/></span>
								kostenlos.
						</strong>
					</div>
				</div>
				<div class="smile_info__item --inpost">
					<span class="smile_info__text">
						Die kostenlose Lieferung beinhaltet die Lieferung an einen Paketautomaten
					</span>
					<img class="smile_info__inpost_logo b-lazy" src="/gfx/standards/loader.gif?r=1696937716" data-src="/gfx/standards/logo_inpost.svg?r=1652092768">
						<iaixsl:attribute name="alt"><iaixsl:value-of select="/shop/page/projector/product/smile/delivery/@name"/></iaixsl:attribute>
					</img>
				</div>
				<div class="smile_info__item --footer">
					<span class="smile_info__iai">Smile ist ein IdoSell-Dienst</span>
					<img class="b-lazy" src="/gfx/standards/loader.gif?r=1696937716" data-src="/gfx/standards/smile_info_iai.svg?r=1652092768">
						Smile ist ein IdoSell-Dienst
					</img>
				</div>
			</div>
		</iaixsl:if>
	</form>

	<script class="ajaxLoad">
		app_shop.vars.contact_link = &quot;<iaixsl:value-of select="/shop/contact/link/@url"/>&quot;;
	</script>

	
	<iaixsl:if test="/shop/@get_ajax_projector_xml"> </iaixsl:if>
	<iaixsl:if test="/shop/page/projector/bookmarklets/item/@icon_small"> </iaixsl:if>
	<iaixsl:if test="/shop/page/projector/product/products_other_founds"> </iaixsl:if>
	<iaixsl:if test="/shop/page/projector/product/payment/instalment/@src"> </iaixsl:if>
<!-- (projector_configurator, 614c5cf078bd13.85672872.4)-->
			<iaixsl:if test="/shop/page/projector/product/@product_type = 'product_configurable' and /shop/page/projector/product/priceFormula">
				<iaixsl:variable name="nettoPrice"><iaixsl:if test="/shop/page/@price_type = 'net'">true</iaixsl:if></iaixsl:variable>
				<div id="projector_configurator" class="configurator">
					<iaixsl:if test="not($nettoPrice = '')">
						<iaixsl:attribute name="data-netto">true</iaixsl:attribute>
					</iaixsl:if>
					<iaixsl:variable name="current_language"><iaixsl:value-of select="/shop/language/@id"/></iaixsl:variable>
					<iaixsl:for-each select="/shop/page/projector/product/priceFormula/parameters/parameter">
						<div class="configurator__item">
							<iaixsl:attribute name="data-name"><iaixsl:value-of select="name"/></iaixsl:attribute>
							<iaixsl:attribute name="data-type"><iaixsl:value-of select="type"/></iaixsl:attribute>
							<iaixsl:if test="settings/min or settings/max">
								<iaixsl:attribute name="data-limits">true</iaixsl:attribute>
							</iaixsl:if>
							<iaixsl:if test="settings/minChecked">
								<iaixsl:attribute name="data-required">true</iaixsl:attribute>
							</iaixsl:if>
							<span class="configurator__label"><iaixsl:value-of select="translations/language[name = $current_language]/value"/></span>
							<div class="configurator__sub">
								<iaixsl:attribute name="data-type"><iaixsl:value-of select="type"/></iaixsl:attribute>
								<iaixsl:choose>
									<iaixsl:when test="type = 'radio'">
										<iaixsl:for-each select="values/value">
											<div class="f-group --radio">
												<input type="radio" class="f-control">
													<iaixsl:attribute name="id"><iaixsl:value-of select="name"/></iaixsl:attribute>
													<iaixsl:attribute name="name">priceformula[<iaixsl:value-of select="../../name"/>]</iaixsl:attribute>
													<iaixsl:attribute name="value"><iaixsl:value-of select="name"/></iaixsl:attribute>
													<iaixsl:if test="position() = 1">
														<iaixsl:attribute name="checked">checked</iaixsl:attribute>
													</iaixsl:if>
												</input>
												<label class="f-label">
													<iaixsl:attribute name="for"><iaixsl:value-of select="name"/></iaixsl:attribute>
													<iaixsl:if test="additional/graphics">
														<span class="configurator__icon">
															<img>
																<iaixsl:attribute name="src"><iaixsl:value-of select="additional/graphics"/></iaixsl:attribute>
																<iaixsl:attribute name="alt"><iaixsl:value-of select="translations/language[name = $current_language]/value"/></iaixsl:attribute>
															</img>
														</span>
													</iaixsl:if>
													<span class="configurator__name"><iaixsl:value-of select="translations/language[name = $current_language]/value"/></span>
													<iaixsl:if test="additional/priceModifier">
														<span class="configurator__price"><iaixsl:value-of select="additional/priceModifierFormatted"/></span>
													</iaixsl:if>
												</label>
											</div>
										</iaixsl:for-each>
									</iaixsl:when>
									<iaixsl:when test="type = 'select'">
										<select class="f-select">
											<iaixsl:attribute name="name">priceformula[<iaixsl:value-of select="name"/>]</iaixsl:attribute>
											<iaixsl:for-each select="values/value">
												<option>
													<iaixsl:attribute name="value"><iaixsl:value-of select="name"/></iaixsl:attribute>
													<iaixsl:if test="additional/graphics">
														<iaixsl:attribute name="data-icon"><iaixsl:value-of select="additional/graphics"/></iaixsl:attribute>
													</iaixsl:if>
													<iaixsl:if test="additional/priceModifier">
														<iaixsl:attribute name="data-price"><iaixsl:value-of select="additional/priceModifierFormatted"/></iaixsl:attribute>
													</iaixsl:if>
													<iaixsl:value-of select="translations/language[name = $current_language]/value"/>
												</option>
											</iaixsl:for-each>
										</select>
									</iaixsl:when>
									<iaixsl:when test="type = 'checkbox'">
										<iaixsl:for-each select="values/value">
											<div class="f-group --checkbox">
												<input type="checkbox" class="f-control">
													<iaixsl:attribute name="id"><iaixsl:value-of select="name"/></iaixsl:attribute>
													<iaixsl:attribute name="name">priceformula[<iaixsl:value-of select="../../name"/>]</iaixsl:attribute>
													<iaixsl:attribute name="value"><iaixsl:value-of select="name"/></iaixsl:attribute>
													<iaixsl:if test="../../settings/minChecked and position() = 1">
														<iaixsl:attribute name="checked">checked</iaixsl:attribute>
													</iaixsl:if>
												</input>
												<label class="f-label">
													<iaixsl:attribute name="for"><iaixsl:value-of select="name"/></iaixsl:attribute>
													<iaixsl:if test="additional/graphics">
														<span class="configurator__icon">
															<img>
																<iaixsl:attribute name="src"><iaixsl:value-of select="additional/graphics"/></iaixsl:attribute>
																<iaixsl:attribute name="alt"><iaixsl:value-of select="translations/language[name = $current_language]/value"/></iaixsl:attribute>
															</img>
														</span>
													</iaixsl:if>
													<span class="configurator__name"><iaixsl:value-of select="translations/language[name = $current_language]/value"/></span>
													<iaixsl:if test="additional/priceModifier">
														<span class="configurator__price"><iaixsl:value-of select="additional/priceModifierFormatted"/></span>
													</iaixsl:if>
												</label>
											</div>
										</iaixsl:for-each>
									</iaixsl:when>
									<iaixsl:when test="type = 'input'">
										<div class="f-group">
											<input class="f-control">
												<iaixsl:if test="settings/min">
													<iaixsl:attribute name="placeholder">Füllen Sie das Pflichtfeld aus</iaixsl:attribute>
													<iaixsl:attribute name="required">required</iaixsl:attribute>
												</iaixsl:if>
												<iaixsl:choose>
													<iaixsl:when test="settings/type = 'string'">
														<iaixsl:attribute name="type">text</iaixsl:attribute>
														<iaixsl:if test="settings/min">
															<iaixsl:attribute name="minlength"><iaixsl:value-of select="settings/min"/></iaixsl:attribute>
														</iaixsl:if>
														<iaixsl:if test="settings/max">
															<iaixsl:attribute name="maxlength"><iaixsl:value-of select="settings/max"/></iaixsl:attribute>
														</iaixsl:if>
													</iaixsl:when>
													<iaixsl:otherwise>
														<iaixsl:attribute name="type">number</iaixsl:attribute>
														<iaixsl:choose>
															<iaixsl:when test="settings/type = 'int'">
																<iaixsl:attribute name="step">1</iaixsl:attribute>
															</iaixsl:when>
															<iaixsl:otherwise>
																<iaixsl:attribute name="step">any</iaixsl:attribute>
															</iaixsl:otherwise>
														</iaixsl:choose>
														<iaixsl:if test="settings/min">
															<iaixsl:attribute name="min"><iaixsl:value-of select="settings/min"/></iaixsl:attribute>
															<iaixsl:attribute name="value"><iaixsl:value-of select="settings/min"/></iaixsl:attribute>
														</iaixsl:if>
														<iaixsl:if test="settings/max">
															<iaixsl:attribute name="max"><iaixsl:value-of select="settings/max"/></iaixsl:attribute>
														</iaixsl:if>
													</iaixsl:otherwise>
												</iaixsl:choose>
												<iaixsl:attribute name="id"><iaixsl:value-of select="name"/></iaixsl:attribute>
												<iaixsl:attribute name="name">priceformula[<iaixsl:value-of select="name"/>]</iaixsl:attribute>
												<iaixsl:attribute name="data-type"><iaixsl:value-of select="settings/type"/></iaixsl:attribute>
												<iaixsl:if test="settings/min">
													<iaixsl:attribute name="data-min"><iaixsl:value-of select="settings/min"/></iaixsl:attribute>
												</iaixsl:if>
												<iaixsl:if test="settings/max">
													<iaixsl:attribute name="data-max"><iaixsl:value-of select="settings/max"/></iaixsl:attribute>
												</iaixsl:if>
											</input>
										</div>
										<iaixsl:if test="settings/min or settings/max">
											<div class="configurator__limits">
												<iaixsl:choose>
													<iaixsl:when test="settings/type = 'string'">
														<iaixsl:if test="settings/min and not(settings/min = '0')">
															<span class="configurator__limit --min --string">Minimale Anzahl von Zeichen <iaixsl:value-of select="settings/min"/></span>
														</iaixsl:if>
														<iaixsl:if test="settings/max">
															<span class="configurator__limit --max --string">Maximale Anzahl von Zeichen <iaixsl:value-of select="settings/max"/></span>
														</iaixsl:if>
													</iaixsl:when>
													<iaixsl:otherwise>
														<iaixsl:if test="settings/min">
															<span class="configurator__limit --min --digit">Minimalwert <iaixsl:value-of select="settings/min"/></span>
														</iaixsl:if>
														<iaixsl:if test="settings/max">
															<span class="configurator__limit --max --digit">Maximalwert <iaixsl:value-of select="settings/max"/></span>
														</iaixsl:if>
													</iaixsl:otherwise>
												</iaixsl:choose>
											</div>
										</iaixsl:if>
									</iaixsl:when>
								</iaixsl:choose>
							</div>
						</div>
					</iaixsl:for-each>
				</div>
				<iaixsl:if test="/shop/page/projector/product/priceFormula/parameters/parameter/settings/dependencies">
					<script>
						const configuratorDependencies = {
							<iaixsl:for-each select="/shop/page/projector/product/priceFormula/parameters/parameter[settings/dependencies]">
								&quot;<iaixsl:value-of select="name"/>&quot;: <iaixsl:value-of select="settings/dependencies"/><iaixsl:if test="position() != last()">,</iaixsl:if>
							</iaixsl:for-each>
						};
					</script>
				</iaixsl:if>
			</iaixsl:if>
		<!-- (projector_bundle_zone, 61b0b16d83f316.37427832.10)-->
	<iaixsl:if test="page/projector/bundled/product">
		<iaixsl:variable name="nettoPrice"><iaixsl:if test="/shop/page/@price_type = 'net'">true</iaixsl:if></iaixsl:variable>
		<div id="projector_bundle_product" class="projector_bundle">
			<iaixsl:if test="/shop/page/projector/bundled/@collection = 'true'">
				<iaixsl:attribute name="data-collection">true</iaixsl:attribute>
			</iaixsl:if>
			<iaixsl:if test="/shop/page/projector/bundled/@left_quantity and (not(/shop/page/projector/product/bundle_price/@amount_diff_gross = '0.00') or (not($nettoPrice = '') and not(/shop/page/projector/product/bundle_price/@amount_diff_net = '0.00')))">
				<div class="projector_bundle__rebate">
					<h2 class="projector_bundle__rebate_label">Erhalten Sie einen Rabatt, indem Sie Waren aus der Kollektion kaufen </h2>
					<div class="projector_bundle__rebate_wrapper">
						<span class="projector_bundle__rebate_description">Wählen Sie mindestens <iaixsl:value-of select="/shop/page/projector/bundled/@left_quantity"/> Produkte, um einen Rabatt zu erhalten</span>
					</div>
				</div>
			</iaixsl:if>

			<h2 class="projector_bundle__label">
				<iaixsl:choose>
					<iaixsl:when test="/shop/page/projector/bundled/@collection='true'">
						In der Kollektion
					</iaixsl:when>
					<iaixsl:otherwise>
						Produkte im Set
					</iaixsl:otherwise>
				</iaixsl:choose>
			</h2>

			<div class="projector_bundle__block">
				<iaixsl:for-each select="page/projector/bundled/product">
					<div class="projector_bundle__item">
						<iaixsl:if test="/shop/page/projector/bundled/@collection='true'">
							<div class="projector_bundle__checkbox_group f-group --checkbox">
								<input type="checkbox" class="projector_bundle__checkbox f-control">
									<iaixsl:attribute name="id">bundleCheckboxItem<iaixsl:value-of select="position()"/></iaixsl:attribute>
									<iaixsl:attribute name="name">bundled_quantity[<iaixsl:value-of select="@id"/>]</iaixsl:attribute>
									<iaixsl:attribute name="value"><iaixsl:value-of select="sizes/@unit_sellby"/></iaixsl:attribute>
									<iaixsl:attribute name="data-amount">
										<iaixsl:choose>
											<iaixsl:when test="sizes/size[@amount!=0][1]/@amount">
												<iaixsl:value-of select="sizes/size[@amount!=0][1]/@amount"/>
											</iaixsl:when>
											<iaixsl:otherwise>
												<iaixsl:value-of select="sizes/size[1]/@amount"/>
											</iaixsl:otherwise>
										</iaixsl:choose>
									</iaixsl:attribute>
									<iaixsl:attribute name="data-unit_sellby"><iaixsl:value-of select="sizes/@unit_sellby"/></iaixsl:attribute>
									<iaixsl:attribute name="data-unit"><iaixsl:value-of select="sizes/@unit_single"/></iaixsl:attribute>
									<iaixsl:attribute name="data-unit_precision"><iaixsl:value-of select="sizes/@unit_precision"/></iaixsl:attribute>
									<iaixsl:if test="count(sizes/size[@amount=0]) != count(sizes/size)"><iaixsl:attribute name="checked">checked</iaixsl:attribute></iaixsl:if>
								</input>
								<label class="projector_bundle__checkbox_label f-label">
									<iaixsl:attribute name="for">bundleCheckboxItem<iaixsl:value-of select="position()"/></iaixsl:attribute>
								</label>
							</div>
						</iaixsl:if>
						<input type="hidden" class="projector_bundle__product_id">
							<iaixsl:attribute name="name">bundled_product[<iaixsl:value-of select="@id"/>]</iaixsl:attribute>
							<iaixsl:attribute name="value"><iaixsl:value-of select="@product_id"/></iaixsl:attribute>
						</input>

						<a class="projector_bundle__icon">
							<iaixsl:if test="@link != ''">
								<iaixsl:attribute name="href"><iaixsl:value-of select="@link"/></iaixsl:attribute>
							</iaixsl:if>

              <iaixsl:choose>
                <iaixsl:when test="(icon_second and not(icon_second = '' or icon_second = '/')) or (enclosures/images/enclosure[1]/@icon_second and not(enclosures/images/enclosure[1]/@icon_second = '' or enclosures/images/enclosure[1]/@icon_second = '/'))">
                  <picture>
                    <source type="image/webp">
                      <iaixsl:choose>
                        <iaixsl:when test="enclosures/images/enclosure[1]/@icon">
                          <iaixsl:attribute name="srcset"><iaixsl:value-of select="enclosures/images/enclosure[1]/@icon"/></iaixsl:attribute>
                        </iaixsl:when>
                        <iaixsl:otherwise>
                          <iaixsl:attribute name="srcset"><iaixsl:value-of select="icon"/></iaixsl:attribute>
                        </iaixsl:otherwise>
                      </iaixsl:choose>
                    </source>
                    <img class="b-lazy" src="/gfx/standards/loader.gif?r=1696937716">
                      <iaixsl:if test="enclosures/images/enclosure[1]/@icon">
                        <iaixsl:attribute name="width"><iaixsl:value-of select="enclosures/images/enclosure[1]/@icon_width"/></iaixsl:attribute>
                        <iaixsl:attribute name="height"><iaixsl:value-of select="enclosures/images/enclosure[1]/@icon_height"/></iaixsl:attribute>
                      </iaixsl:if>
                      <iaixsl:attribute name="data-src">
                        <iaixsl:choose>
                          <iaixsl:when test="enclosures/images/enclosure[1]/@icon_second">
                            <iaixsl:value-of select="enclosures/images/enclosure[1]/@icon_second"/>
                          </iaixsl:when>
                          <iaixsl:otherwise>
                            <iaixsl:value-of select="icon_second"/>
                          </iaixsl:otherwise>
                        </iaixsl:choose>
                      </iaixsl:attribute>
                      <iaixsl:attribute name="alt"><iaixsl:value-of select="name"/></iaixsl:attribute>
                    </img>
                  </picture>
                </iaixsl:when>
                <iaixsl:otherwise>
                  <img class="b-lazy" src="/gfx/standards/loader.gif?r=1696937716">
                    <iaixsl:if test="enclosures/images/enclosure[1]/@icon">
                      <iaixsl:attribute name="width"><iaixsl:value-of select="enclosures/images/enclosure[1]/@icon_width"/></iaixsl:attribute>
                      <iaixsl:attribute name="height"><iaixsl:value-of select="enclosures/images/enclosure[1]/@icon_height"/></iaixsl:attribute>
                    </iaixsl:if>
                    <iaixsl:attribute name="data-src">
                      <iaixsl:choose>
                        <iaixsl:when test="enclosures/images/enclosure[1]/@icon">
                          <iaixsl:value-of select="enclosures/images/enclosure[1]/@icon"/>
                        </iaixsl:when>
                        <iaixsl:otherwise>
                          <iaixsl:value-of select="icon"/>
                        </iaixsl:otherwise>
                      </iaixsl:choose>
                    </iaixsl:attribute>
                    <iaixsl:attribute name="alt"><iaixsl:value-of select="name"/></iaixsl:attribute>
                  </img>
                </iaixsl:otherwise>
              </iaixsl:choose>
						</a>

						<div class="projector_bundle__info">
							<a class="projector_bundle__name">
								<iaixsl:if test="@link != ''">
									<iaixsl:attribute name="href"><iaixsl:value-of select="@link"/></iaixsl:attribute>
								</iaixsl:if>
								<span class="projector_bundle__name_value"><iaixsl:value-of select="name"/></span>
								<strong class="projector_bundle__name_quantity"><iaixsl:if test="@bundle_quantity and not(@bundle_quantity = 1)"><iaixsl:attribute name="class">projector_bundle__name_quantity --active</iaixsl:attribute></iaixsl:if> (<span class="projector_bundle__name_quantity_value"><iaixsl:value-of select="@bundle_quantity"/></span> <iaixsl:value-of select="sizes/@unit"/>)</strong>
							</a>

							<div class="projector_bundle__price_wrapper">
								<iaixsl:if test="price/@value = 0">
									<iaixsl:attribute name="style">display:none</iaixsl:attribute>
								</iaixsl:if>
								<strong class="projector_bundle__price"><iaixsl:choose><iaixsl:when test="not($nettoPrice = '')"><iaixsl:value-of select="price/@price_net_formatted"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="price/@price_formatted"/></iaixsl:otherwise></iaixsl:choose></strong>
								<iaixsl:if test="sizes/@unit_single">
									<span class="projector_bundle__price_unit"> / <iaixsl:value-of select="sizes/@unit_single"/></span>
								</iaixsl:if>
							</div>

							<div class="projector_bundle__availability" style="display:none;">
								<iaixsl:if test="count(sizes/size[@amount=0]) = count(sizes/size) and count(sizes/size) = 1 and not(multiversions and versions/@version_choice='true')"><iaixsl:attribute name="style">display:block;</iaixsl:attribute></iaixsl:if>
								<iaixsl:choose>
									<iaixsl:when test="multiversions and versions/@version_choice='true'">
										Das Produkt ist nicht verfügbar.
									</iaixsl:when>
									<iaixsl:otherwise>
										Das Produkt ist nicht verfügbar.
									</iaixsl:otherwise>
								</iaixsl:choose>
							</div>

							<div class="projector_bundle__availability_quantity" style="display:none;">
								<iaixsl:attribute name="data-bundle_quantity"><iaixsl:value-of select="@bundle_quantity"/></iaixsl:attribute>
								<iaixsl:if test="count(sizes/size) = 1 and sizes/size/@amount &gt; 0 and @bundle_quantity &gt; sizes/size/@amount and not(multiversions and versions/@version_choice='true')"><iaixsl:attribute name="style">display:block;</iaixsl:attribute></iaixsl:if>
								<span>Produkt in kleineren Mengen erhältlich. </span>
								<a class="projector_bundle__availability_quantity_link"><iaixsl:attribute name="href"><iaixsl:value-of select="@link"/></iaixsl:attribute><iaixsl:choose><iaixsl:when test="/shop/page/projector/bundled/@collection='true'">Außerhalb der Sammlung kaufen</iaixsl:when><iaixsl:otherwise>Außerhalb des Sets kaufen</iaixsl:otherwise></iaixsl:choose></a>
							</div>

							<div class="projector_bundle__options">
								<iaixsl:if test="sizes/size/@type='onesize' and not(multiversions and versions/@version_choice='true') and not(sizes_chart)">
									<iaixsl:attribute name="data-only_onesize">true</iaixsl:attribute>
								</iaixsl:if>
								<iaixsl:if test="multiversions and versions/@version_choice='true'">
									<iaixsl:for-each select="multiversions/multi_version">
										<div class="projector_bundle__option --versions">
											<iaixsl:attribute name="data-id"><iaixsl:value-of select="@id"/></iaixsl:attribute>
											<select class="projector_bundle__version f-select --small --placeholder">
												<iaixsl:attribute name="data-label"><iaixsl:value-of disable-output-escaping="yes" select="@name"/></iaixsl:attribute>
												<option value="">Version wählen</option>
												<iaixsl:for-each select="item">
													<option>
														<iaixsl:variable name="value_name"><iaixsl:for-each select="values/value"><iaixsl:if test="not(position() = 1)"> / </iaixsl:if><iaixsl:value-of disable-output-escaping="yes" select="@name"/></iaixsl:for-each></iaixsl:variable>
														
														<iaixsl:if test="@disabled = 'true'">
															<iaixsl:attribute name="class">--dependent</iaixsl:attribute>
														</iaixsl:if>
														<iaixsl:variable name="currentProductId"><iaixsl:value-of select="products/product/@product_id"/></iaixsl:variable>
														<iaixsl:if test="count(/shop/page/projector/bundled/product/multiversions/multi_version) = 1 and /shop/page/projector/bundled/product/versions/version[@product_id = $currentProductId]/@amount = '0'">
															<iaixsl:attribute name="class">--disabled</iaixsl:attribute>
															<iaixsl:attribute name="label"><iaixsl:value-of select="$value_name"/> (ausverkauft)</iaixsl:attribute>
														</iaixsl:if>
														<iaixsl:attribute name="data-values_id"><iaixsl:value-of select="values/@id"/></iaixsl:attribute>
														<iaixsl:attribute name="data-value"><iaixsl:value-of select="position()"/></iaixsl:attribute>
														<iaixsl:attribute name="data-product"><iaixsl:value-of select="products/product/@product_id"/></iaixsl:attribute>
														<iaixsl:attribute name="data-link"><iaixsl:value-of select="products/product/@url"/></iaixsl:attribute>
														<iaixsl:if test="values/value[@gfx]">
															<iaixsl:attribute name="data-gfx"><iaixsl:for-each select="values/value[@gfx]"><iaixsl:if test="not(position() = 1)">|next|</iaixsl:if><iaixsl:value-of select="@gfx"/></iaixsl:for-each></iaixsl:attribute>
														</iaixsl:if>
														<iaixsl:value-of select="$value_name"/>
													</option>
												</iaixsl:for-each>
											</select>
										</div>
									</iaixsl:for-each>
								</iaixsl:if>

								<div class="projector_bundle__option --sizes">
									<iaixsl:if test="multiversions and versions/@version_choice='true'">
										<iaixsl:attribute name="data-hide">true</iaixsl:attribute>
									</iaixsl:if>
									<iaixsl:choose>
										<iaixsl:when test="sizes/size/@type='onesize'">
											<iaixsl:attribute name="data-onesize">true</iaixsl:attribute>
											<input class="projector_bundle__product_size" type="hidden" value="">
												<iaixsl:attribute name="name">bundled_size[<iaixsl:value-of select="@id"/>]</iaixsl:attribute>
												<iaixsl:attribute name="value"><iaixsl:value-of select="sizes/size[1]/@type"/></iaixsl:attribute>
											</input>
										</iaixsl:when>
										<iaixsl:when test="count(sizes/size) = 1">
											<a class="projector_bundle__size_button --selected">
												<iaixsl:attribute name="class">projector_bundle__size_button --selected<iaixsl:if test="not(sizes/size/@amount &gt; 0 or sizes/size/@amount = '-1')"> --disabled</iaixsl:if></iaixsl:attribute>
												<iaixsl:attribute name="href">#<iaixsl:value-of select="sizes/size/@type"/></iaixsl:attribute>
												<iaixsl:attribute name="data-value"><iaixsl:value-of select="sizes/size/@type"/></iaixsl:attribute>
												<input class="projector_bundle__product_size" type="hidden">
													<iaixsl:attribute name="value"><iaixsl:value-of select="sizes/size/@type"/></iaixsl:attribute>
													<iaixsl:attribute name="name">bundled_size[<iaixsl:value-of select="@id"/>]</iaixsl:attribute>
												</input>
												<span class="projector_bundle__size_name"><iaixsl:value-of select="sizes/size/@description"/></span>
											</a>
										</iaixsl:when>
										<iaixsl:otherwise>
											<select class="projector_bundle__size f-select --small --placeholder">
												<iaixsl:attribute name="name">bundled_size[<iaixsl:value-of select="@id"/>]</iaixsl:attribute>
												<iaixsl:attribute name="data-label">Größe</iaixsl:attribute>
												<option value="">Größe auswählen</option>
												<iaixsl:for-each select="sizes/size">
													<option>
														<iaixsl:if test="@amount = 0">
															<iaixsl:attribute name="class">--disabled</iaixsl:attribute>
															<iaixsl:attribute name="label"><iaixsl:value-of select="@description"/> (ausverkauft)</iaixsl:attribute>
														</iaixsl:if>
														<iaixsl:attribute name="value"><iaixsl:value-of select="@type"/></iaixsl:attribute>
														<iaixsl:attribute name="data-count"><iaixsl:value-of select="@amount"/></iaixsl:attribute>
														<iaixsl:value-of select="@description"/>
													</option>
												</iaixsl:for-each>
											</select>
										</iaixsl:otherwise>
									</iaixsl:choose>
								</div>

								<iaixsl:if test="sizes_chart">
									<div class="projector_bundle__option --chart">
										<a href="#showSizesChart" class="projector_bundle__chart_link">
											<iaixsl:attribute name="data-id">#component_colection_sizes_chart_<iaixsl:value-of select="sizes_chart/@id"/>_<iaixsl:value-of select="../@id"/></iaixsl:attribute>
											Prüfen Sie die Produktabmessungen
										</a>
									</div>
									<div class="projector_bundle__chart_wrapper component_projector_sizes_chart" style="display:none;">
										<iaixsl:attribute name="id">component_colection_sizes_chart_<iaixsl:value-of select="sizes_chart/@id"/>_<iaixsl:value-of select="../@id"/></iaixsl:attribute>
										<iaixsl:if test="sizes_chart/descriptions/description">
											<h2/>
											<table class="table-condensed">
												<iaixsl:attribute name="class">ui-responsive table-stroke ui-table ui-table-reflow table-condensed</iaixsl:attribute>
												<thead>
													<tr>
														<th class="table-first-column">Größe </th>
														<iaixsl:for-each select="sizes_chart/descriptions/description">
															<th>
																<iaixsl:value-of disable-output-escaping="yes" select="@name"/>
															</th>
														</iaixsl:for-each>
													</tr>
												</thead>
												<tbody>
													<iaixsl:for-each select="sizes_chart/sizes/size">
														<tr>
															<td class="table-first-column">
																<iaixsl:value-of disable-output-escaping="yes" select="@description"/>
															</td>
															<iaixsl:for-each select="description">
																<td>
																	<iaixsl:value-of disable-output-escaping="yes" select="@text"/>
																</td>
															</iaixsl:for-each>
														</tr>
													</iaixsl:for-each>
												</tbody>
											</table>
										</iaixsl:if>
										<div class="sizes_chart_cms">
											<iaixsl:if test="sizes_chart/text">
												<iaixsl:value-of disable-output-escaping="yes" select="sizes_chart/text"/>
											</iaixsl:if>
										</div>
									</div>
								</iaixsl:if>
							</div>
						</div>
					</div>
				</iaixsl:for-each>
			</div>
		</div>
	</iaixsl:if>
<!-- (projector_cms, 60dd8eb7324b89.38047315.3)-->
            <iaixsl:if test="page/projector/text/body">
                <div class="component_projector_cms cm">
                    <iaixsl:attribute name="id">component_projector_cms</iaixsl:attribute>
                    <div class="n56196_main">
                    
                        <div class="n56196_sub">
                            <iaixsl:value-of disable-output-escaping="yes" select="page/projector/text/body"/>
                        </div>
                    
                    </div>              
                </div>
            </iaixsl:if>
        <!-- (projector_in_bundle, 614c5d2fae53f9.86192217.7)-->
	
	<iaixsl:if test="page/projector/bundle/product or page/projector/collection/product">
		<section id="projector_in_bundle" class="hotspot mb-5 --bundle col-12">

			
			
			<iaixsl:variable name="var_omnibus_enabled"><iaixsl:if test="/shop/@omnibus = 1">true</iaixsl:if></iaixsl:variable>
			

			<h2>
				<span class="headline"><span class="headline__name">Sparen Sie, indem Sie mehr kaufen</span></span>
			</h2>

			<div class="products d-flex flex-wrap mx-sm-n1 mx-md-n3">
				
				<iaixsl:for-each select="page/projector/bundle/product">
					
					<iaixsl:variable name="var_name"><iaixsl:value-of disable-output-escaping="yes" select="name/text()"/></iaixsl:variable>
					<iaixsl:variable name="var_icon"><iaixsl:value-of select="icon"/></iaixsl:variable>
					<iaixsl:variable name="var_icon_second"><iaixsl:value-of select="icon_second"/></iaixsl:variable>
					<iaixsl:variable name="var_link"><iaixsl:value-of select="@link"/></iaixsl:variable>
					<iaixsl:variable name="var_net_prices"><iaixsl:if test="/shop/page/@price_type = 'net'"><iaixsl:value-of select="$priceTypeText"/></iaixsl:if></iaixsl:variable>
					<iaixsl:variable name="var_gross_prices"><iaixsl:if test="/shop/page/@price_type = 'gross'"><iaixsl:value-of select="$priceTypeText"/></iaixsl:if></iaixsl:variable>

					<div class="product col-6 col-sm-4 col-xl-2 py-3 d-sm-flex p-sm-1 p-md-3">
						
						<a class="product__icon d-flex justify-content-center align-items-center p-sm-1 m-sm-0">
							<iaixsl:attribute name="data-product-id"><iaixsl:value-of select="@id"/></iaixsl:attribute>
							<iaixsl:attribute name="href"><iaixsl:value-of select="$var_link"/></iaixsl:attribute>
							<iaixsl:attribute name="title"><iaixsl:value-of select="$var_name"/></iaixsl:attribute>

              <iaixsl:choose>
                <iaixsl:when test="$var_icon_second and not($var_icon_second = '' or $var_icon_second = '/')">
                  <picture>
                    <source type="image/webp">
                      <iaixsl:attribute name="srcset"><iaixsl:value-of select="$var_icon"/></iaixsl:attribute>
                    </source>
                    <img src="/gfx/standards/loader.gif?r=1696937716" class="b-lazy">
                      <iaixsl:attribute name="data-src"><iaixsl:value-of disable-output-escaping="yes" select="$var_icon_second"/></iaixsl:attribute>
                      <iaixsl:attribute name="alt"><iaixsl:value-of disable-output-escaping="yes" select="$var_name"/></iaixsl:attribute>
                    </img>
                  </picture>
                </iaixsl:when>
                <iaixsl:otherwise>
                  <img src="/gfx/standards/loader.gif?r=1696937716" class="b-lazy">
                    <iaixsl:attribute name="data-src"><iaixsl:value-of disable-output-escaping="yes" select="$var_icon"/></iaixsl:attribute>
                    <iaixsl:attribute name="alt"><iaixsl:value-of disable-output-escaping="yes" select="$var_name"/></iaixsl:attribute>
                  </img>
                </iaixsl:otherwise>
              </iaixsl:choose>
						</a>

						<div class="product__wrapper d-sm-flex flex-sm-column justify-content-sm-center p-sm-3 px-lg-5">
							
							<h3>
								<a class="product__name">
									<iaixsl:attribute name="href"><iaixsl:value-of select="$var_link"/></iaixsl:attribute>
									<iaixsl:attribute name="title"><iaixsl:value-of select="$var_name"/></iaixsl:attribute>
									<iaixsl:value-of select="$var_name"/>
								</a>
							</h3>

							
							
							<iaixsl:variable name="var_size_min"><iaixsl:choose><iaixsl:when test="$var_net_prices = '' and sizes/prices/@size_min"><iaixsl:value-of select="sizes/prices/@size_min"/></iaixsl:when><iaixsl:when test="not($var_net_prices = '') and sizes/prices/@size_min_net"><iaixsl:value-of select="sizes/prices/@size_min_net"/></iaixsl:when><iaixsl:otherwise><iaixsl:choose><iaixsl:when test="$var_net_prices = '' and price/@size_min"><iaixsl:value-of select="price/@size_min"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="price/@size_min_net"/></iaixsl:otherwise></iaixsl:choose></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
							<iaixsl:variable name="var_size_max"><iaixsl:choose><iaixsl:when test="$var_net_prices = '' and sizes/prices/@size_max"><iaixsl:value-of select="sizes/prices/@size_max"/></iaixsl:when><iaixsl:when test="not($var_net_prices = '') and sizes/prices/@size_max_net"><iaixsl:value-of select="sizes/prices/@size_max_net"/></iaixsl:when><iaixsl:otherwise><iaixsl:choose><iaixsl:when test="$var_net_prices = '' and price/@size_max"><iaixsl:value-of select="price/@size_max"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="price/@size_max_net"/></iaixsl:otherwise></iaixsl:choose></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
							<iaixsl:variable name="var_size_min_maxprice"><iaixsl:choose><iaixsl:when test="$var_net_prices = '' and sizes/prices/@size_min_maxprice"><iaixsl:value-of select="sizes/prices/@size_min_maxprice"/></iaixsl:when><iaixsl:when test="not($var_net_prices = '') and sizes/prices/@size_min_maxprice_net"><iaixsl:value-of select="sizes/prices/@size_min_maxprice_net"/></iaixsl:when><iaixsl:otherwise><iaixsl:choose><iaixsl:when test="$var_net_prices = '' and price/@size_min_maxprice"><iaixsl:value-of select="price/@size_min_maxprice"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="price/@size_min_maxprice_net"/></iaixsl:otherwise></iaixsl:choose></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
							<iaixsl:variable name="var_size_max_maxprice"><iaixsl:choose><iaixsl:when test="$var_net_prices = '' and sizes/prices/@size_max_maxprice"><iaixsl:value-of select="sizes/prices/@size_max_maxprice"/></iaixsl:when><iaixsl:when test="not($var_net_prices = '') and sizes/prices/@size_max_maxprice_net"><iaixsl:value-of select="sizes/prices/@size_max_maxprice_net"/></iaixsl:when><iaixsl:otherwise><iaixsl:choose><iaixsl:when test="$var_net_prices = '' and price/@size_max_maxprice"><iaixsl:value-of select="price/@size_max_maxprice"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="price/@size_max_maxprice_net"/></iaixsl:otherwise></iaixsl:choose></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
							<iaixsl:variable name="var_maxprice"><iaixsl:choose><iaixsl:when test="$var_net_prices = '' and price/@maxprice"><iaixsl:value-of select="price/@maxprice"/></iaixsl:when><iaixsl:when test="not($var_net_prices = '') and price/@maxprice_net"><iaixsl:value-of select="price/@maxprice_net"/></iaixsl:when><iaixsl:otherwise><iaixsl:choose><iaixsl:when test="$var_net_prices = '' and sizes/prices/@maxprice"><iaixsl:value-of select="sizes/prices/@maxprice"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="sizes/prices/@maxprice_net"/></iaixsl:otherwise></iaixsl:choose></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
							

							
							
							
							<iaixsl:variable name="last_price_change_date"><iaixsl:choose>
								<iaixsl:when test="sizes/size/price and (count(sizes/size) &gt; 1)"><iaixsl:for-each select="sizes/size[price/@last_price_change_date]"><iaixsl:if test="@type and price/@last_price_change_date"><iaixsl:value-of select="price/@last_price_change_date"/>;&apos;<iaixsl:value-of select="@type"/>&apos;<iaixsl:if test="not(position() = last())">#separator#</iaixsl:if></iaixsl:if></iaixsl:for-each></iaixsl:when>
								<iaixsl:when test="price/@last_price_change_date"><iaixsl:value-of select="price/@last_price_change_date"/></iaixsl:when>
							</iaixsl:choose></iaixsl:variable>

							
							<iaixsl:variable name="var_show_omnibus_short_fallback"><iaixsl:choose>
								<iaixsl:when test="((not(price/@omnibus_price) or not(price/@omnibus_price_net)) and $var_omnibus_enabled = 'true' and not($last_price_change_date = ''))">true</iaixsl:when>
								<iaixsl:otherwise>false</iaixsl:otherwise>
							</iaixsl:choose></iaixsl:variable>
							
							

							<iaixsl:choose>
								
								<iaixsl:when test="$var_net_prices = ''">
									<div class="product__prices">
										<iaixsl:if test="price/@omnibus_price">
											<iaixsl:attribute name="class">product__prices --omnibus</iaixsl:attribute>
										</iaixsl:if>

										
										
										<iaixsl:if test="$var_show_omnibus_short_fallback = 'true'">

											
											<iaixsl:attribute name="data-last_price_change_date"><iaixsl:value-of select="$last_price_change_date"/></iaixsl:attribute>

											
											
											<iaixsl:attribute name="data-omnibus-type">collection</iaixsl:attribute>

											
											<iaixsl:if test="@id">
												<iaixsl:attribute name="data-omnibus_product_id"><iaixsl:value-of select="@id"/></iaixsl:attribute>
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
											<iaixsl:when test="price/@value &gt; 0">
												<div class="product__promo d-flex flex-column">
													<iaixsl:if test="bundle_price/@price_gross &gt; price/@value">
														<span class="price --max">
															
															<iaixsl:if test="price/@omnibus_price or ($var_show_omnibus_short_fallback = 'true')">
																<span class="omnibus_label --hidden"><iaixsl:if test="price/@omnibus_price"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Normaler Preis: </span>
															</iaixsl:if>
															
															<del>
																<iaixsl:value-of select="bundle_price/@price_gross_formatted"/>
															</del>
														</span>
													</iaixsl:if>
													<strong class="price">
														<iaixsl:value-of select="price/@price_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_gross_prices"/></span>
													</strong>
													
													<iaixsl:if test="price/@omnibus_price or ($var_show_omnibus_short_fallback = 'true')">
														<div class="product__promo_omnibus omnibus_price --hidden">
															<iaixsl:if test="price/@omnibus_price"><iaixsl:attribute name="class">product__promo_omnibus omnibus_price</iaixsl:attribute></iaixsl:if>
															<span class="omnibus_price__text">Niedrigster Preis in 30 Tagen vor Rabatt: </span><span class="omnibus_price__value"><iaixsl:value-of select="price/@omnibus_price_formatted"/></span>
														</div>
													</iaixsl:if>
													
												</div>
												<iaixsl:if test="bundle_price/@percent_diff &gt; 0">
													<div class="product__promo_info_wrapper d-none">
														<span class="product__promo_info">Billiger im Set um <iaixsl:value-of select="substring-before(bundle_price/@percent_diff, '.')"/>%</span>
													</div>
												</iaixsl:if>
											</iaixsl:when>
											<iaixsl:otherwise>
												<a class="price --phone">
													<iaixsl:attribute name="title">Klicken Sie hier, um zum Kontaktformular zu gelangen</iaixsl:attribute>
													<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/contact/link/@url"/></iaixsl:attribute>
													Preis auf Anfrage
												</a>
											</iaixsl:otherwise>
										</iaixsl:choose>
									</div>
								</iaixsl:when>

								
								<iaixsl:otherwise>
									<div class="product__prices">
										<iaixsl:if test="price/@omnibus_price_net">
											<iaixsl:attribute name="class">product__prices --omnibus</iaixsl:attribute>
										</iaixsl:if>

										
										
										<iaixsl:if test="$var_show_omnibus_short_fallback = 'true'">

											
											<iaixsl:attribute name="data-last_price_change_date"><iaixsl:value-of select="$last_price_change_date"/></iaixsl:attribute>

											
											
											<iaixsl:attribute name="data-omnibus-type">collection</iaixsl:attribute>

											
											<iaixsl:if test="@id">
												<iaixsl:attribute name="data-omnibus_product_id"><iaixsl:value-of select="@id"/></iaixsl:attribute>
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
											<iaixsl:when test="price/@price_net &gt; 0">
												<div class="product__promo d-flex flex-column">
													<iaixsl:if test="bundle_price/@price_net &gt; price/@price_net">
														<span class="price --max">
															
															<iaixsl:if test="price/@omnibus_price_net or ($var_show_omnibus_short_fallback = 'true')">
																<span class="omnibus_label --hidden"><iaixsl:if test="price/@omnibus_price_net"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Normaler Preis: </span>
															</iaixsl:if>
															
															<del>
																<iaixsl:value-of select="bundle_price/@price_net_formatted"/>
															</del>
														</span>
													</iaixsl:if>
													<strong class="price">
														<iaixsl:value-of select="price/@price_net_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_net_prices"/></span>
													</strong>
													
													<iaixsl:if test="price/@omnibus_price_net or ($var_show_omnibus_short_fallback = 'true')">
														<div class="product__promo_omnibus omnibus_price --hidden">
															<iaixsl:if test="price/@omnibus_price_net"><iaixsl:attribute name="class">product__promo_omnibus omnibus_price</iaixsl:attribute></iaixsl:if>
															<span class="omnibus_price__text">Niedrigster Preis in 30 Tagen vor Rabatt: </span><span class="omnibus_price__value"><iaixsl:value-of select="price/@omnibus_price_net_formatted"/></span>
														</div>
													</iaixsl:if>
													
												</div>
												<iaixsl:if test="bundle_price/@percent_diff &gt; 0">
													<div class="product__promo_info_wrapper d-none">
														<span class="product__promo_info">Billiger im Set um <iaixsl:value-of select="substring-before(bundle_price/@percent_diff, '.')"/>%</span>
													</div>
												</iaixsl:if>
											</iaixsl:when>
											<iaixsl:otherwise>
												<a class="price --phone">
													<iaixsl:attribute name="title">Klicken Sie hier, um zum Kontaktformular zu gelangen</iaixsl:attribute>
													<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/contact/link/@url"/></iaixsl:attribute>
													Preis auf Anfrage
												</a>
											</iaixsl:otherwise>
										</iaixsl:choose>
									</div>
								</iaixsl:otherwise>
							</iaixsl:choose>

							
							<a class="product__see d-none d-sm-block mt-sm-3">
								<iaixsl:attribute name="href"><iaixsl:value-of select="$var_link"/></iaixsl:attribute>
								Sehen Sie das Set
							</a>
						</div>
					</div>
				</iaixsl:for-each>

				
				<iaixsl:for-each select="page/projector/collection/product">
					
					<iaixsl:variable name="var_name"><iaixsl:value-of disable-output-escaping="yes" select="name/text()"/></iaixsl:variable>
					<iaixsl:variable name="var_icon"><iaixsl:value-of select="icon"/></iaixsl:variable>
					<iaixsl:variable name="var_icon_second"><iaixsl:value-of select="icon_second"/></iaixsl:variable>
					<iaixsl:variable name="var_link"><iaixsl:value-of select="@link"/></iaixsl:variable>
					<iaixsl:variable name="var_net_prices"><iaixsl:if test="/shop/page/@price_type = 'net'"><iaixsl:value-of select="$priceTypeText"/></iaixsl:if></iaixsl:variable>
					<iaixsl:variable name="var_gross_prices"><iaixsl:if test="/shop/page/@price_type = 'gross'"><iaixsl:value-of select="$priceTypeText"/></iaixsl:if></iaixsl:variable>

					<div class="product col-6 col-sm-4 col-xl-2 py-3 d-sm-flex p-sm-1 p-md-3">
						
						<a class="product__icon d-flex justify-content-center align-items-center p-sm-1 m-sm-0">
							<iaixsl:attribute name="data-product-id"><iaixsl:value-of select="@id"/></iaixsl:attribute>
							<iaixsl:attribute name="href"><iaixsl:value-of select="$var_link"/></iaixsl:attribute>
							<iaixsl:attribute name="title"><iaixsl:value-of select="$var_name"/></iaixsl:attribute>

              <iaixsl:choose>
                <iaixsl:when test="$var_icon_second and not($var_icon_second = '' or $var_icon_second = '/')">
                  <picture>
                    <source type="image/webp">
                      <iaixsl:attribute name="srcset"><iaixsl:value-of select="$var_icon_second"/></iaixsl:attribute>
                    </source>
                    <img src="/gfx/standards/loader.gif?r=1696937716" class="b-lazy">
                      <iaixsl:attribute name="data-src"><iaixsl:value-of disable-output-escaping="yes" select="$var_icon"/></iaixsl:attribute>
                      <iaixsl:attribute name="alt"><iaixsl:value-of disable-output-escaping="yes" select="$var_name"/></iaixsl:attribute>
                    </img>
                  </picture>
                </iaixsl:when>
                <iaixsl:otherwise>
                  <img src="/gfx/standards/loader.gif?r=1696937716" class="b-lazy">
                    <iaixsl:attribute name="data-src"><iaixsl:value-of disable-output-escaping="yes" select="$var_icon"/></iaixsl:attribute>
                    <iaixsl:attribute name="alt"><iaixsl:value-of disable-output-escaping="yes" select="$var_name"/></iaixsl:attribute>
                  </img>
                </iaixsl:otherwise>
              </iaixsl:choose>
						</a>

						<div class="product__wrapper d-sm-flex flex-sm-column justify-content-sm-center p-sm-3 px-lg-5">
							
							<h3>
								<a class="product__name">
									<iaixsl:attribute name="href"><iaixsl:value-of select="$var_link"/></iaixsl:attribute>
									<iaixsl:attribute name="title"><iaixsl:value-of select="$var_name"/></iaixsl:attribute>
									<iaixsl:value-of select="$var_name"/>
								</a>
							</h3>

							
							
							<iaixsl:variable name="var_size_min"><iaixsl:choose><iaixsl:when test="$var_net_prices = '' and sizes/prices/@size_min"><iaixsl:value-of select="sizes/prices/@size_min"/></iaixsl:when><iaixsl:when test="not($var_net_prices = '') and sizes/prices/@size_min_net"><iaixsl:value-of select="sizes/prices/@size_min_net"/></iaixsl:when><iaixsl:otherwise><iaixsl:choose><iaixsl:when test="$var_net_prices = '' and price/@size_min"><iaixsl:value-of select="price/@size_min"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="price/@size_min_net"/></iaixsl:otherwise></iaixsl:choose></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
							<iaixsl:variable name="var_size_max"><iaixsl:choose><iaixsl:when test="$var_net_prices = '' and sizes/prices/@size_max"><iaixsl:value-of select="sizes/prices/@size_max"/></iaixsl:when><iaixsl:when test="not($var_net_prices = '') and sizes/prices/@size_max_net"><iaixsl:value-of select="sizes/prices/@size_max_net"/></iaixsl:when><iaixsl:otherwise><iaixsl:choose><iaixsl:when test="$var_net_prices = '' and price/@size_max"><iaixsl:value-of select="price/@size_max"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="price/@size_max_net"/></iaixsl:otherwise></iaixsl:choose></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
							<iaixsl:variable name="var_size_min_maxprice"><iaixsl:choose><iaixsl:when test="$var_net_prices = '' and sizes/prices/@size_min_maxprice"><iaixsl:value-of select="sizes/prices/@size_min_maxprice"/></iaixsl:when><iaixsl:when test="not($var_net_prices = '') and sizes/prices/@size_min_maxprice_net"><iaixsl:value-of select="sizes/prices/@size_min_maxprice_net"/></iaixsl:when><iaixsl:otherwise><iaixsl:choose><iaixsl:when test="$var_net_prices = '' and price/@size_min_maxprice"><iaixsl:value-of select="price/@size_min_maxprice"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="price/@size_min_maxprice_net"/></iaixsl:otherwise></iaixsl:choose></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
							<iaixsl:variable name="var_size_max_maxprice"><iaixsl:choose><iaixsl:when test="$var_net_prices = '' and sizes/prices/@size_max_maxprice"><iaixsl:value-of select="sizes/prices/@size_max_maxprice"/></iaixsl:when><iaixsl:when test="not($var_net_prices = '') and sizes/prices/@size_max_maxprice_net"><iaixsl:value-of select="sizes/prices/@size_max_maxprice_net"/></iaixsl:when><iaixsl:otherwise><iaixsl:choose><iaixsl:when test="$var_net_prices = '' and price/@size_max_maxprice"><iaixsl:value-of select="price/@size_max_maxprice"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="price/@size_max_maxprice_net"/></iaixsl:otherwise></iaixsl:choose></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
							<iaixsl:variable name="var_maxprice"><iaixsl:choose><iaixsl:when test="$var_net_prices = '' and price/@maxprice"><iaixsl:value-of select="price/@maxprice"/></iaixsl:when><iaixsl:when test="not($var_net_prices = '') and price/@maxprice_net"><iaixsl:value-of select="price/@maxprice_net"/></iaixsl:when><iaixsl:otherwise><iaixsl:choose><iaixsl:when test="$var_net_prices = '' and sizes/prices/@maxprice"><iaixsl:value-of select="sizes/prices/@maxprice"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="sizes/prices/@maxprice_net"/></iaixsl:otherwise></iaixsl:choose></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
							

							
							
							
							<iaixsl:variable name="last_price_change_date"><iaixsl:choose>
								<iaixsl:when test="sizes/size/price and (count(sizes/size) &gt; 1)"><iaixsl:for-each select="sizes/size[price/@last_price_change_date]"><iaixsl:if test="@type and price/@last_price_change_date"><iaixsl:value-of select="price/@last_price_change_date"/>;&apos;<iaixsl:value-of select="@type"/>&apos;<iaixsl:if test="not(position() = last())">#separator#</iaixsl:if></iaixsl:if></iaixsl:for-each></iaixsl:when>
								<iaixsl:when test="price/@last_price_change_date"><iaixsl:value-of select="price/@last_price_change_date"/></iaixsl:when>
							</iaixsl:choose></iaixsl:variable>

							
							<iaixsl:variable name="var_show_omnibus_short_fallback"><iaixsl:choose>
								<iaixsl:when test="((not(price/@omnibus_price) or not(price/@omnibus_price_net)) and $var_omnibus_enabled = 'true' and not($last_price_change_date = ''))">true</iaixsl:when>
								<iaixsl:otherwise>false</iaixsl:otherwise>
							</iaixsl:choose></iaixsl:variable>
							
							

							<iaixsl:choose>
								
								<iaixsl:when test="$var_net_prices = ''">
									<div class="product__prices">
										<iaixsl:if test="price/@omnibus_price">
											<iaixsl:attribute name="class">product__prices --omnibus</iaixsl:attribute>
										</iaixsl:if>

										
										
										<iaixsl:if test="$var_show_omnibus_short_fallback = 'true'">

											
											<iaixsl:attribute name="data-last_price_change_date"><iaixsl:value-of select="$last_price_change_date"/></iaixsl:attribute>

											
											
											<iaixsl:attribute name="data-omnibus-type">collection</iaixsl:attribute>

											
											<iaixsl:if test="@id">
												<iaixsl:attribute name="data-omnibus_product_id"><iaixsl:value-of select="@id"/></iaixsl:attribute>
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
											<iaixsl:when test="price/@value &gt; 0">
												<div class="product__promo d-flex flex-column">
													<iaixsl:if test="bundle_price/@price_gross &gt; price/@value">
														<span class="price --max">
															
															<iaixsl:if test="price/@omnibus_price or ($var_show_omnibus_short_fallback = 'true')">
																<span class="omnibus_label --hidden"><iaixsl:if test="price/@omnibus_price"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Normaler Preis: </span>
															</iaixsl:if>
															
															<del>
																<iaixsl:value-of select="bundle_price/@price_gross_formatted"/>
															</del>
														</span>
													</iaixsl:if>
													<strong class="price">
														<iaixsl:value-of select="price/@price_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_gross_prices"/></span>
													</strong>
													
													<iaixsl:if test="price/@omnibus_price or ($var_show_omnibus_short_fallback = 'true')">
														<div class="product__promo_omnibus omnibus_price --hidden">
															<iaixsl:if test="price/@omnibus_price"><iaixsl:attribute name="class">product__promo_omnibus omnibus_price</iaixsl:attribute></iaixsl:if>
															<span class="omnibus_price__text">Niedrigster Preis in 30 Tagen vor Rabatt: </span><span class="omnibus_price__value"><iaixsl:value-of select="price/@omnibus_price_formatted"/></span>
														</div>
													</iaixsl:if>
													
												</div>
												<iaixsl:if test="bundle_price/@percent_diff &gt; 0">
													<div class="product__promo_info_wrapper d-none">
														<span class="product__promo_info">Billiger im Kollektion um <iaixsl:value-of select="substring-before(bundle_price/@percent_diff, '.')"/>%</span>
													</div>
												</iaixsl:if>
											</iaixsl:when>
											<iaixsl:otherwise>
												<a class="price --phone">
													<iaixsl:attribute name="title">Klicken Sie hier, um zum Kontaktformular zu gelangen</iaixsl:attribute>
													<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/contact/link/@url"/></iaixsl:attribute>
													Preis auf Anfrage
												</a>
											</iaixsl:otherwise>
										</iaixsl:choose>
									</div>
								</iaixsl:when>

								
								<iaixsl:otherwise>
									<div class="product__prices">
										<iaixsl:if test="price/@omnibus_price_net">
											<iaixsl:attribute name="class">product__prices --omnibus</iaixsl:attribute>
										</iaixsl:if>

										
										
										<iaixsl:if test="$var_show_omnibus_short_fallback = 'true'">

											
											<iaixsl:attribute name="data-last_price_change_date"><iaixsl:value-of select="$last_price_change_date"/></iaixsl:attribute>

											
											
											<iaixsl:attribute name="data-omnibus-type">collection</iaixsl:attribute>

											
											<iaixsl:if test="@id">
												<iaixsl:attribute name="data-omnibus_product_id"><iaixsl:value-of select="@id"/></iaixsl:attribute>
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
											<iaixsl:when test="price/@price_net &gt; 0">
												<div class="product__promo d-flex flex-column">
													<iaixsl:if test="bundle_price/@price_net &gt; price/@price_net">
														<span class="price --max">
															
															<iaixsl:if test="price/@omnibus_price_net or ($var_show_omnibus_short_fallback = 'true')">
																<span class="omnibus_label --hidden"><iaixsl:if test="price/@omnibus_price_net"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Normaler Preis: </span>
															</iaixsl:if>
															
															<del>
																<iaixsl:value-of select="bundle_price/@price_net_formatted"/>
															</del>
														</span>
													</iaixsl:if>
													<strong class="price">
														<iaixsl:value-of select="price/@price_net_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_net_prices"/></span>
													</strong>
													
													<iaixsl:if test="price/@omnibus_price_net or ($var_show_omnibus_short_fallback = 'true')">
														<div class="product__promo_omnibus omnibus_price --hidden">
															<iaixsl:if test="price/@omnibus_price_net"><iaixsl:attribute name="class">product__promo_omnibus omnibus_price</iaixsl:attribute></iaixsl:if>
															<span class="omnibus_price__text">Niedrigster Preis in 30 Tagen vor Rabatt: </span><span class="omnibus_price__value"><iaixsl:value-of select="price/@omnibus_price_net_formatted"/></span>
														</div>
													</iaixsl:if>
													
												</div>
												<iaixsl:if test="bundle_price/@percent_diff &gt; 0">
													<div class="product__promo_info_wrapper d-none">
														<span class="product__promo_info">Billiger im Kollektion um <iaixsl:value-of select="substring-before(bundle_price/@percent_diff, '.')"/>%</span>
													</div>
												</iaixsl:if>
											</iaixsl:when>
											<iaixsl:otherwise>
												<a class="price --phone">
													<iaixsl:attribute name="title">Klicken Sie hier, um zum Kontaktformular zu gelangen</iaixsl:attribute>
													<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/contact/link/@url"/></iaixsl:attribute>
													Preis auf Anfrage
												</a>
											</iaixsl:otherwise>
										</iaixsl:choose>
									</div>
								</iaixsl:otherwise>
							</iaixsl:choose>

							
							<a class="product__see d-none d-sm-block mt-sm-3">
								<iaixsl:attribute name="href"><iaixsl:value-of select="$var_link"/></iaixsl:attribute>
								Sehen Sie der Kollektion
							</a>
						</div>
					</div>
				</iaixsl:for-each>
			</div>
		</section>
	</iaixsl:if>
<!-- (projector_components_hiding, 61b0b1888277e9.84938540.5)-->
			<section class="projector_tabs">
				<div class="projector_tabs__tabs"/>
			</section>
		<!-- (projector_longdescription, 60dd8ec8a0b466.48514110.4)-->
			<iaixsl:if test="page/projector/product/vlongdescription and not(page/projector/product/vlongdescription = '')">
				<section id="projector_longdescription" class="longdescription cm">
					<iaixsl:if test="/shop/page/projector/product/traits/trait[not(contains(@groupdescription, 'gs1:'))]">
						<iaixsl:attribute name="data-traits">true</iaixsl:attribute>
					</iaixsl:if>
					<iaixsl:if test="count(/shop/page/projector/product/dictionary/items) &gt; 0 or not(/shop/page/projector/product/firm/@name = '') or /shop/page/projector/product/@code or /shop/page/projector/product/series">
						<iaixsl:attribute name="data-dictionary">true</iaixsl:attribute>
					</iaixsl:if>
					<iaixsl:value-of disable-output-escaping="yes" select="page/projector/product/vlongdescription/text()"/>
				</section>
			</iaixsl:if>
		<!-- (projector_producttraits, 60dd8ed1966a29.12121824.7)-->
	<iaixsl:variable name="howManyTraits">5</iaixsl:variable>
	<iaixsl:if test="/shop/page/projector/product/traits/trait[not(contains(@groupdescription, 'gs1:'))]">
		<section id="projector_producttraits" class="traits">
			<div class="traits__wrapper">
				<iaixsl:for-each select="/shop/page/projector/product/traits/trait[not(contains(@groupdescription, 'gs1:'))]">
					<iaixsl:if test="not(@groupid = preceding-sibling::trait/@groupid)">
						<div class="traits__item mb-4 d-flex">
							<iaixsl:attribute name="data-hide"><iaixsl:choose><iaixsl:when test="position() &gt; $howManyTraits">true</iaixsl:when><iaixsl:otherwise>false</iaixsl:otherwise></iaixsl:choose></iaixsl:attribute>
							<span class="traits__label mr-1"><iaixsl:value-of disable-output-escaping="yes" select="@groupdescription"/></span>
							<span class="traits__values">
								<iaixsl:choose>
									<iaixsl:when test="@gfx">
										<a class="traits__value --gfx">
											<iaixsl:attribute name="href"><iaixsl:value-of select="@link"/></iaixsl:attribute>
											<img class="traits__gfx b-lazy" src="/gfx/standards/loader.gif?r=1696937716">
												<iaixsl:attribute name="data-src"><iaixsl:value-of select="@gfx"/></iaixsl:attribute>
												<iaixsl:attribute name="alt"><iaixsl:value-of select="@traitdescription"/></iaixsl:attribute>
											</img>
										</a>
									</iaixsl:when>
									<iaixsl:otherwise>
										<a class="traits__value">
											<iaixsl:attribute name="href"><iaixsl:value-of select="@link"/></iaixsl:attribute>
											<iaixsl:value-of disable-output-escaping="yes" select="@traitdescription"/>
										</a>
									</iaixsl:otherwise>
								</iaixsl:choose>
								<iaixsl:if test="@groupid = following-sibling::trait/@groupid">
									<iaixsl:variable name="temporaryGroup"><iaixsl:value-of select="@groupid"/></iaixsl:variable>
									<iaixsl:for-each select="following-sibling::trait[(@groupid = $temporaryGroup)]">
										<iaixsl:choose>
											<iaixsl:when test="@gfx">
												<a class="traits__value --gfx">
													<iaixsl:attribute name="href"><iaixsl:value-of select="@link"/></iaixsl:attribute>
													<img class="traits__gfx b-lazy" src="/gfx/standards/loader.gif?r=1696937716">
														<iaixsl:attribute name="data-src"><iaixsl:value-of select="@gfx"/></iaixsl:attribute>
														<iaixsl:attribute name="alt"><iaixsl:value-of select="@traitdescription"/></iaixsl:attribute>
													</img>
												</a>
											</iaixsl:when>
											<iaixsl:otherwise>
												<a class="traits__value">
													<iaixsl:attribute name="href"><iaixsl:value-of select="@link"/></iaixsl:attribute>
													<iaixsl:value-of disable-output-escaping="yes" select="@traitdescription"/>
												</a>
											</iaixsl:otherwise>
										</iaixsl:choose>
									</iaixsl:for-each>
								</iaixsl:if>
							</span>
						</div>
					</iaixsl:if>
				</iaixsl:for-each>
			</div>
			<iaixsl:if test="count(/shop/page/projector/product/traits/trait[not(contains(@groupdescription, 'gs1:')) and not(@groupid = preceding-sibling::trait/@groupid)]) &gt; $howManyTraits">
				<a href="#showAllTraits" class="traits__all d-none">Alle anzeigen</a>
			</iaixsl:if>
		</section>
	</iaixsl:if>
<!-- (projector_dictionary, 610bfe05ce44a8.16915901.7)-->
	
	<iaixsl:variable name="product_producer_label">Marke</iaixsl:variable>
	<iaixsl:variable name="product_code_label">Symbol</iaixsl:variable>
	<iaixsl:variable name="product_producer_code_label">Herstellercode</iaixsl:variable>
	<iaixsl:variable name="product_series_label">Serie</iaixsl:variable>
	<iaixsl:variable name="product_warranty_label">Garantie</iaixsl:variable>

	<iaixsl:if test="(count(/shop/page/projector/product/dictionary/items) &gt; 0) or ($product_producer_label and not(/shop/page/projector/product/firm/@name = '')) or ($product_code_label and /shop/page/projector/product/@code) or ($product_series_label and /shop/page/projector/product/series) or ($product_producer_code_label and count(/shop/page/projector/product/sizes/size[@code_producer and not(@code_producer = '')]) &gt; 0)">
		
		<iaixsl:variable name="label_no_group"/>

		<section id="projector_dictionary" class="dictionary">
			<div class="dictionary__group --first">
				<iaixsl:if test="(($product_producer_label and not(/shop/page/projector/product/firm/@name = '')) or ($product_code_label and /shop/page/projector/product/@code) or ($product_series_label and /shop/page/projector/product/series) or ($product_producer_code_label and count(/shop/page/projector/product/sizes/size[@code_producer and not(@code_producer = '')]) &gt; 0)) or not(/shop/page/projector/product/dictionary/items/item[1]/type = 'group')">
					<iaixsl:attribute name="class">dictionary__group --first --no-group</iaixsl:attribute>
					<iaixsl:if test="$label_no_group">
						
						<div class="dictionary__label mb-2">
							<span class="dictionary__label_txt"><iaixsl:value-of select="$label_no_group"/></span>
						</div>
					</iaixsl:if>
				</iaixsl:if>
				
				<iaixsl:if test="$product_producer_label and not(/shop/page/projector/product/firm/@name = '')">
					<div class="dictionary__param mb-4" data-producer="true">
						
						<div class="dictionary__name mr-1">
							<span class="dictionary__name_txt"><iaixsl:value-of disable-output-escaping="yes" select="$product_producer_label"/></span>
						</div>
						
						<div class="dictionary__values">
							<div class="dictionary__value">
								<a class="dictionary__value_txt">
									<iaixsl:attribute name="href"><iaixsl:value-of select="page/projector/product/firm/@productslink"/></iaixsl:attribute>
									<iaixsl:attribute name="title">Klicken Sie hier, um alle Produkte dieses Marke anzuzeigen</iaixsl:attribute>
									<iaixsl:value-of disable-output-escaping="yes" select="/shop/page/projector/product/firm/@name"/>
								</a>
							</div>
						</div>
					</div>
				</iaixsl:if>
				
				<iaixsl:if test="$product_code_label and /shop/page/projector/product/@code">
					<div class="dictionary__param mb-4" data-code="true">
						
						<div class="dictionary__name mr-1">
							<span class="dictionary__name_txt"><iaixsl:value-of disable-output-escaping="yes" select="$product_code_label"/></span>
						</div>
						
						<div class="dictionary__values">
							<div class="dictionary__value">
								<span class="dictionary__value_txt"><iaixsl:value-of disable-output-escaping="yes" select="/shop/page/projector/product/@code"/></span>
							</div>
						</div>
					</div>
				</iaixsl:if>
				
				<iaixsl:if test="$product_producer_code_label and count(/shop/page/projector/product/sizes/size[@code_producer and not(@code_producer = '')]) &gt; 0">
					<div class="dictionary__param mb-4" data-producer_code="true">
						
						<div class="dictionary__name mr-1">
							<span class="dictionary__name_txt"><iaixsl:value-of disable-output-escaping="yes" select="$product_producer_code_label"/></span>
						</div>
						
						<div class="dictionary__values">
							<iaixsl:for-each select="/shop/page/projector/product/sizes/size[@code_producer and not(@code_producer = '')]">
								<div class="dictionary__value">
									<span class="dictionary__value_txt"><iaixsl:if test="not(@type = 'onesize')"><span class="dictionary__producer_code --name"><iaixsl:value-of select="@description"/></span></iaixsl:if><span class="dictionary__producer_code --value"><iaixsl:value-of disable-output-escaping="yes" select="@code_producer"/></span></span>
								</div>
							</iaixsl:for-each>
						</div>
					</div>
				</iaixsl:if>
				
				<iaixsl:if test="$product_series_label and /shop/page/projector/product/series">
					<div class="dictionary__param mb-4" data-series="true">
						
						<div class="dictionary__name mr-1">
							<span class="dictionary__name_txt"><iaixsl:value-of disable-output-escaping="yes" select="$product_series_label"/></span>
						</div>
						
						<div class="dictionary__values">
							<div class="dictionary__value">
								<a class="dictionary__value_txt">
									<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/page/projector/product/series/@link"/></iaixsl:attribute>
									<iaixsl:attribute name="title">Klicken Sie hier, um alle Produkte dieser Serie anzuzeigen</iaixsl:attribute>
									<iaixsl:value-of disable-output-escaping="yes" select="/shop/page/projector/product/series/@name"/>
								</a>
							</div>
						</div>
					</div>
				</iaixsl:if>
				
				<iaixsl:if test="$product_warranty_label and /shop/page/projector/product/warranty/@name">
					<div class="dictionary__param mb-4" data-waranty="true">
						
						<div class="dictionary__name mr-1">
							<span class="dictionary__name_txt"><iaixsl:value-of disable-output-escaping="yes" select="$product_warranty_label"/></span>
						</div>
						
						<div class="dictionary__values">
							<div class="dictionary__value">
								<a class="dictionary__value_txt" href="#projector_warranty">
									<iaixsl:attribute name="title">Klicken Sie hier, um die Garantiebedingungen zu lesen</iaixsl:attribute>
									<iaixsl:value-of disable-output-escaping="yes" select="/shop/page/projector/product/warranty/@name"/>
								</a>
							</div>
						</div>
					</div>
				</iaixsl:if>
				<iaixsl:for-each select="/shop/page/projector/product/dictionary/items/item">
					<iaixsl:choose>
						<iaixsl:when test="@type = 'group'">
							<iaixsl:if test="position() &gt; 1 or (($product_code_label and /shop/page/projector/product/@code) or ($product_series_label and /shop/page/projector/product/series))">
								<iaixsl:text disable-output-escaping="yes">&lt;/div&gt;&lt;div class=&quot;dictionary__group&quot;&gt;</iaixsl:text>
							</iaixsl:if>
							
							<div class="dictionary__label mb-2">
								<span class="dictionary__label_txt"><iaixsl:value-of disable-output-escaping="yes" select="@name"/></span>
								<iaixsl:choose>
									<iaixsl:when test="@gfx_desktop and @gfx_tablet and @gfx_mobile">
										<picture class="dictionary__picture --label">
											<source>
												<iaixsl:attribute name="media">(min-width:979px)</iaixsl:attribute>
												<iaixsl:attribute name="data-srcset"><iaixsl:value-of select="@gfx_desktop"/></iaixsl:attribute>
											</source>
											<source>
												<iaixsl:attribute name="media">(min-width:757px)</iaixsl:attribute>
												<iaixsl:attribute name="data-srcset"><iaixsl:value-of select="@gfx_tablet"/></iaixsl:attribute>
											</source>
											<img src="/gfx/standards/loader.gif?r=1696937716" class="dictionary__img --label b-lazy">
												<iaixsl:attribute name="data-src"><iaixsl:value-of select="@gfx_mobile"/></iaixsl:attribute>
												<iaixsl:attribute name="alt"><iaixsl:value-of select="@name"/></iaixsl:attribute>
											</img>
										</picture>
									</iaixsl:when>
									<iaixsl:when test="@gfx">
										<picture class="dictionary__picture --label">
											<img src="/gfx/standards/loader.gif?r=1696937716" class="dictionary__img --label b-lazy">
												<iaixsl:attribute name="data-src"><iaixsl:value-of select="@gfx"/></iaixsl:attribute>
												<iaixsl:attribute name="alt"><iaixsl:value-of select="@name"/></iaixsl:attribute>
											</img>
										</picture>
									</iaixsl:when>
								</iaixsl:choose>
								<iaixsl:if test="desc != ''">
									<div class="dictionary__description --label --active"><iaixsl:value-of disable-output-escaping="yes" select="desc"/></div>
								</iaixsl:if>
							</div>
						</iaixsl:when>
						<iaixsl:otherwise>
							
							<div class="dictionary__param mb-4">
								<iaixsl:if test="(@gfx_desktop and @gfx_tablet and @gfx_mobile) or @gfx">
									<iaixsl:attribute name="data-gfx_name">true</iaixsl:attribute>
								</iaixsl:if>
								<iaixsl:if test="values/value[(@gfx_desktop and @gfx_tablet and @gfx_mobile) or @gfx]">
									<iaixsl:attribute name="data-gfx_value">true</iaixsl:attribute>
								</iaixsl:if>
								<iaixsl:if test="desc != ''">
									<iaixsl:attribute name="data-desc_name">true</iaixsl:attribute>
								</iaixsl:if>
								<iaixsl:if test="values/value[desc != '']">
									<iaixsl:attribute name="data-desc_value">true</iaixsl:attribute>
								</iaixsl:if>
								<iaixsl:variable name="paramName"><iaixsl:value-of select="@name"/></iaixsl:variable>
								<iaixsl:if test="/shop/page/projector/product/traits/trait[@groupdescription = $paramName]">
									<iaixsl:attribute name="data-duplicate">true</iaixsl:attribute>
								</iaixsl:if>
								
								<div class="dictionary__name mr-1">
									<iaixsl:if test="(@gfx_desktop and @gfx_tablet and @gfx_mobile) or @gfx">
										<iaixsl:attribute name="data-gfx">true</iaixsl:attribute>
									</iaixsl:if>
									<iaixsl:if test="desc != ''">
										<iaixsl:attribute name="data-desc">true</iaixsl:attribute>
									</iaixsl:if>
									<span class="dictionary__name_txt"><iaixsl:value-of disable-output-escaping="yes" select="@name"/><iaixsl:if test="desc != ''"><a href="#showDescription" class="dictionary__more">Mehr</a></iaixsl:if></span>
									<iaixsl:choose>
										<iaixsl:when test="@gfx_desktop and @gfx_tablet and @gfx_mobile">
											<picture class="dictionary__picture --name">
												<source>
													<iaixsl:attribute name="media">(min-width:979px)</iaixsl:attribute>
													<iaixsl:attribute name="data-srcset"><iaixsl:value-of select="@gfx_desktop"/></iaixsl:attribute>
												</source>
												<source>
													<iaixsl:attribute name="media">(min-width:757px)</iaixsl:attribute>
													<iaixsl:attribute name="data-srcset"><iaixsl:value-of select="@gfx_tablet"/></iaixsl:attribute>
												</source>
												<img src="/gfx/standards/loader.gif?r=1696937716" class="dictionary__img --name b-lazy">
													<iaixsl:attribute name="data-src"><iaixsl:value-of select="@gfx_mobile"/></iaixsl:attribute>
													<iaixsl:attribute name="alt"><iaixsl:value-of select="@name"/></iaixsl:attribute>
												</img>
											</picture>
										</iaixsl:when>
										<iaixsl:when test="@gfx">
											<picture class="dictionary__picture --name">
												<img src="/gfx/standards/loader.gif?r=1696937716" class="dictionary__img --name b-lazy">
													<iaixsl:attribute name="data-src"><iaixsl:value-of select="@gfx"/></iaixsl:attribute>
													<iaixsl:attribute name="alt"><iaixsl:value-of select="@name"/></iaixsl:attribute>
												</img>
											</picture>
										</iaixsl:when>
									</iaixsl:choose>
									<iaixsl:if test="desc != ''">
										<div class="dictionary__description --name"><iaixsl:value-of disable-output-escaping="yes" select="desc"/></div>
									</iaixsl:if>
								</div>
								
								<div class="dictionary__values">
									<iaixsl:for-each select="values/value">
										<iaixsl:if test="position() &gt; 1"/>
										<div class="dictionary__value">
											<iaixsl:if test="(@gfx_desktop and @gfx_tablet and @gfx_mobile) or @gfx">
												<iaixsl:attribute name="data-gfx">true</iaixsl:attribute>
											</iaixsl:if>
											<iaixsl:if test="desc != ''">
												<iaixsl:attribute name="data-desc">true</iaixsl:attribute>
											</iaixsl:if>
											<span class="dictionary__value_txt"><iaixsl:value-of disable-output-escaping="yes" select="@value"/><iaixsl:if test="desc != ''"><a href="#showDescription" class="dictionary__more">Mehr</a></iaixsl:if></span>
											<iaixsl:choose>
												<iaixsl:when test="@gfx_desktop and @gfx_tablet and @gfx_mobile">
													<picture class="dictionary__picture --value">
														<source>
															<iaixsl:attribute name="media">(min-width:979px)</iaixsl:attribute>
															<iaixsl:attribute name="data-srcset"><iaixsl:value-of select="@gfx_desktop"/></iaixsl:attribute>
														</source>
														<source>
															<iaixsl:attribute name="media">(min-width:757px)</iaixsl:attribute>
															<iaixsl:attribute name="data-srcset"><iaixsl:value-of select="@gfx_tablet"/></iaixsl:attribute>
														</source>
														<img src="/gfx/standards/loader.gif?r=1696937716" class="dictionary__img --value b-lazy">
															<iaixsl:attribute name="data-src"><iaixsl:value-of select="@gfx_mobile"/></iaixsl:attribute>
															<iaixsl:attribute name="alt"><iaixsl:value-of select="@name"/></iaixsl:attribute>
														</img>
													</picture>
												</iaixsl:when>
												<iaixsl:when test="@gfx">
													<picture class="dictionary__picture --value">
														<img src="/gfx/standards/loader.gif?r=1696937716" class="dictionary__img --value b-lazy">
															<iaixsl:attribute name="data-src"><iaixsl:value-of select="@gfx"/></iaixsl:attribute>
															<iaixsl:attribute name="alt"><iaixsl:value-of select="@name"/></iaixsl:attribute>
														</img>
													</picture>
												</iaixsl:when>
											</iaixsl:choose>
											<iaixsl:if test="desc != ''">
												<div class="dictionary__description --value"><iaixsl:value-of disable-output-escaping="yes" select="desc"/></div>
											</iaixsl:if>
										</div>
									</iaixsl:for-each>
								</div>
							</div>
						</iaixsl:otherwise>
					</iaixsl:choose>
				</iaixsl:for-each>
			</div>
		</section>
	</iaixsl:if>
<!-- (projector_enclosures, 60dd8e831c1df2.28516371.4)-->
			<iaixsl:if test="(/shop/page/projector/product/enclosures/documents/item) or (/shop/page/projector/product/enclosures/audio/item)  or (/shop/page/projector/product/enclosures/other)  or (/shop/page/projector/product/enclosures/images_attachments/item) or (/shop/page/projector/product/enclosures/video/item)">
				
				<iaixsl:variable name="label_enclosures">Herunterladen</iaixsl:variable>

				<section id="projector_enclosures" class="enclosures mb-5 col-12">
					<iaixsl:if test="$label_enclosures">
						<div class="enclosures__label mb-3">
							<span class="enclosures__label_txt"><iaixsl:value-of select="$label_enclosures"/></span>
						</div>
					</iaixsl:if>
					<ul class="enclosures__list row">
						<iaixsl:for-each select="/shop/page/projector/product/enclosures/*/item">
							<li class="enclosures__item col-12 col-sm-4 col-md-3 mb-2">
								<a>
									<iaixsl:choose>
										<iaixsl:when test="@extension = 'swf'">
											<iaixsl:attribute name="class">enclosures__name --swf</iaixsl:attribute>
										</iaixsl:when>
										<iaixsl:when test="@type = 'video'">
											<iaixsl:attribute name="class">enclosures__name --video</iaixsl:attribute>
										</iaixsl:when>
										<iaixsl:when test="@type = 'audio/mpeg'">
											<iaixsl:attribute name="class">enclosures__name --audio</iaixsl:attribute>
										</iaixsl:when>
										<iaixsl:when test="@type = 'image/image'">
											<iaixsl:attribute name="class">enclosures__name --image</iaixsl:attribute>
										</iaixsl:when>
										<iaixsl:when test="@type = 'doc'">
											<iaixsl:attribute name="class">enclosures__name --document</iaixsl:attribute>
										</iaixsl:when>
										<iaixsl:otherwise>
											<iaixsl:attribute name="class">enclosures__name --download</iaixsl:attribute>
										</iaixsl:otherwise>
									</iaixsl:choose>
									<iaixsl:if test="@type = 'doc' or @extension = 'swf' or @type='other'"><iaixsl:attribute name="target">_blank</iaixsl:attribute></iaixsl:if>
									<iaixsl:attribute name="href"><iaixsl:value-of select="@url"/></iaixsl:attribute>
									<iaixsl:value-of select="@name"/>
								</a>
							</li>
						</iaixsl:for-each>
					</ul>
				</section>
			</iaixsl:if>
		<!-- (projector_warranty, 60dd8ec8d67691.73013569.4)-->
            <iaixsl:if test="page/projector/product/warranty and not(page/projector/product/warranty= '')">
                <section id="projector_warranty" class="warranty mb-5">
                    <iaixsl:attribute name="data-type"><iaixsl:value-of select="page/projector/product/warranty/@type"/></iaixsl:attribute>
                    <iaixsl:attribute name="data-period"><iaixsl:value-of select="page/projector/product/warranty/@period"/></iaixsl:attribute>

                    
                    <div class="warranty__label mb-3">
                        <span class="warranty__label_txt"><iaixsl:value-of disable-output-escaping="yes" select="page/projector/product/warranty/@name"/></span>
                    </div>

                    
                    <iaixsl:if test="page/projector/product/warranty/@gfx">
                        <div class="warranty__img_wrapper mb-3">
                            <img class="warranty__img">
                                <iaixsl:attribute name="src"><iaixsl:value-of select="page/projector/product/warranty/@gfx"/></iaixsl:attribute>
                                <iaixsl:attribute name="alt"><iaixsl:value-of select="page/projector/product/warranty/@name"/></iaixsl:attribute>
                            </img>
                        </div>
                    </iaixsl:if>

                    
                    <div class="warranty__description col-12 col-md-7 mx-auto"><iaixsl:value-of disable-output-escaping="yes" select="page/projector/product/warranty/text()"/></div>
                </section>
            </iaixsl:if>
        <!-- (projector_product_questions, 61b0b188cb3eb7.53805735.3)-->
			<section id="product_questions_list" class="questions mb-5 col-12">
				<iaixsl:if test="count(page/projector/questions/question)">
					<iaixsl:attribute name="data-questions">true</iaixsl:attribute>
				</iaixsl:if>

				
				<iaixsl:if test="count(page/projector/questions/question)">
					<div class="questions__label headline">
						<span class="questions__label_txt headline__name">Ihre vorherigen Fragen zu diesem Produkt</span>
					</div>
				</iaixsl:if>

				<div class="questions__wrapper row align-items-start">
					
					<iaixsl:if test="count(page/projector/questions/question)">
						<div class="questions__block --questions col-12 col-md-7 col-lg-8 mb-2 mb-md-0">
							<iaixsl:for-each select="page/projector/questions/question">
								<div class="questions__item">
									<a href="#showAnswer" class="questions__question d-flex align-items-center justify-content-between">
										<span class="questions__question_txt py-2"><iaixsl:value-of disable-output-escaping="yes" select="@question"/></span>
									</a>
									<div class="questions__answer pb-2">
										<span class="questions__answer_txt"><iaixsl:value-of disable-output-escaping="yes" select="@answer"/></span>
									</div>
								</div>
							</iaixsl:for-each>
						</div>
					</iaixsl:if>
					
					<div class="questions__block --banner col-12 col-md-5 col-lg-4">
						<div class="questions__banner">
							<strong class="questions__banner_item --label">Brauchen Sie Hilfe? Haben Sie Fragen?</strong>
							<span class="questions__banner_item --text">Stellen Sie eine Frage, und wir werden umgehend antworten und die interessantesten Fragen und Antworten für andere veröffentlichen.</span>
							<div class="questions__banner_item --button">
								<a class="btn --solid --medium questions__button">Stelle eine Frage</a>
							</div>
						</div>
					</div>
				</div>
			</section>

			
			<section id="product_askforproduct" class="askforproduct mb-5 col-12">
				<iaixsl:if test="count(page/projector/questions/question)">
					<iaixsl:attribute name="data-questions">true</iaixsl:attribute>
				</iaixsl:if>

				
				<iaixsl:variable name="label_askforproduct">Stelle eine Frage</iaixsl:variable>
				<iaixsl:variable name="privacy_text1_askforproduct">Deine Daten werden gemäß </iaixsl:variable>
				<iaixsl:variable name="privacy_text2_askforproduct">der Datenschutzerklärung</iaixsl:variable>
				<iaixsl:variable name="privacy_text3_askforproduct">. bearbeitet. </iaixsl:variable>
				<iaixsl:variable name="button_legend_askforproduct"/>

				
				<iaixsl:if test="$label_askforproduct">
					<div class="askforproduct__label headline">
						<span class="askforproduct__label_txt headline__name"><iaixsl:value-of select="$label_askforproduct"/></span>
					</div>
				</iaixsl:if>

				<form action="/settings.php" class="askforproduct__form row flex-column align-items-center" method="post" novalidate="novalidate">
					
					<div class="askforproduct__description col-12 col-sm-7 mb-4">
						<span class="askforproduct__description_txt">Wenn die obige Produktbeschreibung unzureichend ist, können Sie uns eine Frage zu diesem Produkt schicken. Wir werden versuchen, Ihre Frage so schnell wie möglich zu beantworten.
						</span>
						<span class="askforproduct__privacy"><iaixsl:value-of select="$privacy_text1_askforproduct"/><a><iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/private_policy/@url"/></iaixsl:attribute><iaixsl:value-of select="$privacy_text2_askforproduct"/></a><iaixsl:value-of select="$privacy_text3_askforproduct"/></span>
					</div>

					<input type="hidden" name="question_product_id"><iaixsl:attribute name="value"><iaixsl:value-of select="page/projector/product/@id"/></iaixsl:attribute></input>
					<input type="hidden" name="question_action" value="add"/>

					<div class="askforproduct__inputs col-12 col-sm-7">
						
						<div class="f-group askforproduct__email">
							<div class="f-feedback askforproduct__feedback --email">
								<input id="askforproduct__email_input" type="email" class="f-control --validate" name="question_email" required="required">
									<iaixsl:if test="page/projector/sender/@email and not(page/projector/sender/@email = '') ">
										<iaixsl:attribute name="class">f-control --validate --focused</iaixsl:attribute>
										<iaixsl:attribute name="value"><iaixsl:value-of select="page/projector/sender/@email"/></iaixsl:attribute>
									</iaixsl:if>
								</input>
								<label for="askforproduct__email_input" class="f-label">
									E-mail
								</label>
								<span class="f-control-feedback"/>
							</div>
						</div>

						
						<div class="f-group askforproduct__question">
							<div class="f-feedback askforproduct__feedback --question">
								<textarea id="askforproduct__question_input" rows="6" cols="52" type="question" class="f-control --validate" name="product_question" minlength="3" required="required"/>
								<label for="askforproduct__question_input" class="f-label">
									Frage
								</label>
								<span class="f-control-feedback"/>
							</div>
						</div>
					</div>

					
					<div class="askforproduct__submit  col-12 col-sm-7">
						<button class="btn --solid --medium px-5 mb-2 askforproduct__button">
							Senden
						</button>
						<iaixsl:if test="$button_legend_askforproduct">
							<div class="askforproduct__button_legend">
								<iaixsl:value-of select="$button_legend_askforproduct"/>
							</div>
						</iaixsl:if>
					</div>
				</form>
			</section>

			
			<iaixsl:if test="/shop/@projector_askforproduct"> </iaixsl:if>
		<!-- (projector_projector_opinons_form, 60dd8e837276d5.00911207.9)-->
	<section id="opinions_section" class="row mb-4 mx-n3">
		<iaixsl:variable name="count_opinions">3</iaixsl:variable>
		<iaixsl:variable name="more_opinions">Mehr</iaixsl:variable>

		<iaixsl:if test="/shop/page/projector/comments/@all &gt; '0'">
			<div class="col-12">
				<h2 class="headline">
					<span class="headline__name">Kundenrezensionen zu <iaixsl:value-of disable-output-escaping="yes" select="/shop/page/projector/product/name"/></span>
				</h2>
			</div>
			<div class="average_opinions_container col-12 col-md-4 mb-4">
				<div class="row">
					<div class="col-12 col-sm-6 col-md-12">
						<div class="average_opinions_box">
							<div class="comments">
								<div class="note">
									<span>
										<i class="icon-star">
											<iaixsl:if test="page/projector/comments/@avg &gt; 0.5"><iaixsl:attribute name="class">icon-star active</iaixsl:attribute></iaixsl:if>
										</i>
										<i class="icon-star">
											<iaixsl:if test="page/projector/comments/@avg &gt; 1.5"><iaixsl:attribute name="class">icon-star active</iaixsl:attribute></iaixsl:if>
										</i>
										<i class="icon-star">
											<iaixsl:if test="page/projector/comments/@avg &gt; 2.5"><iaixsl:attribute name="class">icon-star active</iaixsl:attribute></iaixsl:if>
										</i>
										<i class="icon-star">
											<iaixsl:if test="page/projector/comments/@avg &gt; 3.5"><iaixsl:attribute name="class">icon-star active</iaixsl:attribute></iaixsl:if>
										</i>
										<i class="icon-star">
											<iaixsl:if test="page/projector/comments/@avg &gt; 4.5"><iaixsl:attribute name="class">icon-star active</iaixsl:attribute></iaixsl:if>
										</i>
									</span>
								</div>
							</div>
							<div class="average_opinions_score">
								<iaixsl:value-of disable-output-escaping="yes" select="page/projector/comments/@avg"/>
							</div>
							<div class="average_opinions_desc">
								Anzahl der abgegebenen Bewertungen: <iaixsl:value-of select="page/projector/comments/@all"/>
							</div>
						</div>
						<div class="opinions_add">
							<iaixsl:choose>
								<iaixsl:when test="(page/projector/comments/opinionClient/opinion/@stat = 'y')">
									<div class="opinions_avg_info menu_messages_message small">
										Ihre Bewertung ist bereits genehmigt. Sie können für dieses Produkt keine weiteren Bewertungen hinzufügen.
									</div>
								</iaixsl:when>
								<iaixsl:otherwise>
									<iaixsl:if test="(page/projector/comments/opinionClient/opinion/@stat = 'n')">
										<div class="opinions_avg_info menu_messages_message small">
												Vor der Veröffentlichung wird Ihre Bewertung in ethischer Hinsicht geprüft.
										</div>
									</iaixsl:if>
									<a href="#showOpinionForm" id="show_opinion_form" class="btn --solid --medium">
										<iaixsl:choose>
											<iaixsl:when test="(page/projector/comments/opinionClient/opinion/@stat = 'n')">
												Ihre Bewertung ändern
											</iaixsl:when>
											<iaixsl:otherwise>
												Ihre Bewertung schreiben
											</iaixsl:otherwise>
										</iaixsl:choose>
									</a>
									<iaixsl:if test="/shop/page/projector/comments/opinionClient/@points">
										<div class="opinions_affiliate_points">
											<iaixsl:choose>
												<iaixsl:when test="/shop/page/projector/comments/opinionClient/image/@points">
													Für Ihre Bewertung mit dem Foto erhalten Sie von uns
												</iaixsl:when>
												<iaixsl:otherwise>
													Für Ihre Bewertung erhalten Sie
												</iaixsl:otherwise>
											</iaixsl:choose>
											<strong>
												<iaixsl:choose>
													<iaixsl:when test="substring-after(/shop/page/projector/comments/opinionClient/@points, '.') = '00'">
														<iaixsl:value-of select="substring-before(/shop/page/projector/comments/opinionClient/@points, '.')"/>
													</iaixsl:when>
													<iaixsl:otherwise>
														<iaixsl:value-of select="/shop/page/projector/comments/opinionClient/@points"/>
													</iaixsl:otherwise>
												</iaixsl:choose>

												<iaixsl:text> </iaixsl:text>Pkt.</strong>
											<br/>in unserem Treueprogramm.
										</div>
									</iaixsl:if>
								</iaixsl:otherwise>
							</iaixsl:choose>
						</div>
					</div>


					<iaixsl:variable name="totalOpinionsAll"><iaixsl:value-of select="page/projector/comments/@all"/></iaixsl:variable>
					<div class="col-12 col-sm-6 col-md-12">
						<iaixsl:if test="/shop/page/projector/comments/opinions/opinion[@confirmedByPurchase = 'true']">
							<div class="opinions_filter_confirmed f-group --checkbox">
								<input type="checkbox" class="f-control" id="opinions_filter_confirmed"/>
								<label class="f-label" for="opinions_filter_confirmed">Nur durch Kauf bestätigte Bewertungen anzeigen</label>
							</div>
						</iaixsl:if>
						<div class="average_opinions_list">
							<div class="opinion_rate" id="shop-opinion_rate_5">
								<span class="opinion_number">5</span><span class="opinion_number_star"><i class="icon-star"> </i></span>
								<div class="opinions_bar_container">
									<div class="opinions_bar_active">
										<iaixsl:variable name="total5"><iaixsl:value-of select="count(/shop/page/projector/comments/opinions/opinion[@note='5'])"/></iaixsl:variable>
										<iaixsl:attribute name="style">width: <iaixsl:value-of select="$total5 div $totalOpinionsAll * 100"/>%</iaixsl:attribute>
									</div>
								</div>
								<span class="rate_count"><iaixsl:value-of select="count(page/projector/comments/opinions/opinion[@note='5'])"/></span>
							</div>
							<div class="opinion_rate" id="shop-opinion_rate_4">
								<span class="opinion_number">4</span><span class="opinion_number_star"><i class="icon-star"> </i></span>
								<div class="opinions_bar_container">
									<div class="opinions_bar_active">
										<iaixsl:variable name="total4"><iaixsl:value-of select="count(/shop/page/projector/comments/opinions/opinion[@note='4'])"/></iaixsl:variable>
										<iaixsl:attribute name="style">width: <iaixsl:value-of select="$total4 div $totalOpinionsAll * 100"/>%</iaixsl:attribute>
									</div>
								</div>
								<span class="rate_count"><iaixsl:value-of select="count(page/projector/comments/opinions/opinion[@note='4'])"/></span>
							</div>
							<div class="opinion_rate" id="shop-opinion_rate_3">
								<span class="opinion_number">3</span><span class="opinion_number_star"><i class="icon-star"> </i></span>
								<div class="opinions_bar_container">
									<div class="opinions_bar_active">
										<iaixsl:variable name="total3"><iaixsl:value-of select="count(/shop/page/projector/comments/opinions/opinion[@note='3'])"/></iaixsl:variable>
										<iaixsl:attribute name="style">width: <iaixsl:value-of select="$total3 div $totalOpinionsAll * 100"/>%</iaixsl:attribute>
									</div>
								</div>
								<span class="rate_count"><iaixsl:value-of select="count(page/projector/comments/opinions/opinion[@note='3'])"/></span>
							</div>
							<div class="opinion_rate" id="shop-opinion_rate_2">
								<span class="opinion_number">2</span><span class="opinion_number_star"><i class="icon-star"> </i></span>
								<div class="opinions_bar_container">
									<div class="opinions_bar_active">
										<iaixsl:variable name="total2"><iaixsl:value-of select="count(/shop/page/projector/comments/opinions/opinion[@note='2'])"/></iaixsl:variable>
										<iaixsl:attribute name="style">width: <iaixsl:value-of select="$total2 div $totalOpinionsAll * 100"/>%</iaixsl:attribute>
									</div>
								</div>
								<span class="rate_count"><iaixsl:value-of select="count(page/projector/comments/opinions/opinion[@note='2'])"/></span>
							</div>
							<div class="opinion_rate" id="shop-opinion_rate_1">
								<span class="opinion_number">1</span><span class="opinion_number_star"><i class="icon-star"> </i></span>
								<div class="opinions_bar_container">
									<div class="opinions_bar_active">
										<iaixsl:variable name="total1"><iaixsl:value-of select="count(/shop/page/projector/comments/opinions/opinion[@note='1'])"/></iaixsl:variable>
										<iaixsl:attribute name="style">width: <iaixsl:value-of select="$total1 div $totalOpinionsAll * 100"/>%</iaixsl:attribute>
									</div>
								</div>
								<span class="rate_count"><iaixsl:value-of select="count(page/projector/comments/opinions/opinion[@note='1'])"/></span>
							</div>
						</div>
						<div class="opinions-shop_guide">
							Klicken Sie auf die Bewertung, um Bewertungen zu filtern
						</div>
					</div>
				</div>
			</div>

			
			<div class="opinions_list col-12 col-md-8 ml-md-auto">
				<div class="row">
					<iaixsl:for-each select="/shop/page/projector/comments/opinions/opinion">
						<div class="opinions_list__item col-12">
							<iaixsl:choose>
								<iaixsl:when test="@note &gt; 4.5"><iaixsl:attribute name="data-opinion_rate">shop-opinion_rate_5</iaixsl:attribute></iaixsl:when>
								<iaixsl:when test="@note &gt; 3.5"><iaixsl:attribute name="data-opinion_rate">shop-opinion_rate_4</iaixsl:attribute></iaixsl:when>
								<iaixsl:when test="@note &gt; 2.5"><iaixsl:attribute name="data-opinion_rate">shop-opinion_rate_3</iaixsl:attribute></iaixsl:when>
								<iaixsl:when test="@note &gt; 1.5"><iaixsl:attribute name="data-opinion_rate">shop-opinion_rate_2</iaixsl:attribute></iaixsl:when>
								<iaixsl:when test="@note &gt; 0.5"><iaixsl:attribute name="data-opinion_rate">shop-opinion_rate_1</iaixsl:attribute></iaixsl:when>
							</iaixsl:choose>
							<iaixsl:if test="position() &gt; $count_opinions">
								<iaixsl:attribute name="data-hide">true</iaixsl:attribute>
							</iaixsl:if>
							<iaixsl:attribute name="data-confirmed"><iaixsl:value-of select="@confirmedByPurchase"/></iaixsl:attribute>
							<div class="opinions_element_holder d-flex mb-4 pb-4 align-items-start">
								<iaixsl:if test="@image_small and not(@image_small = '')">
									<div class="opinions_element_photo">
										<a data-imagelightbox="o" target="_blank">
											<iaixsl:attribute name="href"><iaixsl:value-of select="@image_large"/></iaixsl:attribute>
											

											<img class="b-lazy" src="/gfx/standards/loader.gif?r=1696937716">
												<iaixsl:attribute name="width"><iaixsl:value-of select="@width_large"/></iaixsl:attribute>
												<iaixsl:attribute name="height"><iaixsl:value-of select="@height_large"/></iaixsl:attribute>
												<iaixsl:attribute name="alt"><iaixsl:value-of select="@client"/></iaixsl:attribute>
												<iaixsl:attribute name="title"><iaixsl:value-of select="@client"/></iaixsl:attribute>
												<iaixsl:attribute name="data-src"><iaixsl:value-of select="@image_large"/></iaixsl:attribute>
											</img>
										</a>
									</div>
								</iaixsl:if>
								<div class="opinions_element">
									
									<div class="opinions_element_top">
										
										<iaixsl:if test="(@note)">
											<div class="opinions_element_stars">
												<div class="note">
													<span>
														<i class="icon-star">
															<iaixsl:if test="@note &gt; 0.5"><iaixsl:attribute name="class">icon-star active</iaixsl:attribute></iaixsl:if>
														</i>
														<i class="icon-star">
															<iaixsl:if test="@note &gt; 1.5"><iaixsl:attribute name="class">icon-star active</iaixsl:attribute></iaixsl:if>
														</i>
														<i class="icon-star">
															<iaixsl:if test="@note &gt; 2.5"><iaixsl:attribute name="class">icon-star active</iaixsl:attribute></iaixsl:if>
														</i>
														<i class="icon-star">
															<iaixsl:if test="@note &gt; 3.5"><iaixsl:attribute name="class">icon-star active</iaixsl:attribute></iaixsl:if>
														</i>
														<i class="icon-star">
															<iaixsl:if test="@note &gt; 4.5"><iaixsl:attribute name="class">icon-star active</iaixsl:attribute></iaixsl:if>
														</i>
													</span>
													<strong><iaixsl:value-of select="@note"/>/5</strong>
												</div>
											</div>
										</iaixsl:if>

										<div class="opinions_element_confirmed">
											<iaixsl:attribute name="class">opinions_element_confirmed --<iaixsl:value-of select="@confirmedByPurchase"/></iaixsl:attribute>
											<strong class="opinions_element_confirmed_text"><iaixsl:choose><iaixsl:when test="@confirmedByPurchase = 'true'">Meinung durch Kauf bestätigt</iaixsl:when><iaixsl:otherwise>Meinung nicht durch Kauf bestätigt</iaixsl:otherwise></iaixsl:choose></strong>
										</div>
									</div>
									
									<div class="opinions_element_text">
										<iaixsl:value-of select="text" disable-output-escaping="yes"/>
									</div>
									<div class="opinions_element_opinion_bottom">
										<span class="opinion_date"><iaixsl:value-of select="@date"/></span>
										
										<div class="opinion_author">
											<b class="opinions_element_author_title">

											</b>
											<span class="opinions_element_author_desc">
												<iaixsl:value-of select="@client"/>
											</span>
										</div>
										<div class="rate_opinion">

											<span>War die Meinung hilfreich?</span>
											<a href="" class="opinion_rate_yes">
												<input name="opinionState" type="hidden">
													<iaixsl:attribute name="value">positive</iaixsl:attribute>
												</input>
												<i class="icon-thumbs-up-empty"/> Ja <span class="rate_count"><iaixsl:value-of select="@rate_yes"/></span>
											</a>
											<a href="" class="opinion_rate_no">
												<input name="opinionState" type="hidden">
													<iaixsl:attribute name="value">negative</iaixsl:attribute>
												</input>
												<i class="icon-thumbs-down"/> Nein <span class="rate_count"><iaixsl:value-of select="@rate_no"/></span>
											</a>
											<input name="opinionId" type="hidden">
												<iaixsl:attribute name="value"><iaixsl:value-of select="@opinionId"/></iaixsl:attribute>
											</input>
										</div>
									</div>
									<iaixsl:if test="response and response != ''">
										<div class="opinion_response">
											<div class="opinion_response_top">
												<b>Antwort speichern</b>
												<span class="opinion_date"><iaixsl:value-of select="response/@date"/></span>
											</div>
											<div class="response_text"><iaixsl:value-of select="response" disable-output-escaping="yes"/></div>
										</div>
									</iaixsl:if>
								</div>
							</div>
						</div>
					</iaixsl:for-each>
				</div>
				<div class="menu_messages_message d-none" id="no_opinions_of_type">
					Es gibt keine Bewertungen mit einer solchen Anzahl von Sternen.
				</div>
				
				<iaixsl:if test="$more_opinions and count(/shop/page/projector/comments/opinions/opinion) &gt; $count_opinions">
					<div class="opinions__more">
						<a href="#more_opinions" class="opinions__more_txt"><iaixsl:value-of select="$more_opinions"/></a>
					</div>
				</iaixsl:if>
			</div>
		</iaixsl:if>

		
		<iaixsl:if test="not(page/projector/comments/opinionClient/opinion/@stat = 'y')">
			<div class="opinions_add_form col-12">
				<iaixsl:if test="/shop/page/projector/comments/@all &gt; '0'">
					<iaixsl:attribute name="class">opinions_add_form d-none</iaixsl:attribute>
				</iaixsl:if>

				<div class="big_label">
					<iaixsl:choose>
						<iaixsl:when test="(/shop/page/projector/comments/opinionClient/opinion/@stat = 'n')">
							Ihre Bewertung ändern
						</iaixsl:when>
						<iaixsl:otherwise>
							Ihre Bewertung schreiben
						</iaixsl:otherwise>
					</iaixsl:choose>
				</div>
				<form class="row flex-column align-items-center shop_opinion_form" enctype="multipart/form-data" id="shop_opinion_form" action="/settings.php" method="post">
					<input type="hidden" name="product">
						<iaixsl:attribute name="value"><iaixsl:value-of select="page/projector/product/@id"/></iaixsl:attribute>
					</input>

					
					<div class="shop_opinions_notes col-12 col-sm-6">
						<div class="shop_opinions_name">
							Ihre Note:
						</div>
						<div class="shop_opinions_note_items">
							
							<div class="opinion_note">
								<iaixsl:variable name="starSelected">
									<iaixsl:choose>
										<iaixsl:when test="/shop/page/projector/comments/opinionClient/notes/note[@selected = 'true']/@value">
											<iaixsl:value-of select="/shop/page/projector/comments/opinionClient/notes/note[@selected = 'true']/@value"/>
										</iaixsl:when>
										<iaixsl:otherwise>
											<iaixsl:value-of select="count(/shop/page/projector/comments/opinionClient/notes/note)"/>
										</iaixsl:otherwise>
									</iaixsl:choose>
								</iaixsl:variable>
								<iaixsl:for-each select="/shop/page/projector/comments/opinionClient/notes/note">
									<a href="#" class="opinion_star">
										<iaixsl:choose>
											<iaixsl:when test="@value &gt; $starSelected">
												<iaixsl:attribute name="class">opinion_star</iaixsl:attribute>
											</iaixsl:when>
											<iaixsl:otherwise>
												<iaixsl:attribute name="class">opinion_star active</iaixsl:attribute>
											</iaixsl:otherwise>
										</iaixsl:choose>
										<iaixsl:attribute name="rel"><iaixsl:value-of select="@value"/></iaixsl:attribute>
										<iaixsl:attribute name="title">
											<iaixsl:value-of select="@value"/>/<iaixsl:value-of select="count(../note)"/>
										</iaixsl:attribute>
										<span>
											<i class="icon-star"> </i>
										</span>
									</a>
								</iaixsl:for-each>
								<strong>
									<iaixsl:value-of select="$starSelected"/>/<iaixsl:value-of select="count(/shop/page/projector/comments/opinionClient/notes/note)"/>
								</strong>
								<input type="hidden" name="note">
									<iaixsl:attribute name="value"><iaixsl:value-of select="@value"/></iaixsl:attribute>
									<iaixsl:choose>
										<iaixsl:when test="/shop/page/projector/comments/opinionClient/notes/note/@selected = 'true'">
											<iaixsl:attribute name="value"><iaixsl:value-of select="/shop/page/projector/comments/opinionClient/notes/note[@selected = 'true']/@value"/></iaixsl:attribute>
										</iaixsl:when>
										<iaixsl:otherwise>
											<iaixsl:attribute name="value"><iaixsl:value-of select="count(/shop/page/projector/comments/opinionClient/notes/note)"/></iaixsl:attribute>
										</iaixsl:otherwise>
									</iaixsl:choose>
								</input>
							</div>
						</div>
					</div>

					
					<div class="form-group col-12 col-sm-7">
						<div class="has-feedback">
							<textarea id="addopp" class="form-control" name="opinion">
								<iaixsl:if test="/shop/page/projector/comments/opinionClient/opinion and not(/shop/page/projector/comments/opinionClient/opinion = '')">
									<iaixsl:attribute name="class">form-control focused</iaixsl:attribute>
								</iaixsl:if>
								<iaixsl:value-of select="/shop/page/projector/comments/opinionClient/opinion"/>
							</textarea>
							<label for="opinion" class="control-label">
								Inhalt Ihrer Bewertung
							</label>
							<span class="form-control-feedback"/>

							
							<iaixsl:if test="/shop/page/projector/comments/opinionClient/opinion/@points">
								<strong class="opinions_points">
									<iaixsl:text>+ </iaixsl:text>
									<iaixsl:choose>
										<iaixsl:when test="substring-after(/shop/page/projector/comments/opinionClient/opinion/@points, '.') = '00'">
											<iaixsl:value-of select="substring-before(/shop/page/projector/comments/opinionClient/opinion/@points, '.')"/>
										</iaixsl:when>
										<iaixsl:otherwise>
											<iaixsl:value-of select="/shop/page/projector/comments/opinionClient/opinion/@points"/>
										</iaixsl:otherwise>
									</iaixsl:choose>
									Pkt.
								</strong>
							</iaixsl:if>
						</div>
					</div>

					
					<iaixsl:if test="(page/projector/comments/opinionClient/image/@enabled='true')">
						<div class="opinion_add_photos col-12 col-sm-7">
							<div class="opinion_add_photos_wrapper d-flex align-items-center">
								<span class="opinion_add_photos_text">
									<i class="icon-file-image"/>  Ihr Produktfoto hinzufügen:
								</span>
								<input class="opinion_add_photo" type="file" name="opinion_photo">
									<iaixsl:if test="/shop/form_data/upload_file/max_filesize/@bytes">
										<iaixsl:attribute name="data-max_filesize"><iaixsl:value-of select="/shop/form_data/upload_file/max_filesize/@bytes"/></iaixsl:attribute>
									</iaixsl:if>
								</input>

								
								<iaixsl:if test="/shop/page/projector/comments/opinionClient/image/@points">
									<strong class="opinions_points">
										<iaixsl:text>+ </iaixsl:text>
										<iaixsl:choose>
											<iaixsl:when test="substring-after(/shop/page/projector/comments/opinionClient/image/@points, '.') = '00'">
												<iaixsl:value-of select="substring-before(/shop/page/projector/comments/opinionClient/image/@points, '.')"/>
											</iaixsl:when>
											<iaixsl:otherwise>
												<iaixsl:value-of select="/shop/page/projector/comments/opinionClient/image/@points"/>
											</iaixsl:otherwise>
										</iaixsl:choose>
										Pkt.
									</strong>
								</iaixsl:if>
							</div>
							<iaixsl:if test="/shop/page/projector/comments/opinionClient/image/@points">
								<div class="opinions_points_picture">
									Fügen Sie das von Ihnen gemachte Foto dieses Produkts hinzu <br/> und erhalten Sie zusätzliche
									<strong>
										<iaixsl:choose>
											<iaixsl:when test="substring-after(/shop/page/projector/comments/opinionClient/image/@points, '.') = '00'">
												<iaixsl:value-of select="substring-before(/shop/page/projector/comments/opinionClient/image/@points, '.')"/>
											</iaixsl:when>
											<iaixsl:otherwise>
												<iaixsl:value-of select="/shop/page/projector/comments/opinionClient/image/@points"/>
											</iaixsl:otherwise>
										</iaixsl:choose>
										Pkt.
									</strong>
									in unserem Treueprogramm.
								</div>
							</iaixsl:if>
						</div>
					</iaixsl:if>

					
					<iaixsl:if test="/shop/page/projector/sender/@opinion_unregistered = 'true'">
						<div class="form-group col-12 col-sm-7">
							<div class="has-feedback has-required">
								<input id="addopinion_name" class="form-control" type="text" name="addopinion_name" value="">
									<iaixsl:attribute name="required">required</iaixsl:attribute>
								</input>
								<label for="addopinion_name" class="control-label">
									Ihr Vorname
								</label>
								<span class="form-control-feedback"/>
							</div>
						</div>
						<div class="form-group col-12 col-sm-7">
							<div class="has-feedback has-required">
								<input id="addopinion_email" class="form-control" type="email" name="addopinion_email" value="">
									<iaixsl:attribute name="required">required</iaixsl:attribute>
								</input>
								<label for="addopinion_email" class="control-label">
									Ihre E-Mail-Adresse
								</label>
								<span class="form-control-feedback"/>
							</div>
						</div>
					</iaixsl:if>
					<div class="shop_opinions_button col-12">
						<button type="submit" class="btn --solid --medium opinions-shop_opinions_button px-5">
							<iaixsl:choose>
								<iaixsl:when test="/shop/page/projector/comments/opinionClient/opinion and not(/shop/page/projector/comments/opinionClient/opinion = '')">
									<iaixsl:attribute name="title">Ihre Bewertung ändern</iaixsl:attribute>
									<iaixsl:attribute name="data-button_edit">true</iaixsl:attribute>
									Bewertung ändern
								</iaixsl:when>
								<iaixsl:otherwise>
									<iaixsl:attribute name="title">Bewertung hinzufügen</iaixsl:attribute>
									Bewertung abschicken
								</iaixsl:otherwise>
							</iaixsl:choose>
						</button>
					</div>
				</form>
			</div>
		</iaixsl:if>
	</section>
	<iaixsl:if test="/shop/page/projector/sender/@active='true'">
		<iaixsl:if test="/shop/page/projector/comments/opinions/opinion/response"/>
	</iaixsl:if>
<!-- (projector_associated_zone1, 61b0b18896c905.36103928.4)-->
	
		<iaixsl:if test="page/projector/products_associated_zone1">

			<section id="products_associated_zone1" class="hotspot mb-5 col-12">
				
				<iaixsl:variable name="headline_after_products_associated_zone1"/>
				
				<iaixsl:if test="not(page/projector/products_associated_zone1/product or page/projector/products_associated_zone1/opinion)">
					<iaixsl:attribute name="data-ajaxLoad">true</iaixsl:attribute>
					<iaixsl:attribute name="data-pageType">projector</iaixsl:attribute>
				</iaixsl:if>

        
        
        <iaixsl:variable name="var_omnibus_enabled"><iaixsl:if test="/shop/@omnibus = 1">true</iaixsl:if></iaixsl:variable>
        

				<iaixsl:choose>
					<iaixsl:when test="page/projector/products_associated_zone1/product or page/projector/products_associated_zone1/opinion">

						
						<h2>
							<iaixsl:choose>
								<iaixsl:when test="page/projector/products_associated_zone1/@link">
									<a class="headline">
										<iaixsl:attribute name="href"><iaixsl:value-of select="page/projector/products_associated_zone1/@link"/></iaixsl:attribute>
										<iaixsl:attribute name="title"/>

										<span class="headline__name">
											<iaixsl:choose>
												<iaixsl:when test="page/projector/products_associated_zone1/@name"><iaixsl:value-of select="page/projector/products_associated_zone1/@name"/></iaixsl:when>
												<iaixsl:otherwise>Produkte, die mit diesem Produkt zusammen gekauft wurden</iaixsl:otherwise>
											</iaixsl:choose>
										</span>
										<iaixsl:if test="$headline_after_products_associated_zone1">
											<span class="headline__after"><iaixsl:value-of select="$headline_after_products_associated_zone1"/></span>
										</iaixsl:if>
									</a>
								</iaixsl:when>
								<iaixsl:otherwise>
									<span class="headline">
										<span class="headline__name">
											<iaixsl:choose>
												<iaixsl:when test="page/projector/products_associated_zone1/@name"><iaixsl:value-of select="page/projector/products_associated_zone1/@name"/></iaixsl:when>
												<iaixsl:otherwise>Produkte, die mit diesem Produkt zusammen gekauft wurden</iaixsl:otherwise>
											</iaixsl:choose>
										</span>
									</span>
								</iaixsl:otherwise>
							</iaixsl:choose>
						</h2>

						<div class="products d-flex flex-wrap">
							<iaixsl:for-each select="page/projector/products_associated_zone1/*">
								
								<iaixsl:variable name="var_name"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of disable-output-escaping="yes" select="product/name/text()"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of disable-output-escaping="yes" select="name/text()"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_icon"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/icon"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="icon"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_icon_small"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/icon_small"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="icon_small"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_link"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/@link"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@link"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_yousave"/>
								<iaixsl:variable name="var_net_prices"><iaixsl:if test="/shop/page/@price_type = 'net'"> Netto</iaixsl:if></iaixsl:variable>
								<iaixsl:variable name="var_gross_prices"><iaixsl:if test="/shop/page/@price_type = 'gross'"> inkl. MwSt</iaixsl:if></iaixsl:variable>
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
												<iaixsl:otherwise>false</iaixsl:otherwise>
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
																	<span class="omnibus_label --hidden"><iaixsl:if test="$var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Normaler Preis: </span>
																</iaixsl:if>
																
																<del>
																	<span><iaixsl:value-of select="$var_size_min_maxprice_formatted"/></span><b><iaixsl:text> - </iaixsl:text></b><span><iaixsl:value-of select="$var_size_max_maxprice_formatted"/></span><span class="price_vat"><iaixsl:value-of select="$var_gross_prices"/></span>
																</del>
																
																	<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short = 'true') or ($var_show_omnibus_short_fallback = 'true')">
																		<span class="omnibus_short --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short = 'true'"><iaixsl:attribute name="class">omnibus_short</iaixsl:attribute></iaixsl:if>Niedrigster Preis in 30 Tagen vor Rabatt</span>
																</iaixsl:if>
																
															</span>
														</iaixsl:if>
														<strong class="price">
															<iaixsl:value-of select="$var_size_min_formatted"/><iaixsl:text> - </iaixsl:text><iaixsl:value-of select="$var_size_max_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_gross_prices"/></span>
														</strong>
														<iaixsl:if test="$var_points != ''">
															<span class="price --points">
																<iaixsl:value-of select="$var_points"/><span class="currency"> Pkt.</span>
															</span>
														</iaixsl:if>
														
														<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
															<span class="omnibus_price --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_price</iaixsl:attribute></iaixsl:if><span class="omnibus_price__text">Niedrigster Preis in 30 Tagen vor Rabatt: </span><span class="omnibus_price__value"><iaixsl:value-of select="$var_omnibus"/></span></span>
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
																<iaixsl:attribute name="title">Klicken Sie hier, um zum Kontaktformular zu gelangen</iaixsl:attribute>
																Preis auf Anfrage
															</a>
															</iaixsl:otherwise>
														</iaixsl:choose>
													</iaixsl:when>

													
													<iaixsl:otherwise>
														<iaixsl:if test="$var_maxprice_formatted != ''">
															<span class="price --max">
																
																<iaixsl:if test="($var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_label --hidden"><iaixsl:if test="$var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Normaler Preis: </span>
																</iaixsl:if>
																
																<del>
																	<iaixsl:value-of select="$var_maxprice_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_gross_prices"/></span>
																</del>
																
																	<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short = 'true') or ($var_show_omnibus_short_fallback = 'true')">
																		<span class="omnibus_short --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short = 'true'"><iaixsl:attribute name="class">omnibus_short</iaixsl:attribute></iaixsl:if>Niedrigster Preis in 30 Tagen vor Rabatt</span>
																</iaixsl:if>
																
															</span>
														</iaixsl:if>
														<strong class="price">
															<iaixsl:value-of select="$var_price_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_gross_prices"/></span>
														</strong>
														<iaixsl:if test="$var_points != ''">
															<span class="price --points">
																<iaixsl:value-of select="$var_points"/><span class="currency"> Pkt.</span>
															</span>
														</iaixsl:if>
														
														<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
															<span class="omnibus_price --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_price</iaixsl:attribute></iaixsl:if><span class="omnibus_price__text">Niedrigster Preis in 30 Tagen vor Rabatt: </span><span class="omnibus_price__value"><iaixsl:value-of select="$var_omnibus"/></span></span>
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
												<iaixsl:otherwise>false</iaixsl:otherwise>
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
																	<span class="omnibus_label --hidden"><iaixsl:if test="$var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Normaler Preis: </span>
																</iaixsl:if>
																
																<del>
																	<span><iaixsl:value-of select="$var_size_min_net_maxprice_formatted"/></span><b><iaixsl:text> - </iaixsl:text></b><span><iaixsl:value-of select="$var_size_max_maxprice_net_formatted"/></span><span class="price_vat"><iaixsl:value-of select="$var_net_prices"/></span>
																</del>
																
																<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short = 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_short --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short = 'true'"><iaixsl:attribute name="class">omnibus_short</iaixsl:attribute></iaixsl:if>Niedrigster Preis in 30 Tagen vor Rabatt</span>
																</iaixsl:if>
																
															</span>
														</iaixsl:if>
														<strong class="price">
															<iaixsl:value-of select="$var_size_min_net_formatted"/><iaixsl:text> - </iaixsl:text><iaixsl:value-of select="$var_size_max_net_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_net_prices"/></span>
														</strong>
														<iaixsl:if test="$var_points_net != ''">
															<span class="price --points">
																<iaixsl:value-of select="$var_points_net"/><span class="currency"> Pkt.</span>
															</span>
														</iaixsl:if>
														
														<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
															<span class="omnibus_price --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_price</iaixsl:attribute></iaixsl:if><span class="omnibus_price__text">Niedrigster Preis in 30 Tagen vor Rabatt: </span><span class="omnibus_price__value"><iaixsl:value-of select="$var_omnibus"/></span></span>
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
																<iaixsl:attribute name="title">Klicken Sie hier, um zum Kontaktformular zu gelangen</iaixsl:attribute>
																Preis auf Anfrage
															</a>
															</iaixsl:otherwise>
														</iaixsl:choose>
													</iaixsl:when>

													
													<iaixsl:otherwise>
														<iaixsl:if test="$var_maxprice_net_formatted != ''">
															<span class="price --max">
																
																<iaixsl:if test="($var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_label --hidden"><iaixsl:if test="$var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Normaler Preis: </span>
																</iaixsl:if>
																
																<del>
																	<iaixsl:value-of select="$var_maxprice_net_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_net_prices"/></span>
																</del>
																
																<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short = 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_short --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short = 'true'"><iaixsl:attribute name="class">omnibus_short</iaixsl:attribute></iaixsl:if>Niedrigster Preis in 30 Tagen vor Rabatt</span>
																</iaixsl:if>
																
															</span>
														</iaixsl:if>
														<strong class="price">
															<iaixsl:value-of select="$var_price_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_net_prices"/></span>
														</strong>
														<iaixsl:if test="$var_points_net != ''">
															<span class="price --points">
																<iaixsl:value-of select="$var_points_net"/><span class="currency"> Pkt.</span>
															</span>
														</iaixsl:if>
														
														<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
															<span class="omnibus_price --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_price</iaixsl:attribute></iaixsl:if><span class="omnibus_price__text">Niedrigster Preis in 30 Tagen vor Rabatt: </span><span class="omnibus_price__value"><iaixsl:value-of select="$var_omnibus"/></span></span>
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
												<strong class="opinions_element_confirmed_text"><iaixsl:choose><iaixsl:when test="@confirmedByPurchase = 'true'">Meinung durch Kauf bestätigt</iaixsl:when><iaixsl:otherwise>Meinung nicht durch Kauf bestätigt</iaixsl:otherwise></iaixsl:choose></strong>
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
														Bewertung: <iaixsl:value-of disable-output-escaping="yes" select="@note"/>/5
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

		<iaixsl:if test="/shop/page/projector/products_associated_zone1/@iairs_ajax"> </iaixsl:if>
		<iaixsl:if test="/shop/page/projector/products_associated_zone1/@hotspot_ajax"> </iaixsl:if>

	
<!-- (projector_associated_zone2, 61b0b188b39f55.13112947.4)-->
	
		<iaixsl:if test="page/projector/products_associated_zone2">

			<section id="products_associated_zone2" class="hotspot mb-5 col-12">
				
				<iaixsl:variable name="headline_after_products_associated_zone2"/>
				
				<iaixsl:if test="not(page/projector/products_associated_zone2/product or page/projector/products_associated_zone2/opinion)">
					<iaixsl:attribute name="data-ajaxLoad">true</iaixsl:attribute>
					<iaixsl:attribute name="data-pageType">projector</iaixsl:attribute>
				</iaixsl:if>

        
				
        <iaixsl:variable name="var_omnibus_enabled"><iaixsl:if test="/shop/@omnibus = 1">true</iaixsl:if></iaixsl:variable>
				

				<iaixsl:choose>
					<iaixsl:when test="page/projector/products_associated_zone2/product or page/projector/products_associated_zone2/opinion">

						
						<h2>
							<iaixsl:choose>
								<iaixsl:when test="page/projector/products_associated_zone2/@link">
									<a class="headline">
										<iaixsl:attribute name="href"><iaixsl:value-of select="page/projector/products_associated_zone2/@link"/></iaixsl:attribute>
										<iaixsl:attribute name="title"/>

										<span class="headline__name">
											<iaixsl:choose>
												<iaixsl:when test="page/projector/products_associated_zone2/@name"><iaixsl:value-of select="page/projector/products_associated_zone2/@name"/></iaixsl:when>
												<iaixsl:otherwise>Produkte, die mit diesem Produkt zusammen gekauft wurden</iaixsl:otherwise>
											</iaixsl:choose>
										</span>
										<iaixsl:if test="$headline_after_products_associated_zone2">
											<span class="headline__after"><iaixsl:value-of select="$headline_after_products_associated_zone2"/></span>
										</iaixsl:if>
									</a>
								</iaixsl:when>
								<iaixsl:otherwise>
									<span class="headline">
										<span class="headline__name">
											<iaixsl:choose>
												<iaixsl:when test="page/projector/products_associated_zone2/@name"><iaixsl:value-of select="page/projector/products_associated_zone2/@name"/></iaixsl:when>
												<iaixsl:otherwise>Produkte, die mit diesem Produkt zusammen gekauft wurden</iaixsl:otherwise>
											</iaixsl:choose>
										</span>
									</span>
								</iaixsl:otherwise>
							</iaixsl:choose>
						</h2>

						<div class="products d-flex flex-wrap">
							<iaixsl:for-each select="page/projector/products_associated_zone2/*">
								
								<iaixsl:variable name="var_name"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of disable-output-escaping="yes" select="product/name/text()"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of disable-output-escaping="yes" select="name/text()"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_icon"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/icon"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="icon"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_icon_small"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/icon_small"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="icon_small"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_link"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/@link"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@link"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_yousave"/>
								<iaixsl:variable name="var_net_prices"><iaixsl:if test="/shop/page/@price_type = 'net'"> Netto</iaixsl:if></iaixsl:variable>
								<iaixsl:variable name="var_gross_prices"><iaixsl:if test="/shop/page/@price_type = 'gross'"> inkl. MwSt</iaixsl:if></iaixsl:variable>
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
												<iaixsl:otherwise>false</iaixsl:otherwise>
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
																	<span class="omnibus_label --hidden"><iaixsl:if test="$var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Normaler Preis: </span>
																</iaixsl:if>
																
																<del>
																	<span><iaixsl:value-of select="$var_size_min_maxprice_formatted"/></span><b><iaixsl:text> - </iaixsl:text></b><span><iaixsl:value-of select="$var_size_max_maxprice_formatted"/></span><span class="price_vat"><iaixsl:value-of select="$var_gross_prices"/></span>
																</del>
																
																	<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short = 'true') or ($var_show_omnibus_short_fallback = 'true')">
																		<span class="omnibus_short --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short = 'true'"><iaixsl:attribute name="class">omnibus_short</iaixsl:attribute></iaixsl:if>Niedrigster Preis in 30 Tagen vor Rabatt</span>
																</iaixsl:if>
																
															</span>
														</iaixsl:if>
														<strong class="price">
															<iaixsl:value-of select="$var_size_min_formatted"/><iaixsl:text> - </iaixsl:text><iaixsl:value-of select="$var_size_max_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_gross_prices"/></span>
														</strong>
														<iaixsl:if test="$var_points != ''">
															<span class="price --points">
																<iaixsl:value-of select="$var_points"/><span class="currency"> Pkt.</span>
															</span>
														</iaixsl:if>
														
														<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
															<span class="omnibus_price --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_price</iaixsl:attribute></iaixsl:if><span class="omnibus_price__text">Niedrigster Preis in 30 Tagen vor Rabatt: </span><span class="omnibus_price__value"><iaixsl:value-of select="$var_omnibus"/></span></span>
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
																<iaixsl:attribute name="title">Klicken Sie hier, um zum Kontaktformular zu gelangen</iaixsl:attribute>
																Preis auf Anfrage
															</a>
															</iaixsl:otherwise>
														</iaixsl:choose>
													</iaixsl:when>

													
													<iaixsl:otherwise>
														<iaixsl:if test="$var_maxprice_formatted != ''">
															<span class="price --max">
																
																<iaixsl:if test="($var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_label --hidden"><iaixsl:if test="$var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Normaler Preis: </span>
																</iaixsl:if>
																
																<del>
																	<iaixsl:value-of select="$var_maxprice_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_gross_prices"/></span>
																</del>
																
																	<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short = 'true') or ($var_show_omnibus_short_fallback = 'true')">
																		<span class="omnibus_short --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short = 'true'"><iaixsl:attribute name="class">omnibus_short</iaixsl:attribute></iaixsl:if>Niedrigster Preis in 30 Tagen vor Rabatt</span>
																</iaixsl:if>
																
															</span>
														</iaixsl:if>
														<strong class="price">
															<iaixsl:value-of select="$var_price_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_gross_prices"/></span>
														</strong>
														<iaixsl:if test="$var_points != ''">
															<span class="price --points">
																<iaixsl:value-of select="$var_points"/><span class="currency"> Pkt.</span>
															</span>
														</iaixsl:if>
														
														<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
															<span class="omnibus_price --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_price</iaixsl:attribute></iaixsl:if><span class="omnibus_price__text">Niedrigster Preis in 30 Tagen vor Rabatt: </span><span class="omnibus_price__value"><iaixsl:value-of select="$var_omnibus"/></span></span>
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
												<iaixsl:otherwise>false</iaixsl:otherwise>
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
																	<span class="omnibus_label --hidden"><iaixsl:if test="$var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Normaler Preis: </span>
																</iaixsl:if>
																
																<del>
																	<span><iaixsl:value-of select="$var_size_min_net_maxprice_formatted"/></span><b><iaixsl:text> - </iaixsl:text></b><span><iaixsl:value-of select="$var_size_max_maxprice_net_formatted"/></span><span class="price_vat"><iaixsl:value-of select="$var_net_prices"/></span>
																</del>
																
																	<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short = 'true') or ($var_show_omnibus_short_fallback = 'true')">
																		<span class="omnibus_short --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short = 'true'"><iaixsl:attribute name="class">omnibus_short</iaixsl:attribute></iaixsl:if>Niedrigster Preis in 30 Tagen vor Rabatt</span>
																</iaixsl:if>
																
															</span>
														</iaixsl:if>
														<strong class="price">
															<iaixsl:value-of select="$var_size_min_net_formatted"/><iaixsl:text> - </iaixsl:text><iaixsl:value-of select="$var_size_max_net_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_net_prices"/></span>
														</strong>
														<iaixsl:if test="$var_points_net != ''">
															<span class="price --points">
																<iaixsl:value-of select="$var_points_net"/><span class="currency"> Pkt.</span>
															</span>
														</iaixsl:if>
														
														<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
															<span class="omnibus_price --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_price</iaixsl:attribute></iaixsl:if><span class="omnibus_price__text">Niedrigster Preis in 30 Tagen vor Rabatt: </span><span class="omnibus_price__value"><iaixsl:value-of select="$var_omnibus"/></span></span>
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
																<iaixsl:attribute name="title">Klicken Sie hier, um zum Kontaktformular zu gelangen</iaixsl:attribute>
																Preis auf Anfrage
															</a>
															</iaixsl:otherwise>
														</iaixsl:choose>
													</iaixsl:when>

													
													<iaixsl:otherwise>
														<iaixsl:if test="$var_maxprice_net_formatted != ''">
															<span class="price --max">
																
																<iaixsl:if test="($var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_label --hidden"><iaixsl:if test="$var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Normaler Preis: </span>
																</iaixsl:if>
																
																<del>
																	<iaixsl:value-of select="$var_maxprice_net_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_net_prices"/></span>
																</del>
																
																<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short = 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_short --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short = 'true'"><iaixsl:attribute name="class">omnibus_short</iaixsl:attribute></iaixsl:if>Niedrigster Preis in 30 Tagen vor Rabatt</span>
																</iaixsl:if>
																
															</span>
														</iaixsl:if>
														<strong class="price">
															<iaixsl:value-of select="$var_price_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_net_prices"/></span>
														</strong>
														<iaixsl:if test="$var_points_net != ''">
															<span class="price --points">
																<iaixsl:value-of select="$var_points_net"/><span class="currency"> Pkt.</span>
															</span>
														</iaixsl:if>
														
														<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
															<span class="omnibus_price --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_price</iaixsl:attribute></iaixsl:if><span class="omnibus_price__text">Niedrigster Preis in 30 Tagen vor Rabatt: </span><span class="omnibus_price__value"><iaixsl:value-of select="$var_omnibus"/></span></span>
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
												<strong class="opinions_element_confirmed_text"><iaixsl:choose><iaixsl:when test="@confirmedByPurchase = 'true'">Meinung durch Kauf bestätigt</iaixsl:when><iaixsl:otherwise>Meinung nicht durch Kauf bestätigt</iaixsl:otherwise></iaixsl:choose></strong>
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
														Bewertung: <iaixsl:value-of disable-output-escaping="yes" select="@note"/>/5
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

		<iaixsl:if test="/shop/page/projector/products_associated_zone2/@iairs_ajax"> </iaixsl:if>
		<iaixsl:if test="/shop/page/projector/products_associated_zone2/@hotspot_ajax"> </iaixsl:if>

	
<!-- (projector_associated_zone3, 614c5cefbbdef5.27135748.5)-->
	
		<iaixsl:if test="page/projector/products_associated_zone3">

			<section id="products_associated_zone3" class="hotspot mb-5 col-12">
				
				<iaixsl:variable name="headline_after_products_associated_zone3"/>
				
				<iaixsl:if test="not(page/projector/products_associated_zone3/product or page/projector/products_associated_zone3/opinion)">
					<iaixsl:attribute name="data-ajaxLoad">true</iaixsl:attribute>
					<iaixsl:attribute name="data-pageType">projector</iaixsl:attribute>
				</iaixsl:if>

        
				
        <iaixsl:variable name="var_omnibus_enabled"><iaixsl:if test="/shop/@omnibus = 1">true</iaixsl:if></iaixsl:variable>
				

				<iaixsl:choose>
					<iaixsl:when test="page/projector/products_associated_zone3/product or page/projector/products_associated_zone3/opinion">

						
						<h2>
							<iaixsl:choose>
								<iaixsl:when test="page/projector/products_associated_zone3/@link">
									<a class="headline">
										<iaixsl:attribute name="href"><iaixsl:value-of select="page/projector/products_associated_zone3/@link"/></iaixsl:attribute>
										<iaixsl:attribute name="title"/>

										<span class="headline__name">
											<iaixsl:choose>
												<iaixsl:when test="page/projector/products_associated_zone3/@name"><iaixsl:value-of select="page/projector/products_associated_zone3/@name"/></iaixsl:when>
												<iaixsl:otherwise>Produkte, die mit diesem Produkt zusammen gekauft wurden</iaixsl:otherwise>
											</iaixsl:choose>
										</span>
										<iaixsl:if test="$headline_after_products_associated_zone3">
											<span class="headline__after"><iaixsl:value-of select="$headline_after_products_associated_zone3"/></span>
										</iaixsl:if>
									</a>
								</iaixsl:when>
								<iaixsl:otherwise>
									<span class="headline">
										<span class="headline__name">
											<iaixsl:choose>
												<iaixsl:when test="page/projector/products_associated_zone3/@name"><iaixsl:value-of select="page/projector/products_associated_zone3/@name"/></iaixsl:when>
												<iaixsl:otherwise>Produkte, die mit diesem Produkt zusammen gekauft wurden</iaixsl:otherwise>
											</iaixsl:choose>
										</span>
									</span>
								</iaixsl:otherwise>
							</iaixsl:choose>
						</h2>

						<div class="products d-flex flex-wrap">
							<iaixsl:for-each select="page/projector/products_associated_zone3/*">
								
								<iaixsl:variable name="var_name"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of disable-output-escaping="yes" select="product/name/text()"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of disable-output-escaping="yes" select="name/text()"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_icon"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/icon"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="icon"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_icon_small"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/icon_small"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="icon_small"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_link"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/@link"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@link"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_yousave"/>
								<iaixsl:variable name="var_net_prices"><iaixsl:if test="/shop/page/@price_type = 'net'"> Netto</iaixsl:if></iaixsl:variable>
								<iaixsl:variable name="var_gross_prices"><iaixsl:if test="/shop/page/@price_type = 'gross'"> inkl. MwSt</iaixsl:if></iaixsl:variable>
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
												<iaixsl:otherwise>false</iaixsl:otherwise>
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
																	<span class="omnibus_label --hidden"><iaixsl:if test="$var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Normaler Preis: </span>
																</iaixsl:if>
																
																<del>
																	<span><iaixsl:value-of select="$var_size_min_maxprice_formatted"/></span><b><iaixsl:text> - </iaixsl:text></b><span><iaixsl:value-of select="$var_size_max_maxprice_formatted"/></span><span class="price_vat"><iaixsl:value-of select="$var_gross_prices"/></span>
																</del>
																
																<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short = 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_short --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short = 'true'"><iaixsl:attribute name="class">omnibus_short</iaixsl:attribute></iaixsl:if>Niedrigster Preis in 30 Tagen vor Rabatt</span>
																</iaixsl:if>
																
															</span>
														</iaixsl:if>
														<strong class="price">
															<iaixsl:value-of select="$var_size_min_formatted"/><iaixsl:text> - </iaixsl:text><iaixsl:value-of select="$var_size_max_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_gross_prices"/></span>
														</strong>
														<iaixsl:if test="$var_points != ''">
															<span class="price --points">
																<iaixsl:value-of select="$var_points"/><span class="currency"> Pkt.</span>
															</span>
														</iaixsl:if>
														
														<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
															<span class="omnibus_price --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_price</iaixsl:attribute></iaixsl:if><span class="omnibus_price__text">Niedrigster Preis in 30 Tagen vor Rabatt: </span><span class="omnibus_price__value"><iaixsl:value-of select="$var_omnibus"/></span></span>
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
																<iaixsl:attribute name="title">Klicken Sie hier, um zum Kontaktformular zu gelangen</iaixsl:attribute>
																Preis auf Anfrage
															</a>
															</iaixsl:otherwise>
														</iaixsl:choose>
													</iaixsl:when>

													
													<iaixsl:otherwise>
														<iaixsl:if test="$var_maxprice_formatted != ''">
															<span class="price --max">
																
																<iaixsl:if test="($var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_label --hidden"><iaixsl:if test="$var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Normaler Preis: </span>
																</iaixsl:if>
																
																<del>
																	<iaixsl:value-of select="$var_maxprice_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_gross_prices"/></span>
																</del>
																
																<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short = 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_short --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short = 'true'"><iaixsl:attribute name="class">omnibus_short</iaixsl:attribute></iaixsl:if>Niedrigster Preis in 30 Tagen vor Rabatt</span>
																</iaixsl:if>
																
															</span>
														</iaixsl:if>
														<strong class="price">
															<iaixsl:value-of select="$var_price_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_gross_prices"/></span>
														</strong>
														<iaixsl:if test="$var_points != ''">
															<span class="price --points">
																<iaixsl:value-of select="$var_points"/><span class="currency"> Pkt.</span>
															</span>
														</iaixsl:if>
														
														<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
															<span class="omnibus_price --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_price</iaixsl:attribute></iaixsl:if><span class="omnibus_price__text">Niedrigster Preis in 30 Tagen vor Rabatt: </span><span class="omnibus_price__value"><iaixsl:value-of select="$var_omnibus"/></span></span>
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
												<iaixsl:otherwise>false</iaixsl:otherwise>
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
																	<span class="omnibus_label --hidden"><iaixsl:if test="$var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Normaler Preis: </span>
																</iaixsl:if>
																
																<del>
																	<span><iaixsl:value-of select="$var_size_min_net_maxprice_formatted"/></span><b><iaixsl:text> - </iaixsl:text></b><span><iaixsl:value-of select="$var_size_max_maxprice_net_formatted"/></span><span class="price_vat"><iaixsl:value-of select="$var_net_prices"/></span>
																</del>
																
																<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short = 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_short --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short = 'true'"><iaixsl:attribute name="class">omnibus_short</iaixsl:attribute></iaixsl:if>Niedrigster Preis in 30 Tagen vor Rabatt</span>
																</iaixsl:if>
																
															</span>
														</iaixsl:if>
														<strong class="price">
															<iaixsl:value-of select="$var_size_min_net_formatted"/><iaixsl:text> - </iaixsl:text><iaixsl:value-of select="$var_size_max_net_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_net_prices"/></span>
														</strong>
														<iaixsl:if test="$var_points_net != ''">
															<span class="price --points">
																<iaixsl:value-of select="$var_points_net"/><span class="currency"> Pkt.</span>
															</span>
														</iaixsl:if>
														
														<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
															<span class="omnibus_price --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_price</iaixsl:attribute></iaixsl:if><span class="omnibus_price__text">Niedrigster Preis in 30 Tagen vor Rabatt: </span><span class="omnibus_price__value"><iaixsl:value-of select="$var_omnibus"/></span></span>
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
																<iaixsl:attribute name="title">Klicken Sie hier, um zum Kontaktformular zu gelangen</iaixsl:attribute>
																Preis auf Anfrage
															</a>
															</iaixsl:otherwise>
														</iaixsl:choose>
													</iaixsl:when>

													
													<iaixsl:otherwise>
														<iaixsl:if test="$var_maxprice_net_formatted != ''">
															<span class="price --max">
																
																<iaixsl:if test="($var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_label --hidden"><iaixsl:if test="$var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Normaler Preis: </span>
																</iaixsl:if>
																
																<del>
																	<iaixsl:value-of select="$var_maxprice_net_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_net_prices"/></span>
																</del>
																
																<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short = 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_short --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short = 'true'"><iaixsl:attribute name="class">omnibus_short</iaixsl:attribute></iaixsl:if>Niedrigster Preis in 30 Tagen vor Rabatt</span>
																</iaixsl:if>
																
															</span>
														</iaixsl:if>
														<strong class="price">
															<iaixsl:value-of select="$var_price_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_net_prices"/></span>
														</strong>
														<iaixsl:if test="$var_points_net != ''">
															<span class="price --points">
																<iaixsl:value-of select="$var_points_net"/><span class="currency"> Pkt.</span>
															</span>
														</iaixsl:if>
														
														<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
															<span class="omnibus_price --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_price</iaixsl:attribute></iaixsl:if><span class="omnibus_price__text">Niedrigster Preis in 30 Tagen vor Rabatt: </span><span class="omnibus_price__value"><iaixsl:value-of select="$var_omnibus"/></span></span>
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
												<strong class="opinions_element_confirmed_text"><iaixsl:choose><iaixsl:when test="@confirmedByPurchase = 'true'">Meinung durch Kauf bestätigt</iaixsl:when><iaixsl:otherwise>Meinung nicht durch Kauf bestätigt</iaixsl:otherwise></iaixsl:choose></strong>
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
														Bewertung: <iaixsl:value-of disable-output-escaping="yes" select="@note"/>/5
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

		<iaixsl:if test="/shop/page/projector/products_associated_zone3/@iairs_ajax"> </iaixsl:if>
		<iaixsl:if test="/shop/page/projector/products_associated_zone3/@hotspot_ajax"> </iaixsl:if>

	
<!-- (projector_associated_zone4, 60dd8e7841cdd9.19179168.2)-->

            <iaixsl:if test="/shop/page/projector/products_associated_zone4/@name"> </iaixsl:if>
            <iaixsl:if test="page/projector/products_associated_zone4/opinion"> </iaixsl:if>
            <iaixsl:if test="/shop/page/projector/products_associated_zone4"> </iaixsl:if>

        <!-- (projector_blog_items, 60dd8e812b4558.34086826.5)-->
	<iaixsl:variable name="projector_blog_date"/>
	<iaixsl:variable name="projector_blog_after_label"/>
	<iaixsl:variable name="projector_blog_see_more">Weiterlesen</iaixsl:variable>

	<iaixsl:if test="count(/shop/page/projector/blog_entries/item) &gt; 0">
		<section id="projector_blog" class="article mb-5 col-12">
			<h2>
				<a href="/blog-list.php" class="headline">
					<iaixsl:if test="/shop/page/mainpage2/@link and /shop/page/mainpage2/@link!=''">
						<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/page/mainpage2/@link"/></iaixsl:attribute>
					</iaixsl:if>
					<iaixsl:attribute name="title">Klicken Sie hier, um alle Blogeinträge zu sehen</iaixsl:attribute>
					<span class="headline__name">Führung</span>
					<iaixsl:if test="$projector_blog_after_label">
						<span class="headline__after"><iaixsl:value-of select="$projector_blog_after_label"/></span>
					</iaixsl:if>
				</a>
			</h2>

			<div class="article__block row">
				<iaixsl:for-each select="/shop/page/projector/blog_entries/item">
					<article class="article__item col-12 col-md-6">

						
						<iaixsl:if test="image/@src and image/@src!=''">
							<iaixsl:choose>
								<iaixsl:when test="(link/@href) != ''">
									<iaixsl:text disable-output-escaping="yes">&lt;a class=&quot;article__image_wrapper&quot; href=&quot;</iaixsl:text>
									<iaixsl:value-of select="link/@href"/><iaixsl:text disable-output-escaping="yes">&quot; </iaixsl:text>
								</iaixsl:when>
								<iaixsl:otherwise>
									<iaixsl:text disable-output-escaping="yes">&lt;span class=&quot;article__image_wrapper&quot; </iaixsl:text>
								</iaixsl:otherwise>
							</iaixsl:choose>
							<iaixsl:text disable-output-escaping="yes">&gt;</iaixsl:text>

							<img src="/gfx/standards/loader.gif?r=1696937716" class="article__image b-lazy">
								<iaixsl:attribute name="width"><iaixsl:value-of select="image/@width"/></iaixsl:attribute>
								<iaixsl:attribute name="height"><iaixsl:value-of select="image/@height"/></iaixsl:attribute>
								<iaixsl:attribute name="data-src-small"><iaixsl:value-of disable-output-escaping="yes" select="image/@src"/></iaixsl:attribute>
								<iaixsl:attribute name="data-src"><iaixsl:value-of disable-output-escaping="yes" select="image/@src"/></iaixsl:attribute>
								<iaixsl:attribute name="alt"><iaixsl:value-of disable-output-escaping="yes" select="title/text()"/></iaixsl:attribute>
							</img>

							<iaixsl:choose>
								<iaixsl:when test="(link/@href) != ''">
									<iaixsl:text disable-output-escaping="yes">&lt;/a&gt;</iaixsl:text>
								</iaixsl:when>
								<iaixsl:otherwise>
									<iaixsl:text disable-output-escaping="yes">&lt;/span&gt;</iaixsl:text>
								</iaixsl:otherwise>
							</iaixsl:choose>
						</iaixsl:if>

						
						<div class="article__date_name">
							<iaixsl:if test="$projector_blog_date">
								<div class="article__date datasquare"><iaixsl:value-of disable-output-escaping="yes" select="date"/></div>
							</iaixsl:if>

							<iaixsl:choose>
								<iaixsl:when test="(link/@href) != ''">
									<h3 class="article__name_wrapper">
										<a class="article__name">
											<iaixsl:attribute name="href"><iaixsl:value-of select="link/@href"/></iaixsl:attribute>
											<iaixsl:attribute name="title"><iaixsl:value-of disable-output-escaping="yes" select="title"/></iaixsl:attribute>
											<iaixsl:value-of disable-output-escaping="yes" select="title"/>
										</a>
									</h3>
								</iaixsl:when>
								<iaixsl:otherwise>
									<iaixsl:if test="title != ''">
										<h3 class="article__name_wrapper">
											<span class="article__name"><iaixsl:value-of disable-output-escaping="yes" select="title"/></span>
										</h3>
									</iaixsl:if>
								</iaixsl:otherwise>
							</iaixsl:choose>
						</div>

						
						<div class="article__text">
							<iaixsl:if test="$projector_blog_date">
								<iaixsl:attribute name="class">article__text --date</iaixsl:attribute>
							</iaixsl:if>
							<div class="article__description"><iaixsl:value-of disable-output-escaping="yes" select="description"/></div>
							<iaixsl:if test="more/@href and $projector_blog_see_more">
								<div class="article__more">
									<a class="article__more_link">
										<iaixsl:attribute name="href"><iaixsl:value-of select="more/@href"/></iaixsl:attribute>
										<iaixsl:attribute name="title"><iaixsl:value-of disable-output-escaping="yes" select="title"/></iaixsl:attribute>
										<iaixsl:value-of select="$projector_blog_see_more"/>
									</a>
								</div>
							</iaixsl:if>
						</div>
					</article>
				</iaixsl:for-each>
			</div>
		</section>
	</iaixsl:if>
<!-- (projector_cms_sizes, 60dd8e79e99273.66491246.7)-->
	<iaixsl:if test="/shop/page/projector/product/sizes_chart">
		<div class="component_projector_sizes_chart">
			<iaixsl:attribute name="id">component_projector_sizes_cms_not</iaixsl:attribute>
			<iaixsl:if test="/shop/page/projector/product/sizes_chart/descriptions/description">
			 <div class="table-responsive"> 
  				<table class="table-condensed">
  					<iaixsl:attribute name="class">ui-responsive table-stroke ui-table ui-table-reflow table-condensed</iaixsl:attribute>
  					<thead>
  						<tr>
  							<th class="table-first-column">Größe</th>
  							<iaixsl:for-each select="/shop/page/projector/product/sizes_chart/descriptions/description">
  								<th>
  									<iaixsl:value-of disable-output-escaping="yes" select="@name"/>
  								</th>
  							</iaixsl:for-each>
  						</tr>
  					</thead>
  					<tbody>
  					<iaixsl:for-each select="/shop/page/projector/product/sizes_chart/sizes/size">
  						<tr>
  							<td class="table-first-column">
  								<iaixsl:value-of disable-output-escaping="yes" select="@description"/>
  							</td>
  							<iaixsl:for-each select="description">
  								<td>
  									<iaixsl:value-of disable-output-escaping="yes" select="@text"/>
  								</td>
  							</iaixsl:for-each>
  						</tr>
  					</iaixsl:for-each>
  				</tbody>
  			</table>
			</div>
		</iaixsl:if>
		<div class="sizes_chart_cms">
			<iaixsl:if test="/shop/page/projector/product/sizes_chart/text">
				<iaixsl:value-of disable-output-escaping="yes" select="/shop/page/projector/product/sizes_chart/text"/>
			</iaixsl:if>
		</div>
		</div>
	</iaixsl:if>
	<iaixsl:if test="not(/shop/page/projector/product/sizes_chart) and ((page/projector/text_sizesgroup) and (page/projector/text_sizesgroup != ''))">
		<div class="component_projector_sizes_chart">
			<iaixsl:attribute name="id">component_projector_sizes_cms_not</iaixsl:attribute>
			<div class="sizes_chart_cms">
				<iaixsl:value-of disable-output-escaping="yes" select="/shop/page/projector/text_sizesgroup"/>
			</div>
		</div>
	</iaixsl:if>

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
<!-- (menu_alert, 61f913c58871d5.02003885.5)-->
	<iaixsl:if test="/shop/action_alert/@type = 'add_basket'">
		<div id="menu_preloader_add" class="added">
			<h2 class="headline added__headline p-0">
				<span class="headline__name added__headline_name">Im Warenkorb</span>
			</h2>
			<div class="added__block">
				<div class="added__product product">
					<iaixsl:if test="/shop/action_alert/products/product/@product_type = 'product_bundle'">
						<iaixsl:attribute name="data-bundle">true</iaixsl:attribute>
					</iaixsl:if>
					
					<a class="added__icon product__icon m-0 d-flex justify-content-center align-items-center">
						<iaixsl:attribute name="data-product-id"><iaixsl:value-of select="/shop/action_alert/products/product/@id"/></iaixsl:attribute>
						<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action_alert/products/product/@link"/></iaixsl:attribute>
						<iaixsl:attribute name="title"><iaixsl:value-of select="/shop/action_alert/products/product/name"/></iaixsl:attribute>
						
						 <iaixsl:choose>
              <iaixsl:when test="/shop/action_alert/products/product/icon_second and not(/shop/action_alert/products/product/icon_second = '/' or /shop/action_alert/products/product/icon_second = '')">
                <picture>
                  <source type="image/webp">
                    <iaixsl:attribute name="srcset"><iaixsl:value-of select="/shop/action_alert/products/product/icon"/></iaixsl:attribute>
                  </source>

                  <img src="/gfx/standards/loader.gif?r=1696937716" class="b-lazy">
      							<iaixsl:attribute name="data-src"><iaixsl:value-of disable-output-escaping="yes" select="/shop/action_alert/products/product/icon_second"/>
      							</iaixsl:attribute>
      							<iaixsl:attribute name="alt">
      								<iaixsl:value-of disable-output-escaping="yes" select="/shop/action_alert/products/product/name"/>
      							</iaixsl:attribute>
      						</img>

                </picture>
              </iaixsl:when>
              <iaixsl:otherwise>
    						<img src="/gfx/standards/loader.gif?r=1696937716" class="b-lazy">
    							<iaixsl:attribute name="data-src"><iaixsl:value-of disable-output-escaping="yes" select="/shop/action_alert/products/product/icon"/>
    							</iaixsl:attribute>
    							<iaixsl:attribute name="alt">
    								<iaixsl:value-of disable-output-escaping="yes" select="/shop/action_alert/products/product/name"/>
    							</iaixsl:attribute>
    						</img>
              </iaixsl:otherwise>
            </iaixsl:choose>
					</a>
					
					<h3 class="added__name_h3 d-flex">
						<a class="added__name product__name">
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action_alert/products/product/@link"/></iaixsl:attribute>
							<iaixsl:attribute name="title"><iaixsl:value-of select="/shop/action_alert/products/product/name"/></iaixsl:attribute>
							<iaixsl:value-of select="/shop/action_alert/products/product/name"/>
						</a>
					</h3>
					
					<div class="added__prices product__prices">
						<strong class="price">
							<iaixsl:if test="/shop/action_alert/products/product/add_basket_info/size/@count &gt; 1">
								<span class="price__count"><iaixsl:value-of select="/shop/action_alert/products/product/add_basket_info/size/@count"/> x </span>
							</iaixsl:if>
							<span class="price__unit">
								<iaixsl:choose>
									<iaixsl:when test="/shop/page/@price_type = 'net'">
										<iaixsl:value-of select="/shop/action_alert/products/product/price/@price_net_formatted"/>
									</iaixsl:when>
									<iaixsl:otherwise>
										<iaixsl:value-of select="/shop/action_alert/products/product/price/@price_formatted"/>
									</iaixsl:otherwise>
								</iaixsl:choose>
							</span>
							<span class="price_vat"><iaixsl:value-of select="$priceTypeText"/></span>
						</strong>
						<iaixsl:if test="/shop/action_alert/products/product/price/@points != '' and not(/shop/action_alert/products/product/add_basket_info/size/@count &gt; 1)">
							<span class="price --points">
								<iaixsl:value-of select="/shop/action_alert/products/product/price/@points"/><span class="currency"> Pkt. </span>
							</span>
						</iaixsl:if>
						<iaixsl:if test="/shop/action_alert/products/product/add_basket_info/size/@count &gt; 1">
							<span class="price --value">
								<span class="price__value_text">Preis: </span>
								<strong class="price__value">
									<iaixsl:choose>
										<iaixsl:when test="/shop/page/@price_type = 'net'">
											<iaixsl:value-of select="/shop/action_alert/summary/products_worth/@value_net_formatted"/>
										</iaixsl:when>
										<iaixsl:otherwise>
											<iaixsl:value-of select="/shop/action_alert/summary/products_worth/@value_formatted"/>
										</iaixsl:otherwise>
									</iaixsl:choose>
									<span class="price_vat"><iaixsl:value-of select="$priceTypeText"/></span>
								</strong>
							</span>
						</iaixsl:if>
					</div>
					
					<div class="added__buttons justify-content-center align-items-center">
						<a class="added__button --close" href="#close">Weiter einkaufen</a>
						<a class="added__button --basket btn --solid --medium">
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/basket/@link"/></iaixsl:attribute>
							Zum Warenkorb
							</a>
					</div>
				</div>
			</div>

			
				<iaixsl:if test="/shop/page/projector/products_associated_zone4">
					<section id="products_associated_zone4" class="hotspot mx-n4 mt-4 mb-n4 p-4 --added">
						
						<iaixsl:variable name="headline_after_products_associated_zone4"/>
						
						<iaixsl:if test="not(/shop/page/projector/products_associated_zone4/product or /shop/page/projector/products_associated_zone4/opinion)">
							<iaixsl:attribute name="data-ajaxLoad">true</iaixsl:attribute>
							<iaixsl:attribute name="data-pageType">projector</iaixsl:attribute>
						</iaixsl:if>

						
						
						<iaixsl:variable name="var_omnibus_enabled"><iaixsl:if test="/shop/@omnibus = 1">true</iaixsl:if></iaixsl:variable>
						

						<iaixsl:choose>
							<iaixsl:when test="/shop/page/projector/products_associated_zone4/product or /shop/page/projector/products_associated_zone4/opinion">

							
							<h2>
								<iaixsl:choose>
									<iaixsl:when test="/shop/page/projector/products_associated_zone4/@link">
										<a class="headline">
											<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/page/projector/products_associated_zone4/@link"/></iaixsl:attribute>
											<iaixsl:attribute name="title"/>

											<span class="headline__name">
												<iaixsl:choose>
													<iaixsl:when test="/shop/page/projector/products_associated_zone4/@name"><iaixsl:value-of select="/shop/page/projector/products_associated_zone4/@name"/></iaixsl:when>
													<iaixsl:otherwise>Sie können auch</iaixsl:otherwise>
												</iaixsl:choose>
											</span>
											<iaixsl:if test="$headline_after_products_associated_zone4">
												<span class="headline__after"><iaixsl:value-of select="$headline_after_products_associated_zone4"/></span>
											</iaixsl:if>
										</a>
									</iaixsl:when>
									<iaixsl:otherwise>
										<span class="headline p-0">
											<span class="headline__name">
												<iaixsl:choose>
													<iaixsl:when test="/shop/page/projector/products_associated_zone4/@name"><iaixsl:value-of select="/shop/page/projector/products_associated_zone4/@name"/></iaixsl:when>
													<iaixsl:otherwise>Sie können auch</iaixsl:otherwise>
												</iaixsl:choose>
											</span>
										</span>
									</iaixsl:otherwise>
								</iaixsl:choose>
							</h2>

							<div class="products d-flex flex-wrap align-items-start mx-n3">
								<iaixsl:for-each select="/shop/page/projector/products_associated_zone4/*">
									
									<iaixsl:variable name="var_name"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of disable-output-escaping="yes" select="product/name/text()"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of disable-output-escaping="yes" select="name/text()"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
									<iaixsl:variable name="var_icon"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/icon"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="icon"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
									<iaixsl:variable name="var_icon_small_second"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/icon_small_second"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="icon_small_second"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
                  <iaixsl:variable name="var_icon_second"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/icon_small_second"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="icon_second"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
									<iaixsl:variable name="var_icon_small"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/icon_small"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="icon_small"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
									<iaixsl:variable name="var_link"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/@link"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@link"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
									<iaixsl:variable name="var_yousave"/>
									<iaixsl:variable name="var_net_prices"><iaixsl:if test="/shop/page/@price_type = 'net'"> Netto</iaixsl:if></iaixsl:variable>
											<iaixsl:variable name="var_gross_prices"><iaixsl:if test="/shop/page/@price_type = 'gross'"> inkl. MwSt</iaixsl:if></iaixsl:variable>
									<iaixsl:variable name="var_b2b"/>

									<div class="product col-12 py-2 col-sm-6">

										
										<iaixsl:if test="$var_yousave and not($var_yousave = '') and price/@yousave_formatted != ''">
											<div class="product__yousave">
												<span class="product__yousave --label"><iaixsl:value-of select="$var_yousave"/></span>
												<span class="product__yousave --value"><iaixsl:value-of select="price/@yousave_formatted"/></span>
											</div>
										</iaixsl:if>

										
										<a class="product__icon m-0 d-flex justify-content-center align-items-center">
											<iaixsl:attribute name="data-product-id"><iaixsl:value-of select="@id"/></iaixsl:attribute>
											<iaixsl:attribute name="href"><iaixsl:value-of select="$var_link"/></iaixsl:attribute>
											<iaixsl:attribute name="title"><iaixsl:value-of select="$var_name"/></iaixsl:attribute>

                      <iaixsl:choose>
                        <iaixsl:when test="$var_icon_second and not($var_icon_second = '/') and $var_icon_small_second and not($var_icon_small_second = '/')">
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
											<a class="product__name mb-1">
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

														
														<iaixsl:if test="@id">
															<iaixsl:attribute name="data-omnibus_product_id"><iaixsl:value-of select="@id"/></iaixsl:attribute>
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
																		<span class="omnibus_label --hidden"><iaixsl:if test="$var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Normaler Preis: </span>
																	</iaixsl:if>
																	
																	<del>
																		<span><iaixsl:value-of select="$var_size_min_maxprice_formatted"/></span><b><iaixsl:text> - </iaixsl:text></b><span><iaixsl:value-of select="$var_size_max_maxprice_formatted"/></span><span class="price_vat"><iaixsl:value-of select="$var_gross_prices"/></span>
																	</del>
																	
																	<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short = 'true') or ($var_show_omnibus_short_fallback = 'true')">
																		<span class="omnibus_short --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short = 'true'"><iaixsl:attribute name="class">omnibus_short</iaixsl:attribute></iaixsl:if>Niedrigster Preis in 30 Tagen vor Rabatt</span>
																	</iaixsl:if>
																	
																</span>
															</iaixsl:if>
															<strong class="price">
																<iaixsl:value-of select="$var_size_min_formatted"/><iaixsl:text> - </iaixsl:text><iaixsl:value-of select="$var_size_max_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_gross_prices"/></span>
															</strong>
															<iaixsl:if test="$var_points != ''">
																<span class="price --points">
																	<iaixsl:value-of select="$var_points"/><span class="currency"> Pkt.</span>
																</span>
															</iaixsl:if>
															
															<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
																<span class="omnibus_price --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_price</iaixsl:attribute></iaixsl:if><span class="omnibus_price__text">Niedrigster Preis in 30 Tagen vor Rabatt: </span><span class="omnibus_price__value"><iaixsl:value-of select="$var_omnibus"/></span></span>
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
																	<iaixsl:attribute name="title">Klicken Sie hier, um zum Kontaktformular zu gelangen</iaixsl:attribute>
																	Preis auf Anfrage
																	</a>
																</iaixsl:otherwise>
															</iaixsl:choose>
														</iaixsl:when>

														
														<iaixsl:otherwise>
															<iaixsl:if test="$var_maxprice_formatted != ''">
																<span class="price --max">
																	
																	<iaixsl:if test="($var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
																		<span class="omnibus_label --hidden"><iaixsl:if test="$var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Normaler Preis: </span>
																	</iaixsl:if>
																	
																	<del>
																		<iaixsl:value-of select="$var_maxprice_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_gross_prices"/></span>
																	</del>
																	
																	<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short = 'true') or ($var_show_omnibus_short_fallback = 'true')">
																		<span class="omnibus_short --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short = 'true'"><iaixsl:attribute name="class">omnibus_short</iaixsl:attribute></iaixsl:if>Niedrigster Preis in 30 Tagen vor Rabatt</span>
																	</iaixsl:if>
																	
																</span>
															</iaixsl:if>
															<strong class="price">
																<iaixsl:value-of select="$var_price_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_gross_prices"/></span>
															</strong>
															<iaixsl:if test="$var_points != ''">
																<span class="price --points">
																	<iaixsl:value-of select="$var_points"/><span class="currency"> Pkt.</span>
																</span>
															</iaixsl:if>
															
															<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
																<span class="omnibus_price --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_price</iaixsl:attribute></iaixsl:if><span class="omnibus_price__text">Niedrigster Preis in 30 Tagen vor Rabatt: </span><span class="omnibus_price__value"><iaixsl:value-of select="$var_omnibus"/></span></span>
															</iaixsl:if>
															
														</iaixsl:otherwise>
													</iaixsl:choose>
													<iaixsl:if test="price/@unit_converted_price_formatted">
														<small class="s_unit_converted_price"><iaixsl:value-of select="price/@unit_converted_price_formatted"/><iaixsl:text> / </iaixsl:text><iaixsl:value-of select="price/@unit_converted_format"/><span class="price_vat"><iaixsl:value-of select="$var_gross_prices"/></span></small>
													</iaixsl:if>
												</div>
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

														
														<iaixsl:if test="@id">
															<iaixsl:attribute name="data-omnibus_product_id"><iaixsl:value-of select="@id"/></iaixsl:attribute>
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
																		<span class="omnibus_label --hidden"><iaixsl:if test="$var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Normaler Preis: </span>
																	</iaixsl:if>
																	
																	<del>
																		<span><iaixsl:value-of select="$var_size_min_net_maxprice_formatted"/></span><b><iaixsl:text> - </iaixsl:text></b><span><iaixsl:value-of select="$var_size_max_maxprice_net_formatted"/></span><span class="price_vat"><iaixsl:value-of select="$var_net_prices"/></span>
																	</del>
																	
																	<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short = 'true') or ($var_show_omnibus_short_fallback = 'true')">
																		<span class="omnibus_short --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short = 'true'"><iaixsl:attribute name="class">omnibus_short</iaixsl:attribute></iaixsl:if>Niedrigster Preis in 30 Tagen vor Rabatt</span>
																	</iaixsl:if>
																	
																</span>
															</iaixsl:if>
															<strong class="price">
																<iaixsl:value-of select="$var_size_min_net_formatted"/><iaixsl:text> - </iaixsl:text><iaixsl:value-of select="$var_size_max_net_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_net_prices"/></span>
															</strong>
															<iaixsl:if test="$var_points_net != ''">
																<span class="price --points">
																	<iaixsl:value-of select="$var_points_net"/><span class="currency"> Pkt.</span>
																</span>
															</iaixsl:if>
															
															<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
																<span class="omnibus_price --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_price</iaixsl:attribute></iaixsl:if><span class="omnibus_price__text">Niedrigster Preis in 30 Tagen vor Rabatt: </span><span class="omnibus_price__value"><iaixsl:value-of select="$var_omnibus"/></span></span>
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
																	<iaixsl:attribute name="title">Klicken Sie hier, um zum Kontaktformular zu gelangen</iaixsl:attribute>
																	Preis auf Anfrage
																	</a>
																</iaixsl:otherwise>
															</iaixsl:choose>
														</iaixsl:when>

														
														<iaixsl:otherwise>
															<iaixsl:if test="$var_maxprice_net_formatted != ''">
																<span class="price --max">
																	
																	<iaixsl:if test="($var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
																		<span class="omnibus_label --hidden"><iaixsl:if test="$var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Normaler Preis: </span>
																	</iaixsl:if>
																	
																	<del>
																		<iaixsl:value-of select="$var_maxprice_net_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_net_prices"/></span>
																	</del>
																	
																	<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short = 'true') or ($var_show_omnibus_short_fallback = 'true')">
																		<span class="omnibus_short --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short = 'true'"><iaixsl:attribute name="class">omnibus_short</iaixsl:attribute></iaixsl:if>Niedrigster Preis in 30 Tagen vor Rabatt</span>
																	</iaixsl:if>
																	
																</span>
															</iaixsl:if>
															<strong class="price">
																<iaixsl:value-of select="$var_price_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_net_prices"/></span>
															</strong>
															<iaixsl:if test="$var_points_net != ''">
																<span class="price --points">
																	<iaixsl:value-of select="$var_points_net"/><span class="currency"> Pkt.</span>
																</span>
															</iaixsl:if>
															
															<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
																<span class="omnibus_price --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_price</iaixsl:attribute></iaixsl:if><span class="omnibus_price__text">Niedrigster Preis in 30 Tagen vor Rabatt: </span><span class="omnibus_price__value"><iaixsl:value-of select="$var_omnibus"/></span></span>
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
													<strong class="opinions_element_confirmed_text"><iaixsl:choose><iaixsl:when test="@confirmedByPurchase = 'true'">Meinung durch Kauf bestätigt</iaixsl:when><iaixsl:otherwise>Meinung nicht durch Kauf bestätigt</iaixsl:otherwise></iaixsl:choose></strong>
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
															Bewertung: <iaixsl:value-of disable-output-escaping="yes" select="@note"/>/5
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
							<div class="hotspot mx-n4 mt-4 mb-n4 p-4 --added skeleton">
								<span class="headline p-0"/>
								<div class="products d-flex flex-wrap align-items-start mx-n3">
									<div class="product col-12 py-2 col-sm-6">
										<span class="product__icon m-0 d-flex justify-content-center align-items-center"/>
										<span class="product__name mb-1"/>
										<div class="product__prices"/>
									</div>
									<div class="product col-12 py-2 col-sm-6">
										<span class="product__icon m-0 d-flex justify-content-center align-items-center"/>
										<span class="product__name mb-1"/>
										<div class="product__prices"/>
									</div>
									<div class="product col-12 py-2 col-sm-6">
										<span class="product__icon m-0 d-flex justify-content-center align-items-center"/>
										<span class="product__name mb-1"/>
										<div class="product__prices"/>
									</div>
									<div class="product col-12 py-2 col-sm-6">
										<span class="product__icon m-0 d-flex justify-content-center align-items-center"/>
										<span class="product__name mb-1"/>
										<div class="product__prices"/>
									</div>
								</div>
							</div>
						</iaixsl:otherwise>
						</iaixsl:choose>
					</section>
				</iaixsl:if>
			
		</div>
	</iaixsl:if>
	<iaixsl:if test="/shop/page/projector/products_associated_zone4/@iairs_ajax"> </iaixsl:if>
  <iaixsl:if test="/shop/page/projector/products_associated_zone4/@hotspot_ajax"> </iaixsl:if>
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
        <!-- (menu_compare, 6374c9a3a9b958.90333095.2)--><!-- (menu_shoppinglist, 6374c7c8e99458.25728203.3)--><!-- (menu_additionalpayments, 6362560c0363e8.68758784.2)--><!-- (menu_maps, 63764495e0cb08.91568922.2)--><!-- (menu_omnibus, 6458e0851cf079.14035433.4)-->

<!-- (express_checkout, 646cd9487a5c03.20619453.13)-->
  <template id="expchck_header">
    <div class="expchck_header">
      <a class="expchck_header__previous" href="#expchckPreviousStep"/>
      <span class="expchck_header__name"/>
    </div>
  </template>

  <template id="expchck_status">
    <div class="expchck_status">
      <strong class="expchck_status__description"/>
    </div>
  </template>

  
  <template id="expchck_countries">
    <div class="expchck_%s__item --country f-feedback">
      <select id="%s_region" name="%s_region" class="f-select" data-name="region">
        <iaixsl:attribute name="data-label">Land: </iaixsl:attribute>
      </select>
    </div>
  </template>

  
  <template id="expchck_provinces">
    <div class="expchck_%s__item --province f-feedback --hidden">
      <select name="%s_province" class="f-select" data-name="province"/>
    </div>
  </template>

  
  <template id="expchck_summary">
    <div class="expchck_summary">
      <div class="expchck_summary__wrapper --left"/>
      <div class="expchck_summary__wrapper --right"/>
    </div>
  </template>

  <template id="expchck_summary_address">
    <div class="expchck_summary_address">
      <div class="expchck_summary_address__label expchck_label">
        <strong class="expchck_label__name">Käuferdaten</strong>
        <span class="expchck_label__desc">Die Adresse wird auf der Kaufbestätigung stehen</span>
      </div>
      <div class="expchck_summary_address__wrapper">
        <strong class="expchck_summary_address__name"/>
        <div class="expchck_summary_address__address">
          <span class="expchck_summary_address__street"/>
          <span class="expchck_summary_address__city"/>
          <span class="expchck_summary_address__phone_wrapper">
            <span class="expchck_summary_address__phone_label">Telefonnummer des Empfängers: </span>
            <span class="expchck_summary_address__phone"/>
          </span>
        </div>
      </div>
      <div class="expchck_summary_address__invoice expchck_summary_invoice">
        <div class="expchck_summary_invoice__switch">
          <span class="expchck_summary_invoice__switch_text">Ich möchte eine Rechnung erhalten</span>
          <div class="f-group --switch">
            <input type="checkbox" class="f-control" name="invoice" id="expchck_summary_invoice_change"/>
            <label class="f-label" for="expchck_summary_invoice_change"/>
          </div>
        </div>
        <div class="expchck_summary_invoice__wrapper">
          <div class="expchck_summary_invoice__inputs expchck_inputs f-group --mask">
            
            <div class="expchck_summary_invoice__item --firm f-feedback">
              <input id="invoice_firm" type="text" class="f-control --validate" data-name="firm" name="invoice_firm" data-graphql="firm" required="required"/>
              <label for="invoice_firm" class="f-label">Firmenname</label>
              <span class="f-control-feedback"/>
              <div class="f-message"/>
            </div>
            
            <div class="expchck_summary_invoice__item --nip f-feedback">
              <input id="invoice_nip" type="text" class="f-control --validate" data-name="nip" name="invoice_nip" data-graphql="nip" required="required" data-region=""/>
              <label for="invoice_nip" class="f-label">USt-IdNr</label>
              <span class="f-control-feedback"/>
              <div class="f-message"/>
            </div>
            
            <div class="expchck_summary_invoice__item --street f-feedback --address">
              <input id="invoice_street" type="text" class="f-control --validate" data-name="street" name="invoice_street" required="required" data-graphql="street" data-concat-from="#invoice_street_number" autocomplete="address-line1" data-region=""/>
              <label for="invoice_street" class="f-label">Straße</label>
              <span class="f-control-feedback"/>
              <div class="f-message"/>
            </div>
            
            <div class="expchck_summary_invoice__item --street-number f-feedback --address">
              <input id="invoice_street_number" type="text" class="f-control --validate" data-name="streetNumber" name="invoice_street_number" data-concat-to="#invoice_street"/>
              <label for="invoice_street_number" class="f-label">Hausnummer</label>
              <span class="f-control-feedback"/>
              <div class="f-message"/>
            </div>
            
            <div class="expchck_summary_invoice__item --zipcode f-feedback --address">
              <input id="invoice_zipcode" type="text" class="f-control --validate" data-name="zipcode" name="invoice_zipcode" required="required" data-graphql="zipcode" autocomplete="postal-code" data-region=""/>
              <label for="invoice_zipcode" class="f-label">Postleitzahl</label>
              <span class="f-control-feedback"/>
              <div class="f-message"/>
            </div>
            
            <div class="expchck_summary_invoice__item --city f-feedback --address">
              <input id="invoice_city" type="text" class="f-control --validate" data-name="city" name="invoice_city" required="required" data-graphql="city" autocomplete="address-level2"/>
              <label for="invoice_city" class="f-label">Ort</label>
              <span class="f-control-feedback"/>
              <div class="f-message"/>
            </div>
          </div>
          <div class="expchck_summary_invoice__address">
            <div class="expchck_summary_invoice__address_wrapper">
              <strong class="expchck_summary_invoice__address_label">Rechnungsadresse</strong>
              <strong class="expchck_summary_invoice__firm"/>
              <strong class="expchck_summary_invoice__nip_wrapper"><span class="expchck_summary_invoice__nip_label">USt-IdNr: </span><span class="expchck_summary_invoice__nip"/></strong>
              <span class="expchck_summary_invoice__street"/>
              <span class="expchck_summary_invoice__city"/>
            </div>
            <a href="#changeInvoiceAddress" class="expchck_summary_invoice__address_change">Ändern</a>
          </div>
          <div class="expchck_summary_invoice__save">
            <button type="button" class="expchck_summary_invoice__save_button btn --solid --large">Speichern</button>
          </div>
        </div>
      </div>
    </div>
  </template>

  <template id="expchck_summary_payments">
    <div class="expchck_summary_payments">
      <div class="expchck_summary_payments__label expchck_label">
        <strong class="expchck_label__name">Zahlung</strong>
      </div>
      <div class="expchck_summary_payments__wrapper"/>
    </div>
  </template>

  <template id="expchck_summary_payment">
    <div class="expchck_summary_payment f-group --radio">
      <input type="hidden" name="first_payment_id" disabled="disabled"/>
      <input type="hidden" name="payform_id" disabled="disabled"/>
      <input type="radio" name="selected_group_only" class="expchck_summary_payment__input f-control"/>
      <label class="expchck_summary_payment__label">
        <span class="expchck_summary_payment__icons">
          <img class="expchck_summary_payment__icon"/>
        </span>
        <span class="expchck_summary_payment__names">
          <span class="expchck_summary_payment__name"/>
        </span>
      </label>
    </div>
  </template>

  <template id="expchck_summary_deliveries">
    <div class="expchck_summary_deliveries">
      <div class="expchck_summary_deliveries__label expchck_label">
        <strong class="expchck_label__name">Lieferung</strong>
      </div>
      <div class="expchck_summary_deliveries__wrapper"/>
    </div>
  </template>

  <template id="expchck_summary_delivery">
    <div class="expchck_summary_delivery">
      <div class="expchck_summary_delivery__type_wrapper">
        <strong class="expchck_summary_delivery__type"/>
        <strong class="expchck_summary_delivery__time"/>
      </div>
      <div class="expchck_summary_delivery__info">
        <strong class="expchck_summary_delivery__name"/>
        <div class="expchck_summary_delivery__address">
          <span class="expchck_summary_delivery__street"/>
          <span class="expchck_summary_delivery__city"/>
          <span class="expchck_summary_delivery__phone_wrapper">
            <span class="expchck_summary_delivery__phone_label">Telefonnummer des Empfängers: </span>
            <span class="expchck_summary_delivery__phone"/>
          </span>
        </div>
      </div>
      <strong class="expchck_summary_delivery__cost"/>
      <div class="expchck_summary_delivery__pickup_phone expchck_pickup_phone f-group --mask">
        <div class="expchck_pickup_phone__wrapper --filled">
          <strong class="expchck_pickup_phone__value"/>
          <a href="#changePickupPhone" class="expchck_pickup_phone__change">Ändern</a>
        </div>
        <div class="expchck_pickup_phone__wrapper --change">
          <div class="expchck_pickup_phone__item --phone f-feedback">
            <input id="pickup_phone" type="tel" class="f-control --validate" name="pickup_phone" required="required" data-graphql="phone" autocomplete="tel-national" data-name="phone" data-region=""/>
            <label for="pickup_phone" class="f-label">Telefonnummer</label>
            <span class="f-control-feedback"/>
            <div class="f-message"/>
          </div>
          <div class="expchck_pickup_phone__save">
            <button type="button" class="expchck_pickup_phone__save_button btn --solid --large">Speichern</button>
          </div>
        </div>
      </div>
      <a class="expchck_summary_delivery__change" href="#changeDelivery"/>
    </div>
  </template>

  <template id="expchck_summary_costs">
    <div class="expchck_summary_costs">
      
      <div class="expchck_summary_costs__item --worth">
        <span class="expchck_summary_costs__label">Bestellwert:</span>
        <strong class="expchck_summary_costs__value"/>
      </div>
      
      <div class="expchck_summary_costs__item --rebate">
        <span class="expchck_summary_costs__label">Rabatt:</span>
        <strong class="expchck_summary_costs__value --minus"/>
      </div>
      
      <div class="expchck_summary_costs__item --paymentcost">
        <span class="expchck_summary_costs__label">Bezahlung der Kosten:</span>
        <strong class="expchck_summary_costs__value --plus"/>
      </div>
      
      <div class="expchck_summary_costs__item --shipping">
        <span class="expchck_summary_costs__label">Versand ab:</span>
        <strong class="expchck_summary_costs__value --plus"/>
      </div>
      
      <div class="expchck_summary_costs__item --insurance">
        <span class="expchck_summary_costs__label">Die Kosten der Versicherung:</span>
        <strong class="expchck_summary_costs__value --plus"/>
      </div>
      
      <div class="expchck_summary_costs__item --balance">
        <span class="expchck_summary_costs__label">Per Saldo bezahlt:<br/>(Überzahlungen auf dem Kundenkonto)</span>
        <strong class="expchck_summary_costs__value --minus"><iaixsl:value-of select="/shop/client_data/client_balance/balance[@is_selected_and_allowed_order='true']/@currency_value_formatted"/></strong>
      </div>
    </div>
  </template>

  <template id="expchck_summary_total">
    <div class="expchck_summary_total">
      <span class="expchck_summary_total__label">Zahlbetrag</span>
      <strong class="expchck_summary_total__value"/>
    </div>
  </template>

  <template id="expchck_summary_clauses">
    <div class="expchck_summary_clauses"/>
  </template>

  <template id="expchck_summary_clause">
    <div class="expchck_summary_clause"/>
  </template>

  <template id="expchck_summary_subscription">
    <div class="expchck_summary_subscription"/>
  </template>

  <template id="expchck_summary_terms">
    <div class="expchck_summary_terms">
      <div class="expchck_summary_terms__item --agree f-feedback">
        <span class="expchck_summary_terms__content"><iaixsl:value-of disable-output-escaping="yes" select="/shop/page/personal_data_processing_texts/personal_data"/></span>
        <div class="expchck_summary_terms__switch --agree f-group --switch">
          <input type="checkbox" name="terms_agree" class="f-control --validate" id="expchck_summary_terms_agree_checkbox" required="required"/>
          <label class="f-label" for="expchck_summary_terms_agree_checkbox"/>
        </div>
      </div>
      <div class="expchck_summary_terms__item --cancel f-feedback">
        <span class="expchck_summary_terms__content">Ich habe die <a target="_blank"><iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/order_cancel/@url"/></iaixsl:attribute>Widerrufsbelehrung gelesen</a></span>
        <div class="expchck_summary_terms__switch --cancel f-group --switch">
          <input type="checkbox" name="order_cancel" class="f-control --validate" id="expchck_order_cancel_checkbox" required="required"/>
          <label class="f-label" for="expchck_order_cancel_checkbox"/>
        </div>
      </div>
      <div class="expchck_summary_terms__item --virtual f-feedback">
        <span class="expchck_summary_terms__content">Ja, ich möchte sofort Zugang zu dem digitalen Inhalt und weiß, dass mein Widerrufsrecht mit dem Zugang erlischt</span>
        <div class="expchck_summary_terms__switch --virtual f-group --switch">
          <input type="checkbox" name="order_virtual" class="f-control --validate" id="expchck_order_virtual_checkbox" required="required"/>
          <label class="f-label" for="expchck_order_virtual_checkbox"/>
        </div>
      </div>
      <div class="expchck_summary_terms__item --service f-feedback">
        <span class="expchck_summary_terms__content">Ja, bitte beginnen Sie sofort mit der Dienstleistung. Mein Widerrufsrecht erlischt mit vollständiger Ausführung</span>
        <div class="expchck_summary_terms__switch --cancel f-group --switch">
          <input type="checkbox" name="order_service" class="f-control --validate" id="expchck_order_service_checkbox" required="required"/>
          <label class="f-label" for="expchck_order_service_checkbox"/>
        </div>
      </div>
    </div>
  </template>

  <template id="expchck_summary_submit">
    <div class="expchck_summary_submit">
      <button type="submit" class="expchck_summary_submit__button btn --solid --large">Ich akzeptiere, bestelle und bezahle<span class="expchck_summary_submit__cost"/></button>
    </div>
  </template>

  <div class="expchck_summary_submit_mobile">
    <div class="expchck_summary_submit_mobile__cost">
      <span class="expchck_summary_submit_mobile__cost_label">Zahlbetrag</span>
      <strong class="expchck_summary_submit_mobile__cost_value"/>
    </div>
    <div class="expchck_summary_submit_mobile__button_wrapper">
      <button type="submit" class="expchck_summary_submit_mobile__button btn --solid --large">Ich akzeptiere, bestelle und bezahle</button>
    </div>
  </div>
  

	
  <template id="expchck_payments">
    <div class="expchck_payments">
      <div class="expchck_payments__clause_top"/>
      <div class="expchck_payments__wrapper"/>
    </div>
  </template>

  <template id="expchck_payments_item">
    <div class="expchck_payments__item f-group --radio">
      <input type="hidden" name="first_payment_id" disabled="disabled"/>
      <input type="hidden" name="payform_id" disabled="disabled"/>
      <input type="radio" name="selected_group_only" class="expchck_payments__input f-control"/>
      <label class="expchck_payments__label">
        <span class="expchck_payments__icons">
          <img class="expchck_payments__icon"/>
        </span>
        <span class="expchck_payments__names">
          <strong class="expchck_payments__name"/>
          <span class="expchck_payments__description"/>
        </span>
        <span class="expchck_payments__arrow">
          <i class="icon-options-status"/>
        </span>
      </label>
      <div class="expchck_payments__details"/>
    </div>
  </template>

  <template id="expchck_payments_details">
    <span class="expchck_payments__clause"/>
    <div class="expchck_payments__options"/>
    <a href="#showAllPaymentMethods" class="expchck_payments__show_all">
      Alle anzeigen
    </a>
  </template>

  <template id="expchck_payments_option">
    <div class="expchck_payments__option">
      <input type="radio" name="payform_id" class="expchck_payments__option_input f-control"/>
      <label class="expchck_payments__option_select">
        <span class="expchck_payments__option_icons">
          <img class="expchck_payments__option_icon"/>
        </span>
        <span class="expchck_payments__option_name"/>
      </label>
    </div>
  </template>
	

	
  <template id="expchck_client">
    <div class="expchck_client">
      <div class="expchck_client__inputs expchck_inputs f-group">
        
        <div class="expchck_client__item --firstname f-feedback">
				  
          <input id="client_firstname" type="text" class="f-control --validate" data-name="firstname" name="client_firstname" required="required" autocomplete="given-name"/>
          <label for="client_firstname" class="f-label">Vorname</label>
          <span class="f-control-feedback"/>
          <div class="f-message"/>
        </div>
        
        <div class="expchck_client__item --lastname f-feedback">
				  <input id="client_lastname" type="text" class="f-control --validate" name="client_lastname" data-graphql="lastname" data-name="lastname" required="required" autocomplete="family-name"/>
          <label for="client_lastname" class="f-label">Nachname</label>
          <span class="f-control-feedback"/>
          <div class="f-message"/>
        </div>
        
        <div class="expchck_client__item --street f-feedback">
				  <input id="client_street" type="text" class="f-control --validate" name="client_street" required="required" data-graphql="street" data-concat-from="#client_street_number" data-name="street" autocomplete="address-line1" data-region=""/>
          <label for="client_street" class="f-label">Straße</label>
          <span class="f-control-feedback"/>
          <div class="f-message"/>
        </div>
        
        <div class="expchck_client__item --street-number f-feedback ">
				  <input id="client_street_number" type="text" class="f-control --validate" name="client_street_number" data-concat-to="#client_street" data-name="streetNumber"/>
          <label for="client_street_number" class="f-label">Hausnummer</label>
          <span class="f-control-feedback"/>
          <div class="f-message"/>
        </div>
        
        <div class="expchck_client__item --zipcode f-feedback">
				  <input id="client_zipcode" type="text" class="f-control --validate" name="client_zipcode" required="required" data-graphql="zipcode" data-name="zipcode" autocomplete="postal-code" data-region=""/>
          <label for="client_zipcode" class="f-label">Postleitzahl</label>
          <span class="f-control-feedback"/>
          <div class="f-message"/>
        </div>
        
        <div class="expchck_client__item --city f-feedback">
				  <input id="client_city" type="text" class="f-control --validate" name="client_city" required="required" data-graphql="city" data-name="city" autocomplete="address-level2"/>
          <label for="client_city" class="f-label">Ort</label>
          <span class="f-control-feedback"/>
          <div class="f-message"/>
        </div>
        
        <div class="expchck_client__item --phone f-feedback">
				  <input id="client_phone" type="tel" class="f-control --validate" name="client_phone" required="required" data-graphql="phone" autocomplete="tel-national" data-name="phone" data-region=""/>
          <label for="client_phone" class="f-label">Telefonnummer</label>
          <span class="f-control-feedback"/>
          <div class="f-message"/>
        </div>
        
        <div class="expchck_client__item --email f-feedback">
				  <input id="client_email" type="email" class="f-control --validate" name="client_email" required="required" data-graphql="email" autocomplete="email" data-name="email"/>
          <label for="client_email" class="f-label">E-Mail-Adresse</label>
          <span class="f-control-feedback"/>
          <div class="f-message"/>
        </div>
      </div>
      <div class="expchck_client__submit">
        <button type="button" class="expchck_client__button btn --solid --large">Weiter</button>
      </div>
      <div class="expchck_client__change_account">
        <span class="expchck_client__change_text">Sie möchten mit anderen gespeicherten Daten bestellen?</span>
        <a href="#changeAccount" class="expchck_client__change_link">Konto ändern</a>
      </div>
      <div class="expchck_client__safe">
        <span class="expchck_client__safe_text">Einkäufe in unserem Shop sind völlig sicher</span>
        <img class="expchck_client__powered_by_smile" src="/gfx/standards/powered_by_smile.svg?r=1696937716">
          <iaixsl:attribute name="alt">Sie kaufen und die Lieferung ist kostenlos!</iaixsl:attribute>
        </img>
      </div>
    </div>
  </template>
	

  
  <template id="expchck_deliveries">
    <div class="expchck_deliveries">
      <div class="expchck_deliveries__addresses"/>
      <div class="expchck_deliveries__block">
        <div class="expchck_deliveries__label expchck_label">
          <strong class="expchck_label__name">Lieferung</strong>
        </div>
        <div class="expchck_deliveries__section"/>
      </div>
    </div>
  </template>
	<template id="expchck_deliveries_item">
		<div class="expchck_deliveries__item expchck_delivery f-group --radio">
			<input type="radio" name="shipping" class="f-control expchck_delivery__input"/>
			<label class="f-label expchck_delivery__label">
				<span class="expchck_delivery__icons">
					<img class="expchck_delivery__icon"/>
				</span>
				<span class="expchck_delivery__names">
          <strong class="expchck_delivery__time"/>
					<strong class="expchck_delivery__name"/>
					<span class="expchck_delivery__minworth">
						<span class="expchck_delivery__minworth_label">Lieferungsart verfügbar ab </span>
						<span class="expchck_delivery__minworth_value"/>
					</span>
					<span class="expchck_delivery__comment"/>
				</span>
				<div class="expchck_delivery__cost_wrapper">
					<strong class="expchck_delivery__cost"/>
					<span class="expchck_delivery__points f-group --checkbox --small">
						<input type="checkbox" name="shipping_for_points" value="1" class="f-control expchck_delivery__points_input"/>
						<label class="f-label expchck_delivery__points_label"/>
					</span>
				</div>
			</label>
			<div class="expchck_delivery__calendar">
				<div class="expchck_delivery__calendar_days">
					<input type="hidden" class="expchck_delivery__calendar_input" name="calendar_select_date"/>
					<span class="expchck_delivery__calendar_label">Wählen Sie Ihren bevorzugten Liefertag:</span>
					<div class="expchck_delivery__dates">
						<div class="expchck_delivery__date --other">
							<a class="expchck_delivery__other_link" href="#chooseAnotherDay">Ein anderer Tag</a>
							<div class="expchck_delivery__datepicker vanilla-calendar"/>
						</div>
					</div>
				</div>
				<div class="expchck_delivery__calendar_hours">
					<span class="expchck_delivery__calendar_label">Preferowana godzina dostawy:</span>
					<select class="expchck_delivery__hours f-select --small" name="calendar_select_hour">
						<option value="6:00 - 8:00">6:00 - 8:00</option>
						<option value="8:00 - 10:00">8:00 - 10:00</option>
						<option selected="selected" value="10:00 - 12:00">10:00 - 12:00</option>
						<option value="12:00 - 14:00">12:00 - 14:00</option>
						<option value="14:00 - 16:00">14:00 - 16:00</option>
						<option value="16:00 - 18:00">16:00 - 18:00</option>
						<option value="18:00 - 20:00">18:00 - 20:00</option>
						<option value="20:00 - 22:00">20:00 - 22:00</option>
					</select>
				</div>
				<div class="expchck_delivery__calendar_services">
					<span class="expchck_delivery__calendar_label">Zusätzliche Dienstleistung auswählen:</span>
					<div class="expchck_delivery__services_wrapper"/>
				</div>
        <div class="expchck_delivery__select_delivery">
          <button type="button" class="expchck_delivery__select_button btn --solid --large">auswählen</button>
        </div>
			</div>
		</div>
	</template>
	<template id="expchck_deliveries_date">
		<div class="expchck_delivery__date">
			<strong class="expchck_delivery__date_day"/>
			<span class="expchck_delivery__date_cost"/>
		</div>
	</template>
  <template id="expchck_deliveries_address">
    <div class="expchck_deliveries__address">
      <strong class="expchck_deliveries__address_label"/>
      <div class="expchck_deliveries__address_wrapper">
        <span class="expchck_deliveries__street"/>
        <span class="expchck_deliveries__city"/>
        <span class="expchck_deliveries__phone_wrapper">
          <span class="expchck_deliveries__phone_label">Telefonnummer des Empfängers: </span>
          <span class="expchck_deliveries__phone"/>
        </span>
      </div>
      <a class="expchck_deliveries__address_edit" href="#editDeliveryAddress">Edit</a>
    </div>
  </template>
  <template id="expchck_deliveries_add_address">
    <a href="#addDeliveryAddress" class="expchck_deliveries__add_address"/>
  </template>
  

  
	<div class="pickup_points --listView">
		<div class="pickup_points__wrapper">
      <div class="pickup_points__nav pickup_nav">
        <a href="#search" class="pickup_nav__item --search">
          <svg xmlns="http://www.w3.org/2000/svg" id="Group_1727" data-name="Group 1727" width="20.777" height="20.775" viewBox="0 0 20.777 20.775">
            <g id="icon_search">
              <path id="Path_1" data-name="Path 1" d="M20.58,18.266l-3.635-3.627a10.374,10.374,0,0,0,1.768-5.273,9.356,9.356,0,1,0-9.357,9.356,10.682,10.682,0,0,0,5.361-1.766l3.511,3.635a.671.671,0,0,0,.945,0l1.407-1.378A.667.667,0,0,0,20.58,18.266Zm-11.225-1.9a7.205,7.205,0,0,1-6.952-7A7.186,7.186,0,0,1,9.356,2.385a7.205,7.205,0,0,1,6.974,6.981A7.224,7.224,0,0,1,9.356,16.369Z" transform="translate(0 -0.01)" fill="#474747"/>
            </g>
          </svg>
        </a>
        <a href="#map" class="pickup_nav__item --map">
          <svg xmlns="http://www.w3.org/2000/svg" width="18.998" height="22.775" viewBox="0 0 18.998 22.775">
            <g id="Icon_feather-map-pin" data-name="Icon feather-map-pin" transform="translate(1 1)">
              <path id="Path_1092" data-name="Path 1092" d="M21.5,10c0,6.61-8.5,12.276-8.5,12.276S4.5,16.609,4.5,10a8.5,8.5,0,1,1,17,0Z" transform="translate(-4.5 -1.5)" fill="none" stroke="#474747" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"/>
              <path id="Path_1093" data-name="Path 1093" d="M19.166,13.333A2.833,2.833,0,1,1,16.333,10.5,2.833,2.833,0,0,1,19.166,13.333Z" transform="translate(-7.834 -4.834)" fill="none" stroke="#474747" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"/>
            </g>
          </svg>
        </a>
        <a href="#list" class="pickup_nav__item --list">
          <svg xmlns="http://www.w3.org/2000/svg" width="21.757" height="17.677" viewBox="0 0 21.757 17.677">
            <path id="Icon_awesome-list-ul" data-name="Icon awesome-list-ul" d="M2.04,3.375a2.04,2.04,0,1,0,2.04,2.04A2.04,2.04,0,0,0,2.04,3.375Zm0,6.8a2.04,2.04,0,1,0,2.04,2.04A2.04,2.04,0,0,0,2.04,10.174Zm0,6.8a2.04,2.04,0,1,0,2.04,2.04,2.04,2.04,0,0,0-2.04-2.04Zm19.037.68H7.479a.68.68,0,0,0-.68.68v1.36a.68.68,0,0,0,.68.68h13.6a.68.68,0,0,0,.68-.68v-1.36A.68.68,0,0,0,21.077,17.653Zm0-13.6H7.479a.68.68,0,0,0-.68.68v1.36a.68.68,0,0,0,.68.68h13.6a.68.68,0,0,0,.68-.68V4.735A.68.68,0,0,0,21.077,4.055Zm0,6.8H7.479a.68.68,0,0,0-.68.68v1.36a.68.68,0,0,0,.68.68h13.6a.68.68,0,0,0,.68-.68v-1.36A.68.68,0,0,0,21.077,10.854Z" transform="translate(0 -3.375)" fill="#474747"/>
          </svg>
        </a>
        <a href="#filters" class="pickup_nav__item --filters">
          <svg xmlns="http://www.w3.org/2000/svg" width="20.457" height="13.638" viewBox="0 0 20.457 13.638">
            <path id="Icon_material-filter-list" data-name="Icon material-filter-list" d="M12.456,22.638H17V20.365H12.456ZM4.5,9v2.273H24.957V9Zm3.41,7.956H21.548V14.683H7.91Z" transform="translate(-4.5 -9)" fill="#2b2b2b"/>
          </svg>
        </a>
      </div>
      <div class="pickup_points__filters pickup_filters">
        <div class="pickup_filters__sub --deliveries">
          <strong class="pickup_filters__name">Punkty odbioru</strong>
        </div>
        <div class="pickup_filters__sub --availability">
          <strong class="pickup_filters__name">Dostępność</strong>
        </div>
				<div class="pickup_filters__sub --submit">
					<a class="btn --solid --large" href="#filtersPoints" title="Zastosuj filtrowanie">Zastosuj filtrowanie</a>
				</div>
      </div>
			<div class="pickup_points__search pickup_search">
				<div class="pickup_search__wrapper">
					<div class="pickup_search__query">
						<input class="pickup_search__input" type="text" autocomplete="off">
							<iaixsl:attribute name="placeholder">Enter your address</iaixsl:attribute>
					  </input>
						<a class="pickup_search__button" href="#"/>
					</div>
					<div class="pickup_search__results"/>
				</div>
			</div>
			<div class="pickup_points__map pickup_map">
				<div class="pickup_map__area">
					<a href="#searchHere" class="pickup_map__area_button btn --solid --secondary --icon-left icon-search">Hier suchen</a>
				</div>
				<div class="pickup_map__wrapper"/>
			</div>
			<div class="pickup_points__items pickup_items">
				<div class="pickup_items__findings">
					<span class="pickup_items__findings_label">Ergebnisse:</span>
					<strong class="pickup_items__findings_sub"><span class="pickup_items__findings_value"/><span class="pickup_items__findings_text"/></strong>
				</div>
				<div class="pickup_items__wrapper"/>
				<div class="pickup_items__show_more">
					<a href="#showMore" class="pickup_items__show">
						<iaixsl:attribute name="data-prev">Weniger anzeigen</iaixsl:attribute>
						Mehr anzeigen
					</a>
				</div>
				<div class="pickup_items__message menu_messages_message">Keine Abholstellen, wählen Sie eine andere Adresse</div>
			</div>
		</div>
	</div>

	<template id="pickup_points_item_template">
		<div class="pickup_items__item pickup_item">
			
			<div class="pickup_item__details">
				<span class="pickup_item__distance"/>
				<strong class="pickup_item__name"/>
				<span class="pickup_item__street"/>
				<span class="pickup_item__city_wrapper"><span class="pickup_item__zipcode"/><span class="pickup_item__city"/></span>
				<div class="pickup_item__map">
					<a href="#showOnMap" class="pickup_item__map_link">Auf Karte anzeigen</a>
				</div>
			</div>
			<div class="pickup_item__choose">
				<strong class="pickup_item__price"/>
				<a href="#selectThisPoint" class=""><svg xmlns="http://www.w3.org/2000/svg" width="9.702" height="16.706" viewBox="0 0 9.702 16.706"><path d="M9.444,9,2.33,16.437a.852.852,0,0,1-1.243,0l-.83-.867a.948.948,0,0,1,0-1.3l5.638-5.92L.256,2.433a.948.948,0,0,1,0-1.3l.83-.867a.852.852,0,0,1,1.243,0L9.444,7.7A.948.948,0,0,1,9.444,9Z" fill="#333"/></svg></a>
			</div>
		</div>
	</template>

	<template id="pickup_points_marker_template">
		<div class="pickup_marker">
			<div class="pickup_marker__details">
				<div class="pickup_marker__name_wrapper">
					<strong class="pickup_marker__name"/>
					<strong class="pickup_marker__price"/>
				</div>
				<span class="pickup_marker__street"/>
				<span class="pickup_marker__city_wrapper"><span class="pickup_marker__zipcode"/><span class="pickup_marker__city"/></span>
			</div>
			<p class="pickup_marker__description"/>
			<div class="pickup_marker__links">
				<a href="#moreInfo" class="pickup_marker__link --more" target="_blank">Mehr Informationen</a>
				<a href="#howToGetThere" class="pickup_marker__link --directions" target="_blank">Wie man dorthin kommt?</a>
			</div>
			<div class="pickup_marker__choose">
				<a href="#selectThisPoint" class="btn --solid --large">Wählen Sie diesen Punkt</a>
			</div>
		</div>
	</template>

	<template id="pickup_points_filter_item">
		<div class="pickup_filters__item d-flex align-items-center justify-content-between mb-4">
		  <span class="pickup_filters__item_name" for=""/>
		  <div class="f-group --switch mb-0">
		    <input class="pickup_filters__item_inp f-control" type="checkbox" name="filter" id="filter"/>
		    <label class="f-label" for=""/>
		  </div>
		</div>
  </template>
  

  
  <template id="expchck_address">
    <div class="expchck_address">
      <div class="expchck_address__inputs expchck_inputs f-group">
        
        <div class="expchck_address__item --street f-feedback">
				  <input id="client_street" type="text" class="f-control --validate" name="client_street" required="required" data-graphql="street" data-concat-from="#client_street_number" data-name="street" autocomplete="address-line1" data-region=""/>
          <label for="client_street" class="f-label">Straße</label>
          <span class="f-control-feedback"/>
          <div class="f-message"/>
        </div>
        
        <div class="expchck_address__item --street-number f-feedback ">
				  <input id="client_street_number" type="text" class="f-control --validate" name="client_street_number" data-concat-to="#client_street" data-name="streetNumber"/>
          <label for="client_street_number" class="f-label">Hausnummer</label>
          <span class="f-control-feedback"/>
          <div class="f-message"/>
        </div>
        
        <div class="expchck_address__item --zipcode f-feedback">
				  <input id="client_zipcode" type="text" class="f-control --validate" name="client_zipcode" required="required" data-graphql="zipcode" data-name="zipcode" autocomplete="postal-code" data-region=""/>
          <label for="client_zipcode" class="f-label">Postleitzahl</label>
          <span class="f-control-feedback"/>
          <div class="f-message"/>
        </div>
        
        <div class="expchck_address__item --city f-feedback">
				  <input id="client_city" type="text" class="f-control --validate" name="client_city" required="required" data-graphql="city" data-name="city" autocomplete="address-level2"/>
          <label for="client_city" class="f-label">Ort</label>
          <span class="f-control-feedback"/>
          <div class="f-message"/>
        </div>
        
        <div class="expchck_address__item --phone f-feedback">
				  <input id="address_phone" type="tel" class="f-control --validate" name="address_phone" required="required" data-graphql="phone" autocomplete="tel-national" data-name="phone" data-region=""/>
          <label for="address_phone" class="f-label">Telefonnummer</label>
          <span class="f-control-feedback"/>
          <div class="f-message"/>
        </div>
      </div>
      <div class="expchck_address__submit">
        <button type="button" class="expchck_address__button btn --solid --large">Speichern</button>
      </div>
      <div class="expchck_address__safe">
        <span class="expchck_address__safe_text">Einkäufe in unserem Shop sind völlig sicher</span>
        <img class="expchck_address__powered_by_smile" src="/gfx/standards/powered_by_smile.svg?r=1696937716">
          <iaixsl:attribute name="alt">Sie kaufen und die Lieferung ist kostenlos!</iaixsl:attribute>
        </img>
      </div>
    </div>
  </template>
  



























  <iaixsl:choose>
  <iaixsl:when test="/shop/client_data/@signin='cookie'">
		<script>app_shop.vars.isLogged=false;</script>
    <script>app_shop.vars.login=&quot;<iaixsl:value-of select="/shop/basket/@login"/>&quot;;</script>
	</iaixsl:when>
	<iaixsl:when test="/shop/client_data/@signin">
		<script>app_shop.vars.isLogged=true;</script>
	</iaixsl:when>
	<iaixsl:otherwise>
		<script>app_shop.vars.isLogged=false;</script>
	</iaixsl:otherwise>
</iaixsl:choose>
<script>app_shop.vars.last_login_option=&quot;<iaixsl:value-of select="/shop/login_options/service[@id = /shop/client_data/@last_login_option]/@name"/>&quot;;</script>
<script>app_shop.vars.returnLink=&quot;<iaixsl:value-of select="/shop/action/returnUrl/@url"/>&quot;;</script>
<script>app_shop.vars.basketLink=&quot;<iaixsl:value-of select="/shop/action/basket/@url"/>&quot;;</script>
<script>app_shop.vars.IAIAccountsUrl=&quot;<iaixsl:value-of select="/shop/expressCheckout/@IAIAccountsUrl"/>&quot;;</script>


<template id="expchck_login_services">
  <div class="expchck_login --services d-flex flex-column">
    <div class="expchck_login__options mb-4"/>
    <div class="expchck_login__terms mb-5 pb-2 pb-md-4">
      <span>Nutzen Sie die einfache und automatische Erfassung von Kaufdaten im Rahmen des Smile-Dienstes, der von IAI S.A für Geschäfte auf IdoSell bereitgestellt wird. Sie können Ihre Zustimmung jederzeit widerrufen.</span><a target="_blank" download="download"><iaixsl:attribute name="href"><iaixsl:choose><iaixsl:when test="/shop/language/option[@id='pol']/@selected='true'">https://www.idosell.com/panel/file-gate.php?id=263931&amp;lang=pl&amp;ext=.pdf</iaixsl:when><iaixsl:otherwise>https://www.idosell.com/panel/file-gate.php?id=263930&amp;lang=pl&amp;ext=.pdf</iaixsl:otherwise></iaixsl:choose></iaixsl:attribute>Bitte lesen Sie unsere Datenschutzbestimmungen.</a>
    </div>
    <div class="expchck_login__sep mb-4"><span>oder</span></div>
    <span class="expchck_login__text mb-3">Wenn Sie ein Konto bei uns haben, geben Sie bitte Ihren Benutzernamen ein</span>
    <div class="f-group expchck_login__email">
      <div class="f-feedback">
        <input id="login_email" type="text" name="email" class="expchck_login__email_inp f-control"/>
        <label for="login_email" class="f-label">
          E-Mail-Adresse / Benutzername
        </label>
        <span class="f-control-feedback"/>
        <a href="#verify_email"/>
        <span class="help-block"/>
      </div>
    </div>
    <div class="f-group expchck_login__pass">
      <div class="f-feedback">
        <input id="login_pass" type="password" name="pass" class="expchck_login__pass_inp f-control"/>
        <label for="login_pass" class="f-label">
          Passwort
        </label>
        <span class="f-control-feedback"/>
        <span class="help-block"/>
      </div>
    </div>
    <div class="expchck_login__buttons">
      <a class="expchck_login__signin btn --solid --large justify-content-center mb-5" href="#signin">
        Einloggen
      </a>
      <a class="expchck_login__register btn --solid --large justify-content-center mb-5" href="#register">
        Erstellen Sie ein Konto und geben Sie eine Bestellung auf
      </a>
    </div>
    <div class="expchck_login__links d-flex flex-column align-items-center">
      <a class="expchck_login__mail_login mb-3" href="#mail_login">
        Senden Sie eine E-Mail mit einem Anmeldelink
      </a>
      <a class="expchck_login__pass_recover mb-1" href="#pass_recover">
        Benutzername oder Passwort vergessen
      </a>
    </div>
  </div>
</template>

<template id="expchck_login_options">
  <a href="#login_option" class="expchck_login__option mb-2 d-flex justify-content-center">
    <span class="option_icon"/>
    <strong>
      <span>Einloggen durch </span>
      <span class="option_name"/>
    </strong>
  </a>
</template>


<template id="expchck_register_authn">
	<div class="expchck_register_authn">
		<a href="#tryAgainWebAuthnRegister" class="expchck_register_authn__button btn --outline --large">Erneut versuchen</a>
	</div>
</template>
<template id="expchck_login_authn">
	<div class="expchck_login_authn">
		<a href="#tryAgainWebAuthn" class="expchck_login_authn__button btn --outline --large">Erneut versuchen</a>
		<div class="expchck_login_authn__separator"><span class="expchck_login_authn__separator_text">oder</span></div>
	</div>
</template>
<template id="expchck_login_pin">
  <div class="expchck_login --pin d-flex flex-column">

    <span class="expchck_login__text mb-3">Geben Sie eine Telefonnummer oder E-Mail-Adresse an, um zu beginnen.</span>
    <div class="f-group expchck_login__user_identifier mb-2">
      <div class="f-feedback">
        <input id="user_identifier" type="text" autocomplete="tel" value="" class="expchck_login__user_identifier_inp f-control"/>
        <label for="user_identifier" class="f-label">
          Telefonnummer oder E-Mail-Adresse
        </label>
        <span class="f-control-feedback"/>
        <span class="help-block"/>
        <div class="expchck_login__prefix_wrapper">

          <select class="expchck_login__phone_prefix f-select">
            <option date-region="1170044713" value="+1">+1</option>
            <option date-region="1143020097" value="+7">+7</option>
            <option date-region="1143020048" value="+20">+20</option>
            <option date-region="1143020165" value="+27">+27</option>
            <option date-region="1143020062" value="+30">+30</option>
            <option date-region="1143020076" value="+31">+31</option>
            <option date-region="1143020022" value="+32">+32</option>
            <option date-region="1143020057" value="+33">+33</option>
            <option date-region="1143020075" value="+34">+34</option>
            <option date-region="1143020217" value="+36">+36</option>
            <option date-region="1143020220" value="+39">+39</option>
            <option date-region="1143020169" value="+40">+40</option>
            <option date-region="1143020192" value="+41">+41</option>
            <option date-region="1143020016" value="+43">+43</option>
            <option date-region="1170044706" value="+44">+44</option>
            <option date-region="1143020042" value="+45">+45</option>
            <option date-region="1143020193" value="+46">+46</option>
            <option date-region="1143020149" value="+47">+47</option>
            <option date-region="1143020003" selected="selected" value="+48">+48</option>
            <option date-region="1143020143" value="+49">+49</option>
            <option date-region="1143020159" value="+51">+51</option>
            <option date-region="1143020133" value="+52">+52</option>
            <option date-region="1143020108" value="+53">+53</option>
            <option date-region="1143020012" value="+54">+54</option>
            <option date-region="1143020031" value="+55">+55</option>
            <option date-region="1143020036" value="+56">+56</option>
            <option date-region="1143020101" value="+57">+57</option>
            <option date-region="1143020216" value="+58">+58</option>
            <option date-region="1143020123" value="+60">+60</option>
            <option date-region="1143020015" value="+61">+61</option>
            <option date-region="1143020080" value="+62">+62</option>
            <option date-region="1143020054" value="+63">+63</option>
            <option date-region="1143020151" value="+64">+64</option>
            <option date-region="1143020181" value="+65">+65</option>
            <option date-region="1143020196" value="+66">+66</option>
            <option date-region="1143020087" value="+81">+81</option>
            <option date-region="1143020106" value="+82">+82</option>
            <option date-region="1143020219" value="+84">+84</option>
            <option date-region="1143020037" value="+86">+86</option>
            <option date-region="1143020205" value="+90">+90</option>
            <option date-region="1143020079" value="+91">+91</option>
            <option date-region="1143020153" value="+92">+92</option>
            <option date-region="1143020002" value="+93">+93</option>
            <option date-region="1143020185" value="+94">+94</option>
            <option date-region="1143020139" value="+95">+95</option>
            <option date-region="1143020082" value="+98">+98</option>
            <option date-region="1170044703" value="+211">+211</option>
            <option date-region="1143020129" value="+212">+212</option>
            <option date-region="1143020004" value="+213">+213</option>
            <option date-region="1143020204" value="+216">+216</option>
            <option date-region="1143020114" value="+218">+218</option>
            <option date-region="1143020059" value="+220">+220</option>
            <option date-region="1143020178" value="+221">+221</option>
            <option date-region="1143020131" value="+222">+222</option>
            <option date-region="1143020125" value="+223">+223</option>
            <option date-region="1143020071" value="+224">+224</option>
            <option date-region="1143020221" value="+225">+225</option>
            <option date-region="1143020034" value="+226">+226</option>
            <option date-region="1143020144" value="+227">+227</option>
            <option date-region="1143020200" value="+228">+228</option>
            <option date-region="1143020024" value="+229">+229</option>
            <option date-region="1143020132" value="+230">+230</option>
            <option date-region="1143020113" value="+231">+231</option>
            <option date-region="1143020180" value="+232">+232</option>
            <option date-region="1143020060" value="+233">+233</option>
            <option date-region="1143020145" value="+234">+234</option>
            <option date-region="1143020039" value="+235">+235</option>
            <option date-region="1143020166" value="+236">+236</option>
            <option date-region="1143020094" value="+237">+237</option>
            <option date-region="1143020167" value="+238">+238</option>
            <option date-region="1143020229" value="+239">+239</option>
            <option date-region="1143020073" value="+240">+240</option>
            <option date-region="1143020058" value="+241">+241</option>
            <option date-region="1143020103" value="+242">+242</option>
            <option date-region="1143020104" value="+243">+243</option>
            <option date-region="1143020006" value="+244">+244</option>
            <option date-region="1143020072" value="+245">+245</option>
            <option date-region="1170044709" value="+246">+246</option>
            <option date-region="1143020179" value="+248">+248</option>
            <option date-region="1143020188" value="+249">+249</option>
            <option date-region="1143020170" value="+250">+250</option>
            <option date-region="1170044702" value="+251">+251</option>
            <option date-region="1143020184" value="+252">+252</option>
            <option date-region="1143020047" value="+253">+253</option>
            <option date-region="1143020098" value="+254">+254</option>
            <option date-region="1143020198" value="+255">+255</option>
            <option date-region="1143020209" value="+256">+256</option>
            <option date-region="1143020035" value="+257">+257</option>
            <option date-region="1143020138" value="+258">+258</option>
            <option date-region="1143020232" value="+260">+260</option>
            <option date-region="1143020120" value="+261">+261</option>
            <option date-region="1170044712" value="+262">+262</option>
            <option date-region="1143020233" value="+263">+263</option>
            <option date-region="1143020140" value="+264">+264</option>
            <option date-region="1143020122" value="+265">+265</option>
            <option date-region="1143020111" value="+266">+266</option>
            <option date-region="1143020030" value="+267">+267</option>
            <option date-region="1143020187" value="+268">+268</option>
            <option date-region="1143020102" value="+269">+269</option>
            <option date-region="1143020194" value="+290">+290</option>
            <option date-region="1143020050" value="+291">+291</option>
            <option date-region="1143020014" value="+297">+297</option>
            <option date-region="1143020301" value="+298">+298</option>
            <option date-region="1143020064" value="+299">+299</option>
            <option date-region="1143020061" value="+350">+350</option>
            <option date-region="1143020163" value="+351">+351</option>
            <option date-region="1143020117" value="+352">+352</option>
            <option date-region="1143020083" value="+353">+353</option>
            <option date-region="1143020084" value="+354">+354</option>
            <option date-region="1143020001" value="+355">+355</option>
            <option date-region="1143020126" value="+356">+356</option>
            <option date-region="1143020040" value="+357">+357</option>
            <option date-region="1143020056" value="+358">+358</option>
            <option date-region="1143020033" value="+359">+359</option>
            <option date-region="1143020116" value="+370">+370</option>
            <option date-region="1143020118" value="+371">+371</option>
            <option date-region="1143020051" value="+372">+372</option>
            <option date-region="1143020134" value="+373">+373</option>
            <option date-region="1143020013" value="+374">+374</option>
            <option date-region="1143020027" value="+375">+375</option>
            <option date-region="1143020005" value="+376">+376</option>
            <option date-region="1143020135" value="+377">+377</option>
            <option date-region="1143020177" value="+378">+378</option>
            <option date-region="1143020215" value="+379">+379</option>
            <option date-region="1170044715" value="+380">+380</option>
            <option date-region="1170044700" value="+381">+381</option>
            <option date-region="1170044701" value="+382">+382</option>
            <option date-region="1170044716" value="+383">+383</option>
            <option date-region="1143020038" value="+385">+385</option>
            <option date-region="1143020183" value="+386">+386</option>
            <option date-region="1143020029" value="+387">+387</option>
            <option date-region="1143020119" value="+389">+389</option>
            <option date-region="1143020041" value="+420">+420</option>
            <option date-region="1143020182" value="+421">+421</option>
            <option date-region="1143020115" value="+423">+423</option>
            <option date-region="1143020052" value="+500">+500</option>
            <option date-region="1143020023" value="+501">+501</option>
            <option date-region="1143020070" value="+502">+502</option>
            <option date-region="1143020175" value="+503">+503</option>
            <option date-region="1143020077" value="+504">+504</option>
            <option date-region="1143020146" value="+505">+505</option>
            <option date-region="1143020107" value="+506">+506</option>
            <option date-region="1143020156" value="+507">+507</option>
            <option date-region="1143020173" value="+508">+508</option>
            <option date-region="1143020074" value="+509">+509</option>
            <option date-region="1143020069" value="+590">+590</option>
            <option date-region="1143020028" value="+591">+591</option>
            <option date-region="1143020067" value="+592">+592</option>
            <option date-region="1143020049" value="+593">+593</option>
            <option date-region="1143020068" value="+594">+594</option>
            <option date-region="1143020158" value="+595">+595</option>
            <option date-region="1143020130" value="+596">+596</option>
            <option date-region="1143020189" value="+597">+597</option>
            <option date-region="1143020211" value="+598">+598</option>
            <option date-region="1143020010" value="+599">+599</option>
            <option date-region="1143020199" value="+670">+670</option>
            <option date-region="1170044708" value="+672">+672</option>
            <option date-region="1143020032" value="+673">+673</option>
            <option date-region="1143020141" value="+674">+674</option>
            <option date-region="1143020157" value="+675">+675</option>
            <option date-region="1143020202" value="+676">+676</option>
            <option date-region="1143020228" value="+677">+677</option>
            <option date-region="1143020213" value="+678">+678</option>
            <option date-region="1143020055" value="+679">+679</option>
            <option date-region="1143020154" value="+680">+680</option>
            <option date-region="1143020214" value="+681">+681</option>
            <option date-region="1143020225" value="+682">+682</option>
            <option date-region="1143020147" value="+683">+683</option>
            <option date-region="1143020176" value="+685">+685</option>
            <option date-region="1143020100" value="+686">+686</option>
            <option date-region="1143020150" value="+687">+687</option>
            <option date-region="1143020208" value="+688">+688</option>
            <option date-region="1143020161" value="+689">+689</option>
            <option date-region="1143020201" value="+690">+690</option>
            <option date-region="1143020053" value="+691">+691</option>
            <option date-region="1143020227" value="+692">+692</option>
            <option date-region="1170044714" value="+840">+840</option>
            <option date-region="1143020105" value="+850">+850</option>
            <option date-region="1143020078" value="+852">+852</option>
            <option date-region="1143020121" value="+853">+853</option>
            <option date-region="1143020093" value="+855">+855</option>
            <option date-region="1143020110" value="+856">+856</option>
            <option date-region="1143020020" value="+880">+880</option>
            <option date-region="1143020197" value="+886">+886</option>
            <option date-region="1143020124" value="+960">+960</option>
            <option date-region="1143020112" value="+961">+961</option>
            <option date-region="1143020090" value="+962">+962</option>
            <option date-region="1143020191" value="+963">+963</option>
            <option date-region="1143020081" value="+964">+964</option>
            <option date-region="1143020109" value="+965">+965</option>
            <option date-region="1143020011" value="+966">+966</option>
            <option date-region="1143020088" value="+967">+967</option>
            <option date-region="1143020152" value="+968">+968</option>
            <option date-region="1143020155" value="+970">+970</option>
            <option date-region="1143020234" value="+971">+971</option>
            <option date-region="1143020085" value="+972">+972</option>
            <option date-region="1143020019" value="+973">+973</option>
            <option date-region="1143020096" value="+974">+974</option>
            <option date-region="1143020026" value="+975">+975</option>
            <option date-region="1143020136" value="+976">+976</option>
            <option date-region="1143020142" value="+977">+977</option>
            <option date-region="1143020195" value="+992">+992</option>
            <option date-region="1143020206" value="+993">+993</option>
            <option date-region="1143020017" value="+994">+994</option>
            <option date-region="1143020065" value="+995">+995</option>
            <option date-region="1143020099" value="+996">+996</option>
            <option date-region="1143020212" value="+998">+998</option>
            <option date-region="1143020018" value="+1242">+1242</option>
            <option date-region="1143020021" value="+1246">+1246</option>
            <option date-region="1143020007" value="+1264">+1264</option>
            <option date-region="1143020009" value="+1268">+1268</option>
            <option date-region="1143020045" value="+1284">+1284</option>
            <option date-region="1143020046" value="+1340">+1340</option>
            <option date-region="1143020092" value="+1345">+1345</option>
            <option date-region="1143020025" value="+1441">+1441</option>
            <option date-region="1143020063" value="+1473">+1473</option>
            <option date-region="1143020207" value="+1649">+1649</option>
            <option date-region="1143020137" value="+1664">+1664</option>
            <option date-region="1143020128" value="+1670">+1670</option>
            <option date-region="1143020066" value="+1671">+1671</option>
            <option date-region="1170044711" value="+1721">+1721</option>
            <option date-region="1143020172" value="+1758">+1758</option>
            <option date-region="1143020043" value="+1767">+1767</option>
            <option date-region="1143020174" value="+1784">+1784</option>
            <option date-region="1143020162" value="+1787">+1787</option>
            <option date-region="1143020044" value="+1809">+1809</option>
            <option date-region="1143020203" value="+1868">+1868</option>
            <option date-region="1143020171" value="+1869">+1869</option>
            <option date-region="1143020086" value="+1876">+1876</option>
            <option date-region="1143020190" value="+4779">+4779</option>
            <option date-region="1143020008" value="+6721">+6721</option>
            <option date-region="1143020148" value="+6723">+6723</option>
          </select>
          <div class="expchck_login__prefix_input_wrapper">
            <input class="expchck_login__prefix_input" type="text" name="prefix"/>
          </div>

        </div>
      </div>
    </div>

    <div class="expchck_login__save_device justify-content-between align-items-center d-flex mb-2">
      <span>Biometrische automatische Anmeldung</span>
      <div class="f-group --switch --save-device mb-0">
        <input type="checkbox" class="f-control" id="expchck_save_device" checked="checked"/>
        <label class="f-label" for="expchck_save_device"/>
      </div>
    </div>
    <div class="expchck_login__terms mb-5 mt-4 py-2 py-md-4">
      <span>Nutzen Sie die einfache und automatische Erfassung von Kaufdaten im Rahmen des Smile-Dienstes, der von IAI S.A für Geschäfte auf IdoSell bereitgestellt wird. Sie können Ihre Zustimmung jederzeit widerrufen.</span><a target="_blank" download="download"><iaixsl:attribute name="href"><iaixsl:choose><iaixsl:when test="/shop/language/option[@id='pol']/@selected='true'">https://www.idosell.com/panel/file-gate.php?id=263931&amp;lang=pl&amp;ext=.pdf</iaixsl:when><iaixsl:otherwise>https://www.idosell.com/panel/file-gate.php?id=263930&amp;lang=pl&amp;ext=.pdf</iaixsl:otherwise></iaixsl:choose></iaixsl:attribute>Bitte lesen Sie unsere Datenschutzbestimmungen.</a>
    </div>

    <div class="expchck_login__smile mb-4 mb-md-5">
      <div class="expchck_login__smile_header d-flex justify-content-between align-items-center mb-2">
        <strong>Einkäufe in unserem Shop sind völlig sicher</strong>
        <svg xmlns="http://www.w3.org/2000/svg" width="68.919" height="25.254" viewBox="0 0 68.919 25.254">
          <g id="prop_fin_yes" transform="translate(-1552.503 1680.358)">
            <path id="Path_2164" data-name="Path 2164" d="M.912-.43h.88V-2.751H3.206a1.9,1.9,0,0,0,1.427-.559A1.9,1.9,0,0,0,5.18-4.743a1.874,1.874,0,0,0-.549-1.422,1.874,1.874,0,0,0-1.425-.543H.912Zm.88-3.086V-5.944h1.28a1.11,1.11,0,0,1,.886.317,1.11,1.11,0,0,1,.324.883,1.133,1.133,0,0,1-.325.9,1.133,1.133,0,0,1-.894.331ZM5.8-2.689a2.356,2.356,0,0,0,.712,1.7A2.356,2.356,0,0,0,8.23-.324,2.356,2.356,0,0,0,9.946-.991a2.356,2.356,0,0,0,.712-1.7,2.347,2.347,0,0,0-.716-1.689A2.347,2.347,0,0,0,8.23-5.037a2.347,2.347,0,0,0-1.712.659A2.347,2.347,0,0,0,5.8-2.689Zm.88,0a1.55,1.55,0,0,1,.434-1.128A1.55,1.55,0,0,1,8.23-4.29a1.544,1.544,0,0,1,1.115.471,1.544,1.544,0,0,1,.433,1.13,1.554,1.554,0,0,1-.43,1.138,1.554,1.554,0,0,1-1.118.48,1.56,1.56,0,0,1-1.115-.482A1.56,1.56,0,0,1,6.684-2.689ZM12.606-.43h.96l.924-2.89c.071-.231.125-.489.125-.489h.017s.053.258.125.489L15.69-.43h.952l1.452-4.5h-.909l-.942,3.157a3.62,3.62,0,0,0-.107.48h-.018s-.053-.249-.125-.48l-.969-3.149h-.789l-.981,3.149a4.681,4.681,0,0,0-.115.48h-.018c-.009,0-.044-.249-.115-.48L12.072-4.93h-.916Zm6-2.248a2.291,2.291,0,0,0,.679,1.7,2.291,2.291,0,0,0,1.7.66,2.678,2.678,0,0,0,1.743-.641l-.356-.632a2.146,2.146,0,0,1-1.334.525,1.47,1.47,0,0,1-1.095-.408A1.47,1.47,0,0,1,19.5-2.554h3.281s.026-.258.026-.374a1.914,1.914,0,0,0-.5-1.493,1.914,1.914,0,0,0-1.449-.614,2.205,2.205,0,0,0-1.645.682,2.205,2.205,0,0,0-.6,1.675Zm.916-.528A1.289,1.289,0,0,1,20.84-4.353a1.062,1.062,0,0,1,.8.332,1.062,1.062,0,0,1,.287.815ZM23.855-.434h.863V-2.271a2.734,2.734,0,0,1,.107-.809,1.365,1.365,0,0,1,1.263-1.056,1.243,1.243,0,0,1,.249.026v-.855a1.53,1.53,0,0,0-.222-.018,1.538,1.538,0,0,0-1.423,1.174h-.018a3.227,3.227,0,0,0,.018-.338V-4.93h-.836Zm3-2.244a2.291,2.291,0,0,0,.679,1.7,2.291,2.291,0,0,0,1.7.66,2.678,2.678,0,0,0,1.743-.641l-.356-.632a2.146,2.146,0,0,1-1.334.525,1.47,1.47,0,0,1-1.095-.408,1.47,1.47,0,0,1-.452-1.077h3.281s.026-.258.026-.374a1.914,1.914,0,0,0-.5-1.493A1.914,1.914,0,0,0,29.1-5.035a2.205,2.205,0,0,0-1.645.682,2.205,2.205,0,0,0-.6,1.675Zm.914-.528a1.289,1.289,0,0,1,1.32-1.146,1.062,1.062,0,0,1,.8.332,1.062,1.062,0,0,1,.287.814Zm4.039.528c0,1.4.765,2.357,1.98,2.357a1.576,1.576,0,0,0,1.479-.839h.018s-.009.125-.009.3v.427h.818V-6.708h-.863v2.081a2.547,2.547,0,0,0,.018.3h-.018a1.5,1.5,0,0,0-1.386-.711A2.1,2.1,0,0,0,31.8-2.678Zm.88,0c0-1.022.587-1.61,1.3-1.61.853,0,1.272.8,1.272,1.6,0,1.147-.632,1.618-1.3,1.618C33.21-1.071,32.685-1.7,32.685-2.678ZM39.728-.43h.818V-.76a3.018,3.018,0,0,0-.018-.338h.018a1.618,1.618,0,0,0,1.414.774,2.109,2.109,0,0,0,2.046-2.357c0-1.4-.765-2.357-1.974-2.357a1.589,1.589,0,0,0-1.441.765h-.018s.018-.16.018-.382V-6.708h-.863Zm.836-2.232c0-1.147.622-1.618,1.3-1.618.747,0,1.272.632,1.272,1.61,0,1.022-.587,1.61-1.3,1.61C40.982-1.062,40.564-1.862,40.564-2.662Zm3.868,3.824a1.574,1.574,0,0,0,.871.276A1.546,1.546,0,0,0,46.762.382l2.107-5.309h-.933l-1.1,2.949c-.08.231-.151.533-.151.533H46.67a5.622,5.622,0,0,0-.166-.542L45.375-4.93h-.969L46.291-.483l-.222.515a.919.919,0,0,1-.809.66,1,1,0,0,1-.525-.187Z" transform="translate(1552.398 -1673.646)" fill="#222"/>
            <g id="Group_1119" data-name="Group 1119" transform="translate(1552.503 -1671.858)">
              <g id="Group_1118" data-name="Group 1118" transform="translate(0 0)">
                <path id="Path_298" data-name="Path 298" d="M1.894,0H13.932a1.894,1.894,0,0,1,1.894,1.894V13.932a1.894,1.894,0,0,1-1.894,1.894H1.894A1.894,1.894,0,0,1,0,13.932V1.894A1.894,1.894,0,0,1,1.894,0Z" transform="translate(0 0.928)" fill="#e8594b"/>
                <g id="Group_1117" data-name="Group 1117" transform="translate(1.451 6.56)">
                  <path id="Path_296" data-name="Path 296" d="M914.073,97.14a4.5,4.5,0,0,1-8.29.032l-2.306.984a7.007,7.007,0,0,0,12.924-.081Z" transform="translate(-903.477 -97.14)" fill="#fff"/>
                </g>
                <path id="Path_294" data-name="Path 294" d="M999.2,78.6c0-4.44-6.555-3.4-6.555-5.705A1.176,1.176,0,0,1,994,71.689a1.435,1.435,0,0,1,1.53,1.379h3.5c-.132-2.531-2.078-3.967-4.968-3.967-2.777,0-4.836,1.4-4.836,3.911-.038,4.7,6.593,3.382,6.593,5.837,0,.775-.6,1.247-1.549,1.247a1.521,1.521,0,0,1-1.644-1.511h-3.438c.094,2.683,2.324,4.1,5.176,4.1C997.458,82.684,999.2,80.833,999.2,78.6Zm15.378,3.948h3.212V76.393c0-2.834-1.681-4.5-4.288-4.5a4.24,4.24,0,0,0-3.551,1.965,3.938,3.938,0,0,0-3.589-1.965,3.719,3.719,0,0,0-3.079,1.436V72.011h-3.23V82.552h3.23V76.828a2.025,2.025,0,1,1,4.043,0v5.724h3.212V76.828a2.024,2.024,0,1,1,4.043,0Zm4.345,0h3.23V72.011h-3.23Zm1.625-11.637a1.756,1.756,0,1,0-1.927-1.738,1.778,1.778,0,0,0,1.927,1.738Zm2.815,11.637h3.23V68.572h-3.23Zm9.087-8.1a1.823,1.823,0,0,1,1.984,1.813h-4.043A2,2,0,0,1,1032.445,74.448Zm5.044,4.609h-3.438a1.717,1.717,0,0,1-1.681,1.02,1.954,1.954,0,0,1-2-2.021h7.311a8.119,8.119,0,0,0,.057-.945,4.967,4.967,0,0,0-5.252-5.252,5.423,5.423,0,0,0,0,10.844A4.926,4.926,0,0,0,1037.489,79.057Z" transform="translate(-968.816 -67.42)" fill="#e8594b"/>
              </g>
            </g>
          </g>
        </svg>
      </div>
      <span>Die Überprüfung der Telefonnummer und E-Mail-Adresse hilft uns, Ihr Konto zu schützen. Dies gewährleistet die Sicherheit Ihrer Daten und Ihrer Privatsphäre.</span>
    </div>

    <div class="expchck_login__buttons mb-md-2">
      <a class="expchck_login__verify_pin btn --solid --large d-flex justify-content-center mb-5" href="#verify_pin">Weiter</a>
    </div>
    <div class="expchck_login__services_link d-flex justify-content-center align-items-center mb-3">
      <a class="expchck_login__login_services mr-3" href="#login_services">Auf andere Weise einloggen</a>
      <div>
        <img class="mr-2" src="/gfx/standards/google.svg?r=1696937716" alt="google"/>
        <img class="mr-2" src="/gfx/standards/facebook.svg?r=1696937716" alt="facebook"/>
        <img src="/gfx/standards/linkedin.svg?r=1696937716" alt="linkedin"/>
      </div>
    </div>
  </div>
</template>


<template id="expchck_login_verify_pin">
  <div class="expchck_login --verify_pin d-flex flex-column">
    <span class="expchck_login__text --pin_phone mb-3">Wir haben an die Nummer gesendet <strong class="expchck_login__pin_phone"/> Einen 6-stelligen Code. Er wird Ihnen in wenigen Sekunden erreichen.</span>
    <span class="expchck_login__text --pin_email mb-3">Wir haben an die E-Mail-Adresse gesendet <strong class="expchck_login__pin_email"/> Einen 6-stelligen Code. Er wird Ihnen in wenigen Sekunden erreichen.</span>

    <div class="f-group expchck_login__pin otc">
      <div class="f-feedback">
        <input type="text" pattern="[0-9]*" value="" inputmode="numeric" autocomplete="one-time-code" id="otc-1" required="required"/>
        
        <input class="expchck_login__pin_inp" type="text" pattern="[0-9]*" min="0" max="9" value="" inputmode="numeric" id="otc-2" required="required"/>
        <input class="expchck_login__pin_inp" type="text" pattern="[0-9]*" min="0" max="9" value="" inputmode="numeric" id="otc-3" required="required"/>
        <input class="expchck_login__pin_inp" type="text" pattern="[0-9]*" min="0" max="9" value="" inputmode="numeric" id="otc-4" required="required"/>
        <input class="expchck_login__pin_inp" type="text" pattern="[0-9]*" min="0" max="9" value="" inputmode="numeric" id="otc-5" required="required"/>
        <input class="expchck_login__pin_inp" type="text" pattern="[0-9]*" min="0" max="9" value="" inputmode="numeric" id="otc-6" required="required"/>
        
      </div>
    </div>

    <a href="#change_pin_option" class="expchck_login__change_pin_option mb-5">Ändern Sie Ihre Telefonnummer oder E-Mail</a>

    <div class="expchck_login__buttons">
      <a class="btn --solid --large d-flex justify-content-center mb-5" href="#signin">Weiter</a>
    </div>
    <div class="expchck_login__send_pin d-flex justify-content-center mb-md-1">
      <a href="#send_pin">Den Code erneut senden</a>
    </div>
  </div>
</template>



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
  
  
  

	
	<script src="/gfx/ger/envelope.js.gzip?r=1696937760"></script><script src="/gfx/ger/menu_suggested_shop_for_language.js.gzip?r=1696937760"></script><script src="/gfx/ger/menu_alert.js.gzip?r=1696937760"></script><script src="/gfx/ger/menu_compare.js.gzip?r=1696937760"></script><script src="/gfx/ger/menu_shoppinglist.js.gzip?r=1696937760"></script><script src="/gfx/ger/menu_additionalpayments.js.gzip?r=1696937760"></script><script src="/gfx/ger/menu_omnibus.js.gzip?r=1696937760"></script><script src="/gfx/ger/express_checkout.js.gzip?r=1696937760"></script><script src="/gfx/ger/projector_photos.js.gzip?r=1696937760"></script><script src="/gfx/ger/projector_productname.js.gzip?r=1696937760"></script><script src="/gfx/ger/projector_details.js.gzip?r=1696937760"></script><script src="/gfx/ger/projector_configurator.js.gzip?r=1696937760"></script><script src="/gfx/ger/projector_bundle_zone.js.gzip?r=1696937760"></script><script src="/gfx/ger/projector_components_hiding.js.gzip?r=1696937760"></script><script src="/gfx/ger/projector_projector_opinons_form.js.gzip?r=1696937760"></script><script src="/gfx/ger/projector_cms_sizes.js.gzip?r=1696937760"></script>

	
	<iaixsl:value-of disable-output-escaping="yes" select="php:functionString('additionalContent', 'additional_body_scripts')"/>
  
	<script>app_shop.runApp();</script>
	
	<iaixsl:if test="/shop/page/seolink_with_language_directory"/>

	<iaixsl:if test="(action/set_render/item/@name = 'popup') or not(action/set_render/item)">
		<iaixsl:text disable-output-escaping="yes">&lt;/body&gt;&lt;/html&gt;</iaixsl:text>
	</iaixsl:if>
</iaixsl:template><iaixsl:template match="//image"><iaixsl:if test="@type='swf'"><object type="application/x-shockwave-flash"><iaixsl:attribute name="data"><iaixsl:value-of select="@src"/></iaixsl:attribute><iaixsl:attribute name="data"><iaixsl:value-of select="@src"/></iaixsl:attribute><iaixsl:attribute name="width"><iaixsl:value-of select="@width"/></iaixsl:attribute><iaixsl:attribute name="height"><iaixsl:value-of select="@height"/></iaixsl:attribute><param name="movie"><iaixsl:attribute name="value"><iaixsl:value-of select="@src"/></iaixsl:attribute></param><param name="bgcolor"><iaixsl:attribute name="bgcolor"><iaixsl:value-of select="@bgcolor"/></iaixsl:attribute></param></object></iaixsl:if><iaixsl:if test="not(@type='swf')"><img alt="" class="pic"><iaixsl:attribute name="src"><iaixsl:value-of select="@src"/></iaixsl:attribute><iaixsl:if test="@width &gt; 0"><iaixsl:attribute name="width"><iaixsl:value-of select="@width"/></iaixsl:attribute></iaixsl:if><iaixsl:if test="@height &gt; 0"><iaixsl:attribute name="height"><iaixsl:value-of select="@height"/></iaixsl:attribute></iaixsl:if></img></iaixsl:if></iaixsl:template><iaixsl:template name="escape-backslash"><iaixsl:param name="str" select="."/><iaixsl:choose><iaixsl:when test="contains($str, '\')"><iaixsl:value-of select="concat(substring-before($str, '\'), '\\' )"/><iaixsl:call-template name="escape-backslash"><iaixsl:with-param name="str" select="substring-after($str, '\')"/></iaixsl:call-template></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="$str"/></iaixsl:otherwise></iaixsl:choose></iaixsl:template><iaixsl:template name="escape-quote-string"><iaixsl:param name="str"/><iaixsl:param name="escape_backslash"/><iaixsl:param name="escape" select="'quot'"/><iaixsl:param name="quoting" select="'1'"/><iaixsl:variable name="escape_sign"><iaixsl:choose><iaixsl:when test="$escape=&quot;apos&quot;"><iaixsl:value-of select="&quot;'&quot;"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="string('&quot;')"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable><iaixsl:if test="$quoting"><iaixsl:value-of select="$escape_sign"/></iaixsl:if><iaixsl:choose><iaixsl:when test="contains($str,$escape_sign)"><iaixsl:variable name="before-first-apostrophe" select="substring-before($str,$escape_sign)"/><iaixsl:variable name="after-first-apostrophe" select="substring-after($str,$escape_sign)"/><iaixsl:value-of select="$before-first-apostrophe"/>\<iaixsl:value-of select="$escape_sign"/><iaixsl:text/><iaixsl:call-template name="escape-quote-string"><iaixsl:with-param name="str" select="$after-first-apostrophe"/><iaixsl:with-param name="escape" select="$escape"/><iaixsl:with-param name="quoting" select="0"/></iaixsl:call-template></iaixsl:when><iaixsl:otherwise><iaixsl:choose><iaixsl:when test="not($escape_backslash)"><iaixsl:value-of select="$str"/></iaixsl:when><iaixsl:otherwise><iaixsl:call-template name="escape-backslash"><iaixsl:with-param name="str" select="$str"/></iaixsl:call-template></iaixsl:otherwise></iaixsl:choose></iaixsl:otherwise></iaixsl:choose><iaixsl:if test="$quoting"><iaixsl:value-of select="$escape_sign"/></iaixsl:if></iaixsl:template></iaixsl:stylesheet>