<?xml version="1.0" encoding="UTF-8"?>
<iaixsl:stylesheet xmlns:php="http://php.net/xsl" xmlns:iaixsl="http://www.w3.org/1999/XSL/Transform" xmlns:iaielement="http://iai-system.com/ddd" xmlns:fb="http://www.facebook.com/2008/fbml" version="1.0" exclude-result-prefixes="php iaielement fb"><iaixsl:output indent="no" method="html" doctype-system="about:legacy-compat" version="1.0" encoding="UTF-8"/><iaixsl:strip-space elements="table tr td img"/><iaixsl:decimal-format name="yen" NaN="" grouping-separator="," decimal-separator="."/><iaixsl:template match="shop"><!-- (envelope, 60dd8eb7808547.00364708.18)-->
	<iaixsl:variable name="priceTypeVat"><iaixsl:if test="(/shop/basket/@login and not(/shop/client_data/@uses_vat='false') or not(/shop/basket/@login)) and not(/shop/contact/owner/@vat_registered = 'false') and not(/shop/page/@price_type = 'hidden')">true</iaixsl:if></iaixsl:variable>
	<iaixsl:variable name="priceTypeText"><iaixsl:if test="not($priceTypeVat = '')"><iaixsl:choose><iaixsl:when test="/shop/page/@price_type = 'net'"> net</iaixsl:when><iaixsl:when test="/shop/page/@price_type = 'gross'"> incl. VAT</iaixsl:when></iaixsl:choose></iaixsl:if></iaixsl:variable>
	<iaixsl:variable name="meta_langcode_iso639">gb</iaixsl:variable>
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
			
			<link rel="shortcut icon" href="/gfx/eng/favicon.ico" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"/>
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
							<link rel="preload stylesheet" as="style"><iaixsl:attribute name="href">/gfx/<iaixsl:value-of select="language/@id"/>/style.css.gzip?r=1696937761</iaixsl:attribute></link>
						</iaixsl:otherwise>
					</iaixsl:choose>
				</iaixsl:when>
				<iaixsl:otherwise>
					<iaixsl:choose>
						<iaixsl:when test="/shop/@preview &gt; 0">
							<link rel="preload stylesheet" as="style"><iaixsl:attribute name="href">/gfx/<iaixsl:value-of select="language/@id"/>/<iaixsl:value-of select="/shop/@preview"/>/style.css</iaixsl:attribute></link>
						</iaixsl:when>
						<iaixsl:otherwise>
							<link rel="preload stylesheet" as="style"><iaixsl:attribute name="href">/gfx/<iaixsl:value-of select="language/@id"/>/style.css.gzip?r=1696937761</iaixsl:attribute></link>
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
						<script><iaixsl:attribute name="src">/gfx/<iaixsl:value-of select="language/@id"/>/shop.js.gzip?r=1696937761</iaixsl:attribute></script>
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
	<iaixsl:variable name="valuepricedesc">Price for you</iaixsl:variable>
	<iaixsl:variable name="discountpricedesc">Sale</iaixsl:variable>
	<iaixsl:variable name="promopricedesc">Special offer</iaixsl:variable>
	<iaixsl:variable name="detalpricedesc">Retail price</iaixsl:variable>
	<iaixsl:variable name="rebatepricedesc">Discount</iaixsl:variable>
	<iaixsl:variable name="nettopricedesc">Net price</iaixsl:variable>
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
			<span class="rabateCode__info">Active discount code: </span>
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
			<span class="freeShipping__info">Free delivery</span>
			<strong class="freeShipping__val">
				from 
				<iaixsl:value-of select="/shop/basket/@shippinglimitfree_formatted"/>
			</strong>
			
			<iaixsl:if test="not($disableReturns) and /shop/returns/@freereturnsactive='y'">
				<span class="freeShipping__return">
					days
					<iaixsl:value-of select="/shop/returns/@days_to_return"/>
					days 
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
					<iaixsl:attribute name="placeholder">Enter what you are looking for</iaixsl:attribute>
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

	<iaixsl:variable name="display_menu_additional">Log in</iaixsl:variable>
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
								Language and currency: 
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
								Country of collecting the order: 
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
									<label class="menu_settings_lang_label">Language</label>

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
										<label for="menu_settings_curr">Prices in</label>

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
										<label for="menu_settings_country">Country of collecting the order</label>

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
								Apply changes
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
					<a href="/shoppinglist.php" class="wishlist_link slt_link"><iaixsl:if test="not(/shop/shopping_lists/list)"><iaixsl:attribute name="class">wishlist_link slt_link --empty</iaixsl:attribute></iaixsl:if><iaixsl:if test="/shop/action/shoppinglist"><iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/shoppinglist/@url"/></iaixsl:attribute></iaixsl:if>Shopping lists</a>
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
										<span class="slt_lists__nav_name" data-list_name="true">Shopping list</span>
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
				<strong class="sl_choose__label">Save to shopping list</strong>
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
					<button type="button" class="sl_choose__button --desktop btn --solid">Save</button>
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
						<button type="button" class="sl_choose__button --desktop btn --solid">Save</button>
					</div>
				</iaixsl:for-each>
			</div>
			<div class="sl_choose__item --create sl_create mt-4">
				<a href="#new" class="sl_create__link  align-items-center">Create a new shopping list</a>
				<form class="sl_create__form align-items-center">
					<div class="sl_create__group f-group --small mb-0">
						<input type="text" class="sl_create__input f-control" required="required"/>
						<label class="sl_create__label f-label">New list name</label>
					</div>
					<button type="submit" class="sl_create__button btn --solid ml-2 ml-md-3">Create a list</button>
				</form>
			</div>
			<div class="sl_choose__item --mobile mt-4 d-flex justify-content-center d-md-none">
				<button class="sl_choose__button --mobile btn --solid --large">Save</button>
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
								 PTS
							</small>
						</iaixsl:if>
					</strong>
				</a>

				<div class="topBasket__details --products" style="display: none;">
					<div class="topBasket__block --labels">
						<label class="topBasket__item --name">Product</label>
						<label class="topBasket__item --sum">Quantity</label>
						<label class="topBasket__item --prices">Price</label>
					</div>
					<div class="topBasket__block --products"/>
					<iaixsl:if test="/shop/oneclick/payment">
						<div class="topBasket__block --oneclick topBasket_oneclick">
							<iaixsl:attribute name="data-lang"><iaixsl:value-of select="/shop/language/option[@selected ='true']/@id"/></iaixsl:attribute>
							<div class="topBasket_oneclick__label">
								<span class="topBasket_oneclick__text --fast">Express checkout <strong>1-Click</strong></span>
								<span class="topBasket_oneclick__text --registration"> (without registration)</span>
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
					<span class="topBasket__name">Delivery cost from</span>
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
	<iaixsl:variable name="dlmenu_showall">+ Show all</iaixsl:variable>
	<iaixsl:variable name="dlmenu_extend">+ Show all</iaixsl:variable>
	<iaixsl:variable name="dlmenu_hide">- Hide</iaixsl:variable>
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
  <iaixsl:variable name="breadcrumbs_label">You are here:  </iaixsl:variable>
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
          <span><a href="/">Home page</a></span>
        </li>
        <iaixsl:choose>
          <iaixsl:when test="page/@type = 'main'">
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'wishesedit' or page/@type = 'shoppinglist'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Shopping lists</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'basketedit'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Your basket</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'product-stocks'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Product's availability</span>
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
              <span>Opinions</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'opinions-shop'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Opinions about the store</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'categories-list'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>List of categories</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'order-payment'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Payments</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'order-newpayment'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Payments</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'order-wrappers'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Choose a package</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'news'">
            <iaixsl:choose>
              <iaixsl:when test="/shop/page/news/title">
                <li>
                  <iaixsl:attribute name="class">bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
                  <a>
                    <iaixsl:attribute name="href">/news.php</iaixsl:attribute>
                    News
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
                  <span>News</span>
                </li>
              </iaixsl:otherwise>
            </iaixsl:choose>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'client-rebates'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Your Discounts</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'sitemap'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Site map</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'client-save'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Sign in</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="((page/@type = 'client-new') and not(page/client-data/@register='true') and not(page/client-data/@edit='true'))">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Registration</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="((page/@type = 'client-new') and (page/client-data/@register='true'))">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Registration</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="((page/@type = 'client-new') and (page/client-data/@edit='true'))">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Customer details and the on-line store customization</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'order-nonstandardized'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Non standard orders</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'pickup-sites'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Select point of collection</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'contact'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Contact</span>
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
                <span>Remind password</span>
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
                    <span>Sign in</span>
                  </li>
                </iaixsl:when>
              </iaixsl:choose>
            </iaixsl:if>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'rma-add'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Add a complaint</span>
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
              <span>List of complaints</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'stock'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>The point of collection</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'order1'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Delivery and payments</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'order2'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Data confirmation</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'prepaid'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Order summary</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'producers-list'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Brands</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'searching'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Search</span>
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
              <span>Remark</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'client-orders'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-login</iaixsl:attribute>
              <a><iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/login/@url"/></iaixsl:attribute>Login</a>
            </li>
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Your orders</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'order-open'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Order status</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'product-compare'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Price comparison service</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'products-bought'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>List of purchased products</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'return_products'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Return order</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'client-cards'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Loyalty Cards</span>
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
              <span>One Step Checkout Process</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'rma-open'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Complaint without logging in</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'returns-open'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Return open</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'opinions-add'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Add opinions</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'noproduct'">
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>No product</span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'subscriptions'">
            <li>
              <iaixsl:attribute name="class">bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <a><iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/login/@url"/></iaixsl:attribute>Login</a>
            </li>
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span><iaixsl:choose><iaixsl:when test="/shop/page/subscriptions/@display = 'active'">List of active subscriptions</iaixsl:when><iaixsl:otherwise>List of terminated subscriptions</iaixsl:otherwise></iaixsl:choose></span>
            </li>
          </iaixsl:when>
          <iaixsl:when test="page/@type = 'subscription'">
            <li>
              <iaixsl:attribute name="class">bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <a><iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/login/@url"/></iaixsl:attribute>Login</a>
            </li>
            <li>
              <iaixsl:attribute name="class">bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <a><iaixsl:choose><iaixsl:when test="/shop/page/subscription/@status != 'finished'"><iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/subscriptions_active/@url"/></iaixsl:attribute>List of active subscriptions</iaixsl:when><iaixsl:otherwise><iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/subscriptions_terminated/@url"/></iaixsl:attribute>List of terminated subscriptions</iaixsl:otherwise></iaixsl:choose></a>
            </li>
            <li>
              <iaixsl:attribute name="class">bc-active bc-<iaixsl:value-of select="page/@type"/></iaixsl:attribute>
              <span>Subscription no.<iaixsl:text> </iaixsl:text><iaixsl:value-of select="/shop/page/subscription/@id"/></span>
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
				<iaixsl:attribute name="title"><p>We use the IdoSell system to give customers control over the order and the order process. <b>We also respect your rights.</b> IdoSell regularly verifies our store and confirms that we ship the shipment within the stated deadlines, and we use solutions that make it easy to shop and increase customer safety.</p></iaixsl:attribute>
			</iaixsl:when>
			<iaixsl:otherwise>
				<iaixsl:attribute name="title"><p>We use the <b>IdoSell</b> system to give customers control over the order and the order process. <b>We also respect your rights.</b>.</p></iaixsl:attribute>
			</iaixsl:otherwise>
		</iaixsl:choose>
		<h5 class="order_process_security__label">
			<iaixsl:choose>
				<iaixsl:when test="/shop/@trust_level = '1'">
					Super<sup>TM</sup> zakupy
				</iaixsl:when>
				<iaixsl:otherwise>
					Safe shopping
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
			<span class="slm_lists__label">Shopping lists</span>
			<ul class="slm_lists__nav">
				<li class="slm_lists__nav_item" data-list_skeleton="true" data-list_id="true" data-shared="true">
					<a class="slm_lists__nav_link" data-list_href="true">
						<span class="slm_lists__nav_name" data-list_name="true"/>
						<span class="slm_lists__count" data-list_count="true">0</span>
					</a>
				</li>
				<li class="slm_lists__nav_header">
					<span class="slm_lists__label">Shopping lists</span>
				</li>
				<iaixsl:if test="not(/shop/shopping_lists/list)">
					<li class="slm_lists__nav_item --empty">
						<a class="slm_lists__nav_link --empty">
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/shoppinglist/@url"/></iaixsl:attribute>
							<span class="slm_lists__nav_name" data-list_name="true">Shopping list</span>
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
			<a href="#manage" class="slm_lists__manage d-none align-items-center d-md-flex">Manage your lists</a>
		</div>
		<div class="shopping_list_menu__block --bought slm_bought">
			<a class="slm_bought__link d-flex">
				<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/productsBought/@url"/></iaixsl:attribute>
				List of purchased products
			</a>
		</div>
		<div class="shopping_list_menu__block --info slm_info">
			<strong class="slm_info__label d-block mb-3">How does a shopping list work?</strong>
			<ul class="slm_info__list">
				<li class="slm_info__list_item d-flex mb-3">
					Once logged in, you can place and store any number of products on your shopping list indefinitely.
				</li>
				<li class="slm_info__list_item d-flex mb-3">
					Adding a product to your shopping list does not automatically mean you have reserved it.
				</li>
				<li class="slm_info__list_item d-flex mb-3">
					For non-logged-in customers the shopping list is stored until the session expires (about 24h).
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
                            Account
                        </a>
                    </div>
                    <iaixsl:if test="(count(/shop/currency/option) &gt; 1) or (count(/shop/language/option) &gt; 1) or (count(/shop/countries/country) &gt; 1)">
                        <div class="mobileCategories__item --settings">
                            <a class="mobileCategories__link" href="#">
                                <iaixsl:attribute name="data-ids">#menu_settings</iaixsl:attribute>
                                Settings
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
                            <i class="icon-globe"/>  <span>Check order status</span>
                            
                        </a>
                        <iaixsl:if test="(/shop/basket/@client_id_upc != '') ">
                            <a class="client_card_link" href="##">
                                <iaixsl:attribute name="href">
                                    <iaixsl:value-of disable-output-escaping="yes" select="action/login/@url"/>
                                </iaixsl:attribute>
                                 <i class="icon-barcode"/>  <span>Regular Customer ID</span>
                            </a>
                        </iaixsl:if>
                        <a class="rabates_link" href="/client-rebate.php">
                            <iaixsl:attribute name="title">
                                
                                
                            </iaixsl:attribute>
                            <span class="font_icon">%</span> <span>Granted discounts</span>
                            
                        </a>
                        <a class="logout_link" href="/login.php?operation=logout">
                            <iaixsl:attribute name="title">
                                
                                
                            </iaixsl:attribute>
                            <i class="icon-off" style="color: #CC0000;"/>  <span>Sign out</span>
                            
                        </a>
                        <iaixsl:if test="action/personalized_recommendations/@url">
                            <a class="recommendation_link">
                                <iaixsl:attribute name="href">
                                    <iaixsl:value-of disable-output-escaping="yes" select="action/personalized_recommendations/@url"/>
                                </iaixsl:attribute>

                                <i class="icon-thumbs-up" style="color: #0099D0;"/> <span>Recommended</span>
                                
                            </a>
                        </iaixsl:if>
                    </iaixsl:when>
                    <iaixsl:otherwise>
                        <a class="sign_in_link" href="/login.php">
                            <iaixsl:attribute name="title">
                                
                                
                            </iaixsl:attribute>
                            <i class="icon-user"/>  <span>Log in</span>
                            
                        </a>
                        <a class="registration_link" href="/client-new.php?register">
                            <iaixsl:attribute name="title">
                                
                                
                            </iaixsl:attribute>
                            <i class="icon-lock"/>  <span>Register</span>
                            
                        </a>
                        <a class="order_status_link" href="/order-open.php">
                            <iaixsl:attribute name="title">
                                
                                
                            </iaixsl:attribute>
                            <i class="icon-globe"/>  <span>Check order status</span>
                            
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

					<!-- (menu_order_progress, 61b0b16c27c941.97432570.4)-->
			
			<iaixsl:variable name="wholesalerPrice_order_progress"><iaixsl:if test="/shop/page/@price_type = 'net'">true</iaixsl:if></iaixsl:variable>
			<iaixsl:variable name="cop_global_label"/>

			<iaixsl:if test="not(/shop/page/client-data/@registerByExternalService = 'true')">
				<iaixsl:choose>
					
					<iaixsl:when test="page/@type = 'basketedit'">
						<iaixsl:if test="$cop_global_label">
							<span class="big_label cop_global_label">
								<iaixsl:value-of select="$cop_global_label"/>
							</span>
						</iaixsl:if>

						<section id="Progress" class="progress mb-3 py-1 py-md-0">
							
							<div class="progress__item --first --active --shopping-cart">
								<div class="progress__icons">
									<div class="progress__icon --mobile d-md-none">
										<span class="progress__step">
											<strong>1</strong>
											<span>/4</span>
										</span>
										<svg class="progress__svg">
											<circle class="progress__circle_back"/>
											<circle class="progress__circle"/>
										</svg>
									</div>
									<div class="progress__icon --desktop d-none d-md-flex">
										<span class="progress__fontello"/>
									</div>
								</div>
								<div class="progress__text">
									<strong class="progress__name">Your basket</strong>
									<span class="progress__description">Value: <iaixsl:choose><iaixsl:when test="not($wholesalerPrice_order_progress = '')"><iaixsl:value-of select="basket/@cost_net_formatted"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="basket/@cost_formatted"/></iaixsl:otherwise></iaixsl:choose></span>
								</div>
							</div>

							<iaixsl:if test="not(basket/@login)">
								
								<div class="progress__item --second --file-text">
									<div class="progress__icons">
										<div class="progress__icon --mobile d-md-none">
											<span class="progress__step">
												<strong>2</strong>
												<span>/4</span>
											</span>
											<svg class="progress__svg">
												<circle class="progress__circle_back"/>
												<circle class="progress__circle"/>
											</svg>
										</div>
										<div class="progress__icon --desktop d-none d-md-flex">
											<span class="progress__fontello"/>
										</div>
									</div>
									<div class="progress__text">
										<iaixsl:choose>
											<iaixsl:when test="navigation/@order_express_mode='true'">
												<strong class="progress__name">Billing and shipping information</strong>
												<span class="progress__description">Enter delivery information</span>
											</iaixsl:when>
											<iaixsl:otherwise>
												<strong class="progress__name">Billing and shipping information</strong>
												<span class="progress__description">Sign in or enter information manually</span>
											</iaixsl:otherwise>
										</iaixsl:choose>
									</div>
								</div>
								
								<div class="progress__item --third --truck">
									<div class="progress__icons">
										<div class="progress__icon --mobile d-md-none">
											<span class="progress__step">
												<strong>3</strong>
												<span>/4</span>
											</span>
											<svg class="progress__svg">
												<circle class="progress__circle_back"/>
												<circle class="progress__circle"/>
											</svg>
										</div>
										<div class="progress__icon --desktop d-none d-md-flex">
											<span class="progress__fontello"/>
										</div>
									</div>
									<div class="progress__text">
										<strong class="progress__name">Delivery and payments</strong>
										<span class="progress__description">Select shipping and payment method</span>
									</div>
								</div>
								
								<div class="progress__item --fourth --comment">
									<div class="progress__icons">
										<div class="progress__icon --mobile d-md-none">
											<span class="progress__step">
												<strong>4</strong>
												<span>/4</span>
											</span>
											<svg class="progress__svg">
												<circle class="progress__circle_back"/>
												<circle class="progress__circle"/>
											</svg>
										</div>
										<div class="progress__icon --desktop d-none d-md-flex">
											<span class="progress__fontello"/>
										</div>
									</div>
									<div class="progress__text">
										<strong class="progress__name">Details</strong>
										<span class="progress__description">Please check again the correctness of the order, before placing it</span>
									</div>
								</div>
							</iaixsl:if>
							<iaixsl:if test="basket/@login">
								
								<div class="progress__item --second --truck">
									<div class="progress__icons">
										<div class="progress__icon --mobile d-md-none">
											<span class="progress__step">
												<strong>2</strong>
												<span>/4</span>
											</span>
											<svg class="progress__svg">
												<circle class="progress__circle_back"/>
												<circle class="progress__circle"/>
											</svg>
										</div>
										<div class="progress__icon --desktop d-none d-md-flex">
											<span class="progress__fontello"/>
										</div>
									</div>
									<div class="progress__text">
										<strong class="progress__name">Delivery and payments</strong>
										<span class="progress__description">Select shipping and payment method</span>
									</div>
								</div>
								
								<div class="progress__item --third --comment">
									<div class="progress__icons">
										<div class="progress__icon --mobile d-md-none">
											<span class="progress__step">
												<strong>3</strong>
												<span>/4</span>
											</span>
											<svg class="progress__svg">
												<circle class="progress__circle_back"/>
												<circle class="progress__circle"/>
											</svg>
										</div>
										<div class="progress__icon --desktop d-none d-md-flex">
											<span class="progress__fontello"/>
										</div>
									</div>
									<div class="progress__text">
										<strong class="progress__name">Details</strong>
										<span class="progress__description">Please check again the correctness of the order, before placing it</span>
									</div>
								</div>
								
								<div class="progress__item --fourth --ok">
									<div class="progress__icons">
										<div class="progress__icon --mobile d-md-none">
											<span class="progress__step">
												<strong>4</strong>
												<span>/4</span>
											</span>
											<svg class="progress__svg">
												<circle class="progress__circle_back"/>
												<circle class="progress__circle"/>
											</svg>
										</div>
										<div class="progress__icon --desktop d-none d-md-flex">
											<span class="progress__fontello"/>
										</div>
									</div>
									<div class="progress__text">
										<strong class="progress__name">Order registration</strong>
										<span class="progress__description">Order accepted</span>
									</div>
								</div>
							</iaixsl:if>
						</section>
					</iaixsl:when>
				</iaixsl:choose>
				<iaixsl:choose>
					
					<iaixsl:when test="page/@type='login' and page/login/onceorder/@display='y'">
						<iaixsl:if test="$cop_global_label">
							<span class="big_label cop_global_label">
								<iaixsl:value-of select="$cop_global_label"/>
							</span>
						</iaixsl:if>

						<section id="Progress" class="progress mb-3 py-1 py-md-0">
							
							<a class="progress__item --first --shopping-cart --link">
								<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/basket/@url"/></iaixsl:attribute>
								<div class="progress__icons">
									<div class="progress__icon --mobile d-md-none">
										<span class="progress__step">
											<strong>1</strong>
											<span>/4</span>
										</span>
										<svg class="progress__svg">
											<circle class="progress__circle_back"/>
											<circle class="progress__circle"/>
										</svg>
									</div>
									<div class="progress__icon --desktop d-none d-md-flex">
										<span class="progress__fontello"/>
									</div>
								</div>
								<div class="progress__text">
									<strong class="progress__name">Your basket</strong>
									<span class="progress__description">Value: <iaixsl:choose><iaixsl:when test="not($wholesalerPrice_order_progress = '')"><iaixsl:value-of select="basket/@cost_net_formatted"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="basket/@cost_formatted"/></iaixsl:otherwise></iaixsl:choose></span>
								</div>
							</a>
							
							<div class="progress__item --second --active --file-text">
								<div class="progress__icons">
									<div class="progress__icon --mobile d-md-none">
										<span class="progress__step">
											<strong>2</strong>
											<span>/4</span>
										</span>
										<svg class="progress__svg">
											<circle class="progress__circle_back"/>
											<circle class="progress__circle"/>
										</svg>
									</div>
									<div class="progress__icon --desktop d-none d-md-flex">
										<span class="progress__fontello"/>
									</div>
								</div>
								<div class="progress__text">
									<strong class="progress__name">Billing and shipping information</strong>
									<span class="progress__description">Sign in or enter information manually</span>
								</div>
							</div>
							
							<div class="progress__item --third --truck">
								<div class="progress__icons">
									<div class="progress__icon --mobile d-md-none">
										<span class="progress__step">
											<strong>3</strong>
											<span>/4</span>
										</span>
										<svg class="progress__svg">
											<circle class="progress__circle_back"/>
											<circle class="progress__circle"/>
										</svg>
									</div>
									<div class="progress__icon --desktop d-none d-md-flex">
										<span class="progress__fontello"/>
									</div>
								</div>
								<div class="progress__text">
									<strong class="progress__name">Delivery and payments</strong>
									<span class="progress__description">Select shipping and payment method</span>
								</div>
							</div>
							
							<div class="progress__item --fourth --comment">
								<div class="progress__icons">
									<div class="progress__icon --mobile d-md-none">
										<span class="progress__step">
											<strong>4</strong>
											<span>/4</span>
										</span>
										<svg class="progress__svg">
											<circle class="progress__circle_back"/>
											<circle class="progress__circle"/>
										</svg>
									</div>
									<div class="progress__icon --desktop d-none d-md-flex">
										<span class="progress__fontello"/>
									</div>
								</div>
								<div class="progress__text">
									<strong class="progress__name">Details</strong>
									<span class="progress__description">Please check again the correctness of the order, before placing it</span>
								</div>
							</div>
						</section>
					</iaixsl:when>
				</iaixsl:choose>
				<iaixsl:choose>
					
					<iaixsl:when test="((page/@type = 'client-new') and not(page/client-data/@edit = 'true') and (page/client-data/@afterlogin = 'order'))">
						<iaixsl:if test="$cop_global_label">
							<span class="big_label cop_global_label">
								<iaixsl:value-of select="$cop_global_label"/>
							</span>
						</iaixsl:if>

						<section id="Progress" class="progress mb-3 py-1 py-md-0">
							
							<a class="progress__item --first --shopping-cart --link">
								<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/basket/@url"/></iaixsl:attribute>
								<div class="progress__icons">
									<div class="progress__icon --mobile d-md-none">
										<span class="progress__step">
											<strong>1</strong>
											<span>/4</span>
										</span>
										<svg class="progress__svg">
											<circle class="progress__circle_back"/>
											<circle class="progress__circle"/>
										</svg>
									</div>
									<div class="progress__icon --desktop d-none d-md-flex">
										<span class="progress__fontello"/>
									</div>
								</div>
								<div class="progress__text">
									<strong class="progress__name">Your basket</strong>
									<span class="progress__description">Value: <iaixsl:choose><iaixsl:when test="not($wholesalerPrice_order_progress = '')"><iaixsl:value-of select="basket/@cost_net_formatted"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="basket/@cost_formatted"/></iaixsl:otherwise></iaixsl:choose></span>
								</div>
							</a>
							
							<div class="progress__item --second --active --file-text">
								<div class="progress__icons">
									<div class="progress__icon --mobile d-md-none">
										<span class="progress__step">
											<strong>2</strong>
											<span>/4</span>
										</span>
										<svg class="progress__svg">
											<circle class="progress__circle_back"/>
											<circle class="progress__circle"/>
										</svg>
									</div>
									<div class="progress__icon --desktop d-none d-md-flex">
										<span class="progress__fontello"/>
									</div>
								</div>
								<div class="progress__text">
									<strong class="progress__name">Billing and shipping information</strong>
									<span class="progress__description">Enter delivery information</span>
								</div>
							</div>
							
							<div class="progress__item --third --truck">
								<div class="progress__icons">
									<div class="progress__icon --mobile d-md-none">
										<span class="progress__step">
											<strong>3</strong>
											<span>/4</span>
										</span>
										<svg class="progress__svg">
											<circle class="progress__circle_back"/>
											<circle class="progress__circle"/>
										</svg>
									</div>
									<div class="progress__icon --desktop d-none d-md-flex">
										<span class="progress__fontello"/>
									</div>
								</div>
								<div class="progress__text">
									<strong class="progress__name">Delivery and payments</strong>
									<span class="progress__description">Select shipping and payment method</span>
								</div>
							</div>
							
							<div class="progress__item --fourth --comment">
								<div class="progress__icons">
									<div class="progress__icon --mobile d-md-none">
										<span class="progress__step">
											<strong>4</strong>
											<span>/4</span>
										</span>
										<svg class="progress__svg">
											<circle class="progress__circle_back"/>
											<circle class="progress__circle"/>
										</svg>
									</div>
									<div class="progress__icon --desktop d-none d-md-flex">
										<span class="progress__fontello"/>
									</div>
								</div>
								<div class="progress__text">
									<strong class="progress__name">Details</strong>
									<span class="progress__description">Please check again the correctness of the order, before placing it</span>
								</div>
							</div>
						</section>
					</iaixsl:when>
				</iaixsl:choose>
				<iaixsl:choose>
					
					<iaixsl:when test="page/@type = 'order1'">
						<iaixsl:if test="$cop_global_label">
							<span class="big_label cop_global_label">
								<iaixsl:value-of select="$cop_global_label"/>
							</span>
						</iaixsl:if>

						<section id="Progress" class="progress mb-3 py-1 py-md-0">
							
							<a class="progress__item --first --shopping-cart --link">
								<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/basket/@url"/></iaixsl:attribute>
								<div class="progress__icons">
									<div class="progress__icon --mobile d-md-none">
										<span class="progress__step">
											<strong>1</strong>
											<span>/4</span>
										</span>
										<svg class="progress__svg">
											<circle class="progress__circle_back"/>
											<circle class="progress__circle"/>
										</svg>
									</div>
									<div class="progress__icon --desktop d-none d-md-flex">
										<span class="progress__fontello"/>
									</div>
								</div>
								<div class="progress__text">
									<strong class="progress__name">Your basket</strong>
									<span class="progress__description">Value: <iaixsl:choose><iaixsl:when test="not($wholesalerPrice_order_progress = '')"><iaixsl:value-of select="basket/@cost_net_formatted"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="basket/@cost_formatted"/></iaixsl:otherwise></iaixsl:choose></span>
								</div>
							</a>
							
							<div class="progress__item --second --active --truck">
								<div class="progress__icons">
									<div class="progress__icon --mobile d-md-none">
										<span class="progress__step">
											<strong>2</strong>
											<span>/4</span>
										</span>
										<svg class="progress__svg">
											<circle class="progress__circle_back"/>
											<circle class="progress__circle"/>
										</svg>
									</div>
									<div class="progress__icon --desktop d-none d-md-flex">
										<span class="progress__fontello"/>
									</div>
								</div>
								<div class="progress__text">
									<strong class="progress__name">Delivery and payments</strong>
									<span class="progress__description">Select shipping and payment method</span>
								</div>
							</div>
							
							<div class="progress__item --third --comment">
								<div class="progress__icons">
									<div class="progress__icon --mobile d-md-none">
										<span class="progress__step">
											<strong>3</strong>
											<span>/4</span>
										</span>
										<svg class="progress__svg">
											<circle class="progress__circle_back"/>
											<circle class="progress__circle"/>
										</svg>
									</div>
									<div class="progress__icon --desktop d-none d-md-flex">
										<span class="progress__fontello"/>
									</div>
								</div>
								<div class="progress__text">
									<strong class="progress__name">Details</strong>
									<span class="progress__description">Please check again the correctness of the order, before placing it</span>
								</div>
							</div>

							<iaixsl:choose>
								<iaixsl:when test="not(basket/@login) and not(navigation/@order_express_mode='true')">
									
									<div class="progress__item --fourth --file-text">
										<div class="progress__icons">
											<div class="progress__icon --mobile d-md-none">
												<span class="progress__step">
													<strong>4</strong>
													<span>/4</span>
												</span>
												<svg class="progress__svg">
													<circle class="progress__circle_back"/>
													<circle class="progress__circle"/>
												</svg>
											</div>
											<div class="progress__icon --desktop d-none d-md-flex">
												<span class="progress__fontello"/>
											</div>
										</div>
										<div class="progress__text">
											<strong class="progress__name">Save data</strong>
											<span class="progress__description">Remember the customer's information</span>
										</div>
									</div>
								</iaixsl:when>
								<iaixsl:otherwise>
									
									<div class="progress__item --fourth --ok">
										<div class="progress__icons">
											<div class="progress__icon --mobile d-md-none">
												<span class="progress__step">
													<strong>4</strong>
													<span>/4</span>
												</span>
												<svg class="progress__svg">
													<circle class="progress__circle_back"/>
													<circle class="progress__circle"/>
												</svg>
											</div>
											<div class="progress__icon --desktop d-none d-md-flex">
												<span class="progress__fontello"/>
											</div>
										</div>
										<div class="progress__text">
											<strong class="progress__name">Order registration</strong>
											<span class="progress__description">Order accepted</span>
										</div>
									</div>
								</iaixsl:otherwise>
							</iaixsl:choose>
						</section>
					</iaixsl:when>
				</iaixsl:choose>
				<iaixsl:choose>
					
					<iaixsl:when test="page/@type = 'order-nonstandardized'">
						<iaixsl:if test="$cop_global_label">
							<span class="big_label cop_global_label">
								<iaixsl:value-of select="$cop_global_label"/>
							</span>
						</iaixsl:if>

						<section id="Progress" class="progress mb-3 py-1 py-md-0">
							
							<a class="progress__item --first --shopping-cart --link">
								<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/basket/@url"/></iaixsl:attribute>
								<div class="progress__icons">
									<div class="progress__icon --mobile d-md-none">
										<span class="progress__step">
											<strong>1</strong>
											<span>/4</span>
										</span>
										<svg class="progress__svg">
											<circle class="progress__circle_back"/>
											<circle class="progress__circle"/>
										</svg>
									</div>
									<div class="progress__icon --desktop d-none d-md-flex">
										<span class="progress__fontello"/>
									</div>
								</div>
								<div class="progress__text">
									<strong class="progress__name">Your basket</strong>
									<span class="progress__description">Value: <iaixsl:choose><iaixsl:when test="not($wholesalerPrice_order_progress = '')"><iaixsl:value-of select="basket/@cost_net_formatted"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="basket/@cost_formatted"/></iaixsl:otherwise></iaixsl:choose></span>
								</div>
							</a>
							
							<div class="progress__item --second --active --truck">
								<div class="progress__icons">
									<div class="progress__icon --mobile d-md-none">
										<span class="progress__step">
											<strong>2</strong>
											<span>/4</span>
										</span>
										<svg class="progress__svg">
											<circle class="progress__circle_back"/>
											<circle class="progress__circle"/>
										</svg>
									</div>
									<div class="progress__icon --desktop d-none d-md-flex">
										<span class="progress__fontello"/>
									</div>
								</div>
								<div class="progress__text">
									<strong class="progress__name">Delivery and payments</strong>
									<span class="progress__description">Non standard orders</span>
								</div>
							</div>
							
							<div class="progress__item --third --comment">
								<div class="progress__icons">
									<div class="progress__icon --mobile d-md-none">
										<span class="progress__step">
											<strong>3</strong>
											<span>/4</span>
										</span>
										<svg class="progress__svg">
											<circle class="progress__circle_back"/>
											<circle class="progress__circle"/>
										</svg>
									</div>
									<div class="progress__icon --desktop d-none d-md-flex">
										<span class="progress__fontello"/>
									</div>
								</div>
								<div class="progress__text">
									<strong class="progress__name">Details</strong>
									<span class="progress__description">Please check again the correctness of the order, before placing it</span>
								</div>
							</div>

							<iaixsl:choose>
								<iaixsl:when test="not(basket/@login) and not(navigation/@order_express_mode='true')">
									
									<div class="progress__item --fourth --file-text">
										<div class="progress__icons">
											<div class="progress__icon --mobile d-md-none">
												<span class="progress__step">
													<strong>4</strong>
													<span>/4</span>
												</span>
												<svg class="progress__svg">
													<circle class="progress__circle_back"/>
													<circle class="progress__circle"/>
												</svg>
											</div>
											<div class="progress__icon --desktop d-none d-md-flex">
												<span class="progress__fontello"/>
											</div>
										</div>
										<div class="progress__text">
											<strong class="progress__name">Save data</strong>
											<span class="progress__description">Remember the customer's information</span>
										</div>
									</div>
								</iaixsl:when>
								<iaixsl:otherwise>
									
									<div class="progress__item --fourth --ok">
										<div class="progress__icons">
											<div class="progress__icon --mobile d-md-none">
												<span class="progress__step">
													<strong>4</strong>
													<span>/4</span>
												</span>
												<svg class="progress__svg">
													<circle class="progress__circle_back"/>
													<circle class="progress__circle"/>
												</svg>
											</div>
											<div class="progress__icon --desktop d-none d-md-flex">
												<span class="progress__fontello"/>
											</div>
										</div>
										<div class="progress__text">
											<strong class="progress__name">Order registration</strong>
											<span class="progress__description">Order accepted</span>
										</div>
									</div>
								</iaixsl:otherwise>
							</iaixsl:choose>
						</section>
					</iaixsl:when>
				</iaixsl:choose>
				<iaixsl:choose>
					
					<iaixsl:when test="page/@type = 'pickup-sites'">
						<iaixsl:if test="$cop_global_label">
							<span class="big_label cop_global_label">
								<iaixsl:value-of select="$cop_global_label"/>
							</span>
						</iaixsl:if>

						<section id="Progress" class="progress mb-3 py-1 py-md-0">
							
							<a class="progress__item --first --shopping-cart --link">
								<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/basket/@url"/></iaixsl:attribute>
								<div class="progress__icons">
									<div class="progress__icon --mobile d-md-none">
										<span class="progress__step">
											<strong>1</strong>
											<span>/4</span>
										</span>
										<svg class="progress__svg">
											<circle class="progress__circle_back"/>
											<circle class="progress__circle"/>
										</svg>
									</div>
									<div class="progress__icon --desktop d-none d-md-flex">
										<span class="progress__fontello"/>
									</div>
								</div>
								<div class="progress__text">
									<strong class="progress__name">Your basket</strong>
									<span class="progress__description">Value: <iaixsl:choose><iaixsl:when test="not($wholesalerPrice_order_progress = '')"><iaixsl:value-of select="basket/@cost_net_formatted"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="basket/@cost_formatted"/></iaixsl:otherwise></iaixsl:choose></span>
								</div>
							</a>
							
							<div class="progress__item --second --active --truck">
								<div class="progress__icons">
									<div class="progress__icon --mobile d-md-none">
										<span class="progress__step">
											<strong>2</strong>
											<span>/4</span>
										</span>
										<svg class="progress__svg">
											<circle class="progress__circle_back"/>
											<circle class="progress__circle"/>
										</svg>
									</div>
									<div class="progress__icon --desktop d-none d-md-flex">
										<span class="progress__fontello"/>
									</div>
								</div>
								<div class="progress__text">
									<strong class="progress__name">Delivery and payments</strong>
									<span class="progress__description">Select point of collection</span>
								</div>
							</div>
							
							<div class="progress__item --third --comment">
								<div class="progress__icons">
									<div class="progress__icon --mobile d-md-none">
										<span class="progress__step">
											<strong>3</strong>
											<span>/4</span>
										</span>
										<svg class="progress__svg">
											<circle class="progress__circle_back"/>
											<circle class="progress__circle"/>
										</svg>
									</div>
									<div class="progress__icon --desktop d-none d-md-flex">
										<span class="progress__fontello"/>
									</div>
								</div>
								<div class="progress__text">
									<strong class="progress__name">Details</strong>
									<span class="progress__description">Please check again the correctness of the order, before placing it</span>
								</div>
							</div>

							<iaixsl:choose>
								<iaixsl:when test="not(basket/@login) and not(navigation/@order_express_mode='true')">
									
									<div class="progress__item --fourth --file-text">
										<div class="progress__icons">
											<div class="progress__icon --mobile d-md-none">
												<span class="progress__step">
													<strong>4</strong>
													<span>/4</span>
												</span>
												<svg class="progress__svg">
													<circle class="progress__circle_back"/>
													<circle class="progress__circle"/>
												</svg>
											</div>
											<div class="progress__icon --desktop d-none d-md-flex">
												<span class="progress__fontello"/>
											</div>
										</div>
										<div class="progress__text">
											<strong class="progress__name">Save data</strong>
											<span class="progress__description">Remember the customer's information</span>
										</div>
									</div>
								</iaixsl:when>
								<iaixsl:otherwise>
									
									<div class="progress__item --fourth --ok">
										<div class="progress__icons">
											<div class="progress__icon --mobile d-md-none">
												<span class="progress__step">
													<strong>4</strong>
													<span>/4</span>
												</span>
												<svg class="progress__svg">
													<circle class="progress__circle_back"/>
													<circle class="progress__circle"/>
												</svg>
											</div>
											<div class="progress__icon --desktop d-none d-md-flex">
												<span class="progress__fontello"/>
											</div>
										</div>
										<div class="progress__text">
											<strong class="progress__name">Order registration</strong>
											<span class="progress__description">Order accepted</span>
										</div>
									</div>
								</iaixsl:otherwise>
							</iaixsl:choose>
						</section>
					</iaixsl:when>
				</iaixsl:choose>
				<iaixsl:choose>
					
					<iaixsl:when test="page/@type = 'order2'">
						<iaixsl:if test="$cop_global_label">
							<span class="big_label cop_global_label">
								<iaixsl:value-of select="$cop_global_label"/>
							</span>
						</iaixsl:if>

						<section id="Progress" class="progress mb-3 py-1 py-md-0">
							
							<a class="progress__item --first --shopping-cart --link">
								<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/basket/@url"/></iaixsl:attribute>
								<div class="progress__icons">
									<div class="progress__icon --mobile d-md-none">
										<span class="progress__step">
											<strong>1</strong>
											<span>/4</span>
										</span>
										<svg class="progress__svg">
											<circle class="progress__circle_back"/>
											<circle class="progress__circle"/>
										</svg>
									</div>
									<div class="progress__icon --desktop d-none d-md-flex">
										<span class="progress__fontello"/>
									</div>
								</div>
								<div class="progress__text">
									<strong class="progress__name">Your basket</strong>
									<span class="progress__description">Value: <iaixsl:choose><iaixsl:when test="not($wholesalerPrice_order_progress = '')"><iaixsl:value-of select="basket/@cost_net_formatted"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="basket/@cost_formatted"/></iaixsl:otherwise></iaixsl:choose></span>
								</div>
							</a>
							
							<a class="progress__item --second --truck --link">
								<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/order1/@url"/></iaixsl:attribute>
								<div class="progress__icons">
									<div class="progress__icon --mobile d-md-none">
										<span class="progress__step">
											<strong>2</strong>
											<span>/4</span>
										</span>
										<svg class="progress__svg">
											<circle class="progress__circle_back"/>
											<circle class="progress__circle"/>
										</svg>
									</div>
									<div class="progress__icon --desktop d-none d-md-flex">
										<span class="progress__fontello"/>
									</div>
								</div>
								<div class="progress__text">
									<strong class="progress__name">Delivery and payments</strong>
									<span class="progress__description">Select shipping and payment method</span>
								</div>
							</a>
							
							<div class="progress__item --third --active --comment">
								<div class="progress__icons">
									<div class="progress__icon --mobile d-md-none">
										<span class="progress__step">
											<strong>3</strong>
											<span>/4</span>
										</span>
										<svg class="progress__svg">
											<circle class="progress__circle_back"/>
											<circle class="progress__circle"/>
										</svg>
									</div>
									<div class="progress__icon --desktop d-none d-md-flex">
										<span class="progress__fontello"/>
									</div>
								</div>
								<div class="progress__text">
									<strong class="progress__name">Details</strong>
									<span class="progress__description">Please check again the correctness of the order, before placing it</span>
								</div>
							</div>

							<iaixsl:choose>
								<iaixsl:when test="not(basket/@login) and not(navigation/@order_express_mode='true')">
									
									<div class="progress__item --fourth --file-text">
										<div class="progress__icons">
											<div class="progress__icon --mobile d-md-none">
												<span class="progress__step">
													<strong>4</strong>
													<span>/4</span>
												</span>
												<svg class="progress__svg">
													<circle class="progress__circle_back"/>
													<circle class="progress__circle"/>
												</svg>
											</div>
											<div class="progress__icon --desktop d-none d-md-flex">
												<span class="progress__fontello"/>
											</div>
										</div>
										<div class="progress__text">
											<strong class="progress__name">Save data</strong>
											<span class="progress__description">Remember the customer's information</span>
										</div>
									</div>
								</iaixsl:when>
								<iaixsl:otherwise>
									
									<div class="progress__item --fourth --ok">
										<div class="progress__icons">
											<div class="progress__icon --mobile d-md-none">
												<span class="progress__step">
													<strong>4</strong>
													<span>/4</span>
												</span>
												<svg class="progress__svg">
													<circle class="progress__circle_back"/>
													<circle class="progress__circle"/>
												</svg>
											</div>
											<div class="progress__icon --desktop d-none d-md-flex">
												<span class="progress__fontello"/>
											</div>
										</div>
										<div class="progress__text">
											<strong class="progress__name">Order registration</strong>
											<span class="progress__description">Order accepted</span>
										</div>
									</div>
								</iaixsl:otherwise>
							</iaixsl:choose>
						</section>
					</iaixsl:when>
				</iaixsl:choose>
				<iaixsl:choose>
					
					<iaixsl:when test="page/@type = 'client-save'">
						<iaixsl:if test="$cop_global_label">
							<span class="big_label cop_global_label">
								<iaixsl:value-of select="$cop_global_label"/>
							</span>
						</iaixsl:if>

						<section id="Progress" class="progress mb-3 py-1 py-md-0">
							
							<a class="progress__item --first --shopping-cart --link">
								<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/basket/@url"/></iaixsl:attribute>
								<div class="progress__icons">
									<div class="progress__icon --mobile d-md-none">
										<span class="progress__step">
											<strong>1</strong>
											<span>/4</span>
										</span>
										<svg class="progress__svg">
											<circle class="progress__circle_back"/>
											<circle class="progress__circle"/>
										</svg>
									</div>
									<div class="progress__icon --desktop d-none d-md-flex">
										<span class="progress__fontello"/>
									</div>
								</div>
								<div class="progress__text">
									<strong class="progress__name">Your basket</strong>
									<span class="progress__description">Value: <iaixsl:choose><iaixsl:when test="not($wholesalerPrice_order_progress = '')"><iaixsl:value-of select="basket/@cost_net_formatted"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="basket/@cost_formatted"/></iaixsl:otherwise></iaixsl:choose></span>
								</div>
							</a>
							
							<a class="progress__item --second --comment --link">
								<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/order2/@url"/></iaixsl:attribute>
								<div class="progress__icons">
									<div class="progress__icon --mobile d-md-none">
										<span class="progress__step">
											<strong>2</strong>
											<span>/4</span>
										</span>
										<svg class="progress__svg">
											<circle class="progress__circle_back"/>
											<circle class="progress__circle"/>
										</svg>
									</div>
									<div class="progress__icon --desktop d-none d-md-flex">
										<span class="progress__fontello"/>
									</div>
								</div>
								<div class="progress__text">
									<strong class="progress__name">Details</strong>
									<span class="progress__description">Please check again the correctness of the order, before placing it</span>
								</div>
							</a>
							
							<div class="progress__item --third --active --file-text">
								<div class="progress__icons">
									<div class="progress__icon --mobile d-md-none">
										<span class="progress__step">
											<strong>3</strong>
											<span>/4</span>
										</span>
										<svg class="progress__svg">
											<circle class="progress__circle_back"/>
											<circle class="progress__circle"/>
										</svg>
									</div>
									<div class="progress__icon --desktop d-none d-md-flex">
										<span class="progress__fontello"/>
									</div>
								</div>
								<div class="progress__text">
									<strong class="progress__name">Save data</strong>
									<span class="progress__description">Remember the customer's information</span>
								</div>
							</div>
							
							<div class="progress__item --fourth --ok">
								<div class="progress__icons">
									<div class="progress__icon --mobile d-md-none">
										<span class="progress__step">
											<strong>4</strong>
											<span>/4</span>
										</span>
										<svg class="progress__svg">
											<circle class="progress__circle_back"/>
											<circle class="progress__circle"/>
										</svg>
									</div>
									<div class="progress__icon --desktop d-none d-md-flex">
										<span class="progress__fontello"/>
									</div>
								</div>
								<div class="progress__text">
									<strong class="progress__name">Order registration</strong>
									<span class="progress__description">Order accepted</span>
								</div>
							</div>
						</section>
					</iaixsl:when>
				</iaixsl:choose>
				<iaixsl:choose>
					
					<iaixsl:when test="page/@type = 'prepaid' and page/prepaid/details/@msg = 'order'">
						<iaixsl:if test="$cop_global_label">
							<span class="big_label cop_global_label">
								<iaixsl:value-of select="$cop_global_label"/>
							</span>
						</iaixsl:if>

						<section id="Progress" class="progress mb-3 py-1 py-md-0">
							
							<div class="progress__item --first --shopping-cart">
								<div class="progress__icons">
									<div class="progress__icon --mobile d-md-none">
										<span class="progress__step">
											<strong>1</strong>
											<span>/4</span>
										</span>
										<svg class="progress__svg">
											<circle class="progress__circle_back"/>
											<circle class="progress__circle"/>
										</svg>
									</div>
									<div class="progress__icon --desktop d-none d-md-flex">
										<span class="progress__fontello"/>
									</div>
								</div>
								<div class="progress__text">
									<strong class="progress__name">Your basket</strong>
									<span class="progress__description">Value: <iaixsl:choose><iaixsl:when test="not($wholesalerPrice_order_progress = '')"><iaixsl:value-of select="basket/@cost_net_formatted"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="basket/@cost_formatted"/></iaixsl:otherwise></iaixsl:choose></span>
								</div>
							</div>
							
							<div class="progress__item --second --truck">
								<div class="progress__icons">
									<div class="progress__icon --mobile d-md-none">
										<span class="progress__step">
											<strong>2</strong>
											<span>/4</span>
										</span>
										<svg class="progress__svg">
											<circle class="progress__circle_back"/>
											<circle class="progress__circle"/>
										</svg>
									</div>
									<div class="progress__icon --desktop d-none d-md-flex">
										<span class="progress__fontello"/>
									</div>
								</div>
								<div class="progress__text">
									<strong class="progress__name">Delivery and payments</strong>
									<span class="progress__description">Select shipping and payment method</span>
								</div>
							</div>
							
							<div class="progress__item --third --comment">
								<div class="progress__icons">
									<div class="progress__icon --mobile d-md-none">
										<span class="progress__step">
											<strong>3</strong>
											<span>/4</span>
										</span>
										<svg class="progress__svg">
											<circle class="progress__circle_back"/>
											<circle class="progress__circle"/>
										</svg>
									</div>
									<div class="progress__icon --desktop d-none d-md-flex">
										<span class="progress__fontello"/>
									</div>
								</div>
								<div class="progress__text">
									<strong class="progress__name">Details</strong>
									<span class="progress__description">Please check again the correctness of the order, before placing it</span>
								</div>
							</div>
							
							<div class="progress__item --fourth --active --ok">
								<div class="progress__icons">
									<div class="progress__icon --mobile d-md-none">
										<span class="progress__step">
											<strong>4</strong>
											<span>/4</span>
										</span>
										<svg class="progress__svg">
											<circle class="progress__circle_back"/>
											<circle class="progress__circle"/>
										</svg>
									</div>
									<div class="progress__icon --desktop d-none d-md-flex">
										<span class="progress__fontello"/>
									</div>
								</div>
								<div class="progress__text">
									<strong class="progress__name">Order placed</strong>
									<span class="progress__description">Order status: 
										<iaixsl:choose>
											<iaixsl:when test="(page/prepaid/details/@wykonane = 'n')">accepted</iaixsl:when>
											<iaixsl:when test="(page/prepaid/details/@wykonane = 't')">sent</iaixsl:when>
											<iaixsl:when test="(page/prepaid/details/@wykonane = 'i')">Order rejected</iaixsl:when>
											<iaixsl:when test="(page/prepaid/details/@wykonane = 's')">canceled</iaixsl:when>
											<iaixsl:when test="(page/prepaid/details/@wykonane = 'o')">in progress</iaixsl:when>
											<iaixsl:when test="(page/prepaid/details/@wykonane = 'p')">ready</iaixsl:when>
											<iaixsl:when test="(page/prepaid/details/@wykonane = 'h')">on hold</iaixsl:when>
											<iaixsl:when test="(page/prepaid/details/@wykonane = 'w')">awaiting payment</iaixsl:when>
											<iaixsl:when test="(page/prepaid/details/@wykonane = 'd')">awaiting delivery</iaixsl:when>
											<iaixsl:when test="(page/prepaid/details/@wykonane = 'z')">return</iaixsl:when>
											<iaixsl:when test="(page/prepaid/details/@wykonane = 'k')">canceled</iaixsl:when>
											<iaixsl:when test="(page/prepaid/details/@wykonane = 'r')">complaint</iaixsl:when>
											<iaixsl:when test="(page/prepaid/details/@wykonane = 'j')">merged</iaixsl:when>
											<iaixsl:when test="(page/prepaid/details/@wykonane = 'l')">lost</iaixsl:when>
											<iaixsl:when test="(page/prepaid/details/@wykonane = 'a')">in progress</iaixsl:when>
											<iaixsl:when test="(page/prepaid/details/@wykonane = 'b')">packed</iaixsl:when>
										</iaixsl:choose>
									</span>
								</div>
							</div>
						</section>
					</iaixsl:when>
				</iaixsl:choose>
				<iaixsl:choose>
					
					<iaixsl:when test="(page/@type = 'order-payment') or (page/@type = 'order-newpayment')">
						<iaixsl:if test="$cop_global_label">
							<span class="big_label cop_global_label">
								<iaixsl:value-of select="$cop_global_label"/>
							</span>
						</iaixsl:if>

						<section id="Progress" class="progress mb-3 py-1 py-md-0">
							
							<div class="progress__item --first --shopping-cart">
								<div class="progress__icons">
									<div class="progress__icon --mobile d-md-none">
										<span class="progress__step">
											<strong>1</strong>
											<span>/4</span>
										</span>
										<svg class="progress__svg">
											<circle class="progress__circle_back"/>
											<circle class="progress__circle"/>
										</svg>
									</div>
									<div class="progress__icon --desktop d-none d-md-flex">
										<span class="progress__fontello"/>
									</div>
								</div>
								<div class="progress__text">
									<strong class="progress__name">Your basket</strong>
									<span class="progress__description">Value: <iaixsl:choose><iaixsl:when test="not($wholesalerPrice_order_progress = '')"><iaixsl:value-of select="basket/@cost_net_formatted"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="basket/@cost_formatted"/></iaixsl:otherwise></iaixsl:choose></span>
								</div>
							</div>
							
							<div class="progress__item --second --truck">
								<div class="progress__icons">
									<div class="progress__icon --mobile d-md-none">
										<span class="progress__step">
											<strong>2</strong>
											<span>/4</span>
										</span>
										<svg class="progress__svg">
											<circle class="progress__circle_back"/>
											<circle class="progress__circle"/>
										</svg>
									</div>
									<div class="progress__icon --desktop d-none d-md-flex">
										<span class="progress__fontello"/>
									</div>
								</div>
								<div class="progress__text">
									<strong class="progress__name">Delivery and payments</strong>
									<span class="progress__description">Select shipping and payment method</span>
								</div>
							</div>
							
							<div class="progress__item --third --comment">
								<div class="progress__icons">
									<div class="progress__icon --mobile d-md-none">
										<span class="progress__step">
											<strong>3</strong>
											<span>/4</span>
										</span>
										<svg class="progress__svg">
											<circle class="progress__circle_back"/>
											<circle class="progress__circle"/>
										</svg>
									</div>
									<div class="progress__icon --desktop d-none d-md-flex">
										<span class="progress__fontello"/>
									</div>
								</div>
								<div class="progress__text">
									<strong class="progress__name">Details</strong>
									<span class="progress__description">Please check again the correctness of the order, before placing it</span>
								</div>
							</div>
							
							<div class="progress__item --fourth --active --ok">
								<div class="progress__icons">
									<div class="progress__icon --mobile d-md-none">
										<span class="progress__step">
											<strong>4</strong>
											<span>/4</span>
										</span>
										<svg class="progress__svg">
											<circle class="progress__circle_back"/>
											<circle class="progress__circle"/>
										</svg>
									</div>
									<div class="progress__icon --desktop d-none d-md-flex">
										<span class="progress__fontello"/>
									</div>
								</div>
								<div class="progress__text">
									<strong class="progress__name">Order placed</strong>
									<span class="progress__description">Order status: awaiting payment</span>
								</div>
							</div>
						</section>
					</iaixsl:when>
				</iaixsl:choose>
			</iaixsl:if>
		<!-- (menu_messages, 60dd8eb71231d1.14665052.7)-->

        <iaixsl:variable name="rebates_code_used">This discount code has already been used.</iaixsl:variable>

        <iaixsl:variable name="change_success">Changes have been saved.</iaixsl:variable>

        <iaixsl:variable name="change_success_despite_no_change">The form has been saved however, no changes had been introduced by you. </iaixsl:variable>


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


                                <iaixsl:when test="@type='file_upload_invalid_type'">File cannot be uploaded <span class="invalidFileName"><iaixsl:value-of select="@value"/></span>, because its type of files is invalid.</iaixsl:when>
                                <iaixsl:when test="@type='file_upload_invalid_extension'">File cannot be uploaded <span class="invalidFileName"><iaixsl:value-of select="@value"/></span>, because its type of files is invalid.</iaixsl:when>
                                <iaixsl:when test="@type='file_upload_size_exceeded'">File cannot be uploaded <span class="invalidFileName"><iaixsl:value-of select="@value"/></span>, because it is larger than the allowed size of 10MB.</iaixsl:when>
                                <iaixsl:when test="@type='file_uploaded_remove_fail'">An error has occurred when uploading a file <span class="invalidFileName"><iaixsl:value-of select="@value"/></span>.</iaixsl:when>


                                <iaixsl:when test="@type='rebates_code_expired'">Indicated discount code expired and it is inactive.</iaixsl:when>
                                <iaixsl:when test="@type='rebates_code_notbegun'">Indicated discount code is not active. This special offer has not yet started!.</iaixsl:when>

                               <iaixsl:when test="@type='order_minimal_wholesale_blocked'">Minimal value of a wholesale order is: <iaixsl:if test="$signbeforeprice = 'true'">
                                            <iaixsl:value-of select="/shop/currency/@name"/>
                                            <iaixsl:value-of select="$signbetweenpricecurrency"/>
                                        </iaixsl:if>
                                        <iaixsl:value-of select="@value"/>
                                        <iaixsl:if test="$signbeforeprice = 'false'">
                                            <iaixsl:value-of select="$signbetweenpricecurrency"/>
                                            <iaixsl:value-of select="/shop/currency/@name"/>
                                        </iaixsl:if>
                                </iaixsl:when>

                            <iaixsl:when test="@type='order_minimal_wholesale_changed'">Despite you are a wholesaler, you see retail prices in your order summary. It means that the minimal value of a wholesale order has not been reached. If you place an order based on your current basket content, it will be a retail order.</iaixsl:when>




                                <iaixsl:when test="@type='openid_invalid_authorization'">Authorization error.</iaixsl:when>
                                <iaixsl:when test="@type='suggest_sent'">An invitation to visit the on-line store has been sent to <iaixsl:value-of select="@value"/>.</iaixsl:when>
                                <iaixsl:when test="@type='search_to_many_products'">Too many items found. Use a search tool to narrow the search results.</iaixsl:when>
                                <iaixsl:when test="@type='search_products_not_found'">Szukany produkt nie został znaleziony. Skorzystaj z <a href="/searching.php" title="Kliknij, aby przejść do wyszukiwarki zaawansowanej">search</a>.</iaixsl:when>
                                <iaixsl:when test="@type='search_text_to_short'">The entered text is too short. Try to type a longer text or use the search tool.</iaixsl:when>
                                <iaixsl:when test="@type='login taken'">Provided login is already registered. Please, modify your login by adding numbers or type a new one.</iaixsl:when>
                                <iaixsl:when test="@type='account_not_added'">An error has occurred and an account has not been added - try again later</iaixsl:when>
                                <iaixsl:when test="@type='exists such account'">An account with similar information already exists. If you have created an account, but you do not remember your password, click <a href="/password-recover.php">here</a></iaixsl:when>
                                <iaixsl:when test="@type='deliv_addr_not_deleted'">Indicated delivery address cannot be removed.</iaixsl:when>
                                <iaixsl:when test="@type='deliv_addr_not_selected'">Indicated delivery address cannot be the a default one.</iaixsl:when>
                                <iaixsl:when test="@type='no login'">You did not enter the login.</iaixsl:when>
                                <iaixsl:when test="@type='incorect login'">Invalid login. The login must have a minimum of 3, and a maximum of 40 characters (only letters or numbers).</iaixsl:when>
                                <iaixsl:when test="@type='no password'">You did not enter the password.</iaixsl:when>
                                <iaixsl:when test="@type='password to short'">A password needs to contain at least 6 characters and not more than 15.</iaixsl:when>


                                <iaixsl:when test="@type='password_to_long'">A password needs to contain at least 6 characters and not more than 15.</iaixsl:when>


                                <iaixsl:when test="@type='login equals password'">A password must be different from a login.</iaixsl:when>
                                <iaixsl:when test="@type='not equal passwords'">A password and the password confirmation are different.</iaixsl:when>
                                <iaixsl:when test="@type='no firstname'">The entered first name is too short.</iaixsl:when>
                                <iaixsl:when test="@type='no name'">Missing first name or surname.</iaixsl:when>
                                <iaixsl:when test="@type='birth_date'">Birth date is entered in a wrong format or it contains incorrect value.</iaixsl:when>
                                <iaixsl:when test="@type='incorect email'">Invalid e-mail address.</iaixsl:when>
                                <iaixsl:when test="@type='incorect nip'">When entering VAT Number make sure that you use the appropriate format for the selected country, e.g. XXXXXXXXXX for Polish VAT Number or PLXXXXXXXXXX for VAT Number EU.</iaixsl:when>

                                <iaixsl:when test="@type='no firmname'">Invalid company name.</iaixsl:when>

                                <iaixsl:when test="@type='incorrect region'">Invalid area name.</iaixsl:when>
                                <iaixsl:when test="@type='no city'">Invalid city name.</iaixsl:when>
                                <iaixsl:when test="@type='no street'">Invalid address.</iaixsl:when>

                               <iaixsl:when test="@type='no_street_number'">Invalid address.</iaixsl:when>


                                <iaixsl:when test="@type='incorect phone'">Invalid phone number.</iaixsl:when>
                                <iaixsl:when test="@type='incorect spare phone'">Invalid additional phone number.</iaixsl:when>
                                <iaixsl:when test="@type='incorect zipcode'">Invalid postal code.</iaixsl:when>
                                <iaixsl:when test="@type='double_address_error'">If the delivery address is to be the same as the address of the customer, select the appropriate option.</iaixsl:when>
                                <iaixsl:when test="@type='no delivery firstname'">Customer first name is too short.</iaixsl:when>
                                <iaixsl:when test="@type='no delivery lastname'">Customer surname is too short.</iaixsl:when>
                                <iaixsl:when test="@type='no delivery city'">Customer city name is invalid.</iaixsl:when>
                                <iaixsl:when test="@type='no delivery street'">Customer address is invalid.</iaixsl:when>
                                <iaixsl:when test="@type='incorect delivery region'">Region selected by a customer is invalid.</iaixsl:when>
                                <iaixsl:when test="@type='incorect delivery zipcode'">Customer postal code is invalid.</iaixsl:when>
                                <iaixsl:when test="@type='order_newpayment_hhtransfer_error'">Errors occurred during payment with loyalty points.</iaixsl:when>
                                <iaixsl:when test="@type='order_newpayment_voucher_error'">Voucher payment errors occurred.
                                    <iaixsl:if test="@value='v1'">This voucher is not valid in this shop.</iaixsl:if>
                                    <iaixsl:if test="@value='v2'">Voucher number is invalid. There is no voucher of this ID. Please try to re-enter the ID, making sure it is correct.</iaixsl:if>
                                    <iaixsl:if test="@value='v3'">This voucher is blocked.</iaixsl:if>
                                    <iaixsl:if test="@value='v4'">This voucher has been already used.</iaixsl:if>
                                    <iaixsl:if test="@value='v5'">This voucher has expired.</iaixsl:if>
                                    <iaixsl:if test="@value='v7'">Voucher of the entered ID does not exist. Try to re-enter it.</iaixsl:if>
                                    <iaixsl:if test="@value='v8'">No voucher ID entered.</iaixsl:if>
                                </iaixsl:when>
                                <iaixsl:when test="@type='order_newpayment_incorrect_paymentid'">Errors occurred – select diferent payment method.</iaixsl:when>
                                <iaixsl:when test="@type='order_newpayment_error'">Payment errors occurred. Please wait and try again later.</iaixsl:when>
                                <iaixsl:when test="@type='order_newpayment_points_error'">You do not have enough loyalty points to pay for this order – please select different payment method.</iaixsl:when>

                                <iaixsl:when test="@type='filter_products_not_found'">No results matching your search criteria were found. Try to change filters parameters.</iaixsl:when>
                                <iaixsl:when test="@type='questionnaire_error'">An unknown error has occurred. The survey has not been sent.</iaixsl:when>
                                <iaixsl:when test="@type='questionnaire_sent'">The survey has been sent. Thank You!</iaixsl:when>

                                <iaixsl:when test="@type='orderopen_not_found'">Invalid data entered. Try to find the phone number or e-mail address you have provided during the orderd process or check if the provided order ID is correct. If you still cannot pay via this page, please <a href="/contact.php">contact us</a>.</iaixsl:when>

                                <iaixsl:when test="@type='order_nonstandard_inactive'">Sorry, but we have not predicted shipping costs for this type of order. However, we wish to accept your order. Therefore, please contact <a href="/contact.php">our support department</a> in order to determine the possibility of accepting and completing your order.</iaixsl:when>
                                <iaixsl:when test="@type='order_nonstandard_inactive_worth'">Sorry, but we have not predicted that the order with this value would occur. However, we wish to accept your order. Therefore, please contact <a href="/contact.php">our support department</a> in order to determine the possibility of accepting and completing your order.</iaixsl:when>
                                <iaixsl:when test="@type='order_nonstandard_inactive_weight'">Sorry, but we have not predicted that the order with this weight would occur. However, we wish to accept your order. Therefore, please contact <a href="/contact.php">our support department</a> in order to determine the possibility of accepting and completing your order.</iaixsl:when>
                                

                                <iaixsl:when test="@type='no-auction-info'">
                                    No information about an auction.
                                </iaixsl:when>
                                <iaixsl:when test="@type='no-auction-account'">
                                    No information about an account.
                                </iaixsl:when>
                                <iaixsl:when test="@type='no-allegro-item'">
                                    No information about an item.
                                </iaixsl:when>
                                <iaixsl:when test="@type='no-buyer-info'">
                                    No information about a buyer.
                                </iaixsl:when>
                                <iaixsl:when test="@type='no-seller-info'">
                                    No information about a seller.
                                </iaixsl:when>
                                <iaixsl:when test="@type='no-shipping'">
                                    No information about available shipment types.
                                </iaixsl:when>
                                <iaixsl:when test="@type='no-order'">
                                    No information about the order.
                                </iaixsl:when>
                                <iaixsl:when test="@type='less_del'">
                                    Deleting all items is not possible. The order must contain at least as many items as you have bought at the auction. 
                                </iaixsl:when>
                                <iaixsl:when test="@type='cant_del'">
                                    You cannot remove products from the current order, because their number equals the auctioned quantity.
                                </iaixsl:when>
                                <iaixsl:when test="@type='rebates_code_ok'">
                                    The provided discount code is valid.
                                </iaixsl:when>
                                <iaixsl:when test="@type='rebates_code_undefined'">
                                    The provided discount code is invalid.
                                </iaixsl:when>

                                <iaixsl:when test="@type='rebates_code_used' and $rebates_code_used">
                                     <iaixsl:value-of select="$rebates_code_used"/>
                                </iaixsl:when>

                                <iaixsl:when test="@type='rebates_code_begins'">
                                    Special offer associated with this discount code has not yet started.
                                </iaixsl:when>
                                <iaixsl:when test="@type='rebates_code_expires'">
                                    Special offer for this discount code has ended.
                                </iaixsl:when>
                                <iaixsl:when test="@type='membershipcard_undefined'">
                                    The card number is invalid. Try again or <a href="/contact.php">please contact the shop staff</a>.
                                </iaixsl:when>
                                <iaixsl:when test="@type='membershipcard_expires'">
                                    The card has expired.
                                </iaixsl:when>
                                <iaixsl:when test="@type='membershipcard_blocked'">
                                    This card has been blocked. <a href="/contact.php">Contact the shop staff</a>.
                                </iaixsl:when>
                                <iaixsl:when test="@type='membershipcard_ok'">
                                    Card has been activated.
                                </iaixsl:when>
                                <iaixsl:when test="@type='client_wholesale_application_error'">
                                    An error has occurred during the registration form transmission.
                                </iaixsl:when>
                                <iaixsl:when test="@type='client_wholesale_registered'">
                                    Your account has been registered as a wholesaler type. You cannot submit another registration form.
                                </iaixsl:when>
                                <iaixsl:when test="@type='ordered_empty'">
                                    List of purchased items is empty.
                                </iaixsl:when>

                                <iaixsl:when test="@type='shipping_error'">
                                    We do not ship to your country.
                                </iaixsl:when>
                                <iaixsl:when test="@type='basket_empty'">
                                    Your basket is empty.
                                </iaixsl:when>
                                <iaixsl:when test="@type='order_minimum'">
                                    Minimal order value too low.
                                    <iaixsl:if test="@value&gt;0">
                                        Minimum value of the order is 
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
                                    The value of the order is too high.
                                    <iaixsl:if test="@value&gt;0">
                                        Maximum value of the order is                <iaixsl:if test="$signbeforeprice = 'true'">
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
                                    The selected shipping service requires a phone number and e-mail address. To enter this information, please use 
                                    <a>
                                        <iaixsl:attribute name="href"><iaixsl:value-of select="@value"/></iaixsl:attribute>
                                        <iaixsl:attribute name="title">Click here to edit your account details and enter necessary information.</iaixsl:attribute>
                                        customer details edition form
                                    </a>
                                    .
                                </iaixsl:when>
                                <iaixsl:when test="@type='noPickupSites'">
                                    The parcel locker service is currently unavailable. Please 
                                    <a>
                                        <iaixsl:attribute name="href"><iaixsl:value-of select="@value"/></iaixsl:attribute>
                                        <iaixsl:attribute name="title">Click here to return to a shipping method selection.</iaixsl:attribute>
                                        change of a shipping method.
                                    </a>
                                    .
                                </iaixsl:when>
                                <iaixsl:when test="@type='noPickupStocks'">
                                    Personal collection is unavailable at this moment. Please 
                                    <a>
                                        <iaixsl:attribute name="href"><iaixsl:value-of select="@value"/></iaixsl:attribute>
                                        <iaixsl:attribute name="title">Click here to return to a shipping method selection.</iaixsl:attribute>
                                        change of a shipping method.
                                    </a>
                                    .
                                </iaixsl:when>

                                <iaixsl:when test="@type='rma_edit_error'">An error has occurred when filling the complaint form.</iaixsl:when>

                                <iaixsl:when test="@type='onlyHttps'">Payment with credit card can be made only with use of the secured connection. Check if the shop address is preceded by HTTPS or contact the shop staff.</iaixsl:when>

                                <iaixsl:when test="@type='login_unavailable'">Cannot be connected with the provided account from a different service as the provided account is already connected with a different customer account in our shop. You can log out from this account and sign in again with information from the external service<iaixsl:value-of select="@value"/>.</iaixsl:when>

                                <iaixsl:when test="@type='token_expired'">The link to access your data has now expired. You can log on to another account or generate a new link using the option <a class="password_reminder_signin" href="#signin-form_radio2">I forgot my login or password.</a></iaixsl:when>

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

                                <iaixsl:when test="@type='affiliate_not_active'">You are not signed in or the Affiliate Program is not activated in your on-line store.</iaixsl:when>
                                <iaixsl:when test="@type='deliv_addr_deleted'">The indicated delivery address has been removed.</iaixsl:when>
                                <iaixsl:when test="@type='affiliate_off'">You have not activated the Affiliate Program. If You want to activate it, please contact our support department.</iaixsl:when>
                                <iaixsl:when test="@type='affiliate_blocked'">Your Affiliate Program has been blocked.</iaixsl:when>
                                <iaixsl:when test="@type='deliv_addr_selected'">The indicated delivery address has been set as the default.</iaixsl:when>
                                <iaixsl:when test="@type='rebates_code_ok'">The provided discount code is valid.</iaixsl:when>
                                <iaixsl:when test="@type='client_wholesale_application_added'">Your request has been registered.</iaixsl:when>
                                <iaixsl:when test="@type='login_connected'">Account in the store has been successfully linked to the account in the <iaixsl:value-of select="@value"/>.</iaixsl:when>
                                <iaixsl:when test="@type='login_disconnected'">The account has been sparated from <iaixsl:value-of select="@value"/>.</iaixsl:when>
                                <iaixsl:when test="@type='login_unavailable'">Cannot be connected with the provided account from a different service as the provided account is already connected with a different customer account in our shop. You can log out from this account and sign in again with information from the external service<iaixsl:value-of select="@value"/>.</iaixsl:when>
                                <iaixsl:when test="@type='openid_login_canceled'">Loging in canceled.</iaixsl:when>
                                <iaixsl:when test="@type='client_wholesale_application_changed'">Your request has been modified.</iaixsl:when>
                                <iaixsl:when test="@type='wisheslist_empty'">Your shopping list is empty.</iaixsl:when>
                                <iaixsl:when test="@type='products_requests_empty'">Your list of searched products is empty.</iaixsl:when>
                                <iaixsl:when test="@type='products_requests_added'">Request of a searched product has been sent. You will receive an e-mail containing information on potential availability of this product.</iaixsl:when>
                                <iaixsl:when test="@type='products_requests_removed'">Request of a searched product has been removed.</iaixsl:when>
                                <iaixsl:when test="@type='rma_add'">Complaint has been added.</iaixsl:when>
                                <iaixsl:when test="@type='return_add'">A return notification has been added.</iaixsl:when>
                                <iaixsl:when test="@type='return_edit'">Changes in the return have been saved</iaixsl:when>
                                <iaixsl:when test="@type='rma_edit'">Changes in the complaint have been saved.</iaixsl:when>
                                <iaixsl:when test="@type='order_nonstandard_reason'">Sorry but we cannot calculate the default costs of delivery. You can still continue placing the order, however the total cost will not be displayed. Delivery cost will be calculated individually by our staff after the order is be accepted. Afterwards, we will contact you to confirm the order. If this solution is unsatisfactory, <a href="/contact.php">contact us</a> in order to obtain more information about delivery costs or possibility of placing an order individually.</iaixsl:when>
                                <iaixsl:when test="@type='order_nonstandard_reason_worth'">Przepraszamy, ale nie zdefiniowaliśmy standardowego kosztu dostawy dla takiej wartości zamówienia. Możesz kontynuować składanie zamówienia, jednak nie zostanie w tej chwili podany wiążący nas koszt dostawy. Zostanie on ustalony indywidualnie przez naszą obsługę po przyjęciu zamówienia, po czym skontaktujemy się z Tobą w celu jego potwierdzenia. Jeżeli takie rozwiązanie nie odpowiada Ci, <a href="/contact.php">contact us</a> in order to obtain more information about delivery costs or possibility of placing an order individually.</iaixsl:when>
                                <iaixsl:when test="@type='order_nonstandard_reason_weight'">Przepraszamy, ale nie zdefiniowaliśmy standardowego kosztu dostawy dla takiej wagi zamówienia. Możesz kontynuować składanie zamówienia, jednak nie zostanie w tej chwili podany wiążący nas koszt dostawy. Zostanie on ustalony indywidualnie przez naszą obsługę po przyjęciu zamówienia, po czym skontaktujemy się z Tobą w celu jego potwierdzenia. Jeżeli takie rozwiązanie nie odpowiada Ci, <a href="/contact.php">contact us</a> in order to obtain more information about delivery costs or possibility of placing an order individually.</iaixsl:when>
                                <iaixsl:when test="@type='mailing_addsuccess'">E-mail address has been added to a mailing list.</iaixsl:when>
                                <iaixsl:when test="@type='mailing_removesuccess'">E-mail address has been removed from mailing list.</iaixsl:when>
                                <iaixsl:when test="@type = 'mailing_nosuchemail'">We have not found this e-mail address on our mailing list.</iaixsl:when>
                                <iaixsl:when test="@type = 'mailing_sendingconfirm'">Confirmation of our mailing list modifications has been sent to the specified e-mail address. Check your inbox and follow the instructions from message.</iaixsl:when>
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
                        You are editing the order no <iaixsl:value-of select="/shop/order_edit/@order_number"/>. Introduce changes to the order or get back to 
                        <a>
                            <iaixsl:attribute name="href"><iaixsl:value-of select="/shop/order_edit/@cancel_lik"/></iaixsl:attribute>
                            order details</a>.
                    </p>
                </div>
            </div>
        </iaixsl:if>


         <iaixsl:if test="/shop/return_edit/@return_id">
            <div class="menu_messages_message" id="menu_messages_warning">
                <div class="menu_messages_message_sub">
                    <p>
                        You are editing the return no <iaixsl:value-of select="/shop/return_edit/@return_id"/>. Introduce changes to the return or 
                        <a>
                            <iaixsl:attribute name="href"><iaixsl:value-of select="/shop/return_edit/@cancel_link"/></iaixsl:attribute>
                             go back to a return details</a>.
                    </p>
                </div>
            </div>
        </iaixsl:if>

        <!-- (order1_cms, 60dd8e761ab4d1.60314902.2)-->
    <iaixsl:if test="page/order1/text/body">
        <div class="n55417">
            <div class="n55417_sub">
              <iaixsl:attribute name="class">n55417_sub cm</iaixsl:attribute>
                    <iaixsl:value-of disable-output-escaping="yes" select="page/order1/text/body"/>
                </div>
       
        </div>
   </iaixsl:if>
   <!-- (order1, 61f913c6a35b12.52928924.7)-->
