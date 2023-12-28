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
				<div class="d-none d-md-flex col-md-4 infoWrapper">
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
					<div id="logo" class=""><a href="./index.php" target="_self">
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
									<strong class="progress__name">Koszyk</strong>
									<span class="progress__description">Wartość koszyka: <iaixsl:choose><iaixsl:when test="not($wholesalerPrice_order_progress = '')"><iaixsl:value-of select="basket/@cost_net_formatted"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="basket/@cost_formatted"/></iaixsl:otherwise></iaixsl:choose></span>
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
												<strong class="progress__name">Twoje dane</strong>
												<span class="progress__description">Podaj dane do wysyłki</span>
											</iaixsl:when>
											<iaixsl:otherwise>
												<strong class="progress__name">Twoje dane</strong>
												<span class="progress__description">Zaloguj się lub podaj dane</span>
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
										<strong class="progress__name">Dostawa i płatności</strong>
										<span class="progress__description">Wybierz sposób dostawy i płatności</span>
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
										<strong class="progress__name">Weryfikacja danych</strong>
										<span class="progress__description">Sprawdź poprawność zamówienia przed jego złożeniem</span>
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
										<strong class="progress__name">Dostawa i płatności</strong>
										<span class="progress__description">Wybierz sposób dostawy i płatności</span>
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
										<strong class="progress__name">Weryfikacja danych</strong>
										<span class="progress__description">Sprawdź poprawność zamówienia przed jego złożeniem</span>
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
										<strong class="progress__name">Złożenie zamówienia</strong>
										<span class="progress__description">Przyjęcie do realizacji</span>
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
									<strong class="progress__name">Koszyk</strong>
									<span class="progress__description">Wartość koszyka: <iaixsl:choose><iaixsl:when test="not($wholesalerPrice_order_progress = '')"><iaixsl:value-of select="basket/@cost_net_formatted"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="basket/@cost_formatted"/></iaixsl:otherwise></iaixsl:choose></span>
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
									<strong class="progress__name">Twoje dane</strong>
									<span class="progress__description">Zaloguj się lub podaj dane</span>
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
									<strong class="progress__name">Dostawa i płatności</strong>
									<span class="progress__description">Wybierz sposób dostawy i płatności</span>
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
									<strong class="progress__name">Weryfikacja danych</strong>
									<span class="progress__description">Sprawdź poprawność zamówienia przed jego złożeniem</span>
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
									<strong class="progress__name">Koszyk</strong>
									<span class="progress__description">Wartość koszyka: <iaixsl:choose><iaixsl:when test="not($wholesalerPrice_order_progress = '')"><iaixsl:value-of select="basket/@cost_net_formatted"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="basket/@cost_formatted"/></iaixsl:otherwise></iaixsl:choose></span>
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
									<strong class="progress__name">Twoje dane</strong>
									<span class="progress__description">Podaj dane do wysyłki</span>
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
									<strong class="progress__name">Dostawa i płatności</strong>
									<span class="progress__description">Wybierz sposób dostawy i płatności</span>
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
									<strong class="progress__name">Weryfikacja danych</strong>
									<span class="progress__description">Sprawdź poprawność zamówienia przed jego złożeniem</span>
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
									<strong class="progress__name">Koszyk</strong>
									<span class="progress__description">Wartość koszyka: <iaixsl:choose><iaixsl:when test="not($wholesalerPrice_order_progress = '')"><iaixsl:value-of select="basket/@cost_net_formatted"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="basket/@cost_formatted"/></iaixsl:otherwise></iaixsl:choose></span>
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
									<strong class="progress__name">Dostawa i płatności</strong>
									<span class="progress__description">Wybierz sposób dostawy i płatności</span>
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
									<strong class="progress__name">Weryfikacja danych</strong>
									<span class="progress__description">Sprawdź poprawność zamówienia przed jego złożeniem</span>
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
											<strong class="progress__name">Zapisanie danych</strong>
											<span class="progress__description">Zapamiętanie klienta</span>
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
											<strong class="progress__name">Złożenie zamówienia</strong>
											<span class="progress__description">Przyjęcie do realizacji</span>
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
									<strong class="progress__name">Koszyk</strong>
									<span class="progress__description">Wartość koszyka: <iaixsl:choose><iaixsl:when test="not($wholesalerPrice_order_progress = '')"><iaixsl:value-of select="basket/@cost_net_formatted"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="basket/@cost_formatted"/></iaixsl:otherwise></iaixsl:choose></span>
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
									<strong class="progress__name">Dostawa i płatności</strong>
									<span class="progress__description">Zamówienie niestandardowe</span>
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
									<strong class="progress__name">Weryfikacja danych</strong>
									<span class="progress__description">Sprawdź poprawność zamówienia przed jego złożeniem</span>
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
											<strong class="progress__name">Zapisanie danych</strong>
											<span class="progress__description">Zapamiętanie klienta</span>
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
											<strong class="progress__name">Złożenie zamówienia</strong>
											<span class="progress__description">Przyjęcie do realizacji</span>
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
									<strong class="progress__name">Koszyk</strong>
									<span class="progress__description">Wartość koszyka: <iaixsl:choose><iaixsl:when test="not($wholesalerPrice_order_progress = '')"><iaixsl:value-of select="basket/@cost_net_formatted"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="basket/@cost_formatted"/></iaixsl:otherwise></iaixsl:choose></span>
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
									<strong class="progress__name">Dostawa i płatności</strong>
									<span class="progress__description">Wybierz punkt odbioru</span>
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
									<strong class="progress__name">Weryfikacja danych</strong>
									<span class="progress__description">Sprawdź poprawność zamówienia przed jego złożeniem</span>
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
											<strong class="progress__name">Zapisanie danych</strong>
											<span class="progress__description">Zapamiętanie klienta</span>
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
											<strong class="progress__name">Złożenie zamówienia</strong>
											<span class="progress__description">Przyjęcie do realizacji</span>
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
									<strong class="progress__name">Koszyk</strong>
									<span class="progress__description">Wartość koszyka: <iaixsl:choose><iaixsl:when test="not($wholesalerPrice_order_progress = '')"><iaixsl:value-of select="basket/@cost_net_formatted"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="basket/@cost_formatted"/></iaixsl:otherwise></iaixsl:choose></span>
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
									<strong class="progress__name">Dostawa i płatności</strong>
									<span class="progress__description">Wybierz sposób dostawy i płatności</span>
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
									<strong class="progress__name">Weryfikacja danych</strong>
									<span class="progress__description">Sprawdź poprawność zamówienia przed jego złożeniem</span>
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
											<strong class="progress__name">Zapisanie danych</strong>
											<span class="progress__description">Zapamiętanie klienta</span>
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
											<strong class="progress__name">Złożenie zamówienia</strong>
											<span class="progress__description">Przyjęcie do realizacji</span>
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
									<strong class="progress__name">Koszyk</strong>
									<span class="progress__description">Wartość koszyka: <iaixsl:choose><iaixsl:when test="not($wholesalerPrice_order_progress = '')"><iaixsl:value-of select="basket/@cost_net_formatted"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="basket/@cost_formatted"/></iaixsl:otherwise></iaixsl:choose></span>
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
									<strong class="progress__name">Weryfikacja danych</strong>
									<span class="progress__description">Sprawdź poprawność zamówienia przed jego złożeniem</span>
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
									<strong class="progress__name">Zapisanie danych</strong>
									<span class="progress__description">Zapamiętanie klienta</span>
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
									<strong class="progress__name">Złożenie zamówienia</strong>
									<span class="progress__description">Przyjęcie do realizacji</span>
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
									<strong class="progress__name">Koszyk</strong>
									<span class="progress__description">Wartość koszyka: <iaixsl:choose><iaixsl:when test="not($wholesalerPrice_order_progress = '')"><iaixsl:value-of select="basket/@cost_net_formatted"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="basket/@cost_formatted"/></iaixsl:otherwise></iaixsl:choose></span>
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
									<strong class="progress__name">Dostawa i płatności</strong>
									<span class="progress__description">Wybierz sposób dostawy i płatności</span>
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
									<strong class="progress__name">Weryfikacja danych</strong>
									<span class="progress__description">Sprawdź poprawność zamówienia przed jego złożeniem</span>
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
									<strong class="progress__name">Zamówienie złożone</strong>
									<span class="progress__description">Status zamówienia: 
										<iaixsl:choose>
											<iaixsl:when test="(page/prepaid/details/@wykonane = 'n')">przyjęte</iaixsl:when>
											<iaixsl:when test="(page/prepaid/details/@wykonane = 't')">wysłane</iaixsl:when>
											<iaixsl:when test="(page/prepaid/details/@wykonane = 'i')">odrzucone</iaixsl:when>
											<iaixsl:when test="(page/prepaid/details/@wykonane = 's')">anulowane</iaixsl:when>
											<iaixsl:when test="(page/prepaid/details/@wykonane = 'o')">realizowane</iaixsl:when>
											<iaixsl:when test="(page/prepaid/details/@wykonane = 'p')">gotowe</iaixsl:when>
											<iaixsl:when test="(page/prepaid/details/@wykonane = 'h')">wstrzymane</iaixsl:when>
											<iaixsl:when test="(page/prepaid/details/@wykonane = 'w')">oczekujemy na wpłatę</iaixsl:when>
											<iaixsl:when test="(page/prepaid/details/@wykonane = 'd')">oczekujemy na dostawę</iaixsl:when>
											<iaixsl:when test="(page/prepaid/details/@wykonane = 'z')">zwrot</iaixsl:when>
											<iaixsl:when test="(page/prepaid/details/@wykonane = 'k')">anulowane</iaixsl:when>
											<iaixsl:when test="(page/prepaid/details/@wykonane = 'r')">reklamacja</iaixsl:when>
											<iaixsl:when test="(page/prepaid/details/@wykonane = 'j')">połączone</iaixsl:when>
											<iaixsl:when test="(page/prepaid/details/@wykonane = 'l')">zgubione</iaixsl:when>
											<iaixsl:when test="(page/prepaid/details/@wykonane = 'a')">realizowane</iaixsl:when>
											<iaixsl:when test="(page/prepaid/details/@wykonane = 'b')">pakowane</iaixsl:when>
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
									<strong class="progress__name">Koszyk</strong>
									<span class="progress__description">Wartość koszyka: <iaixsl:choose><iaixsl:when test="not($wholesalerPrice_order_progress = '')"><iaixsl:value-of select="basket/@cost_net_formatted"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="basket/@cost_formatted"/></iaixsl:otherwise></iaixsl:choose></span>
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
									<strong class="progress__name">Dostawa i płatności</strong>
									<span class="progress__description">Wybierz sposób dostawy i płatności</span>
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
									<strong class="progress__name">Weryfikacja danych</strong>
									<span class="progress__description">Sprawdź poprawność zamówienia przed jego złożeniem</span>
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
									<strong class="progress__name">Zamówienie złożone</strong>
									<span class="progress__description">Status zamówienia: oczekujemy na wpłatę</span>
								</div>
							</div>
						</section>
					</iaixsl:when>
				</iaixsl:choose>
			</iaixsl:if>
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

        <!-- (basketedit_cms, 60dd8e7a80d4b7.91464999.9)-->
            <iaixsl:if test="page/basket-details/text/body">
                <div class="basket_cms cm">
                    <iaixsl:value-of disable-output-escaping="yes" select="page/basket-details/text/body"/>
                </div>
            </iaixsl:if>
        <!-- (basketedit_productslist, 614c5ceddc4605.25670153.10)-->

	
	<iaixsl:variable name="txt_50001_025a">Przed realizacją zamówienia z płatnością przy odbiorze wymagana jest zaliczka na ten towar: </iaixsl:variable>
	<iaixsl:variable name="txt_67332_am">Aktualnie mamy </iaixsl:variable>
	<iaixsl:variable name="txt_67332_wm"> w magazynie. Dodatkowa ilość znajduje się w magazynie naszego dostawcy.</iaixsl:variable>
	<iaixsl:variable name="setIconLarge"/>
	<iaixsl:variable name="nettoPriceBasketedit"><iaixsl:if test="/shop/page/@price_type = 'net'">true</iaixsl:if></iaixsl:variable>
	<iaixsl:variable name="grossPriceBasketedit"> brutto</iaixsl:variable>
	<iaixsl:variable name="basketedit_division">true</iaixsl:variable>
	
	<iaixsl:variable name="visibleProductsInGroup">2</iaixsl:variable>

	<iaixsl:if test="page/@type = 'basketedit'">
		<section id="Basket" class="basket">
			<form class="basket__form" action="/basketchange.php?type=multiproduct" method="post" enctype="multipart/form-data">
				<iaixsl:if test="count(/shop/page/basket-details/product) = 1">
					<iaixsl:attribute name="data-one-product">true</iaixsl:attribute>
				</iaixsl:if>
				<iaixsl:choose>
					<iaixsl:when test="/shop/allow_division_order/@is_active = 'false' or count(page/basket-details/product[@division='later']) = 0 or count(page/basket-details/product[@division='now']) = 0 or /shop/allow_division_order/@turn_on = 'no'">
						<h2 class="basket__label headline d-none d-md-block"><span class="headline__name">Twój koszyk</span></h2>

						<div class="basket__productslist">
							
							<iaixsl:if test="page/basket-details/product[@basket_group_id]">
								<iaixsl:attribute name="data-groups">true</iaixsl:attribute>
							</iaixsl:if>
							<div class="basket__block --labels">
								<div class="basket__item --photo">

								</div>

								<div class="basket__item --name">

								</div>

								<div class="basket__item --prices">
									Cena jedn.
								</div>

								<div class="basket__item --sum">
									Wartość
								</div>

								<div class="basket__item --actions">
									<div class="basket__action --quantity">
										Ilość
									</div>

									<div class="basket__action --calculate">
										Przelicz
									</div>

									<div class="basket__action --remove">
										Usuń
									</div>

									<iaixsl:if test="/shop/basket/@product_comment_active = 'y' and count(/shop/page/basket-details/product/price[not(@special_offer='true')]) &gt; 0">
										<div class="basket__action --comment">
											Uwagi
										</div>
									</iaixsl:if>
								</div>
							</div>

							<iaixsl:for-each select="page/basket-details/product">
								<div class="basket__block">
									<iaixsl:choose>
										<iaixsl:when test="price/@special_offer='true' and price/@special_offer_changeable_quantity='true'">
											<iaixsl:attribute name="class">basket__block --special --special_quantity</iaixsl:attribute>
											<iaixsl:if test="size/@amount = '0' and price/@special_offer='true'">
												<iaixsl:attribute name="class">basket__block --special --special_quantity --no_product</iaixsl:attribute>
											</iaixsl:if>
										</iaixsl:when>
										<iaixsl:when test="price/@special_offer='true'">
											<iaixsl:attribute name="class">basket__block --special</iaixsl:attribute>
											<iaixsl:if test="size/@amount = '0' and price/@special_offer='true'">
												<iaixsl:attribute name="class">basket__block --special --no_product</iaixsl:attribute>
											</iaixsl:if>
										</iaixsl:when>
										<iaixsl:otherwise>
											<iaixsl:attribute name="class">basket__block</iaixsl:attribute>
											<iaixsl:if test="size/@amount = '0'">
												<iaixsl:attribute name="class">basket__block --no_product</iaixsl:attribute>
											</iaixsl:if>
										</iaixsl:otherwise>
									</iaixsl:choose>

									<iaixsl:attribute name="data-product-id"><iaixsl:value-of select="@id"/></iaixsl:attribute>
									<iaixsl:attribute name="data-product-size"><iaixsl:value-of select="size/@type"/></iaixsl:attribute>
									<iaixsl:attribute name="data-product-checkbox-id"><iaixsl:value-of select="@id"/>_<iaixsl:value-of select="size/@type"/>_<iaixsl:value-of select="additional/@hash"/></iaixsl:attribute>
									
									<iaixsl:variable name="groupId"><iaixsl:value-of select="@basket_group_id"/></iaixsl:variable>
									
									<iaixsl:variable name="subscriptionGroup"><iaixsl:value-of select="/shop/basket/groups/group[@id = $groupId]/types/type[@value = 'subscription']/@value != ''"/></iaixsl:variable>
									
									<iaixsl:if test="@basket_group_id">
										<iaixsl:attribute name="data-group"><iaixsl:for-each select="/shop/basket/groups/group[@id = $groupId]/types/type"><iaixsl:value-of select="@value"/><iaixsl:if test="position() != last()">;</iaixsl:if></iaixsl:for-each></iaixsl:attribute>
										<iaixsl:attribute name="style">--group:<iaixsl:value-of select="$groupId"/>;</iaixsl:attribute>
										<iaixsl:attribute name="data-group-id"><iaixsl:value-of select="$groupId"/></iaixsl:attribute>
										<iaixsl:if test="not($groupId = preceding-sibling::product/@basket_group_id)">
											<iaixsl:attribute name="data-first-in-group">true</iaixsl:attribute>
											<iaixsl:if test="$subscriptionGroup = 'true'">
												<iaixsl:attribute name="data-label-group">Subskrypcja</iaixsl:attribute>
											</iaixsl:if>
										</iaixsl:if>
										<iaixsl:if test="not($groupId = following-sibling::product/@basket_group_id)">
											<iaixsl:attribute name="data-last-in-group">true</iaixsl:attribute>
										</iaixsl:if>
										<iaixsl:if test="count(preceding-sibling::product[@basket_group_id = $groupId]) &gt;= $visibleProductsInGroup">
											<iaixsl:attribute name="data-hide">true</iaixsl:attribute>
										</iaixsl:if>
										<iaixsl:if test="count(preceding-sibling::product[@basket_group_id = $groupId]) = $visibleProductsInGroup - 1 and $groupId = following-sibling::product/@basket_group_id">
											<iaixsl:attribute name="data-last-visible">true</iaixsl:attribute>
										</iaixsl:if>
									</iaixsl:if>

									
									<iaixsl:if test="count(preceding-sibling::product[@basket_group_id = $groupId]) = $visibleProductsInGroup - 1 and $groupId = following-sibling::product/@basket_group_id">
										<a href="#showAllInGroup" class="basket__visible_in_group --show">+<iaixsl:value-of select="count(following-sibling::product[@basket_group_id = $groupId])"/> produkty w subskrypcji</a>
									</iaixsl:if>

									
									<iaixsl:if test="count(preceding-sibling::product[@basket_group_id = $groupId]) &gt;= $visibleProductsInGroup and not($groupId = following-sibling::product/@basket_group_id)">
										<a href="#hideAllInGroup" class="basket__visible_in_group --hide">Ukryj</a>
									</iaixsl:if>

									
									<div class="basket__item --photo">
										
										<div class="basket__checkbox d-md-none">
											<div class="f-group --checkbox mb-0">
												<input type="checkbox" class="basket__product_checkbox f-control">
													<iaixsl:attribute name="value"><iaixsl:value-of select="@id"/>_<iaixsl:value-of select="size/@type"/>_<iaixsl:value-of select="additional/@hash"/></iaixsl:attribute>
													<iaixsl:attribute name="id">basket_product_checkbox_<iaixsl:value-of select="@id"/>_<iaixsl:value-of select="size/@type"/>_<iaixsl:value-of select="additional/@hash"/></iaixsl:attribute>
													<iaixsl:if test="count(/shop/page/basket-details/product) = 1">
														<iaixsl:attribute name="checked">checked</iaixsl:attribute>
													</iaixsl:if>
												</input>
												<label class="basket__product_checkbox_label f-label mr-0">
													<iaixsl:attribute name="for">basket_product_checkbox_<iaixsl:value-of select="@id"/>_<iaixsl:value-of select="size/@type"/>_<iaixsl:value-of select="additional/@hash"/></iaixsl:attribute>
												</label>
											</div>
										</div>
										<a class="photo__link">
											<iaixsl:attribute name="href"><iaixsl:value-of select="@link"/></iaixsl:attribute>
                      <iaixsl:choose>
                        <iaixsl:when test="icon_src_second and not(icon_src_second = '' or icon_src_second = '/')">
                          <picture>
                            <source type="image/webp">
                              <iaixsl:choose>
                                <iaixsl:when test="$setIconLarge">
                                  <iaixsl:attribute name="srcset"><iaixsl:value-of select="icon"/></iaixsl:attribute>
                                </iaixsl:when>
                                <iaixsl:otherwise>
                                  <iaixsl:attribute name="srcset"><iaixsl:value-of select="icon_small"/></iaixsl:attribute>
                                </iaixsl:otherwise>
                              </iaixsl:choose>
                              <img class="photo__image">
                                <iaixsl:choose>
                                  <iaixsl:when test="$setIconLarge">
                                    <iaixsl:attribute name="src"><iaixsl:value-of select="icon_src_second"/></iaixsl:attribute>
                                  </iaixsl:when>
                                  <iaixsl:otherwise>
                                    <iaixsl:attribute name="src"><iaixsl:value-of select="iconsmall_second"/></iaixsl:attribute>
                                  </iaixsl:otherwise>
                                </iaixsl:choose>
                                <iaixsl:attribute name="alt"><iaixsl:value-of disable-output-escaping="yes" select="name/text()"/></iaixsl:attribute>
                              </img>
                            </source>
                          </picture>
                        </iaixsl:when>
                        <iaixsl:otherwise>
                          <img class="photo__image">
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
										</a>
									</div>

									
									<div class="basket__item --name">
										<div class="basket__name">
											<div class="basket__product">
												<h3 class="product__name">
													<a class="product__link">
														<iaixsl:attribute name="href"><iaixsl:value-of select="@link"/></iaixsl:attribute>
														<iaixsl:value-of disable-output-escaping="yes" select="name/text()"/>
													</a>
													<iaixsl:if test="@product_type = 'product_virtual'">
														<span class="product__virtual">Towar wirtualny</span>
													</iaixsl:if>

													<iaixsl:if test="@product_type = 'product_service'">
														<span class="product__service">Usługa</span>
													</iaixsl:if>

													<iaixsl:if test="price/@special_offer='true'">
														<span class="product__special">Oferta specjalna</span>
													</iaixsl:if>
												</h3>
												<div class="product__price_container">
													<div class="product__price">
														<iaixsl:choose>
															<iaixsl:when test="size/@ordered_points">
																<span class="basket__sum --points">
																	<iaixsl:value-of select="price/@points_sum"/> pkt.
																</span>
															</iaixsl:when>
															<iaixsl:otherwise>
																<span class="basket__sum">
																	<iaixsl:choose>
																		<iaixsl:when test="not($nettoPriceBasketedit = '') and not($priceTypeVat = '')">
																			<span class="basket__sum_net"><iaixsl:value-of select="price/@worth_net_formatted"/><span class="price_vat"><iaixsl:value-of select="$priceTypeText"/></span></span>
																			<span class="basket__sum_gross gross_price">(<iaixsl:value-of select="price/@worth_formatted"/><span class="price_vat"><iaixsl:value-of select="$grossPriceBasketedit"/></span>)</span>
																		</iaixsl:when>
																		<iaixsl:otherwise>
																			<iaixsl:value-of select="price/@worth_formatted"/>
																		</iaixsl:otherwise>
																	</iaixsl:choose>
																</span>
															</iaixsl:otherwise>
														</iaixsl:choose>
													</div>
													
													<a href="#showActions" class="basket__show_wrapper --click">
														<span class="basket__show --ordered">
															<iaixsl:choose>
																<iaixsl:when test="size/@ordered_points">
																	<iaixsl:value-of select="size/@ordered_points"/>
																</iaixsl:when>
																<iaixsl:otherwise>
																	<iaixsl:value-of select="size/@ordered"/>
																</iaixsl:otherwise>
															</iaixsl:choose>
														</span>
														<span class="basket__show --actions btn icon-angle-down"/>
													</a>
												</div>
											</div>
										</div>

										
										<iaixsl:if test="$subscriptionGroup = 'true'">
											<div class="basket__param --subscription --period">
												<span class="param__label">
													Wysyłka co:
												</span>
												<strong class="param__value">
													<iaixsl:attribute name="data-change-literal-days"><iaixsl:value-of select="/shop/basket/groups/group[@id = $groupId]/details/subscription/@days_in_period"/></iaixsl:attribute>
													<iaixsl:value-of select="/shop/basket/groups/group[@id = $groupId]/details/subscription/@days_in_period"/> dni
												</strong>
											</div>
										</iaixsl:if>

										
										<iaixsl:if test="$subscriptionGroup = 'true'">
											<div class="basket__param --subscription --next">
												<span class="param__label">
													Kolejna dostawa:
												</span>
												<strong class="param__value">
													<iaixsl:variable name="next_order_week_day"><iaixsl:value-of select="/shop/basket/groups/group[@id = $groupId]/details/subscription/dates/@next_order_week_day"/></iaixsl:variable>
													<span class="param__day_name">
														<iaixsl:choose>
															<iaixsl:when test="$next_order_week_day = 1">
																Poniedziałek
															</iaixsl:when>
															<iaixsl:when test="$next_order_week_day = 2">
																Wtorek
															</iaixsl:when>
															<iaixsl:when test="$next_order_week_day = 3">
																Środa
															</iaixsl:when>
															<iaixsl:when test="$next_order_week_day = 4">
																Czwartek
															</iaixsl:when>
															<iaixsl:when test="$next_order_week_day = 5">
																Piątek
															</iaixsl:when>
															<iaixsl:when test="$next_order_week_day = 6">
																Sobota
															</iaixsl:when>
															<iaixsl:when test="$next_order_week_day = 7">
																Niedziela
															</iaixsl:when>
														</iaixsl:choose>
													</span>
													<iaixsl:variable name="next_order_time"><iaixsl:value-of select="/shop/basket/groups/group[@id = $groupId]/details/subscription/dates/@date_next_order"/></iaixsl:variable>
													<iaixsl:variable name="next_order_time_month_day"><iaixsl:value-of select="substring($next_order_time, 6, 5)"/></iaixsl:variable>
													<iaixsl:variable name="next_order_time_formatted"><iaixsl:value-of select="substring-after($next_order_time_month_day, '-')"/>.<iaixsl:value-of select="substring-before($next_order_time_month_day, '-')"/></iaixsl:variable>
													<span class="param__date_wrapper"> (<span><iaixsl:value-of select="$next_order_time_formatted"/></span>)</span>
												</strong>
											</div>
										</iaixsl:if>

										
										<iaixsl:if test="price/@special_offer='true'">
											<div class="basket__param --special">
												<span class="param__label">
													Dzięki ofercie specjalnej zyskujesz
													<strong class="param__save"><iaixsl:value-of select="price/@yousave_formatted"/></strong>, czyli
													<strong class="param__save_percent"><iaixsl:value-of select="price/@yousave_percent"/>%</strong>
													wartości tego produktu.
												</span>
											</div>
										</iaixsl:if>

										
										<iaixsl:if test="not(@barcode ='')">
											<div class="basket__param --barcode">
												<span class="param__label">
													Symbol:
												</span>
												<span class="param__value">
													<iaixsl:value-of select="@barcode"/>
												</span>
											</div>
										</iaixsl:if>

										
										<iaixsl:if test="price/priceformula/parameters">
											<iaixsl:for-each select="price/priceformula/parameters/parameter">
												<div class="basket__param --priceformula">
													<span class="param__label">
														<iaixsl:value-of select="name"/>:
													</span>
													<span class="param__value">
														<iaixsl:value-of select="values/value"/>
													</span>
												</div>
											</iaixsl:for-each>
										</iaixsl:if>

										
										<iaixsl:if test="not(size/@type='uniw')">
											<div class="basket__param --size">
												<span class="param__label">
													Rozmiar:
												</span>
												<span class="param__value">
													<iaixsl:value-of select="size/@description"/>
												</span>
											</div>
										</iaixsl:if>

										
										<iaixsl:if test="(version) and (not(version/@product_name=''))">
											<div class="basket__param --version">
												<span class="param__label">
													<iaixsl:value-of select="version/@name"/>:
												</span>
												<span class="param__value">
													<iaixsl:value-of select="version/@product_name"/>
												</span>
											</div>
										</iaixsl:if>

										
										<iaixsl:if test="@product_type = 'product_bundle'">
											<div class="basket__param --bundle">
												<iaixsl:if test="@collection = 'true'">
													<iaixsl:attribute name="class">basket__param --bundle --collection</iaixsl:attribute>
												</iaixsl:if>
												<span class="param__label">
													Składowe zestawu:
												</span>
												<div class="param__wrapper">
													<iaixsl:for-each select="bundled/product">
														<span class="param__value">
															<iaixsl:if test="size/@ordered &gt; 1">
																<iaixsl:value-of select="size/@ordered"/>x 
															</iaixsl:if>

															<iaixsl:value-of select="name/text()"/>

															<iaixsl:if test="not(size/@type='uniw') or ((version) and (not(version/@product_name='')))">
																(<iaixsl:if test="not(size/@type='uniw')">Rozmiar: <b><iaixsl:value-of select="size/@description"/></b></iaixsl:if><iaixsl:if test="not(size/@type='uniw') and ((version) and (not(version/@product_name='')))">, </iaixsl:if><iaixsl:if test="(version) and (not(version/@product_name=''))"><iaixsl:value-of select="version/@name"/>: <b><iaixsl:value-of select="version/@product_name"/></b></iaixsl:if>)
															</iaixsl:if>

															<iaixsl:if test="@product_type = 'product_virtual'">
																<span class="param__virtual">Towar wirtualny</span>
															</iaixsl:if>

															<iaixsl:if test="@product_type = 'product_service'">
																<span class="param__service">Usługa</span>
															</iaixsl:if>
														</span>
													</iaixsl:for-each>
												</div>
											</div>
										</iaixsl:if>

										
										<iaixsl:if test="change_group">
											<div class="basket__param --info">
												Nie możesz usunąć tego produktu.
											</div>
										</iaixsl:if>

										
										<iaixsl:choose>
											<iaixsl:when test="(size/@orderedsum) &gt; (size/@amount) and not(size/@amount = '0') and not(size/@amount = '-1')">
												<div class="basket__param --info">
													<span class="param__label">
														Nie mamy w tej chwili takiej ilości produktu. Zmniejsz zamawianą ilość do <iaixsl:value-of select="size/@amount"/>, lub wybierz inny produkt.
													</span>
												</div>
											</iaixsl:when>

											<iaixsl:when test="size/@amount = '0'">
												<div class="basket__param --info">
													<span class="param__label">
														Ten produkt właśnie się nam skończył. Wybierz inny produkt.
													</span>
												</div>
											</iaixsl:when>

											<iaixsl:when test="(size/@ordered_points) and not(/shop/basket/@client_points &gt;= 0)">
												<div class="basket__param --info">
													<span class="param__label">
														Masz za mało punktów lojalnościowych by kupić tyle produktów za punkty.
													</span>
												</div>
											</iaixsl:when>

											<iaixsl:when test="(/shop/page/rebates/code_details/@active = 'y') and ((/shop/rebate_code/shipping_cost_rebate/@active='n') and (price/@rebate_code_active='n'))">
												<div class="basket__param --info">
													<span class="param__label">
														Podany kod rabatowy nie obejmuje tego towaru.
													</span>
												</div>
											</iaixsl:when>

											<iaixsl:when test="@product_type='product_virtual' and not(count(/shop/page/basket-details/product) = count(/shop/page/basket-details/product[@product_type='product_virtual']))">
												<div class="basket__param --info">
													<span class="param__label">
														Produkt będzie dostępny w sekcji
														<a class="param__link --link">
															<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/client_files/@link_to_download"/></iaixsl:attribute>
															&quot;Moje pliki&quot;
														</a>
															po zrealizowaniu zamówienia.
													</span>
												</div>
											</iaixsl:when>
										</iaixsl:choose>

										<iaixsl:if test="(size/@to_little_for_gross = 'true') and not((size/@orderedsum) &gt; (size/@amount) and not(size/@amount = '0') and not(size/@amount = '-1'))">
											<div class="basket__param --info">
												<span class="param__label">
													Dysponujemy
													<iaixsl:value-of select="size/@amount_wholesale"/>
														szt. produktu w cenie hurtowej. W koszyku masz
													<iaixsl:value-of select="size/@ordered - size/@amount_wholesale"/>
														szt. produktu w cenie detalicznej.
												</span>
											</div>
										</iaixsl:if>

										
										<iaixsl:if test="$txt_50001_025a and (price/@advanceworth &gt; 0)">
											<div class="basket__param --advance">
												<span class="param__label">
													<iaixsl:choose>
														<iaixsl:when test="/shop/page/basket-details/summary/money/@advance_mode = 'default' or /shop/page/basket-details/summary/money/@advance_mode = 'none'">
															<iaixsl:choose>
																<iaixsl:when test="/shop/page/basket-details/summary/money/@cash_on_delivery = 'true' and /shop/page/basket-details/summary/money/@prepaid = 'false'">
																	Przed realizacją zamówienia z płatnością przy odbiorze wymagana jest zaliczka na ten towar: <iaixsl:value-of select="price/@advanceworth_formatted"/>
																</iaixsl:when>
																<iaixsl:when test="/shop/page/basket-details/summary/money/@cash_on_delivery = 'false' and /shop/page/basket-details/summary/money/@prepaid = 'true'">
																	Przed realizacją zamówienia z płatnością za przedpłatą wymagana jest zaliczka na ten towar: <iaixsl:value-of select="price/@advanceworth_formatted"/>
																</iaixsl:when>
																<iaixsl:when test="/shop/page/basket-details/summary/money/@cash_on_delivery = 'true' and /shop/page/basket-details/summary/money/@prepaid = 'true'">
																	Przed realizacją zamówienia wymagana jest zaliczka na ten towar: <iaixsl:value-of select="price/@advanceworth_formatted"/>
																</iaixsl:when>
															</iaixsl:choose>
														</iaixsl:when>
														<iaixsl:when test="/shop/page/basket-details/summary/money/@advance_mode = 'total'">
															Przed realizacją zamówienia wymagana jest zaliczka na ten towar: <iaixsl:value-of select="price/@advanceworth_formatted"/>
														</iaixsl:when>
													</iaixsl:choose>
												</span>
											</div>
										</iaixsl:if>

										
										<iaixsl:if test="comment">
											<div class="basket__param --comment d-none d-md-block">
												<a href="#editComment" class="param__label d-block --click">
													<iaixsl:value-of disable-output-escaping="yes" select="comment"/>
												</a>
											</div>
										</iaixsl:if>

										
										<iaixsl:if test="order_files/file">
											<div class="basket__param --files d-none d-md-block">
												<iaixsl:for-each select="order_files/file">
													<div class="preview__wrapper">
														<a class="preview__button btn --icon-left --secondary icon-link --click" href="#previewFile">
															<iaixsl:choose>
																<iaixsl:when test="@preview = 'true'">
																	<iaixsl:attribute name="rel"><iaixsl:value-of select="@path"/></iaixsl:attribute>
																</iaixsl:when>
																<iaixsl:otherwise>
																	<iaixsl:attribute name="href"><iaixsl:value-of select="@path"/></iaixsl:attribute>
																	<iaixsl:attribute name="target">_blank</iaixsl:attribute>
																</iaixsl:otherwise>
															</iaixsl:choose>
															<span><iaixsl:value-of select="@file"/></span>
														</a>
														<a class="preview__button --delete btn icon-remove --click">
															<iaixsl:attribute name="href"><iaixsl:value-of select="@delete_link"/></iaixsl:attribute>
															<iaixsl:attribute name="title">Usuń plik</iaixsl:attribute>
															<span/>
														</a>
													</div>
												</iaixsl:for-each>
											</div>
										</iaixsl:if>

									</div>

									
									<div class="basket__item --prices">
										<iaixsl:choose>
											
											<iaixsl:when test="size/@ordered_points">
												<del class="basket__max_price --points">
													<iaixsl:choose>
														<iaixsl:when test="not($nettoPriceBasketedit = '') and not($priceTypeVat = '')">
															<span class="basket__max_price_net"><iaixsl:value-of select="price/@price_net_formatted"/><span class="price_vat"><iaixsl:value-of select="$priceTypeText"/></span></span>
															<span class="basket__max_price_gross gross_price">(<iaixsl:value-of select="price/@price_formatted"/><span class="price_vat"><iaixsl:value-of select="$grossPriceBasketedit"/></span>)</span>
														</iaixsl:when>
														<iaixsl:otherwise>
															<iaixsl:value-of select="price/@price_formatted"/>
														</iaixsl:otherwise>
													</iaixsl:choose>
												</del>
												<span class="basket__price --points">
													<iaixsl:value-of select="price/@points"/> pkt.
												</span>
											</iaixsl:when>
											
											<iaixsl:otherwise>
												<iaixsl:if test="price/@beforerebate">
													<del class="basket__max_price">
														<iaixsl:choose>
															<iaixsl:when test="not($nettoPriceBasketedit = '') and not($priceTypeVat = '')">
																<span class="basket__max_price_net"><iaixsl:value-of select="price/@beforerebate_net_formatted"/><span class="price_vat"><iaixsl:value-of select="$priceTypeText"/></span></span>
																<span class="basket__max_price_gross gross_price">(<iaixsl:value-of select="price/@beforerebate_formatted"/><span class="price_vat"><iaixsl:value-of select="$grossPriceBasketedit"/></span>)</span>
															</iaixsl:when>
															<iaixsl:otherwise>
																<iaixsl:value-of select="price/@beforerebate_formatted"/>
															</iaixsl:otherwise>
														</iaixsl:choose>
													</del>
												</iaixsl:if>
												<span class="basket__price">
													<iaixsl:choose>
														<iaixsl:when test="not($nettoPriceBasketedit = '') and not($priceTypeVat = '')">
															<span class="basket__price_net"><iaixsl:value-of select="price/@price_net_formatted"/><span class="price_vat"><iaixsl:value-of select="$priceTypeText"/></span></span>
															<span class="basket__price_gross gross_price">(<iaixsl:value-of select="price/@price_formatted"/><span class="price_vat"><iaixsl:value-of select="$grossPriceBasketedit"/></span>)</span>
														</iaixsl:when>
														<iaixsl:otherwise>
															<iaixsl:value-of select="price/@price_formatted"/>
														</iaixsl:otherwise>
													</iaixsl:choose>
												</span>

												
												<iaixsl:if test="price/rebateNumber">
													<small class="basket__tip">
														kup więcej zapłać mniej
													</small>
													<div class="basket__tip_content tooltipContent">
														<iaixsl:for-each select="price/rebateNumber/rebate">
															<div>
																Od
																<strong>
																	<iaixsl:value-of select="@threshold"/><iaixsl:text> </iaixsl:text><iaixsl:value-of select="../../../size/@unit"/>
																</strong>
																cena
																<strong>
																	<iaixsl:choose>
																		<iaixsl:when test="not($nettoPriceBasketedit = '')">
																			<iaixsl:value-of select="@price_net_formatted"/>
																		</iaixsl:when>
																		<iaixsl:otherwise>
																			<iaixsl:value-of select="@price_formatted"/>
																		</iaixsl:otherwise>
																	</iaixsl:choose>
																</strong>
																- rabat
																<strong>
																	<iaixsl:value-of select="@value"/>%
																</strong>
															</div>
														</iaixsl:for-each>
													</div>
												</iaixsl:if>
											</iaixsl:otherwise>
										</iaixsl:choose>
									</div>

									
									<div class="basket__item --sum">
										<iaixsl:choose>
											<iaixsl:when test="size/@ordered_points">
												<span class="basket__sum --points">
													<iaixsl:value-of select="price/@points_sum"/> pkt.
												</span>
											</iaixsl:when>
											<iaixsl:otherwise>
												<span class="basket__sum">
													<iaixsl:choose>
														<iaixsl:when test="not($nettoPriceBasketedit = '') and not($priceTypeVat = '')">
															<span class="basket__price_net"><iaixsl:value-of select="price/@worth_net_formatted"/><span class="price_vat"><iaixsl:value-of select="$priceTypeText"/></span></span>
															<span class="basket__price_gross gross_price">(<iaixsl:value-of select="price/@worth_formatted"/><span class="price_vat"><iaixsl:value-of select="$grossPriceBasketedit"/></span>)</span>
														</iaixsl:when>
														<iaixsl:otherwise>
															<iaixsl:value-of select="price/@worth_formatted"/>
														</iaixsl:otherwise>
													</iaixsl:choose>
												</span>
											</iaixsl:otherwise>
										</iaixsl:choose>
									</div>

									
									<div class="basket__item --actions">
										
										<div class="basket__action --quantity">
											<iaixsl:if test="change_group/@id">
												<iaixsl:attribute name="class">basket__action --quantity --change-group</iaixsl:attribute>
											</iaixsl:if>

											<iaixsl:if test="@product_type='product_virtual'">
												<iaixsl:attribute name="class">basket__action --quantity --virtual</iaixsl:attribute>
											</iaixsl:if>

											<input type="hidden">
												<iaixsl:attribute name="name">product[<iaixsl:value-of select="position()"/>]</iaixsl:attribute>
												<iaixsl:attribute name="value"><iaixsl:value-of select="@id"/></iaixsl:attribute>
											</input>
											<input type="hidden">
												<iaixsl:attribute name="name">size[<iaixsl:value-of select="position()"/>]</iaixsl:attribute>
												<iaixsl:attribute name="value"><iaixsl:value-of select="size/@type"/></iaixsl:attribute>
											</input>
											<iaixsl:if test="additional/@hash">
												<input type="hidden">
													<iaixsl:attribute name="name">additional[<iaixsl:value-of select="position()"/>]</iaixsl:attribute>
													<iaixsl:attribute name="value"><iaixsl:value-of select="additional/@hash"/></iaixsl:attribute>
												</input>
											</iaixsl:if>
											<iaixsl:if test="size/@ordered_points">
												<input type="hidden" value="1">
													<iaixsl:attribute name="name">forpoints[<iaixsl:value-of select="position()"/>]</iaixsl:attribute>
												</input>
											</iaixsl:if>

											<iaixsl:choose>
												<iaixsl:when test="change_group/@id">
													<input class="quantity__input" type="hidden">
														<iaixsl:attribute name="name">set_quantity[<iaixsl:value-of select="position()"/>]</iaixsl:attribute>
														<iaixsl:choose>
															<iaixsl:when test="size/@ordered_points">
																<iaixsl:attribute name="value"><iaixsl:value-of select="size/@ordered_points"/></iaixsl:attribute>
															</iaixsl:when>
															<iaixsl:otherwise>
																<iaixsl:attribute name="value"><iaixsl:value-of select="size/@ordered"/></iaixsl:attribute>
															</iaixsl:otherwise>
														</iaixsl:choose>
													</input>
													<strong>
														<iaixsl:choose>
															<iaixsl:when test="size/@ordered_points">
																<iaixsl:value-of select="size/@ordered_points"/>
															</iaixsl:when>
															<iaixsl:otherwise>
																<iaixsl:value-of select="size/@ordered"/>
															</iaixsl:otherwise>
														</iaixsl:choose>
														<span>
															<iaixsl:choose>
																<iaixsl:when test="not(size/@ordered &gt; 1)">
																	<iaixsl:value-of select="size/@unit_singular"/>
																</iaixsl:when>
																<iaixsl:otherwise>
																	<iaixsl:value-of select="size/@unit"/>
																</iaixsl:otherwise>
															</iaixsl:choose>
														</span>
													</strong>
													<iaixsl:if test="change_group/@changelink">
														<a class="basket__change --click">
															<iaixsl:attribute name="href"><iaixsl:value-of select="change_group/@changelink"/></iaixsl:attribute>
															<span class="change__button --mobile btn --solid --large d-md-none">Wymień produkt</span>
															<span class="change__button --desktop btn --solid d-none d-md-inline-block">Wymień produkt</span>
														</a>
													</iaixsl:if>
												</iaixsl:when>
												<iaixsl:when test="@product_type='product_virtual'">
													<input class="quantity__input" type="hidden">
														<iaixsl:attribute name="name">set_quantity[<iaixsl:value-of select="position()"/>]</iaixsl:attribute>
														<iaixsl:choose>
															<iaixsl:when test="size/@ordered_points">
																<iaixsl:attribute name="value"><iaixsl:value-of select="size/@ordered_points"/></iaixsl:attribute>
															</iaixsl:when>
															<iaixsl:otherwise>
																<iaixsl:attribute name="value"><iaixsl:value-of select="size/@ordered"/></iaixsl:attribute>
															</iaixsl:otherwise>
														</iaixsl:choose>
													</input>
													<div class="basket__virtual">1</div>
												</iaixsl:when>
												<iaixsl:otherwise>
													<div class="basket__quantity">
														
														<a href="#delQuantity" class="quantity__del btn icon-minus --click"/>

														
														<label for="InputQuantity" class="quantity__label">
															<iaixsl:attribute name="for">InputQuantity<iaixsl:value-of select="position()"/></iaixsl:attribute>
															<input class="quantity__input" type="number">
																<iaixsl:attribute name="id">InputQuantity<iaixsl:value-of select="position()"/></iaixsl:attribute>
																<iaixsl:if test="price/@special_offer='true' and not(price/@special_offer_changeable_quantity='true')">
																	<iaixsl:attribute name="readonly">readonly</iaixsl:attribute>
																</iaixsl:if>
																<iaixsl:attribute name="name">set_quantity[<iaixsl:value-of select="position()"/>]</iaixsl:attribute>

																<iaixsl:choose>
																	<iaixsl:when test="size/@ordered_points">
																		<iaixsl:attribute name="value"><iaixsl:value-of select="size/@ordered_points"/></iaixsl:attribute>
																	</iaixsl:when>
																	<iaixsl:otherwise>
																		<iaixsl:attribute name="value"><iaixsl:value-of select="size/@ordered"/></iaixsl:attribute>
																	</iaixsl:otherwise>
																</iaixsl:choose>

																<iaixsl:attribute name="data-amount"><iaixsl:value-of select="size/@amount"/></iaixsl:attribute>
																<iaixsl:attribute name="data-unit_sellby"><iaixsl:value-of select="size/@unit_sellby"/></iaixsl:attribute>
																<iaixsl:attribute name="step"><iaixsl:value-of select="size/@unit_sellby"/></iaixsl:attribute>
																<iaixsl:attribute name="data-unit"><iaixsl:value-of select="size/@unit"/></iaixsl:attribute>
																<iaixsl:attribute name="data-unit_precision"><iaixsl:value-of select="size/@unit_precision"/></iaixsl:attribute>

																<iaixsl:if test="order_quantity_range/max_quantity_per_order">
																	<iaixsl:attribute name="data-max_q"><iaixsl:value-of select="order_quantity_range/max_quantity_per_order"/></iaixsl:attribute>
																</iaixsl:if>
																<iaixsl:if test="order_quantity_range/max_size_quantity_per_order">
																	<iaixsl:attribute name="data-max_s"><iaixsl:value-of select="order_quantity_range/max_size_quantity_per_order"/></iaixsl:attribute>
																</iaixsl:if>
																<iaixsl:if test="order_quantity_range/min_quantity_per_order">
																	<iaixsl:attribute name="data-min_q"><iaixsl:value-of select="order_quantity_range/min_quantity_per_order"/></iaixsl:attribute>
																</iaixsl:if>
																<iaixsl:if test="order_quantity_range/min_size_quantity_per_order">
																	<iaixsl:attribute name="data-min_s"><iaixsl:value-of select="order_quantity_range/min_size_quantity_per_order"/></iaixsl:attribute>
																</iaixsl:if>
																
																<iaixsl:if test="subscription/@minimum_quantity">
																	<iaixsl:attribute name="data-min_q"><iaixsl:value-of select="subscription/@minimum_quantity"/></iaixsl:attribute>
																</iaixsl:if>
															</input>

															
															<span class="quantity__unit d-md-none">
																<iaixsl:choose>
																	<iaixsl:when test="not(size/@ordered &gt; 1)">
																		<iaixsl:value-of select="size/@unit_singular"/>
																	</iaixsl:when>
																	<iaixsl:otherwise>
																		<iaixsl:value-of select="size/@unit"/>
																	</iaixsl:otherwise>
																</iaixsl:choose>
															</span>
														</label>

														
														<a href="#addQuantity" class="quantity__add btn icon-plus --click"/>

														
														<span class="quantity__unit d-none d-md-flex">
															<iaixsl:choose>
																<iaixsl:when test="not(size/@ordered &gt; 1)">
																	<iaixsl:value-of select="size/@unit_singular"/>
																</iaixsl:when>
																<iaixsl:otherwise>
																	<iaixsl:value-of select="size/@unit"/>
																</iaixsl:otherwise>
															</iaixsl:choose>
														</span>
													</div>

													
													<iaixsl:if test="not(size/@unit_sellby = '1')">
														<div class="basket__sellby">
															sprzedawane po
															<iaixsl:value-of select="size/@unit_sellby"/><iaixsl:text> </iaixsl:text>
															<iaixsl:choose>
																<iaixsl:when test="not(size/@ordered &gt; 1)">
																	<iaixsl:value-of select="size/@unit_singular"/>
																</iaixsl:when>
																<iaixsl:otherwise>
																	<iaixsl:value-of select="size/@unit"/>
																</iaixsl:otherwise>
															</iaixsl:choose>
														</div>
													</iaixsl:if>
												</iaixsl:otherwise>
											</iaixsl:choose>
										</div>

										
										<div class="basket__action --calculate">
											<iaixsl:choose>
												<iaixsl:when test="price/@special_offer='true' and not(price/@special_offer_changeable_quantity='true')">
													<span class="basket__calculate --special"><i class="icon-ok-sign"/>Oferta specjalna</span>
												</iaixsl:when>
																									<iaixsl:when test="price/@special_offer='true'">
													<span class="basket__calculate --special"><i class="icon-ok-sign"/>Oferta specjalna</span>
																											<button class="basket__calculate --button --submit" type="submit">
														<iaixsl:attribute name="title">zmień ilość</iaixsl:attribute>
														<span class="calculate__button --mobile btn --solid --large d-md-none">
															Przelicz
														</span>
														<span class="calculate__button --desktop btn d-none d-md-inline-block icon-repeat"/>
													</button>
												</iaixsl:when>
												<iaixsl:otherwise>
													<button class="basket__calculate --button --submit" type="submit">
														<iaixsl:attribute name="title">zmień ilość</iaixsl:attribute>
														<span class="calculate__button --mobile btn --solid --large d-md-none">
															Przelicz
														</span>
														<span class="calculate__button --desktop btn d-none d-md-inline-block icon-repeat"/>
													</button>
												</iaixsl:otherwise>
											</iaixsl:choose>
										</div>

										
										<div class="basket__action --remove">
											<a href="#remove" class="basket__remove --click">
												<iaixsl:if test="/shop/page/basket-details/@reduction_amount_disabled = 'true' and order_quantity_range/min_quantity_per_order/text()">
													<iaixsl:attribute name="data-disabled">true</iaixsl:attribute>
												</iaixsl:if>
												<iaixsl:choose>
													<iaixsl:when test="removeall_points">
														<iaixsl:attribute name="data-href"><iaixsl:value-of select="removeall_points"/></iaixsl:attribute>
													</iaixsl:when>
													<iaixsl:otherwise>
														<iaixsl:attribute name="data-href"><iaixsl:value-of select="removeall"/></iaixsl:attribute>
													</iaixsl:otherwise>
												</iaixsl:choose>
												<span class="remove__button --mobile btn --icon-left icon-trash d-none">
													Usuń z koszyka
												</span>
												<span class="remove__button --desktop btn d-none d-md-inline-block icon-remove"/>
											</a>
										</div>

										
										<iaixsl:if test="/shop/basket/@product_comment_active = 'y' and count(/shop/page/basket-details/product/price[not(@special_offer='true')]) &gt; 0">
											<div class="basket__action --comment">
												<a href="#addComment" class="basket__comment btn  --click">
													<iaixsl:attribute name="title">kliknij aby, dodać komentarz</iaixsl:attribute>
													<i class="--icon-left icon-link mr-2"></i>dodaj opis lub załącznik
												</a>
											</div>
											<div class="basket__action --add-comment">
												<div class="basket__add --comment">
													<span class="add__label">Wpisz komentarz</span>
													<textarea class="add__textarea">
														<iaixsl:attribute name="name">comment[<iaixsl:value-of select="position()"/>]</iaixsl:attribute>
														<iaixsl:if test="comment">
															<iaixsl:value-of select="comment"/>
														</iaixsl:if>
													</textarea>
												</div>
												<div class="basket__add --files">
													<span class="add__label">Załącz plik do produktu</span>
													<div class="add__files">
														<input type="file">
															<iaixsl:if test="/shop/form_data/upload_file/max_filesize/@bytes">
																<iaixsl:attribute name="data-max_filesize"><iaixsl:value-of select="/shop/form_data/upload_file/max_filesize/@bytes"/></iaixsl:attribute>
															</iaixsl:if>
															<iaixsl:attribute name="name">comment_photo[<iaixsl:value-of select="@id"/>][<iaixsl:value-of select="size/@type"/>][<iaixsl:choose><iaixsl:when test="additional/@hash"><iaixsl:value-of select="additional/@hash"/></iaixsl:when><iaixsl:otherwise>0</iaixsl:otherwise></iaixsl:choose>][]</iaixsl:attribute>
														</input>
													</div>
													<a href="#addMoreFile" class="add__file btn --icon-left icon-plus --click">Dodaj plik</a>
												</div>
												<div class="basket__add --save">
													<button class="add__save --submit" type="submit">
														<span class="save__button --mobile btn --solid --large d-md-none">Zapisz opis i załącznik</span>
														<span class="save__button --desktop btn --solid d-none d-md-inline-block">Zapisz opis i załącznik</span>
													</button>
												</div>
											</div>
										</iaixsl:if>
									</div>


										
										<iaixsl:if test="comment">
											<div class="basket__param --comment d-md-none">
												<a href="#editComment" class="param__label d-block --click">
													<iaixsl:value-of disable-output-escaping="yes" select="comment"/>
												</a>
											</div>
										</iaixsl:if>

										
										<iaixsl:if test="order_files/file">
											<div class="basket__param --files d-md-none">
												<iaixsl:for-each select="order_files/file">
													<div class="preview__wrapper">
														<a class="preview__button btn --icon-left --secondary icon-link --click" href="#previewFile">
															<iaixsl:choose>
																<iaixsl:when test="@preview = 'true'">
																	<iaixsl:attribute name="rel"><iaixsl:value-of select="@path"/></iaixsl:attribute>
																</iaixsl:when>
																<iaixsl:otherwise>
																	<iaixsl:attribute name="href"><iaixsl:value-of select="@path"/></iaixsl:attribute>
																	<iaixsl:attribute name="target">_blank</iaixsl:attribute>
																</iaixsl:otherwise>
															</iaixsl:choose>
															<span><iaixsl:value-of select="@file"/></span>
														</a>
														<a class="preview__button --delete btn icon-remove --click">
															<iaixsl:attribute name="href"><iaixsl:value-of select="@delete_link"/></iaixsl:attribute>
															<iaixsl:attribute name="title">Usuń plik</iaixsl:attribute>
															<span/>
														</a>
													</div>
												</iaixsl:for-each>
											</div>
										</iaixsl:if>
								</div>
							</iaixsl:for-each>
						</div>
					</iaixsl:when>
					<iaixsl:otherwise>
						
						<h2 class="basket__label headline --now"><span class="headline__name">Dostępne od ręki, do wysłania dzisiaj <i class="icon-truck"/></span></h2>

						<div class="basket__productslist --now mb-5">
							
							<iaixsl:if test="page/basket-details/product[@division='now' and @basket_group_id]">
								<iaixsl:attribute name="data-groups">true</iaixsl:attribute>
							</iaixsl:if>
							<div class="basket__block --labels">
								<div class="basket__item --checkbox d-md-none">

								</div>
								<div class="basket__item --photo">

								</div>

								<div class="basket__item --name">

								</div>

								<div class="basket__item --prices">
									Cena jedn.
								</div>

								<div class="basket__item --sum">
									Wartość
								</div>

								<div class="basket__item --actions">
									<div class="basket__action --quantity">
										Ilość
									</div>

									<div class="basket__action --calculate">
										Przelicz
									</div>

									<div class="basket__action --remove">
										Usuń
									</div>

									<iaixsl:if test="/shop/basket/@product_comment_active = 'y' and count(/shop/page/basket-details/product/price[not(@special_offer='true')]) &gt; 0">
										<div class="basket__action --comment">
											Uwagi
										</div>
									</iaixsl:if>
								</div>
							</div>

							<iaixsl:for-each select="page/basket-details/product[@division='now']">
								<div class="basket__block">

									<iaixsl:choose>
										<iaixsl:when test="price/@special_offer='true' and price/@special_offer_changeable_quantity='true'">
											<iaixsl:attribute name="class">basket__block --special --special_quantity</iaixsl:attribute>
										</iaixsl:when>
										<iaixsl:when test="price/@special_offer='true'">
											<iaixsl:attribute name="class">basket__block --special</iaixsl:attribute>
										</iaixsl:when>
										<iaixsl:otherwise>
										</iaixsl:otherwise>
									</iaixsl:choose>

									<iaixsl:attribute name="data-product-id"><iaixsl:value-of select="@id"/></iaixsl:attribute>
									<iaixsl:attribute name="data-product-checkbox-id"><iaixsl:value-of select="@id"/>_<iaixsl:value-of select="size/@type"/>_<iaixsl:value-of select="additional/@hash"/></iaixsl:attribute>
									
									<iaixsl:variable name="groupId"><iaixsl:value-of select="@basket_group_id"/></iaixsl:variable>
									
									<iaixsl:variable name="subscriptionGroup"><iaixsl:value-of select="/shop/basket/groups/group[@id = $groupId]/types/type[@value = 'subscription']/@value != ''"/></iaixsl:variable>
									
									<iaixsl:if test="@basket_group_id">
										<iaixsl:attribute name="data-group"><iaixsl:for-each select="/shop/basket/groups/group[@id = $groupId]/types/type"><iaixsl:value-of select="@value"/><iaixsl:if test="position() != last()">;</iaixsl:if></iaixsl:for-each></iaixsl:attribute>
										<iaixsl:attribute name="style">--group:<iaixsl:value-of select="$groupId"/>;</iaixsl:attribute>
										<iaixsl:attribute name="data-group-id"><iaixsl:value-of select="$groupId"/></iaixsl:attribute>
										<iaixsl:if test="not($groupId = preceding-sibling::product[@division='now']/@basket_group_id)">
											<iaixsl:attribute name="data-first-in-group">true</iaixsl:attribute>
											<iaixsl:if test="$subscriptionGroup = 'true'">
												<iaixsl:attribute name="data-label-group">Subskrypcja</iaixsl:attribute>
											</iaixsl:if>
										</iaixsl:if>
										<iaixsl:if test="not($groupId = following-sibling::product[@division='now']/@basket_group_id)">
											<iaixsl:attribute name="data-last-in-group">true</iaixsl:attribute>
										</iaixsl:if>
										<iaixsl:if test="count(preceding-sibling::product[@division='now'][@basket_group_id = $groupId]) &gt;= $visibleProductsInGroup">
											<iaixsl:attribute name="data-hide">true</iaixsl:attribute>
										</iaixsl:if>
										<iaixsl:if test="count(preceding-sibling::product[@division='now'][@basket_group_id = $groupId]) = $visibleProductsInGroup - 1 and $groupId = following-sibling::product/@basket_group_id">
											<iaixsl:attribute name="data-last-visible">true</iaixsl:attribute>
										</iaixsl:if>
									</iaixsl:if>

									
									<iaixsl:if test="count(preceding-sibling::product[@division='now'][@basket_group_id = $groupId]) = $visibleProductsInGroup - 1 and $groupId = following-sibling::product/@basket_group_id">
										<a href="#showAllInGroup" class="basket__visible_in_group --show">+<iaixsl:value-of select="count(following-sibling::product[@division='now'][@basket_group_id = $groupId])"/> produkty w subskrypcji</a>
									</iaixsl:if>

									
									<iaixsl:if test="count(preceding-sibling::product[@division='now'][@basket_group_id = $groupId]) &gt;= $visibleProductsInGroup and not($groupId = following-sibling::product/@basket_group_id)">
										<a href="#hideAllInGroup" class="basket__visible_in_group --hide">Ukryj</a>
									</iaixsl:if>

									
									<div class="basket__item --photo">
										
										<div class="basket__checkbox d-md-none">
											<div class="f-group --checkbox mb-0">
												<input type="checkbox" class="basket__product_checkbox f-control">
													<iaixsl:attribute name="value"><iaixsl:value-of select="@id"/>_<iaixsl:value-of select="size/@type"/>_<iaixsl:value-of select="additional/@hash"/></iaixsl:attribute>
													<iaixsl:attribute name="id">basket_product_checkbox_<iaixsl:value-of select="@id"/>_<iaixsl:value-of select="size/@type"/>_<iaixsl:value-of select="additional/@hash"/></iaixsl:attribute>
													<iaixsl:if test="count(/shop/page/basket-details/product) = 1">
														<iaixsl:attribute name="checked">checked</iaixsl:attribute>
													</iaixsl:if>
												</input>
												<label class="basket__product_checkbox_label f-label mr-0">
													<iaixsl:attribute name="for">basket_product_checkbox_<iaixsl:value-of select="@id"/>_<iaixsl:value-of select="size/@type"/>_<iaixsl:value-of select="additional/@hash"/></iaixsl:attribute>
												</label>
											</div>
										</div>
										<a class="photo__link">
											<iaixsl:attribute name="href"><iaixsl:value-of select="@link"/></iaixsl:attribute>
                      <iaixsl:choose>
                        <iaixsl:when test="icon_src_second and not(icon_src_second = '' or icon_src_second = '/')">
                          <picture>
                            <source type="image/webp">
                              <iaixsl:choose>
                                <iaixsl:when test="$setIconLarge">
                                  <iaixsl:attribute name="srcset"><iaixsl:value-of select="icon"/></iaixsl:attribute>
                                </iaixsl:when>
                                <iaixsl:otherwise>
                                  <iaixsl:attribute name="srcset"><iaixsl:value-of select="icon_small"/></iaixsl:attribute>
                                </iaixsl:otherwise>
                              </iaixsl:choose>
                              <img class="photo__image">
                                <iaixsl:choose>
                                  <iaixsl:when test="$setIconLarge">
                                    <iaixsl:attribute name="src"><iaixsl:value-of select="icon_src_second"/></iaixsl:attribute>
                                  </iaixsl:when>
                                  <iaixsl:otherwise>
                                    <iaixsl:attribute name="src"><iaixsl:value-of select="iconsmall_second"/></iaixsl:attribute>
                                  </iaixsl:otherwise>
                                </iaixsl:choose>
                                <iaixsl:attribute name="alt"><iaixsl:value-of disable-output-escaping="yes" select="name/text()"/></iaixsl:attribute>
                              </img>
                            </source>
                          </picture>
                        </iaixsl:when>
                        <iaixsl:otherwise>
                          <img class="photo__image">
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
										</a>
									</div>

									
									<div class="basket__item --name">
										<div class="basket__name">
											<div class="basket__product">
												<h3 class="product__name">
													<a class="product__link">
														<iaixsl:attribute name="href"><iaixsl:value-of select="@link"/></iaixsl:attribute>
														<iaixsl:value-of disable-output-escaping="yes" select="name/text()"/>
													</a>
													<iaixsl:if test="@product_type = 'product_virtual'">
														<span class="product__virtual">Towar wirtualny</span>
													</iaixsl:if>

													<iaixsl:if test="@product_type = 'product_service'">
														<span class="product__service">Usługa</span>
													</iaixsl:if>

													<iaixsl:if test="price/@special_offer='true'">
														<span class="product__special">Oferta specjalna</span>
													</iaixsl:if>
												</h3>
												<div class="product__price_container">
													<div class="product__price">
														<iaixsl:choose>
															<iaixsl:when test="size/@ordered_points">
																<span class="basket__sum --points">
																	<iaixsl:value-of select="price/@points_sum"/> pkt.
																</span>
															</iaixsl:when>
															<iaixsl:otherwise>
																<span class="basket__sum">
																	<iaixsl:choose>
																		<iaixsl:when test="not($nettoPriceBasketedit = '') and not($priceTypeVat = '')">
																			<span class="basket__price_net"><iaixsl:value-of select="price/@worth_net_formatted"/><span class="price_vat"><iaixsl:value-of select="$priceTypeText"/></span></span>
																			<span class="basket__price_gross gross_price">(<iaixsl:value-of select="price/@worth_formatted"/><span class="price_vat"><iaixsl:value-of select="$grossPriceBasketedit"/></span>)</span>
																		</iaixsl:when>
																		<iaixsl:otherwise>
																			<iaixsl:value-of select="price/@worth_formatted"/>
																		</iaixsl:otherwise>
																	</iaixsl:choose>
																</span>
															</iaixsl:otherwise>
														</iaixsl:choose>
													</div>
													
													<a href="#showActions" class="basket__show_wrapper --click">
														<span class="basket__show --ordered">
															<iaixsl:choose>
																<iaixsl:when test="size/@ordered_points">
																	<iaixsl:value-of select="size/@ordered_points"/>
																</iaixsl:when>
																<iaixsl:otherwise>
																	<iaixsl:value-of select="size/@ordered"/>
																</iaixsl:otherwise>
															</iaixsl:choose>
														</span>
														<span class="basket__show --actions btn icon-angle-down"/>
													</a>
												</div>
											</div>
										</div>

										
										<iaixsl:if test="$subscriptionGroup = 'true'">
											<div class="basket__param --subscription --period">
												<span class="param__label">
													Wysyłka co:
												</span>
												<strong class="param__value">
													<iaixsl:attribute name="data-change-literal-days"><iaixsl:value-of select="/shop/basket/groups/group[@id = $groupId]/details/subscription/@days_in_period"/></iaixsl:attribute>
													<iaixsl:value-of select="/shop/basket/groups/group[@id = $groupId]/details/subscription/@days_in_period"/> dni
												</strong>
											</div>
										</iaixsl:if>

										
										<iaixsl:if test="$subscriptionGroup = 'true'">
											<div class="basket__param --subscription --next">
												<span class="param__label">
													Kolejna dostawa:
												</span>
												<strong class="param__value">
													<iaixsl:variable name="next_order_week_day"><iaixsl:value-of select="/shop/basket/groups/group[@id = $groupId]/details/subscription/dates/@next_order_week_day"/></iaixsl:variable>
													<span class="param__day_name">
														<iaixsl:choose>
															<iaixsl:when test="$next_order_week_day = 1">
																Poniedziałek
															</iaixsl:when>
															<iaixsl:when test="$next_order_week_day = 2">
																Wtorek
															</iaixsl:when>
															<iaixsl:when test="$next_order_week_day = 3">
																Środa
															</iaixsl:when>
															<iaixsl:when test="$next_order_week_day = 4">
																Czwartek
															</iaixsl:when>
															<iaixsl:when test="$next_order_week_day = 5">
																Piątek
															</iaixsl:when>
															<iaixsl:when test="$next_order_week_day = 6">
																Sobota
															</iaixsl:when>
															<iaixsl:when test="$next_order_week_day = 7">
																Niedziela
															</iaixsl:when>
														</iaixsl:choose>
													</span>
													<iaixsl:variable name="next_order_time"><iaixsl:value-of select="/shop/basket/groups/group[@id = $groupId]/details/subscription/dates/@date_next_order"/></iaixsl:variable>
													<iaixsl:variable name="next_order_time_month_day"><iaixsl:value-of select="substring($next_order_time, 6, 5)"/></iaixsl:variable>
													<iaixsl:variable name="next_order_time_formatted"><iaixsl:value-of select="substring-after($next_order_time_month_day, '-')"/>.<iaixsl:value-of select="substring-before($next_order_time_month_day, '-')"/></iaixsl:variable>
													<span class="param__date_wrapper"> (<span><iaixsl:value-of select="$next_order_time_formatted"/></span>)</span>
												</strong>
											</div>
										</iaixsl:if>

										
										<iaixsl:if test="price/@special_offer='true'">
											<div class="basket__param --special">
												<span class="param__label">
													Dzięki ofercie specjalnej zyskujesz
													<strong class="param__save"><iaixsl:value-of select="price/@yousave_formatted"/></strong>, czyli
													<strong class="param__save_percent"><iaixsl:value-of select="price/@yousave_percent"/>%</strong>
													wartości tego produktu.
												</span>
											</div>
										</iaixsl:if>

										
										<iaixsl:if test="not(@barcode ='')">
											<div class="basket__param --barcode">
												<span class="param__label">
													Symbol:
												</span>
												<span class="param__value">
													<iaixsl:value-of select="@barcode"/>
												</span>
											</div>
										</iaixsl:if>

										
										<iaixsl:if test="price/priceformula/parameters">
											<iaixsl:for-each select="price/priceformula/parameters/parameter">
												<div class="basket__param --priceformula">
													<span class="param__label">
														<iaixsl:value-of select="name"/>:
													</span>
													<span class="param__value">
														<iaixsl:value-of select="values/value"/>
													</span>
												</div>
											</iaixsl:for-each>
										</iaixsl:if>

										
										<iaixsl:if test="not(size/@type='uniw')">
											<div class="basket__param --size">
												<span class="param__label">
													Rozmiar:
												</span>
												<span class="param__value">
													<iaixsl:value-of select="size/@description"/>
												</span>
											</div>
										</iaixsl:if>

										
										<iaixsl:if test="(version) and (not(version/@product_name=''))">
											<div class="basket__param --version">
												<span class="param__label">
													<iaixsl:value-of select="version/@name"/>:
												</span>
												<span class="param__value">
													<iaixsl:value-of select="version/@product_name"/>
												</span>
											</div>
										</iaixsl:if>

										
										<iaixsl:if test="@product_type = 'product_bundle'">
											<div class="basket__param --bundle">
												<iaixsl:if test="@collection = 'true'">
													<iaixsl:attribute name="class">basket__param --bundle --collection</iaixsl:attribute>
												</iaixsl:if>
												<span class="param__label">
													Składowe zestawu:
												</span>
												<div class="param__wrapper">
													<iaixsl:for-each select="bundled/product">
														<span class="param__value">
															<iaixsl:if test="size/@ordered &gt; 1">
																<iaixsl:value-of select="size/@ordered"/>x 
															</iaixsl:if>

															<iaixsl:value-of select="name/text()"/>

															<iaixsl:if test="not(size/@type='uniw') or ((version) and (not(version/@product_name='')))">
																(<iaixsl:if test="not(size/@type='uniw')">Rozmiar: <b><iaixsl:value-of select="size/@description"/></b></iaixsl:if><iaixsl:if test="not(size/@type='uniw') and ((version) and (not(version/@product_name='')))">, </iaixsl:if><iaixsl:if test="(version) and (not(version/@product_name=''))"><iaixsl:value-of select="version/@name"/>: <b><iaixsl:value-of select="version/@product_name"/></b></iaixsl:if>)
															</iaixsl:if>

															<iaixsl:if test="@product_type = 'product_virtual'">
																<span class="param__virtual">Towar wirtualny</span>
															</iaixsl:if>

															<iaixsl:if test="@product_type = 'product_service'">
																<span class="param__service">Usługa</span>
															</iaixsl:if>
														</span>
													</iaixsl:for-each>
												</div>
											</div>
										</iaixsl:if>

										
										<iaixsl:if test="change_group">
											<div class="basket__param --info">
												Nie możesz usunąć tego produktu.
											</div>
										</iaixsl:if>

										
										<iaixsl:choose>
											<iaixsl:when test="(size/@orderedsum) &gt; (size/@amount) and not(size/@amount = '0') and not(size/@amount = '-1')">
												<div class="basket__param --info">
													<span class="param__label">
														Nie mamy w tej chwili takiej ilości produktu. Zmniejsz zamawianą ilość do <iaixsl:value-of select="size/@amount"/>, lub wybierz inny produkt.
													</span>
												</div>
											</iaixsl:when>

											<iaixsl:when test="size/@amount = '0'">
												<div class="basket__param --info">
													<span class="param__label">
														Ten produkt właśnie się nam skończył. Wybierz inny produkt.
													</span>
												</div>
											</iaixsl:when>

											<iaixsl:when test="(size/@ordered_points) and not(/shop/basket/@client_points &gt;= 0)">
												<div class="basket__param --info">
													<span class="param__label">
														Masz za mało punktów lojalnościowych by kupić tyle produktów za punkty.
													</span>
												</div>
											</iaixsl:when>

											<iaixsl:when test="(/shop/page/rebates/code_details/@active = 'y') and ((/shop/rebate_code/shipping_cost_rebate/@active='n') and (price/@rebate_code_active='n'))">
												<div class="basket__param --info">
													<span class="param__label">
														Podany kod rabatowy nie obejmuje tego towaru.
													</span>
												</div>
											</iaixsl:when>

											<iaixsl:when test="@product_type='product_virtual' and not(count(/shop/page/basket-details/product) = count(/shop/page/basket-details/product[@product_type='product_virtual']))">
												<div class="basket__param --info">
													<span class="param__label">
														Produkt będzie dostępny w sekcji
														<a class="param__link --link">
															<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/client_files/@link_to_download"/></iaixsl:attribute>
															&quot;Moje pliki&quot;
														</a>
															po zrealizowaniu zamówienia.
													</span>
												</div>
											</iaixsl:when>
										</iaixsl:choose>

										<iaixsl:if test="(size/@to_little_for_gross = 'true') and not((size/@orderedsum) &gt; (size/@amount) and not(size/@amount = '0') and not(size/@amount = '-1'))">
											<div class="basket__param --info">
												<span class="param__label">
													Dysponujemy
													<iaixsl:value-of select="size/@amount_wholesale"/>
														szt. produktu w cenie hurtowej. W koszyku masz
													<iaixsl:value-of select="size/@ordered - size/@amount_wholesale"/>
														szt. produktu w cenie detalicznej.
												</span>
											</div>
										</iaixsl:if>

										
										<iaixsl:if test="$txt_50001_025a and (price/@advanceworth &gt; 0)">
											<div class="basket__param --advance">
												<span class="param__label">
													<iaixsl:choose>
														<iaixsl:when test="/shop/page/basket-details/summary/money/@advance_mode = 'default' or /shop/page/basket-details/summary/money/@advance_mode = 'none'">
															<iaixsl:choose>
																<iaixsl:when test="/shop/page/basket-details/summary/money/@cash_on_delivery = 'true' and /shop/page/basket-details/summary/money/@prepaid = 'false'">
																	Przed realizacją zamówienia z płatnością przy odbiorze wymagana jest zaliczka na ten towar: <iaixsl:value-of select="price/@advanceworth_formatted"/>
																</iaixsl:when>
																<iaixsl:when test="/shop/page/basket-details/summary/money/@cash_on_delivery = 'false' and /shop/page/basket-details/summary/money/@prepaid = 'true'">
																	Przed realizacją zamówienia z płatnością za przedpłatą wymagana jest zaliczka na ten towar: <iaixsl:value-of select="price/@advanceworth_formatted"/>
																</iaixsl:when>
																<iaixsl:when test="/shop/page/basket-details/summary/money/@cash_on_delivery = 'true' and /shop/page/basket-details/summary/money/@prepaid = 'true'">
																	Przed realizacją zamówienia wymagana jest zaliczka na ten towar: <iaixsl:value-of select="price/@advanceworth_formatted"/>
																</iaixsl:when>
															</iaixsl:choose>
														</iaixsl:when>
														<iaixsl:when test="/shop/page/basket-details/summary/money/@advance_mode = 'total'">
															Przed realizacją zamówienia wymagana jest zaliczka na ten towar: <iaixsl:value-of select="price/@advanceworth_formatted"/>
														</iaixsl:when>
													</iaixsl:choose>
												</span>
											</div>
										</iaixsl:if>

										
										<iaixsl:if test="comment">
											<div class="basket__param --comment d-none d-md-block">
												<a href="#editComment" class="param__label d-block --click">
													<iaixsl:value-of disable-output-escaping="yes" select="comment"/>
												</a>
											</div>
										</iaixsl:if>

										
										<iaixsl:if test="order_files/file">
											<div class="basket__param --files d-none d-md-block">
												<iaixsl:for-each select="order_files/file">
													<div class="preview__wrapper">
														<a class="preview__button btn --icon-left --secondary icon-link --click" href="#previewFile">
															<iaixsl:choose>
																<iaixsl:when test="@preview = 'true'">
																	<iaixsl:attribute name="rel"><iaixsl:value-of select="@path"/></iaixsl:attribute>
																</iaixsl:when>
																<iaixsl:otherwise>
																	<iaixsl:attribute name="href"><iaixsl:value-of select="@path"/></iaixsl:attribute>
																	<iaixsl:attribute name="target">_blank</iaixsl:attribute>
																</iaixsl:otherwise>
															</iaixsl:choose>
															<span><iaixsl:value-of select="@file"/></span>
														</a>
														<a class="preview__button --delete btn icon-remove --click">
															<iaixsl:attribute name="href"><iaixsl:value-of select="@delete_link"/></iaixsl:attribute>
															<iaixsl:attribute name="title">Usuń plik</iaixsl:attribute>
															<span/>
														</a>
													</div>
												</iaixsl:for-each>
											</div>
										</iaixsl:if>

									</div>

									
									<div class="basket__item --prices">
										<iaixsl:choose>
											
											<iaixsl:when test="size/@ordered_points">
												<del class="basket__max_price --points">
													<iaixsl:choose>
														<iaixsl:when test="not($nettoPriceBasketedit = '') and not($priceTypeVat = '')">
															<span class="basket__price_net"><iaixsl:value-of select="price/@price_net_formatted"/><span class="price_vat"><iaixsl:value-of select="$priceTypeText"/></span></span>
															<span class="basket__price_gross gross_price">(<iaixsl:value-of select="price/@price_formatted"/><span class="price_vat"><iaixsl:value-of select="$grossPriceBasketedit"/></span>)</span>
														</iaixsl:when>
														<iaixsl:otherwise>
															<iaixsl:value-of select="price/@price_formatted"/>
														</iaixsl:otherwise>
													</iaixsl:choose>
												</del>
												<span class="basket__price --points">
													<iaixsl:value-of select="price/@points"/> pkt.
												</span>
											</iaixsl:when>
											
											<iaixsl:otherwise>
												<iaixsl:if test="price/@beforerebate">
													<del class="basket__max_price">
														<iaixsl:choose>
															<iaixsl:when test="not($nettoPriceBasketedit = '') and not($priceTypeVat = '')">
																<span class="basket__max_price_net"><iaixsl:value-of select="price/@beforerebate_net_formatted"/><span class="price_vat"><iaixsl:value-of select="$priceTypeText"/></span></span>
																<span class="basket__max_price_gross gross_price">(<iaixsl:value-of select="price/@beforerebate_formatted"/><span class="price_vat"><iaixsl:value-of select="$grossPriceBasketedit"/></span>)</span>
															</iaixsl:when>
															<iaixsl:otherwise>
																<iaixsl:value-of select="price/@beforerebate_formatted"/>
															</iaixsl:otherwise>
														</iaixsl:choose>
													</del>
												</iaixsl:if>
												<span class="basket__price">
													<iaixsl:choose>
														<iaixsl:when test="not($nettoPriceBasketedit = '') and not($priceTypeVat = '')">
															<span class="basket__price_net"><iaixsl:value-of select="price/@price_net_formatted"/><span class="price_vat"><iaixsl:value-of select="$priceTypeText"/></span></span>
															<span class="basket__price_gross gross_price">(<iaixsl:value-of select="price/@price_formatted"/><span class="price_vat"><iaixsl:value-of select="$grossPriceBasketedit"/></span>)</span>
														</iaixsl:when>
														<iaixsl:otherwise>
															<iaixsl:value-of select="price/@price_formatted"/>
														</iaixsl:otherwise>
													</iaixsl:choose>
												</span>

												
												<iaixsl:if test="price/rebateNumber">
													<small class="basket__tip">
														kup więcej zapłać mniej
													</small>
													<div class="basket__tip_content tooltipContent">
														<iaixsl:for-each select="price/rebateNumber/rebate">
															<div>
																Od
																<strong>
																	<iaixsl:value-of select="@threshold"/><iaixsl:text> </iaixsl:text><iaixsl:value-of select="../../../size/@unit"/>
																</strong>
																cena
																<strong>
																	<iaixsl:choose>
																		<iaixsl:when test="not($nettoPriceBasketedit = '')">
																			<iaixsl:value-of select="@price_net_formatted"/>
																		</iaixsl:when>
																		<iaixsl:otherwise>
																			<iaixsl:value-of select="@price_formatted"/>
																		</iaixsl:otherwise>
																	</iaixsl:choose>
																</strong>
																- rabat
																<strong>
																	<iaixsl:value-of select="@value"/>%
																</strong>
															</div>
														</iaixsl:for-each>
													</div>
												</iaixsl:if>
											</iaixsl:otherwise>
										</iaixsl:choose>
									</div>

									
									<div class="basket__item --sum">
										<iaixsl:choose>
											<iaixsl:when test="size/@ordered_points">
												<span class="basket__sum --points">
													<iaixsl:value-of select="price/@points_sum"/> pkt.
												</span>
											</iaixsl:when>
											<iaixsl:otherwise>
												<span class="basket__sum">
													<iaixsl:choose>
														<iaixsl:when test="not($nettoPriceBasketedit = '') and not($priceTypeVat = '')">
															<span class="basket__price_net"><iaixsl:value-of select="price/@worth_net_formatted"/><span class="price_vat"><iaixsl:value-of select="$priceTypeText"/></span></span>
															<span class="basket__price_gross gross_price">(<iaixsl:value-of select="price/@worth_formatted"/><span class="price_vat"><iaixsl:value-of select="$grossPriceBasketedit"/></span>)</span>
														</iaixsl:when>
														<iaixsl:otherwise>
															<iaixsl:value-of select="price/@worth_formatted"/>
														</iaixsl:otherwise>
													</iaixsl:choose>
												</span>
											</iaixsl:otherwise>
										</iaixsl:choose>
									</div>

									
									<div class="basket__item --actions">
										
										<div class="basket__action --quantity">
											<iaixsl:if test="change_group/@id">
												<iaixsl:attribute name="class">basket__action --quantity --change-group</iaixsl:attribute>
											</iaixsl:if>

											<iaixsl:if test="@product_type='product_virtual'">
												<iaixsl:attribute name="class">basket__action --quantity --virtual</iaixsl:attribute>
											</iaixsl:if>

											<input type="hidden">
												<iaixsl:attribute name="name">product[<iaixsl:value-of select="position()"/>]</iaixsl:attribute>
												<iaixsl:attribute name="value"><iaixsl:value-of select="@id"/></iaixsl:attribute>
											</input>
											<input type="hidden">
												<iaixsl:attribute name="name">size[<iaixsl:value-of select="position()"/>]</iaixsl:attribute>
												<iaixsl:attribute name="value"><iaixsl:value-of select="size/@type"/></iaixsl:attribute>
											</input>
											<iaixsl:if test="additional/@hash">
												<input type="hidden">
													<iaixsl:attribute name="name">additional[<iaixsl:value-of select="position()"/>]</iaixsl:attribute>
													<iaixsl:attribute name="value"><iaixsl:value-of select="additional/@hash"/></iaixsl:attribute>
												</input>
											</iaixsl:if>
											<iaixsl:if test="size/@ordered_points">
												<input type="hidden" value="1">
													<iaixsl:attribute name="name">forpoints[<iaixsl:value-of select="position()"/>]</iaixsl:attribute>
												</input>
											</iaixsl:if>

											<iaixsl:choose>
												<iaixsl:when test="change_group/@id">
													<input class="quantity__input" type="hidden">
														<iaixsl:attribute name="name">set_quantity[<iaixsl:value-of select="position()"/>]</iaixsl:attribute>
														<iaixsl:choose>
															<iaixsl:when test="size/@ordered_points">
																<iaixsl:attribute name="value"><iaixsl:value-of select="size/@ordered_points"/></iaixsl:attribute>
															</iaixsl:when>
															<iaixsl:otherwise>
																<iaixsl:attribute name="value"><iaixsl:value-of select="size/@ordered"/></iaixsl:attribute>
															</iaixsl:otherwise>
														</iaixsl:choose>
													</input>
													<strong>
														<iaixsl:choose>
															<iaixsl:when test="size/@ordered_points">
																<iaixsl:value-of select="size/@ordered_points"/>
															</iaixsl:when>
															<iaixsl:otherwise>
																<iaixsl:value-of select="size/@ordered"/>
															</iaixsl:otherwise>
														</iaixsl:choose>
														<span>
															<iaixsl:choose>
																<iaixsl:when test="not(size/@ordered &gt; 1)">
																	<iaixsl:value-of select="size/@unit_singular"/>
																</iaixsl:when>
																<iaixsl:otherwise>
																	<iaixsl:value-of select="size/@unit"/>
																</iaixsl:otherwise>
															</iaixsl:choose>
														</span>
													</strong>
													<iaixsl:if test="change_group/@changelink">
														<a class="basket__change --click">
															<iaixsl:attribute name="href"><iaixsl:value-of select="change_group/@changelink"/></iaixsl:attribute>
															<span class="change__button --mobile btn --solid --large d-md-none">Wymień produkt</span>
															<span class="change__button --desktop btn --solid d-none d-md-inline-block">Wymień produkt</span>
														</a>
													</iaixsl:if>
												</iaixsl:when>
												<iaixsl:when test="@product_type='product_virtual'">
													<input class="quantity__input" type="hidden">
														<iaixsl:attribute name="name">set_quantity[<iaixsl:value-of select="position()"/>]</iaixsl:attribute>
														<iaixsl:choose>
															<iaixsl:when test="size/@ordered_points">
																<iaixsl:attribute name="value"><iaixsl:value-of select="size/@ordered_points"/></iaixsl:attribute>
															</iaixsl:when>
															<iaixsl:otherwise>
																<iaixsl:attribute name="value"><iaixsl:value-of select="size/@ordered"/></iaixsl:attribute>
															</iaixsl:otherwise>
														</iaixsl:choose>
													</input>
													<div class="basket__virtual">1</div>
												</iaixsl:when>
												<iaixsl:otherwise>
													<div class="basket__quantity">
														
														<a href="#delQuantity" class="quantity__del btn icon-minus --click"/>

														
														<label for="InputQuantity" class="quantity__label">
															<iaixsl:attribute name="for">InputQuantity<iaixsl:value-of select="position()"/></iaixsl:attribute>
															<input class="quantity__input" type="number">
																<iaixsl:attribute name="id">InputQuantity<iaixsl:value-of select="position()"/></iaixsl:attribute>
																<iaixsl:if test="price/@special_offer='true' and not(price/@special_offer_changeable_quantity='true')">
																	<iaixsl:attribute name="readonly">readonly</iaixsl:attribute>
																</iaixsl:if>
																<iaixsl:attribute name="name">set_quantity[<iaixsl:value-of select="position()"/>]</iaixsl:attribute>

																<iaixsl:choose>
																	<iaixsl:when test="size/@ordered_points">
																		<iaixsl:attribute name="value"><iaixsl:value-of select="size/@ordered_points"/></iaixsl:attribute>
																	</iaixsl:when>
																	<iaixsl:otherwise>
																		<iaixsl:attribute name="value"><iaixsl:value-of select="size/@ordered"/></iaixsl:attribute>
																	</iaixsl:otherwise>
																</iaixsl:choose>

																<iaixsl:attribute name="data-amount"><iaixsl:value-of select="size/@amount"/></iaixsl:attribute>
																<iaixsl:attribute name="data-unit_sellby"><iaixsl:value-of select="size/@unit_sellby"/></iaixsl:attribute>
																<iaixsl:attribute name="step"><iaixsl:value-of select="size/@unit_sellby"/></iaixsl:attribute>
																<iaixsl:attribute name="data-unit"><iaixsl:value-of select="size/@unit"/></iaixsl:attribute>
																<iaixsl:attribute name="data-unit_precision"><iaixsl:value-of select="size/@unit_precision"/></iaixsl:attribute>

																<iaixsl:if test="order_quantity_range/max_quantity_per_order">
																	<iaixsl:attribute name="data-max_q"><iaixsl:value-of select="order_quantity_range/max_quantity_per_order"/></iaixsl:attribute>
																</iaixsl:if>
																<iaixsl:if test="order_quantity_range/max_size_quantity_per_order">
																	<iaixsl:attribute name="data-max_s"><iaixsl:value-of select="order_quantity_range/max_size_quantity_per_order"/></iaixsl:attribute>
																</iaixsl:if>
																<iaixsl:if test="order_quantity_range/min_quantity_per_order">
																	<iaixsl:attribute name="data-min_q"><iaixsl:value-of select="order_quantity_range/min_quantity_per_order"/></iaixsl:attribute>
																</iaixsl:if>
																<iaixsl:if test="order_quantity_range/min_size_quantity_per_order">
																	<iaixsl:attribute name="data-min_s"><iaixsl:value-of select="order_quantity_range/min_size_quantity_per_order"/></iaixsl:attribute>
																</iaixsl:if>
																
																<iaixsl:if test="subscription/@minimum_quantity">
																	<iaixsl:attribute name="data-min_q"><iaixsl:value-of select="subscription/@minimum_quantity"/></iaixsl:attribute>
																</iaixsl:if>
															</input>

															
															<span class="quantity__unit d-md-none">
																<iaixsl:choose>
																	<iaixsl:when test="not(size/@ordered &gt; 1)">
																		<iaixsl:value-of select="size/@unit_singular"/>
																	</iaixsl:when>
																	<iaixsl:otherwise>
																		<iaixsl:value-of select="size/@unit"/>
																	</iaixsl:otherwise>
																</iaixsl:choose>
															</span>
														</label>

														
														<a href="#addQuantity" class="quantity__add btn icon-plus --click"/>

														
														<span class="quantity__unit d-none d-md-flex">
															<iaixsl:choose>
																<iaixsl:when test="not(size/@ordered &gt; 1)">
																	<iaixsl:value-of select="size/@unit_singular"/>
																</iaixsl:when>
																<iaixsl:otherwise>
																	<iaixsl:value-of select="size/@unit"/>
																</iaixsl:otherwise>
															</iaixsl:choose>
														</span>
													</div>

													
													<iaixsl:if test="not(size/@unit_sellby = '1')">
														<div class="basket__sellby">
															sprzedawane po
															<iaixsl:value-of select="size/@unit_sellby"/><iaixsl:text> </iaixsl:text>
															<iaixsl:choose>
																<iaixsl:when test="not(size/@ordered &gt; 1)">
																	<iaixsl:value-of select="size/@unit_singular"/>
																</iaixsl:when>
																<iaixsl:otherwise>
																	<iaixsl:value-of select="size/@unit"/>
																</iaixsl:otherwise>
															</iaixsl:choose>
														</div>
													</iaixsl:if>
												</iaixsl:otherwise>
											</iaixsl:choose>
										</div>

										
										<div class="basket__action --calculate">
											<iaixsl:choose>
												<iaixsl:when test="price/@special_offer='true' and not(price/@special_offer_changeable_quantity='true')">
													<span class="basket__calculate --special"><i class="icon-ok-sign"/>Oferta specjalna</span>
												</iaixsl:when>
																									<iaixsl:when test="price/@special_offer='true'">
													<span class="basket__calculate --special"><i class="icon-ok-sign"/>Oferta specjalna</span>
																											<button class="basket__calculate --button --submit" type="submit">
														<iaixsl:attribute name="title">zmień ilość</iaixsl:attribute>
														<span class="calculate__button --mobile btn --solid --large d-md-none">
															Przelicz
														</span>
														<span class="calculate__button --desktop btn d-none d-md-inline-block icon-repeat"/>
													</button>
												</iaixsl:when>
												<iaixsl:otherwise>
													<button class="basket__calculate --button --submit" type="submit">
														<iaixsl:attribute name="title">zmień ilość</iaixsl:attribute>
														<span class="calculate__button --mobile btn --solid --large d-md-none">
															Przelicz
														</span>
														<span class="calculate__button --desktop btn d-none d-md-inline-block icon-repeat"/>
													</button>
												</iaixsl:otherwise>
											</iaixsl:choose>
										</div>

										
										<div class="basket__action --remove">
											<a href="#remove" class="basket__remove --click">
												<iaixsl:if test="/shop/page/basket-details/@reduction_amount_disabled = 'true' and order_quantity_range/min_quantity_per_order/text()">
													<iaixsl:attribute name="data-disabled">true</iaixsl:attribute>
												</iaixsl:if>
												<iaixsl:choose>
													<iaixsl:when test="removeall_points">
														<iaixsl:attribute name="data-href"><iaixsl:value-of select="removeall_points"/></iaixsl:attribute>
													</iaixsl:when>
													<iaixsl:otherwise>
														<iaixsl:attribute name="data-href"><iaixsl:value-of select="removeall"/></iaixsl:attribute>
													</iaixsl:otherwise>
												</iaixsl:choose>
												<span class="remove__button --mobile btn --icon-left icon-trash d-none">
													Usuń z koszyka
												</span>
												<span class="remove__button --desktop btn d-none d-md-inline-block icon-remove"/>
											</a>
										</div>

										
										<iaixsl:if test="/shop/basket/@product_comment_active = 'y' and count(/shop/page/basket-details/product/price[not(@special_offer='true')]) &gt; 0">
											<div class="basket__action --comment">
												<a href="#addComment" class="basket__comment btn  --click">
													<iaixsl:attribute name="title">kliknij aby, dodać komentarz</iaixsl:attribute>
													 <i class="--icon-left icon-link mr-2"></i>dodaj opis lub załącznik
												</a>
											</div>
											<div class="basket__action --add-comment">
												<div class="basket__add --comment">
													<span class="add__label">Wpisz komentarz</span>
													<textarea class="add__textarea">
														<iaixsl:attribute name="name">comment[<iaixsl:value-of select="position()"/>]</iaixsl:attribute>
														<iaixsl:if test="comment">
															<iaixsl:value-of select="comment"/>
														</iaixsl:if>
													</textarea>
												</div>
												<div class="basket__add --files">
													<span class="add__label">Załącz plik do produktu</span>
													<div class="add__files">
														<input type="file">
															<iaixsl:if test="/shop/form_data/upload_file/max_filesize/@bytes">
																<iaixsl:attribute name="data-max_filesize"><iaixsl:value-of select="/shop/form_data/upload_file/max_filesize/@bytes"/></iaixsl:attribute>
															</iaixsl:if>
															<iaixsl:attribute name="name">comment_photo[<iaixsl:value-of select="@id"/>][<iaixsl:value-of select="size/@type"/>][<iaixsl:choose><iaixsl:when test="additional/@hash"><iaixsl:value-of select="additional/@hash"/></iaixsl:when><iaixsl:otherwise>0</iaixsl:otherwise></iaixsl:choose>][]</iaixsl:attribute>
														</input>
													</div>
													<a href="#addMoreFile" class="add__file btn --icon-left icon-plus --click">Dodaj plik</a>
												</div>
												<div class="basket__add --save">
													<button class="add__save --submit" type="submit">
														<span class="save__button --mobile btn --solid --large d-md-none">Zapisz opis i załącznik</span>
														<span class="save__button --desktop btn --solid d-none d-md-inline-block">Zapisz opis i załącznik</span>
													</button>
												</div>
											</div>
										</iaixsl:if>
									</div>


										
										<iaixsl:if test="comment">
											<div class="basket__param --comment d-md-none">
												<a href="#editComment" class="param__label d-block --click">
													<iaixsl:value-of disable-output-escaping="yes" select="comment"/>
												</a>
											</div>
										</iaixsl:if>

										
										<iaixsl:if test="order_files/file">
											<div class="basket__param --files d-md-none">
												<iaixsl:for-each select="order_files/file">
													<div class="preview__wrapper">
														<a class="preview__button btn --icon-left --secondary icon-link --click" href="#previewFile">
															<iaixsl:choose>
																<iaixsl:when test="@preview = 'true'">
																	<iaixsl:attribute name="rel"><iaixsl:value-of select="@path"/></iaixsl:attribute>
																</iaixsl:when>
																<iaixsl:otherwise>
																	<iaixsl:attribute name="href"><iaixsl:value-of select="@path"/></iaixsl:attribute>
																	<iaixsl:attribute name="target">_blank</iaixsl:attribute>
																</iaixsl:otherwise>
															</iaixsl:choose>
															<span><iaixsl:value-of select="@file"/></span>
														</a>
														<a class="preview__button --delete btn icon-remove --click">
															<iaixsl:attribute name="href"><iaixsl:value-of select="@delete_link"/></iaixsl:attribute>
															<iaixsl:attribute name="title">Usuń plik</iaixsl:attribute>
															<span/>
														</a>
													</div>
												</iaixsl:for-each>
											</div>
										</iaixsl:if>
								</div>
							</iaixsl:for-each>
						</div>

						
						<h2 class="basket__label headline --later"><span class="headline__name">Dostępne <span class="basket__division_literal">za </span> <strong class="basket__division_weeks"/> <i class="icon-clock"/></span></h2>

						<div class="basket__productslist --later">
							
							<iaixsl:if test="page/basket-details/product[@division='later' and @basket_group_id]">
								<iaixsl:attribute name="data-groups">true</iaixsl:attribute>
							</iaixsl:if>
							<div class="basket__block --labels">
								<div class="basket__item --checkbox d-md-none">

								</div>
								<div class="basket__item --photo">

								</div>

								<div class="basket__item --name">

								</div>

								<div class="basket__item --prices">
									Cena jedn.
								</div>

								<div class="basket__item --sum">
									Wartość
								</div>

								<div class="basket__item --actions">
									<div class="basket__action --quantity">
										Ilość
									</div>

									<div class="basket__action --calculate">
										Przelicz
									</div>

									<div class="basket__action --remove">
										Usuń
									</div>

									<iaixsl:if test="/shop/basket/@product_comment_active = 'y' and count(/shop/page/basket-details/product/price[not(@special_offer='true')]) &gt; 0">
										<div class="basket__action --comment">
											Uwagi
										</div>
									</iaixsl:if>
								</div>
							</div>

							<iaixsl:variable name="divisionNowCount"><iaixsl:value-of select="count(page/basket-details/product[@division='now'])"/></iaixsl:variable>
							<iaixsl:for-each select="page/basket-details/product[@division='later']">
								<div class="basket__block">
									<iaixsl:choose>
										<iaixsl:when test="price/@special_offer='true' and price/@special_offer_changeable_quantity='true'">
											<iaixsl:attribute name="class">basket__block --special --special_quantity</iaixsl:attribute>
										</iaixsl:when>
										<iaixsl:when test="price/@special_offer='true'">
											<iaixsl:attribute name="class">basket__block --special</iaixsl:attribute>
										</iaixsl:when>
										<iaixsl:otherwise>
										</iaixsl:otherwise>
									</iaixsl:choose>

									<iaixsl:attribute name="data-product-id"><iaixsl:value-of select="@id"/></iaixsl:attribute>
									<iaixsl:attribute name="data-product-checkbox-id"><iaixsl:value-of select="@id"/>_<iaixsl:value-of select="size/@type"/>_<iaixsl:value-of select="additional/@hash"/></iaixsl:attribute>
									
									<iaixsl:variable name="groupId"><iaixsl:value-of select="@basket_group_id"/></iaixsl:variable>
									
									<iaixsl:variable name="subscriptionGroup"><iaixsl:value-of select="/shop/basket/groups/group[@id = $groupId]/types/type[@value = 'subscription']/@value != ''"/></iaixsl:variable>
									
									<iaixsl:if test="@basket_group_id">
										<iaixsl:attribute name="data-group"><iaixsl:for-each select="/shop/basket/groups/group[@id = $groupId]/types/type"><iaixsl:value-of select="@value"/><iaixsl:if test="position() != last()">;</iaixsl:if></iaixsl:for-each></iaixsl:attribute>
										<iaixsl:attribute name="style">--group:<iaixsl:value-of select="$groupId"/>;</iaixsl:attribute>
										<iaixsl:attribute name="data-group-id"><iaixsl:value-of select="$groupId"/></iaixsl:attribute>
										<iaixsl:if test="not($groupId = preceding-sibling::product[@division='later']/@basket_group_id)">
											<iaixsl:attribute name="data-first-in-group">true</iaixsl:attribute>
											<iaixsl:if test="$subscriptionGroup = 'true'">
												<iaixsl:attribute name="data-label-group">Subskrypcja</iaixsl:attribute>
											</iaixsl:if>
										</iaixsl:if>
										<iaixsl:if test="not($groupId = following-sibling::product[@division='later']/@basket_group_id)">
											<iaixsl:attribute name="data-last-in-group">true</iaixsl:attribute>
										</iaixsl:if>
										<iaixsl:if test="count(preceding-sibling::product[@division='later'][@basket_group_id = $groupId]) &gt;= $visibleProductsInGroup">
											<iaixsl:attribute name="data-hide">true</iaixsl:attribute>
										</iaixsl:if>
										<iaixsl:if test="count(preceding-sibling::product[@division='later'][@basket_group_id = $groupId]) = $visibleProductsInGroup - 1 and $groupId = following-sibling::product/@basket_group_id">
											<iaixsl:attribute name="data-last-visible">true</iaixsl:attribute>
										</iaixsl:if>
									</iaixsl:if>

									
									<iaixsl:if test="count(preceding-sibling::product[@division='later'][@basket_group_id = $groupId]) = $visibleProductsInGroup - 1 and $groupId = following-sibling::product/@basket_group_id">
										<a href="#showAllInGroup" class="basket__visible_in_group --show">+<iaixsl:value-of select="count(following-sibling::product[@division='later'][@basket_group_id = $groupId])"/> produkty w subskrypcji</a>
									</iaixsl:if>

									
									<iaixsl:if test="count(preceding-sibling::product[@division='later'][@basket_group_id = $groupId]) &gt;= $visibleProductsInGroup and not($groupId = following-sibling::product/@basket_group_id)">
										<a href="#hideAllInGroup" class="basket__visible_in_group --hide">Ukryj</a>
									</iaixsl:if>

									
									<div class="basket__item --photo">
										
										<div class="basket__checkbox d-md-none">
											<div class="f-group --checkbox mb-0">
												<input type="checkbox" class="basket__product_checkbox f-control">
													<iaixsl:attribute name="value"><iaixsl:value-of select="@id"/>_<iaixsl:value-of select="size/@type"/>_<iaixsl:value-of select="additional/@hash"/></iaixsl:attribute>
													<iaixsl:attribute name="id">basket_product_checkbox_<iaixsl:value-of select="@id"/>_<iaixsl:value-of select="size/@type"/>_<iaixsl:value-of select="additional/@hash"/></iaixsl:attribute>
													<iaixsl:if test="count(/shop/page/basket-details/product) = 1">
														<iaixsl:attribute name="checked">checked</iaixsl:attribute>
													</iaixsl:if>
												</input>
												<label class="basket__product_checkbox_label f-label mr-0">
													<iaixsl:attribute name="for">basket_product_checkbox_<iaixsl:value-of select="@id"/>_<iaixsl:value-of select="size/@type"/>_<iaixsl:value-of select="additional/@hash"/></iaixsl:attribute>
												</label>
											</div>
										</div>
										<a class="photo__link">
											<iaixsl:attribute name="href"><iaixsl:value-of select="@link"/></iaixsl:attribute>
                      <iaixsl:choose>
                        <iaixsl:when test="icon_src_second and not(icon_src_second = '' or icon_src_second = '/')">
                          <picture>
                            <source type="image/webp">
                              <iaixsl:choose>
                                <iaixsl:when test="$setIconLarge">
                                  <iaixsl:attribute name="srcset"><iaixsl:value-of select="icon"/></iaixsl:attribute>
                                </iaixsl:when>
                                <iaixsl:otherwise>
                                  <iaixsl:attribute name="srcset"><iaixsl:value-of select="icon_small"/></iaixsl:attribute>
                                </iaixsl:otherwise>
                              </iaixsl:choose>
                              <img class="photo__image">
                                <iaixsl:choose>
                                  <iaixsl:when test="$setIconLarge">
                                    <iaixsl:attribute name="src"><iaixsl:value-of select="icon_src_second"/></iaixsl:attribute>
                                  </iaixsl:when>
                                  <iaixsl:otherwise>
                                    <iaixsl:attribute name="src"><iaixsl:value-of select="iconsmall_second"/></iaixsl:attribute>
                                  </iaixsl:otherwise>
                                </iaixsl:choose>
                                <iaixsl:attribute name="alt"><iaixsl:value-of disable-output-escaping="yes" select="name/text()"/></iaixsl:attribute>
                              </img>
                            </source>
                          </picture>
                        </iaixsl:when>
                        <iaixsl:otherwise>
                          <img class="photo__image">
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
										</a>
									</div>

									
									<div class="basket__item --name">
										<div class="basket__name">
											<div class="basket__product">
												<h3 class="product__name">
													<a class="product__link">
														<iaixsl:attribute name="href"><iaixsl:value-of select="@link"/></iaixsl:attribute>
														<iaixsl:value-of disable-output-escaping="yes" select="name/text()"/>
													</a>
													<iaixsl:if test="@product_type = 'product_virtual'">
														<span class="product__virtual">Towar wirtualny</span>
													</iaixsl:if>

													<iaixsl:if test="@product_type = 'product_service'">
														<span class="product__service">Usługa</span>
													</iaixsl:if>

													<iaixsl:if test="price/@special_offer='true'">
														<span class="product__special">Oferta specjalna</span>
													</iaixsl:if>
												</h3>
												<div class="product__price_container">
													<div class="product__price">
														<iaixsl:choose>
															<iaixsl:when test="size/@ordered_points">
																<span class="basket__sum --points">
																	<iaixsl:value-of select="price/@points_sum"/> pkt.
																</span>
															</iaixsl:when>
															<iaixsl:otherwise>
																<span class="basket__sum">
																	<iaixsl:choose>
																		<iaixsl:when test="not($nettoPriceBasketedit = '') and not($priceTypeVat = '')">
																			<span class="basket__price_net"><iaixsl:value-of select="price/@worth_net_formatted"/><span class="price_vat"><iaixsl:value-of select="$priceTypeText"/></span></span>
																			<span class="basket__price_gross gross_price">(<iaixsl:value-of select="price/@worth_formatted"/><span class="price_vat"><iaixsl:value-of select="$grossPriceBasketedit"/></span>)</span>
																		</iaixsl:when>
																		<iaixsl:otherwise>
																			<iaixsl:value-of select="price/@worth_formatted"/>
																		</iaixsl:otherwise>
																	</iaixsl:choose>
																</span>
															</iaixsl:otherwise>
														</iaixsl:choose>
													</div>
													
													<a href="#showActions" class="basket__show_wrapper --click">
														<span class="basket__show --ordered">
															<iaixsl:choose>
																<iaixsl:when test="size/@ordered_points">
																	<iaixsl:value-of select="size/@ordered_points"/>
																</iaixsl:when>
																<iaixsl:otherwise>
																	<iaixsl:value-of select="size/@ordered"/>
																</iaixsl:otherwise>
															</iaixsl:choose>
														</span>
														<span class="basket__show --actions btn icon-angle-down"/>
													</a>
												</div>
											</div>
										</div>

										
										<iaixsl:if test="$subscriptionGroup = 'true'">
											<div class="basket__param --subscription --period">
												<span class="param__label">
													Wysyłka co:
												</span>
												<strong class="param__value">
													<iaixsl:attribute name="data-change-literal-days"><iaixsl:value-of select="/shop/basket/groups/group[@id = $groupId]/details/subscription/@days_in_period"/></iaixsl:attribute>
													<iaixsl:value-of select="/shop/basket/groups/group[@id = $groupId]/details/subscription/@days_in_period"/> dni
												</strong>
											</div>
										</iaixsl:if>

										
										<iaixsl:if test="$subscriptionGroup = 'true'">
											<div class="basket__param --subscription --next">
												<span class="param__label">
													Kolejna dostawa:
												</span>
												<strong class="param__value">
													<iaixsl:variable name="next_order_week_day"><iaixsl:value-of select="/shop/basket/groups/group[@id = $groupId]/details/subscription/dates/@next_order_week_day"/></iaixsl:variable>
													<span class="param__day_name">
														<iaixsl:choose>
															<iaixsl:when test="$next_order_week_day = 1">
																Poniedziałek
															</iaixsl:when>
															<iaixsl:when test="$next_order_week_day = 2">
																Wtorek
															</iaixsl:when>
															<iaixsl:when test="$next_order_week_day = 3">
																Środa
															</iaixsl:when>
															<iaixsl:when test="$next_order_week_day = 4">
																Czwartek
															</iaixsl:when>
															<iaixsl:when test="$next_order_week_day = 5">
																Piątek
															</iaixsl:when>
															<iaixsl:when test="$next_order_week_day = 6">
																Sobota
															</iaixsl:when>
															<iaixsl:when test="$next_order_week_day = 7">
																Niedziela
															</iaixsl:when>
														</iaixsl:choose>
													</span>
													<iaixsl:variable name="next_order_time"><iaixsl:value-of select="/shop/basket/groups/group[@id = $groupId]/details/subscription/dates/@date_next_order"/></iaixsl:variable>
													<iaixsl:variable name="next_order_time_month_day"><iaixsl:value-of select="substring($next_order_time, 6, 5)"/></iaixsl:variable>
													<iaixsl:variable name="next_order_time_formatted"><iaixsl:value-of select="substring-after($next_order_time_month_day, '-')"/>.<iaixsl:value-of select="substring-before($next_order_time_month_day, '-')"/></iaixsl:variable>
													<span class="param__date_wrapper"> (<span><iaixsl:value-of select="$next_order_time_formatted"/></span>)</span>
												</strong>
											</div>
										</iaixsl:if>

										
										<iaixsl:if test="price/@special_offer='true'">
											<div class="basket__param --special">
												<span class="param__label">
													Dzięki ofercie specjalnej zyskujesz
													<strong class="param__save"><iaixsl:value-of select="price/@yousave_formatted"/></strong>, czyli
													<strong class="param__save_percent"><iaixsl:value-of select="price/@yousave_percent"/>%</strong>
													wartości tego produktu.
												</span>
											</div>
										</iaixsl:if>

										
										<iaixsl:if test="not(@barcode ='')">
											<div class="basket__param --barcode">
												<span class="param__label">
													Symbol:
												</span>
												<span class="param__value">
													<iaixsl:value-of select="@barcode"/>
												</span>
											</div>
										</iaixsl:if>

										
										<iaixsl:if test="price/priceformula/parameters">
											<iaixsl:for-each select="price/priceformula/parameters/parameter">
												<div class="basket__param --priceformula">
													<span class="param__label">
														<iaixsl:value-of select="name"/>:
													</span>
													<span class="param__value">
														<iaixsl:value-of select="values/value"/>
													</span>
												</div>
											</iaixsl:for-each>
										</iaixsl:if>

										
										<iaixsl:if test="not(size/@type='uniw')">
											<div class="basket__param --size">
												<span class="param__label">
													Rozmiar:
												</span>
												<span class="param__value">
													<iaixsl:value-of select="size/@description"/>
												</span>
											</div>
										</iaixsl:if>

										
										<iaixsl:if test="(version) and (not(version/@product_name=''))">
											<div class="basket__param --version">
												<span class="param__label">
													<iaixsl:value-of select="version/@name"/>:
												</span>
												<span class="param__value">
													<iaixsl:value-of select="version/@product_name"/>
												</span>
											</div>
										</iaixsl:if>

										
										<iaixsl:if test="@product_type = 'product_bundle'">
											<div class="basket__param --bundle">
												<iaixsl:if test="@collection = 'true'">
													<iaixsl:attribute name="class">basket__param --bundle --collection</iaixsl:attribute>
												</iaixsl:if>
												<span class="param__label">
													Składowe zestawu:
												</span>
												<div class="param__wrapper">
													<iaixsl:for-each select="bundled/product">
														<span class="param__value">
															<iaixsl:if test="size/@ordered &gt; 1">
																<iaixsl:value-of select="size/@ordered"/>x 
															</iaixsl:if>

															<iaixsl:value-of select="name/text()"/>

															<iaixsl:if test="not(size/@type='uniw') or ((version) and (not(version/@product_name='')))">
																(<iaixsl:if test="not(size/@type='uniw')">Rozmiar: <b><iaixsl:value-of select="size/@description"/></b></iaixsl:if><iaixsl:if test="not(size/@type='uniw') and ((version) and (not(version/@product_name='')))">, </iaixsl:if><iaixsl:if test="(version) and (not(version/@product_name=''))"><iaixsl:value-of select="version/@name"/>: <b><iaixsl:value-of select="version/@product_name"/></b></iaixsl:if>)
															</iaixsl:if>

															<iaixsl:if test="@product_type = 'product_virtual'">
																<span class="param__virtual">Towar wirtualny</span>
															</iaixsl:if>

															<iaixsl:if test="@product_type = 'product_service'">
																<span class="param__service">Usługa</span>
															</iaixsl:if>
														</span>
													</iaixsl:for-each>
												</div>
											</div>
										</iaixsl:if>

										
										<iaixsl:if test="change_group">
											<div class="basket__param --info">
												Nie możesz usunąć tego produktu.
											</div>
										</iaixsl:if>

										
										<iaixsl:choose>
											<iaixsl:when test="(size/@orderedsum) &gt; (size/@amount) and not(size/@amount = '0') and not(size/@amount = '-1')">
												<div class="basket__param --info">
													<span class="param__label">
														Nie mamy w tej chwili takiej ilości produktu. Zmniejsz zamawianą ilość do <iaixsl:value-of select="size/@amount"/>, lub wybierz inny produkt.
													</span>
												</div>
											</iaixsl:when>

											<iaixsl:when test="size/@amount = '0'">
												<div class="basket__param --info">
													<span class="param__label">
														Ten produkt właśnie się nam skończył. Wybierz inny produkt.
													</span>
												</div>
											</iaixsl:when>

											<iaixsl:when test="(size/@ordered_points) and not(/shop/basket/@client_points &gt;= 0)">
												<div class="basket__param --info">
													<span class="param__label">
														Masz za mało punktów lojalnościowych by kupić tyle produktów za punkty.
													</span>
												</div>
											</iaixsl:when>

											<iaixsl:when test="(/shop/page/rebates/code_details/@active = 'y') and ((/shop/rebate_code/shipping_cost_rebate/@active='n') and (price/@rebate_code_active='n'))">
												<div class="basket__param --info">
													<span class="param__label">
														Podany kod rabatowy nie obejmuje tego towaru.
													</span>
												</div>
											</iaixsl:when>

											<iaixsl:when test="@product_type='product_virtual' and not(count(/shop/page/basket-details/product) = count(/shop/page/basket-details/product[@product_type='product_virtual']))">
												<div class="basket__param --info">
													<span class="param__label">
														Produkt będzie dostępny w sekcji
														<a class="param__link --link">
															<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/client_files/@link_to_download"/></iaixsl:attribute>
															&quot;Moje pliki&quot;
														</a>
															po zrealizowaniu zamówienia.
													</span>
												</div>
											</iaixsl:when>
										</iaixsl:choose>

										<iaixsl:if test="(size/@to_little_for_gross = 'true') and not((size/@orderedsum) &gt; (size/@amount) and not(size/@amount = '0') and not(size/@amount = '-1'))">
											<div class="basket__param --info">
												<span class="param__label">
													Dysponujemy
													<iaixsl:value-of select="size/@amount_wholesale"/>
														szt. produktu w cenie hurtowej. W koszyku masz
													<iaixsl:value-of select="size/@ordered - size/@amount_wholesale"/>
														szt. produktu w cenie detalicznej.
												</span>
											</div>
										</iaixsl:if>

										
										<iaixsl:if test="$txt_50001_025a and (price/@advanceworth &gt; 0)">
											<div class="basket__param --advance">
												<span class="param__label">
													<iaixsl:choose>
														<iaixsl:when test="/shop/page/basket-details/summary/money/@advance_mode = 'default' or /shop/page/basket-details/summary/money/@advance_mode = 'none'">
															<iaixsl:choose>
																<iaixsl:when test="/shop/page/basket-details/summary/money/@cash_on_delivery = 'true' and /shop/page/basket-details/summary/money/@prepaid = 'false'">
																	Przed realizacją zamówienia z płatnością przy odbiorze wymagana jest zaliczka na ten towar: <iaixsl:value-of select="price/@advanceworth_formatted"/>
																</iaixsl:when>
																<iaixsl:when test="/shop/page/basket-details/summary/money/@cash_on_delivery = 'false' and /shop/page/basket-details/summary/money/@prepaid = 'true'">
																	Przed realizacją zamówienia z płatnością za przedpłatą wymagana jest zaliczka na ten towar: <iaixsl:value-of select="price/@advanceworth_formatted"/>
																</iaixsl:when>
																<iaixsl:when test="/shop/page/basket-details/summary/money/@cash_on_delivery = 'true' and /shop/page/basket-details/summary/money/@prepaid = 'true'">
																	Przed realizacją zamówienia wymagana jest zaliczka na ten towar: <iaixsl:value-of select="price/@advanceworth_formatted"/>
																</iaixsl:when>
															</iaixsl:choose>
														</iaixsl:when>
														<iaixsl:when test="/shop/page/basket-details/summary/money/@advance_mode = 'total'">
															Przed realizacją zamówienia wymagana jest zaliczka na ten towar: <iaixsl:value-of select="price/@advanceworth_formatted"/>
														</iaixsl:when>
													</iaixsl:choose>
												</span>
											</div>
										</iaixsl:if>

										
										<iaixsl:if test="comment">
											<div class="basket__param --comment d-none d-md-block">
												<a href="#editComment" class="param__label d-block --click">
													<iaixsl:value-of disable-output-escaping="yes" select="comment"/>
												</a>
											</div>
										</iaixsl:if>

										
										<iaixsl:if test="order_files/file">
											<div class="basket__param --files d-none d-md-block">
												<iaixsl:for-each select="order_files/file">
													<div class="preview__wrapper">
														<a class="preview__button btn --icon-left --secondary icon-link --click" href="#previewFile">
															<iaixsl:choose>
																<iaixsl:when test="@preview = 'true'">
																	<iaixsl:attribute name="rel"><iaixsl:value-of select="@path"/></iaixsl:attribute>
																</iaixsl:when>
																<iaixsl:otherwise>
																	<iaixsl:attribute name="href"><iaixsl:value-of select="@path"/></iaixsl:attribute>
																	<iaixsl:attribute name="target">_blank</iaixsl:attribute>
																</iaixsl:otherwise>
															</iaixsl:choose>
															<span><iaixsl:value-of select="@file"/></span>
														</a>
														<a class="preview__button --delete btn icon-remove --click">
															<iaixsl:attribute name="href"><iaixsl:value-of select="@delete_link"/></iaixsl:attribute>
															<iaixsl:attribute name="title">Usuń plik</iaixsl:attribute>
															<span/>
														</a>
													</div>
												</iaixsl:for-each>
											</div>
										</iaixsl:if>

									</div>

									
									<div class="basket__item --prices">
										<iaixsl:choose>
											
											<iaixsl:when test="size/@ordered_points">
												<del class="basket__max_price --points">
													<iaixsl:choose>
														<iaixsl:when test="not($nettoPriceBasketedit = '') and not($priceTypeVat = '')">
															<span class="basket__price_net"><iaixsl:value-of select="price/@price_net_formatted"/><span class="price_vat"><iaixsl:value-of select="$priceTypeText"/></span></span>
															<span class="basket__price_gross gross_price">(<iaixsl:value-of select="price/@price_formatted"/><span class="price_vat"><iaixsl:value-of select="$grossPriceBasketedit"/></span>)</span>
														</iaixsl:when>
														<iaixsl:otherwise>
															<iaixsl:value-of select="price/@price_formatted"/>
														</iaixsl:otherwise>
													</iaixsl:choose>
												</del>
												<span class="basket__price --points">
													<iaixsl:value-of select="price/@points"/> pkt.
												</span>
											</iaixsl:when>
											
											<iaixsl:otherwise>
												<iaixsl:if test="price/@beforerebate">
													<del class="basket__max_price">
														<iaixsl:choose>
															<iaixsl:when test="not($nettoPriceBasketedit = '') and not($priceTypeVat = '')">
																<span class="basket__max_price_net"><iaixsl:value-of select="price/@beforerebate_net_formatted"/><span class="price_vat"><iaixsl:value-of select="$priceTypeText"/></span></span>
																<span class="basket__max_price_gross gross_price">(<iaixsl:value-of select="price/@beforerebate_formatted"/><span class="price_vat"><iaixsl:value-of select="$grossPriceBasketedit"/></span>)</span>
															</iaixsl:when>
															<iaixsl:otherwise>
																<iaixsl:value-of select="price/@beforerebate_formatted"/>
															</iaixsl:otherwise>
														</iaixsl:choose>
													</del>
												</iaixsl:if>
												<span class="basket__price">
													<iaixsl:choose>
														<iaixsl:when test="not($nettoPriceBasketedit = '') and not($priceTypeVat = '')">
															<span class="basket__price_net"><iaixsl:value-of select="price/@price_net_formatted"/><span class="price_vat"><iaixsl:value-of select="$priceTypeText"/></span></span>
															<span class="basket__price_gross gross_price">(<iaixsl:value-of select="price/@price_formatted"/><span class="price_vat"><iaixsl:value-of select="$grossPriceBasketedit"/></span>)</span>
														</iaixsl:when>
														<iaixsl:otherwise>
															<iaixsl:value-of select="price/@price_formatted"/>
														</iaixsl:otherwise>
													</iaixsl:choose>
												</span>

												
												<iaixsl:if test="price/rebateNumber">
													<small class="basket__tip">
														kup więcej zapłać mniej
													</small>
													<div class="basket__tip_content tooltipContent">
														<iaixsl:for-each select="price/rebateNumber/rebate">
															<div>
																Od
																<strong>
																	<iaixsl:value-of select="@threshold"/><iaixsl:text> </iaixsl:text><iaixsl:value-of select="../../../size/@unit"/>
																</strong>
																cena
																<strong>
																	<iaixsl:choose>
																		<iaixsl:when test="not($nettoPriceBasketedit = '')">
																			<iaixsl:value-of select="@price_net_formatted"/>
																		</iaixsl:when>
																		<iaixsl:otherwise>
																			<iaixsl:value-of select="@price_formatted"/>
																		</iaixsl:otherwise>
																	</iaixsl:choose>
																</strong>
																- rabat
																<strong>
																	<iaixsl:value-of select="@value"/>%
																</strong>
															</div>
														</iaixsl:for-each>
													</div>
												</iaixsl:if>
											</iaixsl:otherwise>
										</iaixsl:choose>
									</div>

									
									<div class="basket__item --sum">
										<iaixsl:choose>
											<iaixsl:when test="size/@ordered_points">
												<span class="basket__sum --points">
													<iaixsl:value-of select="price/@points_sum"/> pkt.
												</span>
											</iaixsl:when>
											<iaixsl:otherwise>
												<span class="basket__sum">
													<iaixsl:choose>
														<iaixsl:when test="not($nettoPriceBasketedit = '') and not($priceTypeVat = '')">
															<span class="basket__price_net"><iaixsl:value-of select="price/@worth_net_formatted"/><span class="price_vat"><iaixsl:value-of select="$priceTypeText"/></span></span>
															<span class="basket__price_gross gross_price">(<iaixsl:value-of select="price/@worth_formatted"/><span class="price_vat"><iaixsl:value-of select="$grossPriceBasketedit"/></span>)</span>
														</iaixsl:when>
														<iaixsl:otherwise>
															<iaixsl:value-of select="price/@worth_formatted"/>
														</iaixsl:otherwise>
													</iaixsl:choose>
												</span>
											</iaixsl:otherwise>
										</iaixsl:choose>
									</div>

									
									<div class="basket__item --actions">
										
										<div class="basket__action --quantity">
											<iaixsl:if test="change_group/@id">
												<iaixsl:attribute name="class">basket__action --quantity --change-group</iaixsl:attribute>
											</iaixsl:if>

											<iaixsl:if test="@product_type='product_virtual'">
												<iaixsl:attribute name="class">basket__action --quantity --virtual</iaixsl:attribute>
											</iaixsl:if>

											<input type="hidden">
												<iaixsl:attribute name="name">product[<iaixsl:value-of select="$divisionNowCount + position()"/>]</iaixsl:attribute>
												<iaixsl:attribute name="value"><iaixsl:value-of select="@id"/></iaixsl:attribute>
											</input>
											<input type="hidden">
												<iaixsl:attribute name="name">size[<iaixsl:value-of select="$divisionNowCount + position()"/>]</iaixsl:attribute>
												<iaixsl:attribute name="value"><iaixsl:value-of select="size/@type"/></iaixsl:attribute>
											</input>
											<iaixsl:if test="additional/@hash">
												<input type="hidden">
													<iaixsl:attribute name="name">additional[<iaixsl:value-of select="$divisionNowCount + position()"/>]</iaixsl:attribute>
													<iaixsl:attribute name="value"><iaixsl:value-of select="additional/@hash"/></iaixsl:attribute>
												</input>
											</iaixsl:if>
											<iaixsl:if test="size/@ordered_points">
												<input type="hidden" value="1">
													<iaixsl:attribute name="name">forpoints[<iaixsl:value-of select="$divisionNowCount + position()"/>]</iaixsl:attribute>
												</input>
											</iaixsl:if>

											<iaixsl:choose>
												<iaixsl:when test="change_group/@id">
													<input class="quantity__input" type="hidden">
														<iaixsl:attribute name="name">set_quantity[<iaixsl:value-of select="$divisionNowCount + position()"/>]</iaixsl:attribute>
														<iaixsl:choose>
															<iaixsl:when test="size/@ordered_points">
																<iaixsl:attribute name="value"><iaixsl:value-of select="size/@ordered_points"/></iaixsl:attribute>
															</iaixsl:when>
															<iaixsl:otherwise>
																<iaixsl:attribute name="value"><iaixsl:value-of select="size/@ordered"/></iaixsl:attribute>
															</iaixsl:otherwise>
														</iaixsl:choose>
													</input>
													<strong>
														<iaixsl:choose>
															<iaixsl:when test="size/@ordered_points">
																<iaixsl:value-of select="size/@ordered_points"/>
															</iaixsl:when>
															<iaixsl:otherwise>
																<iaixsl:value-of select="size/@ordered"/>
															</iaixsl:otherwise>
														</iaixsl:choose>
														<span>
															<iaixsl:choose>
																<iaixsl:when test="not(size/@ordered &gt; 1)">
																	<iaixsl:value-of select="size/@unit_singular"/>
																</iaixsl:when>
																<iaixsl:otherwise>
																	<iaixsl:value-of select="size/@unit"/>
																</iaixsl:otherwise>
															</iaixsl:choose>
														</span>
													</strong>
													<iaixsl:if test="change_group/@changelink">
														<a class="basket__change --click">
															<iaixsl:attribute name="href"><iaixsl:value-of select="change_group/@changelink"/></iaixsl:attribute>
															<span class="change__button --mobile btn --solid --large d-md-none">Wymień produkt</span>
															<span class="change__button --desktop btn --solid d-none d-md-inline-block">Wymień produkt</span>
														</a>
													</iaixsl:if>
												</iaixsl:when>
												<iaixsl:when test="@product_type='product_virtual'">
													<input class="quantity__input" type="hidden">
														<iaixsl:attribute name="name">set_quantity[<iaixsl:value-of select="$divisionNowCount + position()"/>]</iaixsl:attribute>
														<iaixsl:choose>
															<iaixsl:when test="size/@ordered_points">
																<iaixsl:attribute name="value"><iaixsl:value-of select="size/@ordered_points"/></iaixsl:attribute>
															</iaixsl:when>
															<iaixsl:otherwise>
																<iaixsl:attribute name="value"><iaixsl:value-of select="size/@ordered"/></iaixsl:attribute>
															</iaixsl:otherwise>
														</iaixsl:choose>
													</input>
													<div class="basket__virtual">1</div>
												</iaixsl:when>
												<iaixsl:otherwise>
													<div class="basket__quantity">
														
														<a href="#delQuantity" class="quantity__del btn icon-minus --click"/>

														
														<label for="InputQuantity" class="quantity__label">
															<iaixsl:attribute name="for">InputQuantity<iaixsl:value-of select="$divisionNowCount + position()"/></iaixsl:attribute>
															<input class="quantity__input" type="number">
																<iaixsl:attribute name="id">InputQuantity<iaixsl:value-of select="$divisionNowCount + position()"/></iaixsl:attribute>
																<iaixsl:if test="price/@special_offer='true' and not(price/@special_offer_changeable_quantity='true')">
																	<iaixsl:attribute name="readonly">readonly</iaixsl:attribute>
																</iaixsl:if>
																<iaixsl:attribute name="name">set_quantity[<iaixsl:value-of select="$divisionNowCount + position()"/>]</iaixsl:attribute>

																<iaixsl:choose>
																	<iaixsl:when test="size/@ordered_points">
																		<iaixsl:attribute name="value"><iaixsl:value-of select="size/@ordered_points"/></iaixsl:attribute>
																	</iaixsl:when>
																	<iaixsl:otherwise>
																		<iaixsl:attribute name="value"><iaixsl:value-of select="size/@ordered"/></iaixsl:attribute>
																	</iaixsl:otherwise>
																</iaixsl:choose>

																<iaixsl:attribute name="data-amount"><iaixsl:value-of select="size/@amount"/></iaixsl:attribute>
																<iaixsl:attribute name="data-unit_sellby"><iaixsl:value-of select="size/@unit_sellby"/></iaixsl:attribute>
																<iaixsl:attribute name="step"><iaixsl:value-of select="size/@unit_sellby"/></iaixsl:attribute>
																<iaixsl:attribute name="data-unit"><iaixsl:value-of select="size/@unit"/></iaixsl:attribute>
																<iaixsl:attribute name="data-unit_precision"><iaixsl:value-of select="size/@unit_precision"/></iaixsl:attribute>

																<iaixsl:if test="order_quantity_range/max_quantity_per_order">
																	<iaixsl:attribute name="data-max_q"><iaixsl:value-of select="order_quantity_range/max_quantity_per_order"/></iaixsl:attribute>
																</iaixsl:if>
																<iaixsl:if test="order_quantity_range/max_size_quantity_per_order">
																	<iaixsl:attribute name="data-max_s"><iaixsl:value-of select="order_quantity_range/max_size_quantity_per_order"/></iaixsl:attribute>
																</iaixsl:if>
																<iaixsl:if test="order_quantity_range/min_quantity_per_order">
																	<iaixsl:attribute name="data-min_q"><iaixsl:value-of select="order_quantity_range/min_quantity_per_order"/></iaixsl:attribute>
																</iaixsl:if>
																<iaixsl:if test="order_quantity_range/min_size_quantity_per_order">
																	<iaixsl:attribute name="data-min_s"><iaixsl:value-of select="order_quantity_range/min_size_quantity_per_order"/></iaixsl:attribute>
																</iaixsl:if>
																
																<iaixsl:if test="subscription/@minimum_quantity">
																	<iaixsl:attribute name="data-min_q"><iaixsl:value-of select="subscription/@minimum_quantity"/></iaixsl:attribute>
																</iaixsl:if>
															</input>

															
															<span class="quantity__unit d-md-none">
																<iaixsl:choose>
																	<iaixsl:when test="not(size/@ordered &gt; 1)">
																		<iaixsl:value-of select="size/@unit_singular"/>
																	</iaixsl:when>
																	<iaixsl:otherwise>
																		<iaixsl:value-of select="size/@unit"/>
																	</iaixsl:otherwise>
																</iaixsl:choose>
															</span>
														</label>

														
														<a href="#addQuantity" class="quantity__add btn icon-plus --click"/>

														
														<span class="quantity__unit d-none d-md-flex">
															<iaixsl:choose>
																<iaixsl:when test="not(size/@ordered &gt; 1)">
																	<iaixsl:value-of select="size/@unit_singular"/>
																</iaixsl:when>
																<iaixsl:otherwise>
																	<iaixsl:value-of select="size/@unit"/>
																</iaixsl:otherwise>
															</iaixsl:choose>
														</span>
													</div>

													
													<iaixsl:if test="not(size/@unit_sellby = '1')">
														<div class="basket__sellby">
															sprzedawane po
															<iaixsl:value-of select="size/@unit_sellby"/><iaixsl:text> </iaixsl:text>
															<iaixsl:choose>
																<iaixsl:when test="not(size/@ordered &gt; 1)">
																	<iaixsl:value-of select="size/@unit_singular"/>
																</iaixsl:when>
																<iaixsl:otherwise>
																	<iaixsl:value-of select="size/@unit"/>
																</iaixsl:otherwise>
															</iaixsl:choose>
														</div>
													</iaixsl:if>
												</iaixsl:otherwise>
											</iaixsl:choose>
										</div>

										
										<div class="basket__action --calculate">
											<iaixsl:choose>
												<iaixsl:when test="price/@special_offer='true' and not(price/@special_offer_changeable_quantity='true')">
													<span class="basket__calculate --special"><i class="icon-ok-sign"/>Oferta specjalna</span>
												</iaixsl:when>
																									<iaixsl:when test="price/@special_offer='true'">
													<span class="basket__calculate --special"><i class="icon-ok-sign"/>Oferta specjalna</span>
																											<button class="basket__calculate --button --submit" type="submit">
														<iaixsl:attribute name="title">zmień ilość</iaixsl:attribute>
														<span class="calculate__button --mobile btn --solid --large d-md-none">
															Przelicz
														</span>
														<span class="calculate__button --desktop btn d-none d-md-inline-block icon-repeat"/>
													</button>
												</iaixsl:when>
												<iaixsl:otherwise>
													<button class="basket__calculate --button --submit" type="submit">
														<iaixsl:attribute name="title">zmień ilość</iaixsl:attribute>
														<span class="calculate__button --mobile btn --solid --large d-md-none">
															Przelicz
														</span>
														<span class="calculate__button --desktop btn d-none d-md-inline-block icon-repeat"/>
													</button>
												</iaixsl:otherwise>
											</iaixsl:choose>
										</div>

										
										<div class="basket__action --remove">
											<a href="#remove" class="basket__remove --click">
												<iaixsl:if test="/shop/page/basket-details/@reduction_amount_disabled = 'true' and order_quantity_range/min_quantity_per_order/text()">
													<iaixsl:attribute name="data-disabled">true</iaixsl:attribute>
												</iaixsl:if>
												<iaixsl:choose>
													<iaixsl:when test="removeall_points">
														<iaixsl:attribute name="data-href"><iaixsl:value-of select="removeall_points"/></iaixsl:attribute>
													</iaixsl:when>
													<iaixsl:otherwise>
														<iaixsl:attribute name="data-href"><iaixsl:value-of select="removeall"/></iaixsl:attribute>
													</iaixsl:otherwise>
												</iaixsl:choose>
												<span class="remove__button --mobile btn --icon-left icon-trash d-none">
													Usuń z koszyka
												</span>
												<span class="remove__button --desktop btn d-none d-md-inline-block icon-remove"/>
											</a>
										</div>

										
										<iaixsl:if test="/shop/basket/@product_comment_active = 'y' and count(/shop/page/basket-details/product/price[not(@special_offer='true')]) &gt; 0">
											<div class="basket__action --comment">
												<a href="#addComment" class="basket__comment btn --click">
													<iaixsl:attribute name="title">kliknij aby, dodać komentarz</iaixsl:attribute>
													<i class="--icon-left icon-link mr-2"></i>dodaj opis lub załącznik
												</a>
											</div>
											<div class="basket__action --add-comment">
												<div class="basket__add --comment">
													<span class="add__label">Wpisz komentarz</span>
													<textarea class="add__textarea">
														<iaixsl:attribute name="name">comment[<iaixsl:value-of select="$divisionNowCount + position()"/>]</iaixsl:attribute>
														<iaixsl:if test="comment">
															<iaixsl:value-of select="comment"/>
														</iaixsl:if>
													</textarea>
												</div>
												<div class="basket__add --files">
													<span class="add__label">Załącz plik do produktu</span>
													<div class="add__files">
														<input type="file">
															<iaixsl:if test="/shop/form_data/upload_file/max_filesize/@bytes">
																<iaixsl:attribute name="data-max_filesize"><iaixsl:value-of select="/shop/form_data/upload_file/max_filesize/@bytes"/></iaixsl:attribute>
															</iaixsl:if>
															<iaixsl:attribute name="name">comment_photo[<iaixsl:value-of select="@id"/>][<iaixsl:value-of select="size/@type"/>][<iaixsl:choose><iaixsl:when test="additional/@hash"><iaixsl:value-of select="additional/@hash"/></iaixsl:when><iaixsl:otherwise>0</iaixsl:otherwise></iaixsl:choose>][]</iaixsl:attribute>
														</input>
													</div>
													<a href="#addMoreFile" class="add__file btn --icon-left icon-plus --click">Dodaj plik</a>
												</div>
												<div class="basket__add --save">
													<button class="add__save --submit" type="submit">
														<span class="save__button --mobile btn --solid --large d-md-none">Zapisz opis i załącznik</span>
														<span class="save__button --desktop btn --solid d-none d-md-inline-block">Zapisz opis i załącznik</span>
													</button>
												</div>
											</div>
										</iaixsl:if>
									</div>


										
										<iaixsl:if test="comment">
											<div class="basket__param --comment d-md-none">
												<a href="#editComment" class="param__label d-block --click">
													<iaixsl:value-of disable-output-escaping="yes" select="comment"/>
												</a>
											</div>
										</iaixsl:if>

										
										<iaixsl:if test="order_files/file">
											<div class="basket__param --files d-md-none">
												<iaixsl:for-each select="order_files/file">
													<div class="preview__wrapper">
														<a class="preview__button btn --icon-left --secondary icon-link --click" href="#previewFile">
															<iaixsl:choose>
																<iaixsl:when test="@preview = 'true'">
																	<iaixsl:attribute name="rel"><iaixsl:value-of select="@path"/></iaixsl:attribute>
																</iaixsl:when>
																<iaixsl:otherwise>
																	<iaixsl:attribute name="href"><iaixsl:value-of select="@path"/></iaixsl:attribute>
																	<iaixsl:attribute name="target">_blank</iaixsl:attribute>
																</iaixsl:otherwise>
															</iaixsl:choose>
															<span><iaixsl:value-of select="@file"/></span>
														</a>
														<a class="preview__button --delete btn icon-remove --click">
															<iaixsl:attribute name="href"><iaixsl:value-of select="@delete_link"/></iaixsl:attribute>
															<iaixsl:attribute name="title">Usuń plik</iaixsl:attribute>
															<span/>
														</a>
													</div>
												</iaixsl:for-each>
											</div>
										</iaixsl:if>
								</div>
							</iaixsl:for-each>
						</div>
					</iaixsl:otherwise>
				</iaixsl:choose>

				
				<div class="basket__checkbox_tools d-md-none">
					<div class="basket__checkbox_tools_wrapper">
						<div class="f-group --checkbox mb-0">
							<input type="checkbox" class="basket__select_all_checkbox f-control" id="basket_select_all_checkbox">
								<iaixsl:attribute name="value"><iaixsl:value-of select="@id"/></iaixsl:attribute>
							</input>
							<label class="basket__select_all_checkbox_label f-label" for="basket_select_all_checkbox">
								<span>Wybierz wszystkie</span>
							</label>
						</div>
						<a href="#removeSelected" class="tool__button --remove-selected btn  --click">
						<i class=" icon-remove mr-2"></i>
							<iaixsl:choose>
								<iaixsl:when test="count(/shop/page/basket-details/product) = 1">
									Usuń
								</iaixsl:when>
								<iaixsl:otherwise>
									Usuń wybrane
								</iaixsl:otherwise>
							</iaixsl:choose>
						</a>
					</div>
				</div>

				
				<div class="basket__tools">
					<a href="#removeAll" class="tool__button --remove-all btn  --click"><i class="--icon-left icon-trash mr-2"></i>Opróżnij koszyk </a>
					<a href="#addToFavorite" class="tool__button --add-to-favorite btn  --click"><i class="--icon-left icon-file-empty mr-2"></i>Zapisz cały koszyk w liście zakupowej</a>
					<a href="#addWrapper" class="tool__button --add-wrapper btn --click"><i class="--icon-left icon-gift mr-2"></i>Wybierz opakowanie</a>
				</div>

				
				<iaixsl:choose>
					<iaixsl:when test="/shop/page/basket-details/rebate_local/active/selected/product/@id = /shop/page/basket-details/rebate_local/active/products/product/@id">
						<div class="basket__gift_inputs d-none">
							<input type="hidden" name="product[0]">
								<iaixsl:attribute name="value"><iaixsl:value-of select="/shop/page/basket-details/rebate_local/active/selected/product/@id"/></iaixsl:attribute>
							</input>
							<input type="hidden" name="size[0]">
								<iaixsl:attribute name="value"><iaixsl:value-of select="/shop/page/basket-details/rebate_local/active/selected/product/@size"/></iaixsl:attribute>
							</input>
							<input type="hidden" name="set_quantity[0]" value="1"/>
							<input type="hidden" name="gift[0]" value="1"/>
						</div>
					</iaixsl:when>
					<iaixsl:when test="/shop/page/basket-details/rebate_local/selected/@product">
						<div class="basket__gift_inputs d-none">
							<iaixsl:attribute name="data-nogiftforyou">true</iaixsl:attribute>
							<input type="hidden" name="product[0]">
								<iaixsl:attribute name="value"><iaixsl:value-of select="/shop/page/basket-details/rebate_local/selected/@product"/></iaixsl:attribute>
							</input>
							<input type="hidden" name="size[0]">
								<iaixsl:attribute name="value"><iaixsl:value-of select="/shop/page/basket-details/rebate_local/selected/@size"/></iaixsl:attribute>
							</input>
							<input type="hidden" name="set_quantity[0]" value="0"/>
							<input type="hidden" name="gift[0]" value="1"/>
						</div>
					</iaixsl:when>
				</iaixsl:choose>

				
				<iaixsl:if test="/shop/allow_division_order/@is_active = 'true' and not(count(page/basket-details/product[@division='later']) = 0 or count(page/basket-details/product[@division='now']) = 0)">
					<div class="basket__division mb-2 mb-md-4">
						<iaixsl:attribute name="data-weeks"><iaixsl:value-of select="/shop/basket/shipping_division_time/@week_amount"/></iaixsl:attribute>
						<iaixsl:attribute name="data-days"><iaixsl:value-of select="/shop/basket/shipping_division_time/@days"/></iaixsl:attribute>
						<iaixsl:attribute name="data-week_day"><iaixsl:value-of select="/shop/basket/shipping_division_time/@week_day"/></iaixsl:attribute>
						<iaixsl:attribute name="data-today"><iaixsl:value-of select="/shop/basket/shipping_division_time/@today"/></iaixsl:attribute>
						<div class="basket__division_container p-4">
							<h3 class="basket__division_headline mb-5">Zauważyliśmy, że w Twoim zamówieniu są produkty dostępne od ręki i na zamówienie.</h3>
							<div class="basket__division_options d-sm-block d-md-flex">
								<div class="basket__division_icon"><i class="icon-division"/></div>
								<div class="basket__division_option --not-divide">
									<div class="basket__division_group f-group --radio mb-0">
										<input type="radio" id="division_no" name="allow_division_order" value="no" class="f-control">
											<iaixsl:if test="/shop/allow_division_order/@turn_on = 'no'"><iaixsl:attribute name="checked">checked</iaixsl:attribute></iaixsl:if>
										</input>
										<label class="f-label basket__division_label" for="division_no"><strong>Poczekam na skompletowanie zamówienia.</strong><span class="basket__division_option_small d-block mt-1">Sklep skompletuje i wyśle na raz wszystkie produkty z zamówienia.</span>
											<div class="basket__division_option_info --not-divide mt-3 pt-2">Produkty z dłuższym czasem oczekiwania - gotowe do wysłania <span class="basket__division_literal">za </span><strong class="basket__division_weeks"/></div>
										</label>
									</div>
								</div>
								<div class="basket__division_option --divide">
									<div class="basket__division_group f-group --radio mb-0">
										<input type="radio" id="division_yes" name="allow_division_order" value="yes" class="f-control">
											<iaixsl:if test="/shop/allow_division_order/@turn_on = 'yes'"><iaixsl:attribute name="checked">checked</iaixsl:attribute></iaixsl:if>
										</input>
										<label class="f-label basket__division_label" for="division_yes"><strong>Chcę otrzymać szybciej dostępne produkty.</strong><span class="basket__division_option_small d-block mt-1">Produkty dostępne od ręki sklep wyśle od razu, a inne dopiero po ich skompletowaniu.</span>
											<div class="basket__division_option_info --divide mt-3 pt-2">Produkty od ręki - gotowe do wysłania <strong>dzisiaj</strong></div>
										</label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</iaixsl:if>
			</form>

			
			<div class="basket__wrappers"/>

			
			<iaixsl:if test="/shop/basket/delay_time/@unknown_delivery_time = 'true'">
				<div class="unknown_delivery_time">
					<i class="icon-truck"/>
					<div>
						<b>W koszyku jest towar sprowadzany na zamówienie.</b> Aby oszacować czas przygotowania zamówienia do wysyłki,
						<a target="_blank">
							<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/contact/link/@url"/></iaixsl:attribute>
							skontaktuj się z obsługą sklepu.
						</a>
					</div>
				</div>
			</iaixsl:if>
		</section>

		<iaixsl:if test="/shop/basket/shipping_time"> </iaixsl:if>
		<iaixsl:if test="/shop/page/basket-details/product/price/@detalprice_net_formatted"> </iaixsl:if>
		<iaixsl:if test="/shop/page/basket-details/product/price/@maxprice_formatted"> </iaixsl:if>
		<iaixsl:if test="/shop/page/basket-details/product/price/@maxprice_net_formatted"> </iaixsl:if>
		<iaixsl:if test="/shop/page/basket-details/product/@code"> </iaixsl:if>
		<iaixsl:if test="/shop/page/basket-details/product/price//price/@points"> </iaixsl:if>
		<iaixsl:if test="/shop/page/basket-details/product/size/@name"> </iaixsl:if>
		<iaixsl:if test="/shop/basket/@product_comment_active"> </iaixsl:if>
	</iaixsl:if>
