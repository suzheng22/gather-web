<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User extends My_Controller {

		public function __construct() 
        {
            parent::__construct();
			$this->load->model('user/user_model');
        }
                
        
        public function doLogin()
        {
           $data['userName']=$this->input->post('userName');
			$data['pwd']=$this->input->post('pwd');
			$json=$this->user_model->checkLogin($data);
			$arr=json_decode($json,'false');
			
            if($arr['msgCode']>0){
                $msg=$arr['msg'];
                $this->ci_smarty->assign('msg',$msg);
                header("Location: ".site_url('user/login')); 
            }
            else{
                $user['userId']=$arr['userId'];
                $user['trueName']=$arr['trueName'];
                $user['lastLoginTime']=$arr['lastLoginTime'];
                $user_str=serialize($user);
                set_cookie("user",$user_str,3600*24);
                header("Location: ".site_url('input/index')); 
            }
            
        }
        
        public function login(){
            $this->ci_smarty->assign('msg','');
            $this->ci_smarty->display('login.tpl');
        }
        
        public function index(){
            /*分页
            $this->load->library('pagination');

            $config['base_url'] = 'http://example.com/index.php/test/page/';
            $config['total_rows'] = 200;
            $config['per_page'] = 20;
            
            $this->pagination->initialize($config);
            
            echo $this->pagination->create_links();exit;
            */
            echo 'ok';exit;
        }
}
