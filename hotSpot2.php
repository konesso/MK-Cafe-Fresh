<div id="search" class="search products d-flex flex-wrap mb-5">
    <?php
                    $products1 = [
                        [
                        'name'=> 'Kawa ziarnista',
                        'price'=> '29.99',
                        'img'=> 'https://www.konesso.pl/pol_pm_Kawa-ziarnista-MK-Cafe-Premium-1kg-10377_3.jpg',
                        'promotion'=> 'true',
                        'promotionType'=> 'promocja',
                        'lowerPrice'=> 'true'
                        ],
                   
                        [
                        'name'=> 'Kawa ziarnista 2',
                        'price'=> '39.99',
                        'img'=> 'https://www.konesso.pl/pol_pm_Kawa-ziarnista-MK-Cafe-Premium-1kg-10377_3.jpg',
                        'promotion'=> 'true',
                        'promotionType'=> 'nowość',
                        ],
                        [
                        'name'=> 'Kawa ziarnista 3',
                        'price'=> '49.99',
                        'img'=> 'https://www.konesso.pl/pol_pm_Kawa-ziarnista-MK-Cafe-Premium-1kg-10377_3.jpg',
                        'promotion'=> 'true',
                        'promotionType'=> 'bestseller',
                        ],
                        [
                        'name'=> 'Kawa ziarnista 4',
                        'price'=> '19.99',
                        'img'=> 'https://www.konesso.pl/pol_pm_Kawa-ziarnista-MK-Cafe-Premium-1kg-10377_3.jpg',
                        ]
                        
                        ];
                        shuffle($products1);

                        foreach (array_slice($products1, 0, 8) as  $product) {
                            $product['graphData'] = generateRandomData();
                        
                            // Sprawdzenie czy istnieje promocja i dodanie 'promotionType' jeśli jest dostępne
                            if (isset($product['promotion']) && $product['promotion'] === 'true' && isset($product['promotionType'])) {
                                $product['displayPromotion'] = "<strong class=\"label_icons\"><span class=\"label --promo\">" . htmlspecialchars($product['promotionType']) . "</span></strong>";
                            } else {
                                $product['displayPromotion'] = "";
                            }

                            // Sprawdzanie czy produkt ma obniżoną cenę jeżeli jest 'lowerPrice'
                            if (isset($product['lowerPrice']) && $product['lowerPrice'] === 'true') {
                                $product['promoClass'] = ""; 
                                $product['priceClass'] = "d-none";
                            } else {
                                $product['promoClass'] = "d-none";
                                $product['priceClass'] = ""; 
                            }

                            $product['mainClass'] = 'col-12 col-sm-6 col-lg-3 pt-1 my-5 pb-md-5';

                            include 'search-result-product.php';
                        }
                   ?>
</div>