<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class GstExcel extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('gstexcelmodel');
        $login = $this->session->userdata('supercredential');
        if (!$login) {
            redirect(site_url('login'), 'refresh');
        }
    }

    public function Gst_Excel() {
        $this->load->view('header');
        $this->load->view('gst-excel');
        $this->load->view('footer');
    }

    public function Btobgstexcel() {
        $filename = "B2B-" . date('Y-'.$this->uri->segment(2)) . ".xls";
        header("Content-Type: application/vnd.ms-excel");
        header("Content-Disposition: attachment; filename=\"$filename\"");
        $excbody = ''; $valttl = ''; $ivttl=0;$cuttl=1;$rw='';      
        $lists = $this->gstexcelmodel->Salesbtblist(date("Y-".$this->uri->segment(2)."-d"), "gstin <> ''");
        $total0 = 0;
        $total3 = 0;
        $total5 = 0;
        $total12 = 0;
        $total18 = 0;
        $total28 = 0;
        $custid = $lists[0]->gstin;
        $invoiceid = $lists[0]->invoiceid;
        foreach ($lists as $list) {            
            if ($invoiceid != $list->invoiceid) {
                 if ($custid != $list->gstin) {$cuttl++;}
                if ($total0 > 0) { $valttl+=$total0;$ivttl++;
                    $excbody.=$rw."<td>0.00</td><td>" . round($total0,2) . "</td><td></td></tr>";
                }
                if ($total3 > 0) {$valttl+=$total3;$ivttl++;
                    $excbody.=$rw."</td><td>3.00</td><td>" .  round($total3,2) . "</td><td></td></tr>";
                }
                if ($total5 > 0) { $valttl+=$total5;$ivttl++;
                    $excbody.=$rw."<td>5.00</td><td>" .  round($total5,2) . "</td><td></td></tr>";
                }                
                if ($total12 > 0) { $valttl+=$total12;$ivttl++;
                    $excbody.=$rw."</td><td>12.00</td><td>" .  round($total12,2) . "</td><td></td></tr>";
                }
                if ($total18 > 0) {$valttl+=$total18;$ivttl++;
                    $excbody.=$rw."<td>18.00</td><td>" .  round($total18,2) . "</td><td></td></tr>";
                }
                if ($total28 > 0) {$valttl+=$total28;$ivttl++;
                    $excbody.=$rw."<td>28.00</td><td>" .  round($total28,2). "</td><td></td></tr>";
                }
                $total0 = 0;
                $total5 = 0;
                $total12 = 0;
                $total18 = 0;
                $total28 = 0;
                $rw=''; 
            }
            switch ($list->bgstper) {
                case 0 :$total0 +=$list->prodttotal+$list->gstamount;
                    break;
                case 3 :$total3 +=$list->prodttotal+$list->gstamount;
                    break;
                case 5 : $total5 +=$list->prodttotal+$list->gstamount;
                    break;
                case 12 : $total12 +=$list->prodttotal+$list->gstamount;
                    break;
                case 18 : $total18 +=$list->prodttotal+$list->gstamount;
                    break;
                case 28 : $total28 +=$list->prodttotal+$list->gstamount;
                    break;
                default : '';
            }
            $rw="<tr><td>" . $list->gstin . "</td><td>" . $list->invoiceid . "</td><td>" . date('d-M-Y', strtotime($list->invoice_date)) . "</td><td>" . ($list->taxamount + $list->total_amount) . "</td><td>" . $list->scode . "</td><td>N</td><td>Regular</td><td></td>";
            $invoiceid = $list->invoiceid;
        }
        if ($custid != $list->gstin) {$cuttl++;}
        if ($total0 > 0) { $valttl+=$total0;$ivttl++;
            $excbody.=$rw."<td>0.00</td><td>" .  round($total0,2) . "</td><td></td></tr>";
        }
         if ($total3 > 0) { $valttl+=$total3;$ivttl++;
            $excbody.=$rw."<td>3.00</td><td>" .  round($total3,2) . "</td><td></td></tr>";
        }
        if ($total5 > 0) {$valttl+=$total5;$ivttl++;
            $excbody.=$rw."<td>5.00</td><td>" .  round($total5,2) . "</td><td></td></tr>";
        }
        if ($total12 > 0) { $valttl+=$total12;$ivttl++;
            $excbody.=$rw."<td>12.00</td><td>" .  round($total12,2) . "</td><td></td></tr>";
        }
        if ($total18 > 0) { $valttl+=$total18;$ivttl++;
            $excbody.=$rw."<td>18.00</td><td>" .  round($total18,2) . "</td><td></td></tr>";
        }
        if ($total28 > 0) {$valttl+=$total28;$ivttl++;
            $excbody.=$rw."<td>28.00</td><td>" .  round($total28,2) . "</td><td></td></tr>";
        }
       
        $exc = "<table border='1'><thead>
            <tr><th>No. of Recipients</th><th>No. of Invoices</th><th></th><th>Total Invoice Value</th><th></th><th></th><th></th><th></th><th></th><th>Total Taxable Value</th><th>Total Cess</th></tr>
                <tr><th>".$cuttl."</th><th>".$ivttl."</th><th></th><th>".round($valttl,2)."</th><th></th><th></th><th></th><th></th><th></th><th>".round($valttl,2)."</th><th>0</th></tr>
            <tr><th>GSTIN/UIN of Recipient</th><th>Invoice Number</th><th>Invoice date</th><th>Invoice Value</th><th>Place Of Supply</th><th>Reverse Charge</th><th>Invoice Type</th><th>E-Commerce GSTIN</th><th>Rate</th><th>Taxable Value</th><th>Cess Amount</th></tr></thead><tbody>";
        $exc.=$excbody . '</tbody></table><style>table,tr,td,th{border:1px solid #000;border-collapse: collapse;}</style>';
        echo $exc;
    }

    public function Btocsgstexcel() {
       $filename = "B2CS-" . date('Y-'.$this->uri->segment(2)) . ".xls";
        header("Content-Type: application/vnd.ms-excel");
        header("Content-Disposition: attachment; filename=\"$filename\"");
        $excbody = ''; $valttl = '';$rw='';      
        $lists = $this->gstexcelmodel->Salesbtcslist(date("Y-".$this->uri->segment(2)."-d"), "gstin = ''");
        $rw="<tr><td>OE</td><td>" . $lists[0]->scode . "</td>";
         foreach ($lists as $list) {
             if($list->total){
              $valttl+=$list->total;
              $excbody.=$rw."<td>".$list->bgstper."</td><td>" .  round($list->total,2) . "</td><td>0</td><th></th></tr>";
             }
         }              
        $exc = "<table border='1'><thead><th></th><th></th><th></th><th>Total Taxable Value</th><th>Total Cess</th><th></th></tr><tr><th></th><th></th><th></th><th>".round($valttl,2)."</th><th>0</th><th></th></tr>
            <tr><th>Type</th><th>Place Of Supply</th><th>Rate</th><th>Taxable Value</th><th>Cess Amount</th><th>E-Commerce GSTIN</th></tr></thead><tbody>";
        $exc.=$excbody . '</tbody></table><style>table,tr,td,th{border:1px solid #000;border-collapse: collapse;}</style>';
        echo $exc;
    }

    public function Btoclgstexcel() {
        $filename = "B2CS-" . date('Y-'.$this->uri->segment(2)) . ".xls";
        header("Content-Type: application/vnd.ms-excel");
        header("Content-Disposition: attachment; filename=\"$filename\"");
        $excbody = '';
        $exc = "<table border='1'><thead><tr><th>GSTIN/UIN of Recipient</th><th>Invoice Number</th><th>Invoice date</th><th>Invoice Value</th><th>Place Of Supply</th><th>Reverse Charge</th><th>Invoice Type</th><th>E-Commerce GSTIN</th><th>Rate</th><th>Taxable Value</th><th>Cess Amount</th></tr></thead><tbody>";
        $lists = $this->gstexcelmodel->Salesbtcslist(date("Y-".$this->uri->segment(2)."-d"), "gstin =''");
        
        
        $this->load->view('exceldownload');
    }
     public function Purchaselistexcel() {
        $filename = "Purchase-" . date('Y-'.$this->uri->segment(2)) . ".xls";
        header("Content-Type: application/vnd.ms-excel");
        header("Content-Disposition: attachment; filename=\"$filename\"");
        $excbody = ''; $valttl = ''; $ivttl=0;$cuttl=1;$rw='';      
        $lists = $this->gstexcelmodel->Purchaselist(date("Y-".$this->uri->segment(2)."-d"), "gstin <> ''");
        $total0 = 0;
        $total3 = 0;
        $total5 = 0;
        $total12 = 0;
        $total18 = 0;
        $total28 = 0;
        $gsttoal =0;
        $custid = $lists[0]->gstin;
        $invoiceid = $lists[0]->pinvoiceid;
        foreach ($lists as $list) {            
            if ($invoiceid != $list->pinvoiceid) {
                 if ($custid != $list->gstin) {$cuttl++;}
                if ($total0 > 0) { $valttl+=$total0;$ivttl++;
                    $excbody.=$rw."<td>0.00</td><td>" . round($total0,2) . "</td><td></td></tr>";
                }
                if ($total3 > 0) {$valttl+=$total3;$ivttl++;
                    $excbody.=$rw."</td><td>3.00</td><td>" .  round($total3,2) . "</td><td></td></tr>";
                }
                if ($total5 > 0) { $valttl+=$total5;$ivttl++;
                    $excbody.=$rw."<td>5.00</td><td>" .  round($total5,2) . "</td><td></td></tr>";
                }                
                if ($total12 > 0) { $valttl+=$total12;$ivttl++;
                    $excbody.=$rw."</td><td>12.00</td><td>" .  round($total12,2) . "</td><td></td></tr>";
                }
                if ($total18 > 0) {$valttl+=$total18;$ivttl++;
                    $excbody.=$rw."<td>18.00</td><td>" .  round($total18,2) . "</td><td></td></tr>";
                }
                if ($total28 > 0) {$valttl+=$total28;$ivttl++;
                    $excbody.=$rw."<td>28.00</td><td>" .  round($total28,2). "</td><td></td></tr>";
                }
                $total0 = 0;
                $total5 = 0;
                $total12 = 0;
                $total18 = 0;
                $total28 = 0;
                
                
                $rw=''; 
            }
            switch ($list->gstper) {
                case 0 :$total0 +=$list->total-$list->gstamount;
                    $gsttoal+=$list->gstamount;
                    break;
                case 3 :$total3 +=$list->total-$list->gstamount;
                    $gsttoal+=$list->gstamount;
                    break;
                case 5 : $total5 +=$list->total-$list->gstamount;
                    $gsttoal+=$list->gstamount;
                    break;
                case 12 : $total12 +=$list->total-$list->gstamount;
                    $gsttoal+=$list->gstamount;
                    break;
                case 18 : $total18 +=$list->total-$list->gstamount;
                    $gsttoal+=$list->gstamount;
                    break;
                case 28 : $total28 +=$list->total-$list->gstamount;
                    $gsttoal+=$list->gstamount;
                    break;
                default : '';
            }
            $rw="<tr><td>" . $list->gstin . "</td><td>" . $list->pinvoiceid . "</td><td>" . date('d-M-Y', strtotime($list->pdate)) . "</td><td>" . ($list->amttotal) . "</td><td>" . $list->scode . "</td><td>N</td><td>Regular</td><td></td>";
            $invoiceid = $list->pinvoiceid;
        }
        if ($custid != $list->gstin) {$cuttl++;}
        if ($total0 > 0) { $valttl+=$total0;$ivttl++;
            $excbody.=$rw."<td>0.00</td><td>" .  round($total0,2) . "</td><td></td></tr>";
        }
         if ($total3 > 0) { $valttl+=$total3;$ivttl++;
            $excbody.=$rw."<td>3.00</td><td>" .  round($total3,2) . "</td><td></td></tr>";
        }
        if ($total5 > 0) {$valttl+=$total5;$ivttl++;
            $excbody.=$rw."<td>5.00</td><td>" .  round($total5,2) . "</td><td></td></tr>";
        }
        if ($total12 > 0) { $valttl+=$total12;$ivttl++;
            $excbody.=$rw."<td>12.00</td><td>" .  round($total12,2) . "</td><td></td></tr>";
        }
        if ($total18 > 0) { $valttl+=$total18;$ivttl++;
            $excbody.=$rw."<td>18.00</td><td>" .  round($total18,2) . "</td><td></td></tr>";
        }
        if ($total28 > 0) {$valttl+=$total28;$ivttl++;
            $excbody.=$rw."<td>28.00</td><td>" .  round($total28,2) . "</td><td></td></tr>";
        }
       
        $exc = "<table border='1'><thead>
            <tr><th>No. of Recipients</th><th>No. of Invoices</th><th></th><th>Total Invoice Value</th><th></th><th></th><th></th><th></th><th></th><th>Total Taxable Value</th><th>Total Cess</th></tr>
                <tr><th>".$cuttl."</th><th>".$ivttl."</th><th></th><th>".round($valttl+$gsttoal,2)."</th><th></th><th></th><th></th><th></th><th></th><th>".round($valttl,2)."</th><th>0</th></tr>
            <tr><th>GSTIN/UIN of Recipient</th><th>Invoice Number</th><th>Invoice date</th><th>Invoice Value</th><th>Place Of Supply</th><th>Reverse Charge</th><th>Invoice Type</th><th>E-Commerce GSTIN</th><th>Rate</th><th>Taxable Value</th><th>Cess Amount</th></tr></thead><tbody>";
        $exc.=$excbody . '</tbody></table><style>table,tr,td,th{border:1px solid #000;border-collapse: collapse;}</style>';
        echo $exc;
    }


}
