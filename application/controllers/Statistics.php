<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Statistics extends My_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('user/user_model');
        $this->load->model('statistics/Statistics_model');
    }
    
    function ps(){
        $page_url=$this->root_path.'statistics/ps/?';
        
        $group_list= $this->user_model->getGroupListByRole(6);
        
        $this->ci_smarty->assign('group_list',$group_list['list']);
        
        $data=$this->input($page_url);
        if($this->input->get('is_ext')){
            $data['is_ext']='yes';
            $list=$this->Statistics_model->getPsList($data);
            $str = "用户名,用户组,修图商品数,已审核商品数,待上传商品数,待审核商品数,已驳回商品数\n";
            $str = iconv('utf-8','gb2312',$str);
            foreach ($list['list'] as $k=>$v){
                $userName = iconv('utf-8','gb2312',$v['userName']); //中文转码
                $groupName = iconv('utf-8','gb2312',$v['groupName']);
                $x = iconv('utf-8','gb2312','待定');
                $totalCount = $v['totalCount'];
                $passCount = $v['passCount'];
                $re_uplodeCount = $v['re_uplodeCount'];
                $re_passCount=$v['re_passCount'];
                $str .= $userName.",".$groupName.",".$totalCount.",".$passCount.",".$re_uplodeCount.",".$re_passCount.",".$x."\n";
            }
            $filename = date('Ymd').'修图统计.csv'; //设置文件名
            $this->export_csv($filename,$str); //导出
            exit;
        }
        $list=$this->Statistics_model->getPsList($data);
        $this->ci_smarty->assign('page_url',$data['pageUrl']);
        $showpage= parent::page($data['pageUrl'],10,$list['totalCount']);
        $this->ci_smarty->assign('glist',$list['list']);
        $this->ci_smarty->assign('pages',$showpage['show']);
        $this->ci_smarty->display('statistics/ps_count.tpl');
    }
    
    function project(){
        $this->ci_smarty->display('statistics/project_count.tpl');
    }
    
    
    function psCheck() {
        $page_url=$this->root_path.'statistics/psCheck/?';
        $group_list= $this->user_model->getGroupListByRole(4);
        
        $data=$this->input($page_url);
        
        $data['type']='pic';
        if($this->input->get('is_ext')){
            $data['is_ext']='yes';
            $list=$this->Statistics_model->getPsCheckList($data);
            $str = "用户名,用户组,审核商品数,通过商品数,已驳回商品数\n";
            $str = iconv('utf-8','gb2312',$str);
            foreach ($list['list'] as $k=>$v){
                $userName = iconv('utf-8','gb2312',$v['userName']); //中文转码
                $groupName = iconv('utf-8','gb2312',$v['groupName']);
                $totalCount = $v['totalCount'];
                $passCount = $v['passCount'];
                $noPassCount = $v['noPassCount'];
                $str .= $userName.",".$groupName.",".$totalCount.",".$passCount.",".$noPassCount."\n";
            }
            $filename = date('Ymd').'修图审核统计.csv'; //设置文件名
            $this->export_csv($filename,$str); //导出
            exit;
        }
        
        $list=$this->Statistics_model->getPsCheckList($data);
        $this->ci_smarty->assign('page_url',$data['pageUrl']);
        $showpage= parent::page($data['pageUrl'],10,$list['totalCount']);
        $this->ci_smarty->assign('glist',$list['list']);
        $this->ci_smarty->assign('pages',$showpage['show']);
        
        $this->ci_smarty->assign('group_list',$group_list['list']);
        $this->ci_smarty->display('statistics/ps_check_count.tpl'); 
    }
    
    function shoot(){
        $this->ci_smarty->display('statistics/shoot_count.tpl');
    }
    
    
    function input($page_url){
        $data['userId']=$this->user_info['userId'];
        $data['token']=$this->user_info['token'];
        $data['is_ext']='no';
        $data['userName']=$this->input->get('userName');
        $data['groupId']=$this->input->get('groupId');
        $data['page']=$this->input->get('currentPage');
        
        
        if($data['userName']!='' ||$data['groupId']!=''){
        
            $str=$this->user_model->getUserIdsByFiled($data);
            $user_id_list=json_decode($str,true);
            $data['users']=serialize($user_id_list);
            $page_url.='userName='.$data['userName']."&groupId=".$data['groupId'];
            $this->ci_smarty->assign('userName',$data['userName']);
            $this->ci_smarty->assign('groupId',$data['groupId']);
        }
        if($this->input->get('startTime')!='' && $this->input->get('endTime')!=''){
            $startTime=$this->input->get('startTime');
            $endTime=$this->input->get('endTime');
            $page_url.='startTime='.$startTime."&endTime=".$endTime;
            $this->ci_smarty->assign('startTime',$startTime);
            $this->ci_smarty->assign('endTime',$endTime);
            $data['startTime']=strtotime($startTime);
            $data['endTime']=strtotime($endTime);
        }
        $data['pageUrl']=$page_url;
        return $data;
    }
}