<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Information extends My_Controller{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('user/project_model', 'project');
        $this->load->model('sdk/product_model', 'product');
        $this->load->model('ps/marlboro_model', 'marlboro');
        $this->load->model('user/user_model', 'user');
        $this->load->model('publicFuc/publicFuc_model', 'publicFuc');
    }
    /**
     * 基本信息管理
     * */
    public function baseInfoManager(){
        $this->ci_smarty->display("information/base_info_manager.tpl");
    }
    /**
     * 扩冲成分
     * */
    public function extendInfo(){
        $this->ci_smarty->display("information/extend_info.tpl");
    }
    /**
     * 营养成分
     * */
    public function nutrientInfo(){
        $this->ci_smarty->display("information/nutrient_info.tpl");
    }
}