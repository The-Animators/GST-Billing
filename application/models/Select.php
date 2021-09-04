<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Select extends CI_Model {

    public function __construct() {
        parent::__construct();
        $this->load->model('productmodel');
    }

    public function dashboard() {
        $data = array();
        $result = $this->db->select('sum(amttotal+taxtotal) as purchase')
                        ->from('purchasemaster_' . date('Y'))
                        ->where('shopid', $this->session->userdata("shopid"))
                        ->where("pdate BETWEEN '" . date('Y-m-01') . "' and '" . date('Y-m-d') . "'")
                        ->get()->result();
        $data['purchase'] = $result[0]->purchase;
        $result = $this->db->select('sum(total_amount+taxamount) as sales')
                        ->from('salesmaster_' . date('Y'))
                        ->where('shopid', $this->session->userdata("shopid"))
                        ->where("invoice_date BETWEEN '" . date('Y-m-01') . "' and '" . date('Y-m-d') . "'")
                        ->get()->result();
        $data['sales'] = $result[0]->sales;
        $result = $this->db->select('sum(total) as sundry')
                        ->from('sundry_' . date('Y'))
                        ->where('shopid', $this->session->userdata("shopid"))
                        ->like('sdate', date('Y-m'))
                        ->get()->result();
        $data['sundry'] = $result[0]->sundry;
        // Sales 
        $row = $this->db->select('sum(total_amount+taxamount) as sales')->where('shopid', $this->session->userdata("shopid"))->where("invoice_date BETWEEN '" . date('Y-01-01') . "' and '" . date('Y-01-31') . "'")->get('salesmaster_' . date('Y'))->result();
        $year = round($row[0]->sales);
        if (date('n') > 1) {
            $row = $this->db->select('sum(total_amount+taxamount) as sales')->where('shopid', $this->session->userdata("shopid"))->where("invoice_date BETWEEN '" . date('Y-02-01') . "' and '" . date('Y-02-28') . "'")->get('salesmaster_' . date('Y'))->result();
            $year.=', ' . round($row[0]->sales);
        }
        if (date('n') > 2) {
            $row = $this->db->select('sum(total_amount+taxamount) as sales')->where('shopid', $this->session->userdata("shopid"))->where("invoice_date BETWEEN '" . date('Y-03-01') . "' and '" . date('Y-03-31') . "'")->get('salesmaster_' . date('Y'))->result();
            $year.=', ' . round($row[0]->sales);
        }
        if (date('n') > 3) {
            $row = $this->db->select('sum(total_amount+taxamount) as sales')->where('shopid', $this->session->userdata("shopid"))->where("invoice_date BETWEEN '" . date('Y-04-01') . "' and '" . date('Y-04-30') . "'")->get('salesmaster_' . date('Y'))->result();
            $year.=', ' . round($row[0]->sales);
        }
        if (date('n') > 4) {
            $row = $this->db->select('sum(total_amount+taxamount) as sales')->where('shopid', $this->session->userdata("shopid"))->where("invoice_date BETWEEN '" . date('Y-05-01') . "' and '" . date('Y-05-31') . "'")->get('salesmaster_' . date('Y'))->result();
            $year.=', ' . round($row[0]->sales);
        }
        if (date('n') > 5) {
            $row = $this->db->select('sum(total_amount+taxamount) as sales')->where('shopid', $this->session->userdata("shopid"))->where("invoice_date BETWEEN '" . date('Y-06-01') . "' and '" . date('Y-06-30') . "'")->get('salesmaster_' . date('Y'))->result();
            $year.=', ' . round($row[0]->sales);
        }
        if (date('n') > 6) {
            $row = $this->db->select('sum(total_amount+taxamount) as sales')->where('shopid', $this->session->userdata("shopid"))->where("invoice_date BETWEEN '" . date('Y-07-01') . "' and '" . date('Y-07-30') . "'")->get('salesmaster_' . date('Y'))->result();
            $year.=', ' . round($row[0]->sales);
        }
        if (date('n') > 7) {
            $row = $this->db->select('sum(total_amount+taxamount) as sales')->where('shopid', $this->session->userdata("shopid"))->where("invoice_date BETWEEN '" . date('Y-08-01') . "' and '" . date('Y-08-31') . "'")->get('salesmaster_' . date('Y'))->result();
            $year.=', ' . round($row[0]->sales);
        }
        if (date('n') > 8) {
            $row = $this->db->select('sum(total_amount+taxamount) as sales')->where('shopid', $this->session->userdata("shopid"))->where("invoice_date BETWEEN '" . date('Y-09-01') . "' and '" . date('Y-09-30') . "'")->get('salesmaster_' . date('Y'))->result();
            $year.=', ' . round($row[0]->sales);
        }
        if (date('n') > 9) {
            $row = $this->db->select('sum(total_amount+taxamount) as sales')->where('shopid', $this->session->userdata("shopid"))->where("invoice_date BETWEEN '" . date('Y-10-01') . "' and '" . date('Y-10-31') . "'")->get('salesmaster_' . date('Y'))->result();
            $year.=', ' . round($row[0]->sales);
        }
        if (date('n') > 10) {
            $row = $this->db->select('sum(total_amount+taxamount) as sales')->where('shopid', $this->session->userdata("shopid"))->where("invoice_date BETWEEN '" . date('Y-11-01') . "' and '" . date('Y-11-30') . "'")->get('salesmaster_' . date('Y'))->result();
            $year.=', ' . round($row[0]->sales);
        }
        if (date('n') > 11) {
            $row = $this->db->select('sum(total_amount+taxamount) as sales')->where('shopid', $this->session->userdata("shopid"))->where("invoice_date BETWEEN '" . date('Y-12-01') . "' and '" . date('Y-12-30') . "'")->get('salesmaster_' . date('Y'))->result();
            $year.=', ' . round($row[0]->sales);
        }
        $data['year'] = $year;

        // purchase 
        $row = $this->db->select('sum(amttotal+taxtotal) as purchase')->where('shopid', $this->session->userdata("shopid"))->where("pdate BETWEEN '" . date('Y-01-01') . "' and '" . date('Y-01-31') . "'")->get('purchasemaster_' . date('Y'))->result();
        $puryear = round($row[0]->purchase);
        if (date('n') > 1) {
            $row = $this->db->select('sum(amttotal+taxtotal) as purchase')->where('shopid', $this->session->userdata("shopid"))->where("pdate BETWEEN '" . date('Y-02-01') . "' and '" . date('Y-02-28') . "'")->get('purchasemaster_' . date('Y'))->result();
            $puryear.=', ' . round($row[0]->purchase);
        }
        if (date('n') > 2) {
            $row = $this->db->select('sum(amttotal+taxtotal) as purchase')->where('shopid', $this->session->userdata("shopid"))->where("pdate BETWEEN '" . date('Y-03-01') . "' and '" . date('Y-03-31') . "'")->get('purchasemaster_' . date('Y'))->result();
            $puryear.=', ' . round($row[0]->purchase);
        }
        if (date('n') > 3) {
            $row = $this->db->select('sum(amttotal+taxtotal) as purchase')->where('shopid', $this->session->userdata("shopid"))->where("pdate BETWEEN '" . date('Y-04-01') . "' and '" . date('Y-04-30') . "'")->get('purchasemaster_' . date('Y'))->result();
            $puryear.=', ' . round($row[0]->purchase);
        }
        if (date('n') > 4) {
            $row = $this->db->select('sum(amttotal+taxtotal) as purchase')->where('shopid', $this->session->userdata("shopid"))->where("pdate BETWEEN '" . date('Y-05-01') . "' and '" . date('Y-05-31') . "'")->get('purchasemaster_' . date('Y'))->result();
            $puryear.=', ' . round($row[0]->purchase);
        }
        if (date('n') > 5) {
            $row = $this->db->select('sum(amttotal+taxtotal) as purchase')->where('shopid', $this->session->userdata("shopid"))->where("pdate BETWEEN '" . date('Y-06-01') . "' and '" . date('Y-06-30') . "'")->get('purchasemaster_' . date('Y'))->result();
            $puryear.=', ' . round($row[0]->purchase, 0);
        }
        if (date('n') > 6) {
            $row = $this->db->select('sum(amttotal+taxtotal) as purchase')->where('shopid', $this->session->userdata("shopid"))->where("pdate BETWEEN '" . date('Y-07-01') . "' and '" . date('Y-07-30') . "'")->get('purchasemaster_' . date('Y'))->result();
            $puryear.=', ' . round($row[0]->purchase);
        }
        if (date('n') > 7) {
            $row = $this->db->select('sum(amttotal+taxtotal) as purchase')->where('shopid', $this->session->userdata("shopid"))->where("pdate BETWEEN '" . date('Y-08-01') . "' and '" . date('Y-08-31') . "'")->get('purchasemaster_' . date('Y'))->result();
            $puryear.=', ' . round($row[0]->purchase);
        }
        if (date('n') > 8) {
            $row = $this->db->select('sum(amttotal+taxtotal) as purchase')->where('shopid', $this->session->userdata("shopid"))->where("pdate BETWEEN '" . date('Y-09-01') . "' and '" . date('Y-09-30') . "'")->get('purchasemaster_' . date('Y'))->result();
            $puryear.=', ' . round($row[0]->purchase);
        }
        if (date('n') > 9) {
            $row = $this->db->select('sum(amttotal+taxtotal) as purchase')->where('shopid', $this->session->userdata("shopid"))->where("pdate BETWEEN '" . date('Y-10-01') . "' and '" . date('Y-10-31') . "'")->get('purchasemaster_' . date('Y'))->result();
            $puryear.=', ' . round($row[0]->purchase);
        }
        if (date('n') > 10) {
            $row = $this->db->select('sum(amttotal+taxtotal) as purchase')->where('shopid', $this->session->userdata("shopid"))->where("pdate BETWEEN '" . date('Y-11-01') . "' and '" . date('Y-11-30') . "'")->get('purchasemaster_' . date('Y'))->result();
            $puryear.=', ' . round($row[0]->purchase);
        }
        if (date('n') > 11) {
            $row = $this->db->select('sum(amttotal+taxtotal) as purchase')->where('shopid', $this->session->userdata("shopid"))->where("pdate BETWEEN '" . date('Y-12-01') . "' and '" . date('Y-12-30') . "'")->get('purchasemaster_' . date('Y'))->result();
            $puryear.=', ' . round($row[0]->purchase);
        }
        $data['puryear'] = $puryear;


        // Damage 
        $row = $this->db->select('sum(total) as dam')->where('shopid', $this->session->userdata("shopid"))->where("sdate BETWEEN '" . date('Y-01-01') . "' and '" . date('Y-01-31') . "'")->get('sundry_' . date('Y'))->result();
        $damyear = round($row[0]->dam);
        if (date('n') > 1) {
            $row = $this->db->select('sum(total) as dam')->where('shopid', $this->session->userdata("shopid"))->where("sdate BETWEEN '" . date('Y-02-01') . "' and '" . date('Y-02-28') . "'")->get('sundry_' . date('Y'))->result();
            $damyear.=', ' . round($row[0]->dam);
        }
        if (date('n') > 2) {
            $row = $this->db->select('sum(total) as dam')->where('shopid', $this->session->userdata("shopid"))->where("sdate BETWEEN '" . date('Y-03-01') . "' and '" . date('Y-03-31') . "'")->get('sundry_' . date('Y'))->result();
            $damyear.=', ' . round($row[0]->dam);
        }
        if (date('n') > 3) {
            $row = $this->db->select('sum(total) as dam')->where('shopid', $this->session->userdata("shopid"))->where("sdate BETWEEN '" . date('Y-04-01') . "' and '" . date('Y-04-30') . "'")->get('sundry_' . date('Y'))->result();
            $damyear.=', ' . round($row[0]->dam);
        }
        if (date('n') > 4) {
            $row = $this->db->select('sum(total) as dam')->where('shopid', $this->session->userdata("shopid"))->where("sdate BETWEEN '" . date('Y-05-01') . "' and '" . date('Y-05-31') . "'")->get('sundry_' . date('Y'))->result();
            $damyear.=', ' . round($row[0]->dam);
        }
        if (date('n') > 5) {
            $row = $this->db->select('sum(total) as dam')->where('shopid', $this->session->userdata("shopid"))->where("sdate BETWEEN '" . date('Y-06-01') . "' and '" . date('Y-06-30') . "'")->get('sundry_' . date('Y'))->result();
            $damyear.=', ' . round($row[0]->dam, 0);
        }
        if (date('n') > 6) {
            $row = $this->db->select('sum(total) as dam')->where('shopid', $this->session->userdata("shopid"))->where("sdate BETWEEN '" . date('Y-07-01') . "' and '" . date('Y-07-30') . "'")->get('sundry_' . date('Y'))->result();
            $damyear.=', ' . round($row[0]->dam);
        }
        if (date('n') > 7) {
            $row = $this->db->select('sum(total) as dam')->where('shopid', $this->session->userdata("shopid"))->where("sdate BETWEEN '" . date('Y-08-01') . "' and '" . date('Y-08-31') . "'")->get('sundry_' . date('Y'))->result();
            $damyear.=', ' . round($row[0]->dam);
        }
        if (date('n') > 8) {
            $row = $this->db->select('sum(total) as dam')->where('shopid', $this->session->userdata("shopid"))->where("sdate BETWEEN '" . date('Y-09-01') . "' and '" . date('Y-09-30') . "'")->get('sundry_' . date('Y'))->result();
            $damyear.=', ' . round($row[0]->dam);
        }
        if (date('n') > 9) {
            $row = $this->db->select('sum(total) as dam')->where('shopid', $this->session->userdata("shopid"))->where("sdate BETWEEN '" . date('Y-10-01') . "' and '" . date('Y-10-31') . "'")->get('sundry_' . date('Y'))->result();
            $damyear.=', ' . round($row[0]->dam);
        }
        if (date('n') > 10) {
            $row = $this->db->select('sum(total) as dam')->where('shopid', $this->session->userdata("shopid"))->where("sdate BETWEEN '" . date('Y-11-01') . "' and '" . date('Y-11-30') . "'")->get('sundry_' . date('Y'))->result();
            $damyear.=', ' . round($row[0]->dam);
        }
        if (date('n') > 11) {
            $row = $this->db->select('sum(total) as dam')->where('shopid', $this->session->userdata("shopid"))->where("sdate BETWEEN '" . date('Y-12-01') . "' and '" . date('Y-12-30') . "'")->get('sundry_' . date('Y'))->result();
            $damyear.=', ' . round($row[0]->dam);
        }
        $data['damyear'] = $damyear;
        return $data;
    }

    public function gstper() {
        return $this->db->get('gstper')->result();
    }

    public function Explist() {
        return $this->db->get('exptypemaster')->result();
    }
    public function lastinvoice() {
        return $this->db->select('max(invoiceid) as invoiceid')->get('salesmaster_'.date('Y'))->row()->invoiceid;
    }

    public function listbank() {
        return $this->db->where('companyid', $this->session->userdata("shopid"))->get('bankmaster')->result();
    }

    public function bankdetails($bankid) {
        return $this->db->where('bankid', $bankid)->get('bankmaster')->result();
    }

    public function listexpanse() {
        if ($this->uri->segment(2) < '13') {
            $date = $this->uri->segment(2);
        } else {
            $date = 'm';
        }
        return $this->db->like('date', date('Y-' . $date), 'after')->get('expancemaster')->result();
    }

    public function DetailsExpanse() {
        return $this->db->where('id', base64_decode(urldecode($this->uri->segment(2))))->get('expancemaster')->result();
    }

    public function listbarcode() {
        return $this->db->where('prodid', base64_decode(urldecode($this->uri->segment(2))))->get('barcodemaster')->result();
    }

    public function productlist($prodid_='') {
        if($this->uri->segment(2) != '')
        {
            $prodid_ = $this->uri->segment(2);
        }
        return $this->db->where('prodid_', base64_decode(urldecode($prodid_)))->get('productmaster')->result();
        //->order_by('prodname','ASC')
    }

    public function creditlist($type) {
        $res = array();
        if ($type == 'Paid') {
            $y = date('Y');
            // $result = $this->db->where('paytype <>', 'Credit')
            //                 ->where('customerid', base64_decode(urldecode($this->uri->segment(2))))
            //                 ->from('salesmaster_' . ($y - 1))->get()->result();
            $result2 = $this->db->where('paytype <>', 'Credit')
                            ->where('customerid', base64_decode(urldecode($this->uri->segment(2))))
                            ->from('salesmaster_' . $y)->get()->result();
            // $res = array_merge($result, $result2);
            $res = $result2;
        } else {
            $y = date('Y');
            // $result = $this->db->where('type', $type)
            //                 ->where('customerid', base64_decode(urldecode($this->uri->segment(2))))
            //                 ->from('creditmaster_' . ($y - 1))->get()->result();
            $result2 = $this->db->where('type', $type)
                            ->where('customerid', base64_decode(urldecode($this->uri->segment(2))))
                            ->from('creditmaster_' . $y)->get()->result();
            //$res = array_merge($result, $result2);
            $res = $result2;
        }
        return $res;
    }

    public function transectionlist() {
        return $this->db->where('custid', base64_decode(urldecode($this->uri->segment(2))))->get('advancmaster_' . date('Y'))->result();
    }

    public function Stocktypelist() {
        return $this->db->get('stocktype')->result();
    }

    public function barcodeprint() {

        $res[0] = $this->db->where('id', base64_decode(urldecode($this->uri->segment(2))))
                        ->from('barcodemaster B')
                        ->join('productmaster P', 'B.prodid = P.prodid', 'join')
                        ->get()->result();
        if ($this->session->userdata("userstock")) {
            $stock = $this->session->userdata("userstock");
            $this->session->unset_userdata("userstock");
        } else {
            $stock = 1;
        }
        $res[1] = $stock;
        return $res;
    }

    public function productlistall() {
        return $this->db->where('shopid', $this->session->userdata("shopid"))->get('productmaster')->result();
    }

    public function Purchaselistall() {
        return $this->db->where('P.shopid', $this->session->userdata("shopid"))
                        ->like('pdate', date('Y-m'), 'after')
                        ->from('productmaster P')
                        ->join('purchasemaster_' . date('Y') . ' PR', 'P.prodid = PR.prodid', 'join')->get()->result();
    }

    public function purchaselist($from, $to, $customerid) {
        if ($from == '' && $to == '') {
            $to = date("Y-m-d");
            $from = date("Y-m-d");
        }
        $this->db->where('P.shopid', $this->session->userdata("shopid"));
        if ($customerid != '') {
            $this->db->where('C.customerid', $customerid);
        }
        return $this->db->where("pdate BETWEEN '" . date('Y-m-d', strtotime($from)) . "' and '" . date('Y-m-d', strtotime($to)) . "'")
                        ->from('purchasemaster_' . date('Y', strtotime($from)) . ' P')
                        ->join('customermaster C', 'C.customerid = P.customerid', 'join')
                        ->get()->result();
    }

    public function debitnotelist($from, $to) {
        return $this->db->where('P.shopid', $this->session->userdata("shopid"))
                        ->where("pdate BETWEEN '" . date('Y-m-d', strtotime($from)) . "' and '" . date('Y-m-d', strtotime($to)) . "'")
                        ->from('debitnotemaster_' . date('Y', strtotime($from)) . ' P')
                        ->join('customermaster C', 'C.customerid = P.customerid', 'join')
                        ->get()->result();
    }

    public function purchasedetails() {
        $from = base64_decode(urldecode($this->uri->segment(3)));
        return $this->db->where('P.shopid', $this->session->userdata("shopid"))
                        ->where("P.pinvoiceid", base64_decode(urldecode($this->uri->segment(2))))
                        ->from('purchasemaster_' . date('Y', strtotime($from)) . ' P')
                        ->join('purchasedetails_' . date('m_Y', strtotime($from)) . ' D', 'P.pinvoiceid = D.pinvoiceid', 'join')
                        ->join('productmaster PM','PM.prodid_ = D.prodid_','join')
                        ->join('customermaster C', 'C.customerid = P.customerid', 'join')
                        ->join('shopmaster S', 'S.shopid = P.shopid', 'join')
                        ->get()->result();
    }

    public function debitnoteview() {
        $from = base64_decode(urldecode($this->uri->segment(3)));
        return $this->db->where('P.shopid', $this->session->userdata("shopid"))
                        ->where("P.dinvoiceid", base64_decode(urldecode($this->uri->segment(2))))
                        ->from('debitnotemaster_' . date('Y', strtotime($from)) . ' P')
                        ->join('debitnotedetailsmaster_' . date('Y', strtotime($from)) . ' D', 'P.dinvoiceid = D.dinvoiceid', 'join')
                        ->join('customermaster C', 'C.customerid = P.customerid', 'join')
                        ->join('shopmaster S', 'S.shopid = P.shopid', 'join')
                        ->get()->result();
    }

    public function productblistall() {
        return $this->db->where('shopid', $this->session->userdata("shopid"))
                        //->from('productmaster P')//->join('barcodemaster B', 'B.prodid = P.prodid', 'join')
                        ->get('productmaster')->result();
    }

    public function productblistpurchase() {
        return $this->db->where('shopid', $this->session->userdata("shopid"))
                        ->get('productmaster')->result();
    }

    public function Customerlist() {
        return $this->db->where('ctype', 'Customer')->get('customermaster')->result();
    }

    public function CustomerlistAll() {
        return $this->db->get('customermaster')->result();
    }

    public function invoicecustomer() {
        return $this->db->where('customerid', $this->session->userdata("customerid"))->get('customermaster')->result();
    }

    public function Venderlist() {
        return $this->db->where('ctype', 'Vendor')->get('customermaster')->result();
    }

    public function gstsetting() {
        return $this->db->get('gstsetting')->result();
    }

    public function CardAdvance() {
        $barcode = $this->input->post('barcode');
        return $this->db->where('cardno', $barcode)->or_where('barcode', $barcode)->from('customermaster C')->join('cardmaster N', 'C.customerid = N.custid', 'join')->get()->result();
    }

    public function ProdDetails() {
        $this->db->select('*');
        $this->db->from('productmaster');
        $this->db->where('prodid', $this->input->post('prodid'));
        return $this->db->get()->result();
    }

    public function InvoiceProdDetails() {
        return $this->db->where('prodid', $this->input->post('prodid'))
                        ->where('stock >', 0)
                        ->get('productmaster')->result();
    }

    public function CustomerDetails() {
        $this->db->select('*');
        $this->db->from('customermaster');
        $this->db->where('customerid', $this->input->post('id'));
        return $this->db->get()->result();
    }

    public function CustomerProfileDetails() {
        $this->db->select('*');
        $this->db->from('customermaster');
        $this->db->where('customerid', base64_decode(urldecode($this->uri->segment(2))));
        return $this->db->get()->result();
    }

    public function DeleteCustomer() {
        $this->db->where('customerid', base64_decode(urldecode($this->uri->segment(2))));
        $this->db->Delete('customermaster');
    }

    public function SalesList($from, $to, $type='', $cname='',$terminal_id='') {
        if ($from == '' && $to == '') {
            $from = date("Y-m-d");
            $to = date("Y-m-d");
        }
        $from = date("Y-m-d", strtotime($from));
        $to = date("Y-m-d", strtotime($to));
        $result = array();
        $this->db->from('salesmaster_' . date('Y', strtotime($from)) . ' S')
                ->join('customermaster C', 'C.customerid = S.customerid', 'join')
                ->where("invoice_date BETWEEN '" . $from . "' and '" . $to . "'")
                ->where('shopid', $this->session->userdata("shopid"));
        if ($cname != '') {
            $this->db->where("S.customerid", $cname);
        }
        if ($terminal_id != '') {
            $this->db->where("S.terminal_id", $terminal_id);
        }
        if ($type != '') {
            $this->db->where("paytype", $type);
        } else {
            $this->db->like("paytype", '');
        }
        $result = $this->db->get()->result();
        /*var_dump($this->db->last_query());
        exit;*/
        return $result;
    }

    public function CreditSalesList($from, $to, $type, $cname) {
        if ($from == NULL || $to == NULL) {
            $to = $from = date("Y-m-d");
        }
        $from = date("Y-m-d", strtotime($from));
        $to = date("Y-m-d", strtotime($to));
        $result = array();
        $this->db->from('creditsalesmaster_' . date('Y', strtotime($from)) . ' S')
                ->join('customermaster C', 'C.customerid = S.customerid', 'join')
                ->where("creditdate BETWEEN '" . date('Y-m-d', strtotime($from)) . "' and '" . date('Y-m-d', strtotime($to)) . "'")
                ->where('shopid', $this->session->userdata("shopid"));
        //->where("paytype<>", 'Credit');
        if ($cname != '') {
            $this->db->where("S.customerid", $cname);
        }
        if ($type != '') {
            $this->db->where("paytype", $type);
        } else {
            $this->db->like("paytype", $type);
        }
        $result = $this->db->get()->result();
        return $result;
    }

    public function RefundList($from, $to, $type, $cname) {
        if ($from == NULL || $to == NULL) {
            $to = $from = date("Y-m-d");
        }
        $from = date("Y-m-d", strtotime($from));
        $to = date("Y-m-d", strtotime($to));
        $result = array();
        $this->db->from('refund_' . date('Y', strtotime($from)))
                ->where("sdate BETWEEN '" . date('Y-m-d', strtotime($from)) . "' and '" . date('Y-m-d', strtotime($to)) . "'")
                ->where('shopid', $this->session->userdata("shopid"));
        $result = $this->db->get()->result();
        return $result;
    }
    public function SundryList($from, $to) {
        if ($from == NULL || $to == NULL) {
            $to = $from = date("Y-m-d");
        }
        $this->db->select('*');
        $this->db->from('sundry_' . date('Y') . ' S');
        $this->db->where("sdate >=", $from);
        $this->db->where('shopid', $this->session->userdata("shopid"));
        $this->db->where("sdate <=", $to);
        return $this->db->get()->result();
    }

    public function SalesListSearch($from, $to, $type) {
        if ($from == NULL || $to == NULL) {
            $to = $from = date("Y-m-d");
        }
        $this->db->select('*');
        $this->db->from('salesmaster_' . date('Y', strtotime($from)) . ' S');
        $this->db->join('customermaster C', 'C.id = S.custid', 'join');
        $this->db->join('productmaster P', 'P.prodid = S.prodid', 'join');
        $this->db->where("date >=", $from);
        $this->db->where("date <=", $to);
        $this->db->where("type", $type);
        $this->db->where('shopid', $this->session->userdata("shopid"));
        return $this->db->get()->result();
    }

    public function GetCoupon() {
        return $this->db->where('coupen_no', $this->input->post('couponno'))
                        ->where('to_date >=', date("Y-m-d"))
                        ->get('coupenmaster')->result();
    }

    public function Employeelist() {
        return $this->db->from('employeemaster L')
                        ->join('addressmaster A', 'A.userid = L.userid', 'join')
                        ->join('shopmaster S', 'S.shopid = L.shopid', 'join')
                        ->where('status', '1')
                        ->group_by('L.userid')
                        ->get()->result();
    }

    public function employeesalary() {
        if ($this->uri->segment(2)) {
            $date = $this->uri->segment(2);
        } else {
            $date = date("Y-m-d");
        }
        $sal = $this->db->like('date', date("Y-m", strtotime($date)), 'after')
                        ->get('salarymaster')->result();
        $this->db->from('employeemaster L')
                ->join('shopmaster S', 'S.shopid = L.shopid', 'join');
        if (count($sal) > 0) {
            $this->db->join('salarymaster SA', 'SA.userid = L.userid', 'join')->like('SA.date', date("Y-m", strtotime($date)), 'after');
        }
        return $this->db->group_by('L.userid')
                        ->where('L.shopid', $this->session->userdata("shopid"))
                        ->where('status', '1')
                        ->get()->result();
    }

    public function EmployeeProfile() {
        $this->db->from('employeemaster L');
        $this->db->join('addressmaster A', 'A.userid = L.userid', 'join');
        $this->db->join('shopmaster S', 'S.shopid = L.shopid', 'join');
        $this->db->where('L.userid', base64_decode(urldecode($this->uri->segment(2))));
        return $this->db->get()->result();
    }

    public function InvoiceDetails($invice, $dt) {
        $dat = $this->db->select('invoice_date as dat')->where('invoiceid', $invice)->get('salesmaster_' . date('Y',$dt))->row()->dat;
        $rtn[0] = $this->db->from('salesmaster_' . date('Y', $dt) . ' S')
                        ->join('salesdetailsmaster_' . date('m_Y', strtotime($dat)) . ' D', 'D.invoiceid = S.invoiceid', 'join')
                        ->join('productmaster P', 'P.prodid_ = D.prodid_', 'join')
                        ->join('shopmaster SP', 'SP.shopid = S.shopid', 'join')
                        ->join('customermaster C', 'C.customerid = S.customerid', 'join')
                        ->where('S.invoiceid', $invice)
                        ->get()->result();
        if(isset($rtn[0][0]))
        {
            $rtn[1] = $this->productmodel->n_to_w(round($rtn[0][0]->total_amount, 0));
        }
        return $rtn;
    }

    public function creditnoteDetails($invoice, $dt) {
       $dat = $this->db->select('creditdate as dat')->where('creditid', $invoice)->get('creditsalesmaster_' . date('Y'))->row()->dat;
        $rtn[0] = $this->db->from('creditsalesmaster_' . date('Y', strtotime($dat)) . ' S')
                        ->join('creditdetailsmaster_' . date('Y', strtotime($dat)) . ' D', 'D.creditid = S.creditid', 'join')
                        ->join('productmaster P', 'P.prodid = D.prodid', 'join')
                        ->join('shopmaster SP', 'SP.shopid = S.shopid', 'join')
                        ->join('customermaster C', 'C.customerid = S.customerid', 'join')
                        ->where('S.creditid', $invoice)
                        ->get()->result();
        $rtn[1] = $this->productmodel->n_to_w(round($rtn[0][0]->totalamount + $rtn[0][0]->taxamount, 0));
        return $rtn;
    }
    public function refundDetails($refund, $dt) {
       $dat = $this->db->select('refund_date as dat')->where('id', $refund)->get('refundmaster_' . date('Y'))->row()->dat;
        $rtn[0] = $this->db->from('refundmaster_' . date('Y', strtotime($dat)) . ' S')
                        ->join('refunddetailsmaster_' . date('Y', strtotime($dat)) . ' D', 'D.refund_id = S.refund_id', 'join')
                        ->join('productmaster P', 'P.prodid_ = D.prodid_', 'join')
                        ->join('shopmaster SP', 'SP.shopid = S.shop_id', 'join')
                        ->where('S.id', $refund)
                        ->get()->result();
        $rtn[1] = $this->productmodel->n_to_w(round($rtn[0][0]->refund_total));
        return $rtn;
    }
    public function ShopList() {
        return $this->db->get('shopmaster')->result();
    }

    public function LowStockAlertCount() {
        return $this->db->where('stock <','2')->get('productmaster')->result();
    }

    public function ShopProfile() {
        return $this->db->where('shopid', base64_decode(urldecode($this->uri->segment(2))))->get('shopmaster')->result();
    }

    public function shopDetails() {
        return $this->db->where('shopid', $this->session->userdata("shopid"))->get('shopmaster')->result();
    }

    public function CardDetails() {
        return$this->db->where('custid', base64_decode(urldecode($this->uri->segment(2))))->get('cardmaster')->result();
    }

    public function CategoryList() {
        return $this->db->get('catagory')->result();
    }

    public function CouponList() {
        return $this->db->get('coupenmaster')->result();
    }

    public function transactionreport() {
        extract($this->input->post());
        return $this->db//->select('bankname,acno,T.date,T.balance,amtype,amount,T.id')
                        ->from('bankmaster B')
                        ->join('transactionmaster_' . date("Y", strtotime($fromdate)) . ' T', 'B.bankid = T.bankid', 'join')
                        ->where("T.date BETWEEN '" . date("Y-m-d", strtotime($fromdate)) . "' and '" . date("Y-m-d", strtotime($todate)) . "'")
                        ->where('T.bankid', $bankid)
                        ->get()->result();
    }

    public function CouponDetails() {
        return $this->db->where('id', base64_decode(urldecode($this->uri->segment(2))))->get('coupenmaster')->result();
    }

    public function Notification() {
        return $this->db->where('(datediff(CURDATE(), createdate))>= lifeday')
                        ->where('stock >', 0)
                        ->where('shopid', $this->session->userdata("shopid"))
                        ->get('productmaster')->result();
    }
    public function getSalesSum(){
        $curr_year = date("Y");
        $this->db->select_sum('total_amount');
        $this->db->from('salesmaster_' .$curr_year. ' S')
                ->join('customermaster C', 'C.customerid = S.customerid', 'join');
        $result = $this->db->get()->row();
        if($result)
        {
            return $result->total_amount;
        }
        return 0;
    }
    public function getPurchaseSum(){
        $curr_year = date("Y");
        $this->db->select_sum('amttotal');
        $this->db->from('purchasemaster_' .$curr_year. ' P')
                ->join('customermaster C', 'C.customerid = P.customerid', 'join');
        $result = $this->db->get()->row();
        if($result)
        {
            return $result->amttotal;
        }
        return 0;
    }

    public function getDailyReport()
    {
        $data = array();
        $today = date("Y-m-d");
        $curr_year = date('Y');
        $curr_month = date('m');
        $sales_sql = "SELECT PO.*,SUM(SD.prodttotal) as total_sales
                    FROM `salesdetailsmaster_{$curr_month}_{$curr_year}` SD,productmaster PO 
                    WHERE SD.added_on LIKE '%{$today}%' AND PO.prodid_ = SD.prodid_ GROUP BY SD.prodid_;";
        $sales_query = $this->db->query($sales_sql);
        $total_sales = $sales_query->result();
        $reports_arr = array();
        if($total_sales)
        {
            foreach ($total_sales as $row_sale) {
                $prodid_ = $row_sale->prodid_;
                $total_sell = $row_sale->total_sales;
                $reports_arr[$prodid_] = array('sales'=>$total_sell,'purchase'=>0);
            }
        }
        $purchase_sql = "SELECT PO.*,SUM(PD.total) as total_purchase
                        FROM `purchasedetails_{$curr_month}_{$curr_year}` PD,productmaster PO 
                        WHERE PD.added_on LIKE '%{$today}%' AND PO.prodid_ = PD.prodid_
                        GROUP BY PD.prodid_;";
        $purchase_query = $this->db->query($purchase_sql);
        $total_purchases = $purchase_query->result();
        if($total_purchases)
        {
            foreach ($total_purchases as $row_purchase) {
                $prodid_ = $row_purchase->prodid_;
                $total_purchase = $row_purchase->total_purchase;
                if(array_key_exists($prodid_, $reports_arr))
                {
                    $reports_arr[$prodid_]['purchase'] = $total_purchase;    
                }
                else
                {
                    $reports_arr[$prodid_] = array('sales'=>0,'purchase'=>$total_purchase);
                }
            }
        }
        return $reports_arr;
    }
}
