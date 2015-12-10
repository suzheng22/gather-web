<?php

defined('BASEPATH') OR exit('No direct script access allowed');
class Project extends My_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('user/project_model');
    }
    //商品管理
    function projectManager(){
        $this->load->model('user/project_model','user');
        $data['userId']=$this->user_info['userId'];
        $data['token']=$this->user_info['token'];
        $project_list=$this->project_model->getProjectList($data);
        $this->ci_smarty->assign('project_list',$project_list['data']);
        $page_url=$this->root_path.'project/projectManager?';
        $project=$this->input->get('pId');
        $status=$this->input->get('status');
        if(isset($project)){
            $arr['pId']=$project;
            $page_url.='project='.$project."&";
            $this->ci_smarty->assign('project',$project);
        }
        if(isset($status)){
            $arr['status']=$status;
            $page_url.='status='.$status."&";
            $this->ci_smarty->assign('status',$status);
        }
        $arr['userId']=$this->user_info['userId'];
        $arr['token']=$this->user_info['token'];
        //获取项目列表
        $project_list=$this->project_model->getProjectByField($arr);
        $showPage= parent::page($page_url,3,$project_list['total']);
        //获取项目标签
        $this->ci_smarty->assign('plist',$project_list['data']);

        $this->ci_smarty->assign('pages',$showPage['show']);
        $this->ci_smarty->display('project_manager.tpl');
    }
  //商品用户管理
    function projectUserManager(){
        $this->load->model('user/user_model','user');
        $data['userId']=$this->user_info['userId'];
        $data['token']=$this->user_info['token'];
        $project_list=$this->project_model->getProjectList($data);
        $this->ci_smarty->assign('project_list',$project_list['data']);
        $page_url=$this->root_path.'project/projectUserManager?';
        $project=$this->input->get('pId');
        $status=$this->input->get('status');
        $username=$this->input->get('username');
        if(isset($project)){
            $arr['pId']=$project;
            $page_url.='pId='.$project."&";
            $this->ci_smarty->assign('project',$project);
        }
        if(isset($username)){
            $arr['pUserId']=serialize($username);
         //   echo unserialize($arr['pUserI'])
            $page_url.='username='.$username."&";
            $this->ci_smarty->assign('username',$username);
        }
        if(isset($status)){
            $arr['status']=$status;
            $page_url.='status='.$status."&";
            $this->ci_smarty->assign('status',$status);
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
       // var_dump($arr);
       $project_list=$this->project_model->getProjectUserByField($arr);
    //    var_dump($project_list);
        $showPage= parent::page($page_url,1,$project_list['total']);

        //获取项目标签
        $this->ci_smarty->assign('plist',$project_list['data']);
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
        echo  $data['userId'].",". $data['token'].','.$data['pId'].','. $data['desc'].','.$data['pUserId'];
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
        $str=$this->project_model->updateProjectStatus($data);
        echo json_encode($str);
    }

}