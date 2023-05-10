-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2023 at 06:32 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbpos`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `addJenis_produk` (`nama` VARCHAR(20), `ket` VARCHAR(50))   BEGIN
INSERT INTO jenis_produk(nama,ket) VALUES(nama,ket);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addPesanan` (`tanggal` DATE, `total` DOUBLE, `pelanggan_id` INT)   BEGIN
INSERT INTO pesanan (tanggal, total, pelanggan_id) VALUES (tanggal,total,pelanggan_id);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `inputPelanggan` (`kode` VARCHAR(10), `nama` VARCHAR(45), `jk` CHAR(1), `tmp_lahir` VARCHAR(30), `tgl_lahir` DATE, `email` VARCHAR(45), `kartu_id` INT(11))   BEGIN
INSERT INTO pelanggan(kode,nama,jk,tmp_lahir,tgl_lahir,email,kartu_id) VALUES(kode,nama,jk,tmp_lahir,tgl_lahir,email,kartu_id);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `inputProduk` (`kode` VARCHAR(10), `nama` VARCHAR(45), `harga_beli` DOUBLE, `harga_jual` DOUBLE, `stok` INT(11), `main_stok` INT(11), `jenis_produk_id` INT(11))   BEGIN
INSERT INTO produk(kode,nama,harga_beli,harga_jual,stok,main_stok,jenis_produk_id) VALUES(kode,nama,harga_beli,harga_jual,stok,main_stok,jenis_produk_id); 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `showPelanggan` ()   BEGIN
SELECT nama, jk, email FROM pelanggan;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `showProduk` ()   BEGIN
SELECT nama, harga_beli, harga_jual FROM produk;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `showProduk1` ()   BEGIN
SELECT nama, harga_beli, harga_jual,stok FROM produk;
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `totalPesanan` () RETURNS INT(11)  BEGIN
DECLARE total INT;
SELECT COUNT(*) INTO total FROM pesanan;
RETURN total;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `detail_produk_vw`
-- (See below for the actual view)
--
CREATE TABLE `detail_produk_vw` (
`id` int(11)
,`kode` varchar(10)
,`nama` varchar(45)
,`harga_beli` double
,`harga_jual` double
,`stok` int(11)
,`main_stok` int(11)
,`jenis_produk_id` int(11)
,`jenis` varchar(45)
);

-- --------------------------------------------------------

--
-- Table structure for table `jenis_produk`
--

CREATE TABLE `jenis_produk` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `ket` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jenis_produk`
--

INSERT INTO `jenis_produk` (`id`, `nama`, `ket`) VALUES
(1, 'elektronik', 'tersedia'),
(2, 'makanan', 'tersedia'),
(3, 'minuman', 'tidak tersedia'),
(4, 'furnitrue', 'tersedia'),
(5, 'Alat Kebersihan', 'Tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `kartu`
--

CREATE TABLE `kartu` (
  `id` int(11) NOT NULL,
  `kode` varchar(6) DEFAULT NULL,
  `nama` varchar(30) NOT NULL,
  `diskon` double DEFAULT NULL,
  `iuran` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id` int(11) NOT NULL,
  `kode` varchar(10) DEFAULT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `jk` char(1) DEFAULT NULL,
  `tmp_lahir` varchar(30) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `kartu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id`, `kode`, `nama`, `jk`, `tmp_lahir`, `tgl_lahir`, `email`, `kartu_id`) VALUES