<!-- (basketedit_summary, 61f913c92b1998.60476813.8)-->
	<iaixsl:variable name="txt_60826_advance_a">Zaliczka wymagana przy zamówieniu z płatnością przy odbiorze:</iaixsl:variable>
	<iaixsl:variable name="txt_60826_advance_header">Jak wygląda u nas zamówienie z zaliczką?</iaixsl:variable>
	<iaixsl:variable name="show_always_instalment_68242"/>
	<iaixsl:variable name="hours_68242"/>

	
	<script>
		var currency_format = &apos;&apos;;
		<iaixsl:if test="/shop/currency/option[@selected='true']/@currency_format">
			var currency_format = &apos;<iaixsl:value-of select="/shop/currency/option[@selected='true']/@currency_format"/>&apos;;
		</iaixsl:if>
		var currency_before_value = &apos;&apos;;
		<iaixsl:if test="/shop/currency/option[@selected='true']/@currency_before_value">
			var currency_before_value = <iaixsl:value-of select="/shop/currency/option[@selected='true']/@currency_before_value"/>;
		</iaixsl:if>
		var currency_space = &apos;&apos;;
		<iaixsl:if test="/shop/currency/option[@selected='true']/@currency_space">
			var currency_space = <iaixsl:value-of select="/shop/currency/option[@selected='true']/@currency_space"/>;
		</iaixsl:if>
		var currency_decimal_separator = &apos;<iaixsl:value-of select="/shop/currency/option[@selected='true']/@currency_decimal_separator"/>&apos;;
		var currency_grouping_separator = &apos;<iaixsl:value-of select="/shop/currency/option[@selected='true']/@currency_grouping_separator"/>&apos;;
		var symbol = &apos;<iaixsl:value-of select="/shop/currency/option[@selected='true']/@symbol"/>&apos;;
	</script>

	<iaixsl:if test="page/@type = 'basketedit'">
		<iaixsl:variable name="wholesaler_shipping_gross"/>

		<div class="basketedit_summary_container">
			<div class="basketedit_summary">
				<div class="basketedit_summary_sub">
					<iaixsl:attribute name="class">basketedit_summary_sub</iaixsl:attribute>
					
					<iaixsl:if test="count(/shop/page/basket-details/product) = count(/shop/page/basket-details/product[@product_type='product_virtual']) or (count(/shop/page/basket-details/product) = count(/shop/page/basket-details/product[@product_type='product_bundle']) and not(count(/shop/page/basket-details/product[@product_type='product_bundle']/bundled/product[@product_type = 'product_virtual']) = 0))">
						<span class="only_virtual">Pliki do pobrania pojawią się w dziale <a><iaixsl:attribute name="href"><iaixsl:value-of select="/shop/client_files/@link_to_download"/></iaixsl:attribute>&quot;Moje pliki&quot;</a> w panelu klienta po zrealizowaniu całego zamówienia.</span>
					</iaixsl:if>
					<div class="basketedit_summary_left">
					
						<iaixsl:if test="/shop/basket/delivery_time/@days and not(/shop/basket/@shipping_undefined = 'true') and not(/shop/basket/delay_time/@unknown_delivery_time = 'true')">
							<div class="summary_delivery_time">
								<span class="summary_delivery_time__icon"/>
								<span class="summary_delivery_time__info">
									<span class="summary_delivery_time__text">Przewidywana dostawa - </span>
									<strong class="summary_delivery_time__time">
										<span class="summary_delivery_time__week_day">
											<iaixsl:choose>
												<iaixsl:when test="/shop/basket/delivery_time/@today = 'true'">
													Dzisiaj
												</iaixsl:when>
												<iaixsl:when test="/shop/basket/delivery_time/@week_day = 1">
													Poniedziałek
												</iaixsl:when>
												<iaixsl:when test="/shop/basket/delivery_time/@week_day = 2">
													Wtorek
												</iaixsl:when>
												<iaixsl:when test="/shop/basket/delivery_time/@week_day = 3">
													Środa
												</iaixsl:when>
												<iaixsl:when test="/shop/basket/delivery_time/@week_day = 4">
													Czwartek
												</iaixsl:when>
												<iaixsl:when test="/shop/basket/delivery_time/@week_day = 5">
													Piątek
												</iaixsl:when>
												<iaixsl:when test="/shop/basket/delivery_time/@week_day = 6">
													Sobota
												</iaixsl:when>
												<iaixsl:when test="/shop/basket/delivery_time/@week_day = 7">
													Niedziela
												</iaixsl:when>
											</iaixsl:choose>
										</span>
										<iaixsl:if test="not(/shop/basket/delivery_time/@week_amount = 0)">
											<iaixsl:variable name="delivery_time"><iaixsl:value-of select="/shop/basket/delivery_time/@time"/></iaixsl:variable>
											<iaixsl:variable name="delivery_time_month_day"><iaixsl:value-of select="substring($delivery_time, 6, 5)"/></iaixsl:variable>
											<iaixsl:variable name="dalivery_time_formatted"><iaixsl:value-of select="substring-after($delivery_time_month_day, '-')"/>.<iaixsl:value-of select="substring-before($delivery_time_month_day, '-')"/></iaixsl:variable>
											<span class="summary_delivery_time__date_wrapper"> (<span class="summary_delivery_time__date"><iaixsl:value-of select="$dalivery_time_formatted"/></span>)</span>
										</iaixsl:if>
									</strong>
								</span>
							</div>
						</iaixsl:if>

						
						<iaixsl:if test="$txt_60826_advance_a and (/shop/page/basket-details/summary/money/@advance_mode = 'total' and /shop/page/basket-details/summary/money/@prepaid = 'true' and /shop/page/basket-details/summary/money/@advance &gt; 0)">
							<div class="summary_left_advance">
								<iaixsl:if test="$txt_60826_advance_header">
									<div class="summary_left_advance_header">
										<iaixsl:value-of select="$txt_60826_advance_header"/>
									</div>
								</iaixsl:if>
								Przed realizacją zamówienia z płatnością za przedpłatą wymagane jest wpłacenie zaliczki, na którą składa się część ceny towarów do sprowadzenia na zamówienie, całość ceny towarów dostępnych w naszych magazynach oraz koszt wysyłki wybranej w dalszym etapie procesu składania zamówienia.
							</div>
						</iaixsl:if>

						
						<iaixsl:if test="basket/@toshippingfree&gt; 0 and not(basket/@toshippingfree= '')">
							<div class="toshippingfree">
								<div class="toshippingfree_sub">DARMOWA DOSTAWA od 
									<span class="price"><iaixsl:value-of select="basket/@shippinglimitfree_formatted"/></span><iaixsl:if test="$wholesaler_shipping_gross"> <iaixsl:value-of select="$wholesaler_shipping_gross"/></iaixsl:if></div>

								Brakuje Ci tylko 
								<b><iaixsl:value-of select="/shop/basket/@toshippingfree_formatted"/></b><iaixsl:if test="$wholesaler_shipping_gross"> <iaixsl:value-of select="$wholesaler_shipping_gross"/></iaixsl:if>, aby ją otrzymać.
							</div>
						</iaixsl:if>

						
						<iaixsl:if test="/shop/client_data/client_balance/limit/@value &gt; '0'">
							<div class="basketedit_limit_section">
								<div class="basketedit_product_summary">
									<label>
										Limit zadłużenia:
									</label>
									<strong class="limit_total">
										<iaixsl:value-of select="/shop/client_data/client_balance/limit/@value_formatted"/>
									</strong>
								</div>

								<div class="basketedit_product_summary">
									<label>
										Pozostały limit kredytowy:
									</label>
									<strong class="limit_touse">
										<iaixsl:value-of select="/shop/client_data/client_balance/limit/@to_use_formatted"/>
									</strong>
								</div>
							</div>
						</iaixsl:if>

						<iaixsl:if test="(page/basket-details/summary/points/@debit) and (page/basket-details/summary/points/@debit &gt; 0)">
							<div class="basketedit_summary_debit">
								Po opłaceniu tego zamówienia zyskasz 
								<b><iaixsl:value-of select="page/basket-details/summary/points/@debit"/><span> pkt.</span></b> w programie lojalnościowym.
								<iaixsl:if test="/shop/basket/@client_points != '0'">
									Obecnie na swoim koncie masz 
									<b><iaixsl:value-of select="/shop/basket/@client_points"/><span> pkt.</span></b>
								</iaixsl:if>
							</div>
						</iaixsl:if>

					</div>

					<div class="basketedit_summary_right">
						<div class="basketedit_calculations">
							<div class="basketedit_product_summary">
								<label>
									Wartość zamówienia:
								</label>

								<strong>
									<iaixsl:value-of select="/shop/page/basket-details/summary/money/@beforerebate_formatted"/>
								</strong>
							</div>

							<iaixsl:if test="not((basket/@shipping_undefined = 'true') or (basket/@hide_shipping_cost = 'true') or (basket/@hide_cost='true'))">
								<div class="basketedit_product_summary">
									<iaixsl:if test="not(basket/@shipping_after_rebate &gt; '0' or basket/@shipping = '')">
										<iaixsl:attribute name="class">basketedit_product_summary d-none</iaixsl:attribute>
									</iaixsl:if>
									<label>
										<iaixsl:choose>
											<iaixsl:when test="basket/@shipping_after_rebate &gt; '0'">
												Koszt przesyłki od: 
											</iaixsl:when>
											<iaixsl:otherwise>
												Koszt przesyłki:
											</iaixsl:otherwise>
										</iaixsl:choose>
									</label>

									<strong>
										<iaixsl:if test="not(basket/@shipping &gt; basket/@shipping_after_rebate) and basket/@shipping_after_rebate &gt; '0'">
											<iaixsl:attribute name="class">plus_sign</iaixsl:attribute>
										</iaixsl:if>

										<iaixsl:if test="basket/@shipping &gt; basket/@shipping_after_rebate">
											<span>
												<iaixsl:if test="basket/@shipping_after_rebate &gt; '0'"><iaixsl:attribute name="class">plus_sign</iaixsl:attribute></iaixsl:if>
												<del>
													<iaixsl:value-of select="basket/@shipping_formatted"/>
												</del><iaixsl:text> </iaixsl:text>
											</span>
										</iaixsl:if>

										<iaixsl:choose>
											<iaixsl:when test="basket/@shipping_after_rebate &gt; '0'">
												<iaixsl:value-of select="basket/@shipping_after_rebate_formatted"/>
											</iaixsl:when>
											<iaixsl:when test="basket/@shipping = ''">
												b/d
											</iaixsl:when>
											<iaixsl:otherwise>
												gratis!
											</iaixsl:otherwise>
										</iaixsl:choose>
									</strong>
								</div>
							</iaixsl:if>

							<iaixsl:if test="/shop/page/basket-details/summary/money/@total_rebate&gt;0">
								<div class="basketedit_rabats_summary">
									<label>
										Rabat:
									</label>

									<strong class="minus_sign">
										<iaixsl:value-of select="/shop/page/basket-details/summary/money/@total_rebate_formatted"/>
									</strong>
								</div>
							</iaixsl:if>

							<iaixsl:variable name="balance_to_pay"><iaixsl:value-of select="/shop/page/basket-details/summary/money/@balance_to_pay"/></iaixsl:variable>

							<iaixsl:if test="$balance_to_pay">
								<div class="basketedit_product_summary">
									<iaixsl:if test="/shop/page/basket-details/summary/money/@balance_to_pay">
										<iaixsl:choose>
											<iaixsl:when test="$balance_to_pay &gt; 0">
												<label>
													Opłacone z salda:<br/>(nadpłata na koncie klienta)
												</label>

												<strong class="saldo_value minus_sign">
													<iaixsl:value-of select="/shop/page/basket-details/summary/money/@balance_to_pay_formatted"/>
												</strong>
											</iaixsl:when>
											<iaixsl:when test="not($balance_to_pay &gt; 0) and not($balance_to_pay = '0.00')">
												<label>
													Opłacone z salda:<br/>(niedopłata na koncie klienta)
												</label>

												<strong class="saldo_value plus_sign">
													<iaixsl:value-of select="substring-after(/shop/page/basket-details/summary/money/@balance_to_pay_formatted, '-')"/>
												</strong>
											</iaixsl:when>
										</iaixsl:choose>
									</iaixsl:if>
								</div>
							</iaixsl:if>
						</div>

						<div class="basketedit_total_summary">
							<label>
								Do zapłaty:
							</label>

							<strong><iaixsl:value-of select="/shop/page/basket-details/summary/money/@to_pay_formatted"/><iaixsl:if test="not($priceTypeVat = '')"><span class="price_vat"> brutto</span></iaixsl:if></strong>
							<iaixsl:if test="(basket/@points_used) and (basket/@points_used != 0)">
								<b>
										+ 
									<span><iaixsl:value-of select="basket/@points_used"/> pkt.</span>
								</b>
							</iaixsl:if>
						</div>

						
						<iaixsl:if test="$txt_60826_advance_a and (/shop/page/basket-details/summary/money/@advance &gt; 0)">
							<div class="basketedit_product_summary advance">
								<iaixsl:choose>
									<iaixsl:when test="/shop/page/basket-details/summary/money/@advance_mode = 'default' or /shop/page/basket-details/summary/money/@advance_mode = 'none'">
										<iaixsl:choose>
											<iaixsl:when test="/shop/page/basket-details/summary/money/@cash_on_delivery = 'true' and /shop/page/basket-details/summary/money/@prepaid = 'false'">
												<label class="txt_wrap">Zaliczka wymagana przy zamówieniu z płatnością przy odbiorze:</label>
												<strong><iaixsl:value-of select="/shop/page/basket-details/summary/money/@advance_formatted"/></strong>
											</iaixsl:when>
											<iaixsl:when test="/shop/page/basket-details/summary/money/@cash_on_delivery = 'false' and /shop/page/basket-details/summary/money/@prepaid = 'true'">
												<label class="txt_wrap">Zaliczka wymagana przy zamówieniu za przedpłatą:</label>
												<strong><iaixsl:value-of select="/shop/page/basket-details/summary/money/@advance_formatted"/></strong>
											</iaixsl:when>
											<iaixsl:when test="/shop/page/basket-details/summary/money/@cash_on_delivery = 'true' and /shop/page/basket-details/summary/money/@prepaid = 'true'">
												<label class="txt_wrap">Wymagana zaliczka:</label>
												<strong><iaixsl:value-of select="/shop/page/basket-details/summary/money/@advance_formatted"/></strong>
											</iaixsl:when>
										</iaixsl:choose>
									</iaixsl:when>
									<iaixsl:when test="/shop/page/basket-details/summary/money/@advance_mode = 'total'">
										<label class="txt_wrap">Wymagana zaliczka:</label>
										<strong><iaixsl:value-of select="/shop/page/basket-details/summary/money/@advance_formatted"/></strong>
									</iaixsl:when>
								</iaixsl:choose>
							</div>
						</iaixsl:if>

					</div>

					
					<iaixsl:variable name="turnOnSmile">true</iaixsl:variable>
					<iaixsl:if test="/shop/page/basket-details/summary/payment/instalment or /shop/page/basket-details/summary/payment/delayed[@id = '203'] or (/shop/page/basket-details/summary/smile and not($turnOnSmile = ''))">
						<div class="basketedit_summary_bottom">
							
							<iaixsl:if test="/shop/page/basket-details/summary/payment/delayed[@id = '203']">
								<div class="paypo_basket">
									<span class="paypo_basket__item">
										<span class="paypo_basket__img">
											<iaixsl:if test="/shop/page/basket-details/summary/payment/delayed[@id = '203']/@gfx_small">
												<img>
													<iaixsl:attribute name="src"><iaixsl:value-of select="/shop/page/basket-details/summary/payment/delayed[@id = '203']/@gfx_small"/></iaixsl:attribute>
													<iaixsl:attribute name="alt"><iaixsl:value-of select="/shop/page/basket-details/summary/payment/delayed[@id = '203']/@name"/></iaixsl:attribute>
												</img>
											</iaixsl:if>
										</span>
										<span class="paypo_basket__text">
											<strong>Odroczone płatności.</strong> Kup teraz, zapłać za 30 dni,<br/>jeżeli nie dokonasz zwrotu towaru.
											<a href="#more" class="paypo_basket__link">Więcej informacji</a>
										</span>
									</span>
								</div>
								<div class="paypo_info">
									<h6 class="headline">
										<span class="headline__name">Kup teraz, zapłać później - 4 kroki</span>
									</h6>
									<div class="paypo_info__block">
										<div class="paypo_info__item --first">
											<span class="paypo_info__text">Przy wyborze formy płatności, wybierz PayPo.</span>
											<iaixsl:if test="/shop/page/basket-details/summary/payment/delayed[@id = '203']/@gfx">
												<span class="paypo_info__img">
													<img>
														<iaixsl:attribute name="src"><iaixsl:value-of select="/shop/page/basket-details/summary/payment/delayed[@id = '203']/@gfx"/></iaixsl:attribute>
														<iaixsl:attribute name="alt"><iaixsl:value-of select="/shop/page/basket-details/summary/payment/delayed[@id = '203']/@name"/></iaixsl:attribute>
													</img>
												</span>
											</iaixsl:if>
										</div>
										<div class="paypo_info__item --second">
											<span class="paypo_info__text">PayPo opłaci twój rachunek w sklepie.<br/>Na stronie PayPo sprawdź swoje dane i podaj pesel.</span>
										</div>
										<div class="paypo_info__item --third">
											<span class="paypo_info__text">Po otrzymaniu zakupów decydujesz co ci pasuje, a co nie. Możesz zwrócić część albo całość zamówienia - wtedy zmniejszy się też kwota do zapłaty PayPo.</span>
										</div>
										<div class="paypo_info__item --fourth">
											<span class="paypo_info__text">W ciągu 30 dni od zakupu płacisz PayPo za swoje zakupy <strong>bez żadnych dodatkowych kosztów</strong>. Jeśli chcesz, rozkładasz swoją płatność na raty.</span>
										</div>
									</div>
								</div>
							</iaixsl:if>

							
							<iaixsl:if test="page/basket-details/summary/payment/instalment">
								<div id="instalment_payment_basket" class="instalment_payment_basket">
									<iaixsl:choose>
										<iaixsl:when test="count(/shop/page/basket-details/summary/payment/instalment) = 1">
											<iaixsl:for-each select="/shop/page/basket-details/summary/payment/instalment">
												<a class="instalment_payment_basket__element --link">
													<iaixsl:attribute name="onclick">event.stopPropagation(); calculate_instalments(&apos;<iaixsl:value-of select="@minprice"/>&apos;,&apos;<iaixsl:value-of select="@maxprice"/>&apos;,&apos;<iaixsl:value-of select="@priceTotal"/>&apos;,&apos;<iaixsl:value-of select="@alert"/>&apos;,$(this).attr(&apos;data-window&apos;),&apos;<iaixsl:value-of select="@maxquantity"/>&apos;,&apos;<iaixsl:value-of select="@name"/>&apos;); return false;</iaixsl:attribute>
													<iaixsl:attribute name="href">javascript:<iaixsl:value-of select="@calculate"/></iaixsl:attribute>
													<iaixsl:attribute name="data-window"><iaixsl:value-of select="@calculate"/></iaixsl:attribute>
													<div class="instalment_payment_basket__img_container">
														<img src="/gfx/standards/instalment_basket.svg?r=1696937716" class="instalment_payment_basket__img"/>
													</div>
													<div class="instalment_payment_basket__text_container">
														<span class="instalment_payment_basket__label">
															<iaixsl:choose>
																<iaixsl:when test="@value_formatted">
																	Możesz zapłacić ratalnie, z ratą już od <b><iaixsl:value-of select="@value_formatted"/></b> miesięcznie
																</iaixsl:when>
																<iaixsl:otherwise>
																	Możesz zapłacić ratalnie
																</iaixsl:otherwise>
															</iaixsl:choose>
														</span>
														<span class="instalment_payment_basket__small">Raty możesz wybrać w następnym kroku podczas wyboru form płatności.</span>
													</div>
												</a>
											</iaixsl:for-each>
										</iaixsl:when>
										<iaixsl:otherwise>
											<iaixsl:variable name="lowest_instalment_price">
												<iaixsl:for-each select="/shop/page/basket-details/summary/payment/instalment">
													<iaixsl:sort select="number(@value)" order="ascending"/>
													<iaixsl:value-of select="@value_formatted"/>
												</iaixsl:for-each>
											</iaixsl:variable>
											<div class="instalment_payment_basket__element">
												<div class="instalment_payment_basket__img_container">
													<img src="/gfx/standards/instalment_basket.svg?r=1696937716" class="instalment_payment_basket__img"/>
												</div>
												<div class="instalment_payment_basket__text_container">
													<span class="instalment_payment_basket__label">
														<iaixsl:choose>
															<iaixsl:when test="/shop/page/basket-details/summary/payment/instalment/@value_formatted and /shop/page/basket-details/summary/payment/instalment/@value_formatted != ''">
																Możesz zapłacić ratalnie, z ratą już od <b><iaixsl:value-of select="$lowest_instalment_price[1]"/></b> miesięcznie
															</iaixsl:when>
															<iaixsl:otherwise>
																Możesz zapłacić ratalnie
															</iaixsl:otherwise>
														</iaixsl:choose>
													</span>
													<span class="instalment_payment_basket__small">Raty możesz wybrać w następnym kroku podczas wyboru form płatności.</span>
												</div>
											</div>
										</iaixsl:otherwise>
									</iaixsl:choose>
								</div>
							</iaixsl:if>

							
							<iaixsl:if test="/shop/page/basket-details/summary/smile and not($turnOnSmile = '')">
								<div class="smile_basket">
									<div class="smile_basket__block --main">
										<img class="smile_basket__logo" src="/gfx/standards/smile_logo.svg?r=1696937716">
											<iaixsl:attribute name="alt">Kupujesz i dostawę masz gratis!</iaixsl:attribute>
										</img>
										<span class="smile_basket__inpost">
											<span class="smile_basket__inpost_text">Darmowa dostawa do paczkomatu</span>
											<img class="smile_basket__inpost_logo" src="/gfx/standards/logo_inpost.svg?r=1696937716">
												<iaixsl:attribute name="alt"><iaixsl:value-of select="/shop/page/basket-details/summary/smile/delivery/@name"/></iaixsl:attribute>
											</img>
										</span>
										<a class="smile_basket__link" href="#more">Więcej informacji</a>
									</div>
									<div class="smile_basket__block --desc">
										<span class="smile_basket__desc_before">Smile - dostawy ze sklepów internetowych przy zamówieniu od </span>
										<span class="smile_basket__price"><iaixsl:value-of select="/shop/page/basket-details/summary/smile/delivery/@minprice_formatted"/></span>
										<span class="smile_basket__desc_after"> są za darmo.</span>
									</div>
								</div>
								<div class="smile_info">
									<h6 class="headline">
										<span class="headline__name">Kupujesz i dostawę masz gratis!</span>
									</h6>
									<div class="smile_info__item --smile">
										<img class="smile_info__logo" src="/gfx/standards/smile_logo.svg?r=1696937716">
											<iaixsl:attribute name="alt">Kupujesz i dostawę masz gratis!</iaixsl:attribute>
										</img>
										<div class="smile_info__sub">
											<span class="smile_info__text">
												dostawy ze sklepów internetowych przy
											</span>
											<strong class="smile_info__strong">
												zamówieniu za 
												<span class="smile_info__price"><iaixsl:value-of select="/shop/page/basket-details/summary/smile/delivery/@minprice_formatted"/></span>
													są za darmo.
											</strong>
										</div>
									</div>
									<div class="smile_info__item --inpost">
										<span class="smile_info__text">
											Darmowa dostawa obejmuje dostarczenie przesyłki do paczkomatu
										</span>
										<img class="smile_info__inpost_logo" src="/gfx/standards/logo_inpost.svg?r=1696937716">
											<iaixsl:attribute name="alt"><iaixsl:value-of select="/shop/page/basket-details/summary/smile/delivery/@name"/></iaixsl:attribute>
										</img>
									</div>
									<div class="smile_info__item --footer">
										<span class="smile_info__iai">Smile to usługa IdoSell</span>
										<img src="/gfx/standards/smile_info_iai.svg?r=1696937716">
											Smile to usługa IdoSell
										</img>
									</div>
								</div>
							</iaixsl:if>
						</div>
					</iaixsl:if>
				</div>
			</div>

      <div class="basketedit_summary_buttons">
        <iaixsl:variable name="isOneClick"><iaixsl:if test="/shop/oneclick/payment and not(/shop/page/communicates/warning[@type = 'order_tomuch']) and not(/shop/page/basket-details/product[name = ''])">true</iaixsl:if></iaixsl:variable>
        <iaixsl:variable name="isExpressCheckout"><iaixsl:if test="not(count(/shop/expressCheckout/payment[@id = 'idoPay']) = 0) and not(/shop/page/communicates/warning[@type = 'order_tomuch']) and (/shop/allow_division_order/@is_active = 'false' or count(page/basket-details/product[@division='later']) = 0 or count(page/basket-details/product[@division='now']) = 0 or /shop/allow_division_order/@turn_on = 'no')">true</iaixsl:if></iaixsl:variable>
        
        <iaixsl:if test="$isExpressCheckout = 'true'">
          <div class="basketedit_summary_buttons__item --express-checkout basketedit_express_checkout">
						<iaixsl:if test="/shop/page/basket-details/product[@product_type = 'product_virtual']">
							<iaixsl:attribute name="data-virtual-product">true</iaixsl:attribute>
						</iaixsl:if>
						<iaixsl:if test="/shop/page/basket-details/product[@product_type = 'product_service']">
							<iaixsl:attribute name="data-service-product">true</iaixsl:attribute>
						</iaixsl:if>
            <div class="basketedit_express_checkout__wrapper">
              <button class="basketedit_express_checkout__button btn --solid --large" id="basketedit_express_checkout" type="button">
                <iaixsl:if test="/shop/client_data/express_checkout_login/@login">
                  <iaixsl:attribute name="data-login"><iaixsl:value-of select="/shop/client_data/express_checkout_login/@login"/></iaixsl:attribute>
                </iaixsl:if>
                <iaixsl:if test="/shop/expressCheckout/payment[@id = 'idoPay']/@type">
                  <iaixsl:attribute name="data-type"><iaixsl:value-of select="/shop/expressCheckout/payment[@id = 'idoPay']/@type"/></iaixsl:attribute>
                </iaixsl:if>
                <span>Kup teraz</span>
              </button>
            </div>
          </div>
        </iaixsl:if>
        
        <div class="basketedit_summary_buttons__item --next">
          <a class="btn --solid --large" href="/order1.php" id="basket_go_next"><iaixsl:if test="$isExpressCheckout = 'true'"><iaixsl:attribute name="class">btn --outline --large</iaixsl:attribute></iaixsl:if><iaixsl:if test="/shop/page/communicates/warning/@type='order_minimal_wholesale_blocked'"><iaixsl:attribute name="data-disabled">true</iaixsl:attribute><iaixsl:attribute name="onclick">Alertek.show_alert(&apos;Minimalna wartość zakupów hurtowych wynosi: <iaixsl:if test="$signbeforeprice = 'true'"><iaixsl:value-of select="/shop/currency/@name"/><iaixsl:value-of select="$signbetweenpricecurrency"/></iaixsl:if><iaixsl:value-of select="/shop/page/communicates/warning/@value"/><iaixsl:if test="$signbeforeprice = 'false'"><iaixsl:value-of select="$signbetweenpricecurrency"/><iaixsl:value-of select="/shop/currency/@name"/></iaixsl:if>&apos;);</iaixsl:attribute></iaixsl:if>Przejdź dalej</a>
        </div>
        
        <iaixsl:if test="$isOneClick = 'true'">
          <div class="basketedit_summary_buttons__item --oneclick basketedit_oneclick">
            <iaixsl:attribute name="data-lang"><iaixsl:value-of select="/shop/language/option[@selected ='true']/@id"/></iaixsl:attribute>
            <div class="basketedit_oneclick__label">
              <div class="basketedit_oneclick__info">
                <span class="basketedit_oneclick__text --fast">Szybkie zakupy <strong>1-Click</strong></span>
                <span class="basketedit_oneclick__text --registration">(bez rejestracji)</span>
              </div>
            </div>
            <div class="basketedit_oneclick__items">
              <iaixsl:for-each select="/shop/oneclick/payment">
                <div>
                  <iaixsl:attribute name="class">basketedit_oneclick__item --<iaixsl:value-of select="@id"/><iaixsl:if test="@preloading"> --loading</iaixsl:if></iaixsl:attribute>
                  <iaixsl:attribute name="title">Kliknij i kup bez potrzeby rejestracji z <iaixsl:value-of select="@name"/></iaixsl:attribute>
                  <iaixsl:attribute name="id">oneclick_<iaixsl:value-of select="@id"/></iaixsl:attribute>
                  <iaixsl:attribute name="data-id"><iaixsl:value-of select="@id"/></iaixsl:attribute>
                  <iaixsl:if test="not(@basket_only = 'true')">
                    <img class="basketedit_oneclick__icon">
                      <iaixsl:attribute name="src"><iaixsl:value-of select="@icon"/></iaixsl:attribute>
                      <iaixsl:attribute name="alt"><iaixsl:value-of select="@name"/></iaixsl:attribute>
                    </img>
                  </iaixsl:if>
                </div>
              </iaixsl:for-each>
            </div>
          </div>
        </iaixsl:if>
        
        <div class="basketedit_summary_buttons__item --continue">
          <span class="basketedit_summary_buttons__separator">lub</span>
          <a class="basketedit_summary_buttons__go_shopping">
            <iaixsl:attribute name="href">
              <iaixsl:choose>
                <iaixsl:when test="/shop/lastsearch/text()">
                  <iaixsl:value-of select="/shop/lastsearch/text()"/>
                </iaixsl:when>
                <iaixsl:when test="/shop/page/basket-details/direct-navigation/@url">
                  <iaixsl:value-of select="/shop/page/basket-details/direct-navigation/@url"/>
                </iaixsl:when>
                <iaixsl:otherwise>/</iaixsl:otherwise>
              </iaixsl:choose>
            </iaixsl:attribute>
            Kontynuuj zakupy w sklepie
          </a>
        </div>
      </div>
		</div>

	</iaixsl:if>
	<script>
		
		var client_data_uses_vat = &apos;<iaixsl:value-of select="/shop/client_data/@uses_vat"/>&apos;;
	</script>
