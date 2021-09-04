<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('select');
        $this->load->model('productmodel');
        $this->load->model('adminmodel');
        $this->load->model('balancesheet');
        $this->load->model('uploader');
        $login = $this->session->userdata('supercredential');
        if (!$login) {
            redirect(site_url('login'), 'refresh');
        }
    }

    public function Balance_Sheet() {
        $this->load->view('header');
        if ($this->input->post()) {
            extract($this->input->post());
            if ($tomonth == date('m')) {
                $data['slists'] = $this->select->shopDetails();
                $data['lists'] = $this->balancesheet->balancesheet(date('Y-' . $month . '-01'), date('Y-' . $tomonth . '-d'));
                $data['ilists'] = $this->balancesheet->balancemaster(date('Y-' . $month . '-01'), date('Y-' . $tomonth . '-d'));
                $data['elists'] = $this->balancesheet->balancesheetexp(date('Y-'.$month.'-01'), date('Y-m-d'));
                $this->load->view('balance-sheets', $data);
            } else {
                $data['slists'] = $this->select->shopDetails();
                $data['lists'] = $this->balancesheet->balancesheet(date('Y-' . $month . '-01'), date('Y-' . $tomonth . '-d'));
                $data['ilists'] = $this->balancesheet->balancemaster(date('Y-' . $month . '-01'), date('Y-' . $tomonth . '-d'));
                $data['elists'] = $this->balancesheet->balancesheetexp(date('Y-' . $month . '-01'), date('Y-' . $tomonth . '-d'));
                $this->load->view('balance-sheet', $data);
            }
        } else {
            $data['slists'] = $this->select->shopDetails();
            $data['lists'] = $this->balancesheet->balancesheet(date('Y-m-01'), date('Y-m-d'));
            $data['ilists'] = $this->balancesheet->balancemaster(date('Y-m-01'), date('Y-m-d'));
            $data['elists'] = $this->balancesheet->balancesheetexp(date('Y-m-01'), date('Y-m-d'));
            $this->load->view('balance-sheets', $data);
        }

        $this->load->view('footer');
    }

    public function Balance_prepar() {
        if ($this->input->post()) {
            $to = 'dashboard';
            if ($this->session->userdata("supercredential") == 2) {
                $to = 'generate-invoice';
            }
            if ($this->input->post('bal') == 'yes') {
                $this->balancesheet->balanceprepare();
                redirect($to, 'refresh');
            } else {
                redirect($to, 'refresh');
            }
        }
        $this->load->view('header');
        $this->load->view('balance-prepar');
        $this->load->view('footer');
    }

    public function New_Employee() {
        if ($this->input->post()) {
            $this->adminmodel->newemployee();
            redirect('crop-employee', 'refresh');
        }
        $data['lists'] = $this->select->shoplist();
        $this->load->view('header', $data);
        $this->load->view('new-employee');
        $this->load->view('footer');
    }

    public function List_Employee() {
        $data['lists'] = $this->select->employeelist();
        $data['slists'] = $this->select->employeesalary();
        $this->load->view('header', $data);
        $this->load->view('list-employee');
        $this->load->view('footer');
    }

    public function Crop_Employee() {
        $this->load->view('header');
        $this->load->view('cropimage');
        $this->load->view('footer');
    }

    public function CropEmployee() {
        $this->uploader->cropimage();
        redirect('new-employee', 'refresh');
    }

    public function add_salary() {
        echo $this->adminmodel->addsalary();
    }

    public function save_bank() {
        echo $this->adminmodel->savebank();
    }

    public function list_bank() {
        $data['lists'] = $this->select->listbank();
        $data['slists'] = $this->select->shoplist();
        $this->load->view('header', $data);
        $this->load->view('list-bank');
        $this->load->view('footer');
    }

    public function bank_details() {
        header('Content-type: application/json');
        echo json_encode($this->select->bankdetails($this->input->post('bankid')));
    }

    public function update_bank() {
        echo $this->adminmodel->updatebank();
    }

    public function New_Transaction() {
        if ($this->input->post()) {
            $this->adminmodel->newtransaction();
            redirect('new-transaction', 'refresh');
        }
        $data['lists'] = $this->select->listbank();
        $this->load->view('header', $data)->view('new-transaction')->view('footer');
    }

    public function Transaction_Report() {
        if ($this->input->post()) {
            $data['lists'] = $this->select->transactionreport();
        }
        $data['blists'] = $this->select->listbank();
        $this->load->view('header', $data)->view('transaction-report')->view('footer');
    }

    public function Transactions_Report() {
        /* if ($this->input->post()) {
          $this->adminmodel->newtransaction();
          redirect('new-transaction', 'refresh');
          } */
        $data['blists'] = $this->select->listbank();
        $data['lists'] = $this->select->transactionreport();
        $this->load->view('header', $data)->view('transaction-report')->view('footer');
    }

    public function Update_Employee() {
        $data['lists'] = $this->select->employeeprofile();
        $data['slists'] = $this->select->shoplist();
        $this->load->view('header', $data);
        $this->load->view('update-employee');
        $this->load->view('footer');
    }

    public function View_Employee() {
        $data['lists'] = $this->select->employeeprofile();
        $this->load->view('header', $data);
        $this->load->view('view-employee');
        $this->load->view('footer');
    }

    public function UpdateEmployee() {
        $this->adminmodel->updateemployee();
        redirect('list-employee', 'refresh');
    }

    public function Delete_Employee() {
        $this->adminmodel->deleteemployee();
        redirect('list-employee', 'refresh');
    }

    public function New_Shop() {
        $this->load->view('header');
        $this->load->view('new-shop');
        $this->load->view('footer');
    }

    public function List_Shop() {
        $data['lists'] = $this->select->shoplist();
        $this->load->view('header', $data);
        $this->load->view('list-shop');
        $this->load->view('footer');
    }

    public function List_company() {
        header('Content-type: text/plain');
        header('Content-type: application/json');
        echo json_encode($this->select->shoplist());
    }

    public function Count_stock() {
        header('Content-type: text/plain');
        header('Content-type: application/json');
        echo json_encode($this->select->LowStockAlertCount());
    }


    public function switch_company() {
        $this->adminmodel->switchcompany();
    }

    public function NewShop() {
        $this->adminmodel->newshop();
        redirect('new-shop', 'refresh');
    }

    public function Update_Shop() {
        $data['lists'] = $this->select->shopprofile();
        $this->load->view('header', $data);
        $this->load->view('update-shop');
        $this->load->view('footer');
    }

    public function UpdateShop() {
        $this->adminmodel->updateshop();
        redirect('list-shop', 'refresh');
    }

    public function Notification() {
        // set text compatible IE7, IE8
        header('Content-type: text/plain');
        // set json non IE
        header('Content-type: application/json');
        echo json_encode($this->select->notification());
    }

    public function Gst_Setting() {
        if ($this->input->post()) {
            $this->adminmodel->updategst();
            redirect('gst-setting', 'refresh');
        }
        $data['lists'] = $this->select->gstsetting();
        $this->load->view('header', $data);
        $this->load->view('gst-setting');
        $this->load->view('footer');
    }

}
