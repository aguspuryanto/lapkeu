-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.6.7-MariaDB-2ubuntu1.1 - Ubuntu 22.04
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table sdnj8236_keuangan.bank
DROP TABLE IF EXISTS `bank`;
CREATE TABLE IF NOT EXISTS `bank` (
  `bank_id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_nama` varchar(255) NOT NULL,
  `bank_nomor` varchar(255) NOT NULL,
  `bank_pemilik` varchar(255) NOT NULL,
  `bank_saldo` bigint(20) NOT NULL,
  PRIMARY KEY (`bank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table sdnj8236_keuangan.bank: ~4 rows (approximately)
DELETE FROM `bank`;
INSERT INTO `bank` (`bank_id`, `bank_nama`, `bank_nomor`, `bank_pemilik`, `bank_saldo`) VALUES
	(1, 'BRI', '71278378237', 'Yayasan LPIH Kukar', 45000000),
	(2, 'KAS TUNAI', '', 'KAS KECIL', 1800000),
	(3, 'SD LPIH', '719191010', 'Bendahara 1', 900000),
	(4, 'MTs LPIH', '81910191', 'Bendahara 2', 0);

-- Dumping structure for table sdnj8236_keuangan.hutang
DROP TABLE IF EXISTS `hutang`;
CREATE TABLE IF NOT EXISTS `hutang` (
  `hutang_id` int(11) NOT NULL AUTO_INCREMENT,
  `hutang_tanggal` date NOT NULL,
  `hutang_nominal` int(11) NOT NULL,
  `hutang_keterangan` text NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`hutang_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table sdnj8236_keuangan.hutang: ~0 rows (approximately)
DELETE FROM `hutang`;

-- Dumping structure for table sdnj8236_keuangan.kategori
DROP TABLE IF EXISTS `kategori`;
CREATE TABLE IF NOT EXISTS `kategori` (
  `kategori_id` int(11) NOT NULL AUTO_INCREMENT,
  `kategori` varchar(255) NOT NULL,
  PRIMARY KEY (`kategori_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table sdnj8236_keuangan.kategori: ~6 rows (approximately)
DELETE FROM `kategori`;
INSERT INTO `kategori` (`kategori_id`, `kategori`) VALUES
	(1, '01. LAINNYA'),
	(11, 'Dana BOS'),
	(12, 'SPP SD/MI'),
	(13, 'SPP SMP/MTs'),
	(14, 'SPP SMA/MA'),
	(16, 'Kas');

-- Dumping structure for table sdnj8236_keuangan.piutang
DROP TABLE IF EXISTS `piutang`;
CREATE TABLE IF NOT EXISTS `piutang` (
  `piutang_id` int(11) NOT NULL AUTO_INCREMENT,
  `piutang_tanggal` date NOT NULL,
  `piutang_nominal` int(11) NOT NULL,
  `piutang_keterangan` text NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`piutang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table sdnj8236_keuangan.piutang: ~0 rows (approximately)
DELETE FROM `piutang`;

-- Dumping structure for table sdnj8236_keuangan.transaksi
DROP TABLE IF EXISTS `transaksi`;
CREATE TABLE IF NOT EXISTS `transaksi` (
  `transaksi_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaksi_tanggal` date NOT NULL,
  `transaksi_jenis` enum('Pengeluaran','Pemasukan') NOT NULL,
  `transaksi_kategori` int(11) NOT NULL,
  `transaksi_nominal` int(11) NOT NULL,
  `transaksi_keterangan` text NOT NULL,
  `transaksi_foto` varchar(255) NOT NULL,
  `transaksi_bank` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`transaksi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table sdnj8236_keuangan.transaksi: ~8 rows (approximately)
DELETE FROM `transaksi`;
INSERT INTO `transaksi` (`transaksi_id`, `transaksi_tanggal`, `transaksi_jenis`, `transaksi_kategori`, `transaksi_nominal`, `transaksi_keterangan`, `transaksi_foto`, `transaksi_bank`, `user_id`) VALUES
	(7, '2022-10-13', 'Pemasukan', 11, 10000000, 'Pencairan dana BOS', '2024427534_dompet-dari-anyaman.jpg', 1, NULL),
	(8, '2022-10-07', 'Pemasukan', 12, 5000000, '', '822081321_10. PU.pdf', 1, NULL),
	(10, '2022-10-07', 'Pemasukan', 12, 150000, '', '1677357941_10. PU.pdf', 2, NULL),
	(11, '2022-10-07', 'Pemasukan', 12, 150000, '', '1934638971_bukti pajak sofa.pdf', 2, NULL),
	(12, '2022-10-13', 'Pengeluaran', 14, 100000, '67', '1675816586_Screenshot_2022-10-13-14-54-31-89_40deb401b9ffe8e1df2f1cc5ba480b12.jpg', 3, NULL),
	(13, '2022-10-13', 'Pemasukan', 12, 1000000, '', '701832274_Corona.jpg', 3, NULL),
	(14, '2022-10-17', 'Pemasukan', 16, 200000, '', '146898162_no 4 a diagram.jpg', 2, NULL),
	(15, '2022-10-21', 'Pengeluaran', 16, 100000, '', '80293443_HK.jpg', 2, NULL);

-- Dumping structure for table sdnj8236_keuangan.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_nama` varchar(100) NOT NULL,
  `user_username` varchar(100) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_foto` varchar(100) DEFAULT NULL,
  `user_level` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table sdnj8236_keuangan.user: ~5 rows (approximately)
DELETE FROM `user`;
INSERT INTO `user` (`user_id`, `user_nama`, `user_username`, `user_password`, `user_foto`, `user_level`) VALUES
	(1, 'Administrator', 'admin', '0192023a7bbd73250516f069df18b500', '1293879237_NBLSTORELOGO.jpg', 'administrator'),
	(3, 'FIRMAN', 'firman21', '7eda9a0d45d4dbfa99e06d4f402c2e67', '', 'administrator'),
	(4, 'Bendahara 1', 'bendahara1', '202cb962ac59075b964b07152d234b70', '', 'manajemen'),
	(5, 'Abed', 'bendahara5', '2f724716d49d79e1fd0d71d57d451de0', '', 'manajemen'),
	(7, 'Andre', 'Bendahara3', '62f7dec74b78ba0398e6a9f317f55126', '', 'manajemen');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
