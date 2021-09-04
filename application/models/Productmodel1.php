<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Productmodel extends CI_Model {

    public function __construct() {
        parent::__construct();
        $this->load->model('mailmodel');
    }

    public function SaveInvoice() {
        extract($this->input->post());
        $shopid = $this->session->userdata("shopid");
        $rtval = FALSE;
        $response = array('status'=>true,'msg'=>'');
        $this->db->trans_start();
        if($shopid==1){$invoice='SC'.date('Ym');}else{$invoice='I';}
        $result = $this->db->get('invoiceid' . $shopid)->result();
        /*if (date('Y', strtotime($result[0]->date)) == date('Y')) {*/
            $invoice .= $result[0]->iid;
            $datainv = array('iid' => ($result[0]->iid + 1));
        /* } else {
            $invoice .=  '1';
            $datainv = array('iid' => 1, 'date' => date('Y-m-d'));
        }*/
        $amount = floatval($gttotal);
        $ramount = 0;

        if ($custid == "") {
            $this->db->insert('customermaster', array('name' => $flexdatalistcname, 'mobile' => $mobile, 'gstin' => $gstin, 'ctype' => 'Customer'));
            $custid = $this->db->insert_id();
        }
        $credit_limit = floatval($isCredit);
        if($ptype == 'credit')
        {
            if($credit_limit == 0)
            {
                $cust_info = $this->db->from('customermaster')->where('customerid', $custid)->get()->row_array();
                if($cust_info)
                {
                    $credit_limit = floatval($cust_info['credit_amount']);
                }
            }
        }
        else
        {
            $credit_limit = $gttotal;
        }
        /*if ($ptype == 'E-Cash') {
            $amount = $gttotal;
        }*/
        
        if($credit_limit >= $gttotal)
        {
            $data = array('invoiceid' => $invoice, 'customerid' => $custid, 'ebill' => $ewaynum, 'invoiceby' => $this->session->userdata("usersession"), 'shopid' => $shopid, 'paytype' => $ptype, 'invoice_date' => $today, 'pamount' => $amount, 'total_amount' => $gttotal, 'ramount' => $ramount, 'coupen_no' => $couponno, 'coupen_amount' => $camount, 'taxamount' => $gsttotal,'terminal_id'=>$this->terminal_id);
            if ($this->db->insert("`salesmaster_" . date("Y", strtotime($today)) . "`", $data)) {
                for ($i = 0; $i < count($hsn) - 1; $i++) {
                    $data = array('invoiceid' => $invoice, 'prodid_' => $prodid_[$i], 'bprodname' => $prodname[$i], 'istock' => $stock[$i], 'iinstock' => $qtt[$i], 'unit' => $unit[$i], 'salesrate' => $price[$i], 'prodtotal' => $total[$i], 'prodttotal' => $ttotal[$i], 'discount' => $discout[$i], 'gst' => $gsttype, 'bgstper' => $gstper[$i], 'gstamount' => $gstamount[$i]);
                    $this->db->insert("`salesdetailsmaster_" . date('m_Y', strtotime($today)) . "`", $data);
                    $tst = /*$qtt[$i] **/ $stock[$i];
                    $query = "UPDATE productmaster SET lstock = lstock-" . $tst . " WHERE prodid_='" . $prodid_[$i] . "'";
                    $this->db->query($query);
                    //$query = "UPDATE barcodemaster SET bstock = bstock-" . $stock[$i] . " WHERE id='" . $prdid[$i] . "'";
                    //$this->db->query($query);
                    //$rtval = TRUE;
                }
            }
            $this->session->set_userdata("invoicesession", $invoice);
            $this->session->set_userdata("datesession", $today);
            if ($ptype == 'Credit') {
                $query = "INSERT INTO `creditmaster_" . date('Y', strtotime($today)) . "` (`invoiceid`, `customerid`, `type`, `amount`, `date`)  VALUES ('{$invoice}','{$custid}','Unpaid','{$tamount}','{$today}')";
                $this->db->query($query);
            }
            $this->db->update('invoiceid' . $shopid, $datainv);
            $this->db->trans_complete();
        
        }
        else
        {
            $response['status'] = false;
            $response['msg'] = "User Dont have enough credit amount!";
            $response['msg2'] = "If you still want to proceed you can 'Submit' again.";
            $response['amount'] = $amount;
        }
        echo json_encode($response);exit;
    }

    public function Updateinvoice() {
        $delary = array();
        $delarys = array();
        extract($this->input->post()); //$this->session->userdata("mysession")); //
        $response = array('status'=>true,'msg'=>'');
        $shopid = $this->session->userdata("shopid");
        $rtval = FALSE;
        $this->db->trans_start();
        $amount = floatval($gttotal);
        $ramount = 0;
        if ($custid == "") {
            $this->db->insert('customermaster', array('name' => $flexdatalistcname, 'mobile' => $mobile, 'gstin' => $gstin, 'ctype' => 'Customer'));
            $custid = $this->db->insert_id();
        }
        $credit_limit = floatval($isCredit);
        if($ptype == 'credit')
        {
            if($credit_limit == 0)
            {
                $cust_info = $this->db->from('customermaster')->where('customerid', $custid)->get()->row_array();
                if($cust_info)
                {
                    $credit_limit = floatval($cust_info['credit_amount']);
                }
            }
        }
        else
        {
            $credit_limit = $gttotal;
        }
        /*if ($ptype == 'E-Cash') {
            $amount = $gttotal;
        }*/
        
        /*if ($ptype == 'E-Cash') {
            $amount = $gttotal;
        }*/
        if($credit_limit >= $gttotal)
        {
            $pdetails = $this->db->where('invoiceid', $invoiceid)->get('salesdetailsmaster_' . date('m_Y', strtotime($invoicedate)))->result_array();
            if (is_array($pdetails)) {
                for ($v = 0; $v < count($pdetails); $v++) {
                    array_push($delary, $pdetails[$v]['id']);
                }
            }
            $data = array('customerid' => $custid,  'ebill' => $ewaynum, 'invoiceby' => $this->session->userdata("usersession"), 'shopid' => $shopid, 'paytype' => $ptype, 'invoice_date' => $today, 'pamount' => $amount, 'total_amount' => $gttotal, 'ramount' => $ramount, 'taxamount' => $gsttotal,'terminal_id'=>$this->terminal_id);
            if ($this->db->where('invoiceid', $invoiceid)->update("`salesmaster_" . date("Y", strtotime($invoicedate)) . "`", $data)) {
                for ($i = 0; $i < count($prodid_) - 1; $i++) {
                    if ($iid[$i] != "") {
                        $data = array('invoiceid' => $invoiceid, 'prodid_' => $prodid_[$i], 'bprodname' => $prodname[$i], 'istock' => $stock[$i], 'iinstock' => $instock[$i], 'unit' => $unit[$i], 'salesrate' => $price[$i], 'prodtotal' => $total[$i], 'prodttotal' => $ttotal[$i], 'discount' => $discout[$i], 'gst' => $gsttype, 'bgstper' => $gstper[$i], 'gstamount' => $gstamount[$i]);
                        $this->db->where('id', $iid[$i])->update("`salesdetailsmaster_" . date('m_Y', strtotime($invoicedate)) . "`", $data);
                        $tst = $stock[$i] - $hstock[$i];
                        $query = "UPDATE productmaster SET stock = stock-" . $tst . ", rstock = rstock-" . $tst . " WHERE prodid_='" . $prodid_[$i] . "'";
                        $this->db->query($query);
                        array_push($delarys, $iid[$i]);
                    } else {
                        $data = array('prodid_' => $prodid_[$i], 'invoiceid' => $invoiceid, 'bprodname' => $prodname[$i], 'istock' => $stock[$i], 'iinstock' => $instock[$i], 'unit' => $unit[$i], 'salesrate' => $price[$i], 'prodtotal' => $total[$i], 'prodttotal' => $ttotal[$i], 'discount' => $discout[$i], 'gst' => $gsttype, 'bgstper' => $gstper[$i], 'gstamount' => $gstamount[$i]);
                        $this->db->insert("`salesdetailsmaster_" . date('m_Y', strtotime($invoicedate)) . "`", $data);
                        $tst = $instock[$i] * $stock[$i];
                        $query = "UPDATE productmaster SET stock = stock-" . $tst . " WHERE prodid_='" . $prodid_[$i] . "'";
                        $this->db->query($query);
                        //$query = "UPDATE barcodemaster SET bstock = bstock-" . $stock[$i] . " WHERE id='" . $prdid[$i] . "'";
                        //$this->db->query($query);
                    }
                }
                $rtval = TRUE;
            }
            if ($ptype == 'credit') {
                $array = array('amount' => $tamount, 'customerid' => $custid, 'date' => $today);
                $this->db->where('invoiceid', $invoiceid)->update("creditmaster_" . date('Y', strtotime($invoicedate)), $array);
            }
            $res = array_diff($delary, $delarys);
            if (count($res) > 0) {
                /*$ddata = $this->db->where_in('id', $res)->get('salesdetailsmaster_' . date('m_Y', strtotime($invoicedate)))->result();
                for ($i = 0; $i < count($ddata); $i++) {
                    $txt = $ddata[$i]->istock * $ddata[$i]->iinstock;
                    $this->db->query("UPDATE productmaster SET stock = stock+" . $txt . ", rstock = rstock+" . $txt . " WHERE prodid='" . $ddata[$i]->prodid . "'");
                }
                $this->db->where_in('id', $res)->delete('salesdetailsmaster_' . date('m_Y', strtotime($invoicedate)));*/
            }
            $this->session->set_userdata("invoicesession", $invoiceid);
            $this->session->set_userdata("datesession", $invoicedate);
            $this->db->trans_complete();
        }
        else
        {
            $response['status'] = false;
            $response['msg'] = "User Dont have enough credit amount!";
            $response['msg2'] = "If you still want to proceed you can 'Submit' again.";
            $response['amount'] = $amount;
        }
        echo json_encode($response);exit;
    }
    public function Updatebillinvoice(){
        $response = array('status'=>true,'msg'=>'');
        $post = $this->input->post();
        if(isset($post['bill_no']))
        {
            $data = $post;
            $invoiceid = $post['bill_no'];
            unset($data['bill_no']);
            unset($data['invoice_date']);
            extract($post);
            $data['pamount'] = $data['total_payable'];
            $where = array('invoiceid'=>$invoiceid);
            $this->db->where($where)->update("`salesmaster_" . date("Y", strtotime($invoice_date)) . "`", $data);
        }
        else
        {
            $response['msg'] = "please select invoice";
            $response['status'] = false;
        }
        echo json_encode($response);exit;
    }
    public function creditnoteinvoice() {
        extract($this->input->post());
        $shopid = $this->session->userdata("shopid");
        $rtval = FALSE;
        $this->db->trans_start();
        if($shopid==1){$invoice='CSC'.date('Ym');}else{$invoice='CRD';}
        $result = $this->db->get('creditid' . $shopid)->result();
       /* if (date('Y', strtotime($result[0]->date)) == date('Y')) {*/
            $invoice.= $result[0]->iid;
            $datainv = array('iid' => ($result[0]->iid + 1));
       /* } else {
            $invoice.= '1';
            $datainv = array('iid' => 1, 'date' => date('Y-m-d'));
        }*/
        $by = $this->session->userdata("usersession");
        $data = array('creditid' => $invoice, 'invoiceid' => $invoiceid, 'customerid' => $customerid, 'invoiceby' => $by, 'shopid' => $shopid, 'paytype' => $paytype, 'invoicedate' => $invoicedate, 'creditdate' => $today, 'totalamount' => $gttotal, 'description' => $description, 'taxamount' => $gsttotal);
        if ($this->db->insert("`creditsalesmaster_" . date("Y", strtotime($today)) . "`", $data)) {
            for ($i = 0; $i < count($hsn); $i++) {
                $data = array('creditid' => $invoice, 'prodid' => $prodid[$i], 'cprodname' => $prodname[$i], 'cstock' => $stock[$i], 'cinstock' => $instock[$i], 'unit' => $unit[$i], 'salesrate' => $price[$i], 'prodtotal' => $total[$i], 'prodttotal' => $ttotal[$i], 'discount' => $discout[$i], 'gst' => $gsttype, 'cgstper' => $gstper[$i], 'gstamount' => $gstamount[$i]);
                $this->db->insert("`creditdetailsmaster_" . date('Y', strtotime($today)) . "`", $data);
                $query = "UPDATE productmaster SET stock = stock+" . $stock[$i] * $instock[$i] . ", rstock = rstock+" . $stock[$i] * $instock[$i] . " WHERE prodid='" . $prodid[$i] . "'";
                $this->db->query($query);
                $rtval = TRUE;
            }
        }
        $this->db->update('creditid' . $shopid, $datainv);
        $this->session->set_userdata("invoicesession", $invoice);
        $this->db->trans_complete();
        return $rtval;
    }
    public function saverefundinvoice() {
        extract($this->input->post());
        $today = date('Y-m-d');
        $shopid = $this->session->userdata("shopid");
        $rtval = FALSE;
        $this->db->trans_start();
        if($shopid==1){$refund='RF'.date('YmdHis');}else{$refund='RFN';}
        //$result = $this->db->get('creditid' . $shopid)->result();
        /* if (date('Y', strtotime($result[0]->date)) == date('Y')) {*/
            //$refund.= $result[0]->iid;
            //$datainv = array('iid' => ($result[0]->iid + 1));
        /* } else {
            $invoice.= '1';
            $datainv = array('iid' => 1, 'date' => date('Y-m-d'));
        }*/
        $by = $this->session->userdata("usersession");
        $data = array('refund_id' => $refund, 'refund_by' => $by, 'shop_id' => $shopid, 'refund_total' => $gtotal);
        $ins = $this->db->insert("`refundmaster_" . date("Y", strtotime($today)) . "`", $data);
        if($ins)
        {
            for ($i = 0; $i < count($prodid_); $i++) {
                $data = array('refund_id' => $refund, 'prodid_'=>$prodid_[$i],'qty'=>$qty[$i],'prodname' => $prodname[$i], 'unit' => $unit[$i], 'rate' => $rate[$i], 'total' => $total[$i]);
                $this->db->insert("`refunddetailsmaster_" . date('Y', strtotime($today)) . "`", $data);
                $query = "UPDATE productmaster SET lstock = lstock+" . $qty[$i]." WHERE prodid_='" . $prodid_[$i] . "'";
                $this->db->query($query);
            }
            $rtval = TRUE;
        }
        //$this->db->update('creditid' . $shopid, $datainv);
        $this->session->set_userdata("refundsession", $refund);
        $this->db->trans_complete();
        return $rtval;
    }

    public function invoicepayment() {
        extract($this->input->post());
        $this->db->trans_start();
        $custid = base64_decode(urldecode($this->uri->segment(2)));
        for ($i = 0; $i < count($invoiceid); $i++) {
            $this->db->where('invoiceid', $invoiceid[$i])->update('creditmaster_' . date('Y', strtotime($date[$i])), array('type' => 'Paid', 'date' => $pdate));
            $this->db->where('invoiceid', $invoiceid[$i])->update('salesmaster_' . date('Y', strtotime($date[$i])), array('paytype' => 'Credit Paid'));
        }
        $this->db->where('customerid', $custid)->update('customermaster', array('advance' => $tpay - $bpay));
        $shopid = $this->session->userdata("shopid");

        if ($transtype != "Cash") {
            $bak = $this->db->where('bankid', $bankid)->get('bankmaster')->result();
            if ($bak[0]->baltype == $amtype) {
                $balacne = $cpay + $bak[0]->balacne;
            } else {
                $balacne = $bak[0]->balacne - $cpay;
            }
            $data = array('date' => $trnsdate, 'bankid' => $bankid, 'byname' => $byname, 'transtype' => $transtype, 'transdetails' => $transdetails, 'amount' => $cpay, 'amtype' => $amtype, 'balance' => $balacne);
            $this->db->insert('transactionmaster_' . date('Y', strtotime($pdate)), $data);
            $data = array('balacne' => $balacne);
            $this->db->where('bankid', $bankid)->update('bankmaster', $data);
        } else {
            if ($apay > 0) {
                $this->db->insert("advancmaster_" . date('Y', strtotime($pdate)), array('debit' => $apay, 'shopid' => $shopid, 'custid' => $custid, 'date' => date('Y-m-d')));
            }
            if (($tpay - $bpay) > 0) {
                $this->db->insert("advancmaster_" . date('Y', strtotime($pdate)), array('credit' => $tpay - $bpay, 'shopid' => $shopid, 'custid' => $custid, 'date' => date('Y-m-d')));
            }
        }
        $this->db->trans_complete();
    }

    public function NewProduct() {
        extract($this->input->post());
        $this->db->trans_start();
        $shopid = $this->session->userdata("shopid");
        if ($unit == "New") {
            $this->db->insert('stocktype', array('unit' => $units));
            $unit = $units;
        }
        if ($gstp == "New") {
            $this->db->insert('gstper', array('gst' => $gstps));
            $gstp = $gstps;
        }
        $row = $this->db->query("SELECT * FROM prodid" . $shopid)->row_array();
        $prodid = $shopid . sprintf("%05d", $row['prodId']);
        $this->db->update('prodid' . $shopid, array('prodId' => ( $row['prodId'] + 1)));
        $data = array(
            'prodid' => $prodid,
            'hsn' => $hsn,
            'gstper' => $gstp,
            'prodname' => $flexdatalistpname,
            'shopid' => $this->session->userdata("shopid"),
            'uprice' => $price,
            'pprice' => $pprice,
            'lstock' => $lstock,
            'dstock' => $dstock,
            'wstock' => $wstock,
            'wprice' => $wprice,
            'unit' => $unit);
        unset($data['prodid']); //removing prodid
        $data['prodname_hindi'] = $prodname_hindi;
        
        $this->db->insert('productmaster', $data);
        $this->db->trans_complete();
    }

    public function printsbarcode() {
        extract($this->input->post());
        $this->db->trans_start();
        $this->load->library('zend');
        $this->zend->load('Zend/Barcode');
        $prodid = base64_decode(urldecode($this->uri->segment(2)));
        $this->session->set_userdata("userstock", $stock);
        if ($barcode == "No") {
            $barcodeid = $this->db->query("SELECT `id` FROM `barcode`")->row()->id;
            $this->db->update('barcode', array('id' => $barcodeid + 1));
        } else {
            $barcodeid = $pbarcode;
        }
        $data = array('id' => $barcodeid, 'prodid' => $prodid, 'bstock' => $stock, 'instock' => $qttype, 'stocktype' => $unit,
            'price' => $sprice, 'offprice' => $sprice, 'fromdate' => date('Y-m-d'), 'todate' => date('Y-m-d'));
        $file = Zend_Barcode::draw('code25interleaved', 'image', array('text' => $barcodeid, 'barHeight' => '20'), array('barHeight' => '20'));
        $store_image = imagejpeg($file, "images/barcode/{$barcodeid}.jpg");
        $this->db->insert('barcodemaster', $data);
        $query = "UPDATE productmaster SET rstock =rstock-" . $stock * $qttype . " WHERE prodid='" . $prodid . "'";
        $this->db->query($query);
        $this->db->trans_complete();
        return $barcodeid;
    }

    public function updatebarcode() {
        extract($this->input->post());
        $this->db->trans_start();
        $this->load->library('zend');
        $this->zend->load('Zend/Barcode');
        $this->db->where('id', $barcode);
        $this->db->update('barcodemaster', array('instock' => $qttype, 'price' => $sprice, 'offprice' => $sprice,));
        $file = Zend_Barcode::draw('code25interleaved', 'image', array('text' => $barcode, 'barHeight' => '20'), array('barHeight' => '20'));
        $store_image = imagejpeg($file, "images/barcode/{$barcode}.jpg");
        $this->db->trans_complete();
        return $barcode;
    }

    public function UpdateProduct() {
        extract($this->input->post());
        $this->db->trans_start();
        if ($unit == "New") {
            $this->db->insert('stocktype', array('unit' => $units));
            $unit = $units;
        }
        if ($gstp == "New") {
            $this->db->insert('gstper', array('gst' => $gstps));
            $gstp = $gstps;
        }
        $data = array(
            'prodname' => $pname,
            'prodname_hindi'=>$prodname_hindi,
            'unit' => $unit,
            'hsn' => $hsn,
            'uprice' => $price,
            'pprice' => $pprice,
            'wprice' => $wprice,
            'lstock' => $lstock,
            'dstock' => $dstock,
            'wstock' => $wstock,
            'gstper' => $gstp);
        $this->db->where('prodid_', $prodid_)->update('productmaster', $data);
        /*$query = "UPDATE productmaster SET stock = stock+" . $stock . ", rstock = rstock+" . $stock . " WHERE prodid_='" . $prodid_ . "'";
        $this->db->query($query);*/
        $this->db->trans_complete();
    }

    public function updateProductStock($prodid_='',$data=array())
    {
        
        if(!empty($data) && $prodid_ != '')
        {
            $this->db->trans_start();
            $column_add_from = $data['add_from'];
            $column_add_to = $data['add_to'];
            $remove_sql = $column_add_from." = ".$column_add_from."-".$data['qty'];

            $query = "UPDATE productmaster SET ".$column_add_to." = ".$column_add_to."+".$data['qty']."," . $remove_sql . " WHERE prodid_='" . $prodid_ . "'";
            $res = $this->db->query($query);
            if(!$res)
            {
                return false;
            }
            $this->db->trans_complete();
        }
        return true;
    }

    public function GetDetails() {
        $todate = date('Y-m-d');
        $this->db->select('*');
        $this->db->from('productmaster');
        $this->db->where('prodid', base64_decode(urldecode($this->uri->segment(2))));
        $list = $this->db->get()->result();
        $this->session->set_userdata("barcodesession", array('pname' => $list[0]->prodname, 'prodid' => $list[0]->prodid, 'stock' => $list[0]->stock, 'lifeday' => $list[0]->lifeday, 'instock' => $list[0]->qttype, 'stocktype' => $list[0]->stocktype, 'price' => $list[0]->price, 'todate' => $todate));
    }

    public function DeleteProduct() {
        $this->db->where('prodid_', base64_decode(urldecode($this->uri->segment(2))));
        $this->db->Delete('productmaster');
    }
    public function deleteinvoice() {
        $inv= $this->db->where('invoiceid', base64_decode(urldecode($this->uri->segment(2))))->get('salesmaster_'.date('Y'))->row();
        $this->db->where('invoiceid', base64_decode(urldecode($this->uri->segment(2))));
        $this->db->Delete('salesmaster_'.date('Y'));
        $this->db->where('invoiceid', base64_decode(urldecode($this->uri->segment(2))));
        $this->db->Delete('salesdetailsmaster_'.date('m_Y',  strtotime($inv->invoice_date)));
        $shopid = $this->session->userdata("shopid");
        $this->db->query("UPDATE invoiceid".$shopid." SET iid = iid-1");
    }

    public function NewCoupon() {
        extract($this->input->post());
        $coupon = "GSS" . $this->randomCoupon();
        $this->session->set_userdata("barcodesession", $coupon);
        $fromdate = date("Y-m-d", strtotime($fromdate));
        $todate = date("Y-m-d", strtotime($todate));
        $query = "INSERT INTO `coupenmaster`(`id`, `coupen_no`, `incre_type`, `discount`, `from_date`, `to_date`)
                 VALUES ('','{$coupon}','{$discounttype}','{$discount}','{$fromdate}','{$todate}')";
        $this->db->query($query);
    }

    function randomCoupon() {
        $alphabet = '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $pass = array(); //remember to declare $pass as an array
        $alphaLength = strlen($alphabet) - 1; //put the length -1 in cache
        for ($i = 0; $i < 6; $i++) {
            $n = rand(0, $alphaLength);
            $pass[] = $alphabet[$n];
        }
        return implode($pass); //turn the array into a string
    }

    public function DeleteCoupon() {
        $this->db->where('coupen_no', base64_decode(urldecode($this->uri->segment(2))));
        $this->db->Delete('coupenmaster');
    }

    public function UpdateCoupon() {
        extract($this->input->post());
        $fromdate = date("Y-m-d", strtotime($fromdate));
        $todate = date("Y-m-d", strtotime($todate));
        $data = array('incre_type' => $discounttype, 'discount' => $discount, 'from_date' => $fromdate, 'to_date' => $todate);
        $this->db->where('id', $id);
        $this->db->update('coupenmaster', $data);
    }

    public function SaveSundry() {
        $today = date("Y-m-d");
        $this->db->trans_start();
        $shopid = $this->session->userdata("shopid");
        extract($this->input->post());
        $table = "`sundry_" . date('Y', strtotime($today));
        for ($i = 0; $i < count($prodid_) - 1; $i++) {
            if($prodid_[$i] != '' && is_numeric($prodid_[$i]))
            {
                $data = array('shopid'=>$shopid,'prodid_'=>$prodid_[$i],'hsn'=>$hsn[$i],'prodname'=>$prodname[$i],'stock'=>$stock[$i],'stocktype'=>$unit[$i],'price'=>$price[$i],'total'=>$total[$i],'sdate'=>$today,'description'=>$description[$i]);
                $ins = $this->db->insert($table,$data);
                if($ins)
                {
                    $query = "UPDATE productmaster SET lstock = lstock-" . $stock[$i] . " WHERE prodid_='" . $prodid_[$i] . "'";
                    $this->db->query($query);
                }
            }
            //$query = "UPDATE barcodemaster SET lstock = lstock-" . $stock[$i] . " WHERE id='" . $bid[$i] . "'";
            //$this->db->query($query);
        }
        $this->db->trans_complete();
        return $this->input->post();
    }
    public function SaveRefund() {
        $today = date("Y-m-d");
        $this->db->trans_start();
        $shopid = $this->session->userdata("shopid");
        extract($this->input->post());
        $table = "`refund_" . date('Y', strtotime($today));
        for ($i = 0; $i < count($prodid_) - 1; $i++) {
            if($prodid_[$i] != '' && is_numeric($prodid_[$i]))
            {
                $data = array('shopid'=>$shopid,'prodid_'=>$prodid_[$i],'hsn'=>$hsn[$i],'prodname'=>$prodname[$i],'stock'=>$stock[$i],'stocktype'=>$unit[$i],'price'=>$price[$i],'total'=>$total[$i],'sdate'=>$today,'description'=>$description[$i]);
                $ins = $this->db->insert($table,$data);
                if($ins)
                {
                    $query = "UPDATE productmaster SET lstock = lstock+" . $stock[$i] . " WHERE prodid_='" . $prodid_[$i] . "'";
                    $this->db->query($query);
                }
            }
        }
        $this->db->trans_complete();
        return $this->input->post();
    }
    public function SavePurchase() {
        $shopid = $this->session->userdata("shopid");
        $this->db->trans_start();
        if($shopid==1){$pinvoice='PSC'.date('Ym');}else{$pinvoice='P';}
        $result = $this->db->get('purchaseid' . $shopid)->result();
       /* if (date('Y', strtotime($result[0]->date)) == date('Y')) {*/
            $pinvoice .= $result[0]->iid;
            $data = array('iid' => ($result[0]->iid + 1));
        /*} else {
            $pinvoice .= '1';
            $data = array('iid' => 1, 'date' => date('Y-m-d'));
        }*/
        $this->db->update('purchaseid' . $shopid, $data);
        extract($this->input->post());
        for ($i = 0; $i < count($wstock) - 1; $i++) {
            /*,'{$wstock[$i]}','{$dstock[$i]}'*/
            $ins_data = array('pinvoiceid'=>$pinvoice,/*'prodid'=>$prodid[$i],*/'prodid_'=>$prodid_[$i],'pprodname'=>$prodname[$i],'unit'=>$unit[$i],'price'=>$pprice[$i],'taxable'=>$taxable[$i],'total'=>$ptotal[$i],'discount'=>$discout[$i],'gst'=>$gsttype,'pgstper'=>$gstper[$i],'gstamount'=>$gtotal[$i]);
            $ins = $this->db->insert("purchasedetails_" . date('m_Y', strtotime($today)),$ins_data);
            $query = "UPDATE productmaster SET wstock=".$wstock[$i].",dstock=".$dstock[$i].",lstock=".$totalstock[$i].",totalstock=".$totalstock[$i].",uprice = '" . $sprice[$i] . "', pprice = '" . $pprice[$i] . "' WHERE prodid_='" . $prodid_[$i] . "'";
            $this->db->query($query);
        }
        $query = "INSERT INTO `purchasemaster_" . date('Y', strtotime($today)) . "` VALUES ('$pinvoice','{$shopid}','{$receipt}','{$customerid}','{$pttotal}','{$gttotal}','{$today}')";
        $this->db->query($query);
        $this->db->trans_complete();
        return $this->input->post();
    }

    public function UpdatePurchase() {
        $shopid = $this->session->userdata("shopid");
        $this->db->trans_start();
        extract($this->input->post());
        $pdetails = $this->db->where('pinvoiceid', $pinvoiceid)->get('purchasedetails_' . date('m_Y', strtotime($otoday)))->result();
        $this->db->where('pinvoiceid', $pinvoiceid)->delete('purchasedetails_' . date('m_Y', strtotime($otoday)));
        for ($i = 0; $i < count($wstock) - 1; $i++) {
            /*,'{$stock[$i]}','{$instock[$i]}',*/
            $ins_data = array('pinvoiceid'=>$pinvoiceid,/*'prodid'=>$prodid[$i],*/'prodid_'=>$prodid_[$i],'pprodname'=>$prodname[$i],'unit'=>$unit[$i],'price'=>$pprice[$i],'taxable'=>$taxable[$i],'total'=>$ptotal[$i],'discount'=>$discout[$i],'gst'=>$gsttype,'pgstper'=>$gstper[$i],'gstamount'=>$gtotal[$i]);
            $ins = $this->db->insert("purchasedetails_" . date('m_Y', strtotime($today)),$ins_data);
            $query = "UPDATE productmaster SET wstock=".$wstock[$i].",dstock=".$dstock[$i].",lstock=".$totalstock[$i].",totalstock=".$totalstock[$i].",uprice = '" . $sprice[$i] . "', pprice = '" . $pprice[$i] . "' WHERE prodid_='" . $prodid_[$i] . "'";
            $this->db->query($query);
        }
        $data = array('receipt' => $receipt, 'customerid	' => $customerid, 'amttotal' => $pttotal, 'taxtotal' => $gttotal, 'pdate' => $today);
        $this->db->where('pinvoiceid', $pinvoiceid)->update("`purchasemaster_" . date("Y", strtotime($otoday)) . "`", $data);
       
        /*foreach ($pdetails as $mysdata) {
            $txt = $mysdata->stock * $mysdata->instock;
            $this->db->query("UPDATE productmaster SET stock = stock-" . $txt . ", rstock = rstock-" . $txt . " WHERE prodid_='" . $mysdata->prodid_ . "'");
        }*/
        $this->db->trans_complete();
        return TRUE;        
    }

    function Savedebitnote() {
        $shopid = $this->session->userdata("shopid");
        $this->db->trans_start();
         if($shopid==1){$dinvoice='DSC'.date('Ym');}else{$dinvoice='D';}
        $result = $this->db->get('debitid' . $shopid)->result();
        /*if (date('Y', strtotime($result[0]->date)) == date('Y')) {*/
            $dinvoice .=  $result[0]->iid;
            $data = array('iid' => ($result[0]->iid + 1));
        /* } else {
            $dinvoice .= '1';
            $data = array('iid' => 1, 'date' => date('Y-m-d'));
        }*/
        $this->db->update('debitid' . $shopid, $data);
        extract($this->input->post());
        for ($i = 0; $i < count($wstock); $i++) {
             $query = "INSERT INTO `debitnotedetailsmaster_" . date('Y', strtotime($today)) . "` VALUES (NULL,'{$dinvoice}','{$prodid[$i]}','{$prodid_[$i]}','{$prodname[$i]}',0,0,'{$wstock[$i]}','{$dstock[$i]}','{$unit[$i]}','{$pprice[$i]}','{$ptotal[$i]}','{$discout[$i]}','{$gsttype}','{$gstper[$i]}','{$gtotal[$i]}')";
            $this->db->query($query);
            $query = "UPDATE productmaster SET wstock=wstock-" . $wstock[$i]. ",dstock=dstock-" . $dstock[$i] . " WHERE prodid_='" . $prodid_[$i] . "'";
            $this->db->query($query);
        }
        $query = "INSERT INTO `debitnotemaster_" . date('Y', strtotime($today)) . "` VALUES ('$dinvoice','$pinvoiceid','{$shopid}','{$receipt}','{$customerid}','{$pttotal}','{$gttotal}','{$pdate}')";
        $this->db->query($query);
        $this->db->trans_complete();
        return $this->input->post();
    }

    function n_to_w($number) {
        $no = round($number);
        $point = round($number - $no, 2) * 100;
        $hundred = null;
        $digits_1 = strlen($no);
        $i = 0;
        $str = array();
        $words = array('0' => '', '1' => 'One', '2' => 'Two',
            '3' => 'Three', '4' => 'Four', '5' => 'Five', '6' => 'Six',
            '7' => 'Seven', '8' => 'Eight', '9' => 'Nine',
            '10' => 'Ten', '11' => 'Eleven', '12' => 'Twelve',
            '13' => 'Thirteen', '14' => 'Fourteen',
            '15' => 'Fifteen', '16' => 'Sixteen', '17' => 'Seventeen',
            '18' => 'Eighteen', '19' => 'Nineteen', '20' => 'Twenty',
            '30' => 'Thirty', '40' => 'Forty', '50' => 'Fifty',
            '60' => 'Sixty', '70' => 'Seventy',
            '80' => 'Eighty', '90' => 'Ninety');
        $digits = array('', 'Hundred', 'Thousand', 'Lakh', 'Crore');
        while ($i < $digits_1) {
            $divider = ($i == 2) ? 10 : 100;
            $number = floor($no % $divider);
            $no = floor($no / $divider);
            $i += ($divider == 10) ? 1 : 2;
            if ($number) {
                $plural = (($counter = count($str)) && $number > 9) ? '' : null;
                $hundred = ($counter == 1 && $str[0]) ? ' and ' : null;
                $str [] = ($number < 21) ? $words[$number] .
                        " " . $digits[$counter] . $plural . " " . $hundred :
                        $words[floor($number / 10) * 10]
                        . " " . $words[$number % 10] . " "
                        . $digits[$counter] . $plural . " " . $hundred;
            } else
                $str[] = null;
        }
        $str = array_reverse($str);
        $result = implode('', $str);
        if ($point == 0) {
            $paise = '';
            $points = '';
        } else {
            $paise = "Paise";
            $points = ($point) ?
                    "." . $words[$point / 10] . " " .
                    $words[$point = $point % 10] : '';
        }
        return($result . "Rupees  " . $points . " " . $paise);
    }

}
