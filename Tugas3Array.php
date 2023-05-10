<?php 
$m1 = ['NIM'=>'01111021', 'nama'=>'Andi', 'nilai'=>80];
$m2 = ['NIM'=>'01111022', 'nama'=>'Ani', 'nilai'=>70];
$m3 = ['NIM'=>'01111023', 'nama'=>'Ari', 'nilai'=>50];
$m4 = ['NIM'=>'01111024', 'nama'=>'Aji', 'nilai'=>40];
$m5 = ['NIM'=>'01111025', 'nama'=>'Ali', 'nilai'=>90];
$m6 = ['NIM'=>'01111026', 'nama'=>'Ai', 'nilai'=>75];
$m7 = ['NIM'=>'01111027', 'nama'=>'Budi', 'nilai'=>30];
$m8 = ['NIM'=>'01111028', 'nama'=>'Bani', 'nilai'=>85];
$mahasiswa = [$m1,$m2,$m3,$m4,$m5,$m6,$m7,$m8];
$ar_judul = ['No','NIM','Nama','Nilai','Keterangan','Grade','Predikat'];

$count_mahasiswa = count($mahasiswa);
$max_nilai = $mahasiswa[0]['nilai'];
$min_nilai = $mahasiswa[0]['nilai'];
$total_nilai = 0;
foreach ($mahasiswa as $mhs) {
    $total_nilai += $mhs['nilai'];
    if ($mhs['nilai'] > $max_nilai) {
        $max_nilai = $mhs['nilai'];
    }
    if ($mhs['nilai'] < $min_nilai) {
        $min_nilai = $mhs['nilai'];
    }
}
$avg_nilai = $total_nilai / $count_mahasiswa;

?>

<table border="1px" width="100%" bgcolor="white">
    <thead>
        <tr>
            <?php foreach($ar_judul as $judul): ?>
                <th><?= $judul ?></th>
            <?php endforeach; ?>
        </tr>
    </thead>
    <tbody>
        <?php
        $no = 1;
        foreach($mahasiswa as $mhs){
            $ket = ($mhs['nilai'] >= 60) ? 'Lulus' : 'Tidak lulus';

            if ($mhs['nilai'] >= 85 && $mhs['nilai'] <= 100) {
                $grade = 'A';
            } elseif ($mhs['nilai'] >= 75 && $mhs['nilai'] < 85) {
                $grade = 'B';
            } elseif ($mhs['nilai'] >= 60 && $mhs['nilai'] < 75) {
                $grade = 'C';
            } elseif ($mhs['nilai'] >= 30 && $mhs['nilai'] < 60) {
                $grade = 'D';
            } elseif ($mhs['nilai'] >= 0 && $mhs['nilai'] < 30) {
                $grade = 'E';
            } else {
                $grade = '';
            }

            switch ($grade) {
                case 'A':
                    $predikat = 'Sangat Baik';
                    break;
                case 'B':
                    $predikat = 'Baik';
                    break;
                case 'C':
                    $predikat = 'Cukup';
                    break;
                case 'D' :
                    $predikat = 'Kurang';
                    break;
                case 'E':
                    $predikat = 'Sangat Kurang';
                    break;
                }
            echo "<tr>";
            echo "<td>" . $no . "</td>";
            echo "<td>" . $mhs['NIM'] . "</td>";
            echo "<td>" . $mhs['nama'] . "</td>";
            echo "<td>" . $mhs['nilai'] . "</td>";
            echo "<td>" . $ket . "</td>";
            echo "<td>" . $grade . "</td>";
            echo "<td>" . $predikat . "</td>";
            echo "</tr>";
            ++$no;
        }
        ?>
