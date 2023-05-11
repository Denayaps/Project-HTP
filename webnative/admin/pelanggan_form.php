<br>
<?php
$obj_pelanggan = new Pelanggan();
$data_pelanggan = $obj_pelanggan->dataPelanggan();
?>

<form action="pelanggan_controller.php" method="POST">
    <div class="form-group row">
        <label for="text1" class="col-4 col-form-label">Kode</label>
        <div class="col-8">
            <input id="kode" name="kode" class="form-control">
        </div>
    </div>
    <div class="form-group row">
        <label for="text1" class="col-4 col-form-label">Nama</label>
        <div class="col-8">
            <input id="nama" name="nama" class="form-control">
        </div>
    </div>
    <div class="form-group row">
        <label for="text1" class="col-4 col-form-label">Jenis Kelamin</label>
        <div class="col-8">
            <input id="jk" name="jk" class="form-control">
        </div>
    </div>
    <div class="form-group row">
        <label for="text1" class="col-4 col-form-label">Tempat Lahir</label>
        <div class="col-8">
            <input id="tmp_lahir" name="tmp_lahir" class="form-control">
        </div>
    </div>
    <div class="form-group row">
        <label for="text1" class="col-4 col-form-label">Tanggal Lahir</label>
        <div class="col-8">
            <input id="tgl_lahir" name="tgl_lahir" class="form-control">
        </div>
    </div>
    <div class="form-group row">
        <label for="text1" class="col-4 col-form-label">Email</label>
        <div class="col-8">
            <input id="email" name="email" class="form-control">
        </div>
    </div>
    <div class="form-group row">
        <label for="text1" class="col-4 col-form-label">Kartu Id</label>
        <div class="col-8">
            <input id="kartu_id" name="kartu_id" class="form-control">
        </div>
    </div>
    <button type="submit" name="proses" value="simpan" class="btn btn-primary">Submit</button>
</form>
</br>