<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Statistics extends My_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('user/user_model');
    }
    
    function ps(){
        $this->ci_smarty->display('statistics/ps_count.tpl');
    }
}