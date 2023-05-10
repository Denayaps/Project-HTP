<?php
abstract class Bentuk2D {
    abstract public function luasBidang();
    abstract public function kelilingBidang();
}
class Lingkaran extends Bentuk2D {
    public $jari2;
    public function luasBidang() {
        return $this->jari2 ** 2;
    }
    public function kelilingBidang() {
        return 2 * 3.14 * $this->jari2;
    }
    public function namaBidang() {
        return "Lingkaran";
    } 
}
class PersegiPanjang extends Bentuk2D {
    public $panjang;
    public $lebar;
    public function luasBidang() {
        return $this->panjang * $this->lebar;
    }
    public function kelilingBidang() {
        return 2 * ($this->panjang + $this->lebar);
    }
    public function namaBidang() {
        return "Persegi Panjang";
    } 
}
class Segitiga extends Bentuk2D {
    public $alas;
    public $tinggi;
    public function luasBidang() {
        return $this->alas * $this->tinggi / 2;
    }
    public function kelilingBidang() {
        return 3 * ($this->alas);
    }
    public function namaBidang() {
        return "Segitiga";
    } 
}
?>

