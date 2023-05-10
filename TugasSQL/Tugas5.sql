/*Buat fungsi inputPelanggan(), setelah itu panggil fungsinya*/

SELECT * FROM pelanggan;
COMMIT;
DELIMITER $$
SELECT * FROM pelanggan;
$$
CREATE PROCEDURE inputPelanggan(kode varchar(10), nama varchar(45), jk char(1), tmp_lahir varchar(30), tgl_lahir date, email varchar(45), kartu_id int(11))
    -> BEGIN
    -> INSERT INTO pelanggan(kode,nama,jk,tmp_lahir,tgl_lahir,email,kartu_id) VALUES(kode,nama,jk,tmp_lahir,tgl_lahir,email,kartu_id);
    -> END$$
DELIMITER ;
CALL inputPelanggan('011107','Denaya','P','Jambi','1990-09-11','denaya@gmail.com',1);
SELECT * FROM pelanggan;


/*Buat fungsi showPelanggan(), setelah itu panggil fungsinya*/

SELECT * FROM pelanggan;
COMMIT;
DELIMITER $$
SELECT * FROM pelanggan;
$$
CREATE PROCEDURE showPelanggan()
    -> BEGIN
    -> SELECT nama, jk, email FROM pelanggan;
    -> END$$
DELIMITER ;
CALL showPelanggan();

-- Buat fungsi inputProduk(), setelah itu panggil fungsinya
SELECT * FROM produk;
COMMIT;
DELIMITER $$
SELECT * FROM produk;
$$
CREATE PROCEDURE inputProduk(kode varchar(10), nama varchar(45), harga_beli double, harga_jual double, stok int(11), main_stok int(11), jenis_produk_id int(11))
    -> BEGIN
    -> INSERT INTO produk(kode,nama,harga_beli,harga_jual,stok,main_stok,jenis_produk_id) VALUES(kode,nama,harga_beli,harga_jual,stok,main_stok,jenis_produk_id);
    -> END$$
DELIMITER ;
CALL inputProduk('L01','Lemari','3000000','4000000','2','1',1);
SELECT * FROM produk;

-- Buat fungsi showProduk(), setelah itu panggil fungsinya
SELECT * FROM produk;
COMMIT;
DELIMITER $$
SELECT * FROM produk;
$$
CREATE PROCEDURE showproduk()
    -> BEGIN
    -> SELECT nama, harga_beli, harga_jual FROM produk;
    -> END$$
DELIMITER ;
CALL showproduk();
-- Buat fungsi totalPesanan(), setelah itu panggil fungsinya
CREATE FUNCTION totalPesanan()
    -> RETURNS INT
    -> BEGIN
    -> DECLARE total INT;
    -> SELECT COUNT(*) INTO total FROM pesanan;
    -> RETURN total;
    -> END$$
SELECT totalPesanan();
    -> $$

SELECT p.pesanan_id, p.tanggal, pl.nama AS pelanggan_nama, p.total
FROM pesanan p
JOIN pelanggan pl ON p.pelanggan_id = pl.pelanggan_id;

CREATE VIEW pesanan_produk_vw AS
SELECT p.pesanan_id, p.tanggal, pl.nama AS pelanggan_nama, pr.nama AS produk_nama, pr.harga
FROM pesanan p
JOIN pelanggan pl ON p.pelanggan_id = pl.pelanggan_id
JOIN produk pr ON p.produk_id = pr.produk_id;

SELECT * FROM pesanan_produk_vw;