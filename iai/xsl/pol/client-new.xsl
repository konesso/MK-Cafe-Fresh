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

        <!-- (client_new_cms, 60dd8e7ac01704.75042056.9)-->
            <iaixsl:if test="page/text/body">
                <iaixsl:variable name="loginedit_cms_label">Dodatkowe informacje</iaixsl:variable>
                <div class="loginedit_cms">
                    <iaixsl:if test="$loginedit_cms_label and not($loginedit_cms_label = '')">
                        <div class="client_cms_label">
                            <span class="n53873_label">
                                <iaixsl:value-of select="$loginedit_cms_label"/>
                            </span>
                        </div>
                    </iaixsl:if>
                    <div class="loginedit_cms_sub cm">
                        <iaixsl:value-of disable-output-escaping="yes" select="page/text/body"/>
                    </div>
                </div>
            </iaixsl:if>
        <!-- (client_new_social_networking, 60dd8e7f82fe90.58717902.5)-->
	<iaixsl:if test="not(login_options/service[@connected='true']) and not(/shop/page/client-data/@associated = 'true') and not(page/client-data/@operation = 'register-wholesale-add') and not(page/client-data/@operation = 'edit-wholesale-add')and not(page/client-data/@operation = 'edit-wholesale-edit')">
		<iaixsl:choose>
			<iaixsl:when test="/shop/page/client-data">
				<iaixsl:if test="count(login_options/service)&gt;1 and not(/shop/page/client-data/@registerByExternalService='true')">
					<div id="client_new_social">
						<iaixsl:if test="page/client-data/@action = 'password_token'">
							<iaixsl:attribute name="class">d-none</iaixsl:attribute>
						</iaixsl:if>
						<iaixsl:if test="/shop/page/client-data/@edit='true'">
							<h2>
								<iaixsl:attribute name="class">big_label</iaixsl:attribute>
								Połącz konto z innym serwisem
							</h2>
						</iaixsl:if>
						<iaixsl:if test="not(/shop/page/client-data/@edit='true')">
							<h2>
								<iaixsl:attribute name="class">big_label</iaixsl:attribute>
								Połącz konto z innym serwisem
							</h2>
						</iaixsl:if>

						<div class="client_new_social_sub">
							<iaixsl:if test="not(page/client-data/@allow_register = 'false')">
								<iaixsl:if test="/shop/page/client-data/@edit='true'">
									<p/>
								</iaixsl:if>
								<iaixsl:if test="not(/shop/page/client-data/@edit='true')">
									<p/>
								</iaixsl:if>
							</iaixsl:if>

							<iaixsl:if test="page/client-data/@allow_register = 'false'">
								<div class="client_new_form_info" id="client_new_form_info">
									Zaloguj się na którąś z niżej wymienionych formy logowania aby dokończyć rejestrację.
								</div>
							</iaixsl:if>

							<iaixsl:if test="count(login_options/service)&gt;1">
								<ul>
									<iaixsl:for-each select="login_options/service[not(@name='shop_register') and @login_url]">
										<li>
											<iaixsl:choose>
												<iaixsl:when test="@login_url">
													<a class="btn --outline --medium --icon-left service_item">
														<iaixsl:attribute name="data-name">service_<iaixsl:value-of select="translate(@name, ' +', '_')"/></iaixsl:attribute>
														<iaixsl:attribute name="href"><iaixsl:value-of select="@login_url"/></iaixsl:attribute>
														<span><iaixsl:value-of select="@name"/></span>
													</a>
												</iaixsl:when>
												<iaixsl:otherwise>
													<strong class="btn --outline --medium --icon-left service_item">
														<iaixsl:attribute name="data-name">service_<iaixsl:value-of select="translate(@name, ' +', '_')"/></iaixsl:attribute>
														<iaixsl:attribute name="data-service"><iaixsl:value-of select="translate(@name, ' +', '_')"/></iaixsl:attribute>
														<span><iaixsl:value-of select="@name"/></span>
													</strong>
												</iaixsl:otherwise>
											</iaixsl:choose>
										</li><iaixsl:text> </iaixsl:text>
									</iaixsl:for-each>
								</ul>
							</iaixsl:if>
						</div>
					</div>
				</iaixsl:if>
			</iaixsl:when>
		</iaixsl:choose>

		
		<iaixsl:choose>
			<iaixsl:when test="/shop/page/communicates/message/@type='login_connect'">
				<div style="display:none;">
					<div id="client_new_social_info">
						<h2>Łączenie konta z serwisu  <iaixsl:value-of select="/shop/page/communicates/message/@value"/></h2>
						<strong>
							Pomyślnie pobraliśmy informacje o Twoim koncie z serwisu <iaixsl:value-of select="/shop/page/communicates/message/@value"/>. <br/><br/>Uzupełnij brakujące dane potrzebne do wysyłki i zakończ rejestrację konta.
						</strong>
						<button class="btn --solid --medium go_to_register_form">
							Przejdź do formularza rejestracji 
						</button>
					</div>
				</div>
			</iaixsl:when>

			<iaixsl:when test="/shop/page/communicates/message/@type='login_connected'">
				<div style="display:none;">
					<div id="client_new_social_info">
						<h2>Łączenie konta z serwisu  <iaixsl:value-of select="/shop/page/communicates/message/@value"/></h2>
						<strong>
							Pomyślnie połączono Twoje konto w sklepie z kontem w serwisie  <iaixsl:value-of select="/shop/page/communicates/message/@value"/>. <br/><br/>Przejdź do formularza rejestracji i sprawdź aktualność swoich danych.
						</strong>
						<button class="btn --solid --medium go_to_register_form2">
							Przejdź do formularza rejestracji
						</button>
					</div>
				</div>
			</iaixsl:when>
		</iaixsl:choose>
	</iaixsl:if>
