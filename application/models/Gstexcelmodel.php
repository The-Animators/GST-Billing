<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Gstexcelmodel extends CI_Model {

    public function __construct() {
        parent::__construct();
       
    }
      public function Purchaselist($date,$forw) {         
        $from = date("Y-m-01", strtotime($date));
        $to = date("Y-m-", strtotime($date)).cal_days_in_month(CAL_GREGORIAN,date('m',  strtotime($date),date('Y',  strtotime($date))));
        return  $this->db->from('purchasemaster_' . date('Y', strtotime($from)) . ' S')
                ->join('customermaster C', 'C.customerid = S.customerid', 'join')
                ->join('purchasedetails_' . date('m_Y', strtotime($from)) . ' M', 'M.pinvoiceid = S.pinvoiceid', 'join')
                ->where("pdate BETWEEN '" . $from . "' and '" . $to . "'")
                ->order_by('S.customerid')
                ->where($forw)
                ->where('shopid', $this->session->userdata("shopid"))
                ->get()->result();
    }
    public function Salesbtblist($date,$forw) {         
        $from = date("Y-m-01", strtotime($date));
        $to = date("Y-m-", strtotime($date)).cal_days_in_month(CAL_GREGORIAN,date('m',  strtotime($date),date('Y',  strtotime($date))));
        return  $this->db->from('salesmaster_' . date('Y', strtotime($from)) . ' S')
                ->join('customermaster C', 'C.customerid = S.customerid', 'join')
                ->join('salesdetailsmaster_' . date('m_Y', strtotime($from)) . ' M', 'M.invoiceid = S.invoiceid', 'join')
                ->where("invoice_date BETWEEN '" . $from . "' and '" . $to . "'")
                ->order_by('S.customerid')
                ->where($forw)
                ->where('shopid', $this->session->userdata("shopid"))
                ->get()->result();
    }
    public function Salesbtcslist($date,$forw) {         
        $from = date("Y-m-01", strtotime($date));
        $to = date("Y-m-d", strtotime($date));
        return  $this->db->select('scode,sum(prodttotal+gstamount) as total,bgstper')
                ->from('salesmaster_' . date('Y', strtotime($from)) . ' S')
                ->join('customermaster C', 'C.customerid = S.customerid', 'join')
                ->join('salesdetailsmaster_' . date('m_Y', strtotime($from)) . ' M', 'M.invoiceid = S.invoiceid', 'join')
                ->where("invoice_date BETWEEN '" . $from . "' and '" . $to . "'")
                ->order_by('bgstper')
                ->where($forw)
                ->where('shopid', $this->session->userdata("shopid"))
                ->get()->result();
    }
}