<!-- (basketedit_rebates, 61b0b16d5ed0b4.70188109.4)-->
		<iaixsl:variable name="showGifts"/>

		<iaixsl:if test="/shop/page/@type = 'basketedit'">
			<iaixsl:variable name="nettoPriceBasketeditRebates"><iaixsl:if test="/shop/page/@price_type = 'net'">true</iaixsl:if></iaixsl:variable>
			<iaixsl:if test="/shop/page/rebates/@rebates_codes = 'y'">
				<div class="basketedit_rebatecodes_outline">
					
					<iaixsl:if test="/shop/page/rebates/code_details/@active = 'y'">
						<div class="basketedit_rebatecode_title">
							<span class="basketedit_rebatecode_title">
								Aktywny kod rabatowy: 
							</span>
							<span class="basketedit_rebatecode_value">
								<iaixsl:value-of select="/shop/page/rebates/code_details/@number"/>
							</span>
							<div class="basketedit_rebatecode_action">
								<a id="a_remove_code" href="#">[usuń kod]</a>
								<a id="a_change_code" href="#">[użyj innego kodu]</a>
							</div>
							<form action="/settings.php?from=basket" method="post" id="change_code">
								<input class="basketedit_rebatecode_input" name="rebates_codes" type="text" value=""/>
								<input id="global_rebates_codes" name="global_rebates_codes" value="add" type="hidden"/>
								<input class="btn --solid basketedit_change_code" type="submit" value="">
									<iaixsl:attribute name="value">Użyj innego kodu</iaixsl:attribute>
								</input>
							</form>
						</div>
						<div class="basketedit_rebatecode_r">
							<iaixsl:if test="/shop/page/rebates/code_details/@min_order &gt; 0">
								<div class="basketedit_rebatecode_title_out">
									<span class="basketedit_rebatecode_title">
										Wymagana wartość produktów w koszyku: 
									</span>
									<span class="basketedit_rebatecode_value">
										<iaixsl:value-of select="/shop/page/rebates/code_details/@min_order"/><iaixsl:value-of select="$signbetweenpricecurrency"/><iaixsl:value-of select="/shop/currency/@name"/>
									</span>
								</div>
							</iaixsl:if>
							<iaixsl:if test="/shop/page/rebates/code_details/@expires">
								<div class="basketedit_rebatecode_title_out">
									<span class="basketedit_rebatecode_title">
										Kod rabatowy ważny do dnia: 
									</span>
									<span class="basketedit_rebatecode_value">
										<iaixsl:value-of select="/shop/page/rebates/code_details/@expires"/>
									</span>
								</div>
							</iaixsl:if>
							<a href="/client-rebate.php" class="btn --solid basketedit_client_rebate" id="basketedit_client_rebate">
								<iaixsl:attribute name="title">Szczegółowy wykaz rabatów</iaixsl:attribute>
								Więcej informacji o przyznanych rabatach
							</a>
						</div>
					</iaixsl:if>
					
					<iaixsl:if test="/shop/page/rebates/code_details/@active = 'n'">
						<iaixsl:if test="/shop/rebate_code_delete_client_advanced_rebate/@active = 'y'">
							<div id="basketedit_rebatecode_activate_info" style="display:none;">
								Wpisywanie kodu rabatowego skasuje rabat przypisany do Twojego konta. 
							</div>
						</iaixsl:if>

						<span class="basketedit_rebatecode_activate_txt">Posiadasz kod rabatowy? </span>

						<form action="/settings.php?from=basket" method="post">
							
							<input onclick="$('#basketedit_rebatecode_activate_info').fadeIn('slow');" class="basketedit_rebatecode_input" name="rebates_codes" type="text" value=""/>
							<input id="global_rebates_codes" name="global_rebates_codes" value="add" type="hidden"/>
							<input class="btn --solid basketedit_submit_code" type="submit" value="">
								<iaixsl:attribute name="value">Zatwierdź kod</iaixsl:attribute>
							</input>
						</form>
						<a href="/client-rebate.php" class="btn --solid basketedit_client_rebate">
							<iaixsl:attribute name="title">Szczegółowy wykaz rabatów</iaixsl:attribute>
							Więcej informacji o rabatach
						</a>
					</iaixsl:if>

				</div>
			</iaixsl:if>


			<iaixsl:if test="(/shop/rebatesLocal and (/shop/rebatesLocal/rebate/@value &gt; 0 )) or /shop/page/basket-details/rebate_local/active/products/product or /shop/page/basket-details/rebate_local/rebates/rebate/products/product or /shop/page/rebates_for_points/rebate">
				<div id="basketedit_gifts" class="bg_alter">

					
					<iaixsl:if test="(/shop/rebatesLocal and (/shop/rebatesLocal/rebate/@value &gt; 0 )) or /shop/rebatecode/@code">
						<div class="basket_rabates col-lg-4 col-md-6 col-12">
							<iaixsl:if test="/shop/page/basket-details/rebate_local/active/products/product or /shop/page/basket-details/rebate_local/rebates/rebate/products/product">
								<iaixsl:attribute name="STYLE">float: right;</iaixsl:attribute>
							</iaixsl:if>

							<iaixsl:if test="/shop/rebatesLocal and (/shop/rebatesLocal/rebate/@value &gt; 0 )">
								<div class="basket_rabates_label">
									Rabaty do zamówienia
								</div>

								<div class="menu_rebates">
									<div class="menu_rebates__block --labels d-flex justify-content-between">
										<div>
											<span>Kwota zamówienia powyżej:</span>
										</div>
										<div class="menu_rebates__value">
											<span>Wartość rabatu:</span>
										</div>
									</div>

									<iaixsl:for-each select="/shop/rebatesLocal/rebate[@value &gt; 0 ]">
										<div class="menu_rebates__block d-flex justify-content-between">
											<iaixsl:if test="@selected = 'selected'">
												<iaixsl:attribute name="class">menu_rebates__block d-flex justify-content-between selected</iaixsl:attribute>
											</iaixsl:if>
											<div class="menu_rebates__threshold">
												<iaixsl:value-of select="format-number(@threshold, '#')"/><iaixsl:text> </iaixsl:text><iaixsl:value-of select="/shop/currency/@name"/><iaixsl:if test="not(@selected = 'selected') and @left &gt; 0"> - <span>Brakuje Ci 
												<iaixsl:value-of select="@left_formatted"/></span></iaixsl:if>
											</div>
											<div class="menu_rebates__value">
												<iaixsl:if test="@selected = 'selected'">
													<strong>Twój rabat: </strong>
												</iaixsl:if>
												<iaixsl:choose>
													<iaixsl:when test="contains(@value, '.00')">
														<iaixsl:value-of select="format-number(@value, '#')"/>%
													</iaixsl:when>
													<iaixsl:otherwise>
														 <iaixsl:value-of select="@value"/>%
													</iaixsl:otherwise>
												 </iaixsl:choose>
											</div>
										</div>
									</iaixsl:for-each>
								</div>
							</iaixsl:if>

						</div>
					</iaixsl:if>

					
					<iaixsl:if test="/shop/page/basket-details/rebate_local/active/products/product or /shop/page/basket-details/rebate_local/rebates/rebate/products/product">

						<div class="basketedit_gifts_label col-lg-8 col-md-6 col-12">
							<strong>Premiujemy duże zamówienia! </strong>
							<span>Sprawdź jakie gratisy przygotowaliśmy dla Ciebie</span>

							<iaixsl:if test="not($showGifts = '1')">
								<a href="#showGifts" class="btn --solid --secondary basketedit_gifts_btn">
									<iaixsl:if test="/shop/page/basket-details/rebate_local/active/selected/product/@id">
										<iaixsl:attribute name="data-active">true</iaixsl:attribute>
									</iaixsl:if>
									<iaixsl:attribute name="title">Wybierz swój gratis</iaixsl:attribute>
									Wybierz swój gratis
								</a>
							</iaixsl:if>
						</div>

						<div class="basketedit_gifts_wrapper" style="display: none;">
							<iaixsl:if test="$showGifts = '1' or /shop/page/basket-details/rebate_local/active/selected/product/@id">
								<iaixsl:attribute name="style">display: block;</iaixsl:attribute>
							</iaixsl:if>

							<iaixsl:if test="/shop/page/basket-details/rebate_local/active/products/product">
								<p class="gift_info">
									Twoje zamówienie przekracza 
									<b><iaixsl:if test="$signbeforeprice = 'true'"><iaixsl:value-of select="/shop/currency/@name"/><iaixsl:value-of select="$signbetweenpricecurrency"/></iaixsl:if><iaixsl:value-of select="/shop/page/basket-details/rebate_local/active/@threshold"/><iaixsl:if test="$signbeforeprice = 'false'"><iaixsl:value-of select="$signbetweenpricecurrency"/><iaixsl:value-of select="/shop/currency/@name"/></iaixsl:if></b>, dlatego możesz wybrać sobie prezent! 
								</p>
							</iaixsl:if>
							<ul>
								<iaixsl:for-each select="/shop/page/basket-details/rebate_local/active">
									<iaixsl:for-each select="products/product">
										<li class="gift_enable col-md-4 col-sm-6 col-12">
											<iaixsl:if test="@id=/shop/page/basket-details/rebate_local/active/selected/product/@id">
												<iaixsl:attribute name="class">gift_enable col-md-4 col-sm-6 col-12 gift_active</iaixsl:attribute>
											</iaixsl:if>
											<div class="gift_item_sub">
												<input type="radio" name="radio_gift">
													<iaixsl:if test="@id=/shop/page/basket-details/rebate_local/active/selected/product/@id">
														<iaixsl:attribute name="checked">checked</iaixsl:attribute>
													</iaixsl:if>
												</input>
												<input type="hidden" name="product[0]">
													<iaixsl:attribute name="value"><iaixsl:value-of select="@id"/></iaixsl:attribute>
												</input>
												<input type="hidden" value="1" name="gift[0]"/>
												<input type="hidden" value="1" name="set_quantity[0]"/>

												<div class="gift_item_icon">
                   				<iaixsl:choose>
                            <iaixsl:when test="icon_second and not(icon_second = '' or icon_second = '/')">
                              <picture>
                                <source type="image/webp">
                                  <iaixsl:attribute name="srcset"><iaixsl:value-of select="icon_small"/></iaixsl:attribute>
                                </source>
                                <img>
                                  <iaixsl:attribute name="alt"><iaixsl:value-of select="name"/></iaixsl:attribute>
                                  <iaixsl:attribute name="src"><iaixsl:value-of select="icon_small_second"/></iaixsl:attribute>
                                </img>
                              </picture>
                            </iaixsl:when>
                            <iaixsl:otherwise>
                              <img>
                                <iaixsl:attribute name="alt"><iaixsl:value-of select="name"/></iaixsl:attribute>
                                <iaixsl:attribute name="src"><iaixsl:value-of select="icon_small"/></iaixsl:attribute>
                              </img>
                            </iaixsl:otherwise>
                          </iaixsl:choose>
												</div>
												<div class="gift_item_info">
													<h3>
														<iaixsl:if test="@id=/shop/page/basket-details/rebate_local/active/selected/product/@id">
															<div id="your_gift_txt">TWÓJ PREZENT:</div>
														</iaixsl:if>
														<strong class="gift_item_name"><iaixsl:value-of select="name"/></strong>
													</h3>

													<iaixsl:choose>
														<iaixsl:when test="sizes/size/@type = 'uniw' or not(sizes/size)">
															<input type="hidden" name="size[0]"><iaixsl:attribute name="value"><iaixsl:value-of select="sizes/size/@type"/></iaixsl:attribute></input>
														</iaixsl:when>
														<iaixsl:when test="count(sizes/size) = 1">
															<input type="hidden" name="size[0]"><iaixsl:attribute name="value"><iaixsl:value-of select="sizes/size/@type"/></iaixsl:attribute></input>
															<div class="gift_choose_size">
																<label>Rozmiar: </label>

																<iaixsl:for-each select="sizes/size">
																	<iaixsl:value-of select="@description"/>
																</iaixsl:for-each>
															</div>
														</iaixsl:when>
														<iaixsl:otherwise>
															<div class="gift_choose_size">
																<label>Rozmiar: </label>
																<select>
																	<iaixsl:for-each select="sizes/size[@amount != 0]">
																		<option>
																			<iaixsl:if test="@amount = '0'">
																				<iaixsl:attribute name="class">no_gift</iaixsl:attribute>
																			</iaixsl:if>

																			<iaixsl:if test="@type=/shop/page/basket-details/rebate_local/active/selected/product/@size and ../../@id=/shop/page/basket-details/rebate_local/active/selected/product/@id">
																				<iaixsl:attribute name="selected">selected</iaixsl:attribute>
																			</iaixsl:if>
																			<iaixsl:attribute name="value"><iaixsl:value-of select="@type"/></iaixsl:attribute><iaixsl:value-of select="@description"/>
																		</option>
																	</iaixsl:for-each>
																</select>
																<input type="hidden" name="size[0]"><iaixsl:attribute name="value"><iaixsl:value-of select="sizes/size/@type"/></iaixsl:attribute></input>
															</div>
														</iaixsl:otherwise>
													</iaixsl:choose>

													<div class="gift_tooltip" style="display:none;">
														<iaixsl:if test="@link"><a target="_blank" class="btn --outline --icon-left icon-plus gift_description">
															<iaixsl:attribute name="href"><iaixsl:value-of select="@link"/></iaixsl:attribute>
															Zobacz więcej
														</a></iaixsl:if>
														<div class="btn --outline --icon-left icon-plus gift_choose">
															Wybierz ten prezent
														</div>
														<div class="btn --outline --icon-left icon-plus gift_resign">
															Zrezygnuj z tego prezentu
														</div>
													</div>

													<iaixsl:choose>
														<iaixsl:when test="@gratis = 'true'">
															<div class="gift_price">
																<span>Gratis!</span>
															</div>
														</iaixsl:when>
														<iaixsl:when test="(not($nettoPriceBasketeditRebates = '') and price/@beforerebate_net &gt; 0) or ($nettoPriceBasketeditRebates = '' and price/@beforerebate &gt; 0)">
															<div class="gift_price">
																<b>Wartość: </b>
																<span>
																	<iaixsl:choose>
																		<iaixsl:when test="not($nettoPriceBasketeditRebates = '')">
																			<iaixsl:value-of select="price/@beforerebate_net_formatted"/><span class="price_vat"><iaixsl:value-of select="$priceTypeText"/></span>
																		</iaixsl:when>
																		<iaixsl:otherwise>
																			<iaixsl:value-of select="price/@beforerebate_formatted"/><span class="price_vat"><iaixsl:value-of select="$priceTypeText"/></span>
																		</iaixsl:otherwise>
																	</iaixsl:choose>
																</span>
															</div>
														</iaixsl:when>
														<iaixsl:when test="price/@value &gt; 0">
															<div class="gift_price">
																<b>Wartość: </b>
																<span>
																	<iaixsl:choose>
																		<iaixsl:when test="not($nettoPriceBasketeditRebates = '')">
																			<iaixsl:value-of select="price/@price_net_formatted"/><span class="price_vat"><iaixsl:value-of select="$priceTypeText"/></span>
																		</iaixsl:when>
																		<iaixsl:otherwise>
																			<iaixsl:value-of select="price/@price_formatted"/><span class="price_vat"><iaixsl:value-of select="$priceTypeText"/></span>
																		</iaixsl:otherwise>
																	</iaixsl:choose>
																</span>
															</div>
														</iaixsl:when>
														<iaixsl:otherwise>
														</iaixsl:otherwise>
													</iaixsl:choose>
												</div>
											</div>
										</li>
									</iaixsl:for-each>
								</iaixsl:for-each>

								<iaixsl:for-each select="/shop/page/basket-details/rebate_local/rebates/rebate[products/product][1]">
									<iaixsl:if test="products/product">
										<li class="gift_label_needs col-12">
											<iaixsl:choose>
												<iaixsl:when test="(@left_price &gt; 0) and (@left_quantity &gt; 0)">
													<span>Aby otrzymać prezent zwiększ wartość zamówienia o minimum  <iaixsl:value-of select="@left_price_formatted"/>   i wybierz jeszcze <iaixsl:value-of select="@left_quantity"/> 
														<iaixsl:choose>
															<iaixsl:when test="(@left_quantity = '1' )">
																 inny towar.
															</iaixsl:when>
															<iaixsl:when test=" (substring(@left_quantity, string-length(@left_quantity), 1) = '2') or (substring(@left_quantity, string-length(@left_quantity), 1)='3') or (substring(@left_quantity, string-length(@left_quantity), 1)='4') ">  inne towary
															</iaixsl:when>
															<iaixsl:otherwise>
																 innych towarów.
															</iaixsl:otherwise>
														</iaixsl:choose>
													</span>
												</iaixsl:when>
												<iaixsl:when test="not(@left_price &gt; 0) and (@left_quantity &gt; 0)">
													<span>
														Aby otrzymać prezent wybierz jeszcze  <iaixsl:value-of select="@left_quantity"/>  <iaixsl:choose> <iaixsl:when test="(@left_quantity = '1' )">  inny towar. </iaixsl:when> <iaixsl:when test=" (substring(@left_quantity, string-length(@left_quantity), 1) = '2') or (substring(@left_quantity, string-length(@left_quantity), 1)='3') or (substring(@left_quantity, string-length(@left_quantity), 1)='4') ">  inne towary </iaixsl:when> <iaixsl:otherwise>  innych towarów. </iaixsl:otherwise> </iaixsl:choose>
													</span>
												</iaixsl:when>
												<iaixsl:when test="(@left_price &gt; 0) and not(@left_quantity &gt; 0)">
													<span> Aby otrzymać prezent zwiększ wartość zamówienia o minimum  <iaixsl:value-of select="@left_price_formatted"/>
													</span>
												</iaixsl:when>
											</iaixsl:choose>
										</li>
									</iaixsl:if>
									<iaixsl:for-each select="products/product">
										<li class="gift_disable showTip_gift col-md-4 col-sm-6 col-12">
											<div class="gift_item_sub">
												<input type="radio" disabled="disabled" name="radio_gift"><iaixsl:attribute name="value"><iaixsl:value-of select="@id"/></iaixsl:attribute></input>
												<div class="gift_item_icon">
													<img>
														<iaixsl:attribute name="alt"><iaixsl:value-of select="name"/></iaixsl:attribute>
														<iaixsl:attribute name="src"><iaixsl:value-of select="icon_small"/></iaixsl:attribute>
													</img>
												</div>
												<div class="gift_item_info">
													<h3>
														<strong class="gift_item_name"><iaixsl:value-of select="name"/></strong>
													</h3>

													<iaixsl:choose>
														<iaixsl:when test="sizes/size/@type = 'uniw' or not(sizes/size)">
															<input type="hidden" name="size[0]"><iaixsl:attribute name="value"><iaixsl:value-of select="sizes/size/@type"/></iaixsl:attribute></input>
														</iaixsl:when>
														<iaixsl:otherwise>
															<div class="gift_choose_size">
																<label>Rozmiar: </label>

																<iaixsl:for-each select="sizes/size">
																	<iaixsl:value-of select="@description"/><iaixsl:if test="not(position()=last())">, </iaixsl:if>
																</iaixsl:for-each>
															</div>
														</iaixsl:otherwise>
													</iaixsl:choose>

													<iaixsl:if test="@link">
														<a target="_blank">
															<iaixsl:attribute name="href"><iaixsl:value-of select="@link"/></iaixsl:attribute>
															Zobacz więcej
														</a>
													</iaixsl:if>
													<iaixsl:choose>
														<iaixsl:when test="@gratis = 'true'">
															<div class="gift_price">
																<span>Gratis!</span>
															</div>
														</iaixsl:when>
														<iaixsl:when test="(not($nettoPriceBasketeditRebates = '') and price/@beforerebate_net &gt; 0) or ($nettoPriceBasketeditRebates = '' and price/@beforerebate &gt; 0)">
															<div class="gift_price">
																<b>Wartość: </b>
																<span>
																	<iaixsl:choose>
																		<iaixsl:when test="not($nettoPriceBasketeditRebates = '')">
																			<iaixsl:value-of select="price/@beforerebate_net_formatted"/><span class="price_vat"><iaixsl:value-of select="$priceTypeText"/></span>
																		</iaixsl:when>
																		<iaixsl:otherwise>
																			<iaixsl:value-of select="price/@beforerebate_formatted"/><span class="price_vat"><iaixsl:value-of select="$priceTypeText"/></span>
																		</iaixsl:otherwise>
																	</iaixsl:choose>
																</span>
															</div>
														</iaixsl:when>
														<iaixsl:when test="price/@value &gt; 0">
															<div class="gift_price">
																<b>Wartość: </b>
																<span>
																	<iaixsl:choose>
																		<iaixsl:when test="not($nettoPriceBasketeditRebates = '')">
																			<iaixsl:value-of select="price/@price_net_formatted"/><span class="price_vat"><iaixsl:value-of select="$priceTypeText"/></span>
																		</iaixsl:when>
																		<iaixsl:otherwise>
																			<iaixsl:value-of select="price/@price_formatted"/><span class="price_vat"><iaixsl:value-of select="$priceTypeText"/></span>
																		</iaixsl:otherwise>
																	</iaixsl:choose>
																</span>
															</div>
														</iaixsl:when>
														<iaixsl:otherwise>
														</iaixsl:otherwise>
													</iaixsl:choose>
												</div>
											</div>
										</li>
									</iaixsl:for-each>
								</iaixsl:for-each>
							</ul>
						</div>
					</iaixsl:if>

					<iaixsl:if test="/shop/page/rebates_for_points/rebate">
						<div class="rebates_for_points_wrapper">
							<iaixsl:if test="(/shop/rebatesLocal and (/shop/rebatesLocal/rebate/@value &gt; 0 )) or /shop/page/basket-details/rebate_local/active/products/product or /shop/page/basket-details/rebate_local/rebates/rebate/products/product">
								<iaixsl:attribute name="style">padding-top: 20px;</iaixsl:attribute>
							</iaixsl:if>
							<div class="menu_rebates">
								<div class="menu_rebates__block --labels">
									<div>
										<strong class="rebates_for_points col-12">Wymień punkty na rabat</strong>
									</div>
								</div>
								<div class="menu_rebates__block">
									<div class="rebates_for_points">
										<iaixsl:for-each select="/shop/page/rebates_for_points/rebate">
											<div class="col-lg-4 col-md-6 col-12">
												<iaixsl:choose>
													<iaixsl:when test="@order_link">
														<a class="btn --solid --medium for_points">
															<iaixsl:attribute name="href"><iaixsl:value-of select="@order_link"/></iaixsl:attribute>

															<iaixsl:if test="/shop/rebate_for_profit_points_delete_client_advanced_rebate/@active = 'y'">
																<iaixsl:attribute name="title">Po wymianie punktów na rabat zostanie skasowany rabat przypisany do Twojego konta.</iaixsl:attribute>
																<iaixsl:attribute name="data-title">Potwierdzenie wymiany punktów na rabat</iaixsl:attribute>

																<iaixsl:attribute name="data-button_txt">wymień</iaixsl:attribute>

																<iaixsl:attribute name="data-confirmation_link">true</iaixsl:attribute>
															</iaixsl:if>

															<iaixsl:if test="/shop/rebate_for_profit_points_delete_rebate_code/@active = 'y'">
																<iaixsl:attribute name="title">Po wymianie punktów na rabat zostanie skasowany rabat przypisany do kodu rabatowego.</iaixsl:attribute>
																<iaixsl:attribute name="data-title">Potwierdzenie wymiany punktów na rabat</iaixsl:attribute>
																<iaixsl:attribute name="data-button_txt">wymień</iaixsl:attribute>

																<iaixsl:attribute name="data-confirmation_link">true</iaixsl:attribute>
															</iaixsl:if>

															<iaixsl:if test="@selected = 'selected'">
																<iaixsl:attribute name="data-selected">true</iaixsl:attribute>
																<iaixsl:if test="/shop/rebate_for_profit_points_delete_rebate_code/@active = 'y'">
																	<iaixsl:attribute name="data-confirmation_link">true</iaixsl:attribute>
																</iaixsl:if>
																<iaixsl:if test="/shop/rebate_for_profit_points_delete_client_advanced_rebate/@active = 'y'">
																	<iaixsl:attribute name="data-confirmation_link">true</iaixsl:attribute>
																</iaixsl:if>
															</iaixsl:if>

															<span class="for_points_value">
																<iaixsl:if test="@selected = 'selected'">
																	<strong>Twój rabat: </strong>
																</iaixsl:if>
																<span>Rabat 
																	<iaixsl:choose>
																		<iaixsl:when test="@rebate_type='quota'">
																			<iaixsl:value-of select="format-number(@threshold, '#')"/><iaixsl:text> </iaixsl:text><iaixsl:value-of select="/shop/currency/@name"/>
																		</iaixsl:when>
																		<iaixsl:otherwise>
																			<iaixsl:value-of select="format-number(@threshold, '#')"/>%
																		</iaixsl:otherwise>
																	</iaixsl:choose>
																</span>
																<iaixsl:choose>
																	<iaixsl:when test="@permanent='true'">
																		na stałe
																	</iaixsl:when>
																	<iaixsl:otherwise>
																		na to zamówienie
																	</iaixsl:otherwise>
																</iaixsl:choose>
															</span>
															<span class="for_points_points">
																<iaixsl:value-of select="format-number(@points, '#')"/> pkt.
															</span>
														</a>
													</iaixsl:when>
													<iaixsl:otherwise>
														<div class="btn --solid --medium for_points">
															<iaixsl:if test="@selected = 'selected'">
																<iaixsl:attribute name="data-selected">true</iaixsl:attribute>
															</iaixsl:if>
															<span class="for_points_value">
																<iaixsl:if test="@selected = 'selected'">
																	<strong>Twój rabat: </strong>
																</iaixsl:if>
																<span>Rabat 
																	<iaixsl:choose>
																		<iaixsl:when test="@rebate_type='quota'">
																			<iaixsl:value-of select="@threshold_formatted"/>
																		</iaixsl:when>
																		<iaixsl:otherwise>
																			<iaixsl:value-of select="@threshold"/>%
																		</iaixsl:otherwise>
																	</iaixsl:choose>
																</span>
																<iaixsl:choose>
																	<iaixsl:when test="@permanent='true'">
																		na stałe
																	</iaixsl:when>
																	<iaixsl:otherwise>
																		na to zamówienie
																	</iaixsl:otherwise>
																</iaixsl:choose>
															</span>
															<span class="for_points_points">
																<iaixsl:value-of select="@points"/> pkt.
															</span>
														</div>
													</iaixsl:otherwise>
												</iaixsl:choose>
											</div>
										</iaixsl:for-each>
									</div>
								</div>
							</div>
						</div>
					</iaixsl:if>
				</div>
			</iaixsl:if>
		</iaixsl:if>
		<!-- (basketedit_hotspot_zone1, 614c5cee4dc0d1.39044150.5)-->
	