<iaixsl:variable name="idoPay">1</iaixsl:variable>
	
	<form method="POST" class="order">
		<iaixsl:attribute name="action">
			<iaixsl:value-of select="page/order1/formaction"/><iaixsl:if test="(page/order1/formaction = 'order2.php')">?preview=true</iaixsl:if>
		</iaixsl:attribute>

		<div class="row">
			
			<div class="col-12 col-md-6">
				<section class="order__payments mb-3 mb-md-5">
					<div class="headline">
						Select the most convenient payment method
					</div>
					<iaixsl:if test="/shop/client_data/association/@permsPayment = 'n'">
						<span>
							
						</span>
					</iaixsl:if>
					<iaixsl:if test="/shop/page/order1/prepaid_methods/item or count(/shop/page/order1/shipping/delivery[@type = 'dvp']) &gt; 0">
						<div class="order__payments_section">
							
							<iaixsl:for-each select="/shop/page/order1/prepaid_methods/item">
								<iaixsl:variable name="groupID"><iaixsl:value-of select="@group"/></iaixsl:variable>
								<iaixsl:variable name="groupName"><iaixsl:value-of select="/shop/page/order1/groupList/item[@id = $groupID]/@name"/></iaixsl:variable>
								<iaixsl:if test="not($groupID = preceding-sibling::item[not(@method_as_group = 'true')]/@group) or @method_as_group = 'true'">
									<div class="order__payments_group f-group --radio mb-0 px-2  px-sm-3">
										<iaixsl:choose>
											<iaixsl:when test="@method_as_group = 'true' or not(/shop/page/order1/groupList/item[@id = $groupID])">
												<iaixsl:attribute name="id">single_group_<iaixsl:value-of select="@id"/></iaixsl:attribute>
											</iaixsl:when>
											<iaixsl:otherwise>
												<iaixsl:attribute name="id"><iaixsl:value-of select="$groupID"/>_payment</iaixsl:attribute>
											</iaixsl:otherwise>
										</iaixsl:choose>

										<input type="radio" name="payform_id" class="order__radio d-none">
											<iaixsl:attribute name="value"><iaixsl:value-of select="@id"/></iaixsl:attribute>
											<iaixsl:attribute name="id">payform_<iaixsl:value-of select="@id"/></iaixsl:attribute>
											<iaixsl:if test="not(/shop/page/order1/balance/@active='y' and /shop/page/order1/balance/@onlyPrepaid='y')">
												<iaixsl:if test="(/shop/page/order1/groupList/item[@id = $groupID]/@checked = 'true' or (not(/shop/page/order1/groupList/item[@checked = 'true']) and @checked = 'true')) and not(/shop/page/order1/shipping/delivery[@type = 'dvp' and @checked = 'true'])">
													<iaixsl:attribute name="checked">checked</iaixsl:attribute>
												</iaixsl:if>
											</iaixsl:if>
										</input>

										<input type="radio" name="selected_group_only" class="order__radio_payments f-control">
											<iaixsl:attribute name="value"><iaixsl:choose><iaixsl:when test="@method_as_group = 'true' or not(/shop/page/order1/groupList/item[@id = $groupID])"><iaixsl:value-of select="@id"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="$groupID"/></iaixsl:otherwise></iaixsl:choose></iaixsl:attribute>
											<iaixsl:attribute name="id"><iaixsl:choose><iaixsl:when test="@method_as_group = 'true' or not(/shop/page/order1/groupList/item[@id = $groupID])"><iaixsl:value-of select="@id"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="$groupID"/></iaixsl:otherwise></iaixsl:choose>_input</iaixsl:attribute>
											<iaixsl:if test="not(/shop/page/order1/balance/@active='y' and /shop/page/order1/balance/@onlyPrepaid='y')">
												<iaixsl:if test="(/shop/page/order1/groupList/item[@id = $groupID]/@checked = 'true' or (not(/shop/page/order1/groupList/item[@checked = 'true']) and @checked = 'true')) and not(/shop/page/order1/shipping/delivery[@type = 'dvp' and @checked = 'true'])">
														<iaixsl:attribute name="checked">checked</iaixsl:attribute>
												</iaixsl:if>
											</iaixsl:if>
										</input>

										<label class="order__payments_label f-label d-flex align-items-center pr-0 py-2">
											<iaixsl:attribute name="for">payform_<iaixsl:value-of select="@id"/></iaixsl:attribute>
											<span class="order__payments_names d-flex flex-column mr-2 align-items-md-center flex-md-row">
												<iaixsl:choose>
													<iaixsl:when test="@method_as_group = 'true' or (not(/shop/page/order1/groupList/item[@id = $groupID]) and not(@id = '153'))">
														<iaixsl:choose>
															<iaixsl:when test="@id = '2'">
																<strong class="order__payments_name d-block">Voucher</strong>
															</iaixsl:when>
															<iaixsl:when test="@id = '190'">
																<strong class="order__payments_name d-block">Gift card</strong>
															</iaixsl:when>
															<iaixsl:otherwise>
																<strong class="order__payments_name d-block"><iaixsl:value-of disable-output-escaping="yes" select="@name"/></strong>
															</iaixsl:otherwise>
														</iaixsl:choose>
													</iaixsl:when>
													<iaixsl:when test="$groupID = 'simple_transfer'">
														<strong class="order__payments_name d-block">Bank transfer</strong>
													</iaixsl:when>
													<iaixsl:when test="$groupID = 'transfer'">
														<strong class="order__payments_name d-block">Online bank transfer</strong>
													</iaixsl:when>
													<iaixsl:when test="$groupID = 'card'">
														<strong class="order__payments_name d-block">Payment card</strong>
													</iaixsl:when>
													<iaixsl:when test="$groupID = 'installment'">
														<strong class="order__payments_name d-block">Installment payment</strong>
													</iaixsl:when>
													<iaixsl:when test="$groupID = 'others'">
														<strong class="order__payments_name d-block">Vouchers, gift cards</strong>
													</iaixsl:when>
													<iaixsl:when test="@id = '153'">
														<strong class="order__payments_name d-block">Trade credit payment</strong>
													</iaixsl:when>
													<iaixsl:otherwise>
														<strong class="order__payments_name d-block"><iaixsl:value-of disable-output-escaping="yes" select="$groupName"/></strong>
													</iaixsl:otherwise>
												</iaixsl:choose>
												<iaixsl:if test="@id = '153'">
													<span class="order__payments_desc mt-1">Payment via bank transfer after delivery</span>
												</iaixsl:if>
											</span>
											<span class="order__payments_sub d-flex flex-row align-items-center justify-content-end">
												<span class="order__payments_icons d-flex justify-content-center flex-wrap align-items-center">
													<iaixsl:attribute name="type"><iaixsl:value-of select="$groupID"/></iaixsl:attribute>
													<iaixsl:choose>
														<iaixsl:when test="@method_as_group = 'true' and (@icon != '' or @icon_svg != '')">
															<img class="order__payment_icon"><iaixsl:attribute name="src"><iaixsl:choose><iaixsl:when test="@icon_svg != ''"><iaixsl:value-of select="@icon_svg"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@icon"/></iaixsl:otherwise></iaixsl:choose></iaixsl:attribute><iaixsl:attribute name="alt"><iaixsl:value-of select="@name"/></iaixsl:attribute></img>
														</iaixsl:when>
														<iaixsl:when test="$groupID = 'card'">
															<iaixsl:if test="@icon != '' or @icon_svg != ''">
																<span class="order__ingroup_payment_icon">
																	<img class="order__payment_icon"><iaixsl:attribute name="src"><iaixsl:choose><iaixsl:when test="@icon_svg != ''"><iaixsl:value-of select="@icon_svg"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@icon"/></iaixsl:otherwise></iaixsl:choose></iaixsl:attribute><iaixsl:attribute name="alt"><iaixsl:value-of select="@name"/></iaixsl:attribute></img>
																</span>
															</iaixsl:if>
															<iaixsl:if test="$groupID = following-sibling::item/@group">
																<iaixsl:for-each select="following-sibling::item[@group = $groupID][not(position() &gt; 5)][not(@method_as_group = 'true')]">
																	<iaixsl:if test="@icon != '' or @icon_svg != ''">
																		<span class="order__ingroup_payment_icon">
																			<img class="order__payment_icon"><iaixsl:attribute name="src"><iaixsl:choose><iaixsl:when test="@icon_svg != ''"><iaixsl:value-of select="@icon_svg"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@icon"/></iaixsl:otherwise></iaixsl:choose></iaixsl:attribute><iaixsl:attribute name="alt"><iaixsl:value-of select="@name"/></iaixsl:attribute></img>
																		</span>
																	</iaixsl:if>
																</iaixsl:for-each>
															</iaixsl:if>
														</iaixsl:when>
														<iaixsl:when test="$groupID = 'transfer'">
															<img class="order__payments_img">
																<iaixsl:attribute name="alt"><iaixsl:value-of select="$groupName"/></iaixsl:attribute>
																<iaixsl:attribute name="src">data:image/svg+xml,%3Csvg xmlns=&apos;http://www.w3.org/2000/svg&apos; id=&apos;Component_1_1&apos; data-name=&apos;Component 1 – 1&apos; width=&apos;26&apos; height=&apos;34&apos; viewBox=&apos;0 0 26 34&apos;%3E%3Cpath id=&apos;Path_12&apos; data-name=&apos;Path 12&apos; d=&apos;M25.768,20.77V0H0V20.771H9.446v.85a2.35,2.35,0,0,1-2.36,2.334H5.764v1.5H19.969v-1.5H18.647a2.35,2.35,0,0,1-2.36-2.334v-.85h9.481ZM24.256,1.5V14.383H1.512V1.5ZM1.512,15.878H24.256v3.4H1.512ZM15.58,23.955H10.153a3.782,3.782,0,0,0,.806-2.334v-.85h3.816v.85a3.782,3.782,0,0,0,.806,2.334Zm0,0&apos; transform=&apos;translate(0 8.102)&apos; fill=&apos;%23333&apos;%3E%3C/path%3E%3Cg id=&apos;Rectangle_15&apos; data-name=&apos;Rectangle 15&apos; transform=&apos;translate(6.676)&apos; fill=&apos;%23fff&apos; stroke=&apos;%23333&apos; stroke-width=&apos;1.5&apos;%3E%3Crect width=&apos;12.991&apos; height=&apos;16.664&apos; rx=&apos;2&apos; stroke=&apos;none&apos;%3E%3C/rect%3E%3Crect x=&apos;0.75&apos; y=&apos;0.75&apos; width=&apos;11.491&apos; height=&apos;15.164&apos; rx=&apos;1.25&apos; fill=&apos;none&apos;%3E%3C/rect%3E%3C/g%3E%3Cline id=&apos;Line_3&apos; data-name=&apos;Line 3&apos; y2=&apos;15.787&apos; transform=&apos;translate(10.852 0.439)&apos; fill=&apos;none&apos; stroke=&apos;%23333&apos; stroke-width=&apos;1.5&apos;%3E%3C/line%3E%3Cline id=&apos;Line_4&apos; data-name=&apos;Line 4&apos; y2=&apos;14.91&apos; transform=&apos;translate(14.288 1.316)&apos; fill=&apos;none&apos; stroke=&apos;%23333&apos; stroke-width=&apos;1.5&apos;%3E%3C/line%3E%3Cline id=&apos;Line_10&apos; data-name=&apos;Line 10&apos; x2=&apos;17&apos; transform=&apos;translate(4.499 15.987)&apos; fill=&apos;none&apos; stroke=&apos;%23333&apos; stroke-width=&apos;1.4&apos;%3E%3C/line%3E%3C/svg%3E</iaixsl:attribute>
															</img>
														</iaixsl:when>
														<iaixsl:when test="$groupID = 'installment'">
															<img class="order__payments_img">
																<iaixsl:attribute name="alt"><iaixsl:value-of select="$groupName"/></iaixsl:attribute>
																<iaixsl:attribute name="src">data:image/svg+xml,%3Csvg xmlns=&apos;http://www.w3.org/2000/svg&apos; width=&apos;25&apos; height=&apos;25&apos; viewBox=&apos;0 0 25 25&apos;%3E%3Cg id=&apos;calendar_1_&apos; transform=&apos;translate(0.25 0.25)&apos;%3E%3Cpath id=&apos;Path_23&apos; data-name=&apos;Path 23&apos; d=&apos;M22.842,2.336H19.467V.779a.779.779,0,0,0-1.557,0V2.336H13.238V.779a.779.779,0,0,0-1.557,0V2.336H7.008V.779a.779.779,0,0,0-1.557,0V2.336H2.077A2.076,2.076,0,0,0,0,4.412V22.841a2.077,2.077,0,0,0,2.077,2.077H22.842a2.076,2.076,0,0,0,2.076-2.077V4.412A2.075,2.075,0,0,0,22.842,2.336Zm.519,20.505a.52.52,0,0,1-.519.519H2.077a.52.52,0,0,1-.519-.519V4.412a.52.52,0,0,1,.519-.519H5.451V5.451a.779.779,0,0,0,1.557,0V3.893H11.68V5.451a.779.779,0,0,0,1.557,0V3.893H17.91V5.451a.779.779,0,0,0,1.557,0V3.893h3.375a.519.519,0,0,1,.519.519Z&apos; fill=&apos;%23333&apos; stroke=&apos;%23333&apos; stroke-width=&apos;0.5&apos;%3E%3C/path%3E%3Crect id=&apos;Rectangle_18&apos; data-name=&apos;Rectangle 18&apos; width=&apos;3.115&apos; height=&apos;2.336&apos; transform=&apos;translate(5.451 9.344)&apos; fill=&apos;%23333&apos; stroke=&apos;%23333&apos; stroke-width=&apos;0.5&apos;%3E%3C/rect%3E%3Crect id=&apos;Rectangle_19&apos; data-name=&apos;Rectangle 19&apos; width=&apos;3.115&apos; height=&apos;2.336&apos; transform=&apos;translate(5.451 13.238)&apos; fill=&apos;%23333&apos; stroke=&apos;%23333&apos; stroke-width=&apos;0.5&apos;%3E%3C/rect%3E%3Crect id=&apos;Rectangle_20&apos; data-name=&apos;Rectangle 20&apos; width=&apos;3.115&apos; height=&apos;2.336&apos; transform=&apos;translate(5.451 17.131)&apos; fill=&apos;%23333&apos; stroke=&apos;%23333&apos; stroke-width=&apos;0.5&apos;%3E%3C/rect%3E%3Crect id=&apos;Rectangle_21&apos; data-name=&apos;Rectangle 21&apos; width=&apos;3.115&apos; height=&apos;2.336&apos; transform=&apos;translate(10.902 17.131)&apos; fill=&apos;%23333&apos; stroke=&apos;%23333&apos; stroke-width=&apos;0.5&apos;%3E%3C/rect%3E%3Crect id=&apos;Rectangle_22&apos; data-name=&apos;Rectangle 22&apos; width=&apos;3.115&apos; height=&apos;2.336&apos; transform=&apos;translate(10.902 13.238)&apos; fill=&apos;%23333&apos; stroke=&apos;%23333&apos; stroke-width=&apos;0.5&apos;%3E%3C/rect%3E%3Crect id=&apos;Rectangle_23&apos; data-name=&apos;Rectangle 23&apos; width=&apos;3.115&apos; height=&apos;2.336&apos; transform=&apos;translate(10.902 9.344)&apos; fill=&apos;%23333&apos; stroke=&apos;%23333&apos; stroke-width=&apos;0.5&apos;%3E%3C/rect%3E%3Crect id=&apos;Rectangle_24&apos; data-name=&apos;Rectangle 24&apos; width=&apos;3.115&apos; height=&apos;2.336&apos; transform=&apos;translate(16.352 17.131)&apos; fill=&apos;%23333&apos; stroke=&apos;%23333&apos; stroke-width=&apos;0.5&apos;%3E%3C/rect%3E%3Crect id=&apos;Rectangle_25&apos; data-name=&apos;Rectangle 25&apos; width=&apos;3.115&apos; height=&apos;2.336&apos; transform=&apos;translate(16.352 13.238)&apos; fill=&apos;%23333&apos; stroke=&apos;%23333&apos; stroke-width=&apos;0.5&apos;%3E%3C/rect%3E%3Crect id=&apos;Rectangle_26&apos; data-name=&apos;Rectangle 26&apos; width=&apos;3.115&apos; height=&apos;2.336&apos; transform=&apos;translate(16.352 9.344)&apos; fill=&apos;%23333&apos; stroke=&apos;%23333&apos; stroke-width=&apos;0.5&apos;%3E%3C/rect%3E%3C/g%3E%3C/svg%3E</iaixsl:attribute>
															</img>
														</iaixsl:when>
														<iaixsl:when test="@id = '153'">
															<img class="order__payments_img">
																<iaixsl:attribute name="alt"><iaixsl:value-of select="@name"/></iaixsl:attribute>
																<iaixsl:attribute name="src">data:image/svg+xml,%3Csvg xmlns=&apos;http://www.w3.org/2000/svg&apos; id=&apos;calendar&apos; width=&apos;26&apos; height=&apos;26&apos; fill=&apos;%23333&apos; viewBox=&apos;0 0 26 26&apos;%3E%3Cg id=&apos;Group_425&apos; data-name=&apos;Group 425&apos;%3E%3Cg id=&apos;Group_424&apos; data-name=&apos;Group 424&apos;%3E%3Cpath id=&apos;Path_75&apos; data-name=&apos;Path 75&apos; d=&apos;M22.512,1.992h-1.2V0H19.324V1.992H6.176V0H4.184V1.992h-1.2A2.992,2.992,0,0,0,0,4.98V22.512A2.992,2.992,0,0,0,2.988,25.5H22.512A2.992,2.992,0,0,0,25.5,22.512V4.98A2.992,2.992,0,0,0,22.512,1.992Zm1,20.52a1,1,0,0,1-1,1H2.988a1,1,0,0,1-1-1V9.363H23.508Zm0-15.141H1.992V4.98a1,1,0,0,1,1-1h1.2V5.977H6.176V3.984H19.324V5.977h1.992V3.984h1.2a1,1,0,0,1,1,1Z&apos;%3E%3C/path%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_427&apos; data-name=&apos;Group 427&apos; transform=&apos;translate(4.397 11.431)&apos;%3E%3Cg id=&apos;Group_426&apos; data-name=&apos;Group 426&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_196&apos; data-name=&apos;Rectangle 196&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(-0.147 -0.181)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_429&apos; data-name=&apos;Group 429&apos; transform=&apos;translate(7.914 11.431)&apos;%3E%3Cg id=&apos;Group_428&apos; data-name=&apos;Group 428&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_197&apos; data-name=&apos;Rectangle 197&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(0.336 -0.181)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_431&apos; data-name=&apos;Group 431&apos; transform=&apos;translate(12.31 11.431)&apos;%3E%3Cg id=&apos;Group_430&apos; data-name=&apos;Group 430&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_198&apos; data-name=&apos;Rectangle 198&apos; width=&apos;1&apos; height=&apos;2&apos; transform=&apos;translate(-0.06 -0.181)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_433&apos; data-name=&apos;Group 433&apos; transform=&apos;translate(14.948 11.431)&apos;%3E%3Cg id=&apos;Group_432&apos; data-name=&apos;Group 432&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_199&apos; data-name=&apos;Rectangle 199&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(0.302 -0.181)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_435&apos; data-name=&apos;Group 435&apos; transform=&apos;translate(19.345 11.431)&apos;%3E%3Cg id=&apos;Group_434&apos; data-name=&apos;Group 434&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_200&apos; data-name=&apos;Rectangle 200&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(-0.095 -0.181)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_437&apos; data-name=&apos;Group 437&apos; transform=&apos;translate(4.397 14.948)&apos;%3E%3Cg id=&apos;Group_436&apos; data-name=&apos;Group 436&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_201&apos; data-name=&apos;Rectangle 201&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(-0.147 0.302)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_439&apos; data-name=&apos;Group 439&apos; transform=&apos;translate(7.914 14.948)&apos;%3E%3Cg id=&apos;Group_438&apos; data-name=&apos;Group 438&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_202&apos; data-name=&apos;Rectangle 202&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(0.336 0.302)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_441&apos; data-name=&apos;Group 441&apos; transform=&apos;translate(12.31 14.948)&apos;%3E%3Cg id=&apos;Group_440&apos; data-name=&apos;Group 440&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_203&apos; data-name=&apos;Rectangle 203&apos; width=&apos;1&apos; height=&apos;2&apos; transform=&apos;translate(-0.06 0.302)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_443&apos; data-name=&apos;Group 443&apos; transform=&apos;translate(14.948 14.948)&apos;%3E%3Cg id=&apos;Group_442&apos; data-name=&apos;Group 442&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_204&apos; data-name=&apos;Rectangle 204&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(0.302 0.302)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_445&apos; data-name=&apos;Group 445&apos; transform=&apos;translate(4.397 19.345)&apos;%3E%3Cg id=&apos;Group_444&apos; data-name=&apos;Group 444&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_205&apos; data-name=&apos;Rectangle 205&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(-0.147 -0.095)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_447&apos; data-name=&apos;Group 447&apos; transform=&apos;translate(7.914 19.345)&apos;%3E%3Cg id=&apos;Group_446&apos; data-name=&apos;Group 446&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_206&apos; data-name=&apos;Rectangle 206&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(0.336 -0.095)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_449&apos; data-name=&apos;Group 449&apos; transform=&apos;translate(12.31 19.345)&apos;%3E%3Cg id=&apos;Group_448&apos; data-name=&apos;Group 448&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_207&apos; data-name=&apos;Rectangle 207&apos; width=&apos;1&apos; height=&apos;2&apos; transform=&apos;translate(-0.06 -0.095)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_451&apos; data-name=&apos;Group 451&apos; transform=&apos;translate(14.948 19.345)&apos;%3E%3Cg id=&apos;Group_450&apos; data-name=&apos;Group 450&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_208&apos; data-name=&apos;Rectangle 208&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(0.302 -0.095)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_453&apos; data-name=&apos;Group 453&apos; transform=&apos;translate(19.345 14.948)&apos;%3E%3Cg id=&apos;Group_452&apos; data-name=&apos;Group 452&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_209&apos; data-name=&apos;Rectangle 209&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(-0.095 0.302)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E</iaixsl:attribute>
															</img>
														</iaixsl:when>
														<iaixsl:when test="$groupID = 'others'">
															<img class="order__payments_img">
																<iaixsl:attribute name="alt"><iaixsl:value-of select="$groupName"/></iaixsl:attribute>
																<iaixsl:attribute name="src">data:image/svg+xml,%3Csvg xmlns=&apos;http://www.w3.org/2000/svg&apos; width=&apos;38.44&apos; height=&apos;27.947&apos; viewBox=&apos;0 0 38.44 27.947&apos;%3E%3Cg id=&apos;Group_1616&apos; data-name=&apos;Group 1616&apos; transform=&apos;translate(-36 -220.526)&apos;%3E%3Cg id=&apos;gift-card&apos; transform=&apos;translate(36 145.193)&apos;%3E%3Cpath id=&apos;Path_525&apos; data-name=&apos;Path 525&apos; d=&apos;M238.505,148.8h-1.331a3.076,3.076,0,0,0-4.966-3.368,3.076,3.076,0,0,0-4.966,3.368h-1.33a.98.98,0,0,0-.98.98v4.2a.98.98,0,0,0,.98.98h.07v3.218a.98.98,0,0,0,.98.98h10.494a.98.98,0,0,0,.98-.98v-3.218h.07a.98.98,0,0,0,.98-.98v-4.2A.98.98,0,0,0,238.505,148.8Zm-7.276,8.395h-3.287v-2.238h3.287Zm0-4.2h-4.337v-2.238h4.337Zm0-4.2H230.11a1.119,1.119,0,1,1,1.119-1.119Zm1.959-1.119a1.119,1.119,0,1,1,1.119,1.119h-1.119Zm3.287,9.514h-3.287v-2.238h3.287Zm1.049-4.2h-4.337v-2.238h4.337Z&apos; transform=&apos;translate(-210.242 -60.069)&apos; fill=&apos;%23333&apos;/%3E%3Cpath id=&apos;Path_526&apos; data-name=&apos;Path 526&apos; d=&apos;M29.313,80.333H4.128A4.132,4.132,0,0,0,0,84.461V99.152a4.132,4.132,0,0,0,4.128,4.128H29.313a4.132,4.132,0,0,0,4.128-4.128V84.461A4.133,4.133,0,0,0,29.313,80.333Zm2.168,18.819a2.171,2.171,0,0,1-2.168,2.168H4.128a2.171,2.171,0,0,1-2.168-2.168V84.461a2.171,2.171,0,0,1,2.168-2.168H29.313a2.171,2.171,0,0,1,2.168,2.168Z&apos; transform=&apos;translate(0 0)&apos; fill=&apos;%23333&apos;/%3E%3Cpath id=&apos;Path_527&apos; data-name=&apos;Path 527&apos; d=&apos;M68.395,337.4H65.247a.98.98,0,1,0,0,1.959h3.148a.98.98,0,1,0,0-1.959Z&apos; transform=&apos;translate(-60.07 -240.277)&apos; fill=&apos;%23333&apos;/%3E%3Cpath id=&apos;Path_528&apos; data-name=&apos;Path 528&apos; d=&apos;M65.247,146.559h3.148a.98.98,0,1,0,0-1.959H65.247a.98.98,0,1,0,0,1.959Z&apos; transform=&apos;translate(-60.07 -60.07)&apos; fill=&apos;%23333&apos;/%3E%3Cpath id=&apos;Path_529&apos; data-name=&apos;Path 529&apos; d=&apos;M71.543,273.134h-6.3a.98.98,0,1,0,0,1.959h6.3a.98.98,0,1,0,0-1.959Z&apos; transform=&apos;translate(-60.07 -180.209)&apos; fill=&apos;%23333&apos;/%3E%3C/g%3E%3Cpath id=&apos;Subtraction_2&apos; data-name=&apos;Subtraction 2&apos; d=&apos;M-11327,8992.89h0v-2.014a2.165,2.165,0,0,0,1.481-2.055v-14.691a2.172,2.172,0,0,0-2.17-2.169h-25.186a2.164,2.164,0,0,0-2.067,1.513h-2.008a4.136,4.136,0,0,1,1.386-2.475,4.122,4.122,0,0,1,2.689-1h25.186a4.133,4.133,0,0,1,4.128,4.13v14.691a4.127,4.127,0,0,1-.989,2.677,4.145,4.145,0,0,1-2.449,1.393Z&apos; transform=&apos;translate(11398 -8749.473)&apos; fill=&apos;%23333&apos;/%3E%3C/g%3E%3C/svg%3E</iaixsl:attribute>
															</img>
														</iaixsl:when>
														<iaixsl:otherwise>
															<iaixsl:if test="@icon != '' or @icon_svg != ''">
																<img class="order__payment_icon"><iaixsl:attribute name="src"><iaixsl:choose><iaixsl:when test="@icon_svg != ''"><iaixsl:value-of select="@icon_svg"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@icon"/></iaixsl:otherwise></iaixsl:choose></iaixsl:attribute><iaixsl:attribute name="alt"><iaixsl:value-of select="@name"/></iaixsl:attribute></img>
															</iaixsl:if>
														</iaixsl:otherwise>
													</iaixsl:choose>
												</span>
											</span>
										</label>
									</div>
								</iaixsl:if>
							</iaixsl:for-each>

							
							<iaixsl:if test="count(/shop/page/order1/shipping/delivery[@type = 'dvp']) &gt; 0">
								<div class="order__payments_group f-group --radio mb-0 px-2  px-sm-3">
									<iaixsl:attribute name="id">dvp_payment</iaixsl:attribute>

									<input type="radio" name="selected_group_only" class="order__radio_payments f-control" id="cash_input">
										<iaixsl:attribute name="value">cash</iaixsl:attribute>
										<iaixsl:if test="not(/shop/page/order1/balance/@active='y' and /shop/page/order1/balance/@onlyPrepaid='y')">
											<iaixsl:if test="/shop/page/order1/shipping/delivery[@type = 'dvp' and @checked = 'true']">
													<iaixsl:attribute name="checked">checked</iaixsl:attribute>
											</iaixsl:if>
										</iaixsl:if>
									</input>

									<label class="order__payments_label f-label d-flex align-items-center pr-0 py-2" for="cash_input">
										<span class="order__payments_names d-flex flex-column mr-2 align-items-md-center flex-md-row">
											<strong class="order__payments_name d-block">Cash on delivery</strong>
										</span>

										<span class="order__payments_sub d-flex flex-row align-items-center justify-content-end">
											<span class="order__payments_icons d-flex justify-content-center flex-wrap align-items-center">
												<img class="order__payments_img">
														<iaixsl:attribute name="alt">Cash on delivery</iaixsl:attribute>
														<iaixsl:attribute name="src">data:image/svg+xml,%3Csvg xmlns=&apos;http://www.w3.org/2000/svg&apos; width=&apos;35&apos; height=&apos;28&apos; viewBox=&apos;0 0 35 28&apos;%3E%3Cg id=&apos;dollar&apos; transform=&apos;translate(0 -49.067)&apos;%3E%3Cg id=&apos;Group_456&apos; data-name=&apos;Group 456&apos; transform=&apos;translate(0 49.067)&apos;%3E%3Cg id=&apos;Group_455&apos; data-name=&apos;Group 455&apos;%3E%3Cpath id=&apos;Path_76&apos; data-name=&apos;Path 76&apos; d=&apos;M156.809,61.872a6.4,6.4,0,1,0-6.4-6.4A6.41,6.41,0,0,0,156.809,61.872Zm0-11.6a5.2,5.2,0,1,1-5.2,5.2A5.207,5.207,0,0,1,156.809,50.269Z&apos; transform=&apos;translate(-138.934 -49.067)&apos;%3E%3C/path%3E%3Ccircle id=&apos;Ellipse_30&apos; data-name=&apos;Ellipse 30&apos; cx=&apos;1.105&apos; cy=&apos;1.105&apos; r=&apos;1.105&apos; transform=&apos;translate(2.497 22.128)&apos;%3E%3C/circle%3E%3Cpath id=&apos;Path_77&apos; data-name=&apos;Path 77&apos; d=&apos;M35.619,202.2l-.018-.046a4.364,4.364,0,0,0-5.484-2.5l-4.5,1.561a4.132,4.132,0,0,0-4.026-1.2l-4.775,1.215a4.271,4.271,0,0,1-3.226-.472,8.722,8.722,0,0,0-4.479-1.238H7.2v-1.8a.6.6,0,0,0-.6-.6H.6a.6.6,0,0,0-.6.6V213.5a.6.6,0,0,0,.6.6h6a.6.6,0,0,0,.6-.6v-2.975H9.114a7.6,7.6,0,0,1,3.064.641l1.191.521a8.113,8.113,0,0,0,6.8-.13c4.264-2.064,11.827-5.725,14.571-7.051A1.812,1.812,0,0,0,35.619,202.2ZM6,200.136V212.9H1.2V198.335H6Zm28.211,3.291c-2.744,1.326-10.307,4.987-14.571,7.051a6.912,6.912,0,0,1-5.791.111l-1.191-.521a8.788,8.788,0,0,0-3.546-.742H7.2v-8.589H9.113a7.52,7.52,0,0,1,3.861,1.067,5.482,5.482,0,0,0,4.14.6l4.775-1.215a2.92,2.92,0,0,1,3.393,1.691l.1.248.068.164.042.1-8.228,3.312.449,1.115,8.792-3.539h.007l.025-.012.026-.012.031-.018.02-.012.032-.023.015-.012.031-.027.013-.012.027-.03.012-.014.023-.031.012-.017.019-.031.011-.019c.006-.011.011-.023.016-.034l.008-.018v0c.006-.014.011-.029.016-.044l0-.011a.6.6,0,0,0-.02-.407l-.446-1.07,0-.007-.07-.168L30.51,200.8a3.163,3.163,0,0,1,3.976,1.809l.018.046A.6.6,0,0,1,34.214,203.427Z&apos; transform=&apos;translate(0 -185.838)&apos;%3E%3C/path%3E%3Cpath id=&apos;Path_78&apos; data-name=&apos;Path 78&apos; d=&apos;M207.755,91.354a3.462,3.462,0,0,1-.482-.176,2.438,2.438,0,0,1-.4-.223,2.2,2.2,0,0,1-.29-.239l-.337.6a3.406,3.406,0,0,0,1.9.767v.8h.893v-.823a2.9,2.9,0,0,0,.317-.067,1.882,1.882,0,0,0,.615-.286,1.338,1.338,0,0,0,.407-.478,1.475,1.475,0,0,0,.149-.682,1.409,1.409,0,0,0-.129-.635,1.208,1.208,0,0,0-.376-.439,2.276,2.276,0,0,0-.6-.3c-.122-.042-.251-.082-.388-.119V87.144a2.252,2.252,0,0,1,.349.121,2.008,2.008,0,0,1,.325.18,1.435,1.435,0,0,1,.235.2l.329-.572a2.7,2.7,0,0,0-.748-.439,2.651,2.651,0,0,0-.49-.138v-.842h-.893v.8a2.545,2.545,0,0,0-.619.132,1.758,1.758,0,0,0-.568.325,1.445,1.445,0,0,0-.372.5,1.6,1.6,0,0,0-.133.67,1.324,1.324,0,0,0,.11.564,1.064,1.064,0,0,0,.325.4,2.026,2.026,0,0,0,.537.282,6.776,6.776,0,0,0,.721.213v1.894A2.719,2.719,0,0,1,207.755,91.354Zm1.292-1.559.032.011a1.655,1.655,0,0,1,.384.2.825.825,0,0,1,.239.259.7.7,0,0,1,.082.349.709.709,0,0,1-.321.635,1.217,1.217,0,0,1-.415.164ZM207.8,88.73a1.246,1.246,0,0,1-.345-.176.655.655,0,0,1-.2-.243.783.783,0,0,1-.067-.337.8.8,0,0,1,.266-.635,1.237,1.237,0,0,1,.7-.255v1.754Q207.959,88.785,207.8,88.73Z&apos; transform=&apos;translate(-190.518 -82.864)&apos;%3E%3C/path%3E%3C/g%3E%3C/g%3E%3C/g%3E%3C/svg%3E</iaixsl:attribute>
												</img>
											</span>
										</span>
									</label>
								</div>
							</iaixsl:if>
						</div>
					</iaixsl:if>
					
					<iaixsl:if test="/shop/basket/groups/group/types/type[@value = 'subscription'] and not(/shop/page/order1/prepaid_methods/item) and not(count(/shop/page/order1/shipping/delivery[@type = 'dvp']) &gt; 0)">
						<div class="order__payments_subscription_info">Subscription payment is possible only with a payment card.</div>
					</iaixsl:if>
				</section>
			</div>
			
			<div class="col-12 col-md-6">
				<section class="order__delivery --normal mb-3 mb-md-5">
					<iaixsl:if test="count(page/order1/shipping/delivery) = 0">
							<iaixsl:attribute name="data-no_delivery">true</iaixsl:attribute>
					</iaixsl:if>

					<div class="headline">
						<iaixsl:choose>
							<iaixsl:when test="/shop/page/order1/shipping_division">
								<span class="headline__name --prepaid">
									<iaixsl:if test="not(/shop/page/order1/shipping/delivery[@type = 'dvp' and @checked = 'true'])">
										<iaixsl:attribute name="class">headline__name --prepaid --active</iaixsl:attribute>
									</iaixsl:if>
									<span class="headline__name_txt">Delivery options for products available immediately, to be shipped </span>
									<span class="headline__division_time">
										<iaixsl:choose>
											<iaixsl:when test="/shop/basket/shipping_time/@today = 'true'">
												<iaixsl:attribute name="data-shipping_time">0</iaixsl:attribute>
											</iaixsl:when>
											<iaixsl:otherwise>
												<iaixsl:attribute name="data-shipping_time"><iaixsl:value-of select="/shop/basket/shipping_time/@week_day"/></iaixsl:attribute>
											</iaixsl:otherwise>
										</iaixsl:choose>
									</span>
								</span>
								<span class="headline__name --dvp">
									<iaixsl:if test="not(/shop/page/order1/shipping/delivery[@type = 'prepaid']) or /shop/page/order1/shipping/delivery[@type = 'dvp' and @checked = 'true'] and not(/shop/page/order1/balance/@active='y' and /shop/page/order1/balance/@onlyPrepaid='y')">
										<iaixsl:attribute name="class">headline__name --dvp --active</iaixsl:attribute>
									</iaixsl:if>
									<span class="headline__name_txt">Cash on delivery delivery options for immediate delivery, to be shipped </span>
									<span class="headline__division_time">
										<iaixsl:choose>
											<iaixsl:when test="/shop/basket/shipping_time/@today = 'true'">
												<iaixsl:attribute name="data-shipping_time">0</iaixsl:attribute>
											</iaixsl:when>
											<iaixsl:otherwise>
												<iaixsl:attribute name="data-shipping_time"><iaixsl:value-of select="/shop/basket/shipping_time/@week_day"/></iaixsl:attribute>
											</iaixsl:otherwise>
										</iaixsl:choose>
									</span>
								</span>
							</iaixsl:when>
							<iaixsl:otherwise>
								<span class="headline__name --prepaid">
									<iaixsl:if test="not(/shop/page/order1/shipping/delivery[@type = 'dvp' and @checked = 'true'])">
										<iaixsl:attribute name="class">headline__name --prepaid --active</iaixsl:attribute>
									</iaixsl:if>
									Select the most convenient delivery method
								</span>
								<span class="headline__name --dvp">
									<iaixsl:if test="not(/shop/page/order1/shipping/delivery[@type = 'prepaid']) or /shop/page/order1/shipping/delivery[@type = 'dvp' and @checked = 'true'] and not(/shop/page/order1/balance/@active='y' and /shop/page/order1/balance/@onlyPrepaid='y')">
										<iaixsl:attribute name="class">headline__name --dvp --active</iaixsl:attribute>
									</iaixsl:if>
									Select the most convenient delivery method
								</span>
							</iaixsl:otherwise>
						</iaixsl:choose>
					</div>

					
					<iaixsl:if test="count(/shop/page/order1/shipping/delivery[@type = 'prepaid']) &gt; 0">
						<div class="order__delivery_section --prepaid">
							<iaixsl:if test="not(/shop/page/order1/shipping/delivery[@type = 'dvp' and @checked = 'true'])">
								<iaixsl:attribute name="class">order__delivery_section --prepaid --active</iaixsl:attribute>
							</iaixsl:if>
							<iaixsl:for-each select="/shop/page/order1/shipping/delivery[@type = 'prepaid']">
								<div class="order__delivery_group f-group --radio mb-0 px-2  px-sm-3">
									
									<iaixsl:if test="@sameday='true'">
											<iaixsl:attribute name="data-sameday">true</iaixsl:attribute>
											<iaixsl:attribute name="data-xpress_type"><iaixsl:value-of select="@express_courier_type"/></iaixsl:attribute>
									</iaixsl:if>

									
									<iaixsl:attribute name="data-working_days">[<iaixsl:for-each select="working_days/item"><iaixsl:if test="position() != 1">,</iaixsl:if><iaixsl:value-of select="translate(.,'7','0')"/></iaixsl:for-each>]</iaixsl:attribute>

									
									<iaixsl:attribute name="data-id"><iaixsl:value-of select="@id"/></iaixsl:attribute>

									
									<iaixsl:attribute name="data-calendar"><iaixsl:choose><iaixsl:when test="@sameday = 'true'">n</iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@calendar"/></iaixsl:otherwise></iaixsl:choose></iaixsl:attribute>

									
									<iaixsl:attribute name="data-delivery_time"><iaixsl:value-of select="@deliverytime"/></iaixsl:attribute>

									
									<iaixsl:attribute name="data-prepaid">1</iaixsl:attribute>

									
									<iaixsl:attribute name="data-total_time"><iaixsl:value-of select="@time"/></iaixsl:attribute>

									
									<iaixsl:attribute name="data-minute"><iaixsl:choose><iaixsl:when test="@id = '0-1' or @id='0-0'"><iaixsl:value-of select="/shop/page/order1/stocks/stock[@selected = 'selected']/@pickup_days"/>#<iaixsl:value-of select="/shop/page/order1/stocks/stock[@selected = 'selected']/@pickup_hours"/>#<iaixsl:value-of select="/shop/page/order1/stocks/stock[@selected = 'selected']/@pickup_minutes"/>#<iaixsl:choose><iaixsl:when test="@today='true'">0</iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@week_day"/></iaixsl:otherwise></iaixsl:choose>#<iaixsl:value-of select="@week_amount"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@time_days"/>#<iaixsl:value-of select="@time_hours"/>#<iaixsl:value-of select="@time_minutes"/>#<iaixsl:choose><iaixsl:when test="@today='true'">0</iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@week_day"/></iaixsl:otherwise></iaixsl:choose>#<iaixsl:value-of select="@week_amount"/></iaixsl:otherwise></iaixsl:choose></iaixsl:attribute>

									
									<iaixsl:if test="@checked = 'true'">
										<iaixsl:attribute name="data-active">true</iaixsl:attribute>
									</iaixsl:if>

									
									<iaixsl:if test="@minworthreached = 'false'">
										<iaixsl:attribute name="data-disabled">true</iaixsl:attribute>
									</iaixsl:if>

									
									<iaixsl:if test="@loadCourierServicesUrl">
										<iaixsl:attribute name="data-prepaid"><iaixsl:value-of select="@type"/></iaixsl:attribute>
																						<iaixsl:attribute name="data-courier_company_key"><iaixsl:value-of select="@courier_company_key"/></iaixsl:attribute>
																						<iaixsl:attribute name="data-courier_company_group_key"><iaixsl:value-of select="@courier_company_group_key"/></iaixsl:attribute>
									</iaixsl:if>

									
									<input type="radio" name="shipping" autocomplete="off" class="order__radio_delivery f-control">
										<iaixsl:attribute name="value"><iaixsl:value-of select="@id"/></iaixsl:attribute>
										<iaixsl:attribute name="id">delivery_<iaixsl:value-of select="@id"/></iaixsl:attribute>
										<iaixsl:attribute name="data-did"><iaixsl:value-of select="@did"/></iaixsl:attribute>
										<iaixsl:attribute name="data-type"><iaixsl:value-of select="@type"/></iaixsl:attribute>
										<iaixsl:if test="@checked = 'true'">
											<iaixsl:attribute name="checked">checked</iaixsl:attribute>
										</iaixsl:if>
										<iaixsl:if test="@minworthreached = 'false'">
											<iaixsl:attribute name="disabled">disabled</iaixsl:attribute>
										</iaixsl:if>
									</input>

									
									<label class="order__delivery_label f-label d-flex align-items-center pr-0 py-2">
										<iaixsl:attribute name="for">delivery_<iaixsl:value-of select="@id"/></iaixsl:attribute>
										<span class="order__delivery_names d-flex flex-column mr-2 align-items-md-center flex-md-row">
											<strong class="order__delivery_name d-block"><iaixsl:value-of select="@name"/></strong>
											<span class="order__delivery_desc mt-1">
												<iaixsl:choose>
													<iaixsl:when test="@id = '93-1'">
													</iaixsl:when>
													<iaixsl:when test="@loadCourierServicesUrl">
														Select a delivery day
													</iaixsl:when>
													<iaixsl:when test="@minworthreached = 'false'">
														Delivery method available from <iaixsl:value-of select="@minworth_formatted"/>
													</iaixsl:when>
													<iaixsl:when test="not(@sameday='true')">
														<iaixsl:choose>
															<iaixsl:when test="@id = '0-1' or @id='0-0'">
																<iaixsl:for-each select="/shop/page/order1/stocks/stock[@selected = 'selected']">
																	<iaixsl:choose>
																		<iaixsl:when test="@undefinded_time = 'true'">
																			Unknown
																		</iaixsl:when>
																		<iaixsl:otherwise>
																			<span class="order__delivery_desc_item --txt">Pick up your order - </span>
																			<span class="order__delivery_desc_item --value">
																				<iaixsl:choose>
																					
																					<iaixsl:when test="(@pickup_days = 0) and (@pickup_hours = 0)">
																						Today
																					</iaixsl:when>
																					
																					<iaixsl:when test="@pickup_days &gt; 0">
																						<iaixsl:choose>
																							<iaixsl:when test="@pickup_hours &gt; 0">
																								<iaixsl:attribute name="data-pickup_days"><iaixsl:value-of select="@pickup_days + 1"/></iaixsl:attribute>
																								after <iaixsl:value-of select="@pickup_days + 1"/> days 
																							</iaixsl:when>
																							<iaixsl:otherwise>
																								<iaixsl:attribute name="data-pickup_days"><iaixsl:value-of select="@pickup_days"/></iaixsl:attribute>
																								after <iaixsl:value-of select="@pickup_days"/>
																								<iaixsl:choose>
																									<iaixsl:when test="@pickup_days = '1'">
																											day 
																									</iaixsl:when>
																									<iaixsl:otherwise>
																											days 
																									</iaixsl:otherwise>
																								</iaixsl:choose>
																							</iaixsl:otherwise>
																						</iaixsl:choose>
																					</iaixsl:when>
																					
																					<iaixsl:otherwise>
																						<iaixsl:choose>
																							<iaixsl:when test="@pickup_minutes &gt; 0">
																								after <iaixsl:value-of select="@pickup_hours + 1"/> hours. 
																							</iaixsl:when>
																							<iaixsl:otherwise>
																								after <iaixsl:value-of select="@pickup_hours"/>
																								<iaixsl:choose>
																									<iaixsl:when test="@pickup_hours = '1'">
																											hours. 
																									</iaixsl:when>
																									<iaixsl:otherwise>
																											hours. 
																									</iaixsl:otherwise>
																								</iaixsl:choose>
																							</iaixsl:otherwise>
																						</iaixsl:choose>
																					</iaixsl:otherwise>
																				</iaixsl:choose>
																			</span>
																		</iaixsl:otherwise>
																	</iaixsl:choose>
																</iaixsl:for-each>
															</iaixsl:when>
															<iaixsl:otherwise>
																<span class="order__delivery_desc_item --txt">Expected delivery - </span>
																<span class="order__delivery_desc_item --value">
																	<iaixsl:if test="not(@week_amount = 0)">
																		<iaixsl:attribute name="data-time"><iaixsl:value-of select="@time"/></iaixsl:attribute>
																	</iaixsl:if>
																	<iaixsl:choose>
																		<iaixsl:when test="@today = 'true'">
																			Today
																		</iaixsl:when>
																		<iaixsl:when test="@week_day = 1">
																			Monday
																		</iaixsl:when>
																		<iaixsl:when test="@week_day = 2">
																			Tuesday
																		</iaixsl:when>
																		<iaixsl:when test="@week_day = 3">
																			Wednesday
																		</iaixsl:when>
																		<iaixsl:when test="@week_day = 4">
																			Thursday
																		</iaixsl:when>
																		<iaixsl:when test="@week_day = 5">
																			Friday
																		</iaixsl:when>
																		<iaixsl:when test="@week_day = 6">
																			Saturday
																		</iaixsl:when>
																		<iaixsl:when test="@week_day = 7">
																			Sunday
																		</iaixsl:when>
																	</iaixsl:choose>
																</span>
															</iaixsl:otherwise>
														</iaixsl:choose>
													</iaixsl:when>
												</iaixsl:choose>
												<iaixsl:if test="@comment != ''">
													<span class="order__delivery_comment"><iaixsl:value-of select="@comment"/></span>
												</iaixsl:if>
											</span>
										</span>

										<span class="order__delivery_sub d-flex flex-column align-items-center justify-content-center flex-md-row">
											
											<iaixsl:if test="not(/shop/page/order1/shipping/@hide_cost='true')">
												<span class="order__delivery_cost mb-1 mb-md-0 mr-md-3 mr-lg-4 d-flex flex-column">
													<iaixsl:choose>
														
														<iaixsl:when test="@points_enabled">
															<iaixsl:attribute name="data-points">true</iaixsl:attribute>
															<strong class="order__delivery_price --points f-group --small --radio mb-0">
																<input type="radio" name="shipping_for_points" value="0" class="order__radio_points f-control"/>
																<label class="order__points_label f-label pr-0"><iaixsl:value-of select="@cost_formatted"/></label>
															</strong>
															<span class="order__delivery_points f-group --small --radio mb-0">
																<input type="radio" name="shipping_for_points" value="1" class="order__radio_points f-control">
																	<iaixsl:if test="@points_enabled = 'false'">
																		<iaixsl:attribute name="disabled">disabled</iaixsl:attribute>
																	</iaixsl:if>
																</input>
																<label class="order__points_label f-label pr-0">
																	<iaixsl:if test="@points_enabled = 'false'">
																		<iaixsl:attribute name="title">You do not have enough points.</iaixsl:attribute>
																	</iaixsl:if>
																	<iaixsl:value-of select="@points_cost"/> pts.
																</label>
															</span>
														</iaixsl:when>
														
														<iaixsl:otherwise>
															<iaixsl:if test="@beforerebate_formatted">
																<del class="order__delivery_price_max">
																	<iaixsl:value-of select="@beforerebate_formatted"/>
																</del>
															</iaixsl:if>
															<strong class="order__delivery_price">
																<iaixsl:choose>
																	<iaixsl:when test="@cost &gt; 0">
																		<iaixsl:if test="@limitfree &gt; 0"><iaixsl:attribute name="title">From <iaixsl:value-of select="@limitfree_formatted"/> free</iaixsl:attribute></iaixsl:if>
																		<iaixsl:value-of select="@cost_formatted"/>
																	</iaixsl:when>
																	<iaixsl:otherwise>
																		Free!
																	</iaixsl:otherwise>
																</iaixsl:choose>
															</strong>
														</iaixsl:otherwise>
													</iaixsl:choose>
												</span>
											</iaixsl:if>

											
											<span class="order__delivery_icons d-flex justify-content-end">
												<iaixsl:choose>
													<iaixsl:when test="@id = '93-1'">
														<img class="order__delivery_img" src="/gfx/standards/online_delivery.png?r=1696937716">
															<iaixsl:attribute name="alt"><iaixsl:value-of select="@name"/></iaixsl:attribute>
															<iaixsl:attribute name="title"><iaixsl:value-of select="@name"/></iaixsl:attribute>
														</img>
													</iaixsl:when>
													<iaixsl:otherwise>
														<iaixsl:if test="@icon">
															<img class="order__delivery_img"><iaixsl:attribute name="src"><iaixsl:value-of select="@icon"/></iaixsl:attribute><iaixsl:attribute name="alt"><iaixsl:value-of select="@name"/></iaixsl:attribute><iaixsl:attribute name="title"><iaixsl:value-of select="@name"/></iaixsl:attribute></img>
														</iaixsl:if>
													</iaixsl:otherwise>
												</iaixsl:choose>
											</span>
										</span>
									</label>
								</div>
							</iaixsl:for-each>
						</div>
					</iaixsl:if>

					
					<iaixsl:if test="count(/shop/page/order1/shipping/delivery[@type = 'dvp']) &gt; 0">
						<div class="order__delivery_section --dvp">
							<iaixsl:if test="not(/shop/page/order1/shipping/delivery[@type = 'prepaid']) or /shop/page/order1/shipping/delivery[@type = 'dvp' and @checked = 'true'] and not(/shop/page/order1/balance/@active='y' and /shop/page/order1/balance/@onlyPrepaid='y')">
								<iaixsl:attribute name="class">order__delivery_section --dvp --active</iaixsl:attribute>
							</iaixsl:if>

							<iaixsl:for-each select="/shop/page/order1/shipping/delivery[@type = 'dvp']">
								<div class="order__delivery_group f-group --radio mb-0 px-2  px-sm-3">
									
									<iaixsl:if test="@sameday='true'">
										<iaixsl:attribute name="data-sameday">true</iaixsl:attribute>
										<iaixsl:attribute name="data-xpress_type"><iaixsl:value-of select="@express_courier_type"/></iaixsl:attribute>
									</iaixsl:if>

									
									<iaixsl:attribute name="data-working_days">[<iaixsl:for-each select="working_days/item"><iaixsl:if test="position() != 1">,</iaixsl:if><iaixsl:value-of select="translate(.,'7','0')"/></iaixsl:for-each>]</iaixsl:attribute>

									
									<iaixsl:attribute name="data-id"><iaixsl:value-of select="@id"/></iaixsl:attribute>

									
									<iaixsl:attribute name="data-calendar"><iaixsl:choose><iaixsl:when test="@sameday = 'true'">n</iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@calendar"/></iaixsl:otherwise></iaixsl:choose></iaixsl:attribute>

									
									<iaixsl:attribute name="data-delivery_time"><iaixsl:value-of select="@deliverytime"/></iaixsl:attribute>

									
									<iaixsl:attribute name="data-prepaid">1</iaixsl:attribute>

									
									<iaixsl:attribute name="data-total_time"><iaixsl:value-of select="@time"/></iaixsl:attribute>

									
									<iaixsl:attribute name="data-minute"><iaixsl:choose><iaixsl:when test="@id = '0-1' or @id='0-0'"><iaixsl:value-of select="/shop/page/order1/stocks/stock[@selected = 'selected']/@pickup_days"/>#<iaixsl:value-of select="/shop/page/order1/stocks/stock[@selected = 'selected']/@pickup_hours"/>#<iaixsl:value-of select="/shop/page/order1/stocks/stock[@selected = 'selected']/@pickup_minutes"/>#<iaixsl:choose><iaixsl:when test="@today='true'">0</iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@week_day"/></iaixsl:otherwise></iaixsl:choose>#<iaixsl:value-of select="@week_amount"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@time_days"/>#<iaixsl:value-of select="@time_hours"/>#<iaixsl:value-of select="@time_minutes"/>#<iaixsl:choose><iaixsl:when test="@today='true'">0</iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@week_day"/></iaixsl:otherwise></iaixsl:choose>#<iaixsl:value-of select="@week_amount"/></iaixsl:otherwise></iaixsl:choose></iaixsl:attribute>

									
									<iaixsl:if test="@checked = 'true'">
										<iaixsl:attribute name="data-active">true</iaixsl:attribute>
									</iaixsl:if>

									
									<iaixsl:if test="@minworthreached = 'false'">
										<iaixsl:attribute name="data-disabled">true</iaixsl:attribute>
									</iaixsl:if>

									
									<iaixsl:if test="@loadCourierServicesUrl">
										<iaixsl:attribute name="data-prepaid"><iaixsl:value-of select="@type"/></iaixsl:attribute>
																						<iaixsl:attribute name="data-courier_company_key"><iaixsl:value-of select="@courier_company_key"/></iaixsl:attribute>
																						<iaixsl:attribute name="data-courier_company_group_key"><iaixsl:value-of select="@courier_company_group_key"/></iaixsl:attribute>
									</iaixsl:if>

									
									<input type="radio" name="shipping" autocomplete="off" class="order__radio_delivery f-control">
										<iaixsl:attribute name="value"><iaixsl:value-of select="@id"/></iaixsl:attribute>
										<iaixsl:attribute name="id">delivery_<iaixsl:value-of select="@id"/></iaixsl:attribute>
										<iaixsl:attribute name="data-did"><iaixsl:value-of select="@did"/></iaixsl:attribute>
										<iaixsl:attribute name="data-type"><iaixsl:value-of select="@type"/></iaixsl:attribute>
										<iaixsl:if test="@checked = 'true' and not(/shop/page/order1/balance/@active='y' and /shop/page/order1/balance/@onlyPrepaid='y')">
											<iaixsl:attribute name="checked">checked</iaixsl:attribute>
										</iaixsl:if>
										<iaixsl:if test="@minworthreached = 'false'">
											<iaixsl:attribute name="disabled">disabled</iaixsl:attribute>
										</iaixsl:if>
									</input>

									
									<label class="order__delivery_label f-label d-flex align-items-center pr-0 py-2">
										<iaixsl:attribute name="for">delivery_<iaixsl:value-of select="@id"/></iaixsl:attribute>
										<span class="order__delivery_names d-flex flex-column mr-2 align-items-md-center flex-md-row">
											<strong class="order__delivery_name d-block"><iaixsl:value-of select="@name"/></strong>
											<span class="order__delivery_desc mt-1">
												<iaixsl:choose>
													<iaixsl:when test="@loadCourierServicesUrl">
														Select a delivery day
													</iaixsl:when>
													<iaixsl:when test="@minworthreached = 'false'">
														Delivery method available from <iaixsl:value-of select="@minworth_formatted"/>
													</iaixsl:when>
													<iaixsl:when test="not(@sameday='true')">
														<iaixsl:choose>
															<iaixsl:when test="@id = '0-1' or @id='0-0'">
																<iaixsl:for-each select="/shop/page/order1/stocks/stock[@selected = 'selected']">
																	<iaixsl:choose>
																		<iaixsl:when test="@undefinded_time = 'true'">
																			Unknown
																		</iaixsl:when>
																		<iaixsl:otherwise>
																			<span class="order__delivery_desc_item --txt">Pick up your order - </span>
																			<span class="order__delivery_desc_item --value">
																				<iaixsl:choose>
																					
																					<iaixsl:when test="(@pickup_days = 0) and (@pickup_hours = 0)">
																						Today
																					</iaixsl:when>
																					
																					<iaixsl:when test="@pickup_days &gt; 0">
																						<iaixsl:choose>
																							<iaixsl:when test="@pickup_hours &gt; 0">
																								<iaixsl:attribute name="data-pickup_days"><iaixsl:value-of select="@pickup_days + 1"/></iaixsl:attribute>
																								after <iaixsl:value-of select="@pickup_days + 1"/> days 
																							</iaixsl:when>
																							<iaixsl:otherwise>
																								<iaixsl:attribute name="data-pickup_days"><iaixsl:value-of select="@pickup_days"/></iaixsl:attribute>
																								after <iaixsl:value-of select="@pickup_days"/>
																								<iaixsl:choose>
																									<iaixsl:when test="@pickup_days = '1'">
																											day 
																									</iaixsl:when>
																									<iaixsl:otherwise>
																											days 
																									</iaixsl:otherwise>
																								</iaixsl:choose>
																							</iaixsl:otherwise>
																						</iaixsl:choose>
																					</iaixsl:when>
																					
																					<iaixsl:otherwise>
																						<iaixsl:choose>
																							<iaixsl:when test="@pickup_minutes &gt; 0">
																								after <iaixsl:value-of select="@pickup_hours + 1"/> hours. 
																							</iaixsl:when>
																							<iaixsl:otherwise>
																								after <iaixsl:value-of select="@pickup_hours"/>
																								<iaixsl:choose>
																									<iaixsl:when test="@pickup_hours = '1'">
																											hours. 
																									</iaixsl:when>
																									<iaixsl:otherwise>
																											hours. 
																									</iaixsl:otherwise>
																								</iaixsl:choose>
																							</iaixsl:otherwise>
																						</iaixsl:choose>
																					</iaixsl:otherwise>
																				</iaixsl:choose>
																			</span>
																		</iaixsl:otherwise>
																	</iaixsl:choose>
																</iaixsl:for-each>
															</iaixsl:when>
															<iaixsl:otherwise>
																<span class="order__delivery_desc_item --txt">Expected delivery - </span>
																<span class="order__delivery_desc_item --value">
																	<iaixsl:if test="not(@week_amount = 0)">
																		<iaixsl:attribute name="data-time"><iaixsl:value-of select="@time"/></iaixsl:attribute>
																	</iaixsl:if>
																	<iaixsl:choose>
																		<iaixsl:when test="@today = 'true'">
																			Today
																		</iaixsl:when>
																		<iaixsl:when test="@week_day = 1">
																			Monday
																		</iaixsl:when>
																		<iaixsl:when test="@week_day = 2">
																			Tuesday
																		</iaixsl:when>
																		<iaixsl:when test="@week_day = 3">
																			Wednesday
																		</iaixsl:when>
																		<iaixsl:when test="@week_day = 4">
																			Thursday
																		</iaixsl:when>
																		<iaixsl:when test="@week_day = 5">
																			Friday
																		</iaixsl:when>
																		<iaixsl:when test="@week_day = 6">
																			Saturday
																		</iaixsl:when>
																		<iaixsl:when test="@week_day = 7">
																			Sunday
																		</iaixsl:when>
																	</iaixsl:choose>
																</span>
															</iaixsl:otherwise>
														</iaixsl:choose>
													</iaixsl:when>
												</iaixsl:choose>
												<iaixsl:if test="@comment != ''">
													<span class="order__delivery_comment"><iaixsl:value-of select="@comment"/></span>
												</iaixsl:if>
											</span>
										</span>

										<span class="order__delivery_sub d-flex flex-column align-items-center justify-content-center flex-md-row">
											
											<iaixsl:if test="not(/shop/page/order1/shipping/@hide_cost='true')">
												<span class="order__delivery_cost mb-1 mb-md-0 mr-md-3 mr-lg-4 d-flex flex-column">
													<iaixsl:choose>
														
														<iaixsl:when test="@points_enabled">
															<iaixsl:attribute name="data-points">true</iaixsl:attribute>
															<strong class="order__delivery_price --points f-group --small --radio mb-0">
																<input type="radio" name="shipping_for_points" value="0" class="order__radio_points f-control"/>
																<label class="order__points_label f-label pr-0"><iaixsl:value-of select="@cost_formatted"/></label>
															</strong>
															<span class="order__delivery_points f-group --small --radio mb-0">
																<input type="radio" name="shipping_for_points" value="1" class="order__radio_points f-control">
																	<iaixsl:if test="@points_enabled = 'false'">
																		<iaixsl:attribute name="disabled">disabled</iaixsl:attribute>
																	</iaixsl:if>
																</input>
																<label class="order__points_label f-label pr-0">
																	<iaixsl:if test="@points_enabled = 'false'">
																		<iaixsl:attribute name="title">You do not have enough points.</iaixsl:attribute>
																	</iaixsl:if>
																	<iaixsl:value-of select="@points_cost"/> pts.
																</label>
															</span>
														</iaixsl:when>
														
														<iaixsl:otherwise>
															<iaixsl:if test="@beforerebate_formatted">
																<del class="order__delivery_price_max">
																	<iaixsl:value-of select="@beforerebate_formatted"/>
																</del>
															</iaixsl:if>
															<strong class="order__delivery_price">
																<iaixsl:choose>
																	<iaixsl:when test="@cost &gt; 0">
																		<iaixsl:if test="@limitfree &gt; 0"><iaixsl:attribute name="title">From <iaixsl:value-of select="@limitfree_formatted"/> free</iaixsl:attribute></iaixsl:if>
																		<iaixsl:value-of select="@cost_formatted"/>
																	</iaixsl:when>
																	<iaixsl:otherwise>
																		Free!
																	</iaixsl:otherwise>
																</iaixsl:choose>
															</strong>
														</iaixsl:otherwise>
													</iaixsl:choose>
												</span>
											</iaixsl:if>

											
											<span class="order__delivery_icons d-flex justify-content-end">
												<iaixsl:choose>
													<iaixsl:when test="@id = '93-1'">
														<img class="order__delivery_img" src="/gfx/standards/online_delivery.png?r=1696937716">
															<iaixsl:attribute name="alt"><iaixsl:value-of select="@name"/></iaixsl:attribute>
															<iaixsl:attribute name="title"><iaixsl:value-of select="@name"/></iaixsl:attribute>
														</img>
													</iaixsl:when>
													<iaixsl:otherwise>
														<iaixsl:if test="@icon">
															<img class="order__delivery_img"><iaixsl:attribute name="src"><iaixsl:value-of select="@icon"/></iaixsl:attribute><iaixsl:attribute name="alt"><iaixsl:value-of select="@name"/></iaixsl:attribute><iaixsl:attribute name="title"><iaixsl:value-of select="@name"/></iaixsl:attribute></img>
														</iaixsl:if>
													</iaixsl:otherwise>
												</iaixsl:choose>
											</span>
										</span>
									</label>
								</div>
							</iaixsl:for-each>
						</div>
					</iaixsl:if>

					
					<div class="order__time align-items-center p-2 flex-wrap justify-content-center px-sm-3">
						<iaixsl:if test="/shop/basket/delay_time/@unknown_delivery_time = 'true' or /shop/page/order1/shipping/delivery[@id = '93-1']">
							<iaixsl:attribute name="data-unknown">true</iaixsl:attribute>
						</iaixsl:if>
						
						<div class="order__time_calendar mt-1 mt-sm-0 ml-sm-3">
							<a href="#preferred_delivery_day" class="order__time_btn btn --icon-left icon-clock py-0">Choose a different delivery day</a>
						</div>
					</div>

					
					<div class="order__calendar p-2 mt-3 p-md-3">
						<strong class="order__calendar_label d-block mb-1 mb-sm-2">Select a preferred date of delivery</strong>
						<div class="order__calendar_block row mx-n1">
							
							<iaixsl:if test="/shop/page/order1/deliverytime_own/@use = 'true'">
								<iaixsl:attribute name="data-own"><iaixsl:for-each select="/shop/page/order1/deliverytime_own/date"><iaixsl:value-of select="@date"/><iaixsl:if test="not(position() = count(/shop/page/order1/deliverytime_own/date))">,</iaixsl:if></iaixsl:for-each></iaixsl:attribute>
							</iaixsl:if>

							
							<iaixsl:if test="/shop/page/order1/order_calendar">
								<iaixsl:attribute name="data-calendar"><iaixsl:value-of select="/shop/page/order1/order_calendar/@date_y"/>-<iaixsl:value-of select="/shop/page/order1/order_calendar/@date_m"/>-<iaixsl:value-of select="/shop/page/order1/order_calendar/@date_d"/></iaixsl:attribute>
								<iaixsl:attribute name="data-calendar_select"><iaixsl:value-of select="/shop/page/order1/order_calendar/@select_y"/>-<iaixsl:value-of select="/shop/page/order1/order_calendar/@select_m"/>-<iaixsl:value-of select="/shop/page/order1/order_calendar/@select_d"/></iaixsl:attribute>
								<iaixsl:if test="/shop/page/order1/order_calendar/holiday">
									<iaixsl:attribute name="data-holiday"><iaixsl:for-each select="/shop/page/order1/order_calendar/holiday"><iaixsl:value-of select="@date"/><iaixsl:if test="not(position() = count(/shop/page/order1/order_calendar/holiday))">,</iaixsl:if></iaixsl:for-each></iaixsl:attribute>
								</iaixsl:if>
							</iaixsl:if>

							
							<div class="order__date col-4 p-1 col-sm-3 col-md-2">
								<input type="radio" name="calendar_select_date" class="order__date_radio d-none"/>
								<label class="order__date_label d-flex flex-column align-items-center justify-content-around p-2">
									<iaixsl:attribute name="title">Click to select the delivery date</iaixsl:attribute>
									<strong class="order__date_day"/>
									<span class="order__date_month"/>
									<strong class="order__services_cost"/>
								</label>
							</div>

							
							<div class="order__date --other col-4 p-1 col-sm-3 col-md-2">
								<label class="order__date_label d-flex flex-column align-items-center justify-content-around p-2">
									<iaixsl:attribute name="title">Click to select another date</iaixsl:attribute>
									<span class="order__date_other">Another day</span>
								</label>
								<div class="order__datepicker"/>
							</div>
						</div>

						
						<div class="order__calendar_hour flex-column mt-2 flex-sm-row align-items-sm-center justify-content-sm-center">
							<span class="order__hour_txt mb-1 mb-sm-0 mr-sm-2">You can also provide a preferred range of hours (i.e. 1PM - 4PM)</span>
							<input type="text" name="calendar_select_hour" class="order__hour_input" maxlength="50"/>
						</div>

						
						<div class="order__calendar_services flex-column mt-2 flex-sm-row align-items-sm-center justify-content-sm-center">
							<span class="order__services_txt mb-1 mb-sm-0 mr-sm-2">Dodatkowa usługa</span>
							<input type="hidden" class="order__calendar_services_points" name="calendar_services_points" value="0"/>
							<select name="calendar_services" class="order__services_select f-select mb-0 --small">
							</select>
						</div>
						<input type="hidden" name="calendar_select_active" class="order__select_day" value="0"/>
					</div>

					
					<iaixsl:if test="/shop/page/order1/shipping/delivery/@sameday = 'true'">
						<div class="order__xpress p-2 p-md-3">
							<div class="order__xpress_show d-flex flex-column align-items-center">
								<a class="order__xpress_button btn --solid --medium  mb-2" href="#showSameday">Choose your preferred delivery date</a>
								<span class="order__xpress_info">* choice is required to move on </span>
							</div>
							<div class="order__xpress_choice mt-2 pt-2 flex-column align-items-center mt-md-3 pt-md-3">
								<div class="order__xpress_group f-group --radio">
									<input type="radio" name="sameDayServiceId" class="order__xpress_radio f-control" value=""/>
									<label class="order__xpress_label f-label"/>
								</div>
							</div>
							<div class="order__xpress_not mt-2 pt-2 mt-md-3 pt-md-3">Sorry, delivery times are not available at this time</div>
						</div>
					</iaixsl:if>

					
				</section>
				
				<iaixsl:if test="/shop/page/order1/shipping_division">
					<section class="order__delivery --division mb-3 mb-md-5">

						<div class="headline">
							<span class="headline__name --prepaid">
								<iaixsl:if test="not(/shop/page/order1/shipping_division/delivery[@type = 'dvp' and @checked = 'true'])">
									<iaixsl:attribute name="class">headline__name --prepaid --active</iaixsl:attribute>
								</iaixsl:if>
								<span class="headline__name_txt">Delivery options for products available <span class="headline__division_literal">after </span></span>
								<span class="headline__division_time">
									<iaixsl:attribute name="data-weeks"><iaixsl:value-of select="/shop/basket/shipping_division_time/@week_amount"/></iaixsl:attribute>
									<iaixsl:attribute name="data-days"><iaixsl:value-of select="/shop/basket/shipping_division_time/@days"/></iaixsl:attribute>
									<iaixsl:attribute name="data-week_day"><iaixsl:value-of select="/shop/basket/shipping_division_time/@week_day"/></iaixsl:attribute>
									<iaixsl:attribute name="data-today"><iaixsl:value-of select="/shop/basket/shipping_division_time/@today"/></iaixsl:attribute>
								</span>
							</span>
							<span class="headline__name --dvp">
								<iaixsl:if test="not(/shop/page/order1/shipping_division/delivery[@type = 'prepaid']) or /shop/page/order1/shipping_division/delivery[@type = 'dvp' and @checked = 'true'] and not(/shop/page/order1/balance/@active='y' and /shop/page/order1/balance/@onlyPrepaid='y')">
									<iaixsl:attribute name="class">headline__name --dvp --active</iaixsl:attribute>
								</iaixsl:if>
								<span class="headline__name_txt">Cash on delivery delivery options for products available <span class="headline__division_literal">after </span></span>
								<span class="headline__division_time">
									<iaixsl:attribute name="data-weeks"><iaixsl:value-of select="/shop/basket/shipping_division_time/@week_amount"/></iaixsl:attribute>
									<iaixsl:attribute name="data-days"><iaixsl:value-of select="/shop/basket/shipping_division_time/@days"/></iaixsl:attribute>
									<iaixsl:attribute name="data-week_day"><iaixsl:value-of select="/shop/basket/shipping_division_time/@week_day"/></iaixsl:attribute>
									<iaixsl:attribute name="data-today"><iaixsl:value-of select="/shop/basket/shipping_division_time/@today"/></iaixsl:attribute>
								</span>
							</span>
						</div>

						
						<iaixsl:if test="count(/shop/page/order1/shipping_division/delivery[@type = 'prepaid']) &gt; 0">
							<div class="order__delivery_section --prepaid">
								<iaixsl:if test="not(/shop/page/order1/shipping_division/delivery[@type = 'dvp' and @checked = 'true'])">
									<iaixsl:attribute name="class">order__delivery_section --prepaid --active</iaixsl:attribute>
								</iaixsl:if>
								<iaixsl:for-each select="/shop/page/order1/shipping_division/delivery[@type = 'prepaid']">
									<div class="order__delivery_group f-group --radio mb-0 px-2  px-sm-3">
										
										<iaixsl:if test="@sameday='true'">
												<iaixsl:attribute name="data-sameday">true</iaixsl:attribute>
												<iaixsl:attribute name="data-xpress_type"><iaixsl:value-of select="@express_courier_type"/></iaixsl:attribute>
										</iaixsl:if>

										
										<iaixsl:attribute name="data-working_days">[<iaixsl:for-each select="working_days/item"><iaixsl:if test="position() != 1">,</iaixsl:if><iaixsl:value-of select="translate(.,'7','0')"/></iaixsl:for-each>]</iaixsl:attribute>

										
										<iaixsl:attribute name="data-id"><iaixsl:value-of select="@id"/></iaixsl:attribute>

										
										<iaixsl:attribute name="data-calendar"><iaixsl:choose><iaixsl:when test="@sameday = 'true'">n</iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@calendar"/></iaixsl:otherwise></iaixsl:choose></iaixsl:attribute>

										
										<iaixsl:attribute name="data-delivery_time"><iaixsl:value-of select="@deliverytime"/></iaixsl:attribute>

										
										<iaixsl:attribute name="data-prepaid">1</iaixsl:attribute>

										
										<iaixsl:attribute name="data-total_time"><iaixsl:value-of select="@time"/></iaixsl:attribute>

										
										<iaixsl:attribute name="data-minute"><iaixsl:choose><iaixsl:when test="@id = '0-1' or @id='0-0'"><iaixsl:value-of select="/shop/page/order1/stocks/stock[@selected = 'selected']/@pickup_days_division"/>#<iaixsl:value-of select="/shop/page/order1/stocks/stock[@selected = 'selected']/@pickup_hours_division"/>#<iaixsl:value-of select="/shop/page/order1/stocks/stock[@selected = 'selected']/@pickup_minutes_division"/>#<iaixsl:choose><iaixsl:when test="@today='true'">0</iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@week_day"/></iaixsl:otherwise></iaixsl:choose>#<iaixsl:value-of select="@week_amount"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@time_days"/>#<iaixsl:value-of select="@time_hours"/>#<iaixsl:value-of select="@time_minutes"/>#<iaixsl:choose><iaixsl:when test="@today='true'">0</iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@week_day"/></iaixsl:otherwise></iaixsl:choose>#<iaixsl:value-of select="@week_amount"/></iaixsl:otherwise></iaixsl:choose></iaixsl:attribute>

										
										<iaixsl:if test="@checked = 'true'">
											<iaixsl:attribute name="data-active">true</iaixsl:attribute>
										</iaixsl:if>

										
										<iaixsl:if test="@minworthreached = 'false'">
											<iaixsl:attribute name="data-disabled">true</iaixsl:attribute>
										</iaixsl:if>

										
									<iaixsl:if test="@loadCourierServicesUrl">
										<iaixsl:attribute name="data-prepaid"><iaixsl:value-of select="@type"/></iaixsl:attribute>
																						<iaixsl:attribute name="data-courier_company_key"><iaixsl:value-of select="@courier_company_key"/></iaixsl:attribute>
																						<iaixsl:attribute name="data-courier_company_group_key"><iaixsl:value-of select="@courier_company_group_key"/></iaixsl:attribute>
									</iaixsl:if>

										
										<input type="radio" name="shipping_division" autocomplete="off" class="order__radio_delivery f-control">
											<iaixsl:attribute name="value"><iaixsl:value-of select="@id"/></iaixsl:attribute>
											<iaixsl:attribute name="id">delivery_division_<iaixsl:value-of select="@id"/></iaixsl:attribute>
											<iaixsl:attribute name="data-did"><iaixsl:value-of select="@did"/></iaixsl:attribute>
											<iaixsl:attribute name="data-type"><iaixsl:value-of select="@type"/></iaixsl:attribute>
											<iaixsl:if test="@checked = 'true'">
												<iaixsl:attribute name="checked">checked</iaixsl:attribute>
											</iaixsl:if>
											<iaixsl:if test="@minworthreached = 'false'">
												<iaixsl:attribute name="disabled">disabled</iaixsl:attribute>
											</iaixsl:if>
										</input>

										
										<label class="order__delivery_label f-label d-flex align-items-center pr-0 py-2">
											<iaixsl:attribute name="for">delivery_division_<iaixsl:value-of select="@id"/></iaixsl:attribute>
											<span class="order__delivery_names d-flex flex-column mr-2 align-items-md-center flex-md-row">
												<strong class="order__delivery_name d-block"><iaixsl:value-of select="@name"/></strong>
												<span class="order__delivery_desc mt-1">
													<iaixsl:choose>
														<iaixsl:when test="@id = '93-1'">
														</iaixsl:when>
														<iaixsl:when test="@loadCourierServicesUrl">
															Select a delivery day
														</iaixsl:when>
														<iaixsl:when test="@minworthreached = 'false'">
															Delivery method available from <iaixsl:value-of select="@minworth_formatted"/>
														</iaixsl:when>
														<iaixsl:when test="not(@sameday='true')">
															<iaixsl:choose>
																<iaixsl:when test="@id = '0-1' or @id='0-0'">
																	<iaixsl:for-each select="/shop/page/order1/stocks/stock[@selected = 'selected']">
																		<iaixsl:choose>
																			<iaixsl:when test="@undefinded_time = 'true'">
																				Unknown
																			</iaixsl:when>
																			<iaixsl:otherwise>
																				<span class="order__delivery_desc_item --txt">Pick up your order - </span>
																				<span class="order__delivery_desc_item --value">
																					<iaixsl:choose>
																						
																						<iaixsl:when test="(@pickup_days_division = 0) and (@pickup_hours_division = 0)">
																							Today
																						</iaixsl:when>
																						
																						<iaixsl:when test="@pickup_days_division &gt; 0">
																							<iaixsl:choose>
																								<iaixsl:when test="@pickup_hours_division &gt; 0">
																									<iaixsl:attribute name="data-pickup_days"><iaixsl:value-of select="@pickup_days_division + 1"/></iaixsl:attribute>
																									after <iaixsl:value-of select="@pickup_days_division + 1"/> days 
																								</iaixsl:when>
																								<iaixsl:otherwise>
																									<iaixsl:attribute name="data-pickup_days"><iaixsl:value-of select="@pickup_days_division"/></iaixsl:attribute>
																									after <iaixsl:value-of select="@pickup_days_division"/>
																									<iaixsl:choose>
																										<iaixsl:when test="@pickup_days_division = '1'">
																												day 
																										</iaixsl:when>
																										<iaixsl:otherwise>
																												days 
																										</iaixsl:otherwise>
																									</iaixsl:choose>
																								</iaixsl:otherwise>
																							</iaixsl:choose>
																						</iaixsl:when>
																						
																						<iaixsl:otherwise>
																							<iaixsl:choose>
																								<iaixsl:when test="@pickup_minutes_division &gt; 0">
																									after <iaixsl:value-of select="@pickup_hours_division + 1"/> hours. 
																								</iaixsl:when>
																								<iaixsl:otherwise>
																									after <iaixsl:value-of select="@pickup_hours_division"/>
																									<iaixsl:choose>
																										<iaixsl:when test="@pickup_hours_division = '1'">
																												hours. 
																										</iaixsl:when>
																										<iaixsl:otherwise>
																												hours. 
																										</iaixsl:otherwise>
																									</iaixsl:choose>
																								</iaixsl:otherwise>
																							</iaixsl:choose>
																						</iaixsl:otherwise>
																					</iaixsl:choose>
																				</span>
																			</iaixsl:otherwise>
																		</iaixsl:choose>
																	</iaixsl:for-each>
																</iaixsl:when>
																<iaixsl:otherwise>
																	<span class="order__delivery_desc_item --txt">Expected delivery - </span>
																	<span class="order__delivery_desc_item --value">
																		<iaixsl:if test="not(@week_amount = 0)">
																			<iaixsl:attribute name="data-time"><iaixsl:value-of select="@time"/></iaixsl:attribute>
																		</iaixsl:if>
																		<iaixsl:choose>
																			<iaixsl:when test="@today = 'true'">
																				Today
																			</iaixsl:when>
																			<iaixsl:when test="@week_day = 1">
																				Monday
																			</iaixsl:when>
																			<iaixsl:when test="@week_day = 2">
																				Tuesday
																			</iaixsl:when>
																			<iaixsl:when test="@week_day = 3">
																				Wednesday
																			</iaixsl:when>
																			<iaixsl:when test="@week_day = 4">
																				Thursday
																			</iaixsl:when>
																			<iaixsl:when test="@week_day = 5">
																				Friday
																			</iaixsl:when>
																			<iaixsl:when test="@week_day = 6">
																				Saturday
																			</iaixsl:when>
																			<iaixsl:when test="@week_day = 7">
																				Sunday
																			</iaixsl:when>
																		</iaixsl:choose>
																	</span>
																</iaixsl:otherwise>
															</iaixsl:choose>
														</iaixsl:when>
													</iaixsl:choose>
													<iaixsl:if test="@comment != ''">
														<span class="order__delivery_comment"><iaixsl:value-of select="@comment"/></span>
													</iaixsl:if>
												</span>
											</span>

											<span class="order__delivery_sub d-flex flex-column align-items-center justify-content-center flex-md-row">
												
												<iaixsl:if test="not(/shop/page/order1/shipping_division/@hide_cost='true')">
													<span class="order__delivery_cost mb-1 mb-md-0 mr-md-3 mr-lg-4 d-flex flex-column">
														<iaixsl:choose>
															
															<iaixsl:when test="@points_enabled">
																<iaixsl:attribute name="data-points">true</iaixsl:attribute>
																<strong class="order__delivery_price --points f-group --small --radio mb-0">
																	<input type="radio" name="shipping_for_points_division" value="0" class="order__radio_points f-control"/>
																	<label class="order__points_label f-label pr-0"><iaixsl:value-of select="@cost_formatted"/></label>
																</strong>
																<span class="order__delivery_points f-group --small --radio mb-0">
																	<input type="radio" name="shipping_for_points_division" value="1" class="order__radio_points f-control">
																		<iaixsl:if test="@points_enabled = 'false'">
																			<iaixsl:attribute name="disabled">disabled</iaixsl:attribute>
																		</iaixsl:if>
																	</input>
																	<label class="order__points_label f-label pr-0">
																		<iaixsl:if test="@points_enabled = 'false'">
																			<iaixsl:attribute name="title">You do not have enough points.</iaixsl:attribute>
																		</iaixsl:if>
																		<iaixsl:value-of select="@points_cost"/> pts.
																	</label>
																</span>
															</iaixsl:when>
															
															<iaixsl:otherwise>
																<iaixsl:if test="@beforerebate_formatted">
																	<del class="order__delivery_price_max">
																			<iaixsl:value-of select="@beforerebate_formatted"/>
																	</del>
																</iaixsl:if>
																<strong class="order__delivery_price">
																	<iaixsl:choose>
																		<iaixsl:when test="@cost &gt; 0">
																			<iaixsl:if test="@limitfree &gt; 0"><iaixsl:attribute name="title">From <iaixsl:value-of select="@limitfree_formatted"/> free</iaixsl:attribute></iaixsl:if>
																			<iaixsl:value-of select="@cost_formatted"/>
																		</iaixsl:when>
																		<iaixsl:otherwise>
																			Free!
																		</iaixsl:otherwise>
																	</iaixsl:choose>
																</strong>
															</iaixsl:otherwise>
														</iaixsl:choose>
													</span>
												</iaixsl:if>

												
												<span class="order__delivery_icons d-flex justify-content-end">
													<iaixsl:choose>
															<iaixsl:when test="@id = '93-1'">
																	<img class="order__delivery_img" src="/gfx/standards/online_delivery.png?r=1696937716">
																			<iaixsl:attribute name="alt"><iaixsl:value-of select="@name"/></iaixsl:attribute>
																			<iaixsl:attribute name="title"><iaixsl:value-of select="@name"/></iaixsl:attribute>
																	</img>
															</iaixsl:when>
															<iaixsl:otherwise>
																	<iaixsl:if test="@icon">
																			<img class="order__delivery_img"><iaixsl:attribute name="src"><iaixsl:value-of select="@icon"/></iaixsl:attribute><iaixsl:attribute name="alt"><iaixsl:value-of select="@name"/></iaixsl:attribute><iaixsl:attribute name="title"><iaixsl:value-of select="@name"/></iaixsl:attribute></img>
																	</iaixsl:if>
															</iaixsl:otherwise>
													</iaixsl:choose>
												</span>
											</span>
										</label>
									</div>
								</iaixsl:for-each>
							</div>
						</iaixsl:if>

						
						<iaixsl:if test="count(/shop/page/order1/shipping_division/delivery[@type = 'dvp']) &gt; 0">
							<div class="order__delivery_section --dvp">
								<iaixsl:if test="not(/shop/page/order1/shipping_division/delivery[@type = 'prepaid']) or /shop/page/order1/shipping_division/delivery[@type = 'dvp' and @checked = 'true'] and not(/shop/page/order1/balance/@active='y' and /shop/page/order1/balance/@onlyPrepaid='y')">
									<iaixsl:attribute name="class">order__delivery_section --dvp --active</iaixsl:attribute>
								</iaixsl:if>

								<iaixsl:for-each select="/shop/page/order1/shipping_division/delivery[@type = 'dvp']">
									<div class="order__delivery_group f-group --radio mb-0 px-2  px-sm-3">
										
										<iaixsl:if test="@sameday='true'">
												<iaixsl:attribute name="data-sameday">true</iaixsl:attribute>
												<iaixsl:attribute name="data-xpress_type"><iaixsl:value-of select="@express_courier_type"/></iaixsl:attribute>
										</iaixsl:if>

										
										<iaixsl:attribute name="data-working_days">[<iaixsl:for-each select="working_days/item"><iaixsl:if test="position() != 1">,</iaixsl:if><iaixsl:value-of select="translate(.,'7','0')"/></iaixsl:for-each>]</iaixsl:attribute>

										
										<iaixsl:attribute name="data-id"><iaixsl:value-of select="@id"/></iaixsl:attribute>

										
										<iaixsl:attribute name="data-calendar"><iaixsl:choose><iaixsl:when test="@sameday = 'true'">n</iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@calendar"/></iaixsl:otherwise></iaixsl:choose></iaixsl:attribute>

										
										<iaixsl:attribute name="data-delivery_time"><iaixsl:value-of select="@deliverytime"/></iaixsl:attribute>

										
										<iaixsl:attribute name="data-prepaid">1</iaixsl:attribute>

										
										<iaixsl:attribute name="data-total_time"><iaixsl:value-of select="@time"/></iaixsl:attribute>

										
										<iaixsl:attribute name="data-minute"><iaixsl:choose><iaixsl:when test="@id = '0-1' or @id='0-0'"><iaixsl:value-of select="/shop/page/order1/stocks/stock[@selected = 'selected']/@pickup_days_division"/>#<iaixsl:value-of select="/shop/page/order1/stocks/stock[@selected = 'selected']/@pickup_hours_division"/>#<iaixsl:value-of select="/shop/page/order1/stocks/stock[@selected = 'selected']/@pickup_minutes_division"/>#<iaixsl:choose><iaixsl:when test="@today='true'">0</iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@week_day"/></iaixsl:otherwise></iaixsl:choose>#<iaixsl:value-of select="@week_amount"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@time_days"/>#<iaixsl:value-of select="@time_hours"/>#<iaixsl:value-of select="@time_minutes"/>#<iaixsl:choose><iaixsl:when test="@today='true'">0</iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@week_day"/></iaixsl:otherwise></iaixsl:choose>#<iaixsl:value-of select="@week_amount"/></iaixsl:otherwise></iaixsl:choose></iaixsl:attribute>

										
										<iaixsl:if test="@checked = 'true'">
											<iaixsl:attribute name="data-active">true</iaixsl:attribute>
										</iaixsl:if>

										
										<iaixsl:if test="@minworthreached = 'false'">
											<iaixsl:attribute name="data-disabled">true</iaixsl:attribute>
										</iaixsl:if>

										
																						<iaixsl:if test="@loadCourierServicesUrl">
																								<iaixsl:attribute name="data-prepaid"><iaixsl:value-of select="@type"/></iaixsl:attribute>
																								<iaixsl:attribute name="data-courier_company_key"><iaixsl:value-of select="@courier_company_key"/></iaixsl:attribute>
																								<iaixsl:attribute name="data-courier_company_group_key"><iaixsl:value-of select="@courier_company_group_key"/></iaixsl:attribute>
																						</iaixsl:if>

										
										<input type="radio" name="shipping_division" autocomplete="off" class="order__radio_delivery f-control">
											<iaixsl:attribute name="value"><iaixsl:value-of select="@id"/></iaixsl:attribute>
											<iaixsl:attribute name="id">delivery_division_<iaixsl:value-of select="@id"/></iaixsl:attribute>
											<iaixsl:attribute name="data-did"><iaixsl:value-of select="@did"/></iaixsl:attribute>
											<iaixsl:attribute name="data-type"><iaixsl:value-of select="@type"/></iaixsl:attribute>
											<iaixsl:if test="@checked = 'true' and not(/shop/page/order1/balance/@active='y' and /shop/page/order1/balance/@onlyPrepaid='y')">
												<iaixsl:attribute name="checked">checked</iaixsl:attribute>
											</iaixsl:if>
											<iaixsl:if test="@minworthreached = 'false'">
												<iaixsl:attribute name="disabled">disabled</iaixsl:attribute>
											</iaixsl:if>
										</input>

										
										<label class="order__delivery_label f-label d-flex align-items-center pr-0 py-2">
											<iaixsl:attribute name="for">delivery_division_<iaixsl:value-of select="@id"/></iaixsl:attribute>
											<span class="order__delivery_names d-flex flex-column mr-2 align-items-md-center flex-md-row">
												<strong class="order__delivery_name d-block"><iaixsl:value-of select="@name"/></strong>
												<span class="order__delivery_desc mt-1">
													<iaixsl:choose>
														<iaixsl:when test="@loadCourierServicesUrl">
															Select a delivery day
														</iaixsl:when>
														<iaixsl:when test="@minworthreached = 'false'">
															Delivery method available from <iaixsl:value-of select="@minworth_formatted"/>
														</iaixsl:when>
														<iaixsl:when test="not(@sameday='true')">
															<iaixsl:choose>
																<iaixsl:when test="@id = '0-1' or @id='0-0'">
																	<iaixsl:for-each select="/shop/page/order1/stocks/stock[@selected = 'selected']">
																		<iaixsl:choose>
																			<iaixsl:when test="@undefinded_time = 'true'">
																				Unknown
																			</iaixsl:when>
																			<iaixsl:otherwise>
																				<span class="order__delivery_desc_item --txt">Pick up your order - </span>
																				<span class="order__delivery_desc_item --value">
																					<iaixsl:choose>
																						
																						<iaixsl:when test="(@pickup_days_division = 0) and (@pickup_hours_division = 0)">
																							Today
																						</iaixsl:when>
																						
																						<iaixsl:when test="@pickup_days_division &gt; 0">
																							<iaixsl:choose>
																								<iaixsl:when test="@pickup_hours_division &gt; 0">
																									<iaixsl:attribute name="data-pickup_days"><iaixsl:value-of select="@pickup_days_division + 1"/></iaixsl:attribute>
																									after <iaixsl:value-of select="@pickup_days_division + 1"/> days 
																								</iaixsl:when>
																								<iaixsl:otherwise>
																									<iaixsl:attribute name="data-pickup_days"><iaixsl:value-of select="@pickup_days_division"/></iaixsl:attribute>
																									after <iaixsl:value-of select="@pickup_days_division"/>
																									<iaixsl:choose>
																										<iaixsl:when test="@pickup_days_division = '1'">
																												day 
																										</iaixsl:when>
																										<iaixsl:otherwise>
																												days 
																										</iaixsl:otherwise>
																									</iaixsl:choose>
																								</iaixsl:otherwise>
																							</iaixsl:choose>
																						</iaixsl:when>
																						
																						<iaixsl:otherwise>
																							<iaixsl:choose>
																								<iaixsl:when test="@pickup_minutes_division &gt; 0">
																									after <iaixsl:value-of select="@pickup_hours_division + 1"/> hours. 
																								</iaixsl:when>
																								<iaixsl:otherwise>
																									after <iaixsl:value-of select="@pickup_hours_division"/>
																									<iaixsl:choose>
																										<iaixsl:when test="@pickup_hours_division = '1'">
																												hours. 
																										</iaixsl:when>
																										<iaixsl:otherwise>
																												hours. 
																										</iaixsl:otherwise>
																									</iaixsl:choose>
																								</iaixsl:otherwise>
																							</iaixsl:choose>
																						</iaixsl:otherwise>
																					</iaixsl:choose>
																				</span>
																			</iaixsl:otherwise>
																		</iaixsl:choose>
																	</iaixsl:for-each>
																</iaixsl:when>
																<iaixsl:otherwise>
																	<span class="order__delivery_desc_item --txt">Expected delivery - </span>
																	<span class="order__delivery_desc_item --value">
																		<iaixsl:if test="not(@week_amount = 0)">
																			<iaixsl:attribute name="data-time"><iaixsl:value-of select="@time"/></iaixsl:attribute>
																		</iaixsl:if>
																		<iaixsl:choose>
																			<iaixsl:when test="@today = 'true'">
																				Today
																			</iaixsl:when>
																			<iaixsl:when test="@week_day = 1">
																				Monday
																			</iaixsl:when>
																			<iaixsl:when test="@week_day = 2">
																				Tuesday
																			</iaixsl:when>
																			<iaixsl:when test="@week_day = 3">
																				Wednesday
																			</iaixsl:when>
																			<iaixsl:when test="@week_day = 4">
																				Thursday
																			</iaixsl:when>
																			<iaixsl:when test="@week_day = 5">
																				Friday
																			</iaixsl:when>
																			<iaixsl:when test="@week_day = 6">
																				Saturday
																			</iaixsl:when>
																			<iaixsl:when test="@week_day = 7">
																				Sunday
																			</iaixsl:when>
																		</iaixsl:choose>
																	</span>
																</iaixsl:otherwise>
															</iaixsl:choose>
														</iaixsl:when>
													</iaixsl:choose>
													<iaixsl:if test="@comment != ''">
														<span class="order__delivery_comment"><iaixsl:value-of select="@comment"/></span>
													</iaixsl:if>
												</span>
											</span>

											<span class="order__delivery_sub d-flex flex-column align-items-center justify-content-center flex-md-row">
												
												<iaixsl:if test="not(/shop/page/order1/shipping_division/@hide_cost='true')">
													<span class="order__delivery_cost mb-1 mb-md-0 mr-md-3 mr-lg-4 d-flex flex-column">
														<iaixsl:choose>
															
															<iaixsl:when test="@points_enabled">
																<iaixsl:attribute name="data-points">true</iaixsl:attribute>
																<strong class="order__delivery_price --points f-group --small --radio mb-0">
																	<input type="radio" name="shipping_for_points_division" value="0" class="order__radio_points f-control"/>
																	<label class="order__points_label f-label pr-0"><iaixsl:value-of select="@cost_formatted"/></label>
																</strong>
																<span class="order__delivery_points f-group --small --radio mb-0">
																	<input type="radio" name="shipping_for_points_division" value="1" class="order__radio_points f-control">
																		<iaixsl:if test="@points_enabled = 'false'">
																			<iaixsl:attribute name="disabled">disabled</iaixsl:attribute>
																		</iaixsl:if>
																	</input>
																	<label class="order__points_label f-label pr-0">
																		<iaixsl:if test="@points_enabled = 'false'">
																			<iaixsl:attribute name="title">You do not have enough points.</iaixsl:attribute>
																		</iaixsl:if>
																		<iaixsl:value-of select="@points_cost"/> pts.
																	</label>
																</span>
															</iaixsl:when>
															
															<iaixsl:otherwise>
																<iaixsl:if test="@beforerebate_formatted">
																	<del class="order__delivery_price_max">
																			<iaixsl:value-of select="@beforerebate_formatted"/>
																	</del>
																</iaixsl:if>
																<strong class="order__delivery_price">
																	<iaixsl:choose>
																		<iaixsl:when test="@cost &gt; 0">
																			<iaixsl:if test="@limitfree &gt; 0"><iaixsl:attribute name="title">From <iaixsl:value-of select="@limitfree_formatted"/> free</iaixsl:attribute></iaixsl:if>
																			<iaixsl:value-of select="@cost_formatted"/>
																		</iaixsl:when>
																		<iaixsl:otherwise>
																			Free!
																		</iaixsl:otherwise>
																	</iaixsl:choose>
																</strong>
															</iaixsl:otherwise>
														</iaixsl:choose>
													</span>
												</iaixsl:if>

												
												<span class="order__delivery_icons d-flex justify-content-end">
													<iaixsl:choose>
															<iaixsl:when test="@id = '93-1'">
																	<img class="order__delivery_img" src="/gfx/standards/online_delivery.png?r=1696937716">
																			<iaixsl:attribute name="alt"><iaixsl:value-of select="@name"/></iaixsl:attribute>
																			<iaixsl:attribute name="title"><iaixsl:value-of select="@name"/></iaixsl:attribute>
																	</img>
															</iaixsl:when>
															<iaixsl:otherwise>
																	<iaixsl:if test="@icon">
																			<img class="order__delivery_img"><iaixsl:attribute name="src"><iaixsl:value-of select="@icon"/></iaixsl:attribute><iaixsl:attribute name="alt"><iaixsl:value-of select="@name"/></iaixsl:attribute><iaixsl:attribute name="title"><iaixsl:value-of select="@name"/></iaixsl:attribute></img>
																	</iaixsl:if>
															</iaixsl:otherwise>
													</iaixsl:choose>
												</span>
											</span>
										</label>
									</div>
								</iaixsl:for-each>
							</div>
						</iaixsl:if>

						
						<div class="order__time align-items-center p-2 flex-wrap justify-content-center px-sm-3">
							<iaixsl:if test="/shop/basket/delay_time/@unknown_delivery_time = 'true' or /shop/page/order1/shipping_division/delivery[@id = '93-1']">
								<iaixsl:attribute name="data-unknown">true</iaixsl:attribute>
							</iaixsl:if>
							
							<div class="order__time_calendar mt-1 mt-sm-0 ml-sm-3">
								<a href="#preferred_delivery_day" class="order__time_btn btn --icon-left icon-clock py-0">Choose a different delivery day</a>
							</div>
						</div>

						
						<div class="order__calendar p-2 mt-3 p-md-3">
							<strong class="order__calendar_label d-block mb-1 mb-sm-2">Select a preferred date of delivery</strong>
							<div class="order__calendar_block row mx-n1">
								
								<iaixsl:if test="/shop/page/order1/deliverytime_own/@use = 'true'">
									<iaixsl:attribute name="data-own"><iaixsl:for-each select="/shop/page/order1/deliverytime_own/date"><iaixsl:value-of select="@date"/><iaixsl:if test="not(position() = count(/shop/page/order1/deliverytime_own/date))">,</iaixsl:if></iaixsl:for-each></iaixsl:attribute>
								</iaixsl:if>

								
								<iaixsl:if test="/shop/page/order1/order_calendar">
									<iaixsl:attribute name="data-calendar"><iaixsl:value-of select="/shop/page/order1/order_calendar/@date_y"/>-<iaixsl:value-of select="/shop/page/order1/order_calendar/@date_m"/>-<iaixsl:value-of select="/shop/page/order1/order_calendar/@date_d"/></iaixsl:attribute>
									<iaixsl:attribute name="data-calendar_select"><iaixsl:value-of select="/shop/page/order1/order_calendar/@select_y"/>-<iaixsl:value-of select="/shop/page/order1/order_calendar/@select_m"/>-<iaixsl:value-of select="/shop/page/order1/order_calendar/@select_d"/></iaixsl:attribute>
									<iaixsl:if test="/shop/page/order1/order_calendar/holiday">
										<iaixsl:attribute name="data-holiday"><iaixsl:for-each select="/shop/page/order1/order_calendar/holiday"><iaixsl:value-of select="@date"/><iaixsl:if test="not(position() = count(/shop/page/order1/order_calendar/holiday))">,</iaixsl:if></iaixsl:for-each></iaixsl:attribute>
									</iaixsl:if>
								</iaixsl:if>

								
								<div class="order__date col-4 p-1 col-sm-3 col-md-2">
									<input type="radio" name="calendar_select_date_division" class="order__date_radio d-none"/>
									<label class="order__date_label d-flex flex-column align-items-center justify-content-around p-2">
										<iaixsl:attribute name="title">Click to select the delivery date</iaixsl:attribute>
										<strong class="order__date_day"/>
										<span class="order__date_month"/>
										<strong class="order__services_cost"/>
									</label>
								</div>

								
								<div class="order__date --other col-4 p-1 col-sm-3 col-md-2">
									<label class="order__date_label d-flex flex-column align-items-center justify-content-around p-2">
										<iaixsl:attribute name="title">Click to select another date</iaixsl:attribute>
										<span class="order__date_other">Another day</span>
									</label>
									<div class="order__datepicker"/>
								</div>
							</div>

							
							<div class="order__calendar_hour flex-column mt-2 flex-sm-row align-items-sm-center justify-content-sm-center">
								<span class="order__hour_txt mb-1 mb-sm-0 mr-sm-2">You can also provide a preferred range of hours (i.e. 1PM - 4PM)</span>
								<input type="text" name="calendar_select_hour_division" class="order__hour_input" maxlength="50"/>
							</div>

							
							<div class="order__calendar_services flex-column mt-2 flex-sm-row align-items-sm-center justify-content-sm-center">
								<span class="order__services_txt mb-1 mb-sm-0 mr-sm-2">Dodatkowa usługa</span>
								<input type="hidden" class="order__calendar_services_points" name="calendar_services_points_division" value="0"/>
								<select name="calendar_services_division" class="order__services_select f-select mb-0 --small">
								</select>
							</div>
							<input type="hidden" name="calendar_select_active_division" class="order__select_day" value="0"/>
						</div>

						
						<iaixsl:if test="/shop/page/order1/shipping_division/delivery/@sameday = 'true'">
							<div class="order__xpress p-2 p-md-3">
								<div class="order__xpress_show d-flex flex-column align-items-center">
									<a class="order__xpress_button btn --solid --medium  mb-2" href="#showSameday">Choose your preferred delivery date</a>
									<span class="order__xpress_info">* choice is required to move on </span>
								</div>
								<div class="order__xpress_choice mt-2 pt-2 flex-column align-items-center mt-md-3 pt-md-3">
									<div class="order__xpress_group f-group --radio">
										<input type="radio" name="sameDayServiceId_division" class="order__xpress_radio f-control" value=""/>
										<label class="order__xpress_label f-label"/>
									</div>
								</div>
								<div class="order__xpress_not mt-2 pt-2 mt-md-3 pt-md-3">Sorry, delivery times are not available at this time</div>
							</div>
						</iaixsl:if>
					</section>
				</iaixsl:if>
			</div>
		</div>

		
		<iaixsl:if test="/shop/page/order1/insurance_products/item[@service='TrustedShops']">
			<div class="order__insurance mb-3 p-2 mb-md-5 p-md-3">
				<strong class="order__insruance_headline d-block mb-2 mb-sm-3"><iaixsl:value-of disable-output-escaping="yes" select="/shop/page/order1/insurance_products/item[@service='TrustedShops']/@name"/></strong>
				<div class="order__insruance_block d-flex flex-column align-items-center flex-sm-row align-items-sm-start">
					<a target="_blank" class="order__insruance_icon d-block mb-2 mb-sm-0 mr-sm-3">
						<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/page/order1/insurance_products/item[@service='TrustedShops']/@icon_target"/></iaixsl:attribute>
						<img>
							<iaixsl:attribute name="src"><iaixsl:value-of select="/shop/page/order1/insurance_products/item[@service='TrustedShops']/@icon_src"/></iaixsl:attribute>
							<iaixsl:attribute name="title"><iaixsl:value-of select="/shop/page/order1/insurance_products/item[@service='TrustedShops']/@icon_title"/></iaixsl:attribute>
							<iaixsl:attribute name="alt"><iaixsl:value-of select="/shop/page/order1/insurance_products/item[@service='TrustedShops']/@name"/></iaixsl:attribute>
						</img>
					</a>
					<div class="order__insruance_description">
						<div class="order__insruance_group f-group --checkbox">
							<input id="orderInsuranceCheckbox" type="checkbox" name="add_insurance" value="true" class="order__insruance_checkbox f-control">
								<iaixsl:if test="/shop/page/order1/insurance_products/item[@service='TrustedShops']/@checked = 'true'">
									<iaixsl:attribute name="checked">checked</iaixsl:attribute>
								</iaixsl:if>
							</input>
							<label for="orderInsuranceCheckbox" class="order__insruance_label f-label"><iaixsl:value-of disable-output-escaping="yes" select="/shop/page/order1/insurance_products/item[@service='TrustedShops']/@product_desc"/></label>
						</div>
						<div class="order__insruance_text"><iaixsl:value-of disable-output-escaping="yes" select="/shop/page/order1/insurance_products/item[@service='TrustedShops']/@description"/></div>
					</div>
				</div>
			</div>
		</iaixsl:if>

		
		<iaixsl:if test="/shop/basket/delay_time/@unknown_delivery_time = 'true'">
			<div class="unknown_delivery_time mb-3 mb-md-5">
				<i class="icon-truck"/>
				<div>
					<b>Basket includes products imported on order.</b> To estimate time of preparing product for shipment,
					<a target="_blank">
						<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/contact/link/@url"/></iaixsl:attribute>
						please contact the shop staff.
					</a>
				</div>
			</div>
		</iaixsl:if>
	</form>

	
	<iaixsl:if test="/shop/page/order1/prepaid_methods/item[@id = '190']">
		<div class="order__giftcard">
			
			<div class="order__giftcard_headlines d-flex flex-column align-items-center mb-3">
				<strong class="order__giftcard_headline">Gift card</strong>
				<span class="order__giftcard_description">Pay with your Gift card</span>
			</div>
			
			<div class="order__giftcard_wrapper row mx-n1">
				<div class="order__giftcard_group --number f-group col-12 px-1">
					<div class="order__giftcard_feedback f-feedback --required">
						<input id="order_giftcard_id" class="order__giftcard_input f-control" value="" name="voucher_id" type="text"/>
						<label class="order__giftcard_label f-label" for="order_giftcard_id">Number</label>
						<span class="order__giftcard_status f-control-feedback"/>
					</div>
				</div>
				<div class="order__giftcard_group --pin f-group col-12 px-1">
					<div class="order__giftcard_feedback f-feedback --required">
						<input id="order_pin_value" class="order__giftcard_input f-control" value="" name="pin_value" type="password"/>
						<label class="order__giftcard_label f-label" for="order_pin_value">PIN</label>
						<span class="order__giftcard_status f-control-feedback"/>
					</div>
				</div>
			</div>
			
			<div class="order__giftcard_buttons">
				<button class="order__giftcard_button btn --solid --medium">Enter your card</button>
			</div>
		</div>
	</iaixsl:if>

	
	<iaixsl:if test="/shop/page/order1/prepaid_methods/item[@id = '2']">
		<div class="order__voucher">
			
			<div class="order__voucher_headlines d-flex flex-column align-items-center mb-3">
				<strong class="order__voucher_headline">Voucher</strong>
				<span class="order__voucher_description">Pay with voucher</span>
			</div>
			
			<div class="order__voucher_wrapper row mx-n1">
				<div class="order__voucher_group --number f-group col-12 px-1">
					<div class="order__voucher_feedback f-feedback --required">
						<input id="order_voucher_id" class="order__voucher_input f-control" value="" name="voucher_id" type="text"/>
						<label class="order__voucher_label f-label" for="order_voucher_id">Number</label>
						<span class="order__voucher_status f-control-feedback"/>
					</div>
				</div>
			</div>
			
			<div class="order__voucher_buttons">
				<button class="order__voucher_button btn --solid --medium">Pay with voucher</button>
			</div>
			<small class="order__voucher_info mt-3 d-block">If you have more than one voucher, you can enter their numbers at the end of the order.</small>
		</div>
	</iaixsl:if>

	<iaixsl:if test="/shop/page/order1/prepaid_methods/item/@method_as_group"/>
	<iaixsl:if test="/shop/page/order1/balance/@tradeCredit"> </iaixsl:if>
	<iaixsl:if test="/shop/page/order1/shipping/delivery/@loadCourierServicesUrl"> </iaixsl:if>
	<iaixsl:if test="/shop/page/order1/wrappers/wrapper"> </iaixsl:if>

	
	<script>
		const clientDataUsesVat = &apos;<iaixsl:value-of select="/shop/client_data/@uses_vat"/>&apos;;
	</script>
