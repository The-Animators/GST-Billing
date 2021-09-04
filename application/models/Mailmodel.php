<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Mailmodel extends CI_Model {

    private $sendemail = "info@abc.com";
    private $sendpassword = 'shem$6#M';

    function sendMail($message, $tomail, $subject) {
        $this->load->library('email'); //, $config);
        $this->email->from($this->sendemail); // change it to yours
        $this->email->to($tomail); // change it to yours
        $this->email->subject($subject);
        $this->email->message($message);
        if ($this->email->send()) {
            return 1;
        } else {
            return 0;
        }
    }

    function ins() {
        $this->load->library('encryption');
        array(
            'cipher' => 'aes-256',
            'mode' => 'ctr',
            'key' => PSP_KEY_STRICT
        );
    }

    function dpce($PAS) {
        $this->ins();
        return $this->encryption->encrypt('6C-F0-49-F3-38-45|2018-09-05');
    }

    /* function GetMAC() {
      ob_start();
      system('getmac');
      $Content = ob_get_contents();
      ob_clean();
      return substr($Content, strpos($Content, '\\') - 20, 17);
      } */

    function dpcd($data, $sec) {
        if (count($data) > 0) {
            $this->ins();
            $res = $this->encryption->decrypt($data['mixup']);
            $var = explode("|", $res);
            if ($data['role'] != 1) {

                if ($sec == $var[0] /*&& strtotime(date("Y-m-d")) <= strtotime(date("Y-m-d", strtotime($var[1])))*/) {
                    return 1;
                } else {
                    if ($sec == $var[0]) {
                        return 3;
                    } else {
                        return 4;
                    }
                }
            } else {
                if (strtotime(date("Y-m-d")) <= strtotime(date("Y-m-d", strtotime($var[1])))) {
                    return 1;
                } else {
                    return 3;
                }
            }
        } else {
            return 2;
        }
    }

    function nshop($shop) {
        $date = date("Y-m-d");
        $sql_string = "
                CREATE TABLE IF NOT EXISTS `creditid".$shop."` (
                    `iid` int(11) NOT NULL,
                    `date` date NOT NULL,
                    PRIMARY KEY (`iid`)
                ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
                INSERT INTO `creditid".$shop."` (`iid`, `date`) VALUES (1, '".$date."');
                CREATE TABLE IF NOT EXISTS `debitid".$shop."` (
                    `iid` int(11) NOT NULL,
                    `date` date NOT NULL,
                    PRIMARY KEY (`iid`)
                ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
                INSERT INTO `debitid".$shop."` (`iid`, `date`) VALUES (1, '".$date."');
                CREATE TABLE IF NOT EXISTS `invoiceid".$shop."` (
                    `iid` int(11) NOT NULL,
                    `date` date NOT NULL,
                    PRIMARY KEY (`iid`)
                ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
                INSERT INTO `invoiceid".$shop."` (`iid`, `date`) VALUES (1, '".$date."');
                CREATE TABLE IF NOT EXISTS `prodid".$shop."` (
                    `prodId` varchar(13) NOT NULL,
                    PRIMARY KEY (`prodId`)
                ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
                INSERT INTO `prodid".$shop."` (`prodId`) VALUES ('1000001');
                CREATE TABLE IF NOT EXISTS `purchaseid".$shop."` (
                    `iid` int(11) NOT NULL,
                    `date` date NOT NULL,
                    PRIMARY KEY (`iid`)
                ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
                INSERT INTO `purchaseid".$shop."` (`iid`, `date`) VALUES (1, '".$date."');";
        return $sql_string;
    }
    function udab() {
        $datey = date("Y");
        $datem = date("m_Y");
        $data = "CREATE TABLE IF NOT EXISTS `salesmaster_" . $datey . "` (
                    `invoiceid` varchar(15) NOT NULL,
                    `customerid` int(10) NOT NULL,
                    `invoiceby` varchar(50) NOT NULL,
                    `shopid` int(2) NOT NULL,
                    `paytype` varchar(30) NOT NULL,
                    `invoice_date` date NOT NULL,
                    `pamount` int(10) NOT NULL,
                    `total_amount` decimal(10,2) NOT NULL,
                    `discount` decimal(10,0) NOT NULL DEFAULT '0',
                    `total_payable` decimal(10,0) NOT NULL DEFAULT '0',
                    `ramount` int(10) NOT NULL,
                    `coupen_no` varchar(30) NOT NULL,
                    `coupen_amount` int(11) NOT NULL,
                    `taxamount` int(5) NOT NULL,
                    `ebill` varchar(15) NOT NULL,
                    `terminal_id` int(11) NOT NULL DEFAULT '0',
                    PRIMARY KEY (`invoiceid`)
                ) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
                CREATE TABLE IF NOT EXISTS `transactionmaster_" . $datey . "` (
                    `id` int(11) NOT NULL AUTO_INCREMENT,
                    `date` date NOT NULL,
                    `bankid` varchar(30) NOT NULL,
                    `byname` varchar(60) NOT NULL,
                    `transtype` varchar(50) NOT NULL,
                    `transdetails` varchar(80) NOT NULL,
                    `amount` int(10) NOT NULL,
                    `amtype` varchar(15) NOT NULL,
                    `balance` int(10) NOT NULL,
                    PRIMARY KEY (`id`)
                ) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
                CREATE TABLE IF NOT EXISTS `purchasedetails_" . $datem . "` (
                    `id` int(11) NOT NULL AUTO_INCREMENT,
                    `pinvoiceid` varchar(15) NOT NULL,
                    `prodid` varchar(10) DEFAULT NULL,
                    `prodid_` int(11) DEFAULT NULL,
                    `pprodname` varchar(100) NOT NULL,
                    `unit` varchar(10) NOT NULL,
                    `price` decimal(10,2) NOT NULL,
                    `taxable` decimal(10,0) NOT NULL DEFAULT '0',
                    `total` decimal(10,2) NOT NULL,
                    `discount` decimal(6,2) NOT NULL,
                    `gst` varchar(10) NOT NULL,
                    `pgstper` decimal(6,2) NOT NULL,
                    `gstamount` decimal(10,2) NOT NULL,
                    `added_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
                    PRIMARY KEY (`id`)
                ) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;
                CREATE TABLE IF NOT EXISTS `purchasemaster_" . $datey . "` (
                    `pinvoiceid` varchar(15) NOT NULL,
                    `shopid` int(5) NOT NULL,
                    `receipt` varchar(30) NOT NULL,
                    `customerid` int(10) NOT NULL,
                    `amttotal` decimal(10,2) NOT NULL,
                    `taxtotal` decimal(10,2) NOT NULL,
                    `pdate` date NOT NULL,
                    PRIMARY KEY (`pinvoiceid`)
                ) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;
                CREATE TABLE IF NOT EXISTS `creditmaster_" . $datey . "` (
                    `id` int(11) NOT NULL AUTO_INCREMENT,
                    `invoiceid` varchar(15) NOT NULL,
                    `customerid` int(10) NOT NULL,
                    `type` varchar(10) NOT NULL,
                    `amount` int(10) NOT NULL,
                    `date` date NOT NULL,
                    PRIMARY KEY (`id`)
                ) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
                CREATE TABLE IF NOT EXISTS `salesdetailsmaster_" . $datem . "` (
                    `id` int(11) NOT NULL AUTO_INCREMENT,
                    `invoiceid` varchar(50) NOT NULL,
                    `prodid` varchar(50) DEFAULT NULL,
                    `prodid_` int(11) NOT NULL DEFAULT '0',
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
                    `added_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
                    PRIMARY KEY (`id`),
                    KEY `prodid` (`prodid`)
                ) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
                CREATE TABLE IF NOT EXISTS `creditsalesmaster_" . $datey . "` (
                    `creditid` VARCHAR(15) NOT NULL,
                    `invoiceid` VARCHAR(15) NOT NULL ,
                    `customerid` int(10) NOT NULL,
                    `invoiceby` varchar(50) NOT NULL,
                    `shopid` int(2) NOT NULL,
                    `paytype` varchar(30) NOT NULL,
                    `creditdate` date NOT NULL,
                    `invoicedate` DATE NOT NULL ,
                    `totalamount` decimal(10,2) NOT NULL,
                    `description` TEXT NOT NULL,
                    `taxamount` INT(5) NOT NULL,
                    PRIMARY KEY (`creditid`)
                ) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
                CREATE TABLE IF NOT EXISTS `creditmaster_" . $datey . "` (
                    `id` int(11) NOT NULL AUTO_INCREMENT,
                    `invoiceid` VARCHAR(15) NOT NULL,
                    `customerid` int(10) NOT NULL,
                    `type` varchar(10) NOT NULL,
                    `amount` int(10) NOT NULL,
                    `date` date NOT NULL,
                    PRIMARY KEY (`id`)
                ) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
                CREATE TABLE IF NOT EXISTS `advancmaster_" . $datey . "` (
                    `id` int(11) NOT NULL AUTO_INCREMENT,
                    `shopid` INT(5) NOT NULL,
                    `custid` int(10) NOT NULL,
                    `cardno` varchar(20) NOT NULL,
                    `debit` int(8) NOT NULL,
                    `credit` int(8) NOT NULL,
                    `date` date NOT NULL,
                    PRIMARY KEY (`id`)
                ) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
                CREATE TABLE IF NOT EXISTS `creditdetailsmaster_" . $datey . "` (
                    `id` int(11) NOT NULL AUTO_INCREMENT,
                    `creditid` varchar(50) NOT NULL,
                    `prodid` varchar(50) DEFAULT NULL,
                    `cprodname` varchar(100) NOT NULL,
                    `cstock` decimal(10,2) NOT NULL,
                    `cinstock` decimal(10,2) NOT NULL,
                    `unit` VARCHAR(8) NOT NULL,
                    `salesrate` int(11) NOT NULL,
                    `prodtotal` decimal(10,2) NOT NULL,
                    `prodttotal` decimal(10,2) NOT NULL,
                    `discount` DECIMAL(6,2) NOT NULL,
                    `gst` varchar(10) NOT NULL,
                    `cgstper` DECIMAL(10,2) NOT NULL,
                    `gstamount` decimal(10,2) NOT NULL,
                    PRIMARY KEY (`id`),
                    KEY `prodid` (`prodid`)
                ) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
                CREATE TABLE IF NOT EXISTS `debitnotedetailsmaster_" . $datey. "` (
                    `id` int(11) NOT NULL AUTO_INCREMENT,
                    `dinvoiceid` varchar(15) NOT NULL,
                    `prodid` varchar(10) DEFAULT NULL,
                    `prodid_` int(11) NOT NULL DEFAULT '0',
                    `dprodname` varchar(50) NOT NULL,
                    `stock` decimal(10,2) NOT NULL DEFAULT '0.00',
                    `instock` decimal(10,2) NOT NULL DEFAULT '0.00',
                    `wstock` int(11) NOT NULL DEFAULT '0',
                    `dstock` int(11) NOT NULL DEFAULT '0',
                    `unit` varchar(10) NOT NULL,
                    `price` decimal(10,2) NOT NULL,
                    `total` decimal(10,2) NOT NULL,
                    `discount` decimal(6,2) NOT NULL,
                    `gst` varchar(10) NOT NULL,
                    `dgstper` decimal(6,2) NOT NULL,
                    `gstamount` decimal(10,2) NOT NULL,
                    PRIMARY KEY (`id`)
                ) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
                CREATE TABLE IF NOT EXISTS `debitnotemaster_" . $datey. "` (
                    `dinvoiceid` varchar(15) NOT NULL,
                    `pinvoiceid` varchar(15) NOT NULL,
                    `shopid` int(5) NOT NULL,
                    `receipt` varchar(30) NOT NULL,
                    `customerid` int(10) NOT NULL,
                    `amttotal` decimal(10,2) NOT NULL,
                    `taxtotal` decimal(10,2) NOT NULL,
                    `pdate` date NOT NULL,
                    PRIMARY KEY (`dinvoiceid`)
                ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
                CREATE TABLE IF NOT EXISTS `sundry_" . $datey. "` (
                    `id` int(11) NOT NULL AUTO_INCREMENT,
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
                    `description` text NOT NULL,
                    PRIMARY KEY (`id`)
                ) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;
                CREATE TABLE IF NOT EXISTS `refundmaster_" . $datey . "` (
                  `id` int(11) NOT NULL AUTO_INCREMENT,
                  `refund_id` varchar(100) NOT NULL,
                  `shop_id` int(11) NOT NULL,
                  `refund_by` varchar(25) NOT NULL,
                  `refund_total` decimal(10,0) NOT NULL,
                  `refund_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
                  PRIMARY KEY (`id`)
                ) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;
                CREATE TABLE IF NOT EXISTS `refunddetailsmaster_" . $datey . "` (
                  `id` int(11) NOT NULL AUTO_INCREMENT,
                  `refund_id` varchar(100) NOT NULL,
                  `prodid_` int(11) NOT NULL,
                  `prodname` varchar(200) DEFAULT NULL,
                  `unit` varchar(30) DEFAULT NULL,
                  `qty` int(11) NOT NULL,
                  `rate` decimal(10,0) NOT NULL,
                  `total` decimal(10,0) NOT NULL,
                  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
                  PRIMARY KEY (`id`)
                ) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;";
        return $data;
    }
}
?>