<!-- (client_new_form, 61f913c5ca2498.74482757.12)-->

		<iaixsl:variable name="data_edit_blocked">Część Twoich danych może edytować tylko obsługa sklepu</iaixsl:variable>
		<iaixsl:variable name="n81519_order2_document_invoice"/>
		<iaixsl:variable name="mail_newsletter_active"><iaixsl:value-of select="/shop/page/client-data/contact_data/@mailing"/></iaixsl:variable>
		<iaixsl:variable name="sms_newsletter_active"><iaixsl:value-of select="/shop/page/client-data/contact_data/@send_sms"/></iaixsl:variable>
		<iaixsl:variable name="streetNumber">1</iaixsl:variable>
		
		<iaixsl:if test="not(/shop/page/client-data/@associated = 'true')">
		
		<iaixsl:variable name="client_new_mode"><iaixsl:choose><iaixsl:when test="/shop/page/client-data/@edit='true'">edit</iaixsl:when><iaixsl:when test="/shop/page/client-data/@register='true'">register</iaixsl:when><iaixsl:when test="not(/shop/page/client-data/@edit='true')">onceorder</iaixsl:when></iaixsl:choose></iaixsl:variable>
		
		<iaixsl:variable name="is_firm"><iaixsl:choose><iaixsl:when test="(/shop/page/client-data/client_type/@type = 'firm') or (page/client-data/@operation = 'register-wholesale-add') or (page/client-data/@operation = 'edit-wholesale-add') or  (page/client-data/@operation = 'edit-wholesale-edit')">true</iaixsl:when><iaixsl:otherwise>false</iaixsl:otherwise></iaixsl:choose></iaixsl:variable>


		<script type="text/javascript" class="ajaxLoad">
			<iaixsl:if test="/shop/page/client-data/profile_data/@min_password_length and /shop/page/client-data/profile_data/@max_password_length">
				var ClNewPasswordLengthMin =&quot;<iaixsl:value-of select="/shop/page/client-data/profile_data/@min_password_length"/>&quot;;
				var ClNewPasswordLengthMax =&quot;<iaixsl:value-of select="/shop/page/client-data/profile_data/@max_password_length"/>&quot;;
			</iaixsl:if>
			var  is_firm = <iaixsl:value-of select="$is_firm"/>;
			var  client_new_mode = &quot;<iaixsl:value-of select="$client_new_mode"/>&quot;;
		</script>

		<iaixsl:if test="page/client-data/@disallow_change_company_data = 'true'">
			<div class="menu_messages_message">
				<div class="menu_messages_message_sub">
					<p>
						<iaixsl:value-of select="$data_edit_blocked"/>
					</p>
				</div>
			</div>
		</iaixsl:if>

		<form method="post" class="form-horizontal" id="client_new_form" enctype="multipart/form-data">
			<iaixsl:if test="not(/shop/page/client-data/@operation = '')">
				<iaixsl:attribute name="action">client-new.php?<iaixsl:value-of select="/shop/page/client-data/@operation"/></iaixsl:attribute>
			</iaixsl:if>

			<iaixsl:if test="/shop/page/client-data/@operation = 'register-wholesale-add'">
				<iaixsl:attribute name="action">client-new.php?register&amp;wholesaler=true</iaixsl:attribute>
			</iaixsl:if>

			<iaixsl:attribute name="class">form-horizontal
			  
			  <iaixsl:if test="not(/shop/page/client-data/payer_data/@use = 'yes')">invoice_to_billingaddr</iaixsl:if>

			  
			  <iaixsl:if test="(/shop/page/client-data/delivery_data/@use = 'no') and not(/shop/page/client-data/@action = 'change_delivery_address')">
				deliver_to_billingaddr
			  </iaixsl:if>
			  type-<iaixsl:value-of select="$client_new_mode"/>
			</iaixsl:attribute>

			
			<input type="hidden" name="operation">
				<iaixsl:attribute name="value"><iaixsl:value-of select="/shop/page/client-data/@action"/></iaixsl:attribute>
			</input>
			<iaixsl:if test="/shop/page/client-data/wholesale_data/@id">
				<input type="hidden" name="appId">
					<iaixsl:attribute name="value"><iaixsl:value-of select="/shop/page/client-data/wholesale_data/@id"/></iaixsl:attribute>
				</input>
			</iaixsl:if>



			
			<iaixsl:if test="(page/client-data/@operation = 'register-wholesale-add') or (page/client-data/@operation = 'edit-wholesale-add') or (page/client-data/@operation = 'edit-wholesale-edit')">
				<div class="row clearfix wholesale_box">
					<div class="col-12">
						<h2 class="big_label" id="wholesale_header">
							Rejestracja hurtownika
						</h2>
					</div>
					<div class="col-12">
						<div class="wholesale_box cn_wrapper">

							
							<div class="form-group --radio">
								<label class="control-label">
									<iaixsl:choose>
										<iaixsl:when test="/shop/contact/owner/@vat_registered = 'false' and $n81519_order2_document_invoice !=''">
											
										</iaixsl:when>
										<iaixsl:otherwise>
											Faktury:
										</iaixsl:otherwise>
									</iaixsl:choose>
								</label>
								<div class="form-control-static">
									<div class="f-group --radio">
										<input id="client_vat_payer_k" name="client_vat_payer" type="radio" value="k" class="f-control">
											<iaixsl:if test="/shop/page/client-data/wholesale_data/@vat_payer='k'"><iaixsl:attribute name="checked">checked</iaixsl:attribute></iaixsl:if>
										</input>
										<label class="f-label" for="client_vat_payer_k">krajowe</label>
									</div>

									<div class="f-group --radio">
										<input id="client_vat_payer_w" name="client_vat_payer" type="radio" value="w" class="f-control">
											<iaixsl:if test="/shop/page/client-data/wholesale_data/@vat_payer='w'"><iaixsl:attribute name="checked">checked</iaixsl:attribute></iaixsl:if>
										</input>
										<label class="f-label" for="client_vat_payer_w">wewnątrzunijne</label>
									</div>

									<div class="f-group --radio">
										<input id="client_vat_payer_e" name="client_vat_payer" type="radio" value="e" class="f-control">
											<iaixsl:if test="/shop/page/client-data/wholesale_data/@vat_payer='e'"><iaixsl:attribute name="checked">checked</iaixsl:attribute></iaixsl:if>
										</input>
										<label class="f-label" for="client_vat_payer_e">eksportowe</label>
									</div>
								</div>
							</div>

							<div class="form-group">
								<div class="has-feedback">
									<textarea class="form-control" rows="3" id="client_description" name="client_description"><iaixsl:value-of select="/shop/page/client-data/wholesale_data/@description"/></textarea>
									<label for="client_description" class="control-label">
										Opis działalności:
									</label>
								</div>
							</div>
						</div>
					</div>
					<div class="col-12">
						<div class="wholesale_box cn_wrapper">
							<div class="form-group">
								<label for="client_attachment1" class="control-label">
									Załącznik 1 <small>(max 10MB)</small>:
								</label>
								<div class="form-control-static">
									<input id="client_attachment1" type="file" name="client_attachment1" size="14">
										<iaixsl:if test="/shop/form_data/upload_file/max_filesize/@bytes">
											<iaixsl:attribute name="data-max_filesize"><iaixsl:value-of select="/shop/form_data/upload_file/max_filesize/@bytes"/></iaixsl:attribute>
										</iaixsl:if>
									</input>
									<iaixsl:if test="/shop/page/client-data/wholesale_data/@file1_link">
										<p class="help-block">
											[
											<a>
												<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/page/client-data/wholesale_data/@file1_link"/></iaixsl:attribute>
												zobacz
											</a>
											]
										</p>
									</iaixsl:if>
								</div>
							</div>

							<div class="form-group">
								<label for="client_attachment2" class="control-label">
									Załącznik 2 <small>(max 10MB)</small>:
								</label>
								<div class="form-control-static">
									<input id="client_attachment2" type="file" name="client_attachment2" size="14">
										<iaixsl:if test="/shop/form_data/upload_file/max_filesize/@bytes">
											<iaixsl:attribute name="data-max_filesize"><iaixsl:value-of select="/shop/form_data/upload_file/max_filesize/@bytes"/></iaixsl:attribute>
										</iaixsl:if>
									</input>
									<iaixsl:if test="/shop/page/client-data/wholesale_data/@file2_link">
										<p class="help-block">
											[
											<a>
												<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/page/client-data/wholesale_data/@file2_link"/></iaixsl:attribute>
												zobacz
											</a>
											]
										</p>
									</iaixsl:if>
								</div>
							</div>

							<div class="form-group">
								<label for="client_attachment3" class="control-label">
									Załącznik 3 <small>(max 10MB)</small>:
								</label>
								<div class="form-control-static">
									<input id="client_attachment3" type="file" name="client_attachment3" size="14">
										<iaixsl:if test="/shop/form_data/upload_file/max_filesize/@bytes">
											<iaixsl:attribute name="data-max_filesize"><iaixsl:value-of select="/shop/form_data/upload_file/max_filesize/@bytes"/></iaixsl:attribute>
										</iaixsl:if>
									</input>
									<iaixsl:if test="/shop/page/client-data/wholesale_data/@file3_link">
										<p class="help-block">
											[
											<a>
												<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/page/client-data/wholesale_data/@file3_link"/></iaixsl:attribute>
												zobacz
											</a>
											]
										</p>
									</iaixsl:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</iaixsl:if>


			
			<div class="row clearfix">
				<div class="col-12" id="client_new_client">

					<h2 class="big_label" id="client_header">
					  Twoje dane
					</h2>

					<iaixsl:choose>
						<iaixsl:when test="/shop/page/client-data/@operation = 'register' and /shop/action/registration_options/wholesale">
							<div class="cn_wrapper choose_other_form">
								<i class="icon-wholesaler-register"/> Jesteś hurtownikiem? Skorzystaj z <a>
									<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/registration_options/wholesale/@registration_url"/></iaixsl:attribute>
									<iaixsl:attribute name="title">Kliknij, aby przejść do formularza rejestracji dla hurtowników</iaixsl:attribute>
									formularza rejestracji dla hurtowników
								</a>
							</div>
						</iaixsl:when>
						<iaixsl:when test="/shop/page/client-data/@operation = 'register-wholesale-add' and /shop/action/registration_options/retail">
							<div class="cn_wrapper choose_other_form">
								<i class="icon-register-card"/> Jesteś klientem detalicznym? Skorzystaj z <a>
									<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/registration_options/retail/@registration_url"/></iaixsl:attribute>
									<iaixsl:attribute name="title">Kliknij, aby przejść do formularza rejestracji dla detalistów</iaixsl:attribute>
									uproszczonego formularza rejestracji.
								</a>
							</div>
						</iaixsl:when>
					</iaixsl:choose>

					<div class="client_box cn_wrapper">
						<iaixsl:if test="not((page/client-data/@operation = 'register-wholesale-add') or (page/client-data/@operation = 'edit-wholesale-add') or  (page/client-data/@operation = 'edit-wholesale-edit')) or (page/client-data/@disallow_change_company_data = 'false')">
							<div class="form-group --radio firm_switcher">
								<label class="control-label">
									Zamawiasz jako:
								</label>
								<div class="form-control-static">
									<iaixsl:if test="not( (page/client-data/@operation = 'register-wholesale-add') or (page/client-data/@operation = 'edit-wholesale-add') or (page/client-data/@operation = 'edit-wholesale-edit') )">
										<div class="f-group --radio">
											<input type="radio" id="client_type2" value="private" name="client_type" class="f-control">
												<iaixsl:if test="$is_firm = 'false'">
													<iaixsl:attribute name="checked">checked</iaixsl:attribute>
												</iaixsl:if>
											</input>
											<label class="f-label" for="client_type2">Osoba prywatna</label>
										</div>
									</iaixsl:if>
									<div class="f-group --radio">
										<input type="radio" id="client_type1" value="firm" name="client_type" class="f-control">
											<iaixsl:if test="$is_firm = 'true'">
												<iaixsl:attribute name="checked">checked</iaixsl:attribute>
											</iaixsl:if>
										</input>
										<label class="f-label" for="client_type1">Firma</label>
									</div>
								</div>
							</div>

							<div class="form-group firm-group">
								<iaixsl:if test="$is_firm = 'false'"><iaixsl:attribute name="style">display:none;</iaixsl:attribute></iaixsl:if>

								<div class="row">
									
									<div class="has-feedback has-required col-sm-6 col-12">
										<iaixsl:if test="/shop/page/client-data/nip/@active = 'hide'"><iaixsl:attribute name="class">has-feedback has-required col-12</iaixsl:attribute></iaixsl:if>
										<input type="text" class="form-control validate" name="client_firm" id="client_firm">
											<iaixsl:if test="not(/shop/page/client-data/invoice_data/@firm = '')"><iaixsl:attribute name="class">form-control validate focused</iaixsl:attribute></iaixsl:if>
											<iaixsl:attribute name="required">required</iaixsl:attribute>
											<iaixsl:attribute name="maxlength"><iaixsl:value-of select="/shop/page/input_option/@additional"/></iaixsl:attribute>
											<iaixsl:attribute name="value"><iaixsl:value-of select="/shop/page/client-data/invoice_data/@firm"/></iaixsl:attribute>
											<iaixsl:if test="$is_firm = 'false'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
											
											<iaixsl:if test="page/client-data/@disallow_change_company_data = 'true'"><iaixsl:attribute name="readonly">readonly</iaixsl:attribute></iaixsl:if>
										</input>
										<label for="client_firm" class="control-label">
											Nazwa firmy
										</label>
										<span class="form-control-feedback"/>
									</div>

									
									<iaixsl:if test="/shop/page/client-data/nip/@active != 'hide'">
										<div>
											<iaixsl:attribute name="class">has-feedback <iaixsl:if test="/shop/page/client-data/nip/@active = 'required'">has-required </iaixsl:if>col-sm-6 col-12</iaixsl:attribute>
											<input type="text" class="form-control validate" name="client_nip" id="client_nip" data-serialize="#client_region">
												<iaixsl:if test="not(/shop/page/client-data/invoice_data/@nip = '')"><iaixsl:attribute name="class">form-control validate focused</iaixsl:attribute></iaixsl:if>
												<iaixsl:if test="/shop/page/client-data/nip/@active = 'required'"><iaixsl:attribute name="required">required</iaixsl:attribute></iaixsl:if>
												<iaixsl:attribute name="maxlength"><iaixsl:value-of select="/shop/page/input_option/@tax_number"/></iaixsl:attribute>
												<iaixsl:attribute name="value"><iaixsl:value-of select="/shop/page/client-data/invoice_data/@nip"/></iaixsl:attribute>
												<iaixsl:if test="$is_firm = 'false'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
												<iaixsl:if test="page/client-data/@disallow_change_company_data = 'true'"><iaixsl:attribute name="readonly">readonly</iaixsl:attribute></iaixsl:if>
											</input>
											<label for="client_nip" class="control-label">
												NIP
											</label>
											<span class="form-control-feedback"/>
										</div>
									</iaixsl:if>
								</div>
							</div>
						</iaixsl:if>


						<div class="form-group">
							<div class="row">
								
								<div id="client_firstname_wrapper" class="has-feedback has-required col-6">
									<input id="client_firstname" type="text" class="form-control validate" name="client_firstname">
										<iaixsl:if test="not(/shop/page/client-data/invoice_data/@firstname = '')"><iaixsl:attribute name="class">form-control validate focused</iaixsl:attribute></iaixsl:if>
										<iaixsl:attribute name="maxlength"><iaixsl:value-of select="/shop/page/input_option/@name"/></iaixsl:attribute>
										<iaixsl:attribute name="value"><iaixsl:value-of select="/shop/page/client-data/invoice_data/@firstname"/></iaixsl:attribute>
										<iaixsl:if test="page/client-data/@disallow_change_company_data = 'true'"><iaixsl:attribute name="readonly">readonly</iaixsl:attribute></iaixsl:if>
										<iaixsl:attribute name="required">required</iaixsl:attribute>
									</input>
									<label for="client_firstname" class="control-label">
										Imię
									</label>
									<span class="form-control-feedback"/>
								</div>

								
								<div id="client_lastname_wrapper" class="has-feedback has-required col-6">
									<input id="client_lastname" type="text" class="form-control validate" name="client_lastname">
										<iaixsl:if test="not(/shop/page/client-data/invoice_data/@lastname = '')"><iaixsl:attribute name="class">form-control validate focused</iaixsl:attribute></iaixsl:if>
										<iaixsl:attribute name="maxlength"><iaixsl:value-of select="/shop/page/input_option/@lastname"/></iaixsl:attribute>
										<iaixsl:attribute name="value"><iaixsl:value-of select="/shop/page/client-data/invoice_data/@lastname"/></iaixsl:attribute>
										<iaixsl:if test="page/client-data/@disallow_change_company_data = 'true'"><iaixsl:attribute name="readonly">readonly</iaixsl:attribute></iaixsl:if>
										<iaixsl:if test="/shop/page/client-data/profile_data/@mandatory_lastname = 'true'"><iaixsl:attribute name="required">required</iaixsl:attribute></iaixsl:if>
									</input>
									<label for="client_lastname" class="control-label">
										Nazwisko
									</label>
									<span class="form-control-feedback"/>
								</div>
							</div>
						</div>

						
						<iaixsl:if test="(/shop/page/client-data/client_type/@active != 'n') and not(/shop/page/client-data/client_type/@type = 'firm')">
							<div class="form-group --radio" id="client_sex">
								<label class="control-label">
									Płeć</label>
								<div class="form-control-static">
									<div class="f-group --radio">
										<input type="radio" name="client_sex" id="client_sex_male" value="male" class="f-control">
											<iaixsl:if test="(/shop/page/client-data/client_type/@type = 'male')"><iaixsl:attribute name="checked">checked</iaixsl:attribute></iaixsl:if>
											<iaixsl:if test="(/shop/page/client-data/client_type/@type = '')"><iaixsl:attribute name="checked">checked</iaixsl:attribute></iaixsl:if>
											<iaixsl:if test="page/client-data/@disallow_change_company_data = 'true'"><iaixsl:attribute name="readonly">readonly</iaixsl:attribute></iaixsl:if>
											<iaixsl:attribute name="required">required</iaixsl:attribute>
										</input>
										<label class="f-label" for="client_sex_male">Mężczyzna</label>
									</div>
									<div class="f-group --radio">
										<input type="radio" name="client_sex" id="client_sex_female" value="female" class="f-control">
											<iaixsl:if test="(/shop/page/client-data/client_type/@type = 'female')"><iaixsl:attribute name="checked">checked</iaixsl:attribute></iaixsl:if>
											<iaixsl:if test="page/client-data/@disallow_change_company_data = 'true'"><iaixsl:attribute name="readonly">readonly</iaixsl:attribute></iaixsl:if>
											<iaixsl:attribute name="required">required</iaixsl:attribute>
										</input>
										<label class="f-label" for="client_sex_female">Kobieta</label>
									</div>
								</div>
							</div>
						</iaixsl:if>

						
						<iaixsl:if test="/shop/page/client-data/birth_date/@active != 'hide'">
							<div class="form-group row">
								<div>
									<iaixsl:attribute name="class">has-feedback <iaixsl:if test="/shop/page/client-data/birth_date/@active='required'">has-required </iaixsl:if>col-12</iaixsl:attribute>
									<input id="birth_date" type="text" class="form-control validate" name="birth_date">
										<iaixsl:if test="not(/shop/page/client-data/birth_date/@date = '')"><iaixsl:attribute name="class">form-control validate focused</iaixsl:attribute></iaixsl:if>
										<iaixsl:attribute name="maxlength"><iaixsl:value-of select="/shop/page/input_option/@birthdate"/></iaixsl:attribute>
										<iaixsl:if test="/shop/page/client-data/birth_date/@date != '0000-00-00'"><iaixsl:attribute name="value"><iaixsl:value-of select="/shop/page/client-data/birth_date/@date"/></iaixsl:attribute></iaixsl:if>
										<iaixsl:if test="/shop/page/client-data/birth_date/@active='required'"><iaixsl:attribute name="required">required</iaixsl:attribute></iaixsl:if>
									</input>
									<label for="birth_date" class="control-label">
										Data urodzenia
									</label>
									<span class="form-control-feedback"/>
								</div>
							</div>
						</iaixsl:if>

						
						<div class="form-group row">
							<div id="client_street_wrapper" class="has-feedback has-required col-6 col-md-9">
								<iaixsl:if test="not($streetNumber)">
									<iaixsl:attribute name="class">has-feedback has-required col-12</iaixsl:attribute>
								</iaixsl:if>
								<input id="client_street" type="text" class="form-control validate" name="client_street" data-serialize="#client_region" data-concatFrom="#client_street_number">
									<iaixsl:if test="not(/shop/page/client-data/invoice_data/@street = '')"><iaixsl:attribute name="class">form-control validate focused</iaixsl:attribute></iaixsl:if>
									<iaixsl:attribute name="maxlength"><iaixsl:value-of select="/shop/page/input_option/@addres"/></iaixsl:attribute>
									<iaixsl:attribute name="value"><iaixsl:value-of select="/shop/page/client-data/invoice_data/@street"/></iaixsl:attribute>
									<iaixsl:if test="page/client-data/@disallow_change_company_data = 'true'"><iaixsl:attribute name="readonly">readonly</iaixsl:attribute></iaixsl:if>
									<iaixsl:attribute name="required">required</iaixsl:attribute>
								</input>
								<label for="client_street" class="control-label">
									<iaixsl:choose>
										<iaixsl:when test="not($streetNumber)">
											Ulica i numer
										</iaixsl:when>
										<iaixsl:otherwise>
											Ulica
										</iaixsl:otherwise>
									</iaixsl:choose>
								</label>
								<span class="form-control-feedback"/>
							</div>
							<iaixsl:if test="$streetNumber">
								<div id="client_street_number_wrapper" class="has-feedback has-required col-6 col-md-3">
									<input id="client_street_number" type="text" class="form-control" name="client_street_number" data-concatTo="#client_street">
										<iaixsl:if test="not(/shop/page/client-data/invoice_data/@street = '')"><iaixsl:attribute name="class">form-control focused</iaixsl:attribute></iaixsl:if>
										<iaixsl:if test="page/client-data/@disallow_change_company_data = 'true'"><iaixsl:attribute name="readonly">readonly</iaixsl:attribute></iaixsl:if>
									</input>
									<label for="client_street_number" class="control-label">
										Nr domu / lokalu
									</label>
									<span class="form-control-feedback"/>
								</div>
							</iaixsl:if>
						</div>

						<div class="form-group">
							<div class="row">
								
								<div id="zipcode_wrapper" class="has-feedback has-required col-sm-6 col-12">
									<input id="client_zipcode" type="text" class="form-control validate" name="client_zipcode" data-serialize="#client_region">
										<iaixsl:if test="not(/shop/page/client-data/invoice_data/@zipcode = '')"><iaixsl:attribute name="class">form-control validate focused</iaixsl:attribute></iaixsl:if>
										<iaixsl:attribute name="maxlength"><iaixsl:value-of select="/shop/page/input_option/@zipcode"/></iaixsl:attribute>
										<iaixsl:attribute name="value"><iaixsl:value-of select="/shop/page/client-data/invoice_data/@zipcode"/></iaixsl:attribute>
										<iaixsl:if test="page/client-data/@disallow_change_company_data = 'true'"><iaixsl:attribute name="readonly">readonly</iaixsl:attribute></iaixsl:if>
										<iaixsl:attribute name="required">required</iaixsl:attribute>
									</input>
									<label for="client_zipcode" class="control-label">
										Kod pocztowy
									</label>
									<span class="form-control-feedback"/>
								</div>

								
								<div id="city_wrapper" class="has-feedback has-required col-sm-6 col-12">
									<input id="client_city" type="text" class="form-control validate" name="client_city">
										<iaixsl:if test="not(/shop/page/client-data/invoice_data/@city = '')"><iaixsl:attribute name="class">form-control validate focused</iaixsl:attribute></iaixsl:if>
										<iaixsl:attribute name="maxlength"><iaixsl:value-of select="/shop/page/input_option/@city"/></iaixsl:attribute>
										<iaixsl:attribute name="value"><iaixsl:value-of select="/shop/page/client-data/invoice_data/@city"/></iaixsl:attribute>
										<iaixsl:if test="page/client-data/@disallow_change_company_data = 'true'"><iaixsl:attribute name="readonly">readonly</iaixsl:attribute></iaixsl:if>
										<iaixsl:attribute name="required">required</iaixsl:attribute>
									</input>
									<label for="client_city" class="control-label">
										Miejscowość
									</label>
									<span class="form-control-feedback"/>
								</div>
							</div>

						</div>

						
						<iaixsl:choose>
							<iaixsl:when test="count(/shop/page/options/countries/country) = 1">
								
								<input id="client_region" type="hidden" name="client_region">
									<iaixsl:attribute name="value"><iaixsl:value-of select="/shop/page/options/countries/country/@id"/></iaixsl:attribute>
									<iaixsl:attribute name="data-vat_company"><iaixsl:value-of select="/shop/page/options/countries/country/@vat_company"/></iaixsl:attribute>
									<iaixsl:attribute name="data-vat"><iaixsl:value-of select="/shop/page/options/countries/country/@vat"/></iaixsl:attribute>
								</input>
							</iaixsl:when>
							<iaixsl:otherwise>
								<div class="form-group row country">
									<div class="has-feedback col-12">
										<select class="form-control delivery_countries focused" id="client_region" name="client_region" data-revalidate="#client_street,#client_zipcode">
											<iaixsl:if test="page/client-data/@disallow_change_company_data = 'true'"><iaixsl:attribute name="readonly">readonly</iaixsl:attribute></iaixsl:if>
											
											<iaixsl:for-each select="/shop/page/options/countries/country">
												<option>
													<iaixsl:attribute name="value"><iaixsl:value-of select="@id"/></iaixsl:attribute>
													<iaixsl:attribute name="data-vat_company"><iaixsl:value-of select="@vat_company"/></iaixsl:attribute>
													<iaixsl:attribute name="data-vat"><iaixsl:value-of select="@vat"/></iaixsl:attribute>
													<iaixsl:choose>
														<iaixsl:when test="/shop/page/client-data/invoice_data/@region &gt; 0">
															<iaixsl:if test="@id = /shop/page/client-data/invoice_data/@region">
																<iaixsl:attribute name="selected">selected</iaixsl:attribute>
															</iaixsl:if>
														</iaixsl:when>
														<iaixsl:otherwise>
															<iaixsl:if test="@selected = 'true'">
																<iaixsl:attribute name="selected">selected</iaixsl:attribute>
															</iaixsl:if>
														</iaixsl:otherwise>
													</iaixsl:choose>
													<iaixsl:value-of select="@name"/>
												</option>
											</iaixsl:for-each>
										</select>
										<label for="client_region" class="control-label">
											Kraj:
										</label>
									</div>
								</div>
							</iaixsl:otherwise>
						</iaixsl:choose>

						<iaixsl:for-each select="/shop/page/options/countries/country">
							<iaixsl:if test="provinces/province">
								<div class="form-group row client_provinces" style="display: none;">
									<iaixsl:if test="@selected = 'true'"><iaixsl:attribute name="style">display: block;</iaixsl:attribute></iaixsl:if>
									<iaixsl:attribute name="id">client_region_<iaixsl:value-of select="@id"/></iaixsl:attribute>
									<div class="has-feedback col-12">
										<select class="form-control" name="client_province">
											<iaixsl:if test="page/client-data/@disallow_change_company_data = 'true'"><iaixsl:attribute name="readonly">readonly</iaixsl:attribute></iaixsl:if>
											<iaixsl:if test="not(@selected = 'true')"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
											<iaixsl:attribute name="id">client_province_<iaixsl:value-of select="@id"/></iaixsl:attribute>
											
											<iaixsl:if test="not(provinces/province/@id = /shop/page/client-data/invoice_data/@province or provinces/province/@selected)">
												<option disabled="disabled" selected="selected" value="no_province">
													Wybierz 
													<iaixsl:choose>
														<iaixsl:when test="province_types/type/text() = 'state'"> stan</iaixsl:when>
														<iaixsl:when test="province_types/type/text() = 'province'"> prowincję</iaixsl:when>
														<iaixsl:when test="province_types/type/text() = 'territory'"> terytorium</iaixsl:when>
														<iaixsl:otherwise> region</iaixsl:otherwise>
													</iaixsl:choose>
												</option>
											</iaixsl:if>
											<iaixsl:for-each select="provinces/province">
												<option>
													<iaixsl:attribute name="value"><iaixsl:value-of select="@id"/></iaixsl:attribute>

													<iaixsl:choose>
														<iaixsl:when test="/shop/page/client-data/invoice_data/@province &gt; 0">
															<iaixsl:if test="@id = /shop/page/client-data/invoice_data/@province">
																<iaixsl:attribute name="selected">selected</iaixsl:attribute>
															</iaixsl:if>
														</iaixsl:when>
														<iaixsl:otherwise>
															<iaixsl:if test="@selected = 'true'">
																<iaixsl:attribute name="selected">selected</iaixsl:attribute>
															</iaixsl:if>
														</iaixsl:otherwise>
													</iaixsl:choose>
													<iaixsl:value-of select="@name"/>
												</option>
											</iaixsl:for-each>
										</select>
										<label for="client_province" class="control-label">
											<iaixsl:for-each select="province_types/type">
												<iaixsl:choose>
													<iaixsl:when test="text() = 'state'">Stan</iaixsl:when>
													<iaixsl:when test="text() = 'province'">Prowincja</iaixsl:when>
													<iaixsl:when test="text() = 'territory'">Terytorium</iaixsl:when>
													<iaixsl:otherwise>Region</iaixsl:otherwise>
												</iaixsl:choose><iaixsl:if test="not(position() = last())">/</iaixsl:if></iaixsl:for-each>:
										</label>
									</div>
								</div>
							</iaixsl:if>
						</iaixsl:for-each>

						<div class="form-group">
							<div class="row">
								
								<div class="has-feedback has-required col-12">
									<iaixsl:if test="not(/shop/page/client-data/contact_data/@mandatory_phone = 'true')">
										<iaixsl:attribute name="class">has-feedback col-12</iaixsl:attribute>
									</iaixsl:if>
									<input id="client_phone" type="tel" class="form-control validate" name="client_phone" data-serialize="#client_region">
										<iaixsl:if test="not(/shop/page/client-data/contact_data/@phone = '')"><iaixsl:attribute name="class">form-control validate focused</iaixsl:attribute></iaixsl:if>
										<iaixsl:attribute name="value"><iaixsl:value-of select="/shop/page/client-data/contact_data/@phone"/></iaixsl:attribute>
										<iaixsl:if test="/shop/page/client-data/contact_data/@mandatory_phone = 'true'">
											<iaixsl:attribute name="required">required</iaixsl:attribute>
										</iaixsl:if>
									</input>
									<label for="client_phone" class="control-label">
										Numer telefonu
									</label>
									<span class="form-control-feedback"/>
									<div class="form-desc col-12">
										Na potrzeby realizacji dostawy przez kuriera
									</div>
								</div>

								
								<div class="has-feedback has-required col-12">
									<iaixsl:if test="not(/shop/page/client-data/contact_data/@mandatory_email = 'true')">
										<iaixsl:attribute name="class">has-feedback col-12</iaixsl:attribute>
									</iaixsl:if>
									<input id="client_email" type="email" class="form-control validate" name="client_email">
										<iaixsl:if test="not(/shop/page/client-data/contact_data/@email = '')"><iaixsl:attribute name="class">form-control validate focused</iaixsl:attribute></iaixsl:if>
										<iaixsl:attribute name="value"><iaixsl:value-of select="/shop/page/client-data/contact_data/@email"/></iaixsl:attribute>
										<iaixsl:if test="/shop/page/client-data/contact_data/@mandatory_email = 'true'">
											<iaixsl:attribute name="required">required</iaixsl:attribute>
										</iaixsl:if>
									</input>
									<label for="client_email" class="control-label">
										Adres e-mail
									</label>
									<span class="form-control-feedback"/>
								</div>
							</div>
						</div>
					</div>
				</div>
				<iaixsl:if test="not(/shop/page/client-data/delivery_data/@use = 'hide') and not(/shop/client_data/association/@parentClientId)">
        <div class="col-12" id="delivery_box_switcher">
					<iaixsl:if test="page/client-data/@action = 'change_delivery_address' and $client_new_mode = 'edit'">
						<iaixsl:attribute name="data-mode">change_delivery_address</iaixsl:attribute>
					</iaixsl:if>
					<div class="cn_wrapper">
						<div class="form-group row">
							<input type="checkbox" name="deliver_to_billingaddr" id="deliver_to_billingaddr" value="1">
								<iaixsl:if test="(/shop/page/client-data/delivery_data/@use = 'yes') or page/client-data/@action = 'change_delivery_address'"> 
										<iaixsl:attribute name="checked">checked</iaixsl:attribute>
										<iaixsl:attribute name="value">0</iaixsl:attribute>
								</iaixsl:if>
							</input>
							<label for="deliver_to_billingaddr" class="control-label">
								Wysyłka na inny adres:
							</label>
						</div>
					</div>
				</div>
        </iaixsl:if>
				<div class="col-12" id="client_new_additional">
					<iaixsl:if test="/shop/page/options/countries/country[@selected='true']">
						<iaixsl:attribute name="data-active-country"><iaixsl:value-of select="/shop/page/options/countries/country[@selected='true']/@id"/></iaixsl:attribute>
					</iaixsl:if>

					<iaixsl:if test="basket/@login and not(/shop/page/client-data/delivery_data/@use = 'hide')">
						<iaixsl:variable name="additional_hide"><iaixsl:choose><iaixsl:when test="(/shop/page/client-data/delivery_data/@use = 'no') and not(/shop/page/client-data/@action = 'change_delivery_address')">true</iaixsl:when><iaixsl:otherwise>false</iaixsl:otherwise></iaixsl:choose></iaixsl:variable>
						<iaixsl:for-each select="page/client-data/addresses-list/address[@default = 'yes']">
							<div class="additional_box cn_wrapper">
								
								<iaixsl:if test="count(/shop/page/client-data/addresses-list/address) &gt; 1">
									<div class="form-group addresses_list_wrapper">
										<iaixsl:for-each select="/shop/page/client-data/addresses-list/address[@default = 'yes']">
											<input type="hidden" name="delivery_id" id="delivery_id" class="addresse_id"><iaixsl:attribute name="value"><iaixsl:value-of select="@id"/></iaixsl:attribute></input>
											<input type="hidden" name="default_delivery_id" id="default_delivery_id"><iaixsl:attribute name="value"><iaixsl:value-of select="@id"/></iaixsl:attribute></input>
										</iaixsl:for-each>
										<div class="col-12 px-0">
											<div class="dropdown cn_dropdown">
                                                <div class="addresses-editable">
                                                    <iaixsl:if test="@editable = 'yes' or $additional_hide = 'true'">
                                                        <iaixsl:attribute name="style">display: none;</iaixsl:attribute>
                                                    </iaixsl:if>
                                                    * Nie można edytować adresu, który został już wykorzystany.
                                                </div>
												<button class="btn --solid --icon-right icon-reorder dropdown-toggle" type="button" id="dropdownAdressMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
													Wybierz z listy adresów
												</button>
												<ul class="dropdown-menu addresses-list" aria-labelledby="dropdownAdressMenu">
													<iaixsl:for-each select="/shop/page/client-data/addresses-list/address">
														<li>
															<a>
																<iaixsl:attribute name="data-wrapper">#client_new_additional</iaixsl:attribute>
																<iaixsl:attribute name="data-id"><iaixsl:value-of select="@id"/></iaixsl:attribute>
																<iaixsl:attribute name="data-zipcode"><iaixsl:value-of select="@zipcode"/></iaixsl:attribute>
																<iaixsl:attribute name="data-phone"><iaixsl:value-of select="@phone"/></iaixsl:attribute>
																<iaixsl:attribute name="data-region_id"><iaixsl:value-of select="@region_id"/></iaixsl:attribute>
																<iaixsl:attribute name="data-country_name"><iaixsl:value-of select="@country_name"/></iaixsl:attribute>
																<iaixsl:attribute name="data-removable"><iaixsl:value-of select="@removable"/></iaixsl:attribute>
																<iaixsl:attribute name="data-editable"><iaixsl:value-of select="@editable"/></iaixsl:attribute>
																<iaixsl:attribute name="data-used"><iaixsl:value-of select="@used"/></iaixsl:attribute>

																<iaixsl:if test="@default = 'yes'"><iaixsl:attribute name="class">active</iaixsl:attribute></iaixsl:if>
																<iaixsl:attribute name="href">#address_<iaixsl:value-of select="@id"/></iaixsl:attribute>
																<span><iaixsl:if test="not(@additional = '')"><iaixsl:value-of select="@additional"/><iaixsl:text> </iaixsl:text></iaixsl:if><iaixsl:value-of select="@firstname"/><iaixsl:text> </iaixsl:text><iaixsl:value-of select="@lastname"/></span>
																<span><iaixsl:value-of select="@street"/></span>
																<span><iaixsl:value-of select="@zipcode"/><iaixsl:text> </iaixsl:text><iaixsl:value-of select="@city"/></span>

																<span style="display:none">
																	<span class="data-additional"><iaixsl:value-of select="@additional"/></span>
																	<span class="data-firstname"><iaixsl:value-of select="@firstname"/></span>
																	<span class="data-lastname"><iaixsl:value-of select="@lastname"/></span>
																	<span class="data-street"><iaixsl:value-of select="@street"/></span>
																	<span class="data-city"><iaixsl:value-of select="@city"/></span>
																</span>
															</a>
														</li>
													</iaixsl:for-each>
												</ul>
											</div>
										</div>
									</div>
								</iaixsl:if>
								
								<div class="form-group">
									<div class="row">
										
										<div id="additional_firstname_wrapper" class="has-feedback has-required col-6">
											<input id="additional_firstname" type="text" class="form-control validate focused" name="additional_firstname">
												<iaixsl:attribute name="value"><iaixsl:value-of select="@firstname"/></iaixsl:attribute>
												<iaixsl:if test="@editable = 'no' or $additional_hide = 'true'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
												<iaixsl:attribute name="required">required</iaixsl:attribute>
											</input>
											<label for="additional_firstname" class="control-label">
												Imię
											</label>
											<span class="form-control-feedback"/>
										</div>

										
										<div id="additional_lastname_wrapper" class="has-feedback has-required col-6">
											<iaixsl:if test="not(/shop/page/client-data/profile_data/@mandatory_lastname = 'true')">
												<iaixsl:attribute name="class">has-feedback col-sm-6 col-12</iaixsl:attribute>
											</iaixsl:if>
											<input id="additional_lastname" type="text" class="form-control validate focused" name="additional_lastname">
												<iaixsl:attribute name="value"><iaixsl:value-of select="@lastname"/></iaixsl:attribute>
												<iaixsl:if test="@editable = 'no' or $additional_hide = 'true'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
												<iaixsl:if test="/shop/page/client-data/profile_data/@mandatory_lastname = 'true'"><iaixsl:attribute name="required">required</iaixsl:attribute></iaixsl:if>
											</input>
											<label for="additional_lastname" class="control-label">
												Nazwisko
											</label>
											<span class="form-control-feedback"/>
										</div>
									</div>
								</div>

								
								<div class="form-group row">
									<div class="has-feedback col-12">
										<input id="additional_additional" type="text" class="form-control validate " name="additional_additional">
											<iaixsl:if test="not(@additional = '')"><iaixsl:attribute name="class">form-control validate focused</iaixsl:attribute></iaixsl:if>
											<iaixsl:attribute name="value"><iaixsl:value-of select="@additional"/></iaixsl:attribute>
											<iaixsl:if test="@editable = 'no' or $additional_hide = 'true'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
										</input>
										<label for="additional_additional" class="control-label">
											Nazwa firmy
										</label>
										<span class="form-control-feedback"/>
									</div>
								</div>

								
								<div class="form-group row">
									<div id="additional_street_wrapper" class="has-feedback has-required col-6 col-md-9">
									<iaixsl:if test="not($streetNumber)">
										<iaixsl:attribute name="class">has-feedback has-required col-12</iaixsl:attribute>
									</iaixsl:if>
										<input id="additional_street" type="text" class="form-control validate focused" name="additional_street" data-serialize="#additional_region" data-concatFrom="#additional_street_number">
											<iaixsl:attribute name="value"><iaixsl:value-of select="@street"/></iaixsl:attribute>
											<iaixsl:if test="@editable = 'no' or $additional_hide = 'true'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
											<iaixsl:attribute name="required">required</iaixsl:attribute>
										</input>
										<label for="additional_street" class="control-label">
											<iaixsl:choose>
												<iaixsl:when test="not($streetNumber)">
													Ulica i numer
												</iaixsl:when>
												<iaixsl:otherwise>
													Ulica
												</iaixsl:otherwise>
											</iaixsl:choose>
										</label>
										<span class="form-control-feedback"/>
									</div>
									<iaixsl:if test="$streetNumber">
										<div id="additional_street_number_wrapper" class="has-feedback has-required col-6 col-md-3">
											<input id="additional_street_number" type="text" class="form-control focused" name="additional_street_number" data-concatTo="#additional_street">
												<iaixsl:if test="@editable = 'no' or $additional_hide = 'true'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
											</input>
											<label for="additional_street_number" class="control-label">
												Nr domu / lokalu
											</label>
											<span class="form-control-feedback"/>
										</div>
										</iaixsl:if>
									</div>
								
								
								<div class="form-group">
									<div class="row">
										<div id="delivery_zipcode_wrapper" class="has-feedback has-required col-sm-6 col-12">
											<input id="additional_zipcode" type="text" class="form-control validate focused" name="additional_zipcode" data-serialize="#additional_region">
												<iaixsl:attribute name="value"><iaixsl:value-of select="@zipcode"/></iaixsl:attribute>
												<iaixsl:if test="@editable = 'no' or $additional_hide = 'true'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
												<iaixsl:attribute name="required">required</iaixsl:attribute>
											</input>
											<label for="additional_zipcode" class="control-label">
												Kod pocztowy
											</label>
											<span class="form-control-feedback"/>
										</div>
										<div id="delivery_city_wrapper" class="has-feedback has-required col-sm-6 col-12">
											<input id="additional_city" type="text" class="form-control validate focused" name="additional_city">
												<iaixsl:attribute name="value"><iaixsl:value-of select="@city"/></iaixsl:attribute>
												<iaixsl:if test="@editable = 'no'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
												<iaixsl:attribute name="required">required</iaixsl:attribute>
											</input>
											<label for="additional_city" class="control-label">
												Miejscowość
											</label>
											<span class="form-control-feedback"/>
										</div>
									</div>
								</div>

								
								<iaixsl:choose>
									<iaixsl:when test="count(/shop/page/options/countries/country) = 1">
										
										<input id="additional_region" type="hidden" name="additional_region">
											<iaixsl:attribute name="value"><iaixsl:value-of select="/shop/page/options/countries/country/@id"/></iaixsl:attribute>
											<iaixsl:attribute name="data-vat_company"><iaixsl:value-of select="/shop/page/options/countries/country/@vat_company"/></iaixsl:attribute>
											<iaixsl:attribute name="data-vat"><iaixsl:value-of select="/shop/page/options/countries/country/@vat"/></iaixsl:attribute>
										</input>
									</iaixsl:when>
									<iaixsl:otherwise>
										<div class="form-group row country">
											<div class="has-feedback col-12">
												<select class="form-control delivery_countries focused" id="additional_region" name="additional_region" data-revalidate="#additional_street,#additional_zipcode">
													<iaixsl:if test="@editable = 'no' or $additional_hide = 'true'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
													<iaixsl:for-each select="/shop/page/options/countries/country">
														<option>
															<iaixsl:attribute name="value"><iaixsl:value-of select="@id"/></iaixsl:attribute>
															<iaixsl:attribute name="data-vat_company"><iaixsl:value-of select="@vat_company"/></iaixsl:attribute>
															<iaixsl:attribute name="data-vat"><iaixsl:value-of select="@vat"/></iaixsl:attribute>
															<iaixsl:if test="@id = /shop/page/options/countries/@delivery_active ">
																<iaixsl:attribute name="selected">selected</iaixsl:attribute>
															</iaixsl:if>
															<iaixsl:value-of select="@name"/>
														</option>
													</iaixsl:for-each>
												</select>
												<label for="additional_region" class="control-label">
													Kraj
												</label>
											</div>
										</div>
									</iaixsl:otherwise>
								</iaixsl:choose>

								<iaixsl:variable name="default_province"><iaixsl:value-of select="@province"/></iaixsl:variable>
								<iaixsl:variable name="editable_province"><iaixsl:value-of select="@editable"/></iaixsl:variable>
								<iaixsl:for-each select="/shop/page/options/countries/country">
									<iaixsl:if test="provinces/province">
										<div class="form-group row client_provinces" style="display: none;">
											<iaixsl:if test="@id = /shop/page/options/countries/@delivery_active"><iaixsl:attribute name="style">display: block;</iaixsl:attribute></iaixsl:if>
											<iaixsl:attribute name="id">additional_region_<iaixsl:value-of select="@id"/></iaixsl:attribute>
											<div>
												<iaixsl:attribute name="class">col-12</iaixsl:attribute>

												<select class="form-control" name="additional_province">
													<iaixsl:if test="not(@id = /shop/page/options/countries/@delivery_active)"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
													<iaixsl:if test="$editable_province = 'no' or $additional_hide = 'true'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>

													<iaixsl:if test="not(provinces/province/@id = $default_province)">
														<option disabled="disabled" selected="selected" value="no_province">
															Wybierz 
															<iaixsl:choose>
																<iaixsl:when test="province_types/type/text() = 'state'"> stan</iaixsl:when>
																<iaixsl:when test="province_types/type/text() = 'province'"> prowincję</iaixsl:when>
																<iaixsl:when test="province_types/type/text() = 'territory'"> terytorium</iaixsl:when>
																<iaixsl:otherwise> region</iaixsl:otherwise>
															</iaixsl:choose>
														</option>
													</iaixsl:if>
													<iaixsl:for-each select="provinces/province">
														<option>
															<iaixsl:attribute name="value"><iaixsl:value-of select="@id"/></iaixsl:attribute>
															<iaixsl:if test="@id = $default_province">
																<iaixsl:attribute name="selected">selected</iaixsl:attribute>
															</iaixsl:if>
															<iaixsl:value-of select="@name"/>
														</option>
													</iaixsl:for-each>
												</select>
												<label for="additional_province" class="control-label">

													<iaixsl:for-each select="province_types/type">
														<iaixsl:choose>
															<iaixsl:when test="text() = 'state'">Stan</iaixsl:when>
															<iaixsl:when test="text() = 'province'">Prowincja</iaixsl:when>
															<iaixsl:when test="text() = 'territory'">Terytorium</iaixsl:when>
															<iaixsl:otherwise>Region</iaixsl:otherwise>
														</iaixsl:choose><iaixsl:if test="not(position() = last())">/</iaixsl:if></iaixsl:for-each>:
												</label>
											</div>
										</div>
									</iaixsl:if>
								</iaixsl:for-each>

								
								<div class="form-group row">
									<div class="has-feedback has-required col-12">
										<iaixsl:if test="not(/shop/page/client-data/contact_data/@mandatory_phone = 'true')">
											<iaixsl:attribute name="class">has-feedback col-12</iaixsl:attribute>
										</iaixsl:if>
										<input id="additional_phone" type="tel" class="form-control validate" name="additional_phone" data-serialize="#additional_region">
											<iaixsl:if test="not(@phone = '')"><iaixsl:attribute name="class">form-control validate focused</iaixsl:attribute></iaixsl:if>
											<iaixsl:attribute name="value"><iaixsl:value-of select="@phone"/></iaixsl:attribute>
											<iaixsl:if test="@editable = 'no' or $additional_hide = 'true'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
											<iaixsl:if test="/shop/page/client-data/contact_data/@mandatory_phone = 'true'">
												<iaixsl:attribute name="required">required</iaixsl:attribute>
											</iaixsl:if>
										</input>
										<label for="additional_phone" class="control-label">
											Telefon
										</label>
										<span class="form-control-feedback"/>
										<div class="form-desc col-12">
											Na potrzeby realizacji dostawy przez kuriera
										</div>
									</div>
								</div>

								<div class="form-group button-form">
									<div class="col-12 px-0">
										<button id="delete_delivery_address" class="btn --solid delete_address">
											<iaixsl:if test="not(@removable = 'yes')"><iaixsl:attribute name="style">display: none;</iaixsl:attribute></iaixsl:if>
											Usuń adres
										</button>
										<button id="new_delivery_address" class="btn --solid new_address">
											Dodaj nowy adres
										</button>
										<button id="save_delivery_address" type="submit" class="btn --solid save_address">
											Zapisz adres
										</button>
									</div>
								</div>
							</div>
						</iaixsl:for-each>
					</iaixsl:if>

					<iaixsl:if test="not(/shop/page/client-data/@edit = 'true') and (/shop/page/client-data/delivery_data/@use != 'hide')">
						<div class="delivery_box cn_wrapper">
							<iaixsl:for-each select="/shop/page/client-data/delivery_data">
								<div class="form-group">
									<div class="row">
										
										<div id="delivery_firstname_wrapper" class="has-feedback has-required col-6">
											<input id="delivery_firstname" type="text" class="form-control validate" name="delivery_firstname">
												<iaixsl:attribute name="value"><iaixsl:value-of select="@firstname"/></iaixsl:attribute>
												<iaixsl:attribute name="maxlength"><iaixsl:value-of select="/shop/page/input_option/@name"/></iaixsl:attribute>
												<iaixsl:if test="@use = 'no'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
												<iaixsl:attribute name="required">required</iaixsl:attribute>
											</input>
											<label for="delivery_firstname" class="control-label">
												Imię
											</label>
											<span class="form-control-feedback"/>
										</div>

										
										<div id="delivery_lastname_wrapper" class="has-feedback has-required col-6">
											<iaixsl:if test="/shop/page/client-data/profile_data/@mandatory_lastname = 'true'">
												<iaixsl:attribute name="class">has-feedback col-6</iaixsl:attribute>
											</iaixsl:if>
											<input id="delivery_lastname" type="text" class="form-control validate" name="delivery_lastname">
												<iaixsl:attribute name="value"><iaixsl:value-of select="@lastname"/></iaixsl:attribute>
												<iaixsl:attribute name="maxlength"><iaixsl:value-of select="/shop/page/input_option/@name"/></iaixsl:attribute>
												<iaixsl:if test="@use = 'no'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
												<iaixsl:if test="/shop/page/client-data/profile_data/@mandatory_lastname = 'true'"><iaixsl:attribute name="required">required</iaixsl:attribute></iaixsl:if>
											</input>
											<label for="delivery_lastname" class="control-label">
												Nazwisko
											</label>
											<span class="form-control-feedback"/>
										</div>
									</div>
								</div>

								
								<div class="form-group row">
									<div class="has-feedback col-12">
										<input id="delivery_additional" type="text" class="form-control validate" name="delivery_additional">
											<iaixsl:attribute name="value"><iaixsl:value-of select="@additional"/></iaixsl:attribute>
											<iaixsl:attribute name="maxlength"><iaixsl:value-of select="/shop/page/input_option/@additional"/></iaixsl:attribute>
											<iaixsl:if test="@use = 'no'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
										</input>
										<label for="delivery_additional" class="control-label">
											Nazwa firmy
										</label>
										<span class="form-control-feedback"/>
									</div>
								</div>

								
								<div class="form-group row">
									<div id="delivery_street_wrapper" class="has-feedback has-required col-6 col-md-9">
									<iaixsl:if test="not($streetNumber)">
										<iaixsl:attribute name="class">has-feedback has-required col-12</iaixsl:attribute>
									</iaixsl:if>
										<input id="delivery_street" type="text" class="form-control validate" name="delivery_street" data-serialize="#delivery_region" data-concatFrom="#delivery_street_number">
											<iaixsl:attribute name="value"><iaixsl:value-of select="@street"/></iaixsl:attribute>
											<iaixsl:attribute name="maxlength"><iaixsl:value-of select="/shop/page/input_option/@addres"/></iaixsl:attribute>
											<iaixsl:if test="@use = 'no'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
											<iaixsl:attribute name="required">required</iaixsl:attribute>
										</input>
										<label for="delivery_street" class="control-label">
											<iaixsl:choose>
												<iaixsl:when test="not($streetNumber)">
													Ulica i numer
												</iaixsl:when>
												<iaixsl:otherwise>
													Ulica
												</iaixsl:otherwise>
											</iaixsl:choose>
										</label>
										<span class="form-control-feedback"/>
									</div>
									<iaixsl:if test="$streetNumber">
										<div id="delivery_street_wrapper" class="has-feedback has-required col-6 col-md-3">
											<input id="delivery_street_number" type="text" class="form-control" name="delivery_street_number" data-concatTo="#delivery_street">
												<iaixsl:if test="@use = 'no'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
											</input>
											<label for="delivery_street_number" class="control-label">
												Nr domu / lokalu
											</label>
											<span class="form-control-feedback"/>
										</div>
										</iaixsl:if>
									</div>
								
								
								<div class="form-group">
									<div class="row">
										<div id="new_delivery_zipcode_wrapper" class="has-feedback has-required col-sm-6 col-12">
											<input id="delivery_zipcode" type="text" class="form-control validate" name="delivery_zipcode" data-serialize="#delivery_region">
												<iaixsl:attribute name="value"><iaixsl:value-of select="@zipcode"/></iaixsl:attribute>
												<iaixsl:attribute name="maxlength"><iaixsl:value-of select="/shop/page/input_option/@zipcode"/></iaixsl:attribute>
												<iaixsl:if test="@use = 'no'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
												<iaixsl:attribute name="required">required</iaixsl:attribute>
											</input>
											<label for="delivery_zipcode" class="control-label">
												Kod pocztowy
											</label>
											<span class="form-control-feedback"/>
										</div>
										<div id="new_delivery_city_wrapper" class="has-feedback has-required col-sm-6 col-12">
											<input id="delivery_city" type="text" class="form-control validate" name="delivery_city">
												<iaixsl:attribute name="value"><iaixsl:value-of select="@city"/></iaixsl:attribute>
												<iaixsl:attribute name="maxlength"><iaixsl:value-of select="/shop/page/input_option/@city"/></iaixsl:attribute>
												<iaixsl:if test="@use = 'no'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
												<iaixsl:attribute name="required">required</iaixsl:attribute>
											</input>
											<label for="delivery_city" class="control-label">
												Miejscowość
											</label>
											<span class="form-control-feedback"/>
										</div>
									</div>
								</div>

								
								<iaixsl:choose>
									<iaixsl:when test="count(/shop/page/options/countries/country) = 1">
										
										<input id="delivery_region" type="hidden" name="delivery_region">
											<iaixsl:attribute name="value"><iaixsl:value-of select="/shop/page/options/countries/country/@id"/></iaixsl:attribute>
											<iaixsl:attribute name="data-vat_company"><iaixsl:value-of select="/shop/page/options/countries/country/@vat_company"/></iaixsl:attribute>
											<iaixsl:attribute name="data-vat"><iaixsl:value-of select="/shop/page/options/countries/country/@vat"/></iaixsl:attribute>

											<iaixsl:if test="(/shop/page/client-data/delivery_data/@use = 'no')">
												<iaixsl:attribute name="disabled">disabled</iaixsl:attribute>
											</iaixsl:if>
										</input>
									</iaixsl:when>
									<iaixsl:otherwise>
										<div class="form-group row country">
											<div class="has-feedback col-12">
												<select class="form-control delivery_countries focused" id="delivery_region" name="delivery_region" data-revalidate="#delivery_street,#delivery_zipcode">
													<iaixsl:if test="(/shop/page/client-data/delivery_data/@use = 'no')">
														<iaixsl:attribute name="disabled">disabled</iaixsl:attribute>
													</iaixsl:if>
													<iaixsl:for-each select="/shop/page/options/countries/country">
														<option>
															<iaixsl:attribute name="value"><iaixsl:value-of select="@id"/></iaixsl:attribute>
															<iaixsl:attribute name="data-vat_company"><iaixsl:value-of select="@vat_company"/></iaixsl:attribute>
															<iaixsl:attribute name="data-vat"><iaixsl:value-of select="@vat"/></iaixsl:attribute>

															<iaixsl:if test="(@id = /shop/page/client-data/delivery_data/@region) or (@selected = 'true')">
																<iaixsl:attribute name="selected">selected</iaixsl:attribute>
															</iaixsl:if>
															<iaixsl:value-of select="@name"/>
														</option>
													</iaixsl:for-each>
												</select>
												<label for="delivery_region" class="control-label">
													Kraj
												</label>
											</div>
										</div>
									</iaixsl:otherwise>
								</iaixsl:choose>

								<iaixsl:for-each select="/shop/page/options/countries/country">
									<iaixsl:if test="provinces/province">
										<div class="form-group row client_provinces" style="display: none;">
											<iaixsl:attribute name="id">delivery_region_<iaixsl:value-of select="@id"/></iaixsl:attribute>
											<div>
												<iaixsl:attribute name="class">col-12</iaixsl:attribute>
												<select class="form-control" name="delivery_province">
													<iaixsl:attribute name="disabled">disabled</iaixsl:attribute>
													<iaixsl:if test="not(provinces/province/@id = /shop/page/client-data/invoice_data/@province or provinces/province/@selected = 'true')">
														<option disabled="disabled" selected="selected" value="no_province">
															Wybierz 
															<iaixsl:choose>
																<iaixsl:when test="province_types/type/text() = 'state'"> stan</iaixsl:when>
																<iaixsl:when test="province_types/type/text() = 'province'"> prowincję</iaixsl:when>
																<iaixsl:when test="province_types/type/text() = 'territory'"> terytorium</iaixsl:when>
																<iaixsl:otherwise> region</iaixsl:otherwise>
															</iaixsl:choose>
														</option>
													</iaixsl:if>
													<iaixsl:for-each select="provinces/province">
														<option>
															<iaixsl:attribute name="value"><iaixsl:value-of select="@id"/></iaixsl:attribute>
															<iaixsl:if test="(@id = /shop/page/client-data/invoice_data/@province) or (@selected = 'true')">
																<iaixsl:attribute name="selected">selected</iaixsl:attribute>
															</iaixsl:if>
															<iaixsl:value-of select="@name"/>
														</option>
													</iaixsl:for-each>
												</select>
												<label for="delivery_province" class="control-label">
													<iaixsl:for-each select="province_types/type">
														<iaixsl:choose>
															<iaixsl:when test="text() = 'state'">Stan</iaixsl:when>
															<iaixsl:when test="text() = 'province'">Prowincja</iaixsl:when>
															<iaixsl:when test="text() = 'territory'">Terytorium</iaixsl:when>
															<iaixsl:otherwise>Region</iaixsl:otherwise>
														</iaixsl:choose><iaixsl:if test="not(position() = last())">/</iaixsl:if></iaixsl:for-each>:
												</label>
											</div>
										</div>
									</iaixsl:if>
								</iaixsl:for-each>

								
								<div class="form-group row">
									<div class="has-feedback has-required col-12">
										<iaixsl:if test="not(/shop/page/client-data/contact_data/@mandatory_phone = 'true')">
											<iaixsl:attribute name="class">has-feedback col-12</iaixsl:attribute>
										</iaixsl:if>
										<input id="delivery_phone" type="text" class="form-control validate" name="delivery_phone" data-serialize="#delivery_region">
											<iaixsl:attribute name="value"><iaixsl:value-of select="@phone"/></iaixsl:attribute>
											<iaixsl:attribute name="maxlength"><iaixsl:value-of select="/shop/page/input_option/@phone"/></iaixsl:attribute>
											<iaixsl:if test="@use = 'no'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
											<iaixsl:if test="/shop/page/client-data/contact_data/@mandatory_phone = 'true'">
												<iaixsl:attribute name="required">required</iaixsl:attribute>
											</iaixsl:if>
										</input>
										<label for="delivery_phone" class="control-label">
											Telefon
										</label>
										<span class="form-control-feedback"/>
																			<div class="form-desc col-12">
										Na potrzeby realizacji dostawy przez kuriera
									</div>
									</div>
								</div>
							</iaixsl:for-each>
						</div>
					</iaixsl:if>
				</div>

				
				<iaixsl:variable name="show_invoice_test"/>
				<iaixsl:variable name="use_invoice"><iaixsl:value-of select="/shop/page/client-data/payer_data/@use"/></iaixsl:variable>
				<iaixsl:if test="(/shop/page/client-data/payer_data or $show_invoice_test = 'true') and not(/shop/page/client-data/payer_data/@use = 'hide')">
					<div class="col-12" id="invoice_box_switcher">
						<div class="cn_wrapper">
							<div class="form-group row">
								<input type="checkbox" name="invoice_to_billingaddr" id="invoice_to_billingaddr" value="0">
									<iaixsl:if test="$use_invoice = 'yes'"><iaixsl:attribute name="checked">checked</iaixsl:attribute></iaixsl:if>
								</input>
								<label for="invoice_to_billingaddr" class="control-label">
									Faktura na inne dane:
								</label>
							</div>
						</div>
					</div>

					<div class="col-12" id="client_new_invoice">
						<iaixsl:if test="/shop/page/options/countries/country[@selected='true']">
							<iaixsl:attribute name="data-active-country"><iaixsl:value-of select="/shop/page/options/countries/country[@selected='true']/@id"/></iaixsl:attribute>
						</iaixsl:if>
            <iaixsl:if test="not(/shop/page/client-data/payer_data/@use = 'hide')">
						<div class="additional_box cn_wrapper">
							<iaixsl:if test="/shop/page/client-data/invoice_data-list/address">
								<div class="form-group addresses_list_wrapper">
									<input type="hidden" name="invoice_id" id="invoice_id" class="addresse_id"><iaixsl:attribute name="value"><iaixsl:value-of select="/shop/page/client-data/invoice_data-list/address[@default = 'yes']/@id"/></iaixsl:attribute><iaixsl:if test="not($use_invoice = 'yes')"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if></input>
									<input type="hidden" name="default_invoice_id" id="default_invoice_id"><iaixsl:attribute name="value"><iaixsl:value-of select="/shop/page/client-data/invoice_data-list/address[@default = 'yes']/@id"/></iaixsl:attribute><iaixsl:if test="not($use_invoice = 'yes')"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if></input>
									<div class="col-12 px-0">
										<div class="dropdown cn_dropdown">
                                            <div class="addresses-editable">
                                                <iaixsl:if test="/shop/page/client-data/invoice_data-list/address[@default = 'yes']/@editable = 'yes' or /shop/page/client-data/payer_data/@use = 'no'">
                                                    <iaixsl:attribute name="style">display: none;</iaixsl:attribute>
                                                </iaixsl:if>
                                                * Nie można edytować adresu, który został już wykorzystany.
                                            </div>
											<button class="btn --solid --icon-right icon-reorder dropdown-toggle" type="button" id="dropdownAdressMenuInvoice" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
												Wybierz z listy adresów
											</button>
											<ul class="dropdown-menu invoice_data-list" aria-labelledby="dropdownAdressMenuInvoice">
												<iaixsl:for-each select="/shop/page/client-data/invoice_data-list/address">
													<li>
														<a>
														<iaixsl:attribute name="data-wrapper">#client_new_invoice</iaixsl:attribute>
														<iaixsl:attribute name="data-id"><iaixsl:value-of select="@id"/></iaixsl:attribute>
														<iaixsl:attribute name="data-zipcode"><iaixsl:value-of select="@zipcode"/></iaixsl:attribute>
														<iaixsl:attribute name="data-phone"><iaixsl:value-of select="@phone"/></iaixsl:attribute>
														<iaixsl:attribute name="data-region_id"><iaixsl:value-of select="@region_id"/></iaixsl:attribute>
														<iaixsl:attribute name="data-country_name"><iaixsl:value-of select="@country_name"/></iaixsl:attribute>
														<iaixsl:attribute name="data-removable"><iaixsl:value-of select="@removable"/></iaixsl:attribute>
														<iaixsl:attribute name="data-editable"><iaixsl:value-of select="@editable"/></iaixsl:attribute>
														<iaixsl:attribute name="data-used"><iaixsl:value-of select="@used"/></iaixsl:attribute>
														<iaixsl:attribute name="data-firm"><iaixsl:value-of select="@additional"/></iaixsl:attribute>
														<iaixsl:attribute name="data-nip"><iaixsl:value-of select="@nip"/></iaixsl:attribute>

														<iaixsl:if test="@default = 'yes'"><iaixsl:attribute name="class">active</iaixsl:attribute></iaixsl:if>
														<iaixsl:attribute name="href">#address_<iaixsl:value-of select="@id"/></iaixsl:attribute>
														<span><iaixsl:if test="not(@additional = '')"><iaixsl:value-of select="@additional"/><iaixsl:text> </iaixsl:text></iaixsl:if></span>
														<span><iaixsl:if test="not(@nip = '')"><iaixsl:value-of select="@nip"/><iaixsl:text> </iaixsl:text></iaixsl:if></span>
														<span><iaixsl:value-of select="@firstname"/><iaixsl:text> </iaixsl:text><iaixsl:value-of select="@lastname"/></span>
														<span><iaixsl:value-of select="@street"/></span>
														<span><iaixsl:value-of select="@zipcode"/><iaixsl:text> </iaixsl:text><iaixsl:value-of select="@city"/></span>

														<span style="display:none">
															<span class="data-additional"><iaixsl:value-of select="@additional"/></span>
															<span class="data-firstname"><iaixsl:value-of select="@firstname"/></span>
															<span class="data-lastname"><iaixsl:value-of select="@lastname"/></span>
															<span class="data-street"><iaixsl:value-of select="@street"/></span>
															<span class="data-city"><iaixsl:value-of select="@city"/></span>
														</span>
													</a>
												</li>
											</iaixsl:for-each>
										</ul>
									</div>
									</div>
								</div>
							</iaixsl:if>

							<iaixsl:choose>
								<iaixsl:when test="/shop/page/client-data/invoice_data-list/address[@default = 'yes']">
									<iaixsl:for-each select="/shop/page/client-data/invoice_data-list/address[@default = 'yes']">
										
										<div class="form-group row">
											<div class="has-feedback has-required col-12">
												<input type="text" class="form-control validate" name="invoice_firm" id="invoice_firm">
													<iaixsl:attribute name="required">required</iaixsl:attribute>
													<iaixsl:attribute name="value"><iaixsl:value-of select="@additional"/></iaixsl:attribute>
													<iaixsl:if test="@editable = 'no'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
												</input>
												<label for="invoice_firm" class="control-label">
													Nazwa firmy
												</label>
												<span class="form-control-feedback"/>
											</div>
										</div>

										
										<iaixsl:if test="/shop/page/client-data/nip/@active != 'hide'">
											<div class="form-group row">
												<div>
													<iaixsl:attribute name="class">
														has-feedback <iaixsl:if test="/shop/page/invoice-data/nip/@active = 'required'">has-required </iaixsl:if>col-12
													</iaixsl:attribute>
													<input type="text" class="form-control validate" name="invoice_nip" id="invoice_nip" data-serialize="#invoice_region">
														<iaixsl:if test="/shop/page/client-data/nip/@active = 'required'">
															<iaixsl:attribute name="required">required</iaixsl:attribute>
														</iaixsl:if>
														<iaixsl:attribute name="maxlength"><iaixsl:value-of select="/shop/page/input_option/@tax_number"/></iaixsl:attribute>
														<iaixsl:attribute name="value"><iaixsl:value-of select="@nip"/></iaixsl:attribute>
														<iaixsl:if test="@editable = 'no'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
													</input>
													<label for="invoice_nip" class="control-label">
														NIP
													</label>
													<span class="form-control-feedback"/>
												</div>
											</div>
										</iaixsl:if>

										<div class="form-group">

											<div class="row">
												
												<div id="invoice_firstname_wrapper" class="has-feedback col-6">
													<input id="invoice_firstname" type="text" class="form-control validate" name="invoice_firstname">
														<iaixsl:attribute name="maxlength"><iaixsl:value-of select="/shop/page/input_option/@name"/></iaixsl:attribute>
														<iaixsl:attribute name="value"><iaixsl:value-of select="@firstname"/></iaixsl:attribute>
														<iaixsl:if test="@editable = 'no'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
													</input>
													<label for="invoice_firstname" class="control-label">
														Imię
													</label>
													<span class="form-control-feedback"/>
												</div>

												
												<div id="invoice_lastname_wrapper" class="has-feedback col-6">
													<input id="invoice_lastname" type="text" class="form-control validate" name="invoice_lastname">
														<iaixsl:attribute name="maxlength"><iaixsl:value-of select="/shop/page/input_option/@lastname"/></iaixsl:attribute>
														<iaixsl:attribute name="value"><iaixsl:value-of select="@lastname"/></iaixsl:attribute>
														<iaixsl:if test="@editable = 'no'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
													</input>
													<label for="invoice_lastname" class="control-label">
														Nazwisko
													</label>
													<span class="form-control-feedback"/>
												</div>
											</div>
										</div>

										
										<div class="form-group row">
											<div id="invoice_street_wrapper" class="has-feedback has-required col-6 col-md-9">
												<iaixsl:if test="not($streetNumber)">
													<iaixsl:attribute name="class">has-feedback has-required col-12</iaixsl:attribute>
												</iaixsl:if>
												<input id="invoice_street" type="text" class="form-control validate" name="invoice_street" data-serialize="#invoice_region" data-concatFrom="#invoice_street_number">
													<iaixsl:attribute name="maxlength"><iaixsl:value-of select="/shop/page/input_option/@addres"/></iaixsl:attribute>
													<iaixsl:attribute name="value"><iaixsl:value-of select="@street"/></iaixsl:attribute>
													<iaixsl:attribute name="required">required</iaixsl:attribute>
													<iaixsl:if test="@editable = 'no'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
												</input>
												<label for="invoice_street" class="control-label">
													<iaixsl:choose>
														<iaixsl:when test="not($streetNumber)">
															Ulica i numer
														</iaixsl:when>
														<iaixsl:otherwise>
															Ulica
														</iaixsl:otherwise>
													</iaixsl:choose>
												</label>
												<span class="form-control-feedback"/>
											</div>
											<iaixsl:if test="$streetNumber">
												<div id="invoice_street_number_wrapper" class="has-feedback has-required col-6 col-md-3">
													<input id="invoice_street_number" type="text" class="form-control" name="invoice_street_number" data-concatTo="#invoice_street">
														<iaixsl:if test="@editable = 'no'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
													</input>
													<label for="invoice_street_number" class="control-label">
														Nr domu / lokalu
													</label>
													<span class="form-control-feedback"/>
												</div>
												</iaixsl:if>
											</div>
										
										
										<div class="form-group">
											<div class="row">
												<div id="invoice_zipcode_wrapper" class="has-feedback has-required col-sm-6 col-12">
													<input id="invoice_zipcode" type="text" class="form-control validate" name="invoice_zipcode" data-serialize="#invoice_region">
														<iaixsl:attribute name="maxlength"><iaixsl:value-of select="/shop/page/input_option/@zipcode"/></iaixsl:attribute>
														<iaixsl:attribute name="value"><iaixsl:value-of select="@zipcode"/></iaixsl:attribute>
														<iaixsl:attribute name="required">required</iaixsl:attribute>
														<iaixsl:if test="@editable = 'no'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
													</input>
													<label for="invoice_zipcode" class="control-label">
														Kod pocztowy
													</label>
													<span class="form-control-feedback"/>
												</div>
												<div id="invoice_city_wrapper" class="has-feedback has-required col-sm-6 col-12">
													<input id="invoice_city" type="text" class="form-control validate" name="invoice_city">
														<iaixsl:attribute name="maxlength"><iaixsl:value-of select="/shop/page/input_option/@city"/></iaixsl:attribute>
														<iaixsl:attribute name="value"><iaixsl:value-of select="@city"/></iaixsl:attribute>
														
														<iaixsl:attribute name="required">required</iaixsl:attribute>
														<iaixsl:if test="@editable = 'no'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
													</input>
													<label for="invoice_city" class="control-label">
														Miejscowość
													</label>
													<span class="form-control-feedback"/>
												</div>
											</div>
										</div>

										
										<iaixsl:choose>
											<iaixsl:when test="count(/shop/page/options/countries/country) = 1">
												
												<input id="invoice_region" type="hidden" name="invoice_region">
													<iaixsl:attribute name="value"><iaixsl:value-of select="/shop/page/options/countries/country/@id"/></iaixsl:attribute>
													<iaixsl:attribute name="data-vat_company"><iaixsl:value-of select="/shop/page/options/countries/country/@vat_company"/></iaixsl:attribute>
													<iaixsl:attribute name="data-vat"><iaixsl:value-of select="/shop/page/options/countries/country/@vat"/></iaixsl:attribute>
												</input>
											</iaixsl:when>
											<iaixsl:otherwise>
												<div class="form-group row country">
													<div class="has-feedback col-12">
														<select class="form-control delivery_countries focused" id="invoice_region" name="invoice_region" data-revalidate="#invoice_street,#invoice_zipcode">
															<iaixsl:if test="@editable = 'no'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
															
															<iaixsl:for-each select="/shop/page/options/countries/country">
																<option>
																	<iaixsl:attribute name="value"><iaixsl:value-of select="@id"/></iaixsl:attribute>
																	<iaixsl:attribute name="data-vat_company"><iaixsl:value-of select="@vat_company"/></iaixsl:attribute>
																	<iaixsl:attribute name="data-vat"><iaixsl:value-of select="@vat"/></iaixsl:attribute>
																	<iaixsl:if test="(@id = /shop/page/client-data/payer_data/@region) or (@selected = 'true')">
																		<iaixsl:attribute name="selected">selected</iaixsl:attribute>
																	</iaixsl:if>
																	<iaixsl:value-of select="@name"/>
																</option>
															</iaixsl:for-each>
														</select>
														<label for="invoice_region" class="control-label">
															Kraj:
														</label>
													</div>
												</div>
											</iaixsl:otherwise>
										</iaixsl:choose>

										<iaixsl:variable name="default_province"><iaixsl:value-of select="@province"/></iaixsl:variable>
										<iaixsl:variable name="editable_province"><iaixsl:value-of select="@editable"/></iaixsl:variable>
										<iaixsl:for-each select="/shop/page/options/countries/country">
											<iaixsl:if test="provinces/province">
												<div class="form-group row client_provinces" style="display: none;">
													<iaixsl:if test="@id = /shop/page/options/countries/@delivery_active"><iaixsl:attribute name="style">display: block;</iaixsl:attribute></iaixsl:if>
													<iaixsl:attribute name="id">invoice_region_<iaixsl:value-of select="@id"/></iaixsl:attribute>
													<div>
														<iaixsl:attribute name="class">col-12</iaixsl:attribute>
														<select class="form-control" name="invoice_province">
															<iaixsl:if test="not(@id = /shop/page/options/countries/@delivery_active)"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
															<iaixsl:if test="$editable_province = 'no'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
															<iaixsl:attribute name="id">invoice_province_<iaixsl:value-of select="@id"/></iaixsl:attribute>
															
															<iaixsl:if test="not(provinces/province/@id = $default_province)">
																<option disabled="disabled" selected="selected" value="no_province">
																	Wybierz 
																	<iaixsl:choose>
																		<iaixsl:when test="province_types/type/text() = 'state'"> stan</iaixsl:when>
																		<iaixsl:when test="province_types/type/text() = 'province'"> prowincję</iaixsl:when>
																		<iaixsl:when test="province_types/type/text() = 'territory'"> terytorium</iaixsl:when>
																		<iaixsl:otherwise> region</iaixsl:otherwise>
																	</iaixsl:choose>
																</option>
															</iaixsl:if>
															<iaixsl:for-each select="provinces/province">
																<option>
																	<iaixsl:attribute name="value"><iaixsl:value-of select="@id"/></iaixsl:attribute>
																	<iaixsl:if test="@id = $default_province">
																		<iaixsl:attribute name="selected">selected</iaixsl:attribute>
																	</iaixsl:if>
																	<iaixsl:value-of select="@name"/>
																</option>
															</iaixsl:for-each>
														</select>
														<label for="invoice_province" class="control-label">
															<iaixsl:for-each select="province_types/type">
																<iaixsl:choose>
																	<iaixsl:when test="text() = 'state'">Stan</iaixsl:when>
																	<iaixsl:when test="text() = 'province'">Prowincja</iaixsl:when>
																	<iaixsl:when test="text() = 'territory'">Terytorium</iaixsl:when>
																	<iaixsl:otherwise>Region</iaixsl:otherwise>
																</iaixsl:choose><iaixsl:if test="not(position() = last())">/</iaixsl:if></iaixsl:for-each>:
														</label>
													</div>
												</div>
											</iaixsl:if>
										</iaixsl:for-each>

										<iaixsl:if test="/shop/page/client-data/invoice_data-list/address">
											<div class="form-group button-form">
												<div class="col-12 px-0">
													<button id="delete_invoice_address" class="btn --solid delete_address">
														<iaixsl:if test="not(@removable = 'yes')"><iaixsl:attribute name="style">display: none;</iaixsl:attribute></iaixsl:if>
														Usuń adres
													</button>
													<button id="new_invoice_address" class="btn --solid new_address">
														Dodaj nowy adres
													</button>
													<button id="save_invoice_address" type="submit" class="btn --solid save_address">
														Zapisz adres
													</button>
												</div>
											</div>
										</iaixsl:if>
									</iaixsl:for-each>
								</iaixsl:when>
								<iaixsl:otherwise>
									<iaixsl:for-each select="/shop/page/client-data/payer_data">
										
										<div class="form-group row">
											<div class="has-feedback has-required col-12">
												<input type="text" class="form-control validate" name="invoice_firm" id="invoice_firm">
													<iaixsl:attribute name="required">required</iaixsl:attribute>
													<iaixsl:attribute name="value"><iaixsl:value-of select="@additional"/></iaixsl:attribute>
													<iaixsl:if test="@use = 'no'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
												</input>
												<label for="invoice_firm" class="control-label">
													Nazwa firmy
												</label>
												<span class="form-control-feedback"/>
											</div>
										</div>

										
										<iaixsl:if test="/shop/page/client-data/nip/@active != 'hide'">
											<div class="form-group row">
												<div>
													<iaixsl:attribute name="class">
														has-feedback <iaixsl:if test="/shop/page/invoice-data/nip/@active = 'required'">has-required </iaixsl:if>col-12
													</iaixsl:attribute>
													<input type="text" class="form-control validate" name="invoice_nip" id="invoice_nip" data-serialize="#invoice_region">
														<iaixsl:if test="/shop/page/client-data/nip/@active = 'required'">
															<iaixsl:attribute name="required">required</iaixsl:attribute>
														</iaixsl:if>
														<iaixsl:attribute name="maxlength"><iaixsl:value-of select="/shop/page/input_option/@tax_number"/></iaixsl:attribute>
														<iaixsl:attribute name="value"><iaixsl:value-of select="@nip"/></iaixsl:attribute>
														<iaixsl:if test="@use = 'no'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
													</input>
													<label for="invoice_nip" class="control-label">
														NIP
													</label>
													<span class="form-control-feedback"/>
												</div>
											</div>
										</iaixsl:if>

										<div class="form-group">

											<div class="row">
												
												<div id="invoice_firstname_wrapper" class="has-feedback col-6">
													<input id="invoice_firstname" type="text" class="form-control validate" name="invoice_firstname">
														<iaixsl:attribute name="maxlength"><iaixsl:value-of select="/shop/page/input_option/@name"/></iaixsl:attribute>
														<iaixsl:attribute name="value"><iaixsl:value-of select="@firstname"/></iaixsl:attribute>
														<iaixsl:if test="@use = 'no'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
													</input>
													<label for="invoice_firstname" class="control-label">
														Imię
													</label>
													<span class="form-control-feedback"/>
												</div>

												
												<div id="invoice_lastname_wrapper" class="has-feedback col-6">
													<input id="invoice_lastname" type="text" class="form-control validate" name="invoice_lastname">
														<iaixsl:attribute name="maxlength"><iaixsl:value-of select="/shop/page/input_option/@lastname"/></iaixsl:attribute>
														<iaixsl:attribute name="value"><iaixsl:value-of select="@lastname"/></iaixsl:attribute>
														<iaixsl:if test="@use = 'no'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
													</input>
													<label for="invoice_lastname" class="control-label">
														Nazwisko
													</label>
													<span class="form-control-feedback"/>
												</div>
											</div>
										</div>

										
										<div class="form-group row">
											<div id="invoice_street_wrapper" class="has-feedback has-required col-6 col-md-9">
												<iaixsl:if test="not($streetNumber)">
													<iaixsl:attribute name="class">has-feedback has-required col-12</iaixsl:attribute>
												</iaixsl:if>
												<input id="invoice_street" type="text" class="form-control validate" name="invoice_street" data-serialize="#invoice_region" data-concatFrom="#invoice_street_number">
													<iaixsl:attribute name="maxlength"><iaixsl:value-of select="/shop/page/input_option/@addres"/></iaixsl:attribute>
													<iaixsl:attribute name="value"><iaixsl:value-of select="@street"/></iaixsl:attribute>
													<iaixsl:attribute name="required">required</iaixsl:attribute>
													<iaixsl:if test="@use = 'no'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
												</input>
												<label for="invoice_street" class="control-label">
													<iaixsl:choose>
														<iaixsl:when test="not($streetNumber)">
															Ulica i numer
														</iaixsl:when>
														<iaixsl:otherwise>
															Ulica
														</iaixsl:otherwise>
													</iaixsl:choose>
												</label>
												<span class="form-control-feedback"/>
											</div>
											<iaixsl:if test="$streetNumber">
												<div id="invoice_street_wrapper" class="has-feedback has-required col-6 col-md-3">
													<input id="invoice_street_number" type="text" class="form-control" name="invoice_street_number" data-concatTo="#invoice_street">
														<iaixsl:if test="@use = 'no'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
													</input>
													<label for="invoice_street_number" class="control-label">
														Nr domu / lokalu
													</label>
													<span class="form-control-feedback"/>
												</div>
												</iaixsl:if>
											</div>
										
										
										<div class="form-group">
											<div class="row">
												<div id="invoice_zipcode_wrapper" class="has-feedback has-required col-sm-6 col-12">
													<input id="invoice_zipcode" type="text" class="form-control validate" name="invoice_zipcode" data-serialize="#invoice_region">
														<iaixsl:attribute name="maxlength"><iaixsl:value-of select="/shop/page/input_option/@zipcode"/></iaixsl:attribute>
														<iaixsl:attribute name="value"><iaixsl:value-of select="@zipcode"/></iaixsl:attribute>
														<iaixsl:attribute name="required">required</iaixsl:attribute>
														<iaixsl:if test="@use = 'no'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
													</input>
													<label for="invoice_zipcode" class="control-label">
														Kod pocztowy
													</label>
													<span class="form-control-feedback"/>
												</div>
												<div id="invoice_city_wrapper" class="has-feedback has-required col-sm-6 col-12">
													<input id="invoice_city" type="text" class="form-control validate" name="invoice_city">
														<iaixsl:attribute name="maxlength"><iaixsl:value-of select="/shop/page/input_option/@city"/></iaixsl:attribute>
														<iaixsl:attribute name="value"><iaixsl:value-of select="@city"/></iaixsl:attribute>
														
														<iaixsl:attribute name="required">required</iaixsl:attribute>
														<iaixsl:if test="@use = 'no'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
													</input>
													<label for="invoice_city" class="control-label">
														Miejscowość
													</label>
													<span class="form-control-feedback"/>
												</div>
											</div>
										</div>

										
										<iaixsl:choose>
											<iaixsl:when test="count(/shop/page/options/countries/country) = 1">
												
												<input id="invoice_region" type="hidden" name="invoice_region">
													<iaixsl:attribute name="value"><iaixsl:value-of select="/shop/page/options/countries/country/@id"/></iaixsl:attribute>
													<iaixsl:attribute name="data-vat_company"><iaixsl:value-of select="/shop/page/options/countries/country/@vat_company"/></iaixsl:attribute>
													<iaixsl:attribute name="data-vat"><iaixsl:value-of select="/shop/page/options/countries/country/@vat"/></iaixsl:attribute>
												</input>
											</iaixsl:when>
											<iaixsl:otherwise>
												<div class="form-group row country">
													<div class="has-feedback col-12">
														<select class="form-control delivery_countries focused" id="invoice_region" name="invoice_region" data-revalidate="#invoice_street,#invoice_zipcode">
															<iaixsl:if test="@use = 'no'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
															
															<iaixsl:for-each select="/shop/page/options/countries/country">
																<option>
																	<iaixsl:attribute name="value"><iaixsl:value-of select="@id"/></iaixsl:attribute>
																	<iaixsl:attribute name="data-vat_company"><iaixsl:value-of select="@vat_company"/></iaixsl:attribute>
																	<iaixsl:attribute name="data-vat"><iaixsl:value-of select="@vat"/></iaixsl:attribute>
																	<iaixsl:if test="(@id = /shop/page/client-data/payer_data/@region) or (@selected = 'true')">
																		<iaixsl:attribute name="selected">selected</iaixsl:attribute>
																	</iaixsl:if>
																	<iaixsl:value-of select="@name"/>
																</option>
															</iaixsl:for-each>
														</select>
														<label for="invoice_region" class="control-label">
															Kraj:
														</label>
													</div>
												</div>
											</iaixsl:otherwise>
										</iaixsl:choose>

										<iaixsl:for-each select="/shop/page/options/countries/country">
											<iaixsl:if test="provinces/province">
												<div class="form-group row client_provinces" style="display: none;">
													<iaixsl:if test="@selected = 'true'"><iaixsl:attribute name="style">display: block;</iaixsl:attribute></iaixsl:if>
													<iaixsl:attribute name="id">invoice_region_<iaixsl:value-of select="@id"/></iaixsl:attribute>
													<div>
														<iaixsl:attribute name="class">col-12</iaixsl:attribute>
														<select class="form-control" name="invoice_province">
															<iaixsl:if test="@use = 'no'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
															<iaixsl:if test="not(@selected = 'true')"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
															<iaixsl:attribute name="id">invoice_province_<iaixsl:value-of select="@id"/></iaixsl:attribute>
															
															<iaixsl:if test="not(provinces/province/@id = @province)">
																<option disabled="disabled" selected="selected" value="no_province">
																	Wybierz 
																	<iaixsl:choose>
																		<iaixsl:when test="province_types/type/text() = 'state'"> stan</iaixsl:when>
																		<iaixsl:when test="province_types/type/text() = 'province'"> prowincję</iaixsl:when>
																		<iaixsl:when test="province_types/type/text() = 'territory'"> terytorium</iaixsl:when>
																		<iaixsl:otherwise> region</iaixsl:otherwise>
																	</iaixsl:choose>
																</option>
															</iaixsl:if>
															<iaixsl:for-each select="provinces/province">
																<option>
																	<iaixsl:attribute name="value"><iaixsl:value-of select="@id"/></iaixsl:attribute>
																	<iaixsl:if test="(@id = /shop/page/client-data/payer_data/@province) or (@selected = 'true')">
																		<iaixsl:attribute name="selected">selected</iaixsl:attribute>
																	</iaixsl:if>
																	<iaixsl:value-of select="@name"/>
																</option>
															</iaixsl:for-each>
														</select>
														<label for="invoice_province" class="control-label">
															<iaixsl:for-each select="province_types/type">
																<iaixsl:choose>
																	<iaixsl:when test="text() = 'state'">Stan</iaixsl:when>
																	<iaixsl:when test="text() = 'province'">Prowincja</iaixsl:when>
																	<iaixsl:when test="text() = 'territory'">Terytorium</iaixsl:when>
																	<iaixsl:otherwise>Region</iaixsl:otherwise>
																</iaixsl:choose><iaixsl:if test="not(position() = last())">/</iaixsl:if></iaixsl:for-each>:
														</label>
													</div>
												</div>
											</iaixsl:if>
										</iaixsl:for-each>

										<iaixsl:if test="/shop/page/client-data/invoice_data-list/address">
											<div class="form-group button-form">
												<div class="col-12 px-0">
													<button id="delete_invoice_address" class="btn --solid delete_address">
														<iaixsl:if test="not(@removable = 'yes')"><iaixsl:attribute name="style">display: none;</iaixsl:attribute></iaixsl:if>
														Usuń adres
													</button>
													<button id="new_invoice_address" class="btn --solid new_address">
														Dodaj nowy adres
													</button>
													<button id="save_invoice_address" type="submit" class="btn --solid save_address">
														Zapisz adres
													</button>
												</div>
											</div>
										</iaixsl:if>

										<iaixsl:if test="not(/shop/page/client-data/invoice_data-list/address) and /shop/basket/@login">
											<div class="form-group button-form">
												<div class="col-12 px-0">
													<button id="save_invoice_address" type="submit" class="btn --solid save_address">
														Zapisz adres
													</button>
												</div>
											</div>
										</iaixsl:if>
									</iaixsl:for-each>
								</iaixsl:otherwise>
							</iaixsl:choose>
						</div>
            </iaixsl:if>
					</div>
				</iaixsl:if>
				

				<iaixsl:if test="$client_new_mode != 'onceorder'">
					<div class="col-12" id="client_new_login">
						<h2 class="big_label">
							Twoje konto
						</h2>

						<div class="login_box cn_wrapper">
							<iaixsl:if test="page/client-data/@action = 'password_token' and $client_new_mode = 'edit'">
								<iaixsl:attribute name="class">login_box cn_wrapper change_password_mode</iaixsl:attribute>
							</iaixsl:if>
							
							<iaixsl:if test="$client_new_mode = 'edit'">
								<div class="form-group has-feedback --radio">
									<label class="control-label">
										
									</label>
									<div>
										<iaixsl:attribute name="class">form-control-static col-12</iaixsl:attribute>
										<div class="f-group --radio">
											<input type="radio" name="client_generate_password" id="client_generate_password1" value="y" checked="checked" class="f-control">
												<iaixsl:if test="not(/shop/page/client-data/@register='true')"><iaixsl:attribute name="name">client_generate_password_n</iaixsl:attribute></iaixsl:if>
											</input>
											<label class="f-label" for="client_generate_password1">Nie zmieniaj hasła</label>
										</div>
										<div class="f-group --radio">
											<input type="radio" name="client_generate_password" id="client_generate_password2" value="no" class="f-control">
												<iaixsl:if test="not(/shop/page/client-data/@register='true')"><iaixsl:attribute name="name">client_generate_password_n</iaixsl:attribute></iaixsl:if>
											</input>
											<label class="f-label" for="client_generate_password2">Zmień swoje hasło</label>
										</div>
									</div>
								</div>
							</iaixsl:if>

							
							<div class="form-group row">
								<div>
									<iaixsl:attribute name="class">has-feedback <iaixsl:if test="not(/shop/page/client-data/@edit = 'true')">has-required </iaixsl:if>col-12</iaixsl:attribute>
									<input id="client_login" type="text" class="form-control validate" name="client_login">
										<iaixsl:if test="not(/shop/page/client-data/profile_data/@login = '')"><iaixsl:attribute name="class">form-control validate focused</iaixsl:attribute></iaixsl:if>
										<iaixsl:if test="$client_new_mode = 'edit'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
										<iaixsl:if test="not(/shop/page/client-data/@edit = 'true')"><iaixsl:attribute name="required">required</iaixsl:attribute></iaixsl:if>
										<iaixsl:attribute name="value"><iaixsl:value-of select="/shop/page/client-data/profile_data/@login"/></iaixsl:attribute>
									</input>
									<label for="client_login" class="control-label">
										Login
									</label>
									<span class="form-control-feedback"/>
								</div>
								<div class="form-desc col-12">
									Login musi mieć minimum 3, a maksimum 40 znaków. Możesz użyć liter i cyfr oraz symboli @ . - _
								</div>
							</div>

							
							<div class="form-group row password-group">
								<iaixsl:if test="$client_new_mode = 'edit'"><iaixsl:attribute name="style">display:none;</iaixsl:attribute></iaixsl:if>
								<div>
									<iaixsl:attribute name="class">has-feedback <iaixsl:if test="/shop/page/client-data/@register='true' and /shop/page/client-data/profile_data/@mandatory_password='true'">has-required </iaixsl:if>col-12</iaixsl:attribute>
									<input id="client_password" class="form-control validate" type="password" name="client_password" autocomplete="new-password">
                    <iaixsl:if test="$client_new_mode = 'edit'"><iaixsl:attribute name="autocomplete">current-password</iaixsl:attribute></iaixsl:if>
										<iaixsl:if test="/shop/page/client-data/profile_data/@max_password_length and /shop/page/client-data/profile_data/@max_password_length &gt; 0">
											<iaixsl:attribute name="maxlength"><iaixsl:value-of select="/shop/page/client-data/profile_data/@max_password_length"/></iaixsl:attribute>
										</iaixsl:if>
										<iaixsl:if test="/shop/page/client-data/@register='true' and /shop/page/client-data/profile_data/@mandatory_password='true'">
											<iaixsl:attribute name="required">required</iaixsl:attribute>
										</iaixsl:if>
										<iaixsl:if test="$client_new_mode = 'edit'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
									</input>
									<label for="client_password" class="control-label">
										Hasło
									</label>
									<span class="form-control-feedback"/>
									<a href="#show_pass" class="show_pass"><i class="icon-visibility"/> Pokaż hasło</a>

									
									<input id="repeat_password" class="form-control validate" type="hidden" name="repeat_password" data-serialize="#client_password" autocomplete="new-password">
										<iaixsl:if test="$client_new_mode = 'edit'"><iaixsl:attribute name="autocomplete">current-password</iaixsl:attribute></iaixsl:if>
                    <iaixsl:if test="/shop/page/client-data/profile_data/@max_password_length and /shop/page/client-data/profile_data/@max_password_length &gt; 0">
											<iaixsl:attribute name="maxlength"><iaixsl:value-of select="/shop/page/client-data/profile_data/@max_password_length"/></iaixsl:attribute>
										</iaixsl:if>
										<iaixsl:if test="/shop/page/client-data/@register='true' and /shop/page/client-data/profile_data/@mandatory_password='true'">
											<iaixsl:attribute name="required">required</iaixsl:attribute>
										</iaixsl:if>
										<iaixsl:if test="$client_new_mode = 'edit'"><iaixsl:attribute name="disabled">disabled</iaixsl:attribute></iaixsl:if>
									</input>
								</div>
								<iaixsl:if test="/shop/page/client-data/profile_data/@max_password_length and /shop/page/client-data/profile_data/@max_password_length &gt; 0">
									<div class="form-desc col-12">
										Hasło musi składać się z minimum 6 znaków
									</div>
								</iaixsl:if>
								<iaixsl:if test="/shop/page/client-data/@register='true' and /shop/page/client-data/profile_data/@mandatory_password!='true'">
									<input id="cnew-generate_password" type="hidden" value="n" name="client_generate_password"/>
								</iaixsl:if>
							</div>

							<iaixsl:if test="page/client-data/@action = 'password_token' and $client_new_mode = 'edit'">
								<p class="no_password_social_text">
									<iaixsl:attribute name="style">display:none;</iaixsl:attribute>
									<b>Nie musisz pamiętać swojego hasła.</b> Połącz konto w sklepie ze swoim kontem w jednym z poniższych serwisów i loguj się nim podczas kolejnych zakupów.
								</p>
							</iaixsl:if>

						</div>
					</div>
				</iaixsl:if>
			</div>

			<div id="client_new_summary" class="row clearfix">
				<div class="col-6">

					
					<div class="clientnew_regulations">

						
						<iaixsl:if test="($client_new_mode = 'edit') and login_options/service[@connected='true']">
							<div class="form-group">
								<div class="col-12">
									<label> Twoje konto jest połączone z kontem w serwisie <iaixsl:value-of select="login_options/service[@connected='true']/@name"/></label>
									<a class="btn-connected btn --solid">
										<iaixsl:attribute name="href"><iaixsl:value-of select="login_options/service[@connected='true']/@disconnect_url"/></iaixsl:attribute>
										Rozłącz konto
									</a>
								</div>
							</div>
						</iaixsl:if>

						<iaixsl:if test="not(/shop/contact/owner/@vat_registered = 'false')">
							<div class="checkbox">
								<label>
									<input type="checkbox" name="vat_company" id="vat_company" value="1">
										<iaixsl:if test="(/shop/page/client-data/invoice_data/@vat_company = 'n') or (/shop/page/client-data/invoice_data/@vat_company = 'p')">
											<iaixsl:attribute name="checked">checked</iaixsl:attribute>
										</iaixsl:if>
										<iaixsl:if test="page/client-data/@disallow_change_company_data = 'true'">
											<iaixsl:attribute name="readonly">readonly</iaixsl:attribute>
										</iaixsl:if>
									</input>Jestem płatnikiem VAT EU. Zamawiam bez VAT i zobowiązuję się go rozliczyć na terenie swojego kraju. Sprzedawca zweryfikuje VAT UE w systemie VIES.
								</label>
							</div>
						</iaixsl:if>
						<iaixsl:choose>
							<iaixsl:when test="$client_new_mode != 'edit'">
								<div class="checkbox">
									<label class="has-required">
										<input id="terms_agree" type="checkbox" name="terms_agree" value="0" required="required"/>
										<i class="icon-need"> </i>
										<iaixsl:value-of disable-output-escaping="yes" select="/shop/page/personal_data_processing_texts/personal_data"/>
									</label>
								</div>
							</iaixsl:when>
							<iaixsl:otherwise>
								<input id="terms_agree" type="hidden" value="1"/>
							</iaixsl:otherwise>
						</iaixsl:choose>

						<div class="form-group">
							<div class="checkbox">
								<label>
									<input id="client_mailing" type="checkbox" name="client_mailing" value="1">
										<iaixsl:if test="/shop/page/client-data/contact_data/@mailing != '0'"><iaixsl:attribute name="checked">checked</iaixsl:attribute></iaixsl:if>
									</input>  Chcę otrzymywać E-mail Newsletter (możliwość późniejszej rezygnacji)
								</label>
							</div>
						</div>
						<iaixsl:if test="/shop/page/client-data/contact_data/@send_sms">
							<div class="form-group">
								<div class="checkbox">
									<label>
										<input id="client_send_sms" type="checkbox" name="client_send_sms" value="y">
											<iaixsl:if test="/shop/page/client-data/contact_data/@send_sms = 'y' or /shop/page/client-data/contact_data/@send_sms = 'd' or /shop/page/client-data/contact_data/@send_sms = '1'"><iaixsl:attribute name="checked">checked</iaixsl:attribute></iaixsl:if>
										</input>  Chcę otrzymywać SMS Newsletter (możliwość późniejszej rezygnacji)
										<input type="hidden" name="client_send_sms_exists" value="1"/>
									</label>
								</div>
							</div>
						</iaixsl:if>
					</div>

					
					<div class="clientnew_buttons">
						<div id="formErrors" class="formErrors">
							<div class="formErrors__icon">
								<img src="/gfx/standards/formErrors.svg?r=1696937716" alt="formErrors"/>
								<strong>W formularzu wystąpiły błędy </strong>
							</div>
							<div id="formErrorsSub" class="formErrors__errors">

							</div>
						</div>
						<button id="submit_clientnew_form" type="submit" class="btn --solid --large">
							<iaixsl:choose>
								<iaixsl:when test="$client_new_mode = 'edit'">
									Zapisz zmiany
								</iaixsl:when>
								<iaixsl:when test="$client_new_mode = 'register'">
									Zarejestruj konto
								</iaixsl:when>
								<iaixsl:when test="$client_new_mode = 'onceorder'">
									Przejdź dalej
								</iaixsl:when>
							</iaixsl:choose>
						</button>
					</div>
				</div>
			</div>
		</form>

		<div id="streetNumberShow" class="streetNumberShow" style="display: none;">
			<img src="/gfx/standards/streetNumber.svg?r=1696937716" alt="streetNumber"/>
			<strong>Nie uzupełniłeś numer domu / lokalu</strong>
			<span>Czy tak ma być? Pamiętaj, że bez podania numeru przesyłka może nie dojść.</span>
			<a id="streetNumberClose" class="btn --solid --large" href="#streetNumberShow">
				<iaixsl:attribute name="title">Kontynuuję, bez podawania numeru</iaixsl:attribute>
				Kontynuuję, bez podawania numeru
			</a>
			<a id="streetNumberFocus" class="btn" href="#streetNumberShow">
				<iaixsl:attribute name="title">Chcę podać numer</iaixsl:attribute>
				Chcę podać numer
			</a>
		</div>
		</iaixsl:if>
		<iaixsl:if test="/shop/page/client-data/delivery_data/@use='hide'"> </iaixsl:if>
		<iaixsl:if test="/shop/page/client-data/allow_change_company_data"> </iaixsl:if>
		<iaixsl:if test="/shop/page/communicates/warning/@type='illegal_characters_client_firstname'"> </iaixsl:if>

		<!-- (client_new_rebate_code, 60dd8e7aceaa71.29402045.4)-->
            <iaixsl:if test="/shop/page/client-data/@card_discount_program_activated='true' and not(/shop/page/client-data/@associated = 'true')">
                <div class="rebate_card_wrap row">
                    <div class="col-sm-6 col-12">
                        <iaixsl:choose>
                            
                            <iaixsl:when test="/shop/page/client-data/@active_card and not(/shop/page/client-data/@active_card='')">
                                <div class="form-group">
                                    <span class="rebate_card_header">Twoja karta rabatowa jest aktywna!</span>
                                    <div class="has-feedback d-flex align-items-center">
                                        <div class="rebate_card_icon">
                                            <i class="icon-credit-card"/>
                                        </div>
                                        <div class="rebate_card_input">
                                            <input type="hidden" value="add" name="global_rebates_codes"/>
                                            <input id="card_discount_code" type="text" placeholder="Numer karty rabatowej" value="" name="card_discount_code" class="form-control focused">
                                                <iaixsl:attribute name="value"><iaixsl:value-of select="/shop/page/client-data/@active_card"/></iaixsl:attribute>
                                            </input>
                                            <label for="card_discount_code" class="control-label">
                                                Numer karty rabatowej
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <p class="rebate_card_desc">
                                    Możesz zmienić aktywną kartę rabatową wpisując nowy numer powyżej. Sprawdź szczegóły przyznanych zniżek, przejdź do strony <a href="/client-rebate.php" title="Twoje rabaty">Twoich rabatów</a>.
                                </p>
                            </iaixsl:when>
                            <iaixsl:otherwise>
                                <div class="form-group">
                                    <div class="d-flex align-items-center">
                                        <div class="rebate_card_icon">
                                            <i class="icon-credit-card"/>
                                        </div>
                                        <div class="has-feedback rebate_card_input">
                                            <input type="hidden" value="add" name="global_rebates_codes"/>
                                            <input type="text" value="" name="card_discount_code" class="form-control">
                                                    <iaixsl:attribute name="placeholder"/>
                                            </input>
                                            <label for="card_discount_code" class="control-label">
                                                Numer karty rabatowej
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <p class="rebate_card_desc">
                                    Jeśli posiadasz naszą plastikową kartę rabatową wpisz jej numer. W ten sposób zyskasz rabaty takie, jak w naszych tradycyjnych sklepach.
                                </p>
                            </iaixsl:otherwise>
                        </iaixsl:choose>
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
  
  
  

	
	<script src="/gfx/pol/envelope.js.gzip?r=1696937760"></script><script src="/gfx/pol/menu_suggested_shop_for_language.js.gzip?r=1696937760"></script><script src="/gfx/pol/client_new_form.js.gzip?r=1696937760"></script>

	
	<iaixsl:value-of disable-output-escaping="yes" select="php:functionString('additionalContent', 'additional_body_scripts')"/>
  
	<script>app_shop.runApp();</script>
	
	<iaixsl:if test="/shop/page/seolink_with_language_directory"/>

	<iaixsl:if test="(action/set_render/item/@name = 'popup') or not(action/set_render/item)">
		<iaixsl:text disable-output-escaping="yes">&lt;/body&gt;&lt;/html&gt;</iaixsl:text>
	</iaixsl:if>