<!-- (order1_summary, 610bfde295f562.00501685.5)-->
	<section class="summary --order1 p-2 p-md-0">
		<div class="summary__block --top d-flex flex-column p-md-3 flex-md-row justify-content-md-between">
			<div class="summary__sub --left">
				<iaixsl:if test="/shop/client_data/client_balance/limit/@value &gt; '0'">
					<div class="summary__limits pb-2 mb-2 pb-md-0 mb-md-0">
						<div class="summary__limit --total d-flex justify-content-between align-items-center">
							<span class="summary__limit_label">Credit limit:</span>
							<strong class="summary__limit_value"><iaixsl:value-of select="/shop/client_data/client_balance/limit/@value_formatted"/></strong>
						</div>
						<div class="summary__limit --touse d-flex justify-content-between align-items-center">
							<span class="summary__limit_label">Remaining credit limit:</span>
							<strong class="summary__limit_value"><iaixsl:value-of select="/shop/client_data/client_balance/limit/@to_use_formatted"/></strong>
						</div>
					</div>
				</iaixsl:if>
			</div>

			<div class="summary__sub --right">
				<div class="summary__calculations">
					
					<div class="summary__calculation --active --worth">
						<span class="summary__calculation_label">Order value:</span>
						<strong class="summary__calculation_value --worth"/>
					</div>
					
					<div class="summary__calculation --active --shipping">
						<span class="summary__calculation_label">Delivery cost:</span>
						<strong class="summary__calculation_value --shipping --plus"/>
					</div>
					
					<div class="summary__calculation --active --paymentcost">
						<span class="summary__calculation_label">Payment method cost:</span>
						<strong class="summary__calculation_value --paymentcost --plus"/>
					</div>
					
					<div class="summary__calculation --active --insurance">
						<span class="summary__calculation_label">Insurance cost:</span>
						<strong class="summary__calculation_value --insurance --plus"/>
					</div>
					
					<div class="summary__calculation --active --rebate">
						<span class="summary__calculation_label">Discount:</span>
						<strong class="summary__calculation_value --rebate --minus"/>
					</div>
					
					
					<iaixsl:if test="/shop/client_data/client_balance/balance/@is_selected_and_allowed_order='true' and /shop/client_data/client_balance/balance[@is_selected_and_allowed_order='true']/@value != 0">
						<div class="summary__calculation --active --balance">
							<span class="summary__calculation_label">Paid from the balance:<br/>(overpayment on a customer's account)</span>
							<strong class="summary__calculation_value --balance --minus"><iaixsl:value-of select="/shop/client_data/client_balance/balance[@is_selected_and_allowed_order='true']/@currency_value_formatted"/></strong>
						</div>
					</iaixsl:if>
					
					<div class="summary__calculation --active --prepaid_discount">
						<span class="summary__calculation_label">If you pay for your order by <span class="summary__prepaid_discount"/> you will receive an additional discount:</span>
						<strong class="summary__calculation_value --prepaid_discount --minus"/>
					</div>
					
					<iaixsl:if test="/shop/page/order1/additional/advance/@value &gt; 0">
						<div class="summary__calculation --advance">
							<span class="summary__calculation_label">Required advance payment:</span>
							<strong class="summary__calculation_value --advance">
								<iaixsl:attribute name="data-dvp"><iaixsl:value-of select="/shop/page/order1/additional/advance/@cash_on_delivery"/></iaixsl:attribute>
								<iaixsl:attribute name="data-prepaid"><iaixsl:value-of select="/shop/page/order1/additional/advance/@prepaid"/></iaixsl:attribute>
								<iaixsl:value-of select="/shop/page/order1/additional/advance/@value_formatted"/>
							</strong>
						</div>
					</iaixsl:if>
					
					<div class="summary__calculation --active --total">
						<span class="summary__calculation_label">Total to pay:</span>
						<strong class="summary__calculation_value --total">--
							<iaixsl:if test="(/shop/basket/@points_used) and (/shop/basket/@points_used != 0)">
								<small class="summary__points --plus"><iaixsl:value-of select="/shop/basket/@points_used"/>pts.</small>
							</iaixsl:if>
						</strong>
					</div>
				</div>
			</div>
		</div>

		<div class="summary__block --bottom d-flex flex-column flex-sm-row justify-content-sm-end align-items-sm-center p-md-3 flex-md-row">
			
			<div class="summary__time mb-2 mb-sm-0 mr-sm-3">
				<iaixsl:if test="/shop/basket/delay_time/@unknown_delivery_time = 'true'">
					<iaixsl:attribute name="data-unknown">true</iaixsl:attribute>
				</iaixsl:if>
				<iaixsl:if test="/shop/page/order1/shipping_division">
					<iaixsl:attribute name="data-division">true</iaixsl:attribute>
				</iaixsl:if>
				<div class="summary__time_item --shipping">
					<iaixsl:if test="not(/shop/basket/shipping_time/@week_amount = 0) or not(/shop/basket/shipping_time/@hours = 0) or not(/shop/basket/shipping_time/@minutes = 0) or /shop/page/order1/shipping/delivery[@id = '93-1']">
						<iaixsl:attribute name="data-hide">true</iaixsl:attribute>
					</iaixsl:if>
					<span class="summary__shipping">
						<span class="summary__shipping_item --txt">Order will be ready for shipment </span>
						<strong class="summary__shipping_item --value">
							<iaixsl:choose>
								<iaixsl:when test="/shop/basket/shipping_time/@today = 'true'">
									<iaixsl:attribute name="data-shipping_time">0</iaixsl:attribute>
								</iaixsl:when>
								<iaixsl:otherwise>
									<iaixsl:attribute name="data-shipping_time"><iaixsl:value-of select="/shop/basket/shipping_time/@week_day"/></iaixsl:attribute>
								</iaixsl:otherwise>
							</iaixsl:choose>
						</strong>
					</span>
				</div>
				<div class="summary__time_item --delivery --active">
					
					
						<iaixsl:attribute name="data-hide">true</iaixsl:attribute>
					
					<span class="summary__delivery">
						<span class="summary__delivery_item --txt"/>
						<strong class="summary__delivery_item --value"/>
						<span class="summary__delivery_item --de"/>
						<span class="summary__delivery_item --hour"/>
					</span>
				</div>
			</div>
			
			<div class="summary__buttons">
				<a href="#order2" class="btn --solid --large --icon-right icon-angle-right summary__button">Forward</a>
			</div>
		</div>
	</section>

				</div>
			</iaixsl:if>
		</div>
	</div>

	
	<iaixsl:if test="not(action/set_render/item) or (action/set_render/item/@name = 'footer')">
		<footer>
			<iaixsl:attribute name="class">max-width-1200</iaixsl:attribute>
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
					ORDERS
				</a>
				<ul class="footer_links_sub">
					<li id="order_status" class="menu_orders_item">
						<i class="icon-battery"/>
						<a>
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/orderOpen/@url"/></iaixsl:attribute>
							Order status
						</a>
					</li>
					<li id="order_status2" class="menu_orders_item">
						<i class="icon-truck"/>
						<a>
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/orderOpen/@url"/></iaixsl:attribute>
							Package tracking
						</a>
					</li>
					<li id="order_rma" class="menu_orders_item">
						<i class="icon-sad-face"/>
						<a>
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/addRma/@url"/></iaixsl:attribute>
							I want to make a complaint about the product
						</a>
					</li>
					<li id="order_returns" class="menu_orders_item">
						<i class="icon-refresh-dollar"/>
						<a>
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/addReturn/@url"/></iaixsl:attribute>
							I want to return the product
						</a>
					</li>
					<li id="order_exchange" class="menu_orders_item">
						<i class="icon-return-box"/>
						<a>
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/returnExchangeLink/@url"/></iaixsl:attribute>
							I want to exchange the product
						</a>
					</li>
					<iaixsl:variable name="order_contact_literal">true</iaixsl:variable>
					<iaixsl:if test="$order_contact_literal">
						<li id="order_contact" class="menu_orders_item">
							<i class="icon-phone"/>
							<a>
								<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/contact/link/@url"/></iaixsl:attribute>
								Contact
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
					Account
				</a>
				<ul class="footer_links_sub">
					<iaixsl:choose>
						<iaixsl:when test="basket/@login">
							<li id="account_register" class="menu_orders_item">
								<i class="icon-user"/>
								<a>
									<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/loginEdit/@url"/></iaixsl:attribute>
									Billing and shipping information
								</a>
							</li>
						</iaixsl:when>
						<iaixsl:otherwise>
							<iaixsl:for-each select="/shop/action/registration_options/wholesale">
								<li id="account_register_wholesale" class="menu_orders_item">
									<i class="icon-wholesaler-register"/>
									<a>
										<iaixsl:attribute name="href"><iaixsl:value-of select="@registration_url"/></iaixsl:attribute>
										Register as a wholesaler
									</a>
								</li>
							</iaixsl:for-each>
							<iaixsl:for-each select="/shop/action/registration_options/retail">
								<li id="account_register_retail" class="menu_orders_item">
									<i class="icon-register-card"/>
									<a>
										<iaixsl:attribute name="href"><iaixsl:value-of select="@registration_url"/></iaixsl:attribute>
										Register
									</a>
								</li>
							</iaixsl:for-each>
						</iaixsl:otherwise>
					</iaixsl:choose>
					<li id="account_basket" class="menu_orders_item">
						<i class="icon-basket"/>
						<a>
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/basket/@url"/></iaixsl:attribute>
							Your basket
						</a>
					</li>
					<li id="account_observed" class="menu_orders_item">
						<i class="icon-heart-empty"/>
						<a>
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/shoppinglist/@url"/></iaixsl:attribute>
							Shopping lists
						</a>
					</li>
												<li id="account_boughts" class="menu_orders_item">
						<i class="icon-menu-lines"/>
						<a>
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/productsBought/@url"/></iaixsl:attribute>
							List of purchased products
						</a>
					</li>
					<li id="account_history" class="menu_orders_item">
						<i class="icon-clock"/>
						<a>
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/clientOrders/@url"/></iaixsl:attribute>
							Transaction history
						</a>
					</li>
					<li id="account_rebates" class="menu_orders_item">
						<i class="icon-scissors-cut"/>
						<a>
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/clientRebate/@url"/></iaixsl:attribute>
							Granted discounts
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
				<li><span class="footer_links_label">Information</span>
					<ul class="footer_links_sub">
						<iaixsl:if test="/shop/action/shop_information/@order_link_active='y' and not(/shop/action/shop_information/@url = '')">
							<li>
								<a>
									<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/shop_information/@url"/></iaixsl:attribute>
									Shop information
								</a>
							</li>
						</iaixsl:if>
						<iaixsl:if test="/shop/action/shipping_cost/@order_link_active='y' and not(/shop/action/shipping_cost/@url = '')">
							<li>
								<a>
									<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/shipping_cost/@url"/></iaixsl:attribute>
									Shipment
								</a>
							</li>
						</iaixsl:if>
						<iaixsl:if test="/shop/action/payment_methods/@order_link_active='y' and not(/shop/action/payment_methods/@url = '')">
							<li>
								<a>
									<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/payment_methods/@url"/></iaixsl:attribute>
									Payment information and commissions
								</a>
							</li>
						</iaixsl:if>
						<iaixsl:if test="/shop/action/terms/@order_link_active='y' and not(/shop/action/terms/@url = '')">
							<li>
								<a>
									<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/terms/@url"/></iaixsl:attribute>
									Terms and Conditions
								</a>
							</li>
						</iaixsl:if>
						<iaixsl:if test="/shop/action/private_policy/@order_link_active='y' and not(/shop/action/private_policy/@url = '')">
							<li>
								<a>
									<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/private_policy/@url"/></iaixsl:attribute>
									Privacy and Cookies policy
								</a>
							</li>
						</iaixsl:if>
						<iaixsl:if test="/shop/action/order_cancel/@order_link_active='y' and not(/shop/action/order_cancel/@url = '')">
							<li>
								<a>
									<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/order_cancel/@url"/></iaixsl:attribute>
									Withdrawal from the agreement
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
										In the store we present the net prices (excl. VAT).
									</iaixsl:when>
									<iaixsl:otherwise>
										In the store we present the gross prices (incl. VAT).
									</iaixsl:otherwise>
								</iaixsl:choose>
							</span>
							<iaixsl:if test="/shop/page/@price_type = 'gross' and /shop/page/@tax_region_name">
								<span class="price_info__text --region">VAT rates for domestic consumers: <span class="price_info__region"><iaixsl:value-of select="/shop/page/@tax_region_name"/></span>. </span>
							</iaixsl:if>
						</iaixsl:if>
						<iaixsl:if test="/shop/page/@customs_duty_required = 'y'">
							<span class="price_info__text --customs">Duty must be added to the prices listed. </span>
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
					Contact
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
<!-- (menu_calendar, 60dd8e887458a9.43179265.3)-->

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
				<h2>Order edition</h2>
				<p>
					<iaixsl:choose>
						<iaixsl:when test="/shop/action_alert/@type = 'order_edit'">
							You are in the order editing mode. To apply these changes, you need to go through all the steps of placing an order. If you do not go through all of these steps, the previous order will not be changed.
						</iaixsl:when>
						<iaixsl:when test="/shop/action_alert/@type = 'order_edit_auction'">
							You are editing the order placed through a marketplace website. You can change the product for a different one from the same group (i.e. different color or size) or add another (free choice) products to increase the order value. To apply these changes, you need to go through all of the steps of placing an order.
						</iaixsl:when>
						<iaixsl:when test="/shop/action_alert/@type = 'order1'">
							You are editing a complex order. Earlier selected payment and shipment methods are marked. You can change the earlier set options. To apply these changes, you need to go through all the steps of placing an order.
						</iaixsl:when>
						<iaixsl:when test="/shop/page/@type = 'order2'">
							Check if the order in its current form is correct. If everything is fine, click on a change order button to confirm changes. If not, go back to the basket and proceed with changes as you did before.
						</iaixsl:when>
						<iaixsl:when test="/shop/page/@type = 'order-wrappers'">
							You can select the packaging, that you are interested in, in this step of the order edition. To apply these changes, you need to go through all the steps of placing an order.
						</iaixsl:when>
						<iaixsl:when test="/shop/action_alert/@type = 'add_basket' or /shop/action_alert/@type = 'change_basket'">
							You have changed the basket content. Remember, in order to apply the changes you need to go through all the steps of placing an order.
						</iaixsl:when>
						<iaixsl:when test="/shop/page/projector/product/exchange/@exchange_id">
							You can change the product in the basket, for example for a different color or size of the same item, and the system will automatically switch it with the product bought on the auction.
						</iaixsl:when>
					</iaixsl:choose>
				</p>
			</div>
		</iaixsl:if>
	</iaixsl:if>

	<iaixsl:if test="/shop/page/@type = 'search' and ((/shop/page/sameday/@couriers_available = 'true' and /shop/page/sameday/@client_localized = 'false') or (/shop/page/nextday/@couriers_available = 'true' and /shop/page/nextday/@client_localized = 'false'))">
			<div id="xpress_toplayer">
					<div class="header_wrapper col-md-12">
							<h2>Location</h2>
					</div>
					<div id="xpress_zipcode">
							<p class="col-md-12">Enter the postal code of the delivery address</p>
							<div class="form-group">
									<div class="has-feedback has-required col-md-12 col-xs-12">
											<input id="xpress_zipcode" class="form-control validate" name="client_zipcode" data-validation="client_zipcode" data-validation-url="/ajax/client-new.php?validAjax=true" data-serialize="data-region" value="" required="required" type="text" data-region="client_region=1143020003">
													<iaixsl:attribute name="placeholder">Postal code</iaixsl:attribute>
											</input>
											<span class="form-control-feedback"/>
									</div>
							</div>
							<div class="xpress_button_sub col-md-12"><a id="xpress_zipcode_submit" class="btn --solid">OK</a></div>
							<p class="col-md-12">or share location so that we can determine if express delivery is available for this location.</p>
							<div class="xpress_button_sub col-md-12"><a id="xpress_zipcode_geolocation" class="btn --solid">Share location</a></div>
					</div>
			</div>
			<div id="xpress_toplayer_error">
					<div class="header_wrapper col-md-12">
							<h2>Location</h2>
					</div>
					<div id="xpress_zipcode">
							<p class="col-md-12">Sorry, but our express courier does not support this area. </p>
							<p class="col-md-12">Your order will be delivered in standard time and the courier will choose when ordering.</p>
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
				<script><iaixsl:attribute name="src">/gfx/<iaixsl:value-of select="language/@id"/>/shop.js.gzip?r=1696937761</iaixsl:attribute></script>
			</iaixsl:otherwise>
		</iaixsl:choose>

		
		
	</iaixsl:if>
  
  
  

	
	<script src="/gfx/eng/envelope.js.gzip?r=1696937760"></script><script src="/gfx/eng/menu_suggested_shop_for_language.js.gzip?r=1696937760"></script><script src="/gfx/eng/order1.js.gzip?r=1696937760"></script>

	
	<iaixsl:value-of disable-output-escaping="yes" select="php:functionString('additionalContent', 'additional_body_scripts')"/>
  
	<script>app_shop.runApp();</script>
	
	<iaixsl:if test="/shop/page/seolink_with_language_directory"/>

	<iaixsl:if test="(action/set_render/item/@name = 'popup') or not(action/set_render/item)">
		<iaixsl:text disable-output-escaping="yes">&lt;/body&gt;&lt;/html&gt;</iaixsl:text>
	</iaixsl:if>
</iaixsl:template><iaixsl:template match="//image"><iaixsl:if test="@type='swf'"><object type="application/x-shockwave-flash"><iaixsl:attribute name="data"><iaixsl:value-of select="@src"/></iaixsl:attribute><iaixsl:attribute name="data"><iaixsl:value-of select="@src"/></iaixsl:attribute><iaixsl:attribute name="width"><iaixsl:value-of select="@width"/></iaixsl:attribute><iaixsl:attribute name="height"><iaixsl:value-of select="@height"/></iaixsl:attribute><param name="movie"><iaixsl:attribute name="value"><iaixsl:value-of select="@src"/></iaixsl:attribute></param><param name="bgcolor"><iaixsl:attribute name="bgcolor"><iaixsl:value-of select="@bgcolor"/></iaixsl:attribute></param></object></iaixsl:if><iaixsl:if test="not(@type='swf')"><img alt="" class="pic"><iaixsl:attribute name="src"><iaixsl:value-of select="@src"/></iaixsl:attribute><iaixsl:if test="@width &gt; 0"><iaixsl:attribute name="width"><iaixsl:value-of select="@width"/></iaixsl:attribute></iaixsl:if><iaixsl:if test="@height &gt; 0"><iaixsl:attribute name="height"><iaixsl:value-of select="@height"/></iaixsl:attribute></iaixsl:if></img></iaixsl:if></iaixsl:template><iaixsl:template name="escape-backslash"><iaixsl:param name="str" select="."/><iaixsl:choose><iaixsl:when test="contains($str, '\')"><iaixsl:value-of select="concat(substring-before($str, '\'), '\\' )"/><iaixsl:call-template name="escape-backslash"><iaixsl:with-param name="str" select="substring-after($str, '\')"/></iaixsl:call-template></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="$str"/></iaixsl:otherwise></iaixsl:choose></iaixsl:template><iaixsl:template name="escape-quote-string"><iaixsl:param name="str"/><iaixsl:param name="escape_backslash"/><iaixsl:param name="escape" select="'quot'"/><iaixsl:param name="quoting" select="'1'"/><iaixsl:variable name="escape_sign"><iaixsl:choose><iaixsl:when test="$escape=&quot;apos&quot;"><iaixsl:value-of select="&quot;'&quot;"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="string('&quot;')"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable><iaixsl:if test="$quoting"><iaixsl:value-of select="$escape_sign"/></iaixsl:if><iaixsl:choose><iaixsl:when test="contains($str,$escape_sign)"><iaixsl:variable name="before-first-apostrophe" select="substring-before($str,$escape_sign)"/><iaixsl:variable name="after-first-apostrophe" select="substring-after($str,$escape_sign)"/><iaixsl:value-of select="$before-first-apostrophe"/>\<iaixsl:value-of select="$escape_sign"/><iaixsl:text/><iaixsl:call-template name="escape-quote-string"><iaixsl:with-param name="str" select="$after-first-apostrophe"/><iaixsl:with-param name="escape" select="$escape"/><iaixsl:with-param name="quoting" select="0"/></iaixsl:call-template></iaixsl:when><iaixsl:otherwise><iaixsl:choose><iaixsl:when test="not($escape_backslash)"><iaixsl:value-of select="$str"/></iaixsl:when><iaixsl:otherwise><iaixsl:call-template name="escape-backslash"><iaixsl:with-param name="str" select="$str"/></iaixsl:call-template></iaixsl:otherwise></iaixsl:choose></iaixsl:otherwise></iaixsl:choose><iaixsl:if test="$quoting"><iaixsl:value-of select="$escape_sign"/></iaixsl:if></iaixsl:template></iaixsl:stylesheet>