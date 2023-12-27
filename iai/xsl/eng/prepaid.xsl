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
				
				<script src="/gfx/eng/orderdetails_payments.js.gzip?r=1696937760"></script>
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

        <!-- (orderdetails_cms, 60dd8e76997c49.64388418.9)-->
<iaixsl:if test="page/prepaid/text/body != ''">

    <div class="orderdetails_cms">
      <iaixsl:attribute name="class">orderdetails_cms cm</iaixsl:attribute>
        <div class="orderdetails_cms_sub"><iaixsl:value-of disable-output-escaping="yes" select="page/prepaid/text/body"/></div>
    </div>
</iaixsl:if>
    <!-- (orderdetails_info, 60dd8e88a6b737.83403411.3)-->
			<iaixsl:if test="/shop/page/prepaid/opinions_forms/trusted_shops"> </iaixsl:if>
			<iaixsl:if test="/shop/page/prepaid/editlink/@active='y'"> </iaixsl:if>
			<iaixsl:if test="/shop/page/prepaid/cancellink/@active='y'"> </iaixsl:if>
			<iaixsl:if test="/shop/page/prepaid/confirmlink/@link"> </iaixsl:if>
			<iaixsl:if test="/shop/page/prepaid/cancellink/@link"> </iaixsl:if>
			<iaixsl:if test="/shop/page/prepaid/cancellink/@link"> </iaixsl:if>
		<!-- (orderdetails_payments, 61f913c6775e93.34542107.12)-->
	<iaixsl:variable name="idoPay">1</iaixsl:variable>
	<div class="orderdetails_summary">

		<iaixsl:if test="/shop/page/prepaid/prepaid_history/item[position()=last()]/@first_pay = 'true'">
			<iaixsl:attribute name="class">orderdetails_summary<iaixsl:if test="/shop/page/prepaid/prepaid_history/item[position()=last()]/@express_pay = 'true'"> --express</iaixsl:if><iaixsl:if test="/shop/page/prepaid/prepaid_history/item[position()=last()]/@pay_link"> --pay_overlay</iaixsl:if></iaixsl:attribute>
		</iaixsl:if>

		<iaixsl:attribute name="data-is-express-checkout"><iaixsl:choose>
			<iaixsl:when test="/shop/page/prepaid/details/@checkout_type = 'idosell'">true</iaixsl:when>
			<iaixsl:otherwise>false</iaixsl:otherwise>
		</iaixsl:choose></iaixsl:attribute>

		<iaixsl:if test="(/shop/page/prepaid/prepaid_history/item[position() = last()]/@payment_form_id = '210' and not(page/prepaid/details/@wykonane = 's' or page/prepaid/details/@wykonane = 'k' or /shop/page/prepaid/prepaid_history/item[position() = last()][@payment_form_id = '210']/@status = 'c')) and /shop/page/prepaid/prepaid_history/item[position() = last()][@payment_form_id = '210']/@payment">
			<iaixsl:attribute name="data-pay-later-id"><iaixsl:value-of select="/shop/page/prepaid/prepaid_history/item[position() = last()][@payment_form_id = '210']/@payment"/></iaixsl:attribute>
			<iaixsl:attribute name="data-pay-later-order-number"><iaixsl:value-of select="/shop/page/prepaid/details/@orderid"/></iaixsl:attribute>
		</iaixsl:if>

		<iaixsl:if test="(/shop/page/prepaid/details/@checkout_type = 'idosell')">
			
			<iaixsl:attribute name="data-express-retry-modal-active"><iaixsl:choose>
				<iaixsl:when test="page/prepaid/details/@paymentstatus != 'g' and /shop/page/prepaid_methods/item and (page/prepaid/prepaid_history/item[position() = last()]/@status = 'n' or page/prepaid/prepaid_history/@show_payment_button = 'true') and not(/shop/page/prepaid/details/@prepaidstatus = 'y') and not((/shop/page/prepaid/prepaid_history/item[position() = last()]/@payment_form_id = '2') or (/shop/page/prepaid/prepaid_history/item[position() = last()]/@payment_form_id = '153') or (/shop/page/prepaid/prepaid_history/item[position() = last()]/@payment_form_id = '110') or (/shop/page/prepaid/prepaid_history/item[position() = last()]/@payment_form_id = '190')) and not(page/prepaid/prepaid_history/item[position()=last()]/@first_pay = 'true' and page/prepaid/prepaid_history/item[position()=last()]/@pay_link) and (/shop/page/prepaid/order/@payment_remain &gt; 0)">true</iaixsl:when>
				<iaixsl:otherwise>false</iaixsl:otherwise>
			</iaixsl:choose></iaixsl:attribute>

			<iaixsl:if test="/shop/client_data/checkup/@url and not(/shop/page/prepaid/expressCheckoutIdentifier = '')">
				<iaixsl:attribute name="data-express-checkup-url"><iaixsl:value-of select="/shop/client_data/checkup/@url"/>&amp;expressCheckoutLogin=<iaixsl:value-of select="/shop/page/prepaid/expressCheckoutIdentifier"/></iaixsl:attribute>
			</iaixsl:if>
		</iaixsl:if>

		<div class="row align-items-center pt-2 py-md-5">
			<div class="col-12 col-md-4 mb-4 mb-md-0">
				<div id="orderdetails_info" class="orderdetails_info">
					<div class="orderdetails_info__icon">
						<iaixsl:attribute name="data-status"><iaixsl:value-of select="/shop/page/prepaid/details/@wykonane"/></iaixsl:attribute>
						<iaixsl:if test="page/prepaid/details/@wykonane = 't' and page/prepaid/details/@personal_collection = 'yes'">
							<iaixsl:attribute name="data-received">true</iaixsl:attribute>
						</iaixsl:if>
					</div>
					<div class="orderdetails_info__wrapper">
						<div class="orderdetails_info__label">
							<strong class="orderdetails_info__label_text">
								<iaixsl:choose>
									<iaixsl:when test="(page/prepaid/details/@wykonane = 'n')">Order received</iaixsl:when>
									<iaixsl:when test="(page/prepaid/details/@wykonane = 't')"><iaixsl:choose><iaixsl:when test="(page/prepaid/details/@personal_collection = 'yes')">Order received</iaixsl:when><iaixsl:otherwise>Order shipped</iaixsl:otherwise></iaixsl:choose></iaixsl:when>
									<iaixsl:when test="(page/prepaid/details/@wykonane = 'i')">Order rejected</iaixsl:when>
									<iaixsl:when test="(page/prepaid/details/@wykonane = 's')">Canceled</iaixsl:when>
									<iaixsl:when test="(page/prepaid/details/@wykonane = 'o')">In progress</iaixsl:when>
									<iaixsl:when test="(page/prepaid/details/@wykonane = 'p')">Order ready</iaixsl:when>
									<iaixsl:when test="(page/prepaid/details/@wykonane = 'h')">Order held</iaixsl:when>
									<iaixsl:when test="(page/prepaid/details/@wykonane = 'w')">Awaiting payment</iaixsl:when>
									<iaixsl:when test="(page/prepaid/details/@wykonane = 'd')">Awaiting delivery</iaixsl:when>
									<iaixsl:when test="(page/prepaid/details/@wykonane = 'z')">Return</iaixsl:when>
									<iaixsl:when test="(page/prepaid/details/@wykonane = 'k')">Canceled</iaixsl:when>
									<iaixsl:when test="(page/prepaid/details/@wykonane = 'r')">Complaint</iaixsl:when>
									<iaixsl:when test="(page/prepaid/details/@wykonane = 'j')">Merged</iaixsl:when>
									<iaixsl:when test="(page/prepaid/details/@wykonane = 'l')">Lost</iaixsl:when>
									<iaixsl:when test="(page/prepaid/details/@wykonane = 'a')">In progress</iaixsl:when>
									<iaixsl:when test="(page/prepaid/details/@wykonane = 'b')">Packed</iaixsl:when>
									<iaixsl:when test="(page/prepaid/details/@wykonane = 'wp')">Awaiting packaging deadline</iaixsl:when>
									<iaixsl:when test="(page/prepaid/details/@wykonane = 'wr')">Awaiting collection date</iaixsl:when>
									<iaixsl:when test="(page/prepaid/details/@wykonane = 'wd')">Awaiting posting deadline</iaixsl:when>
								</iaixsl:choose>
							</strong>
							<iaixsl:if test="page/prepaid/order/@payment_info = 'true'">
								<div class="moreInfo orderdetails_info__more d-none d-md-flex">
										<a href="#showDescription" class="moreInfo__show"><i class="icon-question"/></a>
										<div style="display:none;" class="moreInfo__desc"><iaixsl:value-of disable-output-escaping="yes" select="page/prepaid/status_explanation"/></div>
								</div>
						</iaixsl:if>
						</div>
						<div class="orderdetails_info__dates">
							<span class="orderdetails_info__number">Details of the order ID <iaixsl:value-of select="page/prepaid/details/@orderid"/></span>
							<iaixsl:if test="page/prepaid/order/@payment_info = 'true'">
									<a href="#showDescription" class="moreInfo__show d-md-none">More</a>
									<div class="moreInfo orderdetails_info__more d-md-none">
											<div style="display:none;" class="moreInfo__desc"><iaixsl:value-of disable-output-escaping="yes" select="page/prepaid/status_explanation"/></div>
									</div>
							</iaixsl:if>
						</div>
					</div>
				</div>
			</div>
			<div class="col-12 col-md-8">
				<iaixsl:if test="page/prepaid/details/@wykonane = 'u' and /shop/client_data/association/@permsPayment = 'n'">
					<span class="orderdetails_assoc_payments">
						Payment from the account of an organization with the appropriate permissions.
					</span>
				</iaixsl:if>
				
					<iaixsl:variable name="idoPay2">1</iaixsl:variable>
					<div id="orderdetails_payments" class="orderdetails_payments">
						<iaixsl:attribute name="data-cancel_link">
							<iaixsl:choose>
								<iaixsl:when test="page/prepaid/prepaid_history/item[position() = last()]/@cancel_link">
									<iaixsl:value-of select="page/prepaid/prepaid_history/item[position() = last()]/@cancel_link"/>
								</iaixsl:when>
								<iaixsl:otherwise>false</iaixsl:otherwise>
							</iaixsl:choose>
						</iaixsl:attribute>
						<iaixsl:attribute name="data-action">/order-newpayment.php?order=<iaixsl:value-of select="/shop/page/prepaid/details/@id"/></iaixsl:attribute>
						<iaixsl:if test="/shop/page/prepaid/details/@paymentlink">
							<iaixsl:attribute name="data-action"><iaixsl:value-of select="/shop/page/prepaid/details/@paymentlink"/></iaixsl:attribute>
						</iaixsl:if>
						
						<div id="orderdetails_payments_content" class="orderdetails_payments__content d-md-block">
							<div class="orderdetails_payments__history">
								<iaixsl:for-each select="page/prepaid/prepaid_history/item[@status = 'y' and position() != last()]">
									<div class="orderdetails_payments__item">
										<div class="orderdetails_payments__wrapper">
											<strong class="orderdetails_payments__date">
												<iaixsl:choose>
													<iaixsl:when test="dates/date_cancelled/@date">
														<iaixsl:value-of select="dates/date_cancelled/@date"/>
													</iaixsl:when>
													<iaixsl:when test="dates/date_confirm/@date">
														<iaixsl:value-of select="dates/date_confirm/@date"/>
													</iaixsl:when>
													<iaixsl:when test="dates/date_add/@date">
														<iaixsl:value-of select="dates/date_add/@date"/>
													</iaixsl:when>
												</iaixsl:choose>
											</strong>
											<div class="orderdetails_payments__explanation">
												<iaixsl:choose>
													<iaixsl:when test="amount/@mark='negativ'">
														Paid
													</iaixsl:when>
													<iaixsl:otherwise>
														You paid
													</iaixsl:otherwise>
												</iaixsl:choose>
												<iaixsl:value-of select="amount/client_currency/@value_formatted"/> via 

												<iaixsl:choose>
													<iaixsl:when test="@payment_id='27'"> 
														Balance (customer account)
													</iaixsl:when>
													<iaixsl:when test="$idoPay2 and @payment_id = '29' and (@payment_form_id = '44' or @payment_form_id = '45') and count(/shop/page/prepaid_methods/item[@group='card'][not(@system_id='29')]) = 0">
														
													</iaixsl:when>
													<iaixsl:otherwise>
														<iaixsl:value-of select="@payment_name"/>.
													</iaixsl:otherwise>
												</iaixsl:choose>

											</div>
										</div>
										
										<div class="orderdetails_payments__icon">
											<iaixsl:if test="@icon">
												<iaixsl:choose>
													<iaixsl:when test="$idoPay2 and @payment_id = '29' and (@payment_form_id = '44' or @payment_form_id = '45') and count(/shop/page/prepaid_methods/item[@group='card'][not(@system_id='29')]) = 0">
														<iaixsl:if test="/shop/page/prepaid_methods/item[@id='44']">
															<img>
																<iaixsl:attribute name="src"><iaixsl:value-of select="/shop/page/prepaid_methods/item[@id='44']/@icon"/></iaixsl:attribute>
																<iaixsl:attribute name="alt"><iaixsl:value-of select="/shop/page/prepaid_methods/item[@id='44']/@name"/></iaixsl:attribute>
															</img>
														</iaixsl:if>
														<iaixsl:if test="/shop/page/prepaid_methods/item[@id='45']">
															<img>
																<iaixsl:attribute name="src"><iaixsl:value-of select="/shop/page/prepaid_methods/item[@id='45']/@icon"/></iaixsl:attribute>
																<iaixsl:attribute name="alt"><iaixsl:value-of select="/shop/page/prepaid_methods/item[@id='45']/@name"/></iaixsl:attribute>
															</img>
														</iaixsl:if>
													</iaixsl:when>
													<iaixsl:when test="@payment_id = '38'">
														<img>
															<iaixsl:attribute name="src">data:image/svg+xml,%3Csvg xmlns=&apos;http://www.w3.org/2000/svg&apos; id=&apos;calendar&apos; width=&apos;26&apos; height=&apos;26&apos; fill=&apos;%23333&apos; viewBox=&apos;0 0 26 26&apos;%3E%3Cg id=&apos;Group_425&apos; data-name=&apos;Group 425&apos;%3E%3Cg id=&apos;Group_424&apos; data-name=&apos;Group 424&apos;%3E%3Cpath id=&apos;Path_75&apos; data-name=&apos;Path 75&apos; d=&apos;M22.512,1.992h-1.2V0H19.324V1.992H6.176V0H4.184V1.992h-1.2A2.992,2.992,0,0,0,0,4.98V22.512A2.992,2.992,0,0,0,2.988,25.5H22.512A2.992,2.992,0,0,0,25.5,22.512V4.98A2.992,2.992,0,0,0,22.512,1.992Zm1,20.52a1,1,0,0,1-1,1H2.988a1,1,0,0,1-1-1V9.363H23.508Zm0-15.141H1.992V4.98a1,1,0,0,1,1-1h1.2V5.977H6.176V3.984H19.324V5.977h1.992V3.984h1.2a1,1,0,0,1,1,1Z&apos;%3E%3C/path%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_427&apos; data-name=&apos;Group 427&apos; transform=&apos;translate(4.397 11.431)&apos;%3E%3Cg id=&apos;Group_426&apos; data-name=&apos;Group 426&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_196&apos; data-name=&apos;Rectangle 196&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(-0.147 -0.181)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_429&apos; data-name=&apos;Group 429&apos; transform=&apos;translate(7.914 11.431)&apos;%3E%3Cg id=&apos;Group_428&apos; data-name=&apos;Group 428&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_197&apos; data-name=&apos;Rectangle 197&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(0.336 -0.181)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_431&apos; data-name=&apos;Group 431&apos; transform=&apos;translate(12.31 11.431)&apos;%3E%3Cg id=&apos;Group_430&apos; data-name=&apos;Group 430&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_198&apos; data-name=&apos;Rectangle 198&apos; width=&apos;1&apos; height=&apos;2&apos; transform=&apos;translate(-0.06 -0.181)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_433&apos; data-name=&apos;Group 433&apos; transform=&apos;translate(14.948 11.431)&apos;%3E%3Cg id=&apos;Group_432&apos; data-name=&apos;Group 432&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_199&apos; data-name=&apos;Rectangle 199&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(0.302 -0.181)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_435&apos; data-name=&apos;Group 435&apos; transform=&apos;translate(19.345 11.431)&apos;%3E%3Cg id=&apos;Group_434&apos; data-name=&apos;Group 434&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_200&apos; data-name=&apos;Rectangle 200&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(-0.095 -0.181)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_437&apos; data-name=&apos;Group 437&apos; transform=&apos;translate(4.397 14.948)&apos;%3E%3Cg id=&apos;Group_436&apos; data-name=&apos;Group 436&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_201&apos; data-name=&apos;Rectangle 201&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(-0.147 0.302)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_439&apos; data-name=&apos;Group 439&apos; transform=&apos;translate(7.914 14.948)&apos;%3E%3Cg id=&apos;Group_438&apos; data-name=&apos;Group 438&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_202&apos; data-name=&apos;Rectangle 202&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(0.336 0.302)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_441&apos; data-name=&apos;Group 441&apos; transform=&apos;translate(12.31 14.948)&apos;%3E%3Cg id=&apos;Group_440&apos; data-name=&apos;Group 440&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_203&apos; data-name=&apos;Rectangle 203&apos; width=&apos;1&apos; height=&apos;2&apos; transform=&apos;translate(-0.06 0.302)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_443&apos; data-name=&apos;Group 443&apos; transform=&apos;translate(14.948 14.948)&apos;%3E%3Cg id=&apos;Group_442&apos; data-name=&apos;Group 442&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_204&apos; data-name=&apos;Rectangle 204&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(0.302 0.302)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_445&apos; data-name=&apos;Group 445&apos; transform=&apos;translate(4.397 19.345)&apos;%3E%3Cg id=&apos;Group_444&apos; data-name=&apos;Group 444&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_205&apos; data-name=&apos;Rectangle 205&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(-0.147 -0.095)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_447&apos; data-name=&apos;Group 447&apos; transform=&apos;translate(7.914 19.345)&apos;%3E%3Cg id=&apos;Group_446&apos; data-name=&apos;Group 446&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_206&apos; data-name=&apos;Rectangle 206&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(0.336 -0.095)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_449&apos; data-name=&apos;Group 449&apos; transform=&apos;translate(12.31 19.345)&apos;%3E%3Cg id=&apos;Group_448&apos; data-name=&apos;Group 448&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_207&apos; data-name=&apos;Rectangle 207&apos; width=&apos;1&apos; height=&apos;2&apos; transform=&apos;translate(-0.06 -0.095)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_451&apos; data-name=&apos;Group 451&apos; transform=&apos;translate(14.948 19.345)&apos;%3E%3Cg id=&apos;Group_450&apos; data-name=&apos;Group 450&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_208&apos; data-name=&apos;Rectangle 208&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(0.302 -0.095)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_453&apos; data-name=&apos;Group 453&apos; transform=&apos;translate(19.345 14.948)&apos;%3E%3Cg id=&apos;Group_452&apos; data-name=&apos;Group 452&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_209&apos; data-name=&apos;Rectangle 209&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(-0.095 0.302)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E</iaixsl:attribute>
															<iaixsl:attribute name="alt"><iaixsl:value-of select="@payment_name"/></iaixsl:attribute>
														</img>
													</iaixsl:when>
													<iaixsl:otherwise>
														<img>
															<iaixsl:attribute name="src"><iaixsl:value-of select="@icon"/></iaixsl:attribute>
															<iaixsl:attribute name="alt"><iaixsl:value-of select="@payment_name"/></iaixsl:attribute>
														</img>
													</iaixsl:otherwise>
												</iaixsl:choose>
											</iaixsl:if>
										</div>
									</div>
								</iaixsl:for-each>
								<iaixsl:for-each select="page/prepaid/prepaid_history/item[position() = last()]">
									<div class="orderdetails_payments__item">
										<div class="orderdetails_payments__wrapper">
											<strong class="orderdetails_payments__date">
												<iaixsl:choose>
													<iaixsl:when test="dates/date_cancelled/@date">
														<iaixsl:value-of select="dates/date_cancelled/@date"/>
													</iaixsl:when>
													<iaixsl:when test="dates/date_confirm/@date">
														<iaixsl:value-of select="dates/date_confirm/@date"/>
													</iaixsl:when>
													<iaixsl:when test="dates/date_add/@date">
														<iaixsl:value-of select="dates/date_add/@date"/>
													</iaixsl:when>
												</iaixsl:choose>
											</strong>
											<div class="orderdetails_payments__explanation">
												<iaixsl:choose>
													<iaixsl:when test="dates/date_canceled/@date">
														<iaixsl:choose>
															<iaixsl:when test="amount/@mark='negativ'">
																You have selected but you have given up your return
															</iaixsl:when>
															<iaixsl:otherwise>
																You have selected but you have canceled the payment
															</iaixsl:otherwise>
														</iaixsl:choose>
													</iaixsl:when>
													<iaixsl:otherwise>
														<iaixsl:choose>
															<iaixsl:when test="amount/@mark='negativ'">
																<iaixsl:choose>
																	<iaixsl:when test="@status = 'y'">Paid </iaixsl:when>
																	<iaixsl:otherwise>You have selected </iaixsl:otherwise>
																</iaixsl:choose>
															</iaixsl:when>
															<iaixsl:otherwise>
																<iaixsl:choose>
																	<iaixsl:when test="@status = 'y'">You paid </iaixsl:when>
																	<iaixsl:otherwise>You have selected </iaixsl:otherwise>
																</iaixsl:choose>
															</iaixsl:otherwise>
														</iaixsl:choose>
														<iaixsl:if test="@status = 'y'"><iaixsl:value-of select="amount/client_currency/@value_formatted"/> via </iaixsl:if>
													</iaixsl:otherwise>
												</iaixsl:choose>

												<iaixsl:choose>
													<iaixsl:when test="@payment_id='27'"> 
														Balance (customer account)
													</iaixsl:when>
													<iaixsl:when test="$idoPay2 and @payment_id = '29' and (@payment_form_id = '44' or @payment_form_id = '45') and count(/shop/page/prepaid_methods/item[@group='card'][not(@system_id='29')]) = 0">
														
													</iaixsl:when>
													<iaixsl:otherwise>
														<iaixsl:value-of select="@payment_name"/>
													</iaixsl:otherwise>
												</iaixsl:choose>

												<iaixsl:if test="dates/date_canceled/@date">
													<iaixsl:choose>
														<iaixsl:when test="amount/@mark='negativ'">
																for value of 
														</iaixsl:when>
														<iaixsl:otherwise>
																for value of 
														</iaixsl:otherwise>
													</iaixsl:choose>
													<iaixsl:value-of select="amount/client_currency/@value_formatted"/>.
												</iaixsl:if>

												<iaixsl:if test="not(dates/date_canceled/@date)">
													<iaixsl:choose>
														<iaixsl:when test="amount/@mark='negativ'">
																as a form of return.
																Amount to return is 
																<iaixsl:value-of select="amount/client_currency/@value_formatted"/>.
														</iaixsl:when>
														<iaixsl:otherwise>
															<iaixsl:choose>
																<iaixsl:when test="@status = 'y'">.</iaixsl:when>
																<iaixsl:otherwise> as a payment method. The amount to be paid is <iaixsl:value-of select="amount/client_currency/@value_formatted"/>.</iaixsl:otherwise>
																</iaixsl:choose>
														</iaixsl:otherwise>
													</iaixsl:choose>
												</iaixsl:if>


												<iaixsl:if test="@status = 'n'">
													<iaixsl:if test="not(amount/@mark='negativ')">
														<iaixsl:if test="additional_info/data">
															<iaixsl:choose>
																<iaixsl:when test="@other_payments= 'true'">
																	<br/>Make a payment on the data specified below or select different payment method. 
																</iaixsl:when>
																<iaixsl:otherwise>
																	<br/>Make a payment on the data specified below.
																</iaixsl:otherwise>
															</iaixsl:choose>

															<div class="orderdetails_payments__transfer pt-2 pb-1">
																<div class="orderdetails_payments__transfer_item d-flex pb-2 pb-sm-1">
																	<span class="orderdetails_payments__transfer_name">Recipient name: </span>
																	<strong class="orderdetails_payments__transfer_value"><iaixsl:value-of select="additional_info/data/@receiver"/></strong>
																</div>
																<div class="orderdetails_payments__transfer_item d-flex pb-2 pb-sm-1">
																	<span class="orderdetails_payments__transfer_name">Account number: </span>
																	<strong class="orderdetails_payments__transfer_value"><iaixsl:value-of select="additional_info/data/@account"/></strong>
																</div>
																<iaixsl:if test="additional_info/data/@bankname != ''">
																	<div class="orderdetails_payments__transfer_item d-flex pb-2 pb-sm-1">
																		<span class="orderdetails_payments__transfer_name">Bank:  </span>
																		<strong class="orderdetails_payments__transfer_value"><iaixsl:value-of select="additional_info/data/@bankname"/></strong>
																	</div>
																</iaixsl:if>
																<iaixsl:if test="additional_info/data/@swift_bic != ''">
																	<div class="orderdetails_payments__transfer_item d-flex pb-2 pb-sm-1">
																		<span class="orderdetails_payments__transfer_name">SWIFT: </span>
																		<strong class="orderdetails_payments__transfer_value"><iaixsl:value-of select="additional_info/data/@swift_bic"/></strong>
																	</div>
																</iaixsl:if>
																<div class="orderdetails_payments__transfer_item d-flex pb-2 pb-sm-1">
																	<span class="orderdetails_payments__transfer_name">Transfer title: </span>
																	<strong class="orderdetails_payments__transfer_value"><iaixsl:value-of select="additional_info/data/@title"/></strong>
																</div>
																<div class="orderdetails_payments__transfer_item d-flex pb-2 pb-sm-1">
																	<span class="orderdetails_payments__transfer_name">Transfer amount: </span>
																	<strong class="orderdetails_payments__transfer_value"><iaixsl:value-of select="amount/client_currency/@value_formatted"/></strong>
																</div>
															</div>
														</iaixsl:if>
													</iaixsl:if>
												</iaixsl:if>
											</div>
										</div>
										
										<div class="orderdetails_payments__icon">
											<iaixsl:if test="@icon">
												<iaixsl:choose>
													<iaixsl:when test="$idoPay2 and @payment_id = '29' and (@payment_form_id = '44' or @payment_form_id = '45') and count(/shop/page/prepaid_methods/item[@group='card'][not(@system_id='29')]) = 0">
														<iaixsl:if test="/shop/page/prepaid_methods/item[@id='44']">
															<img>
																<iaixsl:attribute name="src"><iaixsl:value-of select="/shop/page/prepaid_methods/item[@id='44']/@icon"/></iaixsl:attribute>
																<iaixsl:attribute name="alt"><iaixsl:value-of select="/shop/page/prepaid_methods/item[@id='44']/@name"/></iaixsl:attribute>
															</img>
														</iaixsl:if>
														<iaixsl:if test="/shop/page/prepaid_methods/item[@id='45']">
															<img>
																<iaixsl:attribute name="src"><iaixsl:value-of select="/shop/page/prepaid_methods/item[@id='45']/@icon"/></iaixsl:attribute>
																<iaixsl:attribute name="alt"><iaixsl:value-of select="/shop/page/prepaid_methods/item[@id='45']/@name"/></iaixsl:attribute>
															</img>
														</iaixsl:if>
													</iaixsl:when>
													<iaixsl:when test="@payment_id = '38'">
														<img>
															<iaixsl:attribute name="src">data:image/svg+xml,%3Csvg xmlns=&apos;http://www.w3.org/2000/svg&apos; id=&apos;calendar&apos; width=&apos;26&apos; height=&apos;26&apos; fill=&apos;%23333&apos; viewBox=&apos;0 0 26 26&apos;%3E%3Cg id=&apos;Group_425&apos; data-name=&apos;Group 425&apos;%3E%3Cg id=&apos;Group_424&apos; data-name=&apos;Group 424&apos;%3E%3Cpath id=&apos;Path_75&apos; data-name=&apos;Path 75&apos; d=&apos;M22.512,1.992h-1.2V0H19.324V1.992H6.176V0H4.184V1.992h-1.2A2.992,2.992,0,0,0,0,4.98V22.512A2.992,2.992,0,0,0,2.988,25.5H22.512A2.992,2.992,0,0,0,25.5,22.512V4.98A2.992,2.992,0,0,0,22.512,1.992Zm1,20.52a1,1,0,0,1-1,1H2.988a1,1,0,0,1-1-1V9.363H23.508Zm0-15.141H1.992V4.98a1,1,0,0,1,1-1h1.2V5.977H6.176V3.984H19.324V5.977h1.992V3.984h1.2a1,1,0,0,1,1,1Z&apos;%3E%3C/path%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_427&apos; data-name=&apos;Group 427&apos; transform=&apos;translate(4.397 11.431)&apos;%3E%3Cg id=&apos;Group_426&apos; data-name=&apos;Group 426&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_196&apos; data-name=&apos;Rectangle 196&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(-0.147 -0.181)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_429&apos; data-name=&apos;Group 429&apos; transform=&apos;translate(7.914 11.431)&apos;%3E%3Cg id=&apos;Group_428&apos; data-name=&apos;Group 428&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_197&apos; data-name=&apos;Rectangle 197&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(0.336 -0.181)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_431&apos; data-name=&apos;Group 431&apos; transform=&apos;translate(12.31 11.431)&apos;%3E%3Cg id=&apos;Group_430&apos; data-name=&apos;Group 430&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_198&apos; data-name=&apos;Rectangle 198&apos; width=&apos;1&apos; height=&apos;2&apos; transform=&apos;translate(-0.06 -0.181)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_433&apos; data-name=&apos;Group 433&apos; transform=&apos;translate(14.948 11.431)&apos;%3E%3Cg id=&apos;Group_432&apos; data-name=&apos;Group 432&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_199&apos; data-name=&apos;Rectangle 199&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(0.302 -0.181)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_435&apos; data-name=&apos;Group 435&apos; transform=&apos;translate(19.345 11.431)&apos;%3E%3Cg id=&apos;Group_434&apos; data-name=&apos;Group 434&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_200&apos; data-name=&apos;Rectangle 200&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(-0.095 -0.181)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_437&apos; data-name=&apos;Group 437&apos; transform=&apos;translate(4.397 14.948)&apos;%3E%3Cg id=&apos;Group_436&apos; data-name=&apos;Group 436&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_201&apos; data-name=&apos;Rectangle 201&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(-0.147 0.302)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_439&apos; data-name=&apos;Group 439&apos; transform=&apos;translate(7.914 14.948)&apos;%3E%3Cg id=&apos;Group_438&apos; data-name=&apos;Group 438&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_202&apos; data-name=&apos;Rectangle 202&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(0.336 0.302)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_441&apos; data-name=&apos;Group 441&apos; transform=&apos;translate(12.31 14.948)&apos;%3E%3Cg id=&apos;Group_440&apos; data-name=&apos;Group 440&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_203&apos; data-name=&apos;Rectangle 203&apos; width=&apos;1&apos; height=&apos;2&apos; transform=&apos;translate(-0.06 0.302)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_443&apos; data-name=&apos;Group 443&apos; transform=&apos;translate(14.948 14.948)&apos;%3E%3Cg id=&apos;Group_442&apos; data-name=&apos;Group 442&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_204&apos; data-name=&apos;Rectangle 204&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(0.302 0.302)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_445&apos; data-name=&apos;Group 445&apos; transform=&apos;translate(4.397 19.345)&apos;%3E%3Cg id=&apos;Group_444&apos; data-name=&apos;Group 444&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_205&apos; data-name=&apos;Rectangle 205&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(-0.147 -0.095)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_447&apos; data-name=&apos;Group 447&apos; transform=&apos;translate(7.914 19.345)&apos;%3E%3Cg id=&apos;Group_446&apos; data-name=&apos;Group 446&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_206&apos; data-name=&apos;Rectangle 206&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(0.336 -0.095)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_449&apos; data-name=&apos;Group 449&apos; transform=&apos;translate(12.31 19.345)&apos;%3E%3Cg id=&apos;Group_448&apos; data-name=&apos;Group 448&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_207&apos; data-name=&apos;Rectangle 207&apos; width=&apos;1&apos; height=&apos;2&apos; transform=&apos;translate(-0.06 -0.095)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_451&apos; data-name=&apos;Group 451&apos; transform=&apos;translate(14.948 19.345)&apos;%3E%3Cg id=&apos;Group_450&apos; data-name=&apos;Group 450&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_208&apos; data-name=&apos;Rectangle 208&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(0.302 -0.095)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_453&apos; data-name=&apos;Group 453&apos; transform=&apos;translate(19.345 14.948)&apos;%3E%3Cg id=&apos;Group_452&apos; data-name=&apos;Group 452&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_209&apos; data-name=&apos;Rectangle 209&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(-0.095 0.302)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E</iaixsl:attribute>
															<iaixsl:attribute name="alt"><iaixsl:value-of select="@payment_name"/></iaixsl:attribute>
														</img>
													</iaixsl:when>
													<iaixsl:otherwise>
														<img>
															<iaixsl:attribute name="src"><iaixsl:value-of select="@icon"/></iaixsl:attribute>
															<iaixsl:attribute name="alt"><iaixsl:value-of select="@payment_name"/></iaixsl:attribute>
														</img>
													</iaixsl:otherwise>
												</iaixsl:choose>
											</iaixsl:if>
										</div>
									</div>
									
									
								</iaixsl:for-each>
								
								<iaixsl:if test="/shop/page/prepaid/points/@display">
									<div class="orderdetails_summary_debit">
										Currently you have 
										<b><iaixsl:value-of select="/shop/page/prepaid/points/@client_points"/><span> pts.</span></b>
										
									</div>
								</iaixsl:if>
								
								<iaixsl:if test="page/prepaid/details/@paymentstatus != 'g' and /shop/page/prepaid_methods/item and (page/prepaid/prepaid_history/item[position() = last()]/@status = 'n' or page/prepaid/prepaid_history/@show_payment_button = 'true')">
									<iaixsl:if test="page/prepaid/prepaid_history/item[position() = last()]/@payment_form_id != 153">
										<span class="orderdetails_payments__unfinished">If, for some reason, you have not completed the payment process pay again.</span>
									</iaixsl:if>
									<div class="orderdetails_retry align-items-center justify-content-center flex-column mb-3 flex-sm-row">
										<iaixsl:attribute name="data-payform_id"><iaixsl:value-of select="page/prepaid/prepaid_history/item[position() = last()]/@payment_form_id"/></iaixsl:attribute>
										<iaixsl:attribute name="data-retry_payment"><iaixsl:value-of select="page/prepaid/prepaid_history/@retry_payment"/></iaixsl:attribute>
										<iaixsl:attribute name="data-pay_link"><iaixsl:value-of select="page/prepaid/prepaid_history/item[position()=last()]/@pay_link"/></iaixsl:attribute>
										<iaixsl:if test="page/prepaid/prepaid_history/item[position() = last()]/@payment_form_id != '153' and page/prepaid/prepaid_history/item[position() = last()]/@payment_form_id != '110' and /shop/page/prepaid/prepaid_history/item[position() = last()]/@status='n'">
											<iaixsl:choose>
												<iaixsl:when test="/shop/page/prepaid/order/@payment_remain &gt; 0">
														<a href="#orderdetails_retry_same" class="orderdetails_retry__button --same btn --solid mr-md-3 mb-3 mb-md-0 --large">
														<iaixsl:choose>
															<iaixsl:when test="/shop/page/prepaid/prepaid_history/item[position() = last()]/@payment_form_id='203'">
																Go to deferred payment (<iaixsl:value-of select="/shop/page/prepaid/order/@payment_remain_formatted"/>)
															</iaixsl:when>
															<iaixsl:otherwise>
																Pay <iaixsl:value-of select="/shop/page/prepaid/order/@payment_remain_formatted"/> 
																(try again)
															</iaixsl:otherwise>
														</iaixsl:choose>
																<iaixsl:if test="/shop/page/prepaid/points/@display">
																		<span>
																					+ 
																				<iaixsl:value-of select="/shop/page/prepaid/points/@order_cost"/> PTS.
																		</span>
																</iaixsl:if>
														</a>
												</iaixsl:when>
												<iaixsl:otherwise>
														<span>
																Return: 
																<iaixsl:value-of select="/shop/page/prepaid/prepaid_history/item[position() = last()]/amount/order_currency/@value_formatted"/>
														</span>
												</iaixsl:otherwise>
											</iaixsl:choose>
										</iaixsl:if>
										<iaixsl:if test="(/shop/page/prepaid/prepaid_history/item[position() = last()]/@status != 'n' and /shop/page/prepaid/prepaid_history/@currencysum * 100 &gt; 0) or (not(count(/shop/page/prepaid/prepaid_history/item) &gt; 0) and page/prepaid/prepaid_history/@show_payment_button = 'true')">
											<a href="#orderdetails_retry_new_payment" class="orderdetails_retry__button --new --new_payment btn --solid --large">Pay <iaixsl:value-of select="/shop/page/prepaid/prepaid_history/@currencysum_formatted"/></a>
										</iaixsl:if>
										<iaixsl:if test="/shop/page/prepaid/prepaid_history/item[position() = last()]/@status='n' and /shop/page/prepaid/prepaid_history/@other_payments='true' and /shop/page/prepaid/order/@payment_remain &gt; 0">
											<a href="#orderdetails_retry_new" class="orderdetails_retry__button --new btn">Select different payment method</a>
										</iaixsl:if>
									</div>
								</iaixsl:if>

								<iaixsl:if test="/shop/allow_division_order/@turn_on = 'yes'">
									<div class="orderdetails_division">
										<strong>After the payment, the order will be divided into two separate ones.</strong>
									</div>
								</iaixsl:if>
							</div>
						</div>
						<script>
							app_shop.vars.leftToPay = &apos;<iaixsl:value-of select="/shop/page/prepaid/order/@payment_remain_formatted"/>&apos;;
						</script>
					</div>
				
			</div>
		</div>
	</div>

	<iaixsl:if test="page/prepaid/details/@paymentstatus != 'g' ">
		<div id="orderdetails_prepaid_methods" class="orderdetails_prepaid_methods" data-action="/order-newpayment.php" data-method="post">
			<div id="prepaid_pay_label">
				<span class="prepaid_pay_label">Pay for the accepted order number <iaixsl:value-of select="page/prepaid/details/@orderid"/></span>
			</div>
			<script>
				
				const prepaid_data = {
					shopLogoSettings: { url: &quot;<iaixsl:if test="/shop/mask/top/link/image/@src"><iaixsl:value-of select="/shop/mask/top/link/image/@src"/></iaixsl:if>&quot;},
					cancel_link: <iaixsl:choose>
						<iaixsl:when test="page/prepaid/prepaid_history/item[position() = last()]/@cancel_link">
							&apos;<iaixsl:value-of select="page/prepaid/prepaid_history/item[position() = last()]/@cancel_link"/>&apos;,
						</iaixsl:when>
						<iaixsl:otherwise>false,</iaixsl:otherwise>
					</iaixsl:choose>
					refresh_link: `/orderdetails.php?order_number=<iaixsl:value-of select="/shop/page/prepaid/details/@orderid"/>`,
					views: {
						selectPaymentGroup: false,
						selectPaymentMethod: false,
						payWithSelectedPaymentMethod:<iaixsl:choose>
							<iaixsl:when test="page/prepaid/prepaid_history/item[position()=last()]/@first_pay = 'true' and page/prepaid/prepaid_history/item[position()=last()]/@pay_link and not(/shop/page/prepaid/prepaid_history/item[position()=last()]/@express_pay = 'true')">true</iaixsl:when>
							<iaixsl:otherwise>false</iaixsl:otherwise></iaixsl:choose>,
						paymentWarning: false,
						orderSummary: false,
						expressCheckout: <iaixsl:choose>
							<iaixsl:when test="/shop/page/prepaid/prepaid_history/item[position()=last()]/@first_pay = 'true' and /shop/page/prepaid/prepaid_history/item[position()=last()]/@express_pay = 'true'">true</iaixsl:when>
							<iaixsl:otherwise>false</iaixsl:otherwise></iaixsl:choose>,
					},
					allowChoosePaymentType: &apos;<iaixsl:value-of select="/shop/page/prepaid/details/@allowChoosePaymentType"/>&apos;,
					literals: {
						paymentTitle: ``,
						paymentPay: `Pay `,
						paymentGoBack: `Select different payment method`,
						reloadPrepaid: `Back to order`,
					},
					lastSelectedPaymentGroup:<iaixsl:choose>
						<iaixsl:when test="/shop/page/prepaid_methods/item[@id = /shop/page/prepaid/prepaid_history/item[position()=last()]/@payment_form_id]/@method_as_group = 'true'">`<iaixsl:value-of select="/shop/page/prepaid_methods/item[@id = /shop/page/prepaid/prepaid_history/item[position()=last()]/@payment_form_id]/@id"/>`</iaixsl:when>
						<iaixsl:when test="/shop/page/prepaid_methods/item[@id = /shop/page/prepaid/prepaid_history/item[position()=last()]/@payment_form_id]/@id = '153'">`<iaixsl:value-of select="/shop/page/prepaid_methods/item[@id = /shop/page/prepaid/prepaid_history/item[position()=last()]/@payment_form_id]/@id"/>`</iaixsl:when>
						<iaixsl:otherwise>`<iaixsl:value-of select="/shop/page/prepaid_methods/item[@id = /shop/page/prepaid/prepaid_history/item[position()=last()]/@payment_form_id]/@group"/>`</iaixsl:otherwise>
						</iaixsl:choose>,
					lastSelectedPaymentMethod: `<iaixsl:value-of select="/shop/page/prepaid/prepaid_history/item[position()=last()]/@payment_form_id"/>`,
					paymentHMTL: null,
					warning: false,
					paymentMethodData: null,
					paymentGroupsOrder: [<iaixsl:for-each select="/shop/page/prepaid_methods/item"><iaixsl:variable name="groupOrderID"><iaixsl:value-of select="@group"/></iaixsl:variable><iaixsl:if test="not($groupOrderID = preceding-sibling::item[not(@method_as_group = 'true')]/@group) or @method_as_group = 'true'">&apos;<iaixsl:choose><iaixsl:when test="@method_as_group = 'true' or not(/shop/page/groupList/item[@id = $groupOrderID])"><iaixsl:value-of select="@id"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="$groupOrderID"/></iaixsl:otherwise></iaixsl:choose>&apos;,</iaixsl:if></iaixsl:for-each>],
					paymentGroups: {
						<iaixsl:for-each select="/shop/page/prepaid_methods/item">
							<iaixsl:variable name="groupID"><iaixsl:value-of select="@group"/></iaixsl:variable>
							<iaixsl:variable name="groupName"><iaixsl:value-of select="/shop/page/groupList/item[@id = $groupID]/@name"/></iaixsl:variable>
							<iaixsl:if test="not($groupID = preceding-sibling::item[not(@method_as_group = 'true')]/@group) or @method_as_group = 'true'">
								<iaixsl:choose>
									<iaixsl:when test="@method_as_group = 'true' or not(/shop/page/groupList/item[@id = $groupID])">
										<iaixsl:value-of select="@id"/>: {
										groupID: &apos;<iaixsl:value-of select="@id"/>&apos;,
									</iaixsl:when>
									<iaixsl:otherwise>
										<iaixsl:value-of select="$groupID"/>: {
										groupID: &apos;<iaixsl:value-of select="$groupID"/>&apos;,
									</iaixsl:otherwise>
								</iaixsl:choose>
								open: <iaixsl:choose>
									<iaixsl:when test="(/shop/page/prepaid/prepaid_history/item[position()=last()]/@first_pay = 'true' and /shop/page/prepaid/prepaid_history/item[position()=last()]/@pay_link and @icon = /shop/page/prepaid/prepaid_history/item[position() = last()]/@icon) or (/shop/page/groupList/item[@id = $groupID]/@selected = 'true' and /shop/page/prepaid/prepaid_history/@show_selected_group = 'true' and not(@method_as_group='true'))">true</iaixsl:when>
									<iaixsl:otherwise>false</iaixsl:otherwise>
								</iaixsl:choose>,
								single_choice: <iaixsl:choose>
									<iaixsl:when test="@method_as_group = 'true' or not(/shop/page/groupList/item[@id = $groupID]) or not($groupID = following-sibling::item/@group) or /shop/page/groupList/item[@id = $groupID]/@single_form = 'true'">true</iaixsl:when>
									<iaixsl:otherwise>false</iaixsl:otherwise>
								</iaixsl:choose>,
								single_form: <iaixsl:choose>
									<iaixsl:when test="/shop/page/groupList/item[@id = $groupID]/@single_form = 'true'">true</iaixsl:when>
									<iaixsl:otherwise>false</iaixsl:otherwise>
								</iaixsl:choose>,
								name: <iaixsl:choose>
									<iaixsl:when test="@method_as_group = 'true' or (not(/shop/page/groupList/item[@id = $groupID]) and not(@id = '153'))">
										<iaixsl:choose>
											<iaixsl:when test="@id = '2'">
												`Voucher`
											</iaixsl:when>
											<iaixsl:when test="@id = '190'">
												`Gift card`
											</iaixsl:when>
											<iaixsl:otherwise>
												`<iaixsl:value-of disable-output-escaping="yes" select="@name"/>`
											</iaixsl:otherwise>
										</iaixsl:choose>
									</iaixsl:when>
									<iaixsl:when test="$groupID = 'simple_transfer'">
										`Bank transfer`
									</iaixsl:when>
									<iaixsl:when test="$groupID = 'transfer'">
										`Online bank transfer`
									</iaixsl:when>
									<iaixsl:when test="$groupID = 'card'">
										`Payment card`
									</iaixsl:when>
									<iaixsl:when test="$groupID = 'installment'">
										`Installment payment`
									</iaixsl:when>
									<iaixsl:when test="$groupID = 'others'">
										`Vouchers, gift cards`
									</iaixsl:when>
									<iaixsl:when test="@id = '153'">
										`Trade credit payment`
									</iaixsl:when>
									<iaixsl:otherwise>
										`<iaixsl:value-of disable-output-escaping="yes" select="$groupName"/>`
									</iaixsl:otherwise>
								</iaixsl:choose>,
								icon: [
									<iaixsl:choose>
										<iaixsl:when test="@method_as_group = 'true' and (@icon != '' or @icon_svg != '')">
											{
												alt: `<iaixsl:value-of select="@name"/>`,
												src: `<iaixsl:choose><iaixsl:when test="@icon_svg != ''"><iaixsl:value-of select="@icon_svg"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@icon"/></iaixsl:otherwise></iaixsl:choose>`,
											},
										</iaixsl:when>
										<iaixsl:when test="$groupID = 'card'">
											{
												alt: `<iaixsl:value-of select="@name"/>`,
												src: `<iaixsl:choose><iaixsl:when test="@icon_svg != ''"><iaixsl:value-of select="@icon_svg"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@icon"/></iaixsl:otherwise></iaixsl:choose>`,
											},
											<iaixsl:if test="$groupID = following-sibling::item/@group">
												<iaixsl:for-each select="following-sibling::item[@group = $groupID][not(position() &gt; 5)][not(@method_as_group = 'true')]">
													{
														alt: `<iaixsl:value-of select="@name"/>`,
														src: `<iaixsl:choose><iaixsl:when test="@icon_svg != ''"><iaixsl:value-of select="@icon_svg"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@icon"/></iaixsl:otherwise></iaixsl:choose>`,
													},
												</iaixsl:for-each>
											</iaixsl:if>
										</iaixsl:when>
										<iaixsl:when test="$groupID = 'transfer'">
											{
												alt: `<iaixsl:value-of select="$groupName"/>`,
												src: `data:image/svg+xml,%3Csvg xmlns=&apos;http://www.w3.org/2000/svg&apos; id=&apos;Component_1_1&apos; data-name=&apos;Component 1 – 1&apos; width=&apos;26&apos; height=&apos;34&apos; viewBox=&apos;0 0 26 34&apos;%3E%3Cpath id=&apos;Path_12&apos; data-name=&apos;Path 12&apos; d=&apos;M25.768,20.77V0H0V20.771H9.446v.85a2.35,2.35,0,0,1-2.36,2.334H5.764v1.5H19.969v-1.5H18.647a2.35,2.35,0,0,1-2.36-2.334v-.85h9.481ZM24.256,1.5V14.383H1.512V1.5ZM1.512,15.878H24.256v3.4H1.512ZM15.58,23.955H10.153a3.782,3.782,0,0,0,.806-2.334v-.85h3.816v.85a3.782,3.782,0,0,0,.806,2.334Zm0,0&apos; transform=&apos;translate(0 8.102)&apos; fill=&apos;%23333&apos;%3E%3C/path%3E%3Cg id=&apos;Rectangle_15&apos; data-name=&apos;Rectangle 15&apos; transform=&apos;translate(6.676)&apos; fill=&apos;%23fff&apos; stroke=&apos;%23333&apos; stroke-width=&apos;1.5&apos;%3E%3Crect width=&apos;12.991&apos; height=&apos;16.664&apos; rx=&apos;2&apos; stroke=&apos;none&apos;%3E%3C/rect%3E%3Crect x=&apos;0.75&apos; y=&apos;0.75&apos; width=&apos;11.491&apos; height=&apos;15.164&apos; rx=&apos;1.25&apos; fill=&apos;none&apos;%3E%3C/rect%3E%3C/g%3E%3Cline id=&apos;Line_3&apos; data-name=&apos;Line 3&apos; y2=&apos;15.787&apos; transform=&apos;translate(10.852 0.439)&apos; fill=&apos;none&apos; stroke=&apos;%23333&apos; stroke-width=&apos;1.5&apos;%3E%3C/line%3E%3Cline id=&apos;Line_4&apos; data-name=&apos;Line 4&apos; y2=&apos;14.91&apos; transform=&apos;translate(14.288 1.316)&apos; fill=&apos;none&apos; stroke=&apos;%23333&apos; stroke-width=&apos;1.5&apos;%3E%3C/line%3E%3Cline id=&apos;Line_10&apos; data-name=&apos;Line 10&apos; x2=&apos;17&apos; transform=&apos;translate(4.499 15.987)&apos; fill=&apos;none&apos; stroke=&apos;%23333&apos; stroke-width=&apos;1.4&apos;%3E%3C/line%3E%3C/svg%3E`,
											},
										</iaixsl:when>
										<iaixsl:when test="$groupID = 'installment'">
											{
												alt: `<iaixsl:value-of select="$groupName"/>`,
												src: `data:image/svg+xml,%3Csvg xmlns=&apos;http://www.w3.org/2000/svg&apos; width=&apos;25&apos; height=&apos;25&apos; viewBox=&apos;0 0 25 25&apos;%3E%3Cg id=&apos;calendar_1_&apos; transform=&apos;translate(0.25 0.25)&apos;%3E%3Cpath id=&apos;Path_23&apos; data-name=&apos;Path 23&apos; d=&apos;M22.842,2.336H19.467V.779a.779.779,0,0,0-1.557,0V2.336H13.238V.779a.779.779,0,0,0-1.557,0V2.336H7.008V.779a.779.779,0,0,0-1.557,0V2.336H2.077A2.076,2.076,0,0,0,0,4.412V22.841a2.077,2.077,0,0,0,2.077,2.077H22.842a2.076,2.076,0,0,0,2.076-2.077V4.412A2.075,2.075,0,0,0,22.842,2.336Zm.519,20.505a.52.52,0,0,1-.519.519H2.077a.52.52,0,0,1-.519-.519V4.412a.52.52,0,0,1,.519-.519H5.451V5.451a.779.779,0,0,0,1.557,0V3.893H11.68V5.451a.779.779,0,0,0,1.557,0V3.893H17.91V5.451a.779.779,0,0,0,1.557,0V3.893h3.375a.519.519,0,0,1,.519.519Z&apos; fill=&apos;%23333&apos; stroke=&apos;%23333&apos; stroke-width=&apos;0.5&apos;%3E%3C/path%3E%3Crect id=&apos;Rectangle_18&apos; data-name=&apos;Rectangle 18&apos; width=&apos;3.115&apos; height=&apos;2.336&apos; transform=&apos;translate(5.451 9.344)&apos; fill=&apos;%23333&apos; stroke=&apos;%23333&apos; stroke-width=&apos;0.5&apos;%3E%3C/rect%3E%3Crect id=&apos;Rectangle_19&apos; data-name=&apos;Rectangle 19&apos; width=&apos;3.115&apos; height=&apos;2.336&apos; transform=&apos;translate(5.451 13.238)&apos; fill=&apos;%23333&apos; stroke=&apos;%23333&apos; stroke-width=&apos;0.5&apos;%3E%3C/rect%3E%3Crect id=&apos;Rectangle_20&apos; data-name=&apos;Rectangle 20&apos; width=&apos;3.115&apos; height=&apos;2.336&apos; transform=&apos;translate(5.451 17.131)&apos; fill=&apos;%23333&apos; stroke=&apos;%23333&apos; stroke-width=&apos;0.5&apos;%3E%3C/rect%3E%3Crect id=&apos;Rectangle_21&apos; data-name=&apos;Rectangle 21&apos; width=&apos;3.115&apos; height=&apos;2.336&apos; transform=&apos;translate(10.902 17.131)&apos; fill=&apos;%23333&apos; stroke=&apos;%23333&apos; stroke-width=&apos;0.5&apos;%3E%3C/rect%3E%3Crect id=&apos;Rectangle_22&apos; data-name=&apos;Rectangle 22&apos; width=&apos;3.115&apos; height=&apos;2.336&apos; transform=&apos;translate(10.902 13.238)&apos; fill=&apos;%23333&apos; stroke=&apos;%23333&apos; stroke-width=&apos;0.5&apos;%3E%3C/rect%3E%3Crect id=&apos;Rectangle_23&apos; data-name=&apos;Rectangle 23&apos; width=&apos;3.115&apos; height=&apos;2.336&apos; transform=&apos;translate(10.902 9.344)&apos; fill=&apos;%23333&apos; stroke=&apos;%23333&apos; stroke-width=&apos;0.5&apos;%3E%3C/rect%3E%3Crect id=&apos;Rectangle_24&apos; data-name=&apos;Rectangle 24&apos; width=&apos;3.115&apos; height=&apos;2.336&apos; transform=&apos;translate(16.352 17.131)&apos; fill=&apos;%23333&apos; stroke=&apos;%23333&apos; stroke-width=&apos;0.5&apos;%3E%3C/rect%3E%3Crect id=&apos;Rectangle_25&apos; data-name=&apos;Rectangle 25&apos; width=&apos;3.115&apos; height=&apos;2.336&apos; transform=&apos;translate(16.352 13.238)&apos; fill=&apos;%23333&apos; stroke=&apos;%23333&apos; stroke-width=&apos;0.5&apos;%3E%3C/rect%3E%3Crect id=&apos;Rectangle_26&apos; data-name=&apos;Rectangle 26&apos; width=&apos;3.115&apos; height=&apos;2.336&apos; transform=&apos;translate(16.352 9.344)&apos; fill=&apos;%23333&apos; stroke=&apos;%23333&apos; stroke-width=&apos;0.5&apos;%3E%3C/rect%3E%3C/g%3E%3C/svg%3E`,
											},
										</iaixsl:when>
										<iaixsl:when test="@id = '153'">
											{
												alt: `<iaixsl:value-of select="@name"/>`,
												src: `data:image/svg+xml,%3Csvg xmlns=&apos;http://www.w3.org/2000/svg&apos; id=&apos;calendar&apos; width=&apos;26&apos; height=&apos;26&apos; fill=&apos;%23333&apos; viewBox=&apos;0 0 26 26&apos;%3E%3Cg id=&apos;Group_425&apos; data-name=&apos;Group 425&apos;%3E%3Cg id=&apos;Group_424&apos; data-name=&apos;Group 424&apos;%3E%3Cpath id=&apos;Path_75&apos; data-name=&apos;Path 75&apos; d=&apos;M22.512,1.992h-1.2V0H19.324V1.992H6.176V0H4.184V1.992h-1.2A2.992,2.992,0,0,0,0,4.98V22.512A2.992,2.992,0,0,0,2.988,25.5H22.512A2.992,2.992,0,0,0,25.5,22.512V4.98A2.992,2.992,0,0,0,22.512,1.992Zm1,20.52a1,1,0,0,1-1,1H2.988a1,1,0,0,1-1-1V9.363H23.508Zm0-15.141H1.992V4.98a1,1,0,0,1,1-1h1.2V5.977H6.176V3.984H19.324V5.977h1.992V3.984h1.2a1,1,0,0,1,1,1Z&apos;%3E%3C/path%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_427&apos; data-name=&apos;Group 427&apos; transform=&apos;translate(4.397 11.431)&apos;%3E%3Cg id=&apos;Group_426&apos; data-name=&apos;Group 426&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_196&apos; data-name=&apos;Rectangle 196&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(-0.147 -0.181)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_429&apos; data-name=&apos;Group 429&apos; transform=&apos;translate(7.914 11.431)&apos;%3E%3Cg id=&apos;Group_428&apos; data-name=&apos;Group 428&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_197&apos; data-name=&apos;Rectangle 197&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(0.336 -0.181)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_431&apos; data-name=&apos;Group 431&apos; transform=&apos;translate(12.31 11.431)&apos;%3E%3Cg id=&apos;Group_430&apos; data-name=&apos;Group 430&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_198&apos; data-name=&apos;Rectangle 198&apos; width=&apos;1&apos; height=&apos;2&apos; transform=&apos;translate(-0.06 -0.181)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_433&apos; data-name=&apos;Group 433&apos; transform=&apos;translate(14.948 11.431)&apos;%3E%3Cg id=&apos;Group_432&apos; data-name=&apos;Group 432&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_199&apos; data-name=&apos;Rectangle 199&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(0.302 -0.181)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_435&apos; data-name=&apos;Group 435&apos; transform=&apos;translate(19.345 11.431)&apos;%3E%3Cg id=&apos;Group_434&apos; data-name=&apos;Group 434&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_200&apos; data-name=&apos;Rectangle 200&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(-0.095 -0.181)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_437&apos; data-name=&apos;Group 437&apos; transform=&apos;translate(4.397 14.948)&apos;%3E%3Cg id=&apos;Group_436&apos; data-name=&apos;Group 436&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_201&apos; data-name=&apos;Rectangle 201&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(-0.147 0.302)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_439&apos; data-name=&apos;Group 439&apos; transform=&apos;translate(7.914 14.948)&apos;%3E%3Cg id=&apos;Group_438&apos; data-name=&apos;Group 438&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_202&apos; data-name=&apos;Rectangle 202&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(0.336 0.302)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_441&apos; data-name=&apos;Group 441&apos; transform=&apos;translate(12.31 14.948)&apos;%3E%3Cg id=&apos;Group_440&apos; data-name=&apos;Group 440&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_203&apos; data-name=&apos;Rectangle 203&apos; width=&apos;1&apos; height=&apos;2&apos; transform=&apos;translate(-0.06 0.302)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_443&apos; data-name=&apos;Group 443&apos; transform=&apos;translate(14.948 14.948)&apos;%3E%3Cg id=&apos;Group_442&apos; data-name=&apos;Group 442&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_204&apos; data-name=&apos;Rectangle 204&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(0.302 0.302)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_445&apos; data-name=&apos;Group 445&apos; transform=&apos;translate(4.397 19.345)&apos;%3E%3Cg id=&apos;Group_444&apos; data-name=&apos;Group 444&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_205&apos; data-name=&apos;Rectangle 205&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(-0.147 -0.095)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_447&apos; data-name=&apos;Group 447&apos; transform=&apos;translate(7.914 19.345)&apos;%3E%3Cg id=&apos;Group_446&apos; data-name=&apos;Group 446&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_206&apos; data-name=&apos;Rectangle 206&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(0.336 -0.095)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_449&apos; data-name=&apos;Group 449&apos; transform=&apos;translate(12.31 19.345)&apos;%3E%3Cg id=&apos;Group_448&apos; data-name=&apos;Group 448&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_207&apos; data-name=&apos;Rectangle 207&apos; width=&apos;1&apos; height=&apos;2&apos; transform=&apos;translate(-0.06 -0.095)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_451&apos; data-name=&apos;Group 451&apos; transform=&apos;translate(14.948 19.345)&apos;%3E%3Cg id=&apos;Group_450&apos; data-name=&apos;Group 450&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_208&apos; data-name=&apos;Rectangle 208&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(0.302 -0.095)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_453&apos; data-name=&apos;Group 453&apos; transform=&apos;translate(19.345 14.948)&apos;%3E%3Cg id=&apos;Group_452&apos; data-name=&apos;Group 452&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_209&apos; data-name=&apos;Rectangle 209&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(-0.095 0.302)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E`,
											},
										</iaixsl:when>
										<iaixsl:when test="$groupID = 'others'">
											{
												alt: `<iaixsl:value-of select="$groupName"/>`,
												src: `data:image/svg+xml,%3Csvg xmlns=&apos;http://www.w3.org/2000/svg&apos; width=&apos;38.44&apos; height=&apos;27.947&apos; viewBox=&apos;0 0 38.44 27.947&apos;%3E%3Cg id=&apos;Group_1616&apos; data-name=&apos;Group 1616&apos; transform=&apos;translate(-36 -220.526)&apos;%3E%3Cg id=&apos;gift-card&apos; transform=&apos;translate(36 145.193)&apos;%3E%3Cpath id=&apos;Path_525&apos; data-name=&apos;Path 525&apos; d=&apos;M238.505,148.8h-1.331a3.076,3.076,0,0,0-4.966-3.368,3.076,3.076,0,0,0-4.966,3.368h-1.33a.98.98,0,0,0-.98.98v4.2a.98.98,0,0,0,.98.98h.07v3.218a.98.98,0,0,0,.98.98h10.494a.98.98,0,0,0,.98-.98v-3.218h.07a.98.98,0,0,0,.98-.98v-4.2A.98.98,0,0,0,238.505,148.8Zm-7.276,8.395h-3.287v-2.238h3.287Zm0-4.2h-4.337v-2.238h4.337Zm0-4.2H230.11a1.119,1.119,0,1,1,1.119-1.119Zm1.959-1.119a1.119,1.119,0,1,1,1.119,1.119h-1.119Zm3.287,9.514h-3.287v-2.238h3.287Zm1.049-4.2h-4.337v-2.238h4.337Z&apos; transform=&apos;translate(-210.242 -60.069)&apos; fill=&apos;%23333&apos;/%3E%3Cpath id=&apos;Path_526&apos; data-name=&apos;Path 526&apos; d=&apos;M29.313,80.333H4.128A4.132,4.132,0,0,0,0,84.461V99.152a4.132,4.132,0,0,0,4.128,4.128H29.313a4.132,4.132,0,0,0,4.128-4.128V84.461A4.133,4.133,0,0,0,29.313,80.333Zm2.168,18.819a2.171,2.171,0,0,1-2.168,2.168H4.128a2.171,2.171,0,0,1-2.168-2.168V84.461a2.171,2.171,0,0,1,2.168-2.168H29.313a2.171,2.171,0,0,1,2.168,2.168Z&apos; transform=&apos;translate(0 0)&apos; fill=&apos;%23333&apos;/%3E%3Cpath id=&apos;Path_527&apos; data-name=&apos;Path 527&apos; d=&apos;M68.395,337.4H65.247a.98.98,0,1,0,0,1.959h3.148a.98.98,0,1,0,0-1.959Z&apos; transform=&apos;translate(-60.07 -240.277)&apos; fill=&apos;%23333&apos;/%3E%3Cpath id=&apos;Path_528&apos; data-name=&apos;Path 528&apos; d=&apos;M65.247,146.559h3.148a.98.98,0,1,0,0-1.959H65.247a.98.98,0,1,0,0,1.959Z&apos; transform=&apos;translate(-60.07 -60.07)&apos; fill=&apos;%23333&apos;/%3E%3Cpath id=&apos;Path_529&apos; data-name=&apos;Path 529&apos; d=&apos;M71.543,273.134h-6.3a.98.98,0,1,0,0,1.959h6.3a.98.98,0,1,0,0-1.959Z&apos; transform=&apos;translate(-60.07 -180.209)&apos; fill=&apos;%23333&apos;/%3E%3C/g%3E%3Cpath id=&apos;Subtraction_2&apos; data-name=&apos;Subtraction 2&apos; d=&apos;M-11327,8992.89h0v-2.014a2.165,2.165,0,0,0,1.481-2.055v-14.691a2.172,2.172,0,0,0-2.17-2.169h-25.186a2.164,2.164,0,0,0-2.067,1.513h-2.008a4.136,4.136,0,0,1,1.386-2.475,4.122,4.122,0,0,1,2.689-1h25.186a4.133,4.133,0,0,1,4.128,4.13v14.691a4.127,4.127,0,0,1-.989,2.677,4.145,4.145,0,0,1-2.449,1.393Z&apos; transform=&apos;translate(11398 -8749.473)&apos; fill=&apos;%23333&apos;/%3E%3C/g%3E%3C/svg%3E`,
											},
										</iaixsl:when>
										<iaixsl:otherwise>
											{
												alt: `<iaixsl:value-of select="@name"/>`,
												src: `<iaixsl:choose><iaixsl:when test="@icon_svg != ''"><iaixsl:value-of select="@icon_svg"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@icon"/></iaixsl:otherwise></iaixsl:choose>`,
											},
										</iaixsl:otherwise>
									</iaixsl:choose>
								],
								idopay_card: <iaixsl:choose>
									<iaixsl:when test="(/shop/page/prepaid_methods/item[@id='44'][@system_id='29'] or /shop/page/prepaid_methods/item[@id='45'][@system_id='29']) and $idoPay != '' and @id = 'card' and count(/shop/page/prepaid_methods/item[@group='card'][not(@system_id='29')]) = 0">true</iaixsl:when>
									<iaixsl:otherwise>false</iaixsl:otherwise>
								</iaixsl:choose>,
								paymentMethods: [
									{
										id: <iaixsl:value-of select="@id"/>,
										selected: <iaixsl:choose>
											<iaixsl:when test="@checked = 'true'">true</iaixsl:when>
											<iaixsl:when test="/shop/page/prepaid/prepaid_history/item[position()=last()]/@pay_link and /shop/page/prepaid/prepaid_history/item[position()=last()]/@first_pay = 'true' and @icon = /shop/page/prepaid/prepaid_history/item[position() = last()]/@icon">true</iaixsl:when>
											<iaixsl:otherwise>false</iaixsl:otherwise>
										</iaixsl:choose>,
										name: <iaixsl:choose>
											<iaixsl:when test="@id = '2'">
												`Voucher`
											</iaixsl:when>
											<iaixsl:when test="@id = '190'">
												`Gift card`
											</iaixsl:when>
											<iaixsl:otherwise>
												`<iaixsl:value-of disable-output-escaping="yes" select="@name"/>`
											</iaixsl:otherwise>
										</iaixsl:choose>,
										payment_system_logo: `<iaixsl:value-of disable-output-escaping="yes" select="@payment_system_logo"/>`,
										icon: `<iaixsl:choose><iaixsl:when test="@icon_svg != ''"><iaixsl:value-of select="@icon_svg"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@icon"/></iaixsl:otherwise></iaixsl:choose>`,
										description: <iaixsl:choose>
											<iaixsl:when test="@description and not(@description = ' ')">`<iaixsl:value-of disable-output-escaping="yes" select="@description"/>`</iaixsl:when>
											<iaixsl:otherwise>false</iaixsl:otherwise>
										</iaixsl:choose>,
									},
									<iaixsl:if test="$groupID = following-sibling::item/@group">
										<iaixsl:for-each select="following-sibling::item[@group = $groupID][not(@method_as_group = 'true')]">
											{
												id: <iaixsl:value-of select="@id"/>,
												selected: <iaixsl:choose>
													<iaixsl:when test="@checked = 'true'">true</iaixsl:when>
													<iaixsl:when test="/shop/page/prepaid/prepaid_history/item[position()=last()]/@pay_link and /shop/page/prepaid/prepaid_history/item[position()=last()]/@first_pay = 'true' and @icon = /shop/page/prepaid/prepaid_history/item[position() = last()]/@icon">true</iaixsl:when>
													<iaixsl:otherwise>false</iaixsl:otherwise>
												</iaixsl:choose>,
												name: <iaixsl:choose>
													<iaixsl:when test="@id = '2'">
														`Voucher`
													</iaixsl:when>
													<iaixsl:when test="@id = '190'">
														`Gift card`
													</iaixsl:when>
													<iaixsl:otherwise>
														`<iaixsl:value-of disable-output-escaping="yes" select="@name"/>`
													</iaixsl:otherwise>
												</iaixsl:choose>,
												payment_system_logo: `<iaixsl:value-of disable-output-escaping="yes" select="@payment_system_logo"/>`,
												icon: `<iaixsl:choose><iaixsl:when test="@icon_svg != ''"><iaixsl:value-of select="@icon_svg"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@icon"/></iaixsl:otherwise></iaixsl:choose>`,
												description: <iaixsl:choose>
													<iaixsl:when test="@description and not(@description = ' ')">`<iaixsl:value-of disable-output-escaping="yes" select="@description"/>`</iaixsl:when>
													<iaixsl:otherwise>false</iaixsl:otherwise>
												</iaixsl:choose>,
											},
										</iaixsl:for-each>
									</iaixsl:if>
								],
								},
							</iaixsl:if>
						</iaixsl:for-each>
					},
				}
			</script>
			<div id="prepaid_app" class="prepaid_payitems_wrapper"/>
		</div>
	</iaixsl:if>

	<script>
		var orderID = &apos;<iaixsl:value-of disable-output-escaping="yes" select="/shop/page/prepaid/details/@id"/>&apos;;
		var orderKey = &apos;<iaixsl:value-of disable-output-escaping="yes" select="/shop/page/prepaid/payback/@key"/>&apos;;
		var orderFirstPay = &apos;&apos;;
		<iaixsl:if test="page/prepaid/prepaid_history/item[position()=last()]/@first_pay = 'true' and page/prepaid/prepaid_history/item[position()=last()]/@pay_link">
			orderFirstPay = &apos;<iaixsl:value-of disable-output-escaping="yes" select="page/prepaid/prepaid_history/item[position()=last()]/@pay_link"/><iaixsl:text disable-output-escaping="yes">&amp;ajax=true</iaixsl:text>&apos;;
		</iaixsl:if>
	</script>

	<div style="display:none">
		<iaixsl:for-each select="/shop/page/payments_static/*">
			<div data-altid="orderdetails_payments_payment_card">
				<iaixsl:attribute name="class">embeded_card_form_<iaixsl:value-of select="@id"/></iaixsl:attribute>
				<div class="payment_card_sub">
					<div class="payment_card_info_new" data-altid="payment_card_info_new">
						You are in a secure SSL connection that prevents data being viewed by unauthorized persons. While making a payment, you can decide if you want the card data to be saved in our system. By giving consent, you will not have to provide the data in the future again.
					</div>

					<iaixsl:if test="payform/headermessage or payform/headerlogo">
						<div class="payment_head_info" style="display: none;">
							<iaixsl:if test="payform/headermessage">
								<div class="payment_headermessage">
									<iaixsl:value-of disable-output-escaping="yes" select="payform/headermessage"/>
								</div>
							</iaixsl:if>
							<iaixsl:if test="payform/headerlogo">
								<div class="payment_headerlogo">
									<img>
										<iaixsl:attribute name="src"><iaixsl:value-of select="payform/headerlogo"/></iaixsl:attribute>
									</img>
								</div>
							</iaixsl:if>
						</div>
					</iaixsl:if>

					<form class="payment_card clearfix">
						<iaixsl:attribute name="action"><iaixsl:value-of select="payform/@action"/></iaixsl:attribute>
						<iaixsl:attribute name="method"><iaixsl:value-of select="payform/@method"/></iaixsl:attribute>
						<iaixsl:for-each select="payform/item">
							<iaixsl:choose>
								<iaixsl:when test="@name = 'creditCard[system]'">
									<div class="payment_card_formel cc_wrapper">
										<label for="credit_card_system" class="card_type_label">Types of cards supported:</label>
										<div class="clear_data" data-altid="credit_card_system">
											<iaixsl:for-each select="option">
												<label class="card-icon">
													<iaixsl:attribute name="id">card_icon_<iaixsl:value-of select="@value"/></iaixsl:attribute>
													<input type="radio" class="validate required" data-serialize="#dialog_wrapper #credit_card_system input">
														<iaixsl:attribute name="value"><iaixsl:value-of select="@value"/></iaixsl:attribute>
														<iaixsl:attribute name="name"><iaixsl:value-of select="../@name"/></iaixsl:attribute>
														<iaixsl:if test="@name != ''">
															<iaixsl:attribute name="data-name"><iaixsl:value-of select="@name"/></iaixsl:attribute>
														</iaixsl:if>
														<iaixsl:if test="@altName != ''">
															<iaixsl:attribute name="data-altName"><iaixsl:value-of select="@altName"/></iaixsl:attribute>
														</iaixsl:if>
													</input>
													<div>
														<img>
															<iaixsl:attribute name="src"><iaixsl:value-of select="@data-img"/></iaixsl:attribute>
															<iaixsl:attribute name="alt"><iaixsl:value-of select="@label"/></iaixsl:attribute>
														</img>
														<span><iaixsl:value-of select="@label"/></span>
													</div>
												</label>
											</iaixsl:for-each>
										</div>
										
									</div>
								</iaixsl:when>
								<iaixsl:when test="@name = 'creditCard[number]'">
									<div class="form-group row clearfix">
										<div class="col-12">
											<label for="credit_card_number" class="control-label">Card number:</label>
										</div>
										<div class="has-feedback col-12 has-required">
											<input type="text" data-altid="credit_card_number" class="form-control validate" data-serialize="#dialog_wrapper #credit_card_number">
												<iaixsl:attribute name="name"><iaixsl:value-of select="@name"/></iaixsl:attribute>
												<iaixsl:if test="@value != ''">
													<iaixsl:attribute name="value"><iaixsl:value-of select="@value"/></iaixsl:attribute>
												</iaixsl:if>
												<iaixsl:if test="@name != ''">
													<iaixsl:attribute name="data-name"><iaixsl:value-of select="@name"/></iaixsl:attribute>
												</iaixsl:if>
												<iaixsl:if test="@altName != ''">
													<iaixsl:attribute name="data-altName"><iaixsl:value-of select="@altName"/></iaixsl:attribute>
												</iaixsl:if>
											</input>
											<span class="form-control-feedback"/>
										</div>
										
									</div>
								</iaixsl:when>
								<iaixsl:when test="@name = 'creditCard[endDateMonth]'">
									<iaixsl:text disable-output-escaping="yes">&lt;div  class=&quot;row&quot; &gt;</iaixsl:text>
									<div class="form-group date_select col-7 col-sm-8">
										<div class="row clearfix">
											<div class="col-12">
												<label for="credit_card_month" class="control-label">Expiry date: </label>
											</div>
											<div class="col-12">
												<input type="text" data-altid="credit_card_month" class="form-control" data-serialize="#dialog_wrapper #credit_card_month, #dialog_wrapper #credit_card_year">
													<iaixsl:attribute name="name"><iaixsl:value-of select="@name"/></iaixsl:attribute>
													<iaixsl:if test="@value != ''">
														<iaixsl:attribute name="value"><iaixsl:value-of select="@value"/></iaixsl:attribute>
													</iaixsl:if>
													<iaixsl:if test="@name != ''">
														<iaixsl:attribute name="data-name"><iaixsl:value-of select="@name"/></iaixsl:attribute>
													</iaixsl:if>
													<iaixsl:if test="@altName != ''">
														<iaixsl:attribute name="data-altName"><iaixsl:value-of select="@altName"/></iaixsl:attribute>
													</iaixsl:if>
												</input>

												<iaixsl:if test="../item[@name = 'creditCard[endDateYear]']/@name">
													<span class="payment_card_expire"> / </span>
													<input type="text" data-altid="credit_card_year" class="form-control" data-serialize="#dialog_wrapper #credit_card_month, #dialog_wrapper #credit_card_year">
														<iaixsl:attribute name="name"><iaixsl:value-of select="../item[@name = 'creditCard[endDateYear]']/@name"/></iaixsl:attribute>
														<iaixsl:attribute name="value"><iaixsl:value-of select="../item[@name = 'creditCard[endDateYear]']/@value"/></iaixsl:attribute>
														<iaixsl:if test="@name != ''">
															<iaixsl:attribute name="data-name"><iaixsl:value-of select="../item[@name = 'creditCard[endDateYear]']/@name"/></iaixsl:attribute>
														</iaixsl:if>
														<iaixsl:if test="../item[@name = 'creditCard[endDateYear]']/@altName != ''">
															<iaixsl:attribute name="data-altName"><iaixsl:value-of select="../item[@name = 'creditCard[endDateYear]']/@altName"/></iaixsl:attribute>
														</iaixsl:if>
													</input>
												</iaixsl:if>
											</div>
										</div>
										
									</div>
								</iaixsl:when>
								<iaixsl:when test="@name = 'creditCard[securityCode]'">
									<div class="form-group security_code col-5 col-sm-4">
										<div class="row clearfix">
											<div class="col-12">
												<label for="credit_card_code" class="control-label">CVV2/CVC2:</label>
											</div>
											<div class="has-feedback col-12 has-required">
												<input type="text" data-altid="credit_card_code" class="form-control validate" data-serialize="#dialog_wrapper #credit_card_code">
													<iaixsl:attribute name="name"><iaixsl:value-of select="@name"/></iaixsl:attribute>
													<iaixsl:if test="@value != ''">
														<iaixsl:attribute name="value"><iaixsl:value-of select="@value"/></iaixsl:attribute>
													</iaixsl:if>
													<iaixsl:if test="@name != ''">
														<iaixsl:attribute name="data-name"><iaixsl:value-of select="@name"/></iaixsl:attribute>
													</iaixsl:if>
													<iaixsl:if test="@altName != ''">
														<iaixsl:attribute name="data-altName"><iaixsl:value-of select="@altName"/></iaixsl:attribute>
													</iaixsl:if>
												</input>
												<span class="form-control-feedback"/>
											</div>
										</div>
									</div>
									<iaixsl:text disable-output-escaping="yes">&lt;/div&gt;</iaixsl:text>
								</iaixsl:when>
								<iaixsl:when test="@name = 'creditCard[name]'">
									<div class="form-group row clearfix">
										<div class="col-12">
											<label for="credit_card_name" class="control-label">First and last name:</label>
										</div>
										<div class="has-feedback col-12 has-required">
											<input type="text" data-altid="credit_card_name" class="form-control validate" data-serialize="#dialog_wrapper #credit_card_name">
												<iaixsl:attribute name="name"><iaixsl:value-of select="@name"/></iaixsl:attribute>
												<iaixsl:if test="@value != ''">
													<iaixsl:attribute name="value"><iaixsl:value-of select="@value"/></iaixsl:attribute>
												</iaixsl:if>
												<iaixsl:if test="@name != ''">
													<iaixsl:attribute name="data-name"><iaixsl:value-of select="@name"/></iaixsl:attribute>
												</iaixsl:if>
												<iaixsl:if test="@altName != ''">
													<iaixsl:attribute name="data-altName"><iaixsl:value-of select="@altName"/></iaixsl:attribute>
												</iaixsl:if>
											</input>
											<span class="form-control-feedback"/>
										</div>
									</div>
								</iaixsl:when>
								<iaixsl:when test="@name = 'payment'">
									<input data-altid="credit_card_payment" type="hidden">
										<iaixsl:attribute name="name"><iaixsl:value-of select="@name"/></iaixsl:attribute>
										<iaixsl:if test="@value != ''">
											<iaixsl:attribute name="value"><iaixsl:value-of select="@value"/></iaixsl:attribute>
										</iaixsl:if>
										<iaixsl:if test="@name != ''">
											<iaixsl:attribute name="data-name"><iaixsl:value-of select="@name"/></iaixsl:attribute>
										</iaixsl:if>
										<iaixsl:if test="@altName != ''">
											<iaixsl:attribute name="data-altName"><iaixsl:value-of select="@altName"/></iaixsl:attribute>
										</iaixsl:if>
									</input>
								</iaixsl:when>
								<iaixsl:when test="@name = 'payformid'">
									<input data-altid="credit_card_payformid" type="hidden">
										<iaixsl:attribute name="name"><iaixsl:value-of select="@name"/></iaixsl:attribute>
										<iaixsl:if test="@value != ''">
											<iaixsl:attribute name="value"><iaixsl:value-of select="@value"/></iaixsl:attribute>
										</iaixsl:if>
										<iaixsl:if test="@name != ''">
											<iaixsl:attribute name="data-name"><iaixsl:value-of select="@name"/></iaixsl:attribute>
										</iaixsl:if>
										<iaixsl:if test="@altName != ''">
											<iaixsl:attribute name="data-altName"><iaixsl:value-of select="@altName"/></iaixsl:attribute>
										</iaixsl:if>
									</input>
								</iaixsl:when>
								<iaixsl:when test="@type = 'hidden'">
									<input type="hidden">
										<iaixsl:attribute name="name"><iaixsl:value-of select="@name"/></iaixsl:attribute>
										<iaixsl:if test="@value != ''">
											<iaixsl:attribute name="value"><iaixsl:value-of select="@value"/></iaixsl:attribute>
										</iaixsl:if>
									</input>
								</iaixsl:when>
							</iaixsl:choose>
						</iaixsl:for-each>
						<div class="clear_data cc_wrapper" data-altid="credit_card_agree">
						</div>
						<div class="credit_card_submit" data-altid="credit_card_submit">
							<button class="credit_card_submit_no_store btn --medium --outline" type="submit">
								<iaixsl:attribute name="title">Pay without saving the card</iaixsl:attribute>
								Pay without saving the card
							</button>
							<button class="credit_card_submit_store btn --medium --solid" type="submit">
								<iaixsl:attribute name="title">Pay and save the card</iaixsl:attribute>
								Pay and save the card
							</button>
						</div>
						<div class="clear_data cc_wrapper" data-altid="credit_card_buttons">
						</div>
						<div class="row">
							<div class="credit_card_pci_dss col-12">
								<span class="pci_dss_label">Payment Card Industry Data Security Standard</span>
								<span class="pci_dss_icon_container">
									<img src="/gfx/standards/pci_css_logo.png?r=1696937716" alt="PCI DSS Compilant"/>
								</span>
							</div>
						</div>
					</form>
				</div>
			</div>
		</iaixsl:for-each>
	</div>

	<iaixsl:if test="/shop/page/prepaid_methods/item[@id = '190']">
		<div id="giftcard_data" class="giftcard_form_wrapp" style="display: none;">
			<form class="giftcard_form" id="giftcard_form">
				<iaixsl:attribute name="data-action">/order-newpayment.php?order=<iaixsl:value-of select="/shop/page/prepaid/details/@id"/></iaixsl:attribute>
				<iaixsl:if test="/shop/page/prepaid/details/@paymentlink">
					<iaixsl:attribute name="data-action"><iaixsl:value-of select="/shop/page/prepaid/details/@paymentlink"/></iaixsl:attribute>
				</iaixsl:if>
				<iaixsl:attribute name="action">/order-newpayment.php?order=<iaixsl:value-of select="/shop/page/prepaid/details/@id"/></iaixsl:attribute>
				<iaixsl:if test="/shop/page/prepaid/details/@paymentlink">
					<iaixsl:attribute name="action"><iaixsl:value-of select="/shop/page/prepaid/details/@paymentlink"/></iaixsl:attribute>
				</iaixsl:if>
				<input name="payform_id" type="checkbox" checked="checked" class="orderdetails_radio" value="190" id="payform_190"/>
				
				<p>Pay with your gift card</p>
				
				<div class="giftcard_inputs">
					<div class="f-group">
						<input class="f-control" value="" name="voucher_id" type="text" id="giftcard_id_input"/>
						<label class="f-label" for="giftcard_id_input">Your card number</label>
					</div>
					<div class="f-group">
						<input class="f-control" value="" name="pin_value" type="password" id="pin_value_input"/>
						<label class="f-label" for="pin_value_input">Your card PIN</label>
					</div>
				</div>
				<button class="btn --medium --solid">Enter your card</button>
			</form>
		</div>
	</iaixsl:if>

	<iaixsl:if test="/shop/page/prepaid_methods/item[@id = '2']">
		<div id="voucher_data" class="voucher_form_wrapp" style="display: none;">
			<form class="giftcard_form" id="voucher_form">
				<iaixsl:attribute name="data-action">/order-newpayment.php?order=<iaixsl:value-of select="/shop/page/prepaid/details/@id"/></iaixsl:attribute>
				<iaixsl:if test="/shop/page/prepaid/details/@paymentlink">
					<iaixsl:attribute name="data-action"><iaixsl:value-of select="/shop/page/prepaid/details/@paymentlink"/></iaixsl:attribute>
				</iaixsl:if>
				<iaixsl:attribute name="action">/order-newpayment.php?order=<iaixsl:value-of select="/shop/page/prepaid/details/@id"/></iaixsl:attribute>
				<iaixsl:if test="/shop/page/prepaid/details/@paymentlink">
					<iaixsl:attribute name="action"><iaixsl:value-of select="/shop/page/prepaid/details/@paymentlink"/></iaixsl:attribute>
				</iaixsl:if>
				<input name="payform_id" type="checkbox" checked="checked" class="orderdetails_radio" value="2" id="payform_2"/>
				
				<p>Pay with voucher</p>
				
				<div class="giftcard_inputs">
					<div class="f-group">
						<input class="f-control" value="" name="voucher_id" type="text" minlength="10" id="voucher_id_input"/>
						<label class="f-label" for="voucher_id_input">Your voucher number</label>
					</div>
				</div>
				<button class="btn --medium --solid">Pay with voucher</button>

				<small>If you have more than one voucher, you can enter their numbers after confirming your present voucher.</small>
			</form>
		</div>
	</iaixsl:if>

  <template id="prepaid_clause_item_template">
    <div class="prepaid_clauses__item"/>
  </template>

  <template id="prepaid_terms_item_template">
		<div class="summary__term">
			<label class="summary__term_label">
				<span>
					<input type="checkbox" name="summary_term" value="yes" class="css-checkbox" required="required"/>
					<i class="css-label --small"/>
				</span>
				<span class="summary__term__value"/>
			</label>
		</div>
  </template>
  
  
	<iaixsl:if test="/shop/page/prepaid/details/@checkout_type = 'idosell'">
		<template id="expchck_retry_modal">
			<h4 class="expchck__title">Order ID<iaixsl:text> </iaixsl:text><iaixsl:value-of select="page/prepaid/details/@orderid"/></h4>
			
			<div class="expchck__wrapper">
				<div class="expchck_warning__wrapper">
					<iaixsl:if test="page/prepaid/details/@paymentstatus != 'g' and /shop/page/prepaid_methods/item and (page/prepaid/prepaid_history/item[position() = last()]/@status = 'n' or page/prepaid/prepaid_history/@show_payment_button = 'true')">
						<iaixsl:if test="page/prepaid/prepaid_history/item[position() = last()]/@payment_form_id != 153">
							<strong class="expchck_warning__title">Payment error has occurred. Please try again.</strong>
		
							<span class="expchck_warning__details">If, for some reason, you have not completed the payment process pay again.</span>
						</iaixsl:if>
					</iaixsl:if>
				</div>

				<div class="expchck_payments">
					<div class="expchck_payments__clause_top"/>
					<div class="expchck_payments__wrapper"/>
				</div>

				<div class="expchck_summary">
					<div class="expchck_summary__outer_wrapper">
						<div class="expchck_summary__wrapper">
						<div class="expchck_summary__item --costs expchck_costs">
							
							<iaixsl:if test="(/shop/page/prepaid/order/@product_cost &gt; 0) and /shop/page/prepaid/order/@product_cost_formatted">
								<div class="expchck_costs__item --worth">
									<span class="expchck_costs__label">Order value:</span>
									<strong class="expchck_costs__value"><iaixsl:value-of select="/shop/page/prepaid/order/@product_cost_formatted"/></strong>
								</div>
							</iaixsl:if>
							
							<iaixsl:if test="(/shop/page/prepaid/order/@shipping_cost &gt; 0) and /shop/page/prepaid/order/@shipping_cost_formatted">
								<div class="expchck_costs__item --shipping">
									<span class="expchck_costs__label">Delivery cost:</span>
									<strong class="expchck_costs__value --plus"><iaixsl:value-of select="/shop/page/prepaid/order/@shipping_cost_formatted"/></strong>
								</div>
							</iaixsl:if>
						</div>

						
						<iaixsl:if test="/shop/page/prepaid/order/@payment_remain &gt; 0">
							<div class="expchck_summary__item --total expchck_total">
								<div class="expchck_total__wrapper">
									<span class="expchck_total__title --small">Total to pay</span>
									<span class="expchck_total__value">
										<iaixsl:choose>
											<iaixsl:when test="/shop/page/prepaid/prepaid_history/item[position() = last()]/@payment_form_id='203'">
												<iaixsl:choose><iaixsl:when test="/shop/page/prepaid/details/@advance_formatted"><iaixsl:value-of select="/shop/page/prepaid/details/@advance_formatted"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="/shop/page/prepaid/order/@payment_remain_formatted"/></iaixsl:otherwise></iaixsl:choose>
											</iaixsl:when>
											<iaixsl:otherwise><iaixsl:choose>
												<iaixsl:when test="(/shop/page/prepaid/details/@advance = /shop/page/prepaid/order/@payment_paid) and (/shop/page/prepaid/prepaid_history/item[position() = last()]/amount/client_currency/@value_formatted)"><iaixsl:value-of select="page/prepaid/prepaid_history/item[position() = last()]/amount/client_currency/@value_formatted"/></iaixsl:when>
												<iaixsl:when test="/shop/page/prepaid/details/@advance_formatted"><iaixsl:value-of select="/shop/page/prepaid/details/@advance_formatted"/></iaixsl:when>
												<iaixsl:otherwise><iaixsl:value-of select="/shop/page/prepaid/order/@payment_remain_formatted"/></iaixsl:otherwise>
											</iaixsl:choose></iaixsl:otherwise>
										</iaixsl:choose>
									</span>
								</div>
							</div>
						</iaixsl:if>

						
						<div class="expchck_summary__item --clauses expchck_clauses"/>

						<div class="expchck_summary__item --terms expchck_terms"/>

						<div class="expchck_summary__item --submit expchck_submit">
							<iaixsl:if test="page/prepaid/details/@paymentstatus != 'g' and /shop/page/prepaid_methods/item and (page/prepaid/prepaid_history/item[position() = last()]/@status = 'n' or page/prepaid/prepaid_history/@show_payment_button = 'true')">
								<div class="expchck_submit__wrapper">
									<span class="expchck_submit__verify">Check all details and place order</span>
									<button type="submit" class="expchck_submit__button btn --solid --large">
										<iaixsl:attribute name="data-payform_id"><iaixsl:value-of select="page/prepaid/prepaid_history/item[position() = last()]/@payment_form_id"/></iaixsl:attribute>
										<iaixsl:attribute name="data-retry_payment"><iaixsl:value-of select="page/prepaid/prepaid_history/@retry_payment"/></iaixsl:attribute>
										<iaixsl:attribute name="data-pay_link"><iaixsl:value-of select="page/prepaid/prepaid_history/item[position()=last()]/@pay_link"/></iaixsl:attribute>

										Pay (try again)
									</button>
								</div>
							</iaixsl:if>
						</div>
					</div>
					</div>
				</div>
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
				Show all
			</a>
		</template>
		
		<template id="expchck_payments_option">
			<div class="expchck_payments__option">
				<input type="radio" name="payform_id" class="expchck_payments__option_input f-control" disabled="disabled"/>
				<label class="expchck_payments__option_select">
					<span class="expchck_payments__option_icons">
						<img class="expchck_payments__option_icon"/>
					</span>
					<span class="expchck_payments__option_name"/>
				</label>
			</div>
		</template>
	</iaixsl:if>
  

	
	<div id="alert_cover" class="projector_alert_55916" style="display:none" onclick="Alertek.hide_alert();"/>

	
	<iaixsl:if test="/shop/page/prepaid_methods/item/@method_as_group"> </iaixsl:if>
	<iaixsl:if test="/shop/page/prepaid_methods/@extended_js"> </iaixsl:if>
	<iaixsl:if test="/shop/page/prepaid_methods/@internal_blik"> </iaixsl:if>
	<iaixsl:if test="/shop/page/prepaid/onside_terms/@active='y'"> </iaixsl:if>
	<iaixsl:if test="/shop/page/prepaid/editlink/@active='y'"> </iaixsl:if>
	<iaixsl:if test="page/prepaid/details/@paymentstatus"> </iaixsl:if>
	<iaixsl:if test="/shop/page/payments_static/embeded_card_form"> </iaixsl:if>
<!-- (prepaid_order_products, 614c5cf2104962.67108738.9)-->
	<iaixsl:if test="page/ordered_products/product">
		<iaixsl:variable name="visibleProductsInGroupPrepaid">2</iaixsl:variable>

		
		<iaixsl:variable name="setIconLarge"/>
		<iaixsl:variable name="nettoPricePrepaid"><iaixsl:if test="/shop/page/@price_type = 'net'">true</iaixsl:if></iaixsl:variable>
		<iaixsl:variable name="grossPricePrepaid"> incl. VAT</iaixsl:variable>

		<div id="prepaid_order_products" class="ordered_products">
			<iaixsl:if test="page/ordered_products/product[@basket_group_id]">
				<iaixsl:attribute name="data-groups">true</iaixsl:attribute>
			</iaixsl:if>
			<h2 class="orderdetails_label"><span>Ordered items</span></h2>
			<iaixsl:for-each select="page/ordered_products/product">
				<div class="ordered_product">
					<iaixsl:variable name="groupId"><iaixsl:value-of select="@basket_group_id"/></iaixsl:variable>
					<iaixsl:variable name="subscriptionGroup"><iaixsl:value-of select="/shop/page/ordered_products/groups/group[@id = $groupId]/types/type[@value = 'subscription']/@value != ''"/></iaixsl:variable>
					<iaixsl:if test="@basket_group_id">
						<iaixsl:attribute name="data-group"><iaixsl:for-each select="/shop/page/ordered_products/groups/group[@id = $groupId]/types/type"><iaixsl:value-of select="@value"/><iaixsl:if test="position() != last()">;</iaixsl:if></iaixsl:for-each></iaixsl:attribute>
						<iaixsl:attribute name="style">--group:<iaixsl:value-of select="$groupId"/>;</iaixsl:attribute>
						<iaixsl:attribute name="data-group-id"><iaixsl:value-of select="$groupId"/></iaixsl:attribute>
						<iaixsl:if test="not($groupId = preceding-sibling::product/@basket_group_id)">
							<iaixsl:attribute name="data-first-in-group">true</iaixsl:attribute>
							<iaixsl:if test="$subscriptionGroup = 'true'">
								<iaixsl:attribute name="data-label-group">Subscription</iaixsl:attribute>
							</iaixsl:if>
						</iaixsl:if>
						<iaixsl:if test="not($groupId = following-sibling::product/@basket_group_id)">
							<iaixsl:attribute name="data-last-in-group">true</iaixsl:attribute>
						</iaixsl:if>
						<iaixsl:if test="count(preceding-sibling::product[@basket_group_id = $groupId]) &gt;= $visibleProductsInGroupPrepaid">
							<iaixsl:attribute name="data-hide">true</iaixsl:attribute>
						</iaixsl:if>
						<iaixsl:if test="count(preceding-sibling::product[@basket_group_id = $groupId]) = $visibleProductsInGroupPrepaid - 1 and $groupId = following-sibling::product/@basket_group_id">
							<iaixsl:attribute name="data-last-visible">true</iaixsl:attribute>
						</iaixsl:if>
					</iaixsl:if>

					<iaixsl:if test="count(preceding-sibling::product[@basket_group_id = $groupId]) = $visibleProductsInGroupPrepaid - 1 and $groupId = following-sibling::product/@basket_group_id">
						<a href="#showAllInGroup" class="ordered_product__visible_in_group --show">+<iaixsl:value-of select="count(following-sibling::product[@basket_group_id = $groupId])"/> subscription products</a>
						<iaixsl:if test="$subscriptionGroup = 'true'">
							<div class="ordered_product__link --show">
								<a>
									<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/page/ordered_products/groups/group[@id = $groupId]/details/subscription/@url"/></iaixsl:attribute>
									Subscription settings
								</a>
							</div>
							<div class="ordered_product__subscription_info --show">
								<iaixsl:variable name="subscriptionTotalValue"><iaixsl:value-of select="/shop/page/ordered_products/groups/group[@id = $groupId]/details/prices/@price_total_formatted"/></iaixsl:variable>
								<iaixsl:variable name="subscriptionTotalText">We will charge your payment card with a subscription fee of: %s according to the selected shipping cycle until your subscription ends.</iaixsl:variable>
								<iaixsl:value-of select="php:function('sprintf', $subscriptionTotalText, $subscriptionTotalValue)"/>
							</div>
						</iaixsl:if>
					</iaixsl:if>

					<iaixsl:if test="count(preceding-sibling::product[@basket_group_id = $groupId]) &gt;= $visibleProductsInGroupPrepaid and not($groupId = following-sibling::product/@basket_group_id)">
						<a href="#hideAllInGroup" class="ordered_product__visible_in_group --hide">Hide</a>
					</iaixsl:if>

					<iaixsl:if test="$subscriptionGroup = 'true' and not($groupId = following-sibling::product/@basket_group_id)">
						<div class="ordered_product__link">
							<a>
								<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/page/ordered_products/groups/group[@id = $groupId]/details/subscription/@url"/></iaixsl:attribute>
								Subscription settings
							</a>
						</div>
						<div class="ordered_product__subscription_info">
							<iaixsl:variable name="subscriptionTotalValue"><iaixsl:value-of select="/shop/page/ordered_products/groups/group[@id = $groupId]/details/prices/@price_total_formatted"/></iaixsl:variable>
							<iaixsl:variable name="subscriptionTotalText">We will charge your payment card with a subscription fee of: %s according to the selected shipping cycle until your subscription ends.</iaixsl:variable>
							<iaixsl:value-of select="php:function('sprintf', $subscriptionTotalText, $subscriptionTotalValue)"/>
						</div>
					</iaixsl:if>

					<div class="ordered_product__icon">
						<iaixsl:choose>
							<iaixsl:when test="@link">
								<a>
									<iaixsl:attribute name="href"><iaixsl:value-of select="@link"/></iaixsl:attribute>
									<iaixsl:choose>
										<iaixsl:when test="$setIconLarge">
                      <iaixsl:choose>
                        <iaixsl:when test="icon_second and not(icon_second = '' or icon_second = '/')">
                          <picture>
                            <source type="image/webp">
                              <iaixsl:attribute name="srcset"><iaixsl:value-of select="icon"/></iaixsl:attribute>
                            </source>
                            <img>
                              <iaixsl:attribute name="src"><iaixsl:value-of select="icon_second"/></iaixsl:attribute>
                              <iaixsl:attribute name="alt"><iaixsl:value-of select="@name"/></iaixsl:attribute>
                            </img>
                          </picture>
                        </iaixsl:when>
                        <iaixsl:otherwise>
                          <img>
                            <iaixsl:attribute name="src"><iaixsl:value-of select="icon"/></iaixsl:attribute>
                            <iaixsl:attribute name="alt"><iaixsl:value-of select="@name"/></iaixsl:attribute>
                          </img>
                        </iaixsl:otherwise>
                      </iaixsl:choose>
										</iaixsl:when>
										<iaixsl:otherwise>
                      <iaixsl:choose>
                        <iaixsl:when test="icon_small_second and not(icon_small_second = '' or icon_small_second = '/')">
                          <picture>
                            <source type="image/webp">
                              <iaixsl:attribute name="srcset"><iaixsl:value-of select="iconsmall"/></iaixsl:attribute>
                            </source>
                            <img>
                              <iaixsl:attribute name="src"><iaixsl:value-of select="icon_small_second"/></iaixsl:attribute>
                              <iaixsl:attribute name="alt"><iaixsl:value-of select="@name"/></iaixsl:attribute>
                            </img>
                          </picture>
                        </iaixsl:when>
                        <iaixsl:otherwise>
                          <img>
                            <iaixsl:attribute name="src"><iaixsl:value-of select="iconsmall"/></iaixsl:attribute>
                            <iaixsl:attribute name="alt"><iaixsl:value-of select="@name"/></iaixsl:attribute>
                          </img>
                        </iaixsl:otherwise>
                      </iaixsl:choose>
										</iaixsl:otherwise>
									</iaixsl:choose>
								</a>
							</iaixsl:when>
							<iaixsl:otherwise>
								<iaixsl:choose>
									<iaixsl:when test="$setIconLarge">
										<iaixsl:choose>
                      <iaixsl:when test="icon_second and not(icon_second = '' or icon_second = '/')">
                        <picture>
                          <source type="image/webp">
                            <iaixsl:attribute name="srcset"><iaixsl:value-of select="icon"/></iaixsl:attribute>
                          </source>
                          <img>
                            <iaixsl:attribute name="src"><iaixsl:value-of select="icon_second"/></iaixsl:attribute>
                            <iaixsl:attribute name="alt"><iaixsl:value-of select="@name"/></iaixsl:attribute>
                          </img>
                        </picture>
                      </iaixsl:when>
                      <iaixsl:otherwise>
                        <img>
                          <iaixsl:attribute name="src"><iaixsl:value-of select="icon"/></iaixsl:attribute>
                          <iaixsl:attribute name="alt"><iaixsl:value-of select="@name"/></iaixsl:attribute>
                        </img>
                      </iaixsl:otherwise>
                    </iaixsl:choose>
									</iaixsl:when>
									<iaixsl:otherwise>
                    <iaixsl:choose>
                      <iaixsl:when test="icon_small_second and not(icon_small_second = '' or icon_small_second = '/')">
                        <picture>
                          <source type="image/webp">
                            <iaixsl:attribute name="srcset"><iaixsl:value-of select="iconsmall"/></iaixsl:attribute>
                          </source>
                          <img>
                            <iaixsl:attribute name="src"><iaixsl:value-of select="icon_small_second"/></iaixsl:attribute>
                            <iaixsl:attribute name="alt"><iaixsl:value-of select="@name"/></iaixsl:attribute>
                          </img>
                        </picture>
                      </iaixsl:when>
                      <iaixsl:otherwise>
                        <img>
                          <iaixsl:attribute name="src"><iaixsl:value-of select="iconsmall"/></iaixsl:attribute>
                          <iaixsl:attribute name="alt"><iaixsl:value-of select="@name"/></iaixsl:attribute>
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
									<a class="ordered_product__name --link">
										<iaixsl:attribute name="href"><iaixsl:value-of select="@link"/></iaixsl:attribute>
										<iaixsl:attribute name="title"><iaixsl:value-of select="@name"/></iaixsl:attribute>
										<iaixsl:choose>
											<iaixsl:when test="/shop/allow_division_order/@turn_on = 'yes' and @division = 'now'">
												<iaixsl:attribute name="class">ordered_product__name --link --now</iaixsl:attribute>
											</iaixsl:when>
											<iaixsl:when test="/shop/allow_division_order/@turn_on = 'yes' and @division = 'later'">
												<iaixsl:attribute name="class">ordered_product__name --link --later showTip</iaixsl:attribute>
											</iaixsl:when>
										</iaixsl:choose>
										
                    <iaixsl:value-of select="@name"/><iaixsl:choose><iaixsl:when test="@quantity &gt; '1'">, <iaixsl:value-of select="@quantity"/><iaixsl:text> </iaixsl:text><iaixsl:choose><iaixsl:when test="@price_unit"><iaixsl:value-of select="@price_unit"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@unit"/></iaixsl:otherwise></iaixsl:choose></iaixsl:when><iaixsl:otherwise>, <iaixsl:value-of select="@quantity"/><iaixsl:text> </iaixsl:text><iaixsl:choose><iaixsl:when test="@price_unit"><iaixsl:value-of select="@price_unit"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="@unit"/></iaixsl:otherwise></iaixsl:choose></iaixsl:otherwise></iaixsl:choose>
										<iaixsl:if test="/shop/allow_division_order/@turn_on = 'yes'">
											<iaixsl:choose>
												<iaixsl:when test="@division='later'">
													<i class="icon-clock"/>
												</iaixsl:when>
												<iaixsl:when test="@division='now'">
													<i class="icon-truck"/>
												</iaixsl:when>
											</iaixsl:choose>
										</iaixsl:if>
									</a>
								</iaixsl:when>
								<iaixsl:otherwise>
									<span class="ordered_product__name">
										<iaixsl:choose>
											<iaixsl:when test="/shop/allow_division_order/@turn_on = 'yes' and @division = 'now'">
												<iaixsl:attribute name="class">ordered_product__name --now</iaixsl:attribute>
											</iaixsl:when>
											<iaixsl:when test="/shop/allow_division_order/@turn_on = 'yes' and @division = 'later'">
												<iaixsl:attribute name="class">ordered_product__name --later showTip</iaixsl:attribute>
											</iaixsl:when>
										</iaixsl:choose>
										<iaixsl:value-of select="@name"/><iaixsl:choose><iaixsl:when test="@quantity &gt; '1'">, <iaixsl:value-of select="@quantity"/><iaixsl:text> </iaixsl:text><iaixsl:value-of select="@price_unit"/></iaixsl:when><iaixsl:otherwise>, <iaixsl:value-of select="@quantity"/><iaixsl:text> </iaixsl:text><iaixsl:value-of select="@price_unit"/></iaixsl:otherwise></iaixsl:choose>
										<iaixsl:if test="/shop/allow_division_order/@turn_on = 'yes'">
											<iaixsl:choose>
												<iaixsl:when test="@division='later'">
													<i class="icon-clock"/>
												</iaixsl:when>
												<iaixsl:when test="@division='now'">
													<i class="icon-truck"/>
												</iaixsl:when>
											</iaixsl:choose>
										</iaixsl:if>
									</span>
								</iaixsl:otherwise>
							</iaixsl:choose>
							<iaixsl:if test="/shop/allow_division_order/@turn_on = 'yes' and @division = 'later'">
								<div class="tooltipContent">
									<iaixsl:attribute name="data-weeks"><iaixsl:value-of select="/shop/basket/shipping_division_time/@week_amount"/></iaixsl:attribute>
									<iaixsl:attribute name="data-days"><iaixsl:value-of select="/shop/basket/shipping_division_time/@days"/></iaixsl:attribute>
									<iaixsl:attribute name="data-week_day"><iaixsl:value-of select="/shop/basket/shipping_division_time/@week_day"/></iaixsl:attribute>
									<iaixsl:attribute name="data-today"><iaixsl:value-of select="/shop/basket/shipping_division_time/@today"/></iaixsl:attribute>
									Products with longer waiting times - ready to ship <span class="prepaid__division_literal">after </span>
									<strong/>
								</div>
							</iaixsl:if>
						</div>

						<div class="ordered_product__traits">
							
							<iaixsl:if test="@code and not(@code = '')">
								<div class="ordered_product_trait --barcode">
									<span class="param__label">
										Symbol:
									</span>
									<span class="param__value">
										<iaixsl:value-of select="@code"/>
									</span>
								</div>
							</iaixsl:if>
							
							<iaixsl:if test="not(size/@type='uniw')">
								<div class="ordered_product_trait --size">
									<span class="param__label">
										Size:
									</span>
									<span class="param__value">
										<iaixsl:value-of select="@size_desc"/>
									</span>
								</div>
							</iaixsl:if>
							
							<iaixsl:if test="(version) and (not(version/@product_name=''))">
								<div class="ordered_product_trait --version">
									<span class="param__label">
										<iaixsl:value-of select="version/@name"/>:
									</span>
									<span class="param__value">
										<iaixsl:value-of select="version/@product_name"/>
									</span>
								</div>
							</iaixsl:if>
						</div>

						
						<iaixsl:if test="priceformula/parameters">
							<div class="ordered_product__params --priceformula">
								<iaixsl:for-each select="priceformula/parameters/parameter">
									<div class="ordered_product__param">
										<label><b><iaixsl:value-of select="name"/>:</b></label>
										<span><iaixsl:value-of select="values/value"/></span>
									</div>
								</iaixsl:for-each>
							</div>
						</iaixsl:if>

						
						<iaixsl:if test="serial_number">
							<div class="ordered_product__params --serial_number">
								<div class="ordered_product__param">
									<label>
										<iaixsl:choose>
											<iaixsl:when test="count(serial_number/number) = 1">
												<b>Serial number:</b>
											</iaixsl:when>
											<iaixsl:otherwise>
												<b>Serial Numbers: </b>
											</iaixsl:otherwise>
										</iaixsl:choose>
									</label>
									<span>
										<iaixsl:for-each select="serial_number/number">
											<iaixsl:value-of select="@value"/><iaixsl:if test="not(position()=last())">, </iaixsl:if>
										</iaixsl:for-each>
									</span>
								</div>
							</div>
						</iaixsl:if>

						
						<iaixsl:if test="@product_type = 'product_bundle'">
							<div class="ordered_product__params --bundle">
								<span class="ordered_product__params-name">Products in a set:</span>
								<iaixsl:for-each select="bundled/product">
									<div class="ordered_product__param">
										<label>
											<iaixsl:if test="@quantity &gt; 1">
												<iaixsl:value-of select="@quantity"/>x 
											</iaixsl:if>
											<iaixsl:value-of select="@name"/>
										</label>
										<span>
											<iaixsl:if test="not(@size = 'uniw') or ((version) and (not(version/@product_name='')))">
												(<iaixsl:if test="not(@size = 'uniw')">Size: <b><iaixsl:value-of select="@size_desc"/></b></iaixsl:if>
												<iaixsl:if test="not(@size = 'uniw') and ((version) and (not(version/@product_name='')))">
													,
												</iaixsl:if>
												<iaixsl:if test="(version) and (not(version/@product_name=''))"><iaixsl:value-of select="version/@name"/>: <b><iaixsl:value-of select="version/@product_name"/></b></iaixsl:if>)
											</iaixsl:if>
										</span>
									</div>
								</iaixsl:for-each>
							</div>
						</iaixsl:if>

						
						<iaixsl:if test="order_files/file">
							<div class="ordered_product__params --files">
								<iaixsl:for-each select="order_files/file">
									<div class="ordered_product__param">
										<label>
											<iaixsl:value-of select="@file"/>
										</label>
										<span>
											<iaixsl:if test="@path">
												[<a>
												<iaixsl:attribute name="href"><iaixsl:value-of select="@path"/></iaixsl:attribute>
												<iaixsl:choose>
													<iaixsl:when test="@preview = 'true'">
														<iaixsl:attribute name="data-imagelightbox">f</iaixsl:attribute>
													</iaixsl:when>
													<iaixsl:otherwise>
														<iaixsl:attribute name="target">_blank</iaixsl:attribute>
													</iaixsl:otherwise>
												</iaixsl:choose>
												preview</a> ]
											</iaixsl:if>
										</span>
									</div>
								</iaixsl:for-each>
							</div>
						</iaixsl:if>


						
						<iaixsl:if test="@product_type = 'product_virtual'">
							<div class="ordered_product__info --virtual">
								<span>Files will be available under</span>
								<a>
									<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/action/clientFiles/@url"/></iaixsl:attribute>
									&quot;My files&quot;
								</a>
								<span>in a customer's tab after paying for order.</span>
							</div>
						</iaixsl:if>

						
						<iaixsl:if test="comment">
							<div class="ordered_product__info --comment">
								<iaixsl:value-of select="comment"/>
							</div>
						</iaixsl:if>

					</div>
					<div class="ordered_product__price">
						
						<strong>
							<iaixsl:choose>
								<iaixsl:when test="@quantity != '1'">
									<iaixsl:choose>
										<iaixsl:when test="@forpoints='true'">
											<iaixsl:value-of select="@points_sum"/>
												pts.
										</iaixsl:when>
										<iaixsl:otherwise>
											<iaixsl:choose>
												<iaixsl:when test="not($nettoPricePrepaid = '') and not($priceTypeVat = '')">
													<span class="ordered_product__price_net"><iaixsl:value-of select="@nettoworth_formatted"/><span class="price_vat"><iaixsl:value-of select="$priceTypeText"/></span></span>
													<span class="ordered_product__price_gross gross_price">(<iaixsl:value-of select="@bruttoworth_formatted"/><span class="price_vat"><iaixsl:value-of select="$grossPricePrepaid"/></span>)</span>
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
												Free!
										</iaixsl:when>
										<iaixsl:when test="@forpoints='true'">
											<iaixsl:value-of select="@points"/>
												pts.
										</iaixsl:when>
										<iaixsl:otherwise>
											<iaixsl:choose>
												<iaixsl:when test="not($nettoPricePrepaid = '') and not($priceTypeVat = '')">
													<span class="ordered_product__price_net"><iaixsl:value-of select="@nettoworth_formatted"/><span class="price_vat"><iaixsl:value-of select="$priceTypeText"/></span></span>
													<span class="ordered_product__price_gross gross_price">(<iaixsl:value-of select="@bruttoworth_formatted"/><span class="price_vat"><iaixsl:value-of select="$grossPricePrepaid"/></span>)</span>
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

						
						<iaixsl:if test="$subscriptionGroup = 'true'">
							<span class="ordered_product__price_subscription"> / every <span class="ordered_product__price_subscription_period"><iaixsl:attribute name="data-change-literal-days"><iaixsl:value-of select="/shop/page/ordered_products/groups/group[@id = $groupId]/details/subscription/@days_in_period"/></iaixsl:attribute><iaixsl:value-of select="/shop/page/ordered_products/groups/group[@id = $groupId]/details/subscription/@days_in_period"/> days</span></span>
						</iaixsl:if>
					</div>
				</div>
			</iaixsl:for-each>
		</div>
	</iaixsl:if>
<!-- (prepaid_payment_and_delivery_list, 61f913c6ba1db9.25159406.2)-->
		<iaixsl:variable name="idoPayList">1</iaixsl:variable>

		<div id="prepaid_delivery_list">
			<div class="prepaid_delivery_container mb-5">
				<h2 class="orderdetails_label">
					<span>Delivery method</span>
				</h2>
				

				<div class="ordered_product">
					<div class="ordered_product__icon">
						<img src="/gfx/standards/shipping_icon.png?r=1696937716">
							<iaixsl:if test="page/shipping/delivery[@checked='true']/@icon"><iaixsl:attribute name="src"><iaixsl:value-of select="page/shipping/delivery[@checked='true']/@icon"/></iaixsl:attribute></iaixsl:if>
							<iaixsl:attribute name="alt"><iaixsl:value-of select="page/shipping/delivery[@checked='true']/@name"/></iaixsl:attribute>
						</img>
					</div>
					<div class="ordered_product__content">
						<div class="ordered_product__name">
							<div class="ordered__name">
								<strong><iaixsl:value-of select="page/shipping/delivery[@checked='true']/@name"/></strong>
								<iaixsl:if test="page/prepaid/dispatch/@date_delivery">
								  <strong> - delivery </strong>
								  <span class="prepaid_delivery__date"><iaixsl:value-of select="page/prepaid/dispatch/@date_delivery"/></span>
								  <iaixsl:if test="page/prepaid/dispatch/@delivery_range != ''">
									   range of hours 
									  <iaixsl:value-of select="page/prepaid/dispatch/@delivery_range"/>
								  </iaixsl:if>
								</iaixsl:if>
							</div>
							<div class="ordered-price">
								<iaixsl:choose>
									<iaixsl:when test="page/shipping/@hide_cost='true'"/>
									<iaixsl:when test="page/shipping/delivery[@checked='true']/@points_cost &gt; 0">
										<span><iaixsl:value-of select="page/shipping/delivery[@checked='true']/@points_cost"/> pts.</span>
									</iaixsl:when>
									<iaixsl:when test="page/shipping/delivery[@checked='true']/@cost &gt; 0">
										<span>
											<iaixsl:value-of select="page/shipping/delivery[@checked='true']/@currencycost_formatted"/>
											
										</span>
									</iaixsl:when>
									<iaixsl:when test="page/shipping/delivery[@checked='true']/@cost = 0">
										
									</iaixsl:when>
								</iaixsl:choose>
							</div>
							<iaixsl:if test="page/prepaid/details/@select_date_additional != '' or page/prepaid/details/@delivery = 'true' or page/prepaid/dispatch/@date_sent != '' or page/prepaid/details/@select_date != ''">
							<div class="ordered__additional mt-1">
								<ul>
									<iaixsl:if test="page/prepaid/details/@select_date_additional != ''">
										<li>
											<strong>Remarks to the delivery date: </strong>
											<iaixsl:value-of select="page/prepaid/details/@select_date_additional"/>
										</li>
									</iaixsl:if>
									<iaixsl:if test="page/prepaid/details/@delivery = 'true'">
										<li>
											<span>Parcel number: </span>
											<iaixsl:choose>
												<iaixsl:when test="not(page/prepaid/details/@cancelationpath) and not(page/prepaid/details/@cancelable = 'yes')">
													<iaixsl:value-of select="page/prepaid/details/@dispatch_number"/>
												</iaixsl:when>
												<iaixsl:otherwise>
													-
												</iaixsl:otherwise>
											</iaixsl:choose>
										</li>
									</iaixsl:if>
									<iaixsl:if test="page/prepaid/dispatch/@date_sent != ''">
									  <iaixsl:if test="page/prepaid/details/@deliveryid = '0'">
										  <li>
											  <span>Parcel collected:  </span>
											  <iaixsl:value-of select="page/prepaid/dispatch/@date_sent"/>
										  </li>
									  </iaixsl:if>
									</iaixsl:if>
									<iaixsl:if test="page/prepaid/details/@select_date != ''">
										<li>
											<span>
												<iaixsl:choose>
													<iaixsl:when test="page/stock">
														Selected order collection date: 
													</iaixsl:when>
													<iaixsl:otherwise>
														Selected date of delivery: 
													</iaixsl:otherwise>
												</iaixsl:choose>
											</span>
											<iaixsl:value-of select="page/prepaid/details/@select_date"/>
										</li>
									</iaixsl:if>
								</ul>
							</div>
							</iaixsl:if>
							<iaixsl:if test="page/prepaid/details/@link_tracking != ''">
							  <a target="_blank" class="tracking_button btn --outline --small">
								  <iaixsl:attribute name="href"><iaixsl:value-of select="page/prepaid/details/@link_tracking"/></iaixsl:attribute>
								  Track the shipment
							  </a>
							</iaixsl:if>
						</div>
					</div>
				</div>
			</div>
			<div class="prepaid_payment_form_container mb-5">
				<iaixsl:choose>
					<iaixsl:when test="/shop/page/prepaid/prepaid_history/item/@status = 'n'">
						<h2 class="orderdetails_label">
							<iaixsl:if test="page/prepaid/order/@payment_info = 'true'">
								<iaixsl:attribute name="class">orderdetails_label --more</iaixsl:attribute>
							</iaixsl:if>
							<span>Payment method</span>
							<iaixsl:if test="page/prepaid/order/@payment_info = 'true'">
								<a href="#showDescription" class="moreInfo__show d-md-none">More</a>
								<div class="moreInfo">
										<a href="#showDescription" class="moreInfo__show d-none d-md-flex"><i class="icon-question"/></a>
										<div style="display:none;" class="moreInfo__desc"><iaixsl:value-of disable-output-escaping="yes" select="page/prepaid/payment_status_explanation"/></div>
								</div>
							</iaixsl:if>
						</h2>
						<iaixsl:for-each select="/shop/page/prepaid/prepaid_history/item[@status = 'n']">
							<div class="ordered_product">
								<div class="ordered_product__icon">
										<iaixsl:choose>
												<iaixsl:when test="$idoPayList and @payment_id = '29' and (@payment_form_id = '44' or @payment_form_id = '45') and count(/shop/page/prepaid_methods/item[@group='card'][not(@system_id='29')]) = 0">
														<iaixsl:attribute name="style">width: auto;</iaixsl:attribute>
														<iaixsl:if test="/shop/page/prepaid_methods/item[@id='44']">
																<img>
																		<iaixsl:attribute name="src"><iaixsl:value-of select="/shop/page/prepaid_methods/item[@id='44']/@icon"/></iaixsl:attribute>
																		<iaixsl:attribute name="alt"><iaixsl:value-of select="/shop/page/prepaid_methods/item[@id='44']/@name"/></iaixsl:attribute>
																</img>
														</iaixsl:if>
														<iaixsl:if test="/shop/page/prepaid_methods/item[@id='45']">
																<img>
																		<iaixsl:attribute name="src"><iaixsl:value-of select="/shop/page/prepaid_methods/item[@id='45']/@icon"/></iaixsl:attribute>
																		<iaixsl:attribute name="alt"><iaixsl:value-of select="/shop/page/prepaid_methods/item[@id='45']/@name"/></iaixsl:attribute>
																</img>
														</iaixsl:if>
												</iaixsl:when>
												<iaixsl:otherwise>
														<img src="/gfx/standards/prepaid_method_icon.png?r=1696937716">
															<iaixsl:attribute name="alt"><iaixsl:value-of select="@payment_name"/></iaixsl:attribute>
															<iaixsl:choose>
																<iaixsl:when test="/shop/page/prepaid/details/@paymentstatus = 'tc'">
																	<iaixsl:attribute name="src">data:image/svg+xml,%3Csvg xmlns=&apos;http://www.w3.org/2000/svg&apos; id=&apos;calendar&apos; width=&apos;26&apos; height=&apos;26&apos; fill=&apos;%23333&apos; viewBox=&apos;0 0 26 26&apos;%3E%3Cg id=&apos;Group_425&apos; data-name=&apos;Group 425&apos;%3E%3Cg id=&apos;Group_424&apos; data-name=&apos;Group 424&apos;%3E%3Cpath id=&apos;Path_75&apos; data-name=&apos;Path 75&apos; d=&apos;M22.512,1.992h-1.2V0H19.324V1.992H6.176V0H4.184V1.992h-1.2A2.992,2.992,0,0,0,0,4.98V22.512A2.992,2.992,0,0,0,2.988,25.5H22.512A2.992,2.992,0,0,0,25.5,22.512V4.98A2.992,2.992,0,0,0,22.512,1.992Zm1,20.52a1,1,0,0,1-1,1H2.988a1,1,0,0,1-1-1V9.363H23.508Zm0-15.141H1.992V4.98a1,1,0,0,1,1-1h1.2V5.977H6.176V3.984H19.324V5.977h1.992V3.984h1.2a1,1,0,0,1,1,1Z&apos;%3E%3C/path%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_427&apos; data-name=&apos;Group 427&apos; transform=&apos;translate(4.397 11.431)&apos;%3E%3Cg id=&apos;Group_426&apos; data-name=&apos;Group 426&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_196&apos; data-name=&apos;Rectangle 196&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(-0.147 -0.181)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_429&apos; data-name=&apos;Group 429&apos; transform=&apos;translate(7.914 11.431)&apos;%3E%3Cg id=&apos;Group_428&apos; data-name=&apos;Group 428&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_197&apos; data-name=&apos;Rectangle 197&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(0.336 -0.181)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_431&apos; data-name=&apos;Group 431&apos; transform=&apos;translate(12.31 11.431)&apos;%3E%3Cg id=&apos;Group_430&apos; data-name=&apos;Group 430&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_198&apos; data-name=&apos;Rectangle 198&apos; width=&apos;1&apos; height=&apos;2&apos; transform=&apos;translate(-0.06 -0.181)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_433&apos; data-name=&apos;Group 433&apos; transform=&apos;translate(14.948 11.431)&apos;%3E%3Cg id=&apos;Group_432&apos; data-name=&apos;Group 432&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_199&apos; data-name=&apos;Rectangle 199&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(0.302 -0.181)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_435&apos; data-name=&apos;Group 435&apos; transform=&apos;translate(19.345 11.431)&apos;%3E%3Cg id=&apos;Group_434&apos; data-name=&apos;Group 434&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_200&apos; data-name=&apos;Rectangle 200&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(-0.095 -0.181)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_437&apos; data-name=&apos;Group 437&apos; transform=&apos;translate(4.397 14.948)&apos;%3E%3Cg id=&apos;Group_436&apos; data-name=&apos;Group 436&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_201&apos; data-name=&apos;Rectangle 201&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(-0.147 0.302)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_439&apos; data-name=&apos;Group 439&apos; transform=&apos;translate(7.914 14.948)&apos;%3E%3Cg id=&apos;Group_438&apos; data-name=&apos;Group 438&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_202&apos; data-name=&apos;Rectangle 202&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(0.336 0.302)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_441&apos; data-name=&apos;Group 441&apos; transform=&apos;translate(12.31 14.948)&apos;%3E%3Cg id=&apos;Group_440&apos; data-name=&apos;Group 440&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_203&apos; data-name=&apos;Rectangle 203&apos; width=&apos;1&apos; height=&apos;2&apos; transform=&apos;translate(-0.06 0.302)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_443&apos; data-name=&apos;Group 443&apos; transform=&apos;translate(14.948 14.948)&apos;%3E%3Cg id=&apos;Group_442&apos; data-name=&apos;Group 442&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_204&apos; data-name=&apos;Rectangle 204&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(0.302 0.302)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_445&apos; data-name=&apos;Group 445&apos; transform=&apos;translate(4.397 19.345)&apos;%3E%3Cg id=&apos;Group_444&apos; data-name=&apos;Group 444&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_205&apos; data-name=&apos;Rectangle 205&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(-0.147 -0.095)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_447&apos; data-name=&apos;Group 447&apos; transform=&apos;translate(7.914 19.345)&apos;%3E%3Cg id=&apos;Group_446&apos; data-name=&apos;Group 446&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_206&apos; data-name=&apos;Rectangle 206&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(0.336 -0.095)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_449&apos; data-name=&apos;Group 449&apos; transform=&apos;translate(12.31 19.345)&apos;%3E%3Cg id=&apos;Group_448&apos; data-name=&apos;Group 448&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_207&apos; data-name=&apos;Rectangle 207&apos; width=&apos;1&apos; height=&apos;2&apos; transform=&apos;translate(-0.06 -0.095)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_451&apos; data-name=&apos;Group 451&apos; transform=&apos;translate(14.948 19.345)&apos;%3E%3Cg id=&apos;Group_450&apos; data-name=&apos;Group 450&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_208&apos; data-name=&apos;Rectangle 208&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(0.302 -0.095)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_453&apos; data-name=&apos;Group 453&apos; transform=&apos;translate(19.345 14.948)&apos;%3E%3Cg id=&apos;Group_452&apos; data-name=&apos;Group 452&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_209&apos; data-name=&apos;Rectangle 209&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(-0.095 0.302)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E</iaixsl:attribute>
																</iaixsl:when>
																<iaixsl:when test="/shop/page/prepaid/details/@paymentstatus = 'g'">
																	<iaixsl:attribute name="src">data:image/svg+xml,%3Csvg xmlns=&apos;http://www.w3.org/2000/svg&apos; width=&apos;35&apos; height=&apos;28&apos; viewBox=&apos;0 0 35 28&apos;%3E%3Cg id=&apos;dollar&apos; transform=&apos;translate(0 -49.067)&apos;%3E%3Cg id=&apos;Group_456&apos; data-name=&apos;Group 456&apos; transform=&apos;translate(0 49.067)&apos;%3E%3Cg id=&apos;Group_455&apos; data-name=&apos;Group 455&apos;%3E%3Cpath id=&apos;Path_76&apos; data-name=&apos;Path 76&apos; d=&apos;M156.809,61.872a6.4,6.4,0,1,0-6.4-6.4A6.41,6.41,0,0,0,156.809,61.872Zm0-11.6a5.2,5.2,0,1,1-5.2,5.2A5.207,5.207,0,0,1,156.809,50.269Z&apos; transform=&apos;translate(-138.934 -49.067)&apos;%3E%3C/path%3E%3Ccircle id=&apos;Ellipse_30&apos; data-name=&apos;Ellipse 30&apos; cx=&apos;1.105&apos; cy=&apos;1.105&apos; r=&apos;1.105&apos; transform=&apos;translate(2.497 22.128)&apos;%3E%3C/circle%3E%3Cpath id=&apos;Path_77&apos; data-name=&apos;Path 77&apos; d=&apos;M35.619,202.2l-.018-.046a4.364,4.364,0,0,0-5.484-2.5l-4.5,1.561a4.132,4.132,0,0,0-4.026-1.2l-4.775,1.215a4.271,4.271,0,0,1-3.226-.472,8.722,8.722,0,0,0-4.479-1.238H7.2v-1.8a.6.6,0,0,0-.6-.6H.6a.6.6,0,0,0-.6.6V213.5a.6.6,0,0,0,.6.6h6a.6.6,0,0,0,.6-.6v-2.975H9.114a7.6,7.6,0,0,1,3.064.641l1.191.521a8.113,8.113,0,0,0,6.8-.13c4.264-2.064,11.827-5.725,14.571-7.051A1.812,1.812,0,0,0,35.619,202.2ZM6,200.136V212.9H1.2V198.335H6Zm28.211,3.291c-2.744,1.326-10.307,4.987-14.571,7.051a6.912,6.912,0,0,1-5.791.111l-1.191-.521a8.788,8.788,0,0,0-3.546-.742H7.2v-8.589H9.113a7.52,7.52,0,0,1,3.861,1.067,5.482,5.482,0,0,0,4.14.6l4.775-1.215a2.92,2.92,0,0,1,3.393,1.691l.1.248.068.164.042.1-8.228,3.312.449,1.115,8.792-3.539h.007l.025-.012.026-.012.031-.018.02-.012.032-.023.015-.012.031-.027.013-.012.027-.03.012-.014.023-.031.012-.017.019-.031.011-.019c.006-.011.011-.023.016-.034l.008-.018v0c.006-.014.011-.029.016-.044l0-.011a.6.6,0,0,0-.02-.407l-.446-1.07,0-.007-.07-.168L30.51,200.8a3.163,3.163,0,0,1,3.976,1.809l.018.046A.6.6,0,0,1,34.214,203.427Z&apos; transform=&apos;translate(0 -185.838)&apos;%3E%3C/path%3E%3Cpath id=&apos;Path_78&apos; data-name=&apos;Path 78&apos; d=&apos;M207.755,91.354a3.462,3.462,0,0,1-.482-.176,2.438,2.438,0,0,1-.4-.223,2.2,2.2,0,0,1-.29-.239l-.337.6a3.406,3.406,0,0,0,1.9.767v.8h.893v-.823a2.9,2.9,0,0,0,.317-.067,1.882,1.882,0,0,0,.615-.286,1.338,1.338,0,0,0,.407-.478,1.475,1.475,0,0,0,.149-.682,1.409,1.409,0,0,0-.129-.635,1.208,1.208,0,0,0-.376-.439,2.276,2.276,0,0,0-.6-.3c-.122-.042-.251-.082-.388-.119V87.144a2.252,2.252,0,0,1,.349.121,2.008,2.008,0,0,1,.325.18,1.435,1.435,0,0,1,.235.2l.329-.572a2.7,2.7,0,0,0-.748-.439,2.651,2.651,0,0,0-.49-.138v-.842h-.893v.8a2.545,2.545,0,0,0-.619.132,1.758,1.758,0,0,0-.568.325,1.445,1.445,0,0,0-.372.5,1.6,1.6,0,0,0-.133.67,1.324,1.324,0,0,0,.11.564,1.064,1.064,0,0,0,.325.4,2.026,2.026,0,0,0,.537.282,6.776,6.776,0,0,0,.721.213v1.894A2.719,2.719,0,0,1,207.755,91.354Zm1.292-1.559.032.011a1.655,1.655,0,0,1,.384.2.825.825,0,0,1,.239.259.7.7,0,0,1,.082.349.709.709,0,0,1-.321.635,1.217,1.217,0,0,1-.415.164ZM207.8,88.73a1.246,1.246,0,0,1-.345-.176.655.655,0,0,1-.2-.243.783.783,0,0,1-.067-.337.8.8,0,0,1,.266-.635,1.237,1.237,0,0,1,.7-.255v1.754Q207.959,88.785,207.8,88.73Z&apos; transform=&apos;translate(-190.518 -82.864)&apos;%3E%3C/path%3E%3C/g%3E%3C/g%3E%3C/g%3E%3C/svg%3E</iaixsl:attribute>
																</iaixsl:when>
																<iaixsl:when test="@icon">
																	<iaixsl:attribute name="src"><iaixsl:value-of select="@icon"/></iaixsl:attribute>
																</iaixsl:when>
															</iaixsl:choose>
														</img>
												</iaixsl:otherwise>
										</iaixsl:choose>
								</div>
								<div class="ordered_product__content">
									<div class="ordered_product__name">
										<div class="ordered__name">
												<iaixsl:choose>
														<iaixsl:when test="$idoPayList and @payment_id = '29' and (@payment_form_id = '44' or @payment_form_id = '45') and count(/shop/page/prepaid_methods/item[@group='card'][not(@system_id='29')]) = 0">
																<iaixsl:value-of select="/shop/page/groupList/item[@id='card']/@name"/>
														</iaixsl:when>
														<iaixsl:otherwise>
																<strong><iaixsl:value-of select="@payment_name"/></strong>
														</iaixsl:otherwise>
												</iaixsl:choose>
										</div>
										<iaixsl:if test="amount/order_currency/@payform_cost &gt; 0">
											<div class="ordered-price">
												<span>
													<iaixsl:value-of select="amount/order_currency/@payform_cost_formatted"/>
													<iaixsl:if test="not(amount/client_currency/@currencysign = amount/order_currency/@currencysign)">
														<small> (<iaixsl:value-of select="amount/client_currency/@payform_cost_formatted"/>)</small>
													</iaixsl:if>
												</span>
											</div>
										</iaixsl:if>
									</div>
								</div>
							</div>
						</iaixsl:for-each>
					</iaixsl:when>
					<iaixsl:when test="not(not(page/prepaid_methods/item[@checked='true']) and not(page/prepaid/details/@paymentstatus = 'g') and not(page/prepaid/details/@paymentstatus = 'tc'))">
						<h2 class="orderdetails_label">
              <iaixsl:if test="page/prepaid/order/@payment_info = 'true'">
								<iaixsl:attribute name="class">orderdetails_label --more</iaixsl:attribute>
							</iaixsl:if>
							<span>Payment method</span>
								<iaixsl:if test="page/prepaid/order/@payment_info = 'true'">
									<a href="#showDescription" class="moreInfo__show d-md-none">More</a>
									<div class="moreInfo">
											<a href="#showDescription" class="moreInfo__show d-none d-md-flex"><i class="icon-question"/></a>
											<div style="display:none;" class="moreInfo__desc"><iaixsl:value-of disable-output-escaping="yes" select="page/prepaid/payment_status_explanation"/></div>
									</div>
							</iaixsl:if>
							</h2>
						<div class="ordered_product">
							<div class="ordered_product__icon">
								<iaixsl:choose>
										<iaixsl:when test="@payment_id = '29' and (@payment_form_id = '44' or @payment_form_id = '45') and count(/shop/page/prepaid_methods/item[@group='card'][not(@system_id='29')]) = 0">
												<iaixsl:attribute name="style">width: auto;</iaixsl:attribute>
												<iaixsl:if test="/shop/page/prepaid_methods/item[@id='44']">
														<img>
																<iaixsl:attribute name="src"><iaixsl:value-of select="/shop/page/prepaid_methods/item[@id='44']/@icon"/></iaixsl:attribute>
																<iaixsl:attribute name="alt"><iaixsl:value-of select="/shop/page/prepaid_methods/item[@id='44']/@name"/></iaixsl:attribute>
														</img>
												</iaixsl:if>
												<iaixsl:if test="/shop/page/prepaid_methods/item[@id='45']">
														<img>
																<iaixsl:attribute name="src"><iaixsl:value-of select="/shop/page/prepaid_methods/item[@id='45']/@icon"/></iaixsl:attribute>
																<iaixsl:attribute name="alt"><iaixsl:value-of select="/shop/page/prepaid_methods/item[@id='45']/@name"/></iaixsl:attribute>
														</img>
												</iaixsl:if>
										</iaixsl:when>
										<iaixsl:otherwise>
												<img src="/gfx/standards/prepaid_method_icon.png?r=1696937716">
														<iaixsl:choose>
															<iaixsl:when test="/shop/page/prepaid/prepaid_history/item[position() = last()]/@icon and not(page/prepaid/details/@paymentstatus = 'g') and not(page/prepaid/details/@paymentstatus = 'tc')">
																<iaixsl:attribute name="src"><iaixsl:value-of select="/shop/page/prepaid/prepaid_history/item[position() = last()]/@icon"/></iaixsl:attribute>
															</iaixsl:when>
															<iaixsl:when test="page/prepaid/details/@paymentstatus = 'tc'">
																<iaixsl:attribute name="src">data:image/svg+xml,%3Csvg xmlns=&apos;http://www.w3.org/2000/svg&apos; id=&apos;calendar&apos; width=&apos;26&apos; height=&apos;26&apos; fill=&apos;%23333&apos; viewBox=&apos;0 0 26 26&apos;%3E%3Cg id=&apos;Group_425&apos; data-name=&apos;Group 425&apos;%3E%3Cg id=&apos;Group_424&apos; data-name=&apos;Group 424&apos;%3E%3Cpath id=&apos;Path_75&apos; data-name=&apos;Path 75&apos; d=&apos;M22.512,1.992h-1.2V0H19.324V1.992H6.176V0H4.184V1.992h-1.2A2.992,2.992,0,0,0,0,4.98V22.512A2.992,2.992,0,0,0,2.988,25.5H22.512A2.992,2.992,0,0,0,25.5,22.512V4.98A2.992,2.992,0,0,0,22.512,1.992Zm1,20.52a1,1,0,0,1-1,1H2.988a1,1,0,0,1-1-1V9.363H23.508Zm0-15.141H1.992V4.98a1,1,0,0,1,1-1h1.2V5.977H6.176V3.984H19.324V5.977h1.992V3.984h1.2a1,1,0,0,1,1,1Z&apos;%3E%3C/path%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_427&apos; data-name=&apos;Group 427&apos; transform=&apos;translate(4.397 11.431)&apos;%3E%3Cg id=&apos;Group_426&apos; data-name=&apos;Group 426&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_196&apos; data-name=&apos;Rectangle 196&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(-0.147 -0.181)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_429&apos; data-name=&apos;Group 429&apos; transform=&apos;translate(7.914 11.431)&apos;%3E%3Cg id=&apos;Group_428&apos; data-name=&apos;Group 428&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_197&apos; data-name=&apos;Rectangle 197&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(0.336 -0.181)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_431&apos; data-name=&apos;Group 431&apos; transform=&apos;translate(12.31 11.431)&apos;%3E%3Cg id=&apos;Group_430&apos; data-name=&apos;Group 430&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_198&apos; data-name=&apos;Rectangle 198&apos; width=&apos;1&apos; height=&apos;2&apos; transform=&apos;translate(-0.06 -0.181)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_433&apos; data-name=&apos;Group 433&apos; transform=&apos;translate(14.948 11.431)&apos;%3E%3Cg id=&apos;Group_432&apos; data-name=&apos;Group 432&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_199&apos; data-name=&apos;Rectangle 199&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(0.302 -0.181)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_435&apos; data-name=&apos;Group 435&apos; transform=&apos;translate(19.345 11.431)&apos;%3E%3Cg id=&apos;Group_434&apos; data-name=&apos;Group 434&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_200&apos; data-name=&apos;Rectangle 200&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(-0.095 -0.181)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_437&apos; data-name=&apos;Group 437&apos; transform=&apos;translate(4.397 14.948)&apos;%3E%3Cg id=&apos;Group_436&apos; data-name=&apos;Group 436&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_201&apos; data-name=&apos;Rectangle 201&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(-0.147 0.302)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_439&apos; data-name=&apos;Group 439&apos; transform=&apos;translate(7.914 14.948)&apos;%3E%3Cg id=&apos;Group_438&apos; data-name=&apos;Group 438&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_202&apos; data-name=&apos;Rectangle 202&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(0.336 0.302)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_441&apos; data-name=&apos;Group 441&apos; transform=&apos;translate(12.31 14.948)&apos;%3E%3Cg id=&apos;Group_440&apos; data-name=&apos;Group 440&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_203&apos; data-name=&apos;Rectangle 203&apos; width=&apos;1&apos; height=&apos;2&apos; transform=&apos;translate(-0.06 0.302)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_443&apos; data-name=&apos;Group 443&apos; transform=&apos;translate(14.948 14.948)&apos;%3E%3Cg id=&apos;Group_442&apos; data-name=&apos;Group 442&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_204&apos; data-name=&apos;Rectangle 204&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(0.302 0.302)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_445&apos; data-name=&apos;Group 445&apos; transform=&apos;translate(4.397 19.345)&apos;%3E%3Cg id=&apos;Group_444&apos; data-name=&apos;Group 444&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_205&apos; data-name=&apos;Rectangle 205&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(-0.147 -0.095)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_447&apos; data-name=&apos;Group 447&apos; transform=&apos;translate(7.914 19.345)&apos;%3E%3Cg id=&apos;Group_446&apos; data-name=&apos;Group 446&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_206&apos; data-name=&apos;Rectangle 206&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(0.336 -0.095)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_449&apos; data-name=&apos;Group 449&apos; transform=&apos;translate(12.31 19.345)&apos;%3E%3Cg id=&apos;Group_448&apos; data-name=&apos;Group 448&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_207&apos; data-name=&apos;Rectangle 207&apos; width=&apos;1&apos; height=&apos;2&apos; transform=&apos;translate(-0.06 -0.095)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_451&apos; data-name=&apos;Group 451&apos; transform=&apos;translate(14.948 19.345)&apos;%3E%3Cg id=&apos;Group_450&apos; data-name=&apos;Group 450&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_208&apos; data-name=&apos;Rectangle 208&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(0.302 -0.095)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3Cg id=&apos;Group_453&apos; data-name=&apos;Group 453&apos; transform=&apos;translate(19.345 14.948)&apos;%3E%3Cg id=&apos;Group_452&apos; data-name=&apos;Group 452&apos; transform=&apos;translate(0 0)&apos;%3E%3Crect id=&apos;Rectangle_209&apos; data-name=&apos;Rectangle 209&apos; width=&apos;2&apos; height=&apos;2&apos; transform=&apos;translate(-0.095 0.302)&apos;%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E</iaixsl:attribute>
															</iaixsl:when>
															<iaixsl:when test="page/prepaid/details/@paymentstatus = 'g'">
																<iaixsl:attribute name="src">data:image/svg+xml,%3Csvg xmlns=&apos;http://www.w3.org/2000/svg&apos; width=&apos;35&apos; height=&apos;28&apos; viewBox=&apos;0 0 35 28&apos;%3E%3Cg id=&apos;dollar&apos; transform=&apos;translate(0 -49.067)&apos;%3E%3Cg id=&apos;Group_456&apos; data-name=&apos;Group 456&apos; transform=&apos;translate(0 49.067)&apos;%3E%3Cg id=&apos;Group_455&apos; data-name=&apos;Group 455&apos;%3E%3Cpath id=&apos;Path_76&apos; data-name=&apos;Path 76&apos; d=&apos;M156.809,61.872a6.4,6.4,0,1,0-6.4-6.4A6.41,6.41,0,0,0,156.809,61.872Zm0-11.6a5.2,5.2,0,1,1-5.2,5.2A5.207,5.207,0,0,1,156.809,50.269Z&apos; transform=&apos;translate(-138.934 -49.067)&apos;%3E%3C/path%3E%3Ccircle id=&apos;Ellipse_30&apos; data-name=&apos;Ellipse 30&apos; cx=&apos;1.105&apos; cy=&apos;1.105&apos; r=&apos;1.105&apos; transform=&apos;translate(2.497 22.128)&apos;%3E%3C/circle%3E%3Cpath id=&apos;Path_77&apos; data-name=&apos;Path 77&apos; d=&apos;M35.619,202.2l-.018-.046a4.364,4.364,0,0,0-5.484-2.5l-4.5,1.561a4.132,4.132,0,0,0-4.026-1.2l-4.775,1.215a4.271,4.271,0,0,1-3.226-.472,8.722,8.722,0,0,0-4.479-1.238H7.2v-1.8a.6.6,0,0,0-.6-.6H.6a.6.6,0,0,0-.6.6V213.5a.6.6,0,0,0,.6.6h6a.6.6,0,0,0,.6-.6v-2.975H9.114a7.6,7.6,0,0,1,3.064.641l1.191.521a8.113,8.113,0,0,0,6.8-.13c4.264-2.064,11.827-5.725,14.571-7.051A1.812,1.812,0,0,0,35.619,202.2ZM6,200.136V212.9H1.2V198.335H6Zm28.211,3.291c-2.744,1.326-10.307,4.987-14.571,7.051a6.912,6.912,0,0,1-5.791.111l-1.191-.521a8.788,8.788,0,0,0-3.546-.742H7.2v-8.589H9.113a7.52,7.52,0,0,1,3.861,1.067,5.482,5.482,0,0,0,4.14.6l4.775-1.215a2.92,2.92,0,0,1,3.393,1.691l.1.248.068.164.042.1-8.228,3.312.449,1.115,8.792-3.539h.007l.025-.012.026-.012.031-.018.02-.012.032-.023.015-.012.031-.027.013-.012.027-.03.012-.014.023-.031.012-.017.019-.031.011-.019c.006-.011.011-.023.016-.034l.008-.018v0c.006-.014.011-.029.016-.044l0-.011a.6.6,0,0,0-.02-.407l-.446-1.07,0-.007-.07-.168L30.51,200.8a3.163,3.163,0,0,1,3.976,1.809l.018.046A.6.6,0,0,1,34.214,203.427Z&apos; transform=&apos;translate(0 -185.838)&apos;%3E%3C/path%3E%3Cpath id=&apos;Path_78&apos; data-name=&apos;Path 78&apos; d=&apos;M207.755,91.354a3.462,3.462,0,0,1-.482-.176,2.438,2.438,0,0,1-.4-.223,2.2,2.2,0,0,1-.29-.239l-.337.6a3.406,3.406,0,0,0,1.9.767v.8h.893v-.823a2.9,2.9,0,0,0,.317-.067,1.882,1.882,0,0,0,.615-.286,1.338,1.338,0,0,0,.407-.478,1.475,1.475,0,0,0,.149-.682,1.409,1.409,0,0,0-.129-.635,1.208,1.208,0,0,0-.376-.439,2.276,2.276,0,0,0-.6-.3c-.122-.042-.251-.082-.388-.119V87.144a2.252,2.252,0,0,1,.349.121,2.008,2.008,0,0,1,.325.18,1.435,1.435,0,0,1,.235.2l.329-.572a2.7,2.7,0,0,0-.748-.439,2.651,2.651,0,0,0-.49-.138v-.842h-.893v.8a2.545,2.545,0,0,0-.619.132,1.758,1.758,0,0,0-.568.325,1.445,1.445,0,0,0-.372.5,1.6,1.6,0,0,0-.133.67,1.324,1.324,0,0,0,.11.564,1.064,1.064,0,0,0,.325.4,2.026,2.026,0,0,0,.537.282,6.776,6.776,0,0,0,.721.213v1.894A2.719,2.719,0,0,1,207.755,91.354Zm1.292-1.559.032.011a1.655,1.655,0,0,1,.384.2.825.825,0,0,1,.239.259.7.7,0,0,1,.082.349.709.709,0,0,1-.321.635,1.217,1.217,0,0,1-.415.164ZM207.8,88.73a1.246,1.246,0,0,1-.345-.176.655.655,0,0,1-.2-.243.783.783,0,0,1-.067-.337.8.8,0,0,1,.266-.635,1.237,1.237,0,0,1,.7-.255v1.754Q207.959,88.785,207.8,88.73Z&apos; transform=&apos;translate(-190.518 -82.864)&apos;%3E%3C/path%3E%3C/g%3E%3C/g%3E%3C/g%3E%3C/svg%3E</iaixsl:attribute>
															</iaixsl:when>
														</iaixsl:choose>
														<iaixsl:attribute name="alt"><iaixsl:value-of select="page/prepaid_methods/item[@checked='true']/@name"/></iaixsl:attribute>
												</img>
										</iaixsl:otherwise>
								</iaixsl:choose>
							</div>
							<div class="ordered_product__content">
								<div class="ordered_product__name">
									<div class="ordered__name">
										<strong>
											<iaixsl:choose>
												<iaixsl:when test="@payment_id = '29' and (@payment_form_id = '44' or @payment_form_id = '45') and count(/shop/page/prepaid_methods/item[@group='card'][not(@system_id='29')]) = 0">
														<iaixsl:value-of select="/shop/page/groupList/item[@id='card']/@name"/>
												</iaixsl:when>
												<iaixsl:when test="page/prepaid/details/@paymentstatus = 'g'">
													Cash on delivery 
												</iaixsl:when>
												<iaixsl:otherwise>
													<iaixsl:value-of select="page/prepaid_methods/item[@checked='true']/@name"/>
												</iaixsl:otherwise>
											</iaixsl:choose>
										</strong>

										<iaixsl:variable name="delivery_id"><iaixsl:value-of select="/shop/page/shipping/delivery/@id"/></iaixsl:variable>

										<iaixsl:choose>
											<iaixsl:when test="($delivery_id='0-1'                 or $delivery_id = '77-1'                 or $delivery_id = '89-1'                 or $delivery_id = '90-1'                 or $delivery_id = '100023-1'                 or $delivery_id = '100075-1'                 or $delivery_id = '100149-1'                 or $delivery_id = '100148-1'                 or $delivery_id = '100150-1'                 or $delivery_id = '100153-1'                 or $delivery_id = '100061-1'                 or $delivery_id = '100063-1'                 or $delivery_id = '100041-1'                 or $delivery_id = '76-1'                 or $delivery_id = '38-1'                 or (substring-before($delivery_id, '-') &gt; 100100 and substring-after($delivery_id, '-') = '1') ) and page/stock/@stock_id and not(page/prepaid/prepaid_history/item[position() = last()]/@status = 'y')">

												

												<ul>
													<li>
														Pay when collecting your parcel.
													</li>
												</ul>
											</iaixsl:when>
											<iaixsl:when test="page/prepaid/details/@paymentstatus = 'g' and not(page/prepaid/prepaid_history/item[position() = last()]/@status = 'y')">
												<ul>
													<li>
														Pay to a postman or a courier who delivers a parcel. 
													</li>
												</ul>
											</iaixsl:when>
											<iaixsl:when test="page/prepaid/details/@paymentstatus = 'tc'">
											</iaixsl:when>
										</iaixsl:choose>
									</div>
									<iaixsl:choose>
										<iaixsl:when test="/shop/page/shipping/delivery/@id='0-1' and page/stock/@stock_id">
										</iaixsl:when>
										<iaixsl:when test="page/prepaid/details/@paymentstatus = 'g'">
										</iaixsl:when>
										<iaixsl:when test="page/prepaid/details/@paymentstatus = 'tc'">
										</iaixsl:when>
										<iaixsl:otherwise>
											<iaixsl:if test="page/prepaid/details/@currencycost &gt; 0">
												<div class="ordered-price">
													<span>
														<iaixsl:value-of select="page/prepaid/details/@currency_payform_cost_formatted"/>
														
													</span>
												</div>
											</iaixsl:if>
										</iaixsl:otherwise>
									</iaixsl:choose>
								</div>
							</div>
						</div>
					</iaixsl:when>
				</iaixsl:choose>
			</div>

			<div class="prepaid_insurance_container mb-5">
				<iaixsl:if test="/shop/page/insurance_product">
					<h2 class="orderdetails_label"><span>Buyer Protection</span></h2>
					<div>
						<div class="ordered_product__icon">
							<img src="/gfx/standards/insurance_icon.png?r=1696937716" alt="insurance_icon"/>
						</div>
						<div class="ordered_product__content">
							<div class="ordered_product__name">
								<div class="ordered__name">
									<strong><iaixsl:value-of select="/shop/page/insurance_product/@service"/></strong>
									<ul>
										<li>
											<iaixsl:choose>
												<iaixsl:when test="/shop/page/insurance_product/@status = 'unconfirmed'">
													<strong>Current status:</strong> unconfirmed
												</iaixsl:when>
												<iaixsl:when test="/shop/page/insurance_product/@status = 'confirmed'">
													<strong>Current status:</strong> confirmed
												</iaixsl:when>
											</iaixsl:choose>
										</li>
									</ul>
								</div>
								<div class="ordered-price">
									<iaixsl:if test="/shop/page/insurance_product/@price_gross &gt; 0">
										<span><iaixsl:if test="$signbeforeprice = 'true'">
											<iaixsl:value-of select="/shop/page/insurance_product/@currency"/>
											<iaixsl:value-of select="$signbetweenpricecurrency"/>
										</iaixsl:if>
											<iaixsl:value-of select="/shop/page/insurance_product/@price_gross"/>
											<iaixsl:if test="$signbeforeprice = 'false'">
												<iaixsl:value-of select="$signbetweenpricecurrency"/>
												<iaixsl:value-of select="/shop/page/insurance_product/@currency"/>
											</iaixsl:if></span>
									</iaixsl:if>
								</div>
							</div>
						</div>
					</div>
				</iaixsl:if>
			</div>

			
		</div>
		<!-- (prepaid_address, 60dd8e8abcdeb9.97512135.10)-->
            <div id="prepaid_address" class="mb-4">
            <iaixsl:choose>
                    <iaixsl:when test="page/stock">
                            <h3 class="orderdetails_label">
                                <span>Personal collection point</span>
                            </h3>
                        <div class="order2_info1">

                                    <span class="prepaid_stock_name"><iaixsl:value-of select="page/stock/@name"/></span>
                                    <iaixsl:value-of select="page/stock/@street"/><br/>
                                    <iaixsl:value-of select="page/stock/@zipcode"/><iaixsl:text> </iaixsl:text><iaixsl:value-of select="page/stock/@city"/><iaixsl:text> </iaixsl:text>(<iaixsl:value-of select="page/stock/@country"/>)<br/>

                                    <iaixsl:if test="page/stock/@mail != ''">
                                        <span class="prepaid_stock_contact_item">e-mail: 
                                            <a><iaixsl:attribute name="href">mailto:<iaixsl:value-of select="page/stock/@mail"/></iaixsl:attribute><iaixsl:value-of select="page/stock/@mail"/></a></span><br/>
                                    </iaixsl:if>

                                    <iaixsl:if test="page/stock/@phone != ''">
                                        <span class="prepaid_stock_contact_item">phone no: 
                                            <span><iaixsl:value-of select="page/stock/@phone"/></span></span><br/>
                                    </iaixsl:if>

                                    <iaixsl:if test="page/stock/@fax != ''">
                                        <span class="prepaid_stock_contact_item">fax: 
                                            <span><iaixsl:value-of select="page/stock/@fax"/></span></span><br/>
                                    </iaixsl:if>

                                    <iaixsl:if test="page/stock/@gg != ''">
                                        <span class="prepaid_stock_contact_item">gg: 
                                            <a><iaixsl:attribute name="href">gg:<iaixsl:value-of select="page/stock/@gg"/></iaixsl:attribute><iaixsl:value-of select="page/stock/@gg"/></a></span><br/>
                                    </iaixsl:if>

                                    <iaixsl:if test="page/stock/@skype != ''">
                                        <span class="prepaid_stock_contact_item">skype: 
                                            <a target="_blank"><iaixsl:attribute name="href">callto://<iaixsl:value-of select="page/stock/@skype"/></iaixsl:attribute><iaixsl:value-of select="page/stock/@skype"/></a></span><br/>
                                    </iaixsl:if>

                                    <div class="prepaid_stock_link">
                                        <a class="prepaid_stock_link" target="_blank">
                                            <iaixsl:attribute name="href"><iaixsl:value-of select="page/stock/@link"/></iaixsl:attribute>
                                            more information
                                        </a>
                                    </div>
                        </div>
                    </iaixsl:when>
                    <iaixsl:otherwise>
                        <h3 class="orderdetails_label">
                            <span>Delivery address</span>
                        </h3>

                        <div class="order2_info1">

                            <iaixsl:if test="page/client/shipping_address/@additional != ''"><iaixsl:value-of select="page/client/shipping_address/@additional"/><br/></iaixsl:if>
                            <iaixsl:value-of select="page/client/shipping_address/@firstname"/><iaixsl:text> </iaixsl:text><iaixsl:value-of select="page/client/shipping_address/@lastname"/><br/>
                            <iaixsl:value-of select="page/client/shipping_address/@street"/><br/>
                            <iaixsl:value-of select="page/client/shipping_address/@zipcode"/><iaixsl:text> </iaixsl:text><iaixsl:value-of select="page/client/shipping_address/@city"/><iaixsl:text> </iaixsl:text>(<iaixsl:if test="page/client/shipping_address/@province"><iaixsl:value-of select="page/client/shipping_address/@province"/><iaixsl:text>, </iaixsl:text></iaixsl:if><iaixsl:value-of select="page/client/shipping_address/@country_long"/>)<br/>
                            <iaixsl:if test="(page/client/shipping_address/@phone) and not(page/client/shipping_address/@phone = '')">
                                phone no:  <iaixsl:value-of select="page/client/shipping_address/@phone"/><br/>
                            </iaixsl:if>
                        </div>
                    </iaixsl:otherwise>
                </iaixsl:choose>
                <h3 class="orderdetails_label">
                    <span>Billing details</span>
                </h3>

                <div class="order2_info1">
                    <iaixsl:if test="page/client/billing_address/@firm != ''">
                        <iaixsl:value-of select="page/client/billing_address/@firm"/><br/>
                    </iaixsl:if>
                    <iaixsl:if test="not(page/client/billing_address/@firm)">
                        <iaixsl:value-of select="page/client/billing_address/@firstname"/><iaixsl:text> </iaixsl:text><iaixsl:value-of select="page/client/billing_address/@lastname"/><br/>
                    </iaixsl:if>
                    <iaixsl:value-of select="page/client/billing_address/@street"/><br/>
                    <iaixsl:value-of select="page/client/billing_address/@zipcode"/><iaixsl:text> </iaixsl:text><iaixsl:value-of select="page/client/billing_address/@city"/><iaixsl:text> </iaixsl:text>(<iaixsl:if test="page/client/billing_address/@province"><iaixsl:value-of select="page/client/billing_address/@province"/><iaixsl:text>, </iaixsl:text></iaixsl:if><iaixsl:value-of select="page/client/billing_address/@country_long"/>)
                    <br/>
                    <iaixsl:if test="page/client/billing_address/@nip != ''">
                        VAT Number: <iaixsl:value-of select="page/client/billing_address/@nip"/><br/>
                    </iaixsl:if>
                    <iaixsl:if test="(page/client/@phone1) and not(page/client/@phone1 = '')">
                        phone no:  <iaixsl:value-of select="page/client/@phone1"/><br/>
                    </iaixsl:if>
                    <iaixsl:if test="(page/client/@email) and not(page/client/@email = '')">
                        e-mail:  <iaixsl:value-of select="page/client/@email"/><br/>
                    </iaixsl:if>
                </div>

                
                <h3 class="orderdetails_label">
                    <span>Recipient’s data</span>
                </h3>

                <div class="order2_info1">
                    <iaixsl:value-of select="page/client/shipping_address/@firstname"/><iaixsl:text> </iaixsl:text><iaixsl:value-of select="page/client/shipping_address/@lastname"/><br/>

                    <iaixsl:value-of select="page/client/shipping_address/@street"/><br/>
                    <iaixsl:value-of select="page/client/shipping_address/@zipcode"/><iaixsl:text> </iaixsl:text>
                    <iaixsl:value-of select="page/client/shipping_address/@city"/> (<iaixsl:if test="page/client/shipping_address/@province"><iaixsl:value-of select="page/client/shipping_address/@province"/><iaixsl:text>, </iaixsl:text></iaixsl:if><iaixsl:value-of select="page/client/shipping_address/@country_long"/>)<br/>
                    <iaixsl:if test="page/client/shipping_address/@phone and page/client/shipping_address/@phone != ''">
                        phone no: <iaixsl:value-of select="page/client/shipping_address/@phone"/><br/>
                    </iaixsl:if>
                </div>

                <iaixsl:if test="/shop/page/client/payer_address">
                    <h3 class="orderdetails_label">
                        <span>Dane na fakturze</span>
                    </h3>
                    <div class="order2_info1">
                        <iaixsl:if test="page/client/payer_address/@firm != ''">
                            <iaixsl:value-of select="page/client/payer_address/@firm"/><br/>
                        </iaixsl:if>
                        <iaixsl:if test="not(page/client/payer_address/@firm)">
                            <iaixsl:value-of select="page/client/payer_address/@firstname"/><iaixsl:text> </iaixsl:text><iaixsl:value-of select="page/client/payer_address/@lastname"/><br/>
                        </iaixsl:if>
                        <iaixsl:value-of select="page/client/payer_address/@street"/><br/>
                        <iaixsl:value-of select="page/client/payer_address/@zipcode"/><iaixsl:text> </iaixsl:text><iaixsl:value-of select="page/client/payer_address/@city"/><iaixsl:text> </iaixsl:text>(<iaixsl:if test="page/client/payer_address/@province"><iaixsl:value-of select="page/client/payer_address/@province"/><iaixsl:text>, </iaixsl:text></iaixsl:if><iaixsl:value-of select="page/client/payer_address/@country_long"/>)
                        <br/>
                        <iaixsl:if test="page/client/payer_address/@nip != ''">
                            VAT Number: <iaixsl:value-of select="page/client/payer_address/@nip"/><br/>
                        </iaixsl:if>
                        <iaixsl:if test="(page/client/payer_address/@phone) and not(page/client/payer_address/@phone = '')">
                            phone no:  <iaixsl:value-of select="page/client/payer_address/@phone"/><br/>
                        </iaixsl:if>
                        <iaixsl:if test="(page/client/payer_address/@email) and not(page/client/payer_address/@email = '')">
                            e-mail:  <iaixsl:value-of select="page/client/payer_address/@email"/><br/>
                        </iaixsl:if>
                    </div>
                </iaixsl:if>

                <iaixsl:if test="page/prepaid/details/@remarks">
                    <h3 class="orderdetails_label">
                        <span>Remarks to a shop staff made during the order process</span>
                    </h3>

                    <div class="order2_info1">
                        <iaixsl:value-of select="page/prepaid/details/@remarks"/>
                    </div>
                </iaixsl:if>

                <iaixsl:if test="page/prepaid/details/@deliverer_note">
                    <h3 class="orderdetails_label">
                        <span>Remarks to a courier made during the order process</span>
                    </h3>

                    <div class="order2_info1">
                        <iaixsl:value-of select="page/prepaid/details/@deliverer_note"/>
                    </div>
                </iaixsl:if>
            </div>
        <!-- (prepaid_documents, 60dd8e88bea1c3.58887943.9)-->
                <iaixsl:if test="count(page/prepaid/documents/document) &gt; 0">
                    <div id="prepaid_documents">
                    <div class="orderdetails_label"><span>Documents to download</span></div>
                    <div class="order2_info_sub">
                        <iaixsl:for-each select="page/prepaid/documents/document">
                            <div class="order2_info1">
                                <div class="n54116_item">
                                    <a class="n54116_item" target="_blank">
                                        <iaixsl:attribute name="title">Download or print a document</iaixsl:attribute>
                                        <iaixsl:attribute name="href"><iaixsl:value-of select="@link"/></iaixsl:attribute>
                                        <iaixsl:value-of select="@id"/>
                                    </a>
                                </div>
                            </div>
                        </iaixsl:for-each>
                    </div>
                    </div>
                </iaixsl:if>
        <!-- (orderdetails_payform, 60dd8f681ed455.08274068.10)-->
    <iaixsl:variable name="prepaidzt_txt">Add a complaint</iaixsl:variable> 
    <iaixsl:variable name="prepaidrt_txt">Return a product</iaixsl:variable> 

    <iaixsl:if test="($prepaidrt_txt and /shop/page/prepaid/actions/return/@url) or ($prepaidzt_txt and /shop/page/prepaid/actions/rma/@url)">
        <div class="actions_return_rma row">
            <iaixsl:if test="$prepaidrt_txt and /shop/page/prepaid/actions/return/@url">
                <div class="actions_return col-12 col-sm-6">
                    <div class="actions_return_sub col-12 mb-4">
                        <h3>A problem-free product return</h3>
                        <div>
                            <img alt="returns" src="/gfx/standards/returns_action.png?r=1696937716"/><span>If you would like to use the right to return a product without giving a reason, use our returns system which makes the process safe and simple.</span></div>
                            <a class="btn --solid">
                                <iaixsl:attribute name="title">Click to return a product. </iaixsl:attribute>
                                <iaixsl:attribute name="href"><iaixsl:value-of select="/shop/page/prepaid/actions/return/@url"/></iaixsl:attribute><iaixsl:value-of select="$prepaidrt_txt"/>
                            </a>
                    </div>
                </div>
            </iaixsl:if>
            <iaixsl:if test="$prepaidzt_txt and /shop/page/prepaid/actions/rma/@url">
                <div class="actions_rma col-12 col-sm-6">
                    <div class="actions_rma_sub col-12">
                        <h3>A problem-free product complaints</h3>
                        <div>
                            <img alt="rma" src="/gfx/standards/rma_action.png?r=1696937716"/><span>If a product was fine at the moment of delivery but then has broken and you would like to file a complaint through our shop, just use our RMA system which makes the process quicker and easier.</span></div>
                            <a class="btn --solid">
                                <iaixsl:attribute name="title">Click to make a complaint.</iaixsl:attribute>
                                <iaixsl:attribute name="href"><iaixsl:value-of select="/shop/page/prepaid/actions/rma/@url"/></iaixsl:attribute><iaixsl:value-of select="$prepaidzt_txt"/>
                            </a>
                    </div>
                </div>
            </iaixsl:if>
        </div>
    </iaixsl:if>
<!-- (prepaid__buttons, 60dd8f7ecd73b7.75367071.11)-->
			<section id="prepaid_buttons" class="prepaid_buttons d-flex flex-wrap">
				<h2 class="orderdetails_label"><span>Order from <iaixsl:value-of select="page/prepaid/details/@datetime"/></span></h2>
				<iaixsl:variable name="prepaidProForma"/>
				<iaixsl:if test="/shop/page/prepaid/documents/document/@type='invoice_proforma' and $prepaidProForma">
					<a class="prepaid_buttons__button --proforma btn --outline --medium mx-2 mb-2">
					<iaixsl:attribute name="title"/>
					<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/page/prepaid/documents/document[@type='invoice_proforma']/@link"/></iaixsl:attribute></a>
				</iaixsl:if>

				<iaixsl:if test="page/prepaid/editlink/@active = 'y' and not(/shop/page/prepaid/prepaid_history/item[position()=last()]/@express_pay = 'true')">
					<a class="prepaid_buttons__button --edit btn --outline --medium mx-2 mb-2">
					<iaixsl:attribute name="title">Click to go to the order edition.</iaixsl:attribute>
					<iaixsl:attribute name="href"><iaixsl:value-of select="page/prepaid/editlink/@link"/></iaixsl:attribute>Change order</a>
				</iaixsl:if>

				<iaixsl:if test="/shop/page/prepaid/opinions_forms/trusted_shops/raiting_action">
					<a class="prepaid_buttons__button --opinions btn --outline --medium mx-2 mb-2" target="_blank">
						<iaixsl:attribute name="title">Rate our store!</iaixsl:attribute>
						<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/page/prepaid/opinions_forms/trusted_shops/raiting_action"/></iaixsl:attribute>
						Rate our store!
					</a>
				</iaixsl:if>

				<iaixsl:if test="page/prepaid/confirmlink/@link">
					<a class="prepaid_buttons__button --resend btn --outline --medium mx-2 mb-2">
						<iaixsl:attribute name="title">Resend the e-mail with the order confirmation link</iaixsl:attribute>
						<iaixsl:attribute name="href"><iaixsl:value-of select="page/prepaid/confirmlink/@link"/></iaixsl:attribute>
						Confirm again by e-mail
					</a>
				</iaixsl:if>

				<iaixsl:if test="(page/prepaid/cancellink/@active='y') and not(page/prepaid/order/@payment_paid) and not(/shop/page/prepaid/prepaid_history/item[position()=last()]/@express_pay = 'true')">
					<a class="prepaid_buttons__button --cancel btn --outline --medium mx-2 mb-2">
						<iaixsl:attribute name="onclick">return confirm(&apos;Order cancelation is irreversible. Press "OK" button to continue.&apos;)</iaixsl:attribute>
						<iaixsl:attribute name="title">Order cancelation</iaixsl:attribute>
						<iaixsl:attribute name="href"><iaixsl:value-of select="page/prepaid/cancellink/@link"/></iaixsl:attribute>
						Cancel order
					</a>
				</iaixsl:if>
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

		
		<script src="/gfx/eng/orderdetails_payments.js.gzip?r=1696937760"></script>
	</iaixsl:if>
  
  
  

	
	<script src="/gfx/eng/envelope.js.gzip?r=1696937760"></script><script src="/gfx/eng/menu_suggested_shop_for_language.js.gzip?r=1696937760"></script><script src="/gfx/eng/prepaid_order_products.js.gzip?r=1696937760"></script>

	
	<iaixsl:value-of disable-output-escaping="yes" select="php:functionString('additionalContent', 'additional_body_scripts')"/>
  
	<script>app_shop.runApp();</script>
	
	<iaixsl:if test="/shop/page/seolink_with_language_directory"/>

	<iaixsl:if test="(action/set_render/item/@name = 'popup') or not(action/set_render/item)">
		<iaixsl:text disable-output-escaping="yes">&lt;/body&gt;&lt;/html&gt;</iaixsl:text>
	</iaixsl:if>
</iaixsl:template><iaixsl:template match="//image"><iaixsl:if test="@type='swf'"><object type="application/x-shockwave-flash"><iaixsl:attribute name="data"><iaixsl:value-of select="@src"/></iaixsl:attribute><iaixsl:attribute name="data"><iaixsl:value-of select="@src"/></iaixsl:attribute><iaixsl:attribute name="width"><iaixsl:value-of select="@width"/></iaixsl:attribute><iaixsl:attribute name="height"><iaixsl:value-of select="@height"/></iaixsl:attribute><param name="movie"><iaixsl:attribute name="value"><iaixsl:value-of select="@src"/></iaixsl:attribute></param><param name="bgcolor"><iaixsl:attribute name="bgcolor"><iaixsl:value-of select="@bgcolor"/></iaixsl:attribute></param></object></iaixsl:if><iaixsl:if test="not(@type='swf')"><img alt="" class="pic"><iaixsl:attribute name="src"><iaixsl:value-of select="@src"/></iaixsl:attribute><iaixsl:if test="@width &gt; 0"><iaixsl:attribute name="width"><iaixsl:value-of select="@width"/></iaixsl:attribute></iaixsl:if><iaixsl:if test="@height &gt; 0"><iaixsl:attribute name="height"><iaixsl:value-of select="@height"/></iaixsl:attribute></iaixsl:if></img></iaixsl:if></iaixsl:template><iaixsl:template name="escape-backslash"><iaixsl:param name="str" select="."/><iaixsl:choose><iaixsl:when test="contains($str, '\')"><iaixsl:value-of select="concat(substring-before($str, '\'), '\\' )"/><iaixsl:call-template name="escape-backslash"><iaixsl:with-param name="str" select="substring-after($str, '\')"/></iaixsl:call-template></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="$str"/></iaixsl:otherwise></iaixsl:choose></iaixsl:template><iaixsl:template name="escape-quote-string"><iaixsl:param name="str"/><iaixsl:param name="escape_backslash"/><iaixsl:param name="escape" select="'quot'"/><iaixsl:param name="quoting" select="'1'"/><iaixsl:variable name="escape_sign"><iaixsl:choose><iaixsl:when test="$escape=&quot;apos&quot;"><iaixsl:value-of select="&quot;'&quot;"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="string('&quot;')"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable><iaixsl:if test="$quoting"><iaixsl:value-of select="$escape_sign"/></iaixsl:if><iaixsl:choose><iaixsl:when test="contains($str,$escape_sign)"><iaixsl:variable name="before-first-apostrophe" select="substring-before($str,$escape_sign)"/><iaixsl:variable name="after-first-apostrophe" select="substring-after($str,$escape_sign)"/><iaixsl:value-of select="$before-first-apostrophe"/>\<iaixsl:value-of select="$escape_sign"/><iaixsl:text/><iaixsl:call-template name="escape-quote-string"><iaixsl:with-param name="str" select="$after-first-apostrophe"/><iaixsl:with-param name="escape" select="$escape"/><iaixsl:with-param name="quoting" select="0"/></iaixsl:call-template></iaixsl:when><iaixsl:otherwise><iaixsl:choose><iaixsl:when test="not($escape_backslash)"><iaixsl:value-of select="$str"/></iaixsl:when><iaixsl:otherwise><iaixsl:call-template name="escape-backslash"><iaixsl:with-param name="str" select="$str"/></iaixsl:call-template></iaixsl:otherwise></iaixsl:choose></iaixsl:otherwise></iaixsl:choose><iaixsl:if test="$quoting"><iaixsl:value-of select="$escape_sign"/></iaixsl:if></iaixsl:template></iaixsl:stylesheet>