<?php 
require 'Pegawai.php';

$pegawai1 = new Pegawai('01111','Andi','Manager','Islam','Menikah');
$pegawai2 = new Pegawai('01112','Ani','Asisten Manager','Islam','Belum Menikah');
$pegawai3 = new Pegawai('01113','Adi','Staff','Islam','Menikah');
$pegawai4 = new Pegawai('01114','Ujang','Kepala Bagian','Islam','Belum Menikah');
$pegawai5 = new Pegawai('01115','Maman','Staff','Islam','Menikah');

$ar_pegawai = [$pegawai1, $pegawai2, $pegawai3, $pegawai4 ,$pegawai5];


foreach($ar_pegawai as $pegawai){
    $pegawai->cetak();
}


?>