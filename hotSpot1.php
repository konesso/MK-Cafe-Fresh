<div class="search-product search 1 d-flex flex-wrap mb-5">
    <?php
                    function generateRandomData() {
                        $data = [];
                        for ($i = 0; $i < 12; $i++) {
                            $data[] = rand(30, 100); 
                        }
                        return implode(', ', $data);
                    }
                    $products = [
                        [
                        'name'=> 'Kawa ziarnista',
                        'price'=> '29.99',
                        'img'=>
                        'https://www.konesso.pl/pol_pm_Kawa-ziarnista-MK-Cafe-Crema-1kg-10376_2.jpg',
                        'promotion'=> 'true',
                        'promotionType'=> 'promocja',
                        'lowerPrice'=> 'true'
                        ],
                   
                        [
                        'name'=> 'Kawa ziarnista 2',
                        'price'=> '39.99',
                        'img'=> ' https://www.konesso.pl/pol_pm_Kawa-ziarnista-MK-Cafe-Premium-1kg-10377_3.jpg',
                        'promotion'=> 'true',
                        'promotionType'=> 'nowość',
                        ],
                        [
                        'name'=> 'Kawa ziarnista 3',
                        'price'=> '49.99',
                        'img'=> 'https://www.konesso.pl/pol_pm_Kawa-ziarnista-MK-Cafe-Crema-1kg-10376_2.jpg',
                        'promotion'=> 'true',
                        'promotionType'=> 'bestseller',
                        ],
                        [
                        'name'=> 'Kawa ziarnista 4',
                        'price'=> '19.99',
                        'img'=> 'https://www.konesso.pl/pol_pm_Kawa-ziarnista-MK-Cafe-Premium-1kg-10377_3.jpg'
                        ],
                        [
                        'name'=> 'Kawa ziarnista 5',
                        'price'=> '149.99',
                        'img'=> ' https://www.konesso.pl/pol_pm_Kawa-ziarnista-MK-Cafe-Crema-1kg-10376_2.jpg'
                        ],
                        [
                        'name'=> 'Kawa ziarnista 6',
                        'price'=> '249.99',
                        'img'=> 'https://www.konesso.pl/pol_pm_Kawa-ziarnista-MK-Cafe-Premium-1kg-10377_3.jpg',
                        'promotion'=> 'true',
                        'promotionType'=> 'kawa miesiąca',
                        ],
                        [
                        'name'=> 'Kawa ziarnista 7',
                        'price'=> '29.99',
                        'img'=>
                        'https://www.konesso.pl/pol_pm_Kawa-ziarnista-MK-Cafe-Crema-1kg-10376_2.jpg',
                        ],
                        [
                        'name'=> 'Kawa ziarnista 8',
                        'price'=> '39.99',
                        'img'=> ' https://www.konesso.pl/pol_pm_Kawa-ziarnista-MK-Cafe-Premium-1kg-10377_3.jpg',
                        ],
                        [
                        'name'=> 'Kawa ziarnista 9',
                        'price'=> '49.99',
                        'img'=> 'https://www.konesso.pl/pol_pm_Kawa-ziarnista-MK-Cafe-Crema-1kg-10376_2.jpg'
                        ],
                        [
                        'name'=> 'Kawa ziarnista 10',
                        'price'=> '19.99',
                        'img'=> 'https://www.konesso.pl/pol_pm_Kawa-ziarnista-MK-Cafe-Premium-1kg-10377_3.jpg',
                        'promotion'=> 'true',
                        'promotionType'=> 'promocja',
                        'lowerPrice'=> 'true'
                        ],
                        [
                        'name'=> 'Kawa ziarnista 11',
                        'price'=> '149.99',
                        'img'=> ' https://www.konesso.pl/pol_pm_Kawa-ziarnista-MK-Cafe-Crema-1kg-10376_2.jpg'
                        ],
                        [
                        'name'=> 'Kawa ziarnista 12',
                        'price'=> '249.99',
                        'img'=> 'https://www.konesso.pl/pol_pm_Kawa-ziarnista-MK-Cafe-Premium-1kg-10377_3.jpg',
                        'promotion'=> 'true',
                        'promotionType'=> 'bestseller',
                        ]
                        ];
                        shuffle($products);

                        foreach (array_slice($products, 0, 8) as  $product) {
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