(1, '011101', 'Agung', 'L', 'Bandung', '1997-09-06', 'agung@gmail.com', 1),
(2, '011102', 'Pandan Wangi', 'P', 'Yogyakarta', '1998-08-07', 'pandan@gmail.com', 2),
(3, '011103', 'Sekar', 'P', 'Kediri', '2001-09-08', 'sekar@gmail.com', 1),
(4, '011104', 'Suandi', 'L', 'Kediri', '1997-09-08', 'suandi@gmail.com', 1),
(5, '011105', 'Pradana', 'L', 'Jakarta', '2001-08-01', 'pradana@gmail.com', 2),
(6, '011106', 'Gayatri', 'P', 'Jakarta', '2002-09-01', 'gayatri@gmail.com', 1),
(7, '011107', 'Denaya', 'P', 'Jambi', '1990-09-11', 'denaya@gmail.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id` int(11) NOT NULL,
  `nokuitansi` varchar(10) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `jumlah` double DEFAULT NULL,
  `ke` int(11) DEFAULT NULL,
  `pesanan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id` int(11) NOT NULL,
  `id_vendor` int(11) NOT NULL,
  `tgl_pembelian` date NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `total` double DEFAULT NULL,
  `pelanggan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`id`, `tanggal`, `total`, `pelanggan_id`) VALUES
(1, '2023-03-03', 200000, 1),
(2, '2023-02-01', 200000, 1),
(3, '2022-02-02', 30000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pesanan_items`
--

CREATE TABLE `pesanan_items` (
  `id` int(11) NOT NULL,
  `produk_id` int(11) DEFAULT NULL,
  `pesanan_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `harga` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pesanan_items`
--

INSERT INTO `pesanan_items` (`id`, `produk_id`, `pesanan_id`, `qty`, `harga`) VALUES
(1, 8, 1, 3, 6000000.00),
(2, 1, 1, 2, 30000.00),
(3, 2, 2, 2, 30000.00);

--
-- Triggers `pesanan_items`
--
DELIMITER $$
CREATE TRIGGER `keranjang_pesanan_items` BEFORE INSERT ON `pesanan_items` FOR EACH ROW BEGIN
SET @stok = (SELECT stok FROM produk WHERE id = NEW.produk_id);

SET @sisa = @stok - NEW.qty;
IF @sisa < 0 THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Warning: stok tidak cukup';
END IF;
UPDATE produk SET stok = @sisa WHERE id = NEW.produk_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `transaksi_before` BEFORE UPDATE ON `pesanan_items` FOR EACH ROW BEGIN
IF OLD.id = NEW.produk_id THEN
SET @stok = (SELECT stok FROM produk WHERE id = OLD.produk_id);
SET @sisa = (@stok - OLD.qty) - NEW.qty;
IF @sisa < 0 THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Warning: stok tidak cukup';
END IF;
UPDATE produk SET stok = @sisa WHERE id = OLD.produk_id;
ELSE
SET @stok_lama = (SELECT stok FROM produk WHERE id = OLD.produk_id);
SET @sisa_lama = (@stok - OLD.qty);
UPDATE produk SET stok = @sisa_lama WHERE id = OLD.produk_id;
SET @stok_baru = (SELECT stok FROM produk WHERE id = NEW.produk_id);
SET @sisa_baru = (@stok_baru - NEW.qty);
IF @sisa_baru < 0 THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Warning: stok tidak cukup';
END IF;
UPDATE produk SET stok = @sisa_baru WHERE id = NEW.produk_id;
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `kode` varchar(10) DEFAULT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `harga_beli` double DEFAULT NULL,
  `harga_jual` double DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `main_stok` int(11) DEFAULT NULL,
  `jenis_produk_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id`, `kode`, `nama`, `harga_beli`, `harga_jual`, `stok`, `main_stok`, `jenis_produk_id`) VALUES
(1, 'TV01', 'TV', 3000000, 4000000, 3, 2, 1),
(2, 'TV02', 'TV 21 Inch', 2000000, 5000000, NULL, 3, 1),
(3, 'K001', 'Kulkas', 4000000, 5000000, 10, 3, 1),
(4, 'M001', 'Meja Makan', 1000000, 2000000, 4, 2, 4),
(5, 'T001', 'Taro', 4000, 5000, 3, 2, 2),
(6, 'TK01', 'Teh Kotak', 3000, 4000, 2, 10, 3),
(7, 'L01', 'Lemari', 3000000, 4000000, 2, 1, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `tampil_produk`
-- (See below for the actual view)
--
CREATE TABLE `tampil_produk` (
`nama` varchar(45)
);

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `id` int(11) NOT NULL,
  `nama_vendor` varchar(255) NOT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telepon` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure for view `detail_produk_vw`
--
DROP TABLE IF EXISTS `detail_produk_vw`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detail_produk_vw`  AS SELECT `p`.`id` AS `id`, `p`.`kode` AS `kode`, `p`.`nama` AS `nama`, `p`.`harga_beli` AS `harga_beli`, `p`.`harga_jual` AS `harga_jual`, `p`.`stok` AS `stok`, `p`.`main_stok` AS `main_stok`, `p`.`jenis_produk_id` AS `jenis_produk_id`, `j`.`nama` AS `jenis` FROM (`jenis_produk` `j` join `produk` `p` on(`p`.`jenis_produk_id` = `j`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `tampil_produk`
--
DROP TABLE IF EXISTS `tampil_produk`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tampil_produk`  AS SELECT `produk`.`nama` AS `nama` FROM `produk` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jenis_produk`
--
ALTER TABLE `jenis_produk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kartu`
--
ALTER TABLE `kartu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode` (`kode`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode` (`kode`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nokuitansi` (`nokuitansi`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pesanan_items`
--
ALTER TABLE `pesanan_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_kode` (`kode`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jenis_produk`
--
ALTER TABLE `jenis_produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kartu`
--
ALTER TABLE `kartu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pesanan_items`
--
ALTER TABLE `pesanan_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
