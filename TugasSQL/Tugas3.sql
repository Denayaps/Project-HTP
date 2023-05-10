/* Worksheet3*/

/*Tampilkan produk yang asset nya diatas 20jt*/
MariaDB [dbtoko1]> SELECT SUM(harga_beli * stok) as total from produk; //menghitung total asset
MariaDB [dbtoko1]> SELECT * FROM produk WHERE harga_beli * stok > 20000000; ini yang betul/*
/*Tampilkan data produk beserta selisih stok dengan minimal stok*/
MariaDB [dbtoko1]> SELECT SUM(stok - min_stok) as selisih from produk;
/*Tampilkan total asset produk secara keseluruhan*/
MariaDB [dbtoko1]> SELECT sum(stok) as total_asset from produk;
/*Tampilkan data pelanggan yang lahirnya antara tahun 1999 sampai 2004*/
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE YEAR(tgl_lahir) BETWEEN 1999 AND 2004;
/*Tampilkan data pelanggan yang lahirnya tahun 1998*/
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE YEAR(tgl_lahir)=1998;
/*Tampilkan data pelanggan yang berulang tahun bulan agustus*/
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE MONTH(tgl_lahir)=08;
/*Tampilkan data pelanggan : nama, tmp_lahir, tgl_lahir dan umur (selisih tahun sekarang dikurang tahun kelahiran)*/
MariaDB [dbtoko1]> SELECT nama, tmp_lahir, tgl_lahir, (YEAR(NOW())-YEAR(tgl_lahir)) AS umur FROM pelanggan;

/*Berapa jumlah pelanggan yang tahun lahirnya 1998*/
SELECT COUNT(*) AS jumlah_pelanggan FROM pelanggan WHERE YEAR(tgl_lahir) = 1998;
/*Berapa jumlah pelanggan perempuan yang tempat lahirnya di Jakarta*/
SELECT COUNT(*) AS jumlah_pelanggan_perempuan_jakarta FROM pelanggan WHERE jk = 'Perempuan' AND tmp_lahir = 'Jakarta';
/*Berapa jumlah total stok semua produk yang harga jualnya dibawah 10rb*/
SELECT SUM(stok) AS total_stok FROM produk WHERE harga_jual < 10000;
/*Ada berapa produk yang mempunyai kode awal K*/
SELECT COUNT(*) AS jumlah_produk FROM produk WHERE kode LIKE 'K%';
/*Berapa harga jual rata-rata produk yang diatas 1jt*/
SELECT AVG(harga_jual) AS rata_rata_harga_jual FROM produk WHERE harga_jual > 1000000;
/*Tampilkan jumlah stok yang paling besar*/
SELECT MAX(stok) AS jumlah_stok_terbesar FROM produk;
/*Ada berapa produk yang stoknya kurang dari minimal stok*/
SELECT COUNT(*) AS jumlah_produk_kurang_stok FROM produk WHERE stok < main_stok;
/*Berapa total asset dari keseluruhan produk*/
SELECT SUM(harga_beli * stok) AS total_asset FROM produk;

/*Tampilkan data produk : id, nama, stok dan informasi jika stok telah sampai batas minimal atau kurang dari minimum stok dengan informasi ‘segera belanja’ jika tidak ‘stok aman’*/
	SELECT id, nama, stok,
	    CASE
	        WHEN stok <= main_stok THEN 'segera belanja'
	        ELSE 'stok aman'
	   END AS informasi_stok
FROM produk;
/*Tampilkan data pelanggan: id, nama, umur dan kategori umur : jika umur < 17 → ‘muda’ , 17-55 → ‘Dewasa’, selainnya ‘Tua’*/
SELECT id, nama, umur,
    CASE
        WHEN umur < 17 THEN 'muda'
        WHEN umur BETWEEN 17 AND 55 THEN 'Dewasa'
        ELSE 'Tua'
    END AS kategori_umur
FROM pelanggan;
/*Tampilkan data produk: id, kode, nama, dan bonus untuk kode ‘TV01’ →’DVD Player’ , ‘K001’ → ‘Rice Cooker’ selain dari diatas ‘Tidak Ada’*/
SELECT id, kode, nama,
    CASE
        WHEN kode = 'TV01' THEN 'DVD Player'
        WHEN kode = 'K001' THEN 'Rice Cooker'
        ELSE 'Tidak Ada'
    END AS bonus
FROM produk;

/*Tampilkan data statistik jumlah tempat lahir pelanggan*/
SELECT tmp_lahir, COUNT(*) AS jumlah_pelanggan FROM pelanggan GROUP BY tmp_lahir;
/*Tampilkan jumlah statistik produk berdasarkan jenis produk*/
SELECT nama, COUNT(*) AS jumlah_produk FROM produk GROUP BY nama;
/*Tampilkan data pelanggan yang usianya dibawah rata usia pelanggan*/
SELECT * FROM pelanggan WHERE tgl_lahir < (SELECT AVG(tgl_lahir) FROM pelanggan);
/*Tampilkan data produk yang harganya diatas rata-rata harga produk*/
SELECT * FROM produk WHERE harga_jual > (SELECT AVG(harga_jual) FROM produk);
/*Tampilkan data pelanggan yang memiliki kartu dimana iuran tahunan kartu diatas 90rb*/
SELECT * FROM pelanggan WHERE kartu_id IN (SELECT kartu FROM id WHERE iuran_tahunan > 90000);
/*Tampilkan statistik data produk dimana harga produknya dibawah rata-rata harga produk secara keseluruhan*/
SELECT MIN(harga_jual) AS harga_minimal, MAX(harga_jual) AS harga_maksimal, AVG(harga_jual) AS rata_rata FROM produk WHERE harga_jual < (SELECT AVG(harga_jual) FROM produk);
/*Tampilkan data pelanggan yang memiliki kartu dimana diskon kartu yang diberikan diatas 3%*/
SELECT pelanggan.* FROM pelanggan JOIN kartu ON kartu_id = kartu.id WHERE kartu.diskon > 3;


