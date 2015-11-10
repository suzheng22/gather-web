<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Marlboro extends My_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('ps/marlboro_model');
    }
    
    function ps(){
        $this->load->model('user/user_model','user');
        $data['roleId']=6;
        $data['userId']=$this->user_info['userId'];
        $data['lastLoginTime']=$this->user_info['lastLoginTime'];
        $str=$this->user->getGroupList($data);
        $group_list=json_decode($str,true);
        $this->ci_smarty->assign('group_list',$group_list['list']);

        $data['userName']=$this->input->get('userName');
        $data['groupId']=$this->input->get('groupId');
        if($data['userName']!=''){
                $this->ci_smarty->assign('userName',$data['userName']);
        }
        
        if($data['groupId']!=''){
            $this->ci_smarty->assign('groupId',$data['groupId']);
        }
        if($data['userName']!='' ||$data['groupId']!=''){
            $str=$this->user->getUserIdsByFiled($data);
            $user_id_list=json_decode($str,true);
            $data['users']=serialize($user_id_list);
        }
        $list=$this->marlboro_model->getMarlboroList($data);

        $this->ci_smarty->assign('glist',$list);
       
        $this->ci_smarty->display('ps_check_list.tpl');
    }
    
    function psDetail($userId){
       $this->load->model('user/user_model','user');
       $data['userId']=$this->user_info['userId'];
       $data['lastLoginTime']=$this->user_info['lastLoginTime'];
       $data['upUserId']=$userId;
       $str=$this->user->getInfo($data);
       $u_info=json_decode($str,true);
       $this->ci_smarty->assign('u_info',$u_info);
       $arr['rId']=$userId;
       $list=$this->marlboro_model->getMarlboroInfo($arr);
       $this->ci_smarty->assign('glist',$list);
       $this->ci_smarty->display('ps_check_detail.tpl'); 
    }
}