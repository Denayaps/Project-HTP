<!DOCTYPE html>
<html>
<head>
    <title>Form Jajar Genjang</title>
</head>
<body>
    <h1>Form Jajar Genjang</h1>
    <form method="post" action="">
        <label for="alas">Alas:</label>
        <input type="number" name="alas" required><br><br>
        <label for="tinggi">Tinggi:</label>
        <input type="number" name="tinggi" required><br><br>
        <label for="sisi">Sisi:</label>
        <input type="number" name="sisi" required><br><br>
        <input type="submit" name="submit" value="Hitung"><br><br>
    </form>

    <?php
    if(isset($_POST['submit'])) {
        $alas = $_POST['alas'];
        $tinggi = $_POST['tinggi'];
        $sisi = $_POST['sisi'];
        
        $luas = $alas * $tinggi;
        $keliling = 2 * ($alas + $sisi);

        echo "<h2>Hasil:</h2>";
        echo "Luas: ".$luas."<br>";
        echo "Keliling: ".$keliling."<br>";
    }
    ?>
</body>
</html>
