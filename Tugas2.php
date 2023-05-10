<!DOCTYPE html>
<html>
<head>
	<title>Rincian Gaji Pegawai</title>
</head>
<body>
	<h1>Rincian Gaji Pegawai</h1>
	<form method="post">
		<label for="nama">Nama:</label>
		<input type="text" id="nama" name="nama"><br>

		<label for="jabatan">Jabatan:</label>
		<select id="jabatan" name="jabatan">
			<option value="Manager">Manager</option>
			<option value="Asisten">Asisten</option>
			<option value="Kabag">Kabag</option>
			<option value="Staff">Staff</option>
		</select><br>

		<label for="status">Status:</label>
		<input type="radio" id="menikah" name="status" value="menikah">
		<label for="menikah">Menikah</label>
		<input type="radio" id="belum_menikah" name="status" value="belum_menikah">
		<label for="belum_menikah">Belum Menikah</label><br>

		<label for="jumlah_anak">Jumlah Anak:</label>
		<input type="number" id="jumlah_anak" name="jumlah_anak"><br>

		<input type="submit" name="submit" value="Hitung">
	</form>
<?php
$nama = $_POST['nama'];
$jabatan = $_POST['jabatan'];
$status = $_POST['status'];
$jumlah_anak = $_POST['jumlah_anak'];

$gaji_pokok = 0;


switch ($jabatan) {
    case 'Manager':
        $gaji_pokok = 20000000;
        break;
    case 'Asisten':
        $gaji_pokok = 15000000;
        break;
    case 'Kabag':
        $gaji_pokok = 10000000;
        break;
    case 'Staff':
        $gaji_pokok = 4000000;
        break;
    default:
        echo 'Jabatan tidak dikenali';
        exit();
}

$tunjangan_jabatan = 0.2 * $gaji_pokok;

if ($status == 'Menikah') {
    if ($jumlah_anak <= 2) {
        $tunjangan_keluarga = 0.05 * $gaji_pokok;
    } elseif ($jumlah_anak >= 3 && $jumlah_anak <= 5) {
        $tunjangan_keluarga = 0.1 * $gaji_pokok;
    } else {
        $tunjangan_keluarga = 0;
    }
} else {
    $tunjangan_keluarga = 0;
}

$gaji_kotor = $gaji_pokok + $tunjangan_jabatan + $tunjangan_keluarga;


$muslim = true; 
$gaji_minimal_zakat = 6000000;
$zakat_profesi = ($muslim && $gaji_kotor >= $gaji_minimal_zakat) ? 0.025 * $gaji_kotor : 0;

$take_home_pay = $gaji_kotor - $zakat_profesi;

echo "<h2> Rincian Gaji untuk $nama </h2>";
echo "<ul>";
echo "<li>Gaji Pokok: Rp. " . number_format($gaji_pokok, 0, ',', '.') . "</li>";
echo "<li>Tunjangan Jabatan: Rp. " . number_format($tunjangan_jabatan, 0, ',', '.') . "</li>";
echo "<li>Tunjangan Keluarga: Rp. " . number_format($tunjangan_keluarga, 0, ',', '.') . "</li>";
echo "<li>Gaji Kotor: Rp. " . number_format($gaji_kotor, 0, ',', '.') . "</li>";
echo "<li>Zakat Profesi: Rp. " . number_format($zakat_profesi, 0, ',', '.') . "</li>";
echo "<li>Take Home Pay: Rp. " . number_format($take_home_pay, 0, ',', '.') . "</li>";
echo "</ul>";
?>
</body>