<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class MY_Controller extends CI_Controller
{
    public function __construct()
    {
      
        parent::__construct();
        $this->load->helper('cookie');
        $this->load->helper('url');
        $c=$this->uri->segment(1, 0);
        $m=$this->uri->segment(2, 0);
        $acction=$c.'/'.$m;
        $noLoginArray=array('user/login','user/doLogin');
    
        if(!in_array($acction,$noLoginArray)){
           $this->user_info= unserialize(get_cookie("user"));
            if(!isset($this->user_info['userId'])){
                header("Location: ".site_url('user/login'));
            }           
        }
        
        $this->load->library('CI_Smarty');
        $this->ci_smarty->assign('root_path', 'http://192.168.8.29:8082/');
        $this->ci_smarty->assign('resource_url', 'http://121.40.241.156:8009/collect_web/');
    }


}