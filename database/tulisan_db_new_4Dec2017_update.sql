-- phpMyAdmin SQL Dump
-- version 4.7.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 03 Des 2017 pada 18.52
-- Versi server: 5.5.42
-- Versi PHP: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tulisan_db_new`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cms_blog`
--

CREATE TABLE `cms_blog` (
  `idData` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `subtitle` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `photoBy` varchar(100) NOT NULL,
  `pictures` text NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `cms_blog`
--

INSERT INTO `cms_blog` (`idData`, `title`, `date`, `subtitle`, `description`, `photoBy`, `pictures`, `createdBy`, `createdDate`, `changedBy`, `changedDate`) VALUES
(2, 'DOTTY OUTFIT', '25TH FEBRUARY 2014', 'LOCATION: NEW YORK', 'PHNwYW4gc3R5bGU9ImZvbnQtd2VpZ2h0OiBib2xkOyB0ZXh0LWFsaWduOiBqdXN0aWZ5OyI+QWx3YXlzIG9wdGluZyBmb3IgYSBiZWF1dGlmdWwgdHdvIHBpZWNlLCBvciBldmVuIGJldHRlciwgdGhyZWUgcGllY2UgZW5zZW1ibGUgaXMgc3VjaCBhbiBlYXN5IGFuZCBwb2xpc2hlZCB3YXkgb2YgZHJlc3NpbmcuIEluIHRoaXNjYXNlLCBJIGRlY2lkZWQgdG8gbGF5ZXIgZG90cyBvbiBkb3RzIG9uIGRvdHMgb24gbXkgbmV3IGZhdm91cml0ZSBkb3R0eSBiYWcuIEkgc3RpbGwgcmVtZW1iZXIgaG93IEkgZmVsdCB0aGUgZGF5IHdlIHNob3QgdGhlc2UgcGhvdG9zLlRoZSB0aW5pZXN0IHNsaXRoZXIgb2Ygc2lsdmVyIGxpZ2h0IGVzY2FwZWQgZnJvbSBiZXR3ZWVuIHRoZSBncmV5IHNoZWV0IG9mIGNsb3VkcyBhYm92ZSBhbmQgc3BpbGxlZCBvbnRvIHRoZSBjb25jcmV0ZSBwYXZlbWVudCBiZWxvdy5Gb3Igc29tZW9uZSB3aG8gaGFkbuKAmXQgc2VlbiBzdW4gaW4gdHdvIHdlZWtzIGl0IG1hZGUgZXZlcnl0aGluZyBpbGx1bWluYXRlIHdpdGggYSBzb2Z0IHNpbHZlciBnbG93IHRlbiB0aW1lcyBtb3JlIHRoYW4gdXN1YWwuIEl0d2FzIG5pY2UgdG8gZmluYWxseSB3aXRuZXNzIE5ldyBZb3JrIGluIHRoZSBzaGltbWVyaW5nIGxpZ2h0IEkgaGFkIGJlZW4gdmlzdWFsaXNpbmcgaXQgaW4gZXZlciBzaW5jZSBJIGxlZnQgYmFjayBpbiBTZXB0ZW1iZXIsIHBlcmNoZWRoaWdoIG9uIGl0cyBzbWl0dGVuIHBlZGVzdGFsIGFjY29tcGFuaWVkIGJ5IGJpZ2dlciBhbmQgYmV0dGVyIGV4cGVjdGF0aW9ucy4gTHVja2lseSwgTmV3IFlvcmsgYWx3YXlzIGRlbGl2ZXJzPC9zcGFuPjxicj4=', 'Carin Olsson', 'blogs_2(1).jpg,blogs_2(2).jpg,blogs_2(3).jpg', 'SESSION_TEST', '2017-10-23 17:05:25', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cms_chatter`
--

CREATE TABLE `cms_chatter` (
  `idData` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `date` varchar(100) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `cms_chatter`
--

INSERT INTO `cms_chatter` (`idData`, `title`, `description`, `date`, `picture`, `createdBy`, `createdDate`, `changedBy`, `changedDate`) VALUES
(1, 'In Style', '', 'December 2011', 'chatters_1_20171203064916pm.jpg', 'megan@syncard.com', '2017-12-04 00:49:16', NULL, NULL),
(2, 'Nylon', '', 'Februery 2012', 'chatters_2_20171203065009pm.jpg', 'megan@syncard.com', '2017-12-04 00:50:09', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cms_home`
--

CREATE TABLE `cms_home` (
  `idData` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `cms_home`
--

INSERT INTO `cms_home` (`idData`, `title`, `description`, `picture`, `createdBy`, `createdDate`, `changedBy`, `changedDate`) VALUES
(4, 'EMPROWERING OTHERS', 'We are dedicated to enriching our community by investing our time in training and employing local artisansand talents with an aim to provide them a fair living with benefits that exceed market standards.', 'home_4.jpg', 'SESSION_TEST', '2017-10-23 15:17:10', 'SESSION_TEST', '2017-10-23 15:20:51'),
(5, 'CELEBRATING INDIVIDUALITY', 'We design our products to be simple and pure, then layer them with artist-illustrated editions to celebrate individuality. Each creation is constructed by hand in small batches, with artisanal craftsmanship.', 'home_5.jpg', 'SESSION_TEST', '2017-10-23 15:17:58', NULL, NULL),
(6, 'CARING FOR OUR WORLD', 'We strive to improve the quality of our work by being responsive of our surroundings and by using sustainable design principles to foster a healthier environment.', 'home_6.jpg', 'SESSION_TEST', '2017-10-23 15:18:36', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cms_story`
--

CREATE TABLE `cms_story` (
  `idData` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `subtitle` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `author` varchar(100) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `cms_story`
--

INSERT INTO `cms_story` (`idData`, `title`, `subtitle`, `description`, `author`, `picture`, `createdBy`, `createdDate`, `changedBy`, `changedDate`) VALUES
(3, 'PEPE AND THE FLYING BALLOON', 'The little girl gave Pepe a big hug and said \"I have been endlessly chasing the horizon running away from monsters that keep haunting me \"', 'PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMzQsIDM0LCAzNCk7IGZvbnQtZmFtaWx5OiBNZW5sbywgbW9ub3NwYWNlOyBmb250LXNpemU6IDExcHg7IHdoaXRlLXNwYWNlOiBwcmUtd3JhcDsiPk9uY2UgdXBvbiBhIHRpbWUsIHRoZXJlIHdlcmUgdHdvIG1pY2UgdGhhdCBsaXZlZCBhbiBhZHZlbnR1cm91cyBsaWZlIGluIHRoZSBoZWFydCBvZiBKYWthcnRhLiBIaXJvIGFuZCBoaXMgd2lmZSwgU3VyLCB3ZXJlIGEgaGFyZC13b3JraW5nIGFuZCBjb3VyYWdlb3VzIGR1by4gRXZlbiB0aG91Z2ggdGhleSB3ZXJlIHRpbnkgY3JlYXR1cmVzLCB0aGVpciBoZWFydHMgd2VyZSBzZXQgb24gcmVzY3VpbmcgYWJhbmRvbmVkIGNoaWxkcmVuIHdobyBsaXZlZCBvbiB0aGUgc3RyZWV0cy4gU29tZXRpbWVzIHRoZXkgc2xlcHQgdW5kZXIgdGhlIHJvb2Z0b3BzIG9mIGJpZyBob3VzZXMsIHdoZXJlIHRoZXkgY291bGQgc3RlYWwgc29tZSBmb29kIGZvciB0aGVzZSBjaGlsZHJlbi4gT3RoZXIgdGltZXMgdGhleSBzcGVudCB0aGUgbmlnaHQgaW4gYSBjbG90aGluZyBmYWN0b3J5LCB3aGVyZSBTdXIgd291bGQgc2V3IGxpdHRsZSBzY2FydmVzIGZyb20gbGVmdG92ZXIgbWF0ZXJpYWxzLiBCdXQgdGhleSBzcGVudCBtb3N0IG9mIHRoZWlyIHRpbWUgdW5kZXIgYSBicmlkZ2UgYXQgdGhlIHZpbnRhZ2UgdHJhaW4gc3RhdGlvbiBpbiBLb3RhIC0gdGhlIG9sZCB0b3duIC0gd2hlcmUgYWJvdXQgdHdlbnR5IHRvIHRoaXJ0eSBuZWdsZWN0ZWQga2lkcyBzb3VnaHQgc2hlbHRlciBlYWNoIG5pZ2h0LiBUaGUgb2xkIGJyaWRnZSBoYWQgYSBuYXN0eSBhbmQgZGFtcCBhdG1vc3BoZXJlLCBidXQgaXQgd2FzIGhlcmUgdGhhdCBIaXJvIGFuZCBTdXIgZmVsdCB0aGV5IHdlcmUgbmVlZGVkIG1vc3QuIEFzIHRoZSBjaGlsZHJlbiBzbGVwdCwgSGlybyB3b3VsZCBjYXJlZnVsbHkgd3JhcCB0aGVpciBuZWNrcyB3aXRoIHRoZSBzY2FydmVzIHRoYXQgU3VyIG1hZGUgYW5kIGdlbnRseSBwbGFjZSBmb29kIG5leHQgdG8gdGhlbS4gTm9uZSBvZiB0aGUga2lkcyBldmVyIGZvdW5kIG91dCB3aG8gdGhlaXIgc2VjcmV0IGd1YXJkaWFucyB0cnVseSB3ZXJlLiANCiANCk1hbnkgbmFtZWxlc3MgY2hpbGRyZW4gd2l0aCBteXN0ZXJpb3VzIHN0b3JpZXMgY2FtZSB0byB0aGlzIGRhcmsgY29ybmVyLiBBZnRlciBhIHdoaWxlLCBzb21lIHdvdWxkIGxlYXZlIHRvIHNlZWsgc2hlbHRlciBlbHNld2hlcmUsIHdoaWxlIG90aGVycyBzdWZmZXJlZCB0cmFnaWMgZW5kcy4gT25lIGRheSwgYSBjaGlsZCB3aXRoIGEgc2hhdmVkIGhlYWQgbGltcGVkIGludG8gdGhpcyBwbGFjZS4gVGhlIGNoaWxk4oCZcyBkYXJrLCB0aGluLCBhbmQgZmxhdCBjaGVzdCBzdWdnZXN0ZWQgdGhhdCBpdCB3YXMgYSBib3kuIFlldCwgc3RhcnJpbmcgZGVlcGx5IGludG8gdGhlIHlvdW5nIHZpc2l0b3LigJlzIGxhcmdlIGFsbW9uZCBleWVzLCBTdXIga25ldyB0aGlzIHBvb3Igc291bCB3YXMgYSBsaXR0bGUgZ2lybC4gSGVyIGV4cHJlc3Npb24gY29udmV5ZWQgYSBtaXggb2YgcmFnZSwgZmVhciwgbG9uZ2luZywgYW5kIHNvcnJvdzsgYnV0IGhlciBleWVzIGhlbGQgdGhlIGJ1cm5pbmcgZmxhbWUgb2YgU3Jpa2FuZGkncyAodGhlIGFuY2llbnQgSmF2YW5lc2Ugd2FycmlvciBnb2RkZXNzKSBzcGlyaXQuIEFjdGluZyBsaWtlIGFuIGFuZ3J5IGJveSB3YXMgaGVyIG1lYW5zIG9mIHN1cnZpdmluZyB0aGUgYWJ1c2UgYW5kIHZpb2xlbmNlIG9mIHRoZSBzdHJlZXRzLiBOb3cgaXQgc2VlbWVkIGFzIGlmIHNoZSBoYWQgYmVlbiBydW5uaW5nIGZvciBob3VycyBmcm9tIHNvbWV0aGluZy4gSGVyIGxpcHMgd2VyZSBwYWxlIGFuZCBjb2xkLiBIZXIgYm9keSB3YXMgc2hha2luZyBmcm9tIGV4aGF1c3Rpb24uIFNoZSBrbmVsdCB0byB0aGUgZ3JvdW5kIGFuZCBmZWxsIGludG8gYSBkZWVwIHNsZWVwIGluc2lkZSBhIHRvcm4gcGFja2luZyBib3ggdGhhdCBIaXJvIGhhZCBwcm9jdXJlZCBmcm9tIHRoZSBmYWN0b3J5LiBFdmVuIGFzIHRoZSBsaXR0bGUgZ2lybCBzbGVwdCwgdGhlcmUgd2FzIGludGVuc2l0eSBvbiBoZXIgZmFjZSwgYW5kIFN1ciBmZWxsIGluIGxvdmUgd2l0aCB0aGUgZ2lybCdzIGZpZ2h0aW5nIHNwaXJpdC4gDQogDQpTdXIgc2F0IGRvd24gbmV4dCB0byBoZXIgYW5kIHN0YXJ0ZWQgdG8gc2V3IGEgdGlueSBkb2xsIHdoaWxlIGh1bW1pbmcgYW4gZW5jaGFudGluZyBsdWxsYWJ5LiBUaGlzIGxvdmluZyBtb3VzZSBoYWQgYSBtaXJhY3Vsb3VzIHBvd2VyIHdoZW4gc2hlIHNld2VkLiBFdmVyeSBzdGl0Y2ggc2hlIG1hZGUgd2FzIHBlcmZvcm1lZCB3aXRoIGEgc29sZW1uIHdpc2ggZm9yIHRoZSBjaGlsZC4gQXMgc2hlIGNvbXBsZXRlZCB0aGUgZG9sbCwgYSBzdGFyIHNob3QgYWNyb3NzIHRoZSBkZWVwIGJsdWUgc2t5IGFib3ZlIHRoZW0uIEl0IGJyb2tlIGludG8gdGlueSBmaXJlZmxpZXMgd2hpY2ggZW52ZWxvcGVkIHRoZSB3aXNoZnVsIGRvbGwgaW4gYSB3YXJtIGdsb3cgYW5kIGJsZXNzZWQgaXQgd2l0aCBhIHNtaWxlLiBTdXIgbmFtZWQgdGhpcyBkb2xsIOKAnFBlcGXigJ0gYWZ0ZXIgdGhlIGxhYmVsIHByaW50ZWQgb24gdGhlIGJveCB3aGVyZSB0aGUgbGl0dGxlIGdpcmwgc2xlcHQuIFdoZW4gc2hlIGdpbmdlcmx5IHBsYWNlZCB0aGUgZG9sbCBpbiB0aGUgY2hpbGQncyBlbWJyYWNlLCBhbiBhaXIgb2Ygam95IGZpbGxlZCB0aGUgZ2lybCdzIGZhY2UsIGFzIGlmIHNoZSBoYWQganVzdCBlbnRlcmVkIGEgbWFnbmlmaWNlbnQgZHJlYW0uIFRoZSBjbHVzdGVyIG9mIGZpcmVmbGllcyB0d2lua2xlZCBhYm92ZSB0aGlzIGdpcmwgYW5kIGxpdCBhbiBpbWFnZSBvZiB3aGF0IHNlZW1lZCB0byBiZSBoZXIgZHJlYW0uIA0KSW4gaGVyIGRyZWFtLCB0aGlzIGxpdHRsZSBnaXJsIGZvdW5kIGhlcnNlbGYgcnVubmluZyB0aHJvdWdoIGEgbXlzdGljYWwgZm9yZXN0LiBTaGUgd2FzIHdlYXJpbmcgYSBsb25nIGNvdHRvbiBkcmVzcyB3aXRoIGh1Z2UgQm91Z2FpbnZpbGxlYSBmbG93ZXJzIHBhaW50ZWQgb24gaXQuIFRoZXJlLCBzaGUgbWV0IFBlcGUgLSBhIHNwYXJrbGluZyBhbmQgd2l0dHkgZG9sbCB3aXRoIGEgd2FybSBodW1hbiBoZWFydC4gUGVwZSBsb3ZlZCBqYXp6IGFuZCBwbGF5ZWQgaGlzIHRydW1wZXQgbGlrZSBhbnkgb3RoZXIgY3JhenkgbXVzaWNpYW4uIFRoZSBtdXNpYyBoZSBwbGF5ZWQgY2FzdCBhIHNwZWxsIHRoYXQgY291bGQgdHVybiBzb21lIGRyZWFtcyBpbnRvIHJlYWxpdHkuIEhlIGxpc3RlbmVkIHRvIGhlciBzdG9yaWVzIGFuZCBtYWRlIGhlciBsYXVnaDsgc29tZXRoaW5nIHRoYXQgc2hlIGhhZCBub3QgZG9uZSBmb3IgYSBsb25nIHRpbWUuIA0KIA0KVGhlIGxpdHRsZSBnaXJsIGdhdmUgUGVwZSBhIGJpZyBodWcgYW5kIHNhaWQsIOKAnEkgaGF2ZSBiZWVuIGVuZGxlc3NseSBjaGFzaW5nIHRoZSBob3Jpem9uLCBydW5uaW5nIGF3YXkgZnJvbSBtb25zdGVycyB0aGF0IGtlZXAgaGF1bnRpbmcgbWUuIERlc3RpbnkgaGFzIGJyb3VnaHQgbWUgdG8geW91LCBzbyB0aGF0IGZvciBhIGZldyBtaW51dGVzIG9mIG15IGxpZmUgSSBjb3VsZCBleHBlcmllbmNlIHdhcm10aCBhbmQgdGVuZGVybmVzcy4gUGxlYXNlIHRha2UgbWUgYXdheSBmcm9tIHRoaXMgZGFyayBwbGFjZSBzbyBJIGNhbiBzdG9wIHJ1bm5pbmcuIEkgd2lzaCB0byBmbHkgYW5kIGJlIGluIGEgd29ybGQgd2hlcmUgSSBjYW4gc3RvcCBwcmV0ZW5kaW5nIHRvIGJlIHNvbWV0aGluZyBJ4oCZbSBub3QgYW5kIGNhbiBiZSBteSB0cnVlIHNlbGYuIA0KIA0KUGVwZSBoZWxkIGhlciBoYW5kIGFuZCBsb29rZWQgaW50byBoZXIgdGVhcnkgZXllcy4gQXMgaGUgd2hpc3RsZWQgYSBtZWxhbmNob2xpYyBtZWxvZHksIGEgc3RyaXBlZCBiYWxsb29uIG1hZ2ljYWxseSBhcHBlYXJlZC4gU2hlIGNsaW1iZWQgdXAgYW5kIHNhdCBvbiB0b3Agb2YgaXQgYXMgaXQgc2xvd2x5IHJvc2UgdG8gdGhlIHNreS4gV2l0aCBhIHNtYWxsIGtpdGUgdG8gbmF2aWdhdGUgdGhlIGJhbGxvb24sIHRoZXkgZm9sbG93ZWQgdGhlIHdpbmQgd2hpY2ggY2FycmllZCB0aGVtIGZyb20gdGhlIGRhcmsgZm9yZXN0LCBvdmVyIHRoZSBtb3VudGFpbnMsIGFib3ZlIHRoZSBjaXRpZXPigJkgc2t5c2NyYXBlcnMsIGFuZCB0aHJvdWdoIHRoZSBjbG91ZHMuIEZyb20gdXAgYWJvdmUsIHNoZSBzYXcgcGVvcGxlIGxpdmluZyBkaWZmZXJlbnQgbGl2ZXMuIFNvbWUgZW5qb3llZCBtb3JlIGZvcnR1bmF0ZSBtb21lbnRzLCB3aGlsZSBvdGhlcnMgaGFkIHRvIGZhY2UgYSBtb3JlIGNoYWxsZW5naW5nIGZhdGUgdGhhbiBoZXJzLiBTaGUgZm91bmQgdGhhdCBzaGUgY291bGQgcGFpbnQgaGVyIGxpZmUgd2l0aCBhbnkgY29sb3JzIHNoZSB3aXNoZWQgYW5kIGRyYXcgaGVyIG93biBob3Jpem9ucyB3aXRob3V0IGhhdmluZyB0byByZWFjaCBvdXQgZm9yIHRoZW0uIFNvcnJvdyBhbmQgbW9uc3RlcnMgZXhpc3RlZCBvbmx5IGluIGhlciBtaW5kLCBub3QgaW4gaGVyIHJlYWxpdHkuIEl0IGFsbCBkZXBlbmRlZCBvbiBob3cgc2hlIGxvb2tlZCBhdCB0aGVtLiBBbmQgbm93IHdpdGggdGhpcyBuZXcgcGVyc3BlY3RpdmUsIHNoZSBmZWx0IGJldHRlci4gDQogDQpTaGUgd2FzIG9uIHRoZSB0b3Agb2YgaGVyIHVuaXZlcnNlIHdoZW4gUGVwZSBnYXZlIGhlciBhIHN1ZGRlbiBraXNzIG9uIHRoZSBjaGVlaywgZmxldyBhd2F5LCBhbmQgZGlzYXBwZWFyZWQgYmVoaW5kIHRoZSBtb29uLiBIZXIgZnVubnkgdmFsZW50aW5lIHdhcyBub3doZXJlIHRvIGJlIHNlZW4uIFRoZSBiYWxsb29uIGRyaWZ0ZWQgZG93biBhdCBhIHNwZWVkIHNoZSBjb3VsZCBub3QgY29udHJvbCwgaGVyIGJyZWF0aCBiZWNhbWUgdGhpbiwgYW5kIHRoZSB3b3JsZCB3YXMgYWdhaW4gYSBmZWFyZnVsIHBsYWNlLiBTaGUgc3VtbW9uZWQgdGhlIHJlbWFpbmluZyBjb3VyYWdlIHRoYXQgc2hlIGhhZCwgdG9vayBhIGRlZXAgYnJlYXRoLCBhbmQgc2xpZCBhd2F5IGZyb20gdGhlIHRvcCBvZiB0aGUgYmFsbG9vbi4gSGVyIHdoaXRlIGNvdHRvbiBkcmVzcyBzZXJ2ZWQgYXMgYSBwYXJhY2h1dGUgc3VjaCB0aGF0IHNoZSBjb3VsZCBsYW5kIGdyYWNlZnVsbHkuIEFzIHNoZSB0b3VjaGVkIHRoZSBncm91bmQsIHRoZSBsaXR0bGUgZ2lybCB3b2tlIHVwIGFuZCBmb3VuZCBoZXJzZWxmIHdpdGggdGhlIGxpdHRsZSBQZXBlIGRvbGwgbmVzdGxlZCBpbiBoZXIgZW1icmFjZS48L3NwYW4+PGJyPg==', 'Melisa Sanjaya', 'stories_3.png', 'SESSION_TEST', '2017-10-23 16:10:18', 'SESSION_TEST', '2017-11-19 13:42:10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cms_story_artwork`
--

CREATE TABLE `cms_story_artwork` (
  `idData` int(11) NOT NULL,
  `idStory` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `cms_story_artwork`
--

INSERT INTO `cms_story_artwork` (`idData`, `idStory`, `name`, `createdBy`, `createdDate`, `changedBy`, `changedDate`) VALUES
(1, 3, 'Art 2', 'SESSION_TEST', '2017-11-19 14:23:04', 'SESSION_TEST', '2017-11-19 14:33:19'),
(2, 3, 'rt', 'SESSION_TEST', '2017-11-19 19:31:45', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cms_video`
--

CREATE TABLE `cms_video` (
  `idData` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `fileName` varchar(100) NOT NULL,
  `fileSize` varchar(10) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `cms_video`
--

INSERT INTO `cms_video` (`idData`, `title`, `description`, `fileName`, `fileSize`, `createdBy`, `createdDate`, `changedBy`, `changedDate`) VALUES
(4, 'Finding Unconditional Love', 'DQoNCg0KDQoNCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+DQpwLnAxIHttYXJnaW46IDAuMHB4IDAuMHB4IDAuMHB4IDAuMHB4OyBmb250OiAxMi4wcHggJ0hlbHZldGljYSBOZXVlJzsgY29sb3I6ICM0NTQ1NDV9DQo8L3N0eWxlPg0KDQoNCjxwIGNsYXNzPSJwMSI+VGhlIFNvdW5kIG9mIERhd27igJksIGFuIGFydCBwcm9qZWN0IGJ5IG11bHRpLWRpbWVuc2lvbmFsIGFydGlzdCBNZWxpc3NhIFN1bmpheWEsIGV4YW1pbmVzIHRoZSBjb25jZXB0IG9mIHNlbGYtbG92ZS4gVGhpcyBzZW5zdWFsIHByb3NlIGlzIGFib3V0IGEgc3Bpcml0dWFsIGF3YWtlbmluZyB0byBkaXNjb3ZlciBibGlzcyBhbmQgaGFwcGluZXNzIHdpdGhpbiBvdXJzZWx2ZXMuIE9ubHkgdGhyb3VnaCBhIGNvbW1pdG1lbnQgb2YgbG92aW5nIG91cnNlbHZlcyB3aG9sZWhlYXJ0ZWRseSwgd2UgY2FuIGJlZ2luIHRvIGxvdmUgb3RoZXJzIHVuY29uZGl0aW9uYWxseS48L3A+DQo8cCBjbGFzcz0icDEiPldlIHJlY2VudGx5IHNhdCBkb3duIHdpdGggZGVzaWduZXIgWmhpanVuIFdhbmcgdG8gZGlzY3VzcyBoaXMgcHJvamVjdCB0aGF0IHR1cm5zIGh5cGVkIHNuZWFrZXJzIGludG8gd2VhcmFibGUgZmFjZSBtYXNrcy4gVGhlIEJlaWppbmctYmFzZWQgY3JlYXRpdmUgc3RhcnRlZCBoaXMgZmFjZSBtYXNrIHByb2plY3QgdG8gY29tbWVudCBvbiB0aGUgcG9sbHV0aW9uIGluIGhpcyBjaXR5LCB3aGVyZSBjaXRpemVucyBhcmUgYmF0dGxpbmcgZXh0cmVtZSBhaXIgcG9sbHV0aW9uLiBVbmRlcnN0YW5kYWJseSwgV2FuZ+KAmXMgbWFzayBwcm9qZWN0cyBoYXZlIGJlZW4gbWV0IHdpdGggbWl4ZWQgcmVzcG9uc2VzIGFuZCBoYXZlIGNyZWF0ZWQgcXVpdGUgYSBidXp6IG9uIHRoZSBpbnRlcm5ldC4gSW4gb3VyIHRhbGsgd2l0aCBXYW5nIGhlIG5vdGVzIHRoYXQgaGUgb25seSB3aXNoZXMgdG8gbWFrZSBpbnRlcmVzdGluZyBpdGVtcyB0aGF0IG5vIG9uZSBoYXMgbWFkZSBiZWZvcmUgYW5kIHRoYXQgaGUgaGFzIG5vIGludGVyZXN0IGluIHNlbGxpbmcgaGlzIG1hc2tzLiBBZGRpdGlvbmFsbHksIHdlIGdhdmUgYSBwYWlyIG9mIG91ciBIWVBFQkVBU1QgMjB0aCBhbm5pdmVyc2FyeSBOZXcgQmFsYW5jZSA1ODAg4oCcRWFydGjigJ0gc25lYWtlcnMgdG8gV2FuZyB0byBiZSBtYWRlIGludG8gb25lIG9mIGhpcyBzaWduYXR1cmUgZmFjZSBtYXNrcy48L3A+', '9uHbDLJgxwQ', '10221416', 'SESSION_TEST', '2017-10-23 18:33:00', 'SESSION_TEST', '2017-11-16 16:30:58'),
(5, 'Melisa Sunjaya | Tulisan: Jangan Pernah Takut!', 'PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMTcsIDE3LCAxNyk7IGZvbnQtZmFtaWx5OiBSb2JvdG8sIEFyaWFsLCBzYW5zLXNlcmlmOyB3aGl0ZS1zcGFjZTogcHJlLXdyYXA7Ij5NZWxpc2EgU3VuamF5YSwgbWVuZ2Vrc3ByZXNpa2FuIHNlbXVhIHBlcmFzYWFubnlhIGxld2F0IGthcnlhLWthcnlhbnlhIHlhbmcgZWtza2x1c2lmIGRhbiByYW1haCBsaW5na3VuZ2FuLiANCg0KSWRlYUZlc3QgbWVydXBha2FuIGdlcmFrYW4ga3JlYXRpZiB1bnR1ayBtZW5jaXB0YWthbiBha3NpIG55YXRhLiBCZXJzYW1hIGRlbmdhbiBwYXJhIHRva29oIGR1bmlhIHNlcGVydGkgU3RlZmFuIFNhZ21laXN0ZXIsIEJhc3VraSBQdXJuYW1hLCBBbmllcyBCYXN3ZWRhbiwgZGFuIFBldGVyIEdvbnRoYSwgSWRlYUZlc3QgdGVsYWggYmVyYmFnaSBpZGUsIGluc3BpcmFzaSwgZGFuIHBlbmdhbGFtYW4ga2VwYWRhIHJpYnVhbiB0YWxlbnRhIG11ZGEgSW5kb25lc2lhLiBUYWh1biBpbmksIGthbWkgcGVyc2VtYmFoa2FuIGtodXN1cyB1bnR1ayBJbmRvbmVzaWEgc2VidWFoIG5pbGFpIG55YXRhIHRlbnRhbmcgIkNyZWF0aXZpdHkgd2l0aCBQdXJwb3NlIi4NCg0KVW50dWsgaW5mb3JtYXNpIHNlbGVuZ2thcG55YSwga3VuanVuZ2kgd3d3LmlkZWFmZXN0LmlkIQ0KDQpGYWNlYm9vazogPC9zcGFuPjxhIGNsYXNzPSJ5dC1zaW1wbGUtZW5kcG9pbnQgc3R5bGUtc2NvcGUgeXQtZm9ybWF0dGVkLXN0cmluZyIgaHJlZj0iaHR0cHM6Ly93d3cueW91dHViZS5jb20vcmVkaXJlY3Q/cmVkaXJfdG9rZW49T1VFVU1ETmR2c2dtS0Iyc0dVc2x3NmlZVnBWOE1UVXhNRGt4TVRBMk9VQXhOVEV3T0RJME5qWTUmYW1wO2V2ZW50PXZpZGVvX2Rlc2NyaXB0aW9uJmFtcDt2PXh2ajVEN0pCOEtFJmFtcDtxPWh0dHBzJTNBJTJGJTJGd3d3LmZhY2Vib29rLmNvbSUyRmlkZWFmZXN0IiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrOyBjdXJzb3I6IHBvaW50ZXI7IGNvbG9yOiB2YXIoLS15dC1lbmRwb2ludC1jb2xvcik7IGZvbnQtZmFtaWx5OiBSb2JvdG8sIEFyaWFsLCBzYW5zLXNlcmlmOyB3aGl0ZS1zcGFjZTogcHJlLXdyYXA7IGJhY2tncm91bmQtY29sb3I6IHJnYigyNTUsIDI1NSwgMjU1KTsiPmh0dHBzOi8vd3d3LmZhY2Vib29rLmNvbS9pZGVhZmVzdDwvYT48c3BhbiBzdHlsZT0iY29sb3I6IHJnYigxNywgMTcsIDE3KTsgZm9udC1mYW1pbHk6IFJvYm90bywgQXJpYWwsIHNhbnMtc2VyaWY7IHdoaXRlLXNwYWNlOiBwcmUtd3JhcDsiPg0KVHdpdHRlcjogPC9zcGFuPjxhIGNsYXNzPSJ5dC1zaW1wbGUtZW5kcG9pbnQgc3R5bGUtc2NvcGUgeXQtZm9ybWF0dGVkLXN0cmluZyIgaHJlZj0iaHR0cHM6Ly93d3cueW91dHViZS5jb20vcmVkaXJlY3Q/cmVkaXJfdG9rZW49T1VFVU1ETmR2c2dtS0Iyc0dVc2x3NmlZVnBWOE1UVXhNRGt4TVRBMk9VQXhOVEV3T0RJME5qWTUmYW1wO2V2ZW50PXZpZGVvX2Rlc2NyaXB0aW9uJmFtcDt2PXh2ajVEN0pCOEtFJmFtcDtxPWh0dHBzJTNBJTJGJTJGdHdpdHRlci5jb20lMkZpZGVhZmVzdCIgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazsgY3Vyc29yOiBwb2ludGVyOyBjb2xvcjogdmFyKC0teXQtZW5kcG9pbnQtY29sb3IpOyBmb250LWZhbWlseTogUm9ib3RvLCBBcmlhbCwgc2Fucy1zZXJpZjsgd2hpdGUtc3BhY2U6IHByZS13cmFwOyBiYWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjU1LCAyNTUsIDI1NSk7Ij5odHRwczovL3R3aXR0ZXIuY29tL2lkZWFmZXN0PC9hPjxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDE3LCAxNywgMTcpOyBmb250LWZhbWlseTogUm9ib3RvLCBBcmlhbCwgc2Fucy1zZXJpZjsgd2hpdGUtc3BhY2U6IHByZS13cmFwOyI+DQpJbnN0YWdyYW06IDwvc3Bhbj48YSBjbGFzcz0ieXQtc2ltcGxlLWVuZHBvaW50IHN0eWxlLXNjb3BlIHl0LWZvcm1hdHRlZC1zdHJpbmciIGhyZWY9Imh0dHBzOi8vd3d3LnlvdXR1YmUuY29tL3JlZGlyZWN0P3JlZGlyX3Rva2VuPU9VRVVNRE5kdnNnbUtCMnNHVXNsdzZpWVZwVjhNVFV4TURreE1UQTJPVUF4TlRFd09ESTBOalk1JmFtcDtldmVudD12aWRlb19kZXNjcmlwdGlvbiZhbXA7dj14dmo1RDdKQjhLRSZhbXA7cT1odHRwcyUzQSUyRiUyRmluc3RhZ3JhbS5jb20lMkZpZGVhZmVzdGlkIiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrOyBjdXJzb3I6IHBvaW50ZXI7IGNvbG9yOiB2YXIoLS15dC1lbmRwb2ludC1jb2xvcik7IGZvbnQtZmFtaWx5OiBSb2JvdG8sIEFyaWFsLCBzYW5zLXNlcmlmOyB3aGl0ZS1zcGFjZTogcHJlLXdyYXA7IGJhY2tncm91bmQtY29sb3I6IHJnYigyNTUsIDI1NSwgMjU1KTsiPmh0dHBzOi8vaW5zdGFncmFtLmNvbS9pZGVhZmVzdGlkPC9hPjxicj4=', 'xvj5D7JB8KE', '', 'SESSION_TEST', '2017-11-16 16:32:02', NULL, NULL),
(6, 'Tulisan - The making of Surat No. 2 (Videographer: Art Director)', 'PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMTcsIDE3LCAxNyk7IGZvbnQtZmFtaWx5OiBSb2JvdG8sIEFyaWFsLCBzYW5zLXNlcmlmOyB3aGl0ZS1zcGFjZTogcHJlLXdyYXA7Ij5UaGUgbWFraW5nIG9mIFN1cmF0IE5vLiAyOiBQZXJzaW5nZ3VuZ2FuIG9mIFZpZGVvZ3JhcGhlci4NCg0KVGhlIHZpc3VhbCBlc3NheSB0ZWFtOg0KQ2hpZWYgb2YgUmVzZWFyY2ggJmFtcDsgQ3VyYXRvcnNoaXAgLSBNZWxpc3NhIFN1bmpheWENCkRlcHV0eSBvZiBSZXNlYXJjaCAmYW1wOyBDdXJhdG9yc2hpcCAtIE11aGFtbWFkIFp1bGZhZGx5DQpQcm9ncmFtIERpcmVjdG9yIC0gUmFobWEgQXl1DQpWaXN1YWwgRGlyZWN0b3IgLSBLcmlzaG5pIFN3YW5kYXlhbmkNCkFydCBEaXJlY3RvciAtIEJpbWEgQ2hyaXMNClBob3RvZ3JhcGhlciAtIFpoYXJmYW5pIFBhZG1hc2VkaGFuYQ0KRWRpdG9yIC0gTWVsYW55IFp3YXJ0amVzDQpTdHlsZSBEaXJlY3RvciAtIEFqaSBCYWdqYXJheWENClByb3BzIE1hc3RlciAtIEFyeWEgSXJoYXNkaW5hdGENClN0YWdlIERlc2lnbmVyIC0gRmFyaWQgUmluYWxkaQ0KQ29zdHVtZSBNYW5hZ2VyIC0gRmFkcmkgUGFtdW5na2FzPC9zcGFuPjxicj4=', 'iQmNxsAKPfg', '', 'SESSION_TEST', '2017-11-16 16:33:38', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `colors`
--

CREATE TABLE `colors` (
  `idData` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `colors`
--

INSERT INTO `colors` (`idData`, `name`, `createdBy`, `createdDate`, `changedBy`, `changedDate`) VALUES
(3, 'Blue Arch', 'SESSION_TEST', '2017-10-23 14:39:48', NULL, NULL),
(4, 'Red Ruby', 'admin@tulisan.com', '2017-11-29 18:45:06', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `country_code` varchar(2) NOT NULL DEFAULT '',
  `country_name` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `countries`
--

INSERT INTO `countries` (`id`, `country_code`, `country_name`) VALUES
(1, 'AF', 'Afghanistan'),
(2, 'AL', 'Albania'),
(3, 'DZ', 'Algeria'),
(4, 'DS', 'American Samoa'),
(5, 'AD', 'Andorra'),
(6, 'AO', 'Angola'),
(7, 'AI', 'Anguilla'),
(8, 'AQ', 'Antarctica'),
(9, 'AG', 'Antigua and Barbuda'),
(10, 'AR', 'Argentina'),
(11, 'AM', 'Armenia'),
(12, 'AW', 'Aruba'),
(13, 'AU', 'Australia'),
(14, 'AT', 'Austria'),
(15, 'AZ', 'Azerbaijan'),
(16, 'BS', 'Bahamas'),
(17, 'BH', 'Bahrain'),
(18, 'BD', 'Bangladesh'),
(19, 'BB', 'Barbados'),
(20, 'BY', 'Belarus'),
(21, 'BE', 'Belgium'),
(22, 'BZ', 'Belize'),
(23, 'BJ', 'Benin'),
(24, 'BM', 'Bermuda'),
(25, 'BT', 'Bhutan'),
(26, 'BO', 'Bolivia'),
(27, 'BA', 'Bosnia and Herzegovina'),
(28, 'BW', 'Botswana'),
(29, 'BV', 'Bouvet Island'),
(30, 'BR', 'Brazil'),
(31, 'IO', 'British Indian Ocean Territory'),
(32, 'BN', 'Brunei Darussalam'),
(33, 'BG', 'Bulgaria'),
(34, 'BF', 'Burkina Faso'),
(35, 'BI', 'Burundi'),
(36, 'KH', 'Cambodia'),
(37, 'CM', 'Cameroon'),
(38, 'CA', 'Canada'),
(39, 'CV', 'Cape Verde'),
(40, 'KY', 'Cayman Islands'),
(41, 'CF', 'Central African Republic'),
(42, 'TD', 'Chad'),
(43, 'CL', 'Chile'),
(44, 'CN', 'China'),
(45, 'CX', 'Christmas Island'),
(46, 'CC', 'Cocos (Keeling) Islands'),
(47, 'CO', 'Colombia'),
(48, 'KM', 'Comoros'),
(49, 'CG', 'Congo'),
(50, 'CK', 'Cook Islands'),
(51, 'CR', 'Costa Rica'),
(52, 'HR', 'Croatia (Hrvatska)'),
(53, 'CU', 'Cuba'),
(54, 'CY', 'Cyprus'),
(55, 'CZ', 'Czech Republic'),
(56, 'DK', 'Denmark'),
(57, 'DJ', 'Djibouti'),
(58, 'DM', 'Dominica'),
(59, 'DO', 'Dominican Republic'),
(60, 'TP', 'East Timor'),
(61, 'EC', 'Ecuador'),
(62, 'EG', 'Egypt'),
(63, 'SV', 'El Salvador'),
(64, 'GQ', 'Equatorial Guinea'),
(65, 'ER', 'Eritrea'),
(66, 'EE', 'Estonia'),
(67, 'ET', 'Ethiopia'),
(68, 'FK', 'Falkland Islands (Malvinas)'),
(69, 'FO', 'Faroe Islands'),
(70, 'FJ', 'Fiji'),
(71, 'FI', 'Finland'),
(72, 'FR', 'France'),
(73, 'FX', 'France, Metropolitan'),
(74, 'GF', 'French Guiana'),
(75, 'PF', 'French Polynesia'),
(76, 'TF', 'French Southern Territories'),
(77, 'GA', 'Gabon'),
(78, 'GM', 'Gambia'),
(79, 'GE', 'Georgia'),
(80, 'DE', 'Germany'),
(81, 'GH', 'Ghana'),
(82, 'GI', 'Gibraltar'),
(83, 'GK', 'Guernsey'),
(84, 'GR', 'Greece'),
(85, 'GL', 'Greenland'),
(86, 'GD', 'Grenada'),
(87, 'GP', 'Guadeloupe'),
(88, 'GU', 'Guam'),
(89, 'GT', 'Guatemala'),
(90, 'GN', 'Guinea'),
(91, 'GW', 'Guinea-Bissau'),
(92, 'GY', 'Guyana'),
(93, 'HT', 'Haiti'),
(94, 'HM', 'Heard and Mc Donald Islands'),
(95, 'HN', 'Honduras'),
(96, 'HK', 'Hong Kong'),
(97, 'HU', 'Hungary'),
(98, 'IS', 'Iceland'),
(99, 'IN', 'India'),
(100, 'IM', 'Isle of Man'),
(101, 'ID', 'Indonesia'),
(102, 'IR', 'Iran (Islamic Republic of)'),
(103, 'IQ', 'Iraq'),
(104, 'IE', 'Ireland'),
(105, 'IL', 'Israel'),
(106, 'IT', 'Italy'),
(107, 'CI', 'Ivory Coast'),
(108, 'JE', 'Jersey'),
(109, 'JM', 'Jamaica'),
(110, 'JP', 'Japan'),
(111, 'JO', 'Jordan'),
(112, 'KZ', 'Kazakhstan'),
(113, 'KE', 'Kenya'),
(114, 'KI', 'Kiribati'),
(115, 'KP', 'Korea, Democratic People\'s Republic of'),
(116, 'KR', 'Korea, Republic of'),
(117, 'XK', 'Kosovo'),
(118, 'KW', 'Kuwait'),
(119, 'KG', 'Kyrgyzstan'),
(120, 'LA', 'Lao People\'s Democratic Republic'),
(121, 'LV', 'Latvia'),
(122, 'LB', 'Lebanon'),
(123, 'LS', 'Lesotho'),
(124, 'LR', 'Liberia'),
(125, 'LY', 'Libyan Arab Jamahiriya'),
(126, 'LI', 'Liechtenstein'),
(127, 'LT', 'Lithuania'),
(128, 'LU', 'Luxembourg'),
(129, 'MO', 'Macau'),
(130, 'MK', 'Macedonia'),
(131, 'MG', 'Madagascar'),
(132, 'MW', 'Malawi'),
(133, 'MY', 'Malaysia'),
(134, 'MV', 'Maldives'),
(135, 'ML', 'Mali'),
(136, 'MT', 'Malta'),
(137, 'MH', 'Marshall Islands'),
(138, 'MQ', 'Martinique'),
(139, 'MR', 'Mauritania'),
(140, 'MU', 'Mauritius'),
(141, 'TY', 'Mayotte'),
(142, 'MX', 'Mexico'),
(143, 'FM', 'Micronesia, Federated States of'),
(144, 'MD', 'Moldova, Republic of'),
(145, 'MC', 'Monaco'),
(146, 'MN', 'Mongolia'),
(147, 'ME', 'Montenegro'),
(148, 'MS', 'Montserrat'),
(149, 'MA', 'Morocco'),
(150, 'MZ', 'Mozambique'),
(151, 'MM', 'Myanmar'),
(152, 'NA', 'Namibia'),
(153, 'NR', 'Nauru'),
(154, 'NP', 'Nepal'),
(155, 'NL', 'Netherlands'),
(156, 'AN', 'Netherlands Antilles'),
(157, 'NC', 'New Caledonia'),
(158, 'NZ', 'New Zealand'),
(159, 'NI', 'Nicaragua'),
(160, 'NE', 'Niger'),
(161, 'NG', 'Nigeria'),
(162, 'NU', 'Niue'),
(163, 'NF', 'Norfolk Island'),
(164, 'MP', 'Northern Mariana Islands'),
(165, 'NO', 'Norway'),
(166, 'OM', 'Oman'),
(167, 'PK', 'Pakistan'),
(168, 'PW', 'Palau'),
(169, 'PS', 'Palestine'),
(170, 'PA', 'Panama'),
(171, 'PG', 'Papua New Guinea'),
(172, 'PY', 'Paraguay'),
(173, 'PE', 'Peru'),
(174, 'PH', 'Philippines'),
(175, 'PN', 'Pitcairn'),
(176, 'PL', 'Poland'),
(177, 'PT', 'Portugal'),
(178, 'PR', 'Puerto Rico'),
(179, 'QA', 'Qatar'),
(180, 'RE', 'Reunion'),
(181, 'RO', 'Romania'),
(182, 'RU', 'Russian Federation'),
(183, 'RW', 'Rwanda'),
(184, 'KN', 'Saint Kitts and Nevis'),
(185, 'LC', 'Saint Lucia'),
(186, 'VC', 'Saint Vincent and the Grenadines'),
(187, 'WS', 'Samoa'),
(188, 'SM', 'San Marino'),
(189, 'ST', 'Sao Tome and Principe'),
(190, 'SA', 'Saudi Arabia'),
(191, 'SN', 'Senegal'),
(192, 'RS', 'Serbia'),
(193, 'SC', 'Seychelles'),
(194, 'SL', 'Sierra Leone'),
(195, 'SG', 'Singapore'),
(196, 'SK', 'Slovakia'),
(197, 'SI', 'Slovenia'),
(198, 'SB', 'Solomon Islands'),
(199, 'SO', 'Somalia'),
(200, 'ZA', 'South Africa'),
(201, 'GS', 'South Georgia South Sandwich Islands'),
(202, 'ES', 'Spain'),
(203, 'LK', 'Sri Lanka'),
(204, 'SH', 'St. Helena'),
(205, 'PM', 'St. Pierre and Miquelon'),
(206, 'SD', 'Sudan'),
(207, 'SR', 'Suriname'),
(208, 'SJ', 'Svalbard and Jan Mayen Islands'),
(209, 'SZ', 'Swaziland'),
(210, 'SE', 'Sweden'),
(211, 'CH', 'Switzerland'),
(212, 'SY', 'Syrian Arab Republic'),
(213, 'TW', 'Taiwan'),
(214, 'TJ', 'Tajikistan'),
(215, 'TZ', 'Tanzania, United Republic of'),
(216, 'TH', 'Thailand'),
(217, 'TG', 'Togo'),
(218, 'TK', 'Tokelau'),
(219, 'TO', 'Tonga'),
(220, 'TT', 'Trinidad and Tobago'),
(221, 'TN', 'Tunisia'),
(222, 'TR', 'Turkey'),
(223, 'TM', 'Turkmenistan'),
(224, 'TC', 'Turks and Caicos Islands'),
(225, 'TV', 'Tuvalu'),
(226, 'UG', 'Uganda'),
(227, 'UA', 'Ukraine'),
(228, 'AE', 'United Arab Emirates'),
(229, 'GB', 'United Kingdom'),
(230, 'US', 'United States'),
(231, 'UM', 'United States minor outlying islands'),
(232, 'UY', 'Uruguay'),
(233, 'UZ', 'Uzbekistan'),
(234, 'VU', 'Vanuatu'),
(235, 'VA', 'Vatican City State'),
(236, 'VE', 'Venezuela'),
(237, 'VN', 'Vietnam'),
(238, 'VG', 'Virgin Islands (British)'),
(239, 'VI', 'Virgin Islands (U.S.)'),
(240, 'WF', 'Wallis and Futuna Islands'),
(241, 'EH', 'Western Sahara'),
(242, 'YE', 'Yemen'),
(243, 'ZR', 'Zaire'),
(244, 'ZM', 'Zambia'),
(245, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Struktur dari tabel `customers`
--

CREATE TABLE `customers` (
  `idData` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `zipCode` varchar(10) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `email` varchar(100) NOT NULL,
  `userId` int(11) NOT NULL,
  `company` varchar(100) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `customers`
--

INSERT INTO `customers` (`idData`, `name`, `address`, `city`, `country`, `zipCode`, `phone`, `email`, `userId`, `company`, `createdBy`, `createdDate`, `changedBy`, `changedDate`) VALUES
(1, 'Demo Customer', 'demo', 'Bandung', 'ID', '52313', '085794867714', 'demo@tulisan.com', 4, 'Tulisan', 'SESSION_TEST', '2017-10-23 21:32:06', 'SESSION_TEST', '2017-10-23 21:40:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `departments`
--

CREATE TABLE `departments` (
  `idData` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `departments`
--

INSERT INTO `departments` (`idData`, `name`, `createdBy`, `createdDate`, `changedBy`, `changedDate`) VALUES
(1, 'System', 'SESSION_TEST', '2017-10-23 14:50:26', NULL, NULL),
(4, 'Product', 'SESSION_TEST', '2017-10-23 14:50:26', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `idData` int(11) NOT NULL,
  `customerId` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address` text NOT NULL,
  `city` varchar(100) NOT NULL,
  `zipCode` varchar(10) NOT NULL,
  `country` varchar(100) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `email` varchar(100) NOT NULL,
  `total` int(11) NOT NULL,
  `paymentMethod` varchar(100) DEFAULT NULL,
  `bank` varchar(100) NOT NULL,
  `dokuStatus` varchar(100) NOT NULL,
  `status` varchar(20) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`idData`, `customerId`, `name`, `address`, `city`, `zipCode`, `country`, `phone`, `email`, `total`, `paymentMethod`, `bank`, `dokuStatus`, `status`, `createdBy`, `createdDate`, `changedBy`, `changedDate`) VALUES
(1, 0, 'Demo Customer 1', 'Jl.Samosir Timur IV No.237 Bojongbata', 'Pemalang', '52319', 'ID', '085794867714', 'mereceiver7logia@gmail.com', 230000, 'BANK TRANSFER', 'MANDIRI', '', 'Waiting for payment', 'guest', '2017-12-03 22:39:49', NULL, NULL),
(2, 1, 'Demo Customer', 'Demo', 'Bandung', '52313', 'ID', '085794867714', 'megan@gmail.com', 100000, 'BANK TRANSFER', 'MANDIRI', '', 'Waiting for payment', 'demo@tulisan.com', '2017-12-03 22:50:14', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders_item`
--

CREATE TABLE `orders_item` (
  `idData` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `variantId` int(11) NOT NULL,
  `price` varchar(15) NOT NULL,
  `qty` int(11) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `orders_item`
--

INSERT INTO `orders_item` (`idData`, `orderId`, `variantId`, `price`, `qty`, `createdBy`, `createdDate`, `changedBy`, `changedDate`) VALUES
(1, 1, 1, '100000', 2, 'guest', '2017-12-03 22:39:49', NULL, NULL),
(2, 1, 4, '30000', 1, 'guest', '2017-12-03 22:39:49', NULL, NULL),
(3, 2, 1, '100000', 1, 'demo@tulisan.com', '2017-12-03 22:50:14', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `idData` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `sku` varchar(10) NOT NULL,
  `description` text NOT NULL,
  `material` text NOT NULL,
  `dimension` varchar(100) NOT NULL,
  `price` varchar(15) NOT NULL,
  `storyId` int(11) NOT NULL,
  `lookBook1` varchar(100) DEFAULT NULL,
  `lookBook2` varchar(100) DEFAULT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`idData`, `name`, `sku`, `description`, `material`, `dimension`, `price`, `storyId`, `lookBook1`, `lookBook2`, `createdBy`, `createdDate`, `changedBy`, `changedDate`) VALUES
(84, 'Blue Arch 2', 'BA12345678', 'Blue arch test', 'Jade', 'pxl', '100000', 3, 'products_84_120171129082902am.jpg', 'products_84_220171129082958am.jpg', 'admin@tulisan.com', '2017-11-27 16:00:04', 'admin@tulisan.com', '2017-11-29 14:29:58'),
(85, 'Blurias', '989898', 'No Desc', 'Plastic', 'pxl', '30000', 3, 'products_85_120171129035156pm.jpg', 'products_85_220171129035156pm.jpg', 'admin@tulisan.com', '2017-11-29 21:51:39', 'admin@tulisan.com', '2017-11-29 21:51:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `products_variant`
--

CREATE TABLE `products_variant` (
  `idData` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `artworkId` int(11) NOT NULL,
  `colorId` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `size` varchar(100) NOT NULL,
  `frontPicture` varchar(100) NOT NULL,
  `backPicture` varchar(100) NOT NULL,
  `topPicture` varchar(100) NOT NULL,
  `rightPicture` varchar(100) NOT NULL,
  `bottomPicture` varchar(100) NOT NULL,
  `leftPicture` varchar(100) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedby` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `products_variant`
--

INSERT INTO `products_variant` (`idData`, `productId`, `artworkId`, `colorId`, `qty`, `size`, `frontPicture`, `backPicture`, `topPicture`, `rightPicture`, `bottomPicture`, `leftPicture`, `createdBy`, `createdDate`, `changedby`, `changedDate`) VALUES
(1, 84, 1, 3, 4, 'Medium', 'products_1_1.jpg', 'products_1_2.jpg', 'products_1_3.jpg', 'products_1_4.jpg', 'products_1_5.jpg', 'products_1_6.jpg', 'tes', '2017-11-27 00:00:00', 'admin@tulisan.com', '2017-11-29 14:07:31'),
(2, 84, 1, 3, 7, 'Large', 'products_2_1.jpg', 'products_2_2.jpg', 'products_2_3.jpg', '', '', '', 'tes', '2017-11-27 00:00:00', 'admin@tulisan.com', '2017-11-29 19:27:39'),
(3, 84, 0, 0, 1, 'Small', '', '', '', '', '', '', 'tes', '2017-11-27 00:00:00', 'admin@tulisan.com', '2017-11-29 11:58:02'),
(4, 85, 1, 4, 7, 'Small', 'products_4_1.jpg', '', '', '', '', '', 'tes', '2017-11-27 00:00:00', 'admin@tulisan.com', '2017-11-29 21:52:32'),
(5, 0, 2, 3, 0, 'Medium', '', '', '', '', '', '', 'admin@tulisan.com', '2017-11-29 13:43:15', NULL, NULL),
(6, 84, 2, 3, 13, 'Medium', 'products_6_1.jpg', '', '', '', '', '', 'admin@tulisan.com', '2017-11-29 13:44:36', 'admin@tulisan.com', '2017-11-29 16:05:19'),
(7, 84, 1, 3, 0, 'Small', 'products_7_1.jpg', '', '', '', '', '', 'admin@tulisan.com', '2017-11-29 13:47:38', 'admin@tulisan.com', '2017-11-29 13:53:00'),
(8, 84, 2, 4, 6, 'Large', 'products_8_1.jpg', '', '', '', '', '', 'admin@tulisan.com', '2017-11-29 18:45:49', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `idData` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `departmentId` int(11) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `confirmation` varchar(10) NOT NULL DEFAULT 'no',
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`idData`, `name`, `username`, `password`, `type`, `departmentId`, `picture`, `confirmation`, `createdBy`, `createdDate`, `changedBy`, `changedDate`) VALUES
(0, 'Administrator', 'admin@tulisan.com', '21232f297a57a5a743894a0e4a801fc3', 'admin', 1, 'users_1.gif', 'belum', 'SESSION_TEST', '2017-10-23 19:57:19', 'SESSION_TEST', '2017-10-23 20:10:30'),
(3, 'megan', 'megan@syncard.com', '202cb962ac59075b964b07152d234b70', 'admin', 4, 'users_3.jpg', 'belum', 'SESSION_TEST', '2017-10-23 20:13:56', 'SESSION_TEST', '2017-10-23 20:22:18'),
(4, 'Demo Customer', 'demo@tulisan.com', 'fe01ce2a7fbac8fafaed7c982a04e229', 'Customer', 0, 'users_4.jpg', 'belum', 'SESSION_TEST', '2017-10-23 21:32:06', 'SESSION_TEST', '2017-11-14 20:57:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `vendors`
--

CREATE TABLE `vendors` (
  `idData` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(100) NOT NULL,
  `country` varchar(5) NOT NULL,
  `zipCode` varchar(10) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `email` varchar(100) NOT NULL,
  `company` varchar(100) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `vendors`
--

INSERT INTO `vendors` (`idData`, `name`, `address`, `city`, `country`, `zipCode`, `phone`, `email`, `company`, `createdBy`, `createdDate`, `changedBy`, `changedDate`) VALUES
(3, 'Vendor 1', 'Jalan... ', 'Bandung', 'Indon', 'xxxxx', '123', 'email@co.com', 'No Company', 'SESSION_TEST', '2017-10-23 22:10:27', 'SESSION_TEST', '2017-10-23 22:13:52');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cms_blog`
--
ALTER TABLE `cms_blog`
  ADD PRIMARY KEY (`idData`);

--
-- Indeks untuk tabel `cms_chatter`
--
ALTER TABLE `cms_chatter`
  ADD PRIMARY KEY (`idData`);

--
-- Indeks untuk tabel `cms_home`
--
ALTER TABLE `cms_home`
  ADD PRIMARY KEY (`idData`);

--
-- Indeks untuk tabel `cms_story`
--
ALTER TABLE `cms_story`
  ADD PRIMARY KEY (`idData`);

--
-- Indeks untuk tabel `cms_story_artwork`
--
ALTER TABLE `cms_story_artwork`
  ADD PRIMARY KEY (`idData`);

--
-- Indeks untuk tabel `cms_video`
--
ALTER TABLE `cms_video`
  ADD PRIMARY KEY (`idData`);

--
-- Indeks untuk tabel `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`idData`);

--
-- Indeks untuk tabel `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`idData`);

--
-- Indeks untuk tabel `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`idData`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`idData`);

--
-- Indeks untuk tabel `orders_item`
--
ALTER TABLE `orders_item`
  ADD PRIMARY KEY (`idData`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`idData`);

--
-- Indeks untuk tabel `products_variant`
--
ALTER TABLE `products_variant`
  ADD PRIMARY KEY (`idData`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idData`);

--
-- Indeks untuk tabel `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`idData`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `cms_blog`
--
ALTER TABLE `cms_blog`
  MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `cms_chatter`
--
ALTER TABLE `cms_chatter`
  MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `cms_home`
--
ALTER TABLE `cms_home`
  MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `cms_story`
--
ALTER TABLE `cms_story`
  MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `cms_story_artwork`
--
ALTER TABLE `cms_story_artwork`
  MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `cms_video`
--
ALTER TABLE `cms_video`
  MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `colors`
--
ALTER TABLE `colors`
  MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=246;

--
-- AUTO_INCREMENT untuk tabel `customers`
--
ALTER TABLE `customers`
  MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `departments`
--
ALTER TABLE `departments`
  MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `orders_item`
--
ALTER TABLE `orders_item`
  MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT untuk tabel `products_variant`
--
ALTER TABLE `products_variant`
  MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `vendors`
--
ALTER TABLE `vendors`
  MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
