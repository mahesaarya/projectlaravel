-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 02, 2018 at 09:24 PM
-- Server version: 5.5.60-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_laravelapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `absen`
--

CREATE TABLE IF NOT EXISTS `absen` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_jadwal` int(10) unsigned NOT NULL,
  `pertemuan` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `absen_id_jadwal_foreign` (`id_jadwal`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `absen`
--

INSERT INTO `absen` (`id`, `id_jadwal`, `pertemuan`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 'aktif', NULL, NULL),
(4, 5, 1, 'aktif', '2018-02-02 10:28:51', '2018-02-02 10:28:51'),
(5, 1, 3, 'aktif', '2018-02-19 21:33:25', '2018-02-19 21:33:25');

-- --------------------------------------------------------

--
-- Table structure for table `absensiswa`
--

CREATE TABLE IF NOT EXISTS `absensiswa` (
  `id_absen` int(10) unsigned NOT NULL,
  `id_siswa` int(10) unsigned NOT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`id_absen`,`id_siswa`),
  KEY `absensiswa_id_absen_index` (`id_absen`),
  KEY `absensiswa_id_siswa_index` (`id_siswa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `absensiswa`
--

INSERT INTO `absensiswa` (`id_absen`, `id_siswa`, `date`, `time`) VALUES
(2, 3, '2018-02-23', '15:15:00'),
(5, 5, '2018-02-23', '15:39:22');

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE IF NOT EXISTS `dosen` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nidn` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `nama_dosen` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') COLLATE utf8_unicode_ci NOT NULL,
  `id_kartu` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dosen_nidn_unique` (`nidn`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`id`, `nidn`, `nama_dosen`, `tanggal_lahir`, `jenis_kelamin`, `id_kartu`, `created_at`, `updated_at`) VALUES
(1, '19001', 'Budi Prasetyo S.Kom.,M.Cs.', '1970-11-15', 'L', '1001', '2018-01-22 06:28:04', '2018-01-22 06:31:30'),
(2, '19002', 'Ir Lintang Enrico M.T.', '1975-08-17', 'L', '1002', '2018-01-22 06:28:47', '2018-01-22 06:32:08'),
(3, '18001', 'Aminah Widya S.T.,M.T.', '1967-08-22', 'P', '1003', '2018-01-22 06:31:08', '2018-01-22 06:33:39'),
(4, '18002', 'Anggita Widyasari S.T.,M.Cs.,', '1967-01-12', 'P', '1004', '2018-01-22 06:34:08', '2018-01-22 06:34:08');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE IF NOT EXISTS `jadwal` (
  `id_kelas` int(10) unsigned NOT NULL,
  `hari` char(7) COLLATE utf8_unicode_ci NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `id_ruang` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_kelas`),
  KEY `jadwal_id_ruang_foreign` (`id_ruang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`id_kelas`, `hari`, `jam_mulai`, `jam_selesai`, `id_ruang`, `created_at`, `updated_at`) VALUES
(1, 'Senin', '07:00:00', '09:00:00', 1, '2018-01-23 09:32:14', '2018-01-23 09:32:14'),
(2, 'Selasa', '12:30:00', '15:00:00', 2, '2018-01-24 00:48:48', '2018-01-24 00:48:48'),
(3, 'Kamis', '12:30:00', '15:00:00', 7, '2018-01-29 00:45:54', '2018-01-29 00:45:54'),
(5, 'Senin', '07:30:00', '09:00:00', 3, '2018-02-01 00:57:50', '2018-02-01 00:57:50');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE IF NOT EXISTS `kelas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_kelas` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `id_dosen` int(10) unsigned NOT NULL,
  `id_matakuliah` int(10) unsigned NOT NULL,
  `id_semester` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kelas_id_dosen_foreign` (`id_dosen`),
  KEY `kelas_id_matakuliah_foreign` (`id_matakuliah`),
  KEY `kelas_id_semester_foreign` (`id_semester`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id`, `nama_kelas`, `id_dosen`, `id_matakuliah`, `id_semester`, `created_at`, `updated_at`) VALUES
