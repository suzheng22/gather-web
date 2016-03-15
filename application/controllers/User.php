<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User extends My_Controller {

		public function __construct() 
        {
            parent::__construct();
			$this->load->model('user/user_model');
        }
                
        //登录
        public function doLogin()
        {
          
            $data['userName']=$this->input->post('userName');
			$data['pwd']=$this->input->post('pwd');
			$json=$this->user_model->checkLogin($data);
			//echo $json;exit;
			$arr=json_decode($json,'true');
            if($arr['msgCode']>0){
                $msg=$arr['msg'];
               echo "<script>alert('".$msg."');window.location.href='".$this->root_path."user/login'</script>";
                //header("Location: ".site_url('user/login')); 
            }
            else{
                $user['userId']=$arr['userId'];
                $user['trueName']=$arr['trueName'];
                $user['token']=urlencode($arr['token']);
              //  $user['token']=($arr['token']);
                $user['roleId']=$arr['roleId'];
                $user_str=serialize($user);
                set_cookie("user",$user_str,3600*24);
                if($user['userId']==58){
                    header("Location: ".site_url('shoot/shootAddManager'));
                }else{
                    header("Location: ".site_url('user/loginIndex'));
                }

            }
            
        }
    public function loginIndex(){
        $this->ci_smarty->display('index.tpl');
    }
         
        //登出
        function logout(){
            set_cookie("user",'',time()-3600);
            header("Location: ".site_url('user/login'));
        }
        
        //登录页面
        public function login(){
            $this->ci_smarty->assign('msg','');
            $this->ci_smarty->display('login.tpl');
        }
        //用户首页列表页
        public function index(){
            echo $this->user_info['token'];
            $data['userName']=$this->input->get('userName');
            $data['trueName']=$this->input->get('trueName');
            $data['roleId']=$this->input->get('roleId');
            $data['groupId']=$this->input->get('groupId');
            $data['status']=$this->input->get('status');
            $data['page']=$this->input->get('page');
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
            if($data['page']==''){
                $data['currentPage']=1;
            }else{
                $data['currentPage']=$data['page'];
            }

            $data['userId']=$this->user_info['userId'];
            $data['token']=$this->user_info['token'];
           $no_master['userId']=$this->user_info['userId'];
           $no_master['token']=$this->user_info['token'];
            $str=$this->user_model->getuserRoleList($no_master);
            $role_list=json_decode($str,true);
             $this->ci_smarty->assign('role_list',$role_list['list']);
           
              $str=$this->user_model->getGroupList($no_master);
              $group_list=json_decode($str,true);
              $this->ci_smarty->assign('group_list',$group_list['list']);
              
              
              $str=$this->user_model->getUserList($data);
              $user_list=json_decode($str,true);
              
              //var_dump($user_list);exit;
              $this->ci_smarty->assign('userList',$user_list['list']);
              $showpage= parent::page($page_url,$data['pageSize'],$user_list['nums']);

              $this->ci_smarty->assign('pages',$showpage['show']);
             $this->ci_smarty->display('user_list.tpl');
        }
        
        //获取单个用户信息
        function info(){
            $data['userId']=$this->user_info['userId'];
            $data['token']=$this->user_info['token'];
            $data['upUserId']=$this->input->post('upUserId');
            echo  $this->user_model->getInfo($data);exit;
        }
        
        //用户组列表页
        function userGroupList(){
            $page_url=$this->root_path.'user/userGroupList?';
            $data['groupName']=$this->input->get('groupName');
            $data['roleId']=$this->input->get('roleId');
            $data['page']=$this->input->get('page');
            $data['pageSize']=10;
            if($data['groupName']!=''){
                $page_url.='groupName='.$data['groupName']."&";
                $this->ci_smarty->assign('groupName',$data['groupName']);
            }
            if($data['roleId']!=''){
                $page_url.='roleId='.$data['roleId']."&";
                $this->ci_smarty->assign('roleId',$data['roleId']);
            }
            if($data['page']==""){
               $data['currentPage'] =1;
            }else{
                $data['currentPage'] =$data['page'];
            }
            $data['userId']=$this->user_info['userId'];
            $data['token']=$this->user_info['token'];
            
            $no_master['userId']=$this->user_info['userId'];
            $no_master['token']=$this->user_info['token'];
            $str=$this->user_model->getuserRoleList($no_master);
            $role_list=json_decode($str,true);
            $this->ci_smarty->assign('role_list',$role_list['list']);
            
            $str=$this->user_model->getGroupList($data);
            $group_list=json_decode($str,true);
            $this->ci_smarty->assign('group_list',$group_list['list']);
            
            $showpage= parent::page($page_url,$data['pageSize'],$group_list['nums']);
            $this->ci_smarty->assign('pages',$showpage['show']);
            $this->ci_smarty->display('user_group_list.tpl');
        }
        
        //根据角色获取用户组 ajax
        function getUserGroupListAjax(){
            $data['roleId']=$this->input->post('roleId');
            $data['userId']=$this->user_info['userId'];
            $data['token']=$this->user_info['token'];
            $str=$this->user_model->getGroupList($data);
            $group_list=json_decode($str,true);
            echo json_encode($group_list['list']);
            exit;
        }
        
        //添加用户
        function addUser(){
            $data['userName']=$this->input->post('userName');
            $data['trueName']=$this->input->post('trueName');
            $data['roleId']=$this->input->post('roleId');
            $data['groupId']=$this->input->post('groupId');
            $data['desc']=$this->input->post('desc');
            $data['userId']=$this->user_info['userId'];
            $data['token']=$this->user_info['token'];
           echo  $this->user_model->addUser($data);
        }
        
        
        //重置密码
        function rePwd(){
            $data['userId']=$this->user_info['userId'];
            $data['token']=$this->user_info['token'];
            $data['reUserId']=$this->input->post('reUserId');
            echo  $this->user_model->rePwd($data);exit;
        }
        
        //冻结账户
        function freeze(){
            $data['userId']=$this->user_info['userId'];
            $data['token']=$this->user_info['token'];
            $data['freezeUserId']=$this->input->post('freezeUserId');
            $data['status']=$this->input->post('status');
            echo  $this->user_model->freeze($data);exit;
        }
        //编辑用户
        function editUser(){
            $data['trueName']=$this->input->post('trueName');
            $data['roleId']=$this->input->post('roleId');
            $data['groupId']=$this->input->post('groupId');
            $data['desc']=$this->input->post('desc');
            $data['ed_userId']=$this->input->post('ed_userId');
            
            $data['userId']=$this->user_info['userId'];
            $data['token']=$this->user_info['token'];
            echo  $this->user_model->editUser($data);exit;
        }
        
        //添加用户组
        function addGroup(){
            $data['groupName']=$this->input->post('groupName');
            $data['roleId']=$this->input->post('roleId');
            $data['desc']=$this->input->post('desc');

            $data['userId']=$this->user_info['userId'];
            $data['token']=$this->user_info['token'];
            echo  $this->user_model->addGroup($data);exit;
        }
        
        //获取单个用户组信息
        function groupInfo(){
            $data['userId']=$this->user_info['userId'];
            $data['token']=$this->user_info['token'];
            $data['groupId']=$this->input->post('groupId');
            echo  $this->user_model->getGroupInfo($data);exit;
        }
        
        //编辑用户组
        function editGroup(){
            $data['groupId']=$this->input->post('groupId');
            $data['desc']=$this->input->post('desc');
            $data['roleId']=$this->input->post('roleId');
            
            $data['userId']=$this->user_info['userId'];
            $data['token']=$this->user_info['token'];
            echo  $this->user_model->editGroup($data);exit;
        }
        
        function editPwd(){
            var_dump($this->user_info['token']);

            $this->ci_smarty->display('usdate_pws.tpl');
        }
        
        function doEditPwd(){
            $data['userId']=$this->user_info['userId'];
            $data['token']=$this->user_info['token'];
            $data['oldPwd']=$this->input->post('oldPwd');
            $data['newPwd']=$this->input->post('newPwd');
            $json=$this->user_model->editPwd($data);
            $r=json_decode($json,true);
            if ($r['msgCode']==0){
                set_cookie("user",'',time()-3600);
                
            }
            echo $json;
        }
}
