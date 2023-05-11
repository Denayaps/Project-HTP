<?php
class Pesanan {
    private $koneksi;
    public function __construct() {
        global $dbh;
        $this->koneksi = $dbh;
    }
    public function dataPesanan() {
        $sql = "SELECT tanggal, total, pelanggan_id FROM pesanan";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute();
        $rs = $ps->fetchAll();
        return $rs;
}
}

?>