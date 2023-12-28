function getSposobyPrzygotowaniaHtml() {
	return new Promise((resolve, reject) => {
		var html = '';
		var html = '';
		$('#projector_dictionary .dictionary__param').filter(function () {
			return $(this).find('.dictionary__name_txt').text().trim().toUpperCase() === 'SPOSÓB PRZYGOTOWANIA';
		}).find('.dictionary__value_txt').each(function () {
			var sposob = $(this).text().trim();
			var sposobClass = sposob.toLowerCase().replace(/\s+/g, '');
			// Dodawanie tooltipa z nazwą metody parzenia z zachowaniem spacji
			html += `<div class="cafe-method img-method-${sposobClass}" data-toggle="tooltip" title="${sposob}"></div>`;
		});

		var url = window.location.href;
		var productIdMatch = url.match(/product-pol-(\d+)/);
		var productId = productIdMatch ? productIdMatch[1] : null;

		if (!productId) {
			console.error('Nie znaleziono ID produktu w URL');
			reject('Nie znaleziono ID produktu');
			return;
		}

		$.ajax({
			url: `https://public.konesso.pl/?json=true&module=productInfo&id=${productId}`,
			type: 'GET',
			dataType: 'json',
			success: function (data) {
				// Dodanie dat do HTML
				if (data && data.Dates) {
					var productionDate = data.Dates.productionDate;
					var expirationDate = data.Dates.expirationDate;
					html += `<div class="cafe-method img-method-productionDate" data-toggle="tooltip" title="${productionDate}"></div>`;
					html += `<div class="cafe-method img-method-expirationDate" data-toggle="tooltip" title="${expirationDate}"></div>`;
				}
				resolve(html);
			},
			error: function () {
				console.error('Błąd pobierania danych produktu');
				reject('Błąd pobierania danych produktu');
			}
		});
	});
}