<!-- (menu_security_policy, 60dd8e83485025.35067229.6)-->
	<iaixsl:if test="/shop/iai/@button_src">
		<div id="menu_security_policy" class="menu_box securityPolicy">
			<iaixsl:choose>
				<iaixsl:when test="/shop/@trust_level = '1'">
					<iaixsl:attribute name="class">menu_box securityPolicy supershop</iaixsl:attribute>
					<h2>
						<iaixsl:attribute name="class">big_label</iaixsl:attribute>
						Zakupy w naszym sklepie są <strong>SuperBezpieczne</strong><sup>TM</sup>
					</h2>
					<div class="securityPolicy__sub">
						<div class="securityPolicy__img">
							
						</div>
						<div class="securityPolicy__text">
							<p><b>Dbamy o Twoje prawa</b> i wygodę.</p>
							<iaixsl:if test="/shop/action/shop_information/@order_link_active='y' or /shop/action/shipping_cost/@order_link_active='y' or /shop/action/payment_methods/@order_link_active='y' or /shop/action/terms/@order_link_active='y' or /shop/action/private_policy/@order_link_active='y' or /shop/action/order_cancel/@order_link_active='y'">
								<p>
									<b>Zapoznaj się z </b>
									<a target="_blank"><iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/terms/@url"/></iaixsl:attribute>Informacjeem</a>, <a target="_blank"><iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/private_policy/@url"/></iaixsl:attribute>Polityką Prywatności</a> oraz informacjami na temat
									<a target="_blank"><iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/order_cancel/@url"/></iaixsl:attribute>Odstąpienia od umowy</a><iaixsl:if test="/shop/language/option[@name='de']/@selected"> zaufany</iaixsl:if>.
								</p>
							</iaixsl:if>
							<p>
								<b>Sprawdź również </b>
								<a target="_blank"><iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/shop_information/@url"/></iaixsl:attribute>O Nas</a>, <iaixsl:if test="/shop/language/option[@name='de']/@selected"> we </iaixsl:if> <a target="_blank"><iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/shipping_cost/@url"/></iaixsl:attribute>Koszty wysyłki</a> oraz dostępne
								<a target="_blank"><iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/payment_methods/@url"/></iaixsl:attribute>Płatności</a>.
							</p>
						</div>
					</div>
				</iaixsl:when>
				<iaixsl:otherwise>
					<h2>
						<iaixsl:attribute name="class">big_label</iaixsl:attribute>
						Zakupy w naszym sklepie są bezpieczne
					</h2>
					<div class="securityPolicy__sub">
						<div class="securityPolicy__img">
							
						</div>
						<div class="securityPolicy__text">
							<p><b>Dbamy o Twoje prawa</b>.</p>
							<iaixsl:if test="/shop/action/shop_information/@order_link_active='y' or /shop/action/shipping_cost/@order_link_active='y' or /shop/action/payment_methods/@order_link_active='y' or /shop/action/terms/@order_link_active='y' or /shop/action/private_policy/@order_link_active='y' or /shop/action/order_cancel/@order_link_active='y'">
								<p>
									<b>Zapoznaj się z </b>
									<a target="_blank"><iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/terms/@url"/></iaixsl:attribute>Informacjeem</a>, <a target="_blank"><iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/private_policy/@url"/></iaixsl:attribute>Polityką Prywatności</a> oraz informacjami na temat
									<a target="_blank"><iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/order_cancel/@url"/></iaixsl:attribute>Odstąpienia od umowy</a><iaixsl:if test="/shop/language/option[@name='de']/@selected"> zaufany</iaixsl:if>.
								</p>
							</iaixsl:if>
							<p>
								<b>Sprawdź również </b>
								<a target="_blank"><iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/shop_information/@url"/></iaixsl:attribute>O Nas</a>, <iaixsl:if test="/shop/language/option[@name='de']/@selected"> we </iaixsl:if> <a target="_blank"><iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/shipping_cost/@url"/></iaixsl:attribute>Koszty wysyłki</a> oraz dostępne
								<a target="_blank"><iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/payment_methods/@url"/></iaixsl:attribute>Płatności</a>.
							</p>
						</div>
					</div>
				</iaixsl:otherwise>
			</iaixsl:choose>
		</div>
	</iaixsl:if>
