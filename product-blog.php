<section id="projector_blog" class="article mb-5 col-12">
    <h2><a href="/blog-list.php" class="headline" title="Kliknij, by zobaczyć wszystkie wpisy bloga"><span
                class="headline__name">Blog</span></a></h2>
    <!-- <script>
                
                
                    $('.article__block').slick({
                        infinite: true,
                        slidesToShow: 3,
                        slidesToScroll: 3
                    });
                
            </script> -->
    <div class="article__block row">
        <?php $arr = json_decode(json_encode([
            [
                'name' => 'Triest - włoska stolica kawy',
                'img' => 'https://www.konesso.pl/data/include/img/news/1696850710.jpg',
                'desc' => 'Dlaczego i czy słusznie Triest jest nazywany <strong>włoską stolicą
                        kawy</strong>? Odkryj, jaką historię kryje to nadmorskie miasto i co ma z
                    nim wspólnego rzemieślnicza palarnia <strong>Bazzara.</strong>',
            ],
            [
                'name' => 'Jaką kawę Bazzara wybrać',
                'img' => 'https://www.konesso.pl/data/include/img/news/1688122979.jpg',
                'desc' => 'Kawy <strong>BAZZARA</strong> to jedne z najlepszych kaw ziarnistych do espresso!
                Jeśli nie wiesz, <strong>jaką kawę z włoskiej palarni Bazzara wybrać</strong>,
                przygotowaliśmy dla Was małe podpowiedzi.</p>',
            ],
            [
                'name' => 'Jak zaparzyć kawę',
                'img' => 'https://www.konesso.pl/data/include/img/news/1681985447.jpg',
                'desc' => '<strong>Bazzara Dodicigrancru to must have</strong> w menu każdego miłośnika
                aromatycznego espresso. Jeśli zastanawiasz się nad zakupem kawy Bazzara
                Dodicigrancru, to być może moje odczucia pomogą Ci dokonać właściwego wyboru.',
            ],
            [
                'name' => 'Przepis na kawę - Truskawkowe macchiato',
                'img' => 'https://www.konesso.pl/data/include/img/news/1556193742.jpg',
                'desc' => 'Szukając w sklepie Konesso.pl dobrej kawy dla siebie, warto kierować się
                doświadczeniem innych klientów, którzy swoimi wielokrotnymi wyborami utarli
                pewne ścieżki. Wykorzystując informacje dotyczące Waszych zakupów i pochlebnych
                opinii w ubiegłym roku, stworzyliśmy <strong>ranking kawy ziarnistej do
                    espresso</strong>',
            ],
            [
                'name' => 'Kawa w Turcji - historia',
                'img' => 'https://www.konesso.pl/data/include/img/news/1531989562.jpg',
                'desc' => 'Turcja odegrała bardzo istotną rolę w historii kawy. To właśnie dzięki Turkom Europa poznała właściwości niepozornych zielonych ziaren kawy. To właśnie kawa po turecku jest najstarszą metodą parzenia. Poznaj niezwykle ciekawą historię, która łączy Turcję i kawę.',
            ],
            [
                'name' => 'Jak przygotować kawę po szwedzku?',
                'img' => 'https://www.konesso.pl/data/include/img/news/1526021095.jpg',
                'desc' => 'Kawa przygotowana z dodatkiem świeżego jajka, czyli inaczej kawa po szwedzku, to bardzo ciekawa alternatywa dla tradycyjnie zalewanej wodą kawy. Delikatny w smaku napar jest pozbawiony fusów i bardzo prosty w przygotowaniu. Cały proces parzenia trwa tylko kilka minut..',
            ],
            [
                'name' => 'Flat white - co to jest?',
                'img' => 'https://www.konesso.pl/data/include/img/news/1516174053.jpg',
                'desc' => 'Jeśli kawy mleczne najbardziej przypadają Wam do gustu, lecz nie chcecie już pić cappuccino, to mamy dla Was alternatywę. Z pewnością spotkaliście się w kawiarni z nazwą tej kawy. Czym jest flat white i co różni ją od pozostałych kaw mlecznych? Przedstawiamy Wam szczegóły.',
            ],
             
        ]), false); 
        ?>

        <?php 
        shuffle($arr);
        foreach(array_slice(($arr), 0, 3) as $c): ?>
        <article class="article__item col-12 col-md-4">


            <a class="article__image_wrapper" href="#"><img src="<?php echo $c->img; ?>"
                    class="article__image b-lazy b-loaded" width="900" height="470" alt="<?php echo $c->name; ?>"></a>

            <div class="article__date_name mt-2 mb-3">
                <h3 class="article__name_wrapper"><a class="article__name" href="#"
                        title="<?php echo $c->name; ?>"><?php echo $c->name; ?></a></h3>
            </div>
            <div class="article__text">
                <div class="article__description">
                    <p><?php echo $c->desc; ?></p>

                </div>
                <div class="article__more"><a class="article__more_link" href="#" title="<?php echo $c->name; ?>">Czytaj
                        więcej</a></div>
            </div>

        </article>
        <?php endforeach; ?>
    </div>
</section>