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
			
			<link rel="shortcut icon" href="/data/include/cms/MkFresh/theme/favicon.ico" />
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

        <!-- (main_banner1, 60dd8e8c3680d8.68781978.6)-->
	<iaixsl:if test="count(commercial_banner/link) &gt; 0">
		<div id="main_banner1" class="skeleton mb-4">
			<div class="main_slider">
				<iaixsl:for-each select="commercial_banner/link">
					<iaixsl:if test="not(html)">
						<div class="main_slider__item">
							<iaixsl:choose>
								<iaixsl:when test="image">
									<iaixsl:attribute name="style">--width:<iaixsl:value-of select="image/@width"/>;--height:<iaixsl:value-of select="image/@height"/>;</iaixsl:attribute>
								</iaixsl:when>
								<iaixsl:when test="image_desktop or image_tablet or image_mobile">
									<iaixsl:attribute name="style">--width:<iaixsl:value-of select="image_mobile/@width"/>;--height:<iaixsl:value-of select="image_mobile/@height"/>;--width-sm:<iaixsl:value-of select="image_tablet/@width"/>;--height-sm:<iaixsl:value-of select="image_tablet/@height"/>;--width-md:<iaixsl:value-of select="image_desktop/@width"/>;--height-md:<iaixsl:value-of select="image_desktop/@height"/>;</iaixsl:attribute>
								</iaixsl:when>
							</iaixsl:choose>
							<a>
								<iaixsl:choose>
									<iaixsl:when test="@target = '_blank'">
										<iaixsl:attribute name="target">_blank</iaixsl:attribute>
									</iaixsl:when>
									<iaixsl:otherwise>
										<iaixsl:attribute name="target">_self</iaixsl:attribute>
									</iaixsl:otherwise>
								</iaixsl:choose>
								<iaixsl:if test="@href"><iaixsl:attribute name="href"><iaixsl:value-of select="@href"/></iaixsl:attribute></iaixsl:if>
								<iaixsl:attribute name="title"><iaixsl:value-of select="text"/></iaixsl:attribute>
								<iaixsl:choose>
									<iaixsl:when test="image">
										<iaixsl:if test="image/@src">
											<img src="/gfx/standards/loader.gif?r=1696937716">
												<iaixsl:attribute name="width"><iaixsl:value-of select="image/@width"/></iaixsl:attribute>
												<iaixsl:attribute name="height"><iaixsl:value-of select="image/@height"/></iaixsl:attribute>
												<iaixsl:attribute name="alt"><iaixsl:value-of select="text"/></iaixsl:attribute>
												<iaixsl:choose>
													<iaixsl:when test="position() = 1">
														<iaixsl:attribute name="class">loaded</iaixsl:attribute>
														<iaixsl:attribute name="src"><iaixsl:value-of select="image/@src"/></iaixsl:attribute>
													</iaixsl:when>
													<iaixsl:otherwise>
														<iaixsl:attribute name="class">b-lazy loaded</iaixsl:attribute>
														<iaixsl:attribute name="data-src"><iaixsl:value-of select="image/@src"/></iaixsl:attribute>
													</iaixsl:otherwise>
												</iaixsl:choose>
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
													<iaixsl:choose>
														<iaixsl:when test="position() = 1">
															<iaixsl:attribute name="srcset"><iaixsl:value-of select="image_desktop/@src"/></iaixsl:attribute>
														</iaixsl:when>
														<iaixsl:otherwise>
															<iaixsl:attribute name="data-srcset"><iaixsl:value-of select="image_desktop/@src"/></iaixsl:attribute>
														</iaixsl:otherwise>
													</iaixsl:choose>
												</source>
											</iaixsl:if>
											<iaixsl:if test="image_tablet/@src">
												<source>
													<iaixsl:attribute name="width"><iaixsl:value-of select="image_tablet/@width"/></iaixsl:attribute>
													<iaixsl:attribute name="height"><iaixsl:value-of select="image_tablet/@height"/></iaixsl:attribute>
													<iaixsl:attribute name="media">(min-width:757px)</iaixsl:attribute>
													<iaixsl:choose>
														<iaixsl:when test="position() = 1">
															<iaixsl:attribute name="srcset"><iaixsl:value-of select="image_tablet/@src"/></iaixsl:attribute>
														</iaixsl:when>
														<iaixsl:otherwise>
															<iaixsl:attribute name="data-srcset"><iaixsl:value-of select="image_tablet/@src"/></iaixsl:attribute>
														</iaixsl:otherwise>
													</iaixsl:choose>
												</source>
											</iaixsl:if>
											<iaixsl:if test="image_mobile/@src">
												<img src="/gfx/standards/loader.gif?r=1696937716">
													<iaixsl:attribute name="width"><iaixsl:value-of select="image_mobile/@width"/></iaixsl:attribute>
													<iaixsl:attribute name="height"><iaixsl:value-of select="image_mobile/@height"/></iaixsl:attribute>
													<iaixsl:attribute name="alt"><iaixsl:value-of select="text"/></iaixsl:attribute>
													<iaixsl:choose>
														<iaixsl:when test="position() = 1">
															<iaixsl:attribute name="class">loaded</iaixsl:attribute>
															<iaixsl:attribute name="src"><iaixsl:value-of select="image_mobile/@src"/></iaixsl:attribute>
														</iaixsl:when>
														<iaixsl:otherwise>
															<iaixsl:attribute name="class">b-lazy loaded</iaixsl:attribute>
															<iaixsl:attribute name="data-src"><iaixsl:value-of select="image_mobile/@src"/></iaixsl:attribute>
														</iaixsl:otherwise>
													</iaixsl:choose>
												</img>
											</iaixsl:if>
										</picture>
									</iaixsl:when>
									<iaixsl:otherwise>
										<iaixsl:value-of disable-output-escaping="yes" select="text"/>
									</iaixsl:otherwise>
								</iaixsl:choose>
							</a>
						</div>
					</iaixsl:if>
					<iaixsl:if test="html">
						<div><iaixsl:value-of disable-output-escaping="yes" select="html"/></div>
					</iaixsl:if>
				</iaixsl:for-each>
			</div>
		</div>
	</iaixsl:if>
