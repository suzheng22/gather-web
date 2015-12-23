<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Goods extends My_Controller {

    public function __construct()
    {
        parent::__construct();
    }
    public function goodsClassify(){
        $this->ci_smarty->display("goods/goodsClassify.tpl");
    }

}