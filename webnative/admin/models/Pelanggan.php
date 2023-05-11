<?php
class Pelanggan {
    private $koneksi;
    public function __construct() {
        global $dbh;
        $this->koneksi = $dbh;
    }
    public function dataPelanggan() {
        $sql = "SELECT * FROM pelanggan";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute();
        $rs = $ps->fetchAll();
        return $rs;
    }

    public function getPelanggan($id) {
        $sql = "SELECT nama, jk FROM pelanggan WHERE pelanggan.id = ?";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute([$id]);
        $rs = $ps->fetchAll();
        return $rs;
    }

    public function simpan($data) {
        $sql = "INSERT INTO pelanggan(kode,nama,jk,tmp_lahir,tgl_lahir,email,kartu_id) 
        VALUES(?,?,?,?,?,?,?)";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute($data);
    }
}

?>