<!-- (main_cms, 60dd8e795210d5.33684480.1)-->
            <iaixsl:if test="page/text[@id='13']">
                <iaixsl:for-each select="page/text[@id='13']">
                    <div class="cm mb-4" id="main_cms">
                        <iaixsl:value-of disable-output-escaping="yes" select="body"/>
                    </div>
                </iaixsl:for-each>
            </iaixsl:if>
        <!-- (main_hotspot_zone1, 614c5ceea20cb4.39664637.7)-->
	
		<iaixsl:if test="page/hotspot/products_zone1">
			<section id="main_hotspot_zone1" class="hotspot mb-5">
				
				<iaixsl:variable name="headline_after_products_zone1">View all</iaixsl:variable>
				
				<iaixsl:if test="not(page/hotspot/products_zone1/product or page/hotspot/products_zone1/opinion)">
					<iaixsl:attribute name="data-ajaxLoad">true</iaixsl:attribute>
					<iaixsl:attribute name="data-pageType">main</iaixsl:attribute>
				</iaixsl:if>

        
				
        <iaixsl:variable name="var_omnibus_enabled"><iaixsl:if test="/shop/@omnibus = 1">true</iaixsl:if></iaixsl:variable>
				

				<iaixsl:choose>
					<iaixsl:when test="page/hotspot/products_zone1/product or page/hotspot/products_zone1/opinion">
						
						<h2>
							<iaixsl:choose>
								<iaixsl:when test="page/hotspot/products_zone1/@link">
									<a class="headline">
										<iaixsl:attribute name="href"><iaixsl:value-of select="page/hotspot/products_zone1/@link"/></iaixsl:attribute>
										<iaixsl:attribute name="title">Click here to view all products </iaixsl:attribute>

										<span class="headline__name">
											<iaixsl:choose>
												<iaixsl:when test="page/hotspot/products_zone1/@name"><iaixsl:value-of select="page/hotspot/products_zone1/@name"/></iaixsl:when>
												<iaixsl:otherwise>Special offers </iaixsl:otherwise>
											</iaixsl:choose>
										</span>
										<iaixsl:if test="$headline_after_products_zone1">
											<span class="headline__after"><iaixsl:value-of select="$headline_after_products_zone1"/></span>
										</iaixsl:if>
									</a>
								</iaixsl:when>
								<iaixsl:otherwise>
									<span class="headline">
										<span class="headline__name">
											<iaixsl:choose>
												<iaixsl:when test="page/hotspot/products_zone1/@name"><iaixsl:value-of select="page/hotspot/products_zone1/@name"/></iaixsl:when>
												<iaixsl:otherwise>Special offers </iaixsl:otherwise>
											</iaixsl:choose>
										</span>
									</span>
								</iaixsl:otherwise>
							</iaixsl:choose>
						</h2>

						<div class="products d-flex flex-wrap">
							<iaixsl:for-each select="page/hotspot/products_zone1/*">
								
								<iaixsl:variable name="var_name"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of disable-output-escaping="yes" select="product/name/text()"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of disable-output-escaping="yes" select="name/text()"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_icon"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/icon"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="icon"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_icon_small"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/icon_small"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="icon_small"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_link"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/@link"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@link"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_yousave"/>
								<iaixsl:variable name="var_net_prices"><iaixsl:if test="/shop/page/@price_type = 'net'"> net</iaixsl:if></iaixsl:variable>
								<iaixsl:variable name="var_gross_prices"><iaixsl:if test="/shop/page/@price_type = 'gross'"> incl. VAT</iaixsl:if></iaixsl:variable>
								<iaixsl:variable name="var_icon_second"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/icon_second"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="icon_second"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_icon_small_second"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/icon_small_second"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="icon_small_second"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_b2b"/>

								<div class="product col-6 col-sm-3 col-xl-2 py-3py-3">
									
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
																	<span class="omnibus_label --hidden"><iaixsl:if test="$var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Regular price: </span>
																</iaixsl:if>
																
																<del>
																	<span><iaixsl:value-of select="$var_size_min_maxprice_formatted"/></span><b><iaixsl:text> - </iaixsl:text></b><span><iaixsl:value-of select="$var_size_max_maxprice_formatted"/></span><span class="price_vat"><iaixsl:value-of select="$var_gross_prices"/></span>
																</del>
																
																<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short = 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_short --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short = 'true'"><iaixsl:attribute name="class">omnibus_short</iaixsl:attribute></iaixsl:if>Lowest price in 30 days before discount</span>
																</iaixsl:if>
																
															</span>
														</iaixsl:if>
														<strong class="price">
															<iaixsl:value-of select="$var_size_min_formatted"/><iaixsl:text> - </iaixsl:text><iaixsl:value-of select="$var_size_max_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_gross_prices"/></span>
														</strong>
														<iaixsl:if test="$var_points != ''">
															<span class="price --points">
																<iaixsl:value-of select="$var_points"/><span class="currency"> pts.</span>
															</span>
														</iaixsl:if>
														
														<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
															<span class="omnibus_price --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_price</iaixsl:attribute></iaixsl:if><span class="omnibus_price__text">Lowest price in 30 days before discount: </span><span class="omnibus_price__value"><iaixsl:value-of select="$var_omnibus"/></span></span>
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
																	<iaixsl:attribute name="title">Click to go to the contact form</iaixsl:attribute>
																	Price on phone demand
																</a>
															</iaixsl:otherwise>
														</iaixsl:choose>
													</iaixsl:when>

													
													<iaixsl:otherwise>
														<iaixsl:if test="$var_maxprice_formatted != ''">
															<span class="price --max">
																
																<iaixsl:if test="($var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_label --hidden"><iaixsl:if test="$var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Regular price: </span>
																</iaixsl:if>
																
																<del>
																	<iaixsl:value-of select="$var_maxprice_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_gross_prices"/></span>
																</del>
																
																<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short = 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_short --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short = 'true'"><iaixsl:attribute name="class">omnibus_short</iaixsl:attribute></iaixsl:if>Lowest price in 30 days before discount</span>
																</iaixsl:if>
																
															</span>
														</iaixsl:if>
														<strong class="price">
															<iaixsl:value-of select="$var_price_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_gross_prices"/></span>
														</strong>
														<iaixsl:if test="$var_points != ''">
															<span class="price --points">
																<iaixsl:value-of select="$var_points"/><span class="currency"> pts.</span>
															</span>
														</iaixsl:if>
														
														<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
															<span class="omnibus_price --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_price</iaixsl:attribute></iaixsl:if><span class="omnibus_price__text">Lowest price in 30 days before discount: </span><span class="omnibus_price__value"><iaixsl:value-of select="$var_omnibus"/></span></span>
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
																	<span class="omnibus_label --hidden"><iaixsl:if test="$var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Regular price: </span>
																</iaixsl:if>
																
																<del>
																	<span><iaixsl:value-of select="$var_size_min_net_maxprice_formatted"/></span><b><iaixsl:text> - </iaixsl:text></b><span><iaixsl:value-of select="$var_size_max_maxprice_net_formatted"/></span><span class="price_vat"><iaixsl:value-of select="$var_net_prices"/></span>
																</del>
																
																<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short = 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_short --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short = 'true'"><iaixsl:attribute name="class">omnibus_short</iaixsl:attribute></iaixsl:if>Lowest price in 30 days before discount</span>
																</iaixsl:if>
																
															</span>
														</iaixsl:if>
														<strong class="price">
															<iaixsl:value-of select="$var_size_min_net_formatted"/><iaixsl:text> - </iaixsl:text><iaixsl:value-of select="$var_size_max_net_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_net_prices"/></span>
														</strong>
														<iaixsl:if test="$var_points_net != ''">
															<span class="price --points">
																<iaixsl:value-of select="$var_points_net"/><span class="currency"> pts.</span>
															</span>
														</iaixsl:if>
														
														<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
															<span class="omnibus_price --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_price</iaixsl:attribute></iaixsl:if><span class="omnibus_price__text">Lowest price in 30 days before discount: </span><span class="omnibus_price__value"><iaixsl:value-of select="$var_omnibus"/></span></span>
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
																	<iaixsl:attribute name="title">Click to go to the contact form</iaixsl:attribute>
																	Price on phone demand
																</a>
															</iaixsl:otherwise>
														</iaixsl:choose>
													</iaixsl:when>

													
													<iaixsl:otherwise>
														<iaixsl:if test="$var_maxprice_net_formatted != ''">
															<span class="price --max">
																
																<iaixsl:if test="($var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_label --hidden"><iaixsl:if test="$var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Regular price: </span>
																</iaixsl:if>
																
																<del>
																	<iaixsl:value-of select="$var_maxprice_net_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_net_prices"/></span>
																</del>
																
																<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short = 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_short --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short = 'true'"><iaixsl:attribute name="class">omnibus_short</iaixsl:attribute></iaixsl:if>Lowest price in 30 days before discount</span>
																</iaixsl:if>
																
															</span>
														</iaixsl:if>
														<strong class="price">
															<iaixsl:value-of select="$var_price_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_net_prices"/></span>
														</strong>
														<iaixsl:if test="$var_points_net != ''">
															<span class="price --points">
																<iaixsl:value-of select="$var_points_net"/><span class="currency"> pts.</span>
															</span>
														</iaixsl:if>
														
														<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
															<span class="omnibus_price --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_price</iaixsl:attribute></iaixsl:if><span class="omnibus_price__text">Lowest price in 30 days before discount: </span><span class="omnibus_price__value"><iaixsl:value-of select="$var_omnibus"/></span></span>
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
												<strong class="opinions_element_confirmed_text"><iaixsl:choose><iaixsl:when test="@confirmedByPurchase = 'true'">Opinion confirmed by purchase</iaixsl:when><iaixsl:otherwise>Opinion not confirmed by purchase</iaixsl:otherwise></iaixsl:choose></strong>
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
														Score: <iaixsl:value-of disable-output-escaping="yes" select="@note"/>/5
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
								<div class="product col-6 col-sm-3 col-xl-2 py-3py-3">
									<span class="product__icon d-flex justify-content-center align-items-center"/>
									<span class="product__name"/>
									<div class="product__prices"/>
								</div>
								<div class="product col-6 col-sm-3 col-xl-2 py-3py-3">
									<span class="product__icon d-flex justify-content-center align-items-center"/>
									<span class="product__name"/>
									<div class="product__prices"/>
								</div>
								<div class="product col-6 col-sm-3 col-xl-2 py-3py-3">
									<span class="product__icon d-flex justify-content-center align-items-center"/>
									<span class="product__name"/>
									<div class="product__prices"/>
								</div>
								<div class="product col-6 col-sm-3 col-xl-2 py-3py-3">
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

		<iaixsl:if test="/shop/page/hotspot/products_zone1/product/comments/@id"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone1/@hotspot_ajax"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone1/product/sizes/size/availability/@id"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone1/product/category/@id"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone1/opinion"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone1/product/@version_name"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone1/product/firm/@name"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone1/product/traits/@id"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone1/product/price/@price_formatted"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone1/product/price/@detalprice_net_formatted"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone1/product/price/@price_formatted"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone1/product/price/@price_net_formatted"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone1/product/price/@value=0"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone1/product/price/@maxprice_net_formatted"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone1/product/description"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone1/@iairs_ajax"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone1/@cache_html"> </iaixsl:if>
	
