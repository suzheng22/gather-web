<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Marlboro extends My_Controller {

    public function __construct()
    {
        parent::__construct();
        //$this->load->model('ps/marlboro_model');
    }
    
    function ps(){
        $data['userName']=$this->input->get('userName');
        $data['userName']=$this->input->get('userName');
        $data['userName']=$this->input->get('userName');
        $this->ci_smarty->display('ps_check_list.tpl');
    }
}