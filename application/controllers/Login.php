<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('loginmodel');
        $this->load->helper('cookie');
    }

    public function index() {
        $this->load->view('login');
    }

    public function loginService() {
        
        $this->load->model('loginmodel');
        $status = $this->loginmodel->login();
        // print_r($_POST);print_r($status);
        if(!get_cookie('terminal_id'))
        {
            $this->session->set_userdata("result",'Terminal Setup Is Not Done!');
            redirect(site_url('login'), 'refresh');
        }
        else{
        if ($status == 1) {
            if ($this->session->userdata("supercredential") == 1) {
                redirect(site_url('dashboard'), 'refresh');
            } elseif ($this->session->userdata("supercredential") == 2) {
                redirect(site_url('generate-bill'), 'refresh');
            } else {
                redirect(site_url('generate-bill'), 'refresh');
            }
        }else if ($status == 2) {
            redirect(site_url('dashboard'), 'refresh');
        } else {
            redirect(site_url('login'), 'refresh');
        }
        }
    }

    public function activationservice() {
        $status = $this->loginmodel->activationservice();
        if ($status) {
            $this->session->unset_userdata("result");
        }
        redirect(site_url('login'), 'refresh');
    }

    public function ChangePassword() {
        $this->loginmodel->changepassword();
        redirect('', 'refresh');
    }
    public function set_terminal(){
        $post = $this->input->post();
        if(!empty($post))
        {
            set_cookie('terminal_id',$post['terminal_id'],0);

            $this->session->set_flashdata('msg','Terminal SetUp Complete!');
            redirect('login/set-terminal');
            exit;
            
        }
        $this->load->view('set-terminal');
    }
}
