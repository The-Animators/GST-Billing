<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Uploader extends CI_Model {

    public function __construct() {
        parent::__construct();
        $this->load->library('image_lib');
    }

    public function do_upload($pic, $fileName, $path) {
        $config['upload_path'] = $path;
        $config['allowed_types'] = 'gif|jpg|JPG|jpeg|JPEG|png';
        $config['max_size'] = 5024;
        $config['max_width'] = 2000;
        $config['max_height'] = 2000;
        $config['overwrite'] = TRUE;
        $config['quality'] = '60%';
        $config['file_name'] = $fileName;
        $this->load->library('upload', $config);

        if (!$this->upload->do_upload($pic)) {
            $error = array('error' => $this->upload->display_errors());
            return $error;
        } else {
            return $this->upload->data('file_name') . '<br>';
        }
    }

    public function imageupload($pic, $fileName) {
        $config['upload_path'] = "./images/product/";
        $config['allowed_types'] = 'gif|jpg|JPG|jpeg|JPEG|png';
        $config['max_size'] = 5024;
        $config['max_width'] = 2000;
        $config['max_height'] = 2000;
        $config['overwrite'] = FALSE;
        $config['quality'] = '60%';
        $config['file_name'] = $fileName;
        $this->load->library('upload', $config);

        if (!$this->upload->do_upload($pic)) {
            $error = array('error' => $this->upload->display_errors());
            return $error;
        } else {
            return $this->upload->data('file_name') . '<br>';
        }
    }

    public function cropimage() {
        if ($this->input->post()) {
            $x_axis = $this->input->post('x');
            $y_axis = $this->input->post('y');
            $width = $this->input->post('w');
            $height = $this->input->post('h');
            $source = $this->session->userdata("imgsession");
            //echo $source; 
            $config['image_library'] = 'gd2';
            $config['source_image'] = $source;
            $config['new_image'] = $source;
            $config['quality'] = '60%';
            $config['maintain_ratio'] = FALSE;
            $config['width'] = $width;
            $config['height'] = $height;
            $config['x_axis'] = $x_axis;
            $config['y_axis'] = $y_axis;

            $this->image_lib->clear();
            $this->image_lib->initialize($config);
            $this->image_lib->crop();
            /* if (!$this->image_lib->crop()) {
              echo $this->image_lib->display_errors();
              } else {
              echo 'Cropped Perfectly';
              } */
        }
    }

    public function cropproductimage() {
        if ($this->input->post()) {
            $path = "./images/product/";
            $x_axis = $this->input->post('x');
            $y_axis = $this->input->post('y');
            $width = $this->input->post('w');
            $height = $this->input->post('h');
            $cut = '';
            if ($this->session->userdata("cutsession") > 1) {
                $cut = $this->session->userdata("cutsession") - 1;
            }
            $source = $path . $this->session->userdata("productsession") . "_1" . $cut . ".jpg";
            //echo $source; 
            $config['image_library'] = 'gd2';
            $config['source_image'] = $source;
            $config['new_image'] = $source;
            $config['quality'] = '60%';
            $config['maintain_ratio'] = FALSE;
            $config['width'] = $width;
            $config['height'] = $height;
            $config['x_axis'] = $x_axis;
            $config['y_axis'] = $y_axis;

            $this->image_lib->clear();
            $this->image_lib->initialize($config);
            $this->image_lib->crop();
            /* if (!$this->image_lib->crop()) {
              echo $this->image_lib->display_errors();
              } else {
              echo 'Cropped Perfectly';
              }
              return $source; */
        }
    }

}