<!-- (main_buttons2, 60dd8e79255be8.84611071.5)-->
	<iaixsl:if test="count(commercial_button2/link)">
		<div id="menu_buttons2" class="row">
			<iaixsl:for-each select="commercial_button2/link">
				<div class="menu_button_wrapper">
					<iaixsl:choose>
						<iaixsl:when test="count(/shop/commercial_button2/link) = 1">
							<iaixsl:attribute name="class">menu_button_wrapper col-12</iaixsl:attribute>
						</iaixsl:when>
						<iaixsl:when test="count(/shop/commercial_button2/link) = 2">
							<iaixsl:attribute name="class">menu_button_wrapper col-6</iaixsl:attribute>
						</iaixsl:when>
						<iaixsl:when test="count(/shop/commercial_button2/link) = 3">
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
	</iaixsl:if>
<!-- (main_hotspot_zone2, 614c5cef0ceaf4.72707581.6)-->
	
		<iaixsl:if test="page/hotspot/products_zone2">
			<section id="main_hotspot_zone2" class="hotspot mb-5">
				
				<iaixsl:variable name="headline_after_products_zone2">View all</iaixsl:variable>
				
				<iaixsl:if test="not(page/hotspot/products_zone2/product or page/hotspot/products_zone2/opinion)">
					<iaixsl:attribute name="data-ajaxLoad">true</iaixsl:attribute>
					<iaixsl:attribute name="data-pageType">main</iaixsl:attribute>
				</iaixsl:if>

        
				
        <iaixsl:variable name="var_omnibus_enabled"><iaixsl:if test="/shop/@omnibus = 1">true</iaixsl:if></iaixsl:variable>
				

				<iaixsl:choose>
					<iaixsl:when test="page/hotspot/products_zone2/product or page/hotspot/products_zone2/opinion">
						
						<h2>
							<iaixsl:choose>
								<iaixsl:when test="page/hotspot/products_zone2/@link">
									<a class="headline">
										<iaixsl:attribute name="href"><iaixsl:value-of select="page/hotspot/products_zone2/@link"/></iaixsl:attribute>
										<iaixsl:attribute name="title">Click here to view all products </iaixsl:attribute>

										<span class="headline__name">
											<iaixsl:choose>
												<iaixsl:when test="page/hotspot/products_zone2/@name"><iaixsl:value-of select="page/hotspot/products_zone2/@name"/></iaixsl:when>
												<iaixsl:otherwise>Special offers </iaixsl:otherwise>
											</iaixsl:choose>
										</span>
										<iaixsl:if test="$headline_after_products_zone2">
											<span class="headline__after"><iaixsl:value-of select="$headline_after_products_zone2"/></span>
										</iaixsl:if>
									</a>
								</iaixsl:when>
								<iaixsl:otherwise>
									<span class="headline">
										<span class="headline__name">
											<iaixsl:choose>
												<iaixsl:when test="page/hotspot/products_zone2/@name"><iaixsl:value-of select="page/hotspot/products_zone2/@name"/></iaixsl:when>
												<iaixsl:otherwise>Special offers </iaixsl:otherwise>
											</iaixsl:choose>
										</span>
									</span>
								</iaixsl:otherwise>
							</iaixsl:choose>
						</h2>

						<div class="products d-flex flex-wrap">
							<iaixsl:for-each select="page/hotspot/products_zone2/*">
								
								<iaixsl:variable name="var_name"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of disable-output-escaping="yes" select="product/name/text()"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of disable-output-escaping="yes" select="name/text()"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_icon"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/icon"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="icon"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_icon_small"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/icon_small"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="icon_small"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_link"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/@link"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@link"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_yousave"/>
								<iaixsl:variable name="var_net_prices"><iaixsl:if test="/shop/page/@price_type = 'net'"> net</iaixsl:if></iaixsl:variable>
								<iaixsl:variable name="var_gross_prices"><iaixsl:if test="/shop/page/@price_type = 'gross'"> incl. VAT</iaixsl:if></iaixsl:variable>
								<iaixsl:variable name="var_icon_second"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/icon_second"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="icon_second"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_icon_small_second"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/icon_small_second"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="icon_small_second"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_b2b"/>

								<div class="product col-6 col-sm-3 col-xl-2 py-3py-3">
									
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
																	<span class="omnibus_label --hidden"><iaixsl:if test="$var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Regular price: </span>
																</iaixsl:if>
																
																<del>
																	<span><iaixsl:value-of select="$var_size_min_maxprice_formatted"/></span><b><iaixsl:text> - </iaixsl:text></b><span><iaixsl:value-of select="$var_size_max_maxprice_formatted"/></span><span class="price_vat"><iaixsl:value-of select="$var_gross_prices"/></span>
																</del>
																
																<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short = 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_short --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short = 'true'"><iaixsl:attribute name="class">omnibus_short</iaixsl:attribute></iaixsl:if>Lowest price in 30 days before discount</span>
																</iaixsl:if>
																
															</span>
														</iaixsl:if>
														<strong class="price">
															<iaixsl:value-of select="$var_size_min_formatted"/><iaixsl:text> - </iaixsl:text><iaixsl:value-of select="$var_size_max_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_gross_prices"/></span>
														</strong>
														<iaixsl:if test="$var_points != ''">
															<span class="price --points">
																<iaixsl:value-of select="$var_points"/><span class="currency"> pts.</span>
															</span>
														</iaixsl:if>
														
														<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
															<span class="omnibus_price --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_price</iaixsl:attribute></iaixsl:if><span class="omnibus_price__text">Lowest price in 30 days before discount: </span><span class="omnibus_price__value"><iaixsl:value-of select="$var_omnibus"/></span></span>
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
																	<iaixsl:attribute name="title">Click to go to the contact form</iaixsl:attribute>
																	Price on phone demand
																</a>
															</iaixsl:otherwise>
														</iaixsl:choose>
													</iaixsl:when>

													
													<iaixsl:otherwise>
														<iaixsl:if test="$var_maxprice_formatted != ''">
															<span class="price --max">
																
																<iaixsl:if test="($var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_label --hidden"><iaixsl:if test="$var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Regular price: </span>
																</iaixsl:if>
																
																<del>
																	<iaixsl:value-of select="$var_maxprice_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_gross_prices"/></span>
																</del>
																
																<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short = 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_short --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short = 'true'"><iaixsl:attribute name="class">omnibus_short</iaixsl:attribute></iaixsl:if>Lowest price in 30 days before discount</span>
																</iaixsl:if>
																
															</span>
														</iaixsl:if>
														<strong class="price">
															<iaixsl:value-of select="$var_price_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_gross_prices"/></span>
														</strong>
														<iaixsl:if test="$var_points != ''">
															<span class="price --points">
																<iaixsl:value-of select="$var_points"/><span class="currency"> pts.</span>
															</span>
														</iaixsl:if>
														
														<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
															<span class="omnibus_price --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_price</iaixsl:attribute></iaixsl:if><span class="omnibus_price__text">Lowest price in 30 days before discount: </span><span class="omnibus_price__value"><iaixsl:value-of select="$var_omnibus"/></span></span>
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
																	<span class="omnibus_label --hidden"><iaixsl:if test="$var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Regular price: </span>
																</iaixsl:if>
																
																<del>
																	<span><iaixsl:value-of select="$var_size_min_net_maxprice_formatted"/></span><b><iaixsl:text> - </iaixsl:text></b><span><iaixsl:value-of select="$var_size_max_maxprice_net_formatted"/></span><span class="price_vat"><iaixsl:value-of select="$var_net_prices"/></span>
																</del>
																
																<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short = 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_short --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short = 'true'"><iaixsl:attribute name="class">omnibus_short</iaixsl:attribute></iaixsl:if>Lowest price in 30 days before discount</span>
																</iaixsl:if>
																
															</span>
														</iaixsl:if>
														<strong class="price">
															<iaixsl:value-of select="$var_size_min_net_formatted"/><iaixsl:text> - </iaixsl:text><iaixsl:value-of select="$var_size_max_net_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_net_prices"/></span>
														</strong>
														<iaixsl:if test="$var_points_net != ''">
															<span class="price --points">
																<iaixsl:value-of select="$var_points_net"/><span class="currency"> pts.</span>
															</span>
														</iaixsl:if>
														
														<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
															<span class="omnibus_price --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_price</iaixsl:attribute></iaixsl:if><span class="omnibus_price__text">Lowest price in 30 days before discount: </span><span class="omnibus_price__value"><iaixsl:value-of select="$var_omnibus"/></span></span>
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
																	<iaixsl:attribute name="title">Click to go to the contact form</iaixsl:attribute>
																	Price on phone demand
																</a>
															</iaixsl:otherwise>
														</iaixsl:choose>
													</iaixsl:when>

													
													<iaixsl:otherwise>
														<iaixsl:if test="$var_maxprice_net_formatted != ''">
															<span class="price --max">
																
																<iaixsl:if test="($var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_label --hidden"><iaixsl:if test="$var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Regular price: </span>
																</iaixsl:if>
																
																<del>
																	<iaixsl:value-of select="$var_maxprice_net_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_net_prices"/></span>
																</del>
																
																<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short = 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_short --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short = 'true'"><iaixsl:attribute name="class">omnibus_short</iaixsl:attribute></iaixsl:if>Lowest price in 30 days before discount</span>
																</iaixsl:if>
																
															</span>
														</iaixsl:if>
														<strong class="price">
															<iaixsl:value-of select="$var_price_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_net_prices"/></span>
														</strong>
														<iaixsl:if test="$var_points_net != ''">
															<span class="price --points">
																<iaixsl:value-of select="$var_points_net"/><span class="currency"> pts.</span>
															</span>
														</iaixsl:if>
														
														<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
															<span class="omnibus_price --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_price</iaixsl:attribute></iaixsl:if><span class="omnibus_price__text">Lowest price in 30 days before discount: </span><span class="omnibus_price__value"><iaixsl:value-of select="$var_omnibus"/></span></span>
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
												<strong class="opinions_element_confirmed_text"><iaixsl:choose><iaixsl:when test="@confirmedByPurchase = 'true'">Opinion confirmed by purchase</iaixsl:when><iaixsl:otherwise>Opinion not confirmed by purchase</iaixsl:otherwise></iaixsl:choose></strong>
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
														Score: <iaixsl:value-of disable-output-escaping="yes" select="@note"/>/5
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
								<div class="product col-6 col-sm-3 col-xl-2 py-3py-3">
									<span class="product__icon d-flex justify-content-center align-items-center"/>
									<span class="product__name"/>
									<div class="product__prices"/>
								</div>
								<div class="product col-6 col-sm-3 col-xl-2 py-3py-3">
									<span class="product__icon d-flex justify-content-center align-items-center"/>
									<span class="product__name"/>
									<div class="product__prices"/>
								</div>
								<div class="product col-6 col-sm-3 col-xl-2 py-3py-3">
									<span class="product__icon d-flex justify-content-center align-items-center"/>
									<span class="product__name"/>
									<div class="product__prices"/>
								</div>
								<div class="product col-6 col-sm-3 col-xl-2 py-3py-3">
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

		<iaixsl:if test="/shop/page/hotspot/products_zone2/product/comments/@id"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone2/@hotspot_ajax"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone2/product/sizes/size/availability/@id"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone2/product/category/@id"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone2/opinion"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone2/product/@version_name"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone2/product/firm/@name"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone2/product/traits/@id"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone2/product/price/@price_formatted"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone2/product/price/@detalprice_net_formatted"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone2/product/price/@price_formatted"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone2/product/price/@price_net_formatted"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone2/product/price/@value=0"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone2/product/price/@maxprice_net_formatted"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone2/product/description"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone2/@iairs_ajax"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone2/@cache_html"> </iaixsl:if>
	
