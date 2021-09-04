<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Loginmodel extends CI_Model {

    public function __construct() {
        parent::__construct();
        $this->load->model('mailmodel');
        $this->load->model('select');
    }

    public function login() {
        $this->dbfunction();
        $returnval = 0;
        extract($this->input->post());
        $password = md5($password);
        $query = $this->db->query("SELECT * FROM `loginmaster` WHERE `username`='$username'");
        $row = $query->row_array();
        ob_start();
        system('ipconfig /all');
        $mycomsys = ob_get_contents();
        ob_clean();
      //  $result = $this->mailmodel->dpcd($row, substr($mycomsys, (strpos($mycomsys, "Physical") + 36), 17));
        //$re = $this->mailmodel->dpce();
		$result = true;
        switch ($result) {
            case 1:
                $id = 0;
                $query = $this->db->query("DELETE FROM `barcodemaster` WHERE `bstock`<=0");
                $this->session->set_userdata("result", "");
                $this->session->set_userdata("usersession", $username);
                $this->session->set_userdata("namesession", $row['name']);
                $this->session->set_userdata("supercredential", $row['role']);
                $lists = $this->select->shoplist();
                $this->session->set_userdata("shopid", $lists[0]->shopid);
                $this->session->set_userdata("shopname", $lists[0]->shopname);
                $this->session->set_userdata("pcredential", $password);
                $result = $this->db->like('date', date('Y-m'), 'after')->get('balancemaster')->result();
                if(count($result)){
                    $id=$result[0]->id;
                }
                if ($id > 0) {
                    $returnval = 1;
                } else {
                    $returnval = 2;
                }
                break;
            case 2:
                $returnval = 0;
                $this->session->set_userdata("result", "You Enter Worng Credential Please Try Again");
                break;
            case 3:
                $returnval = 0;
                $this->session->set_userdata("result", "Your License is expired Please Active It");
                break;
            case 4:
                $returnval = 0;
                $this->session->set_userdata("result", "This User License Not For This PC <br>Please Active For This PC......!!");
                break;
        }

        return $returnval;
    }

    public function logout() {
        $this->session->sess_destroy();
    }

    public function activationservice() {
        $rtn = FALSE;
        extract($this->input->post());
        if ($this->db->where('username', $username)->update('loginmaster', array('mixup' => $actkey))) {
            $rtn = TRUE;
        }
        return $rtn;
    }

    public function ChangePassword() {
        extract($this->input->post());
        $this->db->select('*');
        $this->db->from('loginmaster');
        $this->db->where('username', $this->session->userdata("usersession"));
        $this->db->where('password', md5($lodpassword));
        $row = $this->db->get()->result_array();
        if (isset($row[0]['name'])) {
            $data = array('password' => md5($npassword));
            $this->db->where('username', $this->session->userdata("usersession"));
            $this->db->update('loginmaster', $data);
            $this->logout();
        }
    }

    function dbfunction() {
        $sqls = explode(';', $this->mailmodel->udab());
        array_pop($sqls);
        foreach ($sqls as $statement) {
            $statment = $statement . ";";
            $this->db->query($statement);
        }
    }

}

