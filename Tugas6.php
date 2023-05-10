<?php
require "Abstract1.php";

$segitiga = new Segitiga ();
$segitiga->alas = 3;
$segitiga->tinggi = 4; 

$persegipanjang =  new PersegiPanjang();
$persegipanjang->panjang = 5;
$persegipanjang->lebar = 3;

$lingkaran = new Lingkaran();
$lingkaran->jari2 = 6;

echo '<table border="1px" width="100%" bgcolor="white">';
echo '<thead> <tr> <th>Nama bidang: </th>';
echo '<th>Keliling: </th>';
echo '<th>Luas: </th>';
echo '</thead>';

echo '<tbody>';
echo '<tr><th>' . $segitiga->namaBidang() . '</th>';
echo '<th>' . $segitiga->kelilingBidang() . '</th>';
echo '<th>' . $segitiga->luasBidang() . '</th>';
echo '<tr><th>' . $lingkaran->namaBidang() . '</th>';
echo '<th>' . $lingkaran->kelilingBidang() . '</th>';
echo '<th>' . $lingkaran->luasBidang() . '</th>';
echo '<tr><th>' . $persegipanjang->namaBidang() . '</th>';
echo '<th>' . $persegipanjang->kelilingBidang() . '</th>';
echo '<th>' . $persegipanjang->luasBidang() . '</th>';
echo '</tbody>';
?>

