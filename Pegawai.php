<?php
class Pegawai{
    protected $nip;
    public $nama;
    private $jabatan;
    private $agama;
    private $status;
    static $jml = 0;
    const PT = 'PT. HTP Indonesia';

    public function __construct($nip, $nama, $jabatan, $agama, $status){
        $this->nip = $nip;
        $this->nama = $nama;
        $this->jabatan = $jabatan;
        $this->agama = $agama;
        $this->status = $status;
        self::$jml++;
    }
    public function setGajiPokok($jabatan){
        $this->jabatan = $jabatan;
        switch($jabatan){
            case 'Manager': $gapok = 15000000; break;
            case 'Asisten Manager': $gapok = 10000000; break;
            case 'Kepala Bagian': $gapok = 7000000; break;
            case 'Staff': $gapok = 5000000; break;
            default: $gapok = 0; break;
        }
        return $gapok;
    }
    public function setTunjab($gapok) {
        return $gapok/5;
    }

    public function setTunkel($gapok, $status) {
        $tunkel = ($status == 'Menikah') ? $gapok / 10 : 0;
        return $tunkel;
    }

    public function setZakatProfesi($gapok, $agama) {
        $this->agama = $agama;
        $zakat = ($agama == 'Islam' && $gapok >= 6000000) ? $gapok * 25/1000 : 0;
        return $zakat;
    }

    public function cetak(){
        echo 'NIP Pegawai '.$this->nip;
        echo '<br>Nama Pegawai '.$this->nama;
        echo '<br>Jabatan '. $this->jabatan;
        echo '<br>Agama '.$this->agama;
        echo '<br>Status '.$this->status;
        echo '<br>Gaji Pokok Rp.'.number_format($this->setGajiPokok($this->jabatan),0,',','.');
        echo '<br>Tunjab Rp.'.number_format($this->setTunjab($this->setGajiPokok($this->jabatan)), 0, ',', '.');
        echo '<br>Tunkel Rp.'.number_format($this->setTunkel($this->setGajiPokok($this->jabatan), $this->status), 0, ',', '.');
        echo '<br>Zakat Profesi Rp.'.number_format($this->setZakatProfesi($this->setGajiPokok($this->jabatan), $this->agama), 0, ',', '.');
        echo '<hr>';

    }
}
?>