<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Index extends My_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('user/user_model');
    }
    
    function index(){
        $this->ci_smarty->display('index.tpl');
    }
}