<!-- (menu_basketedit_hotspot_zone1, 60dd8e8201f6d5.58537120.1)-->
        <iaixsl:if test="page/hotspot/products_zone1 or page/hotspot/products_zone1">

            <div class="hotspot mb-5 skeleton" id="basketedit_hotspot_zone1" data-ajaxLoad="true" data-pageType="basket">
                <span class="headline"/>
                <div class="products d-flex flex-wrap">
                    <div class="product col-6 col-sm-3 py-3">
                        <span class="product__icon d-flex justify-content-center align-items-center"/>
                        <span class="product__name"/>
                        <div class="product__prices"/>
                    </div>
                    <div class="product col-6 col-sm-3 py-3">
                        <span class="product__icon d-flex justify-content-center align-items-center"/>
                        <span class="product__name"/>
                        <div class="product__prices"/>
                    </div>
                    <div class="product col-6 col-sm-3 py-3">
                        <span class="product__icon d-flex justify-content-center align-items-center"/>
                        <span class="product__name"/>
                        <div class="product__prices"/>
                    </div>
                    <div class="product col-6 col-sm-3 py-3">
                        <span class="product__icon d-flex justify-content-center align-items-center"/>
                        <span class="product__name"/>
                        <div class="product__prices"/>
                    </div>
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
								<a>
									<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/shop_information/@url"/></iaixsl:attribute>
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
        <!-- (menu_compare, 6374c9a3a9b958.90333095.2)--><!-- (menu_shoppinglist, 6374c7c8e99458.25728203.3)--><!-- (menu_additionalpayments, 6362560c0363e8.68758784.2)--><!-- (menu_omnibus, 6458e0851cf079.14035433.4)-->

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
        <iaixsl:attribute name="data-label">Kraj: </iaixsl:attribute>
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
        <strong class="expchck_label__name">Dane kupującego</strong>
        <span class="expchck_label__desc">Adres będzie na potwierdzeniu zakupu</span>
      </div>
      <div class="expchck_summary_address__wrapper">
        <strong class="expchck_summary_address__name"/>
        <div class="expchck_summary_address__address">
          <span class="expchck_summary_address__street"/>
          <span class="expchck_summary_address__city"/>
          <span class="expchck_summary_address__phone_wrapper">
            <span class="expchck_summary_address__phone_label">Tel. odbiorcy: </span>
            <span class="expchck_summary_address__phone"/>
          </span>
        </div>
      </div>
      <div class="expchck_summary_address__invoice expchck_summary_invoice">
        <div class="expchck_summary_invoice__switch">
          <span class="expchck_summary_invoice__switch_text">Chcę otrzymać fakturę</span>
          <div class="f-group --switch">
            <input type="checkbox" class="f-control" name="invoice" id="expchck_summary_invoice_change"/>
            <label class="f-label" for="expchck_summary_invoice_change"/>
          </div>
        </div>
        <div class="expchck_summary_invoice__wrapper">
          <div class="expchck_summary_invoice__inputs expchck_inputs f-group --mask">
            
            <div class="expchck_summary_invoice__item --firm f-feedback">
              <input id="invoice_firm" type="text" class="f-control --validate" data-name="firm" name="invoice_firm" data-graphql="firm" required="required"/>
              <label for="invoice_firm" class="f-label">Nazwa firmy</label>
              <span class="f-control-feedback"/>
              <div class="f-message"/>
            </div>
            
            <div class="expchck_summary_invoice__item --nip f-feedback">
              <input id="invoice_nip" type="text" class="f-control --validate" data-name="nip" name="invoice_nip" data-graphql="nip" required="required" data-region=""/>
              <label for="invoice_nip" class="f-label">NIP</label>
              <span class="f-control-feedback"/>
              <div class="f-message"/>
            </div>
            
            <div class="expchck_summary_invoice__item --street f-feedback --address">
              <input id="invoice_street" type="text" class="f-control --validate" data-name="street" name="invoice_street" required="required" data-graphql="street" data-concat-from="#invoice_street_number" autocomplete="address-line1" data-region=""/>
              <label for="invoice_street" class="f-label">Ulica</label>
              <span class="f-control-feedback"/>
              <div class="f-message"/>
            </div>
            
            <div class="expchck_summary_invoice__item --street-number f-feedback --address">
              <input id="invoice_street_number" type="text" class="f-control --validate" data-name="streetNumber" name="invoice_street_number" data-concat-to="#invoice_street"/>
              <label for="invoice_street_number" class="f-label">Nr domu / lokalu</label>
              <span class="f-control-feedback"/>
              <div class="f-message"/>
            </div>
            
            <div class="expchck_summary_invoice__item --zipcode f-feedback --address">
              <input id="invoice_zipcode" type="text" class="f-control --validate" data-name="zipcode" name="invoice_zipcode" required="required" data-graphql="zipcode" autocomplete="postal-code" data-region=""/>
              <label for="invoice_zipcode" class="f-label">Kod pocztowy</label>
              <span class="f-control-feedback"/>
              <div class="f-message"/>
            </div>
            
            <div class="expchck_summary_invoice__item --city f-feedback --address">
              <input id="invoice_city" type="text" class="f-control --validate" data-name="city" name="invoice_city" required="required" data-graphql="city" autocomplete="address-level2"/>
              <label for="invoice_city" class="f-label">Miejscowość</label>
              <span class="f-control-feedback"/>
              <div class="f-message"/>
            </div>
          </div>
          <div class="expchck_summary_invoice__address">
            <div class="expchck_summary_invoice__address_wrapper">
              <strong class="expchck_summary_invoice__address_label">Adres na fakturze</strong>
              <strong class="expchck_summary_invoice__firm"/>
              <strong class="expchck_summary_invoice__nip_wrapper"><span class="expchck_summary_invoice__nip_label">NIP: </span><span class="expchck_summary_invoice__nip"/></strong>
              <span class="expchck_summary_invoice__street"/>
              <span class="expchck_summary_invoice__city"/>
            </div>
            <a href="#changeInvoiceAddress" class="expchck_summary_invoice__address_change">Zmień</a>
          </div>
          <div class="expchck_summary_invoice__save">
            <button type="button" class="expchck_summary_invoice__save_button btn --solid --large">Zapisz</button>
          </div>
        </div>
      </div>
    </div>
  </template>

  <template id="expchck_summary_payments">
    <div class="expchck_summary_payments">
      <div class="expchck_summary_payments__label expchck_label">
        <strong class="expchck_label__name">Płatność</strong>
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
        <strong class="expchck_label__name">Dostawa</strong>
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
            <span class="expchck_summary_delivery__phone_label">Tel. odbiorcy: </span>
            <span class="expchck_summary_delivery__phone"/>
          </span>
        </div>
      </div>
      <strong class="expchck_summary_delivery__cost"/>
      <div class="expchck_summary_delivery__pickup_phone expchck_pickup_phone f-group --mask">
        <div class="expchck_pickup_phone__wrapper --filled">
          <strong class="expchck_pickup_phone__value"/>
          <a href="#changePickupPhone" class="expchck_pickup_phone__change">Zmień</a>
        </div>
        <div class="expchck_pickup_phone__wrapper --change">
          <div class="expchck_pickup_phone__item --phone f-feedback">
            <input id="pickup_phone" type="tel" class="f-control --validate" name="pickup_phone" required="required" data-graphql="phone" autocomplete="tel-national" data-name="phone" data-region=""/>
            <label for="pickup_phone" class="f-label">Numer telefonu</label>
            <span class="f-control-feedback"/>
            <div class="f-message"/>
          </div>
          <div class="expchck_pickup_phone__save">
            <button type="button" class="expchck_pickup_phone__save_button btn --solid --large">Zapisz</button>
          </div>
        </div>
      </div>
      <a class="expchck_summary_delivery__change" href="#changeDelivery"/>
    </div>
  </template>

  <template id="expchck_summary_costs">
    <div class="expchck_summary_costs">
      
      <div class="expchck_summary_costs__item --worth">
        <span class="expchck_summary_costs__label">Wartość zamówienia:</span>
        <strong class="expchck_summary_costs__value"/>
      </div>
      
      <div class="expchck_summary_costs__item --rebate">
        <span class="expchck_summary_costs__label">Rabat:</span>
        <strong class="expchck_summary_costs__value --minus"/>
      </div>
      
      <div class="expchck_summary_costs__item --paymentcost">
        <span class="expchck_summary_costs__label">Koszt płatności:</span>
        <strong class="expchck_summary_costs__value --plus"/>
      </div>
      
      <div class="expchck_summary_costs__item --shipping">
        <span class="expchck_summary_costs__label">Koszt przesyłki:</span>
        <strong class="expchck_summary_costs__value --plus"/>
      </div>
      
      <div class="expchck_summary_costs__item --insurance">
        <span class="expchck_summary_costs__label">Koszt ubezpieczenia:</span>
        <strong class="expchck_summary_costs__value --plus"/>
      </div>
      
      <div class="expchck_summary_costs__item --balance">
        <span class="expchck_summary_costs__label">Opłacone z salda:<br/>(nadpłaty na koncie klienta)</span>
        <strong class="expchck_summary_costs__value --minus"><iaixsl:value-of select="/shop/client_data/client_balance/balance[@is_selected_and_allowed_order='true']/@currency_value_formatted"/></strong>
      </div>
    </div>
  </template>

  <template id="expchck_summary_total">
    <div class="expchck_summary_total">
      <span class="expchck_summary_total__label">Do zapłaty</span>
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
        <span class="expchck_summary_terms__content">Zapoznałem się z moim <a target="_blank"><iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/order_cancel/@url"/></iaixsl:attribute>prawem do odstąpienia od umowy</a></span>
        <div class="expchck_summary_terms__switch --cancel f-group --switch">
          <input type="checkbox" name="order_cancel" class="f-control --validate" id="expchck_order_cancel_checkbox" required="required"/>
          <label class="f-label" for="expchck_order_cancel_checkbox"/>
        </div>
      </div>
      <div class="expchck_summary_terms__item --virtual f-feedback">
        <span class="expchck_summary_terms__content">Wyrażam zgodę i proszę zarazem o spełnienie świadczenia przed upływem terminu do odstąpienia od umowy. Jestem świadomy/a, że udzielając niniejszej zgody tracę moje prawo do odstąpienia od umowy wraz z momentem rozpoczęcia świadczenia</span>
        <div class="expchck_summary_terms__switch --virtual f-group --switch">
          <input type="checkbox" name="order_virtual" class="f-control --validate" id="expchck_order_virtual_checkbox" required="required"/>
          <label class="f-label" for="expchck_order_virtual_checkbox"/>
        </div>
      </div>
      <div class="expchck_summary_terms__item --service f-feedback">
        <span class="expchck_summary_terms__content">Wyrażam zgodę i proszę zarazem o rozpoczęcie świadczenia usługi przed upływem terminu do odstąpienia od umowy. Jestem świadomy/a, że w przypadku pełnego wykonania usługi tracę moje prawo do odstąpienia od umowy</span>
        <div class="expchck_summary_terms__switch --cancel f-group --switch">
          <input type="checkbox" name="order_service" class="f-control --validate" id="expchck_order_service_checkbox" required="required"/>
          <label class="f-label" for="expchck_order_service_checkbox"/>
        </div>
      </div>
    </div>
  </template>

  <template id="expchck_summary_submit">
    <div class="expchck_summary_submit">
      <button type="submit" class="expchck_summary_submit__button btn --solid --large">Akceptuję, zamawiam i płacę<span class="expchck_summary_submit__cost"/></button>
    </div>
  </template>

  <div class="expchck_summary_submit_mobile">
    <div class="expchck_summary_submit_mobile__cost">
      <span class="expchck_summary_submit_mobile__cost_label">Do zapłaty</span>
      <strong class="expchck_summary_submit_mobile__cost_value"/>
    </div>
    <div class="expchck_summary_submit_mobile__button_wrapper">
      <button type="submit" class="expchck_summary_submit_mobile__button btn --solid --large">Akceptuję, zamawiam i płacę</button>
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
      Pokaż wszystkie
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
          <label for="client_firstname" class="f-label">Imię</label>
          <span class="f-control-feedback"/>
          <div class="f-message"/>
        </div>
        
        <div class="expchck_client__item --lastname f-feedback">
				  <input id="client_lastname" type="text" class="f-control --validate" name="client_lastname" data-graphql="lastname" data-name="lastname" required="required" autocomplete="family-name"/>
          <label for="client_lastname" class="f-label">Nazwisko</label>
          <span class="f-control-feedback"/>
          <div class="f-message"/>
        </div>
        
        <div class="expchck_client__item --street f-feedback">
				  <input id="client_street" type="text" class="f-control --validate" name="client_street" required="required" data-graphql="street" data-concat-from="#client_street_number" data-name="street" autocomplete="address-line1" data-region=""/>
          <label for="client_street" class="f-label">Ulica</label>
          <span class="f-control-feedback"/>
          <div class="f-message"/>
        </div>
        
        <div class="expchck_client__item --street-number f-feedback ">
				  <input id="client_street_number" type="text" class="f-control --validate" name="client_street_number" data-concat-to="#client_street" data-name="streetNumber"/>
          <label for="client_street_number" class="f-label">Nr domu / lokalu</label>
          <span class="f-control-feedback"/>
          <div class="f-message"/>
        </div>
        
        <div class="expchck_client__item --zipcode f-feedback">
				  <input id="client_zipcode" type="text" class="f-control --validate" name="client_zipcode" required="required" data-graphql="zipcode" data-name="zipcode" autocomplete="postal-code" data-region=""/>
          <label for="client_zipcode" class="f-label">Kod pocztowy</label>
          <span class="f-control-feedback"/>
          <div class="f-message"/>
        </div>
        
        <div class="expchck_client__item --city f-feedback">
				  <input id="client_city" type="text" class="f-control --validate" name="client_city" required="required" data-graphql="city" data-name="city" autocomplete="address-level2"/>
          <label for="client_city" class="f-label">Miejscowość</label>
          <span class="f-control-feedback"/>
          <div class="f-message"/>
        </div>
        
        <div class="expchck_client__item --phone f-feedback">
				  <input id="client_phone" type="tel" class="f-control --validate" name="client_phone" required="required" data-graphql="phone" autocomplete="tel-national" data-name="phone" data-region=""/>
          <label for="client_phone" class="f-label">Numer telefonu</label>
          <span class="f-control-feedback"/>
          <div class="f-message"/>
        </div>
        
        <div class="expchck_client__item --email f-feedback">
				  <input id="client_email" type="email" class="f-control --validate" name="client_email" required="required" data-graphql="email" autocomplete="email" data-name="email"/>
          <label for="client_email" class="f-label">E-mail</label>
          <span class="f-control-feedback"/>
          <div class="f-message"/>
        </div>
      </div>
      <div class="expchck_client__submit">
        <button type="button" class="expchck_client__button btn --solid --large">Przejdź dalej</button>
      </div>
      <div class="expchck_client__change_account">
        <span class="expchck_client__change_text">Chcesz zamówić na inne zapisane dane?</span>
        <a href="#changeAccount" class="expchck_client__change_link">Zmień konto</a>
      </div>
      <div class="expchck_client__safe">
        <span class="expchck_client__safe_text">Zakupy w naszym sklepie są bezpieczne</span>
        <img class="expchck_client__powered_by_smile" src="/gfx/standards/powered_by_smile.svg?r=1696937716">
          <iaixsl:attribute name="alt">Kupujesz i dostawę masz gratis!</iaixsl:attribute>
        </img>
      </div>
    </div>
  </template>
	

  
  <template id="expchck_deliveries">
    <div class="expchck_deliveries">
      <div class="expchck_deliveries__addresses"/>
      <div class="expchck_deliveries__block">
        <div class="expchck_deliveries__label expchck_label">
          <strong class="expchck_label__name">Dostawa</strong>
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
						<span class="expchck_delivery__minworth_label">Forma dostawy dostępna od </span>
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
					<span class="expchck_delivery__calendar_label">Wybierz preferowany dzień dostawy:</span>
					<div class="expchck_delivery__dates">
						<div class="expchck_delivery__date --other">
							<a class="expchck_delivery__other_link" href="#chooseAnotherDay">Inny dzień</a>
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
					<span class="expchck_delivery__calendar_label">Wybierz dodatkową usługę:</span>
					<div class="expchck_delivery__services_wrapper"/>
				</div>
        <div class="expchck_delivery__select_delivery">
          <button type="button" class="expchck_delivery__select_button btn --solid --large">Wybierz</button>
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
          <span class="expchck_deliveries__phone_label">Tel. odbiorcy: </span>
          <span class="expchck_deliveries__phone"/>
        </span>
      </div>
      <a class="expchck_deliveries__address_edit" href="#editDeliveryAddress">Edytuj</a>
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
							<iaixsl:attribute name="placeholder">Wpisz adres</iaixsl:attribute>
					  </input>
						<a class="pickup_search__button" href="#"/>
					</div>
					<div class="pickup_search__results"/>
				</div>
			</div>
			<div class="pickup_points__map pickup_map">
				<div class="pickup_map__area">
					<a href="#searchHere" class="pickup_map__area_button btn --solid --secondary --icon-left icon-search">Szukaj na tym obszarze</a>
				</div>
				<div class="pickup_map__wrapper"/>
			</div>
			<div class="pickup_points__items pickup_items">
				<div class="pickup_items__findings">
					<span class="pickup_items__findings_label">Wyniki:</span>
					<strong class="pickup_items__findings_sub"><span class="pickup_items__findings_value"/><span class="pickup_items__findings_text"/></strong>
				</div>
				<div class="pickup_items__wrapper"/>
				<div class="pickup_items__show_more">
					<a href="#showMore" class="pickup_items__show">
						<iaixsl:attribute name="data-prev">Pokaż mniej</iaixsl:attribute>
						Pokaż więcej
					</a>
				</div>
				<div class="pickup_items__message menu_messages_message">Brak punktów odbioru, sprawdź inny adres</div>
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
					<a href="#showOnMap" class="pickup_item__map_link">Pokaż na mapie</a>
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
				<a href="#moreInfo" class="pickup_marker__link --more" target="_blank">Więcej informacji</a>
				<a href="#howToGetThere" class="pickup_marker__link --directions" target="_blank">Jak dojechać?</a>
			</div>
			<div class="pickup_marker__choose">
				<a href="#selectThisPoint" class="btn --solid --large">Wybierz ten punkt</a>
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
          <label for="client_street" class="f-label">Ulica</label>
          <span class="f-control-feedback"/>
          <div class="f-message"/>
        </div>
        
        <div class="expchck_address__item --street-number f-feedback ">
				  <input id="client_street_number" type="text" class="f-control --validate" name="client_street_number" data-concat-to="#client_street" data-name="streetNumber"/>
          <label for="client_street_number" class="f-label">Nr domu / lokalu</label>
          <span class="f-control-feedback"/>
          <div class="f-message"/>
        </div>
        
        <div class="expchck_address__item --zipcode f-feedback">
				  <input id="client_zipcode" type="text" class="f-control --validate" name="client_zipcode" required="required" data-graphql="zipcode" data-name="zipcode" autocomplete="postal-code" data-region=""/>
          <label for="client_zipcode" class="f-label">Kod pocztowy</label>
          <span class="f-control-feedback"/>
          <div class="f-message"/>
        </div>
        
        <div class="expchck_address__item --city f-feedback">
				  <input id="client_city" type="text" class="f-control --validate" name="client_city" required="required" data-graphql="city" data-name="city" autocomplete="address-level2"/>
          <label for="client_city" class="f-label">Miejscowość</label>
          <span class="f-control-feedback"/>
          <div class="f-message"/>
        </div>
        
        <div class="expchck_address__item --phone f-feedback">
				  <input id="address_phone" type="tel" class="f-control --validate" name="address_phone" required="required" data-graphql="phone" autocomplete="tel-national" data-name="phone" data-region=""/>
          <label for="address_phone" class="f-label">Numer telefonu</label>
          <span class="f-control-feedback"/>
          <div class="f-message"/>
        </div>
      </div>
      <div class="expchck_address__submit">
        <button type="button" class="expchck_address__button btn --solid --large">Zapisz</button>
      </div>
      <div class="expchck_address__safe">
        <span class="expchck_address__safe_text">Zakupy w naszym sklepie są bezpieczne</span>
        <img class="expchck_address__powered_by_smile" src="/gfx/standards/powered_by_smile.svg?r=1696937716">
          <iaixsl:attribute name="alt">Kupujesz i dostawę masz gratis!</iaixsl:attribute>
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
      <span>Korzystaj z łatwego i automatycznego uzupełniania danych zakupowych w ramach usługi Smile, które obsługuje firma IAI S.A dla sklepów na IdoSell. Wyrażoną zgodę możesz w każdym czasie wycofać.</span><a target="_blank" download="download"><iaixsl:attribute name="href"><iaixsl:choose><iaixsl:when test="/shop/language/option[@id='pol']/@selected='true'">https://www.idosell.com/panel/file-gate.php?id=263931&amp;lang=pl&amp;ext=.pdf</iaixsl:when><iaixsl:otherwise>https://www.idosell.com/panel/file-gate.php?id=263930&amp;lang=pl&amp;ext=.pdf</iaixsl:otherwise></iaixsl:choose></iaixsl:attribute>Zapoznaj się z polityką prywatności.</a>
    </div>
    <div class="expchck_login__sep mb-4"><span>lub</span></div>
    <span class="expchck_login__text mb-3">Jeżeli posiadasz u nas konto podaj login</span>
    <div class="f-group expchck_login__email">
      <div class="f-feedback">
        <input id="login_email" type="text" name="email" class="expchck_login__email_inp f-control"/>
        <label for="login_email" class="f-label">
          Adres e-mail / login
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
          Hasło
        </label>
        <span class="f-control-feedback"/>
        <span class="help-block"/>
      </div>
    </div>
    <div class="expchck_login__buttons">
      <a class="expchck_login__signin btn --solid --large justify-content-center mb-5" href="#signin">
        Zaloguj się
      </a>
      <a class="expchck_login__register btn --solid --large justify-content-center mb-5" href="#register">
        Załóż konto i złóż zamówienie
      </a>
    </div>
    <div class="expchck_login__links d-flex flex-column align-items-center">
      <a class="expchck_login__mail_login mb-3" href="#mail_login">
        Wyślij e-mail z linkiem do zalogowania
      </a>
      <a class="expchck_login__pass_recover mb-1" href="#pass_recover">
        Nie pamiętam loginu lub hasła
      </a>
    </div>
  </div>