(1, 'A', 2, 2, 1, '2018-01-23 01:18:23', '2018-01-23 01:18:23'),
(2, 'B', 2, 2, 1, '2018-01-24 00:43:23', '2018-01-24 00:43:23'),
(3, 'A', 1, 1, 1, '2018-01-24 00:45:36', '2018-01-24 00:45:36'),
(4, 'B', 1, 1, 1, '2018-01-24 00:46:08', '2018-01-24 00:46:08'),
(5, 'D', 3, 4, 1, '2018-02-01 00:57:07', '2018-02-01 00:57:07');

-- --------------------------------------------------------

--
-- Table structure for table `kelas_siswa`
--

CREATE TABLE IF NOT EXISTS `kelas_siswa` (
  `id_kelas` int(10) unsigned NOT NULL,
  `id_siswa` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_kelas`,`id_siswa`),
  KEY `kelas_siswa_id_kelas_index` (`id_kelas`),
  KEY `kelas_siswa_id_siswa_index` (`id_siswa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `kelas_siswa`
--

INSERT INTO `kelas_siswa` (`id_kelas`, `id_siswa`, `created_at`, `updated_at`) VALUES
(1, 1, '2018-01-23 01:18:23', '2018-01-23 01:18:23'),
(1, 2, '2018-01-23 01:18:23', '2018-01-23 01:18:23'),
(2, 4, '2018-01-24 00:43:23', '2018-01-24 00:43:23'),
(2, 5, '2018-01-24 00:43:23', '2018-01-24 00:43:23'),
(3, 1, '2018-01-24 00:45:36', '2018-01-24 00:45:36'),
(3, 4, '2018-01-24 00:45:36', '2018-01-24 00:45:36'),
(4, 2, '2018-01-24 00:46:08', '2018-01-24 00:46:08'),
(4, 3, '2018-01-24 00:46:08', '2018-01-24 00:46:08'),
(5, 1, '2018-02-01 00:57:07', '2018-02-01 00:57:07'),
(5, 2, '2018-02-01 00:57:07', '2018-02-01 00:57:07');

-- --------------------------------------------------------

--
-- Table structure for table `kurikulum`
--

CREATE TABLE IF NOT EXISTS `kurikulum` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_kurikulum` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `kurikulum`
--

INSERT INTO `kurikulum` (`id`, `nama_kurikulum`, `created_at`, `updated_at`) VALUES
(1, '2011', '2018-01-22 06:46:44', '2018-01-22 06:46:44');

-- --------------------------------------------------------

--
-- Table structure for table `kurikulum_matakuliah`
--

CREATE TABLE IF NOT EXISTS `kurikulum_matakuliah` (
  `id_kurikulum` int(10) unsigned NOT NULL,
  `id_matakuliah` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_kurikulum`,`id_matakuliah`),
  KEY `kurikulum_matakuliah_id_kurikulum_index` (`id_kurikulum`),
  KEY `kurikulum_matakuliah_id_matakuliah_index` (`id_matakuliah`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `kurikulum_matakuliah`
--

INSERT INTO `kurikulum_matakuliah` (`id_kurikulum`, `id_matakuliah`, `created_at`, `updated_at`) VALUES
(1, 2, '2018-01-29 17:00:00', NULL),
(1, 3, '2018-01-29 17:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `matakuliah`
--

CREATE TABLE IF NOT EXISTS `matakuliah` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kodemka` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `nama_mka` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `jumlah_sks` int(11) NOT NULL,
  `kategori` enum('W','P') COLLATE utf8_unicode_ci NOT NULL,
  `klp` enum('MPK','MKK','MKB','MPB','MBB') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matakuliah_kodemka_unique` (`kodemka`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `matakuliah`
--

INSERT INTO `matakuliah` (`id`, `kodemka`, `nama_mka`, `jumlah_sks`, `kategori`, `klp`, `created_at`, `updated_at`) VALUES
(1, '1230093', 'Jaringan Komputer', 3, 'W', 'MKB', '2018-01-22 06:41:18', '2018-01-22 06:41:18'),
(2, '123643 ', 'Pengolahan Citra', 3, 'W', 'MKB', '2018-01-22 06:42:11', '2018-01-22 06:42:11'),
(3, '123452 ', 'Grafika Komputer ', 2, 'W', 'MKB', '2018-01-24 00:41:30', '2018-01-24 00:41:30'),
(4, '1230362 ', 'Metodologi Penulisan Ilmiah ', 2, 'W', 'MKB', '2018-01-24 00:42:36', '2018-01-24 00:42:36');

-- --------------------------------------------------------

--
-- Table structure for table `matakuliah_dosen`
--

CREATE TABLE IF NOT EXISTS `matakuliah_dosen` (
  `id_dosen` int(10) unsigned NOT NULL,
  `id_mka` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_dosen`,`id_mka`),
  KEY `matakuliah_dosen_id_dosen_index` (`id_dosen`),
  KEY `matakuliah_dosen_id_mka_index` (`id_mka`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2017_09_23_150321_create_table_siswa', 1),
('2017_12_28_101828_create_table_dosen', 1),
('2018_01_04_083739_create_table_matakuliah', 1),
('2018_01_04_083815_create_table_matakuliah_dosen', 1),
('2018_01_04_140753_add_id_kartu_field_to_siswa_table', 1),
('2018_01_04_141812_add_id_kartu_field_to_dosen_table', 1),
('2018_01_05_080553_create_table_ruang', 1),
('2018_01_05_084130_create_table_semester', 1),
('2018_01_07_092636_create_table_kurikulum', 1),
('2018_01_07_093424_create_table_kurikulum_matakuliah', 1),
('2018_01_11_120440_create_table_kelas', 1),
('2018_01_11_121423_add_foreign_key_to_dosen_table', 1),
('2018_01_11_122530_add_foreign_key_to_kelas_table', 1),
('2018_01_11_150147_create_table_kelas_siswa', 1),
('2018_01_22_072937_create_table_jadwal', 1),
('2018_01_22_125400_add_id_ruang_to_jadwal', 1),
('2018_01_22_125716_add_id_semester_to_kelas', 1),
('2018_01_22_130136_add_foreign_key_to_table_jadwal', 1),
('2018_01_22_131254_add_foreign_key_to_table_kelas', 1),
('2018_01_26_035700_add_id_alat_to_ruang', 2),
('2018_01_29_073121_add_status_to_jadwal', 3),
('2018_02_02_084617_create_table_absen', 4),
('2018_02_05_094916_create_table_absenmahasiswa', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ruang`
--

CREATE TABLE IF NOT EXISTS `ruang` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_ruang` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `id_alat` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `ruang`
--

INSERT INTO `ruang` (`id`, `nama_ruang`, `id_alat`, `created_at`, `updated_at`) VALUES
(1, 'Pat-I-3A', '10911', '2018-01-22 06:42:28', '2018-01-25 21:06:34'),
(2, 'Pat-I-3B', '', '2018-01-22 06:42:44', '2018-01-22 06:42:44'),
(3, 'Pat-I-3C', '', '2018-01-22 06:42:59', '2018-01-22 06:42:59'),
(4, 'Pat-I-3D', '', '2018-01-22 06:43:09', '2018-01-22 06:43:09'),
(5, 'Pat-II-3A', '', '2018-01-22 06:43:23', '2018-01-22 06:43:23'),
(6, 'Pat-II-3B', '', '2018-01-22 06:43:33', '2018-01-22 06:43:33'),
(7, 'Pat-II-3C', '', '2018-01-22 06:43:43', '2018-01-22 06:43:43'),
(8, 'Pat-II-3D', '', '2018-01-22 06:43:52', '2018-01-22 06:43:52'),
(9, 'A1-3B', '0091', '2018-01-25 21:07:07', '2018-01-25 21:07:07');

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE IF NOT EXISTS `semester` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_semester` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `tahun_mulai` year(4) NOT NULL,
  `tahun_selesai` year(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`id`, `nama_semester`, `tahun_mulai`, `tahun_selesai`, `created_at`, `updated_at`) VALUES
(1, 'Genap', 2017, 2018, '2018-01-22 06:44:33', '2018-01-22 06:45:38'),
(2, 'Ganjil', 2017, 2018, '2018-01-22 06:46:00', '2018-01-22 06:46:00'),
(3, 'Genap', 2016, 2017, '2018-01-22 06:46:15', '2018-01-22 06:46:15'),
(4, 'Ganjil ', 2016, 2017, '2018-01-22 06:46:28', '2018-01-22 06:46:28');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE IF NOT EXISTS `siswa` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nisn` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `nama_siswa` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') COLLATE utf8_unicode_ci NOT NULL,
  `id_kartu` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `siswa_nisn_unique` (`nisn`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id`, `nisn`, `nama_siswa`, `tanggal_lahir`, `jenis_kelamin`, `id_kartu`, `created_at`, `updated_at`) VALUES
(1, '1231', 'mahesa arya kusuma', '1994-12-09', 'L', '0001', '2018-01-22 06:23:48', '2018-01-22 06:23:48'),
(2, '1232', 'david naista', '1998-09-24', 'L', '0002', '2018-01-22 06:24:24', '2018-01-22 06:24:24'),
(3, '1233', 'donny dhirgantoro', '1997-07-18', 'L', '0003', '2018-01-22 06:25:18', '2018-01-22 06:25:18'),
(4, '1234', 'alia kusuma', '1995-07-04', 'P', '0004', '2018-01-22 06:26:15', '2018-01-22 06:26:15'),
(5, '1235', 'renata amalia', '1998-12-25', 'P', '0005', '2018-01-22 06:26:56', '2018-01-22 06:26:56');

-- --------------------------------------------------------

--
-- Table structure for table `test_rfid`
--

CREATE TABLE IF NOT EXISTS `test_rfid` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `room` int(10) NOT NULL DEFAULT '0',
  `card` bigint(16) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `test_rfid`
--

INSERT INTO `test_rfid` (`id`, `date`, `time`, `room`, `card`) VALUES
(1, '2018-04-24', '20:04:10', 3, 22925519423955),
(2, '2018-04-24', '20:04:50', 3, 22925519423955),
(3, '2018-04-24', '20:05:04', 3, 22925519423955),
(4, '2018-04-24', '20:10:21', 3, 22925519423955),
(5, '2018-04-24', '20:10:39', 3, 22925519423955),
(6, '2018-04-24', '20:10:46', 3, 22925519423955);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absen`
--
ALTER TABLE `absen`
  ADD CONSTRAINT `absen_id_jadwal_foreign` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `absensiswa`
--
ALTER TABLE `absensiswa`
  ADD CONSTRAINT `absensiswa_id_absen_foreign` FOREIGN KEY (`id_absen`) REFERENCES `absen` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `absensiswa_id_siswa_foreign` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_id_kelas_foreign` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `jadwal_id_ruang_foreign` FOREIGN KEY (`id_ruang`) REFERENCES `ruang` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `kelas_id_dosen_foreign` FOREIGN KEY (`id_dosen`) REFERENCES `dosen` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kelas_id_matakuliah_foreign` FOREIGN KEY (`id_matakuliah`) REFERENCES `matakuliah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kelas_id_semester_foreign` FOREIGN KEY (`id_semester`) REFERENCES `semester` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kelas_siswa`
--
ALTER TABLE `kelas_siswa`
  ADD CONSTRAINT `kelas_siswa_id_kelas_foreign` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kelas_siswa_id_siswa_foreign` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kurikulum_matakuliah`
--
ALTER TABLE `kurikulum_matakuliah`
  ADD CONSTRAINT `kurikulum_matakuliah_id_kurikulum_foreign` FOREIGN KEY (`id_kurikulum`) REFERENCES `kurikulum` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kurikulum_matakuliah_id_matakuliah_foreign` FOREIGN KEY (`id_matakuliah`) REFERENCES `matakuliah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `matakuliah_dosen`
--
ALTER TABLE `matakuliah_dosen`
  ADD CONSTRAINT `matakuliah_dosen_id_dosen_foreign` FOREIGN KEY (`id_dosen`) REFERENCES `dosen` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `matakuliah_dosen_id_mka_foreign` FOREIGN KEY (`id_mka`) REFERENCES `matakuliah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
