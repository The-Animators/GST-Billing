<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Cron extends CI_Controller {

	public function __construct() {
        parent::__construct();
        $this->load->model('select');
        $this->load->model('productmodel');
    }
	public function index()
	{
		
	}
	public function set_opening(){
		$table = 'productmaster';
		$products = $this->db->get($table)->result_array();
		echo "<pre>";
		if(!empty($products))
		{
			foreach ($products as $product) {
				$prodid_ = $product['prodid_'];
				$lstock = $product['lstock'];
				$where = array('prodid_'=>$prodid_);
				$update_data = array('today_opening'=>$lstock);
				$this->db->update($table,$update_data,$where);
			}
		}
	}
}

/* End of file Cron.php */
/* Location: ./application/controllers/Cron.php */