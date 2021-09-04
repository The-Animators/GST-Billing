<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Adminmodel extends CI_Model {

    public function __construct() {
        parent::__construct();
        $this->load->model('mailmodel');
        $this->load->model('uploader');
    }
    public function NewCustomer() {
        $this->db->insert('customermaster', $this->input->post());
    }
    
    public function switchcompany() {
        $this->session->set_userdata("shopid", $this->input->post('compid'));
        $this->session->set_userdata("shopname", $this->db->where("shopid", $this->input->post('compid'))->get('shopmaster')->row()->shopname);
    }

    public function UpdateCustomer() {
        $this->db->where('customerid', $this->input->post('customerid'))->update('customermaster', $this->input->post());
    }

    public function AdvancePayment() {
        extract($this->input->post());
        $shopid = $this->session->userdata("shopid");
        $this->db->set('advance', 'advance+' . $advance, FALSE)->where('customerid', $custid)->update('customermaster');
        $this->db->insert('advancmaster_' . date('Y'), array('custid' => $custid, 'shopid' => $shopid, 'credit' => $advance, 'date' => date('Y-m-d')));
    }

    public function updatecard() {
        $this->db->where('custid', base64_decode(urldecode($this->uri->segment(2))))->update('cardmaster', $this->input->post());
    }

    public function NewEmployee() {
        extract($this->input->post());
        $pwd = $this->randomPassword();
        $password = md5($pwd);
        $date = date('Y-m-d');
        $data = array('fname' => $fname, 'lname' => $lname, 'gender' => $gender, 'dob' => $dob, 'salary' => $salary, 'mobile' => $mobile, 'emails' => $email, 'joindate' => $joindate, 'shopid' => $shopid, 'status' => '1');
        if ($this->db->insert("`employeemaster`", $data)) {
            $userid = $this->db->insert_id();
            $data = array('userid' => $userid, 'line1' => $address1, 'line2' => $address2, 'city' => $city, 'state' => $state, 'country' => $country, 'pin' => $pincode);
            $this->db->insert("`addressmaster`", $data);
            $path = 'images/users/';
            $rt = $this->uploader->do_upload('pic', $userid . '.jpg', $path);
            $this->session->set_userdata("imgsession", $path . $userid . '.jpg');
            $message = 'Dear ' . $fname . ' ' . $lname . '
                    Your Registration is Complate                   
                    Tanks You for Registration';
            $this->mailmodel->sendMail($message, $email, 'Congratulation for Registration......!!!');
        }
    }

    public function UpdateEmployee() {
        extract($this->input->post());
        $data = array('lname' => $lname, 'fname' => $fname, 'gender' => $gender, 'salary' => $salary, 'mobile' => $mobile, 'emails' => $email, 'shopid' => $shopid, 'dob' => $dob, 'joindate' => $joindate);
        $this->db->where('userid', $username)->update('employeemaster', $data);
        $data = array('line1' => $address1, 'line2' => $address2, 'city' => $city, 'state' => $state, 'country' => $country, 'pin' => $pincode);
        $this->db->where('userid', $username)->update('addressmaster', $data);
    }

    public function Addsalary() {
        $var = 0;
        extract($this->input->post());
        $date = date('Y-' . $month . '-d');
        $sal = $this->db->like('date', date("Y-" . $month), 'after')
                        ->get('salarymaster')->result();
        if (!count($sal) > 0) {
            for ($i = 0; $i < count($userid); $i++) {

                $data = array('userid' => $userid[$i], 'esalary' => $esalary[$i], 'asalary' => $salary[$i], 'date' => $date);
                $this->db->insert("salarymaster", $data);
                $var = 1;
            }
        } else {
            for ($i = 0; $i < count($userid); $i++) {
                if (count($this->db->where('userid', $userid[$i])->like('date', date("Y-m", strtotime($date)), 'after')->get('salarymaster')->result())) {
                    $data = array('esalary' => $esalary[$i], 'asalary' => $salary[$i], 'date' => $date);
                    $this->db->where('userid', $userid[$i])
                            ->like('date', date("Y-" . $month), 'after')
                            ->update("salarymaster", $data);
                    $var = 1;
                } else {
                    $data = array('userid' => $userid[$i], 'esalary' => $esalary[$i], 'asalary' => $salary[$i], 'date' => $date);
                    $this->db->insert("salarymaster", $data);
                }
            }
        }
        return $var;
    }

    public function savebank() {
        $this->db->insert('bankmaster', $this->input->post());
        $bankid = $this->db->insert_id();
        extract($this->input->post());
        $data = array('date' => $date, 'bankid' => $bankid, 'byname' => 'Self Opening Balance', 'transtype' => 'Cash', 'transdetails' => 'Bank Opening Balance', 'amount' => $balacne, 'amtype' => $baltype, 'balance' => $balacne);
        $this->db->insert('transactionmaster_' . date('Y'), $data);
    }

    public function updatebank() {
        extract($this->input->post());
        $data = array('date' => $date, 'bankname' => $bankname, 'branch' => $branch, 'acno' => $acno, 'acname' => $acname, 'ifsccode' => $ifsccode, 'companyid' => $companyid);
        return $this->db->where('bankid', $balacne)->update('bankmaster', $data);
    }

    public function newtransaction() {
        extract($this->input->post());
        $bak = $this->db->where('bankid', $bankid)->get('bankmaster')->result();
        if ($bak[0]->baltype == $amtype) {
            $balacne = $amount + $bak[0]->balacne;
        } else {
            $balacne = $bak[0]->balacne - $amount;
        }
        $data = array('date' => $trnsdate, 'bankid' => $bankid, 'byname' => $byname, 'transtype' => $transtype, 'transdetails' => $transdetails, 'amount' => $amount, 'amtype' => $amtype, 'balance' => $balacne);
        $this->db->insert('transactionmaster_' . date('Y'), $data);
        $data = array('balacne' => $balacne);
        $this->db->where('bankid', $bankid)->update('bankmaster', $data);
    }

    public function DeleteEmployee() {
        $this->db->where('userid', base64_decode(urldecode($this->uri->segment(2))))->Delete('employeemaster');
        $this->db->where('userid', base64_decode(urldecode($this->uri->segment(2))))->Delete('addressmaster');
    }

    function randomPassword() {
        $alphabet = 'abcdefghijklmnopqrstuvwxyz@#$%&1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $pass = array(); //remember to declare $pass as an array
        $alphaLength = strlen($alphabet) - 1; //put the length -1 in cache
        for ($i = 0; $i < 8; $i++) {
            $n = rand(0, $alphaLength);
            $pass[] = $alphabet[$n];
        }
        return implode($pass); //turn the array into a string
    }

    public function NewShop() {
        extract($this->input->post());
        $query = "INSERT INTO `shopmaster` VALUES ('','{$name}','','{$address1}','{$address2}','{$phone}','{$city}','{$state}','{$country}','{$pincode}','{$gstin}','{$pan}','{$capital}')";
        $this->db->query($query);
        $id = $this->db->insert_id();
        $sqls = explode(';', $this->mailmodel->nshop($id));
        array_pop($sqls);
        foreach ($sqls as $statement) {
            $statment = $statement . ";";
            $this->db->query($statement);
        }
    }

    public function UpdateShop() {
        extract($this->input->post());
        $data = array('shopname' => $name, 'phone' => $phone, 'shopline1' => $address1, 'shopline2' => $address2, 'shopcity' => $city, 'shopstate' => $state, 'capital' => $capital, 'shopcountry' => $country, 'shoppin' => $pincode, 'sgstin' => $gstin, 'pan' => $pan);
        $this->db->where('shopid', $shopid)->update('shopmaster', $data);
    }

    public function NewExpanse() {
        extract($this->input->post());
        if($exptype=='New'){
             $this->db->insert('exptypemaster', array('exptype'=>strtoupper ($exptypes)));
             $exptype = $this->db->insert_id(); 
        }
        $this->db->insert('expancemaster', array('amount'=>$amount, 'date'=>$date, 'description'=>$description, 'eptype'=>$exptype));
    }

    public function UpdateExpanse() {
        extract($this->input->post());
        if($exptype=='New'){
             $this->db->insert('exptypemaster', array('exptype'=>strtoupper ($exptypes)));
             $exptype = $this->db->insert_id(); 
        }
        $this->db->where('id', base64_decode(urldecode($this->uri->segment(2))))->update('expancemaster', array('amount'=>$amount, 'date'=>$date, 'description'=>$description, 'eptype'=>$exptype));
    }

    public function DeleteExpanse() {
        $this->db->where('id', base64_decode(urldecode($this->uri->segment(2))))->Delete('expancemaster');
    }

    public function updategst() {
        $this->db->where('id', 1)->update('gstsetting', $this->input->post());
    }

}
