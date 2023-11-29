<?xml version="1.0" encoding="UTF-8"?>
<iaixsl:stylesheet xmlns:php="http://php.net/xsl" xmlns:iaixsl="http://www.w3.org/1999/XSL/Transform" xmlns:iaielement="http://iai-system.com/ddd" xmlns:fb="http://www.facebook.com/2008/fbml" version="1.0" exclude-result-prefixes="php iaielement fb"><iaixsl:output indent="no" method="html" doctype-system="about:legacy-compat" version="1.0" encoding="UTF-8"/><iaixsl:strip-space elements="table tr td img"/><iaixsl:decimal-format name="yen" NaN="" grouping-separator="," decimal-separator="."/><iaixsl:template match="shop">
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
														Zapłacono
													</iaixsl:when>
													<iaixsl:otherwise>
														Zapłaciłeś
													</iaixsl:otherwise>
												</iaixsl:choose>
												<iaixsl:value-of select="amount/client_currency/@value_formatted"/> przez 

												<iaixsl:choose>
													<iaixsl:when test="@payment_id='27'"> 
														saldo (nadpłata na koncie klienta)
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
																Wybrano, ale zrezygnowano ze zwrotu
															</iaixsl:when>
															<iaixsl:otherwise>
																Wybrałeś, ale zrezygnowałeś z płatności
															</iaixsl:otherwise>
														</iaixsl:choose>
													</iaixsl:when>
													<iaixsl:otherwise>
														<iaixsl:choose>
															<iaixsl:when test="amount/@mark='negativ'">
																<iaixsl:choose>
																	<iaixsl:when test="@status = 'y'">Zapłacono </iaixsl:when>
																	<iaixsl:otherwise>Wybrano </iaixsl:otherwise>
																</iaixsl:choose>
															</iaixsl:when>
															<iaixsl:otherwise>
																<iaixsl:choose>
																	<iaixsl:when test="@status = 'y'">Zapłaciłeś </iaixsl:when>
																	<iaixsl:otherwise>Wybrałeś </iaixsl:otherwise>
																</iaixsl:choose>
															</iaixsl:otherwise>
														</iaixsl:choose>
														<iaixsl:if test="@status = 'y'"><iaixsl:value-of select="amount/client_currency/@value_formatted"/> przez </iaixsl:if>
													</iaixsl:otherwise>
												</iaixsl:choose>

												<iaixsl:choose>
													<iaixsl:when test="@payment_id='27'"> 
														saldo (nadpłata na koncie klienta)
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
																na kwotę 
														</iaixsl:when>
														<iaixsl:otherwise>
																na kwotę 
														</iaixsl:otherwise>
													</iaixsl:choose>
													<iaixsl:value-of select="amount/client_currency/@value_formatted"/>.
												</iaixsl:if>

												<iaixsl:if test="not(dates/date_canceled/@date)">
													<iaixsl:choose>
														<iaixsl:when test="amount/@mark='negativ'">
																jako formę zwrotu.
																Kwota do zwrotu to 
																<iaixsl:value-of select="amount/client_currency/@value_formatted"/>.
														</iaixsl:when>
														<iaixsl:otherwise>
															<iaixsl:choose>
																<iaixsl:when test="@status = 'y'">.</iaixsl:when>
																<iaixsl:otherwise> jako formę płatności. Kwota do wpłaty to <iaixsl:value-of select="amount/client_currency/@value_formatted"/>.</iaixsl:otherwise>
																</iaixsl:choose>
														</iaixsl:otherwise>
													</iaixsl:choose>
												</iaixsl:if>


												<iaixsl:if test="@status = 'n'">
													<iaixsl:if test="not(amount/@mark='negativ')">
														<iaixsl:if test="additional_info/data">
															<iaixsl:choose>
																<iaixsl:when test="@other_payments= 'true'">
																	<br/>Dokonaj wpłaty na poniższe dane lub wybierz inny sposób zapłaty. 
																</iaixsl:when>
																<iaixsl:otherwise>
																	<br/>Dokonaj wpłaty na poniższe dane.
																</iaixsl:otherwise>
															</iaixsl:choose>

															<div class="orderdetails_payments__transfer pt-2 pb-1">
																<div class="orderdetails_payments__transfer_item d-flex pb-2 pb-sm-1">
																	<span class="orderdetails_payments__transfer_name">Nazwa odbiorcy: </span>
																	<strong class="orderdetails_payments__transfer_value"><iaixsl:value-of select="additional_info/data/@receiver"/></strong>
																</div>
																<div class="orderdetails_payments__transfer_item d-flex pb-2 pb-sm-1">
																	<span class="orderdetails_payments__transfer_name">Numer konta: </span>
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
																	<span class="orderdetails_payments__transfer_name">Tytuł przelewu: </span>
																	<strong class="orderdetails_payments__transfer_value"><iaixsl:value-of select="additional_info/data/@title"/></strong>
																</div>
																<div class="orderdetails_payments__transfer_item d-flex pb-2 pb-sm-1">
																	<span class="orderdetails_payments__transfer_name">Kwota przelewu: </span>
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
										Obecnie na swoim koncie masz 
										<b><iaixsl:value-of select="/shop/page/prepaid/points/@client_points"/><span> pkt.</span></b>
										
									</div>
								</iaixsl:if>
								
								<iaixsl:if test="page/prepaid/details/@paymentstatus != 'g' and /shop/page/prepaid_methods/item and (page/prepaid/prepaid_history/item[position() = last()]/@status = 'n' or page/prepaid/prepaid_history/@show_payment_button = 'true')">
									<iaixsl:if test="page/prepaid/prepaid_history/item[position() = last()]/@payment_form_id != 153">
										<span class="orderdetails_payments__unfinished">Jeżeli z jakiegokolwiek powodu proces płacenia nie został ukończony, dokonaj wpłaty ponownie lub wybierz inny sposób zapłaty.</span>
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
																Przejdź do płatności odroczonej (<iaixsl:value-of select="/shop/page/prepaid/order/@payment_remain_formatted"/>)
															</iaixsl:when>
															<iaixsl:otherwise>
																Zapłać <iaixsl:value-of select="/shop/page/prepaid/order/@payment_remain_formatted"/> 
																(spróbuj ponownie)
															</iaixsl:otherwise>
														</iaixsl:choose>
																<iaixsl:if test="/shop/page/prepaid/points/@display">
																		<span>
																					+ 
																				<iaixsl:value-of select="/shop/page/prepaid/points/@order_cost"/> PKT.
																		</span>
																</iaixsl:if>
														</a>
												</iaixsl:when>
												<iaixsl:otherwise>
														<span>
																Zwrot: 
																<iaixsl:value-of select="/shop/page/prepaid/prepaid_history/item[position() = last()]/amount/order_currency/@value_formatted"/>
														</span>
												</iaixsl:otherwise>
											</iaixsl:choose>
										</iaixsl:if>
										<iaixsl:if test="(/shop/page/prepaid/prepaid_history/item[position() = last()]/@status != 'n' and /shop/page/prepaid/prepaid_history/@currencysum * 100 &gt; 0) or (not(count(/shop/page/prepaid/prepaid_history/item) &gt; 0) and page/prepaid/prepaid_history/@show_payment_button = 'true')">
											<a href="#orderdetails_retry_new_payment" class="orderdetails_retry__button --new --new_payment btn --solid --large">Zapłać <iaixsl:value-of select="/shop/page/prepaid/prepaid_history/@currencysum_formatted"/></a>
										</iaixsl:if>
										<iaixsl:if test="/shop/page/prepaid/prepaid_history/item[position() = last()]/@status='n' and /shop/page/prepaid/prepaid_history/@other_payments='true' and /shop/page/prepaid/order/@payment_remain &gt; 0">
											<a href="#orderdetails_retry_new" class="orderdetails_retry__button --new btn">Wybierz inną formę płatności</a>
										</iaixsl:if>
									</div>
								</iaixsl:if>

								<iaixsl:if test="/shop/allow_division_order/@turn_on = 'yes'">
									<div class="orderdetails_division">
										<strong>Po dokonaniu płatności, zamówienie zostanie podzielone na dwa oddzielne.</strong>
									</div>
								</iaixsl:if>
							</div>
						</div>
						<script>
							app_shop.vars.leftToPay = &apos;<iaixsl:value-of select="/shop/page/prepaid/order/@payment_remain_formatted"/>&apos;;
						</script>
					</div>
				</iaixsl:template><iaixsl:template match="//image"><iaixsl:if test="@type='swf'"><object type="application/x-shockwave-flash"><iaixsl:attribute name="data"><iaixsl:value-of select="@src"/></iaixsl:attribute><iaixsl:attribute name="data"><iaixsl:value-of select="@src"/></iaixsl:attribute><iaixsl:attribute name="width"><iaixsl:value-of select="@width"/></iaixsl:attribute><iaixsl:attribute name="height"><iaixsl:value-of select="@height"/></iaixsl:attribute><param name="movie"><iaixsl:attribute name="value"><iaixsl:value-of select="@src"/></iaixsl:attribute></param><param name="bgcolor"><iaixsl:attribute name="bgcolor"><iaixsl:value-of select="@bgcolor"/></iaixsl:attribute></param></object></iaixsl:if><iaixsl:if test="not(@type='swf')"><img alt="" class="pic"><iaixsl:attribute name="src"><iaixsl:value-of select="@src"/></iaixsl:attribute><iaixsl:if test="@width &gt; 0"><iaixsl:attribute name="width"><iaixsl:value-of select="@width"/></iaixsl:attribute></iaixsl:if><iaixsl:if test="@height &gt; 0"><iaixsl:attribute name="height"><iaixsl:value-of select="@height"/></iaixsl:attribute></iaixsl:if></img></iaixsl:if></iaixsl:template><iaixsl:template name="escape-backslash"><iaixsl:param name="str" select="."/><iaixsl:choose><iaixsl:when test="contains($str, '\')"><iaixsl:value-of select="concat(substring-before($str, '\'), '\\' )"/><iaixsl:call-template name="escape-backslash"><iaixsl:with-param name="str" select="substring-after($str, '\')"/></iaixsl:call-template></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="$str"/></iaixsl:otherwise></iaixsl:choose></iaixsl:template><iaixsl:template name="escape-quote-string"><iaixsl:param name="str"/><iaixsl:param name="escape_backslash"/><iaixsl:param name="escape" select="'quot'"/><iaixsl:param name="quoting" select="'1'"/><iaixsl:variable name="escape_sign"><iaixsl:choose><iaixsl:when test="$escape=&quot;apos&quot;"><iaixsl:value-of select="&quot;'&quot;"/></iaixsl:when><iaixsl:otherwise><iaixsl:value-of select="string('&quot;')"/></iaixsl:otherwise></iaixsl:choose></iaixsl:variable><iaixsl:if test="$quoting"><iaixsl:value-of select="$escape_sign"/></iaixsl:if><iaixsl:choose><iaixsl:when test="contains($str,$escape_sign)"><iaixsl:variable name="before-first-apostrophe" select="substring-before($str,$escape_sign)"/><iaixsl:variable name="after-first-apostrophe" select="substring-after($str,$escape_sign)"/><iaixsl:value-of select="$before-first-apostrophe"/>\<iaixsl:value-of select="$escape_sign"/><iaixsl:text/><iaixsl:call-template name="escape-quote-string"><iaixsl:with-param name="str" select="$after-first-apostrophe"/><iaixsl:with-param name="escape" select="$escape"/><iaixsl:with-param name="quoting" select="0"/></iaixsl:call-template></iaixsl:when><iaixsl:otherwise><iaixsl:choose><iaixsl:when test="not($escape_backslash)"><iaixsl:value-of select="$str"/></iaixsl:when><iaixsl:otherwise><iaixsl:call-template name="escape-backslash"><iaixsl:with-param name="str" select="$str"/></iaixsl:call-template></iaixsl:otherwise></iaixsl:choose></iaixsl:otherwise></iaixsl:choose><iaixsl:if test="$quoting"><iaixsl:value-of select="$escape_sign"/></iaixsl:if></iaixsl:template></iaixsl:stylesheet>