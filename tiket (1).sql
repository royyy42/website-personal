-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 29 Jan 2024 pada 02.46
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tiket`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `username` varchar(11) NOT NULL,
  `password` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `id_customer` int(11) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `phone` decimal(20,0) NOT NULL,
  `gender` text NOT NULL,
  `username` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`id_customer`, `name`, `address`, `phone`, `gender`, `username`) VALUES
(5, 'Adit Ardian', 'bangkok', 93839893, 'Laki-laki', 'adit');

-- --------------------------------------------------------

--
-- Struktur dari tabel `reserv`
--

CREATE TABLE `reserv` (
  `id_reserv` int(11) NOT NULL,
  `reserv_code` decimal(10,0) NOT NULL,
  `reserv_at` text NOT NULL,
  `reserv_date` date NOT NULL,
  `seat` decimal(10,0) NOT NULL,
  `depart` date NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `id_rute` int(11) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `reserv`
--

INSERT INTO `reserv` (`id_reserv`, `reserv_code`, `reserv_at`, `reserv_date`, `seat`, `depart`, `price`, `id_user`, `id_customer`, `id_rute`, `status`) VALUES
(5, 796824513, '', '0000-00-00', 6, '2018-03-31', 180000, 6, 5, 3, 'Selesai'),
(6, 317298645, '', '0000-00-00', 6, '2018-03-31', 180000, 6, 5, 3, 'Selesai'),
(7, 143275968, '', '0000-00-00', 6, '2018-03-31', 180000, 6, 5, 3, 'Selesai'),
(8, 475832961, '2024-01-28', '2024-01-28', 6, '2018-03-31', 180000, 6, 5, 3, 'Proses');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rute`
--

CREATE TABLE `rute` (
  `id_rute` int(11) NOT NULL,
  `depart` date NOT NULL,
  `rute_from` text NOT NULL,
  `rute_to` text NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `id_trans` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `rute`
--

INSERT INTO `rute` (`id_rute`, `depart`, `rute_from`, `rute_to`, `price`, `id_trans`) VALUES
(3, '2018-03-31', 'bangko', 'padang', 180000, 3),
(5, '2024-01-28', 'padang', 'bangko', 180000, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `trans`
--

CREATE TABLE `trans` (
  `id_trans` int(11) NOT NULL,
  `code` decimal(10,0) NOT NULL,
  `description` text NOT NULL,
  `seat` text NOT NULL,
  `id_trans_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `trans`
--

INSERT INTO `trans` (`id_trans`, `code`, `description`, `seat`, `id_trans_type`) VALUES
(1, 794285316, 'Garuda Indonesia', '21', 1),
(3, 712945638, 'sumatran', '6', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `type_trans`
--

CREATE TABLE `type_trans` (
  `id_trans_type` int(11) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `type_trans`
--

INSERT INTO `type_trans` (`id_trans_type`, `description`) VALUES
(1, 'Pesawat'),
(2, 'Kereta'),
(3, 'mobil');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `fullname` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `fullname`) VALUES
(6, 'adit', 'adit', 'Adit Ardian');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Indeks untuk tabel `reserv`
--
ALTER TABLE `reserv`
  ADD PRIMARY KEY (`id_reserv`),
  ADD KEY `id_reserv` (`id_reserv`),
  ADD KEY `id_user` (`id_user`,`id_customer`,`id_rute`),
  ADD KEY `id_customer` (`id_customer`),
  ADD KEY `id_rute` (`id_rute`);

--
-- Indeks untuk tabel `rute`
--
ALTER TABLE `rute`
  ADD PRIMARY KEY (`id_rute`),
  ADD KEY `id_rute` (`id_rute`),
  ADD KEY `id_trans` (`id_trans`);

--
-- Indeks untuk tabel `trans`
--
ALTER TABLE `trans`
  ADD PRIMARY KEY (`id_trans`),
  ADD KEY `id_trans` (`id_trans`),
  ADD KEY `id_trans_type` (`id_trans_type`);

--
-- Indeks untuk tabel `type_trans`
--
ALTER TABLE `type_trans`
  ADD PRIMARY KEY (`id_trans_type`),
  ADD KEY `id_trans_type` (`id_trans_type`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_user` (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `customer`
--
ALTER TABLE `customer`
  MODIFY `id_customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `reserv`
--
ALTER TABLE `reserv`
  MODIFY `id_reserv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `rute`
--
ALTER TABLE `rute`
  MODIFY `id_rute` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `trans`
--
ALTER TABLE `trans`
  MODIFY `id_trans` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `type_trans`
--
ALTER TABLE `type_trans`
  MODIFY `id_trans_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `reserv`
--
ALTER TABLE `reserv`
  ADD CONSTRAINT `reserv_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `reserv_ibfk_3` FOREIGN KEY (`id_rute`) REFERENCES `rute` (`id_rute`);

--
-- Ketidakleluasaan untuk tabel `rute`
--
ALTER TABLE `rute`
  ADD CONSTRAINT `rute_ibfk_1` FOREIGN KEY (`id_trans`) REFERENCES `trans` (`id_trans`);

--
-- Ketidakleluasaan untuk tabel `trans`
--
ALTER TABLE `trans`
  ADD CONSTRAINT `trans_ibfk_1` FOREIGN KEY (`id_trans_type`) REFERENCES `type_trans` (`id_trans_type`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
