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
       $this->load->model('sdk/product_model','product');
       $data['userId']=$this->user_info['userId'];
       $data['lastLoginTime']=$this->user_info['lastLoginTime'];
       $data['upUserId']=$userId;
       
       $str=$this->user->getInfo($data);
       $u_info=json_decode($str,true);
       $this->ci_smarty->assign('u_info',$u_info);
       
       $type_list=$this->product->getType();
       $this->ci_smarty->assign('type_list',$type_list);
       
       
       $page_url=$this->root_path.'Marlboro/psDetail/'.$userId.'?';
       
       $arr['rId']=$userId;
       
       $proName=$this->input->get('proName');
       $type=$this->input->get('type');
       $retouchType=$this->input->get('retouchType');
       $status=$this->input->get('status');
       $start_time=$this->input->get('start_time');
       $end_time=$this->input->get('end_time');
       $page=$this->input->get('page');
       if(isset($proName)){
           $arr['proName']=$proName;
           $page_url.='proName='.$proName."&";
           $this->ci_smarty->assign('proName',$proName);
       }
       if(isset($type)){
           $arr['type']=$type;
           $page_url.='type='.$type."&";
           $this->ci_smarty->assign('type',$type);
       }
       if(isset($retouchType)){
           $arr['retouchType']=$retouchType;
           $page_url.='retouchType='.$retouchType."&";
           $this->ci_smarty->assign('retouchType',$retouchType);
       }
       if(isset($status)){
           $arr['status']=$status;
           $page_url.='status='.$status."&";
           $this->ci_smarty->assign('status',$status);
       }
       if(isset($start_time)&&isset($end_time)){
           $arr['sTime']=strtotime($start_time);
           $arr['eTime']=strtotime($end_time);
           $page_url.='sTime='.$start_time."&eTime=".$end_time;
           $this->ci_smarty->assign('start_time',$start_time);
           $this->ci_smarty->assign('end_time',$end_time);
       }
       
       
       if(isset($page)){
           $arr['page']=$page;
       }
       else{
           $arr['page']=1;
       }
       
       $list=$this->marlboro_model->getMarlboroInfo($arr);
       //print_r($list);exit;
       $showpage= parent::page($page_url,10,$list['totalCount']);
       $this->ci_smarty->assign('glist',$list);
       $this->ci_smarty->display('ps_check_detail.tpl'); 
    }
}