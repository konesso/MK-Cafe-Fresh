<div class="product position-relative <?= isset($product['mainClass']) && $product['mainClass'] ? $product['mainClass'] : 'col-12 col-sm-6 col-lg-4 pt-4 my-5 pb-md-5' ?>" data-product_id="16371"
    data-product_page="0" data-product_first="true"><a
        class="product__icon d-flex justify-content-center align-items-center" data-product-id="16371"
        href="./product.php"
        title="Kawa ziarnista Jesienna Kawariatka 1kg">
        <div class="graph-background p-2" data-graph="<?= htmlspecialchars($product['graphData']) ?>">
            <div class="graph-title">Najedź myszką by poznać włąściwości smaku</div>
            <div>
                <canvas class="radar-chart" width="100%" height="100%" style=""></canvas>



            </div>
        </div>
        <picture class="product-img">
            <source media="(max-width: 420px)" srcset="<?= htmlspecialchars($product['img']) ?>">
            <img src="<?= htmlspecialchars($product['img']) ?>" alt="Kawa ziarnista Jesienna Kawariatka 1kg">
        </picture><?= $product['displayPromotion'] ?>
    </a>
    <h3><a class="product__name pt-2"
            href="https://www.konesso.pl/product-pol-16371-Kawa-ziarnista-Jesienna-Kawariatka-1kg.html"
            title="Kawa ziarnista Jesienna Kawariatka 1kg"><?= htmlspecialchars($product['name']) ?></a></h3>

    <div class="pt-2 pb-4">
        <div class="product__prices <?=$product['priceClass']?>"><strong
                class="price"><?= htmlspecialchars($product['price']) ?>zł<span class="price__unit"> /
                    szt.</span><span class="price_vat"> brutto</span></strong>
        </div>

        <div class="promo-price <?= $product['promoClass'] ?>">
            <div class="price-box"><span><span class="line-through">
                        <?= round($product['price']*1.4, 2) ?> zł
                    </span> <span class="pl-4" style="color:red;">
                        <?= htmlspecialchars($product['price']) ?> zł
                    </span> <span>
                        <p class="mt-2 small" style="color:#999">
                            Najniższa cena z ostatnich 30 dni: <?= round($product['price']*1.2, 2) ?> zł</p>
                        <p class="mt-1 small" style="color:#999">Cena w przeliczeniu na 1 kg: 
                            <?= round($product['price']*2, 2) ?> zł
                        </p>
                    </span></span></div>
        </div>
    </div>
    <a class="position-absolute product__compare_item --add btn " rel="nofollow"
        href="#"
        title="Kliknij, aby dodać produkt do porównania" style="
   position: absolute;
    transform: translate(-50%, 50%);
    bottom: 0;">
        <div class="d-inline-flex justify-content-center align-items-center">Sprawdź <span
                class="icon--right-arrow ml-2"></span></div>
    </a>
</div>