</iaixsl:template><iaixsl:template match="//image"><iaixsl:if test="@type='swf'"><object type="application/x-shockwave-flash"><iaixsl:attribute name="data"><iaixsl:value-of select="@src"/></iaixsl:attribute><iaixsl:attribute name="data"><iaixsl:value-of select="@src"/></iaixsl:attribute><iaixsl:attribute name="width"><iaixsl:value-of select="@width"/></iaixsl:attribute><iaixsl:attribute name="height"><iaixsl:value-of select="@height"/></iaixsl:attribute><param name="movie"><iaixsl:attribute name="value"><iaixsl:value-of select="@src"/></iaixsl:attribute></param><param name="bgcolor"><iaixsl:attribute name="bgcolor"><iaixsl:value-of select="@bgcolor"/></iaixsl:attribute></param></object></iaixsl:if><iaixsl:if test="not(@type='swf')"><img alt="" class="pic"><iaixsl:attribute name="src"><iaixsl:value-of select="@src"/></iaixsl:attribute><iaixsl:if test="@width &gt; 0"><iaixsl:attribute name="width"><iaixsl:value-of select="@width"/></iaixsl:attribute></iaixsl:if><iaixsl:if test="@height &gt; 0"><iaixsl:attribute name="height"><iaixsl:value-of select="@height"/></iaixsl:attribute></iaixsl:if></img></iaixsl:if></iaixsl:template><iaixsl:template name="escape-backslash"><iaixsl:param name="str" select="."/><iaixsl:choose><iaixsl:when test="contains($str, '\')"><iaixsl:value-of select="concat(substring-before($str, '\'), '\\' )"/><iaixsl:call-template name="escape-backslash"><iaixsl:with-param name="str" select="substring-after($str, '\')"/></iaixsl:call-template></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="$str"/></iaixsl:otherwise></iaixsl:choose></iaixsl:template><iaixsl:template name="escape-quote-string"><iaixsl:param name="str"/><iaixsl:param name="escape_backslash"/><iaixsl:param name="escape" select="'quot'"/><iaixsl:param name="quoting" select="'1'"/><iaixsl:variable name="escape_sign"><iaixsl:choose><iaixsl:when test="$escape=&quot;apos&quot;"><iaixsl:value-of select="&quot;'&quot;"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="string('&quot;')"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable><iaixsl:if test="$quoting"><iaixsl:value-of select="$escape_sign"/></iaixsl:if><iaixsl:choose><iaixsl:when test="contains($str,$escape_sign)"><iaixsl:variable name="before-first-apostrophe" select="substring-before($str,$escape_sign)"/><iaixsl:variable name="after-first-apostrophe" select="substring-after($str,$escape_sign)"/><iaixsl:value-of select="$before-first-apostrophe"/>\<iaixsl:value-of select="$escape_sign"/><iaixsl:text/><iaixsl:call-template name="escape-quote-string"><iaixsl:with-param name="str" select="$after-first-apostrophe"/><iaixsl:with-param name="escape" select="$escape"/><iaixsl:with-param name="quoting" select="0"/></iaixsl:call-template></iaixsl:when><iaixsl:otherwise><iaixsl:choose><iaixsl:when test="not($escape_backslash)"><iaixsl:value-of select="$str"/></iaixsl:when><iaixsl:otherwise><iaixsl:call-template name="escape-backslash"><iaixsl:with-param name="str" select="$str"/></iaixsl:call-template></iaixsl:otherwise></iaixsl:choose></iaixsl:otherwise></iaixsl:choose><iaixsl:if test="$quoting"><iaixsl:value-of select="$escape_sign"/></iaixsl:if></iaixsl:template></iaixsl:stylesheet>