<!-- (main_hotspot_zone3, 614c5ceee1e372.10323482.6)-->
	
		<iaixsl:if test="page/hotspot/products_zone3">
			<section id="main_hotspot_zone3" class="hotspot mb-5">
				
				<iaixsl:variable name="headline_after_products_zone3">View all</iaixsl:variable>
				
				<iaixsl:if test="not(page/hotspot/products_zone3/product or page/hotspot/products_zone3/opinion)">
					<iaixsl:attribute name="data-ajaxLoad">true</iaixsl:attribute>
					<iaixsl:attribute name="data-pageType">main</iaixsl:attribute>
				</iaixsl:if>

        
				
        <iaixsl:variable name="var_omnibus_enabled"><iaixsl:if test="/shop/@omnibus = 1">true</iaixsl:if></iaixsl:variable>
				

				<iaixsl:choose>
					<iaixsl:when test="page/hotspot/products_zone3/product or page/hotspot/products_zone3/opinion">
						
						<h2>
							<iaixsl:choose>
								<iaixsl:when test="page/hotspot/products_zone3/@link">
									<a class="headline">
										<iaixsl:attribute name="href"><iaixsl:value-of select="page/hotspot/products_zone3/@link"/></iaixsl:attribute>
										<iaixsl:attribute name="title">Click here to view all products </iaixsl:attribute>

										<span class="headline__name">
											<iaixsl:choose>
												<iaixsl:when test="page/hotspot/products_zone3/@name"><iaixsl:value-of select="page/hotspot/products_zone3/@name"/></iaixsl:when>
												<iaixsl:otherwise>Special offers </iaixsl:otherwise>
											</iaixsl:choose>
										</span>
										<iaixsl:if test="$headline_after_products_zone3">
											<span class="headline__after"><iaixsl:value-of select="$headline_after_products_zone3"/></span>
										</iaixsl:if>
									</a>
								</iaixsl:when>
								<iaixsl:otherwise>
									<span class="headline">
										<span class="headline__name">
											<iaixsl:choose>
												<iaixsl:when test="page/hotspot/products_zone3/@name"><iaixsl:value-of select="page/hotspot/products_zone3/@name"/></iaixsl:when>
												<iaixsl:otherwise>Special offers </iaixsl:otherwise>
											</iaixsl:choose>
										</span>
									</span>
								</iaixsl:otherwise>
							</iaixsl:choose>
						</h2>

						<div class="products d-flex flex-wrap">
							<iaixsl:for-each select="page/hotspot/products_zone3/*">
								
								<iaixsl:variable name="var_name"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of disable-output-escaping="yes" select="product/name/text()"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of disable-output-escaping="yes" select="name/text()"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_icon"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/icon"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="icon"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_icon_small"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/icon_small"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="icon_small"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_link"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/@link"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@link"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_yousave"/>
								<iaixsl:variable name="var_net_prices"><iaixsl:if test="/shop/page/@price_type = 'net'"> net</iaixsl:if></iaixsl:variable>
								<iaixsl:variable name="var_gross_prices"><iaixsl:if test="/shop/page/@price_type = 'gross'"> incl. VAT</iaixsl:if></iaixsl:variable>
								<iaixsl:variable name="var_icon_second"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/icon_second"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="icon_second"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_icon_small_second"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/icon_small_second"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="icon_small_second"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_b2b"/>

								<div class="product col-6 col-sm-3 col-xl-2 py-3py-3">
									
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
																	<span class="omnibus_label --hidden"><iaixsl:if test="$var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Regular price: </span>
																</iaixsl:if>
																
																<del>
																	<span><iaixsl:value-of select="$var_size_min_maxprice_formatted"/></span><b><iaixsl:text> - </iaixsl:text></b><span><iaixsl:value-of select="$var_size_max_maxprice_formatted"/></span><span class="price_vat"><iaixsl:value-of select="$var_gross_prices"/></span>
																</del>
																
																<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short = 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_short --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short = 'true'"><iaixsl:attribute name="class">omnibus_short</iaixsl:attribute></iaixsl:if>Lowest price in 30 days before discount</span>
																</iaixsl:if>
																
															</span>
														</iaixsl:if>
														<strong class="price">
															<iaixsl:value-of select="$var_size_min_formatted"/><iaixsl:text> - </iaixsl:text><iaixsl:value-of select="$var_size_max_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_gross_prices"/></span>
														</strong>
														<iaixsl:if test="$var_points != ''">
															<span class="price --points">
																<iaixsl:value-of select="$var_points"/><span class="currency"> pts.</span>
															</span>
														</iaixsl:if>
														
														<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
															<span class="omnibus_price --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_price</iaixsl:attribute></iaixsl:if><span class="omnibus_price__text">Lowest price in 30 days before discount: </span><span class="omnibus_price__value"><iaixsl:value-of select="$var_omnibus"/></span></span>
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
																	<iaixsl:attribute name="title">Click to go to the contact form</iaixsl:attribute>
																	Price on phone demand
																</a>
															</iaixsl:otherwise>
														</iaixsl:choose>
													</iaixsl:when>

													
													<iaixsl:otherwise>
														<iaixsl:if test="$var_maxprice_formatted != ''">
															<span class="price --max">
																
																<iaixsl:if test="($var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_label --hidden"><iaixsl:if test="$var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Regular price: </span>
																</iaixsl:if>
																
																<del>
																	<iaixsl:value-of select="$var_maxprice_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_gross_prices"/></span>
																</del>
																
																<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short = 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_short --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short = 'true'"><iaixsl:attribute name="class">omnibus_short</iaixsl:attribute></iaixsl:if>Lowest price in 30 days before discount</span>
																</iaixsl:if>
																
															</span>
														</iaixsl:if>
														<strong class="price">
															<iaixsl:value-of select="$var_price_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_gross_prices"/></span>
														</strong>
														<iaixsl:if test="$var_points != ''">
															<span class="price --points">
																<iaixsl:value-of select="$var_points"/><span class="currency"> pts.</span>
															</span>
														</iaixsl:if>
														
														<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
															<span class="omnibus_price --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_price</iaixsl:attribute></iaixsl:if><span class="omnibus_price__text">Lowest price in 30 days before discount: </span><span class="omnibus_price__value"><iaixsl:value-of select="$var_omnibus"/></span></span>
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
																	<span class="omnibus_label --hidden"><iaixsl:if test="$var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Regular price: </span>
																</iaixsl:if>
																
																<del>
																	<span><iaixsl:value-of select="$var_size_min_net_maxprice_formatted"/></span><b><iaixsl:text> - </iaixsl:text></b><span><iaixsl:value-of select="$var_size_max_maxprice_net_formatted"/></span><span class="price_vat"><iaixsl:value-of select="$var_net_prices"/></span>
																</del>
																
																<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short = 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_short --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short = 'true'"><iaixsl:attribute name="class">omnibus_short</iaixsl:attribute></iaixsl:if>Lowest price in 30 days before discount</span>
																</iaixsl:if>
																
															</span>
														</iaixsl:if>
														<strong class="price">
															<iaixsl:value-of select="$var_size_min_net_formatted"/><iaixsl:text> - </iaixsl:text><iaixsl:value-of select="$var_size_max_net_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_net_prices"/></span>
														</strong>
														<iaixsl:if test="$var_points_net != ''">
															<span class="price --points">
																<iaixsl:value-of select="$var_points_net"/><span class="currency"> pts.</span>
															</span>
														</iaixsl:if>
														
														<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
															<span class="omnibus_price --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_price</iaixsl:attribute></iaixsl:if><span class="omnibus_price__text">Lowest price in 30 days before discount: </span><span class="omnibus_price__value"><iaixsl:value-of select="$var_omnibus"/></span></span>
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
																	<iaixsl:attribute name="title">Click to go to the contact form</iaixsl:attribute>
																	Price on phone demand
																</a>
															</iaixsl:otherwise>
														</iaixsl:choose>
													</iaixsl:when>

													
													<iaixsl:otherwise>
														<iaixsl:if test="$var_maxprice_net_formatted != ''">
															<span class="price --max">
																
																<iaixsl:if test="($var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_label --hidden"><iaixsl:if test="$var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Regular price: </span>
																</iaixsl:if>
																
																<del>
																	<iaixsl:value-of select="$var_maxprice_net_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_net_prices"/></span>
																</del>
																
																<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short = 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_short --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short = 'true'"><iaixsl:attribute name="class">omnibus_short</iaixsl:attribute></iaixsl:if>Lowest price in 30 days before discount</span>
																</iaixsl:if>
																
															</span>
														</iaixsl:if>
														<strong class="price">
															<iaixsl:value-of select="$var_price_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_net_prices"/></span>
														</strong>
														<iaixsl:if test="$var_points_net != ''">
															<span class="price --points">
																<iaixsl:value-of select="$var_points_net"/><span class="currency"> pts.</span>
															</span>
														</iaixsl:if>
														
														<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
															<span class="omnibus_price --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_price</iaixsl:attribute></iaixsl:if><span class="omnibus_price__text">Lowest price in 30 days before discount: </span><span class="omnibus_price__value"><iaixsl:value-of select="$var_omnibus"/></span></span>
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
                        <strong class="opinions_element_confirmed_text"><iaixsl:choose><iaixsl:when test="@confirmedByPurchase = 'true'">Opinion confirmed by purchase</iaixsl:when><iaixsl:otherwise>Opinion not confirmed by purchase</iaixsl:otherwise></iaixsl:choose></strong>
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
														Score: <iaixsl:value-of disable-output-escaping="yes" select="@note"/>/5
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
								<div class="product col-6 col-sm-3 col-xl-2 py-3py-3">
									<span class="product__icon d-flex justify-content-center align-items-center"/>
									<span class="product__name"/>
									<div class="product__prices"/>
								</div>
								<div class="product col-6 col-sm-3 col-xl-2 py-3py-3">
									<span class="product__icon d-flex justify-content-center align-items-center"/>
									<span class="product__name"/>
									<div class="product__prices"/>
								</div>
								<div class="product col-6 col-sm-3 col-xl-2 py-3py-3">
									<span class="product__icon d-flex justify-content-center align-items-center"/>
									<span class="product__name"/>
									<div class="product__prices"/>
								</div>
								<div class="product col-6 col-sm-3 col-xl-2 py-3py-3">
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

		<iaixsl:if test="/shop/page/hotspot/products_zone3/product/comments/@id"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone3/@hotspot_ajax"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone3/product/sizes/size/availability/@id"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone3/product/category/@id"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone3/opinion"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone3/product/@version_name"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone3/product/firm/@name"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone3/product/traits/@id"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone3/product/price/@price_formatted"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone3/product/price/@detalprice_net_formatted"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone3/product/price/@price_formatted"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone3/product/price/@price_net_formatted"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone3/product/price/@value=0"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone3/product/price/@maxprice_net_formatted"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone3/product/description"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone3/@iairs_ajax"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone3/@cache_html"> </iaixsl:if>
	
