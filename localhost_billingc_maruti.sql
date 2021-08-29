--
-- Database: `billingc_maruti`
--
CREATE DATABASE IF NOT EXISTS `billingc_maruti` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `billingc_maruti`;

-- --------------------------------------------------------

--
-- Table structure for table `addressmaster`
--

CREATE TABLE `addressmaster` (
  `id` int(11) NOT NULL,
  `userid` varchar(50) NOT NULL,
  `line1` varchar(200) NOT NULL,
  `line2` varchar(200) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `pin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `advancmaster_2020`
--

CREATE TABLE `advancmaster_2020` (
  `id` int(11) NOT NULL,
  `shopid` int(5) NOT NULL,
  `custid` int(10) NOT NULL,
  `cardno` varchar(20) NOT NULL,
  `debit` int(8) NOT NULL,
  `credit` int(8) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `balancemaster`
--

CREATE TABLE `balancemaster` (
  `id` int(11) NOT NULL,
  `copstock` int(14) NOT NULL,
  `cclstock` int(14) NOT NULL,
  `mpbal` int(10) NOT NULL,
  `msbal` int(10) NOT NULL,
  `advopen` int(10) NOT NULL,
  `advcl` int(10) NOT NULL,
  `acopbal` int(10) NOT NULL,
  `acclbal` int(10) NOT NULL,
  `loanopbal` int(10) NOT NULL,
  `loanclbal` int(10) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='1';

--
-- Dumping data for table `balancemaster`
--

INSERT INTO `balancemaster` (`id`, `copstock`, `cclstock`, `mpbal`, `msbal`, `advopen`, `advcl`, `acopbal`, `acclbal`, `loanopbal`, `loanclbal`, `date`) VALUES
(1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2017-09-01');

-- --------------------------------------------------------

--
-- Table structure for table `bankmaster`
--

CREATE TABLE `bankmaster` (
  `bankid` int(11) NOT NULL,
  `bankname` varchar(70) NOT NULL,
  `branch` varchar(70) NOT NULL,
  `acno` varchar(30) NOT NULL,
  `acname` varchar(50) NOT NULL,
  `ifsccode` varchar(15) NOT NULL,
  `companyid` int(5) NOT NULL,
  `balacne` int(10) NOT NULL,
  `baltype` varchar(10) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `barcode`
--

CREATE TABLE `barcode` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barcode`
--

INSERT INTO `barcode` (`id`) VALUES
(10002);

-- --------------------------------------------------------

--
-- Table structure for table `barcodemaster`
--

CREATE TABLE `barcodemaster` (
  `id` varchar(50) NOT NULL,
  `prodid` varchar(20) NOT NULL,
  `bstock` decimal(10,2) NOT NULL,
  `instock` varchar(20) NOT NULL,
  `stocktype` varchar(5) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `offprice` decimal(10,2) NOT NULL,
  `fromdate` date NOT NULL,
  `todate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `coupenmaster`
--

CREATE TABLE `coupenmaster` (
  `id` int(11) NOT NULL,
  `coupen_no` varchar(15) NOT NULL,
  `incre_type` varchar(10) NOT NULL,
  `discount` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coupenmaster`
--

INSERT INTO `coupenmaster` (`id`, `coupen_no`, `incre_type`, `discount`, `from_date`, `to_date`) VALUES
(2, 'GSS3U6KKV', 'Fixed', 500, '2017-07-28', '2017-08-15');

-- --------------------------------------------------------

--
-- Table structure for table `creditdetailsmaster_2020`
--

CREATE TABLE `creditdetailsmaster_2020` (
  `id` int(11) NOT NULL,
  `creditid` varchar(50) NOT NULL,
  `prodid` varchar(50) DEFAULT NULL,
  `cprodname` varchar(100) NOT NULL,
  `cstock` decimal(10,2) NOT NULL,
  `cinstock` decimal(10,2) NOT NULL,
  `unit` varchar(8) NOT NULL,
  `salesrate` int(11) NOT NULL,
  `prodtotal` decimal(10,2) NOT NULL,
  `prodttotal` decimal(10,2) NOT NULL,
  `discount` decimal(6,2) NOT NULL,
  `gst` varchar(10) NOT NULL,
  `cgstper` decimal(10,2) NOT NULL,
  `gstamount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `creditid1`
--

CREATE TABLE `creditid1` (
  `iid` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `creditid1`
--

INSERT INTO `creditid1` (`iid`, `date`) VALUES
(2, '2017-07-11');

-- --------------------------------------------------------

--
-- Table structure for table `creditid2`
--

CREATE TABLE `creditid2` (
  `iid` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `creditid2`
--

INSERT INTO `creditid2` (`iid`, `date`) VALUES
(1, '2017-07-11');

-- --------------------------------------------------------

--
-- Table structure for table `creditmaster_2020`
--

CREATE TABLE `creditmaster_2020` (
  `id` int(11) NOT NULL,
  `invoiceid` varchar(15) NOT NULL,
  `customerid` int(10) NOT NULL,
  `type` varchar(10) NOT NULL,
  `amount` int(10) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `creditsalesmaster_2020`
--

CREATE TABLE `creditsalesmaster_2020` (
  `creditid` varchar(15) NOT NULL,
  `invoiceid` varchar(15) NOT NULL,
  `customerid` int(10) NOT NULL,
  `invoiceby` varchar(50) NOT NULL,
  `shopid` int(2) NOT NULL,
  `paytype` varchar(30) NOT NULL,
  `creditdate` date NOT NULL,
  `invoicedate` date NOT NULL,
  `totalamount` decimal(10,2) NOT NULL,
  `description` text NOT NULL,
  `taxamount` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customermaster`
--

CREATE TABLE `customermaster` (
  `customerid` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `address` varchar(500) DEFAULT NULL,
  `address2` text DEFAULT NULL,
  `scode` varchar(50) DEFAULT NULL,
  `mobile` varchar(14) NOT NULL,
  `advance` int(10) DEFAULT NULL,
  `gstin` varchar(30) NOT NULL,
  `ctype` varchar(10) NOT NULL,
  `credit_amount` decimal(10,0) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customermaster`
--

INSERT INTO `customermaster` (`customerid`, `name`, `address`, `address2`, `scode`, `mobile`, `advance`, `gstin`, `ctype`, `credit_amount`) VALUES
(1, 'SUNWARI TRADERS', '175, MAULANA AZAD ROAD, LOLLIWALA BUILDING, BEHAND MURCURRY APPARTMENT NAGPADA, MUMBAI-400008', '262/70, NARSHI NATHA STREET, BHAT BAZAR, MUMBAI - 9', '27-Maharashtra', '0989 2606 710', 0, '27AAGPS9614N1ZY', 'Vendor', 0),
(2, 'ABM MARKETING CELL PVT. LTD.', '284, MISTRY BUILDING, GUNPOWDER ROAD, OPP. STAR CINEMA, DOCKYARD RD, MUMBAI - 400010', '', '27-Maharashtra', '0222 3730 956', 0, '27AAJCA9694G1Z3', 'Vendor', 0),
(3, 'LUNIA SALES CORPORATION', '24/4, ANAND BUILDING, GR.FLR, SITARAM', '.', '27-Maharashtra', '0222 3818 151', 0, '27AAEPJ2792A1ZZ', 'Vendor', 0),
(4, 'SHREE GANESH AGENCY', 'ROOM NO 1797, CHAWL NO 60, OPP MHADA BLDG GRP NO7, VIKHROLI EAST, MUMBAI - 400083', '', '27-Maharashtra', '0982 1579 095', 0, '27ABZFS3098N1ZW', 'Vendor', 0),
(5, 'AVNI FOODS', 'OFFICE  NO 4,1ST FLOOR SPECIAL INDUSTRIAL ESTATE BHAI BAL MUKUND MARG\r\nCHINCHPOKLI (E), MUMBAI', '', '27-Maharashtra', '0902 9352 272', 0, '27DGUPS4074M1ZB', 'Vendor', 0),
(6, 'GOGRI CATERERS', '21/7, SMRUTI BLDG, SOCIETY ROAD, JOGESHWARI EAST, MUMBAI - 400060', '', '27-Maharashtra', '0983 3920 052', 0, '27ADCPG5502C1Z8', 'Vendor', 0),
(7, 'NILESH BAPURAO CHIKANE', '180/182 PRAKASH BHANAN, SAMUEL STREET,MASJID (W)', '', '27-Maharashtra', '0989 2199 753', 0, '27AGBPC7912J1ZI', 'Vendor', 0),
(9, 'SARVODAYA TRADING CORPORATION ', '23, KESHAVJI NAIK ROAD, CHANDA RAMJI BUILDING, GROUND FLOOR, SHOO NO.49-A MASIJD MUMBAI-09', '', '27-Maharashtra', '0222 2373 504', 0, '27AACFS4886L1ZJ', 'Vendor', 0),
(10, 'BHAYANI DISTRIBUTORS ', 'D-44, PLOT NO.352, SHIVRATAN SOCIETY,SECTOR NO.3, CHARKOP KANDIVLI (W), MUMABI-400067', '', '27-Maharashtra', '0992 0308 833', 0, '27AAAPC8409P1ZH', 'Vendor', 0),
(11, 'RAIN ENTERPRISES', '4 GROUND FLOOR, DUSHRATH KUTIR PRABHURAM NAGAR, NANA PAWSHE CHOWK, KATEMANALI, KALYAN - W, THANE-421306', '', '27-Maharashtra', '0982 1074 643', 0, '27ADZPT3326N1ZJ', 'Vendor', 0),
(12, 'RED ROSE TEA CORPORATION', 'G-40, A.P.M.C. MARKET - I, PHASE - II, TURBHE, NAVI MUMBAI - 400705', '', '27-Maharashtra', '0222 7658 070', 0, '27ADZPD0764G1ZA', 'Vendor', 0),
(13, 'SHREE GANESH TRADERS', 'A.29 APMC MKT -1, PHASE-II. VASHI NAVI MUMBAI.400703', '', '27-Maharashtra', '0982 0512 323', 0, '27ATIPS4801J1ZE', 'Vendor', 0),
(14, 'RAUNAK ENTERPRISES', 'GALA NO.Q-41 AND 42, JAI MATA DI COMPOUND KALHER, BHIWANDI, THANE 421302', '', '27-Maharashtra', '0829 1388 311', 0, '27AAXFR7664N1ZX', 'Vendor', 0),
(15, ' BAIT AL TAMUR CO.', 'E-42, APMC MARKET-1, PHASE-||, TURBHE, NAVI MUMBAI- 400705.', '', '27-Maharashtra', '0222 7662 244', 0, '27AAQFB7819J1ZV', 'Vendor', 0),
(16, 'SHRI MAHILA GRIHA UDYOG LIJJAT PAPAD', '78, KRISHNA VIHAR, RAFI AHMED KIDWAI ROAD, WADALA, MUMBAI 400031', '262/70, NARHSI NATH STREET, BHAT BAZAR MUMBAI-400009', '27-Maharashtra', '0222 4167 805', 0, '27AABTS5090H1ZA', 'Vendor', 0),
(17, 'SAF INTERNATIONAL', '11, ROYAL APRTMENT, MAULANA AZAD ROAD, JACOB CIRCLE, MUMBAI - 400011', '', '27-Maharashtra', '0766 6477 722', 0, '27AAAPF2651A2ZG', 'Vendor', 0),
(18, 'VIJAY ENTERPRISE', '257/65, NATHA STREET, NEW ANANT BHUVAN, G-11, BHAT BAZAR, MUMBAI 400009', '', '27-Maharashtra', '0869 2035 289', 0, '', 'Vendor', 0),
(19, 'C.D. Enterprises', 'Shop 10, Ganesh Nagar Hsg soc., (2A), Lalbaug Market, Mumbai  ', '', '27-Maharashtra', '0981 9177 035', 0, '27AFBPN3911R1Z2', 'Vendor', 0),
(20, 'SURABHI ENTERPRISE ', 'C/O NEW JANTA SOCIETY , BETW 5&7 NAVROJI HILL RD, OPP RAM MANDIR B/H DEEPAK HOTEL, DONGARI, MUMBAI ', '', '27-Maharashtra', '0986 9003 925', 0, '27AAFPS7482M1ZV', 'Vendor', 0),
(21, 'BHAGWATI ENTERPRISES', '15F/52, LOHANA NIWAS, SHANKAR BARI LANE, CHIRA BAZAR, MUMBAI-2', '', '27-Maharashtra', '0996 7428 028', 0, '27AZFPS5980D1Z0', 'Vendor', 0),
(22, 'ROMA ENTERPRISES', '17/19, UMERKHADI ROAD, GANESH MANDIR LANE, MUMBAI -9', '', '27-Maharashtra', '0989 2095 621', 0, '27AAJPS0065J1ZG', 'Vendor', 0),
(23, 'UNNATI ENTERPTISES', '1/3, JANGLESHWAR MAHADEO SOCIETY, J. M. MANDIR ROAD, KULKARNI WADI, ASALFA VILLAGE, GHATKOPAR W, MUMBAI - 400084', '', '27-Maharashtra', '0932 2508 793', 0, '27ADQPK2393F1Z9', 'Vendor', 0),
(24, 'VAISHNAVI CATERING ', 'NAIGAON POLICE HALL BHOIWADA MUMBAI 400014', '', '27-Maharashtra', '0982 1494 701', 0, '', 'Customer', 0),
(25, 'SKY ENTERPRISE PRIVATE LIMITED', 'SURVEY NO. 171 (P), VILLAGE AAMGAON MANOR WADA ROAD, TALUKA-WADA, DIST. PALGHAR - 421303, MAHARASHTRA', '', '27-Maharashtra', '0766 6633 233', 0, '27AAICS9571K1ZL', 'Vendor', 0),
(26, 'S S ENTERPRISES', '301,AZAD HOUSE, F.U. STREET AGRIPADA, MUMBAI - 400011', '', '27-Maharashtra', '0808 2143 585', 0, '27DBRPK3124C1ZS', 'Vendor', 0),
(27, 'SHRI GANESH ENTERPRISES', 'PLOT NO. 33, HEY BUNDER ROAD, NEAR PETROL PUMB, NEAR HYUNDAI SERVICE CENTER, DARUKHANA, MUMBAI - 400033', '', '27-Maharashtra', '0902 2233 526', 0, '', 'Vendor', 0),
(28, 'JASRAJ FOOD PRODUCTS', '2, SINGH COMPOUND, MANKOLI, DAPODE, BHIWANDI.', '', '27-Maharashtra', '0981 9976 259', 0, '27CEAPS5325E1ZL', 'Vendor', 0),
(29, 'MAHAPRABHU ENTERPRISES ', 'D/37, APMC MARKET - I,PHASE - II, MUDI BAZAAR, SECTOR 19, VASHI,NAVI MUMBAI - 400705', '', '27-Maharashtra', '0222 2766 211', 0, '27AAAFM3214G1ZQ', 'Vendor', 0),
(30, 'HAJUKA HOTEL', 'HAJUKA HOTEL, BURA BAZAR, C.S.T.', '', '27-Maharashtra', '0982 0890 557', 0, '', 'Customer', 0),
(31, 'VIPRA FOODS MARKETING CO.', 'SHOP NO.14, SAMVED BULDING, MUNICIPAL STAFF MADHUKUNJ C.H.S.L., RAJENDRA NAGAR, BORIVALI EAST, MUMBAI - 400066', '', '27-Maharashtra', '0986 7655 048', 0, '27AJIPD3762F1ZC', 'Vendor', 0),
(32, 'RUKMINI ENTERPRISES', '701/702, A-WING, 7TH FLOOR, SIDDHIVINAYAK BUILDING, PATKAR\'S NEW BLOCK, OFF GURUNANAK ROAD, BANDRA (W) MUMBAI', '', '27-Maharashtra', '0750 6330 987', 0, '27AAWFR4608R1Z4', 'Vendor', 0),
(33, 'VISHESH INTERNATIONAL', 'D-4/3,2 SECTOR-1,VASHI, NAVI MUMABI.', '', '27-Maharashtra', '0922 1331 217', 0, '27AFQPC21117P1Z6', 'Vendor', 0),
(34, 'AJAY TRADING CO.', 'H-37,APMC,MARKET - 1,VASHI,NAVI MUMBAI -400705', '', '27-Maharashtra', '0932 6779 773', 0, '27ACOPM3981A1ZH', 'Vendor', 0),
(35, 'FAMOUS TRADING ', 'SHOP NO.23, PIRU LANE, PATHANWADI IMAMWADA MUMBAI MUMBAI CITY 400009', '', '27-Maharashtra', '0942 9685 497', 0, '27AOAPC7420G1ZE', 'Vendor', 0),
(36, 'SAMIR ENTERPRISES', '44 NAGDEVI CROSS LANE,4TH FLOOR, 40/A OFFICE.', '', '27-Maharashtra', '0989 2560 048', 0, '', 'Customer', 0),
(37, 'LALJEE GODHOO & CO.', '213, SAMUEL STREET, MUMBAI - 400003', '', '27-Maharashtra', '0992 0972 691', 0, '27AAAFL0484F1ZJ', 'Vendor', 0),
(38, 'GANDHI ASSOCIATES', 'GIRIRAJ BUILDING, GROUND FLOOR, MASJID BUNDER-E, MUMBAI-400009', '', '27-Maharashtra', '0965 3346 627', 0, '27AADFG268A1ZQ', 'Vendor', 0),
(39, 'NIKHIL CORPORATION', 'WAREHOUSE NO.704,184 BARRISTER NATI PAI MARG, CROSS LANE NO.1, NEXT TO INDIAN OIL PETROL PUMB, REAY ROAD', '', '27-Maharashtra', '0982 0322 445', 0, '27AUIPS6305E2ZJ', 'Vendor', 0),
(40, 'ARYAN EXIMS ', '2, SAPHIRE, AZAD ROAD EXNT; ANDHERI (EAST), MUMBAI 400069', '', '27-Maharashtra', '0982 0282 041', 0, '27AAFHD3361Q1ZX', 'Vendor', 0),
(41, 'LIFESTYLES INTERNTIONAL', 'B - 103, KONARK, KON, TAL - PANVEL', '', '27-Maharashtra', '0986 9050 135', 0, '27ANRPS9262Q1ZM', 'Vendor', 0),
(45, 'SURESH AGENCIES AND DISTRIBUTORS PVT. LTD.', '116/5, T.J. ROAD, V.J. DOSHI BUILDING, NEAR NAVYUG INDUSTRIAL ESTATE, SWWRI WEST, MUMBAI 400015', '', '27-Maharashtra', '0986 9371 049', 0, '27AAFCS8240L1ZY', 'Vendor', 0),
(46, 'VARSHA TRADING CO', 'E-9, A.P.M.C. MARKET-1, PHASE-2, TURBHE, NAVI MUMBAI-400703', '', '27-Maharashtra', '', 0, '27AAOPM0423F1ZW', 'Vendor', 0),
(47, 'OM INTERNATIONAL', 'F 4, APMC MARKET- 1, PHASE-2, VASHI, NAVI MUMBAI', '', '27-Maharashtra', '', 0, '27BGQPJ6364P1ZF', 'Vendor', 0),
(48, 'DIPTI TRADING CO', 'F-10, A.P.M.C MARKET-1, PHASE-2 SECTOR-19, VASHI, NAVI MUMBAI - 400705', '', '27-Maharashtra', '', 0, '27AJMPM5886B1ZU', 'Vendor', 0),
(49, 'harsh', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(50, 'harsh 2', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(51, 'SHIV IMPEX', 'F58, APMC MARKET- 1, PHASE -II, VASHI NAVI MUMBAI 400705', '', '27-Maharashtra', '0773 8728 001', 0, '27ADZPD0764G1ZA', 'Vendor', 0),
(52, 'RITIKA SANJAY SHIGVAN', '382/83 JAIN BLDG N0-3, SHANKAR MATTAM ROAD, MATUNGA, MUMBAI- 400019', '', '27-Maharashtra', '0869 2035 289', 0, '', 'Customer', 0),
(53, 'VIRAKI BROTHERS', '280-282, SATYAM HOUSE, N.N.ST, BHAT BAZAR, MASJID WEST, MUM-09', '', '27-Maharashtra', '0222 3456 883', 0, '27AAAFV3761F1Z7', 'Vendor', 0),
(54, 'FERNANDES BROTHERS', 'P.O. BOX. NO. 902, KULSHEKAR, MANGALORE - 575005.', '', '29-Karnataka', '0222 2211 098', 0, '29AAAFF2779F1ZB', 'Vendor', 0),
(55, 'GAUTAN ENTERPRISE', 'PLOT NO.20, OPP.APMC, DANABUNDER SECT.19/A, VASHI, NAVI MUMBAI 400705', '', '27-Maharashtra', '0720 8006 658', 0, '27AJBPD8486D1Z8', 'Vendor', 0),
(58, 'Centerpoint Enterprise ', 'Ground fioor ,Shop No.12 S.D.Road, Near Gurunanak Hospital, BANDRA EAST. MUM -400051.', '', '27-Maharashtra', '0983 3445 094', 0, '27AWYPS6375C1ZQ', 'Customer', 0),
(59, 'UNNATI ENTERPTISES', 'D-18, APMC Market, Vashi, Navi Mumbai 400703', '', '27-Maharashtra', '', 0, '027ACIPT4847L1ZU', 'Customer', 0),
(61, 'The Banging Food Co. ', 'A-1301, 13th Floor, Shatrunjay Darshan Blidg, Sheth Motisha Lane, Byculla, 4000027', '', '27-Maharashtra', '', 0, '27AUKPS2909J1Z5', 'Customer', 0),
(65, 'BOMBAY NATURAL HISTORY SOCIETY', 'HORNBILL HOUSE, DR SALIM ALI CHOWK, SHAHEED BHAGAT S, FORT MUMBAI.', '', '', '0086 9203 528', 0, '27AAATB1708Q1ZK', 'Customer', 0),
(66, 'Tanna Hotel PVT LTD', '198 Malkam Peth, Opp M.T.D,C .Holiday Home, Raj bhavn Road, Mahabaleshwar-412806', '', '', '0986 9908 320', 0, '27AAACT6699K1ZL', 'Customer', 0),
(73, 'AMIT SAPATE', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(74, 'Kashinath R Prabhu & Sons ', 'Shop No 97, Municipale Market, Mapusa, Goa', '9', '30-Goa', '0832 2262 321', 0, '30AHNPP3328GIZH', 'Customer', 0),
(75, 'SEAKING CATERERS PVT.LTD.', '167 P.D.MELLO ROAD,CARNAC BUNDAR, MUMBAI 400001', '', '27-Maharashtra', '0981 9129 326', 0, '27AAACS8360E1ZD', 'Customer', 0),
(82, 'M/S. ASHOAKE SHIPPING SERVICES', 'GALA NO. E-729,A P M C Vegetable Market , Sector N 400705', '', '27-Maharashtra', '0989 4607 548', 0, '27AAAPW0510D1Z8', 'Customer', 0),
(83, 'AMY FOOD PRODUCTS ', 'JOSHI WADI 419 C 2ND FLOOR', '', '27-Maharashtra', '0932 6705 265', 0, '27AABPR6538H1ZG', 'Customer', 0),
(84, 'AMRUT AYURVEDIC DRUG SUPPLY CO.', '406 EBRAHIM RAHEMTULLA ROAD,PYADONIE ', '', '27-Maharashtra', '0932 2228 151', 0, '27AADHS0326Q1ZT', 'Customer', 0),
(85, 'ANY TIME MEDICAL', 'SHOP NO C8 CHOUHAN AVENUE,OPP GALAXY HEIGHTS NEW LINK ROAD GOREGAON W 400062', '', '27-Maharashtra', '0983 3905 932', 0, '27AARPH9013M1Z7', 'Customer', 0),
(86, 'ADD LAUNDRY CONCEPTS PRIVATE LTD', '1ST FLOOR 101 ADD HOUSE KAZI SAYED STREET MASJID BUNDER', '', '27-Maharashtra', '0932 2271 721', 0, '27AAFCAO879H1ZK', 'Customer', 0),
(94, 'Counter', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(136, 'SANKET', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(138, 'A TO Z ENTERPRISE', 'ROOM NO.1, ISMAIL CHAWL, BHAJIWALA CHAWL, DAYALDAS ROAD, VILE PARLE EAST 400057', '', '27-Maharashtra', '0976 9897 444', 0, '27ACJPV0068N1ZY', 'Customer', 0),
(139, 'RAJ MADHUR', 'DEVIDAS LANE, NEAR BRAMHA KUMARI CIRCLE, OPP-AQUARIA GRAND TOWER, BORIVALI-(W)', '', '', '0816 9465 435', 0, '', 'Customer', 0),
(140, 'AMRUT AYURVRDIC DRUG HOSUE', 'PAYDONIE', '', '', '0989 2973 739', 0, '27AADHS0651N1ZV', 'Customer', 0),
(141, 'AMRUT CATERERS', 'JYOTI STUDIO COMPOUND, NANA CHOWK, NEAR CANDY BRIDGE.', '', '27-Maharashtra', '0982 0094 798', 0, '27AAMFA5843R1ZO', 'Customer', 0),
(142, 'JAY', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(143, 'ADD LAUNDRY CONCEPTS PRIVATE LTD', '1ST FLOOR, 101 ADD HOUSE, KAZI SAYED STREET, MASJID BUNDER', '', '27-Maharashtra', '0932 2271 721', 0, '27AAFCAO879H1ZK', 'Customer', 0),
(144, 'BHAVAY ENTERPRISE', '403 B CHIRAG NAGAR1, JANTA NAGAR ROAD, SHIVSENA G, BHAYANDER', '', '27-Maharashtra', '0986 9117 292', 0, 'Z7AEDPM4723P1Z3', 'Customer', 0),
(145, 'BRIJ SPICES TRADERS', '204, LALJEE DUNGERSHI BLDG, BHAT BAAR', '', '27-Maharashtra', '0989 2234 151', 0, '27AADPM8712C1ZX', 'Customer', 0),
(146, 'AKSHOK', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(147, 'ASLAM', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(148, 'RAJU', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(149, 'SANGEETA', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(150, 'dilip', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(151, 'jainab', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(152, 'Ashok Masala ', 'A1 DOSA BLDG 7, NAUROJI HILL ROAD, DONGARI ', '', '', '0982 0122 927', 0, '27APZPK3791A1ZH', 'Customer', 0),
(153, 'Ashok', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(154, 'RUPESH', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(155, 'B.P.SHAH & CO.', '67, KESHVRAO KHANDYE MARG, JACOB CIRCLE, MUMBAI 11', '', '27-Maharashtra', '0982 0152 075', 0, '27AAAFB1596L1Z9', 'Customer', 0),
(156, 'DATTA', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(157, 'KRISH', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(158, 'AMAR TEA PVT. LTD.', 'A 4 KRISHNABAI COMPOUND, BEHIND PRITRSH COMPOUND,', '', '27-Maharashtra', '0982 1152 413', 0, '27AAACA3927D1Z2', 'Customer', 0),
(159, 'shetty', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(160, 'M/s Vega Industrial System', '226, Hindustan Kohinoor Complex, LBS Marg, Vikhroli (W)', '', '27-Maharashtra', '0900 4099 061', 0, '27ALJPK0062G1ZB', 'Customer', 0),
(161, 'TANAZ GODIWALA', 'Parsi Agyari, Kama baug, Opp Dreal Land Cinema ', '', '27-Maharashtra', '0982 0133 399', 0, '27AAEPGO944R1ZD', 'Customer', 0),
(162, 'PRATIK', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(163, 'SURESH PISAT', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(164, 'TECHINT INDIA PVT LTD', 'A WING 5TH FLOOR, POKHARAN ROAD NO2, BEHIND TCS THANE WEST.', '', '', '0981 9401 353', 0, '27AADCT3127D1ZO', 'Customer', 0),
(165, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(166, 'noor', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(167, 'anuj', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(168, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(169, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(170, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(171, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(172, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(173, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(174, 'SHREE VAKERAVJI PULVARISERS', 'PLOT NO. 145, ACHHAD INDUSTRIAL ESTATE, DIST: PALGHAR, MAHARASHTRA', '', '', '0977 3387 195', 0, '27AAAJV0328G1Z7', 'Customer', 0),
(175, 'VILAS', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(176, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(177, 'RAHISA', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(178, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(179, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(180, 'Counter', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(181, 'DEEPAK', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(182, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(183, 'MEENA', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(184, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(185, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(186, 'MANGESH', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(187, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(189, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(190, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(191, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(192, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(193, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(194, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(195, 'JAYSHREE MHATRE', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(196, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(197, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(198, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(199, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(200, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(201, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(202, 'PINKY', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(203, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(204, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(205, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(206, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(207, 'sangeeta', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(208, 'kishor', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(209, 'LALA FARSAN', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(210, 'RAJAN CHAVAN', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(211, 'JATIN', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(212, 'CAMA HOSPITAL', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(213, 'NANDINI', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(214, 'HARSHAD', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(215, 'SHEKH', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(216, 'ANIL', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(217, 'SHIVAJI GOLE', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(218, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(219, 'prakash', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(220, 'NAGESH', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(221, 'USHA RAUT', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(222, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(223, 'SONAL SHAH ', NULL, NULL, NULL, '0992 0999 877', NULL, '', 'Customer', 0),
(224, 'SUNIL', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(225, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(226, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(227, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(228, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(229, 'YASHWANT', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(230, 'YSAHWANT', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(231, 'NAMRATA', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(232, 'MEGHA GAONKAR', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(233, 'GANESH', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(234, 'SONAL', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(235, 'VIJAY WALKE', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(236, 'DILSHAD', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(237, 'VIJAY ADIVALEKAR', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(238, 'PRADEEP', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(239, 'SARJERAO', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(240, 'SAMBHAJI PATIL', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(241, 'PAWAN PATIL', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(242, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(243, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(244, 'TUSHAR MODAK', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(245, 'SACHIN', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(246, 'SACHIN', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(247, 'KULSUM', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(248, 'ROHIT', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(249, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(250, 'ROHIT', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(251, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(252, 'JAYESH', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(253, 'MANJU', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(254, 'SANTOSH', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(255, 'VINOD', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(256, 'VIJAY', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(257, 'VIJAY GAIKWAD', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(258, 'PRASAD NAIK', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(259, 'SANDEEP', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(260, 'DEEPAK', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(261, 'BABITA', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(262, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(263, 'RAMESH TEMBE', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(264, 'PRAKSH ADVIREKAR', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(265, 'MADHUKAR', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(266, 'DEEPIKA', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(267, 'GAIKWAD', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(268, 'RAJNI', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(269, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(270, 'SHAKUMTALA', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(271, 'BHASKR', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(272, 'KISHOR', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(273, 'Counter', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(274, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(275, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(276, 'TAMBE', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(277, 'PURVA VAIDYA ', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(278, 'MULLA', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(279, 'LASANWALA', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(280, 'SHRINIWAS', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(281, 'SUNIL PARAB', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(282, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(283, 'PAREKH', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(284, 'NUTAN', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(285, 'RAUT', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(286, 'RAUT', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(287, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(288, 'NAHTA FABRIC', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(289, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(290, 'RAMCAHNDRA', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(291, 'jayesh', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(292, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(293, 'jadhav', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(294, '', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(295, 'patel', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(296, 'babu kaka', NULL, NULL, NULL, '', NULL, '', 'Customer', 0),
(297, 'pooja', '', '', '', '0966 4428 534', 50000, '', 'Customer', 0);

-- --------------------------------------------------------

--
-- Table structure for table `debitid1`
--

CREATE TABLE `debitid1` (
  `iid` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `debitid1`
--

INSERT INTO `debitid1` (`iid`, `date`) VALUES
(1, '2017-07-07');

-- --------------------------------------------------------

--
-- Table structure for table `debitid2`
--

CREATE TABLE `debitid2` (
  `iid` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `debitid2`
--

INSERT INTO `debitid2` (`iid`, `date`) VALUES
(1, '2017-07-07');

-- --------------------------------------------------------

--
-- Table structure for table `debitnotedetailsmaster_2020`
--

CREATE TABLE `debitnotedetailsmaster_2020` (
  `id` int(11) NOT NULL,
  `dinvoiceid` varchar(15) NOT NULL,
  `prodid` varchar(10) DEFAULT NULL,
  `prodid_` int(11) NOT NULL DEFAULT 0,
  `dprodname` varchar(50) NOT NULL,
  `stock` decimal(10,2) NOT NULL DEFAULT 0.00,
  `instock` decimal(10,2) NOT NULL DEFAULT 0.00,
  `wstock` int(11) NOT NULL DEFAULT 0,
  `dstock` int(11) NOT NULL DEFAULT 0,
  `unit` varchar(10) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `discount` decimal(6,2) NOT NULL,
  `gst` varchar(10) NOT NULL,
  `dgstper` decimal(6,2) NOT NULL,
  `gstamount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `debitnotemaster_2020`
--

CREATE TABLE `debitnotemaster_2020` (
  `dinvoiceid` varchar(15) NOT NULL,
  `pinvoiceid` varchar(15) NOT NULL,
  `shopid` int(5) NOT NULL,
  `receipt` varchar(30) NOT NULL,
  `customerid` int(10) NOT NULL,
  `amttotal` decimal(10,2) NOT NULL,
  `taxtotal` decimal(10,2) NOT NULL,
  `pdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `id` int(11) NOT NULL,
  `shopid` varchar(50) NOT NULL,
  `discount` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employeemaster`
--

CREATE TABLE `employeemaster` (
  `userid` int(11) NOT NULL,
  `shopid` varchar(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `dob` date NOT NULL,
  `mobile` varchar(14) NOT NULL,
  `emails` varchar(50) NOT NULL,
  `joindate` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `salary` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `expancemaster`
--

CREATE TABLE `expancemaster` (
  `id` int(11) NOT NULL,
  `amount` int(8) NOT NULL,
  `date` date NOT NULL,
  `description` text NOT NULL,
  `eptype` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `exptypemaster`
--

CREATE TABLE `exptypemaster` (
  `id` int(11) NOT NULL,
  `exptype` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exptypemaster`
--

INSERT INTO `exptypemaster` (`id`, `exptype`) VALUES
(1, 'FIXED ASSETS'),
(2, 'P. GST'),
(3, 'RENT'),
(4, 'LICENCE FEES');

-- --------------------------------------------------------

--
-- Table structure for table `gstper`
--

CREATE TABLE `gstper` (
  `gst` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gstper`
--

INSERT INTO `gstper` (`gst`) VALUES
(0.00),
(3.00),
(5.00),
(8.00),
(12.00),
(18.00),
(28.00);

-- --------------------------------------------------------

--
-- Table structure for table `gstsetting`
--

CREATE TABLE `gstsetting` (
  `id` int(11) NOT NULL,
  `cgst` decimal(5,2) NOT NULL,
  `sgst` decimal(5,2) NOT NULL,
  `igst` decimal(5,2) NOT NULL,
  `barcode` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gstsetting`
--

INSERT INTO `gstsetting` (`id`, `cgst`, `sgst`, `igst`, `barcode`) VALUES
(1, 50.00, 50.00, 100.00, '1');

-- --------------------------------------------------------

--
-- Table structure for table `invoiceid1`
--

CREATE TABLE `invoiceid1` (
  `iid` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoiceid1`
--

INSERT INTO `invoiceid1` (`iid`, `date`) VALUES
(8483, '2018-08-01');

-- --------------------------------------------------------

--
-- Table structure for table `invoiceid2`
--

CREATE TABLE `invoiceid2` (
  `iid` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoiceid2`
--

INSERT INTO `invoiceid2` (`iid`, `date`) VALUES
(1, '2017-06-28');

-- --------------------------------------------------------

--
-- Table structure for table `loginmaster`
--

CREATE TABLE `loginmaster` (
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `mixup` text NOT NULL,
  `role` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loginmaster`
--

INSERT INTO `loginmaster` (`username`, `password`, `name`, `mixup`, `role`) VALUES
('admin', '2a39aa3b8a075f4d22473adebe1b41fa', 'Admin', '8cdffdba4a65e8c5801b465b7d4b6679e20e28995af646eff0fa64834a6d9b81271375ac539b3ba0b2af68947dd91086326d84b1cd81f3246b3846e887f09bfa10ifWnJIpBTCX/PuKqlZRYuTrDEm8POIcj8qJveGx6OtDrnNkFkoieQWhd6Rh17O', 1),
('counter', 'ec4e862906cc5517f45f11085a7d977d', 'Cash Counter', '8cdffdba4a65e8c5801b465b7d4b6679e20e28995af646eff0fa64834a6d9b81271375ac539b3ba0b2af68947dd91086326d84b1cd81f3246b3846e887f09bfa10ifWnJIpBTCX/PuKqlZRYuTrDEm8POIcj8qJveGx6OtDrnNkFkoieQWhd6Rh17O', 2),
('devadmin', 'ec4e862906cc5517f45f11085a7d977d', 'S Admin', '8cdffdba4a65e8c5801b465b7d4b6679e20e28995af646eff0fa64834a6d9b81271375ac539b3ba0b2af68947dd91086326d84b1cd81f3246b3846e887f09bfa10ifWnJIpBTCX/PuKqlZRYuTrDEm8POIcj8qJveGx6OtDrnNkFkoieQWhd6Rh17O', 1),
('maruti', '2a39aa3b8a075f4d22473adebe1b41fa', 'MARUTI MASALA', '8cdffdba4a65e8c5801b465b7d4b6679e20e28995af646eff0fa64834a6d9b81271375ac539b3ba0b2af68947dd91086326d84b1cd81f3246b3846e887f09bfa10ifWnJIpBTCX/PuKqlZRYuTrDEm8POIcj8qJveGx6OtDrnNkFkoieQWhd6Rh17O', 1);

-- --------------------------------------------------------

--
-- Table structure for table `prodid1`
--

CREATE TABLE `prodid1` (
  `prodId` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prodid1`
--

INSERT INTO `prodid1` (`prodId`) VALUES
('101285');

-- --------------------------------------------------------

--
-- Table structure for table `prodid2`
--

CREATE TABLE `prodid2` (
  `prodId` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prodid2`
--

INSERT INTO `prodid2` (`prodId`) VALUES
('100001');

-- --------------------------------------------------------

--
-- Table structure for table `productmaster`
--

CREATE TABLE `productmaster` (
  `prodid_` int(11) NOT NULL,
  `prodid` varchar(20) DEFAULT NULL,
  `hsn` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `prodname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `prodname_hindi` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shopid` int(5) NOT NULL,
  `wstock` int(11) NOT NULL DEFAULT 0,
  `dstock` int(11) NOT NULL DEFAULT 0,
  `lstock` int(11) NOT NULL DEFAULT 0,
  `totalstock` int(11) NOT NULL DEFAULT 0,
  `today_opening` int(11) NOT NULL DEFAULT 0,
  `pprice` decimal(10,2) NOT NULL COMMENT 'purchase price',
  `uprice` decimal(10,2) NOT NULL COMMENT 'sell price / MRP',
  `wprice` decimal(10,2) NOT NULL COMMENT 'wholesale price',
  `bsprice` decimal(10,2) DEFAULT NULL,
  `stock` decimal(10,2) NOT NULL DEFAULT 0.00,
  `rstock` decimal(10,2) NOT NULL DEFAULT 0.00,
  `unit` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `gstper` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productmaster`
--

INSERT INTO `productmaster` (`prodid_`, `prodid`, `hsn`, `prodname`, `prodname_hindi`, `shopid`, `wstock`, `dstock`, `lstock`, `totalstock`, `today_opening`, `pprice`, `uprice`, `wprice`, `bsprice`, `stock`, `rstock`, `unit`, `gstper`) VALUES
(3, NULL, '1701', 'SUGAR JADI', 'J साखर ', 1, 2, 0, 37, 0, 0, 37.00, 40.00, 0.00, 39.00, 0.00, 0.00, 'KG', 5.00),
(4, NULL, '1701', 'SUGAR BARIK', 'B साखर ', 1, 2, 0, -5, 0, 0, 35.00, 38.00, 0.00, 37.00, 0.00, 0.00, 'KG', 5.00),
(5, NULL, '07133100', 'MOONG ', 'मूंग ', 1, 0, 0, 7, 0, 0, 87.00, 100.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(6, NULL, '07133100', 'MOONG A1', 'A1 मूंग ', 1, 0, 0, 1, 0, 0, 93.00, 110.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(7, NULL, '0713', 'MOGAR ', 'B मोगर ', 1, 0, 6, -1, 0, 0, 96.00, 110.00, 0.00, 105.00, -0.50, 0.00, 'KG', 0.00),
(8, NULL, '0713', 'MOGAR A1', 'A1 मोगर ', 1, 4, 0, 9, 0, 0, 98.00, 120.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(9, NULL, '0713', 'MOGAR MARUTI', 'मारुती मोगर ', 1, 0, 1, 0, 0, 0, 109.00, 130.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(10, NULL, '0713', 'TURDAL', 'तूरडाल ', 1, 0, 2, -3, 0, 0, 63.00, 80.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(11, NULL, '0713', 'TURDAL 5 ', '5 तुरडाल ', 1, 0, 3, 1, 0, 0, 71.00, 90.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(12, NULL, '1904', 'POHA JADA', 'जाडा पोहा ', 1, 0, 0, -6, 0, 0, 32.00, 44.00, 0.00, 0.00, -1.00, -1.00, 'KG', 0.00),
(13, NULL, '0713', 'TURDAL NATRAJ', 'नटराज ', 1, 0, 19, -10, 0, 0, 79.00, 100.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(14, NULL, '1904', 'POHA BARIK', 'बारीक पोहा ', 1, 2, 0, -2, 0, 0, 0.00, 60.00, 0.00, 48.00, 0.00, 0.00, 'KG', 5.00),
(15, NULL, '1104', 'POHA MAKAI', 'मकाई पोहा ', 1, 2, 0, 0, 0, 0, 0.00, 60.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(16, NULL, '0713', 'TURDAL MARUTI', 'मारुती तुरडाल ', 1, 0, 0, 0, 0, 0, 0.00, 120.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(17, NULL, '0713', 'POHA DAGDI', 'दगडी  पोहा ', 1, 0, 0, 0, 0, 0, 36.00, 56.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(18, NULL, '0713', 'TURDAL DESI', 'देशी तुरडाल ', 1, 0, 0, 0, 0, 0, 90.00, 120.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(19, NULL, '0713', 'TURDAL TELDAL', 'तेलदाल ', 1, 0, 5, 0, 0, 0, 86.00, 100.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(20, NULL, '0713', 'TURDAL TELDAL A1', 'A1 तेलदाल ', 1, 0, 0, 0, 0, 0, 88.00, 110.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(21, NULL, '11072000', 'RAVA JADA', 'रवा जाडा ', 1, 2, 0, -17, 0, 0, 28.00, 36.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(22, NULL, '0713', 'TURDAL P', 'P तुरदाल ', 1, 0, 0, 0, 0, 0, 100.00, 100.00, 100.00, NULL, 0.00, 0.00, 'KG', 0.00),
(23, NULL, '11072000', 'RAVA BARIK', 'रवा बारीक ', 1, 0, 0, -3, 0, 0, 27.50, 36.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(24, NULL, '11072000', 'RAVA IDLY', 'इडली रवा', 1, 0, 0, 0, 0, 0, 36.00, 36.00, 36.00, NULL, 0.00, 0.00, 'KG', 5.00),
(25, NULL, '0713', 'TURDAL KORI', 'तुरडाल कोरी (मढ़ी)', 1, 0, 0, 0, 0, 0, 78.00, 120.00, 120.00, NULL, 0.00, 0.00, 'KG', 0.00),
(26, NULL, '1903', 'SABUDANA', 'साबूदाना', 1, 2, 0, -4, 0, 0, 0.00, 80.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(27, NULL, '1903', 'SABUDANA A1', 'A 1 साबूदाना', 1, 0, 0, -10, 0, 0, 90.00, 90.00, 90.00, NULL, 0.00, 0.00, 'KG', 5.00),
(28, NULL, '1903', 'SABUDANA BARIK', 'बारीक साबूदाना', 1, 0, 0, 0, 0, 0, 0.00, 100.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(29, NULL, '0713', 'CHANA DALL', 'चनादाल', 1, 8, 0, -2, 0, 0, 54.00, 70.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(30, NULL, '0713', 'CHANA DALL 1', '1 चनादाल', 1, 0, 0, -9, 0, 0, 0.00, 75.00, 0.00, 0.00, -1.00, -1.00, 'KG', 0.00),
(31, NULL, '0713', 'CHANA DALL A1', 'A1 चनादाल', 1, 0, 9, 0, 0, 0, 56.00, 80.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(32, NULL, '07132000', 'CHANA ', 'चना', 1, 0, 0, -7, 0, 0, 55.00, 70.00, 70.00, NULL, 0.00, 0.00, 'KG', 0.00),
(33, NULL, '0713', 'CHANA A1', 'A1 चना', 1, 0, 0, -1, 0, 0, 50.00, 80.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(34, NULL, '0713', 'CHANA MOSAMBI', 'मोसंबी चना', 1, 0, 1, -3, 0, 0, 63.12, 90.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(35, NULL, '0713', 'CHANA GREEN', 'ग्रीन चना', 1, 0, 1, 0, 0, 0, 60.00, 80.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(36, NULL, '07134000', 'MASOOR', 'मसूर', 1, 0, 0, -9, 0, 0, 57.00, 70.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(37, NULL, '07134000', 'MASOOR A1 ', 'A 1 मसूर', 1, 0, 0, -5, 0, 0, 54.00, 80.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(38, NULL, '07134000', 'MASOOR DALL', 'मसुरदाल', 1, 0, 0, -2, 0, 0, 58.00, 70.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(39, NULL, '07134000', 'MASOOR DALL A1', 'A1 मसुरदाल', 1, 0, 0, -4, 0, 0, 80.00, 80.00, 80.00, NULL, 0.00, 0.00, 'KG', 0.00),
(40, NULL, '07133100', 'CHILTI', 'छलटी', 1, 0, 5, -10, 0, 0, 86.00, 100.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(41, NULL, '07133100', 'CHILTI A1', 'A1 छिलटी ', 1, 0, 0, -2, 0, 0, 110.00, 110.00, 110.00, NULL, 0.00, 0.00, 'KG', 0.00),
(42, NULL, '07133100', 'CHILTI MARUTI', 'मारुती छिलटी ', 1, 0, 0, -1, 0, 0, 97.00, 120.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(43, NULL, '0713', 'UDAD DALL', 'सफेद दाल', 1, 0, 6, -3, 0, 0, 76.60, 110.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(44, NULL, '0713', 'UDAD DALL 1', '1 सफेद दाल', 1, 0, 0, -2, 0, 0, 101.00, 120.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(45, NULL, '0713', 'UDAD DALL A1', 'A1 सफ़ेद दाल', 1, 0, 0, 0, 0, 0, 105.00, 130.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(46, NULL, '07136000', 'UDAD DALL KALA', 'काली दाल', 1, 0, 0, 0, 0, 0, 79.00, 110.00, 110.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(47, NULL, '07136000', 'UDAD DALL KALI A1', 'A1 काली दाल', 1, 0, 0, 0, 0, 0, 81.00, 120.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(48, NULL, '07136000', 'UDAD KALA AKKHA', 'काला उड़द', 1, 0, 0, 0, 0, 0, 81.00, 120.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(49, NULL, '07136000', 'UDAD GOTA SAFED', 'गोटा सफेद उड़द', 1, 0, 0, 0, 0, 0, 140.00, 140.00, 140.00, NULL, 0.00, 0.00, 'KG', 0.00),
(50, NULL, '07136000', 'UDAD HARI DALL', 'हरी दाल', 1, 0, 0, 0, 0, 0, 180.00, 180.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(51, NULL, '07131000', 'VATANA GREEN', 'ग्रीन वाटाना', 1, 0, 0, 7, 0, 0, 116.00, 140.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(52, NULL, '07131000', 'VATANA GREEN 1', '1 ग्रीन वाटाना', 1, 0, 0, 0, 0, 0, 140.00, 150.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(53, NULL, '07131000', 'VATANA GREEN A1', 'A1 ग्रीन वाटाना', 1, 0, 0, 0, 0, 0, 107.00, 160.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(54, NULL, '07131000', 'VATANA DALL', 'वाटाना दाल', 1, 0, 0, 0, 0, 0, 65.00, 80.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(55, NULL, '07131000', 'VATANA KALA', 'काला वाटाना', 1, 0, 0, -1, 0, 0, 0.00, 80.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(56, NULL, '07131000', 'VATANA KALA 1', 'A1 काला वाटाना', 1, 0, 0, -2, 0, 0, 90.00, 90.00, 90.00, NULL, 0.00, 0.00, 'KG', 0.00),
(57, NULL, '07131000', 'VATANA KALA MARUTI', 'मारुती काला वटाना', 1, 0, 0, -2, 0, 0, 72.00, 100.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(58, NULL, '07131000', 'VATANA SAFED', 'सफेद वटाना', 1, 0, 0, -5, 0, 0, 61.00, 80.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(59, NULL, '07131000', 'VATANA SAFED 1', '1 सफेद वटाना', 1, 0, 0, -2, 0, 0, 90.00, 90.00, 90.00, NULL, 0.00, 0.00, 'KG', 0.00),
(60, NULL, '07131000', 'VATANA SAFED A1', 'A1 सफेद वटाना', 1, 0, 0, -3, 0, 0, 81.00, 100.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(61, NULL, '07136000', 'MATH DAL', 'मठकी दाल', 1, 0, 0, -2, 0, 0, 89.00, 100.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(62, NULL, '07136000', 'MATHKI', 'मटकी', 1, 0, 0, 7, 0, 0, 0.00, 90.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(63, NULL, '007133100', 'MATHKI A1', 'A1 मटकी', 1, 0, 0, -2, 0, 0, 70.00, 100.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(64, NULL, '07133100', 'MATHKI GAWRAN (BARIK)', 'गावरान मटकी', 1, 0, 0, -1, 0, 0, 100.00, 120.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(65, NULL, '07133500', 'CHORA 2', '2 चोरा ', 1, 0, 0, -3, 0, 0, 55.00, 80.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(66, NULL, '07133500', 'CHORA A1', 'A1 चोरा', 1, 0, 0, -4, 0, 0, 72.00, 90.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(67, NULL, '0713', 'CHORA DAL', 'चोरादाल', 1, 0, 0, 0, 0, 0, 83.01, 120.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(68, NULL, '910', 'MASALA AKKHA GARAM', 'अखा गरम मसाला ', 1, 0, 0, 0, 0, 0, 600.00, 600.00, 600.00, NULL, 0.00, 0.00, 'KG', 5.00),
(69, NULL, '910', 'MASALA GARAM D', 'D गरम मसाला', 1, 0, 0, -2, 0, 0, 280.00, 280.00, 280.00, NULL, 0.00, 0.00, 'KG', 5.00),
(70, NULL, '910', 'MASALA GODA', 'गोडा मसाला', 1, 0, 0, 0, 0, 0, 320.00, 320.00, 320.00, NULL, 0.00, 0.00, 'KG', 5.00),
(71, NULL, '910', 'MASALA KAIRI', 'मसाला कैरी', 1, 0, 0, 0, 0, 0, 108.00, 160.00, 0.00, 130.00, 0.00, 0.00, 'KG', 5.00),
(72, NULL, '910', 'MASALA KERI SAMBHAR', 'केरी सांभर मसाला', 1, 0, 0, 0, 0, 0, 150.00, 240.00, 240.00, NULL, 0.00, 0.00, 'KG', 5.00),
(73, NULL, '910', 'MASALA MALVANI', 'मालवणी मसाला', 1, 0, 0, 0, 0, 0, 140.00, 200.00, 200.00, NULL, 0.00, 0.00, 'KG', 5.00),
(74, NULL, '09042010', 'MIRCHI DABBI POWDER', 'डब्बी पावडर', 1, 0, 0, -2, 0, 0, 200.00, 360.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(75, NULL, '09042010', 'MIRCHI HIRAKANI POWDER', 'हिराकनी खंडेला', 1, 0, 0, 0, 0, 0, 130.00, 200.00, 180.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(76, NULL, '09042010', 'MIRCHI KASHMIR POWDER', 'काश्मीर पावडर', 1, 0, 0, 5, 0, 0, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(77, NULL, '09042010', 'MIRCHI KHANDELA KASHMIRI', 'काश्मीरी खंडेला', 1, 0, 0, 0, 0, 0, 210.00, 320.00, 240.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(78, NULL, '1701', 'GUD 1no', '1 गुड ', 1, 0, 0, -14, 0, 0, 42.00, 56.00, 0.00, 52.00, 0.00, 0.00, 'KG', 5.00),
(79, NULL, '09093000', 'JEERA 1', 'नुं 1 जीरा', 1, 0, 0, -6, 0, 0, 0.00, 220.00, 0.00, 200.00, 0.00, 0.00, 'KG', 5.00),
(80, NULL, '09093000', 'JEERA RAJWADI', 'R जीरा', 1, 0, 0, 0, 0, 0, 0.00, 240.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(81, NULL, '09093000', 'JEERA RAJWADI 100 GM', 'R जीरा 100 GM', 1, 0, 0, -8, 0, 0, 30.00, 30.00, 30.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(82, NULL, '09093000', 'JEERA RAJWADI 50 GM', 'R जीरा 50 GM', 1, 0, 0, 0, 0, 0, 15.00, 15.00, 15.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(83, NULL, '09093000', 'JEERA SHAJEERA', 'शाजीरा', 1, 0, 0, -2, 0, 0, 475.00, 800.00, 800.00, NULL, 0.00, 0.00, 'KG', 5.00),
(84, NULL, '09093000', 'JEERA SHAJEERA 100GM', 'शाजीरा 100GM', 1, 0, 0, 0, 0, 0, 0.00, 120.00, 100.00, 0.00, 0.00, 0.00, 'PKT', 5.00),
(85, NULL, '09093000', 'JEERA SHAJEERA 50GM', 'शाजीरा 50GM', 1, 0, 0, -2, 0, 0, 50.00, 50.00, 50.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(86, NULL, '09093000', 'JEERA SHAJEERA 25GM', 'शाजीरा 25GM', 1, 0, 0, 0, 0, 0, 30.00, 30.00, 30.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(87, NULL, '09093000', 'JEERA SHAJEERA 10GM', 'शाजीरा 10GM', 1, 0, 0, 0, 0, 0, 15.00, 15.00, 15.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(88, NULL, '09093000', 'JEERA SHAJEERA A1', 'शाजीरा नुं 1', 1, 0, 0, 0, 0, 0, 1000.00, 1000.00, 1000.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(89, NULL, '07133500', 'CHORA DOLLAR ', 'डोलर चोरा', 1, 0, 0, -1, 0, 0, 77.00, 100.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(90, NULL, '910', 'RAI 2', '2 राइ', 1, 2, 0, 10, 0, 0, 48.30, 60.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(91, NULL, '07133500', 'CHORA LAL', 'लालचवली', 1, 0, 0, -1, 0, 0, 78.00, 100.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(92, NULL, '07133500', 'CHORA TINOPOL (BARIK)', 'बारीक चवली', 1, 0, 0, -2, 0, 0, 87.00, 100.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(93, NULL, '910', 'RAI A1', 'A1 राय', 1, 0, 0, 1, 0, 0, 60.00, 80.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(94, NULL, '910', 'RAI A1 100GM', 'A1 राइ 100 GM', 1, 0, 0, -5, 0, 0, 15.00, 15.00, 15.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(95, NULL, '0713', 'MIX DAL', 'मिक्स दाल', 1, 0, 0, 0, 0, 0, 120.00, 120.00, 120.00, NULL, 0.00, 0.00, 'KG', 0.00),
(96, NULL, '910', 'RAI DAL', 'राय दाल', 1, 0, 0, -1, 0, 0, 80.00, 80.00, 80.00, NULL, 0.00, 0.00, 'KG', 5.00),
(97, NULL, '0713', 'MIX KATOR', 'मिक्स कठोड़', 1, 0, 0, 0, 0, 0, 120.00, 120.00, 120.00, NULL, 0.00, 0.00, 'KG', 0.00),
(98, NULL, '910', 'RAI NAVI', 'नवी राय', 1, 1, 0, -4, 0, 0, 97.00, 100.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(99, NULL, '910', 'RAI PILA', 'पिला राइ', 1, 0, 0, 0, 0, 0, 62.00, 120.00, 120.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(100, NULL, '910', 'RAI POWDER', 'राय पावडर', 1, 0, 0, 0, 0, 0, 100.00, 100.00, 100.00, NULL, 0.00, 0.00, 'KG', 5.00),
(101, NULL, '11010000', 'ATTA   VARI       ', 'वरी  आटा', 1, 0, 0, 0, 0, 0, 120.00, 120.00, 120.00, NULL, 0.00, 0.00, 'KG', 5.00),
(102, NULL, '10082029', 'BAJARI A1', 'A1 बाजरी', 1, 0, 0, -3, 0, 0, 32.00, 36.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(103, NULL, '10082029', 'BAJAR KABUTAR', 'कबूतर बाजरी', 1, 0, 0, -1, 0, 0, 25.00, 32.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(104, NULL, '11010000', 'ATTA BAJAR', 'बाजरी आटा', 1, 0, 0, 0, 0, 0, 0.00, 60.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(105, NULL, '10082029', 'BAJARI NO2', '2 NO बाजरी', 1, 0, 0, 0, 0, 0, 28.00, 28.00, 28.00, NULL, 0.00, 0.00, 'KG', 0.00),
(106, NULL, '11010000', 'ATTA BESON KARKARA', 'बेसन करकरा आटा', 1, 0, 0, 0, 0, 0, 120.00, 120.00, 120.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(107, NULL, '11010000', 'ATTA CORN FLOUR', 'मकाई आटा', 1, 0, 0, 0, 0, 0, 70.00, 70.00, 70.00, NULL, 0.00, 0.00, 'KG', 5.00),
(108, NULL, '11010000', 'ATTA DHOKLA', 'ढोकला आटा', 1, 0, 0, 0, 0, 0, 80.00, 80.00, 80.00, NULL, 0.00, 0.00, 'KG', 5.00),
(109, NULL, '10082019', 'JAWAR KABUTAR', 'कबूतर जवारी', 1, 0, 0, 0, 0, 0, 28.00, 32.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(110, NULL, '10082019', 'JAWARI SOLAPUR', 'सोलापुर जवारी', 1, 0, 0, -4, 0, 0, 32.00, 48.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(111, NULL, '10082039', 'NACHANI', 'नाचनी', 1, 1, 0, -2, 0, 0, 40.00, 48.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(112, NULL, '11040000', 'ATTA HANDAVA', 'हंडवा आटा', 1, 0, 0, 0, 0, 0, 140.00, 140.00, 140.00, NULL, 0.00, 0.00, 'KG', 0.00),
(113, NULL, '07131000', 'WALL', 'A1 वाल', 1, 0, 0, 2, 0, 0, 53.00, 100.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(114, NULL, '11040000', 'ATTA JAV', 'जव आटा', 1, 0, 0, 0, 0, 0, 70.00, 70.00, 70.00, NULL, 0.00, 0.00, 'KG', 0.00),
(115, NULL, '11040000', 'ATTA JUWAR', 'जवारी आटा', 1, 0, 0, 0, 0, 0, 70.00, 70.00, 70.00, NULL, 0.00, 0.00, 'KG', 0.00),
(116, NULL, '07131000', 'WALL GOT', 'गोट वाल', 1, 0, 0, 0, 0, 0, 160.00, 160.00, 160.00, NULL, 0.00, 0.00, 'KG', 0.00),
(117, NULL, '11040000', 'ATTA KARKARA GAHU', 'गहू आटा करकरा', 1, 0, 0, 0, 0, 0, 60.00, 60.00, 60.00, NULL, 0.00, 0.00, 'KG', 0.00),
(118, NULL, '07131000', 'WALL DAL', 'A1 वालदाल', 1, 0, 0, 1, 0, 0, 72.00, 120.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(119, NULL, '11040000', 'ATTA KHATA TOKLA', 'खट्टा ढोकला आटा ', 1, 0, 0, 0, 0, 0, 80.00, 80.00, 80.00, NULL, 0.00, 0.00, 'KG', 0.00),
(120, NULL, '07131000', 'WALL KADWA', 'कड़वा वाल', 1, 0, 0, 0, 0, 0, 180.00, 180.00, 180.00, NULL, 0.00, 0.00, 'KG', 0.00),
(121, NULL, '11040000', 'ATTA KULTHI (HULGA)', 'कुलथी आटा', 1, 0, 0, 0, 0, 0, 120.00, 120.00, 120.00, NULL, 0.00, 0.00, 'KG', 0.00),
(122, NULL, '07131000', 'WALL PAPDI', 'पापड़ी वाल', 1, 0, 0, -1, 0, 0, 0.00, 120.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(123, NULL, '11040000', 'ATTA KUTI', 'कुटी आटा', 1, 0, 0, 0, 0, 0, 160.00, 160.00, 160.00, NULL, 0.00, 0.00, 'KG', 0.00),
(124, NULL, '11040000', 'ATTA LADDU', 'लड्डू आटा', 1, 0, 0, 0, 0, 0, 80.00, 80.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(125, NULL, '11040000', 'ATTA LOOSE', 'लूस आटा', 1, 0, 0, 0, 0, 0, 26.00, 26.00, 26.00, NULL, 0.00, 0.00, 'KG', 0.00),
(126, NULL, '1701', 'SUGAR BURA', 'बुरासकर', 1, 0, 0, 0, 0, 0, 36.00, 48.00, 48.00, NULL, 0.00, 0.00, 'KG', 5.00),
(127, NULL, '11040000', 'ATTA MARUTI 10KG', 'मारुती आटा 10KG', 1, 0, 0, 0, 0, 0, 280.00, 280.00, 280.00, NULL, 0.00, 0.00, 'KG', 0.00),
(128, NULL, '1710', 'SUGAR KHADI ', 'खड़ीसाकार', 1, 1, 0, 1, 0, 0, 49.00, 70.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(129, NULL, '11040000', 'ATTA MARUTI 5KG', 'मारुती आटा 5KG', 1, 0, 0, 0, 0, 0, 140.00, 140.00, 140.00, NULL, 0.00, 0.00, 'KG', 0.00),
(130, NULL, '11040000', 'ATTA MODAK ', 'आटा मोदक', 1, 0, 0, 0, 0, 0, 60.00, 60.00, 60.00, NULL, 0.00, 0.00, 'KG', 0.00),
(131, NULL, '1701', 'SUGAR RAVAL GAON', 'रावलगाव', 1, 1, 0, 0, 0, 0, 0.00, 60.00, 0.00, 54.00, 0.00, 0.00, 'KG', 5.00),
(132, NULL, '11040000', 'ATTA MOONG DAL (SHEERA)', 'मूंगदाल आटा', 1, 0, 0, 0, 0, 0, 120.00, 120.00, 120.00, NULL, 0.00, 0.00, 'KG', 0.00),
(133, NULL, '11040000', 'ATTA NACHANI', 'नाचनी आटा', 1, 0, 0, 0, 0, 0, 70.00, 70.00, 70.00, NULL, 0.00, 0.00, 'KG', 0.00),
(134, NULL, '11040000', 'ATTA RAJGIRA', 'राजगिरा आटा', 1, 0, 0, -1, 0, 0, 120.00, 120.00, 120.00, NULL, 0.00, 0.00, 'KG', 0.00),
(135, NULL, '1701', 'SUGAR PKT MB', 'MB रावलगाव', 1, 0, 0, 0, 0, 0, 90.00, 90.00, 90.00, NULL, 0.00, 0.00, 'KG', 5.00),
(136, NULL, '11040000', 'ATTA RICE', 'चावल आटा', 1, 0, 0, 0, 0, 0, 50.00, 50.00, 50.00, NULL, 0.00, 0.00, 'KG', 0.00),
(137, NULL, '11040000', 'ATTA SHINGODA', 'सिंगोड़ा आटा', 1, 0, 0, 0, 0, 0, 160.00, 160.00, 160.00, NULL, 0.00, 0.00, 'KG', 0.00),
(138, NULL, '11040000', 'ATTA UDAD DAL (BARIK)', 'उड़द दाल आटा', 1, 0, 0, 0, 0, 0, 160.00, 160.00, 160.00, NULL, 0.00, 0.00, 'KG', 0.00),
(139, NULL, '09103020', 'HALDI POOJA', 'पुजा हल्दी', 1, 0, 0, 0, 0, 0, 140.00, 140.00, 140.00, NULL, 0.00, 0.00, 'KG', 5.00),
(140, NULL, '11040000', 'ATTA UDAD KARKRA', ' उड़द करकरा आटा', 1, 0, 0, 0, 0, 0, 160.00, 160.00, 160.00, NULL, 0.00, 0.00, 'KG', 0.00),
(142, NULL, '09103020', 'HALDI POWDER GOLDEN', 'गोल्डन हल्दी पावडर', 1, 0, 0, -8, 0, 0, 0.00, 160.00, 0.00, NULL, 0.00, 0.00, 'PKT', 0.00),
(143, NULL, '09103020', 'HALDI POWDAR 100 gm', 'हल्दी पावडर 100 gm', 1, 0, 0, -3, 0, 0, 20.00, 20.00, 20.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(144, NULL, '0910', 'HALDI SELAN RAJWADI', 'R सेलम', 1, 0, 0, -3, 0, 0, 0.00, 180.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(145, NULL, '1101', 'ATTA WH ASHIRWAD 10KG', 'आशिर्वाद आटा 10KG', 1, 9, 0, 0, 0, 0, 315.00, 370.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(146, NULL, '0909', 'DHANA 100gm', 'धाना 100gm', 1, 0, 0, -1, 0, 0, 30.00, 30.00, 30.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(147, NULL, '1101', 'ATTA WH ASHIRWAD 5KG', 'आशिर्वाद आटा 5KG', 1, 4, 0, 0, 0, 0, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(148, NULL, '0909', 'DHANA 50gm', 'धाना 50gm', 1, 0, 0, -2, 0, 0, 15.00, 15.00, 15.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(150, NULL, '0909', 'DHANA KURIYA', 'धना कुरिया', 1, 0, 0, 0, 0, 0, 180.00, 180.00, 180.00, NULL, 0.00, 0.00, 'KG', 5.00),
(152, NULL, '0909', 'DHANA', 'धाना', 1, 2, 0, 3, 0, 0, 80.00, 140.00, 0.00, 100.00, 0.00, 0.00, 'KG', 5.00),
(153, NULL, '0909', 'DHANA DAL', 'धानादाल', 1, 0, 0, 0, 0, 0, 170.00, 200.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(154, NULL, '0909', 'DHANA INDORI', 'इंदोरी धाना', 1, 4, 0, 0, 0, 0, 140.00, 200.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(155, NULL, '1101', 'ATTA WH SAMRAT 10KG', 'सम्राट आटा 10KG', 1, 11, 0, 0, 0, 0, 310.00, 340.00, 0.00, 0.00, 0.00, 0.00, 'PKT', 5.00),
(156, NULL, '0909', 'DHANA POWDER', 'A1 धाना पावडर', 1, 0, 0, -3, 0, 0, 0.00, 160.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(157, NULL, '0909', 'DHANA JEERA POWDER', 'A1 धना जीरा', 1, 0, 0, -2, 0, 0, 200.00, 200.00, 200.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(158, NULL, '1101', 'ATTA WH SAMRAT 5KG', 'सम्राट आटा 5KG', 1, 4, 0, 0, 0, 0, 0.00, 170.00, 0.00, 0.00, 0.00, 0.00, 'PKT', 5.00),
(159, NULL, '0909', 'DHANA VM ', 'VM धाना', 1, 0, 0, -4, 0, 0, 110.00, 160.00, 0.00, 0.00, -1.00, 0.00, 'KG', 5.00),
(160, NULL, '11010000', 'ATTA WH SHAKTI 10KG', 'शक्ती आटा 10KG', 1, 0, 0, 0, 0, 0, 310.00, 340.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(161, NULL, '1101', 'ATTA WH SHAKTI 5KG', 'शक्ती आटा 5KG', 1, 2, 0, 0, 0, 0, 160.00, 170.00, 0.00, 0.00, 0.00, 0.00, 'PKT', 5.00),
(162, NULL, '21061000', 'DALIYA A1', 'A1 दालिया', 1, 2, 0, 1, 0, 0, 0.00, 90.00, 0.00, 0.00, 0.00, 0.00, 'KG', 12.00),
(164, NULL, '21061000', 'DALIYA 2', '2 दालिया', 1, 3, 0, 0, 0, 0, 0.00, 80.00, 0.00, 0.00, 0.00, 0.00, 'KG', 12.00),
(165, NULL, '0813', 'AWALA POWDER', 'आवला पावडर', 1, 0, 0, -1, 0, 0, 170.00, 280.00, 0.00, 0.00, 0.00, 0.00, 'KG', 12.00),
(166, NULL, '1701', 'GUD 250GM', 'गुड़ 250GM', 1, 0, 0, -2, 0, 0, 15.00, 15.00, 15.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(167, NULL, '1701', 'GUD BHILLI 500GM', 'गुड़ 500GM', 1, 0, 0, 0, 0, 0, 30.00, 30.00, 30.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(168, NULL, '10019020', 'GAHU LOKVAN', 'गहू लोकवान', 1, 0, 0, 0, 0, 0, 28.00, 32.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(169, NULL, '1701', 'GUD CHIKKI', 'चिकी गुड', 1, 0, 0, -1, 0, 0, 47.00, 60.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(170, NULL, '10019020', 'GAHU LOKVAN 1', '1 गहू लोकवान', 1, 0, 0, 0, 0, 0, 34.00, 34.00, 34.00, NULL, 0.00, 0.00, 'KG', 0.00),
(171, NULL, '1701', 'GUD DESHI 1KG', 'देसी गुड़ 1 KG', 1, 0, 0, 6, 0, 0, 60.00, 60.00, 60.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(172, NULL, '10019020', 'GAHU LOKVAN A1', 'गहू लोकवान A1', 1, 0, 0, 0, 0, 0, 30.00, 36.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(173, NULL, '1701', 'GUD DESHI 500', 'गुड देशी 500', 1, 0, 0, -1, 0, 0, 32.00, 32.00, 32.00, NULL, 0.00, 0.00, 'KG', 5.00),
(174, NULL, '10019020', 'GAHU SEHARI', 'सीहोर गहू', 1, 18, 0, 0, 0, 0, 28.00, 34.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(175, NULL, '1701', 'GUD DESHI DABBA PAAWAK 500gm', 'देशी गुड डब्बा पावक  500gm', 1, 0, 0, 0, 0, 0, 80.00, 80.00, 80.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(176, NULL, '1001', 'GAHU  SEHARI A1', 'A1 सीहोर गहू', 1, 0, 0, -5, 0, 0, 30.00, 36.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(177, NULL, '1701', 'GUD DESHI KESAR', 'गुड केसर देशी 1KG', 1, 0, 0, -4, 0, 0, 64.00, 64.00, 64.00, NULL, 0.00, 0.00, 'KG', 5.00),
(178, NULL, '1701', 'GUD DHEB 1KG', 'गुड़ ढेब', 1, 0, 0, 0, 0, 0, 60.00, 60.00, 60.00, NULL, 0.00, 0.00, 'KG', 5.00),
(179, NULL, '1701', 'GUD KESAR DESHI DABBA 500GM', 'गुड केसर देशी डब्बा500gm ', 1, 0, 0, -1, 0, 0, 80.00, 80.00, 80.00, NULL, 0.00, 0.00, 'KG', 5.00),
(180, NULL, '1701', 'GUD POWDER 500GM', 'गुड पाउडर 500GM', 1, 0, 0, 0, 0, 0, 80.00, 80.00, 80.00, NULL, 0.00, 0.00, 'KG', 5.00),
(181, NULL, '07132000', 'CHANA ROASTED ', 'सकेला पिला चना', 1, 0, 0, -2, 0, 0, 120.00, 120.00, 120.00, NULL, 0.00, 0.00, 'KG', 0.00),
(182, NULL, '07132000', 'CHANA ROASTED BLACK ', 'सेकेला काला चना', 1, 0, 0, 0, 0, 0, 180.00, 180.00, 180.00, NULL, 0.00, 0.00, 'KG', 0.00),
(183, NULL, '1701', 'GUD TIKLI', 'गुड़ टिकली', 1, 0, 0, 0, 0, 0, 80.00, 80.00, 80.00, NULL, 0.00, 0.00, 'KG', 5.00),
(184, NULL, '1701', 'GUD MODAK', 'मोदक गुड', 1, 0, 0, 0, 0, 0, 100.00, 100.00, 100.00, NULL, 0.00, 0.00, 'KG', 5.00),
(185, NULL, '2501', 'NAMAK JADA', 'जाडा नमक', 1, 3, 0, 0, 0, 0, 8.00, 10.00, 10.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(186, NULL, '2501', 'NAMAK BARIK', 'बारीक नमक', 1, 9, 0, -1, 0, 0, 0.00, 10.00, 0.00, 0.00, -1.00, -1.00, 'KG', 0.00),
(187, NULL, '25010010', 'NAMAK TATA', 'टाटा नमक', 1, 20, 0, 0, 0, 0, 16.80, 19.00, 20.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(188, NULL, '25010010', 'NAMAK SUNCHAL POWDER', 'संचल पावडर', 1, 1, 0, 0, 0, 0, 0.00, 20.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(189, NULL, '25010020', 'NAMAK SUNCHUR', 'संचल', 1, 0, 0, 0, 0, 0, 0.00, 40.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(190, NULL, '2501', 'NAMAK SINDHAR POWDER', 'सिंधा पावडर', 1, 6, 0, 1, 0, 0, 11.00, 20.00, 0.00, 18.00, 0.00, 0.00, 'KG', 0.00),
(191, NULL, '2501', 'NAMAK SINDHAR ', 'सिंधा नमक', 1, 3, 0, 1, 0, 0, 33.00, 60.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(192, NULL, '12030000', 'KOPARA GOTA RAJAPUR', 'गोटा खोपरा', 1, 0, 0, 0, 0, 0, 200.00, 200.00, 200.00, NULL, 0.00, 0.00, 'KG', 5.00),
(193, NULL, '1203', 'KOPARA A1 RAJAPUR', 'A1 मारुती राजापुर', 1, 6, 0, -3, 0, 0, 140.00, 180.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(194, NULL, '0713', 'KULTHI ( HULGA)', 'कुलथी', 1, 0, 0, 0, 0, 0, 60.00, 70.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(196, NULL, '1001', 'LAPSI BARIK', 'बारीक लापसी', 1, 0, 0, -1, 0, 0, 0.00, 48.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(197, NULL, '1203', 'KOPARA RAMAKDA', 'रमकड़ा खोपरा', 1, 0, 0, -2, 0, 0, 140.00, 170.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(198, NULL, '1001', 'LAPSI JADI', 'लापसी', 1, 1, 0, -1, 0, 0, 0.00, 48.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(200, NULL, '1202', 'SINGDANA LATUR', 'लातूर', 1, 2, 0, 1, 0, 0, 110.00, 110.00, 110.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(201, NULL, '1202', 'SINGDANA BORIYA', 'नवा बोरिया', 1, 3, 0, 6, 0, 0, 82.00, 120.00, 0.00, 100.00, 0.00, 0.00, 'KG', 5.00),
(202, NULL, '1101', 'MAIDA', 'मैदा', 1, 3, 0, -7, 0, 0, 26.00, 32.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(203, NULL, '1202', 'SINGDANA NAVA DISKO', 'नवा डिस्को', 1, 2, 0, 1, 0, 0, 94.00, 130.00, 0.00, 110.00, 0.00, 0.00, 'KG', 5.00),
(204, NULL, '11040000', 'ATTA FARALI ', 'आटा फराडी ', 1, 0, 0, 0, 0, 0, 120.00, 120.00, 120.00, NULL, 0.00, 0.00, 'KG', 0.00),
(205, NULL, '910', 'GUGAD', 'गुगड़', 1, 0, 0, 0, 0, 0, 480.00, 480.00, 480.00, NULL, 0.00, 0.00, 'KG', 5.00),
(206, NULL, '0813', 'AALUCHA', 'आलूचा', 1, 0, 0, 0, 0, 0, 480.00, 480.00, 480.00, 0.00, 0.00, 0.00, 'KG', 12.00),
(207, NULL, '0813', 'AALUCHA TRAY 200GM', 'आलूचा ट्रे 200GM', 1, 0, 0, 0, 0, 0, 100.00, 100.00, 0.00, 0.00, 0.00, 0.00, 'PKT', 12.00),
(208, NULL, '1006', 'RICE AMBA MOR', 'जुना अंबा मोर', 1, 0, 0, 0, 0, 0, 0.00, 90.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(209, NULL, '0813', 'AALUCHA TRAY 400GM', 'आलूचा ट्रे 400GM', 1, 0, 0, 0, 0, 0, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 'PKT', 12.00),
(210, NULL, '0813', 'AAM PAPAD', 'आम पापड', 1, 0, 0, 0, 0, 0, 160.00, 160.00, 160.00, NULL, 0.00, 0.00, 'KG', 12.00),
(211, NULL, '1006', 'RICE AMBAMOR NEW', 'नया अंबा मोर', 1, 7, 0, 0, 0, 0, 0.00, 75.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(212, NULL, '0813', 'AAM PAPAD HAPHUS', 'आम पापड़ हाफुस', 1, 0, 0, 0, 0, 0, 240.00, 240.00, 240.00, NULL, 0.00, 0.00, 'KG', 12.00),
(213, NULL, '1006', 'RICE BABA DUBAR', 'बाबा दुबार', 1, 13, 0, 1, 0, 0, 35.00, 44.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(214, NULL, '910', 'AAMCHUR POWDER 2', '2 आमचूर पाउडर', 1, 0, 0, -1, 0, 0, 50.00, 120.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(215, NULL, '11040000', 'ATTA MANCHURAN ', 'मंचुरण आटा 250GM', 1, 0, 0, -6, 0, 0, 30.00, 35.00, 40.00, 0.00, 0.00, 0.00, 'GRM', 0.00),
(216, NULL, '1006', 'RICE BASMATI JINAT', 'जिनत बासमती', 1, 0, 0, -5, 0, 0, 63.00, 90.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(217, NULL, '1006', 'RICE BASMATI BROWN', 'ब्राउन बासमती राइस ', 1, 0, 0, 0, 0, 0, 0.00, 120.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(218, NULL, '09109914', 'AJMA 100gm', 'अजमा 100gm', 1, 0, 0, -1, 0, 0, 50.00, 50.00, 50.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(219, NULL, '1006', 'RICE CHAPI KOLUM', 'छापि कोलाम', 1, 8, 0, -4, 0, 0, 0.00, 55.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(220, NULL, '09109914', 'AJMA  A1', 'आजमा A1 ', 1, 0, 0, -3, 0, 0, 200.00, 200.00, 200.00, NULL, 0.00, 0.00, 'KG', 5.00),
(221, NULL, '1006', 'RICE CHAUDRI TIBAR', 'चौदरी तिबार', 1, 6, 0, 1, 0, 0, 0.00, 80.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(222, NULL, '09109914', 'AJMA NAVA', 'नवा आजमा', 1, 0, 0, -1, 0, 0, 260.00, 360.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(223, NULL, '09109914', 'AJMA POWDER', 'अजमा पावडर', 1, 0, 0, 0, 0, 0, 400.00, 400.00, 400.00, NULL, 0.00, 0.00, 'KG', 5.00),
(224, NULL, '1006', 'RICE DUDHMALAI', 'दूधमलाई चावल', 1, 0, 0, 0, 0, 0, 56.00, 56.00, 56.00, NULL, 0.00, 0.00, 'KG', 0.00),
(225, NULL, '09109914', 'AJMA SEKELA ', 'सेकेला आजमा ', 1, 0, 0, 30, 0, 0, 240.00, 400.00, 0.00, 360.00, 0.00, 0.00, 'KG', 5.00),
(226, NULL, '1006', 'RICE HMT KOLUM', 'HMT कोलम', 1, 9, 0, -1, 0, 0, 0.00, 55.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(227, NULL, '1204', 'ALSI', 'अलसी', 1, 0, 0, 0, 0, 0, 63.00, 100.00, 0.00, 90.00, 0.00, 0.00, 'KG', 5.00),
(228, NULL, '1006', 'RICE HMT STEEM', 'स्टीम HMT कोलम', 1, 8, 0, 1, 0, 0, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(229, NULL, '0909', 'ALSI SEKELI', 'अलसी सकेली', 1, 0, 0, 0, 0, 0, 80.00, 120.00, 120.00, NULL, 0.00, 0.00, 'KG', 5.00),
(230, NULL, '1006', 'RICE INDRAYINI ', 'इन्द्रायनी', 1, 0, 0, 0, 0, 0, 39.00, 52.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(232, NULL, '1006', 'RICE UKDA AIYYAR', 'आईयर उकडा चावल ', 1, 1, 0, 1, 0, 0, 30.00, 40.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(233, NULL, '1066', 'RICE KOLUM TUKDA', 'कोलम टुकड़ा', 1, 3, 0, 1, 0, 0, 0.00, 44.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(234, NULL, '1006', 'RICE MASSORI', 'मसूरी चावल', 1, 2, 0, 1, 0, 0, 0.00, 32.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(235, NULL, '1006', 'RICE MASSORI UKDA', 'मसूरी उकडा चावल', 1, 2, 0, 1, 0, 0, 0.00, 40.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(236, NULL, '1006', 'RICE MOGARA KANI', 'मोगरा कनि', 1, 15, 0, 1, 0, 0, 31.00, 40.00, 40.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(237, NULL, '0813', 'ALUBHUKARA', 'आलुभुकारा', 1, 0, 0, 0, 0, 0, 190.00, 360.00, 360.00, 0.00, 0.00, 0.00, 'KG', 12.00),
(238, NULL, '1006', 'RICE MASSORI NEW', 'नवा मसुरी चावल', 1, 5, 0, 0, 0, 0, 0.00, 34.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(239, NULL, '09103020', 'AMBAHALDI', 'अंबाहलदी', 1, 0, 0, 0, 0, 0, 280.00, 280.00, 280.00, NULL, 0.00, 0.00, 'KG', 5.00),
(240, NULL, '1006', 'RICE WADA NEW KOLAM', 'नवा वाडा कोलम', 1, 0, 0, 0, 0, 0, 0.00, 52.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(241, NULL, '910', 'AMBAHALDI POWDER', 'अंबाहलदी पावडर', 1, 0, 0, 0, 0, 0, 110.00, 280.00, 280.00, NULL, 0.00, 0.00, 'KG', 5.00),
(242, NULL, '1006', 'RICE PALO DUBAR', 'पालो दुबार', 1, 24, 0, -2, 0, 0, 41.00, 50.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(243, NULL, '1006', 'RICE PARIMAL CHOKHA', ' A1 परिमल ', 1, 14, 0, 0, 0, 0, 25.00, 32.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(244, NULL, '12079940', 'AMBOSI AA', 'आम्बोसी AA', 1, 0, 0, 0, 0, 0, 360.00, 360.00, 360.00, NULL, 0.00, 0.00, 'KG', 5.00),
(245, NULL, '1006', 'RICE PARIMAL NEW', 'नवा परिमल', 1, 2, 0, -5, 0, 0, 0.00, 36.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(246, NULL, '12079940', 'AMBOSI JUNI', 'आम्बोसी जुनी', 1, 0, 0, 0, 0, 0, 200.00, 200.00, 200.00, NULL, 0.00, 0.00, 'KG', 0.00),
(247, NULL, '1006', 'RICE BASMATI SELLA  2', '2 सेला बासमती', 1, 14, 0, 1, 0, 0, 0.00, 60.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(248, NULL, '1006', 'RICE SILVER KOLUM', 'सिलवर कोलम', 1, 10, 0, 0, 0, 0, 43.00, 60.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(249, NULL, '21069011', 'AMRUT KESAR SARABAT 700ML ', 'अमृत केसर सिरप 700 ML', 1, 0, 0, 0, 0, 0, 180.00, 180.00, 180.00, NULL, 0.00, 0.00, 'KG', 18.00),
(250, NULL, '21069011', 'AMRUT KESAR SYRUP', 'अमृत केसर सिरप', 1, 0, 0, 0, 0, 0, 50.00, 50.00, 50.00, NULL, 0.00, 0.00, 'GRM', 18.00),
(251, NULL, '1006', 'RICE STEAM KOLUM', 'स्टीम कलचर कोलम', 1, 18, 0, -4, 0, 0, 32.00, 44.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(252, NULL, '1006', 'RICE TINNI', ' टिन्नी चावल', 1, 0, 0, 0, 0, 0, 36.00, 60.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(253, NULL, '11040000', 'ATTA ANARASE ', 'अनारसे पीठ', 1, 0, 0, 0, 0, 0, 140.00, 140.00, 140.00, NULL, 0.00, 0.00, 'KG', 0.00),
(254, NULL, '0813', 'ANGOOR', 'अंगूर', 1, 0, 0, 0, 0, 0, 438.00, 480.00, 480.00, NULL, 0.00, 0.00, 'KG', 12.00),
(255, NULL, '1006', 'RICE BASMATI UNIK', 'यूनिक बासमती ', 1, 10, 0, -1, 0, 0, 52.00, 80.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(256, NULL, '1104', 'ANIL (ARARUT)', 'अनिल', 1, 5, 0, 1, 0, 0, 33.00, 80.00, 0.00, 48.00, 0.00, 0.00, 'KG', 0.00),
(257, NULL, '1006', 'RICE UNITY MOGRA 25KG', 'यूनिटी मोगरा 25kg', 1, 7, 0, 1, 0, 0, 0.00, 480.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(258, NULL, '1006', 'RICE WADA KOLUM JUNA', 'जुना वाडा कोलम ', 1, 11, 0, 1, 0, 0, 0.00, 64.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(259, NULL, '1006', 'RICE BASMATI WAGHA', 'वाघा बासमती', 1, 11, 0, -3, 0, 0, 65.00, 100.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(260, NULL, '910', 'ARITHA MOTHA', 'अरीठा मोटा', 1, 0, 0, 0, 0, 0, 160.00, 160.00, 160.00, NULL, 0.00, 0.00, 'KG', 5.00),
(261, NULL, '910', 'ARITHA NANA', 'नाना अरीठा', 1, 0, 0, 0, 0, 0, 160.00, 160.00, 160.00, NULL, 0.00, 0.00, 'KG', 5.00),
(262, NULL, '910', 'ARITHA POWDER', 'अरीठा पावडर', 1, 0, 0, 0, 0, 0, 80.00, 160.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(263, NULL, '1006', 'RICE INDIAGATE SUPER 5KG', 'इंडिया गेट सुपर 5kg', 1, 0, 0, 0, 0, 0, 470.00, 700.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(264, NULL, '1006', 'RICE INDIAGATE SUPER BASMATI 1KG', 'इंडिया गेट सुपर 1kg', 1, 0, 0, 0, 0, 0, 118.00, 140.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(265, NULL, '1006', 'RICE INDIAGATE MINI MOGRA 5KG', 'इंडियागेट मिनी मोगरा 5KG', 1, 0, 0, -1, 0, 0, 0.00, 250.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(266, NULL, '1006', 'RICE INDIAGATE MINI MOGRA (2)', 'इंडियागेट मिनी मोगरा (2)10kg', 1, 0, 0, 0, 0, 0, 360.00, 360.00, 360.00, NULL, 0.00, 0.00, 'KG', 0.00),
(267, NULL, '1006', 'RICE INDIAGATE MOGRA 5KG', 'इंडिया गेट मोगरा 5kg', 1, 0, 0, 0, 0, 0, 0.00, 300.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(268, NULL, '1006', 'RICE KOHINOOR DUBAR ', 'कोहिनूर दुबार', 1, 5, 0, 1, 0, 0, 0.00, 80.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(269, NULL, '1006', 'RICE KOHINOOR NAWA TIBAR', 'कोहिनूर नवा तिबार', 1, 2, 0, 1, 0, 0, 0.00, 90.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(270, NULL, '1006', 'RICE KOHINOOR SUPER 1KG', 'कोहिनूर अखा बासमती 1kg', 1, 0, 0, 0, 0, 0, 110.00, 110.00, 110.00, NULL, 0.00, 0.00, 'KG', 0.00),
(271, NULL, '11063090', 'BESAN A1', 'बेसन A1 ', 1, 0, 0, 1, 0, 0, 61.00, 80.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(272, NULL, '11061000', 'BESAN SAMARAT', 'बेसन सम्राट ', 1, 0, 0, -1, 0, 0, 70.00, 80.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(273, NULL, '11043000', 'BHAGAR', 'सामो', 1, 0, 0, -1, 0, 0, 76.00, 100.00, 100.00, NULL, 0.00, 0.00, 'KG', 0.00),
(274, NULL, '1904', 'POHA BHAJKA ', 'भाजका पोहा', 1, 0, 0, 0, 0, 0, 70.00, 70.00, 70.00, NULL, 0.00, 0.00, 'KG', 5.00),
(275, NULL, '9105', 'NAMKEEN BHAKAR WADI', 'फरसाण  भाकर वडी ', 1, 0, 0, 0, 0, 0, 160.00, 160.00, 160.00, NULL, 0.00, 0.00, 'KG', 18.00),
(276, NULL, '1006', 'RICE LALQILLA BASMATI 1 KG', 'लालकिला बासमती 1KG', 1, 0, 0, 0, 0, 0, 180.00, 180.00, 180.00, NULL, 0.00, 0.00, 'KG', 0.00),
(277, NULL, '1006', 'RICE LALQILLA BASMATI 5KG', 'लालकिला बासमती 5KG', 1, 0, 0, 0, 0, 0, 814.00, 900.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(278, NULL, '32041989', 'BILISTA', 'बिलिस्ता', 1, 0, 0, 0, 0, 0, 180.00, 180.00, 180.00, NULL, 0.00, 0.00, 'KG', 18.00),
(279, NULL, '1903', 'SABUDANA KHICHDI', 'साबूदाना खिचड़ी', 1, 0, 0, 0, 0, 0, 200.00, 200.00, 200.00, NULL, 0.00, 0.00, 'KG', 5.00),
(280, NULL, '32041989', 'BUSH GREEN', 'बुश ग्रीन ', 1, 0, 0, 0, 0, 0, 0.00, 60.00, 0.00, NULL, 0.00, 0.00, 'GRM', 18.00),
(281, NULL, '32041989', 'BUSH CHOCLATE', 'बुश चोकलेट', 1, 0, 0, 0, 0, 0, 52.00, 52.00, 52.00, NULL, 0.00, 0.00, 'GRM', 18.00),
(282, NULL, '32041989', 'BUSH KESAR ', 'बुश केसर', 1, 0, 0, 0, 0, 0, 0.00, 68.00, 0.00, NULL, 0.00, 0.00, 'GRM', 18.00),
(283, NULL, '910', 'SAFED MUSLI', 'सफेद मुस्ली', 1, 0, 0, 0, 0, 0, 1200.00, 1200.00, 1200.00, NULL, 0.00, 0.00, 'PKT', 5.00),
(285, NULL, '32041989', 'BUSH LEMON', 'बुश लेमन', 1, 0, 0, 0, 0, 0, 45.00, 45.00, 45.00, NULL, 0.00, 0.00, 'GRM', 18.00),
(286, NULL, '32041989', 'BUSH ORANGE', 'बुश ऑरेंज', 1, 0, 0, 0, 0, 0, 0.00, 45.00, 0.00, NULL, 0.00, 0.00, 'GRM', 18.00),
(287, NULL, '2106', 'SARBAT ORANGE 5LTR', 'ऑरेंज सरबत 5LTR', 1, 0, 0, 0, 0, 0, 200.00, 200.00, 200.00, NULL, 0.00, 0.00, 'KG', 0.00),
(288, NULL, '32041989', 'BUSH RASBERY', 'बुश रासबेरी', 1, 0, 0, 0, 0, 0, 50.00, 50.00, 50.00, NULL, 0.00, 0.00, 'GRM', 18.00),
(289, NULL, '2106', 'SARBAT MANGO 5LTR', 'मैंगो सरबत 5LTR', 1, 0, 0, 0, 0, 0, 200.00, 200.00, 200.00, NULL, 0.00, 0.00, 'LTR', 0.00),
(290, NULL, '2106', 'SARBAT KOKUM 5LTR', 'कोकम सरबत 5LTR', 1, 0, 0, 0, 0, 0, 350.00, 350.00, 350.00, NULL, 0.00, 0.00, 'LTR', 0.00),
(291, NULL, '32041989', 'BUSH TOMATO', 'बुश टोमेटो', 1, 0, 0, 0, 0, 0, 0.00, 68.00, 0.00, NULL, 0.00, 0.00, 'GRM', 18.00),
(292, NULL, '1902', 'CANAPEAS', 'कैनेपीस', 1, 0, 0, 0, 0, 0, 60.00, 60.00, 60.00, NULL, 0.00, 0.00, 'PKT', 18.00),
(293, NULL, '2106', 'SARBAT ROSE 5LTR', 'रोज सरबत 5LTR', 1, 0, 0, 0, 0, 0, 200.00, 200.00, 200.00, NULL, 0.00, 0.00, 'LTR', 0.00),
(294, NULL, '0813', 'CANBERRY', 'कैनबेरी', 1, 0, 0, 0, 0, 0, 600.00, 600.00, 600.00, 0.00, 0.00, 0.00, 'KG', 12.00),
(295, NULL, '22029030', 'SV KOKAM AAGAL ', 'कोकम आगल 1 LTR ', 1, 0, 0, 0, 0, 0, 73.00, 90.00, 115.00, NULL, 0.00, 0.00, 'LTR', 12.00),
(296, NULL, '2106', 'SARBAT PINEAPPLE 5LTR', 'पाइनएप्पल सरबत 5LTR', 1, 0, 0, 0, 0, 0, 200.00, 200.00, 200.00, NULL, 0.00, 0.00, 'LTR', 0.00),
(297, NULL, '2106', 'CARAMEL 12 ', 'कैरमेल 12 नग ', 1, 0, 0, -1, 0, 0, 280.00, 280.00, 280.00, NULL, 0.00, 0.00, 'PCS', 28.00),
(298, NULL, '2106', 'CAREMAL 100gm', 'कैरेमल पुडिंग', 1, 0, 0, 2, 0, 0, 25.00, 25.00, 25.00, 0.00, 0.00, 0.00, 'PKT', 28.00),
(299, NULL, '1202', 'SINGDANA ROASTED', 'सेकेला सिंग', 1, 0, 0, -1, 0, 0, 140.00, 140.00, 140.00, NULL, 0.00, 0.00, 'KG', 5.00),
(300, NULL, '0813', 'CHANDANI ROLL', 'चांदनी रोल', 1, 0, 0, 0, 0, 0, 240.00, 240.00, 240.00, NULL, 0.00, 0.00, 'KG', 12.00),
(301, NULL, '0813', 'CHANDI VARAK 100PC', 'चांदी वरक 100PC ', 1, 0, 0, 0, 0, 0, 0.00, 300.00, 0.00, NULL, 0.00, 0.00, 'PCS', 12.00),
(302, NULL, '21061000', 'SOYA VADI NANI', 'सोया वाडी नानी', 1, 2, 0, 0, 0, 0, 63.00, 100.00, 0.00, 0.00, 0.00, 0.00, 'KG', 12.00),
(303, NULL, '0813', 'CHAROLI A1', 'A1 चारोली', 1, 0, 0, 0, 0, 0, 1200.00, 1200.00, 1200.00, NULL, 0.00, 0.00, 'KG', 12.00),
(304, NULL, '21061000', 'SOYABEAN DANA', 'सोयाबीन दाना', 1, 0, 0, -1, 0, 0, 53.00, 70.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(305, NULL, '09109914', 'CHAROLI A1 100GM', 'A1 चारोली 100gm', 1, 0, 0, -1, 0, 0, 140.00, 140.00, 140.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(306, NULL, '21061000', 'SOYABEAN KEEMA', 'सोयाबीन कीमा', 1, 0, 0, 0, 0, 0, 0.00, 100.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(308, NULL, '21061000', 'SOYABEAN VADI', 'सोया वदी', 1, 3, 0, 1, 0, 0, 57.00, 80.00, 0.00, 0.00, 0.00, 0.00, 'KG', 12.00),
(309, NULL, '0909', 'VARIYALI 2', '2 वरियारी', 1, 1, 0, 0, 0, 0, 85.05, 140.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(310, NULL, '0813', 'CHERRY 2 NO', '2 no चेरी', 1, 0, 0, 0, 0, 0, 140.00, 140.00, 140.00, NULL, 0.00, 0.00, 'KG', 12.00),
(311, NULL, '0909', 'VARIYALI 100GM', 'वरियाली 100GM', 1, 0, 0, -5, 0, 0, 30.00, 30.00, 30.00, NULL, -1.00, 0.00, 'GRM', 5.00),
(312, NULL, '0909', 'VARIYALI 50GM ', 'वरियाली 50GM', 1, 0, 0, 0, 0, 0, 15.00, 15.00, 15.00, NULL, 0.00, 0.00, 'GRM', 0.00),
(313, NULL, '0909', 'VARIYALI LUCKNAWI', 'A1 लखनवी', 1, 0, 0, 0, 0, 0, 175.00, 240.00, 0.00, 200.00, 0.00, 0.00, 'KG', 5.00),
(314, NULL, '0813', 'CHERRY A1', ' A1 चेरी', 1, 0, 0, 0, 0, 0, 180.00, 180.00, 180.00, NULL, 0.00, 0.00, 'KG', 12.00),
(315, NULL, '09096139', 'VARIYALI NAVI', 'नवी वरियारी', 1, 0, 0, -2, 0, 0, 168.00, 200.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(316, NULL, '0909', 'VARIYALI ROASTED', 'सेकेली वरियारी', 1, 5, 0, 1, 0, 0, 0.00, 160.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(317, NULL, '1207', 'SEEDS CHIA', 'चिया सीड', 1, 0, 0, 0, 0, 0, 222.00, 480.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(318, NULL, '0909', 'VARIYALI POWDER', 'वरियारी पावडर', 1, 0, 0, 0, 0, 0, 200.00, 200.00, 200.00, NULL, 0.00, 0.00, 'KG', 5.00),
(319, NULL, '0813', 'SEEDS CHIA 100GM', 'चिया सीड 100 GM', 1, 0, 0, 0, 0, 0, 60.00, 60.00, 60.00, NULL, 0.00, 0.00, 'GRM', 12.00),
(320, NULL, '1905', 'WAFER YELLOW', 'पीला वेफर ', 1, 0, 0, 0, 0, 0, 200.00, 200.00, 200.00, NULL, 0.00, 0.00, 'KG', 18.00),
(321, NULL, '1905', 'WAFER TOMATO ', 'टमाटो वेफर ', 1, 0, 0, 0, 0, 0, 160.00, 160.00, 160.00, NULL, 0.00, 0.00, 'KG', 18.00),
(322, NULL, '1905', 'WAFER MARI', 'मिरी वेफर ', 1, 0, 0, 0, 0, 0, 160.00, 160.00, 160.00, NULL, 0.00, 0.00, 'KG', 18.00),
(323, NULL, '1905', 'WAFER LAMBI', 'लाम्बी वेफर', 1, 0, 0, -1, 0, 0, 160.00, 160.00, 160.00, NULL, 0.00, 0.00, 'KG', 18.00),
(324, NULL, '0813', 'CHIKKI 100GM', 'चिक्की 100GM', 1, 0, 0, -1, 0, 0, 18.00, 18.00, 18.00, NULL, 0.00, 0.00, 'GRM', 12.00),
(325, NULL, '1905', 'WAFER BATATA', 'बटाटा वेफ़र', 1, 0, 0, 0, 0, 0, 200.00, 200.00, 200.00, NULL, 0.00, 0.00, 'KG', 18.00),
(326, NULL, '0813', 'CHIKKI 4 IN 1 500GM', '4 इन 1 चिक्की 500gm ', 1, 0, 0, 0, 0, 0, 90.00, 90.00, 90.00, NULL, 0.00, 0.00, 'GRM', 12.00),
(327, NULL, '0813', 'CHIKKI DRY FRUIT 250GM', ' ड्राईफ्रूट चिक्की 250GM', 1, 0, 0, 0, 0, 0, 100.00, 100.00, 100.00, NULL, 0.00, 0.00, 'GRM', 12.00),
(328, NULL, '2003', 'VINEGAR 5LT', 'विन्रेगर 5LTR', 1, 0, 0, 0, 0, 0, 80.00, 80.00, 80.00, NULL, 0.00, 0.00, 'LTR', 12.00),
(329, NULL, '2003', 'VINEGAR APPLE ', 'एप्पल विनेगर 500ML', 1, 0, 0, 0, 0, 0, 75.00, 120.00, 0.00, NULL, 0.00, 0.00, 'LTR', 12.00),
(330, NULL, '2003', 'VINEGER SARWAR ', 'सरवर विनेगर ', 1, 0, 0, 0, 0, 0, 20.00, 30.00, 36.00, 25.00, 0.00, 0.00, 'LTR', 12.00),
(331, NULL, '0813', 'CHIKKI DRY FRUIT 500GM', 'ड्राईफ्रूट चिक्की 500GM', 1, 0, 0, 0, 0, 0, 200.00, 200.00, 200.00, NULL, 0.00, 0.00, 'GRM', 12.00),
(332, NULL, '0813', 'CHIKKI DRYFRUIT', 'ड्राईफ्रूट चिक्की', 1, 0, 0, 0, 0, 0, 400.00, 400.00, 400.00, NULL, 0.00, 0.00, 'KG', 12.00),
(333, NULL, '0813', 'CHIKKI TUKDA 250GM ', 'टुकडा चिक्की 250GM', 1, 0, 0, 0, 0, 0, 40.00, 40.00, 40.00, NULL, 0.00, 0.00, 'GRM', 12.00),
(334, NULL, '910', 'CHILLI FLACKS', 'चिल्ली फलैक्स', 1, 0, 0, 0, 0, 0, 220.00, 280.00, 0.00, 240.00, 0.00, 0.00, 'KG', 5.00),
(335, NULL, '09042010', 'CHILLY AKOLA', 'आकोला मिरची', 1, 0, 0, 0, 0, 0, 320.00, 320.00, 320.00, NULL, 0.00, 0.00, 'KG', 5.00),
(336, NULL, '910', 'VAVDING', 'वावडिंग', 1, 0, 0, 0, 0, 0, 1200.00, 1200.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(337, NULL, '910', 'UDADIYA MASALA', 'उड़दिया मसाला', 1, 0, 0, 0, 0, 0, 480.00, 480.00, 0.00, NULL, 0.00, 0.00, 'PKT', 5.00),
(338, NULL, '0909', 'TUTI FRUTI', 'टूटीं फ्रूटी', 1, 0, 0, 0, 0, 0, 120.00, 120.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(339, NULL, '0909', 'TUTI FUTI RED', 'लाल टूटीफूटी ', 1, 0, 0, 0, 0, 0, 80.00, 80.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(340, NULL, '0909', 'TUTI FUTI GREEN ', 'ग्रीन टूटीफूटी', 1, 0, 0, 0, 0, 0, 80.00, 80.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(341, NULL, '0713', 'TURDALL OILY RENTIO 5KGS', 'रेंटियो 5kg', 1, 0, 0, 0, 0, 0, 550.00, 580.00, 800.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(342, NULL, '09042010', 'CHILLY BOR NO. 1', 'बोर मिरची ', 1, 0, 0, 0, 0, 0, 160.00, 280.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(343, NULL, '910', 'TIL 100gm', 'तिल 100gm', 1, 0, 0, 0, 0, 0, 30.00, 30.00, 0.00, NULL, 0.00, 0.00, 'GRM', 0.00),
(344, NULL, '09042010', 'CHILLY DANDICUT BADGI', 'बेड्गी डंडीकट', 1, 0, 0, -2, 0, 0, 275.00, 360.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(345, NULL, '910', 'TIL KALA 2', '2no कालातिल', 1, 0, 0, 0, 0, 0, 200.00, 200.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(346, NULL, '910', 'TIL KALA A1', 'A1 कालातिल', 1, 0, 0, -1, 0, 0, 0.00, 240.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(347, NULL, '910', 'TIL POLISH', 'पोलिश तिल', 1, 0, 0, 0, 0, 0, 180.00, 180.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(348, NULL, '09042010', 'CHILLY DANDICUT PANDY', 'डंडीकट पांडी', 1, 0, 0, 0, 0, 0, 260.00, 260.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(349, NULL, '910', 'TIL RAJWADI', 'R तिल', 1, 1, 0, 0, 0, 0, 160.00, 180.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(350, NULL, '09042010', 'CHILLY DANDICUT KASHMIR ', 'डांडीकट काश्मीर', 1, 0, 0, 0, 0, 0, 260.00, 280.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(351, NULL, '910', 'TIL ROASTED', 'सेकेला तिल', 1, 0, 0, 0, 0, 0, 240.00, 240.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(352, NULL, '09042010', 'CHILLY KASHMIRI', 'A 1 काश्मीर मिरची', 1, 0, 0, -3, 0, 0, 196.00, 240.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(353, NULL, '910', 'TIL WHITE 2', '2 सफेद तिल', 1, 0, 0, 1, 0, 0, 0.00, 160.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(354, NULL, '09042010', 'CHILLY PANDY', 'पांडी', 1, 0, 0, -5, 0, 0, 220.00, 220.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(355, NULL, '09042010', 'CHILLY PANDY LAVINGI', 'पांडी लविंगी', 1, 0, 0, 0, 0, 0, 200.00, 260.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(356, NULL, '09042010', 'CHILLY RESHMPATI', 'रेशमपट्टी', 1, 0, 0, 0, 0, 0, 240.00, 240.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(357, NULL, '2106', 'TINA', 'टीना', 1, 0, 0, 0, 0, 0, 170.00, 190.00, 0.00, 0.00, 0.00, 0.00, 'LTR', 28.00),
(358, NULL, '09042010', 'CHILLY SKV BEDGI', 'SKV बेड्गी', 1, 0, 0, -1, 0, 0, 200.00, 200.00, 200.00, NULL, 0.00, 0.00, 'KG', 5.00),
(359, NULL, '09042010', 'CHILLY UNCHA  BEDGI', 'बेड्गी उंचा', 1, 0, 0, -1, 0, 0, 200.00, 200.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(360, NULL, '09109914', 'CHINA GRASS impt 10pc', 'चाइना ग्रास impt 100GM', 1, 0, 0, 0, 0, 0, 200.00, 200.00, 0.00, NULL, 0.00, 0.00, 'PCS', 5.00),
(361, NULL, '9109100', 'TEA A1', 'A1 चाय', 1, 0, 0, 0, 0, 0, 140.00, 200.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(362, NULL, '19021900', 'CHINA GRASS PATTI 100GM', 'चाइना ग्रास पट्टी 100GM', 1, 0, 0, 0, 0, 0, 140.00, 140.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(363, NULL, '9109100', 'TEA GOLDEN', 'गोल्डन चाय ', 1, 0, 0, -1, 0, 0, 181.00, 240.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(364, NULL, '2103', 'CHINGS GC SAUCE', 'चिंग्स ग्रीन चिली सॉस 700GM', 1, 0, 48, 1, 0, 0, 40.00, 45.00, 85.00, 0.00, 0.00, 0.00, 'BOX', 12.00),
(365, NULL, '9109100', 'TEA MASALA', 'चाय मसाला', 1, 0, 0, 0, 0, 0, 600.00, 600.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(366, NULL, '2103', 'CHINGS RC SAUCE ', 'चिंग्स रेड चिली सॉस', 1, 0, 96, -1, 0, 0, 40.00, 45.00, 85.00, 0.00, 0.00, 0.00, 'GRM', 12.00),
(367, NULL, '2103', 'CHINGS SS SAUCE', 'चिंग्स सोया सॉस', 1, 0, 96, -1, 0, 0, 40.00, 45.00, 85.00, 0.00, 0.00, 0.00, 'LTR', 12.00),
(368, NULL, '910', 'SUVA', 'सुवा', 1, 0, 0, -1, 0, 0, 100.00, 100.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(369, NULL, '2103', 'CHINGS SCHEZWAN 1KG', 'चिंग्स सेजवान 1kg', 1, 0, 120, -1, 0, 0, 145.00, 160.00, 240.00, 0.00, 0.00, 0.00, 'KG', 18.00),
(370, NULL, '910', 'SUVA JAMNAGAR', 'J सुवा', 1, 0, 0, 0, 0, 0, 180.00, 180.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(371, NULL, '2103', 'CHINGS SEJWAN 250GM', 'चिंग्स सेजवान 250GM', 1, 0, 0, -1, 0, 0, 0.00, 60.00, 0.00, NULL, 0.00, 0.00, 'KG', 18.00),
(372, NULL, '910', 'SUVA ROASTED', 'सेकेला सुवा', 1, 0, 0, 5, 0, 0, 130.00, 200.00, 0.00, 160.00, 0.00, 0.00, 'KG', 5.00),
(373, NULL, '1701', 'SUGAR SAKARIYA', 'साकरिया', 1, 0, 0, 0, 0, 0, 39.00, 60.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(374, NULL, '1704', 'CHOCOLATE DRYFRUIT', ' ड्राईफ्रूट चॉकलेट ', 1, 0, 0, 0, 0, 0, 480.00, 480.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(375, NULL, '1704', 'CHOCOLATE IMP', 'IMP चॉकलेट', 1, 0, 0, 0, 0, 0, 400.00, 400.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(376, NULL, '910', 'SUHANA MASALA', 'सुहाना मसाला', 1, 0, 0, 0, 0, 0, 38.00, 38.00, 42.00, NULL, 0.00, 0.00, 'PKT', 5.00),
(377, NULL, '910', 'SODA KHAVANO', 'खावानो', 1, 1, 0, 2, 0, 0, 0.00, 40.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(378, NULL, '20019000', 'SV CHUNDA 1KG', 'SV चुन्दा 1KG', 1, 0, 0, 0, 0, 0, 114.00, 140.00, 0.00, NULL, 0.00, 0.00, 'GRM', 12.00),
(379, NULL, '910', 'SODA WASHING', 'वोसिंग', 1, 1, 0, 0, 0, 0, 28.00, 60.00, 0.00, 48.00, 0.00, 0.00, 'KG', 5.00),
(380, NULL, '20019000', 'SV CHUNDA 200GM', 'SV चुन्दा 200gm', 1, 0, 0, 0, 0, 0, 34.00, 35.00, 0.00, NULL, 0.00, 0.00, 'GRM', 12.00),
(381, NULL, '20019000', 'SV CHUNDA 500GM ', 'SV चुनदा 500', 1, 0, 0, 0, 0, 0, 61.00, 70.00, 0.00, NULL, 0.00, 0.00, 'GRM', 12.00),
(383, NULL, '1704', 'COCO POWDER', 'कोको पावडर', 1, 0, 0, 0, 0, 0, 200.00, 200.00, 0.00, NULL, 0.00, 0.00, 'GRM', 0.00),
(384, NULL, '08021200', 'BADAM 1 NO  ', 'NO.1 बदाम', 1, 0, 60, 146, 0, 0, 625.00, 720.00, 0.00, 650.00, -1.25, -1.00, 'KG', 12.00),
(385, NULL, '08021200', 'BADAM 100gm', 'बदाम 100gm', 1, 0, 0, -1, 0, 0, 67.00, 80.00, 0.00, NULL, 0.00, 0.00, 'GRM', 12.00),
(386, NULL, '08021200', 'BADAM NAVI', 'नवी बदाम', 1, 0, 0, -2, 0, 0, 660.00, 760.00, 0.00, 680.00, 0.00, 0.00, 'KG', 12.00),
(387, NULL, '08021200', 'BADAM SP', 'SP बदाम', 1, 0, 0, -1, 0, 0, 760.00, 880.00, 0.00, 800.00, 0.00, 0.00, 'KG', 12.00),
(388, NULL, '08021200', 'BADAM POOJA LAMBI', 'लम्बी पूजा बदाम', 1, 0, 0, 0, 0, 0, 200.00, 200.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(389, NULL, '08021200', 'BADAM KATRAN', 'बदाम कतरन', 1, 0, 0, 0, 0, 0, 1000.00, 1000.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(390, NULL, '08021200', 'BADAM MAMARO TOCH', 'टोच मामरो', 1, 0, 0, 0, 0, 0, 1600.00, 2400.00, 0.00, 0.00, 0.00, 0.00, 'KG', 12.00),
(391, NULL, '9083110', 'ALCHA KALA 2', '2 काला एलचा', 1, 0, 0, 0, 0, 0, 575.00, 1200.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(392, NULL, '08021200', 'BADAM MARUTI', 'मारुती बदाम', 1, 0, 0, 0, 0, 0, 960.00, 960.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(393, NULL, '08021200', 'BADAM NAVA MAMRO', 'बदाम नवा मामरो', 1, 0, 0, 0, 0, 0, 1800.00, 2800.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(394, NULL, '08021200', 'BADAM SUPER MAMRO', 'सुपर मामरो बदाम', 1, 0, 0, 0, 0, 0, 4400.00, 4400.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(395, NULL, '9083110', 'ALCHA KALA 100GM', 'काला एलाचा 100gm', 1, 0, 0, -1, 0, 0, 120.00, 120.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(396, NULL, '9083110', 'ALCHA KALA 50gm', 'काला एलाचा 50gm', 1, 0, 0, -2, 0, 0, 60.00, 60.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(397, NULL, '08021200', 'BADAM POOJA MOTI', 'पूजा बदाम मोटी', 1, 0, 0, 0, 0, 0, 180.00, 180.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(398, NULL, '9083110', 'ALCHA KALA 25GM', 'काला एलाचा 25gm', 1, 0, 0, 0, 0, 0, 50.00, 50.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(399, NULL, '08021200', 'BADAM POOJA NANI', 'पूजा बदाम नानी', 1, 0, 0, 0, 0, 0, 160.00, 160.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(400, NULL, '9083110', 'ALCHA KALA 10GM', 'काला एलाचा 10gm', 1, 0, 0, 0, 0, 0, 20.00, 20.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(401, NULL, '9109100', 'BADIYAN A1', 'A1 बादयान', 1, 3, 0, -1, 0, 0, 575.00, 800.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(402, NULL, '08021200', 'BADAM JUMBO MAMRO', 'जंबो मामरो बदाम ', 1, 0, 0, 0, 0, 0, 3600.00, 3600.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(403, NULL, '9109100', 'BADIYAN 100GM', 'बादयान 100gm', 1, 0, 0, -1, 0, 0, 120.00, 140.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(404, NULL, '08021200', 'BADAM BOX MAMRO', 'बॉक्स मामरो बदाम ', 1, 0, 0, 0, 0, 0, 1800.00, 1800.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(405, NULL, '9109100', 'BADIYAN 50GM', 'बादयान 50GM', 1, 0, 0, -1, 0, 0, 60.00, 70.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(406, NULL, '9109100', 'BADIYAM 25GM', 'बादयान 25GM', 1, 0, 0, 0, 0, 0, 30.00, 30.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(407, NULL, '9109100', 'BADIYAN 10GM', 'बादयान 10GM', 1, 0, 0, 0, 0, 0, 15.00, 15.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(408, NULL, '08021200', 'BADAM SALTED', 'खारी बदाम', 1, 0, 0, 0, 0, 0, 1000.00, 1000.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(409, NULL, '910', 'DAGADPHOOL ', 'A1 दगडफुल', 1, 0, 0, -1, 0, 0, 300.00, 560.00, 0.00, 400.00, 0.00, 0.00, 'KG', 5.00),
(410, NULL, '0801', 'KAJU TUKDA 6', '6 काजू टुकड़ा', 1, 0, 0, 1, 0, 0, 405.00, 480.00, 0.00, 450.00, 0.00, 0.00, 'KG', 5.00),
(411, NULL, '910', 'DAGDAFUL 100GM', 'दगडफुल 100GM ', 1, 0, 0, 0, 0, 0, 140.00, 140.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(412, NULL, '0801', 'KAJU TUKDA 3', '3 काजू टुकड़ा', 1, 0, 60, 19, 0, 0, 500.00, 600.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(413, NULL, '910', 'DAGADFUL 50GM', 'दगडफुल 50GM ', 1, 0, 0, -1, 0, 0, 70.00, 70.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(414, NULL, '0801', 'KAJU TUKDA JUMBO', 'जमबो काजू टुकड़ा', 1, 0, 60, 10, 0, 0, 560.00, 680.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00);
INSERT INTO `productmaster` (`prodid_`, `prodid`, `hsn`, `prodname`, `prodname_hindi`, `shopid`, `wstock`, `dstock`, `lstock`, `totalstock`, `today_opening`, `pprice`, `uprice`, `wprice`, `bsprice`, `stock`, `rstock`, `unit`, `gstper`) VALUES
(415, NULL, '910', 'DAGADFUL 25GM', 'दगडफुल 25GM ', 1, 0, 0, 0, 0, 0, 30.00, 30.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(416, NULL, '910', 'DAGADFUL 10GM', 'दगडफुल 10GM ', 1, 0, 0, 0, 0, 0, 15.00, 15.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(417, NULL, '0801', 'KAJU TUKDA KALBAVI ', 'कलबावी काजू टुकड़ा', 1, 0, 10, 1, 0, 0, 640.00, 760.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(418, NULL, '0801', 'KAJU FADCHA', 'काजू फाड़चा', 1, 0, 10, 0, 0, 0, 900.00, 900.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(419, NULL, '0801', 'KAJU FADCHA UCHA', 'उंचा काजू फाड़चा', 1, 0, 0, 0, 0, 0, 753.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(420, NULL, '910', 'KHAUSKHUS RATLAM', 'R खस खस', 1, 1, 0, -1, 0, 0, 880.00, 1200.00, 0.00, 1000.00, 0.00, 0.00, 'KG', 5.00),
(421, NULL, '910', 'KHUSKHUS 100GM', 'खसखस 100gm', 1, 0, 0, -1, 0, 0, 0.00, 140.00, 0.00, 0.00, 0.00, 0.00, 'PKT', 5.00),
(422, NULL, '0801', 'KAJU S 320', 'काजू S320', 1, 0, 40, 51, 0, 0, 630.00, 700.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(423, NULL, '910', 'KHASKHAS 50GM', 'खसखस 50gm', 1, 0, 0, 0, 0, 0, 70.00, 70.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(424, NULL, '0801', 'KAJU NURANI', 'नुरानी काजू ', 1, 0, 0, -1, 0, 0, 690.00, 800.00, 0.00, 750.00, 0.00, 0.00, 'KG', 5.00),
(425, NULL, '09093000', 'JEERA SHAJEERA', 'शाजीरा', 1, 0, 0, 0, 0, 0, 800.00, 800.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(426, NULL, '0801', 'KAJU W 320', 'W 320 काजू ', 1, 0, 20, 0, 0, 0, 782.00, 900.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(427, NULL, '0801', 'KAJU MARUTI', 'मारुती काजू', 1, 0, 10, -1, 0, 0, 730.00, 900.00, 0.00, 750.00, 0.00, 0.00, 'KG', 5.00),
(428, NULL, '9082100', 'JAVANTRI', 'जावंत्री', 1, 3, 0, -1, 0, 0, 2050.00, 2800.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(429, NULL, '0801', 'KAJU CHILKA', 'काजू चिल्का', 1, 0, 10, 0, 0, 0, 700.00, 700.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(430, NULL, '9082100', 'JAVANTRI 100GM', 'जावंत्री 100GM', 1, 0, 0, -1, 0, 0, 0.00, 320.00, 0.00, 0.00, -1.00, 0.00, 'PKT', 5.00),
(431, NULL, '9082100', 'JAVANTRI 50GM', 'जावंत्री 50GM', 1, 0, 0, 0, 0, 0, 0.00, 160.00, 0.00, 0.00, 0.00, 0.00, 'PKT', 5.00),
(432, NULL, '0801', 'KAJU CHILKA A1', 'A1 चिल्का काजू ', 1, 0, 10, -1, 0, 0, 515.00, 800.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(433, NULL, '9082100', 'JAVANTRI 25GM', 'जावंत्री 25GM', 1, 0, 0, 0, 0, 0, 0.00, 90.00, 0.00, 0.00, 0.00, 0.00, 'PKT', 5.00),
(434, NULL, '0801', 'KAJU KANI', '2 काजूकनि', 1, 0, 0, -1, 0, 0, 210.00, 320.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(436, NULL, '9082100', 'JAVANTRI 10GM', 'जावंत्री 10GM', 1, 0, 0, -1, 0, 0, 0.00, 40.00, 0.00, 0.00, 0.00, 0.00, 'PKT', 5.00),
(437, NULL, '09071010', 'LONG', 'लवंग', 1, 0, 0, -2, 0, 0, 460.00, 800.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(439, NULL, '0801', 'KAJU 100gm', 'काजू 100GM ', 1, 0, 0, 0, 0, 0, 100.00, 100.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(440, NULL, '09071010', 'LONG 100GM', 'लवंग 100GM ', 1, 0, 0, 0, 0, 0, 100.00, 100.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(441, NULL, '0801', 'KAJU S 240', 'S 240 काजू ', 1, 0, 80, 80, 0, 0, 682.50, 1000.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(442, NULL, '09071010', 'LONG 50GM ', 'लवंग 50 GM ', 1, 0, 0, -3, 0, 0, 50.00, 50.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(443, NULL, '0801', 'KAJU GURAV 210 ', 'गुरव 210 काजू', 1, 0, 0, 0, 0, 0, 1200.00, 1200.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(444, NULL, '09071010', 'LONG 25GM ', 'लवंग 25GM ', 1, 0, 0, 0, 0, 0, 30.00, 30.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(445, NULL, '09071010', 'LONG 10GM', 'लवंग 10GM ', 1, 0, 0, 0, 0, 0, 15.00, 15.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(446, NULL, '08042090', 'ANJEER BABY 400GM', 'अंजीर बेबी 400GM', 1, 0, 0, 0, 0, 0, 200.00, 120.00, 0.00, 0.00, 0.00, 0.00, 'PKT', 5.00),
(447, NULL, '910', 'NAKESHWAR ', 'नाकेश्वर', 1, 0, 0, 0, 0, 0, 1250.00, 1800.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(448, NULL, '910', 'NAKESHWAR 100GM', 'नाकेश्वर 100GM', 1, 0, 0, 0, 0, 0, 200.00, 200.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(449, NULL, '08042090', 'ANJEER NANA', 'नाना अंजीर ', 1, 0, 0, -2, 0, 0, 800.00, 800.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(450, NULL, '910', 'NAKESHWAR 50GM', 'नाकेश्वर 50GM', 1, 0, 0, 0, 0, 0, 100.00, 100.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(451, NULL, '910', 'NAKESHWAR 25GM', 'नाकेश्वर 25GM', 1, 0, 0, -1, 0, 0, 60.00, 60.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(452, NULL, '910', 'NAKESHWAR 10GM', 'नाकेश्वर 10GM', 1, 0, 0, 0, 0, 0, 30.00, 30.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(453, NULL, '08042090', 'ANJEER MARUTI', 'मारुती अंजीर', 1, 0, 0, 0, 0, 0, 0.00, 900.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(454, NULL, '08042090', 'ANJEER CHIKU', 'चीकू अंजीर', 1, 0, 0, 0, 0, 0, 1000.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 'PKT', 5.00),
(455, NULL, '08042090', 'ANJEER MARUTI', 'चीकू अंजीर', 1, 0, 0, 0, 0, 0, 1000.00, 1000.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(456, NULL, '08042090', 'ANJEER JUMBO', 'जम्बो अंजीर', 1, 0, 0, 0, 0, 0, 1200.00, 1200.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(457, NULL, '08042090', 'ANJEER MARUTI 100gm', 'मारुती अंजीर 100gm', 1, 0, 0, 0, 0, 0, 100.00, 100.00, 0.00, NULL, 0.00, 0.00, 'GRM', 12.00),
(458, NULL, '08042090', 'ANJEER APPU', 'अप्पू अंजीर', 1, 0, 0, 0, 0, 0, 1400.00, 1400.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(459, NULL, '08042090', 'ANJEER TAYAR', 'टायर अंजीर ', 1, 0, 0, 0, 0, 0, 1600.00, 1600.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(460, NULL, '0802', 'PISTA A1', 'A1 पिसता', 1, 0, 0, 0, 0, 0, 1260.00, 1600.00, 0.00, 1500.00, 0.00, 0.00, 'KG', 12.00),
(461, NULL, '0802', 'PISTA A1 100gm', 'A1 पिस्ता 100gm', 1, 0, 0, -2, 0, 0, 180.00, 180.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(462, NULL, '0802', 'PISTA KHARA 1', '1 खारा पिसता', 1, 0, 20, 0, 0, 0, 900.00, 1200.00, 0.00, 1000.00, 0.00, 0.00, 'KG', 12.00),
(463, NULL, '0802', 'PISTA KHARA AM', 'AM खारा पिस्ता', 1, 0, 0, 0, 0, 0, 850.00, 1000.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(464, NULL, '0802', 'PISTA KHARA 3A', '3A खारा पिसता', 1, 0, 0, 0, 0, 0, 1100.00, 1400.00, 0.00, 1200.00, 0.00, 0.00, 'KG', 12.00),
(465, NULL, '0802', ' PISTA KHARA SHAHI', 'शाही खारा पिस्ता', 1, 0, 0, 0, 0, 0, 1150.00, 1600.00, 0.00, 1500.00, 0.00, 0.00, 'KG', 12.00),
(466, NULL, '0802', 'PISTA LIPSTICK', 'L पिस्ता', 1, 0, 0, 0, 0, 0, 1650.00, 2000.00, 0.00, 1800.00, 0.00, 0.00, 'KG', 12.00),
(467, NULL, '0802', 'PISTA KATRAN', 'पिस्ता कतरन ', 1, 0, 0, 0, 0, 0, 1550.00, 2000.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(468, NULL, '0802', 'PISTA PISTORI', 'पिसोरी पिस्ता', 1, 0, 0, 0, 0, 0, 3600.00, 3600.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(469, NULL, '0813', 'JARDALU 1', '1 जरदालू ', 1, 0, 0, 0, 0, 0, 375.00, 600.00, 0.00, 0.00, 0.00, 0.00, 'KG', 12.00),
(470, NULL, '0813', 'JARDALU UNCHA', 'उंचा जरदालू ', 1, 0, 0, 0, 0, 0, 350.00, 800.00, 0.00, 0.00, 0.00, 0.00, 'KG', 12.00),
(471, NULL, '0813', 'JARDALU 100GM', 'जरदालू नवा 100gm', 1, 0, 0, 0, 0, 0, 100.00, 100.00, 0.00, NULL, 0.00, 0.00, 'GRM', 12.00),
(472, NULL, '0813', 'JARDALU MARUTI', 'मारुती जरदालू ', 1, 0, 0, 0, 0, 0, 1000.00, 1000.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(473, NULL, '0813', 'JARDALU APPU', 'अप्पू जरदालू ', 1, 0, 0, 0, 0, 0, 688.00, 1200.00, 0.00, 0.00, 0.00, 0.00, 'KG', 12.00),
(474, NULL, '08023200', 'AKHROD PONIYA MAGAJ', 'अ पोनिया मगज', 1, 0, 40, 20, 0, 0, 900.00, 1200.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(475, NULL, '08023200', 'AKHROD CHIKU MAGAJ', 'अखरोड़ चीकू मगज', 1, 0, 10, 10, 0, 0, 1201.00, 1400.00, 0.00, 1350.00, 0.00, 0.00, 'KG', 5.00),
(476, NULL, '08023200', 'AKHROD ROYAL MAGAJ', 'अखरोड़ रोयल मगज', 1, 0, 20, 10, 0, 0, 1300.00, 1600.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(477, NULL, '8013', 'AKHROD UNCHA', 'अखरोड़ उंचा', 1, 0, 0, 0, 0, 0, 740.00, 900.00, 0.00, 0.00, 0.00, 0.00, 'KG', 12.00),
(478, NULL, '0813', 'AKHROD AA', 'AA अखरोड़ ', 1, 0, 0, 0, 0, 0, 475.00, 680.00, 0.00, 0.00, 0.00, 0.00, 'KG', 12.00),
(479, NULL, '08062010', 'DRAKSH ', 'कालीद्राख्स', 1, 0, 0, 15, 0, 0, 225.00, 320.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(480, NULL, '08062010', 'DRAKSH UNCHI KALI', 'कालीद्राख्स उंचा', 1, 0, 0, 0, 0, 0, 425.00, 560.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(481, NULL, '08062010', 'DRAKSH KALI 100GM', 'कालीद्राक्ष 100gm', 1, 0, 0, 0, 0, 0, 40.00, 40.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(482, NULL, '08062010', 'DRAKSH SEEDLESS KALI', 'कालीद्राख्स सीडलेस', 1, 0, 16, -2, 0, 0, 313.00, 360.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(483, NULL, '08062010', 'KISMIS 2no', '2 नुं किसमिस', 1, 0, 30, 0, 0, 0, 0.00, 280.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(484, NULL, '08062010', 'KISMIS 100GM', 'किसमिस 100gm', 1, 0, 0, 0, 0, 0, 40.00, 40.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(485, NULL, '08062010', 'KISMIS LAMBI', 'लाम्बी किसमिस', 1, 0, 30, 17, 0, 0, 200.00, 320.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(486, NULL, '08062010', 'KISMIS UNCHI', ' उंची किसमिस', 1, 0, 15, 29, 0, 0, 210.00, 360.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(487, NULL, '08062010', 'KISMIS B.B', 'B.B किसमिस ', 1, 0, 150, 0, 0, 0, 340.00, 340.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(488, NULL, '08062010', 'KISMIS CHAMELI', 'चमेली किसमिस', 1, 0, 0, 0, 0, 0, 250.00, 320.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(489, NULL, '08062010', 'KISMIS SANDHKANI', 'सिन्धुगानी किसमिस', 1, 0, 0, 0, 0, 0, 1200.00, 1200.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(490, NULL, '0906', 'TAJ 2', '2 तज', 1, 12, 0, -1, 0, 0, 260.00, 400.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(491, NULL, '08062010', 'KISMIS AFGAN', 'उंचा अफगान किसमिस', 1, 0, 0, 0, 0, 0, 800.00, 800.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(492, NULL, '09061910', 'TAJ 100GM ', 'तज 100GM', 1, 0, 0, 0, 0, 0, 60.00, 60.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(493, NULL, '09061910', 'TAJ 50GM ', 'तज 50GM', 1, 0, 0, -2, 0, 0, 30.00, 30.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(494, NULL, '08041020', 'KHAJUR', 'खजूर ', 1, 0, 0, 5, 0, 0, 100.00, 140.00, 0.00, 0.00, 0.00, 0.00, 'KG', 12.00),
(495, NULL, '08041020', 'KHAJUR A1 SEEDLESS', 'A1 कालीखजूर सीडलेस', 1, 0, 0, 0, 0, 0, 300.00, 300.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(496, NULL, '09061910', 'TAJ 25GM', 'तज 25GM', 1, 0, 0, 0, 0, 0, 15.00, 15.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(497, NULL, '09061910', 'TAJ 10GM', 'तज 10GM', 1, 0, 0, 0, 0, 0, 6.00, 6.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(498, NULL, '08041020', 'KHAJUR CAP CAP 2kg', ' कप कप खजूर 2kg', 1, 0, 0, 0, 0, 0, 180.00, 320.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(499, NULL, '08041020', 'KHAJUR KALA SEEDLESS', ' 2 कलाखाजुर सीडलेस', 1, 0, 0, -1, 0, 0, 190.00, 260.00, 0.00, 0.00, 0.00, 0.00, 'KG', 12.00),
(500, NULL, '08041020', 'KHAJUR KALMI', 'कलमी खजूर ', 1, 0, 21, 1, 0, 0, 430.00, 560.00, 0.00, 520.00, 0.00, 0.00, 'KG', 12.00),
(501, NULL, '08041020', 'KHAJUR KAMRAN ', 'कामरान खजूर', 1, 0, 0, 24, 0, 0, 175.00, 240.00, 0.00, 200.00, 0.00, 0.00, 'KG', 12.00),
(502, NULL, '08041020', 'KHAJUR KHACH', 'कछ खजूर ', 1, 0, 0, 0, 0, 0, 200.00, 200.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(503, NULL, '08041020', 'KHAJUR KIMIYA 1BOX', 'कीमिया खजूर 1बॉक्स', 1, 0, 12, -1, 0, 0, 150.00, 170.00, 0.00, 0.00, 0.00, 0.00, 'BOX', 12.00),
(504, NULL, '08041020', 'KHAJUR LAL PKT', 'खजूर लाल PKT', 1, 0, 0, 0, 0, 0, 120.00, 160.00, 0.00, 0.00, 0.00, 0.00, 'PKT', 12.00),
(505, NULL, '08041020', 'KHAJUR LAL SEEDLESS (PACKET)', 'खजूर लाल सीडलेस PKT', 1, 0, 0, 0, 0, 0, 160.00, 180.00, 0.00, NULL, 0.00, 0.00, 'PKT', 12.00),
(506, NULL, '08041020', 'KHAJUR MEDJOUL', 'मेद्जौल खजूर', 1, 0, 0, 0, 0, 0, 1400.00, 1400.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(507, NULL, '08041020', 'KHAJUR OMAN', 'ओमान खजूर', 1, 0, 30, 52, 0, 0, 220.00, 280.00, 0.00, 240.00, 0.00, 0.00, 'PKT', 0.00),
(508, NULL, '0813', 'KHARAK AA', 'AA खारेक', 1, 0, 0, 1, 0, 0, 160.00, 240.00, 0.00, 200.00, 0.00, 0.00, 'KG', 12.00),
(509, NULL, '0813', 'KHARAK R', 'R खारेक', 1, 0, 0, -5, 0, 0, 200.00, 280.00, 0.00, 240.00, 0.00, 0.00, 'KG', 12.00),
(510, NULL, '0813', 'KHARAK MARUTI', 'मारुती खारेक', 1, 0, 0, 0, 0, 0, 240.00, 320.00, 0.00, 280.00, 0.00, 0.00, 'KG', 12.00),
(511, NULL, '0813', 'KHARAK SUPER', 'सुपर खारेक', 1, 0, 0, 0, 0, 0, 275.00, 360.00, 0.00, 300.00, 0.00, 0.00, 'KG', 12.00),
(512, NULL, '0813', 'KHARAK SALLI TUKDA', 'सली खारेक ', 1, 0, 0, 0, 0, 0, 400.00, 400.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(513, NULL, '0813', 'KHARAK TUKDA', 'टुकड़ा खारेक ', 1, 0, 0, 0, 0, 0, 400.00, 400.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(514, NULL, '0813', 'KHARAK 1 SAURI  ', '1 सौरी खारेक', 1, 0, 0, 0, 0, 0, 200.00, 320.00, 0.00, 250.00, 0.00, 0.00, 'KG', 12.00),
(515, NULL, '0813', 'KHARAK BLACK POWDER', 'काली खारेक पावडर', 1, 0, 0, -2, 0, 0, 210.00, 320.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(516, NULL, '0813', 'KHARAK WHITE POWDER ', 'सफेद खारेक पावडर', 1, 0, 0, 0, 0, 0, 400.00, 400.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(517, NULL, '910', 'TEJPATTA A1', 'A 1 तेजपता', 1, 0, 0, -1, 0, 0, 96.30, 160.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(518, NULL, '910', 'TEJPATTA 100gm', 'तेजपत्ता 100GM', 1, 0, 0, -1, 0, 0, 40.00, 40.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(519, NULL, '910', 'TEJPATTA 50gm', 'तेजपत्ता 50GM', 1, 0, 0, -1, 0, 0, 20.00, 20.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(520, NULL, '910', 'TEJPATTA 25gm ', 'तेजपत्ता 25GM', 1, 0, 0, -2, 0, 0, 10.00, 10.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(521, NULL, '910', 'TEJPATTA 10gm', 'तेजपत्ता 10GM', 1, 0, 0, 0, 0, 0, 6.00, 6.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(522, NULL, '910', 'TEJPATTA POWDER', 'तेजपता पावडर', 1, 0, 0, 0, 0, 0, 120.00, 120.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(523, NULL, '910', 'TRIFLA', 'त्रिफला', 1, 0, 0, 0, 0, 0, 240.00, 480.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(524, NULL, '910', 'TRIFLA 100gm ', 'त्रिफला 100gm', 1, 0, 0, 0, 0, 0, 120.00, 120.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(525, NULL, '910', 'TRIFLA 50gm', 'त्रिफला 50gm', 1, 0, 0, 0, 0, 0, 60.00, 60.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(526, NULL, '910', 'TRIFLA 25gm', 'त्रिफला 25gm', 1, 0, 0, 0, 0, 0, 30.00, 30.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(527, NULL, '910', 'TRIFLA 10gm', 'त्रिफला 10gm', 1, 0, 0, 0, 0, 0, 15.00, 15.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(528, NULL, '0904', 'MARI BLACK ', 'मिरी', 1, 0, 0, 0, 0, 0, 400.00, 400.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(529, NULL, '0904', 'MARI BLACK A1', 'A1 मिरी', 1, 0, 0, -2, 0, 0, 0.00, 480.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(530, NULL, '0904', 'MARI BLACK ITAM', 'एटम मिरी', 1, 0, 0, 0, 0, 0, 560.00, 560.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(531, NULL, '0904', 'MARI BLACK 100gm', 'मिरी 100gm', 1, 0, 0, -1, 0, 0, 80.00, 80.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(532, NULL, '0904', 'MARI BLACK 50gm', 'मिरी 50gm', 1, 0, 0, -3, 0, 0, 40.00, 40.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(533, NULL, '0904', 'MARI BLACK 25gm', 'मिरी 25gm', 1, 0, 0, 0, 0, 0, 30.00, 30.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(534, NULL, '0904', 'MARI BLACK 10gm', 'मिरी 10gm', 1, 0, 0, 0, 0, 0, 15.00, 15.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(535, NULL, '910', 'RAMPATRI', 'रामपत्री', 1, 0, 0, 0, 0, 0, 600.00, 1000.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(536, NULL, '910', 'RAMPATRI 100gm', 'रामपत्री 100gm', 1, 0, 0, -1, 0, 0, 120.00, 120.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(537, NULL, '910', 'RAMPATRI 50gm', 'रामपत्री 50gm', 1, 0, 0, 0, 0, 0, 60.00, 60.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(538, NULL, '910', 'RAMPATRI 25gm', 'रामपत्री 25gm', 1, 0, 0, 0, 0, 0, 40.00, 40.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(539, NULL, '910', 'RAMPATRI 10gm', 'रामपत्री 10gm', 1, 0, 0, 0, 0, 0, 20.00, 20.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(540, NULL, '910', 'KABABCHINI', 'कबाबचीनी', 1, 0, 0, 0, 0, 0, 1575.00, 2000.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(541, NULL, '910', 'KABABCHINI 100gm', 'कबाबचीनी 100gm', 1, 0, 0, 0, 0, 0, 280.00, 280.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(542, NULL, '910', 'KABABCHINI 50gm', 'कबाबचीनी 50gm', 1, 0, 0, 0, 0, 0, 140.00, 140.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(543, NULL, '910', 'KABABCHINI 25gm', 'कबाबचीनी 25gm', 1, 0, 0, 0, 0, 0, 70.00, 70.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(544, NULL, '910', 'KABABCHINI 10gm', 'कबाबचीनी 10gm', 1, 0, 0, 0, 0, 0, 40.00, 40.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(545, NULL, '09083120', 'ELACHI GREEN 100GM', 'ग्रीन एलाची 100GM', 1, 0, 0, -3, 0, 0, 560.00, 560.00, 0.00, 0.00, 0.00, 0.00, 'PKT', 5.00),
(546, NULL, '09083120', 'ELACHI GREEN 50GM', 'ग्रीन एलाची 50GM', 1, 0, 0, -4, 0, 0, 280.00, 280.00, 0.00, 0.00, 0.00, 0.00, 'PKT', 5.00),
(547, NULL, '09083120', 'ELACHI GREEN 25GM', 'ग्रीन एलाची 25GM', 1, 0, 0, -1, 0, 0, 140.00, 140.00, 0.00, 0.00, 0.00, 0.00, 'PKT', 5.00),
(548, NULL, '09083120', 'ELACHI GREEN 10GM', 'ग्रीन एलाची 10GM', 1, 0, 0, -2, 0, 0, 60.00, 60.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(549, NULL, '0904', 'MARI BLACK POWDER', 'काला मिरी पावडर', 1, 0, 0, 0, 0, 0, 280.00, 280.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(550, NULL, '0904', 'MARI WHITE AKKHA', 'सफेद मिरी', 1, 0, 0, 0, 0, 0, 800.00, 800.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(551, NULL, '0904', 'MARI WHITE POWDER', 'सफेद मिरी पावडर', 1, 0, 0, -1, 0, 0, 280.00, 280.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(552, NULL, '910', 'MARUTI CHAI MASALA', 'मारुति चाय मसाला', 1, 0, 0, 0, 0, 0, 600.00, 600.00, 500.00, NULL, 0.00, 0.00, 'KG', 5.00),
(553, NULL, '910', 'MARUTI CHAT MASALA ', 'लुज चाट मसाला', 1, 0, 0, 0, 0, 0, 160.00, 160.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(554, NULL, '910', 'MARUTI CHICKEN MASALA', 'लुज चिकन मसाला ', 1, 0, 0, 0, 0, 0, 320.00, 320.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(555, NULL, '910', 'MARUTI MEAT MASALA', 'लुज मटन मसाला ', 1, 0, 0, 0, 0, 0, 320.00, 320.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(556, NULL, '910', 'MARUTI CHOLE MASALA', 'लुज छोले मसाला', 1, 0, 0, 0, 0, 0, 320.00, 320.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(557, NULL, '910', 'MARUTI PAVBHAJI MASALA', 'लुज पावभाजी मसाला ', 1, 0, 0, 0, 0, 0, 320.00, 320.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(558, NULL, '910', 'MARUTI SAMBHAR MASALA', 'लुज सांभार मसाला ', 1, 0, 0, 0, 0, 0, 320.00, 320.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(559, NULL, '910', 'MARUTI KITCHEN KING ', 'लुज किंचन किंग  ', 1, 0, 0, 0, 0, 0, 320.00, 320.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(560, NULL, '910', 'MARUTI SCHEZWAN ', 'लुज सेजवान मसाला ', 1, 0, 0, 0, 0, 0, 400.00, 400.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(561, NULL, '910', 'MARUTI PULAV MASALA ', 'लुज पुलाव मसाला ', 1, 0, 0, 0, 0, 0, 320.00, 320.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(562, NULL, '910', 'MARUTI TANDURI MASAL', 'लुज तंदूरी मसाला ', 1, 0, 0, 0, 0, 0, 320.00, 320.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(563, NULL, '910', 'MARUTI MILK KESAR POWDER', 'मारुति मिल्क मसाला ', 1, 6, 0, 10, 0, 0, 600.32, 680.00, 0.00, 640.00, 0.00, 0.00, 'KG', 5.00),
(564, NULL, '0909', 'AMLA MEETHA', 'मीठा अमला', 1, 2, 0, 0, 0, 0, 130.00, 200.00, 0.00, 145.00, 0.00, 0.00, 'KG', 5.00),
(565, NULL, '910', 'METHI R', 'R मेथी', 1, 0, 0, 1, 0, 0, 72.00, 120.00, 0.00, 100.00, 0.00, 0.00, 'KG', 5.00),
(566, NULL, '910', 'METHI 2', '2 मेथी', 1, 0, 0, -2, 0, 0, 0.00, 80.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(567, NULL, '910', 'METHI POWDER', 'मेथी पावडर', 1, 0, 0, 0, 0, 0, 120.00, 120.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(569, NULL, '910', 'METHI DAL', 'मेथी दाल', 1, 0, 0, 0, 0, 0, 140.00, 160.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(570, NULL, '0813', 'MIX MEVA UNCHA', 'उंचा मिक्स मेवा', 1, 0, 0, 0, 0, 0, 600.00, 600.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(571, NULL, '0813', 'MIX MEVA ', 'मिक्स मेवा ', 1, 0, 0, 0, 0, 0, 500.00, 500.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(572, NULL, '1905', 'MIX FRAME ', 'मिक्स फ्रेम', 1, 0, 0, 0, 0, 0, 37.00, 60.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(573, NULL, '910', 'SUNTH', 'सुंठ', 1, 0, 0, 0, 0, 0, 280.00, 280.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(574, NULL, '910', 'SUNTH KORI A1', 'A1 कोरी सुंठ', 1, 0, 0, 0, 0, 0, 400.00, 400.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(575, NULL, '910', 'SUNTH KORI 2', '2 कोरी सुंठ', 1, 0, 0, 0, 0, 0, 360.00, 360.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(576, NULL, '910', 'SUNTH A1 ', 'A1 सुंठ', 1, 0, 0, 0, 0, 0, 400.00, 400.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(577, NULL, '910', 'SUNTH POWDER A1 SP3', 'A1 सुंठ पावडर', 1, 0, 0, 25, 0, 0, 130.00, 280.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(578, NULL, '910', 'SUNTH POWDER 100gm', 'A1 सुंठ पावडर 100gm', 1, 0, 0, 0, 0, 0, 40.00, 40.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(579, NULL, '0813', 'AWALA POWDER 100gm', 'आवला पावडर 100gm', 1, 0, 0, 0, 0, 0, 0.00, 40.00, 0.00, 0.00, 0.00, 0.00, 'GRM', 12.00),
(580, NULL, '910', 'GHANTHOLA POWDER', 'गंठोदा पावडर', 1, 0, 0, 0, 0, 0, 600.00, 600.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(581, NULL, '910', 'GHANTHOLA POWDER 100gm', 'गंठोदा पावडर 100gm', 1, 0, 0, 0, 0, 0, 70.00, 70.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(582, NULL, '910', 'GHANTHOLA', 'गंठोदा', 1, 0, 0, 0, 0, 0, 1200.00, 1200.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(583, NULL, '910', 'JESTHIMADH', 'जेस्थीमध', 1, 0, 0, 0, 0, 0, 280.00, 280.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(584, NULL, '910', 'JESTHIMADH POWDER', 'जेस्ठीमध पावडर', 1, 0, 0, 0, 0, 0, 280.00, 280.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(585, NULL, '910', 'KATLO', 'काटलो', 1, 0, 0, 0, 0, 0, 600.00, 600.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(586, NULL, '910', 'KATLO 100gm', 'काटलो 100gm', 1, 0, 0, 0, 0, 0, 80.00, 80.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(587, NULL, '910', 'KARIYATO', 'करियातो', 1, 0, 0, 0, 0, 0, 800.00, 800.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(588, NULL, '1902', 'PASTA MACRONI', 'माक्रोनी पास्ता', 1, 0, 0, -3, 0, 0, 40.00, 60.00, 0.00, 0.00, 0.00, 0.00, 'KG', 12.00),
(589, NULL, '1902', 'PASTA PENNI', 'पेंनी पास्ता', 1, 0, 0, 0, 0, 0, 60.00, 60.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(590, NULL, '1902', 'PASTA SCREW', 'स्क्रू पास्ता', 1, 0, 0, 0, 0, 0, 40.00, 60.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(591, NULL, '910', 'LIMBU PHUL b', 'लिम्बु फूल', 1, 2, 0, 1, 0, 0, 120.00, 160.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(592, NULL, '910', 'LIMBU PHUL 100gm', 'लिम्बु फूल 100gm', 1, 0, 0, 0, 0, 0, 40.00, 40.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(593, NULL, '0813', 'GODAMBI', 'गोंडबी', 1, 0, 0, 0, 0, 0, 1000.00, 1000.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(594, NULL, '0813', 'GODAMBI 100gm', 'गोंडबी 100gm', 1, 0, 0, 0, 0, 0, 120.00, 120.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(595, NULL, '0909', 'KALONJI', 'कलोंजी', 1, 0, 0, 0, 0, 0, 0.00, 240.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(596, NULL, '0909', 'KALONJI 100gm', 'कलोंजी 100gm', 1, 0, 0, 0, 0, 0, 30.00, 30.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(597, NULL, '21061000', 'GULAB PHUL', 'गुलाबफुल', 1, 0, 0, 0, 0, 0, 400.00, 400.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(598, NULL, '21061000', 'GULAB PHUL\\ 100gm', 'गुलाबफुल 100gm', 1, 0, 0, 0, 0, 0, 40.00, 40.00, 0.00, NULL, 0.00, 0.00, 'GRM', 12.00),
(599, NULL, '21061000', 'GULKAND 500GM', 'गुलकंद 500GM', 1, 0, 0, -2, 0, 0, 45.00, 60.00, 80.00, NULL, 0.00, 0.00, 'GRM', 12.00),
(600, NULL, '1301', 'GUNDER KANI SAFED', 'सफेद गुंदकनी ', 1, 3, 0, 0, 0, 0, 200.00, 200.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(601, NULL, '1301', 'GUNDER KANI 2', '2 गुंदरकनी', 1, 1, 0, 0, 0, 0, 0.00, 160.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(602, NULL, '1301', 'GUNDER DHAVLA', 'धवला गुंदर ', 1, 0, 0, 0, 0, 0, 1000.00, 1000.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(603, NULL, '1301', 'GUNDER DHAVLA', 'धवलाकनी  गुंदर', 1, 0, 0, 0, 0, 0, 800.00, 800.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(604, NULL, '1301', 'GUNDER DHAVLA KANI', 'धवलाकनी  गुंदर', 1, 0, 0, 0, 0, 0, 800.00, 800.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(605, NULL, '1301', 'GUNDER KATHIRA ', 'कथिरा गुंदर', 1, 0, 0, 0, 0, 0, 600.00, 600.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(606, NULL, '1301', 'GUNDER SEV', 'सेव गुंदर', 1, 0, 0, 0, 0, 0, 900.00, 900.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(607, NULL, '910', 'HIMAJ', 'हिमज', 1, 0, 0, 0, 0, 0, 260.00, 360.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(608, NULL, '910', 'ISABGUL BHUSI', 'इसबगुल भूसी', 1, 0, 0, 0, 0, 0, 600.00, 600.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(609, NULL, '1104', 'JAV', 'जव', 1, 0, 0, 0, 0, 0, 27.00, 32.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(610, NULL, '1104', 'JAV BARLI', 'बारलीजव', 1, 1, 0, 0, 0, 0, 36.00, 48.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(611, NULL, '9082100', 'JAYFAL 100 GM', 'जायफल 100gm', 1, 0, 0, 0, 0, 0, 100.00, 100.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(612, NULL, '9082100', 'JAYFAL', 'जायफल', 1, 0, 0, 0, 0, 0, 500.00, 800.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(613, NULL, '9082100', 'JAYFAL POWDER', 'जायफल पावडर', 1, 0, 0, 0, 0, 0, 1200.00, 1200.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(614, NULL, '9082100', 'MAGADIYA', 'मगडिया', 1, 1, 0, 0, 0, 0, 609.00, 800.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(615, NULL, '9082100', 'MAGADIYA 100gm', 'मगडिया 100gm', 1, 0, 0, 0, 0, 0, 120.00, 120.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(616, NULL, '9082100', 'MAGADIYA 1 PC', 'मगडिया नंग', 1, 0, 0, -2, 0, 0, 8.00, 8.00, 0.00, 0.00, 0.00, 0.00, 'PCS', 5.00),
(617, NULL, '3304', 'ABIR BLACK', 'अबीर काला', 1, 0, 0, 0, 0, 0, 60.00, 60.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(618, NULL, '09109914', 'AJINO MOTO', 'अजिनो मोटो', 1, 4, 0, -1, 0, 0, 120.00, 160.00, 0.00, 130.00, 0.00, 0.00, 'KG', 5.00),
(619, NULL, '910', 'AKHAND', 'एखंड', 1, 0, 0, 0, 0, 0, 240.00, 240.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(620, NULL, '910', 'AKHA GARAM', 'अखा गरम', 1, 0, 0, 0, 0, 0, 600.00, 600.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(621, NULL, '910', 'AKHA GARAM 250gm', 'अखा गरम 250gm', 1, 0, 0, 0, 0, 0, 150.00, 150.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(622, NULL, '0906', 'TAJ LAL ', 'लाल तज ', 1, 0, 0, 0, 0, 0, 380.00, 480.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(623, NULL, '09061910', 'TAJ BHUNGDI', 'भुंगडी तज ', 1, 0, 0, 0, 0, 0, 410.00, 600.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(624, NULL, '0813', 'ANAR DANA', 'अनार दाना', 1, 0, 0, 0, 0, 0, 160.00, 160.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(625, NULL, '0711', 'BABY CORN', 'बेबीकॉर्न ', 1, 0, 0, 0, 0, 0, 60.00, 100.00, 160.00, NULL, 0.00, 0.00, 'PKT', 0.00),
(626, NULL, '2102', 'BACKING POWDER', 'बेकिंग पावडर ', 1, 0, 0, 0, 0, 0, 120.00, 90.00, 105.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(627, NULL, '09061910', 'TAJ BHUNGDI 100GM', 'तज भुंगडी 100GM', 1, 0, 0, 0, 0, 0, 60.00, 60.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(628, NULL, '09061910', 'TAJ BHUNGDI 50GM', 'तज भुंगडी 50GM', 1, 0, 0, 0, 0, 0, 30.00, 30.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(630, NULL, '09061910', 'TAJ BHUNGDI 25GM', 'तज भुंगडी 25GM', 1, 0, 0, 0, 0, 0, 15.00, 15.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(631, NULL, '09061910', 'TAJ BHUNGDI 10GM', 'तज भुंगडी 10GM', 1, 0, 0, 0, 0, 0, 10.00, 10.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(632, NULL, '09061910', 'TAJ POWDER', 'तज पावडर', 1, 0, 0, 0, 0, 0, 480.00, 480.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(633, NULL, '09061910', 'TAJ POWDER 100 GM', 'तज पावडर 100 GM', 1, 0, 0, 0, 0, 0, 60.00, 60.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(634, NULL, '09109100', 'EV PAVBHAJI  50GM', 'EV पावभाजी 50GM', 1, 0, 0, 0, 0, 0, 29.40, 30.00, 35.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(635, NULL, '09109100', 'EV PAVBHAJI  100GM', 'EV पावभाजी 100GM', 1, 0, 0, 3, 0, 0, 56.00, 60.00, 66.00, 0.00, 0.00, 0.00, 'GRM', 5.00),
(636, NULL, '09109100', 'EV PAVBHAJI 200GM', 'EV पावभाजी 200GM', 1, 0, 0, -1, 0, 0, 114.00, 125.00, 135.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(637, NULL, '09109100', 'EV PAVBHAJI  500GM', 'EV पावभाजी 500GM', 1, 0, 0, 0, 0, 0, 260.00, 280.00, 320.00, NULL, 0.00, 0.00, 'KG', 5.00),
(638, NULL, '09109100', 'EV SAMBHAR 50GM', 'EV सांभर 50GM', 1, 0, 0, 0, 0, 0, 29.00, 30.00, 34.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(639, NULL, '09109100', 'EV SAMBHAR 100GM', 'EV सांभर 100GM', 1, 0, 0, -1, 0, 0, 53.00, 58.00, 63.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(640, NULL, '09109100', 'EV SAMBHAR 200GM', 'EV सांभर 200GM', 1, 0, 0, 0, 0, 0, 105.00, 115.00, 125.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(641, NULL, '09109100', 'EV SAMBHAR 500GM', 'EV सांभार 500GM', 1, 0, 0, 0, 0, 0, 240.00, 260.00, 285.00, NULL, 0.00, 0.00, 'KG', 5.00),
(642, NULL, '9109100', 'BD PAVBHAJI 100GM', 'BD पावभाजी 100GM', 1, 0, 0, -1, 0, 0, 52.00, 65.00, 72.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(643, NULL, '09109100', 'EV PANIPURI  50GM', 'EV पानीपुरी 50GM', 1, 0, 0, 0, 0, 0, 26.00, 28.00, 38.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(644, NULL, '9109100', 'BD PAVBHAJI 1KG', 'BD पावभाजी 1KG', 1, 0, 0, 0, 0, 0, 486.00, 540.00, 640.00, NULL, 0.00, 0.00, 'KG', 5.00),
(645, NULL, '09109100', 'EV PANIPURI 100GM', 'EV पानीपूरी 100GM', 1, 0, 0, -1, 0, 0, 49.60, 55.00, 59.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(646, NULL, '9109100', 'BD BIRYANI PULAV 100GM', 'BD बिरयानी 100GM', 1, 0, 0, 0, 0, 0, 92.00, 100.00, 110.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(647, NULL, '9109100', 'BD BIRYANI 1KG', 'BD बिरयानी 1KG', 1, 0, 0, 0, 0, 0, 648.00, 750.00, 900.00, NULL, 0.00, 0.00, 'KG', 5.00),
(648, NULL, '9109100', 'BD CHANA 1KG', 'BD चना 1KG', 1, 0, 0, 0, 0, 0, 470.00, 470.00, 560.00, NULL, 0.00, 0.00, 'KG', 5.00),
(649, NULL, '9109100', 'BD CHANA 100gm', 'BD चना 100gm', 1, 0, 0, 0, 0, 0, 48.00, 60.00, 66.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(650, NULL, '9109100', 'BD CHAT 100gm', 'BD चाट 100GM', 1, 0, 0, 0, 0, 0, 42.00, 55.00, 62.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(651, NULL, '9109100', 'BD CHAT 1KG', 'BD चाट 1KG', 1, 0, 0, 0, 0, 0, 441.00, 520.00, 612.00, NULL, 0.00, 0.00, 'KG', 5.00),
(652, NULL, '9109100', 'BD CHICKEN 100GM', 'BD चिकन 100GM', 1, 0, 0, 0, 0, 0, 61.00, 65.00, 72.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(653, NULL, '9109100', 'BD CHICKEN 1KG', 'BD चिकन 1KG', 1, 0, 0, 0, 0, 0, 579.00, 580.00, 690.00, NULL, 0.00, 0.00, 'KG', 5.00),
(654, NULL, '9109100', 'BD CHOLE 100gm', 'BD छोले 100GM', 1, 0, 0, 0, 0, 0, 44.00, 55.00, 61.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(655, NULL, '91091001', 'BD CHOLE 1KG', 'BD छोले 1KG', 1, 0, 0, 0, 0, 0, 510.00, 510.00, 605.00, NULL, 0.00, 0.00, 'KG', 5.00),
(656, NULL, '9109100', 'BD JALJIRA 1KG', 'BD जलजीरा 1KG', 1, 0, 0, 0, 0, 0, 0.00, 370.00, 450.00, NULL, 0.00, 0.00, 'KG', 5.00),
(657, NULL, '9109100', 'BD JALJIRA 100GM', 'BD जलजीरा 100GM', 1, 0, 0, 0, 0, 0, 41.00, 45.00, 50.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(658, NULL, '9109100', 'BD JAIN KITCHEN KING 100GM', 'BD जेन किचन किंग 100gm', 1, 0, 0, 0, 0, 0, 48.00, 60.00, 67.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(659, NULL, '9109100', 'BD JIRALU 100gm', 'BD जिरालू 100gm', 1, 0, 0, 0, 0, 0, 30.00, 38.00, 42.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(660, NULL, '9109100', 'BD JIRALU 1kg', 'BD जिरालू 1 KG', 1, 0, 0, 0, 0, 0, 292.00, 340.00, 405.00, NULL, 0.00, 0.00, 'KG', 5.00),
(661, NULL, '9109100', 'BD K KING 100gm', 'BD किचन किंग 100GM', 1, 0, 0, 0, 0, 0, 48.00, 60.00, 67.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(662, NULL, '9109100', 'BD K KING 1KG', 'BD किचन किंग 1KG', 1, 0, 0, 0, 0, 0, 500.00, 560.00, 666.00, NULL, 0.00, 0.00, 'KG', 5.00),
(663, NULL, '9109100', 'BD KAMAL TEA 1KG', 'BD कमल टी 1KG', 1, 0, 0, 0, 0, 0, 0.00, 680.00, 810.00, NULL, 0.00, 0.00, 'KG', 5.00),
(664, NULL, '9109100', 'BD KAMAL TEA 100GM', 'BD कमल टी 100GM', 1, 0, 0, 0, 0, 0, 75.00, 75.00, 83.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(665, NULL, '9109100', 'BD MEAT 100gm', 'BD मटन 100gm', 1, 0, 0, 0, 0, 0, 61.00, 65.00, 72.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(666, NULL, '9109100', 'BD MEAT 1KG', 'BD मटन 1KG', 1, 0, 0, 0, 0, 0, 559.00, 560.00, 666.00, NULL, 0.00, 0.00, 'KG', 5.00),
(667, NULL, '9109100', 'BD PANIPURI 100gm', 'BD पानीपूरी 100 GM', 1, 0, 0, 0, 0, 0, 55.00, 60.00, 65.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(668, NULL, '9109100', 'BD PANIPURI 1KG', 'BD पानीपूरी 1KG', 1, 0, 0, 0, 0, 0, 404.00, 470.00, 560.00, NULL, 0.00, 0.00, 'KG', 5.00),
(669, NULL, '9109100', 'BD R GARAM 100gm', 'BD R गरम 100gm', 1, 0, 0, 0, 0, 0, 58.00, 75.00, 81.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(670, NULL, '9109100', 'BD R GARAM 1KG', 'BD R गरम 1kg', 1, 0, 0, 0, 0, 0, 480.00, 550.00, 666.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(671, NULL, '9109100', 'BD R GARAM 200gm', 'BD R गरम 200GM', 1, 0, 0, 0, 0, 0, 130.00, 130.00, 152.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(672, NULL, '9109100', 'BD SAMBHAR 100gm', 'BD सांभर 100gm', 1, 0, 0, 0, 0, 0, 52.00, 55.00, 62.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(673, NULL, '9109100', 'BD SAMBHAR 1KG', 'BD सांभर 1kg', 1, 0, 0, 0, 0, 0, 508.00, 500.00, 605.00, NULL, 0.00, 0.00, 'KG', 5.00),
(674, NULL, '09109100', 'EV CHICKEN  50GM', 'EV चिकन 50GM', 1, 0, 0, 0, 0, 0, 32.00, 35.00, 38.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(675, NULL, '09109100', 'EV CHICKEN 100GM', 'EV चिकन 100.GM', 1, 0, 0, 2, 0, 0, 61.00, 65.00, 72.00, 0.00, 0.00, 0.00, 'GRM', 5.00),
(676, NULL, '09109100', 'EV CHICKEN 200GM', 'EV चिकन 200GM', 1, 0, 0, 0, 0, 0, 116.00, 130.00, 143.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(677, NULL, '09109100', 'EV CHICKEN 500GM', 'EV चिकन 500GM', 1, 0, 0, 0, 0, 0, 269.00, 290.00, 320.00, NULL, 0.00, 0.00, 'KG', 5.00),
(678, NULL, '09109100', 'EV MEAT  50GM', 'EV मटण 50GM', 1, 0, 0, 0, 0, 0, 32.00, 35.00, 38.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(679, NULL, '09109100', 'EV MEAT  100GM', 'EV मटण 100 GM ', 1, 0, 0, 0, 0, 0, 61.00, 65.00, 72.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(680, NULL, '09109100', 'EV MEAT  200GM', 'EV मटण 200 GM', 1, 0, 0, 0, 0, 0, 116.00, 130.00, 143.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(681, NULL, '09109100', 'EV MEAT  500GM', 'EV मटण 500GM ', 1, 0, 0, 0, 0, 0, 278.00, 290.00, 320.00, NULL, 0.00, 0.00, 'KG', 5.00),
(682, NULL, '09109100', 'EV TANDOORI CHICKEN  50GM', 'EV तंदूरी चिकन 50gm', 1, 0, 0, 0, 0, 0, 35.00, 35.00, 38.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(683, NULL, '09109100', 'EV TANDOORI CHICKEN 100GM', 'EV तंदूरी चिकन 100gm', 1, 0, 0, 0, 0, 0, 65.00, 65.00, 72.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(684, NULL, '09109100', 'EV TANDOORI CHICKEN 500GM', 'EV तंदूरी चिकन 500gm', 1, 0, 0, 0, 0, 0, 0.00, 290.00, 310.00, NULL, 0.00, 0.00, 'KG', 5.00),
(685, NULL, '09109100', 'EV GARAM MASALA 50GM', 'EV गरम 50 GM', 1, 0, 0, 0, 0, 0, 38.00, 38.00, 41.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(686, NULL, '09109100', 'EV GARAM MASALA 100GM', 'EV गरम 100 GM', 1, 0, 0, 0, 0, 0, 70.00, 70.00, 78.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(687, NULL, '09109100', 'EV GARAM SUPER 200GM', 'EV  सुपर गरम  200GM', 1, 0, 0, -2, 0, 0, 0.00, 70.00, 80.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(688, NULL, '09109100', 'EV GARAM 500GM', 'EV गरम  500GM', 1, 0, 0, 0, 0, 0, 0.00, 300.00, 350.00, NULL, 0.00, 0.00, 'KG', 5.00),
(689, NULL, '09109100', 'EV CHAT 50GM', 'EV चाट 50GM', 1, 0, 0, 0, 0, 0, 28.00, 30.00, 38.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(690, NULL, '09109100', 'EV CHAT 100GM', 'EV चाट 100GM', 1, 0, 0, -2, 0, 0, 52.00, 55.00, 62.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(691, NULL, '09109100', 'EV CHAT 200GM', 'EV चाट 200GM', 1, 0, 0, 0, 0, 0, 103.00, 110.00, 123.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(692, NULL, '09109100', 'EV CHAT 500GM', 'EV चाट 500GM', 1, 0, 0, 0, 0, 0, 248.00, 260.00, 285.00, NULL, 0.00, 0.00, 'KG', 5.00),
(693, NULL, '09109100', 'EV TEA MASALA 50GM', 'EV चाय मसाला 50gm', 1, 0, 0, 0, 0, 0, 40.30, 45.00, 48.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(694, NULL, '09109100', 'EV TEA MASALA 100GM', 'EV चाय मसाला 100gm', 1, 0, 0, 0, 0, 0, 80.00, 80.00, 90.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(695, NULL, '9109100', 'BD PREMIUM TEA 1KG', 'BD प्रीमियम टी 1KG', 1, 0, 0, 0, 0, 0, 450.00, 450.00, 540.00, NULL, 0.00, 0.00, 'KG', 5.00),
(696, NULL, '09109100', 'EV CHHOLE  50GM', 'EV छोले 50 GM', 1, 0, 0, 0, 0, 0, 28.00, 30.00, 33.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(697, NULL, '09109100', 'EV CHHOLE  100GM', 'EV छोले 100 GM', 1, 0, 0, 0, 0, 0, 53.00, 58.00, 63.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(698, NULL, '28100020', 'BORIC POWDER 100gm', 'बोरिक पावडर 100GM', 1, 0, 0, 0, 0, 0, 30.00, 30.00, 45.00, NULL, 0.00, 0.00, 'GRM', 18.00),
(699, NULL, '95043010', 'BORIC POWDER 400gm', 'बोरिक पावडर 400GM', 1, 0, 0, -2, 0, 0, 64.00, 80.00, 148.00, NULL, 0.00, 0.00, 'GRM', 12.00),
(700, NULL, '09109100', 'EV CHHOLE  200GM', 'EV छोले 200 GM', 1, 0, 0, 0, 0, 0, 105.00, 110.00, 125.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(701, NULL, '28100020', 'BORIC POWDER 1KG', 'बोरिक पावडर 1kg', 1, 0, 0, 0, 0, 0, 180.00, 180.00, 300.00, NULL, 0.00, 0.00, 'KG', 18.00),
(702, NULL, '28100020', 'BORIC POWDER 200gm', 'बोरीक पाउडर 200gm', 1, 0, 0, 0, 0, 0, 50.00, 50.00, 76.00, NULL, 0.00, 0.00, 'GRM', 18.00),
(703, NULL, '09109100', 'EV CHHOLE  500GM', 'EV छोले 500GM', 1, 0, 0, 0, 0, 0, 240.00, 260.00, 285.00, NULL, 0.00, 0.00, 'KG', 5.00),
(704, NULL, '09109100', 'EV KITCHEN KING 50GM', 'EV किचन किंग 50GM', 1, 0, 0, -1, 0, 0, 28.00, 30.00, 34.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(705, NULL, '910', 'MAGAJ WATERMELON', 'कलिंगर मगज', 1, 1, 0, 0, 0, 0, 120.00, 200.00, 0.00, 160.00, 0.00, 0.00, 'KG', 5.00),
(706, NULL, '910', 'MAGAJ WATERMELON 100gm', 'कलिंगर मगज 100gm', 1, 0, 0, 0, 0, 0, 30.00, 30.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(707, NULL, '09109100', 'EV KITCHEN KING 100GM', 'EV किचन किंग 100GM', 1, 0, 0, 0, 0, 0, 55.00, 60.00, 65.00, 0.00, 0.00, 0.00, 'GRM', 5.00),
(708, NULL, '910', 'MAGAJ KHARBUJA', 'खरबूजा', 1, 0, 0, 0, 0, 0, 600.00, 600.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(709, NULL, '0813', 'MAGAJ KODA', 'कोड़ा  मगज', 1, 0, 0, 0, 0, 0, 400.00, 600.00, 0.00, 500.00, 0.00, 0.00, 'KG', 12.00),
(711, NULL, '0813', 'MAGAJ KODA ROASTED', 'सेकेला कोड़ा मगज ', 1, 0, 0, 1, 0, 0, 850.00, 1000.00, 0.00, 950.00, 0.00, 0.00, 'KG', 12.00),
(712, NULL, '09109100', 'EV KITCHEN KING 500GM', 'EV किचन किंग 500GM', 1, 0, 0, -1, 0, 0, 260.00, 290.00, 310.00, NULL, 0.00, 0.00, 'KG', 5.00),
(713, NULL, '910', 'MAGAJ WATERMELON ROASTED ', 'सेकेला कलिंगर मगज', 1, 0, 0, 0, 0, 0, 400.00, 400.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(714, NULL, '12079940', 'KOKAM', 'पेटी कोकम', 1, 0, 0, 0, 0, 0, 40.00, 100.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(715, NULL, '09109100', 'EV SHAHI BIRYANI 50GM', 'EV शाही  बिरयानी 50GM', 1, 0, 0, 0, 0, 0, 70.00, 70.00, 78.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(716, NULL, '12079940', 'KOKAM LONAWALA', 'A1 लोनावाला कोकम', 1, 0, 0, 0, 0, 0, 10.00, 140.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(717, NULL, '09109100', 'EV SHAHI BIRYANI 200GM', 'EV शाही  बिरयानी 200GM', 1, 0, 0, 0, 0, 0, 220.00, 220.00, 225.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(718, NULL, '07132000', 'LAL MAKAI', 'लाल मकई', 1, 0, 0, 0, 0, 0, 26.00, 36.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(719, NULL, '09109100', 'EV SHAHI PANNER 100GM', 'EV शाही पनीर 100GM', 1, 0, 0, 0, 0, 0, 70.00, 70.00, 78.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(720, NULL, '910', 'LASUN', 'लसून', 1, 0, 0, -1, 0, 0, 240.00, 280.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(721, NULL, '910', 'LASUN KASHMIRI MOTA', 'मोटा काश्मीर लसुण', 1, 0, 0, 0, 0, 0, 1200.00, 1200.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(722, NULL, '910', 'LASUN KASHMIRI NANA', 'नाना काश्मीर लसुण', 1, 0, 0, 0, 0, 0, 800.00, 800.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(723, NULL, '09109100', 'EV SHAHI PANNER 50GM', 'EV शाही पनीर 50GM', 1, 0, 0, 0, 0, 0, 38.00, 38.00, 42.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(724, NULL, '910', 'LASUN KALI 1', 'लसून 1 कली', 1, 0, 0, 0, 0, 0, 600.00, 600.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(725, NULL, '09109100', 'EV SUBJI MASALA 50GM', 'EV सबजी 50GM', 1, 0, 0, 0, 0, 0, 25.00, 25.00, 29.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(726, NULL, '910', 'LASUN POWDER 100gm', 'लसून पावडर 100GM', 1, 0, 0, 0, 0, 0, 40.00, 40.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(727, NULL, '09109100', 'EV SUBJI MASALA 100GM', 'EV सबजी 100GM', 1, 0, 0, 0, 0, 0, 48.00, 48.00, 54.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(728, NULL, '09109100', 'EV TIKHALAL 500GM', 'EV तिखालाल 500 GM', 1, 0, 0, 0, 0, 0, 150.00, 150.00, 165.00, NULL, 0.00, 0.00, 'KG', 5.00),
(729, NULL, '0813', 'MAKHANA', 'मखाना', 1, 0, 0, 0, 0, 0, 0.00, 760.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(730, NULL, '09109100', 'EV TURMERIC POWDER 500GM', 'EV हल्दी पाउडर 500gm', 1, 0, 0, 0, 0, 0, 120.00, 120.00, 130.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(731, NULL, '0813', 'MAKHANA UNCHA', 'उंचा मखाना', 1, 0, 0, 0, 0, 0, 880.00, 880.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(732, NULL, '20071000', 'NOBLE JAM 4KG', 'नोबेल जाम 4kg', 1, 0, 0, 0, 0, 0, 303.00, 340.00, 450.00, 320.00, 0.00, 0.00, 'KG', 12.00),
(733, NULL, '2003', 'MASHROOM', 'मशरूम', 1, 0, 0, 0, 0, 0, 120.00, 120.00, 165.00, NULL, 0.00, 0.00, 'KG', 12.00),
(734, NULL, '25010020', 'PAPAD KHAR', 'पापडखार', 1, 0, 0, -1, 0, 0, 30.00, 80.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(735, NULL, '19059040', 'PAPAD LIJJAT LASUN', 'लि लसुण पापड़ 1kg', 1, 0, 0, 0, 0, 0, 250.00, 250.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(736, NULL, '1905', 'PAPAD LIJJAT LESUN 200GM', 'लिज्जत लसून 200GM', 1, 0, 0, 0, 0, 0, 55.00, 55.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(737, NULL, '19059040', 'PAPAD LIJJAT MINI 1KG', 'लिज्जत मिनी 1kg', 1, 0, 0, -2, 0, 0, 235.00, 235.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(738, NULL, '19059040', 'PAPAD LIJJAT MINI 200', 'लिज्जत मिनी 200', 1, 0, 0, -1, 0, 0, 55.00, 55.00, 0.00, NULL, 0.00, 0.00, 'GRM', 0.00),
(739, NULL, '19059040', 'PAPAD LIJJAT MINI 500GM', ' लिज्जत मिनी 500gm', 1, 0, 0, 0, 0, 0, 120.00, 120.00, 0.00, NULL, 0.00, 0.00, 'GRM', 0.00),
(740, NULL, '19059040', 'PAPAD LIJJAT PUNJABI 1KG', 'लिज्जत पंजाबी 1kg', 1, 0, 0, 0, 0, 0, 285.00, 285.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(741, NULL, '19059040', 'PAPAD LIJJAT PUNJABI 200GM', ' लिज्जत पंजाबी 200gm', 1, 0, 0, 0, 0, 0, 60.00, 60.00, 0.00, NULL, 0.00, 0.00, 'GRM', 0.00),
(742, NULL, '1905', 'PAPAD LIJJAT UDAD 1KG', 'लिज्जत पापड़ 1KG', 1, 0, 0, -1, 0, 0, 235.00, 235.00, 252.00, NULL, 0.00, 0.00, 'KG', 0.00),
(743, NULL, '1905', 'PAPAD LIJJAT UDAD 200GM', 'लिज्जत पापड़ 200GM', 1, 0, 0, -3, 0, 0, 50.00, 55.00, 60.00, NULL, 0.00, 0.00, 'GRM', 0.00),
(744, NULL, '19059040', 'PAPAD LIJJAT UDAD 500', 'लिज्जत पापड़ 500GM', 1, 0, 0, -2, 0, 0, 120.00, 120.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(745, NULL, '20071000', 'NOBLE BLUE CARGO', 'नोबेल ब्लू कारगो', 1, 0, 0, 0, 0, 0, 126.00, 150.00, 235.00, 140.00, 0.00, 0.00, 'LTR', 12.00),
(746, NULL, '20071000', 'NOBLE BUTTERSCOTCH', 'नोबेल बटर', 1, 0, 0, 0, 0, 0, 98.00, 120.00, 180.00, 110.00, 0.00, 0.00, 'LTR', 12.00),
(747, NULL, '19059040', 'PAPAD KHICHIYA MOTA ', 'मोटा खिचिया पापड', 1, 0, 0, 0, 0, 0, 120.00, 120.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(748, NULL, '19059040', 'PAPAD MOTA MAKHAN', 'मोटा माखन पापड', 1, 0, 0, 0, 0, 0, 185.00, 220.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(749, NULL, '20071000', 'NOBLE CREAM', 'नोबेल क्रीम', 1, 0, 0, 0, 0, 0, 157.00, 180.00, 295.00, 170.00, 0.00, 0.00, 'LTR', 12.00),
(750, NULL, '19059040', 'PAPAD KHICHIYA NANA', 'नाना खिचिया पापड', 1, 0, 0, 0, 0, 0, 76.00, 120.00, 0.00, 0.00, 0.00, 0.00, 'PKT', 0.00),
(751, NULL, '20071000', 'NOBLE JAM 1KG', 'नोबेल जाम 1kg', 1, 0, 0, -4, 0, 0, 96.00, 110.00, 158.00, 0.00, 0.00, 0.00, 'KG', 12.00),
(752, NULL, '20071000', 'NOBLE JAM 500GM', 'नोबेल जाम 500', 1, 0, 0, -1, 0, 0, 54.00, 70.00, 99.00, 60.00, 0.00, 0.00, 'GRM', 12.00),
(754, NULL, '20019000', 'SV LIMBU 500gm', 'SV लिम्बू 500gm', 1, 0, 0, 0, 0, 0, 61.00, 70.00, 85.00, 0.00, 0.00, 0.00, 'GRM', 12.00),
(755, NULL, '20089919', 'NOBLE KALAKHATTA', 'नोबेल कालाखट्टा', 1, 0, 0, 0, 0, 0, 90.00, 110.00, 160.00, NULL, 0.00, 0.00, 'LTR', 12.00),
(756, NULL, '20019000', 'SV LIMBU 200gm', 'SV लिम्बू 200gm', 1, 0, 0, 0, 0, 0, 33.30, 40.00, 45.00, 0.00, 0.00, 0.00, 'GRM', 12.00),
(757, NULL, '20071000', 'NOBLE KESAR', 'नोबेल केसर', 1, 0, 0, -1, 0, 0, 98.00, 120.00, 180.00, 110.00, 0.00, 0.00, 'LTR', 12.00),
(758, NULL, '20019000', 'SV LIMBU 1KG', 'SV लिंबू 1KG', 1, 0, 0, 0, 0, 0, 114.00, 120.00, 160.00, 0.00, 0.00, 0.00, 'KG', 12.00),
(759, NULL, '20071000', 'NOBLE KHUS', 'नोबल खुस ', 1, 0, 0, 0, 0, 0, 91.00, 110.00, 160.00, NULL, 0.00, 0.00, 'LTR', 12.00),
(760, NULL, '20019000', 'SV MANGO 1kg', 'SV अंबा 1kg', 1, 0, 0, -1, 0, 0, 104.00, 120.00, 149.00, 0.00, 0.00, 0.00, 'KG', 12.00),
(761, NULL, '20019000', 'SV MANGO 500gm', 'SV अंबा 500gm', 1, 0, 0, 0, 0, 0, 61.00, 70.00, 85.00, 0.00, 0.00, 0.00, 'GRM', 12.00),
(762, NULL, '20019000', 'SV MANGO 200gm', 'SV अंबा 200gm', 1, 0, 0, 1, 0, 0, 33.00, 40.00, 45.00, 0.00, 0.00, 0.00, 'GRM', 12.00),
(763, NULL, '20019000', 'SV MIRCHI 500gm', 'SV मिरची 500GM', 1, 0, 0, 0, 0, 0, 61.00, 70.00, 85.00, 0.00, 0.00, 0.00, 'GRM', 12.00),
(764, NULL, '20019000', 'SV MIRCHI 200gm', 'SV मिरची 200GM', 1, 0, 0, 0, 0, 0, 33.30, 40.00, 45.00, 0.00, 0.00, 0.00, 'GRM', 12.00),
(765, NULL, '20019000', 'SV MIRCHI 1KG', 'SV मिरची 1KG', 1, 0, 0, 0, 0, 0, 114.00, 120.00, 160.00, 0.00, 0.00, 0.00, 'KG', 12.00),
(766, NULL, '20019000', 'SV MIX 1KG', 'SV मिक्स 1KG', 1, 0, 0, 0, 0, 0, 114.00, 120.00, 160.00, 0.00, 0.00, 0.00, 'KG', 12.00),
(767, NULL, '20019000', 'SV MIX 500GM', 'SV मिक्स 500GM', 1, 0, 0, 0, 0, 0, 61.00, 70.00, 85.00, 0.00, 0.00, 0.00, 'GRM', 12.00),
(768, NULL, '20071000', 'NOBLE KOKUM', 'नोबेल कोकम', 1, 0, 0, 0, 0, 0, 91.00, 110.00, 160.00, NULL, 0.00, 0.00, 'LTR', 12.00),
(769, NULL, '20019000', 'SV MIX 200gm', 'SV मिक्स 200gm', 1, 0, 0, 0, 0, 0, 33.30, 40.00, 45.00, 0.00, 0.00, 0.00, 'GRM', 12.00),
(770, NULL, '20089912', 'NOBLE LEMON', 'नोबेल लेमन', 1, 0, 0, 0, 0, 0, 91.00, 110.00, 160.00, NULL, 0.00, 0.00, 'LTR', 12.00),
(771, NULL, '20089919', 'NOBLE MOJITO', 'नोबेल मोजिटो', 1, 0, 0, -2, 0, 0, 160.00, 180.00, 285.00, 170.00, 0.00, 0.00, 'LTR', 12.00),
(772, NULL, '20019000', 'SV MANGO 5KG', 'SV मॅंगो 5 KG ', 1, 0, 0, 0, 0, 0, 205.00, 240.00, 575.00, 220.00, 0.00, 0.00, 'KG', 12.00),
(773, NULL, '20089913', 'NOBLE ORANGE', 'नोबेल ऑरेंज', 1, 0, 0, 0, 0, 0, 91.00, 110.00, 160.00, NULL, 0.00, 0.00, 'LTR', 12.00),
(774, NULL, '20089914', 'NOBLE PINEAPLE', 'नोबेल पाइनएप्पल', 1, 0, 0, -1, 0, 0, 91.00, 110.00, 160.00, NULL, 0.00, 0.00, 'LTR', 12.00),
(775, NULL, '20071000', 'NOBLE SIKANJBI', 'नोबेल सिकंबी', 1, 0, 0, 0, 0, 0, 91.00, 110.00, 160.00, NULL, 0.00, 0.00, 'LTR', 12.00),
(776, NULL, '20071000', 'NOBLE STRAWBERRY', 'नोबेल स्ट्रॉबेरी', 1, 0, 0, 0, 0, 0, 91.00, 110.00, 160.00, NULL, 0.00, 0.00, 'LTR', 12.00),
(777, NULL, '11063090', 'TALOD KHAMAN 200', 'तलोद खमन 200GM ', 1, 0, 0, -2, 0, 0, 36.63, 43.00, 45.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(779, NULL, '21069099', 'TALOD KHAMAN 500GM', 'तलोद खमन 500gm', 1, 0, 0, -1, 0, 0, 80.00, 85.00, 90.00, NULL, 0.00, 0.00, 'GRM', 18.00),
(780, NULL, '01902', 'NOODEL BOX', 'नूडल बोक्स', 1, 0, 0, -1, 0, 0, 140.00, 140.00, 0.00, NULL, 0.00, 0.00, 'BOX', 18.00),
(781, NULL, '21069099', 'TALOD KHAMAN 1KG', 'तलोद खमण 1KG', 1, 0, 0, 0, 0, 0, 165.00, 165.00, 176.00, NULL, 0.00, 0.00, 'KG', 18.00),
(782, NULL, '01902', 'NOODLE ', 'नुडल', 1, 0, 0, -1, 0, 0, 0.00, 6.00, 0.00, 0.00, 0.00, 0.00, 'PKT', 18.00),
(783, NULL, '01902', 'NOODLE FRY', 'फ्राई नुडल', 1, 0, 0, -1, 0, 0, 80.00, 80.00, 0.00, NULL, 0.00, 0.00, 'KG', 18.00),
(784, NULL, '19041010', 'OATS QUAKER 1.5 KG', 'क्वेकर ओटस 1.5KG', 1, 0, 0, 0, 0, 0, 240.00, 240.00, 260.00, NULL, 0.00, 0.00, 'KG', 18.00),
(785, NULL, '19041010', 'OATS QUAKER 1 KG', 'क्वेकर ओट्स 1KG', 1, 0, 0, 0, 0, 0, 160.00, 160.00, 190.00, NULL, 0.00, 0.00, 'KG', 18.00),
(786, NULL, '1511', 'OIL RAI 1LTR', 'राइ तेल 1 LTR', 1, 0, 0, -1, 0, 0, 120.00, 120.00, 0.00, NULL, 0.00, 0.00, 'LTR', 5.00),
(787, NULL, '1511', 'OIL TIL 1LTR', 'तेल तिल 1 LTR', 1, 0, 0, 0, 0, 0, 140.00, 140.00, 0.00, NULL, 0.00, 0.00, 'LTR', 5.00),
(788, NULL, '10082039', 'KANG', 'कांग', 1, 0, 0, 0, 0, 0, 44.00, 60.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(789, NULL, '19041020', 'KANHAIYA MAMRA', 'कन्हैया कुरमुरा 500GM', 1, 6, 0, 0, 0, 0, 22.00, 30.00, 0.00, 0.00, 0.00, 0.00, 'PKT', 0.00),
(790, NULL, '9109100', 'KAPOL BHELPURI 100GM', 'कपोल भेलपूरी 100GM', 1, 0, 0, 0, 0, 0, 37.00, 40.00, 45.00, NULL, 0.00, 0.00, 'PKT', 5.00),
(791, NULL, '9109100', 'KAPOL CHAT 100GM', 'कपोल चाट 100GM', 1, 0, 0, 0, 0, 0, 55.00, 65.00, 70.00, NULL, 0.00, 0.00, 'PKT', 5.00),
(792, NULL, '9109100', 'KAPOL CHHAS 100GM', 'कपोल चास 100GM', 1, 0, 0, 0, 0, 0, 48.00, 55.00, 60.00, NULL, 0.00, 0.00, 'PKT', 5.00),
(793, NULL, '9109100', 'KAPOL DABELI', 'कपोल दाबेली', 1, 0, 0, 0, 0, 0, 40.00, 45.00, 50.00, NULL, 0.00, 0.00, 'PKT', 5.00),
(794, NULL, '910', 'KAPOL FRANKIE', 'कपोल फ्रँकि', 1, 0, 0, -1, 0, 0, 50.00, 55.00, 60.00, NULL, 0.00, 0.00, 'PCS', 5.00),
(795, NULL, '910', 'KAPOL JAIN NOODLE ', 'कपोल जैन नूडल ', 1, 0, 0, 0, 0, 0, 40.00, 40.00, 45.00, NULL, 0.00, 0.00, 'PKT', 5.00),
(796, NULL, '9109100', 'KAPOL JAIN PIZZA ', 'कपोल जैन पिज़्ज़ा ', 1, 0, 0, 0, 0, 0, 55.00, 63.00, 68.00, NULL, 0.00, 0.00, 'PKT', 5.00),
(797, NULL, '910', 'KAPOL MIXED HERBS', 'कपोल मिक्स हब्स', 1, 0, 0, 0, 0, 0, 55.00, 65.00, 70.00, NULL, 0.00, 0.00, 'PKT', 5.00),
(798, NULL, '910', 'KAPOL NOODLE 100GM', 'कपोल नुडल 100GM', 1, 0, 0, 0, 0, 0, 40.00, 40.00, 45.00, NULL, 0.00, 0.00, 'PKT', 5.00),
(799, NULL, '9109100', 'KAPOL PASTA', 'कपोल पास्ता मसाला', 1, 0, 0, 0, 0, 0, 38.00, 45.00, 50.00, NULL, 0.00, 0.00, 'PKT', 5.00),
(800, NULL, '20071000', 'MPR AWLA-GIN', 'मेपरो अवला-जिंजर', 1, 0, 0, 0, 0, 0, 120.00, 120.00, 144.00, NULL, 0.00, 0.00, 'LTR', 28.00),
(801, NULL, '910', 'KAPOL PIZZA', 'कपोल पिज़्ज़ा', 1, 0, 0, 0, 0, 0, 48.00, 55.00, 60.00, NULL, 0.00, 0.00, 'PKT', 5.00),
(802, NULL, '9109100', 'KAPOL SANDWICH 100GM', 'कपोल सैंडविच 100GM', 1, 0, 0, 0, 0, 0, 67.00, 75.00, 80.00, 0.00, 0.00, 0.00, 'PKT', 5.00),
(803, NULL, '9109100', 'KAPOL USAL', 'कपोल उसल', 1, 0, 0, 0, 0, 0, 40.00, 45.00, 50.00, NULL, 0.00, 0.00, 'PKT', 5.00),
(804, NULL, '9109100', 'KAPOL FRANKIE 1KG', 'कपोल फ्रंकी 1KG', 1, 0, 0, 0, 0, 0, 344.00, 380.00, 500.00, NULL, 0.00, 0.00, 'KG', 5.00),
(805, NULL, '20071000', 'MPR CUSTARD APPLE', 'मेपरो कस्टर्ड एप्पल', 1, 0, 0, 0, 0, 0, 160.00, 160.00, 180.00, NULL, 0.00, 0.00, 'LTR', 12.00),
(806, NULL, '20071000', 'MPR GUVA CRSH', 'मेपरो गुवा', 1, 0, 0, 0, 0, 0, 120.00, 120.00, 126.00, NULL, 0.00, 0.00, 'LTR', 12.00),
(807, NULL, '2914', 'KAPOOR', 'कपूर', 1, 0, 0, 0, 0, 0, 1040.00, 1040.00, 0.00, NULL, 0.00, 0.00, 'KG', 18.00),
(808, NULL, '20071000', 'MPR JEERA-SODA', 'मेपरो जीरा सोडा', 1, 0, 0, 0, 0, 0, 120.00, 120.00, 144.00, NULL, 0.00, 0.00, 'LTR', 12.00),
(809, NULL, '20071000', 'MPR KIWI', 'मेपरो कीवी', 1, 0, 0, 0, 0, 0, 160.00, 160.00, 180.00, NULL, 0.00, 0.00, 'LTR', 12.00),
(810, NULL, '20071000', 'MPR KOKUM', 'मेपरो कोकम', 1, 0, 0, 0, 0, 0, 120.00, 120.00, 126.00, NULL, 0.00, 0.00, 'LTR', 12.00),
(811, NULL, '20071000', 'MPR LEM-GIN', 'मेपरो लेमन-जिंजर', 1, 0, 0, -1, 0, 0, 120.00, 120.00, 0.00, NULL, 0.00, 0.00, 'LTR', 12.00),
(812, NULL, '20071000', 'MPR LEMON-BARLEY', 'मेपरो लेमन-बारली', 1, 0, 0, 0, 0, 0, 120.00, 120.00, 1441.00, NULL, 0.00, 0.00, 'LTR', 12.00),
(813, NULL, '20071000', 'MPR LIMBU-TIMBU', 'मेपरो लिम्बू-तिमबू', 1, 0, 0, 0, 0, 0, 120.00, 120.00, 144.00, NULL, 0.00, 0.00, 'LTR', 12.00);
INSERT INTO `productmaster` (`prodid_`, `prodid`, `hsn`, `prodname`, `prodname_hindi`, `shopid`, `wstock`, `dstock`, `lstock`, `totalstock`, `today_opening`, `pprice`, `uprice`, `wprice`, `bsprice`, `stock`, `rstock`, `unit`, `gstper`) VALUES
(814, NULL, '20071000', 'MPR LITCHI CRSH ', 'मेपरो लीची कर्ष ', 1, 0, 0, 0, 0, 0, 120.00, 120.00, 144.00, NULL, 0.00, 0.00, 'LTR', 12.00),
(815, NULL, '20071000', 'MPR MANGO CRSH', 'मेपरो मेंगो', 1, 0, 0, 0, 0, 0, 120.00, 120.00, 126.00, NULL, 0.00, 0.00, 'LTR', 12.00),
(816, NULL, '20071000', 'MPR ORANGE CRSH', 'मेपरो ऑरेंज', 1, 0, 0, 0, 0, 0, 120.00, 120.00, 144.00, NULL, 0.00, 0.00, 'LTR', 12.00),
(817, NULL, '20071000', 'MPR PINEAPPLE', 'मेपरो पाइनएप्पल', 1, 0, 0, 0, 0, 0, 120.00, 120.00, 144.00, NULL, 0.00, 0.00, 'LTR', 12.00),
(818, NULL, '20071000', 'MPR ROSE', 'मपरो रोज', 1, 0, 0, 0, 0, 0, 120.00, 120.00, 144.00, NULL, 0.00, 0.00, 'LTR', 12.00),
(819, NULL, '2103', 'SAUCE DELEMONTE 1KG', 'डेलमोंटे सॉस 1KG', 1, 0, 0, -1, 0, 0, 49.10, 70.00, 125.00, NULL, 0.00, 0.00, 'KG', 12.00),
(820, NULL, '20071000', 'MPR STRAW CRSH', 'मेपरो स्ट्रॉबेरी', 1, 0, 0, 0, 0, 0, 120.00, 120.00, 144.00, NULL, 0.00, 0.00, 'LTR', 12.00),
(821, NULL, '21032000', 'SAUCE KISSAN POUCH 2KG', 'किसान पाउच 2kg', 1, 0, 0, -2, 0, 0, 190.00, 200.00, 250.00, NULL, 0.00, 0.00, 'LTR', 12.00),
(822, NULL, '2103', 'SAUCE MAGGI JAIN 1KG', 'जैन मैगी सॉस 1kg', 1, 0, 0, 0, 0, 0, 130.00, 130.00, 0.00, NULL, 0.00, 0.00, 'LTR', 12.00),
(823, NULL, '20071000', 'MPR VARIYALI', 'मेपरो वरियाली', 1, 0, 0, 0, 0, 0, 120.00, 120.00, 0.00, NULL, 0.00, 0.00, 'LTR', 12.00),
(824, NULL, '2103', 'SAUCE MAGGI TOMATO', 'सॉस मग्गी टोमेटो', 1, 0, 0, 0, 0, 0, 100.00, 100.00, 0.00, NULL, 0.00, 0.00, 'LTR', 12.00),
(825, NULL, '2103', 'SAUCE PIZZA & PASTA ', 'सॉस पिज्ज़ा पास्ता 1kg', 1, 0, 0, 0, 0, 0, 200.00, 200.00, 0.00, NULL, 0.00, 0.00, 'LTR', 12.00),
(826, NULL, '2103', 'SURBHI SAUCE POUCH 1KG', 'सॉस सुरभि जैन पाउच', 1, 0, 0, -3, 0, 0, 65.00, 75.00, 125.00, NULL, 0.00, 0.00, 'LTR', 8.00),
(827, NULL, '2103', 'SURBHI SEJWAN', 'जैन सेजवान 250GM', 1, 0, 0, 0, 0, 0, 50.50, 60.00, 70.00, 0.00, 0.00, 0.00, 'PKT', 12.00),
(828, NULL, '2103', 'SURBHI JAIN REDCHILLY', 'सुरभि जैन रेडचिल्ली सॉस ', 1, 0, 0, 0, 0, 0, 36.00, 45.00, 69.00, 0.00, 0.00, 0.00, 'GRM', 12.00),
(829, NULL, '2103', 'SAUCE TOMATO 5LTR.', 'टमाटर सॉस 5LTR', 1, 0, 0, 0, 0, 0, 90.00, 90.00, 0.00, NULL, 0.00, 0.00, 'LTR', 12.00),
(830, NULL, '33021010', 'ESS', 'येसन्स', 1, 0, 0, -3, 0, 0, 20.00, 20.00, 0.00, NULL, 0.00, 0.00, 'PKT', 18.00),
(831, NULL, '20019000', 'PRAVIN LIMBU 200 GM', 'प्रवीन लिम्बू 200GM', 1, 0, 0, 0, 0, 0, 44.00, 44.00, 50.00, NULL, 0.00, 0.00, 'GRM', 12.00),
(832, NULL, '20019000', 'PRAVIN LIMBU 500 GM', 'प्रवीन लिम्बू 500 GM', 1, 0, 0, 0, 0, 0, 80.00, 80.00, 0.00, NULL, 0.00, 0.00, 'GRM', 12.00),
(833, NULL, '20019000', 'PRAVIN LIMBU 1KG', 'प्रवीण लिम्बू  1 KG', 1, 0, 0, 0, 0, 0, 140.00, 140.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(834, NULL, '20019000', 'PRAVIN MANGO 200GM', 'प्रवीन मांगो 200GM', 1, 0, 0, 0, 0, 0, 40.00, 40.00, 0.00, NULL, 0.00, 0.00, 'GRM', 12.00),
(835, NULL, '20019000', 'PRAVIN MANGO 500GM', 'प्रवीन मांगो 500GM', 1, 0, 0, 0, 0, 0, 80.00, 80.00, 85.00, NULL, 0.00, 0.00, 'GRM', 12.00),
(836, NULL, '20019000', 'PRAVIN MANGO 1KG', 'प्रवीन मांगो 1kg', 1, 0, 0, 0, 0, 0, 130.00, 130.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(837, NULL, '20019000', 'PRAVIN MIRCHI 200 GM', 'प्रवीन मिरची 200 GM', 1, 0, 0, 0, 0, 0, 40.00, 40.00, 0.00, NULL, 0.00, 0.00, 'GRM', 12.00),
(838, NULL, '20019000', 'PRAVIN MIRCHI 500 GM', 'प्रवीन मिरची 500  GM', 1, 0, 0, 0, 0, 0, 80.00, 80.00, 80.00, NULL, 0.00, 0.00, 'GRM', 12.00),
(839, NULL, '910', 'KANDA POWDER 100gm', 'कांदा पावडर 100GM', 1, 0, 0, 0, 0, 0, 40.00, 40.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(840, NULL, '20019000', 'PRAVIN MIX 200 GM', 'प्रवीन मिक्स 200GM', 1, 0, 0, 0, 0, 0, 50.00, 50.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(842, NULL, '20019000', 'PRAVIN MIX 500GM', 'प्रवीन मिक्स 500 GM', 1, 0, 0, 0, 0, 0, 70.00, 70.00, 0.00, NULL, 0.00, 0.00, 'GRM', 12.00),
(843, NULL, '20019000', 'PRAVIN MIX 1 KG', 'प्रवीन मिक्स 1 kg', 1, 0, 0, 0, 0, 0, 140.00, 140.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(844, NULL, '910', 'CHEESE MASALA 100 GM ', 'चीज मसाला 100GM', 1, 0, 0, 0, 0, 0, 60.00, 60.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(845, NULL, '910', 'MAGGIE MASALA 100gm', 'मग्गी मसाला 100GM', 1, 0, 0, -1, 0, 0, 60.00, 60.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(846, NULL, '910', 'SEJWAN MASALA 100gm', 'सेजवान मसाला 100gm', 1, 0, 0, 0, 0, 0, 60.00, 60.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(847, NULL, '910', 'PERI PERI MASALA 100gm', 'पेरी पेरी मसाला 100gm', 1, 0, 0, 0, 0, 0, 60.00, 60.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(848, NULL, '04090000', 'HIMALAYA HONEY 225GM', 'हिमालया मध 225GM', 1, 0, 0, 0, 0, 0, 45.23, 55.00, 115.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(849, NULL, '04090000', 'HIMALAYA HONEY 1KG', 'हिमालया मध 1KG', 1, 0, 0, 0, 0, 0, 171.42, 200.00, 390.00, NULL, 0.00, 0.00, 'KG', 5.00),
(850, NULL, '04090000', 'HIMALAYA HONEY 500GM', 'हिमालया मध 500gm', 1, 0, 0, 0, 0, 0, 0.00, 110.00, 220.00, 0.00, 0.00, 0.00, 'GRM', 5.00),
(851, NULL, '21039020', 'SARWAR GREEN CHILLI', 'सरवर ग्रीन चिल्ली', 1, 0, 0, 0, 0, 0, 27.00, 35.00, 60.00, NULL, 0.00, 0.00, 'LTR', 12.00),
(852, NULL, '21039020', 'SARWAR RED CHILLI', 'सरवर रेड चिल्ली', 1, 0, 0, 0, 0, 0, 27.00, 35.00, 60.00, NULL, 0.00, 0.00, 'LTR', 12.00),
(853, NULL, '21039020', 'SARWAR SOYA SAUCE', 'सरवर सोया सॉस', 1, 0, 0, 0, 0, 0, 27.00, 35.00, 60.00, NULL, 0.00, 0.00, 'LTR', 12.00),
(854, NULL, '2106', 'FIVESTAR COCO POWDER', 'फाइवस्टार कोको पाउडर', 1, 0, 0, 0, 0, 0, 39.00, 50.00, 55.00, 0.00, 0.00, 0.00, 'PKT', 28.00),
(855, NULL, '2106', 'FIVESTAR CORNFLOUR 500GM', 'फाइव स्टार कॉर्नफ्लौर 500gm', 1, 0, 0, -1, 0, 0, 34.00, 50.00, 60.00, 40.00, 0.00, 0.00, 'GRM', 28.00),
(856, NULL, '2106', 'FIVESTAR CUSTARD 200gm', 'फाइवस्टार कस्टर्ड पाउडर 200gm', 1, 0, 0, 0, 0, 0, 23.50, 35.00, 40.00, 0.00, 0.00, 0.00, 'PKT', 28.00),
(859, NULL, '21031000', 'SAUCE VICTORY TOMOTO 5LTR', 'सॉस विकटरी टोमोटो  5LTR', 1, 0, 0, 0, 0, 0, 240.00, 240.00, 0.00, NULL, 0.00, 0.00, 'LTR', 12.00),
(860, NULL, '2106', 'FIVESTAR CUSTARD 500GM', 'फाइवस्टार कस्टर्ड पाउडर 500gm', 1, 0, 0, -1, 0, 0, 40.00, 55.00, 70.00, 45.00, 0.00, 0.00, 'GRM', 28.00),
(861, NULL, '21031000', 'SAUCE RED CHILLI 5LTR', 'रेड चिल्ली सॉस 5KG ', 1, 0, 0, 0, 0, 0, 90.00, 90.00, 0.00, NULL, 0.00, 0.00, 'LTR', 12.00),
(862, NULL, '2106', 'FIVESTAR CORNFLOUR 100GM', 'फाइवस्टार कॉर्नफ्लौर 100GM', 1, 0, 0, 0, 0, 0, 13.00, 20.00, 22.00, 18.00, 0.00, 0.00, 'GRM', 28.00),
(863, NULL, '2106', 'FIVESTAR CORNFLOUR 1KG', 'फाइवस्टार कोनफ्लौर1kg', 1, 0, 0, 0, 0, 0, 50.00, 75.00, 85.00, 60.00, 0.00, 0.00, 'GRM', 28.00),
(864, NULL, '21031000', 'SAUCE SOYA 5LTR', 'सोया सॉस 5LTR', 1, 0, 0, 0, 0, 0, 0.00, 90.00, 0.00, 0.00, 0.00, 0.00, 'LTR', 12.00),
(865, NULL, '2106', 'FIVESTAR CORNFLOUR 200GM', 'फाइवस्टार कॉर्नफ्लोर 200GM', 1, 0, 0, -2, 0, 0, 18.00, 28.00, 30.00, 25.00, 0.00, 0.00, 'GRM', 28.00),
(866, NULL, '2106', 'FIVESTAR CUSTARD 100GM', 'फाइवस्टार कस्टर्ड पाउडर 100gm', 1, 0, 0, -3, 0, 0, 14.60, 20.00, 25.00, 0.00, 0.00, 0.00, 'PKT', 28.00),
(867, NULL, '2106', 'FIVESTAR CUSTARD 1KG', 'फाइवस्टार कस्टर्ड पाउडर 1kg', 1, 0, 0, -2, 0, 0, 62.00, 80.00, 110.00, 70.00, 0.00, 0.00, 'PCS', 18.00),
(870, NULL, '2106', 'FIVESTAR VEG JELLY 100GM', 'फाइवस्टार VEG जेली 100gm', 1, 0, 0, 0, 0, 0, 25.00, 30.00, 35.00, 0.00, 0.00, 0.00, 'PKT', 28.00),
(871, NULL, '2106', 'FIVESTAR MILK JELLY', 'फाइवस्टार मिल्क जेली 50gm', 1, 0, 0, 0, 0, 0, 64.00, 90.00, 95.00, 80.00, 0.00, 0.00, 'PKT', 28.00),
(872, NULL, '19021900', 'BAMBINO SEV 150GM', 'बोबिनो सेव 150GM', 1, 0, 0, 0, 0, 0, 13.00, 15.00, 16.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(873, NULL, '19021900', 'BAMBINO SEV 1KG', 'बोबिनो सेव 1KG', 1, 0, 0, 0, 0, 0, 67.00, 80.00, 85.00, NULL, 0.00, 0.00, 'KG', 5.00),
(874, NULL, '19021900', 'BAMBINO SEV 400gm', 'बोबिनो सेव 400GM', 1, 0, 0, 0, 0, 0, 39.50, 40.00, 45.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(875, NULL, '09109100', 'BEDEKAR MASALA', 'बेडेकर मसाला', 1, 0, 0, 0, 0, 0, 36.00, 45.00, 55.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(876, NULL, '910', 'BEDEKAR CHAKALI MASALA (50GM)', 'बेडेकर चकली मसाला (50GM)', 1, 0, 0, 0, 0, 0, 22.00, 22.00, 28.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(877, NULL, '910', 'BEDEKAR CHIVADA MASALA (50GM)', 'बेडेकर चिवडा मसाला(50GM)', 1, 0, 0, 0, 0, 0, 20.00, 20.00, 25.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(878, NULL, '910', 'BERDA', 'भेरडा', 1, 0, 0, 0, 0, 0, 160.00, 160.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(879, NULL, '910', 'BILAMA', 'बिलामा', 1, 0, 0, 0, 0, 0, 0.00, 80.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(880, NULL, '1516', 'DALDA RUCHI', 'रूचि डालडा ', 1, 0, 0, 0, 0, 0, 0.00, 90.00, 100.00, NULL, 0.00, 0.00, 'LTR', 5.00),
(881, NULL, '1516', 'DALDA RUCHI 500GM', 'रूचि डालडा 500GM', 1, 0, 0, 0, 0, 0, 45.00, 45.00, 60.00, NULL, 0.00, 0.00, 'LTR', 5.00),
(882, NULL, '1516', 'DALDA GODREJ', 'गोदरेज डालडा', 1, 0, 0, 0, 0, 0, 96.00, 96.00, 0.00, NULL, 0.00, 0.00, 'LTR', 5.00),
(883, NULL, '1704', 'DRINKING CHOCOLATE', 'ड्रिकिंग चॉकलेट', 1, 0, 0, 0, 0, 0, 280.00, 280.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(884, NULL, '19021900', 'FALUDA', ' फालूदा पाकेट', 1, 0, 0, -4, 0, 0, 30.00, 30.00, 65.00, NULL, -2.00, 0.00, 'PKT', 5.00),
(885, NULL, '19021900', 'FALUDA SEV', 'फालूदा सेव पैकेट', 1, 0, 0, 0, 0, 0, 20.00, 20.00, 0.00, NULL, 0.00, 0.00, 'PKT', 5.00),
(886, NULL, '910', 'FATKARI', 'फटकी', 1, 0, 0, 0, 0, 0, 19.00, 40.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(887, NULL, '1203', 'KHAMAN K.K', 'K.K खमण', 1, 1, 0, -1, 0, 0, 160.00, 240.00, 0.00, 200.00, 0.00, 0.00, 'KG', 5.00),
(888, NULL, '12030000', 'KHAMAN A1 SWAD', 'स्वाद खमण', 1, 5, 0, 0, 0, 0, 200.00, 280.00, 0.00, 240.00, 0.00, 0.00, 'KG', 5.00),
(889, NULL, '12030000', 'KHAMAN SALI', 'सलीखमण', 1, 0, 0, -1, 0, 0, 190.00, 240.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(890, NULL, '910', 'KHURSHANI', 'खुरशानी', 1, 0, 0, 0, 0, 0, 120.00, 120.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(891, NULL, '910', 'SUNTH DELI', 'दिली सुंठ', 1, 0, 0, 0, 0, 0, 1000.00, 1000.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(892, NULL, '910', 'DIKA MALI', 'डिकामाली', 1, 0, 0, 0, 0, 0, 480.00, 480.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(893, NULL, '910', 'DHOOP KHADA R', 'R धुप खडा', 1, 0, 0, 0, 0, 0, 320.00, 320.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(894, NULL, '910', 'DHOOP KANI', 'धुप कनी', 1, 0, 0, 0, 0, 0, 280.00, 280.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(895, NULL, '12079940', 'KOKAM FLOWER', 'कोकमफुल', 1, 0, 0, 0, 0, 0, 483.00, 600.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(896, NULL, '910', 'KOLJAN', 'कोलजन', 1, 0, 0, 0, 0, 0, 400.00, 400.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(898, NULL, '09083120', 'ELACHI DHAGI STAR17', 'स्टार दाघी एलची', 1, 0, 10, 0, 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(899, NULL, '09083120', 'ELACHI MALBAR', 'मलबार एलाची ', 1, 0, 25, 6, 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(900, NULL, '09083120', 'ELACHI AISHWARYA DAGHI', 'ऐश्वर्या दाघी एलची ', 1, 0, 5, 0, 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(901, NULL, '3304', 'ENO', 'इनो', 1, 0, 0, 0, 0, 0, 88.00, 100.00, 110.00, NULL, 0.00, 0.00, 'PCS', 0.00),
(902, NULL, '2103909', 'SAUCE AATISH PIZZA PASTA ', 'आतीश पिज्जा पास्ता सॉस 1kg ', 1, 0, 0, 0, 0, 0, 160.71, 200.00, 225.00, NULL, 0.00, 0.00, 'KG', 12.00),
(903, NULL, '2103909', 'SAUCE AATISH SEJWAN ', 'आतिश सेजवान ', 1, 0, 0, 0, 0, 0, 160.71, 200.00, 225.00, NULL, 0.00, 0.00, 'KG', 12.00),
(904, NULL, '1701', 'SUGAR KHAND DESHI', 'देसी खांड', 1, 0, 0, 0, 0, 0, 48.00, 70.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(905, NULL, '0910', 'MUKHWAS CHANDAN 5 In 1', '5 in 1 चंदन मुखवास', 1, 0, 0, 0, 0, 0, 182.00, 200.00, 260.00, NULL, 0.00, 0.00, 'PKT', 5.00),
(906, NULL, '19053100', 'KARACHI FRUIT BISCUITS 400GM', 'कराची फ्रूट बिसकुइट्स 400GM', 1, 0, 0, 0, 0, 0, 142.00, 160.00, 170.00, NULL, 0.00, 0.00, 'BOX', 18.00),
(907, NULL, '19053100', 'KARACHI FRUIT BISCUITS 200gm', 'कराची फ्रूट बिसकुइट्स 200GM', 1, 0, 0, 0, 0, 0, 75.00, 85.00, 90.00, NULL, 0.00, 0.00, 'BOX', 18.00),
(908, NULL, '19053100', 'KARACHI CASHEW BISCUITS 400GM', 'कराची काजू बिसकुइट्स 400GM', 1, 0, 0, 0, 0, 0, 159.00, 180.00, 190.00, NULL, 0.00, 0.00, 'BOX', 18.00),
(909, NULL, '19053100', 'KARACHI CASHEW BISCUITS 200GM', 'कराची काजू बिसकुइट्स 200GM', 1, 0, 0, 0, 0, 0, 79.00, 90.00, 95.00, NULL, 0.00, 0.00, 'BOX', 18.00),
(910, NULL, '19053100', 'KARACHI PISTA BISCUITS 400GM', 'कराची पिस्ता बिसकुइट्स 400GM', 1, 0, 0, 0, 0, 0, 150.00, 170.00, 180.00, NULL, 0.00, 0.00, 'BOX', 18.00),
(911, NULL, '1704', 'HERSHEYS CHOCOLATE SYRUP', 'चॉकलेट सिरप', 1, 0, 0, 58, 0, 0, 149.00, 170.00, 200.00, 0.00, 0.00, 0.00, 'LTR', 0.00),
(912, NULL, '19053100', 'KARACHI PISTA BISCUITS 200GM', 'कराची पिस्ता बिसकुइट्स 200GM', 1, 0, 0, 0, 0, 0, 75.00, 85.00, 90.00, NULL, 0.00, 0.00, 'BOX', 18.00),
(913, NULL, '19053100', 'KARACHI CHOCOLATE 200GM', 'कराची चॉकलेट 200GM', 1, 0, 0, 0, 0, 0, 79.00, 90.00, 95.00, NULL, 0.00, 0.00, 'BOX', 18.00),
(914, NULL, '19053100', 'KARACHI OSMANIYA 400GM', 'कराची ओसमानिय 400GM', 1, 0, 0, 0, 0, 0, 125.00, 140.00, 150.00, NULL, 0.00, 0.00, 'BOX', 18.00),
(915, NULL, '19053100', 'KARACHI BADAM PISTA 400GM', 'कराची बदाम पिस्ता 400GM', 1, 0, 0, 0, 0, 0, 216.00, 240.00, 260.00, NULL, 0.00, 0.00, 'BOX', 18.00),
(916, NULL, '20079990', 'GURUJI THANDAI', 'गुरूजी ठंडाई', 1, 0, 0, -6, 0, 0, 276.00, 300.00, 325.00, NULL, 0.00, 0.00, 'LTR', 12.00),
(917, NULL, '19021900', 'SEV ROSTED 500GM', 'सेकेला सेव 500GM ', 1, 0, 0, 0, 0, 0, 27.00, 40.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(918, NULL, '19021900', 'SEV ROSTED 250GM', 'सेकेला सेव 250GM', 1, 0, 0, 0, 0, 0, 14.00, 30.00, 0.00, NULL, 0.00, 0.00, 'PKT', 5.00),
(919, NULL, '19021900', 'SEVINYA KACHI 500GM', 'काची सेव 500GM ', 1, 0, 0, 0, 0, 0, 40.00, 40.00, 0.00, NULL, 0.00, 0.00, 'PKT', 5.00),
(920, NULL, '1905', 'WAFER LAMBI 500GM', 'वेफर लाम्बी 500GM', 1, 0, 0, 0, 0, 0, 0.00, 80.00, 0.00, NULL, 0.00, 0.00, 'GRM', 18.00),
(921, NULL, '1905', 'WAFER MARI 500GM', ' मिरी वेफर 500GM', 1, 0, 0, 0, 0, 0, 0.00, 80.00, 0.00, NULL, 0.00, 0.00, 'GRM', 12.00),
(922, NULL, '1905', 'WAFER TOMATO 500GM', 'टमाटो वेफर 500GM', 1, 0, 0, 0, 0, 0, 0.00, 80.00, 0.00, NULL, 0.00, 0.00, 'GRM', 12.00),
(923, NULL, '1905', 'WAFER YELLOW 500GM', ' पीला वेफर 500GM', 1, 0, 0, 0, 0, 0, 0.00, 80.00, 0.00, NULL, 0.00, 0.00, 'GRM', 12.00),
(924, NULL, '910', 'TOMATO PAWDER 100GM', 'टोमेटो पावडर 100gm', 1, 0, 0, 0, 0, 0, 0.00, 60.00, 0.00, 0.00, 0.00, 0.00, 'PKT', 5.00),
(925, NULL, '1905', 'CHAKLI SHEJWAN 500GM', 'चकली शेजवान 500GM', 1, 0, 0, 0, 0, 0, 0.00, 70.00, 0.00, NULL, 0.00, 0.00, 'GRM', 12.00),
(926, NULL, '1905', 'CHAKLI TOMOTO 500GM', 'चकली टोमोटो 500GM', 1, 0, 0, 0, 0, 0, 0.00, 70.00, 0.00, NULL, 0.00, 0.00, 'GRM', 12.00),
(927, NULL, '0909', 'MUKHWAS', 'मुखवास ', 1, 0, 0, 10, 0, 0, 40.00, 200.00, 0.00, 160.00, 0.00, 0.00, 'KG', 5.00),
(928, NULL, '0909', 'MUKHWAS DILKHUSH ANARDANA ', 'दिलखुश अनारदाना', 1, 0, 0, 0, 0, 0, 180.00, 180.00, 360.00, NULL, 0.00, 0.00, 'KG', 5.00),
(929, NULL, '0909', 'MUKHWAS 100gm', 'मुखवास 100gm', 1, 0, 0, 0, 0, 0, 0.00, 30.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(930, NULL, '2101', 'NESCOFFE 50GM', 'नेसकॉफ़ी 50GM', 1, 0, 0, 0, 0, 0, 0.00, 130.00, 135.00, NULL, 0.00, 0.00, 'GRM', 28.00),
(931, NULL, '0813', 'PRUNES', 'प्रुन्स', 1, 0, 0, 0, 0, 0, 400.00, 600.00, 1000.00, NULL, 0.00, 0.00, 'KG', 12.00),
(932, NULL, '02106', 'REVDI', 'रेवड़ी ', 1, 0, 10, 0, 0, 0, 73.00, 100.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(933, NULL, '02106', 'REVDI 250gm', 'रेवड़ी 250GM', 1, 0, 0, 0, 0, 0, 0.00, 30.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(934, NULL, '21061000', 'NAMKEEN ', 'फरसाण ', 1, 0, 0, -6, 0, 0, 0.00, 100.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(935, NULL, '910', 'SHIKAKAI', 'शिकाकाई', 1, 0, 0, 0, 0, 0, 280.00, 280.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(936, NULL, '910', 'SHIKAKAI POWDER', 'शिकाकाई पावडर', 1, 0, 0, 0, 0, 0, 0.00, 280.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(937, NULL, '08134020', 'SHINGODA', 'सिंगोड़ा', 1, 0, 0, 0, 0, 0, 200.00, 240.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(938, NULL, '910', 'SONA MUKHI', 'सोना मुखी', 1, 0, 0, 0, 0, 0, 0.00, 280.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(939, NULL, '32041989', 'SUPARI KACHI', 'काची सोपारी', 1, 0, 0, -1, 0, 0, 0.00, 440.00, 0.00, NULL, 0.00, 0.00, 'KG', 18.00),
(941, NULL, '32041989', 'SUPARI ROASTED', 'सेकेली सोपारी', 1, 0, 0, 0, 0, 0, 0.00, 440.00, 0.00, NULL, 0.00, 0.00, 'KG', 18.00),
(942, NULL, '32041989', 'SUPARI KALKATTA ', 'कलकता सुपारी ', 1, 0, 0, 0, 0, 0, 0.00, 600.00, 0.00, NULL, 0.00, 0.00, 'KG', 18.00),
(943, NULL, '32041989', 'SUPARI KHAJUR', 'खजूर सुपारी ', 1, 0, 0, 0, 0, 0, 0.00, 280.00, 280.00, NULL, 0.00, 0.00, 'KG', 18.00),
(944, NULL, '910', 'VAKUMBA', 'वाकुम्बा', 1, 0, 0, 0, 0, 0, 0.00, 280.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(945, NULL, '25010020', 'MULTANI', 'मुलतानी ', 1, 0, 0, 0, 0, 0, 40.00, 60.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(946, NULL, '25010020', 'MULTANI POWDER', 'मुलतानी पावडर', 1, 0, 0, 0, 0, 0, 0.00, 60.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(947, NULL, '910', 'MURADSHING', 'मुरडशिंग', 1, 0, 0, 0, 0, 0, 0.00, 280.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(948, NULL, '910', 'SEEDS SEVEN', 'सेवन सीड्स', 1, 0, 0, 0, 0, 0, 0.00, 480.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(949, NULL, '3304', 'KUMKUM (PINJAR)', 'कंकू (पिंजर)', 1, 0, 0, 0, 0, 0, 0.00, 80.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(950, NULL, '910', 'SEEDS SEVEN 100GM', 'सेवन सीड्स 100GM', 1, 0, 0, 0, 0, 0, 0.00, 60.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(951, NULL, '07132000', 'ROSE WATER', 'गुलाब पानी', 1, 0, 0, 0, 0, 0, 0.00, 30.00, 0.00, NULL, 0.00, 0.00, 'LTR', 0.00),
(952, NULL, '07132000', 'ROSE WATER 5 LTR', 'गुलाब पानी 5LTR', 1, 0, 0, 0, 0, 0, 0.00, 160.00, 0.00, NULL, 0.00, 0.00, 'LTR', 0.00),
(953, NULL, '07132000', 'KEWDA WATER ', 'केवडा पानी', 1, 0, 0, 0, 0, 0, 0.00, 30.00, 0.00, NULL, 0.00, 0.00, 'LTR', 0.00),
(954, NULL, '910', 'KESAR A1', ' A1 केसर 1GM', 1, 0, 0, -2, 0, 0, 0.00, 100.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(955, NULL, '910', 'KESAR SPAIN', 'केसर स्पेन', 1, 0, 0, 0, 0, 0, 0.00, 400.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(956, NULL, '910', 'KESAR EV', 'EV केसर', 1, 0, 0, 0, 0, 0, 0.00, 250.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(957, NULL, '21061000', 'NAMKEEN 50GM', 'फरसान 500 GM', 1, 0, 0, 0, 0, 0, 0.00, 50.00, 0.00, NULL, 0.00, 0.00, 'GRM', 12.00),
(958, NULL, '21061000', 'NAMKEEN KACHORI  500 GM ', 'कचोरी 500 GM', 1, 0, 0, 0, 0, 0, 0.00, 80.00, 0.00, NULL, 0.00, 0.00, 'GRM', 12.00),
(959, NULL, '2009', 'SHRI JAL', 'श्रीजल', 1, 0, 0, 0, 0, 0, 6.50, 8.00, 0.00, NULL, 0.00, 0.00, 'PCS', 12.00),
(960, NULL, '21061000', 'CUSTARD POWDER', 'कस्टर्ड पाउडर', 1, 0, 0, 0, 0, 0, 0.00, 80.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(961, NULL, '21061000', 'CUSTURD POWDER 250GM', 'कस्टर्ड पाउडर 250gm', 1, 0, 0, 0, 0, 0, 0.00, 30.00, 0.00, NULL, 0.00, 0.00, 'GRM', 12.00),
(962, NULL, '10081090', 'KUTI DARA', 'कुटी दारा', 1, 0, 0, 0, 0, 0, 139.00, 180.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(963, NULL, '20058000', 'SWEET CORN', 'स्वीट कॉर्न', 1, 0, 0, 0, 0, 0, 53.00, 80.00, 85.00, NULL, 0.00, 0.00, 'GRM', 12.00),
(964, NULL, '21069011', 'NOBLE ROSE ', 'नोबेल रोज ', 1, 0, 0, -1, 0, 0, 90.00, 110.00, 160.00, NULL, 0.00, 0.00, 'LTR', 18.00),
(965, NULL, '20019000', 'RB MANGO 1KG', 'RB आम आचार 1kg ', 1, 0, 0, 0, 0, 0, 0.00, 110.00, 125.00, NULL, 0.00, 0.00, 'KG', 12.00),
(966, NULL, '20019000', 'RB MIX 1KG', 'RB मिक्स आचार 1kg', 1, 0, 0, 0, 0, 0, 0.00, 110.00, 125.00, NULL, 0.00, 0.00, 'KG', 12.00),
(967, NULL, '11010000', 'RB PAPAD ATTA 2KG', 'RB पापड आटा 2KG', 1, 0, 0, 0, 0, 0, 0.00, 200.00, 210.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(968, NULL, '1902', 'MOM CHOICE 425GM', 'मोम चॉइस 425gm', 1, 0, 0, 0, 0, 0, 27.42, 45.00, 50.00, NULL, 0.00, 0.00, 'PCS', 5.00),
(970, NULL, '20019000', 'SV CHUNDA 5KG', 'SV चुनदा 5KG', 1, 0, 0, 0, 0, 0, 356.00, 500.00, 620.00, NULL, 0.00, 0.00, 'KG', 12.00),
(971, NULL, '13019013', 'HING VANDEVI B. POWDER 500GM', 'वन नुं 1 का पा 500GM', 1, 0, 0, 0, 0, 0, 257.14, 340.00, 620.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(972, NULL, '13019013', 'HING VANDEVI B. POWDER 100GM', 'वन नुं 1 का पा 100GM', 1, 0, 0, -1, 0, 0, 51.43, 80.00, 124.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(973, NULL, '13019013', 'HING VANDEVI B. POWDER 200GM', 'वन नुं 1 का पा 200GM', 1, 0, 0, 0, 0, 0, 0.00, 160.00, 248.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(974, NULL, '20019000', 'ACHAR KAIRI 2no 5KG', 'आचार कैरी 2no 5 kg', 1, 0, 0, 0, 0, 0, 150.00, 150.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(975, NULL, '13019013', 'HING VANDEVI B. POWDER 50GM', 'वन नुं 1 का पा 50GM', 1, 0, 0, 0, 0, 0, 0.00, 40.00, 62.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(977, NULL, '13019013', 'HING VANDEVI Y. POWDER 100GM', 'वन पि पा 100GM', 1, 0, 0, -7, 0, 0, 0.00, 80.00, 130.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(978, NULL, '13019013', 'HING VANDEVI Y. POWDER 200GM', 'वन पि पा 200GM', 1, 0, 0, 0, 0, 0, 0.00, 160.00, 260.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(980, NULL, '13019013', 'HING VANDEVI Y. POWDER 500GM', 'वन पि पा 500GM', 1, 0, 0, -2, 0, 0, 0.00, 340.00, 650.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(981, NULL, '13019013', 'HING VANDEVI Y. POWDER 50GM', 'वन पि पा 50GM', 1, 0, 0, -3, 0, 0, 0.00, 40.00, 65.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(982, NULL, '9083110', 'ALCHA BHUTAN KALA', 'एलचा भुतान', 1, 0, 0, -2, 0, 0, 0.00, 1200.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(983, NULL, '13019013', 'HING VANDEVI 1KG', 'वनदेवी 1 KG', 1, 0, 0, 0, 0, 0, 0.00, 680.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(984, NULL, '13019013', 'HING VANDEVI KHADA 100GM', 'वन हिंग नुं 1 खड़ा 100GM', 1, 0, 0, 0, 0, 0, 0.00, 100.00, 124.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(985, NULL, '13019013', 'HING VANDEVI KHADA 200GM', 'वन हिंग नुं 1 खड़ा 200GM', 1, 0, 0, 0, 0, 0, 0.00, 180.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(986, NULL, '13019013', 'HING VANDEVI KHADA 500GM', 'वन हिंग नुं 1 खड़ा 500GM', 1, 0, 0, 0, 0, 0, 328.57, 400.00, 520.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(987, NULL, '13019013', 'HING VANDEVI KHADA 50GM', 'वन हिंग नुं खड़ा 50GM', 1, 0, 0, 0, 0, 0, 0.00, 50.00, 52.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(988, NULL, '13019013', 'HING VN 2001 B POWDER 50GM', '  वन नुं 2001 का पा 50GM', 1, 0, 0, 0, 0, 0, 0.00, 45.00, 75.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(989, NULL, '13019013', 'HING VN 2001 B POWDER 100GM', 'वन नुं 2001 का पा 100GM', 1, 0, 0, 0, 0, 0, 0.00, 90.00, 150.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(990, NULL, '13019013', 'HING VN 2001 B POWDER 500GM', 'वन नुं 2001 का पा 500GM', 1, 0, 0, 0, 0, 0, 0.00, 440.00, 780.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(991, NULL, '13019013', 'HING VN 2001 B POWDER 200GM', 'वन नुं 2001 का पा 200GM', 1, 0, 0, 0, 0, 0, 0.00, 180.00, 312.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(992, NULL, '13019013', 'HING VN N0-551 KHADA  50GM', 'वन हिंग नं 551 खडा 50GM', 1, 0, 0, 0, 0, 0, 93.81, 120.00, 148.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(993, NULL, '13019013', 'HING VN N0-551 KHADA 100GM', 'वन हिंग नं 551 खडा 100GM', 1, 0, 0, 0, 0, 0, 187.62, 240.00, 296.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(994, NULL, '13019013', 'HING VN NO-751 KHADA 100GM', 'वन हिंग नु 751 खडा 100GM', 1, 0, 0, 0, 0, 0, 0.00, 280.00, 400.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(995, NULL, '13019013', 'HING VN NO-751 KHADA 50GM', 'वन हिंग नु 751 खडा 50GM', 1, 0, 0, 0, 0, 0, 0.00, 140.00, 200.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(996, NULL, '13019013', 'HING VN 551 KHADA ', 'वन हिंग नुं 551 खड़ा ', 1, 0, 0, 0, 0, 0, 0.00, 2400.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(997, NULL, '13019013', 'HING VN 751 KHADA ', 'वन हिंग नुं 751 खड़ा ', 1, 0, 0, 0, 0, 0, 0.00, 2600.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(998, NULL, '13019013', 'HING ANNAPURNA Y. POWDER 100GM', 'अन्नपूर्णा हिंग पा 100GM', 1, 0, 0, 0, 0, 0, 0.00, 60.00, 84.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(999, NULL, '13019013', 'HING DHANVI WHITE KHADA 100GM', 'हिंग धनवी स. खड़ा 100GM', 1, 0, 0, 0, 0, 0, 0.00, 80.00, 110.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(1000, NULL, '13019013', 'HING DHANVI WHITE KHADA 50GM', 'हिंग धनवी स. खड़ा 50GM', 1, 0, 0, 0, 0, 0, 0.00, 40.00, 55.00, NULL, 0.00, 0.00, 'GRM', 0.00),
(1001, NULL, '13019013', ' HING DHANVI B. POWDER 100GM', 'हिंग धनवी का पा 100GM', 1, 0, 0, 0, 0, 0, 0.00, 60.00, 90.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(1002, NULL, '13019013', 'HING DHANVI B. POWDER 50GM', 'हिंग धनवी का पा 50GM', 1, 0, 0, 0, 0, 0, 0.00, 30.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(1003, NULL, '13019013', 'HING DHANVI Y. POWDER 100GM', ' हिंग धनवी पी पा 100 GM', 1, 0, 0, 0, 0, 0, 0.00, 60.00, 80.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(1004, NULL, '13019013', 'HING DHANVI Y. POWDER 50GM', 'हिंग धनवी पी पा 50GM', 1, 0, 0, 0, 0, 0, 0.00, 30.00, 45.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(1005, NULL, '13019013', 'HING DHANVI Y. POWDER 500GM', '2 हिंग धनवी पी पा 500GM', 1, 0, 0, 0, 0, 0, 0.00, 200.00, 250.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(1006, NULL, '13019013', 'HING LG POWDER 100GM', 'LG पावडर 100GM', 1, 0, 0, -1, 0, 0, 0.00, 120.00, 154.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(1007, NULL, '13019013', 'HING LG POWDER 50GM', 'LG पावडर 50GM', 1, 0, 0, 0, 0, 0, 0.00, 65.00, 79.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(1008, NULL, '2003', 'BAMBOO SHOOT', 'बांबू शूट ', 1, 0, 0, 0, 0, 0, 0.00, 100.00, 126.00, NULL, 0.00, 0.00, 'KG', 12.00),
(1009, NULL, '1701', 'KATERI BARIK', 'काटेरी बारीक ', 1, 0, 0, 0, 0, 0, 0.00, 80.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(1010, NULL, '0401', 'BASUNDI MIX ET. MI 100GM', 'ETMI बासुंदी 100GM', 1, 0, 0, 0, 0, 0, 0.00, 55.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(1011, NULL, '19041010', 'CORN FLACKS 500GM', 'कॉनफेलक्स 500GM', 1, 0, 0, 0, 0, 0, 0.00, 90.00, 0.00, 0.00, 0.00, 0.00, 'PKT', 18.00),
(1012, NULL, '910', 'MASALA CURIY ', 'मसाला करी ', 1, 0, 0, 0, 0, 0, 0.00, 240.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1013, NULL, '13019013', 'HING LG POWDER 500GM', 'LG पावडर 500GM', 1, 0, 0, 0, 0, 0, 0.00, 540.00, 760.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(1014, NULL, '13019013', 'HING LG KHADA 100GM', 'LG हिंग खड़ा 100GM', 1, 0, 0, 0, 0, 0, 0.00, 110.00, 153.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(1015, NULL, '13019013', 'HING NAVJIVAN  B POWDER 100G', 'हिंग नवजीवन का पा 100GM ', 1, 0, 0, 0, 0, 0, 0.00, 70.00, 104.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(1016, NULL, '13019013', 'HING NAVJIVAN P POWDER 100G', 'हिंग नवजीवन पी पा 100GM ', 1, 0, 0, 0, 0, 0, 0.00, 70.00, 100.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(1017, NULL, '13019013', 'HING NAVJIVAN P POWDER 50G', 'हिंग नवजीवन पी पा 50 GM', 1, 0, 0, 0, 0, 0, 0.00, 35.00, 50.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1018, NULL, '13019013', 'HING NAVJIVAN B POWDER 200G', 'हिंग नवजीवन का पा 200GM ', 1, 0, 0, 0, 0, 0, 0.00, 140.00, 215.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(1019, NULL, '13019013', 'HING NAVJIVAN P POWDER 200G', 'हिंग नवजीवन पीला पा 200GM ', 1, 0, 0, 0, 0, 0, 0.00, 140.00, 200.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(1020, NULL, '13019013', 'HING NAVJIVAN  B POWDER 50G', 'हिंग नवजीवन का  पा 50GM', 1, 0, 0, 0, 0, 0, 0.00, 35.00, 44.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(1021, NULL, '13019013', 'HING NAVJIVAN  B POWDER 500G', 'हिंग नवजीवन का पा 500GM', 1, 0, 0, 0, 0, 0, 0.00, 300.00, 520.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(1022, NULL, '13019013', 'HING NAVJIVAN P POWDER 500G', 'हिंग नवजीवन पी पा 500GM ', 1, 0, 0, 0, 0, 0, 0.00, 300.00, 500.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(1023, NULL, '910', ' JALJEERA MASALA DWARKESH', 'द्वारकेश जलजीरा मसाला', 1, 0, 0, 0, 0, 0, 180.00, 180.00, 320.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1024, NULL, '13019013', 'HING NAVJIVAN WHITE KHADA', 'हिंग नवजीवन सफेद खड़ा', 1, 0, 0, 0, 0, 0, 0.00, 600.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1025, NULL, '13019013', 'HING NAVJIVAN BLACK KHADA', 'हिंग नवजीवन का खडा ', 1, 0, 0, 0, 0, 0, 0.00, 800.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1026, NULL, '13019013', 'HING SP POWDER ', 'SP हिंग पावडर', 1, 0, 0, 0, 0, 0, 210.00, 600.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1027, NULL, '13019013', 'HING LOOSE POWDER', ' लूज़ हिंग पावडर ', 1, 0, 0, 0, 0, 0, 0.00, 200.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1028, NULL, '13019013', 'HING LAXMI 100GM', 'हिंग लक्ष्मी 100GM', 1, 0, 0, 0, 0, 0, 0.00, 80.00, 150.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(1029, NULL, '13019013', 'HING LAXMI 50GM', 'हिंग लक्ष्मी 50GM', 1, 0, 0, 0, 0, 0, 0.00, 40.00, 75.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(1030, NULL, '13019013', 'HING LAXMI P POWDER', 'हिंग लक्ष्मी पी पा ', 1, 0, 0, 0, 0, 0, 0.00, 600.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1031, NULL, '13019013', 'HING LAXMI B POWDER', 'हिंग लक्ष्मी का पा ', 1, 0, 0, 0, 0, 0, 0.00, 700.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1032, NULL, '13019013', 'HING AIROPLANE KHADA', 'हिंग अेरोप्लेन खडा ', 1, 0, 0, 0, 0, 0, 0.00, 1200.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1033, NULL, '04049020', 'GINGER GARLIC PASTE 200GM', 'जिंजर गार्लिक पेस्ट 200GM', 1, 0, 0, 0, 0, 0, 0.00, 40.00, 50.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(1034, NULL, '19059040', 'PAPAD GANESH BIKANERI 1KG', 'गणेश बिकानेरी पापड 1 KG', 1, 0, 0, 0, 0, 0, 262.00, 280.00, 330.00, 0.00, 0.00, 0.00, 'PKT', 0.00),
(1035, NULL, '19059040', 'PAPAD GANESH BIKANERI 400GM', 'गणेश बिकानेरी पापड400 GM', 1, 0, 0, 0, 0, 0, 0.00, 120.00, 140.00, NULL, 0.00, 0.00, 'PKT', 0.00),
(1036, NULL, '19059040', 'PAPAD JANTA', 'जनता पापड', 1, 0, 0, 0, 0, 0, 130.00, 160.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(1037, NULL, '33021010', 'PARROT GREEN 100', 'P ग्रीन 100GM', 1, 0, 0, 0, 0, 0, 0.00, 20.00, 0.00, NULL, 0.00, 0.00, 'PCS', 18.00),
(1038, NULL, '33021010', 'PARROT GREEN 500', 'P ग्रीन 500GM', 1, 0, 0, 0, 0, 0, 0.00, 75.00, 0.00, NULL, 0.00, 0.00, 'PKT', 18.00),
(1039, NULL, '33021010', 'PARROT GREEN 10', 'P ग्रीन 10GM', 1, 0, 0, 0, 0, 0, 0.00, 8.00, 0.00, NULL, 0.00, 0.00, 'PCS', 18.00),
(1040, NULL, '33021010', 'PARROT KESAR 100GM', 'P केसर 100GM', 1, 0, 0, 0, 0, 0, 0.00, 20.00, 0.00, NULL, 0.00, 0.00, 'PCS', 18.00),
(1041, NULL, '33021010', 'PARROT KESAR 50GM', 'P केसर 50GM', 1, 0, 0, 0, 0, 0, 0.00, 8.00, 0.00, NULL, 0.00, 0.00, 'PKT', 18.00),
(1042, NULL, '33021010', 'PARROT KESAR 500GM', 'P केसर 500GM', 1, 0, 0, 0, 0, 0, 0.00, 70.00, 0.00, NULL, 0.00, 0.00, 'PKT', 18.00),
(1043, NULL, '33021010', 'PARROT LEMON 10GM', 'P लेमन 10GM', 1, 0, 0, 0, 0, 0, 0.00, 8.00, 0.00, NULL, 0.00, 0.00, 'PKT', 18.00),
(1044, NULL, '33021010', 'PARROT LEMON 500GM', 'P लेमन 500GM', 1, 0, 0, 0, 0, 0, 0.00, 70.00, 0.00, NULL, 0.00, 0.00, 'PKT', 18.00),
(1045, NULL, '33021010', 'PARROT ORANGE 500GM', 'P ऑरेंज 500GM', 1, 0, 0, 0, 0, 0, 0.00, 70.00, 0.00, NULL, 0.00, 0.00, 'PKT', 18.00),
(1046, NULL, '33021010', 'PARROT ORANGE 100GM', 'P ऑरेंज 100GM', 1, 0, 0, 0, 0, 0, 0.00, 20.00, 0.00, NULL, 0.00, 0.00, 'PKT', 18.00),
(1047, NULL, '910', 'HARI OM CHAS MASALA 100GM', 'हरी ॐ छाश मसाला 100GM', 1, 0, 0, -2, 0, 0, 0.00, 20.00, 31.00, NULL, -1.00, -1.00, 'GRM', 5.00),
(1048, NULL, '33021010', 'PARROT ORANGE 10GM', 'P ऑरेंज 10GM', 1, 0, 0, 0, 0, 0, 0.00, 8.00, 0.00, NULL, 0.00, 0.00, 'PKT', 18.00),
(1049, NULL, '33021010', 'PARROT ORANGE RED 500GM', 'P ऑरेंज रेड 500 GM', 1, 0, 0, 0, 0, 0, 0.00, 60.00, 0.00, NULL, 0.00, 0.00, 'PKT', 18.00),
(1050, NULL, '33021010', 'PARROT TOMATO 100', 'P टोमेटो 100GM', 1, 0, 0, 0, 0, 0, 0.00, 25.00, 0.00, NULL, 0.00, 0.00, 'PKT', 18.00),
(1051, NULL, '33021010', 'PARROT TOMATO 500', 'P टोमेटो 500GM', 1, 0, 0, 0, 0, 0, 0.00, 80.00, 0.00, NULL, 0.00, 0.00, 'PKT', 18.00),
(1052, NULL, '33021010', 'PARROT TOMATO 10GM', 'P टोमेटो 10GM', 1, 0, 0, -1, 0, 0, 0.00, 8.00, 0.00, NULL, 0.00, 0.00, 'PKT', 18.00),
(1053, NULL, '910', 'HALIM', 'हलीम ', 1, 0, 0, 0, 0, 0, 81.00, 160.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1054, NULL, '0713', 'RANGOLI', 'रंगोली', 1, 0, 0, -1, 0, 0, 0.00, 20.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(1055, NULL, '910', 'HALIM 100GM', 'हलीम 100GM', 1, 0, 0, -1, 0, 0, 0.00, 20.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(1056, NULL, '3304', 'SINDUR', 'सिंदूर', 1, 0, 0, 0, 0, 0, 122.00, 400.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(1057, NULL, '910', 'HARDA MOTHA', 'हरडा मोठा', 1, 0, 0, 0, 0, 0, 40.00, 160.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(1058, NULL, '910', 'HARDA POWDER', 'हरडा पाऊडर ', 1, 0, 0, 0, 0, 0, 60.00, 240.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1059, NULL, '0713', 'HIRABOR', 'हिराबोर ', 1, 0, 0, 0, 0, 0, 1700.00, 2400.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(1060, NULL, '0713', 'HARI PATTI', 'हरी पत्ति ', 1, 0, 0, 0, 0, 0, 400.00, 600.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(1061, NULL, '910', 'HARDEVATI', 'हरडेवटी', 1, 0, 0, 0, 0, 0, 130.00, 240.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1062, NULL, '09093000', 'JEERA  MARUTI ', 'जीरा मारुती ', 1, 2, 0, 0, 0, 0, 0.00, 260.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(1063, NULL, '09093000', 'JEERA SUPER', 'जीरा सुपर ', 1, 0, 0, 0, 0, 0, 200.00, 280.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1064, NULL, '09093000', 'JEERA GOLI', 'जीरा गोली ', 1, 0, 0, 0, 0, 0, 0.00, 160.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1065, NULL, '2106', 'JOCKER ORANGE 100GM', 'जोकर ऑरेंज 100GM', 1, 0, 0, 0, 0, 0, 0.00, 30.00, 0.00, NULL, 0.00, 0.00, 'GRM', 28.00),
(1066, NULL, '08021200', 'BADAM TOUCH', 'टोच बदाम', 1, 0, 30, 30, 0, 0, 560.00, 680.00, 0.00, 0.00, 0.00, 0.00, 'KG', 12.00),
(1067, NULL, '09071010', 'LONG DESI', 'देसी लवंग', 1, 0, 0, 0, 0, 0, 575.00, 1000.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1068, NULL, '2105', 'JYOTI ICE CREAM MIX', 'ज्योती आइसक्रीम मिक्स', 1, 0, 0, 0, 0, 0, 0.00, 25.00, 40.00, NULL, 0.00, 0.00, 'GRM', 18.00),
(1069, NULL, '910', 'TEJPATTA', '2 तेजपता', 1, 2, 0, -1, 0, 0, 42.00, 120.00, 0.00, 80.00, 0.00, 0.00, 'KG', 5.00),
(1070, NULL, '09109100', 'KAPOL A-1 CHAT', 'कपोल A-1 चाट ', 1, 0, 0, -1, 0, 0, 0.00, 50.00, 60.00, NULL, 0.00, 0.00, 'PKT', 5.00),
(1071, NULL, '9082100', 'MAGADIYA UNCHA', 'उंचा मगडिया', 1, 0, 0, 0, 0, 0, 750.00, 1200.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1072, NULL, '11040000', 'KHATA THOKLA', 'खाता ठोकला', 1, 0, 0, 0, 0, 0, 0.00, 80.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(1073, NULL, '9082100', 'JAVANTRI A1', 'A1 जावंत्री', 1, 0, 0, 0, 0, 0, 2300.00, 3600.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(1074, NULL, '9083110', 'ALCHA KALA UNCHA', 'उंचा काला एलचा', 1, 0, 0, 0, 0, 0, 775.00, 1600.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(1075, NULL, '910', 'SEEDS KIRVA ', 'सीड्स किरवा ', 1, 0, 0, 0, 0, 0, 0.00, 280.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1076, NULL, '07132000', 'LAL MAKAI KABUTAR', ' कबूतर लाल मकई', 1, 0, 0, 0, 0, 0, 22.00, 32.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(1077, NULL, '21039090', 'SIL SWEET CORN', 'सिल स्वीट कॉर्न', 1, 0, 0, 0, 0, 0, 0.00, 100.00, 110.00, NULL, 0.00, 0.00, 'GRM', 18.00),
(1078, NULL, '21039090', 'SIL BAKED BEANS ', 'सिल बेक्ड बिन्स ', 1, 0, 0, 0, 0, 0, 86.00, 100.00, 110.00, NULL, 0.00, 0.00, 'GRM', 18.00),
(1079, NULL, '2106', 'SARBAT KAIRI PUNHA', 'कैरी पन्हा', 1, 0, 0, 0, 0, 0, 0.00, 120.00, 170.00, NULL, 0.00, 0.00, 'LTR', 28.00),
(1081, NULL, '2106', 'SARBAT KAIRI PUNHA', 'कैरी पन्हा', 1, 0, 0, 0, 0, 0, 0.00, 120.00, 170.00, NULL, 0.00, 0.00, 'LTR', 28.00),
(1082, NULL, '1404', 'KANPUR KHATHA', 'कानपूर खता ', 1, 0, 0, 0, 0, 0, 0.00, 1200.00, 0.00, NULL, 0.00, 0.00, 'KG', 18.00),
(1083, NULL, '0801', 'KAJU GURAV 240', 'गुरव 240 काजू', 1, 0, 40, 0, 0, 0, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(1084, NULL, '0801', 'KAJU SHAILESH 240', ' शैलेश 240 काजू ', 1, 0, 0, 0, 0, 0, 0.00, 1000.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1085, NULL, '0801', 'KAJU W 240 VASHI', 'W 240 काजू', 1, 0, 20, 10, 0, 0, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(1086, NULL, '0801', 'KAJU W 210', 'W 210 काजू', 1, 0, 0, 0, 0, 0, 0.00, 1000.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1087, NULL, '910', 'KASTURI METHI', 'कस्तूरी मेथी ', 1, 0, 0, 0, 0, 0, 0.00, 200.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1088, NULL, '910', 'KASTURI METHI A1 100GM', 'कस्तूरी मेथी A1 100GM', 1, 0, 0, 0, 0, 0, 35.24, 60.00, 80.00, NULL, 0.00, 0.00, 'PKT', 5.00),
(1089, NULL, '910', 'KASTURI METHI 2no 100GM', 'कस्तूरी मेथी 2no 100GM', 1, 0, 0, 0, 0, 0, 0.00, 40.00, 50.00, NULL, 0.00, 0.00, 'PKT', 5.00),
(1090, NULL, '910', 'SEEDS KINOVA', 'सीड्स किंओवा ', 1, 0, 0, 0, 0, 0, 220.00, 360.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1091, NULL, '20060000', 'FRUIT KIWI', 'किवी फ्रूट ', 1, 0, 0, 0, 0, 0, 150.00, 600.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(1092, NULL, '20083090', 'MIX FRUIT', 'फ्रूट मिक्स ', 1, 0, 0, 0, 0, 0, 150.00, 600.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(1093, NULL, '0713', 'KALA GHEVDA', 'काला घेवडा ', 1, 0, 2, 0, 0, 0, 51.00, 80.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(1094, NULL, '09093000', 'JEERA KALA', 'जीरा काला ', 1, 0, 0, 0, 0, 0, 280.00, 480.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1096, NULL, '1902', 'KALWERT ROSE ', 'कालवेर्ट रोज', 1, 0, 0, -1, 0, 0, 0.00, 110.00, 0.00, NULL, 0.00, 0.00, 'LTR', 18.00),
(1097, NULL, '910', 'KANDA LASUN CHATNI', 'कांदा लसूण चटणी ', 1, 0, 0, 0, 0, 0, 0.00, 160.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1098, NULL, '07132000', 'KABULI', 'काबुली', 1, 0, 4, -5, 0, 0, 55.45, 80.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(1099, NULL, '0713', 'KABULI A1', 'A1 काबुली', 1, 0, 0, -1, 0, 0, 67.00, 90.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(1100, NULL, '0909', 'MEETHA PAN SHRINATH', 'मीठा पान', 1, 0, 0, 0, 0, 0, 0.00, 60.00, 80.00, NULL, 0.00, 0.00, 'PKT', 5.00),
(1101, NULL, '0713', 'MEHNDI', 'महेंदी', 1, 0, 0, 0, 0, 0, 110.00, 240.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(1102, NULL, '21061000', 'MOONG VADI', 'मूंग वड़ी', 1, 0, 0, 0, 0, 0, 110.00, 160.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(1103, NULL, '09109100', 'MTR RASAM 200GM', 'MTR रसम 200', 1, 0, 0, 0, 0, 0, 82.00, 90.00, 95.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(1104, NULL, '02106', 'LADDU', 'LADDU', 1, 0, 0, 0, 0, 0, 0.00, 200.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1105, NULL, '09109100', 'MTR SAMBHAR 200GM', 'MTR सांभर 200', 1, 0, 0, 0, 0, 0, 85.00, 95.00, 99.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(1106, NULL, '28100020', 'PARA GOLI', 'पारा गोली', 1, 0, 0, 0, 0, 0, 0.00, 60.00, 80.00, NULL, 0.00, 0.00, 'GRM', 18.00),
(1107, NULL, '09109100', 'RASOI MAGIC JAIN', 'रसोई मैजिक जैन', 1, 0, 0, -5, 0, 0, 0.00, 38.00, 42.00, NULL, 0.00, 0.00, 'PKT', 5.00),
(1108, NULL, '910', 'LASUN CHATNI', 'लसूण चटणी ', 1, 0, 0, 0, 0, 0, 0.00, 160.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1109, NULL, '21069011', 'ROOHAFJA', 'रूअफजा', 1, 0, 0, 0, 0, 0, 125.00, 135.00, 145.00, NULL, 0.00, 0.00, 'LTR', 18.00),
(1110, NULL, '910', 'SABJA', 'सबजा', 1, 0, 0, 0, 0, 0, 190.00, 280.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1111, NULL, '910', 'LINDI PIPAR', 'लिनदी पिपर ', 1, 0, 0, 0, 0, 0, 350.00, 600.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1112, NULL, '1902', 'SAMOSA FRAME', 'समोस़ा फ्रेम', 1, 0, 0, 0, 0, 0, 55.00, 80.00, 0.00, NULL, 0.00, 0.00, 'KG', 18.00),
(1113, NULL, '33074100', 'LOBAN 786', 'लोंबण 786', 1, 0, 0, 0, 0, 0, 180.00, 360.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1114, NULL, '910', 'SHANKHJEERA POWDER ', 'शंखजीरा पाउडर', 1, 11, 0, 0, 0, 0, 230.00, 350.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(1115, NULL, '08042090', 'ANJEER 146', 'अंजीर 146', 1, 0, 0, 0, 0, 0, 600.00, 0.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1116, NULL, '08042090', 'ANJEER 282', 'अंजीर 282', 1, 0, 0, 0, 0, 0, 563.00, 0.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(1117, NULL, '910', 'ASHWAGANDHA POWDER', 'अश्वगंधा पाऊडर ', 1, 0, 0, 0, 0, 0, 240.00, 400.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1118, NULL, '910', 'CHANDAN POWDER ', 'चंदन पाऊडर ', 1, 0, 0, 0, 0, 0, 300.00, 600.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1119, NULL, '910', 'PUDINA POWDER ', 'पुदिना पाऊडर ', 1, 0, 0, 0, 0, 0, 110110.00, 240.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1120, NULL, '910', 'TRIFLA POWDER', 'त्रिफला पाऊडर ', 1, 0, 0, 0, 0, 0, 100.00, 240.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1121, NULL, '910', 'TRIFLA POWDER 100GM', 'त्रिफला पाऊडर 100GM', 1, 0, 0, 0, 0, 0, 0.00, 40.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(1122, NULL, '910', 'ANARDANA POWDER', 'अनारदाना पाऊडर ', 1, 0, 0, 0, 0, 0, 180.00, 280.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1123, NULL, '910', 'LASUN POWDER ', 'लसून पावडर', 1, 0, 0, 0, 0, 0, 75.00, 160.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1124, NULL, '0813', 'CHANDI VARAK 1PKT', 'चांदी वरक 1PKT', 1, 0, 0, 0, 0, 0, 0.00, 40.00, 0.00, NULL, 0.00, 0.00, 'PKT', 12.00),
(1125, NULL, '910', 'RAI LAL', 'लाल राइ', 1, 0, 0, 0, 0, 0, 120.00, 200.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1126, NULL, '0713', 'POP CORN', 'पॉप कॉर्न', 1, 0, 0, 0, 0, 0, 74.00, 100.00, 0.00, 0.00, 0.00, 0.00, 'PKT', 0.00),
(1127, NULL, '19021900', 'SHAHANA KHEER MIX', 'शहाना खीर मिक्स ', 1, 0, 0, -1, 0, 0, 0.00, 45.00, 50.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(1128, NULL, '2106', 'MANGO PULP AADITI', 'मंगोपल्प आदिती', 1, 0, 0, 0, 0, 0, 0.00, 150.00, 220.00, NULL, 0.00, 0.00, 'LTR', 28.00),
(1129, NULL, '2105', 'BROWNIE CAKE MIX', 'ज्योति ब्राउनी', 1, 0, 0, 0, 0, 0, 0.00, 90.00, 100.00, NULL, 0.00, 0.00, 'GRM', 18.00),
(1130, NULL, '21039030', 'MAYONNAISE ALFA 1KG', 'अल्फा मेयोनेज़ 1kg', 1, 0, 0, 1, 0, 0, 62.50, 90.00, 0.00, 0.00, 0.00, 0.00, 'KG', 12.00),
(1131, NULL, '09109100', 'MILAN MASALA', 'मिलन मसाला', 1, 0, 0, 0, 0, 0, 0.00, 10.00, 10.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1132, NULL, '0904', 'OREGANO', 'ओरेगानो', 1, 0, 0, 0, 0, 0, 120.00, 280.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1133, NULL, '0409', 'OREGANO 100GM', 'ओरेगानो 100GM', 1, 0, 0, 0, 0, 0, 0.00, 40.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(1134, NULL, '910', 'CHILLI FLAKES 100GM', 'चिल्ली फलैक्स 100GM', 1, 0, 0, 0, 0, 0, 0.00, 40.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(1135, NULL, '0813', 'PAPDI ', 'पबडी', 1, 0, 0, 0, 0, 0, 0.00, 720.00, 0.00, NULL, 0.00, 0.00, 'GRM', 12.00),
(1136, NULL, '0813', 'PAPDI POOJA', 'पबडी पूजा ', 1, 0, 0, 0, 0, 0, 0.00, 280.00, 0.00, NULL, 0.00, 0.00, 'GRM', 12.00),
(1137, NULL, '21061000', 'PANI PURI PURI', 'तैयार पानी पूरी', 1, 0, 0, 0, 0, 0, 0.00, 160.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(1138, NULL, '07133300', 'RAJMA CHITRA', 'राजमा चित्रा ', 1, 0, 0, -1, 0, 0, 79.00, 100.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(1139, NULL, '07133300', 'RAJMA KASHMIRI', 'राजमा काश्मिरी ', 1, 0, 0, 0, 0, 0, 83.00, 100.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(1140, NULL, '07133300', 'RAJMA SHARMILI', 'राजमा शर्मीली', 1, 0, 0, 0, 0, 0, 50.00, 90.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(1141, NULL, '910', 'SATAVRI', 'सतावरी ', 1, 0, 0, 0, 0, 0, 240.00, 400.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1142, NULL, '0909', 'AMLA HOENY 500GM', 'अमला मध 500GM', 1, 0, 0, 0, 0, 0, 0.00, 120.00, 0.00, NULL, 0.00, 0.00, 'PKT', 5.00),
(1143, NULL, '910', 'AAMCHUR POWDER A1', 'A1 आमचूर पाउडर', 1, 0, 0, 0, 0, 0, 92.00, 200.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1144, NULL, '910', 'SUNTH POWDER 2no', '2 सुंठ पावडर', 1, 0, 0, 0, 0, 0, 108.15, 200.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1145, NULL, '910', 'SUNTH POWDER MARUTI', 'मारुती सुंठ पावडर', 1, 0, 0, 0, 0, 0, 160.00, 400.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1146, NULL, '09109100', 'JEERA POWDER SP3', 'SP3 जीरा पावडर', 1, 0, 0, 25, 0, 0, 100.00, 160.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(1147, NULL, '09093000', 'JEERA POWDER A1', 'A1 जीरा पावडर', 1, 0, 0, 0, 0, 0, 128.00, 240.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1148, NULL, '1006', 'RICE BOMBAY SUPER MOGRA 10KG ', 'बॉम्बे सुपर मोगरा 10kg', 1, 0, 0, 0, 0, 0, 0.00, 600.00, 0.00, NULL, 0.00, 0.00, 'PKT', 0.00),
(1149, NULL, '1006', 'RICE BOMBAY MINI MOGRA 10KG', 'बोम्बे मिनी मोगरा 10KG', 1, 0, 0, 0, 0, 0, 0.00, 400.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(1150, NULL, '1006', 'RICE BOMBAY TIBAR', 'बॉम्बे\' तिबार 10KG', 1, 10, 0, 1, 0, 0, 0.00, 720.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(1151, NULL, '1006', 'RICE BASMATI SELA UCHA', 'सेला बासमती ऊचा ', 1, 0, 0, 0, 0, 0, 0.00, 70.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(1152, NULL, '1006', 'RICE DOON TIBAR', 'राइस दून तिबार ', 1, 0, 0, 0, 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(1153, NULL, '1006', 'RICE DOON DUBAR', 'दून दुबार ', 1, 3, 0, 1, 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(1154, NULL, '1006', 'RICE BASAMTI RESHAM  AKKHA ', 'रेशम बासमती आखा ', 1, 4, 0, 1, 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(1155, NULL, '1006', 'RICE BASMATI RESHAM TIBAR', 'तिबार रेशम बासमती ', 1, 3, 0, 1, 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(1156, NULL, '1006', 'RICE RESHAM DUBAR', 'रेशम दुबार बासमती ', 1, 3, 0, 1, 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(1157, NULL, '1006', 'RICE KESAR MALAI JUNA', 'जुना केसर मलाई ', 1, 0, 0, 0, 0, 0, 0.00, 0.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(1158, NULL, '1006', 'RICE KESAR MALAI NEW', 'नवा केसर मलाई चावल ', 1, 0, 0, 0, 0, 0, 0.00, 0.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(1159, NULL, '1006', 'RICE JIVAN JYOT NEW', 'नवा जीवन ज्योत चावल  ', 1, 5, 0, 0, 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(1160, NULL, '1006', 'RICE PAKVAN NEW', 'नवा पकवान चावल ', 1, 14, 0, 0, 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(1161, NULL, '1006', 'RICE KOHINOOR 10KG', 'कोहिनूर अखा बासमती 10KG', 1, 0, 0, 0, 0, 0, 0.00, 0.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(1162, NULL, '09109100', 'EV MILK 10 GM', 'EV मिल्क 10GM', 1, 0, 0, 0, 0, 0, 39.00, 42.00, 45.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(1163, NULL, '09109100', 'EV MILK 100 GM', 'EV मिल्क 100GM', 1, 0, 0, 0, 0, 0, 335.00, 360.00, 385.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(1164, NULL, '09109100', 'EV MILK 20 GM', 'EV मिल्क 20GM', 1, 0, 0, 0, 0, 0, 74.00, 80.00, 85.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(1165, NULL, '09109100', 'EV MILK 50GM', 'EV किचन किंग 50GM', 1, 0, 0, 0, 0, 0, 178.00, 190.00, 205.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(1166, NULL, '9020', 'EMLI BARAF', 'बरफ आमली', 1, 0, 0, 0, 0, 0, 126.00, 160.00, 0.00, 140.00, 0.00, 0.00, 'KG', 5.00),
(1167, NULL, '09093000', 'JEERA POWDER SHANKH', 'शंख जीरा पाऊडर ', 1, 0, 0, 0, 0, 0, 0.00, 240.00, 0.00, NULL, 0.00, 0.00, 'PKT', 5.00),
(1168, NULL, '9020', 'EMLI JUNI ', 'काली आमली', 1, 0, 0, 0, 0, 0, 0.00, 120.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1169, NULL, '0813', 'MAKHANA RAJBHOG', 'माखणा राजभोग ', 1, 0, 0, 0, 0, 0, 0.00, 720.00, 1200.00, NULL, 0.00, 0.00, 'KG', 12.00),
(1170, NULL, '08041020', 'KHAJUR MEDJOUL 5 KG', 'खजूर मेडजोउल 5KG', 1, 0, 0, 0, 0, 0, 4900.00, 1350.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(1171, NULL, '08042090', 'ANJEER 48', 'ANJEER 48', 1, 0, 0, 0, 0, 0, 800.00, 0.00, 0.02, NULL, 0.00, 0.00, 'KG', 12.00),
(1172, NULL, '910', 'PANIR FUL', 'पनीर  फूल  ', 1, 0, 0, 0, 0, 0, 225.00, 320.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1173, NULL, '910', 'PANIR FUL 100GM', 'पनीर  फूल  100 GM', 1, 0, 0, 0, 0, 0, 0.00, 40.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(1174, NULL, '9109100', 'BD TANDOORI 1KG', 'BD तंदुरी 1 KG', 1, 0, 0, 0, 0, 0, 480.00, 560.00, 666.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(1175, NULL, '09109100', 'EV KASTURI METHI 25GM', 'EV कस्तूरी मेथी 25GM', 1, 0, 0, -1, 0, 0, 21.00, 23.00, 25.00, NULL, 0.00, 0.00, 'BOX', 5.00),
(1176, NULL, '1008', 'RAJGIRA AKKHA', 'राजगिरा अखा ', 1, 0, 0, -2, 0, 0, 80.00, 120.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(1177, NULL, '9109100', 'BD TANDOORI 100GM', 'BD तंदूरी 100 GM', 1, 0, 0, 0, 0, 0, 61.00, 65.00, 72.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(1178, NULL, '1903', 'SABUDANA NYLON', 'नायलोन साबूदाना', 1, 0, 0, 0, 0, 0, 72.00, 100.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1179, NULL, '09093000', 'JEERA PACKET ', 'JEERA PACKET ATIL', 1, 0, 0, 0, 0, 0, 0.00, 0.00, 0.00, NULL, 0.00, 0.00, 'PKT', 5.00),
(1180, NULL, '1006', 'RICE DHAMAL NEW', 'नवा धमाल ', 1, 1, 0, 1, 0, 0, 44.00, 52.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(1181, NULL, '1902', 'MOM CHOICE 110GM ROSTED', 'मोम चॉइस 110GM', 1, 0, 0, 0, 0, 0, 8.57, 15.00, 18.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(1182, NULL, '1006', 'RICE MA KOLAM', 'MA कोलम ', 1, 3, 0, 0, 0, 0, 40.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(1183, NULL, '1006', 'RICE BLACK BERRY KOLAM', 'ब्लॅक बेरी कॉलम ', 1, 0, 0, 0, 0, 0, 0.00, 0.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(1184, NULL, '910', 'LIMBU PHUL J', 'J लिम्बु फूल', 1, 4, 0, 0, 0, 0, 0.00, 120.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(1185, NULL, '1106', 'BESAN A1 500gm', 'A1 बेसन 500GM', 1, 4, 0, -1, 0, 0, 0.00, 40.00, 0.00, 0.00, 0.00, 0.00, 'PKT', 5.00),
(1187, NULL, '21069099', 'GULAB JAMUN GITS 200GM', 'गीट्स गुलाब जामून 200GM', 1, 0, 0, 0, 0, 0, 0.00, 85.00, 95.00, NULL, 0.00, 0.00, 'PKT', 18.00),
(1188, NULL, '20019000', 'SV MIRCHI 5KG', 'SV मिरची 5KG', 1, 0, 0, 0, 0, 0, 225.00, 240.00, 479.00, 0.00, 0.00, 0.00, 'KG', 12.00),
(1190, NULL, '22039030', 'SV KOKAM SARBAT', 'SV कोकम सरबत ', 1, 0, 0, 0, 0, 0, 100.00, 120.00, 150.00, 0.00, 0.00, 0.00, 'LTR', 5.00),
(1191, NULL, '11063090', 'BESAN 10KG', 'बेसन 10kg', 1, 0, 0, 0, 0, 0, 610.00, 680.00, 0.00, 650.00, 0.00, 0.00, 'KG', 0.00),
(1192, NULL, '09083120', 'ELACHI POWDER', 'ग्रीन एलची पावडर', 1, 0, 0, 0, 0, 0, 0.00, 1600.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1193, NULL, '09083120', 'ELACHI POWDER 100GM', 'ग्रीन एलची पावडर 100GM', 1, 0, 0, 0, 0, 0, 0.00, 480.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(1194, NULL, '1006', 'TURDALOIL NEW ', 'नवी तेलदाल ', 1, 0, 0, 0, 0, 0, 80.00, 120.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(1195, NULL, '0713', 'CHILTI NEW', 'A1 नवी छिलटी ', 1, 0, 2, 0, 0, 0, 95.00, 120.00, 0.00, 110.00, 0.00, 0.00, 'KG', 0.00),
(1196, NULL, '0713', 'MOGAR NEW', 'नवी मोगर ', 1, 0, 0, 0, 0, 0, 102.00, 120.00, 0.00, 115.00, 0.00, 0.00, 'KG', 0.00),
(1197, NULL, '0813', 'MAKHANA DOLLER', 'डॉलर मखाना ', 1, 0, 0, -1, 0, 0, 390.00, 560.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(1198, NULL, '1006', 'RICE AISHWARYA WADA KOLAM', 'ऐश्वर्या नवा वाडा कोलम ', 1, 0, 0, 0, 0, 0, 0.00, 0.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(1199, NULL, '1006', 'RICE AISHWARYA JUNA KOLAM', 'ऐश्वर्या जुना वाडा कोलम ', 1, 2, 0, 1, 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(1200, NULL, '910', 'AMLA SUKA', 'अमला सुका ', 1, 0, 0, 0, 0, 0, 0.00, 320.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1201, NULL, '910', 'AMLA SUKA 100GM', 'अमला सुका 100GM', 1, 0, 0, 0, 0, 0, 0.00, 40.00, 0.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(1202, NULL, '1006', 'RICE JAISHRIRAM NEW KOLAM', 'जय श्री राम नवा कोलम ', 1, 7, 0, 0, 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(1203, NULL, '1006', 'RICE NEW WADA KOLAM PRASTUKH', 'प्रस्तुत नवा वाडा कोलम ', 1, 1, 0, 0, 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(1204, NULL, '1006', 'RICE NEW KOLAM PARAS', 'पारस नवा कोलम ', 1, 0, 0, 0, 0, 0, 0.00, 0.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(1205, NULL, '09093000', 'JEERA 1 PACKET', 'पॅकेट 1 जीरा ', 1, 0, 0, 0, 0, 0, 0.00, 0.00, 0.00, NULL, 0.00, 0.00, 'PKT', 5.00),
(1206, NULL, '20059900', 'BEDEKAR MANGO POUCH 200GM', 'मॅंगो बेडेकर 200GM', 1, 0, 0, 0, 0, 0, 34.00, 40.00, 45.00, NULL, 0.00, 0.00, 'PKT', 12.00);
INSERT INTO `productmaster` (`prodid_`, `prodid`, `hsn`, `prodname`, `prodname_hindi`, `shopid`, `wstock`, `dstock`, `lstock`, `totalstock`, `today_opening`, `pprice`, `uprice`, `wprice`, `bsprice`, `stock`, `rstock`, `unit`, `gstper`) VALUES
(1207, NULL, '20059900', 'BEDEKAR MIX POUCH200GM', 'बेडेकर मिक्स 200GM', 1, 0, 0, 0, 0, 0, 40.00, 0.00, 45.00, NULL, 0.00, 0.00, 'PKT', 12.00),
(1209, NULL, '20059900', 'BEDEKAR MIRCHI 200GM', 'बेडेकर मिरची 200GM', 1, 0, 0, 0, 0, 0, 40.00, 0.00, 45.00, NULL, 0.00, 0.00, 'PKT', 12.00),
(1210, NULL, '20019000', 'SV MIX 5KG ', 'SV मिक्स 5 KG', 1, 0, 0, 0, 0, 0, 211.50, 240.00, 0.00, 0.00, 0.00, 0.00, 'KG', 12.00),
(1211, NULL, '20019000', 'SV LIMBU 5KG', 'SV लीम्बू 5KG', 1, 0, 0, 0, 0, 0, 205.00, 240.00, 555.00, 0.00, 0.00, 0.00, 'KG', 12.00),
(1212, NULL, '1207', 'MAGAJ WATERMELON KANI', 'कलिंगड कनी ', 1, 1, 0, 1, 0, 0, 160.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(1214, NULL, '09109100', 'BEDEKAR LIMBU MASALA 100GM', 'बेडेकर लिंबू मसला 100 GM', 1, 0, 0, 0, 0, 0, 50.00, 55.00, 60.00, NULL, 0.00, 0.00, 'GRM', 5.00),
(1216, NULL, '1006', 'RICE NAVA KOHINOOR KOLAM', 'नवा कोहिनूर कोलम ', 1, 8, 0, 0, 0, 0, 44.00, 52.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(1217, NULL, '0909', 'JEERA ATIL', 'अतिल जीरा ', 1, 1, 0, 0, 0, 0, 170.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(1218, NULL, '08042090', 'ANJEER 18', '18 अंजीर', 1, 0, 0, 0, 0, 0, 0.00, 0.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(1219, NULL, '21032000', 'SAUCE DELEMONTE POUCH 1RS', 'स्मॅपल डेलेमोट सॉस 1 RS  ', 1, 0, 0, 0, 0, 0, 0.49, 80.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(1221, NULL, '0802', 'AKHROD NURANI MAGAJ', 'नुरानी अखरोड़', 1, 0, 0, 0, 0, 0, 900.00, 1200.00, 0.00, 1000.00, 0.00, 0.00, 'KG', 0.00),
(1222, NULL, '1904', 'BHADAS POHA', 'भडस पोहा ', 1, 0, 0, 0, 0, 0, 36.00, 50.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(1223, NULL, '19059040', 'PAPAD ANKUR 1KG', 'अंकुर पापड़ ', 1, 0, 0, 0, 0, 0, 122.00, 140.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(1224, NULL, '19059040', 'PAPAD ANKUR 1KG', 'अंकुर पापड़ ', 1, 0, 0, 0, 0, 0, 122.00, 140.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(1225, NULL, '09105000', 'MARI WHITE POWDER SP', 'SP सफेद मरी पाऊडर', 1, 0, 0, 0, 0, 0, 80.00, 160.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1226, NULL, '0713', 'TURDAL NEW SAMRAT', 'नवी तुरदाल ', 1, 0, 0, 0, 0, 0, 88.00, 100.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(1227, NULL, '1006', 'RICE BOMBAY NEW SUPERMOGRA 30KG', 'नवा बॉम्बे सुपर मोगरा 30kg', 1, 0, 0, 0, 0, 0, 43.00, 0.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(1228, NULL, '0801', 'KAJU MARVADI TUKDA', 'काजू मारवाडी तुकडा ', 1, 0, 20, 0, 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(1229, NULL, '9109100', 'BD GARAM2 1KG', 'BD 2 गरम 1KG', 1, 0, 0, 0, 0, 0, 180.95, 250.00, 306.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1230, NULL, '2008', 'MALAS GUAVA CRUSH', 'मालास गुवा', 1, 0, 0, 0, 0, 0, 105.00, 120.00, 145.00, NULL, 0.00, 0.00, 'LTR', 12.00),
(1231, NULL, '2008', 'MALAS STRAWBERRY CRUSH', 'मालस स्ट्रॉबेरी', 1, 0, 0, 0, 0, 0, 105.00, 120.00, 145.00, 0.00, 0.00, 0.00, 'LTR', 12.00),
(1232, NULL, '2007', 'MALAS MIXFRUIT JAM 1KG', 'मालास मिक्स जाम 1KG', 1, 0, 0, 0, 0, 0, 110.00, 120.00, 165.00, NULL, 0.00, 0.00, 'LTR', 12.00),
(1233, NULL, '2007', 'MALAS STRAWBERRY JAM 1KG', 'मालास स्ट्रॉबेरी जाम 1KG', 1, 0, 0, 0, 0, 0, 110.00, 120.00, 165.00, NULL, 0.00, 0.00, 'KG', 12.00),
(1234, NULL, '2007', 'MALAS PINEAPPLE JAM 1KG', 'मालास पायनॅपल जाम 1 KG', 1, 0, 0, 0, 0, 0, 110.00, 120.00, 165.00, NULL, 0.00, 0.00, 'KG', 12.00),
(1235, NULL, '09093000', 'JEERA FERMUALE ', 'जीरा फेरमुयले ', 1, 0, 0, 0, 0, 0, 158.00, 0.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1236, NULL, '09093000', 'JEERA ARMAN', 'जीरा आर्मन ', 1, 0, 0, 0, 0, 0, 165.00, 0.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1237, NULL, '0713', 'CHANADALL NEW', 'नवी चनादाल', 1, 0, 0, 0, 0, 0, 0.00, 70.00, 0.00, NULL, 0.00, 0.00, 'KG', 0.00),
(1239, NULL, '0713', 'TURDAL NEW OIL JPM', 'TURDAL NEW OIL JPM', 1, 5, 0, 0, 0, 0, 89.00, 110.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(1240, NULL, '09083120', 'ELACHI DHAGI KISHAN', 'किशन दाघी एलची', 1, 0, 15, 0, 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(1241, NULL, '09083120', 'ELACHI FATFUT KRISNA', 'क्रिस्ना फाटफुट एलाची', 1, 0, 60, 0, 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(1242, NULL, '09083120', 'ELACHI AAISHWARYA 500GM', 'ऐश्वर्या एलची 500GM', 1, 0, 0, 0, 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(1244, NULL, '08042090', 'ANJEER 33', 'अंजीर 33 ', 1, 0, 0, 0, 0, 0, 700.00, 0.00, 0.00, NULL, 0.00, 0.00, 'PKT', 5.00),
(1245, NULL, '08042090', 'ANJEER 15A', 'अंजीर 15A', 1, 0, 0, 0, 0, 0, 600.00, 0.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1246, NULL, '9109100', 'THANDAI POWDER', 'थंडाई  पाऊडर', 1, 0, 0, 0, 0, 0, 400.00, 480.00, 500.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1247, NULL, '0713', 'TURDAL NATRAJ NEW', 'नवी नटराज ', 1, 0, 10, 0, 0, 0, 0.00, 100.00, 0.00, 90.00, 0.00, 0.00, 'KG', 0.00),
(1248, NULL, '1206', 'SEEDS SUNFLOWER', 'सनफ्लावर सीडस', 1, 0, 0, 0, 0, 0, 165.00, 280.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1249, NULL, '0909', 'MUKHWAS TINIMINI', 'टिन्नी मिनी', 1, 0, 0, 0, 0, 0, 65.00, 120.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1250, NULL, '910', 'MUKHWAS TINIMINI JADI', 'J टिन्नी मिनी', 1, 0, 0, 30, 0, 0, 60.00, 120.00, 0.00, 80.00, 0.00, 0.00, 'KG', 5.00),
(1251, NULL, '21039040', 'CHEESE POWDER', 'चीज पाऊडर', 1, 0, 0, 0, 0, 0, 310.00, 480.00, 0.00, NULL, 0.00, 0.00, 'KG', 12.00),
(1252, NULL, '0910', 'HALDI SELAM 2', '2 सेलम', 1, 0, 0, 0, 0, 0, 106.00, 140.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1253, NULL, '11061000', 'BESAN  SAMRAT 500gm', 'सम्राट बेसन 500GM', 1, 0, 0, 0, 0, 0, 36.00, 40.00, 0.00, NULL, 0.00, 0.00, 'KG', 5.00),
(1254, NULL, '20019000', 'SV MANGO 2KG', 'SV मंगो 2KG', 1, 0, 0, 0, 0, 0, 190.00, 220.00, 279.00, NULL, 0.00, 0.00, 'KG', 12.00),
(1256, NULL, '08042090', 'ANJEER 69', 'ANJEER 69', 1, 0, 0, 0, 0, 0, 600.00, 1000.00, 0.00, 800.00, 0.00, 0.00, 'KG', 12.00),
(1257, NULL, '09083120', 'ELACHI NAVI', 'एलची नवी ', 1, 0, 0, 0, 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(1258, NULL, '2008', 'MALAS LEMON BARLEY', 'मालास लेमन बारली', 1, 0, 0, 0, 0, 0, 83.00, 100.00, 115.00, 0.00, 0.00, 0.00, 'LTR', 12.00),
(1259, NULL, '2008', 'MALAS KACHA AAM ', 'मालास कचीकैरी', 1, 0, 0, 0, 0, 0, 97.00, 110.00, 130.00, 0.00, 0.00, 0.00, 'LTR', 12.00),
(1260, NULL, '2008', 'MALAS LITCHI WHOLE', 'मालस लीची ', 1, 0, 0, 0, 0, 0, 127.00, 140.00, 165.00, 0.00, 0.00, 0.00, 'LTR', 12.00),
(1261, NULL, '2008', 'MALAS JEERA CORDIAL', 'मालास जीरा कोरडियल ', 1, 0, 0, 0, 0, 0, 105.00, 120.00, 145.00, 0.00, 0.00, 0.00, 'LTR', 12.00),
(1262, NULL, '2008', 'MALAS MANGO CRUSH', 'मालास मॅंगो ', 1, 0, 0, 0, 0, 0, 97.00, 120.00, 145.00, 0.00, 0.00, 0.00, 'LTR', 12.00),
(1263, NULL, '2008', 'MALAS WATERMELON', 'मालास वॉटरमेलन', 1, 0, 0, 0, 0, 0, 97.00, 110.00, 130.00, 0.00, 0.00, 0.00, 'LTR', 12.00),
(1264, NULL, '0908', 'MAGADIYA UNCHA', 'उंचा मगडिया', 1, 0, 0, 0, 0, 0, 788.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 'PKT', 5.00),
(1265, NULL, '9100', 'PERI PERI MASALA', 'पेरी पेरी मसाला', 1, 0, 0, 0, 0, 0, 180.00, 280.00, 0.00, 240.00, 0.00, 0.00, 'KG', 12.00),
(1266, NULL, '20071000', 'NOBLE 1LTR', 'नोबल 1 LTR', 1, 0, 0, 0, 0, 0, 120.00, 150.00, 210.00, 130.00, 0.00, 0.00, 'LTR', 28.00),
(1267, NULL, '20071000', 'NOBLE AAM PANNAH', 'नोबेल आमपन्ह', 1, 0, 0, 0, 0, 0, 126.00, 150.00, 0.00, 140.00, 0.00, 0.00, 'LTR', 28.00),
(1268, NULL, '910', 'MAGAJ CHAR', 'चार मगज ', 1, 0, 0, 0, 0, 0, 0.00, 600.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(1269, NULL, '0813', 'KHARAK B.M.W.', 'B.M.W. खारेक', 1, 0, 0, 0, 0, 0, 270.00, 360.00, 0.00, 300.00, 0.00, 0.00, 'KG', 12.00),
(1270, NULL, '910', 'CHILLY FLACKS SARWAR', 'सरवर चिल्ली फलैक्स', 1, 0, 0, 0, 0, 0, 220.00, 280.00, 0.00, 240.00, 0.00, 0.00, 'KG', 3.00),
(1271, NULL, '910', 'THANDAI POWDER 100GM', 'ठंडाई मसाला 100GM', 1, 0, 0, 0, 0, 0, 0.00, 60.00, 0.00, 0.00, 0.00, 0.00, 'GRM', 5.00),
(1272, NULL, '0713', 'MOGAR NAVI B', 'B मोगर नवी ', 1, 0, 6, 0, 0, 0, 101.00, 110.00, 0.00, 105.00, 0.00, 0.00, 'KG', 0.00),
(1274, NULL, '2106', 'FIVESTAR CHINA GRAS IMP ', 'फाइव स्टार चाइना ग्रास इम्प 100GM', 1, 0, 0, 10, 0, 0, 0.00, 300.00, 0.00, 0.00, 0.00, 0.00, 'PKT', 28.00),
(1275, NULL, '2106', 'FIVESTAR BOX CHAINA GRSS', '5स्टार इंस्टेंट चाइना ग्रास', 1, 0, 0, 10, 0, 0, 0.00, 40.00, 45.00, 0.00, 0.00, 0.00, 'PKT', 0.00),
(1276, NULL, '0909', 'MUKHWAS WHITE CHURI', 'सफेद चुरी', 1, 0, 0, 30, 0, 0, 60.00, 120.00, 0.00, 80.00, 0.00, 0.00, 'KG', 5.00),
(1277, NULL, '0000', 'DELIVERY CHARGE ', 'डिलीवरी चार्ज', 1, 0, 0, -5, 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'PKT', 0.00),
(1278, NULL, '08021200', 'BADAM TOUCH MAMRA NEW', 'बदाम टौच मामरा न्यू ', 1, 0, 0, 0, 0, 0, 1800.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'PKT', 12.00),
(1279, NULL, '12030000', 'KOPARA 2 RAJAPUR ', '2 राजापुर ', 1, 3, 0, -9, 0, 0, 0.00, 160.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(1280, NULL, '19041020', 'KANHAIYA MAMRA 1GONI', 'कन्हैया कुरमुरा ', 1, 25, 0, 0, 0, 0, 470.00, 540.00, 0.00, 500.00, 0.00, 0.00, 'PKT', 0.00),
(1281, NULL, '09093000', 'JEERA MOUSAM', 'जीरा मौसम ', 1, 2, 0, -1, 0, 0, 0.00, 280.00, 0.00, 0.00, 0.00, 0.00, 'KG', 5.00),
(1282, NULL, '1904', 'KISAN MAMRA', 'किसन ममरा ', 1, 15, 0, 0, 0, 0, 431.00, 560.00, 0.00, 500.00, 0.00, 0.00, 'KG', 0.00),
(1283, NULL, '0713', 'UDAD DALL NEW 1', '1 नवी उडद दाल ', 1, 0, 4, 0, 0, 0, 93.00, 110.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00),
(1284, NULL, '0713', 'UDAD DALL NEW 1', '1 नवी उडद दाल ', 1, 0, 4, 0, 0, 0, 93.00, 110.00, 0.00, 0.00, 0.00, 0.00, 'KG', 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `purchasedetails_01_2020`
--

CREATE TABLE `purchasedetails_01_2020` (
  `id` int(11) NOT NULL,
  `pinvoiceid` varchar(15) NOT NULL,
  `prodid` varchar(10) DEFAULT NULL,
  `prodid_` int(11) DEFAULT NULL,
  `pprodname` varchar(100) NOT NULL,
  `unit` varchar(10) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `taxable` decimal(10,0) NOT NULL DEFAULT 0,
  `total` decimal(10,2) NOT NULL,
  `discount` decimal(6,2) NOT NULL,
  `gst` varchar(10) NOT NULL,
  `pgstper` decimal(6,2) NOT NULL,
  `gstamount` decimal(10,2) NOT NULL,
  `added_on` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `purchasedetails_02_2020`
--

CREATE TABLE `purchasedetails_02_2020` (
  `id` int(11) NOT NULL,
  `pinvoiceid` varchar(15) NOT NULL,
  `prodid` varchar(10) DEFAULT NULL,
  `prodid_` int(11) DEFAULT NULL,
  `pprodname` varchar(100) NOT NULL,
  `unit` varchar(10) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `taxable` decimal(10,0) NOT NULL DEFAULT 0,
  `total` decimal(10,2) NOT NULL,
  `discount` decimal(6,2) NOT NULL,
  `gst` varchar(10) NOT NULL,
  `pgstper` decimal(6,2) NOT NULL,
  `gstamount` decimal(10,2) NOT NULL,
  `added_on` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `purchasedetails_03_2020`
--

CREATE TABLE `purchasedetails_03_2020` (
  `id` int(11) NOT NULL,
  `pinvoiceid` varchar(15) NOT NULL,
  `prodid` varchar(10) DEFAULT NULL,
  `prodid_` int(11) DEFAULT NULL,
  `pprodname` varchar(100) NOT NULL,
  `unit` varchar(10) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `taxable` decimal(10,0) NOT NULL DEFAULT 0,
  `total` decimal(10,2) NOT NULL,
  `discount` decimal(6,2) NOT NULL,
  `gst` varchar(10) NOT NULL,
  `pgstper` decimal(6,2) NOT NULL,
  `gstamount` decimal(10,2) NOT NULL,
  `added_on` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `purchasedetails_04_2020`
--

CREATE TABLE `purchasedetails_04_2020` (
  `id` int(11) NOT NULL,
  `pinvoiceid` varchar(15) NOT NULL,
  `prodid` varchar(10) DEFAULT NULL,
  `prodid_` int(11) DEFAULT NULL,
  `pprodname` varchar(100) NOT NULL,
  `unit` varchar(10) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `taxable` decimal(10,0) NOT NULL DEFAULT 0,
  `total` decimal(10,2) NOT NULL,
  `discount` decimal(6,2) NOT NULL,
  `gst` varchar(10) NOT NULL,
  `pgstper` decimal(6,2) NOT NULL,
  `gstamount` decimal(10,2) NOT NULL,
  `added_on` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `purchasedetails_05_2020`
--

CREATE TABLE `purchasedetails_05_2020` (
  `id` int(11) NOT NULL,
  `pinvoiceid` varchar(15) NOT NULL,
  `prodid` varchar(10) DEFAULT NULL,
  `prodid_` int(11) DEFAULT NULL,
  `pprodname` varchar(100) NOT NULL,
  `unit` varchar(10) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `taxable` decimal(10,0) NOT NULL DEFAULT 0,
  `total` decimal(10,2) NOT NULL,
  `discount` decimal(6,2) NOT NULL,
  `gst` varchar(10) NOT NULL,
  `pgstper` decimal(6,2) NOT NULL,
  `gstamount` decimal(10,2) NOT NULL,
  `added_on` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `purchaseid1`
--

CREATE TABLE `purchaseid1` (
  `iid` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchaseid1`
--

INSERT INTO `purchaseid1` (`iid`, `date`) VALUES
(25, '2017-07-07');

-- --------------------------------------------------------

--
-- Table structure for table `purchaseid2`
--

CREATE TABLE `purchaseid2` (
  `iid` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchaseid2`
--

INSERT INTO `purchaseid2` (`iid`, `date`) VALUES
(1, '2017-07-07');

-- --------------------------------------------------------

--
-- Table structure for table `purchasemaster_2020`
--

CREATE TABLE `purchasemaster_2020` (
  `pinvoiceid` varchar(15) NOT NULL,
  `shopid` int(5) NOT NULL,
  `receipt` varchar(30) NOT NULL,
  `customerid` int(10) NOT NULL,
  `amttotal` decimal(10,2) NOT NULL,
  `taxtotal` decimal(10,2) NOT NULL,
  `pdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `refunddetailsmaster_2020`
--

CREATE TABLE `refunddetailsmaster_2020` (
  `id` int(11) NOT NULL,
  `refund_id` varchar(100) NOT NULL,
  `prodid_` int(11) NOT NULL,
  `prodname` varchar(200) DEFAULT NULL,
  `unit` varchar(30) DEFAULT NULL,
  `qty` int(11) NOT NULL,
  `rate` decimal(10,0) NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `refundmaster_2020`
--

CREATE TABLE `refundmaster_2020` (
  `id` int(11) NOT NULL,
  `refund_id` varchar(100) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `refund_by` varchar(25) NOT NULL,
  `refund_total` decimal(10,0) NOT NULL,
  `refund_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `salarymaster`
--

CREATE TABLE `salarymaster` (
  `id` int(11) NOT NULL,
  `userid` varchar(20) NOT NULL,
  `esalary` int(11) NOT NULL,
  `asalary` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `salesdetailsmaster_01_2020`
--

CREATE TABLE `salesdetailsmaster_01_2020` (
  `id` int(11) NOT NULL,
  `invoiceid` varchar(50) NOT NULL,
  `prodid` varchar(50) DEFAULT NULL,
  `prodid_` int(11) NOT NULL DEFAULT 0,
  `bprodname` varchar(100) NOT NULL,
  `istock` decimal(10,2) NOT NULL,
  `iinstock` decimal(10,2) NOT NULL,
  `unit` varchar(8) NOT NULL,
  `salesrate` decimal(10,2) NOT NULL,
  `prodtotal` decimal(10,2) NOT NULL,
  `prodttotal` decimal(10,2) NOT NULL,
  `discount` decimal(6,2) NOT NULL,
  `gst` varchar(10) NOT NULL,
  `bgstper` decimal(6,2) NOT NULL,
  `gstamount` decimal(10,2) NOT NULL,
  `added_on` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `salesdetailsmaster_02_2020`
--

CREATE TABLE `salesdetailsmaster_02_2020` (
  `id` int(11) NOT NULL,
  `invoiceid` varchar(50) NOT NULL,
  `prodid` varchar(50) DEFAULT NULL,
  `prodid_` int(11) NOT NULL DEFAULT 0,
  `bprodname` varchar(100) NOT NULL,
  `istock` decimal(10,3) NOT NULL,
  `iinstock` decimal(10,2) NOT NULL,
  `unit` varchar(8) NOT NULL,
  `salesrate` decimal(10,2) NOT NULL,
  `prodtotal` decimal(10,2) NOT NULL,
  `prodttotal` decimal(10,2) NOT NULL,
  `discount` decimal(6,2) NOT NULL,
  `gst` varchar(10) NOT NULL,
  `bgstper` decimal(6,2) NOT NULL,
  `gstamount` decimal(10,2) NOT NULL,
  `added_on` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `salesdetailsmaster_03_2020`
--

CREATE TABLE `salesdetailsmaster_03_2020` (
  `id` int(11) NOT NULL,
  `invoiceid` varchar(50) NOT NULL,
  `prodid` varchar(50) DEFAULT NULL,
  `prodid_` int(11) NOT NULL DEFAULT 0,
  `bprodname` varchar(100) NOT NULL,
  `istock` decimal(10,3) NOT NULL,
  `iinstock` decimal(10,2) NOT NULL,
  `unit` varchar(8) NOT NULL,
  `salesrate` decimal(10,2) NOT NULL,
  `prodtotal` decimal(10,2) NOT NULL,
  `prodttotal` decimal(10,2) NOT NULL,
  `discount` decimal(6,2) NOT NULL,
  `gst` varchar(10) NOT NULL,
  `bgstper` decimal(6,2) NOT NULL,
  `gstamount` decimal(10,2) NOT NULL,
  `added_on` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `salesdetailsmaster_03_2020`
--

INSERT INTO `salesdetailsmaster_03_2020` (`id`, `invoiceid`, `prodid`, `prodid_`, `bprodname`, `istock`, `iinstock`, `unit`, `salesrate`, `prodtotal`, `prodttotal`, `discount`, `gst`, `bgstper`, `gstamount`, `added_on`) VALUES
(1, 'MMM8308', NULL, 174, 'GAHU SEHARI', 15.000, 1.00, 'KG', 34.00, 510.00, 510.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-03 14:50:52'),
(2, 'MMM8308', NULL, 232, 'RICE UKDA AIYYAR', 2.000, 1.00, 'KG', 40.00, 80.00, 80.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-03 14:50:52'),
(3, 'MMM8308', NULL, 245, 'RICE PARIMAL NEW', 5.000, 1.00, 'KG', 32.00, 160.00, 160.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-03 14:50:52'),
(4, 'MMM8308', NULL, 93, 'RAI A1', 0.500, 1.00, 'KG', 80.00, 40.00, 40.00, 0.00, 'CGSTSGST', 5.00, 2.00, '2020-03-03 14:50:52'),
(5, 'MMM8308', NULL, 203, 'SINGDANA NAVA DISKO', 1.000, 1.00, 'KG', 120.00, 120.00, 120.00, 0.00, 'CGSTSGST', 5.00, 6.00, '2020-03-03 14:50:52'),
(6, 'MMM8308', NULL, 865, 'FIVESTAR CORNFLOUR 200GM', 1.000, 1.00, 'GRM', 28.00, 28.00, 28.00, 0.00, 'CGSTSGST', 28.00, 7.84, '2020-03-03 14:50:52'),
(7, 'MMM8308', NULL, 377, 'SODA KHAVANO', 1.000, 1.00, 'KG', 50.00, 50.00, 50.00, 0.00, 'CGSTSGST', 5.00, 2.50, '2020-03-03 14:50:52'),
(8, 'MMM8308', NULL, 485, 'KISMIS LAMBI', 0.500, 1.00, 'KG', 320.00, 160.00, 160.00, 0.00, 'CGSTSGST', 5.00, 8.00, '2020-03-03 14:50:52'),
(9, 'MMM8308', NULL, 927, 'MUKHWAS', 1.000, 1.00, 'KG', 160.00, 160.00, 160.00, 0.00, 'CGSTSGST', 5.00, 8.00, '2020-03-03 14:50:52'),
(10, 'MMM8308', NULL, 153, 'DHANA DAL', 0.250, 1.00, 'KG', 200.00, 50.00, 50.00, 0.00, 'CGSTSGST', 5.00, 2.50, '2020-03-03 14:50:52'),
(11, 'MMM8308', NULL, 8, 'MOGAR A1', 1.000, 1.00, 'KG', 120.00, 120.00, 120.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-03 14:50:52'),
(12, 'MMM8308', NULL, 44, 'UDAD DALL 1', 1.000, 1.00, 'KG', 120.00, 120.00, 120.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-03 14:50:52'),
(13, 'MMM8308', NULL, 349, 'TIL RAJWADI', 0.250, 1.00, 'KG', 200.00, 50.00, 50.00, 0.00, 'CGSTSGST', 5.00, 2.50, '2020-03-03 14:50:52'),
(14, 'MMM8308', NULL, 222, 'AJMA NAVA', 0.250, 1.00, 'KG', 360.00, 90.00, 90.00, 0.00, 'CGSTSGST', 5.00, 4.50, '2020-03-03 14:50:52'),
(15, 'MMM8308', NULL, 635, 'EV PAVBHAJI  100GM', 1.000, 1.00, 'GRM', 60.00, 60.00, 60.00, 0.00, 'CGSTSGST', 5.00, 3.00, '2020-03-03 14:50:52'),
(16, 'MMM8308', NULL, 1107, 'RASOI MAGIC JAIN', 1.000, 1.00, 'PKT', 35.00, 35.00, 35.00, 0.00, 'CGSTSGST', 5.00, 1.75, '2020-03-03 14:50:52'),
(17, 'MMM8309', NULL, 507, 'KHAJUR OMAN', 0.500, 1.00, 'PKT', 280.00, 140.00, 140.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-03 15:05:52'),
(18, 'MMM8309', NULL, 422, 'KAJU S 320', 0.500, 1.00, 'KG', 680.00, 340.00, 340.00, 0.00, 'CGSTSGST', 5.00, 17.00, '2020-03-03 15:05:53'),
(19, 'MMM8309', NULL, 193, 'KOPARA A1 RAJAPUR', 0.500, 1.00, 'KG', 180.00, 90.00, 90.00, 0.00, 'CGSTSGST', 5.00, 4.50, '2020-03-03 15:05:53'),
(20, 'MMM8310', NULL, 3, 'SUGAR JADI', 1.000, 1.00, 'KG', 40.00, 40.00, 40.00, 0.00, 'CGSTSGST', 5.00, 2.00, '2020-03-03 17:22:58'),
(21, 'MMM8311', NULL, 93, 'RAI A1', 0.250, 1.00, 'KG', 100.00, 25.00, 25.00, 0.00, 'CGSTSGST', 5.00, 1.25, '2020-03-03 17:28:16'),
(22, 'MMM8311', NULL, 142, 'HALDI POWDER GOLDEN', 0.250, 1.00, 'PKT', 160.00, 40.00, 40.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-03 17:28:16'),
(23, 'MMM8311', NULL, 76, 'MIRCHI KASHMIR POWDER', 0.500, 1.00, 'KG', 180.00, 90.00, 90.00, 0.00, 'CGSTSGST', 5.00, 4.50, '2020-03-03 17:28:16'),
(24, 'MMM8312', NULL, 779, 'TALOD KHAMAN 500GM', 1.000, 1.00, 'GRM', 70.00, 70.00, 70.00, 0.00, 'CGSTSGST', 18.00, 12.60, '2020-03-03 17:30:20'),
(25, 'MMM8312', NULL, 743, 'PAPAD LIJJAT UDAD 200GM', 1.000, 1.00, 'GRM', 55.00, 55.00, 55.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-03 17:30:20'),
(26, 'MMM8312', NULL, 23, 'RAVA BARIK', 0.500, 1.00, 'KG', 40.00, 20.00, 20.00, 0.00, 'CGSTSGST', 5.00, 1.00, '2020-03-03 17:30:20'),
(27, 'MMM8312', NULL, 12, 'POHA JADA', 0.500, 1.00, 'KG', 52.00, 26.00, 26.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-03 17:30:20'),
(28, 'MMM8312', NULL, 13, 'TURDAL NATRAJ', 0.500, 1.00, 'PKT', 120.00, 60.00, 60.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-03 17:30:20'),
(29, 'MMM8312', NULL, 884, 'FALUDA', 2.000, 1.00, 'PKT', 25.00, 50.00, 50.00, 0.00, 'CGSTSGST', 5.00, 2.50, '2020-03-03 17:30:20'),
(30, 'MMM8313', NULL, 1096, 'KALWERT ROSE ', 1.000, 1.00, 'LTR', 110.00, 110.00, 110.00, 0.00, 'CGSTSGST', 18.00, 19.80, '2020-03-03 17:42:25'),
(31, 'MMM8313', NULL, 866, 'FIVESTAR CUSTARD 100GM', 2.000, 1.00, 'PKT', 20.00, 40.00, 40.00, 0.00, 'CGSTSGST', 28.00, 11.20, '2020-03-03 17:42:25'),
(32, 'MMM8313', NULL, 608, 'ISABGUL BHUSI', 0.250, 1.00, 'KG', 600.00, 150.00, 150.00, 0.00, 'CGSTSGST', 5.00, 7.50, '2020-03-03 17:42:25'),
(33, 'MMM8314', NULL, 29, 'CHANA DALL', 2.000, 1.00, 'KG', 70.00, 140.00, 140.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-03 17:55:38'),
(34, 'MMM8314', NULL, 13, 'TURDAL NATRAJ', 1.000, 1.00, 'PKT', 100.00, 100.00, 100.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-03 17:55:38'),
(35, 'MMM8314', NULL, 193, 'KOPARA A1 RAJAPUR', 1.000, 1.00, 'KG', 180.00, 180.00, 180.00, 0.00, 'CGSTSGST', 5.00, 9.00, '2020-03-03 17:55:38'),
(36, 'MMM8314', NULL, 201, 'SINGDANA NAVA BORIYA', 2.000, 1.00, 'KG', 110.00, 220.00, 220.00, 0.00, 'CGSTSGST', 5.00, 11.00, '2020-03-03 17:55:38'),
(37, 'MMM8314', NULL, 219, 'RICE CHAPI KOLUM', 2.000, 1.00, 'KG', 55.00, 110.00, 110.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-03 17:55:38'),
(38, 'MMM8314', NULL, 78, 'GUD 1no', 1.000, 1.00, 'KG', 56.00, 56.00, 56.00, 0.00, 'CGSTSGST', 5.00, 2.80, '2020-03-03 17:55:38'),
(39, 'MMM8314', NULL, 23, 'RAVA BARIK', 1.000, 1.00, 'KG', 36.00, 36.00, 36.00, 0.00, 'CGSTSGST', 5.00, 1.80, '2020-03-03 17:55:38'),
(40, 'MMM8314', NULL, 3, 'SUGAR JADI', 2.000, 1.00, 'KG', 40.00, 80.00, 80.00, 0.00, 'CGSTSGST', 5.00, 4.00, '2020-03-03 17:55:38'),
(41, 'MMM8315', NULL, 545, 'ELACHI GREEN 100GM', 1.000, 1.00, 'GRM', 520.00, 520.00, 520.00, 0.00, 'CGSTSGST', 5.00, 26.00, '2020-03-03 17:56:26'),
(42, 'MMM8315', NULL, 395, 'ALCHA KALA 100GM', 1.000, 1.00, 'GRM', 160.00, 160.00, 160.00, 0.00, 'CGSTSGST', 5.00, 8.00, '2020-03-03 17:56:27'),
(43, 'MMM8315', NULL, 352, 'CHILLY KASHMIRI', 0.100, 1.00, 'KG', 400.00, 40.00, 40.00, 0.00, 'CGSTSGST', 5.00, 2.00, '2020-03-03 17:56:27'),
(44, 'MMM8315', NULL, 342, 'CHILLY BOR NO. 1', 0.050, 1.00, 'KG', 400.00, 20.00, 20.00, 0.00, 'CGSTSGST', 5.00, 1.00, '2020-03-03 17:56:27'),
(45, 'MMM8315', NULL, 79, 'JEERA 1', 0.250, 1.00, 'KG', 280.00, 70.00, 70.00, 0.00, 'CGSTSGST', 5.00, 3.50, '2020-03-03 17:56:27'),
(46, 'MMM8316', NULL, 79, 'JEERA 1', 5.000, 1.00, 'KG', 200.00, 1000.00, 1000.00, 0.00, 'CGSTSGST', 5.00, 50.00, '2020-03-03 18:01:13'),
(47, 'MMM8316', NULL, 159, 'DHANA VM ', 2.000, 1.00, 'KG', 160.00, 320.00, 320.00, 0.00, 'CGSTSGST', 5.00, 16.00, '2020-03-03 18:01:13'),
(48, 'MMM8316', NULL, 349, 'TIL RAJWADI', 1.000, 1.00, 'KG', 180.00, 180.00, 180.00, 0.00, 'CGSTSGST', 5.00, 9.00, '2020-03-03 18:01:13'),
(49, 'MMM8316', NULL, 528, 'MARI BLACK ', 0.250, 1.00, 'KG', 600.00, 150.00, 150.00, 0.00, 'CGSTSGST', 5.00, 7.50, '2020-03-03 18:01:13'),
(50, 'MMM8316', NULL, 622, 'TAJ LAL ', 0.250, 1.00, 'KG', 600.00, 150.00, 150.00, 0.00, 'CGSTSGST', 5.00, 7.50, '2020-03-03 18:01:13'),
(51, 'MMM8316', NULL, 401, 'BADIYAN A1', 0.250, 1.00, 'KG', 1000.00, 250.00, 250.00, 0.00, 'CGSTSGST', 5.00, 12.50, '2020-03-03 18:01:13'),
(52, 'MMM8316', NULL, 144, 'HALDI SELAN RAJWADI', 0.250, 1.00, 'KG', 200.00, 50.00, 50.00, 0.00, 'CGSTSGST', 5.00, 2.50, '2020-03-03 18:01:13'),
(53, 'MMM8316', NULL, 83, 'JEERA SHAJEERA', 0.250, 1.00, 'KG', 800.00, 200.00, 200.00, 0.00, 'CGSTSGST', 5.00, 10.00, '2020-03-03 18:01:13'),
(54, 'MMM8316', NULL, 420, 'KHASKHAS RATLAM', 0.250, 1.00, 'KG', 1200.00, 300.00, 300.00, 0.00, 'CGSTSGST', 5.00, 15.00, '2020-03-03 18:01:13'),
(55, 'MMM8316', NULL, 517, 'TEJPATTA A1', 0.250, 1.00, 'KG', 200.00, 50.00, 50.00, 0.00, 'CGSTSGST', 5.00, 2.50, '2020-03-03 18:01:13'),
(56, 'MMM8316', NULL, 437, 'LONG', 0.250, 1.00, 'KG', 800.00, 200.00, 200.00, 0.00, 'CGSTSGST', 5.00, 10.00, '2020-03-03 18:01:13'),
(57, 'MMM8316', NULL, 142, 'HALDI POWDER GOLDEN', 1.000, 1.00, 'PKT', 160.00, 160.00, 160.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-03 18:01:13'),
(58, 'MMM8316', NULL, 152, 'DHANA', 2.000, 1.00, 'KG', 120.00, 240.00, 240.00, 0.00, 'CGSTSGST', 5.00, 12.00, '2020-03-03 18:01:13'),
(59, 'MMM8316', NULL, 977, 'HING VANDEVI Y. POWDER 100GM', 2.000, 1.00, 'GRM', 80.00, 160.00, 160.00, 0.00, 'CGSTSGST', 5.00, 8.00, '2020-03-03 18:01:13'),
(60, 'MMM8316', NULL, 545, 'ELACHI GREEN 100GM', 1.000, 1.00, 'GRM', 480.00, 480.00, 480.00, 0.00, 'CGSTSGST', 5.00, 24.00, '2020-03-03 18:01:13'),
(61, 'MMM8316', NULL, 939, 'SUPARI KACHI', 0.500, 1.00, 'KG', 400.00, 200.00, 200.00, 0.00, 'CGSTSGST', 18.00, 36.00, '2020-03-03 18:01:13'),
(64, 'MMM8317', NULL, 430, 'JAVANTRI 100GM', 1.000, 1.00, 'GRM', 280.00, 280.00, 280.00, 0.00, 'CGSTSGST', 5.00, 14.00, '2020-03-03 18:04:36'),
(65, 'MMM8317', NULL, 545, 'ELACHI GREEN 100GM', 1.000, 1.00, 'GRM', 480.00, 480.00, 480.00, 0.00, 'CGSTSGST', 5.00, 24.00, '2020-03-03 18:04:36'),
(66, 'MMM8317', NULL, 311, 'VARIYALI 100GM', 1.000, 1.00, 'GRM', 30.00, 30.00, 30.00, 0.00, 'CGSTSGST', 5.00, 1.50, '2020-03-03 18:04:36'),
(67, 'MMM8316', NULL, 311, 'VARIYALI 100GM', 1.000, 1.00, 'GRM', 30.00, 30.00, 30.00, 0.00, 'CGSTSGST', 5.00, 1.50, '2020-03-03 18:05:38'),
(68, 'MMM8318', NULL, 317, 'SEEDS CHIA', 0.050, 1.00, 'KG', 800.00, 40.00, 40.00, 0.00, 'CGSTSGST', 5.00, 2.00, '2020-03-03 18:14:47'),
(69, 'MMM8316', NULL, 430, 'JAVANTRI 100GM', 1.000, 1.00, 'GRM', 280.00, 280.00, 280.00, 0.00, 'CGSTSGST', 5.00, 14.00, '2020-03-03 18:20:58'),
(70, 'MMM8319', NULL, 11, 'TURDAL 5 ', 1.000, 1.00, 'KG', 90.00, 90.00, 90.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-03 18:32:24'),
(71, 'MMM8319', NULL, 475, 'AKHROD CHIKU MAGAJ', 0.100, 1.00, 'KG', 1400.00, 140.00, 140.00, 0.00, 'CGSTSGST', 5.00, 7.00, '2020-03-03 18:32:24'),
(72, 'MMM8319', NULL, 384, 'BADAM 1 NO  ', 0.250, 1.00, 'KG', 720.00, 180.00, 180.00, 0.00, 'CGSTSGST', 12.00, 21.60, '2020-03-03 18:32:24'),
(73, 'MMM8320', NULL, 168, 'GAHU LOKVAN', 15.000, 1.00, 'KG', 34.00, 510.00, 510.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-03 18:38:53'),
(74, 'MMM8320', NULL, 37, 'MASOOR A1 ', 2.000, 1.00, 'KG', 80.00, 160.00, 160.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-03 18:38:53'),
(75, 'MMM8320', NULL, 66, 'CHORA A1', 1.000, 1.00, 'KG', 90.00, 90.00, 90.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-03 18:38:53'),
(76, 'MMM8320', NULL, 786, 'OIL RAI 1LTR', 1.000, 1.00, 'LTR', 450.00, 450.00, 450.00, 0.00, 'CGSTSGST', 5.00, 22.50, '2020-03-03 18:38:53'),
(77, 'MMM8320', NULL, 751, 'NOBLE JAM 1KG', 1.000, 1.00, 'KG', 110.00, 110.00, 110.00, 0.00, 'CGSTSGST', 12.00, 13.20, '2020-03-03 18:38:53'),
(78, 'MMM8320', NULL, 1110, 'SABJA', 0.250, 1.00, 'KG', 280.00, 70.00, 70.00, 0.00, 'CGSTSGST', 5.00, 3.50, '2020-03-03 18:38:53'),
(79, 'MMM8320', NULL, 359, 'CHILLY UNCHA  BEDGI', 0.500, 1.00, 'KG', 220.00, 110.00, 110.00, 0.00, 'CGSTSGST', 5.00, 5.50, '2020-03-03 18:38:53'),
(80, 'MMM8321', NULL, 191, 'NAMAK SINDHAR ', 1.000, 1.00, 'KG', 60.00, 60.00, 60.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-03 18:46:14'),
(81, 'MMM8321', NULL, 177, 'GUD DESHI KESAR', 1.000, 1.00, 'KG', 64.00, 64.00, 64.00, 0.00, 'CGSTSGST', 5.00, 3.20, '2020-03-03 18:46:14'),
(82, 'MMM8322', NULL, 1176, 'RAJGIRA AKKHA', 2.000, 1.00, 'KG', 120.00, 240.00, 240.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-03 18:51:38'),
(83, 'MMM8322', NULL, 273, 'BHAGAR', 1.000, 1.00, 'KG', 100.00, 100.00, 100.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-03 18:51:38'),
(84, 'MMM8323', NULL, 197, 'KOPARA RAMAKDA', 1.000, 1.00, 'KG', 160.00, 160.00, 160.00, 0.00, 'CGSTSGST', 5.00, 8.00, '2020-03-03 19:10:57'),
(85, 'MMM8323', NULL, 308, 'SOYABEAN VADI', 1.000, 1.00, 'KG', 80.00, 80.00, 80.00, 0.00, 'CGSTSGST', 12.00, 9.60, '2020-03-03 19:10:57'),
(86, 'MMM8323', NULL, 1098, 'KABULI', 0.500, 1.00, 'KG', 80.00, 40.00, 40.00, 0.00, 'CGSTSGST', 5.00, 2.00, '2020-03-03 19:10:57'),
(87, 'MMM8323', NULL, 47, 'UDAD DALL KALI A1', 0.250, 1.00, 'KG', 120.00, 30.00, 30.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-03 19:10:57'),
(88, 'MMM8323', NULL, 80, 'JEERA RAJWADI', 0.250, 1.00, 'KG', 240.00, 60.00, 60.00, 0.00, 'CGSTSGST', 5.00, 3.00, '2020-03-03 19:10:57'),
(89, 'MMM8323', NULL, 78, 'GUD 1no', 1.000, 1.00, 'KG', 56.00, 56.00, 56.00, 0.00, 'CGSTSGST', 5.00, 2.80, '2020-03-03 19:10:57'),
(90, 'MMM8323', NULL, 58, 'VATANA SAFED', 0.500, 1.00, 'KG', 80.00, 40.00, 40.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-03 19:10:57'),
(91, 'MMM8323', NULL, 62, 'MATHKI', 0.500, 1.00, 'KG', 90.00, 45.00, 45.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-03 19:10:57'),
(92, 'MMM8323', NULL, 38, 'MASOOR DALL', 0.500, 1.00, 'KG', 70.00, 35.00, 35.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-03 19:10:57'),
(93, 'MMM8324', NULL, 3, 'SUGAR JADI', 3.000, 1.00, 'KG', 40.00, 120.00, 120.00, 0.00, 'CGSTSGST', 5.00, 6.00, '2020-03-03 19:16:05'),
(94, 'MMM8324', NULL, 39, 'MASOOR DALL A1', 1.000, 1.00, 'KG', 80.00, 80.00, 80.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-03 19:16:05'),
(95, 'MMM8324', NULL, 32, 'CHANA ', 1.000, 1.00, 'KG', 70.00, 70.00, 70.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-03 19:16:05'),
(96, 'MMM8324', NULL, 7, 'MOGAR ', 0.250, 1.00, 'KG', 110.00, 27.50, 27.50, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-03 19:16:05'),
(97, 'MMM8324', NULL, 36, 'MASOOR', 0.250, 1.00, 'KG', 80.00, 20.00, 20.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-03 19:16:05'),
(98, 'MMM8325', NULL, 298, 'CAREMAL 100gm', 2.000, 1.00, 'PKT', 25.00, 50.00, 50.00, 0.00, 'CGSTSGST', 28.00, 14.00, '2020-03-03 19:21:50'),
(99, 'MMM8326', NULL, 3, 'SUGAR JADI', 1.000, 1.00, 'KG', 40.00, 40.00, 40.00, 0.00, 'CGSTSGST', 5.00, 2.00, '2020-03-04 10:42:09'),
(100, 'MMM8327', NULL, 384, 'BADAM 1 NO  ', 1.000, 1.00, 'KG', 720.00, 720.00, 720.00, 0.00, 'CGSTSGST', 12.00, 86.40, '2020-03-04 11:21:32'),
(101, 'MMM8328', NULL, 13, 'TURDAL NATRAJ', 1.000, 1.00, 'PKT', 100.00, 100.00, 100.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 11:30:13'),
(102, 'MMM8328', NULL, 31, 'CHANA DALL A1', 1.000, 1.00, 'KG', 75.00, 75.00, 75.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 11:30:13'),
(103, 'MMM8328', NULL, 1099, 'KABULI A1', 0.500, 1.00, 'KG', 90.00, 45.00, 45.00, 0.00, 'CGSTSGST', 5.00, 2.25, '2020-03-04 11:30:13'),
(104, 'MMM8328', NULL, 89, 'CHORA DOLLAR ', 0.250, 1.00, 'KG', 100.00, 25.00, 25.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 11:30:13'),
(105, 'MMM8328', NULL, 34, 'CHANA MOSAMBI', 0.250, 1.00, 'KG', 100.00, 25.00, 25.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 11:30:13'),
(106, 'MMM8328', NULL, 12, 'POHA JADA', 1.000, 1.00, 'KG', 44.00, 44.00, 44.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 11:30:13'),
(107, 'MMM8328', NULL, 704, 'EV KITCHEN KING 50GM', 1.000, 1.00, 'GRM', 30.00, 30.00, 30.00, 0.00, 'CGSTSGST', 5.00, 1.50, '2020-03-04 11:30:13'),
(108, 'MMM8328', NULL, 738, 'PAPAD LIJJAT MINI 200', 1.000, 1.00, 'GRM', 55.00, 55.00, 55.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 11:30:13'),
(109, 'MMM8328', NULL, 193, 'KOPARA A1 RAJAPUR', 0.500, 1.00, 'KG', 200.00, 100.00, 100.00, 0.00, 'CGSTSGST', 5.00, 5.00, '2020-03-04 11:30:13'),
(110, 'MMM8329', NULL, 3, 'SUGAR JADI', 2.000, 1.00, 'KG', 40.00, 80.00, 80.00, 0.00, 'CGSTSGST', 5.00, 4.00, '2020-03-04 11:46:28'),
(111, 'MMM8329', NULL, 187, 'NAMAK TATA', 1.000, 1.00, 'KG', 19.00, 19.00, 19.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 11:46:28'),
(112, 'MMM8330', NULL, 911, 'HERSHEYS CHOCOLATE SYRUP', 1.000, 1.00, 'LTR', 170.00, 170.00, 170.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 11:46:48'),
(113, 'MMM8331', NULL, 30, 'CHANA DALL 1', 2.000, 1.00, 'KG', 75.00, 150.00, 150.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 11:56:34'),
(114, 'MMM8332', NULL, 412, 'KAJU TUKDA 3', 0.500, 1.00, 'KG', 600.00, 300.00, 300.00, 0.00, 'CGSTSGST', 5.00, 15.00, '2020-03-04 12:21:24'),
(115, 'MMM8332', NULL, 616, 'MAGADIYA 1 PC', 2.000, 1.00, 'PCS', 8.00, 16.00, 16.00, 0.00, 'CGSTSGST', 5.00, 0.80, '2020-03-04 12:21:24'),
(116, 'MMM8332', NULL, 316, 'VARIYALI ROASTED', 1.000, 1.00, 'KG', 160.00, 160.00, 160.00, 0.00, 'CGSTSGST', 5.00, 8.00, '2020-03-04 12:21:24'),
(117, 'MMM8332', NULL, 78, 'GUD 1no', 5.000, 1.00, 'KG', 54.00, 270.00, 270.00, 0.00, 'CGSTSGST', 5.00, 13.50, '2020-03-04 12:21:24'),
(118, 'MMM8333', NULL, 743, 'PAPAD LIJJAT UDAD 200GM', 1.000, 1.00, 'GRM', 55.00, 55.00, 55.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 12:23:26'),
(119, 'MMM8333', NULL, 494, 'KHAJUR', 0.500, 1.00, 'KG', 120.00, 60.00, 60.00, 0.00, 'CGSTSGST', 12.00, 7.20, '2020-03-04 12:23:26'),
(120, 'MMM8334', NULL, 13, 'TURDAL NATRAJ', 1.000, 1.00, 'PKT', 100.00, 100.00, 100.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 12:25:18'),
(121, 'MMM8334', NULL, 44, 'UDAD DALL 1', 2.000, 1.00, 'KG', 120.00, 240.00, 240.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 12:25:18'),
(122, 'MMM8334', NULL, 1166, 'EMLI BARAF', 0.250, 1.00, 'KG', 160.00, 40.00, 40.00, 0.00, 'CGSTSGST', 5.00, 2.00, '2020-03-04 12:25:18'),
(123, 'MMM8334', NULL, 21, 'RAVA JADA', 2.000, 1.00, 'KG', 36.00, 72.00, 72.00, 0.00, 'CGSTSGST', 5.00, 3.60, '2020-03-04 12:25:18'),
(124, 'MMM8334', NULL, 202, 'MAIDA', 2.000, 1.00, 'KG', 32.00, 64.00, 64.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 12:25:18'),
(125, 'MMM8334', NULL, 271, 'BESAN A1', 2.000, 1.00, 'KG', 80.00, 160.00, 160.00, 0.00, 'CGSTSGST', 5.00, 8.00, '2020-03-04 12:25:18'),
(126, 'MMM8334', NULL, 78, 'GUD 1no', 1.000, 1.00, 'KG', 56.00, 56.00, 56.00, 0.00, 'CGSTSGST', 5.00, 2.80, '2020-03-04 12:25:18'),
(127, 'MMM8334', NULL, 344, 'CHILLY DANDICUT BADGI', 0.500, 1.00, 'KG', 220.00, 110.00, 110.00, 0.00, 'CGSTSGST', 5.00, 5.50, '2020-03-04 12:25:18'),
(128, 'MMM8335', NULL, 771, 'NOBLE MOJITO', 1.000, 1.00, 'LTR', 180.00, 180.00, 180.00, 0.00, 'CGSTSGST', 12.00, 21.60, '2020-03-04 12:25:42'),
(129, 'MMM8335', NULL, 499, 'KHAJUR KALA SEEDLESS', 1.000, 1.00, 'KG', 260.00, 260.00, 260.00, 0.00, 'CGSTSGST', 12.00, 31.20, '2020-03-04 12:25:42'),
(130, 'MMM8335', NULL, 712, 'EV KITCHEN KING 500GM', 1.000, 1.00, 'KG', 290.00, 290.00, 290.00, 0.00, 'CGSTSGST', 5.00, 14.50, '2020-03-04 12:25:42'),
(131, 'MMM8336', NULL, 201, 'SINGDANA NAVA BORIYA', 2.000, 1.00, 'KG', 110.00, 220.00, 220.00, 0.00, 'CGSTSGST', 5.00, 11.00, '2020-03-04 12:26:27'),
(132, 'MMM8336', NULL, 26, 'SABUDANA', 1.000, 1.00, 'KG', 80.00, 80.00, 80.00, 0.00, 'CGSTSGST', 5.00, 4.00, '2020-03-04 12:26:27'),
(133, 'MMM8337', NULL, 507, 'KHAJUR OMAN', 1.000, 1.00, 'PKT', 280.00, 280.00, 280.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 12:33:02'),
(134, 'MMM8338', NULL, 13, 'TURDAL NATRAJ', 1.250, 1.00, 'PKT', 100.00, 125.00, 125.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 12:36:33'),
(135, 'MMM8338', NULL, 19, 'TURDAL TELDAL', 1.250, 1.00, 'KG', 100.00, 125.00, 125.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 12:36:33'),
(136, 'MMM8338', NULL, 980, 'HING VANDEVI Y. POWDER 500GM', 2.000, 1.00, 'GRM', 340.00, 680.00, 680.00, 0.00, 'CGSTSGST', 5.00, 34.00, '2020-03-04 12:36:33'),
(137, 'MMM8338', NULL, 546, 'ELACHI GREEN 50GM', 1.000, 1.00, 'PKT', 240.00, 240.00, 240.00, 0.00, 'CGSTSGST', 5.00, 12.00, '2020-03-04 12:36:33'),
(138, 'MMM8338', NULL, 531, 'MARI BLACK 100gm', 1.000, 1.00, 'GRM', 80.00, 80.00, 80.00, 0.00, 'CGSTSGST', 5.00, 4.00, '2020-03-04 12:36:33'),
(139, 'MMM8339', NULL, 8, 'MOGAR A1', 2.000, 1.00, 'KG', 120.00, 240.00, 240.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 12:38:48'),
(140, 'MMM8339', NULL, 13, 'TURDAL NATRAJ', 0.500, 1.00, 'PKT', 100.00, 50.00, 50.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 12:38:48'),
(141, 'MMM8339', NULL, 38, 'MASOOR DALL', 0.500, 1.00, 'KG', 70.00, 35.00, 35.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 12:38:48'),
(142, 'MMM8339', NULL, 30, 'CHANA DALL 1', 2.000, 1.00, 'KG', 75.00, 150.00, 150.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 12:38:48'),
(143, 'MMM8339', NULL, 113, 'WALL', 0.500, 1.00, 'KG', 100.00, 50.00, 50.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 12:38:48'),
(144, 'MMM8339', NULL, 89, 'CHORA DOLLAR ', 0.500, 1.00, 'KG', 100.00, 50.00, 50.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 12:38:48'),
(145, 'MMM8339', NULL, 6, 'MOONG A1', 0.500, 1.00, 'KG', 110.00, 55.00, 55.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 12:38:48'),
(146, 'MMM8339', NULL, 60, 'VATANA SAFED A1', 0.250, 1.00, 'KG', 100.00, 25.00, 25.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 12:38:48'),
(147, 'MMM8339', NULL, 32, 'CHANA ', 0.500, 1.00, 'KG', 70.00, 35.00, 35.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 12:38:48'),
(148, 'MMM8339', NULL, 1098, 'KABULI', 0.500, 1.00, 'KG', 80.00, 40.00, 40.00, 0.00, 'CGSTSGST', 5.00, 2.00, '2020-03-04 12:38:48'),
(149, 'MMM8339', NULL, 1138, 'RAJMA CHITRA', 0.500, 1.00, 'KG', 100.00, 50.00, 50.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 12:38:48'),
(150, 'MMM8339', NULL, 48, 'UDAD KALA AKKHA', 0.250, 1.00, 'KG', 120.00, 30.00, 30.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 12:38:48'),
(151, 'MMM8339', NULL, 12, 'POHA JADA', 1.000, 1.00, 'KG', 44.00, 44.00, 44.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 12:38:48'),
(152, 'MMM8339', NULL, 23, 'RAVA BARIK', 1.000, 1.00, 'KG', 36.00, 36.00, 36.00, 0.00, 'CGSTSGST', 5.00, 1.80, '2020-03-04 12:38:48'),
(153, 'MMM8339', NULL, 45, 'UDAD DALL A1', 0.500, 1.00, 'KG', 130.00, 65.00, 65.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 12:38:48'),
(154, 'MMM8339', NULL, 203, 'SINGDANA NAVA DISKO', 1.000, 1.00, 'KG', 120.00, 120.00, 120.00, 0.00, 'CGSTSGST', 5.00, 6.00, '2020-03-04 12:38:48'),
(155, 'MMM8339', NULL, 26, 'SABUDANA', 1.000, 1.00, 'KG', 80.00, 80.00, 80.00, 0.00, 'CGSTSGST', 5.00, 4.00, '2020-03-04 12:38:48'),
(156, 'MMM8339', NULL, 110, 'JAWARI SOLAPUR', 3.000, 1.00, 'KG', 48.00, 144.00, 144.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 12:38:48'),
(157, 'MMM8339', NULL, 94, 'RAI A1 100GM', 1.000, 1.00, 'GRM', 15.00, 15.00, 15.00, 0.00, 'CGSTSGST', 5.00, 0.75, '2020-03-04 12:38:48'),
(158, 'MMM8339', NULL, 148, 'DHANA 50gm', 1.000, 1.00, 'GRM', 15.00, 15.00, 15.00, 0.00, 'CGSTSGST', 5.00, 0.75, '2020-03-04 12:38:48'),
(159, 'MMM8339', NULL, 565, 'METHI R', 0.100, 1.00, 'KG', 200.00, 20.00, 20.00, 0.00, 'CGSTSGST', 5.00, 1.00, '2020-03-04 12:38:48'),
(160, 'MMM8339', NULL, 707, 'EV KITCHEN KING 100GM', 1.000, 1.00, 'GRM', 60.00, 60.00, 60.00, 0.00, 'CGSTSGST', 5.00, 3.00, '2020-03-04 12:38:48'),
(161, 'MMM8339', NULL, 636, 'EV PAVBHAJI 200GM', 1.000, 1.00, 'GRM', 125.00, 125.00, 125.00, 0.00, 'CGSTSGST', 5.00, 6.25, '2020-03-04 12:38:48'),
(162, 'MMM8339', NULL, 830, 'ESS', 1.000, 1.00, 'PKT', 20.00, 20.00, 20.00, 0.00, 'CGSTSGST', 18.00, 3.60, '2020-03-04 12:38:48'),
(163, 'MMM8339', NULL, 720, 'LASUN', 0.500, 1.00, 'KG', 280.00, 140.00, 140.00, 0.00, 'CGSTSGST', 5.00, 7.00, '2020-03-04 12:38:48'),
(164, 'MMM8339', NULL, 134, 'ATTA RAJGIRA', 1.000, 1.00, 'KG', 120.00, 120.00, 120.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 12:38:48'),
(165, 'MMM8339', NULL, 346, 'TIL KALA A1', 0.250, 1.00, 'KG', 240.00, 60.00, 60.00, 0.00, 'CGSTSGST', 5.00, 3.00, '2020-03-04 12:38:48'),
(166, 'MMM8339', NULL, 78, 'GUD 1no', 2.000, 1.00, 'KG', 56.00, 112.00, 112.00, 0.00, 'CGSTSGST', 5.00, 5.60, '2020-03-04 12:38:48'),
(167, 'MMM8339', NULL, 202, 'MAIDA', 2.000, 1.00, 'KG', 32.00, 64.00, 64.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 12:38:48'),
(168, 'MMM8340', NULL, 854, 'FIVESTAR COCO POWDER', 1.000, 1.00, 'PKT', 50.00, 50.00, 50.00, 0.00, 'CGSTSGST', 28.00, 14.00, '2020-03-04 12:39:29'),
(169, 'MMM8340', NULL, 475, 'AKHROD CHIKU MAGAJ', 0.100, 1.00, 'KG', 1600.00, 160.00, 160.00, 0.00, 'CGSTSGST', 5.00, 8.00, '2020-03-04 12:39:29'),
(170, 'MMM8341', NULL, 437, 'LONG', 0.500, 1.00, 'KG', 700.00, 350.00, 350.00, 0.00, 'CGSTSGST', 5.00, 17.50, '2020-03-04 12:47:04'),
(171, 'MMM8341', NULL, 899, 'ELACHI MALBAR', 0.500, 1.00, 'KG', 4400.00, 2200.00, 2200.00, 0.00, 'CGSTSGST', 5.00, 110.00, '2020-03-04 12:47:04'),
(172, 'MMM8341', NULL, 391, 'ALCHA KALA 2', 0.500, 1.00, 'KG', 1000.00, 500.00, 500.00, 0.00, 'CGSTSGST', 5.00, 25.00, '2020-03-04 12:47:04'),
(173, 'MMM8341', NULL, 490, 'TAJ 2', 0.500, 1.00, 'KG', 360.00, 180.00, 180.00, 0.00, 'CGSTSGST', 5.00, 9.00, '2020-03-04 12:47:04'),
(174, 'MMM8341', NULL, 83, 'JEERA SHAJEERA', 0.500, 1.00, 'KG', 800.00, 400.00, 400.00, 0.00, 'CGSTSGST', 5.00, 20.00, '2020-03-04 12:47:04'),
(175, 'MMM8341', NULL, 528, 'MARI BLACK ', 0.500, 1.00, 'KG', 480.00, 240.00, 240.00, 0.00, 'CGSTSGST', 5.00, 12.00, '2020-03-04 12:47:04'),
(176, 'MMM8341', NULL, 80, 'JEERA RAJWADI', 0.500, 1.00, 'KG', 240.00, 120.00, 120.00, 0.00, 'CGSTSGST', 5.00, 6.00, '2020-03-04 12:47:04'),
(177, 'MMM8341', NULL, 428, 'JAVANTRI', 0.250, 1.00, 'KG', 2800.00, 700.00, 700.00, 0.00, 'CGSTSGST', 5.00, 35.00, '2020-03-04 12:47:04'),
(178, 'MMM8341', NULL, 401, 'BADIYAN A1', 0.250, 1.00, 'KG', 880.00, 220.00, 220.00, 0.00, 'CGSTSGST', 5.00, 11.00, '2020-03-04 12:47:04'),
(179, 'MMM8341', NULL, 509, 'KHARAK R', 1.000, 1.00, 'KG', 240.00, 240.00, 240.00, 0.00, 'CGSTSGST', 12.00, 28.80, '2020-03-04 12:47:04'),
(180, 'MMM8341', NULL, 384, 'BADAM 1 NO  ', 1.000, 1.00, 'KG', 680.00, 680.00, 680.00, 0.00, 'CGSTSGST', 12.00, 81.60, '2020-03-04 12:47:04'),
(181, 'MMM8341', NULL, 509, 'KHARAK R', 1.000, 1.00, 'KG', 240.00, 240.00, 240.00, 0.00, 'CGSTSGST', 12.00, 28.80, '2020-03-04 12:47:04'),
(182, 'MMM8341', NULL, 197, 'KOPARA RAMAKDA', 2.000, 1.00, 'KG', 170.00, 340.00, 340.00, 0.00, 'CGSTSGST', 5.00, 17.00, '2020-03-04 12:47:04'),
(183, 'MMM8341', NULL, 422, 'KAJU S 320', 2.000, 1.00, 'KG', 700.00, 1400.00, 1400.00, 0.00, 'CGSTSGST', 5.00, 70.00, '2020-03-04 12:47:04'),
(184, 'MMM8342', NULL, 265, 'RICE INDIAGATE MINI MOGRA 5KG', 1.000, 1.00, 'KG', 260.00, 260.00, 260.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 12:53:36'),
(185, 'MMM8342', NULL, 200, 'SINGDANA LATUR', 1.000, 1.00, 'KG', 100.00, 100.00, 100.00, 0.00, 'CGSTSGST', 5.00, 5.00, '2020-03-04 12:53:36'),
(186, 'MMM8342', NULL, 26, 'SABUDANA', 1.000, 1.00, 'KG', 80.00, 80.00, 80.00, 0.00, 'CGSTSGST', 5.00, 4.00, '2020-03-04 12:53:36'),
(187, 'MMM8342', NULL, 304, 'SOYABEAN DANA', 1.000, 1.00, 'KG', 70.00, 70.00, 70.00, 0.00, 'CGSTSGST', 12.00, 8.40, '2020-03-04 12:53:36'),
(188, 'MMM8342', NULL, 315, 'VARIYALI NAVI', 0.250, 1.00, 'KG', 200.00, 50.00, 50.00, 0.00, 'CGSTSGST', 5.00, 2.50, '2020-03-04 12:53:36'),
(189, 'MMM8342', NULL, 750, 'PAPAD KHICHIYA NANA', 0.250, 1.00, 'PKT', 120.00, 30.00, 30.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 12:53:36'),
(190, 'MMM8343', NULL, 916, 'GURUJI THANDAI', 2.000, 1.00, 'LTR', 300.00, 600.00, 600.00, 0.00, 'CGSTSGST', 12.00, 72.00, '2020-03-04 15:59:43'),
(191, 'MMM8344', NULL, 916, 'GURUJI THANDAI', 2.000, 1.00, 'LTR', 280.00, 560.00, 560.00, 0.00, 'CGSTSGST', 12.00, 67.20, '2020-03-04 16:00:12'),
(192, 'MMM8345', NULL, 916, 'GURUJI THANDAI', 2.000, 1.00, 'LTR', 270.00, 540.00, 540.00, 0.00, 'CGSTSGST', 12.00, 64.80, '2020-03-04 16:00:38'),
(193, 'MMM8346', NULL, 36, 'MASOOR', 2.000, 1.00, 'KG', 70.00, 140.00, 140.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 16:39:26'),
(194, 'MMM8346', NULL, 4, 'SUGAR BARIK', 5.000, 1.00, 'KG', 38.00, 190.00, 190.00, 0.00, 'CGSTSGST', 5.00, 9.50, '2020-03-04 16:39:26'),
(195, 'MMM8346', NULL, 367, 'CHINGS SS SAUCE', 1.000, 1.00, 'BOX', 45.00, 45.00, 45.00, 0.00, 'CGSTSGST', 12.00, 5.40, '2020-03-04 16:39:26'),
(196, 'MMM8346', NULL, 367, 'CHINGS SS SAUCE', 1.000, 1.00, 'BOX', 45.00, 45.00, 45.00, 0.00, 'CGSTSGST', 12.00, 5.40, '2020-03-04 16:39:26'),
(197, 'MMM8346', NULL, 256, 'ANIL (ARARUT)', 0.500, 1.00, 'KG', 80.00, 40.00, 40.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 16:39:26'),
(198, 'MMM8346', NULL, 81, 'JEERA RAJWADI 100 GM', 1.000, 1.00, 'GRM', 30.00, 30.00, 30.00, 0.00, 'CGSTSGST', 5.00, 1.50, '2020-03-04 16:39:26'),
(199, 'MMM8347', NULL, 38, 'MASOOR DALL', 2.000, 1.00, 'KG', 70.00, 140.00, 140.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 16:41:48'),
(200, 'MMM8347', NULL, 4, 'SUGAR BARIK', 5.000, 1.00, 'KG', 38.00, 190.00, 190.00, 0.00, 'CGSTSGST', 5.00, 9.50, '2020-03-04 16:41:48'),
(201, 'MMM8347', NULL, 367, 'CHINGS SS SAUCE', 1.000, 1.00, 'BOX', 45.00, 45.00, 45.00, 0.00, 'CGSTSGST', 12.00, 5.40, '2020-03-04 16:41:48'),
(202, 'MMM8347', NULL, 367, 'CHINGS SS SAUCE', 1.000, 1.00, 'BOX', 45.00, 45.00, 45.00, 0.00, 'CGSTSGST', 12.00, 5.40, '2020-03-04 16:41:48'),
(203, 'MMM8347', NULL, 256, 'ANIL (ARARUT)', 0.500, 1.00, 'KG', 80.00, 40.00, 40.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 16:41:48'),
(204, 'MMM8347', NULL, 81, 'JEERA RAJWADI 100 GM', 1.000, 1.00, 'GRM', 30.00, 30.00, 30.00, 0.00, 'CGSTSGST', 5.00, 1.50, '2020-03-04 16:41:48'),
(205, 'MMM8348', NULL, 38, 'MASOOR DALL', 2.000, 1.00, 'KG', 70.00, 140.00, 140.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 16:44:44'),
(206, 'MMM8348', NULL, 4, 'SUGAR BARIK', 5.000, 1.00, 'KG', 38.00, 190.00, 190.00, 0.00, 'CGSTSGST', 5.00, 9.50, '2020-03-04 16:44:44'),
(207, 'MMM8348', NULL, 367, 'CHINGS SS SAUCE', 1.000, 1.00, 'BOX', 45.00, 45.00, 45.00, 0.00, 'CGSTSGST', 12.00, 5.40, '2020-03-04 16:44:44'),
(208, 'MMM8348', NULL, 367, 'CHINGS SS SAUCE', 1.000, 1.00, 'BOX', 45.00, 45.00, 45.00, 0.00, 'CGSTSGST', 12.00, 5.40, '2020-03-04 16:44:44'),
(209, 'MMM8348', NULL, 256, 'ANIL (ARARUT)', 0.500, 1.00, 'KG', 80.00, 40.00, 40.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 16:44:44'),
(210, 'MMM8348', NULL, 81, 'JEERA RAJWADI 100 GM', 1.000, 1.00, 'GRM', 30.00, 30.00, 30.00, 0.00, 'CGSTSGST', 5.00, 1.50, '2020-03-04 16:44:44'),
(211, 'MMM8348', NULL, 751, 'NOBLE JAM 1KG', 1.000, 1.00, 'KG', 110.00, 110.00, 110.00, 0.00, 'CGSTSGST', 12.00, 13.20, '2020-03-04 16:44:44'),
(212, 'MMM8348', NULL, 1166, 'EMLI BARAF', 0.100, 1.00, 'KG', 200.00, 20.00, 20.00, 0.00, 'CGSTSGST', 5.00, 1.00, '2020-03-04 16:44:44'),
(213, 'MMM8349', NULL, 3, 'SUGAR JADI', 1.000, 1.00, 'KG', 40.00, 40.00, 40.00, 0.00, 'CGSTSGST', 5.00, 2.00, '2020-03-04 16:55:46'),
(214, 'MMM8350', NULL, 201, 'SINGDANA NAVA BORIYA', 3.000, 1.00, 'KG', 110.00, 330.00, 330.00, 0.00, 'CGSTSGST', 5.00, 16.50, '2020-03-04 17:55:59'),
(215, 'MMM8350', NULL, 29, 'CHANA DALL', 2.000, 1.00, 'KG', 70.00, 140.00, 140.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 17:55:59'),
(216, 'MMM8350', NULL, 21, 'RAVA JADA', 1.000, 1.00, 'KG', 36.00, 36.00, 36.00, 0.00, 'CGSTSGST', 5.00, 1.80, '2020-03-04 17:55:59'),
(217, 'MMM8350', NULL, 79, 'JEERA 1', 1.000, 1.00, 'KG', 220.00, 220.00, 220.00, 0.00, 'CGSTSGST', 5.00, 11.00, '2020-03-04 17:55:59'),
(218, 'MMM8350', NULL, 171, 'GUD DESHI 1KG', 1.000, 1.00, 'KG', 60.00, 60.00, 60.00, 0.00, 'CGSTSGST', 5.00, 3.00, '2020-03-04 17:55:59'),
(219, 'MMM8350', NULL, 442, 'LONG 50GM ', 1.000, 1.00, 'GRM', 50.00, 50.00, 50.00, 0.00, 'CGSTSGST', 5.00, 2.50, '2020-03-04 17:55:59'),
(220, 'MMM8350', NULL, 26, 'SABUDANA', 1.000, 1.00, 'KG', 80.00, 80.00, 80.00, 0.00, 'CGSTSGST', 5.00, 4.00, '2020-03-04 17:55:59'),
(221, 'MMM8350', NULL, 113, 'WALL', 0.500, 1.00, 'KG', 100.00, 50.00, 50.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 17:55:59'),
(222, 'MMM8350', NULL, 12, 'POHA JADA', 1.000, 1.00, 'KG', 44.00, 44.00, 44.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 17:55:59'),
(223, 'MMM8350', NULL, 315, 'VARIYALI NAVI', 0.250, 1.00, 'KG', 200.00, 50.00, 50.00, 0.00, 'CGSTSGST', 5.00, 2.50, '2020-03-04 17:55:59'),
(224, 'MMM8350', NULL, 153, 'DHANA DAL', 0.250, 1.00, 'KG', 200.00, 50.00, 50.00, 0.00, 'CGSTSGST', 5.00, 2.50, '2020-03-04 17:55:59'),
(225, 'MMM8350', NULL, 13, 'TURDAL NATRAJ', 1.000, 1.00, 'PKT', 100.00, 100.00, 100.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 17:55:59'),
(226, 'MMM8351', NULL, 369, 'CHINGS SCHEZWAN 1KG', 1.000, 1.00, 'KG', 160.00, 160.00, 160.00, 0.00, 'CGSTSGST', 18.00, 28.80, '2020-03-04 17:58:33'),
(227, 'MMM8351', NULL, 819, 'SAUCE DELEMONTE 1KG', 1.000, 1.00, 'KG', 70.00, 70.00, 70.00, 0.00, 'CGSTSGST', 12.00, 8.40, '2020-03-04 17:58:33'),
(228, 'MMM8351', NULL, 364, 'CHINGS GC SAUCE', 1.000, 1.00, 'BOX', 45.00, 45.00, 45.00, 0.00, 'CGSTSGST', 12.00, 5.40, '2020-03-04 17:58:33'),
(229, 'MMM8352', NULL, 236, 'RICE MOGARA KANI', 5.000, 1.00, 'KG', 40.00, 200.00, 200.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 18:05:14'),
(230, 'MMM8352', NULL, 3, 'SUGAR JADI', 3.000, 1.00, 'KG', 40.00, 120.00, 120.00, 0.00, 'CGSTSGST', 5.00, 6.00, '2020-03-04 18:05:14'),
(231, 'MMM8352', NULL, 76, 'MIRCHI KASHMIR POWDER', 0.100, 1.00, 'KG', 250.00, 25.00, 25.00, 0.00, 'CGSTSGST', 5.00, 1.25, '2020-03-04 18:05:14'),
(232, 'MMM8352', NULL, 143, 'HALDI POWDAR 100 gm', 1.000, 1.00, 'GRM', 20.00, 20.00, 20.00, 0.00, 'CGSTSGST', 5.00, 1.00, '2020-03-04 18:05:14'),
(233, 'MMM8352', NULL, 10, 'TURDAL', 0.500, 1.00, 'KG', 80.00, 40.00, 40.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 18:05:14'),
(234, 'MMM8352', NULL, 36, 'MASOOR', 0.500, 1.00, 'KG', 70.00, 35.00, 35.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 18:05:14'),
(235, 'MMM8352', NULL, 363, 'TEA GOLDEN', 0.250, 1.00, 'KG', 240.00, 60.00, 60.00, 0.00, 'CGSTSGST', 5.00, 3.00, '2020-03-04 18:05:14'),
(236, 'MMM8353', NULL, 709, 'MAGAJ KODA', 0.250, 1.00, 'KG', 500.00, 125.00, 125.00, 0.00, 'CGSTSGST', 12.00, 15.00, '2020-03-04 18:36:43'),
(237, 'MMM8353', NULL, 1248, 'SEEDS SUNFLOWER', 0.250, 1.00, 'KG', 320.00, 80.00, 80.00, 0.00, 'CGSTSGST', 5.00, 4.00, '2020-03-04 18:36:44'),
(238, 'MMM8353', NULL, 708, 'MAGAJ KHARBUJA', 0.250, 1.00, 'KG', 600.00, 150.00, 150.00, 0.00, 'CGSTSGST', 5.00, 7.50, '2020-03-04 18:36:44'),
(239, 'MMM8353', NULL, 311, 'VARIYALI 100GM', 2.000, 1.00, 'GRM', 30.00, 60.00, 60.00, 0.00, 'CGSTSGST', 5.00, 3.00, '2020-03-04 18:36:44'),
(240, 'MMM8353', NULL, 131, 'SUGAR RAVAL GAON', 0.250, 1.00, 'KG', 80.00, 20.00, 20.00, 0.00, 'CGSTSGST', 5.00, 1.00, '2020-03-04 18:36:44'),
(241, 'MMM8353', NULL, 509, 'KHARAK R', 1.000, 1.00, 'KG', 320.00, 320.00, 320.00, 0.00, 'CGSTSGST', 12.00, 38.40, '2020-03-04 18:36:44'),
(242, 'MMM8353', NULL, 889, 'KHAMAN SALI', 0.500, 1.00, 'KG', 240.00, 120.00, 120.00, 0.00, 'CGSTSGST', 5.00, 6.00, '2020-03-04 18:36:44'),
(243, 'MMM8353', NULL, 601, 'GUNDER KANI 2', 0.250, 1.00, 'KG', 240.00, 60.00, 60.00, 0.00, 'CGSTSGST', 5.00, 3.00, '2020-03-04 18:36:44'),
(244, 'MMM8353', NULL, 565, 'METHI R', 0.100, 1.00, 'KG', 200.00, 20.00, 20.00, 0.00, 'CGSTSGST', 5.00, 1.00, '2020-03-04 18:36:44'),
(245, 'MMM8353', NULL, 200, 'SINGDANA LATUR', 1.000, 1.00, 'KG', 100.00, 100.00, 100.00, 0.00, 'CGSTSGST', 5.00, 5.00, '2020-03-04 18:36:44'),
(246, 'MMM8353', NULL, 421, 'KHASKHAS 100GM', 1.000, 1.00, 'GRM', 180.00, 180.00, 180.00, 0.00, 'CGSTSGST', 5.00, 9.00, '2020-03-04 18:36:44'),
(247, 'MMM8353', NULL, 545, 'ELACHI GREEN 100GM', 1.000, 1.00, 'PKT', 480.00, 480.00, 480.00, 0.00, 'CGSTSGST', 5.00, 24.00, '2020-03-04 18:36:44'),
(248, 'MMM8353', NULL, 789, 'KANHAIYA MAMRA', 1.000, 1.00, 'GRM', 30.00, 30.00, 30.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 18:36:44'),
(249, 'MMM8353', NULL, 181, 'CHANA ROASTED ', 0.500, 1.00, 'KG', 140.00, 70.00, 70.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 18:36:44'),
(250, 'MMM8353', NULL, 937, 'SHINGODA', 0.250, 1.00, 'KG', 480.00, 120.00, 120.00, 0.00, 'CGSTSGST', 5.00, 6.00, '2020-03-04 18:36:44'),
(251, 'MMM8354', NULL, 911, 'HERSHEYS CHOCOLATE SYRUP', 1.000, 1.00, 'LTR', 170.00, 170.00, 170.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 18:40:38'),
(252, 'MMM8354', NULL, 752, 'NOBLE JAM 500GM', 1.000, 1.00, 'GRM', 70.00, 70.00, 70.00, 0.00, 'CGSTSGST', 12.00, 8.40, '2020-03-04 18:40:38'),
(253, 'MMM8354', NULL, 1130, 'MAYONNAISE ALFA 1KG', 1.000, 1.00, 'KG', 90.00, 90.00, 90.00, 0.00, 'CGSTSGST', 12.00, 10.80, '2020-03-04 18:40:38'),
(254, 'MMM8354', NULL, 762, 'SV MANGO 200gm', 1.000, 1.00, 'GRM', 35.00, 35.00, 35.00, 0.00, 'CGSTSGST', 12.00, 4.20, '2020-03-04 18:40:38'),
(255, 'MMM8354', NULL, 782, 'NOODLE ', 4.000, 1.00, 'PCS', 6.00, 24.00, 24.00, 0.00, 'CGSTSGST', 18.00, 4.32, '2020-03-04 18:40:38'),
(256, 'MMM8354', NULL, 1127, 'SHAHANA KHEER MIX', 1.000, 1.00, 'GRM', 45.00, 45.00, 45.00, 0.00, 'CGSTSGST', 5.00, 2.25, '2020-03-04 18:40:38'),
(257, 'MMM8354', NULL, 1104, 'LADDU', 0.250, 1.00, 'KG', 200.00, 50.00, 50.00, 0.00, 'CGSTSGST', 5.00, 2.50, '2020-03-04 18:40:38'),
(258, 'MMM8354', NULL, 324, 'CHIKKI 100GM', 1.000, 1.00, 'GRM', 18.00, 18.00, 18.00, 0.00, 'CGSTSGST', 12.00, 2.16, '2020-03-04 18:40:38'),
(259, 'MMM8355', NULL, 29, 'CHANA DALL', 0.250, 1.00, 'KG', 80.00, 20.00, 20.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 18:47:30'),
(260, 'MMM8355', NULL, 193, 'KOPARA A1 RAJAPUR', 0.250, 1.00, 'KG', 200.00, 50.00, 50.00, 0.00, 'CGSTSGST', 5.00, 2.50, '2020-03-04 18:47:30'),
(261, 'MMM8355', NULL, 154, 'DHANA INDORI', 0.250, 1.00, 'KG', 200.00, 50.00, 50.00, 0.00, 'CGSTSGST', 5.00, 2.50, '2020-03-04 18:47:30'),
(262, 'MMM8355', NULL, 94, 'RAI A1 100GM', 1.000, 1.00, 'GRM', 15.00, 15.00, 15.00, 0.00, 'CGSTSGST', 5.00, 0.75, '2020-03-04 18:47:30'),
(263, 'MMM8355', NULL, 81, 'JEERA RAJWADI 100 GM', 1.000, 1.00, 'GRM', 30.00, 30.00, 30.00, 0.00, 'CGSTSGST', 5.00, 1.50, '2020-03-04 18:47:30'),
(264, 'MMM8355', NULL, 1147, 'JEERA POWDER A1', 0.100, 1.00, 'KG', 400.00, 40.00, 40.00, 0.00, 'CGSTSGST', 5.00, 2.00, '2020-03-04 18:47:30'),
(265, 'MMM8355', NULL, 69, 'MASALA GARAM D', 0.100, 1.00, 'KG', 400.00, 40.00, 40.00, 0.00, 'CGSTSGST', 5.00, 2.00, '2020-03-04 18:47:30'),
(266, 'MMM8355', NULL, 76, 'MIRCHI KASHMIR POWDER', 0.250, 1.00, 'KG', 180.00, 45.00, 45.00, 0.00, 'CGSTSGST', 5.00, 2.25, '2020-03-04 18:47:30'),
(267, 'MMM8355', NULL, 21, 'RAVA JADA', 0.500, 1.00, 'KG', 36.00, 18.00, 18.00, 0.00, 'CGSTSGST', 5.00, 0.90, '2020-03-04 18:47:30'),
(268, 'MMM8355', NULL, 1097, 'KANDA LASUN CHATNI', 0.100, 1.00, 'KG', 250.00, 25.00, 25.00, 0.00, 'CGSTSGST', 5.00, 1.25, '2020-03-04 18:47:30'),
(269, 'MMM8355', NULL, 203, 'SINGDANA NAVA DISKO', 0.250, 1.00, 'KG', 120.00, 30.00, 30.00, 0.00, 'CGSTSGST', 5.00, 1.50, '2020-03-04 18:47:30'),
(270, 'MMM8355', NULL, 166, 'GUD 250GM', 1.000, 1.00, 'GRM', 15.00, 15.00, 15.00, 0.00, 'CGSTSGST', 5.00, 0.75, '2020-03-04 18:47:30'),
(271, 'MMM8356', NULL, 62, 'MATHKI', 0.500, 1.00, 'KG', 90.00, 45.00, 45.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 18:48:09'),
(272, 'MMM8356', NULL, 56, 'VATANA KALA 1', 0.500, 1.00, 'KG', 90.00, 45.00, 45.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 18:48:09'),
(273, 'MMM8356', NULL, 43, 'UDAD DALL', 0.500, 1.00, 'KG', 110.00, 55.00, 55.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-04 18:48:09'),
(274, 'MMM8357', NULL, 3, 'SUGAR JADI', 1.000, 1.00, 'KG', 40.00, 40.00, 40.00, 0.00, 'CGSTSGST', 5.00, 2.00, '2020-03-05 10:34:07'),
(275, 'MMM8358', NULL, 193, 'KOPARA A1 RAJAPUR', 0.500, 1.00, 'KG', 200.00, 100.00, 100.00, 0.00, 'CGSTSGST', 5.00, 5.00, '2020-03-05 11:32:23'),
(276, 'MMM8358', NULL, 386, 'BADAM NAVI', 0.500, 1.00, 'KG', 760.00, 380.00, 380.00, 0.00, 'CGSTSGST', 12.00, 45.60, '2020-03-05 11:32:23'),
(277, 'MMM8358', NULL, 131, 'SUGAR RAVAL GAON', 1.000, 1.00, 'KG', 58.00, 58.00, 58.00, 0.00, 'CGSTSGST', 5.00, 2.90, '2020-03-05 11:32:23'),
(278, 'MMM8359', NULL, 13, 'TURDAL NATRAJ', 0.500, 1.00, 'PKT', 100.00, 50.00, 50.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 11:41:40'),
(279, 'MMM8359', NULL, 29, 'CHANA DALL', 0.500, 1.00, 'KG', 70.00, 35.00, 35.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 11:41:40'),
(280, 'MMM8359', NULL, 80, 'JEERA RAJWADI', 0.250, 1.00, 'KG', 240.00, 60.00, 60.00, 0.00, 'CGSTSGST', 5.00, 3.00, '2020-03-05 11:41:40'),
(281, 'MMM8360', NULL, 43, 'UDAD DALL', 2.000, 1.00, 'KG', 110.00, 220.00, 220.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 11:48:57'),
(282, 'MMM8361', NULL, 13, 'TURDAL NATRAJ', 1.000, 1.00, 'KG', 100.00, 100.00, 100.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 11:57:00'),
(283, 'MMM8361', NULL, 8, 'MOGAR A1', 0.500, 1.00, 'KG', 120.00, 60.00, 60.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 11:57:00'),
(284, 'MMM8361', NULL, 12, 'POHA JADA', 1.000, 1.00, 'KG', 44.00, 44.00, 44.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 11:57:00'),
(285, 'MMM8361', NULL, 21, 'RAVA JADA', 0.500, 1.00, 'KG', 36.00, 18.00, 18.00, 0.00, 'CGSTSGST', 5.00, 0.90, '2020-03-05 11:57:00'),
(286, 'MMM8361', NULL, 494, 'KHAJUR', 1.000, 1.00, 'KG', 120.00, 120.00, 120.00, 0.00, 'CGSTSGST', 12.00, 14.40, '2020-03-05 11:57:00'),
(287, 'MMM8361', NULL, 1279, 'KOPARA 2 RAJAPUR ', 0.500, 1.00, 'KG', 180.00, 90.00, 90.00, 0.00, 'CGSTSGST', 5.00, 4.50, '2020-03-05 11:57:00'),
(288, 'MMM8361', NULL, 44, 'UDAD DALL 1', 1.000, 1.00, 'KG', 120.00, 120.00, 120.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 11:57:00'),
(289, 'MMM8361', NULL, 64, 'MATHKI GAWRAN (BARIK)', 0.500, 1.00, 'KG', 120.00, 60.00, 60.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 11:57:00'),
(290, 'MMM8361', NULL, 78, 'GUD 1no', 1.000, 1.00, 'KG', 56.00, 56.00, 56.00, 0.00, 'CGSTSGST', 5.00, 2.80, '2020-03-05 11:57:00'),
(291, 'MMM8361', NULL, 30, 'CHANA DALL 1', 1.000, 1.00, 'KG', 75.00, 75.00, 75.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 11:57:00'),
(292, 'MMM8361', NULL, 201, 'SINGDANA BORIYA', 1.500, 1.00, 'KG', 110.00, 165.00, 165.00, 0.00, 'CGSTSGST', 5.00, 8.25, '2020-03-05 11:57:00'),
(293, 'MMM8361', NULL, 782, 'NOODLE ', 6.000, 1.00, 'PCS', 6.00, 36.00, 36.00, 0.00, 'CGSTSGST', 18.00, 6.48, '2020-03-05 11:57:00'),
(294, 'MMM8361', NULL, 80, 'JEERA RAJWADI', 0.250, 1.00, 'KG', 240.00, 60.00, 60.00, 0.00, 'CGSTSGST', 5.00, 3.00, '2020-03-05 11:57:00'),
(295, 'MMM8361', NULL, 315, 'VARIYALI NAVI', 0.250, 1.00, 'KG', 200.00, 50.00, 50.00, 0.00, 'CGSTSGST', 5.00, 2.50, '2020-03-05 11:57:00'),
(296, 'MMM8361', NULL, 76, 'MIRCHI KASHMIR POWDER', 0.250, 1.00, 'KG', 180.00, 45.00, 45.00, 0.00, 'CGSTSGST', 5.00, 2.25, '2020-03-05 11:57:00'),
(297, 'MMM8361', NULL, 635, 'EV PAVBHAJI  100GM', 1.000, 1.00, 'GRM', 60.00, 60.00, 60.00, 0.00, 'CGSTSGST', 5.00, 3.00, '2020-03-05 11:57:00'),
(298, 'MMM8361', NULL, 384, 'BADAM 1 NO  ', 0.250, 1.00, 'KG', 720.00, 180.00, 180.00, 0.00, 'CGSTSGST', 12.00, 21.60, '2020-03-05 11:57:00'),
(299, 'MMM8362', NULL, 479, 'DRAKSH ', 0.250, 1.00, 'KG', 320.00, 80.00, 80.00, 0.00, 'CGSTSGST', 5.00, 4.00, '2020-03-05 13:59:52'),
(300, 'MMM8362', NULL, 474, 'AKHROD PONIYA MAGAJ', 0.250, 1.00, 'KG', 1200.00, 300.00, 300.00, 0.00, 'CGSTSGST', 5.00, 15.00, '2020-03-05 13:59:52'),
(316, 'MMM8363', NULL, 43, 'UDAD DALL', 3.000, 1.00, 'KG', 110.00, 330.00, 330.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 14:03:01'),
(317, 'MMM8363', NULL, 61, 'MATH DAL', 2.000, 1.00, 'KG', 110.00, 220.00, 220.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 14:03:01'),
(318, 'MMM8363', NULL, 76, 'MIRCHI KASHMIR POWDER', 0.100, 1.00, 'KG', 250.00, 25.00, 25.00, 0.00, 'CGSTSGST', 5.00, 1.25, '2020-03-05 14:03:01'),
(319, 'MMM8363', NULL, 967, 'RB PAPAD ATTA 2KG', 3.000, 1.00, 'KG', 45.00, 135.00, 135.00, 0.00, 'CGSTSGST', 5.00, 6.75, '2020-03-05 14:03:01'),
(320, 'MMM8363', NULL, 29, 'CHANA DALL', 1.000, 1.00, 'KG', 70.00, 70.00, 70.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 14:03:01'),
(321, 'MMM8363', NULL, 7, 'MOGAR ', 0.500, 1.00, 'KG', 110.00, 55.00, 55.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 14:03:20'),
(322, 'MMM8364', NULL, 1047, 'HARI OM CHAS MASALA 100GM', 2.000, 1.00, 'GRM', 20.00, 40.00, 40.00, 0.00, 'CGSTSGST', 5.00, 2.00, '2020-03-05 14:04:28'),
(323, 'MMM8365', NULL, 410, 'KAJU TUKDA 6', 1.000, 1.00, 'KG', 480.00, 480.00, 480.00, 0.00, 'CGSTSGST', 5.00, 24.00, '2020-03-05 14:09:49'),
(324, 'MMM8366', NULL, 855, 'FIVESTAR CORNFLOUR 500GM', 1.000, 1.00, 'GRM', 50.00, 50.00, 50.00, 0.00, 'CGSTSGST', 28.00, 14.00, '2020-03-05 14:17:16'),
(325, 'MMM8366', NULL, 860, 'FIVESTAR CUSTARD 500GM', 1.000, 1.00, 'GRM', 55.00, 55.00, 55.00, 0.00, 'CGSTSGST', 28.00, 15.40, '2020-03-05 14:17:16'),
(326, 'MMM8367', NULL, 13, 'TURDAL NATRAJ', 2.000, 1.00, 'KG', 90.00, 180.00, 180.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 14:23:00'),
(327, 'MMM8367', NULL, 181, 'CHANA ROASTED ', 1.000, 1.00, 'KG', 120.00, 120.00, 120.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 14:23:00'),
(328, 'MMM8367', NULL, 299, 'SINGDANA ROASTED', 1.000, 1.00, 'KG', 120.00, 120.00, 120.00, 0.00, 'CGSTSGST', 5.00, 6.00, '2020-03-05 14:23:00'),
(329, 'MMM8368', NULL, 1279, 'KOPARA 2 RAJAPUR ', 0.500, 1.00, 'KG', 180.00, 90.00, 90.00, 0.00, 'CGSTSGST', 5.00, 4.50, '2020-03-05 14:25:20'),
(330, 'MMM8368', NULL, 515, 'KHARAK BLACK POWDER', 0.250, 1.00, 'KG', 280.00, 70.00, 70.00, 0.00, 'CGSTSGST', 12.00, 8.40, '2020-03-05 14:25:20'),
(331, 'MMM8369', NULL, 422, 'KAJU S 320', 1.000, 1.00, 'KG', 680.00, 680.00, 680.00, 0.00, 'CGSTSGST', 5.00, 34.00, '2020-03-05 14:26:05'),
(332, 'MMM8369', NULL, 384, 'BADAM 1 NO  ', 1.000, 1.00, 'KG', 720.00, 720.00, 720.00, 0.00, 'CGSTSGST', 12.00, 86.40, '2020-03-05 14:26:05'),
(333, 'MMM8369', NULL, 508, 'KHARAK AA', 0.500, 1.00, 'KG', 240.00, 120.00, 120.00, 0.00, 'CGSTSGST', 12.00, 14.40, '2020-03-05 14:26:05'),
(334, 'MMM8369', NULL, 507, 'KHAJUR OMAN', 0.500, 1.00, 'PKT', 280.00, 140.00, 140.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 14:26:05'),
(335, 'MMM8369', NULL, 460, 'PISTA A1', 0.250, 1.00, 'KG', 1400.00, 350.00, 350.00, 0.00, 'CGSTSGST', 12.00, 42.00, '2020-03-05 14:26:05'),
(336, 'MMM8369', NULL, 159, 'DHANA VM ', 0.750, 1.00, 'KG', 160.00, 120.00, 120.00, 0.00, 'CGSTSGST', 5.00, 6.00, '2020-03-05 14:26:05'),
(337, 'MMM8369', NULL, 528, 'MARI BLACK ', 0.250, 1.00, 'KG', 440.00, 110.00, 110.00, 0.00, 'CGSTSGST', 5.00, 5.50, '2020-03-05 14:26:05'),
(338, 'MMM8369', NULL, 420, 'KHASKHAS RATLAM', 0.250, 1.00, 'KG', 1100.00, 275.00, 275.00, 0.00, 'CGSTSGST', 5.00, 13.75, '2020-03-05 14:26:05'),
(339, 'MMM8369', NULL, 622, 'TAJ LAL ', 0.100, 1.00, 'KG', 800.00, 80.00, 80.00, 0.00, 'CGSTSGST', 5.00, 4.00, '2020-03-05 14:26:05'),
(340, 'MMM8369', NULL, 79, 'JEERA 1', 0.500, 1.00, 'KG', 260.00, 130.00, 130.00, 0.00, 'CGSTSGST', 5.00, 6.50, '2020-03-05 14:26:05'),
(341, 'MMM8369', NULL, 409, 'DAGADPHOOL ', 0.100, 1.00, 'KG', 1600.00, 160.00, 160.00, 0.00, 'CGSTSGST', 5.00, 8.00, '2020-03-05 14:26:05'),
(342, 'MMM8369', NULL, 311, 'VARIYALI 100GM', 1.000, 1.00, 'GRM', 30.00, 30.00, 30.00, 0.00, 'CGSTSGST', 5.00, 1.50, '2020-03-05 14:26:05'),
(343, 'MMM8369', NULL, 483, 'KISMIS 2no', 0.250, 1.00, 'KG', 320.00, 80.00, 80.00, 0.00, 'CGSTSGST', 5.00, 4.00, '2020-03-05 14:26:05'),
(344, 'MMM8369', NULL, 518, 'TEJPATTA 100gm', 1.000, 1.00, 'GRM', 40.00, 40.00, 40.00, 0.00, 'CGSTSGST', 5.00, 2.00, '2020-03-05 14:26:05'),
(345, 'MMM8369', NULL, 546, 'ELACHI GREEN 50GM', 1.000, 1.00, 'PKT', 240.00, 240.00, 240.00, 0.00, 'CGSTSGST', 5.00, 12.00, '2020-03-05 14:26:05'),
(346, 'MMM8369', NULL, 616, 'MAGADIYA 1 PC', 3.000, 1.00, 'PCS', 8.00, 24.00, 24.00, 0.00, 'CGSTSGST', 5.00, 1.20, '2020-03-05 14:26:05'),
(347, 'MMM8369', NULL, 437, 'LONG', 0.250, 1.00, 'KG', 900.00, 225.00, 225.00, 0.00, 'CGSTSGST', 5.00, 11.25, '2020-03-05 14:26:05'),
(348, 'MMM8369', NULL, 391, 'ALCHA KALA 2', 0.250, 1.00, 'KG', 1200.00, 300.00, 300.00, 0.00, 'CGSTSGST', 5.00, 15.00, '2020-03-05 14:26:05'),
(349, 'MMM8369', NULL, 94, 'RAI A1 100GM', 1.000, 1.00, 'GRM', 15.00, 15.00, 15.00, 0.00, 'CGSTSGST', 5.00, 0.75, '2020-03-05 14:26:05'),
(350, 'MMM8369', NULL, 565, 'METHI R', 0.100, 1.00, 'KG', 200.00, 20.00, 20.00, 0.00, 'CGSTSGST', 5.00, 1.00, '2020-03-05 14:26:05'),
(351, 'MMM8369', NULL, 75, 'MIRCHI HIRAKANI POWDER', 0.250, 1.00, 'KG', 200.00, 50.00, 50.00, 0.00, 'CGSTSGST', 5.00, 2.50, '2020-03-05 14:26:05'),
(352, 'MMM8369', NULL, 403, 'BADIYAN 100GM', 1.000, 1.00, 'GRM', 160.00, 160.00, 160.00, 0.00, 'CGSTSGST', 5.00, 8.00, '2020-03-05 14:26:05'),
(353, 'MMM8369', NULL, 188, 'NAMAK SUNCHAL POWDER', 0.250, 1.00, 'KG', 60.00, 15.00, 15.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 14:26:05'),
(354, 'MMM8369', NULL, 1166, 'EMLI BARAF', 0.250, 1.00, 'KG', 200.00, 50.00, 50.00, 0.00, 'CGSTSGST', 5.00, 2.50, '2020-03-05 14:26:05'),
(355, 'MMM8369', NULL, 436, 'JAVANTRI 10GM', 1.000, 1.00, 'GRM', 60.00, 60.00, 60.00, 0.00, 'CGSTSGST', 5.00, 3.00, '2020-03-05 14:26:05'),
(356, 'MMM8369', NULL, 540, 'KABABCHINI', 0.250, 1.00, 'KG', 800.00, 200.00, 200.00, 0.00, 'CGSTSGST', 5.00, 10.00, '2020-03-05 14:26:05'),
(357, 'MMM8370', NULL, 19, 'TURDAL TELDAL', 1.000, 1.00, 'KG', 100.00, 100.00, 100.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 14:26:47'),
(358, 'MMM8370', NULL, 3, 'SUGAR JADI', 1.000, 1.00, 'KG', 40.00, 40.00, 40.00, 0.00, 'CGSTSGST', 5.00, 2.00, '2020-03-05 14:26:47'),
(359, 'MMM8370', NULL, 432, 'KAJU CHILKA A1', 0.500, 1.00, 'KG', 800.00, 400.00, 400.00, 0.00, 'CGSTSGST', 5.00, 20.00, '2020-03-05 14:26:47'),
(360, 'MMM8370', NULL, 113, 'WALL', 0.500, 1.00, 'KG', 100.00, 50.00, 50.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 14:26:47'),
(361, 'MMM8369', NULL, 884, 'FALUDA', 2.000, 1.00, 'PKT', 25.00, 50.00, 50.00, 0.00, 'CGSTSGST', 5.00, 2.50, '2020-03-05 14:28:30'),
(362, 'MMM8371', NULL, 642, 'BD PAVBHAJI 100GM', 1.000, 1.00, 'GRM', 65.00, 65.00, 65.00, 0.00, 'CGSTSGST', 5.00, 3.25, '2020-03-05 14:31:16'),
(363, 'MMM8372', NULL, 501, 'KHAJUR KAMRAN ', 1.000, 1.00, 'KG', 240.00, 240.00, 240.00, 0.00, 'CGSTSGST', 12.00, 28.80, '2020-03-05 14:36:42'),
(364, 'MMM8372', NULL, 485, 'KISMIS LAMBI', 0.500, 1.00, 'KG', 320.00, 160.00, 160.00, 0.00, 'CGSTSGST', 5.00, 8.00, '2020-03-05 14:36:42'),
(365, 'MMM8373', NULL, 780, 'NOODEL BOX', 1.000, 1.00, 'BOX', 130.00, 130.00, 130.00, 0.00, 'CGSTSGST', 18.00, 23.40, '2020-03-05 14:37:05'),
(366, 'MMM8374', NULL, 96, 'RAI DAL', 1.000, 1.00, 'KG', 120.00, 120.00, 120.00, 0.00, 'CGSTSGST', 5.00, 6.00, '2020-03-05 14:41:19'),
(367, 'MMM8374', NULL, 884, 'FALUDA', 2.000, 1.00, 'PKT', 25.00, 50.00, 50.00, 0.00, 'CGSTSGST', 5.00, 2.50, '2020-03-05 14:41:19'),
(368, 'MMM8375', NULL, 176, 'GAHU  SEHARI A1', 5.000, 1.00, 'KG', 36.00, 180.00, 180.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 14:45:16'),
(369, 'MMM8375', NULL, 219, 'RICE CHAPI KOLUM', 5.000, 1.00, 'KG', 55.00, 275.00, 275.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 14:45:16'),
(370, 'MMM8376', NULL, 384, 'BADAM 1 NO  ', 1.000, 1.00, 'KG', 720.00, 720.00, 720.00, 0.00, 'CGSTSGST', 12.00, 86.40, '2020-03-05 14:47:13'),
(371, 'MMM8377', NULL, 430, 'JAVANTRI 100GM', 1.000, 1.00, 'GRM', 200.00, 200.00, 176.00, 12.00, 'CGSTSGST', 5.00, 8.80, '2020-03-05 14:49:54'),
(372, 'MMM8378', NULL, 461, 'PISTA A1 100gm', 2.000, 1.00, 'KG', 200.00, 400.00, 352.00, 12.00, 'CGSTSGST', 12.00, 42.24, '2020-03-05 14:52:47'),
(373, 'MMM8379', NULL, 51, 'VATANA GREEN', 0.500, 1.00, 'KG', 140.00, 70.00, 70.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 15:02:12'),
(374, 'MMM8379', NULL, 58, 'VATANA SAFED', 0.500, 1.00, 'KG', 80.00, 40.00, 40.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 15:02:12'),
(375, 'MMM8379', NULL, 32, 'CHANA ', 0.500, 1.00, 'KG', 70.00, 35.00, 35.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 15:02:12'),
(376, 'MMM8380', NULL, 500, 'KHAJUR KALMI', 0.500, 1.00, 'KG', 520.00, 260.00, 260.00, 0.00, 'CGSTSGST', 12.00, 31.20, '2020-03-05 15:18:19'),
(377, 'MMM8380', NULL, 60, 'VATANA SAFED A1', 1.000, 1.00, 'KG', 100.00, 100.00, 100.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 15:18:19');
INSERT INTO `salesdetailsmaster_03_2020` (`id`, `invoiceid`, `prodid`, `prodid_`, `bprodname`, `istock`, `iinstock`, `unit`, `salesrate`, `prodtotal`, `prodttotal`, `discount`, `gst`, `bgstper`, `gstamount`, `added_on`) VALUES
(378, 'MMM8380', NULL, 417, 'KAJU TUKDA KALBAVI ', 0.500, 1.00, 'KG', 800.00, 400.00, 400.00, 0.00, 'CGSTSGST', 5.00, 20.00, '2020-03-05 15:18:19'),
(379, 'MMM8380', NULL, 705, 'MAGAJ WATERMELON', 0.250, 1.00, 'KG', 200.00, 50.00, 50.00, 0.00, 'CGSTSGST', 5.00, 2.50, '2020-03-05 15:18:19'),
(380, 'MMM8380', NULL, 442, 'LONG 50GM ', 1.000, 1.00, 'GRM', 50.00, 50.00, 50.00, 0.00, 'CGSTSGST', 5.00, 2.50, '2020-03-05 15:18:19'),
(381, 'MMM8380', NULL, 482, 'DRAKSH SEEDLESS KALI', 0.500, 1.00, 'KG', 360.00, 180.00, 180.00, 0.00, 'CGSTSGST', 5.00, 9.00, '2020-03-05 15:18:19'),
(382, 'MMM8381', NULL, 23, 'RAVA BARIK', 1.000, 1.00, 'KG', 36.00, 36.00, 36.00, 0.00, 'CGSTSGST', 5.00, 1.80, '2020-03-05 15:24:37'),
(383, 'MMM8381', NULL, 169, 'GUD CHIKKI', 1.000, 1.00, 'KG', 60.00, 60.00, 60.00, 0.00, 'CGSTSGST', 5.00, 3.00, '2020-03-05 15:24:37'),
(384, 'MMM8381', NULL, 865, 'FIVESTAR CORNFLOUR 200GM', 1.000, 1.00, 'GRM', 28.00, 28.00, 28.00, 0.00, 'CGSTSGST', 28.00, 7.84, '2020-03-05 15:24:37'),
(385, 'MMM8382', NULL, 1166, 'EMLI BARAF', 0.250, 1.00, 'KG', 160.00, 40.00, 40.00, 0.00, 'CGSTSGST', 5.00, 2.00, '2020-03-05 15:31:41'),
(386, 'MMM8382', NULL, 226, 'RICE HMT KOLUM', 2.000, 1.00, 'KG', 55.00, 110.00, 110.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 15:31:41'),
(387, 'MMM8383', NULL, 826, 'SURBHI SAUCE POUCH 1KG', 1.000, 1.00, 'LTR', 75.00, 75.00, 75.00, 0.00, 'CGSTSGST', 8.00, 6.00, '2020-03-05 15:50:10'),
(388, 'MMM8383', NULL, 783, 'NOODLE FRY', 0.500, 1.00, 'KG', 70.00, 35.00, 35.00, 0.00, 'CGSTSGST', 18.00, 6.30, '2020-03-05 15:50:10'),
(389, 'MMM8384', NULL, 1055, 'HALIM 100GM', 1.000, 1.00, 'GRM', 20.00, 20.00, 20.00, 0.00, 'CGSTSGST', 5.00, 1.00, '2020-03-05 15:59:05'),
(390, 'MMM8384', NULL, 218, 'AJMA 100gm', 1.000, 1.00, 'GRM', 50.00, 50.00, 50.00, 0.00, 'CGSTSGST', 5.00, 2.50, '2020-03-05 15:59:05'),
(391, 'MMM8384', NULL, 565, 'METHI R', 0.100, 1.00, 'KG', 200.00, 20.00, 20.00, 0.00, 'CGSTSGST', 5.00, 1.00, '2020-03-05 15:59:05'),
(392, 'MMM8384', NULL, 574, 'SUNTH KORI A1', 0.050, 1.00, 'KG', 500.00, 25.00, 25.00, 0.00, 'CGSTSGST', 5.00, 1.25, '2020-03-05 15:59:05'),
(393, 'MMM8385', NULL, 80, 'JEERA RAJWADI', 0.250, 1.00, 'KG', 240.00, 60.00, 60.00, 0.00, 'CGSTSGST', 5.00, 3.00, '2020-03-05 16:04:05'),
(394, 'MMM8385', NULL, 152, 'DHANA', 0.500, 1.00, 'KG', 120.00, 60.00, 60.00, 0.00, 'CGSTSGST', 5.00, 3.00, '2020-03-05 16:04:05'),
(395, 'MMM8385', NULL, 1279, 'KOPARA 2 RAJAPUR ', 0.500, 1.00, 'KG', 160.00, 80.00, 80.00, 0.00, 'CGSTSGST', 5.00, 4.00, '2020-03-05 16:04:05'),
(396, 'MMM8385', NULL, 981, 'HING VANDEVI Y. POWDER 50GM', 1.000, 1.00, 'GRM', 40.00, 40.00, 40.00, 0.00, 'CGSTSGST', 5.00, 2.00, '2020-03-05 16:04:05'),
(397, 'MMM8386', NULL, 515, 'KHARAK BLACK POWDER', 1.000, 1.00, 'KG', 320.00, 320.00, 320.00, 0.00, 'CGSTSGST', 12.00, 38.40, '2020-03-05 16:38:10'),
(398, 'MMM8386', NULL, 424, 'KAJU NURANI', 0.500, 1.00, 'KG', 800.00, 400.00, 400.00, 0.00, 'CGSTSGST', 5.00, 20.00, '2020-03-05 16:38:10'),
(399, 'MMM8386', NULL, 462, 'PISTA KHARA 1', 0.250, 1.00, 'KG', 1200.00, 300.00, 300.00, 0.00, 'CGSTSGST', 12.00, 36.00, '2020-03-05 16:38:10'),
(400, 'MMM8386', NULL, 384, 'BADAM 1 NO  ', 0.250, 1.00, 'KG', 720.00, 180.00, 180.00, 0.00, 'CGSTSGST', 12.00, 21.60, '2020-03-05 16:38:27'),
(401, 'MMM8387', NULL, 437, 'LONG', 1.200, 1.00, 'KG', 800.00, 960.00, 960.00, 0.00, 'CGSTSGST', 5.00, 48.00, '2020-03-05 17:20:51'),
(402, 'MMM8387', NULL, 490, 'TAJ 2', 1.200, 1.00, 'KG', 400.00, 480.00, 480.00, 0.00, 'CGSTSGST', 5.00, 24.00, '2020-03-05 17:20:51'),
(403, 'MMM8387', NULL, 529, 'MARI BLACK A1', 1.200, 1.00, 'KG', 500.00, 600.00, 600.00, 0.00, 'CGSTSGST', 5.00, 30.00, '2020-03-05 17:20:51'),
(404, 'MMM8387', NULL, 352, 'CHILLY KASHMIRI', 0.600, 1.00, 'KG', 300.00, 180.00, 180.00, 0.00, 'CGSTSGST', 5.00, 9.00, '2020-03-05 17:20:51'),
(405, 'MMM8387', NULL, 409, 'DAGADPHOOL ', 0.600, 1.00, 'KG', 800.00, 480.00, 480.00, 0.00, 'CGSTSGST', 5.00, 24.00, '2020-03-05 17:20:51'),
(406, 'MMM8387', NULL, 616, 'MAGADIYA 1 PC', 12.000, 1.00, 'PCS', 10.00, 120.00, 120.00, 0.00, 'CGSTSGST', 5.00, 6.00, '2020-03-05 17:20:51'),
(407, 'MMM8387', NULL, 428, 'JAVANTRI', 0.600, 1.00, 'KG', 2800.00, 1680.00, 1680.00, 0.00, 'CGSTSGST', 5.00, 84.00, '2020-03-05 17:20:51'),
(408, 'MMM8387', NULL, 401, 'BADIYAN A1', 1.200, 1.00, 'KG', 800.00, 960.00, 960.00, 0.00, 'CGSTSGST', 5.00, 48.00, '2020-03-05 17:20:51'),
(409, 'MMM8387', NULL, 83, 'JEERA SHAJEERA', 1.200, 1.00, 'KG', 800.00, 960.00, 960.00, 0.00, 'CGSTSGST', 5.00, 48.00, '2020-03-05 17:20:51'),
(410, 'MMM8387', NULL, 517, 'TEJPATTA A1', 1.200, 1.00, 'KG', 200.00, 240.00, 240.00, 0.00, 'CGSTSGST', 5.00, 12.00, '2020-03-05 17:20:51'),
(411, 'MMM8387', NULL, 982, 'ALCHA BHUTAN KALA', 1.200, 1.00, 'GRM', 1400.00, 1680.00, 1680.00, 0.00, 'CGSTSGST', 5.00, 84.00, '2020-03-05 17:20:51'),
(412, 'MMM8387', NULL, 420, 'KHASKHAS RATLAM', 0.600, 1.00, 'KG', 1200.00, 720.00, 720.00, 0.00, 'CGSTSGST', 5.00, 36.00, '2020-03-05 17:20:51'),
(413, 'MMM8387', NULL, 616, 'MAGADIYA 1 PC', 12.000, 1.00, 'PCS', 10.00, 120.00, 120.00, 0.00, 'CGSTSGST', 5.00, 6.00, '2020-03-05 17:20:51'),
(414, 'MMM8387', NULL, 1277, 'DELIVERY CHARGE ', 1.000, 1.00, 'PKT', 80.00, 80.00, 80.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 17:20:51'),
(415, 'MMM8388', NULL, 687, 'EV GARAM SUPER 200GM', 1.000, 1.00, 'GRM', 70.00, 70.00, 70.00, 0.00, 'CGSTSGST', 5.00, 3.50, '2020-03-05 17:38:19'),
(416, 'MMM8388', NULL, 635, 'EV PAVBHAJI  100GM', 1.000, 1.00, 'GRM', 60.00, 60.00, 60.00, 0.00, 'CGSTSGST', 5.00, 3.00, '2020-03-05 17:38:19'),
(417, 'MMM8388', NULL, 821, 'SAUCE KISSAN POUCH 2KG', 1.000, 1.00, 'LTR', 100.00, 100.00, 100.00, 0.00, 'CGSTSGST', 12.00, 12.00, '2020-03-05 17:38:19'),
(418, 'MMM8388', NULL, 794, 'KAPOL FRANKIE', 1.000, 1.00, 'PCS', 55.00, 55.00, 55.00, 0.00, 'CGSTSGST', 5.00, 2.75, '2020-03-05 17:38:19'),
(419, 'MMM8388', NULL, 412, 'KAJU TUKDA 3', 0.250, 1.00, 'KG', 600.00, 150.00, 150.00, 0.00, 'CGSTSGST', 5.00, 7.50, '2020-03-05 17:38:19'),
(420, 'MMM8388', NULL, 811, 'MPR LEM-GIN', 1.000, 1.00, 'LTR', 120.00, 120.00, 120.00, 0.00, 'CGSTSGST', 12.00, 14.40, '2020-03-05 17:38:19'),
(421, 'MMM8388', NULL, 323, 'WAFER LAMBI', 0.500, 1.00, 'KG', 160.00, 80.00, 80.00, 0.00, 'CGSTSGST', 18.00, 14.40, '2020-03-05 17:38:19'),
(422, 'MMM8388', NULL, 934, 'NAMKEEN ', 0.250, 1.00, 'KG', 180.00, 45.00, 45.00, 0.00, 'CGSTSGST', 12.00, 5.40, '2020-03-05 17:38:19'),
(423, 'MMM8389', NULL, 21, 'RAVA JADA', 1.000, 1.00, 'KG', 36.00, 36.00, 36.00, 0.00, 'CGSTSGST', 5.00, 1.80, '2020-03-05 17:48:07'),
(424, 'MMM8389', NULL, 14, 'POHA BARIK', 0.500, 1.00, 'KG', 60.00, 30.00, 30.00, 0.00, 'CGSTSGST', 5.00, 1.50, '2020-03-05 17:48:07'),
(425, 'MMM8389', NULL, 5, 'MOONG ', 0.500, 1.00, 'KG', 110.00, 55.00, 55.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 17:48:07'),
(426, 'MMM8389', NULL, 7, 'MOGAR ', 0.500, 1.00, 'KG', 110.00, 55.00, 55.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 17:48:07'),
(427, 'MMM8389', NULL, 153, 'DHANA DAL', 0.250, 1.00, 'KG', 200.00, 50.00, 50.00, 0.00, 'CGSTSGST', 5.00, 2.50, '2020-03-05 17:48:07'),
(428, 'MMM8389', NULL, 102, 'BAJARI A1', 2.000, 1.00, 'KG', 36.00, 72.00, 72.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 17:48:07'),
(429, 'MMM8389', NULL, 111, 'NACHANI', 0.500, 1.00, 'KG', 48.00, 24.00, 24.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 17:48:07'),
(430, 'MMM8389', NULL, 782, 'NOODLE ', 2.000, 1.00, 'PCS', 6.00, 12.00, 12.00, 0.00, 'CGSTSGST', 18.00, 2.16, '2020-03-05 17:48:07'),
(431, 'MMM8389', NULL, 826, 'SURBHI SAUCE POUCH 1KG', 1.000, 1.00, 'LTR', 75.00, 75.00, 75.00, 0.00, 'CGSTSGST', 8.00, 6.00, '2020-03-05 17:48:07'),
(432, 'MMM8390', NULL, 168, 'GAHU LOKVAN', 125.000, 1.00, 'KG', 30.00, 3750.00, 3750.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 18:24:26'),
(433, 'MMM8390', NULL, 248, 'RICE SILVER KOLUM', 125.000, 1.00, 'KG', 55.00, 6875.00, 6875.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 18:24:26'),
(434, 'MMM8390', NULL, 13, 'TURDAL NATRAJ', 15.000, 1.00, 'KG', 100.00, 1500.00, 1500.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 18:24:26'),
(435, 'MMM8390', NULL, 8, 'MOGAR A1', 10.000, 1.00, 'KG', 110.00, 1100.00, 1100.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 18:24:26'),
(436, 'MMM8390', NULL, 38, 'MASOOR DALL', 10.000, 1.00, 'KG', 70.00, 700.00, 700.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 18:24:26'),
(437, 'MMM8390', NULL, 5, 'MOONG ', 10.000, 1.00, 'KG', 100.00, 1000.00, 1000.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 18:24:26'),
(438, 'MMM8390', NULL, 62, 'MATHKI', 5.000, 1.00, 'KG', 90.00, 450.00, 450.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 18:24:26'),
(439, 'MMM8390', NULL, 51, 'VATANA GREEN', 5.000, 1.00, 'KG', 140.00, 700.00, 700.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 18:24:26'),
(440, 'MMM8390', NULL, 21, 'RAVA JADA', 15.000, 1.00, 'KG', 34.00, 510.00, 510.00, 0.00, 'CGSTSGST', 5.00, 25.50, '2020-03-05 18:24:26'),
(441, 'MMM8390', NULL, 4, 'SUGAR BARIK', 25.000, 1.00, 'KG', 38.00, 950.00, 950.00, 0.00, 'CGSTSGST', 5.00, 47.50, '2020-03-05 18:24:26'),
(442, 'MMM8390', NULL, 12, 'POHA JADA', 15.000, 1.00, 'KG', 40.00, 600.00, 600.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 18:24:26'),
(443, 'MMM8390', NULL, 26, 'SABUDANA', 5.000, 1.00, 'KG', 80.00, 400.00, 400.00, 0.00, 'CGSTSGST', 5.00, 20.00, '2020-03-05 18:24:26'),
(444, 'MMM8390', NULL, 164, 'DALIYA 2', 1.000, 1.00, 'KG', 80.00, 80.00, 80.00, 0.00, 'CGSTSGST', 12.00, 9.60, '2020-03-05 18:24:26'),
(445, 'MMM8390', NULL, 98, 'RAI NAVI', 2.000, 1.00, 'KG', 80.00, 160.00, 160.00, 0.00, 'CGSTSGST', 5.00, 8.00, '2020-03-05 18:24:26'),
(446, 'MMM8390', NULL, 79, 'JEERA 1', 2.000, 1.00, 'KG', 220.00, 440.00, 440.00, 0.00, 'CGSTSGST', 5.00, 22.00, '2020-03-05 18:24:26'),
(447, 'MMM8390', NULL, 934, 'NAMKEEN ', 6.000, 1.00, 'KG', 100.00, 600.00, 600.00, 0.00, 'CGSTSGST', 12.00, 72.00, '2020-03-05 18:24:26'),
(448, 'MMM8390', NULL, 675, 'EV CHICKEN 100GM', 2.000, 1.00, 'GRM', 65.00, 130.00, 130.00, 0.00, 'CGSTSGST', 5.00, 6.50, '2020-03-05 18:24:26'),
(449, 'MMM8390', NULL, 171, 'GUD DESHI 1KG', 5.000, 1.00, 'KG', 56.00, 280.00, 280.00, 0.00, 'CGSTSGST', 5.00, 14.00, '2020-03-05 18:24:26'),
(450, 'MMM8390', NULL, 1277, 'DELIVERY CHARGE ', 1.000, 1.00, 'PKT', 500.00, 500.00, 500.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 18:24:26'),
(451, 'MMM8391', NULL, 384, 'BADAM 1 NO  ', 1.000, 1.00, 'KG', 720.00, 720.00, 720.00, 0.00, 'CGSTSGST', 12.00, 86.40, '2020-03-05 18:32:38'),
(452, 'MMM8391', NULL, 422, 'KAJU S 320', 1.000, 1.00, 'KG', 700.00, 700.00, 700.00, 0.00, 'CGSTSGST', 5.00, 35.00, '2020-03-05 18:32:38'),
(453, 'MMM8391', NULL, 509, 'KHARAK R', 1.000, 1.00, 'KG', 280.00, 280.00, 280.00, 0.00, 'CGSTSGST', 12.00, 33.60, '2020-03-05 18:32:38'),
(454, 'MMM8391', NULL, 486, 'KISMIS UNCHI', 0.500, 1.00, 'KG', 360.00, 180.00, 180.00, 0.00, 'CGSTSGST', 5.00, 9.00, '2020-03-05 18:32:38'),
(455, 'MMM8391', NULL, 303, 'CHAROLI A1', 0.250, 1.00, 'KG', 1200.00, 300.00, 300.00, 0.00, 'CGSTSGST', 12.00, 36.00, '2020-03-05 18:32:38'),
(456, 'MMM8391', NULL, 548, 'ELACHI GREEN 10GM', 1.000, 1.00, 'GRM', 60.00, 60.00, 60.00, 0.00, 'CGSTSGST', 5.00, 3.00, '2020-03-05 18:32:38'),
(457, 'MMM8392', NULL, 66, 'CHORA A1', 0.500, 1.00, 'KG', 90.00, 45.00, 45.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 18:43:21'),
(458, 'MMM8392', NULL, 1099, 'KABULI A1', 0.750, 1.00, 'KG', 90.00, 67.50, 67.50, 0.00, 'CGSTSGST', 5.00, 3.38, '2020-03-05 18:43:21'),
(459, 'MMM8392', NULL, 63, 'MATHKI A1', 0.500, 1.00, 'KG', 100.00, 50.00, 50.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 18:43:21'),
(460, 'MMM8392', NULL, 41, 'CHILTI A1', 0.500, 1.00, 'KG', 110.00, 55.00, 55.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 18:43:21'),
(461, 'MMM8392', NULL, 13, 'TURDAL NATRAJ', 1.000, 1.00, 'KG', 100.00, 100.00, 100.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 18:43:21'),
(462, 'MMM8392', NULL, 78, 'GUD 1no', 2.000, 1.00, 'KG', 56.00, 112.00, 112.00, 0.00, 'CGSTSGST', 5.00, 5.60, '2020-03-05 18:43:21'),
(463, 'MMM8392', NULL, 58, 'VATANA SAFED', 0.500, 1.00, 'KG', 80.00, 40.00, 40.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 18:43:21'),
(464, 'MMM8392', NULL, 474, 'AKHROD PONIYA MAGAJ', 0.500, 1.00, 'KG', 1200.00, 600.00, 600.00, 0.00, 'CGSTSGST', 5.00, 30.00, '2020-03-05 18:43:21'),
(465, 'MMM8393', NULL, 85, 'JEERA SHAJEERA 50GM', 1.000, 1.00, 'GRM', 60.00, 60.00, 60.00, 0.00, 'CGSTSGST', 5.00, 3.00, '2020-03-05 19:10:20'),
(466, 'MMM8393', NULL, 532, 'MARI BLACK 50gm', 1.000, 1.00, 'GRM', 40.00, 40.00, 40.00, 0.00, 'CGSTSGST', 5.00, 2.00, '2020-03-05 19:10:20'),
(467, 'MMM8393', NULL, 396, 'ALCHA KALA 50gm', 1.000, 1.00, 'GRM', 60.00, 60.00, 60.00, 0.00, 'CGSTSGST', 5.00, 3.00, '2020-03-05 19:10:20'),
(468, 'MMM8393', NULL, 436, 'JAVANTRI 10GM', 1.000, 1.00, 'PKT', 40.00, 40.00, 40.00, 0.00, 'CGSTSGST', 5.00, 2.00, '2020-03-05 19:10:20'),
(469, 'MMM8394', NULL, 27, 'SABUDANA A1', 3.000, 1.00, 'KG', 90.00, 270.00, 270.00, 0.00, 'CGSTSGST', 5.00, 13.50, '2020-03-05 19:17:20'),
(470, 'MMM8394', NULL, 3, 'SUGAR JADI', 10.000, 1.00, 'KG', 39.00, 390.00, 390.00, 0.00, 'CGSTSGST', 5.00, 19.50, '2020-03-05 19:17:20'),
(471, 'MMM8394', NULL, 201, 'SINGDANA BORIYA', 2.000, 1.00, 'KG', 110.00, 220.00, 220.00, 0.00, 'CGSTSGST', 5.00, 11.00, '2020-03-05 19:17:20'),
(472, 'MMM8394', NULL, 12, 'POHA JADA', 1.000, 1.00, 'KG', 44.00, 44.00, 44.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 19:17:20'),
(473, 'MMM8394', NULL, 98, 'RAI NAVI', 1.000, 1.00, 'KG', 100.00, 100.00, 100.00, 0.00, 'CGSTSGST', 5.00, 5.00, '2020-03-05 19:17:20'),
(474, 'MMM8395', NULL, 3, 'SUGAR JADI', 4.000, 1.00, 'KG', 40.00, 160.00, 160.00, 0.00, 'CGSTSGST', 5.00, 8.00, '2020-03-05 19:28:34'),
(475, 'MMM8395', NULL, 363, 'TEA GOLDEN', 0.250, 1.00, 'KG', 240.00, 60.00, 60.00, 0.00, 'CGSTSGST', 5.00, 3.00, '2020-03-05 19:28:34'),
(476, 'MMM8395', NULL, 12, 'POHA JADA', 0.500, 1.00, 'KG', 44.00, 22.00, 22.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 19:28:34'),
(477, 'MMM8395', NULL, 21, 'RAVA JADA', 0.500, 1.00, 'KG', 36.00, 18.00, 18.00, 0.00, 'CGSTSGST', 5.00, 0.90, '2020-03-05 19:28:34'),
(478, 'MMM8395', NULL, 201, 'SINGDANA BORIYA', 0.500, 1.00, 'KG', 110.00, 55.00, 55.00, 0.00, 'CGSTSGST', 5.00, 2.75, '2020-03-05 19:28:34'),
(479, 'MMM8395', NULL, 30, 'CHANA DALL 1', 1.000, 1.00, 'KG', 75.00, 75.00, 75.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 19:28:34'),
(480, 'MMM8395', NULL, 78, 'GUD 1no', 0.500, 1.00, 'KG', 56.00, 28.00, 28.00, 0.00, 'CGSTSGST', 5.00, 1.40, '2020-03-05 19:28:34'),
(481, 'MMM8395', NULL, 202, 'MAIDA', 0.500, 1.00, 'KG', 34.00, 17.00, 17.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 19:28:34'),
(482, 'MMM8395', NULL, 92, 'CHORA TINOPOL (BARIK)', 0.500, 1.00, 'KG', 120.00, 60.00, 60.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 19:28:34'),
(483, 'MMM8395', NULL, 36, 'MASOOR', 0.500, 1.00, 'KG', 70.00, 35.00, 35.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-05 19:28:34'),
(484, 'MMM8396', NULL, 3, 'SUGAR JADI', 0.000, 1.00, 'KG', 40.00, 0.00, 0.00, 0.00, 'CGSTSGST', 5.00, 0.00, '2020-03-06 10:37:09'),
(485, 'MMM8397', NULL, 193, 'KOPARA A1 RAJAPUR', 1.000, 1.00, 'KG', 200.00, 200.00, 200.00, 0.00, 'CGSTSGST', 5.00, 10.00, '2020-03-06 10:40:25'),
(486, 'MMM8397', NULL, 193, 'KOPARA A1 RAJAPUR', 0.500, 1.00, 'KG', 200.00, 100.00, 100.00, 0.00, 'CGSTSGST', 5.00, 5.00, '2020-03-06 10:40:25'),
(487, 'MMM8398', NULL, 384, 'BADAM 1 NO  ', 1.000, 1.00, 'KG', 720.00, 720.00, 720.00, 0.00, 'CGSTSGST', 12.00, 86.40, '2020-03-06 10:51:17'),
(488, 'MMM8398', NULL, 412, 'KAJU TUKDA 3', 1.000, 1.00, 'KG', 600.00, 600.00, 600.00, 0.00, 'CGSTSGST', 5.00, 30.00, '2020-03-06 10:51:17'),
(489, 'MMM8398', NULL, 193, 'KOPARA A1 RAJAPUR', 0.250, 1.00, 'KG', 180.00, 45.00, 45.00, 0.00, 'CGSTSGST', 5.00, 2.25, '2020-03-06 10:51:17'),
(490, 'MMM8399', NULL, 384, 'BADAM 1 NO  ', 1.000, 1.00, 'KG', 720.00, 720.00, 720.00, 0.00, 'CGSTSGST', 12.00, 86.40, '2020-03-06 10:52:12'),
(491, 'MMM8400', NULL, 30, 'CHANA DALL 1', 1.000, 1.00, 'KG', 75.00, 75.00, 75.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 11:37:36'),
(492, 'MMM8400', NULL, 187, 'NAMAK TATA', 1.000, 1.00, 'KG', 19.00, 19.00, 19.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 11:37:36'),
(493, 'MMM8401', NULL, 78, 'GUD 1no', 1.000, 1.00, 'KG', 56.00, 56.00, 56.00, 0.00, 'CGSTSGST', 5.00, 2.80, '2020-03-06 11:39:03'),
(494, 'MMM8401', NULL, 23, 'RAVA BARIK', 0.500, 1.00, 'KG', 36.00, 18.00, 18.00, 0.00, 'CGSTSGST', 5.00, 0.90, '2020-03-06 11:39:03'),
(495, 'MMM8401', NULL, 21, 'RAVA JADA', 0.500, 1.00, 'KG', 36.00, 18.00, 18.00, 0.00, 'CGSTSGST', 5.00, 0.90, '2020-03-06 11:39:03'),
(496, 'MMM8402', NULL, 111, 'NACHANI', 1.000, 1.00, 'KG', 48.00, 48.00, 48.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 11:40:36'),
(497, 'MMM8403', NULL, 211, 'RICE AMBAMOR NEW', 25.000, 1.00, 'KG', 75.00, 1875.00, 1875.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 11:46:03'),
(498, 'MMM8403', NULL, 1152, 'RICE DOON TIBAR', 10.000, 1.00, 'KG', 80.00, 800.00, 800.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 11:46:03'),
(499, 'MMM8403', NULL, 216, 'RICE BASMATI JINAT', 5.000, 1.00, 'KG', 90.00, 450.00, 450.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 11:46:03'),
(500, 'MMM8403', NULL, 245, 'RICE PARIMAL NEW', 5.000, 1.00, 'KG', 32.00, 160.00, 160.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 11:46:03'),
(501, 'MMM8403', NULL, 427, 'KAJU MARUTI', 1.000, 1.00, 'KG', 900.00, 900.00, 900.00, 0.00, 'CGSTSGST', 5.00, 45.00, '2020-03-06 11:46:03'),
(502, 'MMM8403', NULL, 1247, 'TURDAL NATRAJ NEW', 10.000, 1.00, 'KG', 110.00, 1100.00, 1100.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 11:46:03'),
(503, 'MMM8403', NULL, 699, 'BORIC POWDER 400gm', 1.000, 1.00, 'GRM', 80.00, 80.00, 80.00, 0.00, 'CGSTSGST', 12.00, 9.60, '2020-03-06 11:46:03'),
(504, 'MMM8403', NULL, 8, 'MOGAR A1', 1.000, 1.00, 'KG', 120.00, 120.00, 120.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 11:46:03'),
(505, 'MMM8403', NULL, 1277, 'DELIVERY CHARGE ', 1.000, 1.00, 'PKT', 100.00, 100.00, 100.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 11:46:03'),
(506, 'MMM8404', NULL, 528, 'MARI BLACK ', 1.000, 1.00, 'KG', 440.00, 440.00, 440.00, 0.00, 'CGSTSGST', 5.00, 22.00, '2020-03-06 14:01:10'),
(507, 'MMM8404', NULL, 614, 'MAGADIYA', 0.250, 1.00, 'KG', 800.00, 200.00, 200.00, 0.00, 'CGSTSGST', 5.00, 10.00, '2020-03-06 14:01:10'),
(508, 'MMM8404', NULL, 353, 'TIL WHITE 2', 1.000, 1.00, 'KG', 140.00, 140.00, 140.00, 0.00, 'CGSTSGST', 5.00, 7.00, '2020-03-06 14:01:10'),
(509, 'MMM8404', NULL, 346, 'TIL KALA A1', 1.000, 1.00, 'KG', 220.00, 220.00, 220.00, 0.00, 'CGSTSGST', 5.00, 11.00, '2020-03-06 14:01:10'),
(510, 'MMM8404', NULL, 437, 'LONG', 0.250, 1.00, 'KG', 600.00, 150.00, 150.00, 0.00, 'CGSTSGST', 5.00, 7.50, '2020-03-06 14:01:10'),
(511, 'MMM8404', NULL, 98, 'RAI NAVI', 1.000, 1.00, 'KG', 80.00, 80.00, 80.00, 0.00, 'CGSTSGST', 5.00, 4.00, '2020-03-06 14:01:10'),
(512, 'MMM8404', NULL, 69, 'MASALA GARAM D', 2.000, 1.00, 'KG', 140.00, 280.00, 280.00, 0.00, 'CGSTSGST', 5.00, 14.00, '2020-03-06 14:01:10'),
(513, 'MMM8404', NULL, 156, 'DHANA POWDER', 3.000, 1.00, 'KG', 120.00, 360.00, 360.00, 0.00, 'CGSTSGST', 5.00, 18.00, '2020-03-06 14:01:10'),
(514, 'MMM8404', NULL, 142, 'HALDI POWDER GOLDEN', 3.000, 1.00, 'PKT', 120.00, 360.00, 360.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 14:01:10'),
(515, 'MMM8404', NULL, 76, 'MIRCHI KASHMIR POWDER', 3.000, 1.00, 'KG', 160.00, 480.00, 480.00, 0.00, 'CGSTSGST', 5.00, 24.00, '2020-03-06 14:01:10'),
(516, 'MMM8404', NULL, 79, 'JEERA 1', 2.000, 1.00, 'KG', 180.00, 360.00, 360.00, 0.00, 'CGSTSGST', 5.00, 18.00, '2020-03-06 14:01:10'),
(517, 'MMM8404', NULL, 566, 'METHI 2', 2.000, 1.00, 'KG', 60.00, 120.00, 120.00, 0.00, 'CGSTSGST', 5.00, 6.00, '2020-03-06 14:01:10'),
(518, 'MMM8404', NULL, 354, 'CHILLY PANDY', 1.000, 1.00, 'KG', 160.00, 160.00, 160.00, 0.00, 'CGSTSGST', 5.00, 8.00, '2020-03-06 14:01:10'),
(519, 'MMM8404', NULL, 1069, 'TEJPATTA', 1.000, 1.00, 'KG', 80.00, 80.00, 80.00, 0.00, 'CGSTSGST', 5.00, 4.00, '2020-03-06 14:01:10'),
(520, 'MMM8404', NULL, 144, 'HALDI SELAN RAJWADI', 1.000, 1.00, 'KG', 120.00, 120.00, 120.00, 0.00, 'CGSTSGST', 5.00, 6.00, '2020-03-06 14:01:10'),
(521, 'MMM8404', NULL, 490, 'TAJ 2', 0.500, 1.00, 'KG', 360.00, 180.00, 180.00, 0.00, 'CGSTSGST', 5.00, 9.00, '2020-03-06 14:01:10'),
(522, 'MMM8404', NULL, 430, 'JAVANTRI 100GM', 1.000, 1.00, 'PKT', 240.00, 240.00, 240.00, 0.00, 'CGSTSGST', 5.00, 12.00, '2020-03-06 14:01:10'),
(523, 'MMM8404', NULL, 391, 'ALCHA KALA 2', 0.250, 1.00, 'KG', 800.00, 200.00, 200.00, 0.00, 'CGSTSGST', 5.00, 10.00, '2020-03-06 14:01:10'),
(524, 'MMM8404', NULL, 159, 'DHANA VM ', 1.000, 1.00, 'KG', 120.00, 120.00, 120.00, 0.00, 'CGSTSGST', 5.00, 6.00, '2020-03-06 14:01:45'),
(525, 'MMM8405', NULL, 529, 'MARI BLACK A1', 0.500, 1.00, 'KG', 600.00, 300.00, 300.00, 0.00, 'CGSTSGST', 5.00, 15.00, '2020-03-06 14:16:10'),
(526, 'MMM8405', NULL, 79, 'JEERA 1', 1.000, 1.00, 'KG', 260.00, 260.00, 260.00, 0.00, 'CGSTSGST', 5.00, 13.00, '2020-03-06 14:16:10'),
(527, 'MMM8405', NULL, 982, 'ALCHA BHUTAN KALA', 0.500, 1.00, 'GRM', 1200.00, 600.00, 600.00, 0.00, 'CGSTSGST', 5.00, 30.00, '2020-03-06 14:16:10'),
(528, 'MMM8405', NULL, 899, 'ELACHI MALBAR', 0.150, 1.00, 'KG', 4800.00, 720.00, 720.00, 0.00, 'CGSTSGST', 5.00, 36.00, '2020-03-06 14:16:10'),
(529, 'MMM8405', NULL, 428, 'JAVANTRI', 0.250, 1.00, 'KG', 2800.00, 700.00, 700.00, 0.00, 'CGSTSGST', 5.00, 35.00, '2020-03-06 14:16:10'),
(530, 'MMM8405', NULL, 540, 'KABABCHINI', 0.250, 1.00, 'KG', 2400.00, 600.00, 600.00, 0.00, 'CGSTSGST', 5.00, 30.00, '2020-03-06 14:16:10'),
(531, 'MMM8405', NULL, 614, 'MAGADIYA', 0.150, 1.00, 'KG', 1000.00, 150.00, 150.00, 0.00, 'CGSTSGST', 5.00, 7.50, '2020-03-06 14:16:10'),
(532, 'MMM8405', NULL, 623, 'TAJ BHUNGDI', 0.250, 1.00, 'GRM', 800.00, 200.00, 200.00, 0.00, 'CGSTSGST', 5.00, 10.00, '2020-03-06 14:16:10'),
(533, 'MMM8405', NULL, 83, 'JEERA SHAJEERA', 0.250, 1.00, 'KG', 900.00, 225.00, 225.00, 0.00, 'CGSTSGST', 5.00, 11.25, '2020-03-06 14:16:10'),
(534, 'MMM8405', NULL, 437, 'LONG', 0.150, 1.00, 'KG', 1000.00, 150.00, 150.00, 0.00, 'CGSTSGST', 5.00, 7.50, '2020-03-06 14:16:10'),
(535, 'MMM8405', NULL, 420, 'KHASKHAS RATLAM', 0.500, 1.00, 'KG', 1200.00, 600.00, 600.00, 0.00, 'CGSTSGST', 5.00, 30.00, '2020-03-06 14:16:10'),
(536, 'MMM8406', NULL, 384, 'BADAM 1 NO  ', 0.400, 1.00, 'KG', 700.00, 280.00, 280.00, 0.00, 'CGSTSGST', 12.00, 33.60, '2020-03-06 14:18:49'),
(537, 'MMM8406', NULL, 485, 'KISMIS LAMBI', 0.400, 1.00, 'KG', 300.00, 120.00, 120.00, 0.00, 'CGSTSGST', 5.00, 6.00, '2020-03-06 14:18:49'),
(538, 'MMM8406', NULL, 422, 'KAJU S 320', 0.400, 1.00, 'KG', 700.00, 280.00, 280.00, 0.00, 'CGSTSGST', 5.00, 14.00, '2020-03-06 14:18:49'),
(539, 'MMM8406', NULL, 462, 'PISTA KHARA 1', 0.400, 1.00, 'KG', 1200.00, 480.00, 480.00, 0.00, 'CGSTSGST', 12.00, 57.60, '2020-03-06 14:18:49'),
(540, 'MMM8406', NULL, 472, 'JARDALU MARUTI', 0.400, 1.00, 'KG', 800.00, 320.00, 320.00, 0.00, 'CGSTSGST', 12.00, 38.40, '2020-03-06 14:18:49'),
(541, 'MMM8407', NULL, 967, 'RB PAPAD ATTA 2KG', 5.000, 1.00, 'KG', 190.00, 950.00, 950.00, 0.00, 'CGSTSGST', 5.00, 47.50, '2020-03-06 16:09:57'),
(542, 'MMM8408', NULL, 742, 'PAPAD LIJJAT UDAD 1KG', 1.000, 1.00, 'KG', 230.00, 230.00, 230.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 16:14:36'),
(543, 'MMM8409', NULL, 8, 'MOGAR A1', 0.000, 1.00, 'KG', 120.00, 0.00, 0.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 16:26:38'),
(544, 'MMM8409', NULL, 44, 'UDAD DALL 1', 0.500, 1.00, 'KG', 120.00, 60.00, 60.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 16:26:38'),
(545, 'MMM8409', NULL, 744, 'PAPAD LIJJAT UDAD 500', 1.000, 1.00, 'KG', 120.00, 120.00, 120.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 16:26:38'),
(546, 'MMM8410', NULL, 8, 'MOGAR A1', 1.000, 1.00, 'KG', 120.00, 120.00, 120.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 16:27:19'),
(547, 'MMM8410', NULL, 44, 'UDAD DALL 1', 0.500, 1.00, 'KG', 120.00, 60.00, 60.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 16:27:19'),
(548, 'MMM8410', NULL, 744, 'PAPAD LIJJAT UDAD 500', 1.000, 1.00, 'KG', 120.00, 120.00, 120.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 16:27:19'),
(549, 'MMM8411', NULL, 3, 'SUGAR JADI', 10.000, 1.00, 'KG', 40.00, 400.00, 400.00, 0.00, 'CGSTSGST', 5.00, 20.00, '2020-03-06 16:31:51'),
(550, 'MMM8411', NULL, 21, 'RAVA JADA', 1.000, 1.00, 'KG', 36.00, 36.00, 36.00, 0.00, 'CGSTSGST', 5.00, 1.80, '2020-03-06 16:31:51'),
(551, 'MMM8411', NULL, 771, 'NOBLE MOJITO', 1.000, 1.00, 'LTR', 150.00, 150.00, 150.00, 0.00, 'CGSTSGST', 12.00, 18.00, '2020-03-06 16:31:51'),
(552, 'MMM8411', NULL, 964, 'NOBLE ROSE ', 1.000, 1.00, 'LTR', 100.00, 100.00, 100.00, 0.00, 'CGSTSGST', 18.00, 18.00, '2020-03-06 16:31:51'),
(553, 'MMM8411', NULL, 30, 'CHANA DALL 1', 1.000, 1.00, 'KG', 75.00, 75.00, 75.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 16:31:51'),
(554, 'MMM8411', NULL, 156, 'DHANA POWDER', 0.500, 1.00, 'KG', 160.00, 80.00, 80.00, 0.00, 'CGSTSGST', 5.00, 4.00, '2020-03-06 16:31:51'),
(555, 'MMM8411', NULL, 1147, 'JEERA POWDER A1', 0.250, 1.00, 'KG', 280.00, 70.00, 70.00, 0.00, 'CGSTSGST', 5.00, 3.50, '2020-03-06 16:31:51'),
(556, 'MMM8411', NULL, 193, 'KOPARA A1 RAJAPUR', 0.500, 1.00, 'KG', 200.00, 100.00, 100.00, 0.00, 'CGSTSGST', 5.00, 5.00, '2020-03-06 16:31:51'),
(557, 'MMM8411', NULL, 599, 'GULKAND 500GM', 2.000, 1.00, 'GRM', 60.00, 120.00, 120.00, 0.00, 'CGSTSGST', 12.00, 14.40, '2020-03-06 16:31:51'),
(558, 'MMM8411', NULL, 44, 'UDAD DALL 1', 0.500, 1.00, 'KG', 120.00, 60.00, 60.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 16:31:51'),
(559, 'MMM8411', NULL, 215, 'ATTA MANCHURAN ', 2.000, 1.00, 'GRM', 35.00, 70.00, 70.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 16:31:51'),
(560, 'MMM8411', NULL, 709, 'MAGAJ KODA', 0.250, 1.00, 'KG', 600.00, 150.00, 150.00, 0.00, 'CGSTSGST', 12.00, 18.00, '2020-03-06 16:31:51'),
(561, 'MMM8411', NULL, 366, 'CHINGS RC SAUCE ', 1.000, 1.00, 'GRM', 45.00, 45.00, 45.00, 0.00, 'CGSTSGST', 12.00, 5.40, '2020-03-06 16:31:51'),
(562, 'MMM8412', NULL, 30, 'CHANA DALL 1', 2.000, 1.00, 'KG', 75.00, 150.00, 150.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 17:17:36'),
(563, 'MMM8412', NULL, 9, 'MOGAR MARUTI', 0.250, 1.00, 'KG', 140.00, 35.00, 35.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 17:17:36'),
(564, 'MMM8412', NULL, 8, 'MOGAR A1', 0.750, 1.00, 'KG', 120.00, 90.00, 90.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 17:17:36'),
(565, 'MMM8412', NULL, 203, 'SINGDANA NAVA DISKO', 1.000, 1.00, 'KG', 120.00, 120.00, 120.00, 0.00, 'CGSTSGST', 5.00, 6.00, '2020-03-06 17:17:36'),
(566, 'MMM8412', NULL, 494, 'KHAJUR', 0.500, 1.00, 'KG', 120.00, 60.00, 60.00, 0.00, 'CGSTSGST', 12.00, 7.20, '2020-03-06 17:17:36'),
(567, 'MMM8412', NULL, 1279, 'KOPARA 2 RAJAPUR ', 0.750, 1.00, 'KG', 160.00, 120.00, 120.00, 0.00, 'CGSTSGST', 5.00, 6.00, '2020-03-06 17:17:36'),
(568, 'MMM8412', NULL, 39, 'MASOOR DALL A1', 0.750, 1.00, 'KG', 80.00, 60.00, 60.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 17:17:36'),
(569, 'MMM8412', NULL, 1166, 'EMLI BARAF', 0.250, 1.00, 'KG', 160.00, 40.00, 40.00, 0.00, 'CGSTSGST', 5.00, 2.00, '2020-03-06 17:17:36'),
(570, 'MMM8412', NULL, 342, 'CHILLY BOR NO. 1', 0.200, 1.00, 'KG', 500.00, 100.00, 100.00, 0.00, 'CGSTSGST', 5.00, 5.00, '2020-03-06 17:17:36'),
(571, 'MMM8412', NULL, 716, 'KOKAM LONAWALA', 0.250, 1.00, 'KG', 160.00, 40.00, 40.00, 0.00, 'CGSTSGST', 5.00, 2.00, '2020-03-06 17:17:36'),
(572, 'MMM8412', NULL, 303, 'CHAROLI A1', 0.050, 1.00, 'KG', 1400.00, 70.00, 70.00, 0.00, 'CGSTSGST', 12.00, 8.40, '2020-03-06 17:17:36'),
(573, 'MMM8412', NULL, 1006, 'HING LG POWDER 100GM', 1.000, 1.00, 'GRM', 120.00, 120.00, 120.00, 0.00, 'CGSTSGST', 5.00, 6.00, '2020-03-06 17:17:36'),
(574, 'MMM8412', NULL, 384, 'BADAM 1 NO  ', 0.050, 1.00, 'KG', 800.00, 40.00, 40.00, 0.00, 'CGSTSGST', 12.00, 4.80, '2020-03-06 17:17:36'),
(575, 'MMM8412', NULL, 44, 'UDAD DALL 1', 0.500, 1.00, 'KG', 120.00, 60.00, 60.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 17:17:36'),
(576, 'MMM8412', NULL, 1098, 'KABULI', 0.500, 1.00, 'KG', 80.00, 40.00, 40.00, 0.00, 'CGSTSGST', 5.00, 2.00, '2020-03-06 17:17:36'),
(577, 'MMM8412', NULL, 177, 'GUD DESHI KESAR', 1.000, 1.00, 'KG', 64.00, 64.00, 64.00, 0.00, 'CGSTSGST', 5.00, 3.20, '2020-03-06 17:17:36'),
(578, 'MMM8412', NULL, 173, 'GUD DESHI 500', 1.000, 1.00, 'KG', 35.00, 35.00, 35.00, 0.00, 'CGSTSGST', 5.00, 1.75, '2020-03-06 17:17:36'),
(579, 'MMM8412', NULL, 493, 'TAJ 50GM ', 1.000, 1.00, 'GRM', 30.00, 30.00, 30.00, 0.00, 'CGSTSGST', 5.00, 1.50, '2020-03-06 17:17:36'),
(580, 'MMM8412', NULL, 532, 'MARI BLACK 50gm', 1.000, 1.00, 'GRM', 40.00, 40.00, 40.00, 0.00, 'CGSTSGST', 5.00, 2.00, '2020-03-06 17:17:36'),
(581, 'MMM8412', NULL, 520, 'TEJPATTA 25gm ', 1.000, 1.00, 'GRM', 10.00, 10.00, 10.00, 0.00, 'CGSTSGST', 5.00, 0.50, '2020-03-06 17:17:36'),
(582, 'MMM8412', NULL, 188, 'NAMAK SUNCHAL POWDER', 0.100, 1.00, 'KG', 100.00, 10.00, 10.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 17:17:36'),
(583, 'MMM8412', NULL, 635, 'EV PAVBHAJI  100GM', 1.000, 1.00, 'GRM', 60.00, 60.00, 60.00, 0.00, 'CGSTSGST', 5.00, 3.00, '2020-03-06 17:17:36'),
(584, 'MMM8412', NULL, 690, 'EV CHAT 100GM', 1.000, 1.00, 'GRM', 70.00, 70.00, 70.00, 0.00, 'CGSTSGST', 5.00, 3.50, '2020-03-06 17:17:36'),
(585, 'MMM8412', NULL, 81, 'JEERA RAJWADI 100 GM', 1.000, 1.00, 'GRM', 30.00, 30.00, 30.00, 0.00, 'CGSTSGST', 5.00, 1.50, '2020-03-06 17:17:36'),
(586, 'MMM8412', NULL, 359, 'CHILLY UNCHA  BEDGI', 0.100, 1.00, 'KG', 400.00, 40.00, 40.00, 0.00, 'CGSTSGST', 5.00, 2.00, '2020-03-06 17:17:36'),
(587, 'MMM8413', NULL, 13, 'TURDAL NATRAJ', 1.000, 1.00, 'KG', 100.00, 100.00, 100.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 17:29:55'),
(588, 'MMM8413', NULL, 271, 'BESAN A1', 1.000, 1.00, 'KG', 80.00, 80.00, 80.00, 0.00, 'CGSTSGST', 5.00, 4.00, '2020-03-06 17:29:55'),
(589, 'MMM8413', NULL, 202, 'MAIDA', 1.000, 1.00, 'KG', 32.00, 32.00, 32.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 17:29:55'),
(590, 'MMM8413', NULL, 74, 'MIRCHI DABBI POWDER', 0.250, 1.00, 'KG', 320.00, 80.00, 80.00, 0.00, 'CGSTSGST', 5.00, 4.00, '2020-03-06 17:29:55'),
(591, 'MMM8413', NULL, 977, 'HING VANDEVI Y. POWDER 100GM', 1.000, 1.00, 'GRM', 80.00, 80.00, 80.00, 0.00, 'CGSTSGST', 5.00, 4.00, '2020-03-06 17:29:55'),
(592, 'MMM8413', NULL, 60, 'VATANA SAFED A1', 0.500, 1.00, 'KG', 100.00, 50.00, 50.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 17:29:55'),
(593, 'MMM8413', NULL, 33, 'CHANA A1', 0.500, 1.00, 'KG', 80.00, 40.00, 40.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 17:29:55'),
(594, 'MMM8413', NULL, 1099, 'KABULI A1', 0.500, 1.00, 'KG', 90.00, 45.00, 45.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 17:29:55'),
(595, 'MMM8413', NULL, 432, 'KAJU CHILKA A1', 0.250, 1.00, 'KG', 800.00, 200.00, 200.00, 0.00, 'CGSTSGST', 5.00, 10.00, '2020-03-06 17:29:55'),
(596, 'MMM8414', NULL, 42, 'CHILTI MARUTI', 0.500, 1.00, 'KG', 120.00, 60.00, 60.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 17:37:23'),
(597, 'MMM8414', NULL, 203, 'SINGDANA NAVA DISKO', 0.500, 1.00, 'KG', 120.00, 60.00, 60.00, 0.00, 'CGSTSGST', 5.00, 3.00, '2020-03-06 17:37:23'),
(598, 'MMM8414', NULL, 45, 'UDAD DALL A1', 0.250, 1.00, 'KG', 140.00, 35.00, 35.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 17:37:23'),
(599, 'MMM8414', NULL, 27, 'SABUDANA A1', 0.500, 1.00, 'KG', 90.00, 45.00, 45.00, 0.00, 'CGSTSGST', 5.00, 2.25, '2020-03-06 17:37:23'),
(600, 'MMM8415', NULL, 30, 'CHANA DALL 1', 0.500, 1.00, 'KG', 75.00, 37.50, 37.50, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 17:39:50'),
(601, 'MMM8415', NULL, 177, 'GUD DESHI KESAR', 1.000, 1.00, 'KG', 64.00, 64.00, 64.00, 0.00, 'CGSTSGST', 5.00, 3.20, '2020-03-06 17:39:50'),
(602, 'MMM8415', NULL, 202, 'MAIDA', 1.000, 1.00, 'KG', 32.00, 32.00, 32.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 17:39:50'),
(603, 'MMM8415', NULL, 21, 'RAVA JADA', 1.000, 1.00, 'KG', 36.00, 36.00, 36.00, 0.00, 'CGSTSGST', 5.00, 1.80, '2020-03-06 17:39:50'),
(604, 'MMM8415', NULL, 12, 'POHA JADA', 1.000, 1.00, 'KG', 44.00, 44.00, 44.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 17:39:50'),
(605, 'MMM8415', NULL, 13, 'TURDAL NATRAJ', 2.000, 1.00, 'KG', 100.00, 200.00, 200.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 17:39:50'),
(606, 'MMM8415', NULL, 576, 'SUNTH A1 ', 0.100, 1.00, 'KG', 500.00, 50.00, 50.00, 0.00, 'CGSTSGST', 5.00, 2.50, '2020-03-06 17:39:50'),
(607, 'MMM8415', NULL, 600, 'GUNDER KANI SAFED', 0.100, 1.00, 'KG', 300.00, 30.00, 30.00, 0.00, 'CGSTSGST', 5.00, 1.50, '2020-03-06 17:39:50'),
(608, 'MMM8415', NULL, 1053, 'HALIM', 0.100, 1.00, 'KG', 200.00, 20.00, 20.00, 0.00, 'CGSTSGST', 5.00, 1.00, '2020-03-06 17:39:50'),
(609, 'MMM8416', NULL, 113, 'WALL', 0.250, 1.00, 'KG', 100.00, 25.00, 25.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 17:47:13'),
(610, 'MMM8416', NULL, 7, 'MOGAR ', 0.250, 1.00, 'KG', 120.00, 30.00, 30.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 17:47:13'),
(611, 'MMM8416', NULL, 38, 'MASOOR DALL', 0.250, 1.00, 'KG', 80.00, 20.00, 20.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 17:47:13'),
(612, 'MMM8416', NULL, 59, 'VATANA SAFED 1', 0.250, 1.00, 'KG', 100.00, 25.00, 25.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 17:47:13'),
(613, 'MMM8416', NULL, 32, 'CHANA ', 0.250, 1.00, 'KG', 80.00, 20.00, 20.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 17:47:13'),
(614, 'MMM8416', NULL, 5, 'MOONG ', 0.250, 1.00, 'KG', 120.00, 30.00, 30.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 17:47:13'),
(615, 'MMM8416', NULL, 244, 'AMBOSI AA', 0.100, 1.00, 'KG', 400.00, 40.00, 40.00, 0.00, 'CGSTSGST', 5.00, 2.00, '2020-03-06 17:47:13'),
(616, 'MMM8417', NULL, 198, 'LAPSI JADI', 1.000, 1.00, 'KG', 48.00, 48.00, 48.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 18:09:50'),
(617, 'MMM8417', NULL, 8, 'MOGAR A1', 1.500, 1.00, 'KG', 120.00, 180.00, 180.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 18:09:50'),
(618, 'MMM8417', NULL, 38, 'MASOOR DALL', 0.500, 1.00, 'KG', 70.00, 35.00, 35.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 18:09:50'),
(619, 'MMM8417', NULL, 111, 'NACHANI', 2.000, 1.00, 'KG', 48.00, 96.00, 96.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 18:09:50'),
(620, 'MMM8417', NULL, 110, 'JAWARI SOLAPUR', 0.500, 1.00, 'KG', 48.00, 24.00, 24.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 18:09:50'),
(621, 'MMM8417', NULL, 30, 'CHANA DALL 1', 1.000, 1.00, 'KG', 75.00, 75.00, 75.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 18:09:50'),
(622, 'MMM8417', NULL, 177, 'GUD DESHI KESAR', 1.000, 1.00, 'KG', 64.00, 64.00, 64.00, 0.00, 'CGSTSGST', 5.00, 3.20, '2020-03-06 18:09:50'),
(623, 'MMM8417', NULL, 12, 'POHA JADA', 1.000, 1.00, 'KG', 44.00, 44.00, 44.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 18:09:50'),
(624, 'MMM8417', NULL, 21, 'RAVA JADA', 1.000, 1.00, 'KG', 36.00, 36.00, 36.00, 0.00, 'CGSTSGST', 5.00, 1.80, '2020-03-06 18:09:50'),
(625, 'MMM8417', NULL, 28, 'SABUDANA BARIK', 0.500, 1.00, 'KG', 100.00, 50.00, 50.00, 0.00, 'CGSTSGST', 5.00, 2.50, '2020-03-06 18:09:50'),
(626, 'MMM8417', NULL, 227, 'ALSI', 0.500, 1.00, 'KG', 100.00, 50.00, 50.00, 0.00, 'CGSTSGST', 5.00, 2.50, '2020-03-06 18:09:50'),
(627, 'MMM8417', NULL, 494, 'KHAJUR', 0.500, 1.00, 'KG', 120.00, 60.00, 60.00, 0.00, 'CGSTSGST', 12.00, 7.20, '2020-03-06 18:09:50'),
(628, 'MMM8417', NULL, 789, 'KANHAIYA MAMRA', 1.000, 1.00, 'PKT', 30.00, 30.00, 30.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 18:09:50'),
(629, 'MMM8417', NULL, 1054, 'RANGOLI', 1.000, 1.00, 'KG', 20.00, 20.00, 20.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 18:09:50'),
(630, 'MMM8417', NULL, 6, 'MOONG A1', 0.500, 1.00, 'KG', 110.00, 55.00, 55.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 18:09:50'),
(631, 'MMM8418', NULL, 30, 'CHANA DALL 1', 1.000, 1.00, 'KG', 75.00, 75.00, 75.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 18:33:00'),
(632, 'MMM8418', NULL, 30, 'CHANA DALL 1', 1.000, 1.00, 'KG', 75.00, 75.00, 75.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 18:33:00'),
(633, 'MMM8418', NULL, 78, 'GUD 1no', 1.000, 1.00, 'KG', 56.00, 56.00, 56.00, 0.00, 'CGSTSGST', 5.00, 2.80, '2020-03-06 18:33:00'),
(634, 'MMM8418', NULL, 56, 'VATANA KALA 1', 0.500, 1.00, 'KG', 90.00, 45.00, 45.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 18:33:00'),
(635, 'MMM8418', NULL, 548, 'ELACHI GREEN 10GM', 1.000, 1.00, 'GRM', 60.00, 60.00, 60.00, 0.00, 'CGSTSGST', 5.00, 3.00, '2020-03-06 18:33:00'),
(636, 'MMM8418', NULL, 13, 'TURDAL NATRAJ', 1.000, 1.00, 'KG', 100.00, 100.00, 100.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 18:33:00'),
(637, 'MMM8419', NULL, 201, 'SINGDANA BORIYA', 2.000, 1.00, 'KG', 110.00, 220.00, 220.00, 0.00, 'CGSTSGST', 5.00, 11.00, '2020-03-06 19:07:48'),
(638, 'MMM8419', NULL, 751, 'NOBLE JAM 1KG', 1.000, 1.00, 'KG', 110.00, 110.00, 110.00, 0.00, 'CGSTSGST', 12.00, 13.20, '2020-03-06 19:07:48'),
(639, 'MMM8420', NULL, 30, 'CHANA DALL 1', 1.000, 1.00, 'KG', 75.00, 75.00, 75.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 19:12:41'),
(640, 'MMM8420', NULL, 13, 'TURDAL NATRAJ', 1.000, 1.00, 'KG', 100.00, 100.00, 100.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 19:12:41'),
(641, 'MMM8420', NULL, 8, 'MOGAR A1', 1.000, 1.00, 'KG', 120.00, 120.00, 120.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 19:12:41'),
(642, 'MMM8420', NULL, 27, 'SABUDANA A1', 1.000, 1.00, 'KG', 90.00, 90.00, 90.00, 0.00, 'CGSTSGST', 5.00, 4.50, '2020-03-06 19:12:41'),
(643, 'MMM8420', NULL, 384, 'BADAM 1 NO  ', 0.250, 1.00, 'KG', 720.00, 180.00, 180.00, 0.00, 'CGSTSGST', 12.00, 21.60, '2020-03-06 19:12:41'),
(644, 'MMM8420', NULL, 509, 'KHARAK R', 0.500, 1.00, 'KG', 280.00, 140.00, 140.00, 0.00, 'CGSTSGST', 12.00, 16.80, '2020-03-06 19:12:41'),
(645, 'MMM8420', NULL, 316, 'VARIYALI ROASTED', 0.200, 1.00, 'KG', 200.00, 40.00, 40.00, 0.00, 'CGSTSGST', 5.00, 2.00, '2020-03-06 19:12:41'),
(646, 'MMM8420', NULL, 981, 'HING VANDEVI Y. POWDER 50GM', 1.000, 1.00, 'GRM', 40.00, 40.00, 40.00, 0.00, 'CGSTSGST', 5.00, 2.00, '2020-03-06 19:12:41'),
(647, 'MMM8421', NULL, 113, 'WALL', 1.000, 1.00, 'KG', 80.00, 80.00, 80.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 19:24:49'),
(648, 'MMM8421', NULL, 5, 'MOONG ', 1.000, 1.00, 'KG', 100.00, 100.00, 100.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 19:24:49'),
(649, 'MMM8421', NULL, 1098, 'KABULI', 1.000, 1.00, 'KG', 80.00, 80.00, 80.00, 0.00, 'CGSTSGST', 5.00, 4.00, '2020-03-06 19:24:49'),
(650, 'MMM8421', NULL, 91, 'CHORA LAL', 1.000, 1.00, 'KG', 100.00, 100.00, 100.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 19:24:49'),
(651, 'MMM8421', NULL, 34, 'CHANA MOSAMBI', 0.500, 1.00, 'KG', 90.00, 45.00, 45.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 19:24:49'),
(652, 'MMM8422', NULL, 58, 'VATANA SAFED', 1.000, 1.00, 'KG', 80.00, 80.00, 80.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-06 19:25:31'),
(653, 'MMM8423', NULL, 3, 'SUGAR JADI', 1.000, 1.00, 'KG', 40.00, 40.00, 40.00, 0.00, 'CGSTSGST', 5.00, 2.00, '2020-03-07 10:37:32'),
(654, 'MMM8424', NULL, 5, 'MOONG ', 0.500, 1.00, 'KG', 100.00, 50.00, 50.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 10:39:43'),
(655, 'MMM8424', NULL, 65, 'CHORA 2', 1.000, 1.00, 'KG', 80.00, 80.00, 80.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 10:39:43'),
(656, 'MMM8424', NULL, 36, 'MASOOR', 1.000, 1.00, 'KG', 70.00, 70.00, 70.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 10:39:43'),
(657, 'MMM8424', NULL, 38, 'MASOOR DALL', 1.000, 1.00, 'KG', 70.00, 70.00, 70.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 10:39:43'),
(658, 'MMM8424', NULL, 7, 'MOGAR ', 1.000, 1.00, 'KG', 110.00, 110.00, 110.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 10:39:43'),
(659, 'MMM8424', NULL, 51, 'VATANA GREEN', 1.000, 1.00, 'KG', 140.00, 140.00, 140.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 10:39:43'),
(660, 'MMM8424', NULL, 34, 'CHANA MOSAMBI', 1.000, 1.00, 'KG', 90.00, 90.00, 90.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 10:39:43'),
(661, 'MMM8424', NULL, 760, 'SV MANGO 1kg', 1.000, 1.00, 'KG', 120.00, 120.00, 120.00, 0.00, 'CGSTSGST', 12.00, 14.40, '2020-03-07 10:39:43'),
(662, 'MMM8425', NULL, 384, 'BADAM 1 NO  ', 1.000, 1.00, 'KG', 0.00, 0.00, 0.00, 0.00, 'CGSTSGST', 12.00, 0.00, '2020-03-07 10:42:04'),
(663, 'MMM8426', NULL, 13, 'TURDAL NATRAJ', 0.500, 1.00, 'KG', 100.00, 50.00, 50.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 10:43:14'),
(664, 'MMM8426', NULL, 30, 'CHANA DALL 1', 0.500, 1.00, 'KG', 75.00, 37.50, 37.50, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 10:43:14'),
(665, 'MMM8426', NULL, 38, 'MASOOR DALL', 0.500, 1.00, 'KG', 70.00, 35.00, 35.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 10:43:14'),
(666, 'MMM8426', NULL, 113, 'WALL', 0.500, 1.00, 'KG', 100.00, 50.00, 50.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 10:43:14'),
(667, 'MMM8426', NULL, 8, 'MOGAR A1', 0.500, 1.00, 'KG', 120.00, 60.00, 60.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 10:43:14'),
(668, 'MMM8426', NULL, 27, 'SABUDANA A1', 0.250, 1.00, 'KG', 100.00, 25.00, 25.00, 0.00, 'CGSTSGST', 5.00, 1.25, '2020-03-07 10:43:14'),
(669, 'MMM8426', NULL, 59, 'VATANA SAFED 1', 0.500, 1.00, 'KG', 90.00, 45.00, 45.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 10:43:14'),
(670, 'MMM8427', NULL, 243, 'RICE PARIMAL CHOKHA', 25.000, 1.00, 'KG', 32.00, 800.00, 800.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 10:43:48'),
(671, 'MMM8428', NULL, 38, 'MASOOR DALL', 2.000, 1.00, 'KG', 70.00, 140.00, 140.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 10:50:50'),
(672, 'MMM8428', NULL, 7, 'MOGAR ', 1.000, 1.00, 'KG', 110.00, 110.00, 110.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 10:50:50'),
(673, 'MMM8428', NULL, 821, 'SAUCE KISSAN POUCH 2KG', 1.000, 1.00, 'LTR', 100.00, 100.00, 100.00, 0.00, 'CGSTSGST', 12.00, 12.00, '2020-03-07 10:50:50'),
(674, 'MMM8428', NULL, 830, 'ESS', 2.000, 1.00, 'PKT', 20.00, 40.00, 40.00, 0.00, 'CGSTSGST', 18.00, 7.20, '2020-03-07 10:50:50'),
(675, 'MMM8428', NULL, 201, 'SINGDANA BORIYA', 0.500, 1.00, 'KG', 110.00, 55.00, 55.00, 0.00, 'CGSTSGST', 5.00, 2.75, '2020-03-07 10:50:50'),
(676, 'MMM8428', NULL, 588, 'PASTA MACRONI', 1.000, 1.00, 'KG', 50.00, 50.00, 50.00, 0.00, 'CGSTSGST', 12.00, 6.00, '2020-03-07 10:50:50'),
(677, 'MMM8428', NULL, 1070, 'KAPOL A-1 CHAT', 1.000, 1.00, 'PKT', 50.00, 50.00, 50.00, 0.00, 'CGSTSGST', 5.00, 2.50, '2020-03-07 10:50:50'),
(678, 'MMM8428', NULL, 618, 'AJINO MOTO', 0.250, 1.00, 'KG', 160.00, 40.00, 40.00, 0.00, 'CGSTSGST', 5.00, 2.00, '2020-03-07 10:50:50'),
(679, 'MMM8428', NULL, 43, 'UDAD DALL', 1.000, 1.00, 'KG', 110.00, 110.00, 110.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 10:50:50'),
(680, 'MMM8429', NULL, 6, 'MOONG A1', 0.250, 1.00, 'KG', 120.00, 30.00, 30.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 10:58:25'),
(681, 'MMM8429', NULL, 92, 'CHORA TINOPOL (BARIK)', 0.500, 1.00, 'KG', 120.00, 60.00, 60.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 10:58:26'),
(682, 'MMM8429', NULL, 690, 'EV CHAT 100GM', 1.000, 1.00, 'GRM', 55.00, 55.00, 55.00, 0.00, 'CGSTSGST', 5.00, 2.75, '2020-03-07 10:58:26'),
(683, 'MMM8430', NULL, 43, 'UDAD DALL', 1.500, 1.00, 'KG', 110.00, 165.00, 165.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 11:10:18'),
(684, 'MMM8431', NULL, 1279, 'KOPARA 2 RAJAPUR ', 1.000, 1.00, 'KG', 180.00, 180.00, 180.00, 0.00, 'CGSTSGST', 5.00, 9.00, '2020-03-07 11:22:10'),
(685, 'MMM8431', NULL, 57, 'VATANA KALA MARUTI', 0.500, 1.00, 'KG', 100.00, 50.00, 50.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 11:22:10'),
(686, 'MMM8431', NULL, 8, 'MOGAR A1', 1.000, 1.00, 'KG', 120.00, 120.00, 120.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 11:22:10'),
(687, 'MMM8431', NULL, 12, 'POHA JADA', 1.500, 1.00, 'KG', 44.00, 66.00, 66.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 11:22:10'),
(688, 'MMM8431', NULL, 21, 'RAVA JADA', 1.000, 1.00, 'KG', 36.00, 36.00, 36.00, 0.00, 'CGSTSGST', 5.00, 1.80, '2020-03-07 11:22:10'),
(689, 'MMM8431', NULL, 27, 'SABUDANA A1', 1.000, 1.00, 'KG', 90.00, 90.00, 90.00, 0.00, 'CGSTSGST', 5.00, 4.50, '2020-03-07 11:22:10'),
(690, 'MMM8431', NULL, 81, 'JEERA RAJWADI 100 GM', 1.000, 1.00, 'GRM', 30.00, 30.00, 30.00, 0.00, 'CGSTSGST', 5.00, 1.50, '2020-03-07 11:22:10'),
(691, 'MMM8431', NULL, 13, 'TURDAL NATRAJ', 1.000, 1.00, 'KG', 100.00, 100.00, 100.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 11:22:11'),
(692, 'MMM8431', NULL, 30, 'CHANA DALL 1', 1.000, 1.00, 'KG', 75.00, 75.00, 75.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 11:22:11'),
(693, 'MMM8431', NULL, 44, 'UDAD DALL 1', 1.000, 1.00, 'KG', 120.00, 120.00, 120.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 11:22:11'),
(694, 'MMM8431', NULL, 485, 'KISMIS LAMBI', 0.250, 1.00, 'KG', 320.00, 80.00, 80.00, 0.00, 'CGSTSGST', 5.00, 4.00, '2020-03-07 11:22:11'),
(695, 'MMM8431', NULL, 508, 'KHARAK AA', 0.500, 1.00, 'KG', 240.00, 120.00, 120.00, 0.00, 'CGSTSGST', 12.00, 14.40, '2020-03-07 11:22:11'),
(696, 'MMM8431', NULL, 6, 'MOONG A1', 0.500, 1.00, 'KG', 110.00, 55.00, 55.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 11:22:11'),
(697, 'MMM8431', NULL, 203, 'SINGDANA NAVA DISKO', 1.000, 1.00, 'KG', 120.00, 120.00, 120.00, 0.00, 'CGSTSGST', 5.00, 6.00, '2020-03-07 11:22:11'),
(698, 'MMM8432', NULL, 687, 'EV GARAM SUPER 200GM', 1.000, 1.00, 'GRM', 70.00, 70.00, 70.00, 0.00, 'CGSTSGST', 5.00, 3.50, '2020-03-07 11:38:17'),
(699, 'MMM8432', NULL, 645, 'EV PANIPURI 100GM', 1.000, 1.00, 'GRM', 55.00, 55.00, 55.00, 0.00, 'CGSTSGST', 5.00, 2.75, '2020-03-07 11:38:17'),
(700, 'MMM8432', NULL, 639, 'EV SAMBHAR 100GM', 1.000, 1.00, 'GRM', 58.00, 58.00, 58.00, 0.00, 'CGSTSGST', 5.00, 2.90, '2020-03-07 11:38:18'),
(701, 'MMM8432', NULL, 774, 'NOBLE PINEAPLE', 1.000, 1.00, 'LTR', 100.00, 100.00, 100.00, 0.00, 'CGSTSGST', 12.00, 12.00, '2020-03-07 11:38:18'),
(702, 'MMM8432', NULL, 757, 'NOBLE KESAR', 1.000, 1.00, 'LTR', 110.00, 110.00, 110.00, 0.00, 'CGSTSGST', 12.00, 13.20, '2020-03-07 11:38:18'),
(703, 'MMM8433', NULL, 413, 'DAGADFUL 50GM', 1.000, 1.00, 'GRM', 150.00, 150.00, 150.00, 0.00, 'CGSTSGST', 5.00, 7.50, '2020-03-07 12:21:08'),
(704, 'MMM8433', NULL, 612, 'JAYFAL', 0.050, 1.00, 'KG', 1200.00, 60.00, 60.00, 0.00, 'CGSTSGST', 5.00, 3.00, '2020-03-07 12:21:08'),
(705, 'MMM8433', NULL, 159, 'DHANA VM ', 1.000, 1.00, 'KG', 140.00, 140.00, 140.00, 0.00, 'CGSTSGST', 5.00, 7.00, '2020-03-07 12:21:08'),
(706, 'MMM8433', NULL, 536, 'RAMPATRI 100gm', 1.000, 1.00, 'KG', 100.00, 100.00, 100.00, 0.00, 'CGSTSGST', 5.00, 5.00, '2020-03-07 12:21:08'),
(707, 'MMM8433', NULL, 493, 'TAJ 50GM ', 1.000, 1.00, 'GRM', 80.00, 80.00, 80.00, 0.00, 'CGSTSGST', 5.00, 4.00, '2020-03-07 12:21:08'),
(708, 'MMM8433', NULL, 442, 'LONG 50GM ', 1.000, 1.00, 'GRM', 120.00, 120.00, 120.00, 0.00, 'CGSTSGST', 5.00, 6.00, '2020-03-07 12:21:08'),
(709, 'MMM8433', NULL, 80, 'JEERA RAJWADI', 0.250, 1.00, 'KG', 240.00, 60.00, 60.00, 0.00, 'CGSTSGST', 5.00, 3.00, '2020-03-07 12:21:08'),
(710, 'MMM8433', NULL, 93, 'RAI A1', 0.750, 1.00, 'KG', 160.00, 120.00, 120.00, 0.00, 'CGSTSGST', 5.00, 6.00, '2020-03-07 12:21:08'),
(711, 'MMM8433', NULL, 396, 'ALCHA KALA 50gm', 1.000, 1.00, 'GRM', 180.00, 180.00, 180.00, 0.00, 'CGSTSGST', 5.00, 9.00, '2020-03-07 12:21:08'),
(712, 'MMM8433', NULL, 405, 'BADIYAN 50GM', 1.000, 1.00, 'GRM', 180.00, 180.00, 180.00, 0.00, 'CGSTSGST', 5.00, 9.00, '2020-03-07 12:21:08'),
(713, 'MMM8433', NULL, 451, 'NAKESHWAR 25GM', 1.000, 1.00, 'GRM', 70.00, 70.00, 70.00, 0.00, 'CGSTSGST', 5.00, 3.50, '2020-03-07 12:21:08'),
(714, 'MMM8433', NULL, 354, 'CHILLY PANDY', 2.000, 1.00, 'KG', 120.00, 240.00, 240.00, 0.00, 'CGSTSGST', 5.00, 12.00, '2020-03-07 12:21:08'),
(715, 'MMM8433', NULL, 344, 'CHILLY DANDICUT BADGI', 1.000, 1.00, 'KG', 240.00, 240.00, 240.00, 0.00, 'CGSTSGST', 5.00, 12.00, '2020-03-07 12:21:08'),
(716, 'MMM8433', NULL, 352, 'CHILLY KASHMIRI', 0.500, 1.00, 'KG', 280.00, 140.00, 140.00, 0.00, 'CGSTSGST', 5.00, 7.00, '2020-03-07 12:21:08'),
(717, 'MMM8433', NULL, 358, 'CHILLY SKV BEDGI', 0.500, 1.00, 'KG', 180.00, 90.00, 90.00, 0.00, 'CGSTSGST', 5.00, 4.50, '2020-03-07 12:21:08'),
(718, 'MMM8433', NULL, 144, 'HALDI SELAN RAJWADI', 1.500, 1.00, 'KG', 160.00, 240.00, 240.00, 0.00, 'CGSTSGST', 5.00, 12.00, '2020-03-07 12:21:08'),
(719, 'MMM8433', NULL, 420, 'KHAUSKHUS RATLAM', 0.500, 1.00, 'KG', 1200.00, 600.00, 600.00, 0.00, 'CGSTSGST', 5.00, 30.00, '2020-03-07 12:21:08'),
(720, 'MMM8433', NULL, 315, 'VARIYALI NAVI', 0.500, 1.00, 'KG', 200.00, 100.00, 100.00, 0.00, 'CGSTSGST', 5.00, 5.00, '2020-03-07 12:21:08'),
(721, 'MMM8433', NULL, 354, 'CHILLY PANDY', 1.000, 1.00, 'KG', 120.00, 120.00, 120.00, 0.00, 'CGSTSGST', 5.00, 6.00, '2020-03-07 12:21:08'),
(722, 'MMM8433', NULL, 344, 'CHILLY DANDICUT BADGI', 0.500, 1.00, 'KG', 240.00, 120.00, 120.00, 0.00, 'CGSTSGST', 5.00, 6.00, '2020-03-07 12:21:08'),
(723, 'MMM8433', NULL, 352, 'CHILLY KASHMIRI', 0.750, 1.00, 'KG', 280.00, 210.00, 210.00, 0.00, 'CGSTSGST', 5.00, 10.50, '2020-03-07 12:21:08'),
(724, 'MMM8433', NULL, 159, 'DHANA VM ', 0.750, 1.00, 'KG', 140.00, 105.00, 105.00, 0.00, 'CGSTSGST', 5.00, 5.25, '2020-03-07 12:21:08'),
(725, 'MMM8433', NULL, 171, 'GUD DESHI 1KG', 1.000, 1.00, 'KG', 60.00, 60.00, 60.00, 0.00, 'CGSTSGST', 5.00, 3.00, '2020-03-07 12:21:08'),
(726, 'MMM8434', NULL, 154, 'DHANA INDORI', 1.000, 1.00, 'KG', 200.00, 200.00, 200.00, 0.00, 'CGSTSGST', 5.00, 10.00, '2020-03-07 15:54:44'),
(727, 'MMM8434', NULL, 162, 'DALIYA A1', 0.250, 1.00, 'KG', 100.00, 25.00, 25.00, 0.00, 'CGSTSGST', 12.00, 3.00, '2020-03-07 15:54:44'),
(728, 'MMM8434', NULL, 186, 'NAMAK BARIK', 2.000, 1.00, 'KG', 10.00, 20.00, 20.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 15:54:44'),
(729, 'MMM8434', NULL, 36, 'MASOOR', 1.000, 1.00, 'KG', 70.00, 70.00, 70.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 15:54:44'),
(730, 'MMM8434', NULL, 5, 'MOONG ', 1.000, 1.00, 'KG', 100.00, 100.00, 100.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 15:54:44'),
(731, 'MMM8434', NULL, 503, 'KHAJUR KIMIYA 1BOX', 1.000, 1.00, 'BOX', 170.00, 170.00, 170.00, 0.00, 'CGSTSGST', 12.00, 20.40, '2020-03-07 15:54:44'),
(732, 'MMM8435', NULL, 30, 'CHANA DALL 1', 1.000, 1.00, 'KG', 75.00, 75.00, 75.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 15:58:49'),
(733, 'MMM8435', NULL, 78, 'GUD 1no', 0.500, 1.00, 'KG', 56.00, 28.00, 28.00, 0.00, 'CGSTSGST', 5.00, 1.40, '2020-03-07 15:58:49'),
(734, 'MMM8435', NULL, 202, 'MAIDA', 1.000, 1.00, 'KG', 32.00, 32.00, 32.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 15:58:49'),
(735, 'MMM8435', NULL, 271, 'BESAN A1', 0.500, 1.00, 'KG', 80.00, 40.00, 40.00, 0.00, 'CGSTSGST', 5.00, 2.00, '2020-03-07 15:58:49'),
(736, 'MMM8435', NULL, 66, 'CHORA A1', 0.500, 1.00, 'KG', 90.00, 45.00, 45.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 15:58:49'),
(737, 'MMM8435', NULL, 6, 'MOONG A1', 0.500, 1.00, 'KG', 110.00, 55.00, 55.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 15:58:49'),
(738, 'MMM8435', NULL, 707, 'EV KITCHEN KING 100GM', 1.000, 1.00, 'GRM', 60.00, 60.00, 60.00, 0.00, 'CGSTSGST', 5.00, 3.00, '2020-03-07 15:58:49');
INSERT INTO `salesdetailsmaster_03_2020` (`id`, `invoiceid`, `prodid`, `prodid_`, `bprodname`, `istock`, `iinstock`, `unit`, `salesrate`, `prodtotal`, `prodttotal`, `discount`, `gst`, `bgstper`, `gstamount`, `added_on`) VALUES
(739, 'MMM8435', NULL, 782, 'NOODLE ', 10.000, 1.00, 'PCS', 6.00, 60.00, 60.00, 0.00, 'CGSTSGST', 18.00, 10.80, '2020-03-07 15:58:49'),
(740, 'MMM8435', NULL, 215, 'ATTA MANCHURAN ', 2.000, 1.00, 'GRM', 35.00, 70.00, 70.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 15:58:49'),
(741, 'MMM8435', NULL, 165, 'AWALA POWDER', 0.500, 1.00, 'KG', 200.00, 100.00, 100.00, 0.00, 'CGSTSGST', 12.00, 12.00, '2020-03-07 15:58:49'),
(742, 'MMM8435', NULL, 371, 'CHINGS SEJWAN 250GM', 1.000, 1.00, 'KG', 60.00, 60.00, 60.00, 0.00, 'CGSTSGST', 18.00, 10.80, '2020-03-07 15:58:49'),
(743, 'MMM8436', NULL, 13, 'TURDAL NATRAJ', 1.000, 1.00, 'KG', 100.00, 100.00, 100.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 16:16:24'),
(744, 'MMM8436', NULL, 494, 'KHAJUR', 0.500, 1.00, 'KG', 120.00, 60.00, 60.00, 0.00, 'CGSTSGST', 12.00, 7.20, '2020-03-07 16:16:24'),
(745, 'MMM8436', NULL, 30, 'CHANA DALL 1', 1.000, 1.00, 'KG', 75.00, 75.00, 75.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 16:16:24'),
(746, 'MMM8437', NULL, 13, 'TURDAL NATRAJ', 2.000, 1.00, 'KG', 100.00, 200.00, 200.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 16:39:22'),
(747, 'MMM8437', NULL, 39, 'MASOOR DALL A1', 1.000, 1.00, 'KG', 80.00, 80.00, 80.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 16:39:22'),
(748, 'MMM8437', NULL, 30, 'CHANA DALL 1', 2.000, 1.00, 'KG', 75.00, 150.00, 150.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 16:39:22'),
(749, 'MMM8437', NULL, 8, 'MOGAR A1', 2.000, 1.00, 'KG', 120.00, 240.00, 240.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 16:39:22'),
(750, 'MMM8437', NULL, 27, 'SABUDANA A1', 1.000, 1.00, 'KG', 90.00, 90.00, 90.00, 0.00, 'CGSTSGST', 5.00, 4.50, '2020-03-07 16:39:22'),
(751, 'MMM8437', NULL, 37, 'MASOOR A1 ', 1.000, 1.00, 'KG', 80.00, 80.00, 80.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 16:39:22'),
(752, 'MMM8437', NULL, 5, 'MOONG ', 1.000, 1.00, 'KG', 100.00, 100.00, 100.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 16:39:22'),
(753, 'MMM8437', NULL, 63, 'MATHKI A1', 1.000, 1.00, 'KG', 100.00, 100.00, 100.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 16:39:22'),
(754, 'MMM8437', NULL, 12, 'POHA JADA', 1.000, 1.00, 'KG', 44.00, 44.00, 44.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 16:39:22'),
(755, 'MMM8437', NULL, 14, 'POHA BARIK', 1.000, 1.00, 'KG', 48.00, 48.00, 48.00, 0.00, 'CGSTSGST', 5.00, 2.40, '2020-03-07 16:39:22'),
(756, 'MMM8437', NULL, 369, 'CHINGS SCHEZWAN 1KG', 1.000, 1.00, 'KG', 160.00, 160.00, 160.00, 0.00, 'CGSTSGST', 18.00, 28.80, '2020-03-07 16:39:22'),
(757, 'MMM8437', NULL, 367, 'CHINGS SS SAUCE', 1.000, 1.00, 'LTR', 45.00, 45.00, 45.00, 0.00, 'CGSTSGST', 12.00, 5.40, '2020-03-07 16:39:22'),
(758, 'MMM8437', NULL, 80, 'JEERA RAJWADI', 0.500, 1.00, 'KG', 240.00, 120.00, 120.00, 0.00, 'CGSTSGST', 5.00, 6.00, '2020-03-07 16:39:22'),
(759, 'MMM8437', NULL, 972, 'HING VANDEVI B. POWDER 100GM', 1.000, 1.00, 'GRM', 90.00, 90.00, 90.00, 0.00, 'CGSTSGST', 5.00, 4.50, '2020-03-07 16:39:22'),
(760, 'MMM8438', NULL, 255, 'RICE BASMATI UNIK', 1.000, 1.00, 'KG', 80.00, 80.00, 80.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 17:03:40'),
(761, 'MMM8438', NULL, 78, 'GUD 1no', 1.000, 1.00, 'KG', 56.00, 56.00, 56.00, 0.00, 'CGSTSGST', 5.00, 2.80, '2020-03-07 17:03:40'),
(762, 'MMM8438', NULL, 201, 'SINGDANA BORIYA', 1.000, 1.00, 'KG', 110.00, 110.00, 110.00, 0.00, 'CGSTSGST', 5.00, 5.50, '2020-03-07 17:03:40'),
(763, 'MMM8438', NULL, 520, 'TEJPATTA 25gm ', 1.000, 1.00, 'GRM', 10.00, 10.00, 10.00, 0.00, 'CGSTSGST', 5.00, 0.50, '2020-03-07 17:03:40'),
(764, 'MMM8438', NULL, 565, 'METHI R', 0.100, 1.00, 'KG', 200.00, 20.00, 20.00, 0.00, 'CGSTSGST', 5.00, 1.00, '2020-03-07 17:03:40'),
(765, 'MMM8439', NULL, 3, 'SUGAR JADI', 3.000, 1.00, 'KG', 40.00, 120.00, 120.00, 0.00, 'CGSTSGST', 5.00, 6.00, '2020-03-07 17:05:38'),
(766, 'MMM8439', NULL, 13, 'TURDAL NATRAJ', 1.000, 1.00, 'KG', 100.00, 100.00, 100.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 17:05:38'),
(767, 'MMM8439', NULL, 6, 'MOONG A1', 0.500, 1.00, 'KG', 110.00, 55.00, 55.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 17:05:38'),
(768, 'MMM8439', NULL, 37, 'MASOOR A1 ', 0.500, 1.00, 'KG', 80.00, 40.00, 40.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 17:05:38'),
(769, 'MMM8439', NULL, 8, 'MOGAR A1', 0.500, 1.00, 'KG', 120.00, 60.00, 60.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 17:05:38'),
(770, 'MMM8440', NULL, 1169, 'MAKHANA RAJBHOG', 0.250, 1.00, 'KG', 720.00, 180.00, 180.00, 0.00, 'CGSTSGST', 12.00, 21.60, '2020-03-07 17:07:15'),
(771, 'MMM8440', NULL, 705, 'MAGAJ WATERMELON', 0.250, 1.00, 'KG', 200.00, 50.00, 50.00, 0.00, 'CGSTSGST', 5.00, 2.50, '2020-03-07 17:07:15'),
(772, 'MMM8441', NULL, 3, 'SUGAR JADI', 3.000, 1.00, 'KG', 40.00, 120.00, 120.00, 0.00, 'CGSTSGST', 5.00, 6.00, '2020-03-07 17:08:25'),
(773, 'MMM8441', NULL, 38, 'MASOOR DALL', 0.500, 1.00, 'KG', 70.00, 35.00, 35.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 17:08:25'),
(774, 'MMM8442', NULL, 12, 'POHA JADA', 1.000, 1.00, 'KG', 44.00, 44.00, 44.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 17:14:42'),
(775, 'MMM8442', NULL, 113, 'WALL', 0.500, 1.00, 'KG', 100.00, 50.00, 50.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 17:14:42'),
(776, 'MMM8442', NULL, 36, 'MASOOR', 1.000, 1.00, 'KG', 70.00, 70.00, 70.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 17:14:42'),
(777, 'MMM8442', NULL, 588, 'PASTA MACRONI', 0.500, 1.00, 'KG', 60.00, 30.00, 30.00, 0.00, 'CGSTSGST', 12.00, 3.60, '2020-03-07 17:14:42'),
(778, 'MMM8442', NULL, 271, 'BESAN A1', 0.500, 1.00, 'KG', 80.00, 40.00, 40.00, 0.00, 'CGSTSGST', 5.00, 2.00, '2020-03-07 17:14:42'),
(779, 'MMM8442', NULL, 58, 'VATANA SAFED', 1.000, 1.00, 'KG', 80.00, 80.00, 80.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 17:14:42'),
(780, 'MMM8442', NULL, 55, 'VATANA KALA', 1.000, 1.00, 'KG', 80.00, 80.00, 80.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 17:14:42'),
(781, 'MMM8442', NULL, 201, 'SINGDANA BORIYA', 0.250, 1.00, 'KG', 120.00, 30.00, 30.00, 0.00, 'CGSTSGST', 5.00, 1.50, '2020-03-07 17:14:42'),
(782, 'MMM8442', NULL, 29, 'CHANA DALL', 0.500, 1.00, 'KG', 70.00, 35.00, 35.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 17:14:42'),
(783, 'MMM8442', NULL, 1098, 'KABULI', 0.500, 1.00, 'KG', 80.00, 40.00, 40.00, 0.00, 'CGSTSGST', 5.00, 2.00, '2020-03-07 17:14:42'),
(784, 'MMM8442', NULL, 38, 'MASOOR DALL', 0.500, 1.00, 'KG', 70.00, 35.00, 35.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 17:14:42'),
(785, 'MMM8442', NULL, 782, 'NOODLE ', 1.000, 1.00, 'PKT', 6.00, 6.00, 6.00, 0.00, 'CGSTSGST', 18.00, 1.08, '2020-03-07 17:14:42'),
(786, 'MMM8443', NULL, 545, 'ELACHI GREEN 100GM', 2.000, 1.00, 'PKT', 480.00, 960.00, 960.00, 0.00, 'CGSTSGST', 5.00, 48.00, '2020-03-07 17:32:08'),
(787, 'MMM8443', NULL, 421, 'KHUSKHUS 100GM', 1.000, 1.00, 'PKT', 140.00, 140.00, 140.00, 0.00, 'CGSTSGST', 5.00, 7.00, '2020-03-07 17:32:08'),
(788, 'MMM8443', NULL, 384, 'BADAM 1 NO  ', 0.250, 1.00, 'KG', 720.00, 180.00, 180.00, 0.00, 'CGSTSGST', 12.00, 21.60, '2020-03-07 17:32:08'),
(789, 'MMM8443', NULL, 462, 'PISTA KHARA 1', 0.250, 1.00, 'KG', 1200.00, 300.00, 300.00, 0.00, 'CGSTSGST', 12.00, 36.00, '2020-03-07 17:32:08'),
(790, 'MMM8443', NULL, 305, 'CHAROLI A1 100GM', 1.000, 1.00, 'GRM', 140.00, 140.00, 140.00, 0.00, 'CGSTSGST', 5.00, 7.00, '2020-03-07 17:32:08'),
(791, 'MMM8443', NULL, 297, 'CARAMEL 12 ', 1.000, 1.00, 'PCS', 300.00, 300.00, 300.00, 0.00, 'CGSTSGST', 28.00, 84.00, '2020-03-07 17:32:08'),
(792, 'MMM8443', NULL, 479, 'DRAKSH ', 0.500, 1.00, 'KG', 320.00, 160.00, 160.00, 0.00, 'CGSTSGST', 5.00, 8.00, '2020-03-07 17:32:08'),
(793, 'MMM8443', NULL, 867, 'FIVESTAR CUSTARD 1KG', 1.000, 1.00, 'PCS', 80.00, 80.00, 80.00, 0.00, 'CGSTSGST', 18.00, 14.40, '2020-03-07 17:32:08'),
(794, 'MMM8443', NULL, 867, 'FIVESTAR CUSTARD 1KG', 1.000, 1.00, 'PCS', 80.00, 80.00, 80.00, 0.00, 'CGSTSGST', 18.00, 14.40, '2020-03-07 17:32:08'),
(795, 'MMM8443', NULL, 751, 'NOBLE JAM 1KG', 1.000, 1.00, 'KG', 110.00, 110.00, 110.00, 0.00, 'CGSTSGST', 12.00, 13.20, '2020-03-07 17:32:08'),
(796, 'MMM8444', NULL, 3, 'SUGAR JADI', 5.000, 1.00, 'KG', 40.00, 200.00, 200.00, 0.00, 'CGSTSGST', 5.00, 10.00, '2020-03-07 17:39:38'),
(797, 'MMM8444', NULL, 26, 'SABUDANA', 3.000, 1.00, 'KG', 80.00, 240.00, 240.00, 0.00, 'CGSTSGST', 5.00, 12.00, '2020-03-07 17:39:38'),
(798, 'MMM8444', NULL, 203, 'SINGDANA NAVA DISKO', 1.000, 1.00, 'KG', 130.00, 130.00, 130.00, 0.00, 'CGSTSGST', 5.00, 6.50, '2020-03-07 17:39:38'),
(799, 'MMM8444', NULL, 977, 'HING VANDEVI Y. POWDER 100GM', 2.000, 1.00, 'GRM', 80.00, 160.00, 160.00, 0.00, 'CGSTSGST', 5.00, 8.00, '2020-03-07 17:39:38'),
(800, 'MMM8444', NULL, 36, 'MASOOR', 1.000, 1.00, 'KG', 70.00, 70.00, 70.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 17:39:38'),
(801, 'MMM8444', NULL, 8, 'MOGAR A1', 2.000, 1.00, 'KG', 120.00, 240.00, 240.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 17:39:38'),
(802, 'MMM8444', NULL, 29, 'CHANA DALL', 2.000, 1.00, 'KG', 70.00, 140.00, 140.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 17:39:38'),
(803, 'MMM8444', NULL, 171, 'GUD DESHI 1KG', 1.000, 1.00, 'KG', 60.00, 60.00, 60.00, 0.00, 'CGSTSGST', 5.00, 3.00, '2020-03-07 17:39:38'),
(804, 'MMM8444', NULL, 488, 'KISMIS CHAMELI', 0.250, 1.00, 'KG', 360.00, 90.00, 90.00, 0.00, 'CGSTSGST', 5.00, 4.50, '2020-03-07 17:39:38'),
(805, 'MMM8445', NULL, 482, 'DRAKSH SEEDLESS KALI', 1.000, 1.00, 'KG', 360.00, 360.00, 360.00, 0.00, 'CGSTSGST', 5.00, 18.00, '2020-03-07 18:09:39'),
(806, 'MMM8445', NULL, 384, 'BADAM 1 NO  ', 1.000, 1.00, 'KG', 700.00, 700.00, 700.00, 0.00, 'CGSTSGST', 12.00, 84.00, '2020-03-07 18:09:39'),
(807, 'MMM8445', NULL, 449, 'ANJEER NANA', 0.500, 1.00, 'KG', 700.00, 350.00, 350.00, 0.00, 'CGSTSGST', 5.00, 17.50, '2020-03-07 18:09:39'),
(808, 'MMM8446', NULL, 6, 'MOONG A1', 1.000, 1.00, 'KG', 110.00, 110.00, 110.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 18:17:28'),
(809, 'MMM8446', NULL, 41, 'CHILTI A1', 0.500, 1.00, 'KG', 110.00, 55.00, 55.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 18:17:28'),
(810, 'MMM8446', NULL, 12, 'POHA JADA', 0.500, 1.00, 'KG', 44.00, 22.00, 22.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 18:17:28'),
(811, 'MMM8447', NULL, 214, 'AAMCHUR POWDER 2', 0.500, 1.00, 'KG', 120.00, 60.00, 60.00, 0.00, 'CGSTSGST', 5.00, 3.00, '2020-03-07 18:28:19'),
(812, 'MMM8447', NULL, 349, 'TIL RAJWADI', 1.000, 1.00, 'KG', 200.00, 200.00, 200.00, 0.00, 'CGSTSGST', 5.00, 10.00, '2020-03-07 18:28:19'),
(813, 'MMM8447', NULL, 368, 'SUVA', 0.500, 1.00, 'KG', 160.00, 80.00, 80.00, 0.00, 'CGSTSGST', 5.00, 4.00, '2020-03-07 18:28:19'),
(814, 'MMM8447', NULL, 479, 'DRAKSH ', 1.000, 1.00, 'KG', 360.00, 360.00, 360.00, 0.00, 'CGSTSGST', 5.00, 18.00, '2020-03-07 18:28:19'),
(815, 'MMM8447', NULL, 485, 'KISMIS LAMBI', 0.500, 1.00, 'KG', 320.00, 160.00, 160.00, 0.00, 'CGSTSGST', 5.00, 8.00, '2020-03-07 18:28:19'),
(816, 'MMM8447', NULL, 494, 'KHAJUR', 1.000, 1.00, 'KG', 120.00, 120.00, 120.00, 0.00, 'CGSTSGST', 12.00, 14.40, '2020-03-07 18:28:19'),
(817, 'MMM8447', NULL, 449, 'ANJEER NANA', 0.500, 1.00, 'KG', 700.00, 350.00, 350.00, 0.00, 'CGSTSGST', 5.00, 17.50, '2020-03-07 18:28:19'),
(818, 'MMM8447', NULL, 476, 'AKHROD ROYAL MAGAJ', 0.500, 1.00, 'KG', 1600.00, 800.00, 800.00, 0.00, 'CGSTSGST', 5.00, 40.00, '2020-03-07 18:28:19'),
(819, 'MMM8447', NULL, 384, 'BADAM 1 NO  ', 0.500, 1.00, 'KG', 680.00, 340.00, 340.00, 0.00, 'CGSTSGST', 12.00, 40.80, '2020-03-07 18:28:19'),
(820, 'MMM8447', NULL, 227, 'ALSI', 0.500, 1.00, 'KG', 100.00, 50.00, 50.00, 0.00, 'CGSTSGST', 5.00, 2.50, '2020-03-07 18:28:19'),
(821, 'MMM8447', NULL, 1281, 'JEERA MOUSAM', 1.000, 1.00, 'KG', 260.00, 260.00, 260.00, 0.00, 'CGSTSGST', 5.00, 13.00, '2020-03-07 18:28:19'),
(822, 'MMM8447', NULL, 315, 'VARIYALI NAVI', 0.500, 1.00, 'KG', 200.00, 100.00, 100.00, 0.00, 'CGSTSGST', 5.00, 5.00, '2020-03-07 18:28:19'),
(823, 'MMM8447', NULL, 1052, 'PARROT TOMATO 10GM', 1.000, 1.00, 'PKT', 8.00, 8.00, 8.00, 0.00, 'CGSTSGST', 18.00, 1.44, '2020-03-07 18:28:19'),
(824, 'MMM8447', NULL, 1197, 'MAKHANA DOLLER', 0.500, 1.00, 'KG', 560.00, 280.00, 280.00, 0.00, 'CGSTSGST', 5.00, 14.00, '2020-03-07 18:28:19'),
(825, 'MMM8447', NULL, 1047, 'HARI OM CHAS MASALA 100GM', 1.000, 1.00, 'GRM', 20.00, 20.00, 20.00, 0.00, 'CGSTSGST', 5.00, 1.00, '2020-03-07 18:28:19'),
(826, 'MMM8448', NULL, 157, 'DHANA JEERA POWDER', 1.500, 1.00, 'KG', 200.00, 300.00, 300.00, 0.00, 'CGSTSGST', 5.00, 15.00, '2020-03-07 18:32:22'),
(827, 'MMM8448', NULL, 142, 'HALDI POWDER GOLDEN', 1.000, 1.00, 'PKT', 160.00, 160.00, 160.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 18:32:22'),
(828, 'MMM8449', NULL, 777, 'TALOD KHAMAN 200', 2.000, 1.00, 'GRM', 43.00, 86.00, 86.00, 0.00, 'CGSTSGST', 5.00, 4.30, '2020-03-07 18:32:59'),
(829, 'MMM8449', NULL, 215, 'ATTA MANCHURAN ', 2.000, 1.00, 'GRM', 35.00, 70.00, 70.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 18:32:59'),
(830, 'MMM8449', NULL, 197, 'KOPARA RAMAKDA', 0.500, 1.00, 'KG', 160.00, 80.00, 80.00, 0.00, 'CGSTSGST', 5.00, 4.00, '2020-03-07 18:32:59'),
(831, 'MMM8450', NULL, 142, 'HALDI POWDER GOLDEN', 3.000, 1.00, 'PKT', 160.00, 480.00, 480.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 18:44:48'),
(832, 'MMM8450', NULL, 156, 'DHANA POWDER', 1.000, 1.00, 'KG', 160.00, 160.00, 160.00, 0.00, 'CGSTSGST', 5.00, 8.00, '2020-03-07 18:44:48'),
(833, 'MMM8450', NULL, 220, 'AJMA  A1', 3.000, 1.00, 'KG', 180.00, 540.00, 540.00, 0.00, 'CGSTSGST', 5.00, 27.00, '2020-03-07 18:44:48'),
(834, 'MMM8450', NULL, 76, 'MIRCHI KASHMIR POWDER', 1.000, 1.00, 'KG', 200.00, 200.00, 200.00, 0.00, 'CGSTSGST', 5.00, 10.00, '2020-03-07 18:44:48'),
(835, 'MMM8450', NULL, 193, 'KOPARA A1 RAJAPUR', 2.500, 1.00, 'KG', 180.00, 450.00, 450.00, 0.00, 'CGSTSGST', 5.00, 22.50, '2020-03-07 18:44:48'),
(836, 'MMM8450', NULL, 734, 'PAPAD KHAR', 1.000, 1.00, 'KG', 80.00, 80.00, 80.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 18:44:48'),
(837, 'MMM8451', NULL, 1279, 'KOPARA 2 RAJAPUR ', 0.500, 1.00, 'KG', 180.00, 90.00, 90.00, 0.00, 'CGSTSGST', 5.00, 4.50, '2020-03-07 18:50:39'),
(838, 'MMM8451', NULL, 36, 'MASOOR', 1.000, 1.00, 'KG', 70.00, 70.00, 70.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 18:50:39'),
(839, 'MMM8451', NULL, 159, 'DHANA VM ', 0.500, 1.00, 'KG', 160.00, 80.00, 80.00, 0.00, 'CGSTSGST', 5.00, 4.00, '2020-03-07 18:50:39'),
(840, 'MMM8451', NULL, 315, 'VARIYALI NAVI', 0.250, 1.00, 'KG', 200.00, 50.00, 50.00, 0.00, 'CGSTSGST', 5.00, 2.50, '2020-03-07 18:50:39'),
(841, 'MMM8451', NULL, 79, 'JEERA 1', 0.250, 1.00, 'KG', 220.00, 55.00, 55.00, 0.00, 'CGSTSGST', 5.00, 2.75, '2020-03-07 18:50:39'),
(842, 'MMM8451', NULL, 532, 'MARI BLACK 50gm', 1.000, 1.00, 'GRM', 40.00, 40.00, 40.00, 0.00, 'CGSTSGST', 5.00, 2.00, '2020-03-07 18:50:39'),
(843, 'MMM8451', NULL, 981, 'HING VANDEVI Y. POWDER 50GM', 1.000, 1.00, 'GRM', 40.00, 40.00, 40.00, 0.00, 'CGSTSGST', 5.00, 2.00, '2020-03-07 18:50:39'),
(844, 'MMM8451', NULL, 32, 'CHANA ', 0.500, 1.00, 'KG', 70.00, 35.00, 35.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 18:50:39'),
(845, 'MMM8452', NULL, 412, 'KAJU TUKDA 3', 0.500, 1.00, 'KG', 580.00, 290.00, 290.00, 0.00, 'CGSTSGST', 5.00, 14.50, '2020-03-07 19:07:19'),
(846, 'MMM8452', NULL, 384, 'BADAM 1 NO  ', 0.500, 1.00, 'KG', 680.00, 340.00, 340.00, 0.00, 'CGSTSGST', 12.00, 40.80, '2020-03-07 19:07:19'),
(847, 'MMM8452', NULL, 387, 'BADAM SP', 0.500, 1.00, 'KG', 920.00, 460.00, 460.00, 0.00, 'CGSTSGST', 12.00, 55.20, '2020-03-07 19:07:19'),
(848, 'MMM8452', NULL, 515, 'KHARAK BLACK POWDER', 0.500, 1.00, 'KG', 360.00, 180.00, 180.00, 0.00, 'CGSTSGST', 12.00, 21.60, '2020-03-07 19:07:19'),
(849, 'MMM8452', NULL, 515, 'KHARAK BLACK POWDER', 0.250, 1.00, 'KG', 360.00, 90.00, 90.00, 0.00, 'CGSTSGST', 12.00, 10.80, '2020-03-07 19:07:19'),
(850, 'MMM8452', NULL, 501, 'KHAJUR KAMRAN ', 0.500, 1.00, 'KG', 240.00, 120.00, 120.00, 0.00, 'CGSTSGST', 12.00, 14.40, '2020-03-07 19:07:19'),
(851, 'MMM8452', NULL, 485, 'KISMIS LAMBI', 0.500, 1.00, 'KG', 320.00, 160.00, 160.00, 0.00, 'CGSTSGST', 5.00, 8.00, '2020-03-07 19:07:19'),
(852, 'MMM8452', NULL, 8, 'MOGAR A1', 0.250, 1.00, 'KG', 140.00, 35.00, 35.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 19:07:19'),
(853, 'MMM8452', NULL, 417, 'KAJU TUKDA KALBAVI ', 0.500, 1.00, 'KG', 780.00, 390.00, 390.00, 0.00, 'CGSTSGST', 5.00, 19.50, '2020-03-07 19:07:19'),
(854, 'MMM8452', NULL, 460, 'PISTA A1', 0.250, 1.00, 'KG', 1600.00, 400.00, 400.00, 0.00, 'CGSTSGST', 12.00, 48.00, '2020-03-07 19:07:19'),
(855, 'MMM8452', NULL, 126, 'SUGAR BURA', 0.250, 1.00, 'KG', 60.00, 15.00, 15.00, 0.00, 'CGSTSGST', 5.00, 0.75, '2020-03-07 19:07:19'),
(856, 'MMM8452', NULL, 1185, 'BESAN A1 500gm', 1.000, 1.00, 'PKT', 40.00, 40.00, 40.00, 0.00, 'CGSTSGST', 5.00, 2.00, '2020-03-07 19:07:19'),
(857, 'MMM8452', NULL, 179, 'GUD KESAR DESHI DABBA 500GM', 1.000, 1.00, 'KG', 90.00, 90.00, 90.00, 0.00, 'CGSTSGST', 5.00, 4.50, '2020-03-07 19:07:19'),
(858, 'MMM8452', NULL, 954, 'KESAR A1', 1.000, 1.00, 'GRM', 100.00, 100.00, 100.00, 0.00, 'CGSTSGST', 5.00, 5.00, '2020-03-07 19:07:19'),
(859, 'MMM8453', NULL, 13, 'TURDAL NATRAJ', 1.000, 1.00, 'KG', 100.00, 100.00, 100.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 19:12:30'),
(860, 'MMM8453', NULL, 39, 'MASOOR DALL A1', 1.000, 1.00, 'KG', 80.00, 80.00, 80.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 19:12:30'),
(861, 'MMM8453', NULL, 8, 'MOGAR A1', 1.000, 1.00, 'KG', 120.00, 120.00, 120.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 19:12:30'),
(862, 'MMM8453', NULL, 37, 'MASOOR A1 ', 1.000, 1.00, 'KG', 80.00, 80.00, 80.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 19:12:30'),
(863, 'MMM8453', NULL, 57, 'VATANA KALA MARUTI', 1.000, 1.00, 'KG', 100.00, 100.00, 100.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 19:12:30'),
(864, 'MMM8453', NULL, 59, 'VATANA SAFED 1', 1.000, 1.00, 'KG', 90.00, 90.00, 90.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 19:12:30'),
(865, 'MMM8453', NULL, 30, 'CHANA DALL 1', 2.000, 1.00, 'KG', 75.00, 150.00, 150.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 19:12:30'),
(866, 'MMM8453', NULL, 30, 'CHANA DALL 1', 0.500, 1.00, 'KG', 75.00, 37.50, 37.50, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-07 19:12:30'),
(867, 'MMM8453', NULL, 80, 'JEERA RAJWADI', 0.250, 1.00, 'KG', 240.00, 60.00, 60.00, 0.00, 'CGSTSGST', 5.00, 3.00, '2020-03-07 19:12:30'),
(868, 'MMM8453', NULL, 93, 'RAI A1', 0.250, 1.00, 'KG', 100.00, 25.00, 25.00, 0.00, 'CGSTSGST', 5.00, 1.25, '2020-03-07 19:12:30'),
(869, 'MMM8453', NULL, 315, 'VARIYALI NAVI', 0.250, 1.00, 'KG', 200.00, 50.00, 50.00, 0.00, 'CGSTSGST', 5.00, 2.50, '2020-03-07 19:12:30'),
(870, 'MMM8453', NULL, 201, 'SINGDANA BORIYA', 1.000, 1.00, 'KG', 120.00, 120.00, 120.00, 0.00, 'CGSTSGST', 5.00, 6.00, '2020-03-07 19:12:30'),
(871, 'MMM8453', NULL, 616, 'MAGADIYA 1 PC', 2.000, 1.00, 'PCS', 10.00, 20.00, 20.00, 0.00, 'CGSTSGST', 5.00, 1.00, '2020-03-07 19:12:30'),
(872, 'MMM8454', NULL, 10, 'TURDAL', 2.000, 1.00, 'KG', 80.00, 160.00, 160.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-09 10:58:08'),
(873, 'MMM8454', NULL, 197, 'KOPARA RAMAKDA', 0.500, 1.00, 'KG', 170.00, 85.00, 85.00, 0.00, 'CGSTSGST', 5.00, 4.25, '2020-03-09 10:58:08'),
(874, 'MMM8455', NULL, 3, 'SUGAR JADI', 1.000, 1.00, 'KG', 40.00, 40.00, 40.00, 0.00, 'CGSTSGST', 5.00, 2.00, '2020-03-09 11:04:44'),
(875, 'MMM8456', NULL, 3, 'SUGAR JADI', 0.000, 1.00, 'KG', 40.00, 0.00, 0.00, 0.00, 'CGSTSGST', 5.00, 0.00, '2020-03-11 10:40:47'),
(876, 'MMM8457', NULL, 1279, 'KOPARA 2 RAJAPUR ', 0.500, 1.00, 'KG', 180.00, 90.00, 90.00, 0.00, 'CGSTSGST', 5.00, 4.50, '2020-03-11 10:41:58'),
(877, 'MMM8457', NULL, 12, 'POHA JADA', 0.500, 1.00, 'KG', 44.00, 22.00, 22.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-11 10:41:58'),
(878, 'MMM8457', NULL, 21, 'RAVA JADA', 0.500, 1.00, 'KG', 36.00, 18.00, 18.00, 0.00, 'CGSTSGST', 5.00, 0.90, '2020-03-11 10:41:58'),
(879, 'MMM8457', NULL, 385, 'BADAM 100gm', 1.000, 1.00, 'GRM', 80.00, 80.00, 80.00, 0.00, 'CGSTSGST', 12.00, 9.60, '2020-03-11 10:41:58'),
(880, 'MMM8457', NULL, 94, 'RAI A1 100GM', 1.000, 1.00, 'GRM', 15.00, 15.00, 15.00, 0.00, 'CGSTSGST', 5.00, 0.75, '2020-03-11 10:41:58'),
(881, 'MMM8457', NULL, 81, 'JEERA RAJWADI 100 GM', 1.000, 1.00, 'GRM', 30.00, 30.00, 30.00, 0.00, 'CGSTSGST', 5.00, 1.50, '2020-03-11 10:41:58'),
(882, 'MMM8457', NULL, 166, 'GUD 250GM', 1.000, 1.00, 'GRM', 15.00, 15.00, 15.00, 0.00, 'CGSTSGST', 5.00, 0.75, '2020-03-11 10:41:58'),
(883, 'MMM8458', NULL, 13, 'TURDAL NATRAJ', 3.000, 1.00, 'KG', 100.00, 300.00, 300.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-11 10:47:33'),
(884, 'MMM8458', NULL, 743, 'PAPAD LIJJAT UDAD 200GM', 1.000, 1.00, 'GRM', 55.00, 55.00, 55.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-11 10:47:33'),
(885, 'MMM8458', NULL, 519, 'TEJPATTA 50gm', 1.000, 1.00, 'GRM', 20.00, 20.00, 20.00, 0.00, 'CGSTSGST', 5.00, 1.00, '2020-03-11 10:47:33'),
(886, 'MMM8458', NULL, 32, 'CHANA ', 0.250, 1.00, 'KG', 80.00, 20.00, 20.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-11 10:47:33'),
(887, 'MMM8458', NULL, 30, 'CHANA DALL 1', 1.000, 1.00, 'KG', 75.00, 75.00, 75.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-11 10:47:33'),
(888, 'MMM8458', NULL, 78, 'GUD 1no', 0.500, 1.00, 'KG', 56.00, 28.00, 28.00, 0.00, 'CGSTSGST', 5.00, 1.40, '2020-03-11 10:47:33'),
(889, 'MMM8458', NULL, 30, 'CHANA DALL 1', 0.500, 1.00, 'KG', 75.00, 37.50, 37.50, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-11 10:47:33'),
(890, 'MMM8458', NULL, 162, 'DALIYA A1', 0.250, 1.00, 'KG', 100.00, 25.00, 25.00, 0.00, 'CGSTSGST', 12.00, 3.00, '2020-03-11 10:47:33'),
(891, 'MMM8458', NULL, 1099, 'KABULI A1', 0.250, 1.00, 'KG', 100.00, 25.00, 25.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-11 10:47:33'),
(892, 'MMM8458', NULL, 85, 'JEERA SHAJEERA 50GM', 1.000, 1.00, 'GRM', 50.00, 50.00, 50.00, 0.00, 'CGSTSGST', 5.00, 2.50, '2020-03-11 10:47:33'),
(893, 'MMM8458', NULL, 255, 'RICE BASMATI UNIK', 1.000, 1.00, 'KG', 80.00, 80.00, 80.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-11 10:47:33'),
(894, 'MMM8459', NULL, 13, 'TURDAL NATRAJ', 0.500, 1.00, 'KG', 100.00, 50.00, 50.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-11 11:01:52'),
(895, 'MMM8459', NULL, 7, 'MOGAR ', 0.500, 1.00, 'KG', 110.00, 55.00, 55.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-11 11:01:52'),
(896, 'MMM8459', NULL, 38, 'MASOOR DALL', 0.250, 1.00, 'KG', 80.00, 20.00, 20.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-11 11:01:52'),
(897, 'MMM8459', NULL, 32, 'CHANA ', 0.500, 1.00, 'KG', 70.00, 35.00, 35.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-11 11:01:52'),
(898, 'MMM8459', NULL, 66, 'CHORA A1', 0.500, 1.00, 'KG', 90.00, 45.00, 45.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-11 11:01:52'),
(899, 'MMM8459', NULL, 78, 'GUD 1no', 0.500, 1.00, 'KG', 56.00, 28.00, 28.00, 0.00, 'CGSTSGST', 5.00, 1.40, '2020-03-11 11:01:52'),
(900, 'MMM8460', NULL, 259, 'RICE BASMATI WAGHA', 1.500, 1.00, 'KG', 100.00, 150.00, 150.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-11 11:10:04'),
(901, 'MMM8460', NULL, 259, 'RICE BASMATI WAGHA', 1.750, 1.00, 'KG', 100.00, 175.00, 175.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-11 11:10:04'),
(902, 'MMM8460', NULL, 202, 'MAIDA', 1.250, 1.00, 'KG', 32.00, 40.00, 40.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-11 11:10:04'),
(903, 'MMM8460', NULL, 202, 'MAIDA', 4.000, 1.00, 'KG', 32.00, 128.00, 128.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-11 11:10:04'),
(904, 'MMM8460', NULL, 3, 'SUGAR JADI', 6.000, 1.00, 'KG', 40.00, 240.00, 240.00, 0.00, 'CGSTSGST', 5.00, 12.00, '2020-03-11 11:10:04'),
(905, 'MMM8460', NULL, 887, 'KHAMAN K.K', 0.750, 1.00, 'KG', 200.00, 150.00, 150.00, 0.00, 'CGSTSGST', 5.00, 7.50, '2020-03-11 11:10:04'),
(906, 'MMM8460', NULL, 34, 'CHANA MOSAMBI', 1.000, 1.00, 'KG', 90.00, 90.00, 90.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-11 11:10:05'),
(907, 'MMM8460', NULL, 1166, 'EMLI BARAF', 0.250, 1.00, 'KG', 160.00, 40.00, 40.00, 0.00, 'CGSTSGST', 5.00, 2.00, '2020-03-11 11:10:05'),
(908, 'MMM8460', NULL, 271, 'BESAN A1', 0.500, 1.00, 'KG', 80.00, 40.00, 40.00, 0.00, 'CGSTSGST', 5.00, 2.00, '2020-03-11 11:10:05'),
(909, 'MMM8461', NULL, 143, 'HALDI POWDAR 100 gm', 1.000, 1.00, 'GRM', 20.00, 20.00, 20.00, 0.00, 'CGSTSGST', 5.00, 1.00, '2020-03-11 11:34:23'),
(910, 'MMM8461', NULL, 93, 'RAI A1', 0.500, 1.00, 'KG', 80.00, 40.00, 40.00, 0.00, 'CGSTSGST', 5.00, 2.00, '2020-03-11 11:34:23'),
(911, 'MMM8461', NULL, 565, 'METHI R', 0.100, 1.00, 'KG', 200.00, 20.00, 20.00, 0.00, 'CGSTSGST', 5.00, 1.00, '2020-03-11 11:34:23'),
(912, 'MMM8461', NULL, 81, 'JEERA RAJWADI 100 GM', 1.000, 1.00, 'GRM', 30.00, 30.00, 30.00, 0.00, 'CGSTSGST', 5.00, 1.50, '2020-03-11 11:34:23'),
(913, 'MMM8461', NULL, 12, 'POHA JADA', 1.000, 1.00, 'KG', 44.00, 44.00, 44.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-11 11:34:23'),
(914, 'MMM8461', NULL, 26, 'SABUDANA', 1.000, 1.00, 'KG', 80.00, 80.00, 80.00, 0.00, 'CGSTSGST', 5.00, 4.00, '2020-03-11 11:34:23'),
(915, 'MMM8461', NULL, 21, 'RAVA JADA', 1.000, 1.00, 'KG', 36.00, 36.00, 36.00, 0.00, 'CGSTSGST', 5.00, 1.80, '2020-03-11 11:34:23'),
(916, 'MMM8461', NULL, 196, 'LAPSI BARIK', 1.000, 1.00, 'KG', 48.00, 48.00, 48.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-11 11:34:23'),
(917, 'MMM8461', NULL, 91, 'CHORA LAL', 0.250, 1.00, 'KG', 100.00, 25.00, 25.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-11 11:34:23'),
(918, 'MMM8461', NULL, 6, 'MOONG A1', 0.250, 1.00, 'KG', 120.00, 30.00, 30.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-11 11:34:23'),
(919, 'MMM8462', NULL, 3, 'SUGAR JADI', 2.000, 1.00, 'KG', 40.00, 80.00, 80.00, 0.00, 'CGSTSGST', 5.00, 4.00, '2020-03-11 11:40:11'),
(920, 'MMM8462', NULL, 12, 'POHA JADA', 2.000, 1.00, 'KG', 44.00, 88.00, 88.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-11 11:40:11'),
(921, 'MMM8462', NULL, 156, 'DHANA POWDER', 0.100, 1.00, 'KG', 200.00, 20.00, 20.00, 0.00, 'CGSTSGST', 5.00, 1.00, '2020-03-11 11:40:11'),
(922, 'MMM8462', NULL, 1147, 'JEERA POWDER A1', 0.100, 1.00, 'KG', 300.00, 30.00, 30.00, 0.00, 'CGSTSGST', 5.00, 1.50, '2020-03-11 11:40:11'),
(923, 'MMM8462', NULL, 60, 'VATANA SAFED A1', 1.000, 1.00, 'KG', 100.00, 100.00, 100.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-11 11:40:11'),
(924, 'MMM8462', NULL, 44, 'UDAD DALL 1', 2.000, 1.00, 'KG', 120.00, 240.00, 240.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-11 11:40:11'),
(925, 'MMM8462', NULL, 94, 'RAI A1 100GM', 1.000, 1.00, 'GRM', 15.00, 15.00, 15.00, 0.00, 'CGSTSGST', 5.00, 0.75, '2020-03-11 11:40:11'),
(926, 'MMM8462', NULL, 1175, 'EV KASTURI METHI 25GM', 1.000, 1.00, 'BOX', 23.00, 23.00, 23.00, 0.00, 'CGSTSGST', 5.00, 1.15, '2020-03-11 11:40:11'),
(927, 'MMM8462', NULL, 1107, 'RASOI MAGIC JAIN', 4.000, 1.00, 'PKT', 35.00, 140.00, 140.00, 0.00, 'CGSTSGST', 5.00, 7.00, '2020-03-11 11:40:11'),
(928, 'MMM8462', NULL, 977, 'HING VANDEVI Y. POWDER 100GM', 1.000, 1.00, 'GRM', 80.00, 80.00, 80.00, 0.00, 'CGSTSGST', 5.00, 4.00, '2020-03-11 11:40:11'),
(929, 'MMM8462', NULL, 845, 'MAGGIE MASALA 100gm', 1.000, 1.00, 'GRM', 60.00, 60.00, 60.00, 0.00, 'CGSTSGST', 5.00, 3.00, '2020-03-11 11:40:11'),
(930, 'MMM8462', NULL, 1279, 'KOPARA 2 RAJAPUR ', 2.000, 1.00, 'KG', 180.00, 360.00, 360.00, 0.00, 'CGSTSGST', 5.00, 18.00, '2020-03-11 11:40:11'),
(931, 'MMM8462', NULL, 201, 'SINGDANA BORIYA', 1.000, 1.00, 'KG', 120.00, 120.00, 120.00, 0.00, 'CGSTSGST', 5.00, 6.00, '2020-03-11 11:40:11'),
(932, 'MMM8462', NULL, 27, 'SABUDANA A1', 1.000, 1.00, 'KG', 90.00, 90.00, 90.00, 0.00, 'CGSTSGST', 5.00, 4.50, '2020-03-11 11:40:11'),
(933, 'MMM8462', NULL, 737, 'PAPAD LIJJAT MINI 1KG', 1.000, 1.00, 'KG', 235.00, 235.00, 235.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-11 11:40:11'),
(934, 'MMM8462', NULL, 508, 'KHARAK AA', 0.500, 1.00, 'KG', 240.00, 120.00, 120.00, 0.00, 'CGSTSGST', 12.00, 14.40, '2020-03-11 11:40:11'),
(935, 'MMM8463', NULL, 143, 'HALDI POWDAR 100 gm', 1.000, 1.00, 'GRM', 20.00, 20.00, 20.00, 0.00, 'CGSTSGST', 5.00, 1.00, '2020-03-11 11:40:36'),
(936, 'MMM8464', NULL, 588, 'PASTA MACRONI', 0.500, 1.00, 'KG', 60.00, 30.00, 30.00, 0.00, 'CGSTSGST', 12.00, 3.60, '2020-03-11 11:54:52'),
(937, 'MMM8464', NULL, 699, 'BORIC POWDER 400gm', 1.000, 1.00, 'GRM', 80.00, 80.00, 80.00, 0.00, 'CGSTSGST', 12.00, 9.60, '2020-03-11 11:54:52'),
(938, 'MMM8465', NULL, 705, 'MAGAJ WATERMELON', 1.000, 1.00, 'KG', 160.00, 160.00, 160.00, 0.00, 'CGSTSGST', 5.00, 8.00, '2020-03-11 12:04:00'),
(939, 'MMM8465', NULL, 434, 'KAJU KANI', 1.000, 1.00, 'KG', 280.00, 280.00, 280.00, 0.00, 'CGSTSGST', 5.00, 14.00, '2020-03-11 12:04:00'),
(940, 'MMM8465', NULL, 353, 'TIL WHITE 2', 0.250, 1.00, 'KG', 180.00, 45.00, 45.00, 0.00, 'CGSTSGST', 5.00, 2.25, '2020-03-11 12:04:00'),
(941, 'MMM8465', NULL, 423, 'KHASKHAS 50GM', 0.250, 1.00, 'GRM', 1200.00, 300.00, 300.00, 0.00, 'CGSTSGST', 5.00, 15.00, '2020-03-11 12:04:00'),
(942, 'MMM8465', NULL, 551, 'MARI WHITE POWDER', 0.500, 1.00, 'KG', 160.00, 80.00, 80.00, 0.00, 'CGSTSGST', 5.00, 4.00, '2020-03-11 12:04:00'),
(943, 'MMM8465', NULL, 618, 'AJINO MOTO', 0.500, 1.00, 'KG', 140.00, 70.00, 70.00, 0.00, 'CGSTSGST', 5.00, 3.50, '2020-03-11 12:04:00'),
(944, 'MMM8466', NULL, 27, 'SABUDANA A1', 0.750, 1.00, 'KG', 100.00, 75.00, 75.00, 0.00, 'CGSTSGST', 5.00, 3.75, '2020-03-11 15:19:37'),
(945, 'MMM8466', NULL, 201, 'SINGDANA BORIYA', 0.500, 1.00, 'KG', 120.00, 60.00, 60.00, 0.00, 'CGSTSGST', 5.00, 3.00, '2020-03-11 15:19:37'),
(946, 'MMM8466', NULL, 370, 'SUVA JAMNAGAR', 0.250, 1.00, 'KG', 180.00, 45.00, 45.00, 0.00, 'CGSTSGST', 5.00, 2.25, '2020-03-11 15:19:37'),
(947, 'MMM8466', NULL, 80, 'JEERA RAJWADI', 0.250, 1.00, 'KG', 240.00, 60.00, 60.00, 0.00, 'CGSTSGST', 5.00, 3.00, '2020-03-11 15:19:37'),
(948, 'MMM8466', NULL, 78, 'GUD 1no', 0.500, 1.00, 'KG', 56.00, 28.00, 28.00, 0.00, 'CGSTSGST', 5.00, 1.40, '2020-03-11 15:19:37'),
(949, 'MMM8466', NULL, 363, 'TEA GOLDEN', 0.500, 1.00, 'KG', 240.00, 120.00, 120.00, 0.00, 'CGSTSGST', 5.00, 6.00, '2020-03-11 15:19:37'),
(950, 'MMM8466', NULL, 12, 'POHA JADA', 0.500, 1.00, 'KG', 44.00, 22.00, 22.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-11 15:19:37'),
(951, 'MMM8467', NULL, 370, 'SUVA JAMNAGAR', 0.250, 1.00, 'KG', 180.00, 45.00, 45.00, 0.00, 'CGSTSGST', 5.00, 2.25, '2020-03-11 15:20:17'),
(952, 'MMM8467', NULL, 80, 'JEERA RAJWADI', 0.250, 1.00, 'KG', 240.00, 60.00, 60.00, 0.00, 'CGSTSGST', 5.00, 3.00, '2020-03-11 15:20:17'),
(953, 'MMM8467', NULL, 311, 'VARIYALI 100GM', 1.000, 1.00, 'GRM', 30.00, 30.00, 30.00, 0.00, 'CGSTSGST', 5.00, 1.50, '2020-03-11 15:20:17'),
(954, 'MMM8467', NULL, 146, 'DHANA 100gm', 1.000, 1.00, 'GRM', 30.00, 30.00, 30.00, 0.00, 'CGSTSGST', 5.00, 1.50, '2020-03-11 15:20:17'),
(955, 'MMM8468', NULL, 122, 'WALL PAPDI', 0.500, 1.00, 'KG', 120.00, 60.00, 60.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-11 17:04:32'),
(956, 'MMM8468', NULL, 737, 'PAPAD LIJJAT MINI 1KG', 1.000, 1.00, 'KG', 235.00, 235.00, 235.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-11 17:04:32'),
(957, 'MMM8469', NULL, 29, 'CHANA DALL', 3.000, 1.00, 'KG', 70.00, 210.00, 210.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-11 19:20:16'),
(958, 'MMM8469', NULL, 65, 'CHORA 2', 2.000, 1.00, 'KG', 80.00, 160.00, 160.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-11 19:20:16'),
(959, 'MMM8469', NULL, 1098, 'KABULI', 2.000, 1.00, 'KG', 80.00, 160.00, 160.00, 0.00, 'CGSTSGST', 5.00, 8.00, '2020-03-11 19:20:16'),
(960, 'MMM8469', NULL, 13, 'TURDAL NATRAJ', 1.000, 1.00, 'KG', 100.00, 100.00, 100.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-11 19:20:16'),
(961, 'MMM8469', NULL, 3, 'SUGAR JADI', 10.000, 1.00, 'KG', 40.00, 400.00, 400.00, 0.00, 'CGSTSGST', 5.00, 20.00, '2020-03-11 19:20:16'),
(962, 'MMM8469', NULL, 32, 'CHANA ', 2.000, 1.00, 'KG', 70.00, 140.00, 140.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-11 19:20:16'),
(963, 'MMM8469', NULL, 7, 'MOGAR ', 3.000, 1.00, 'KG', 110.00, 330.00, 330.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-11 19:20:16'),
(964, 'MMM8469', NULL, 40, 'CHILTI', 10.000, 1.00, 'KG', 100.00, 1000.00, 1000.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-11 19:20:16'),
(965, 'MMM8469', NULL, 5, 'MOONG ', 1.000, 1.00, 'KG', 100.00, 100.00, 100.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-11 19:20:16'),
(966, 'MMM8469', NULL, 977, 'HING VANDEVI Y. POWDER 100GM', 1.000, 1.00, 'GRM', 80.00, 80.00, 80.00, 0.00, 'CGSTSGST', 5.00, 4.00, '2020-03-11 19:20:16'),
(967, 'MMM8469', NULL, 1277, 'DELIVERY CHARGE ', 1.000, 1.00, 'PKT', 60.00, 60.00, 60.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-11 19:20:16'),
(968, 'MMM8470', NULL, 3, 'SUGAR JADI', 1.000, 1.00, 'KG', 40.00, 40.00, 40.00, 0.00, 'CGSTSGST', 5.00, 2.00, '2020-03-12 10:38:50'),
(969, 'MMM8471', NULL, 10, 'TURDAL', 1.000, 1.00, 'KG', 80.00, 80.00, 80.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-12 11:07:04'),
(970, 'MMM8471', NULL, 29, 'CHANA DALL', 1.000, 1.00, 'KG', 70.00, 70.00, 70.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-12 11:07:04'),
(971, 'MMM8471', NULL, 826, 'SURBHI SAUCE POUCH 1KG', 1.000, 1.00, 'LTR', 75.00, 75.00, 75.00, 0.00, 'CGSTSGST', 8.00, 6.00, '2020-03-12 11:07:04'),
(972, 'MMM8471', NULL, 222, 'AJMA NAVA', 1.000, 1.00, 'KG', 360.00, 360.00, 360.00, 0.00, 'CGSTSGST', 5.00, 18.00, '2020-03-12 11:07:04'),
(973, 'MMM8471', NULL, 80, 'JEERA RAJWADI', 1.000, 1.00, 'KG', 240.00, 240.00, 240.00, 0.00, 'CGSTSGST', 5.00, 12.00, '2020-03-12 11:07:04'),
(974, 'MMM8472', NULL, 354, 'CHILLY PANDY', 0.500, 1.00, 'KG', 200.00, 100.00, 100.00, 0.00, 'CGSTSGST', 5.00, 5.00, '2020-03-12 11:10:20'),
(975, 'MMM8472', NULL, 78, 'GUD 1no', 0.500, 1.00, 'KG', 56.00, 28.00, 28.00, 0.00, 'CGSTSGST', 5.00, 1.40, '2020-03-12 11:10:20'),
(976, 'MMM8472', NULL, 352, 'CHILLY KASHMIRI', 0.250, 1.00, 'KG', 340.00, 85.00, 85.00, 0.00, 'CGSTSGST', 5.00, 4.25, '2020-03-12 11:10:20'),
(977, 'MMM8473', NULL, 21, 'RAVA JADA', 11.250, 1.00, 'KG', 36.00, 405.00, 405.00, 0.00, 'CGSTSGST', 5.00, 20.25, '2020-03-12 13:18:10'),
(978, 'MMM8473', NULL, 78, 'GUD 1no', 8.000, 1.00, 'KG', 400.00, 3200.00, 3200.00, 0.00, 'CGSTSGST', 5.00, 160.00, '2020-03-12 13:18:10'),
(979, 'MMM8473', NULL, 414, 'KAJU TUKDA JUMBO', 0.500, 1.00, 'KG', 800.00, 400.00, 400.00, 0.00, 'CGSTSGST', 5.00, 20.00, '2020-03-12 13:18:10'),
(980, 'MMM8473', NULL, 485, 'KISMIS LAMBI', 0.500, 1.00, 'KG', 320.00, 160.00, 160.00, 0.00, 'CGSTSGST', 5.00, 8.00, '2020-03-12 13:18:10'),
(981, 'MMM8473', NULL, 3, 'SUGAR JADI', 15.000, 1.00, 'KG', 40.00, 600.00, 600.00, 0.00, 'CGSTSGST', 5.00, 30.00, '2020-03-12 13:18:10'),
(982, 'MMM8473', NULL, 303, 'CHAROLI A1', 0.250, 1.00, 'KG', 1200.00, 300.00, 300.00, 0.00, 'CGSTSGST', 12.00, 36.00, '2020-03-12 13:18:10'),
(983, 'MMM8473', NULL, 954, 'KESAR A1', 1.000, 1.00, 'GRM', 100.00, 100.00, 100.00, 0.00, 'CGSTSGST', 5.00, 5.00, '2020-03-12 13:18:10'),
(984, 'MMM8473', NULL, 386, 'BADAM NAVI', 0.500, 1.00, 'KG', 760.00, 380.00, 380.00, 0.00, 'CGSTSGST', 12.00, 45.60, '2020-03-12 13:18:10'),
(985, 'MMM8473', NULL, 546, 'ELACHI GREEN 50GM', 1.000, 1.00, 'PKT', 240.00, 240.00, 240.00, 0.00, 'CGSTSGST', 5.00, 12.00, '2020-03-12 13:18:10'),
(986, 'MMM8473', NULL, 1277, 'DELIVERY CHARGE ', 1.000, 1.00, 'PKT', 80.00, 80.00, 80.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-12 13:18:10'),
(987, 'MMM8474', NULL, 113, 'WALL', 0.500, 1.00, 'KG', 100.00, 50.00, 50.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-12 14:05:34'),
(988, 'MMM8474', NULL, 203, 'SINGDANA NAVA DISKO', 0.500, 1.00, 'KG', 130.00, 65.00, 65.00, 0.00, 'CGSTSGST', 5.00, 3.25, '2020-03-12 14:05:34'),
(989, 'MMM8474', NULL, 27, 'SABUDANA A1', 0.500, 1.00, 'KG', 90.00, 45.00, 45.00, 0.00, 'CGSTSGST', 5.00, 2.25, '2020-03-12 14:05:34'),
(990, 'MMM8474', NULL, 142, 'HALDI POWDER GOLDEN', 0.250, 1.00, 'PKT', 160.00, 40.00, 40.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-12 14:05:34'),
(991, 'MMM8475', NULL, 74, 'MIRCHI DABBI POWDER', 2.000, 1.00, 'KG', 360.00, 720.00, 720.00, 0.00, 'CGSTSGST', 5.00, 36.00, '2020-03-12 14:18:37'),
(992, 'MMM8476', NULL, 251, 'RICE STEAM KOLUM', 5.000, 1.00, 'KG', 44.00, 220.00, 220.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-12 14:22:20'),
(993, 'MMM8477', NULL, 4, 'SUGAR BARIK', 5.000, 1.00, 'KG', 38.00, 190.00, 190.00, 0.00, 'CGSTSGST', 5.00, 9.50, '2020-03-12 14:26:40'),
(994, 'MMM8477', NULL, 78, 'GUD 1no', 2.000, 1.00, 'KG', 56.00, 112.00, 112.00, 0.00, 'CGSTSGST', 5.00, 5.60, '2020-03-12 14:26:40'),
(995, 'MMM8477', NULL, 242, 'RICE PALO DUBAR', 3.000, 1.00, 'KG', 50.00, 150.00, 150.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-03-12 14:26:40'),
(996, 'MMM8477', NULL, 494, 'KHAJUR', 1.000, 1.00, 'KG', 130.00, 130.00, 130.00, 0.00, 'CGSTSGST', 12.00, 15.60, '2020-03-12 14:26:40');

-- --------------------------------------------------------

--
-- Table structure for table `salesdetailsmaster_04_2020`
--

CREATE TABLE `salesdetailsmaster_04_2020` (
  `id` int(11) NOT NULL,
  `invoiceid` varchar(50) NOT NULL,
  `prodid` varchar(50) DEFAULT NULL,
  `prodid_` int(11) NOT NULL DEFAULT 0,
  `bprodname` varchar(100) NOT NULL,
  `istock` decimal(10,2) NOT NULL,
  `iinstock` decimal(10,2) NOT NULL,
  `unit` varchar(8) NOT NULL,
  `salesrate` decimal(10,2) NOT NULL,
  `prodtotal` decimal(10,2) NOT NULL,
  `prodttotal` decimal(10,2) NOT NULL,
  `discount` decimal(6,2) NOT NULL,
  `gst` varchar(10) NOT NULL,
  `bgstper` decimal(6,2) NOT NULL,
  `gstamount` decimal(10,2) NOT NULL,
  `added_on` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `salesdetailsmaster_04_2020`
--

INSERT INTO `salesdetailsmaster_04_2020` (`id`, `invoiceid`, `prodid`, `prodid_`, `bprodname`, `istock`, `iinstock`, `unit`, `salesrate`, `prodtotal`, `prodttotal`, `discount`, `gst`, `bgstper`, `gstamount`, `added_on`) VALUES
(1, 'MMM8478', NULL, 102, 'BAJARI A1', 0.00, 1.00, 'KG', 36.00, 0.00, 0.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-04-16 17:48:45'),
(2, 'MMM8478', NULL, 103, 'BAJAR KABUTAR', 1.00, 1.00, 'KG', 32.00, 32.00, 32.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-04-16 17:48:45'),
(3, 'MMM8478', NULL, 272, 'BESAN SAMARAT', 1.00, 1.00, 'KG', 80.00, 80.00, 80.00, 0.00, 'CGSTSGST', 5.00, 4.00, '2020-04-16 17:48:45'),
(4, 'MMM8479', NULL, 146, 'DHANA 100gm', 0.00, 1.00, 'GRM', 30.00, 0.00, 0.00, 0.00, 'CGSTSGST', 5.00, 0.00, '2020-04-16 17:50:13'),
(5, 'MMM8479', NULL, 148, 'DHANA 50gm', 1.00, 1.00, 'GRM', 15.00, 15.00, 15.00, 0.00, 'CGSTSGST', 5.00, 0.75, '2020-04-16 17:50:13'),
(6, 'MMM8479', NULL, 156, 'DHANA POWDER', 1.00, 1.00, 'KG', 160.00, 160.00, 160.00, 0.00, 'CGSTSGST', 5.00, 8.00, '2020-04-16 17:50:13'),
(7, 'MMM8479', NULL, 156, 'DHANA POWDER', 1.00, 1.00, 'KG', 160.00, 160.00, 160.00, 0.00, 'CGSTSGST', 5.00, 8.00, '2020-04-16 17:50:13'),
(8, 'MMM8479', NULL, 159, 'DHANA VM ', 5.00, 1.00, 'KG', 160.00, 800.00, 800.00, 0.00, 'CGSTSGST', 5.00, 40.00, '2020-04-16 17:50:13'),
(9, 'MMM8480', NULL, 545, 'ELACHI GREEN 100GM', 0.00, 1.00, 'PKT', 560.00, 0.00, 0.00, 0.00, 'CGSTSGST', 5.00, 0.00, '2020-04-16 17:51:13'),
(10, 'MMM8480', NULL, 546, 'ELACHI GREEN 50GM', 1.00, 1.00, 'PKT', 280.00, 280.00, 280.00, 0.00, 'CGSTSGST', 5.00, 14.00, '2020-04-16 17:51:13'),
(11, 'MMM8480', NULL, 547, 'ELACHI GREEN 25GM', 1.00, 1.00, 'PKT', 140.00, 140.00, 140.00, 0.00, 'CGSTSGST', 5.00, 7.00, '2020-04-16 17:51:13'),
(12, 'MMM8480', NULL, 635, 'EV PAVBHAJI  100GM', 1.00, 1.00, 'GRM', 60.00, 60.00, 60.00, 0.00, 'CGSTSGST', 5.00, 3.00, '2020-04-16 17:51:13'),
(13, 'MMM8481', NULL, 854, 'FIVESTAR COCO POWDER', 0.00, 1.00, 'PKT', 50.00, 0.00, 0.00, 0.00, 'CGSTSGST', 28.00, 0.00, '2020-04-16 17:52:20'),
(14, 'MMM8481', NULL, 860, 'FIVESTAR CUSTARD 500GM', 1.00, 1.00, 'GRM', 55.00, 55.00, 55.00, 0.00, 'CGSTSGST', 28.00, 15.40, '2020-04-16 17:52:20'),
(15, 'MMM8481', NULL, 866, 'FIVESTAR CUSTARD 100GM', 1.00, 1.00, 'PKT', 20.00, 20.00, 20.00, 0.00, 'CGSTSGST', 28.00, 5.60, '2020-04-16 17:52:20'),
(16, 'MMM8482', NULL, 101, 'ATTA   VARI       ', 0.00, 1.00, 'KG', 120.00, 0.00, 0.00, 0.00, 'CGSTSGST', 5.00, 0.00, '2020-04-17 10:08:30'),
(17, 'MMM8482', NULL, 102, 'BAJARI A1', 1.00, 1.00, 'KG', 36.00, 36.00, 36.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-04-17 10:08:30'),
(18, 'MMM8482', NULL, 31, 'CHANA DALL A1', 1.00, 1.00, 'KG', 80.00, 80.00, 80.00, 0.00, 'CGSTSGST', 0.00, 0.00, '2020-04-17 10:08:30');

-- --------------------------------------------------------

--
-- Table structure for table `salesdetailsmaster_05_2020`
--

CREATE TABLE `salesdetailsmaster_05_2020` (
  `id` int(11) NOT NULL,
  `invoiceid` varchar(50) NOT NULL,
  `prodid` varchar(50) DEFAULT NULL,
  `prodid_` int(11) NOT NULL DEFAULT 0,
  `bprodname` varchar(100) NOT NULL,
  `istock` decimal(10,2) NOT NULL,
  `iinstock` decimal(10,2) NOT NULL,
  `unit` varchar(8) NOT NULL,
  `salesrate` decimal(10,2) NOT NULL,
  `prodtotal` decimal(10,2) NOT NULL,
  `prodttotal` decimal(10,2) NOT NULL,
  `discount` decimal(6,2) NOT NULL,
  `gst` varchar(10) NOT NULL,
  `bgstper` decimal(6,2) NOT NULL,
  `gstamount` decimal(10,2) NOT NULL,
  `added_on` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `salesmaster_2020`
--

CREATE TABLE `salesmaster_2020` (
  `invoiceid` varchar(15) NOT NULL,
  `customerid` int(10) NOT NULL,
  `invoiceby` varchar(50) NOT NULL,
  `shopid` int(2) NOT NULL,
  `paytype` varchar(30) NOT NULL,
  `invoice_date` date NOT NULL,
  `pamount` int(10) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `discount` decimal(10,0) NOT NULL DEFAULT 0,
  `total_payable` decimal(10,0) NOT NULL DEFAULT 0,
  `ramount` int(10) NOT NULL,
  `coupen_no` varchar(30) NOT NULL,
  `coupen_amount` int(11) NOT NULL,
  `taxamount` int(5) NOT NULL,
  `ebill` varchar(15) NOT NULL,
  `terminal_id` int(11) NOT NULL DEFAULT 0,
  `deleted` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `salesmaster_2020`
--

INSERT INTO `salesmaster_2020` (`invoiceid`, `customerid`, `invoiceby`, `shopid`, `paytype`, `invoice_date`, `pamount`, `total_amount`, `discount`, `total_payable`, `ramount`, `coupen_no`, `coupen_amount`, `taxamount`, `ebill`, `terminal_id`, `deleted`) VALUES
('MMM8308', 138, 'admin', 1, 'cash', '2020-03-03', 1882, 1882.00, 0, 0, 0, '', 0, 49, '', 2, 0),
('MMM8309', 139, 'admin', 1, 'cash', '2020-03-03', 592, 592.00, 0, 0, 0, '', 0, 22, '', 2, 0),
('MMM8310', 140, 'admin', 1, 'cash', '2020-03-03', 42, 42.00, 0, 0, 0, '', 0, 2, '', 2, 0),
('MMM8311', 141, 'admin', 1, 'cash', '2020-03-03', 161, 161.00, 0, 0, 0, '', 0, 6, '', 2, 0),
('MMM8312', 142, 'admin', 1, 'cash', '2020-03-03', 297, 297.00, 0, 0, 0, '', 0, 16, '', 2, 0),
('MMM8313', 143, 'admin', 1, 'cash', '2020-03-03', 339, 339.00, 0, 0, 0, '', 0, 39, '', 2, 0),
('MMM8314', 144, 'admin', 1, 'cash', '2020-03-03', 951, 951.00, 0, 0, 0, '', 0, 29, '', 2, 0),
('MMM8315', 145, 'admin', 1, 'cash', '2020-03-03', 851, 851.00, 0, 0, 0, '', 0, 41, '', 2, 0),
('MMM8316', 146, 'admin', 1, 'cash', '2020-03-03', 4638, 4638.00, 0, 0, 0, '', 0, 238, '', 2, 0),
('MMM8317', 146, 'admin', 1, 'cash', '2020-03-03', 830, 830.00, 0, 0, 0, '', 0, 40, '', 2, 0),
('MMM8318', 65, 'admin', 1, 'cash', '2020-03-03', 42, 42.00, 0, 0, 0, '', 0, 2, '', 2, 0),
('MMM8319', 145, 'admin', 1, 'cash', '2020-03-03', 439, 439.00, 0, 0, 0, '', 0, 29, '', 2, 0),
('MMM8320', 147, 'admin', 1, 'cash', '2020-03-03', 1545, 1545.00, 0, 0, 0, '', 0, 45, '', 2, 0),
('MMM8321', 148, 'admin', 1, 'cash', '2020-03-03', 127, 127.00, 0, 0, 0, '', 0, 3, '', 2, 0),
('MMM8322', 149, 'admin', 1, 'cash', '2020-03-03', 340, 340.00, 0, 0, 0, '', 0, 0, '', 2, 0),
('MMM8323', 150, 'admin', 1, 'cash', '2020-03-03', 571, 571.00, 0, 0, 0, '', 0, 25, '', 2, 0),
('MMM8324', 151, 'admin', 1, 'cash', '2020-03-03', 324, 324.00, 0, 0, 0, '', 0, 6, '', 2, 0),
('MMM8325', 151, 'admin', 1, 'cash', '2020-03-03', 64, 64.00, 0, 0, 0, '', 0, 14, '', 2, 0),
('MMM8326', 152, 'admin', 1, 'cash', '2020-03-04', 42, 42.00, 0, 0, 0, '', 0, 2, '', 2, 0),
('MMM8327', 65, 'admin', 1, 'cash', '2020-03-04', 806, 806.00, 0, 0, 0, '', 0, 86, '', 2, 0),
('MMM8328', 153, 'admin', 1, 'cash', '2020-03-04', 508, 508.00, 0, 0, 0, '', 0, 9, '', 2, 0),
('MMM8329', 154, 'admin', 1, 'cash', '2020-03-04', 103, 103.00, 0, 0, 0, '', 0, 4, '', 2, 0),
('MMM8330', 155, 'admin', 1, 'cash', '2020-03-04', 170, 170.00, 0, 0, 0, '', 0, 0, '', 2, 0),
('MMM8331', 156, 'admin', 1, 'cash', '2020-03-04', 150, 150.00, 0, 0, 0, '', 0, 0, '', 2, 0),
('MMM8332', 157, 'admin', 1, 'cash', '2020-03-04', 783, 783.00, 0, 0, 0, '', 0, 37, '', 2, 0),
('MMM8333', 158, 'admin', 1, 'cash', '2020-03-04', 122, 122.00, 0, 0, 0, '', 0, 7, '', 2, 0),
('MMM8334', 159, 'admin', 1, 'cash', '2020-03-04', 864, 864.00, 0, 0, 0, '', 0, 22, '', 2, 0),
('MMM8335', 160, 'admin', 1, 'cash', '2020-03-04', 797, 797.00, 0, 0, 0, '', 0, 67, '', 2, 0),
('MMM8336', 161, 'admin', 1, 'cash', '2020-03-04', 315, 315.00, 0, 0, 0, '', 0, 15, '', 2, 0),
('MMM8337', 162, 'admin', 1, 'cash', '2020-03-04', 280, 280.00, 0, 0, 0, '', 0, 0, '', 2, 0),
('MMM8338', 163, 'admin', 1, 'cash', '2020-03-04', 1300, 1300.00, 0, 0, 0, '', 0, 50, '', 2, 0),
('MMM8339', 164, 'admin', 1, 'cash', '2020-03-04', 2095, 2095.00, 0, 0, 0, '', 0, 45, '', 2, 0),
('MMM8340', 165, 'admin', 1, 'cash', '2020-03-04', 232, 232.00, 0, 0, 0, '', 0, 22, '', 2, 0),
('MMM8341', 166, 'admin', 1, 'cash', '2020-03-04', 8282, 8282.00, 0, 0, 0, '', 0, 472, '', 2, 0),
('MMM8342', 167, 'admin', 1, 'cash', '2020-03-04', 610, 610.00, 0, 0, 0, '', 0, 20, '', 2, 0),
('MMM8343', 168, 'admin', 1, 'cash', '2020-03-04', 672, 672.00, 0, 0, 0, '', 0, 72, '', 2, 0),
('MMM8344', 169, 'admin', 1, 'cash', '2020-03-04', 627, 627.00, 0, 0, 0, '', 0, 67, '', 2, 0),
('MMM8345', 170, 'admin', 1, 'cash', '2020-03-04', 605, 605.00, 0, 0, 0, '', 0, 65, '', 2, 0),
('MMM8346', 171, 'admin', 1, 'cash', '2020-03-04', 512, 512.00, 0, 0, 0, '', 0, 22, '', 2, 0),
('MMM8347', 172, 'admin', 1, 'cash', '2020-03-04', 512, 512.00, 0, 0, 0, '', 0, 22, '', 2, 0),
('MMM8348', 173, 'admin', 1, 'cash', '2020-03-04', 656, 656.00, 0, 0, 0, '', 0, 36, '', 2, 0),
('MMM8349', 174, 'admin', 1, 'cash', '2020-03-04', 42, 42.00, 0, 0, 0, '', 0, 2, '', 2, 0),
('MMM8350', 175, 'admin', 1, 'cash', '2020-03-04', 1254, 1254.00, 0, 0, 0, '', 0, 44, '', 2, 0),
('MMM8351', 176, 'admin', 1, 'cash', '2020-03-04', 318, 318.00, 0, 0, 0, '', 0, 43, '', 2, 0),
('MMM8352', 177, 'admin', 1, 'cash', '2020-03-04', 511, 511.00, 0, 0, 0, '', 0, 11, '', 2, 0),
('MMM8353', 178, 'admin', 1, 'cash', '2020-03-04', 2058, 2058.00, 0, 0, 0, '', 0, 123, '', 2, 0),
('MMM8354', 179, 'admin', 1, 'cash', '2020-03-04', 537, 537.00, 0, 0, 0, '', 0, 35, '', 2, 0),
('MMM8355', 180, 'admin', 1, 'cash', '2020-03-04', 396, 396.00, 0, 0, 0, '', 0, 18, '', 2, 0),
('MMM8356', 181, 'admin', 1, 'cash', '2020-03-04', 145, 145.00, 0, 0, 0, '', 0, 0, '', 2, 0),
('MMM8357', 182, 'admin', 1, 'cash', '2020-03-05', 42, 42.00, 0, 0, 0, '', 0, 2, '', 2, 0),
('MMM8358', 183, 'admin', 1, 'cash', '2020-03-05', 592, 592.00, 0, 0, 0, '', 0, 54, '', 2, 0),
('MMM8359', 184, 'admin', 1, 'cash', '2020-03-05', 148, 148.00, 0, 0, 0, '', 0, 3, '', 2, 0),
('MMM8360', 185, 'admin', 1, 'cash', '2020-03-05', 220, 220.00, 0, 0, 0, '', 0, 0, '', 2, 0),
('MMM8361', 186, 'admin', 1, 'cash', '2020-03-05', 1409, 1409.00, 0, 0, 0, '', 0, 70, '', 2, 0),
('MMM8362', 187, 'admin', 1, 'cash', '2020-03-05', 399, 399.00, 0, 0, 0, '', 0, 19, '', 2, 0),
('MMM8363', 189, 'admin', 1, 'cash', '2020-03-05', 843, 843.00, 0, 0, 0, '', 0, 8, '', 2, 0),
('MMM8364', 190, 'admin', 1, 'cash', '2020-03-05', 42, 42.00, 0, 0, 0, '', 0, 2, '', 2, 0),
('MMM8365', 191, 'admin', 1, 'cash', '2020-03-05', 504, 504.00, 0, 0, 0, '', 0, 24, '', 2, 0),
('MMM8366', 192, 'admin', 1, 'cash', '2020-03-05', 134, 134.00, 0, 0, 0, '', 0, 29, '', 2, 0),
('MMM8367', 193, 'admin', 1, 'cash', '2020-03-05', 426, 426.00, 0, 0, 0, '', 0, 6, '', 2, 0),
('MMM8368', 194, 'admin', 1, 'cash', '2020-03-05', 173, 173.00, 0, 0, 0, '', 0, 13, '', 2, 0),
('MMM8369', 52, 'admin', 1, 'cash', '2020-03-05', 4742, 4742.00, 0, 0, 0, '', 0, 298, '', 2, 0),
('MMM8370', 195, 'admin', 1, 'cash', '2020-03-05', 612, 612.00, 0, 0, 0, '', 0, 22, '', 2, 0),
('MMM8371', 180, 'admin', 1, 'cash', '2020-03-05', 68, 68.00, 0, 0, 0, '', 0, 3, '', 2, 0),
('MMM8372', 196, 'admin', 1, 'cash', '2020-03-05', 437, 437.00, 0, 0, 0, '', 0, 37, '', 2, 0),
('MMM8373', 197, 'admin', 1, 'cash', '2020-03-05', 153, 153.00, 0, 0, 0, '', 0, 23, '', 2, 0),
('MMM8374', 180, 'admin', 1, 'cash', '2020-03-05', 179, 179.00, 0, 0, 0, '', 0, 9, '', 2, 0),
('MMM8375', 198, 'admin', 1, 'cash', '2020-03-05', 455, 455.00, 0, 0, 0, '', 0, 0, '', 2, 0),
('MMM8376', 199, 'admin', 1, 'cash', '2020-03-05', 806, 806.00, 0, 0, 0, '', 0, 86, '', 2, 0),
('MMM8377', 200, 'admin', 1, 'cash', '2020-03-05', 185, 185.00, 0, 0, 0, '', 0, 9, '', 2, 0),
('MMM8378', 201, 'admin', 1, 'cash', '2020-03-05', 394, 394.00, 0, 0, 0, '', 0, 42, '', 2, 0),
('MMM8379', 201, 'admin', 1, 'cash', '2020-03-05', 145, 145.00, 0, 0, 0, '', 0, 0, '', 2, 0),
('MMM8380', 202, 'admin', 1, 'cash', '2020-03-05', 1105, 1105.00, 0, 0, 0, '', 0, 65, '', 2, 0),
('MMM8381', 203, 'admin', 1, 'cash', '2020-03-05', 137, 137.00, 0, 0, 0, '', 0, 13, '', 2, 0),
('MMM8382', 204, 'admin', 1, 'cash', '2020-03-05', 152, 152.00, 0, 0, 0, '', 0, 2, '', 2, 0),
('MMM8383', 205, 'admin', 1, 'cash', '2020-03-05', 122, 122.00, 0, 0, 0, '', 0, 12, '', 2, 0),
('MMM8384', 206, 'admin', 1, 'cash', '2020-03-05', 121, 121.00, 0, 0, 0, '', 0, 6, '', 2, 0),
('MMM8385', 207, 'admin', 1, 'cash', '2020-03-05', 252, 252.00, 0, 0, 0, '', 0, 12, '', 2, 0),
('MMM8386', 208, 'admin', 1, 'cash', '2020-03-05', 1316, 1316.00, 0, 0, 0, '', 0, 116, '', 2, 0),
('MMM8387', 209, 'admin', 1, 'cash', '2020-03-05', 9719, 9719.00, 0, 0, 0, '', 0, 459, '', 2, 0),
('MMM8388', 210, 'admin', 1, 'cash', '2020-03-05', 743, 743.00, 0, 0, 0, '', 0, 63, '', 2, 0),
('MMM8389', 211, 'admin', 1, 'cash', '2020-03-05', 423, 423.00, 0, 0, 0, '', 0, 14, '', 2, 0),
('MMM8390', 212, 'admin', 1, 'cash', '2020-03-05', 20950, 20950.00, 0, 0, 0, '', 0, 225, '', 2, 0),
('MMM8391', 213, 'admin', 1, 'cash', '2020-03-05', 2443, 2443.00, 0, 0, 0, '', 0, 203, '', 2, 0),
('MMM8392', 214, 'admin', 1, 'cash', '2020-03-05', 1108, 1108.00, 0, 0, 0, '', 0, 39, '', 2, 0),
('MMM8393', 215, 'admin', 1, 'cash', '2020-03-05', 210, 210.00, 0, 0, 0, '', 0, 10, '', 2, 0),
('MMM8394', 216, 'admin', 1, 'cash', '2020-03-05', 1073, 1073.00, 0, 0, 0, '', 0, 49, '', 2, 0),
('MMM8395', 217, 'admin', 1, 'cash', '2020-03-05', 546, 546.00, 0, 0, 0, '', 0, 16, '', 2, 0),
('MMM8396', 218, 'admin', 1, 'cash', '2020-03-06', 0, 0.00, 0, 0, 0, '', 0, 0, '', 2, 0),
('MMM8397', 219, 'admin', 1, 'cash', '2020-03-06', 315, 315.00, 0, 0, 0, '', 0, 15, '', 2, 0),
('MMM8398', 52, 'admin', 1, 'cash', '2020-03-06', 1484, 1484.00, 0, 0, 0, '', 0, 119, '', 2, 0),
('MMM8399', 52, 'admin', 1, 'cash', '2020-03-06', 806, 806.00, 0, 0, 0, '', 0, 86, '', 2, 0),
('MMM8400', 220, 'admin', 1, 'cash', '2020-03-06', 94, 94.00, 0, 0, 0, '', 0, 0, '', 2, 0),
('MMM8401', 221, 'admin', 1, 'cash', '2020-03-06', 97, 97.00, 0, 0, 0, '', 0, 5, '', 2, 0),
('MMM8402', 222, 'admin', 1, 'cash', '2020-03-06', 48, 48.00, 0, 0, 0, '', 0, 0, '', 2, 0),
('MMM8403', 223, 'admin', 1, 'cash', '2020-03-06', 5640, 5640.00, 0, 0, 0, '', 0, 55, '', 2, 0),
('MMM8404', 224, 'admin', 1, 'cash', '2020-03-06', 4487, 4487.00, 0, 0, 0, '', 0, 197, '', 2, 0),
('MMM8405', 225, 'admin', 1, 'cash', '2020-03-06', 4730, 4730.00, 0, 0, 0, '', 0, 225, '', 2, 0),
('MMM8406', 226, 'admin', 1, 'cash', '2020-03-06', 1630, 1630.00, 0, 0, 0, '', 0, 150, '', 2, 0),
('MMM8407', 227, 'admin', 1, 'cash', '2020-03-06', 998, 998.00, 0, 0, 0, '', 0, 48, '', 2, 0),
('MMM8408', 228, 'admin', 1, 'cash', '2020-03-06', 230, 230.00, 0, 0, 0, '', 0, 0, '', 2, 0),
('MMM8409', 229, 'admin', 1, 'cash', '2020-03-06', 180, 180.00, 0, 0, 0, '', 0, 0, '', 2, 0),
('MMM8410', 230, 'admin', 1, 'cash', '2020-03-06', 300, 300.00, 0, 0, 0, '', 0, 0, '', 2, 0),
('MMM8411', 231, 'admin', 1, 'cash', '2020-03-06', 1564, 1564.00, 0, 0, 0, '', 0, 108, '', 2, 0),
('MMM8412', 232, 'admin', 1, 'cash', '2020-03-06', 1602, 1602.00, 0, 0, 0, '', 0, 68, '', 2, 0),
('MMM8413', 233, 'admin', 1, 'cash', '2020-03-06', 729, 729.00, 0, 0, 0, '', 0, 22, '', 2, 0),
('MMM8414', 234, 'admin', 1, 'cash', '2020-03-06', 205, 205.00, 0, 0, 0, '', 0, 5, '', 2, 0),
('MMM8415', 235, 'admin', 1, 'cash', '2020-03-06', 524, 524.00, 0, 0, 0, '', 0, 10, '', 2, 0),
('MMM8416', 236, 'admin', 1, 'cash', '2020-03-06', 192, 192.00, 0, 0, 0, '', 0, 2, '', 2, 0),
('MMM8417', 237, 'admin', 1, 'cash', '2020-03-06', 884, 884.00, 0, 0, 0, '', 0, 17, '', 2, 0),
('MMM8418', 238, 'admin', 1, 'cash', '2020-03-06', 417, 417.00, 0, 0, 0, '', 0, 6, '', 2, 0),
('MMM8419', 239, 'admin', 1, 'cash', '2020-03-06', 354, 354.00, 0, 0, 0, '', 0, 24, '', 2, 0),
('MMM8420', 240, 'admin', 1, 'cash', '2020-03-06', 832, 832.00, 0, 0, 0, '', 0, 47, '', 2, 0),
('MMM8421', 241, 'admin', 1, 'cash', '2020-03-06', 409, 409.00, 0, 0, 0, '', 0, 4, '', 2, 0),
('MMM8422', 242, 'admin', 1, 'cash', '2020-03-06', 80, 80.00, 0, 0, 0, '', 0, 0, '', 2, 0),
('MMM8423', 243, 'admin', 1, 'cash', '2020-03-07', 42, 42.00, 0, 0, 0, '', 0, 2, '', 2, 0),
('MMM8424', 244, 'admin', 1, 'cash', '2020-03-07', 744, 744.00, 0, 0, 0, '', 0, 14, '', 2, 0),
('MMM8425', 52, 'admin', 1, 'cash', '2020-03-07', 0, 0.00, 0, 0, 0, '', 0, 0, '', 2, 0),
('MMM8426', 245, 'admin', 1, 'cash', '2020-03-07', 304, 304.00, 0, 0, 0, '', 0, 1, '', 2, 0),
('MMM8427', 246, 'admin', 1, 'cash', '2020-03-07', 800, 800.00, 0, 0, 0, '', 0, 0, '', 2, 0),
('MMM8428', 247, 'admin', 1, 'cash', '2020-03-07', 727, 727.00, 0, 0, 0, '', 0, 32, '', 2, 0),
('MMM8429', 248, 'admin', 1, 'cash', '2020-03-07', 148, 148.00, 0, 0, 0, '', 0, 3, '', 2, 0),
('MMM8430', 249, 'admin', 1, 'cash', '2020-03-07', 165, 165.00, 0, 0, 0, '', 0, 0, '', 2, 0),
('MMM8431', 250, 'admin', 1, 'cash', '2020-03-07', 1283, 1283.00, 0, 0, 0, '', 0, 41, '', 2, 0),
('MMM8432', 251, 'admin', 1, 'cash', '2020-03-07', 427, 427.00, 0, 0, 0, '', 0, 34, '', 2, 0),
('MMM8433', 252, 'admin', 1, 'cash', '2020-03-07', 3701, 3701.00, 0, 0, 0, '', 0, 176, '', 2, 0),
('MMM8434', 253, 'admin', 1, 'cash', '2020-03-07', 618, 618.00, 0, 0, 0, '', 0, 33, '', 2, 0),
('MMM8435', 254, 'admin', 1, 'cash', '2020-03-07', 665, 665.00, 0, 0, 0, '', 0, 40, '', 2, 0),
('MMM8436', 255, 'admin', 1, 'cash', '2020-03-07', 242, 242.00, 0, 0, 0, '', 0, 7, '', 2, 0),
('MMM8437', 256, 'admin', 1, 'cash', '2020-03-07', 1599, 1599.00, 0, 0, 0, '', 0, 52, '', 2, 0),
('MMM8438', 257, 'admin', 1, 'cash', '2020-03-07', 286, 286.00, 0, 0, 0, '', 0, 10, '', 2, 0),
('MMM8439', 258, 'admin', 1, 'cash', '2020-03-07', 381, 381.00, 0, 0, 0, '', 0, 6, '', 2, 0),
('MMM8440', 259, 'admin', 1, 'cash', '2020-03-07', 254, 254.00, 0, 0, 0, '', 0, 24, '', 2, 0),
('MMM8441', 260, 'admin', 1, 'cash', '2020-03-07', 161, 161.00, 0, 0, 0, '', 0, 6, '', 2, 0),
('MMM8442', 261, 'admin', 1, 'cash', '2020-03-07', 508, 508.00, 0, 0, 0, '', 0, 9, '', 2, 0),
('MMM8443', 262, 'admin', 1, 'cash', '2020-03-07', 2704, 2704.00, 0, 0, 0, '', 0, 254, '', 2, 0),
('MMM8444', 263, 'admin', 1, 'cash', '2020-03-07', 1374, 1374.00, 0, 0, 0, '', 0, 44, '', 2, 0),
('MMM8445', 264, 'admin', 1, 'cash', '2020-03-07', 1530, 1530.00, 0, 0, 0, '', 0, 120, '', 2, 0),
('MMM8446', 265, 'admin', 1, 'cash', '2020-03-07', 187, 187.00, 0, 0, 0, '', 0, 0, '', 2, 0),
('MMM8447', 266, 'admin', 1, 'cash', '2020-03-07', 3381, 3381.00, 0, 0, 0, '', 0, 193, '', 2, 0),
('MMM8448', 267, 'admin', 1, 'cash', '2020-03-07', 475, 475.00, 0, 0, 0, '', 0, 15, '', 2, 0),
('MMM8449', 268, 'admin', 1, 'cash', '2020-03-07', 244, 244.00, 0, 0, 0, '', 0, 8, '', 2, 0),
('MMM8450', 269, 'admin', 1, 'cash', '2020-03-07', 1978, 1978.00, 0, 0, 0, '', 0, 68, '', 2, 0),
('MMM8451', 270, 'admin', 1, 'cash', '2020-03-07', 478, 478.00, 0, 0, 0, '', 0, 18, '', 2, 0),
('MMM8452', 271, 'admin', 1, 'cash', '2020-03-07', 2955, 2955.00, 0, 0, 0, '', 0, 245, '', 2, 0),
('MMM8453', 272, 'admin', 1, 'cash', '2020-03-07', 1046, 1046.00, 0, 0, 0, '', 0, 14, '', 2, 0),
('MMM8454', 273, 'admin', 1, 'cash', '2020-03-09', 249, 249.00, 0, 0, 0, '', 0, 4, '', 2, 0),
('MMM8455', 274, 'admin', 1, 'cash', '2020-03-09', 42, 42.00, 0, 0, 0, '', 0, 2, '', 2, 0),
('MMM8456', 275, 'admin', 1, 'cash', '2020-03-11', 0, 0.00, 0, 0, 0, '', 0, 0, '', 2, 0),
('MMM8457', 276, 'admin', 1, 'cash', '2020-03-11', 288, 288.00, 0, 0, 0, '', 0, 18, '', 2, 0),
('MMM8458', 277, 'admin', 1, 'cash', '2020-03-11', 723, 723.00, 0, 0, 0, '', 0, 8, '', 2, 0),
('MMM8459', 278, 'admin', 1, 'cash', '2020-03-11', 234, 234.00, 0, 0, 0, '', 0, 1, '', 2, 0),
('MMM8460', 279, 'admin', 1, 'cash', '2020-03-11', 1077, 1077.00, 0, 0, 0, '', 0, 24, '', 2, 0),
('MMM8461', 280, 'admin', 1, 'cash', '2020-03-11', 384, 384.00, 0, 0, 0, '', 0, 11, '', 2, 0),
('MMM8462', 281, 'admin', 1, 'cash', '2020-03-11', 1866, 1866.00, 0, 0, 0, '', 0, 65, '', 2, 0),
('MMM8463', 282, 'admin', 1, 'cash', '2020-03-11', 21, 21.00, 0, 0, 0, '', 0, 1, '', 2, 0),
('MMM8464', 283, 'admin', 1, 'cash', '2020-03-11', 123, 123.00, 0, 0, 0, '', 0, 13, '', 2, 0),
('MMM8465', 284, 'admin', 1, 'cash', '2020-03-11', 982, 982.00, 0, 0, 0, '', 0, 47, '', 2, 0),
('MMM8466', 285, 'admin', 1, 'cash', '2020-03-11', 429, 429.00, 0, 0, 0, '', 0, 19, '', 2, 0),
('MMM8467', 286, 'admin', 1, 'cash', '2020-03-11', 173, 173.00, 0, 0, 0, '', 0, 8, '', 2, 0),
('MMM8468', 287, 'admin', 1, 'cash', '2020-03-11', 295, 295.00, 0, 0, 0, '', 0, 0, '', 2, 0),
('MMM8469', 288, 'admin', 1, 'cash', '2020-03-11', 2772, 2772.00, 0, 0, 0, '', 0, 32, '', 2, 0),
('MMM8470', 289, 'admin', 1, 'cash', '2020-03-12', 42, 42.00, 0, 0, 0, '', 0, 2, '', 2, 0),
('MMM8471', 290, 'admin', 1, 'cash', '2020-03-12', 861, 861.00, 0, 0, 0, '', 0, 36, '', 2, 0),
('MMM8472', 291, 'admin', 1, 'cash', '2020-03-12', 224, 224.00, 0, 0, 0, '', 0, 11, '', 2, 0),
('MMM8473', 292, 'admin', 1, 'cash', '2020-03-12', 6202, 6202.00, 0, 0, 0, '', 0, 337, '', 1, 0),
('MMM8474', 293, 'admin', 1, 'cash', '2020-03-12', 206, 206.00, 0, 0, 0, '', 0, 6, '', 1, 0),
('MMM8475', 294, 'admin', 1, 'cash', '2020-03-12', 756, 756.00, 0, 0, 0, '', 0, 36, '', 1, 0),
('MMM8476', 295, 'admin', 1, 'cash', '2020-03-12', 220, 220.00, 0, 0, 0, '', 0, 0, '', 1, 0),
('MMM8477', 296, 'admin', 1, 'cash', '2020-03-12', 613, 613.00, 0, 0, 0, '', 0, 31, '', 1, 0),
('MMM8478', 297, 'admin', 1, 'cash', '2020-04-16', 116, 116.00, 0, 0, 0, '', 0, 4, '', 1, 0),
('MMM8479', 297, 'admin', 1, 'e-cash', '2020-04-16', 1192, 1192.00, 0, 0, 0, '', 0, 57, '', 1, 0),
('MMM8480', 297, 'admin', 1, 'credit', '2020-04-16', 504, 504.00, 0, 0, 0, '', 0, 24, '', 1, 0),
('MMM8481', 297, 'admin', 1, 'cash', '2020-04-16', 96, 96.00, 0, 0, 0, '', 0, 21, '', 1, 0),
('MMM8482', 297, 'admin', 1, 'cash', '2020-04-17', 116, 116.00, 0, 0, 0, '', 0, 0, '', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `shopmaster`
--

CREATE TABLE `shopmaster` (
  `shopid` int(11) NOT NULL,
  `shopname` varchar(50) NOT NULL,
  `shopemail` varchar(100) NOT NULL,
  `shopline1` varchar(200) NOT NULL,
  `shopline2` varchar(200) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `shopcity` varchar(50) NOT NULL,
  `shopstate` varchar(50) NOT NULL,
  `shopcountry` varchar(50) NOT NULL,
  `shoppin` int(11) NOT NULL,
  `sgstin` varchar(30) NOT NULL,
  `pan` varchar(15) NOT NULL,
  `capital` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shopmaster`
--

INSERT INTO `shopmaster` (`shopid`, `shopname`, `shopemail`, `shopline1`, `shopline2`, `phone`, `shopcity`, `shopstate`, `shopcountry`, `shoppin`, `sgstin`, `pan`, `capital`) VALUES
(1, 'MARUTI MASALA MART', '', '262/70, Narshi Natha Street, Bhat Bazar', 'Masjid Bunder', '9833628381', 'Mumbai', 'Maharashtra', 'India', 400009, '27ADZPD0764G1ZA', '000', 0),
(2, 'SAGAR', 'sahelicollectionbunty@gamil.com', '', '', '', '', '', 'India', 0, '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `stocktype`
--

CREATE TABLE `stocktype` (
  `id` int(11) NOT NULL,
  `unit` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stocktype`
--

INSERT INTO `stocktype` (`id`, `unit`) VALUES
(1, 'PKT'),
(2, 'GRM'),
(3, 'KG'),
(4, 'PCS'),
(5, 'LTR'),
(6, 'BOX');

-- --------------------------------------------------------

--
-- Table structure for table `sundry_2020`
--

CREATE TABLE `sundry_2020` (
  `id` int(11) NOT NULL,
  `shopid` int(10) NOT NULL,
  `prodid` varchar(10) DEFAULT NULL,
  `prodid_` int(11) NOT NULL,
  `hsn` int(10) NOT NULL,
  `prodname` varchar(100) NOT NULL,
  `stock` decimal(10,2) NOT NULL,
  `stocktype` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `total` int(10) NOT NULL,
  `sdate` date NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `transactionmaster_2020`
--

CREATE TABLE `transactionmaster_2020` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `bankid` varchar(30) NOT NULL,
  `byname` varchar(60) NOT NULL,
  `transtype` varchar(50) NOT NULL,
  `transdetails` varchar(80) NOT NULL,
  `amount` int(10) NOT NULL,
  `amtype` varchar(15) NOT NULL,
  `balance` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userid`
--

CREATE TABLE `userid` (
  `uid` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userid`
--

INSERT INTO `userid` (`uid`) VALUES
(1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addressmaster`
--
ALTER TABLE `addressmaster`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `advancmaster_2020`
--
ALTER TABLE `advancmaster_2020`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `balancemaster`
--
ALTER TABLE `balancemaster`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bankmaster`
--
ALTER TABLE `bankmaster`
  ADD PRIMARY KEY (`bankid`);

--
-- Indexes for table `barcode`
--
ALTER TABLE `barcode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barcodemaster`
--
ALTER TABLE `barcodemaster`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupenmaster`
--
ALTER TABLE `coupenmaster`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `creditdetailsmaster_2020`
--
ALTER TABLE `creditdetailsmaster_2020`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prodid` (`prodid`);

--
-- Indexes for table `creditid1`
--
ALTER TABLE `creditid1`
  ADD PRIMARY KEY (`iid`);

--
-- Indexes for table `creditid2`
--
ALTER TABLE `creditid2`
  ADD PRIMARY KEY (`iid`);

--
-- Indexes for table `creditmaster_2020`
--
ALTER TABLE `creditmaster_2020`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `creditsalesmaster_2020`
--
ALTER TABLE `creditsalesmaster_2020`
  ADD PRIMARY KEY (`creditid`);

--
-- Indexes for table `customermaster`
--
ALTER TABLE `customermaster`
  ADD PRIMARY KEY (`customerid`);

--
-- Indexes for table `debitid1`
--
ALTER TABLE `debitid1`
  ADD PRIMARY KEY (`iid`);

--
-- Indexes for table `debitid2`
--
ALTER TABLE `debitid2`
  ADD PRIMARY KEY (`iid`);

--
-- Indexes for table `debitnotedetailsmaster_2020`
--
ALTER TABLE `debitnotedetailsmaster_2020`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `debitnotemaster_2020`
--
ALTER TABLE `debitnotemaster_2020`
  ADD PRIMARY KEY (`dinvoiceid`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employeemaster`
--
ALTER TABLE `employeemaster`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `user_id` (`userid`);

--
-- Indexes for table `expancemaster`
--
ALTER TABLE `expancemaster`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exptypemaster`
--
ALTER TABLE `exptypemaster`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gstper`
--
ALTER TABLE `gstper`
  ADD PRIMARY KEY (`gst`);

--
-- Indexes for table `gstsetting`
--
ALTER TABLE `gstsetting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoiceid1`
--
ALTER TABLE `invoiceid1`
  ADD PRIMARY KEY (`iid`);

--
-- Indexes for table `invoiceid2`
--
ALTER TABLE `invoiceid2`
  ADD PRIMARY KEY (`iid`);

--
-- Indexes for table `loginmaster`
--
ALTER TABLE `loginmaster`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `user_id` (`username`);

--
-- Indexes for table `prodid1`
--
ALTER TABLE `prodid1`
  ADD PRIMARY KEY (`prodId`);

--
-- Indexes for table `prodid2`
--
ALTER TABLE `prodid2`
  ADD PRIMARY KEY (`prodId`);

--
-- Indexes for table `productmaster`
--
ALTER TABLE `productmaster`
  ADD PRIMARY KEY (`prodid_`);

--
-- Indexes for table `purchasedetails_01_2020`
--
ALTER TABLE `purchasedetails_01_2020`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchasedetails_02_2020`
--
ALTER TABLE `purchasedetails_02_2020`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchasedetails_03_2020`
--
ALTER TABLE `purchasedetails_03_2020`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchasedetails_04_2020`
--
ALTER TABLE `purchasedetails_04_2020`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchasedetails_05_2020`
--
ALTER TABLE `purchasedetails_05_2020`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchaseid1`
--
ALTER TABLE `purchaseid1`
  ADD PRIMARY KEY (`iid`);

--
-- Indexes for table `purchaseid2`
--
ALTER TABLE `purchaseid2`
  ADD PRIMARY KEY (`iid`);

--
-- Indexes for table `purchasemaster_2020`
--
ALTER TABLE `purchasemaster_2020`
  ADD PRIMARY KEY (`pinvoiceid`);

--
-- Indexes for table `refunddetailsmaster_2020`
--
ALTER TABLE `refunddetailsmaster_2020`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refundmaster_2020`
--
ALTER TABLE `refundmaster_2020`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salarymaster`
--
ALTER TABLE `salarymaster`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salesdetailsmaster_01_2020`
--
ALTER TABLE `salesdetailsmaster_01_2020`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prodid` (`prodid`);

--
-- Indexes for table `salesdetailsmaster_02_2020`
--
ALTER TABLE `salesdetailsmaster_02_2020`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prodid` (`prodid`);

--
-- Indexes for table `salesdetailsmaster_03_2020`
--
ALTER TABLE `salesdetailsmaster_03_2020`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prodid` (`prodid`);

--
-- Indexes for table `salesdetailsmaster_04_2020`
--
ALTER TABLE `salesdetailsmaster_04_2020`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prodid` (`prodid`);

--
-- Indexes for table `salesdetailsmaster_05_2020`
--
ALTER TABLE `salesdetailsmaster_05_2020`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prodid` (`prodid`);

--
-- Indexes for table `salesmaster_2020`
--
ALTER TABLE `salesmaster_2020`
  ADD PRIMARY KEY (`invoiceid`);

--
-- Indexes for table `shopmaster`
--
ALTER TABLE `shopmaster`
  ADD PRIMARY KEY (`shopid`);

--
-- Indexes for table `stocktype`
--
ALTER TABLE `stocktype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sundry_2020`
--
ALTER TABLE `sundry_2020`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactionmaster_2020`
--
ALTER TABLE `transactionmaster_2020`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userid`
--
ALTER TABLE `userid`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addressmaster`
--
ALTER TABLE `addressmaster`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `advancmaster_2020`
--
ALTER TABLE `advancmaster_2020`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `balancemaster`
--
ALTER TABLE `balancemaster`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bankmaster`
--
ALTER TABLE `bankmaster`
  MODIFY `bankid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupenmaster`
--
ALTER TABLE `coupenmaster`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `creditdetailsmaster_2020`
--
ALTER TABLE `creditdetailsmaster_2020`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `creditmaster_2020`
--
ALTER TABLE `creditmaster_2020`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customermaster`
--
ALTER TABLE `customermaster`
  MODIFY `customerid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=298;

--
-- AUTO_INCREMENT for table `debitnotedetailsmaster_2020`
--
ALTER TABLE `debitnotedetailsmaster_2020`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employeemaster`
--
ALTER TABLE `employeemaster`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expancemaster`
--
ALTER TABLE `expancemaster`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exptypemaster`
--
ALTER TABLE `exptypemaster`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `gstsetting`
--
ALTER TABLE `gstsetting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `productmaster`
--
ALTER TABLE `productmaster`
  MODIFY `prodid_` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1285;

--
-- AUTO_INCREMENT for table `purchasedetails_01_2020`
--
ALTER TABLE `purchasedetails_01_2020`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchasedetails_02_2020`
--
ALTER TABLE `purchasedetails_02_2020`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchasedetails_03_2020`
--
ALTER TABLE `purchasedetails_03_2020`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchasedetails_04_2020`
--
ALTER TABLE `purchasedetails_04_2020`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchasedetails_05_2020`
--
ALTER TABLE `purchasedetails_05_2020`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refunddetailsmaster_2020`
--
ALTER TABLE `refunddetailsmaster_2020`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refundmaster_2020`
--
ALTER TABLE `refundmaster_2020`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salarymaster`
--
ALTER TABLE `salarymaster`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salesdetailsmaster_01_2020`
--
ALTER TABLE `salesdetailsmaster_01_2020`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salesdetailsmaster_02_2020`
--
ALTER TABLE `salesdetailsmaster_02_2020`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salesdetailsmaster_03_2020`
--
ALTER TABLE `salesdetailsmaster_03_2020`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=997;

--
-- AUTO_INCREMENT for table `salesdetailsmaster_04_2020`
--
ALTER TABLE `salesdetailsmaster_04_2020`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `salesdetailsmaster_05_2020`
--
ALTER TABLE `salesdetailsmaster_05_2020`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shopmaster`
--
ALTER TABLE `shopmaster`
  MODIFY `shopid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stocktype`
--
ALTER TABLE `stocktype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sundry_2020`
--
ALTER TABLE `sundry_2020`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactionmaster_2020`
--
ALTER TABLE `transactionmaster_2020`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
