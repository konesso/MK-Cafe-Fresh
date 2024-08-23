<?php
// Umożliwia dostęp CORS
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

// Ścieżka do pliku JSON
$jsonFilePath = 'people.json';

// Sprawdzanie, czy plik istnieje
if (file_exists($jsonFilePath)) {
    // Odczyt pliku JSON
    $jsonData = file_get_contents($jsonFilePath);

    // Konwersja danych JSON na tablicę PHP
    $data = json_decode($jsonData, true);

    // Zwracanie danych JSON
    echo json_encode($data);
} else {
    // Obsługa błędu, jeśli plik JSON nie istnieje
    http_response_code(404);
    echo json_encode(["message" => "File not found."]);
}
?>