<!-- (main_hotspot_zone4, 614c5ceec2e6d7.03545462.6)-->
	
		<iaixsl:if test="page/hotspot/products_zone4">
			<section id="main_hotspot_zone4" class="hotspot mb-5">
				
				<iaixsl:variable name="headline_after_products_zone4">View all</iaixsl:variable>
				
				<iaixsl:if test="not(page/hotspot/products_zone4/product or page/hotspot/products_zone4/opinion)">
					<iaixsl:attribute name="data-ajaxLoad">true</iaixsl:attribute>
					<iaixsl:attribute name="data-pageType">main</iaixsl:attribute>
				</iaixsl:if>

        
				
        <iaixsl:variable name="var_omnibus_enabled"><iaixsl:if test="/shop/@omnibus = 1">true</iaixsl:if></iaixsl:variable>
				

				<iaixsl:choose>
					<iaixsl:when test="page/hotspot/products_zone4/product or page/hotspot/products_zone4/opinion">
						
						<h2>
							<iaixsl:choose>
								<iaixsl:when test="page/hotspot/products_zone4/@link">
									<a class="headline">
										<iaixsl:attribute name="href"><iaixsl:value-of select="page/hotspot/products_zone4/@link"/></iaixsl:attribute>
										<iaixsl:attribute name="title">Click here to view all products </iaixsl:attribute>

										<span class="headline__name">
											<iaixsl:choose>
												<iaixsl:when test="page/hotspot/products_zone4/@name"><iaixsl:value-of select="page/hotspot/products_zone4/@name"/></iaixsl:when>
												<iaixsl:otherwise>Special offers </iaixsl:otherwise>
											</iaixsl:choose>
										</span>
										<iaixsl:if test="$headline_after_products_zone4">
											<span class="headline__after"><iaixsl:value-of select="$headline_after_products_zone4"/></span>
										</iaixsl:if>
									</a>
								</iaixsl:when>
								<iaixsl:otherwise>
									<span class="headline">
										<span class="headline__name">
											<iaixsl:choose>
												<iaixsl:when test="page/hotspot/products_zone4/@name"><iaixsl:value-of select="page/hotspot/products_zone4/@name"/></iaixsl:when>
												<iaixsl:otherwise>Special offers </iaixsl:otherwise>
											</iaixsl:choose>
										</span>
									</span>
								</iaixsl:otherwise>
							</iaixsl:choose>
						</h2>

						<div class="products d-flex flex-wrap">
							<iaixsl:for-each select="page/hotspot/products_zone4/*">
								
								<iaixsl:variable name="var_name"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of disable-output-escaping="yes" select="product/name/text()"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of disable-output-escaping="yes" select="name/text()"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_icon"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/icon"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="icon"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_icon_small"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/icon_small"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="icon_small"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_link"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/@link"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@link"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_yousave"/>
								<iaixsl:variable name="var_net_prices"><iaixsl:if test="/shop/page/@price_type = 'net'"> net</iaixsl:if></iaixsl:variable>
								<iaixsl:variable name="var_gross_prices"><iaixsl:if test="/shop/page/@price_type = 'gross'"> incl. VAT</iaixsl:if></iaixsl:variable>
								<iaixsl:variable name="var_icon_second"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/icon_second"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="icon_second"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_icon_small_second"><iaixsl:choose><iaixsl:when test="product"><iaixsl:value-of select="product/icon_small_second"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="icon_small_second"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
								<iaixsl:variable name="var_b2b"/>

								<div class="product col-6 col-sm-3 col-xl-2 py-3py-3">
									
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
																	<span class="omnibus_label --hidden"><iaixsl:if test="$var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Regular price: </span>
																</iaixsl:if>
																
																<del>
																	<span><iaixsl:value-of select="$var_size_min_maxprice_formatted"/></span><b><iaixsl:text> - </iaixsl:text></b><span><iaixsl:value-of select="$var_size_max_maxprice_formatted"/></span><span class="price_vat"><iaixsl:value-of select="$var_gross_prices"/></span>
																</del>
																
																<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short = 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_short --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short = 'true'"><iaixsl:attribute name="class">omnibus_short</iaixsl:attribute></iaixsl:if>Lowest price in 30 days before discount</span>
																</iaixsl:if>
																
															</span>
														</iaixsl:if>
														<strong class="price">
															<iaixsl:value-of select="$var_size_min_formatted"/><iaixsl:text> - </iaixsl:text><iaixsl:value-of select="$var_size_max_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_gross_prices"/></span>
														</strong>
														<iaixsl:if test="$var_points != ''">
															<span class="price --points">
																<iaixsl:value-of select="$var_points"/><span class="currency"> pts.</span>
															</span>
														</iaixsl:if>
														
														<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
															<span class="omnibus_price --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_price</iaixsl:attribute></iaixsl:if><span class="omnibus_price__text">Lowest price in 30 days before discount: </span><span class="omnibus_price__value"><iaixsl:value-of select="$var_omnibus"/></span></span>
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
																	<iaixsl:attribute name="title">Click to go to the contact form</iaixsl:attribute>
																	Price on phone demand
																</a>
															</iaixsl:otherwise>
														</iaixsl:choose>
													</iaixsl:when>

													
													<iaixsl:otherwise>
														<iaixsl:if test="$var_maxprice_formatted != ''">
															<span class="price --max">
																
																<iaixsl:if test="($var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_label --hidden"><iaixsl:if test="$var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Regular price: </span>
																</iaixsl:if>
																
																<del>
																	<iaixsl:value-of select="$var_maxprice_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_gross_prices"/></span>
																</del>
																
																<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short = 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_short --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short = 'true'"><iaixsl:attribute name="class">omnibus_short</iaixsl:attribute></iaixsl:if>Lowest price in 30 days before discount</span>
																</iaixsl:if>
																
															</span>
														</iaixsl:if>
														<strong class="price">
															<iaixsl:value-of select="$var_price_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_gross_prices"/></span>
														</strong>
														<iaixsl:if test="$var_points != ''">
															<span class="price --points">
																<iaixsl:value-of select="$var_points"/><span class="currency"> pts.</span>
															</span>
														</iaixsl:if>
														
														<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
															<span class="omnibus_price --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_price</iaixsl:attribute></iaixsl:if><span class="omnibus_price__text">Lowest price in 30 days before discount: </span><span class="omnibus_price__value"><iaixsl:value-of select="$var_omnibus"/></span></span>
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
																	<span class="omnibus_label --hidden"><iaixsl:if test="$var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Regular price: </span>
																</iaixsl:if>
																
																<del>
																	<span><iaixsl:value-of select="$var_size_min_net_maxprice_formatted"/></span><b><iaixsl:text> - </iaixsl:text></b><span><iaixsl:value-of select="$var_size_max_maxprice_net_formatted"/></span><span class="price_vat"><iaixsl:value-of select="$var_net_prices"/></span>
																</del>
																
																<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short = 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_short --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short = 'true'"><iaixsl:attribute name="class">omnibus_short</iaixsl:attribute></iaixsl:if>Lowest price in 30 days before discount</span>
																</iaixsl:if>
																
															</span>
														</iaixsl:if>
														<strong class="price">
															<iaixsl:value-of select="$var_size_min_net_formatted"/><iaixsl:text> - </iaixsl:text><iaixsl:value-of select="$var_size_max_net_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_net_prices"/></span>
														</strong>
														<iaixsl:if test="$var_points_net != ''">
															<span class="price --points">
																<iaixsl:value-of select="$var_points_net"/><span class="currency"> pts.</span>
															</span>
														</iaixsl:if>
														
														<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
															<span class="omnibus_price --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_price</iaixsl:attribute></iaixsl:if><span class="omnibus_price__text">Lowest price in 30 days before discount: </span><span class="omnibus_price__value"><iaixsl:value-of select="$var_omnibus"/></span></span>
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
																	<iaixsl:attribute name="title">Click to go to the contact form</iaixsl:attribute>
																	Price on phone demand
																</a>
															</iaixsl:otherwise>
														</iaixsl:choose>
													</iaixsl:when>

													
													<iaixsl:otherwise>
														<iaixsl:if test="$var_maxprice_net_formatted != ''">
															<span class="price --max">
																
																<iaixsl:if test="($var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_label --hidden"><iaixsl:if test="$var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_label</iaixsl:attribute></iaixsl:if>Regular price: </span>
																</iaixsl:if>
																
																<del>
																	<iaixsl:value-of select="$var_maxprice_net_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_net_prices"/></span>
																</del>
																
																<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short = 'true') or ($var_show_omnibus_short_fallback = 'true')">
																	<span class="omnibus_short --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short = 'true'"><iaixsl:attribute name="class">omnibus_short</iaixsl:attribute></iaixsl:if>Lowest price in 30 days before discount</span>
																</iaixsl:if>
																
															</span>
														</iaixsl:if>
														<strong class="price">
															<iaixsl:value-of select="$var_price_formatted"/><span class="price_vat"><iaixsl:value-of select="$var_net_prices"/></span>
														</strong>
														<iaixsl:if test="$var_points_net != ''">
															<span class="price --points">
																<iaixsl:value-of select="$var_points_net"/><span class="currency"> pts.</span>
															</span>
														</iaixsl:if>
														
														<iaixsl:if test="($var_omnibus != '' and $var_omnibus_short != 'true') or ($var_show_omnibus_short_fallback = 'true')">
															<span class="omnibus_price --hidden"><iaixsl:if test="$var_omnibus != '' and $var_omnibus_short != 'true'"><iaixsl:attribute name="class">omnibus_price</iaixsl:attribute></iaixsl:if><span class="omnibus_price__text">Lowest price in 30 days before discount: </span><span class="omnibus_price__value"><iaixsl:value-of select="$var_omnibus"/></span></span>
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
                        <strong class="opinions_element_confirmed_text"><iaixsl:choose><iaixsl:when test="@confirmedByPurchase = 'true'">Opinion confirmed by purchase</iaixsl:when><iaixsl:otherwise>Opinion not confirmed by purchase</iaixsl:otherwise></iaixsl:choose></strong>
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
														Score: <iaixsl:value-of disable-output-escaping="yes" select="@note"/>/5
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
								<div class="product col-6 col-sm-3 col-xl-2 py-3py-3">
									<span class="product__icon d-flex justify-content-center align-items-center"/>
									<span class="product__name"/>
									<div class="product__prices"/>
								</div>
								<div class="product col-6 col-sm-3 col-xl-2 py-3py-3">
									<span class="product__icon d-flex justify-content-center align-items-center"/>
									<span class="product__name"/>
									<div class="product__prices"/>
								</div>
								<div class="product col-6 col-sm-3 col-xl-2 py-3py-3">
									<span class="product__icon d-flex justify-content-center align-items-center"/>
									<span class="product__name"/>
									<div class="product__prices"/>
								</div>
								<div class="product col-6 col-sm-3 col-xl-2 py-3py-3">
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

		<iaixsl:if test="/shop/page/hotspot/products_zone4/product/comments/@id"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone4/@hotspot_ajax"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone4/product/sizes/size/availability/@id"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone4/product/category/@id"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone4/opinion"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone4/product/@version_name"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone4/product/firm/@name"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone4/product/traits/@id"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone4/product/price/@price_formatted"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone4/product/price/@detalprice_net_formatted"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone4/product/price/@price_formatted"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone4/product/price/@price_net_formatted"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone4/product/price/@value=0"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone4/product/price/@maxprice_net_formatted"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone4/product/description"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone4/@iairs_ajax"> </iaixsl:if>
		<iaixsl:if test="/shop/page/hotspot/products_zone4/@cache_html"> </iaixsl:if>
	
