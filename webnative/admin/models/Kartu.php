<?php
class Kartu {
    private $koneksi;
    public function __construct() {
        global $dbh;
        $this->koneksi = $dbh;
    }
    public function dataKartu() {
        $sql = "SELECT nama, diskon FROM kartu";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute();
        $rs = $ps->fetchAll();
        return $rs;
}
}

?>