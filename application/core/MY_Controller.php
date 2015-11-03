<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class MY_Controller extends CI_Controller
{
    public function __construct()
    {
        header("Access-Control-Allow-Origin:*");
        parent::__construct();
        $this->load->helper('cookie');
        $this->load->helper('url');
        $this->load->library('CI_Smarty');
        $c=$this->uri->segment(1, 0);
        $m=$this->uri->segment(2, 0);
        $acction=$c.'/'.$m;
        $noLoginArray=array('user/login','user/doLogin');
    
        if(!in_array($acction,$noLoginArray)){
           $this->user_info= unserialize(get_cookie("user"));
            if(!isset($this->user_info['userId'])){
                header("Location: ".site_url('user/login'));
            }
            else{
                $this->ci_smarty->assign('userInfo', $this->user_info);
            }
        }
        //本地
        $root_path='http://192.168.8.29:8082/';
        //线上
        //$root_path='http://192.168.8.29:8082/';
        
        //本地
        $resource_url='http://192.168.8.29:8083/collect_web/';
        //线上
        //$resource_url='http://121.40.241.156:8009/collect_web/';
        $this->ci_smarty->assign('root_path', $root_path);
        $this->ci_smarty->assign('resource_url', $resource_url);
    }


}