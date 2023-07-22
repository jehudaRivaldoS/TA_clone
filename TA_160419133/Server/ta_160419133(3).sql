-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2023 at 09:16 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ta_160419133`
--

-- --------------------------------------------------------

--
-- Table structure for table `aplikasi`
--

CREATE TABLE `aplikasi` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `aplikasi`
--

INSERT INTO `aplikasi` (`id`, `name`) VALUES
(0, 'Google Maps Review'),
(1, 'Instagram'),
(2, 'Twitter');

-- --------------------------------------------------------

--
-- Table structure for table `ulasan`
--

CREATE TABLE `ulasan` (
  `id` int(11) NOT NULL,
  `komentar` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `kategori_sentimen` tinyint(1) DEFAULT NULL,
  `pelayanan` tinyint(1) DEFAULT NULL,
  `fasilitas` tinyint(1) DEFAULT NULL,
  `wahana` tinyint(1) DEFAULT NULL,
  `kuliner` tinyint(1) DEFAULT NULL,
  `aplikasi_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ulasan`
--

INSERT INTO `ulasan` (`id`, `komentar`, `tanggal`, `kategori_sentimen`, `pelayanan`, `fasilitas`, `wahana`, `kuliner`, `aplikasi_id`) VALUES
(1349, 'Tanya?<br>Apakah jalan nya menuju ke wisata naik turun naik turun', '2023-06-07', 0, 0, 1, 0, 0, 0),
(1350, 'Tiket murah cocok untuk refresh sejenak', '2023-06-07', 1, 0, 1, 0, 0, 0),
(1351, 'Untuk yg bawa mobil hindari hari libur krn susah dapat parkir,dan untuk motor parkirannya juga jauh apa lagi panas....jadi ngga seberapa sejuk untuk udaranya', '2023-06-07', 0, 1, 1, 0, 0, 0),
(1352, 'Htm murah, tiket wahana jg murah, view lumayan ok, cuma agak panas terutama pas siang hari. Overal ok lah  ', '2023-06-07', 1, 0, 1, 1, 0, 0),
(1353, 'Nice view<br><br>(Diterjemahkan oleh Google)<br>Pemandangan yang bagus', '2023-06-06', 1, 0, 0, 0, 0, 0),
(1354, 'Asik kereta nya, keliling sawah, tetapi saat naik rebutan tidak sesuai nomer urut,', '2023-06-06', 1, 0, 0, 0, 0, 0),
(1355, 'disini apa ada tempat penitipan barang untuk yang berenang ya ?', '2023-06-06', 1, 0, 1, 0, 0, 0),
(1356, 'Istimewa...  Tiket masuk murah ditambah pelayanan juga ramah .', '2023-06-06', 1, 0, 1, 0, 0, 0),
(1357, 'Salah satu contoh BUMDES Desa Wisata yg bisa di contoh', '2023-06-06', 1, 0, 0, 0, 1, 0),
(1358, 'Kalau libur sukanya main kesini sm keluarga. Paling suka naik keretanya karena viewnya masyaa Allah sekali.. Makanan disini juga termasuk standar yaa untuk sekelas tempat wisata di trawas, bahkan bisa dibilang lebih murah. Kesini selalu pas agak mendung jd enak suasana terasa adem, isis...', '2023-06-06', 1, 0, 0, 1, 1, 0),
(1359, 'Wisata murah tapi panas<br>The reaal sawah', '2023-06-06', 0, 0, 1, 0, 0, 0),
(1360, 'Keren... Saran aja kalo kesini better lewat jalur mojosari drpd prigen... Jalannya lebih landai', '2023-06-05', 0, 0, 1, 0, 0, 0),
(1361, 'Wisata keluarga dengan tiket yang murah ,ada wahana permainan yang berbayar dan juga yang gratis dengan nuansa sawah dan gunung penanggungan udara yang sejuk cocok untuk nongkrong juga terdapat banyak warung disekitar', '2023-06-05', 1, 0, 1, 1, 1, 0),
(1362, 'Pemandangan sawahnya cantik, Gubuk sawahnya mohon ditambah', '2023-06-05', 0, 0, 0, 0, 0, 0),
(1363, 'Untuk sejenak melepas penat menjauh dari kebisingan kota...<br>Htm murce, banyak pilihan permainan utk anak² maupun org dewasa...<br>Bisa berenanh sepuasnya dan terapi ikan juga, spot foto yg dijamin anti menyesal dtg ke tempat ini... Recomended  ', '2023-06-05', 0, 0, 1, 1, 0, 0),
(1364, 'Alhamdulillah tempat bagus wahana juga banyak', '2023-06-05', 1, 0, 0, 1, 0, 0),
(1365, 'Suasananya alami seperti dipedesaan', '2023-06-05', 1, 0, 0, 0, 0, 0),
(1366, 'wisata sawah murmer utk keluarga, rame sekali, naik wahana harganya jg merakyat.... <br>masih perlu banyak berbenah, kasi tempat teduh yg banyak, biar tamunya pd betah  <br>utk penjual di relokasikan, biar rapi, msh perlu tempat parkir yg luas, dan tempat sampah msh sedikit<br>btw, masih mantaappp lah      ', '2023-06-04', 0, 0, 1, 1, 0, 0),
(1367, 'Tradisional Bangeet dan keren', '2023-06-04', 1, 0, 0, 0, 0, 0),
(1368, 'Bagus sih cuma tempat istirahat nya kurang.klo musim kemarau panasnya gila2 an...dan bingung mau neduh dmana .', '2023-06-04', 0, 0, 1, 0, 0, 0),
(1369, 'Crowded. Saran saja, mohon ditambah lagi fasum tempat duduk di sekitar area kolam. Dan atau lokasi ramai lainnya', '2023-06-04', 0, 0, 1, 0, 0, 0),
(1370, 'Linmas dan petugas tidak membantu, malah kasar banget ngasi informasinya. Bad experience sih', '2023-06-04', 1, 1, 1, 0, 1, 0),
(1371, 'Bagus view gunung dan sawah. Ada beberapa permainan seperti ATV, kereta dll berbayar.<br><br>HTM 10 rb peroang, parkir 10 rb.<br><br>Ada kolam sumber airnya terlihat keruh karena tanpa keramik. Air sumber asli.<br><br>Saya sarankan kesini sore, karena sangat panas kalau siang.', '2023-06-04', 0, 0, 1, 1, 0, 0),
(1372, 'Wisata yg menyajikan suasana persawahan di gunung dan banyak wahana permainan cocok untuk keluarga.', '2023-06-04', 1, 0, 0, 1, 0, 0),
(1373, 'Harga tiket masuk dan wahana ramah dikantong .<br>Saran saya sebaiknya kolam terapi ikan diberi atap biar ga terlalu panas bgt. Yg kedua, jumlah wahana bebek airnya ditambah agar antrinya tidak terlalu panjang. Semoga makin maju dan bertambah wahana nya :)', '2023-06-04', 0, 0, 1, 1, 0, 0),
(1374, 'Jangan lupa bawa pakan ikan, puassssss kasih makan ikan di kolam sepeda angsa.<br>Makanan sedep (penyetan) harga masuk akal.<br>Parkir mobil udah banyak.<br>Mushollah ada beberapa titik, bersih, toilet juga.<br>Main air anak² banyakkkk & puas', '2023-06-04', 0, 0, 1, 1, 1, 0),
(1375, 'Suka tempatnya, banyak permainan untuk anak2 dan dewasa ( ATV ), hanya saja blm ada lampu jd hanya bisa sampai sblm maghrib saja karena setelah itu pasti gelap, smoga kedepannya bs ada lampu', '2023-06-03', 1, 0, 0, 1, 0, 0),
(1376, 'Bagus,ngilangin penat disini oke bgt. Suasana desa seger. Harga makanan jg terjangkau, utk permainan jg terjangkau. Palagi utk HTMnya murmer     gak bosen utk balik lg disini    ', '2023-06-03', 1, 0, 0, 1, 1, 0),
(1377, 'Saya kesana pas rame banget dan banyak yg sedang halal bihalal. Jadi kurang puas.', '2023-06-03', 0, 0, 1, 0, 0, 0),
(1378, 'Nyaman bwt liburqn keluarga,airnya dingin dan bersih...wisata murah tp sdh terhibur', '2023-06-03', 1, 0, 0, 0, 0, 0),
(1379, 'Cocok untuk berkumpul bersama keluarga', '2023-06-03', 1, 0, 0, 0, 0, 0),
(1380, 'cocok untuk healing bersama keluarga', '2023-06-03', 1, 0, 0, 0, 0, 0),
(1381, 'Banyak wahana, tempat view bagus, karena ini tempat wisata keluarga akan lebih baik untuk yang merokok ada tempat sendiri sehingga tidak merokok di arena tempat anak anak kecil atau d area  wahana yang banyak pengunjung', '2023-06-02', 1, 0, 0, 1, 0, 0),
(1382, 'Wisata Sawah Sumber Gempong merupakan salah satu destinasi baru di Sukorame, Desa Ketapanrame, Kecamatan Trawas, Kabupaten Mojokerto, Jawa Timur.<br><br>Wisata ini menarik untuk dikunjungi selain keindahan alamnya berupa area persawahan di bawah kaki Gunung Penanggungan yang berjarak tidak jauh dari Taman Ghanjaran. Hanya sekitar 1 kilometer atau sekitar 5 10 menit berkendara.<br><br>Rute menuju kawasan itu berliku, tetapi memiliki kualitas jalan yang bagus. Kalau ke sini lebih direkomendasikan menggunakan motor karena akan melewati jalan perkampungan yang sempit. Tapi naik mobil juga bisa.<br><br>Udara di Sumber Gempong selalu sejuk karena berada di kaki gunung. Selain itu panorama alamnya sangat indah. Hamparan persawahan terasa indah dengan sumber mata air yang jernih.<br><br>Bernuansa pedesaan dengan kicauan burung dan gemericik air, Wisata Sumber Gempong cocok buat siapa yang tengah jenuh setelah melakukan aktivitas sehari-hari.<br><br>Selain itu terdapat kolam renang besar yang juga berasal dari sumber air pegunungan. Airnya begitu segar dan murni tanpa menggunakan kaporit sedikitpun. Sangat mengasyikkan dan menenangkan hati. Bisa berenang dan berendam sambil menikmati pemandangan Gunung Penanggungan.<br><br>Tidak hanya itu, Sumber Gempong adalah sebuah mata air yang menjadi urat nadi para petani di sekitarnya. Konon menurut cerita warga, mata air tersebut tidak pernah kering walau saat musim kemarau sekali pun.<br><br>Sumber Gempong mungkin bisa menjadi sajian wajib ketika menghabiskan hari libur bersama<br>keluarga.', '2023-06-02', 1, 0, 1, 1, 0, 0),
(1383, 'Kalau pas hari libur cari parkiran mobil agak susah , penuh .', '2023-06-02', 0, 0, 1, 0, 0, 0),
(1384, 'Viewnya alami, bagus harga murah', '2023-06-02', 1, 0, 0, 0, 0, 0),
(1385, 'Sumber gempong menyajikan pemandangan sawah terasiring dengan nuansa pegunungan yang asri. Disekelilingnya terdapat wahana bermain bagi sekecil maupun dewasa. Harga tiket juga terjangkau. Kolam pemandian dan terapi ikan gratis. Wahana permainan tutup sampai jam 5 sore, cafe tetap buka malam. Semoga senantiasa asri.', '2023-06-02', 1, 1, 1, 1, 1, 0),
(1386, 'Hansip satpam nya yg ngatur jalan jahat² . Beri tau lah agar ramah sedikit ke pengunjung', '2023-06-02', 0, 1, 1, 0, 0, 0),
(1387, 'Bagus sih.. cuma tempat berteduh nya kurang banyak...', '2023-06-02', 0, 0, 1, 0, 0, 0),
(1388, 'Panas.......tempat makannya murah2 .....makanannya enak enak....', '2023-06-02', 0, 0, 1, 0, 1, 0),
(1389, 'Sangat cocok untuk wisata keluarga', '2023-06-01', 1, 0, 0, 0, 0, 0),
(1390, 'Udah bolak balik kesini,<br>Tempat wisata alam paling recommended.<br>Sejuk bgt, dan bisa berenang juga<br>Makanan yg dijual murah2, petugas juga ramah2.<br>Cocok bgt buat refresh dari sibuknya aktifitas', '2023-06-01', 1, 0, 0, 0, 1, 0),
(1391, 'Wisata yang recommended di Trawas, ada ground yang bisa buat piknik, terapi ikan gratis bisa dicoba juga nih, ATV juga seru hanya 20rb.. ada warung di atas dengan view yang keren..', '2023-06-01', 0, 0, 1, 1, 0, 0),
(1393, 'SUEJUKKKK', '2023-06-01', 1, 0, 0, 0, 0, 0),
(1394, 'Baik utk traveling baik anak2 dan dewasa.makanan jg cukup lumayan sihh...', '2023-06-01', 0, 0, 0, 1, 0, 0),
(1395, 'Banyak wahana untuk anak2...view nya bagus..', '2023-06-01', 1, 0, 0, 1, 0, 0),
(1396, 'Ntaps, bisa naik kereta dg view Gunung Penanggungan yg menakjubkan', '2023-06-01', 1, 0, 0, 1, 0, 0),
(1397, '2 kali kesini dannn emang baguss banget<br>sihh ,,,keren     ', '2023-06-01', 1, 0, 0, 0, 0, 0),
(1398, 'Saran. Untuk semua kanal terutama ke sawah. Di perlebar  aliran air sawah di arahkan  jangan Padi yg di tanam , tomat cabai atau sayuran pastia tambah menarik', '2023-06-01', 0, 0, 1, 0, 1, 0),
(1399, 'Sebenernya tempatnya enak,tp klo agak siangan jm 10 pagi terasa panasnya dan lagi tempat utk bersantai blm terlalu banyak. . Jd kemarin pas kesitu cuma 15menit doang. . Semoga kedepannya rumah gubuknya di perbanyak lagi. . Biar bisa menikmati aroma\\\" Persawahan nya. .', '2023-06-01', 0, 0, 1, 0, 0, 0),
(1400, 'Tempatnya enak sejuk, airnya seger banget. Kalo mau kesini pagi, pengalaman yang di dapet lebih asik', '2023-06-01', 1, 0, 0, 0, 0, 0),
(1401, 'Top Murmer banget', '2023-06-01', 1, 0, 0, 0, 0, 0),
(1402, 'Top markotop', '2023-06-01', 1, 0, 0, 0, 0, 0),
(1403, 'Lumayan murah wisata ini terbilang masih pengembangan. Lanjutkan', '2023-06-01', 1, 0, 0, 0, 0, 0),
(1404, 'Wisata murah meriah, tempatnya ok, bersih', '2023-06-01', 1, 0, 0, 0, 0, 0),
(1405, 'Menyenangkan', '2023-06-01', 1, 0, 0, 0, 0, 0),
(1406, 'Nice view fo  refreshing, fotograph, and selfie with our family and friends<br><br>(Diterjemahkan oleh Google)<br>Pemandangan bagus untuk menyegarkan, foto, dan selfie bersama keluarga dan teman-teman kita', '2023-06-01', 1, 0, 0, 0, 0, 0),
(1407, 'Murah meriah sih semoga maju berkembang lagi', '2023-06-01', 1, 0, 0, 0, 0, 0),
(1408, 'Bagus', '2023-06-01', 1, 0, 0, 0, 0, 0),
(1409, 'Tempatnya sih besar, namun ada bbrp kekurangan, tuakng parkir agak memaksa untuk parkir agak jauh,namun ada tempat parkir disekitarnya, utk toilet agak kurang banyak ya, dan masih harus bayar lg, padahal masuk tenpat wisata udah bayar', '2023-06-01', 0, 0, 1, 0, 0, 0),
(1410, 'Murah,alami dan indah', '2023-06-01', 1, 0, 0, 0, 0, 0),
(1411, 'Pemandangan bagus, tempatnya jg adem, untuk petugas mungkin perlu tambahan training ya, parkir kurang memadai jln lumayan jauh', '2023-06-01', 0, 0, 1, 0, 1, 0),
(1412, 'Tempat wisata yang bagus', '2023-06-01', 1, 0, 0, 0, 0, 0),
(1413, 'tempat asri dan harga masih murah,<br>namun untuk makanan masih kurang varian.', '2023-06-01', 0, 0, 1, 0, 1, 0),
(1414, 'Tempat nya bersih,tempat nya luas,harga makanan murah meriah..   ', '2023-06-01', 1, 0, 0, 0, 1, 0),
(1415, 'Datang waktu hari libur jadi tempatnya ramai. Untuk tiket masuk 2motor 3orang ga sampai 50rb, jadi ini wisata murah banget.<br><br>Viewnya bagus untuk orang kota yang sering liat gedung-gedung aja, di sini bisa lihat sawah, bukit, serta gunung.<br><br>Waktu datang pemandiannya ramai karena hari libur, mungkin akan agak sepi jika hari biasa.<br><br>Untuk masalah kebersihan bisa dibilang banyak sampah bertebaran, dan banyak tong sampah yang sudah terisi full tapi masih dibiarkan.<br><br>Overall ini tempat wisata murah dan menjual view yang jarang dijumpai di perkotaan.', '2023-06-01', 0, 0, 1, 0, 1, 0),
(1416, 'Cocok untuk anak² bermain air ', '2023-06-01', 1, 0, 0, 1, 0, 0),
(1417, 'Viewnya bagus , toiletnya kurang banyak', '2023-06-01', 0, 0, 1, 0, 0, 0),
(1418, 'Yang jelas murah dan indah. Sesuai kantong masyarakat menengah kebawah. Ajib.', '2023-06-01', 1, 0, 1, 0, 0, 0),
(1419, 'Tiket masuknya murah cuma 5 ribu, ada banyak wahana permainan, ada kolam renang juga sama kolam terapi ikan, untuk wahana bayar dan sudah ada keterangan jelas di papan mulai dari wahana apa bayar berapa, jadi ga bikin bingung. Jangan pas weekend kesana pasti rame banget:(', '2023-06-01', 1, 0, 1, 1, 0, 0),
(1420, 'Cocok untuk wisata keluarga bersama anak dan cucu.<br>Layanan pedagang ramah dan murah.', '2023-06-01', 1, 0, 0, 0, 0, 0),
(1421, 'Pemandangan indah, banyak wahana bermain', '2023-06-01', 1, 0, 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ulasan_sementara`
--