<!-- (main_news2, 60dd8e807bc210.32067134.5)-->
	<iaixsl:variable name="main_blog_date"/>
	<iaixsl:variable name="main_blog_after_label"/>
	<iaixsl:variable name="main_blog_see_more">Read more</iaixsl:variable>
	<iaixsl:variable name="main_blog_view_all"/>

	<iaixsl:if test="count(page/mainpage2/item) &gt; 0">
		<section id="main_blog" class="article mb-5">
			<h2>
				<a href="/blog-list.php" class="headline">
					<iaixsl:if test="/shop/page/mainpage2/@link and /shop/page/mainpage2/@link!=''">
						<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/page/mainpage2/@link"/></iaixsl:attribute>
					</iaixsl:if>
					<iaixsl:attribute name="title">Click to view all blog entries</iaixsl:attribute>
					<span class="headline__name">Blog</span>
					<iaixsl:if test="$main_blog_after_label">
						<span class="headline__after"><iaixsl:value-of select="$main_blog_after_label"/></span>
					</iaixsl:if>
				</a>
			</h2>

			<div class="article__block row">
				<iaixsl:for-each select="page/mainpage2/item">
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
							<iaixsl:if test="$main_blog_date">
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
							<iaixsl:if test="$main_blog_date">
								<iaixsl:attribute name="class">article__text --date</iaixsl:attribute>
							</iaixsl:if>
							<div class="article__description"><iaixsl:value-of disable-output-escaping="yes" select="description"/></div>
							<iaixsl:if test="more/@href and $main_blog_see_more">
								<div class="article__more">
									<a class="article__more_link">
										<iaixsl:attribute name="href"><iaixsl:value-of select="more/@href"/></iaixsl:attribute>
										<iaixsl:attribute name="title"><iaixsl:value-of disable-output-escaping="yes" select="title"/></iaixsl:attribute>
										<iaixsl:value-of select="$main_blog_see_more"/>
									</a>
								</div>
							</iaixsl:if>
						</div>
					</article>
				</iaixsl:for-each>
			</div>

			
			<iaixsl:if test="$main_blog_view_all">
				<div class="article__all">
					<a href="/blog-list.php" class="article__all_link">
						<iaixsl:if test="/shop/page/mainpage2/@link and /shop/page/mainpage2/@link!=''">
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/page/mainpage2/@link"/></iaixsl:attribute>
						</iaixsl:if>
						<iaixsl:attribute name="title">Click to view all blog entries</iaixsl:attribute>
						<iaixsl:value-of select="$main_blog_view_all"/>
					</a>
				</div>
			</iaixsl:if>
		</section>
	</iaixsl:if>
