/* Worksheet 2*/ 

/* Tampilkan seluruh data produk diurutkan berdasarkan harga_jual mulai dari yang termahal */
SELECT * FROM produk ORDER BY harga_jual DESC;

/* Tampilkan data kode, nama, tmp_lahir, tgl_lahir dari table pelanggan*/
Select kode, nama, tmp_lahir, tgl_lahir from pelanggan;

/* Tampilkan kode,nama,stok dari table produk yang stok-nya hanya 4*/
SELECT kode,nama, stok from produk WHERE stok=4;

/* Tampilkan seluruh data pelanggan yang tempat lahirnya Jakarta*/
SELECT * from pelanggan WHERE tmp_lahir='jakarta';

/* Tampilkan kode, nama, tmp_lahir, tgl_lahir dari pelanggan diurutkan dari yang paling muda usianya*/
SELECT kode, nama, tmp_lahir, tgl_lahir from pelanggan ORDER BY tgl_lahir DESC;

/*Tampilkan data produk yang stoknya 3 dan 10*/
SELECT * from produk WHERE stok=3 OR stok=10;

/*Tampilkan data produk yang harga jualnya kurang dari 5 juta tetapi lebih dari 500 ribu*/
SELECT * FROM produk WHERE harga_jual < 5000000 AND harga_jual > 500000;

/*Tampilkan data produk yang harus segera ditambah stoknya*/
SELECT * FROM produk WHERE min_stok > stok;

/*Tampilkan data pelanggan mulai dari yang paling muda*/
SELECT * FROM pelanggan ORDER BY tgl_lahir DESC;

/*Tampilkan data pelanggan yang lahirnya di Jakarta dan gendernya perempuan*/
SELECT * FROM pelanggan WHERE tmp_lahir='jakarta' AND jk='P';

/*Tampilkan data pelanggan yang ID nya 2, 4 dan 6*/
SELECT * from pelanggan WHERE id IN (2,4,6);

/*Tampilkan data produk yang harganya antara 500 ribu sampai 6 juta*/
SELECT * FROM produk WHERE harga_jual >= 500000 AND harga_jual<= 6000000;

/*Tampilkan produk yang kode awalnya huruf K dan huruf M*/
SELECT * FROM produk WHERE kode LIKE 'K%' OR kode LIKE 'M%';

/*Tampilkan produk yang kode awalnya bukan huruf M*/
SELECT * FROM produk WHERE kode NOT LIKE 'M%';

/*Tampilkan produk-produk televisi*/
SELECT * FROM produk WHERE kode LIKE '%TV01%';

/*Tampilkan pelanggan mengandung huruf 'SA'*/
SELECT * FROM pelanggan WHERE nama LIKE '%SA%';

/*Tampilkan pelanggan yang lahirnya bukan di Jakarta dan mengandung huruf ‘yo‘*/
SELECT * FROM pelanggan WHERE tmp_lahir NOT LIKE 'Jakarta' AND nama LIKE '%yo%';

/*Tampilkan pelanggan yang karakter huruf ke – 2 nya adalah A*/
SELECT * FROM pelanggan WHERE SUBSTRING(nama, 2, 1) = 'A';

/*Tampilkan 2 data produk termahal*/
SELECT *FROM produk ORDER BY harga_beli DESC LIMIT 2;

/*Tampilkan produk yang paling murah*/
SELECT * FROM produk ORDER BY harga_jual ASC LIMIT 1;

/*Tampilkan produk yang stoknya paling banyak*/
SELECT * FROM produk ORDER BY stok DESC LIMIT 1;

/*Tampilkan dua produk yang stoknya paling sedikit*/
SELECT * FROM produk ORDER BY stok ASC LIMIT 2;

/*Tampilkan pelanggan yang paling muda*/
SELECT * FROM pelanggan ORDER BY tgl_lahir ASC LIMIT 1;

/*Tampilkan pelanggan yang paling tua*/
SELECT * FROM pelanggan ORDER BY tgl_lahir DESC LIMIT 1;



