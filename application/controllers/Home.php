<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {
    public $terminal_id;
    public function __construct() {
        parent::__construct();
        $this->load->model('select');
        $this->load->model('productmodel');
        $this->load->library('zend');
        $this->zend->load('Zend/Barcode');
        $this->load->model('adminmodel');
        $this->load->model('loginmodel');
        $this->load->helper('cookie');
        if(!get_cookie('terminal_id'))
        {
            $this->loginmodel->logout();
            $this->session->set_userdata("result",'Terminal Setup Is Not Done!');
            redirect(site_url('login'));
            exit;
        }
        $this->session->set_userdata('terminal_id',get_cookie('terminal_id'));
        $this->terminal_id = get_cookie('terminal_id');
        $sql = array();
        /*$sql[] = "CREATE TABLE IF NOT EXISTS `refundmaster_2019` (
              `id` int(11) NOT NULL AUTO_INCREMENT,
              `refund_id` varchar(100) NOT NULL,
              `shop_id` int(11) NOT NULL,
              `refund_by` varchar(25) NOT NULL,
              `refund_total` decimal(10,0) NOT NULL,
              `refund_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
              PRIMARY KEY (`id`)
            ) ENGINE=MyISAM DEFAULT CHARSET=utf8;";
        $sql[] = "CREATE TABLE IF NOT EXISTS `refunddetailsmaster_2019` (
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
            ) ENGINE=MyISAM DEFAULT CHARSET=utf8;";*/
            /*$sql[] = "ALTER TABLE `sundry_2019` CHANGE `prodid` `prodid` VARCHAR(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL;";
            $sql[] = "ALTER TABLE `sundry_2019` ADD `prodid_` INT NOT NULL AFTER `prodid`;";*/
        /*$sql[] = "INSERT INTO `loginmaster` (`username`, `password`, `name`, `mixup`, `role`) VALUES ('counter', 'ec4e862906cc5517f45f11085a7d977d', 'Cash Counter', '8cdffdba4a65e8c5801b465b7d4b6679e20e28995af646eff0fa64834a6d9b81271375ac539b3ba0b2af68947dd91086326d84b1cd81f3246b3846e887f09bfa10ifWnJIpBTCX/PuKqlZRYuTrDEm8POIcj8qJveGx6OtDrnNkFkoieQWhd6Rh17O', '2');";
        $sql[] = "ALTER TABLE `salesmaster_2019` ADD `discount` DECIMAL NOT NULL DEFAULT '0' AFTER `total_amount`, ADD `total_payable` DECIMAL NOT NULL DEFAULT '0' AFTER `discount`;";*/
        /*$sql[]= "ALTER TABLE `purchasedetails_12_2019` ADD `added_on` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER `gstamount`;";
        $sql[] = "ALTER TABLE `salesdetailsmaster_12_2019` ADD `added_on` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER `gstamount`;";*/
        if(!empty($sql))
        {
            foreach ($sql as $key => $query) {
                $res = $this->db->query($query);
            }
        }

        $login = $this->session->userdata('supercredential');
        if (!$login) {
            redirect(site_url('login'), 'refresh');
        }
    }

    public function logout() {
        $this->loginmodel->logout();
        redirect('', 'refresh');
    }

    public function dashboard() {
        $data['lists'] = $this->select->dashboard();
        $this->load->view('header', $data);
        $this->load->view('index');
        $this->load->view('footer');
    }

    public function GenerateInvoice() {
        header('Content-type: text/plain');
        header('Content-type: application/json');
        echo json_encode($this->select->productblistall());
    }

    public function getinvoice_list() {
        header('Content-type: text/plain');
        header('Content-type: application/json');
        echo json_encode($this->select->salesList(date("Y-m-1"), date("Y-m-d"), "", ''));
    }
    public function customerlists() {
        header('Content-type: application/json');
        echo json_encode($this->select->customerlist());
    }

    public function Generate_Invoice() {
        $data['clists'] = $this->select->customerlist();
        $this->load->view('header', $data);
        $this->load->view('new-invoice');
        $this->load->view('footer');
    }

    public function Generate_Bill() {
        $data['clists'] = $this->select->customerlist();
        $this->load->view('header', $data);
        $this->load->view('new-bill');
        $this->load->view('footer');
    }

    public function Advance_Payment() {
        $this->adminmodel->advancepayment();
    }

    public function card_update() {
        if ($this->input->post()) {
            $this->adminmodel->updatecard();
            redirect('list-customer', 'refresh');
        }
        $data['tlists'] = $this->select->transectionlist();
        $data['lists'] = $this->select->cardDetails();
        $this->load->view('header', $data);
        $this->load->view('update-card');
        $this->load->view('footer');
    }

    public function invoice_payment() {
        $data['lists'] = $this->select->customerprofiledetails();
        if ($this->uri->segment(3)) {

            $data['clists'] = $this->select->creditlist(base64_decode(urldecode($this->uri->segment(3))));
        } else {
            $data['clists'] = $this->select->creditlist('Unpaid');
        }
        $data['slists'] = $this->select->listbank();
        $this->load->view('header', $data);
        $this->load->view('invoice-payment');
        $this->load->view('footer');
    }

    public function invoicepayment() {
        $this->productmodel->invoicepayment();
        redirect('list-client', 'refresh');
    }

    public function List_expanse() {
        if ($this->uri->segment(2)) {
            $this->adminmodel->deleteexpanse();
        }
        $data['lists'] = $this->select->listexpanse();
        $this->load->view('header', $data);
        $this->load->view('list-expanse');
        $this->load->view('footer');
    }

    public function New_expanse() {
        if ($this->input->post()) {
            $this->adminmodel->newexpanse();
            redirect('new-expense', 'refresh');
        }
        $data['glists'] = $this->select->explist();
        $this->load->view('header', $data);
        $this->load->view('new-expanse');
        $this->load->view('footer');
    }

    public function update_expanse() {
        if ($this->input->post()) {
            $this->adminmodel->updateExpanse();
            redirect('list-expense', 'refresh');
        }
        $data['glists'] = $this->select->explist();
        $data['lists'] = $this->select->DetailsExpanse();
        $this->load->view('header', $data);
        $this->load->view('update-expanse');
        $this->load->view('footer');
    }

    public function Invoice() {
        $this->session->set_userdata("invoice", $this->input->post());
    }

    public function Save_Invoice() {
        header('Content-type: text/plain');
        header('Content-type: application/json');
        echo json_encode($this->productmodel->saveinvoice());
    }

    public function Print_invoice() {
        $data['glists'] = $this->select->gstsetting();
        $data['last'] = $this->select->lastinvoice();
        $data['ilists'] = $this->select->invoiceDetails($this->session->userdata("invoicesession"), strtotime($this->session->userdata("datesession")));
        $this->load->view('header', $data)->view('print-invoice')->view('footer');
    }

    public function prints_Invoice() {
        $data['glists'] = $this->select->gstsetting();
        $data['last'] = $this->select->lastinvoice();
        $data['ilists'] = $this->select->invoiceDetails(base64_decode(urldecode($this->uri->segment(2))), strtotime(base64_decode(urldecode($this->uri->segment(3)))));
        $this->load->view('header', $data)->view('print-invoice')->view('footer');
    }

    public function UpdateInvoice() {
        $this->session->set_userdata("mysession", $this->input->post());
    }

    public function Update_Invoice() {
        header('Content-type: text/plain');
        header('Content-type: application/json');
        echo json_encode($this->productmodel->updateinvoice());
    }
    public function Update_Bill_Invoice() {
        header('Content-type: text/plain');
        header('Content-type: application/json');
        echo json_encode($this->productmodel->updatebillinvoice());
    }

    public function Edit_Invoice() {
        $data['clists'] = $this->select->customerlist();
        $data['glists'] = $this->select->gstsetting();
        $data['ilists'] = $this->select->invoiceDetails(base64_decode(urldecode($this->uri->segment(2))), strtotime(base64_decode(urldecode($this->uri->segment(3)))));
        $this->load->view('header', $data)->view('edit-invoice')->view('footer');
    }

    public function Advance_Details() {
        header('Content-type: text/plain');
        header('Content-type: application/json');
        echo json_encode($this->select->cardAdvance());
    }

    public function GetCoupon() {
        header('Content-type: text/plain');
        header('Content-type: application/json');
        echo json_encode($this->select->getcoupon());
    }

    public function barcode_update() {
        if ($this->input->post('price')) {
            $barcode = $this->productmodel->updatebarcode();
            redirect('barcode-product/' . urlencode(base64_encode($barcode)), 'refresh');
        } else {
            $data['lists'] = $this->select->barcodeprint();
            $this->load->view('header', $data);
            $this->load->view('barcode-update');
            $this->load->view('footer');
        }
    }

    public function Barcode_Product() {
        $data['lists'] = $this->select->barcodeprint();
        $data['slists'] = $this->select->shopDetails();
        $this->load->view('barcode-product', $data);
    }

    public function barcode_details() {
        if ($this->input->post('price')) {
            $barcode = $data['lists'] = $this->productmodel->printsbarcode();
            redirect('barcode-product/' . urlencode(base64_encode($barcode)), 'refresh');
        } else {
            $data['lists'] = $this->select->productlist();
            $this->load->view('header', $data);
            $this->load->view('barcode-details', $data);
            $this->load->view('footer');
        }
    }

    public function List_Barcode() {
        $data['lists'] = $this->select->listbarcode();
        $this->load->view('header', $data);
        $this->load->view('list-barcode');
        $this->load->view('footer');
    }

    public function List_invoice() {
        $data['lists'] = $this->select->salesList(date("Y-m-1"), date("Y-m-d"));
        $this->load->view('header', $data);
        $this->load->view('list-invoice');
        $this->load->view('footer');
    }

    public function credit_note_invoice() {
        if ($this->input->post()) {
            $this->productmodel->creditnoteinvoice();
            redirect('view-credit-note', 'refresh');
        } else {
            $data['glists'] = $this->select->gstsetting();
            $data['ilists'] = $this->select->invoiceDetails(base64_decode(urldecode($this->uri->segment(2))), strtotime(base64_decode(urldecode($this->uri->segment(3)))));
            $this->load->view('header', $data);
            $this->load->view('credit-note-invoice');
            $this->load->view('footer');
        }
    }

    public function prints_credit_note() {
        $data['glists'] = $this->select->gstsetting();
        $data['ilists'] = $this->select->creditnoteDetails(base64_decode(urldecode($this->uri->segment(2))), strtotime(base64_decode(urldecode($this->uri->segment(3)))));
        $this->load->view('header', $data);
        $this->load->view('print-credit-note');
        $this->load->view('footer');
    }

    public function print_credit_note() {
        $data['glists'] = $this->select->gstsetting();
        $data['ilists'] = $this->select->creditnoteDetails($this->session->userdata("invoicesession"), strtotime(date('Y-m-d')));
        $this->load->view('header', $data);
        $this->load->view('print-credit-note');
        $this->load->view('footer');
    }

    public function credit_note_list() {
        $data['lists'] = $this->select->CreditSalesList(date("Y-m-1"), date("Y-m-d"), "", '');
        $this->load->view('header', $data);
        $this->load->view('credit-note-list');
        $this->load->view('footer');
    }
    
    public function refund_invoice() {
        $decoded_invoice_id = base64_decode(urldecode($this->uri->segment(2)));
        $decode_invoice_date = base64_decode(urldecode($this->uri->segment(3)));
        if ($this->input->post()) {
            $this->productmodel->saverefundinvoice();
            redirect('refund-list', 'refresh');
        } else {
            $data['glists'] = $this->select->gstsetting();
            $data['ilists'] = $this->select->invoiceDetails($decoded_invoice_id, strtotime($decode_invoice_date));
            $this->load->view('header', $data);
            $this->load->view('refund-invoice');
            $this->load->view('footer');
        }
    }
    public function prints_refund() {
        $decoded_id = base64_decode(urldecode($this->uri->segment(2)));
        $decoded_date = strtotime(base64_decode(urldecode($this->uri->segment(3))));
        $data['glists'] = $this->select->gstsetting();
        $data['ilists'] = $this->select->refundDetails($decoded_id,$decoded_date);
        $this->load->view('header', $data);
        $this->load->view('print-refund');
        $this->load->view('footer');
    }
    public function List_Customer() {
        $data['lists'] = $this->select->CustomerlistAll();
        $this->load->view('header', $data);
        $this->load->view('list-customer');
        $this->load->view('footer');
    }

    public function New_Customer() {
        $this->load->view('header');
        $this->load->view('new-customer');
        $this->load->view('footer');
    }

    public function NewCustomer() {
        $this->adminmodel->newcustomer();
        redirect('new-client', 'refresh');
    }

    public function Customer_Details() {
        header('Content-type: text/plain');
        header('Content-type: application/json');
        echo json_encode($this->select->customerdetails());
    }

    public function Update_Customer() {
        $data['lists'] = $this->select->customerprofiledetails();
        $this->load->view('header', $data);
        $this->load->view('update-customer');
        $this->load->view('footer');
    }

    public function UpdateCustomer() {
        $this->adminmodel->updatecustomer();
        redirect('list-client', 'refresh');
    }

    public function Delete_Customer() {
        $this->select->deletecustomer();
        redirect('list-client', 'refresh');
    }
    public function delete_invoice() {
        $this->productmodel->deleteinvoice();
        redirect('list-invoice', 'refresh');
    }

    public function New_Product() {
        if ($this->input->post()) {
            $this->productmodel->newProduct();
            redirect('new-product', 'refresh');
        }
        $data['slists'] = $this->select->stocktypelist();
        $data['lists'] = $this->select->productlistall();
        $data['glists'] = $this->select->gstper();
        $this->load->view('header', $data);
        $this->load->view('new-product');
        $this->load->view('footer');
    }

    public function Delete_Product() {
        $this->productmodel->deleteproduct();
        redirect('list-product', 'refresh');
    }

    public function List_Product() {
        $data['lists'] = $this->select->productlistall();
        $this->load->view('header', $data);
        $this->load->view('list-product');
        $this->load->view('footer');
    }

    public function Last_Product() {
        $data['lists'] = $this->select->notification();
        $this->load->view('header', $data);
        $this->load->view('list-product');
        $this->load->view('footer');
    }

    public function Prod_Details() {
        header('Content-type: text/plain');
        header('Content-type: application/json');
        echo json_encode($this->select->ProdDetails());
    }

    public function invoice_Prod_Details() {
        header('Content-type: text/plain');
        header('Content-type: application/json');
        echo json_encode($this->select->InvoiceProdDetails());
    }

    public function List_Purchase() {
        $data['lists'] = $this->select->purchaselist(date("Y-m-01"), date("Y-m-d"), '');
        $this->load->view('header', $data);
        $this->load->view('list-purchase');
        $this->load->view('footer');
    }

    public function purchase_report() {
        if ($this->input->post()) {
            $data['lists'] = $this->select->purchaselist($this->input->post('fromdate'), $this->input->post('todate'), $this->input->post('customerid'));
        } else {
            $data['lists'] = $this->select->purchaselist(date("Y-m-d"), date("Y-m-d"), '');
        }
        $data['total_purchase_amount'] = number_format($this->select->getPurchaseSum());
        $data['clists'] = $this->select->Venderlist();
        $this->load->view('header', $data);
        $this->load->view('purchase-report');
        $this->load->view('footer');
    }

    public function Purchase_Invoice() {
        $data['lists'] = $data['total_lists'] = $this->select->purchasedetails();
        if(!isset($data['lists']))
        {
            $arr_obj = (object)array('receipt'=>'asas','pdate'=>'','name'=>'','mobile'=>'','gstin'=>'','shopname'=>'','pinvoiceid'=>'','shopline1'=>'','shopline2'=>'','shopcity'=>'','shoppin'=>'','sgstin'=>'','amttotal'=>'');
            $data['lists'][] = $arr_obj;

        }
        $this->load->view('header', $data);
        $this->load->view('purchase-invoice');
        $this->load->view('footer');
    }

    public function Update_Product() {
        if ($this->input->post()) {
            $this->productmodel->updateproduct();
            redirect('list-product', 'refresh');
        }
        $data['slists'] = $this->select->stocktypelist();
        $data['plists'] = $this->select->productlist();
        $data['glists'] = $this->select->gstper();
        $this->load->view('header', $data);
        $this->load->view('update-product');
        $this->load->view('footer');
    }

    public function New_Purchase() {
        $data['clists'] = $this->select->Venderlist();
        $data['slists'] = $this->select->stocktypelist();
        $this->load->view('header', $data);
        $this->load->view('new-purchase');
        $this->load->view('footer');
    }

    public function Edit_Purchase() {
        $data['clists'] = $this->select->Venderlist();
        $data['slists'] = $this->select->stocktypelist();
        $data['lists'] = $this->select->purchasedetails();
        $this->load->view('header', $data);
        $this->load->view('edit-purchase');
        $this->load->view('footer');
    }

    public function Update_Purchase() {
        header('Content-type: text/plain');
        header('Content-type: application/json');
        echo json_encode($this->productmodel->UpdatePurchase());
    }

    public function Debit_Note_Invoice() {

        $data['lists'] = $this->select->purchasedetails();
        $this->load->view('header', $data);
        $this->load->view('debit-note-invoice');
        $this->load->view('footer');
    }

    public function DebitNoteInvoice() {
        $this->productmodel->Savedebitnote();
    }

    public function Debit_Note_view() {
        $data['lists'] = $this->select->debitnoteview();
        $this->load->view('header', $data);
        $this->load->view('debitnote-invoice');
        $this->load->view('footer');
    }

    public function Debit_Note_List() {
        $data['lists'] = $this->select->debitnotelist(date("Y-m-1"), date("Y-m-d"));
        $this->load->view('header', $data);
        $this->load->view('debit-note-list');
        $this->load->view('footer');
    }

    public function Purchase() {
        header('Content-type: text/plain');
        header('Content-type: application/json');
        echo json_encode($this->select->productblistpurchase());
    }

    public function Save_Purchase() {
        $this->productmodel->savepurchase();
    }

    public function List_Summary() {
        extract($this->input->post());
        if ($this->input->post()) {
            extract($this->input->post());
            $data['lists'] = $this->select->salesList($fromdate, $todate, $ptype, $cname,$terminal_id);
        } else {
            $data['lists'] = $this->select->salesList(date("Y-m-d"), date("Y-m-d"), "", '');
        }
        $data['clists'] = $this->select->customerlist();
        $data['total_sales_amount'] = number_format($this->select->getSalesSum());

        $this->load->view('header', $data);
        $this->load->view('list-sales-report');
        $this->load->view('footer');
    }

    public function New_Coupon() {
        $this->load->view('header');
        $this->load->view('new-coupon');
        $this->load->view('footer');
    }

    public function NewCoupon() {
        $this->productmodel->newCoupon();
        $code = $this->session->userdata("barcodesession");
        $file = Zend_Barcode::draw('code128', 'image', array('text' => $code, 'barHeight' => '30'), array('barHeight' => '30'));
        $store_image = imagejpeg($file, "images/coupon/{$code}.jpg");
        redirect('barcode-coupon', 'refresh');
    }

    public function Barcode_coupon() {
        $data['lists'] = 0;
        if ($this->input->post('barcode')) {
            $data['lists'] = $this->input->post('barcode');
        }
        $this->load->view('header', $data);
        $this->load->view('print-coupon');
        $this->load->view('footer');
    }

    public function List_Coupon() {
        $data['lists'] = $this->select->couponlist();
        $this->load->view('header', $data);
        $this->load->view('list-coupon');
        $this->load->view('footer');
    }

    public function Print_Coupon() {
        $data['lists'] = 0;
        if ($this->input->post('barcode')) {
            $data['lists'] = $this->input->post('barcode');
        }
        $this->load->view('header', $data);
        $this->load->view('prints-coupon');
        $this->load->view('footer');
    }

    public function Delete_Coupon() {
        $this->productmodel->deletecoupon();
        redirect('list-coupon', 'refresh');
    }

    public function Update_Coupon() {
        $data['lists'] = $this->select->coupondetails();
        $this->load->view('header', $data);
        $this->load->view('update-coupon');
        $this->load->view('footer');
    }

    public function UpdateCoupon() {
        $this->productmodel->updatecoupon();
        redirect('list-coupon', 'refresh');
    }

    public function New_Sundry() {
        $data['lists'] = $this->select->productblistall();
        $this->load->view('header', $data);
        $this->load->view('new-sundry');
        $this->load->view('footer');
    }
     public function sundry() {
        $this->session->set_userdata("sundry", $this->input->post());
    }

    public function Save_Sundry() {
        $this->productmodel->savesundry();
    }
    public function refund_list() {
        $data['lists'] = $this->select->RefundList(date("Y-m-1"), date("Y-m-d"), "", '');
        $this->load->view('header', $data);
        $this->load->view('refund-list');
        $this->load->view('footer');
    }
    public function New_Refund() {
        $data['lists'] = $this->select->productblistall();
        $this->load->view('header', $data);
        $this->load->view('new-refund');
        $this->load->view('footer');
    }
    public function Save_Refund() {
        $this->productmodel->SaveRefund();
    }
   

    public function List_Sales() {
        if ($this->input->post('fromdate')) {
            $data['lists'] = $this->select->sundrylist($this->input->post('fromdate'), $this->input->post('todate'));
        } else {
            $data['lists'] = $this->select->sundrylist(date("Y-m-1"), date("Y-m-d"));
        }
        $this->load->view('header', $data);
        $this->load->view('list-sales');
        $this->load->view('footer');
    }

    public function List_Sundry() {
        if ($this->input->post('fromdate')) {
            $data['lists'] = $this->select->sundrylist($this->input->post('fromdate'), $this->input->post('todate'));
        } else {
            $data['lists'] = $this->select->sundrylist(date("Y-m-1"), date("Y-m-d"));
        }
        $this->load->view('header', $data);
        $this->load->view('list-sundry');
        $this->load->view('footer');
    }

    public function Change_Password() {
        $this->load->view('header');
        $this->load->view('change-password');
        $this->load->view('footer');
    }
    public function edit_stock() {
        $post = $this->input->post();
        extract($post);
        $response = array('status'=>true);
        if($action == 'update')
        {
            $data = $post;
            unset($data['prodid_']);
            $res = $this->productmodel->updateProductStock($prodid_,$data);
            if(!$res)
            {
                $response['status'] = false;
                $response['msg'] = "Something went wrong!";
            }
        }
        else
        {
            $row = $this->select->productlist($post['id']);
            if($row)
            {
                $row = $row[0];
                $response['product'] = $row;
            }
            else
            {
                $response['status'] = false;
                $response['msg'] = "Product Not Found!";
            }
        }
        echo json_encode($response);
        
    }
    public function daily_stock_report() {
        $products = $this->select->productlistall();
        $daily_report_arr = $this->select->getDailyReport();
        if($products)
        {
            $products_arr = [];
            foreach ($products as $product) {
                $prodid_ = $product->prodid_;
                if(array_key_exists($prodid_, $daily_report_arr))
                {
                    $product->total_sell = $daily_report_arr[$prodid_]['sales'];
                    $product->total_purchase = $daily_report_arr[$prodid_]['purchase'];
                }
                $products_arr[$prodid_] = $product;
            }
        }
        $data['products'] = $products_arr;
        $this->load->view('header', $data);
        $this->load->view('daily-stock-report');
        $this->load->view('footer');
    }

}