CREATE TABLE `ulasan_sementara` (
  `id` int(11) NOT NULL,
  `komentar` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `kategori_sentimen` tinyint(1) DEFAULT NULL,
  `pelayanan` tinyint(1) DEFAULT NULL,
  `fasilitas` tinyint(1) DEFAULT NULL,
  `wahana` tinyint(1) DEFAULT NULL,
  `kuliner` tinyint(1) DEFAULT NULL,
  `aplikasi_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ulasan_sementara`
--

INSERT INTO `ulasan_sementara` (`id`, `komentar`, `tanggal`, `kategori_sentimen`, `pelayanan`, `fasilitas`, `wahana`, `kuliner`, `aplikasi_id`) VALUES
(1, 'Bagus banget pemandangan nya, ada wahana bermain anak,, bisa renang di kolam air ikan,, ada terapi ikan,, kuliner nya juga murah,, recomended buat liburan anak', '2023-06-20', NULL, NULL, NULL, NULL, NULL, 0),
(2, 'Wisata murah meriah yg di kelola bumdes dan hasilnya di rasakan semua warga ketapanrame trawas.<br>Cocok untuk semua kalangan dan keluarga', '2023-06-20', NULL, NULL, NULL, NULL, NULL, 0),
(3, 'Tempat wisata yang cukup ramah di kantong keluarga<br>Lokasi yang strategis dapat di jangkau<br>Tiket masuk cukup terjangkau juga', '2023-06-20', NULL, NULL, NULL, NULL, NULL, 0),
(4, 'Bagus, syahduuh sangat enak buat santai / foto bareng keluarga', '2023-06-20', NULL, NULL, NULL, NULL, NULL, 0),
(5, 'Masih alami .harga tiket sangat terjangkau', '2023-06-20', NULL, NULL, NULL, NULL, NULL, 0),
(6, 'Tempat bersih alami, cukup menanjak untuk masuk area wisata, kantin makanan cukup baik, kamar mandi banyak, sumber air bersih, suasana persawahan', '2023-06-20', NULL, NULL, NULL, NULL, NULL, 0),
(7, 'Seru banget cuma sayang pas weekend jadi rame bgt pengen kesana lagi tapi pas weekday aja biar bisa puas explore.. Disarankan bawa pakan ikan dari rumah biar puas kasi makan ikan2 disana so far recommended bgt luvvv  ', '2023-06-20', NULL, NULL, NULL, NULL, NULL, 0),
(8, '(Diterjemahkan oleh Google) Tempatnya keren<br><br>(Asli)<br>Tempatnya sejuk', '2023-06-20', NULL, NULL, NULL, NULL, NULL, 0),
(9, 'Tau tempat ini dari IG, sangat tertarik dg wahan keretanya & pemandangan sawah, belum ada memang yg seperti ini, relnya dibuat tinggi & jalurnya agak panjang, harganya pun sangat terjangkau, cukup menyenangkan memang, naik 2-3x pun rasanya masih worth it.<br>Ada kolam ikan dg air alami yg gemoy2, wahana sepeda bebek, becak terbang, kincir angin, atv dll, dg harga yg cukup terjangkau & kondisi wahan juga masih sangat baik, ya kan masih baru.<br>Lahannya cukup luas dg mayoritas ladang sawah, cukup panas dg tempat teduh yg minimalis, memang konsepnya lebih ke alam terbuka, dg pemandangan menghadap gunung (entah gunung apa itu), medan berundak & parkir cukup terbatas (agak siang sudah agak susah parkir, tapi mas2 tukang parkirnya banyak, jadi banyak yg mengarahkan & tak perlu khawatir sruduk sana sini).<br>Makanan di kantin juga cukup bervariasi & murah, stafnya semua ramah, walaupun beberapa berwajah sangar, hehe.<br>Toilet cukup bersih, air mengalir jernih, semua area juga bersih.<br>Tapi karena area sangat terbuka dg tempat teduh yg sangat terbatas, saat musim panas akan terasa sangat menyengat, & bila hujan pasti gampang basah kuyup, ada tempat rerumputan tp di lahan yg sangat kecil, itupun dipakai sekumpulan anak2 berlatih ini itu ya sudah tidak ada tempat lain, jadi pengunjung harus mencari gazebo2 yg jumlahnya sangat terbatas itu untuk sekedar duduk melepas penat, itu tempat duduk ditinggal pergi sebentar pasti sudah ada yg isi.<br>Saya kira perlu dipebanyak area rerumputan datar dg atap rimbun / pepohonan besar yg teduh, supaya pengunjung bisa menggelar tikar sendiri & menikmati santai suasana alam setelah lelah naik ke berbagai wahana / sekedar menjelajah area sawah.<br>Jadi bintang 3 cukup menurut saya, karena tidak ada nilai lebih yg membuat saya ingin kembali lagi, jadi cukup sekali saja, meskipun wahana kereta adalah 1-1nya yg bikin hepi & ngangeni.', '2023-06-19', NULL, NULL, NULL, NULL, NULL, 0),
(10, 'Jalannya lumayan naik turun dan mendekati tempat wisata jalannya agak sempit. Untungnya ada petugas di jalan yg standby dg HT mengatur lalu lintas jd aman. HTM 5rb/org parkir mobil 6rb.Ada ATV, kereta mini, bebek air, ayunan gantung, sepeda terbang, naik kuda  n pemandian n terapi ikan. Antri kereta n bebek lama bgt. Toilet bersih tp krg bnyk n dipake mandi jg jd mo pipis aja hrs ngg lama bgt. Penjual makanan n minuman harus jalan jauh ke tengah sawah ato naik ke atas pemandian. Itupun hanya jajanan gak ada nasi. Ada bbrp gazebo di tengah sawah buat nongkrong bbrp org aja. Akan lbh bagus gazebo difungsikan buat tempat makan lesehan dg menu makanan sederhana ala bekal pak tani, pasti lebih asyik makan di tengah sawah.', '2023-06-19', NULL, NULL, NULL, NULL, NULL, 0),
(11, 'klo pgen sepi, jangan datang saat weekend', '2023-06-19', NULL, NULL, NULL, NULL, NULL, 0),
(12, 'Lokasi jauh dan jalan kecil, sebaiknya kesini memakai kendaraan sutle dari Taman Ganjaran.<br>Tapi kemarin saya bener2 kecewa sutle dari Bumdes cuma ada 2 mobil sehingga tamu2 saya harus nunggu lama untuk bisa terangkut semuanya. Begitu pula saat kembali dari Sumber Gempong menuju Taman Ganjaran harus nunggu sutle lama. Hal ini membuat skedule tamu saya jadi terlambat molor sampai hampir 2 jam.<br>Parkiran mobil pribadi terbatas sehingga saat pengunjung ramai kita parkirnya sangat jauh.', '2023-06-19', NULL, NULL, NULL, NULL, NULL, 0),
(13, 'Rameeee dan antre di permainan.. Saran si utk permainan bebek air kalo bisa d ksh nomer antrean aja sperti kereta.. Biar anak2 tdk mnunggu trllu lama', '2023-06-19', NULL, NULL, NULL, NULL, NULL, 0),
(14, 'Kesana pas weekend lumayan rame sih cuman gak yg padet gitu, jalan kesananya lancar cuman untuk ke wisatanya masuk gang yg lumayan sempit gak bisa buat simpangan harus berhenti salah 1.<br>Untuk view nya lumayan cakep ada kereta kecil jg lucu, ada permainan jg lainnya kalau bisa ditambah, gazebonya jg kurang banyak..untuk harga makanan standar sih gak mahal, bagus untuk wisata keluarga. ', '2023-06-19', NULL, NULL, NULL, NULL, NULL, 0),
(15, 'Murah meriah.', '2023-06-19', NULL, NULL, NULL, NULL, NULL, 0),
(16, 'Enak tempatnya', '2023-06-18', NULL, NULL, NULL, NULL, NULL, 0),
(17, 'View sawah dan gunung sangat recomended', '2023-06-18', NULL, NULL, NULL, NULL, NULL, 0),
(18, 'Wisatanya bagus , wahana\\\" permainannya juga banyak anak kecil\\\" pada suka semua , dan pemandangannya juga bagus buat spot foto\\\"', '2023-06-18', NULL, NULL, NULL, NULL, NULL, 0),
(19, 'Menikmati wahana sepeda air', '2023-06-17', NULL, NULL, NULL, NULL, NULL, 0),
(20, 'Sangat indah,nyaman dan bisa buat wisata keluarga.harga tiket masuk cuma 5000 aja per kepala,sangat2 murah sekali.makanan di dalam juga murah dan terjangkau.air nya alami bisa buat maen air sepuas nya.', '2023-06-17', NULL, NULL, NULL, NULL, NULL, 0),
(21, 'rekomendasi wisata keluarga .<br>disarankan berangkat lebibpagi atau bisa menginap', '2023-06-17', NULL, NULL, NULL, NULL, NULL, 0),
(22, 'wisata alam yg sangat asri,,next time pingin kesini lagi udarany sejuk..ada kolam renang anak\\\" jg kolam ikan...tiket masuk jg g mahal cm 5rb makanan jg g mahal', '2023-06-16', NULL, NULL, NULL, NULL, NULL, 0),
(23, 'suasana nya sejuk bagus buat edukasi anak²', '2023-06-16', NULL, NULL, NULL, NULL, NULL, 0),
(24, 'Tempatnya Bagus, Harga Tiket Murah. Cocok untuk pergi bersama keluarga. Management tempat nya keren parah. Rekomendasi tempat wisata murah..', '2023-06-16', NULL, NULL, NULL, NULL, NULL, 0),
(25, 'Suka sama tempatnya. Bisa nongkrong lama. Makanannya murah bgt. Ikan wadernya ibu rahayu enak bgt. Uda pesan seporsi trus nambah lg 2 porsi. Makanannya murah2. Suasananya juga asyik. Bisa mandi di kolam permandian sumber mata air. Bs naik kereta sawah, main ATV, jalan2 di pematang sawah, lihat kebun. Memanjakan mata banget. Seger', '2023-06-16', NULL, NULL, NULL, NULL, NULL, 0),
(26, 'View nya bagus sekali....cocok buat anak2 maupun orang dewasa     ', '2023-06-15', NULL, NULL, NULL, NULL, NULL, 0),
(27, 'Waktu hari liburan panjang 2 mggu lalu yg berkunjung bnyk. Paling banyak antrean naek kereta nya. Pilihan makanan disana jg macem2 cuma saking banyaknya ny pengunjung butuh waktu lama untuk menyantap makanan. Kolam renang yg paling luas nya, agak kotor dan banyak sampah.  keseluruhan nya lumyan untuk refreshing ngajak keluarga', '2023-06-14', NULL, NULL, NULL, NULL, NULL, 0),
(28, 'Wisata sawah cocok untuk kluarga,ada gazebo,kolam ,kereta sawah dan banyak lagi ,dihari libur sangat ramai banyaknya pengunjung yg membludak jadi harus extra sabar dalam menunggu untuk naik wahana', '2023-06-14', NULL, NULL, NULL, NULL, NULL, 0),
(29, 'Wisata sumber gempong, wisata sawah jadi ketika kita masuk wisata ini maka yang di sajikan adalah sawah, walaupun sawah tapi tetap ada wahananya.seperti becak terbang, sepeda ontel terbang,berkuda,ATV,terapi ikan, kereta api sawah,kolam renang air sumber bukan kaporit hanya itu saja wahananya,masuk loket 5000 tiap orang plus parkir 5000.', '2023-06-14', NULL, NULL, NULL, NULL, NULL, 0),
(30, 'lumayan', '2023-06-14', NULL, NULL, NULL, NULL, NULL, 0),
(31, 'Murah meriah', '2023-06-14', NULL, NULL, NULL, NULL, NULL, 0),
(32, 'Sedikit diluar ekspektasi, fasilitas dan wahana permainan lumayan bagus, harganya juga murah,, cuma tempat ATV dan bebek airnya kurang luas, untuk restorannya harga dan rasa makanannya lumayan,,', '2023-06-14', NULL, NULL, NULL, NULL, NULL, 0),
(33, 'Cocok untk liburan kluarga maupun dg teman2<br>Saran weekday ajaa, kl weekend ngalah2i pasar ramenyaa<br>Cocok bawa motor, kl mobil parkir lumayan jauh', '2023-06-13', NULL, NULL, NULL, NULL, NULL, 0),
(34, 'Cocok utk smua usia', '2023-06-13', NULL, NULL, NULL, NULL, NULL, 0),
(35, 'Tmptnya Luaas krn sawah.. klo ingin sepi dtg pas hr biasa aja lbh nyaman... pas mendung lbh enak.. smuanya murah²', '2023-06-13', NULL, NULL, NULL, NULL, NULL, 0),
(36, 'Rameeeeee banget tempatnya. Semakin siang semakin rame dan panas. Sebaiknya datang pagi pagi saja. Sangat cocok untuk rekreasi keluarga yang punya anak anak kecil', '2023-06-13', NULL, NULL, NULL, NULL, NULL, 0),
(37, 'trus berbenah', '2023-06-13', NULL, NULL, NULL, NULL, NULL, 0),
(38, 'Tempatnya asri, sejuk dan murah. Masuk cuma 5000 + parkir motor 3000.', '2023-06-13', NULL, NULL, NULL, NULL, NULL, 0),
(39, 'Mantap buat refreshing', '2023-06-13', NULL, NULL, NULL, NULL, NULL, 0),
(40, 'Tempat Wisata Persawahan dan Kolam renang berisi air langsung dari pegunungan yang murah meriah cocok untuk berlibur bersama keluarga.', '2023-06-13', NULL, NULL, NULL, NULL, NULL, 0),
(41, 'Semoga Sumber Gempong semakin berkembang dan maju, bisa jd destinasi wisata yg menarik utk warga Mojokerto maupun luar daerah   ', '2023-06-13', NULL, NULL, NULL, NULL, NULL, 0),
(42, 'Tempat wisata keluarga yang terjangkau dari semua sisi. Baik tempat, suasana dan juga biaya.<br>Sarana prasarana terus dalam perbaikan. Ada pembangunan patung DEWI SRI yang bahannya dari bambu. KEREN BANGET, di selendangnya ada batik. Semuanya dari bambu, bayangkan betapa TOP senimannya.<br>Wahana keluarga utk berbelanja sarat dg sayuran dan produk lokal yg membangun. Area bermain juga terus dikembangkan dg adanya POJOK DOELANAN yg membuat generasi muda mengenal mainan jaman dulu. Dan generasi senior mengenang kembali hal-hal yg dirindukan dari tempo doeloe.<br>Wahana yg sudah ada, semakin dalam perbaikan. Makanan yg ada, rasanya enak dan harga terjangkau.<br><br>Kalau ada yg bilang SGP jelek, kasih bintang 1 atau 2 dan reviewnya juga jelek... maka perlu healing lebih jauh lagi...   jangan cuma keliling mall dan cafe bro and sis   <br><br>Kalau yg ngreview jelek itu seorang selebritis, maka perlu lebih lagi menghargai perjuangan hidup. Bahwa PRESTASI HIDUP berasal dari PROSES USAHA dan PERJUANGAN, bukan dari cari sensasi dari konten dan komen  ', '2023-06-13', NULL, NULL, NULL, NULL, NULL, 0),
(43, 'Hijau,pemandangan gunungnya keren banget terasa dekat banget dimata dan dihati', '2023-06-13', NULL, NULL, NULL, NULL, NULL, 0),
(44, 'Sangat jelek sekali ', '2023-06-13', NULL, NULL, NULL, NULL, NULL, 0),
(45, 'Wisata yg udaranya sejuk.. tiket masuknya murah', '2023-06-13', NULL, NULL, NULL, NULL, NULL, 0),
(46, 'Tempatnya lucu sih, pemandangan oke. Paling suka jajanan di sana dan yang seru adalah wisata kereta apinya  ', '2023-06-13', NULL, NULL, NULL, NULL, NULL, 0),
(47, 'Tempatnya enak, nyaman, sejuk ...', '2023-06-13', NULL, NULL, NULL, NULL, NULL, 0),
(48, 'Puaasss', '2023-06-13', NULL, NULL, NULL, NULL, NULL, 0),
(49, 'Wisata sawah  ', '2023-06-13', NULL, NULL, NULL, NULL, NULL, 0),
(50, 'Pengalaman baru pas berkunjung ke sawah', '2023-06-13', NULL, NULL, NULL, NULL, NULL, 0),
(51, 'Tempatnya asri di tengah persawahan, udara panas tp terasa sejuk. Cocok ngajak bocil. Harga murah meriah, makanan jg harga murah tdk ada yg menaikkan harga. Anak² bs bermain di sungai yg mengalir. Bisa ditingkatkan pembangunan jalan akses masuk dan parkir. Wahana murah². Recommended pokoknya', '2023-06-13', NULL, NULL, NULL, NULL, NULL, 0),
(52, 'Trimakasih kak vini', '2023-06-13', NULL, NULL, NULL, NULL, NULL, 0),
(53, 'Ngadem, cuman toilet kurang banyak buat ganti baju abis beremdam', '2023-06-13', NULL, NULL, NULL, NULL, NULL, 0),
(54, 'Sangat refrensi skali', '2023-06-13', NULL, NULL, NULL, NULL, NULL, 0),
(55, 'Subahannallah pemandangan dan hawanya sejuk, dan pada saat berkunjung lebih baik tidak mepet² di jam istirahat nya karena jika akan menikmati wahanha maka menunggu loketnya wahana buka lumayan agak lama.  ', '2023-06-13', NULL, NULL, NULL, NULL, NULL, 0),
(56, '(Diterjemahkan oleh Google) Destinasi keluarga, terutama bagi anak-anak untuk bermain bersama orang tuanya<br><br>(Asli)<br>Destinasi buat family terutama buat anak2bermain dgn ayah ibunya', '2023-06-13', NULL, NULL, NULL, NULL, NULL, 0),
(57, 'pemandangannya indah, tempat wisata baru yang cukup menarik di trawas, mojokerto. sayang saja, papan petunjuk masih sangat kurang, jalan menuju lokasi masi cukup susah dilalui oleh kendaraan roda 4. parkirnya terbatas. Semoga bisa cepat diperbaiki', '2023-06-13', NULL, NULL, NULL, NULL, NULL, 0),
(58, 'tempatnya belum sepenuhnya rampung, tp overall dapet pengalaman yang menyenangkan.<br>bisa jadi alternatif tujuan wisata kalau lagi ke trawas, mojokerto.', '2023-06-13', NULL, NULL, NULL, NULL, NULL, 0),
(59, 's        r   s            k  r   k     s   r m .', '2023-06-13', NULL, NULL, NULL, NULL, NULL, 0),
(60, 'Mantab sejuk pemandangan yang indah dan adem , makanan juga enak dan murah2', '2023-06-13', NULL, NULL, NULL, NULL, NULL, 0),
(61, 'Wisata mumer', '2023-06-13', NULL, NULL, NULL, NULL, NULL, 0),
(62, 'View bagus. Tiket murah. Wahana murah. Murah kabih pokok e', '2023-06-13', NULL, NULL, NULL, NULL, NULL, 0),
(63, 'Tanya?<br>Apakah jalan nya menuju ke wisata naik turun naik turun', '2023-06-13', NULL, NULL, NULL, NULL, NULL, 0),
(64, 'Tiket murah cocok untuk refresh sejenak', '2023-06-13', NULL, NULL, NULL, NULL, NULL, 0),
(65, 'Untuk yg bawa mobil hindari hari libur krn susah dapat parkir,dan untuk motor parkirannya juga jauh apa lagi panas....jadi ngga seberapa sejuk untuk udaranya', '2023-06-13', NULL, NULL, NULL, NULL, NULL, 0),
(66, 'Htm murah, tiket wahana jg murah, view lumayan ok, cuma agak panas terutama pas siang hari. Overal ok lah  ', '2023-06-13', NULL, NULL, NULL, NULL, NULL, 0),
(67, 'Nice view<br><br>(Diterjemahkan oleh Google)<br>Pemandangan yang bagus', '2023-06-06', NULL, NULL, NULL, NULL, NULL, 0),
(68, 'Asik kereta nya, keliling sawah, tetapi saat naik rebutan tidak sesuai nomer urut,', '2023-06-06', NULL, NULL, NULL, NULL, NULL, 0),
(69, 'disini apa ada tempat penitipan barang untuk yang berenang ya ?', '2023-06-06', NULL, NULL, NULL, NULL, NULL, 0),
(70, 'Istimewa...  Tiket masuk murah ditambah pelayanan juga ramah .', '2023-06-06', NULL, NULL, NULL, NULL, NULL, 0),
(71, 'Salah satu contoh BUMDES Desa Wisata yg bisa di contoh', '2023-06-06', NULL, NULL, NULL, NULL, NULL, 0),
(72, 'Kalau libur sukanya main kesini sm keluarga. Paling suka naik keretanya karena viewnya masyaa Allah sekali.. Makanan disini juga termasuk standar yaa untuk sekelas tempat wisata di trawas, bahkan bisa dibilang lebih murah. Kesini selalu pas agak mendung jd enak suasana terasa adem, isis...', '2023-06-06', NULL, NULL, NULL, NULL, NULL, 0),
(73, 'Wisata murah tapi panas<br>The reaal sawah', '2023-06-06', NULL, NULL, NULL, NULL, NULL, 0),
(74, 'Keren... Saran aja kalo kesini better lewat jalur mojosari drpd prigen... Jalannya lebih landai', '2023-06-06', NULL, NULL, NULL, NULL, NULL, 0),
(75, 'Wisata keluarga dengan tiket yang murah ,ada wahana permainan yang berbayar dan juga yang gratis dengan nuansa sawah dan gunung penanggungan udara yang sejuk cocok untuk nongkrong juga terdapat banyak warung disekitar', '2023-06-06', NULL, NULL, NULL, NULL, NULL, 0),
(76, 'Pemandangan sawahnya cantik, Gubuk sawahnya mohon ditambah', '2023-06-06', NULL, NULL, NULL, NULL, NULL, 0),
(77, 'Untuk sejenak melepas penat menjauh dari kebisingan kota...<br>Htm murce, banyak pilihan permainan utk anak² maupun org dewasa...<br>Bisa berenanh sepuasnya dan terapi ikan juga, spot foto yg dijamin anti menyesal dtg ke tempat ini... Recomended  ', '2023-06-06', NULL, NULL, NULL, NULL, NULL, 0),
(78, 'Alhamdulillah tempat bagus wahana juga banyak', '2023-06-06', NULL, NULL, NULL, NULL, NULL, 0),
(79, 'Suasananya alami seperti dipedesaan', '2023-06-06', NULL, NULL, NULL, NULL, NULL, 0),
(80, 'wisata sawah murmer utk keluarga, rame sekali, naik wahana harganya jg merakyat.... <br>masih perlu banyak berbenah, kasi tempat teduh yg banyak, biar tamunya pd betah  <br>utk penjual di relokasikan, biar rapi, msh perlu tempat parkir yg luas, dan tempat sampah msh sedikit<br>btw, masih mantaappp lah      ', '2023-06-06', NULL, NULL, NULL, NULL, NULL, 0),
(81, 'Tradisional Bangeet dan keren', '2023-06-06', NULL, NULL, NULL, NULL, NULL, 0),
(82, 'Bagus sih cuma tempat istirahat nya kurang.klo musim kemarau panasnya gila2 an...dan bingung mau neduh dmana .', '2023-06-06', NULL, NULL, NULL, NULL, NULL, 0),
(83, 'Crowded. Saran saja, mohon ditambah lagi fasum tempat duduk di sekitar area kolam. Dan atau lokasi ramai lainnya', '2023-06-06', NULL, NULL, NULL, NULL, NULL, 0),
(84, 'Linmas dan petugas tidak membantu, malah kasar banget ngasi informasinya. Bad experience sih', '2023-06-06', NULL, NULL, NULL, NULL, NULL, 0),
(85, 'Bagus view gunung dan sawah. Ada beberapa permainan seperti ATV, kereta dll berbayar.<br><br>HTM 10 rb peroang, parkir 10 rb.<br><br>Ada kolam sumber airnya terlihat keruh karena tanpa keramik. Air sumber asli.<br><br>Saya sarankan kesini sore, karena sangat panas kalau siang.', '2023-06-06', NULL, NULL, NULL, NULL, NULL, 0),
(86, 'Wisata yg menyajikan suasana persawahan di gunung dan banyak wahana permainan cocok untuk keluarga.', '2023-06-06', NULL, NULL, NULL, NULL, NULL, 0),
(87, 'Harga tiket masuk dan wahana ramah dikantong .<br>Saran saya sebaiknya kolam terapi ikan diberi atap biar ga terlalu panas bgt. Yg kedua, jumlah wahana bebek airnya ditambah agar antrinya tidak terlalu panjang. Semoga makin maju dan bertambah wahana nya :)', '2023-06-06', NULL, NULL, NULL, NULL, NULL, 0),
(88, 'Jangan lupa bawa pakan ikan, puassssss kasih makan ikan di kolam sepeda angsa.<br>Makanan sedep (penyetan) harga masuk akal.<br>Parkir mobil udah banyak.<br>Mushollah ada beberapa titik, bersih, toilet juga.<br>Main air anak² banyakkkk & puas', '2023-06-06', NULL, NULL, NULL, NULL, NULL, 0),
(89, 'Suka tempatnya, banyak permainan untuk anak2 dan dewasa ( ATV ), hanya saja blm ada lampu jd hanya bisa sampai sblm maghrib saja karena setelah itu pasti gelap, smoga kedepannya bs ada lampu', '2023-06-06', NULL, NULL, NULL, NULL, NULL, 0),
(90, 'Bagus,ngilangin penat disini oke bgt. Suasana desa seger. Harga makanan jg terjangkau, utk permainan jg terjangkau. Palagi utk HTMnya murmer     gak bosen utk balik lg disini    ', '2023-06-06', NULL, NULL, NULL, NULL, NULL, 0),
(91, 'Saya kesana pas rame banget dan banyak yg sedang halal bihalal. Jadi kurang puas.', '2023-06-06', NULL, NULL, NULL, NULL, NULL, 0),
(92, 'Nyaman bwt liburqn keluarga,airnya dingin dan bersih...wisata murah tp sdh terhibur', '2023-06-06', NULL, NULL, NULL, NULL, NULL, 0),
(93, 'Cocok untuk berkumpul bersama keluarga', '2023-06-06', NULL, NULL, NULL, NULL, NULL, 0),
(94, 'cocok untuk healing bersama keluarga', '2023-06-06', NULL, NULL, NULL, NULL, NULL, 0),
(95, 'Banyak wahana, tempat view bagus, karena ini tempat wisata keluarga akan lebih baik untuk yang merokok ada tempat sendiri sehingga tidak merokok di arena tempat anak anak kecil atau d area  wahana yang banyak pengunjung', '2023-06-06', NULL, NULL, NULL, NULL, NULL, 0),
(96, 'Wisata Sawah Sumber Gempong merupakan salah satu destinasi baru di Sukorame, Desa Ketapanrame, Kecamatan Trawas, Kabupaten Mojokerto, Jawa Timur.<br><br>Wisata ini menarik untuk dikunjungi selain keindahan alamnya berupa area persawahan di bawah kaki Gunung Penanggungan yang berjarak tidak jauh dari Taman Ghanjaran. Hanya sekitar 1 kilometer atau sekitar 5 10 menit berkendara.<br><br>Rute menuju kawasan itu berliku, tetapi memiliki kualitas jalan yang bagus. Kalau ke sini lebih direkomendasikan menggunakan motor karena akan melewati jalan perkampungan yang sempit. Tapi naik mobil juga bisa.<br><br>Udara di Sumber Gempong selalu sejuk karena berada di kaki gunung. Selain itu panorama alamnya sangat indah. Hamparan persawahan terasa indah dengan sumber mata air yang jernih.<br><br>Bernuansa pedesaan dengan kicauan burung dan gemericik air, Wisata Sumber Gempong cocok buat siapa yang tengah jenuh setelah melakukan aktivitas sehari-hari.<br><br>Selain itu terdapat kolam renang besar yang juga berasal dari sumber air pegunungan. Airnya begitu segar dan murni tanpa menggunakan kaporit sedikitpun. Sangat mengasyikkan dan menenangkan hati. Bisa berenang dan berendam sambil menikmati pemandangan Gunung Penanggungan.<br><br>Tidak hanya itu, Sumber Gempong adalah sebuah mata air yang menjadi urat nadi para petani di sekitarnya. Konon menurut cerita warga, mata air tersebut tidak pernah kering walau saat musim kemarau sekali pun.<br><br>Sumber Gempong mungkin bisa menjadi sajian wajib ketika menghabiskan hari libur bersama<br>keluarga.', '2023-06-06', NULL, NULL, NULL, NULL, NULL, 0),
(97, 'Kalau pas hari libur cari parkiran mobil agak susah , penuh .', '2023-06-06', NULL, NULL, NULL, NULL, NULL, 0),
(98, 'Viewnya alami, bagus harga murah', '2023-06-06', NULL, NULL, NULL, NULL, NULL, 0),
(99, 'Sumber gempong menyajikan pemandangan sawah terasiring dengan nuansa pegunungan yang asri. Disekelilingnya terdapat wahana bermain bagi sekecil maupun dewasa. Harga tiket juga terjangkau. Kolam pemandian dan terapi ikan gratis. Wahana permainan tutup sampai jam 5 sore, cafe tetap buka malam. Semoga senantiasa asri.', '2023-06-06', NULL, NULL, NULL, NULL, NULL, 0),
(100, 'Hansip satpam nya yg ngatur jalan jahat² . Beri tau lah agar ramah sedikit ke pengunjung', '2023-06-06', NULL, NULL, NULL, NULL, NULL, 0),
(101, 'Bagus sih.. cuma tempat berteduh nya kurang banyak...', '2023-06-06', NULL, NULL, NULL, NULL, NULL, 0),
(102, 'Panas.......tempat makannya murah2 .....makanannya enak enak....', '2023-06-06', NULL, NULL, NULL, NULL, NULL, 0),
(103, 'Sangat cocok untuk wisata keluarga', '2023-06-06', NULL, NULL, NULL, NULL, NULL, 0),
(104, 'Udah bolak balik kesini,<br>Tempat wisata alam paling recommended.<br>Sejuk bgt, dan bisa berenang juga<br>Makanan yg dijual murah2, petugas juga ramah2.<br>Cocok bgt buat refresh dari sibuknya aktifitas', '2023-06-06', NULL, NULL, NULL, NULL, NULL, 0),
(105, 'Wisata yang recommended di Trawas, ada ground yang bisa buat piknik, terapi ikan gratis bisa dicoba juga nih, ATV juga seru hanya 20rb.. ada warung di atas dengan view yang keren..', '2023-06-06', NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(1, 'jehuda', 'jehuda1121@gmail.com', '$2y$10$ZTsEOogyd5g1qHTZ4gv3w.CNe9Hte7U7nXVSUXuiZTKbhU2vu4X3.'),
(2, 'Sumber Gempong', 'sumber@gmail.com', '$2y$10$8JqCiRhyo55LrAjOWoRe/e2dRDAn5Ls/Rc.pmPYQ6AtV1rkv1Exym');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aplikasi`
--
ALTER TABLE `aplikasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ulasan`
--
ALTER TABLE `ulasan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ulasan_aplikasi_idx` (`aplikasi_id`);

--
-- Indexes for table `ulasan_sementara`
--
ALTER TABLE `ulasan_sementara`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ulasan_sementara_aplikasi1_idx` (`aplikasi_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ulasan`
--
ALTER TABLE `ulasan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1422;

--
-- AUTO_INCREMENT for table `ulasan_sementara`
--
ALTER TABLE `ulasan_sementara`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ulasan`
--
ALTER TABLE `ulasan`
  ADD CONSTRAINT `fk_ulasan_aplikasi` FOREIGN KEY (`aplikasi_id`) REFERENCES `aplikasi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ulasan_sementara`
--
ALTER TABLE `ulasan_sementara`
  ADD CONSTRAINT `fk_ulasan_sementara_aplikasi1` FOREIGN KEY (`aplikasi_id`) REFERENCES `aplikasi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
