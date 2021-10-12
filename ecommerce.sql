-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mer. 25 août 2021 à 10:42
-- Version du serveur :  5.7.32
-- Version de PHP : 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données : `ecommerce`
--

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210821230724', '2021-08-22 00:38:29', 178);

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `price` float NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `image`, `created_at`, `modified_at`, `price`, `content`) VALUES
(1, 1, 'Aurore NL4B-8-S2', '	https://media.ldlc.com/r150/ld/products/00/05/63/42/LD0005634271_2_0005812258.jpg', '2021-07-23 12:10:31', '2021-07-23 12:10:31', 389.99, 'Intel Celeron N4120 8 Go SSD 240 Go 15.6\" LED Full HD Wi-Fi AC/Bluetooth Webcam (sans OS)'),
(2, 1, 'Bellone BE7-16-M10-P', 'https://media.ldlc.com/r150/ld/products/00/05/71/00/LD0005710067_1.jpg', '2021-08-22 02:15:44', '2021-08-22 02:15:44', 1899.99, 'Intel Core i7-10875H 16 Go SSD 960 Go 15.6\" LED Full HD 144 Hz NVIDIA GeForce RTX 2070 SUPER 8 Go Wi-Fi AX/Bluetooth Webcam Windows 10 Professionnel 64 bits'),
(3, 1, 'LDLC Aurore NL5B-8-S4', 'https://media.ldlc.com/r150/ld/products/00/05/63/42/LD0005634271_2_0005812258.jpg', '2021-07-23 12:10:31', '2021-07-23 12:10:31', 589.94, 'Intel Pentium Silver N5030 8 Go SSD 480 Go 15.6\" LED Full HD Wi-Fi AC/Bluetooth Webcam (sans OS)'),
(4, 1, 'Bellone GXL72-32-2M10-H', 'https://media.ldlc.com/r150/ld/products/00/05/71/00/LD0005710067_1.jpg', '2021-08-22 02:15:44', '2021-08-22 02:15:44', 2519.99, 'Intel Core i7-10870H 32 Go SSD 1920 Go (2x 960 Go) 17.3\" LED Full HD 240 Hz NVIDIA GeForce RTX 3070 8 Go Wi-Fi AX/Bluetooth Webcam Windows 10 Famille 64 bits'),
(5, 1, 'Bellone GXS83-16-M2M10-P', 'https://media.ldlc.com/r150/ld/products/00/05/71/00/LD0005710067_1.jpg', '2021-07-23 12:10:31', '2021-07-23 12:10:31', 3069.95, 'Intel Core i7-10870H 16 Go SSD 240 Go + SSD 960 Go 15.6\" LED Full HD 300 Hz NVIDIA GeForce RTX 3080 16 Go Wi-Fi AX/Bluetooth Webcam Windows 10 Professionnel 64 bits'),
(8, 2, 'PC In extensor-SSD', 'https://media.ldlc.com/r150/ld/products/00/05/73/91/LD0005739119_1.jpg', '2021-08-22 02:45:48', '2021-08-22 02:45:48', 459.95, 'Intel Core i3-10100 (3.6 GHz / 4.3 GHz) 8 Go SSD 480 Go Graveur DVD Wi-Fi N (Sans OS - non monté)'),
(9, 2, 'PC Zen Plus Perfect', 'https://media.ldlc.com/r150/ld/products/00/05/70/89/LD0005708931_1_0005843125.jpg', '2021-08-22 02:45:48', '2021-08-22 02:45:48', 1895.94, 'AMD Ryzen 7 5800X (3.8 GHz / 4.7 GHz) 32 Go SSD 480 Go + HDD 2 To NVIDIA GeForce RTX 3060 12 Go (sans OS - monté)'),
(10, 2, 'PC10 CézaR', 'https://media.ldlc.com/r150/ld/products/00/05/75/13/LD0005751321_1.jpg', '2021-08-22 02:51:44', '2021-08-22 02:51:44', 2369.99, 'AMD Ryzen 7 5800X (3.8 GHz / 4.7 GHz) 16 Go SSD NVMe 480 Go + HDD 2 To AMD Radeon RX 6700 XT 12 Go Windows 10 Famille 64 bits (monté)'),
(11, 2, 'PC10 Frackass-SSD', 'https://media.ldlc.com/r150/ld/products/00/05/20/99/LD0005209937_2.jpg', '2021-08-22 02:51:44', '2021-08-22 02:51:44', 649.94, 'Intel Celeron G5905 (3.5 GHz) 8 Go SSD 240 Go Graveur DVD Wi-FI N Windows 10 Professionnel 64 bits (monté)'),
(12, 2, 'PC10P Zen Artist 3', 'https://media.ldlc.com/r150/ld/products/00/05/30/49/LD0005304958_2_0005698652.jpg', '2021-08-22 02:56:51', '2021-08-22 02:56:51', 999.98, 'AMD Ryzen 3 Pro 4350G (3.8 GHz/4.0 GHz) - 16 Go DDR4 - SSD 240 Go + HDD 2 To Windows 10 Professionnel 64 bits (monté)'),
(13, 3, 'Acer 23.8\" LED - Nitro XV242YPbmiiprx', 'https://media.ldlc.com/r150/ld/products/00/05/59/44/LD0005594433_2.jpg', '2021-08-22 02:59:27', '2021-08-22 02:59:27', 239.95, '1920 x 1080 pixels - 0.5 ms - Format 16/9 - Dalle IPS - HDR400 - 144 Hz (165 Hz OC) - FreeSync Premium / Compatible G-Sync - HDMI/DisplayPort - Pivot - Noir'),
(14, 3, 'Abkoncore A530', 'https://media.ldlc.com/r150/ld/products/00/05/53/53/LD0005535333_2.jpg', '2021-08-22 02:59:27', '2021-08-22 02:59:27', 29.95, 'Souris gaming - filaire - droitier - capteur optique Pixart PMW 3325 de 4000 dpi - 6 +2 boutons - interrupteurs Omron - rétroéclairage RGB'),
(15, 3, 'Accuratus 595 (PS/2)', 'https://media.ldlc.com/r150/ld/products/00/05/40/81/LD0005408153_2.jpg', '2021-08-22 02:59:27', '2021-08-22 02:59:27', 59.95, 'Clavier filaire compact - Interface PS/2 - AZERTY, Français'),
(16, 3, 'Oculus Quest 128 Go', 'https://media.ldlc.com/r150/ld/products/00/05/30/95/LD0005309557_2_0005309698.jpg', '2021-08-22 02:59:27', '2021-08-22 02:59:27', 549.95, 'Casque de réalité virtuelle tout-en-un sans fil ni PC ni Smartphone avec Manette et 128 Go de stockage'),
(17, 3, 'AKG Lyra', 'https://media.ldlc.com/r150/ld/products/00/05/53/58/LD0005535868_2.jpg', '2021-08-22 02:59:27', '2021-08-22 02:59:27', 149.95, 'Microphone à directivité multiple et prise casque (USB)'),
(18, 4, 'Abkoncore AL1000 Rouge', 'https://media.ldlc.com/r150/ld/products/00/05/70/91/LD0005709164_1.jpg', '2021-08-22 03:13:23', '2021-08-22 03:13:23', 699.95, 'Boîtier Grand Tour avec panneaux en verre trempé et éclairage ARGB'),
(19, 4, 'Abkoncore AL300M Rose Gold', 'https://media.ldlc.com/r150/ld/products/00/05/86/34/LD0005863424_1.jpg', '2021-08-22 03:13:23', '2021-08-22 03:13:23', 279.95, 'Boîtier Mini Tour en Aluminium avec façade et fenêtre latérale en verre trempé - Rose'),
(20, 4, 'Abkoncore C700', 'https://media.ldlc.com/r150/ld/products/00/05/80/92/LD0005809205_1.jpg', '2021-08-22 03:13:23', '2021-08-22 03:13:23', 69.95, 'Boîtier Moyen Tour avec panneau latéral en verre trempé et retroéclairage RGB'),
(21, 4, 'Abkoncore H300G - Blanc', 'https://media.ldlc.com/r150/ld/products/00/05/80/84/LD0005808404_1.jpg', '2021-08-22 03:13:23', '2021-08-22 03:13:23', 139.96, 'Boîtier Moyen Tour avec panneau latéral en verre trempé et éclairage RGB'),
(22, 4, 'Abkoncore H600X Sync', 'https://media.ldlc.com/r150/ld/products/00/05/68/61/LD0005686154_1.jpg', '2021-08-22 03:13:23', '2021-08-22 03:13:23', 89.95, 'Boîtier Moyen Tour avec panneau avant en nid d\'abeille, panneau latéral en verre trempé et éclairage ARGB'),
(23, 5, 'EC-500 Quality Select 80PLUS Bronze', 'https://media.ldlc.com/r150/ld/products/00/04/20/74/LD0004207480_2.jpg', '2021-08-22 03:20:45', '2021-08-22 03:20:45', 69.95, 'Alimentation 500W ATX 12V Ventilateur 120 mm - 80PLUS Bronze'),
(24, 5, 'LDLC GT-550P Quality Select 80PLUS Platinum', 'https://media.ldlc.com/r150/ld/products/00/04/58/05/LD0004580546_2.jpg', '2021-08-22 03:20:45', '2021-08-22 03:20:45', 99.95, 'Alimentation 100% modulaire 550W ATX 12V Ventilateur 120 mm - 80PLUS Platinum'),
(25, 5, 'Abkoncore Mighty 230V 500W Modular', 'https://media.ldlc.com/r150/ld/products/00/05/53/47/LD0005534747_2.jpg', '2021-08-22 03:21:14', '2021-08-22 03:21:14', 69.95, 'Alimentation modulaire 500W ATX 12V 2.5 / EPS 12V (Garantie 7 ans constructeur) - 80PLUS'),
(26, 5, 'Abkoncore TN850W Modular', 'https://media.ldlc.com/r150/ld/products/00/05/81/56/LD0005815660_1.jpg', '2021-08-22 03:21:14', '2021-08-22 03:21:14', 159.95, 'Alimentation modulaire 850W ATX 12V 2.5 / EPS 12V (Garantie 10 ans constructeur) - 80PLUS Gold'),
(27, 5, 'Aerocool Aero Bronze 750M', 'https://media.ldlc.com/r150/ld/products/00/05/78/78/LD0005787892_1.jpg', '2021-08-22 03:21:14', '2021-08-22 03:21:14', 99.95, 'Alimentation 100% modulaire 750W ATX12V v2.52 - 80PLUS Bronze'),
(28, 6, 'SSD F6 PLUS M.2 2280 3D NAND 960 GB', 'https://media.ldlc.com/r150/ld/products/00/05/01/47/LD0005014785_2_0005428705.jpg', '2021-08-22 03:28:48', '2021-08-22 03:28:48', 154.96, 'SSD 960 Go NAND 3D TLC M.2 2280 SATA 6 Gbps'),
(29, 6, 'SSD F7 PLUS 3D NAND 960 GB', 'https://media.ldlc.com/r150/ld/products/00/04/77/95/LD0004779524_2_0005018807.jpg', '2021-08-22 03:28:48', '2021-08-22 03:28:48', 159.95, 'SSD 960 Go NAND 3D TLC 2.5\" 7mm Serial ATA 6Gb/s'),
(30, 6, 'SSD F8 PLUS M.2 2280 PCIE NVME 480 GB', 'https://media.ldlc.com/r150/ld/products/00/05/16/87/LD0005168747_2.jpg', '2021-08-22 03:28:48', '2021-08-22 03:28:48', 64.94, 'SSD 480 Go NAND 3D TLC M.2 2280 PCI-E 3.0 4x NVMe'),
(31, 6, 'Textorm B5 SSD 960 Go', 'https://media.ldlc.com/r150/ld/products/00/05/76/91/LD0005769158_1_0005769179.jpg', '2021-08-22 03:28:48', '2021-08-22 03:28:48', 109.96, 'SSD 960 Go NAND 3D TLC 2.5\" 7mm Serial ATA 6Gb/s'),
(32, 6, 'Textorm BM5 SSD 480 Go', 'https://media.ldlc.com/r150/ld/products/00/05/77/47/LD0005774756_1.jpg', '2021-08-22 03:28:48', '2021-08-22 03:28:48', 59.95, 'SSD 480 Go NAND 3D TLC M.2 SATA 2280'),
(33, 7, 'ASRock 760GM-HDV', 'https://media.ldlc.com/r150/ld/products/00/04/96/09/LD0004960909_2.jpg', '2021-08-22 03:41:06', '2021-08-22 03:41:06', 57.95, 'Carte mère micro-ATX Socket AM3/AM3+ AMD 760G - AMD Radeon HD 3000 - SATA 3Gbit/s - USB 2.0 - 1 x PCI Express 2.0 16x'),
(34, 7, 'ASRock A320M Pro4-F', 'https://media.ldlc.com/r150/ld/products/00/05/65/78/LD0005657847_2.jpg', '2021-08-22 03:41:06', '2021-08-22 03:41:06', 77.95, 'Carte mère Micro ATX Socket AM4 AMD A320 - 4x DDR4 - M.2 - USB 3.0 - 1x PCI-Express 3.0 16x'),
(35, 7, 'ASRock A320M-ITX', 'https://media.ldlc.com/r150/ld/products/00/05/69/56/LD0005695622_1.jpg', '2021-08-22 03:41:36', '2021-08-22 03:41:36', 94.96, 'Carte mère Mini ITX Socket AM4 AMD A320 - 2x DDR4 - M.2 PCIe NVMe - USB 3.0 - 1x PCI-Express 3.0 16x'),
(36, 7, 'ASRock A520M Pro4', 'https://media.ldlc.com/r150/ld/products/00/05/70/87/LD0005708793_1.jpg', '2021-08-22 03:41:36', '2021-08-22 03:41:36', 109.94, 'Carte mère Micro ATX Socket AM4 AMD A520 - 4x DDR4 - M.2 PCIe NVMe - USB 3.0 - 1x PCI-Express 3.0 16x'),
(37, 7, 'ASRock B365 Pro4', 'https://media.ldlc.com/r150/ld/products/00/05/27/63/LD0005276336_2.jpg', '2021-08-22 03:41:36', '2021-08-22 03:41:36', 111.94, 'Carte mère ATX Socket 1151 Intel B365 Express - 4x DDR4 - SATA 6Gb/s + M.2 - USB 3.0 - 2x PCI-Express 3.0 16x'),
(38, 8, 'Gigabyte AORUS GeForce RTX 3080 MASTER 10G (rev. 2.0)', 'https://media.ldlc.com/r150/ld/products/00/05/86/97/LD0005869780_1.jpg', '2021-08-22 03:48:01', '2021-08-22 03:48:01', 1329.95, '10 Go GDDR6X - Tri HDMI/Tri DisplayPort - PCI Express (NVIDIA GeForce RTX 3080)'),
(39, 8, 'ASRock AMD Radeon RX 6700 XT Challenger Pro 12GB OC', 'https://media.ldlc.com/r150/ld/products/00/05/80/28/LD0005802836_1.jpg', '2021-08-22 03:48:01', '2021-08-22 03:48:01', 989.95, '12 Go GDDR6 - HDMI/Tri DisplayPort - PCI Express (AMD Radeon RX 6700 XT)'),
(40, 8, 'ASUS TUF GeForce RTX 3080 Ti O12G GAMING', 'https://media.ldlc.com/r150/ld/products/00/05/83/86/LD0005838655_1.jpg', '2021-08-22 03:49:45', '2021-08-22 03:49:45', 1969.84, '12 Go GDDR6X - Dual HDMI/Tri DisplayPort - PCI Express (NVIDIA GeForce RTX 3080 Ti)'),
(41, 8, 'ASUS TUF GeForce RTX 3090 O24G GAMING', 'https://media.ldlc.com/r150/ld/products/00/05/72/59/LD0005725987_1.jpg', '2021-08-22 03:49:45', '2021-08-22 03:49:45', 2399.95, '24 Go GDDR6X - Dual HDMI/Tri DisplayPort - PCI Express (NVIDIA GeForce RTX 3090)'),
(42, 8, 'ASUS DUAL GeForce RTX 3060 12G (LHR)', 'https://media.ldlc.com/r150/ld/products/00/05/84/99/LD0005849903_1.jpg', '2021-08-22 03:49:45', '2021-08-22 03:49:45', 579.95, '12 Go GDDR6 - HDMI/Tri DisplayPort - PCI Express (NVIDIA GeForce RTX 3060)'),
(43, 9, 'Textorm 16 Go (2x 8 Go) DDR4 2666 MHz CL19', 'https://media.ldlc.com/r150/ld/products/00/05/75/36/LD0005753605_1.jpg', '2021-08-22 03:54:22', '2021-08-22 03:54:22', 105.95, 'Kit Dual Channel 2 barrettes de RAM DDR4 PC4-21300 - 2XTXU8G1M2666C1'),
(44, 9, 'Textorm 16 Go (2x 8 Go) DDR4 3200 MHz CL16', 'https://media.ldlc.com/r150/ld/products/00/05/75/36/LD0005753605_1.jpg', '2021-08-22 03:54:22', '2021-08-22 03:54:22', 107.95, 'Kit Dual Channel 2 barrettes de RAM DDR4 PC4-25600 - 2XTXU8G1M3200C'),
(45, 9, 'Ballistix Black 16 Go (2 x 8 Go) DDR4 2666 MHz CL16', 'https://media.ldlc.com/r150/ld/products/00/05/58/82/LD0005588241_2.jpg', '2021-08-22 03:56:53', '2021-08-22 03:56:53', 110.95, 'Kit Dual Channel RAM DDR4 PC4-21300 - BL2K8G26C16U4B'),
(46, 9, 'Ballistix Black RGB DDR4 16 Go (2 x 8 Go) 3200 MHz CL16', 'https://media.ldlc.com/r150/ld/products/00/05/58/79/LD0005587987_2_0005588327.jpg', '2021-08-22 03:56:53', '2021-08-22 03:56:53', 139.94, 'Kit Dual Channel RAM DDR4 PC4-25600 - BL2K8G32C16U4BL'),
(47, 9, 'Ballistix Elite 8 Go DDR4 4000 MHz CL18', 'https://media.ldlc.com/r150/ld/products/00/05/27/62/LD0005276238_2_0005455382.jpg', '2021-08-22 03:56:53', '2021-08-22 03:56:53', 178.94, 'RAM DDR4 PC4-32000 - BLE8G4D40BEEAK'),
(48, 10, 'AMD Ryzen 3 1200 AF Wraith Stealth Edition (3.1 GHz / 3.4 GHz)', 'https://media.ldlc.com/r150/ld/products/00/04/29/02/LD0004290252_2_0004290403_0004290483_0005592711.jpg', '2021-08-22 04:00:19', '2021-08-22 04:00:19', 89.95, 'Processeur Quad-Core 4-Threads socket AM4 Cache L3 8 Mo 0.012 micron TDP 65W avec système de refroidissement (version boîte - garantie constructeur 3 ans)'),
(49, 10, 'AMD Ryzen 5 2600 Wraith Stealth Edition (3.4 GHz)', 'https://media.ldlc.com/r150/ld/products/00/04/29/02/LD0004290252_2_0004290403_0004290483_0004861683.jpg', '2021-08-22 04:00:19', '2021-08-22 04:00:19', 189.95, 'Processeur 6-Core 12-Threads socket AM4 Cache L3 16 Mo 0.012 micron TDP 65W avec système de refroidissement (version boîte - garantie constructeur 3 ans)'),
(50, 10, 'AMD Ryzen 5 5600G Wraith Stealth (3.9 GHz / 4.4 GHz)', 'https://media.ldlc.com/r150/ld/products/00/05/86/87/LD0005868714_1.jpg', '2021-08-22 04:02:23', '2021-08-22 04:02:23', 314.95, 'Processeur 6-Core 12-Threads socket AM4 Cache L3 16 Mo Radeon Vega Graphics 7 7 nm TDP 65W avec système de refroidissement (version boîte - garantie constructeur 3 ans)Processeur 6-Core 12-Threads socket AM4 Cache L3 16 Mo Radeon Vega Graphics 7 7 nm TDP 65W avec système de refroidissement (version boîte - garantie constructeur 3 ans)'),
(51, 10, '\r\nIntel Core i3-10105F (3.7 GHz / 4.4 GHz)', 'https://media.ldlc.com/r150/ld/products/00/05/83/68/LD0005836861_1.jpg', '2021-08-22 04:02:23', '2021-08-22 04:02:23', 119.95, 'Processeur 4-Core 8-Threads Socket 1200 Cache L3 6 Mo 0.014 micron (version boîte - garantie Intel 3 ans)'),
(52, 10, 'Intel Core i3-10100F (3.6 GHz / 4.3 GHz)', 'https://media.ldlc.com/r150/ld/products/00/05/67/33/LD0005673301_1_0005738184.jpg', '2021-08-22 04:02:23', '2021-08-22 04:02:23', 99.95, 'Processeur 4-Core 8-Threads Socket 1200 Cache L3 6 Mo 0.014 micron (version boîte - garantie Intel 3 ans)'),
(53, 11, 'Aerocool Mirage L240', 'https://media.ldlc.com/r150/ld/products/00/05/78/35/LD0005783566_1.jpg', '2021-08-22 04:07:25', '2021-08-22 04:07:25', 99.95, 'Kit de watercooling tout-en-un 240 mm pour processeur avec rétroéclairage ARGB'),
(54, 11, 'Aerocool Mirage L360 (Blanc)', 'https://media.ldlc.com/r150/ld/products/00/05/82/40/LD0005824058_1.jpg', '2021-08-22 04:07:25', '2021-08-22 04:07:25', 119.95, 'Kit de watercooling tout-en-un 360 mm pour processeur avec rétroéclairage ARGB'),
(55, 11, 'Abkoncore CT406W Spectrum Dual', 'https://media.ldlc.com/r150/ld/products/00/05/68/46/LD0005684667_1.jpg', '2021-08-22 04:10:09', '2021-08-22 04:10:09', 49.94, 'Ventilateur de processeur Led RGB PMW 2 x 120 mm pour socket Intel et AMD'),
(56, 11, '\r\nAbkoncore CC120 ARGB Spectrum Sync (3 in 1)', 'https://media.ldlc.com/r150/ld/products/00/05/83/80/LD0005838039_1.jpg', '2021-08-22 04:10:09', '2021-08-22 04:10:09', 39.95, 'Pack de 3 ventilateurs LED ARGB 120 mm avec boîtier de contrôle et télécommande'),
(57, 11, '\r\nAbkoncore Spider Spectrum 5-in-1 Remote Kit', 'https://media.ldlc.com/r150/ld/products/00/05/30/39/LD0005303967_2.jpg', '2021-08-22 04:10:09', '2021-08-22 04:10:09', 71.95, 'Pack de 5 ventilateurs LED RGB 120 mm avec boîtier de contrôle et télécommande'),
(58, 12, 'ASUS Strix Raid Pro', 'https://media.ldlc.com/r150/ld/products/00/03/32/67/LD0003326749_2.jpg', '2021-08-22 04:15:47', '2021-08-22 04:15:47', 149.95, 'Carte son PCI-Express 7.1 avec convertisseur analogique-numérique'),
(59, 12, 'ASUS Strix Soar', 'https://media.ldlc.com/r150/ld/products/00/03/32/59/LD0003325989_2.jpg', '2021-08-22 04:15:47', '2021-08-22 04:15:47', 109.94, 'Carte son PCI-Express 7.1'),
(60, 12, 'ASUS Xonar AE', 'https://media.ldlc.com/r150/ld/products/00/04/70/23/LD0004702363_2.jpg', '2021-08-22 04:19:31', '2021-08-22 04:19:31', 79.94, 'Carte son PCI-Express 1x 7.1 Dolby'),
(61, 12, 'Carte son 5.1 PCI', 'https://media.ldlc.com/r150/ld/products/00/03/59/85/LD0003598570_2.jpg', '2021-08-22 04:19:31', '2021-08-22 04:19:31', 19.94, 'Compatible Windows et Linux'),
(62, 12, 'ASUS ROG Clavis', 'https://media.ldlc.com/r150/ld/products/00/05/78/03/LD0005780338_1.jpg', '2021-08-22 04:19:31', '2021-08-22 04:19:31', 139.94, 'Carte son USB-C vers Jack 3.5 mm - technologie de suppression du bruit - rétroéclairage RGB Aura Sync'),
(63, 13, 'ASUS PCE-AC51', 'https://media.ldlc.com/r150/ld/products/00/03/66/69/LD0003666983_2.jpg', '2021-08-22 04:23:55', '2021-08-22 04:23:55', 40.96, 'Carte PCI Express Wi-Fi AC750 (AC433 Mbps + N300 Mbps)'),
(64, 13, 'ASUS PCE-AC68', 'https://media.ldlc.com/r150/ld/products/00/01/42/53/LD0001425398_2.jpg', '2021-08-22 04:23:55', '2021-08-22 04:23:55', 82.95, 'Carte PCI Express Wi-Fi AC 1300 Mbps + 600 Mbps\r\n\r\n'),
(65, 13, 'ASUS PCE-N15', 'https://media.ldlc.com/r150/ld/products/00/01/25/94/LD0001259495_2.jpg', '2021-08-22 04:25:45', '2021-08-22 04:25:45', 26.95, 'Carte PCI Express 1x Wi-Fi N 300 Mbps'),
(66, 13, 'ASUS USB-AC56', 'https://media.ldlc.com/r150/ld/products/00/01/67/62/LD0001676219_2.jpg', '2021-08-22 04:25:45', '2021-08-22 04:25:45', 59.95, 'Adaptateur USB 3.0 sans fil Wi-Fi AC 900 Mbps + 300 Mbps Dual band'),
(67, 13, 'ASUS XG-C100F 10G', 'src=\"https://media.ldlc.com/r150/ld/products/00/05/41/35/LD0005413598_2.jpg\"', '2021-08-22 04:25:45', '2021-08-22 04:25:45', 129.95, 'Carte réseau PCI-E 3.0 x4 - 10Gbps SFP+');