<!-- (main_news1, 60dd8e80c250e0.04895316.4)-->
	<iaixsl:variable name="main_news_date">true</iaixsl:variable>
	<iaixsl:variable name="main_news_after_label"/>
	<iaixsl:variable name="main_news_see_more">Read more</iaixsl:variable>
	<iaixsl:variable name="main_news_view_all"/>

	<iaixsl:if test="count(page/mainpage1/item) &gt; 0">
		<section id="main_news" class="article mb-5">
			<h2>
				<a href="/news.php" class="headline">
					<iaixsl:if test="/shop/page/mainpage1/@link and /shop/page/mainpage1/@link!=''">
						<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/page/mainpage1/@link"/></iaixsl:attribute>
					</iaixsl:if>
					<iaixsl:attribute name="title">Click here to view all news</iaixsl:attribute>
					<span class="headline__name">News</span>
					<iaixsl:if test="$main_news_after_label">
						<span class="headline__after"><iaixsl:value-of select="$main_news_after_label"/></span>
					</iaixsl:if>
				</a>
			</h2>

			<div class="article__block row">
				<iaixsl:for-each select="page/mainpage1/item">
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
							<iaixsl:if test="$main_news_date">
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
							<iaixsl:if test="$main_news_date">
								<iaixsl:attribute name="class">article__text --date</iaixsl:attribute>
							</iaixsl:if>
							<div class="article__description"><iaixsl:value-of disable-output-escaping="yes" select="description"/></div>
							<iaixsl:if test="more/@href and $main_news_see_more">
								<div class="article__more">
									<a class="article__more_link">
										<iaixsl:attribute name="href"><iaixsl:value-of select="more/@href"/></iaixsl:attribute>
										<iaixsl:attribute name="title"><iaixsl:value-of disable-output-escaping="yes" select="title"/></iaixsl:attribute>
										<iaixsl:value-of select="$main_news_see_more"/>
									</a>
								</div>
							</iaixsl:if>
						</div>
					</article>
				</iaixsl:for-each>
			</div>

			
			<iaixsl:if test="$main_news_view_all">
				<div class="article__all">
					<a href="/news.php" class="article__all_link">
						<iaixsl:if test="/shop/page/mainpage1/@link and /shop/page/mainpage1/@link!=''">
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/page/mainpage1/@link"/></iaixsl:attribute>
						</iaixsl:if>
						<iaixsl:attribute name="title">Click here to view all news</iaixsl:attribute>
						<iaixsl:value-of select="$main_news_view_all"/>
					</a>
				</div>
			</iaixsl:if>
		</section>
	</iaixsl:if>
<!-- (main_cms2, 60dd8e7963f590.06535622.1)-->
            <iaixsl:if test="page/text[@id='14']">
                <iaixsl:for-each select="page/text[@id='14']">
                        <div id="main_cms2" class="cm mb-4">
                            <iaixsl:value-of disable-output-escaping="yes" select="body"/>
                        </div>
                </iaixsl:for-each>
            </iaixsl:if>
        <!-- (main_banner3, 60dd8e7971b6a5.80968138.6)-->
	<iaixsl:if test="count(commercial_banner3/link)">
		<div id="menu_banners3" class="row mb-4 mx-0">
			<iaixsl:for-each select="commercial_banner3/link">
				<div class="menu_button_wrapper">
					<iaixsl:choose>
						<iaixsl:when test="count(/shop/commercial_banner3/link) = 1">
							<iaixsl:attribute name="class">menu_button_wrapper col-12</iaixsl:attribute>
						</iaixsl:when>
						<iaixsl:when test="count(/shop/commercial_banner3/link) = 2">
							<iaixsl:attribute name="class">menu_button_wrapper col-6</iaixsl:attribute>
						</iaixsl:when>
						<iaixsl:when test="count(/shop/commercial_banner3/link) = 3">
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
									<iaixsl:attribute name="href"><iaixsl:value-of select="@href"/></iaixsl:attribute>
									<iaixsl:if test="@target"><iaixsl:attribute name="target"><iaixsl:value-of select="@target"/></iaixsl:attribute></iaixsl:if>
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
	</iaixsl:if>
