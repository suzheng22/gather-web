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
            $data['currentPage']=$this->input->get('currentPage');
            $data['pageSize']=10;
            $data['userId']=$this->user_info['userId'];
            $data['lastLoginTime']=$this->user_info['lastLoginTime'];
            $page_url=$this->root_path.'user/role/?';
            if($data['roleName']!=''){
                $page_url.='roleName='.$data['roleName']."&";
            }
            $str=$this->role_model->getRoleList($data);
            $role_list=json_decode($str,true);
            $showpage= parent::page($page_url,$data['pageSize'],$role_list['nums']);
            $this->ci_smarty->assign('pages',$showpage['show']);
            $this->ci_smarty->assign('roleList',$role_list['list']);
            /*
            $data['trueName']=$this->input->get('trueName');
            $data['roleId']=$this->input->get('roleId');
            $data['groupId']=$this->input->get('groupId');
            $data['status']=$this->input->get('status');

           
            if($data['userName']!=''){
                $page_url.='userName='.$data['userName']."&";
            }
            if($data['trueName']!=''){
                $page_url.='trueName='.$data['trueName']."&";
            }
            if($data['roleId']!=''){
                $page_url.='roleId='.$data['roleId']."&";
            }
            if($data['groupId']!=''){
                $page_url.='groupId='.$data['groupId']."&";
            }
            
           //$page_url=substr($page_url, 0,strlen($$page_url)-1);
            

          //echo $page_url;exit;
            
            
            $data['userId']=$this->user_info['userId'];
            $data['lastLoginTime']=$this->user_info['lastLoginTime'];
           
            $str=$this->user_model->getuserRoleList($data);
            $role_list=json_decode($str,true);
             $this->ci_smarty->assign('role_list',$role_list);
           
              $str=$this->user_model->getGroupList($data);
              $group_list=json_decode($str,true);
              $this->ci_smarty->assign('group_list',$group_list);
              
              
              
              
              //print_r($user_list);exit;
              $this->ci_smarty->assign('userList',$user_list['list']);
              

              */
             $this->ci_smarty->display('role_list.tpl');
        }
}