-- --------------------------------------------------------

--
-- Structure de la table `products_category`
--

CREATE TABLE `products_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `products_category`
--

INSERT INTO `products_category` (`id`, `name`, `image`, `created_at`, `modified_at`) VALUES
(1, 'Ordinateur portable', 'https://media.ldlc.com/r100/ld/categories/thumbnails/4265.jpg', '2021-08-21 23:48:56', '2021-08-21 23:48:56'),
(2, 'Ordinateur fixe', 'https://media.ldlc.com/r100/ld/categories/thumbnails/4250.jpg', '2021-08-21 23:49:23', '2021-08-21 23:49:23'),
(3, 'Périphérique PC', 'https://media.ldlc.com/r100/ld/categories/thumbnails/4274.jpg', '2021-08-21 23:49:33', '2021-08-21 23:49:33'),
(4, 'Boitier', 'https://media.ldlc.com/r100/ld/categories/thumbnails/4290.jpg', '2021-08-21 23:49:39', '2021-08-21 23:49:39'),
(5, 'Alimentation PC', 'https://media.ldlc.com/r100/ld/categories/thumbnails/4289.jpg', '2021-08-21 23:49:46', '2021-08-21 23:49:46'),
(6, 'Disques dur & SSD', 'https://media.ldlc.com/r100/ld/categories/thumbnails/4297.jpg', '2021-08-21 23:49:54', '2021-08-21 23:49:54'),
(7, 'Carte mère', 'https://media.ldlc.com/r100/ld/categories/thumbnails/4293.jpg', '2021-08-21 23:50:01', '2021-08-21 23:50:01'),
(8, 'Cartes graphique', 'https://media.ldlc.com/r100/ld/categories/thumbnails/4292.jpg', '2021-08-21 23:50:14', '2021-08-21 23:50:14'),
(9, 'Mémoire', 'https://media.ldlc.com/r100/ld/categories/thumbnails/4299.jpg', '2021-08-21 23:50:22', '2021-08-21 23:50:22'),
(10, 'Processeur', 'https://media.ldlc.com/r100/ld/categories/thumbnails/4300.jpg', '2021-08-21 23:50:29', '2021-08-21 23:50:29'),
(11, 'Refroidissement PC', 'https://media.ldlc.com/r100/ld/categories/thumbnails/4301.jpg', '2021-08-21 23:50:35', '2021-08-21 23:50:35'),
(12, 'Carte son', 'https://media.ldlc.com/r100/ld/categories/thumbnails/4295.jpg', '2021-08-21 23:50:41', '2021-08-21 23:50:41'),
(13, 'Carte réseau', 'https://media.ldlc.com/r100/ld/categories/thumbnails/4294.jpg', '2021-08-21 23:50:47', '2021-08-21 23:50:47');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `date_de_naissance` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `first_name`, `last_name`, `telephone`, `is_verified`, `date_de_naissance`, `created_at`, `token`) VALUES
(1, 'gonu@mailinator.com', '[]', '$2y$13$PVAHccW2spxKYw/jNxqS6OaRe8co7siO8lFPcqts7/LJkcRuFdyly', 'Noelle', 'Chambers', '0625352653', 0, '1987-01-18 00:00:00', '2021-08-22 00:00:00', '$2y$13$oKt3HRxdD.Jv1rv5gRvb.eIW2J9XWo5mTE0iCXCTF0w6Rcrk9sZX.');

-- --------------------------------------------------------

--
-- Structure de la table `user_adress`
--

CREATE TABLE `user_adress` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `adress` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user_payment`
--

CREATE TABLE `user_payment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D34A04AD12469DE2` (`category_id`);

--
-- Index pour la table `products_category`
--
ALTER TABLE `products_category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Index pour la table `user_adress`
--
ALTER TABLE `user_adress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_39BEDC83A76ED395` (`user_id`);

--
-- Index pour la table `user_payment`
--
ALTER TABLE `user_payment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_35259A07A76ED395` (`user_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT pour la table `products_category`
--
ALTER TABLE `products_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `user_adress`
--
ALTER TABLE `user_adress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user_payment`
--
ALTER TABLE `user_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `products_category` (`id`);

--
-- Contraintes pour la table `user_adress`
--
ALTER TABLE `user_adress`
  ADD CONSTRAINT `FK_39BEDC83A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `user_payment`
--
ALTER TABLE `user_payment`
  ADD CONSTRAINT `FK_35259A07A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
