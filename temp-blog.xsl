	<iaixsl:if test="count(/shop/page/main/blog_entries/item) &gt; 0">
		<section id="projector_blog" class="article mb-5 col-12">
			<h2>
				<a href="/blog-list.php" class="headline">
					<iaixsl:if test="/shop/page/mainpage2/@link and /shop/page/mainpage2/@link!=''">
						<iaixsl:attribute name="href"><iaixsl:value-of select="/shop/page/mainpage2/@link"/></iaixsl:attribute>
					</iaixsl:if>
					<iaixsl:attribute name="title">Kliknij, by zobaczyć wszystkie wpisy bloga</iaixsl:attribute>
					<span class="headline__name">Z naszego bloga</span>
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