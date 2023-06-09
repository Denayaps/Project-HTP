<?php
$ar_prodi = ["SI"=>"Sistem Informasi", "TI"=>"Teknik Informatika","ILKOM"=>"Ilmu Komputer","TE"=>"Teknik Elektro"];

$ar_skill = ["HTML"=>10,"CSS"=>10, "Javascript"=>20, "RWD Bootstrap"=>20, "PHP"=>30, "MySQL"=>30,"Laravel"=>40];
$domisili = ["Jakarta","Bandung","Bekasi","Malang","Surabaya", "lainnya"];
function hitungSkorSkill($skills) {
    global $ar_skill;

    $totalSkor = 0;
    foreach ($skills as $skill) {
        if (isset($ar_skill[$skill])) {
            $totalSkor += $ar_skill[$skill];
        }
    }

    return $totalSkor;
}

function getKategoriSkill($skor) {
    if ($skor < 50) {
        return "Pemula";
    } elseif ($skor < 100) {
        return "Menengah";
    } elseif ($skor < 150) {
        return "Ahli";
    } else {
        return "Master";
    }
}

?>
<fieldset style="background-color:aquamarine;">
    <legend>Form Registrasi Kelompok Belajar</legend>
<table>
    <thead>
        <tr>
            <th>Form Registrasi</th>
        </tr>
    </thead>
    <tbody>
        <form method="POST">
            <tr>
                <td>NIM : </td>
                <td> 
                    <input type="text" name="nim" >
                </td>
            </tr>
            <tr>
                <td>Nama : </td>
                <td> 
                    <input type="text" name="nama" >
                </td>
            </tr>
            <tr>
                <td>Jenis Kelamin : </td>
                <td> 
                    <input type="radio" name="jk" value="Laki-laki" >Laki-Laki &nbsp;
                    <input type="radio" name="jk" value="Laki-laki" >Perempuan 
                </td>
            </tr>
            <tr>
                <td>Program Studi: </td>
                <td> 
                    <select name="prodi">
                        <?php 

                        foreach($ar_prodi as $prodi => $v){
                            ?>
                            <option value="<?= $prodi ?>"><?= $v ?></option>
                       <?php } ?>
                        </select>
                </td>
            </tr>
            <tr>
                <td>Skill Programming : </td>
                <td> 
                    <?php 
                    foreach ($ar_skill as $skill => $s){
                        ?>
                    <input type="checkbox" name="skill[]" value="<?= $skill ?>" ><?= $skill ?>

                    <?php } ?>
                </td>
            </tr>
            <tr>
                <td>Program Studi: </td>
                <td> 
                    <select name="domisili">
                        <?php 

                        foreach($domisili as $d){
                            ?>
                            <option value="<?= $d ?>"><?= $d ?></option>
                       <?php } ?>
                        </select>
                </td>
            </tr>
            <tfoot>
                <tr>
                    <th colspan="2">
                        <button name="proses">Submit</button>
                    </th>
                </tr>
            </tfoot>
    </table>
            

</fieldset>
<?php 
if (isset($_POST['proses'])) {
    // ambil nilai dari form
    $nim = $_POST['nim'];
    $nama = $_POST['nama'];
    $jk = $_POST['jk'];
    $prodi = $_POST['prodi'];
    $skill = $_POST['skill'];
    $domisili = $_POST['domisili'];

    // hitung skor skill
    $skorSkill = hitungSkorSkill($skill);

    // tentukan kategori skill
    $kategoriSkill = getKategoriSkill($skorSkill);

    // tampilkan hasil
    echo "NIM : $nim<br>";
    echo "Nama : $nama<br>";
    echo "Jenis Kelamin : $jk<br>";
    echo "Program Studi : $prodi<br>";
    echo "Skill : " . implode(", ", $skill) . "<br>";
    echo "Domisili : $domisili<br>";
    echo "Skor Skill : $skorSkill<br>";
    echo "Kategori Skill : $kategoriSkill<br>";
}
?>