</template>

<template id="expchck_login_options">
  <a href="#login_option" class="expchck_login__option mb-2 d-flex justify-content-center">
    <span class="option_icon"/>
    <strong>
      <span>Zaloguj się przez </span>
      <span class="option_name"/>
    </strong>
  </a>
</template>


<template id="expchck_register_authn">
	<div class="expchck_register_authn">
		<a href="#tryAgainWebAuthnRegister" class="expchck_register_authn__button btn --outline --large">Spróbuj ponownie</a>
	</div>
</template>
<template id="expchck_login_authn">
	<div class="expchck_login_authn">
		<a href="#tryAgainWebAuthn" class="expchck_login_authn__button btn --outline --large">Spróbuj ponownie</a>
		<div class="expchck_login_authn__separator"><span class="expchck_login_authn__separator_text">lub</span></div>
	</div>
</template>
<template id="expchck_login_pin">
  <div class="expchck_login --pin d-flex flex-column">

    <span class="expchck_login__text mb-3">Podaj numer telefonu lub adres e-mail, aby rozpocząć.</span>
    <div class="f-group expchck_login__user_identifier mb-2">
      <div class="f-feedback">
        <input id="user_identifier" type="text" autocomplete="tel" value="" class="expchck_login__user_identifier_inp f-control"/>
        <label for="user_identifier" class="f-label">
          Numer telefonu lub adres e-mail
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
      <span>Automatyczne logowanie biometryczne</span>
      <div class="f-group --switch --save-device mb-0">
        <input type="checkbox" class="f-control" id="expchck_save_device" checked="checked"/>
        <label class="f-label" for="expchck_save_device"/>
      </div>
    </div>
    <div class="expchck_login__terms mb-5 mt-4 py-2 py-md-4">
      <span>Korzystaj z łatwego i automatycznego uzupełniania danych zakupowych w ramach usługi Smile, które obsługuje firma IAI S.A dla sklepów na IdoSell. Wyrażoną zgodę możesz w każdym czasie wycofać.</span><a target="_blank" download="download"><iaixsl:attribute name="href"><iaixsl:choose><iaixsl:when test="/shop/language/option[@id='pol']/@selected='true'">https://www.idosell.com/panel/file-gate.php?id=263931&amp;lang=pl&amp;ext=.pdf</iaixsl:when><iaixsl:otherwise>https://www.idosell.com/panel/file-gate.php?id=263930&amp;lang=pl&amp;ext=.pdf</iaixsl:otherwise></iaixsl:choose></iaixsl:attribute>Zapoznaj się z polityką prywatności.</a>
    </div>

    <div class="expchck_login__smile mb-4 mb-md-5">
      <div class="expchck_login__smile_header d-flex justify-content-between align-items-center mb-2">
        <strong>Zakupy w naszym sklepie są bezpieczne</strong>
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
      <span>Weryfikacja numeru telefonu i adresu e-mail pozwala nam chronić Twoje konto. Dzięki temu dbamy o bezpieczeństwo Twoich danych i prywatność.</span>
    </div>

    <div class="expchck_login__buttons mb-md-2">
      <a class="expchck_login__verify_pin btn --solid --large d-flex justify-content-center mb-5" href="#verify_pin">Przejdź dalej</a>
    </div>
    <div class="expchck_login__services_link d-flex justify-content-center align-items-center mb-3">
      <a class="expchck_login__login_services mr-3" href="#login_services">Zaloguj się w inny sposób</a>
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
    <span class="expchck_login__text --pin_phone mb-3">Wysłaliśmy na numer <strong class="expchck_login__pin_phone"/> 6-cyfrowy kod. Dotrze do Ciebie za kilkanaście sekund.</span>
    <span class="expchck_login__text --pin_email mb-3">Wysłaliśmy na adres e-mail <strong class="expchck_login__pin_email"/> 6-cyfrowy kod. Dotrze do Ciebie za kilkanaście sekund.</span>

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

    <a href="#change_pin_option" class="expchck_login__change_pin_option mb-5">Zmień numer telefonu lub e-mail</a>

    <div class="expchck_login__buttons">
      <a class="btn --solid --large d-flex justify-content-center mb-5" href="#signin">Przejdź dalej</a>
    </div>
    <div class="expchck_login__send_pin d-flex justify-content-center mb-md-1">
      <a href="#send_pin">Wyślij kod ponownie</a>
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
				<script><iaixsl:attribute name="src">/gfx/<iaixsl:value-of select="language/@id"/>/shop.js.gzip?r=1696937761</iaixsl:attribute></script>
			</iaixsl:otherwise>
		</iaixsl:choose>

		
		
	</iaixsl:if>
  
  
  

	
	<script src="/gfx/pol/envelope.js.gzip?r=1696937760"></script><script src="/gfx/pol/menu_suggested_shop_for_language.js.gzip?r=1696937760"></script><script src="/gfx/pol/menu_compare.js.gzip?r=1696937760"></script><script src="/gfx/pol/menu_shoppinglist.js.gzip?r=1696937760"></script><script src="/gfx/pol/menu_additionalpayments.js.gzip?r=1696937760"></script><script src="/gfx/pol/menu_omnibus.js.gzip?r=1696937760"></script><script src="/gfx/pol/express_checkout.js.gzip?r=1696937760"></script><script src="/gfx/pol/basketedit_productslist.js.gzip?r=1696937760"></script><script src="/gfx/pol/basketedit_summary.js.gzip?r=1696937760"></script>

	
	<iaixsl:value-of disable-output-escaping="yes" select="php:functionString('additionalContent', 'additional_body_scripts')"/>
  
	<script>app_shop.runApp();</script>
	
	<iaixsl:if test="/shop/page/seolink_with_language_directory"/>

	<iaixsl:if test="(action/set_render/item/@name = 'popup') or not(action/set_render/item)">
		<iaixsl:text disable-output-escaping="yes">&lt;/body&gt;&lt;/html&gt;</iaixsl:text>
	</iaixsl:if>
