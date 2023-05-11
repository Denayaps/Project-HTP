<?php
$id = $_REQUEST['id'];
$model = new Pelanggan();
$pelanggan = $model->getPelanggan($id);

?>

<div class>
    <h3><?= $pelanggan['kode'] ?></h3>
    <h3><?= $pelanggan['nama'] ?></h3>
    <h3><?= $pelanggan['jk'] ?></h3>
    <h3><?= $pelanggan['tmp_lahir'] ?></h3>
    <h3><?= $pelanggan['tgl_lahir'] ?></h3>
    <h3><?= $pelanggan['email'] ?></h3>
    <h3><?= $pelanggan['kartu_id'] ?></h3>    
</div>