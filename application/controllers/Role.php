<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Role extends My_Controller {

		public function __construct() 
        {
            parent::__construct();
			$this->load->model('user/role_model');
        }
                
        

        
        public function index(){
       
            $data['roleName']=$this->input->get('roleName');
            $data['page']=$this->input->get('page');
            $data['pageSize']=10;
            $data['userId']=$this->user_info['userId'];
            $data['token']=$this->user_info['token'];
            $page_url=$this->root_path.'role/index/?';
            if($data['roleName']!=''){
                $page_url.='roleName='.$data['roleName']."&";
                $this->ci_smarty->assign('trueName',$data['roleName']);
            }
            if($data['page']==''){
                $data['currentPage']=1;
            }else{
                $data['currentPage']=$data['page'];
            }
            $str=$this->role_model->getRoleList($data);
            $role_list=json_decode($str,true);
            $showpage= parent::page($page_url,$data['pageSize'],$role_list['nums']);
            $this->ci_smarty->assign('pages',$showpage['show']);
            $this->ci_smarty->assign('roleList',$role_list['list']);
            $this->ci_smarty->display('role_list.tpl');
        }
        
        function addRole(){
            $data['roleName']=$this->input->post('roleName');
            $data['desc']=$this->input->post('desc');
            $data['userId']=$this->user_info['userId'];
            $data['token']=$this->user_info['token'];
            echo $str=$this->role_model->addRole($data);
            exit;
        }
}