</iaixsl:template><iaixsl:template match="//image"><iaixsl:if test="@type='swf'"><object type="application/x-shockwave-flash"><iaixsl:attribute name="data"><iaixsl:value-of select="@src"/></iaixsl:attribute><iaixsl:attribute name="data"><iaixsl:value-of select="@src"/></iaixsl:attribute><iaixsl:attribute name="width"><iaixsl:value-of select="@width"/></iaixsl:attribute><iaixsl:attribute name="height"><iaixsl:value-of select="@height"/></iaixsl:attribute><param name="movie"><iaixsl:attribute name="value"><iaixsl:value-of select="@src"/></iaixsl:attribute></param><param name="bgcolor"><iaixsl:attribute name="bgcolor"><iaixsl:value-of select="@bgcolor"/></iaixsl:attribute></param></object></iaixsl:if><iaixsl:if test="not(@type='swf')"><img alt="" class="pic"><iaixsl:attribute name="src"><iaixsl:value-of select="@src"/></iaixsl:attribute><iaixsl:if test="@width &gt; 0"><iaixsl:attribute name="width"><iaixsl:value-of select="@width"/></iaixsl:attribute></iaixsl:if><iaixsl:if test="@height &gt; 0"><iaixsl:attribute name="height"><iaixsl:value-of select="@height"/></iaixsl:attribute></iaixsl:if></img></iaixsl:if></iaixsl:template><iaixsl:template name="escape-backslash"><iaixsl:param name="str" select="."/><iaixsl:choose><iaixsl:when test="contains($str, '\')"><iaixsl:value-of select="concat(substring-before($str, '\'), '\\' )"/><iaixsl:call-template name="escape-backslash"><iaixsl:with-param name="str" select="substring-after($str, '\')"/></iaixsl:call-template></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="$str"/></iaixsl:otherwise></iaixsl:choose></iaixsl:template><iaixsl:template name="escape-quote-string"><iaixsl:param name="str"/><iaixsl:param name="escape_backslash"/><iaixsl:param name="escape" select="'quot'"/><iaixsl:param name="quoting" select="'1'"/><iaixsl:variable name="escape_sign"><iaixsl:choose><iaixsl:when test="$escape=&quot;apos&quot;"><iaixsl:value-of select="&quot;'&quot;"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="string('&quot;')"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable><iaixsl:if test="$quoting"><iaixsl:value-of select="$escape_sign"/></iaixsl:if><iaixsl:choose><iaixsl:when test="contains($str,$escape_sign)"><iaixsl:variable name="before-first-apostrophe" select="substring-before($str,$escape_sign)"/><iaixsl:variable name="after-first-apostrophe" select="substring-after($str,$escape_sign)"/><iaixsl:value-of select="$before-first-apostrophe"/>\<iaixsl:value-of select="$escape_sign"/><iaixsl:text/><iaixsl:call-template name="escape-quote-string"><iaixsl:with-param name="str" select="$after-first-apostrophe"/><iaixsl:with-param name="escape" select="$escape"/><iaixsl:with-param name="quoting" select="0"/></iaixsl:call-template></iaixsl:when><iaixsl:otherwise><iaixsl:choose><iaixsl:when test="not($escape_backslash)"><iaixsl:value-of select="$str"/></iaixsl:when><iaixsl:otherwise><iaixsl:call-template name="escape-backslash"><iaixsl:with-param name="str" select="$str"/></iaixsl:call-template></iaixsl:otherwise></iaixsl:choose></iaixsl:otherwise></iaixsl:choose><iaixsl:if test="$quoting"><iaixsl:value-of select="$escape_sign"/></iaixsl:if></iaixsl:template></iaixsl:stylesheet>