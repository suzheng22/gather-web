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
            $data['userName']=$this->input->get('userName');
            $data['trueName']=$this->input->get('trueName');
            $data['roleId']=$this->input->get('roleId');
            $data['groupId']=$this->input->get('groupId');
            $data['status']=$this->input->get('status');
            $data['currentPage']=$this->input->get('currentPage');
            $data['pageSize']=10;
            $page_url=$this->root_path.'user/index/?';
            if($data['userName']!=''){
                $page_url.='userName='.$data['userName']."&";
                $this->ci_smarty->assign('userName',$data['userName']);
            }
            if($data['trueName']!=''){
                $page_url.='trueName='.$data['trueName']."&";
                $this->ci_smarty->assign('trueName',$data['trueName']);
            }
            if($data['roleId']!=''){
                $page_url.='roleId='.$data['roleId']."&";
                $this->ci_smarty->assign('roleId',$data['roleId']);
            }
            if($data['groupId']!=''){
                $page_url.='groupId='.$data['groupId']."&";
                $this->ci_smarty->assign('groupId',$data['groupId']);
            }
            if($data['status']!=''){
                $page_url.='status='.$data['status']."&";
                $this->ci_smarty->assign('status',$data['status']);
            }
            
           //$page_url=substr($page_url, 0,strlen($$page_url)-1);
            

          //echo $page_url;exit;
            
            
            $data['userId']=$this->user_info['userId'];
            $data['lastLoginTime']=$this->user_info['lastLoginTime'];
           
            $str=$this->user_model->getuserRoleList($data);
            $role_list=json_decode($str,true);
             $this->ci_smarty->assign('role_list',$role_list['list']);
           
              $str=$this->user_model->getGroupList($data);
              $group_list=json_decode($str,true);
              $this->ci_smarty->assign('group_list',$group_list);
              
              
              $str=$this->user_model->getUserList($data);
              $user_list=json_decode($str,true);
              
              //print_r($user_list);exit;
              $this->ci_smarty->assign('userList',$user_list['list']);
              $showpage= parent::page($page_url,$data['pageSize'],$user_list['nums']);

              $this->ci_smarty->assign('pages',$showpage['show']);
             $this->ci_smarty->display('user_list.tpl');
        }
}