<!-- (main_instagram, 61ea6b913aaff9.86215405.5)-->
			<iaixsl:if test="/shop/integrations/instagram">
				<div id="instagram" class="instagram --skeleton --main mb-5">
          <iaixsl:attribute name="numberOfElements"><iaixsl:value-of disable-output-escaping="yes" select="/shop/integrations/instagram/@images_number"/></iaixsl:attribute>
					<div class="instagram__label">
						<h2>
													<iaixsl:choose>
								<iaixsl:when test="/shop/integrations/instagram/@headline_own = 'true'">
    								<a class="headline" target="blank">
    								  <iaixsl:attribute name="href"><iaixsl:value-of disable-output-escaping="yes" select="/shop/integrations/instagram/@profile_url"/></iaixsl:attribute>
    								  <iaixsl:attribute name="title">@we on Instagram</iaixsl:attribute>
    								  @we on Instagram
    								</a>
								</iaixsl:when>
								<iaixsl:otherwise>
                  <span class="headline" target="blank">
    									<iaixsl:choose>
    										<iaixsl:when test="/shop/integrations/instagram/hashtags/hashtag">
    											<iaixsl:for-each select="/shop/integrations/instagram/hashtags/hashtag">
    											  <a class="headlin__name" target="blank">
    								        <iaixsl:attribute name="href"><iaixsl:value-of disable-output-escaping="yes" select="@url"/></iaixsl:attribute>
    								        <iaixsl:attribute name="title"><iaixsl:value-of select="@name"/></iaixsl:attribute>
    												  <span class="mr-1">#<iaixsl:value-of select="@name"/></span>
    												</a>
    											</iaixsl:for-each>
    										</iaixsl:when>
    										<iaixsl:otherwise>
    										  <a class="headlin__name" target="blank">
    								        <iaixsl:attribute name="href"><iaixsl:value-of disable-output-escaping="yes" select="/shop/integrations/instagram/@profile_url"/></iaixsl:attribute>
    								        <iaixsl:attribute name="title">@<iaixsl:value-of select="/shop/integrations/instagram/@profile_name"/> on Instagram</iaixsl:attribute>
    											  @<iaixsl:value-of select="/shop/integrations/instagram/@profile_name"/> on Instagram
    											</a>
    											<a class="headline__after" target="blank">
														<iaixsl:attribute name="href"><iaixsl:value-of disable-output-escaping="yes" select="/shop/integrations/instagram/@profile_url"/></iaixsl:attribute>
														<iaixsl:attribute name="title">Check out our profile on Instagram</iaixsl:attribute>
														Check out our profile on Instagram
													</a>
    										</iaixsl:otherwise>
    									</iaixsl:choose>
    							</span>
								</iaixsl:otherwise>
							</iaixsl:choose>
						</h2>
					</div>
					<div class="instagram__items">
						<iaixsl:for-each select="(//node())[/shop/integrations/instagram/@images_number &gt;= position()]">
							<div class="instagram__item"/>
						</iaixsl:for-each>
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
        <!-- (menu_omnibus, 6458e0851cf079.14035433.4)-->


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
  
  
  

	
	<script src="/gfx/eng/envelope.js.gzip?r=1696937760"></script><script src="/gfx/eng/menu_suggested_shop_for_language.js.gzip?r=1696937760"></script><script src="/gfx/eng/menu_omnibus.js.gzip?r=1696937760"></script><script src="/gfx/eng/main_banner1.js.gzip?r=1696937760"></script><script src="/gfx/eng/main_instagram.js.gzip?r=1696937760"></script>

	
	<iaixsl:value-of disable-output-escaping="yes" select="php:functionString('additionalContent', 'additional_body_scripts')"/>
  
	<script>app_shop.runApp();</script>
	
	<iaixsl:if test="/shop/page/seolink_with_language_directory"/>

	<iaixsl:if test="(action/set_render/item/@name = 'popup') or not(action/set_render/item)">
		<iaixsl:text disable-output-escaping="yes">&lt;/body&gt;&lt;/html&gt;</iaixsl:text>
	</iaixsl:if>
</iaixsl:template><iaixsl:template match="//image"><iaixsl:if test="@type='swf'"><object type="application/x-shockwave-flash"><iaixsl:attribute name="data"><iaixsl:value-of select="@src"/></iaixsl:attribute><iaixsl:attribute name="data"><iaixsl:value-of select="@src"/></iaixsl:attribute><iaixsl:attribute name="width"><iaixsl:value-of select="@width"/></iaixsl:attribute><iaixsl:attribute name="height"><iaixsl:value-of select="@height"/></iaixsl:attribute><param name="movie"><iaixsl:attribute name="value"><iaixsl:value-of select="@src"/></iaixsl:attribute></param><param name="bgcolor"><iaixsl:attribute name="bgcolor"><iaixsl:value-of select="@bgcolor"/></iaixsl:attribute></param></object></iaixsl:if><iaixsl:if test="not(@type='swf')"><img alt="" class="pic"><iaixsl:attribute name="src"><iaixsl:value-of select="@src"/></iaixsl:attribute><iaixsl:if test="@width &gt; 0"><iaixsl:attribute name="width"><iaixsl:value-of select="@width"/></iaixsl:attribute></iaixsl:if><iaixsl:if test="@height &gt; 0"><iaixsl:attribute name="height"><iaixsl:value-of select="@height"/></iaixsl:attribute></iaixsl:if></img></iaixsl:if></iaixsl:template><iaixsl:template name="escape-backslash"><iaixsl:param name="str" select="."/><iaixsl:choose><iaixsl:when test="contains($str, '\')"><iaixsl:value-of select="concat(substring-before($str, '\'), '\\' )"/><iaixsl:call-template name="escape-backslash"><iaixsl:with-param name="str" select="substring-after($str, '\')"/></iaixsl:call-template></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="$str"/></iaixsl:otherwise></iaixsl:choose></iaixsl:template><iaixsl:template name="escape-quote-string"><iaixsl:param name="str"/><iaixsl:param name="escape_backslash"/><iaixsl:param name="escape" select="'quot'"/><iaixsl:param name="quoting" select="'1'"/><iaixsl:variable name="escape_sign"><iaixsl:choose><iaixsl:when test="$escape=&quot;apos&quot;"><iaixsl:value-of select="&quot;'&quot;"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="string('&quot;')"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable><iaixsl:if test="$quoting"><iaixsl:value-of select="$escape_sign"/></iaixsl:if><iaixsl:choose><iaixsl:when test="contains($str,$escape_sign)"><iaixsl:variable name="before-first-apostrophe" select="substring-before($str,$escape_sign)"/><iaixsl:variable name="after-first-apostrophe" select="substring-after($str,$escape_sign)"/><iaixsl:value-of select="$before-first-apostrophe"/>\<iaixsl:value-of select="$escape_sign"/><iaixsl:text/><iaixsl:call-template name="escape-quote-string"><iaixsl:with-param name="str" select="$after-first-apostrophe"/><iaixsl:with-param name="escape" select="$escape"/><iaixsl:with-param name="quoting" select="0"/></iaixsl:call-template></iaixsl:when><iaixsl:otherwise><iaixsl:choose><iaixsl:when test="not($escape_backslash)"><iaixsl:value-of select="$str"/></iaixsl:when><iaixsl:otherwise><iaixsl:call-template name="escape-backslash"><iaixsl:with-param name="str" select="$str"/></iaixsl:call-template></iaixsl:otherwise></iaixsl:choose></iaixsl:otherwise></iaixsl:choose><iaixsl:if test="$quoting"><iaixsl:value-of select="$escape_sign"/></iaixsl:if></iaixsl:template></iaixsl:stylesheet>