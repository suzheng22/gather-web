<?php

defined('BASEPATH') OR exit('No direct script access allowed');
class Project extends My_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('user/project_model');
        $this->load->model('publicFuc/publicFuc_model','publicFuc');
    }
    //项目管理列表
    function projectManager(){
        $this->load->model('user/project_model','user');
        $data['userId']=$this->user_info['userId'];
        $data['token']=$this->user_info['token'];
        //显示项目列表
        $project_list=$this->project_model->getProjectList($data);
        $this->ci_smarty->assign('project_list',$project_list['data']);
        $page_url=$this->root_path.'project/projectManager?';
        $page=$this->input->get('page');
        if(!isset($get['status'])){
            $get['status']=null;
        }
        $get=$this->input->get();
        //去掉page重新匹配
        unset($get['page']);
        $page_url=$this->publicFuc->getUrl($page_url,$get);
        $arr=$this->getPage($get,$page);
        $arr['userId']=$this->user_info['userId'];
        $arr['token']=$this->user_info['token'];
        //获取项目列表
        $p_list=$this->project_model->getProjectByField($arr);
        $showPage= parent::page($page_url,10,$p_list['total']);
        //获取项目标签
        $this->ci_smarty->assign('plist',$p_list['data']);
        $this->ci_smarty->assign('pages',$showPage['show']);
        $this->ci_smarty->display('project_manager.tpl');
    }
  //项目用户管理列表
    function projectUserManager(){
        $this->load->model('user/user_model','user');
        $data['userId']=$this->user_info['userId'];
        $data['token']=$this->user_info['token'];
        $project_list=$this->project_model->getProjectList($data);
        $this->ci_smarty->assign('project_list',$project_list['data']);
        $page_url=$this->root_path.'project/projectUserManager?';
        $page=$this->input->get('page');
        if(!isset($get['status'])){
            $get['status']=null;
        }
        $get=$this->input->get();
        //去掉page重新匹配
        unset($get['page']);
        $page_url=$this->publicFuc->getUrl($page_url,$get);
        $arr=$this->getPage($get,$page);

        if(isset($arr['username'])&&$arr['username']!=""){
            $arr['pUserIds']=serialize($arr['username']);
        }
        //获取用户角色
        $no_master['userId']=$this->user_info['userId'];
        $no_master['token']=$this->user_info['token'];
        $str=$this->user->getuserRoleList($no_master);
        $role_list=json_decode($str,true);
        $this->ci_smarty->assign('rList',$role_list['list']);
        //获取用户列表
        $userStr=$this->user->getUserList($no_master);
        $userList=json_decode($userStr,true);
        $this->ci_smarty->assign('userList',$userList['list']);
        //根据用户角色获取
        $arr['userId']=$this->user_info['userId'];
        $arr['token']=$this->user_info['token'];
        //获取项目列表
        $project_lists=$this->project_model->getProjectUserByField($arr);
       // var_dump($project_list);
        $showPage= parent::page($page_url,10,$project_lists['total']);
        //获取项目标签
        $this->ci_smarty->assign('plist',$project_lists['data']);
        $this->ci_smarty->assign('pages',$showPage['show']);
        $this->ci_smarty->display('project_user_manager.tpl');
    }
    //增加项目
    function addProject(){
        $data['userId']=$this->user_info['userId'];
        $data['token']=$this->user_info['token'];
        $data['pName']=$this->input->post('project');
        $data['desc']=$this->input->post('describe');
        $data=$this->project_model->addProject($data);
        echo json_encode($data);
    }
    //增加用户项目
    function addProjectUser(){
        $data['userId']=$this->user_info['userId'];
        $data['token']=$this->user_info['token'];
        $data['pId']=$this->input->post('pIds');
        $data['desc']=$this->input->post('describe');
        $data['pUserId']=$this->input->post('userId');
        //echo  $data['userId'].",". $data['token'].','.$data['pId'].','. $data['desc'].','.$data['pUserId'];
        $data=$this->project_model->addProjectUser($data);
        echo json_encode($data);
    }
    //根据角色获取用户列别
    function getUserListByRole(){
        $this->load->model('user/user_model','user');
        $data['roleId']=$this->input->post('roleId');
        $data['userId']=$this->user_info['userId'];
        $data['token']=$this->user_info['token'];
        $userStr=$this->user->getUserList($data);
        $userList=json_decode($userStr,true);
        echo json_encode($userList['list']);
    }
    //更新项目状态
    function updateProjectStatus(){
        $data['userId']=$this->user_info['userId'];
        $data['token']=$this->user_info['token'];
        $data['pId']=$this->input->post('projectId');
        $data['status']=$this->input->post('status');
        $data['upUserId']=$this->input->post('upUserId');
        $str=$this->project_model->freezeProject($data);
        if($str){
            if($data['status']==1){
                echo json_encode($str);
            }
            else if($data['status']==2){
                echo json_encode($str);
            }
        }
    }
    function updateProjectUserStatus(){
        $data['userId']=$this->user_info['userId'];
        $data['token']=$this->user_info['token'];
        $data['pId']=$this->input->post('projectId');
        $data['status']=$this->input->post('status');
        $data['upUserId']=$this->input->post('upUserId');
        $str=$this->project_model->freezeProjectUser($data);
        if($str){
            if($data['status']==1){
                echo json_encode($str);
            }
            else if($data['status']==2){
                echo json_encode($str);
            }

        }
    }

}