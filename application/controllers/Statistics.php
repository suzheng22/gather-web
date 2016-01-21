<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Statistics extends My_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('user/user_model');
        $this->load->model('statistics/Statistics_model');
        $this->load->model('user/Project_model');
        $this->load->model('publicFuc/PublicFuc_model');
        $this->load->model('sdk/product_model', 'product');
    }
    
    function psList(){
        $page_url=$this->root_path.'statistics/psList/?';
        
        $group_list= $this->user_model->getGroupListByRole(6);
        
        $this->ci_smarty->assign('group_list',$group_list['list']);
        
        $project_list=$this->Project_model->getProjectList();
        $this->ci_smarty->assign('project_list',$project_list['data']);
        
        $arr=$this->input($page_url);
       /* if($this->input->get('is_ext')){
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
        */
        $list=$this->Statistics_model->getPsList($arr);
        $showpage= parent::page($page_url,10,$list['count']);
        $this->ci_smarty->assign('glist',$list['data']);
        $this->ci_smarty->assign('pages',$showpage['show']);
        $this->ci_smarty->display('statistics/ps_count.tpl');
    }
    
    
    function psDetail($psUserId){
        $page_url=$this->root_path.'statistics/psDetail/'.$psUserId.'?';
        $project_list=$this->Project_model->getProjectList(array());
        $this->ci_smarty->assign('project_list',$project_list['data']);
        
        $type_list=$this->product->getCatgroryList();
        $this->ci_smarty->assign('type_list',$type_list['data']);
        
        $statusList=$this->PublicFuc_model->getStatusList('retouchStatus');
        $this->ci_smarty->assign('statusList',$statusList);
        
        $arr=$this->input($page_url);
        $arr['userId']=$psUserId;
        $user_p['upUserId']=$psUserId;
        $u=$this->user_model->getInfo($user_p);
        $u=json_decode($u,true);
        $this->ci_smarty->assign('psUserId',$psUserId);
        $this->ci_smarty->assign('uInfo',$u);

        $list=$this->Statistics_model->getPsDetail($arr);
        
        $showpage= parent::page($page_url,10,$list['count']);
        $this->ci_smarty->assign('glist',$list['data']);
        $this->ci_smarty->assign('pages',$showpage['show']);
        $this->ci_smarty->display('statistics/ps_count_detail.tpl');
    }
    
    function projectList(){
        $page_url=$this->root_path.'statistics/projectList/?';
        $arr=$this->input($page_url);
        //显示项目列表
        $project_list=$this->Project_model->getProjectList();
        $this->ci_smarty->assign('project_list',$project_list['data']);
        
        
        
        $list=$this->Statistics_model->getProjectList($arr);
        $showpage= parent::page($page_url,10,$list['count']);
        $this->ci_smarty->assign('plist',$list['data']);
        $this->ci_smarty->assign('pages',$showpage['show']);
        $this->ci_smarty->display('statistics/project_count.tpl');
    }
    
    
    function goodsList(){
        $page_url=$this->root_path.'statistics/goodsList/?';
        $token=$this->user_info['token'];
        $type_list=$this->product->getCatgroryList();
        $this->ci_smarty->assign('type_list',$type_list['data']);
       $arr=$this->input($page_url);
        
        $list=$this->Statistics_model->getGoodsList($arr);
        $showpage= parent::page($page_url,10,$list['count']);
        
        $this->ci_smarty->assign('glist',$list['data']);
        $this->ci_smarty->assign('pages',$showpage['show']);
        $this->ci_smarty->display('statistics/sku_count.tpl');
    }
    
    
    function psCheckList() {
        $page_url=$this->root_path.'statistics/psCheckList/?';
        $group_list= $this->user_model->getGroupListByRole(4);
        $this->ci_smarty->assign('group_list',$group_list['list']);
        $data=$this->input($page_url);

        /*
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
        */
        $list=$this->Statistics_model->getPsCheckList($data);
        $this->ci_smarty->assign('page_url',$data['pageUrl']);
        $showpage= parent::page($data['pageUrl'],10,$list['count']);
        $this->ci_smarty->assign('glist',$list['data']);
        $this->ci_smarty->assign('pages',$showpage['show']);
        

        $this->ci_smarty->display('statistics/ps_check_count.tpl'); 
    }
    
    function shootList(){
        $page_url=$this->root_path.'statistics/shootList/?';
        
        $project_list=$this->Project_model->getProjectList(array());

        $this->ci_smarty->assign('project_list',$project_list['data']);
        
        $group_list= $this->user_model->getGroupListByRole(3);
        $this->ci_smarty->assign('group_list',$group_list['list']);
        
        $arr=$this->input($page_url);
        
        $list=$this->Statistics_model->shootList($arr);
        
        $showpage= parent::page($page_url,10,$list['count']);
        
        $this->ci_smarty->assign('slist',$list['data']);
        $this->ci_smarty->assign('pages',$showpage['show']);
        $this->ci_smarty->display('statistics/shoot_count.tpl');
    }
    
    function shootBack(){
        $page_url=$this->root_path.'statistics/shootBack/?';
        $type_list=$this->product->getCatgroryList();
        $this->ci_smarty->assign('type_list',$type_list['data']);
        
        
        $arr=$this->input($page_url);
        
        $list=$this->Statistics_model->getShootBackList($arr);
        
        $showpage= parent::page($page_url,10,$list['count']);
        
        $this->ci_smarty->assign('glist',$list['data']);
        $this->ci_smarty->assign('pages',$showpage['show']);
        $this->ci_smarty->display('statistics/shoot_back_count.tpl');
    }
    
    
    
    
    function shootDetail($shootUserId){
        $page_url=$this->root_path.'statistics/shootDetail/'.$shootUserId.'?';
        $project_list=$this->Project_model->getProjectList(array());
        $this->ci_smarty->assign('project_list',$project_list['data']);
        
        $type_list=$this->product->getCatgroryList();
        $this->ci_smarty->assign('type_list',$type_list['data']);
        
        $statusList=$this->PublicFuc_model->getStatusList('shootStatus');
        $this->ci_smarty->assign('statusList',$statusList);
        
        $this->ci_smarty->assign('shootUserId',$shootUserId);
        
        $arr=$this->input($page_url);
        $arr['userId']=$shootUserId;
        $user_p['upUserId']=$shootUserId;
        $u=$this->user_model->getInfo($user_p);
        $u=json_decode($u,true);
        
        $this->ci_smarty->assign('uInfo',$u);
        $list=$this->Statistics_model->shootDetailList($arr);
        $showpage= parent::page($page_url,10,$list['count']);
        $this->ci_smarty->assign('slist',$list['data']);
        $this->ci_smarty->assign('pages',$showpage['show']);
        $this->ci_smarty->display('statistics/shoot_count_detail.tpl');
    }
    
    
    function shootCheckList(){
        $page_url=$this->root_path.'statistics/shootCheckList/?';
        $group_list= $this->user_model->getGroupListByRole(3);
        $this->ci_smarty->assign('group_list',$group_list['list']);
        
        $arr=$this->input($page_url);
        
        $list=$this->Statistics_model->shootCheckList($arr);
       
        $showpage= parent::page($page_url,10,$list['count']);
        $this->ci_smarty->assign('slist',$list['data']);
        $this->ci_smarty->assign('pages',$showpage['show']);
        
        $this->ci_smarty->display('statistics/shoot_check_count.tpl');
    }
    
    
    function inputList(){
        $page_url=$this->root_path.'statistics/inputList/?';
        
        $group_list= $this->user_model->getGroupListByRole(2);
        $this->ci_smarty->assign('group_list',$group_list['list']);
        
        $project_list=$this->Project_model->getProjectList();
        $this->ci_smarty->assign('project_list',$project_list['data']);
        
        
        $arr=$this->input($page_url);
        $list=$this->Statistics_model->getInputList($arr);
        $showpage= parent::page($page_url,10,$list['count']);
        $this->ci_smarty->assign('glist',$list['data']);
        $this->ci_smarty->assign('pages',$showpage['show']);
        
        
        $this->ci_smarty->display('statistics/record_count.tpl');
    }
    
    function inputDetail($inputUserId){
        $page_url=$this->root_path.'statistics/shootDetail/'.$inputUserId.'?';
        $statusList=$this->PublicFuc_model->getStatusList('status');
        $this->ci_smarty->assign('statusList',$statusList);
        
        $project_list=$this->Project_model->getProjectList(array()); 
        $this->ci_smarty->assign('project_list',$project_list['data']);
       
        $type_list=$this->product->getCatgroryList();
        $this->ci_smarty->assign('type_list',$type_list['data']);
        
        
        $arr=$this->input($page_url);
        $arr['userId']=$inputUserId;
        $user_p['upUserId']=$inputUserId;
        $u=$this->user_model->getInfo($user_p);
        $u=json_decode($u,true);
        
        $this->ci_smarty->assign('uInfo',$u);
        
        $list=$this->Statistics_model->getInputDetail($arr);
        $showpage= parent::page($page_url,10,$list['count']);
        $this->ci_smarty->assign('glist',$list['data']);
        $this->ci_smarty->assign('pages',$showpage['show']);
        $this->ci_smarty->display('statistics/record_count_detail.tpl');
    }
    
    
    function input($page_url){

        $arr['is_ext']='no';
        
        if($this->input->get('gtin')!=""){
            $arr['gtin']=$this->input->get('gtin');
            $this->ci_smarty->assign('gtin',$arr['gtin']);
            $page_url.="gtin=".$arr['gtin'];
        }
        
        if($this->input->get('gName')!=""){
            $arr['gName']=$this->input->get('gName');
            $this->ci_smarty->assign('gName',$arr['gName']);
            $page_url.="gName=".$arr['gName'];
        }
        
        if($this->input->get('catgroy1')!=""){
            $arr['catgroy1']=$this->input->get('catgroy1');
            $this->ci_smarty->assign('catgroy1',$arr['catgroy1']);
            $page_url.="catgroy1=".$arr['catgroy1'];
        }
        
        if($this->input->get('shootStatus')!=""){
            $arr['shootStatus']=$this->input->get('shootStatus');
            $this->ci_smarty->assign('shootStatus',$arr['shootStatus']);
            $page_url.="shootStatus=".$arr['shootStatus'];
        }
        
        if($this->input->get('retouchStatus')!=""){
            $arr['retouchStatus']=$this->input->get('retouchStatus');
            $this->ci_smarty->assign('retouchStatus',$arr['retouchStatus']);
            $page_url.="retouchStatus=".$arr['retouchStatus'];
        }
        
        if($this->input->get('groupId')!=""||$this->input->get('userName')!=""){
            $user['groupId']=$this->input->get('groupId');
            $user['username']=$this->input->get('userName');
            $str=$this->user_model->getUserIdsByFiled($user);
            $user_id_list=json_decode($str,true);
            $arr['userIds']=serialize($user_id_list);
        
            $this->ci_smarty->assign('groupId',$user['groupId']);
            $this->ci_smarty->assign('username',$user['username']);
            $page_url.="groupId=".$user['groupId']."&userName=".$user['username'];
        }
        else{
            $str=$this->user_model->getUserIdsByFiled();
            $user_id_list=json_decode($str,true);
            $arr['userIds']=serialize($user_id_list);
        }
        
        
        if($this->input->get('startTime')!=""&&$this->input->get('endTime')!=""){
            $arr['startTime']=$this->input->get('startTime');
            $arr['endTime']=$this->input->get('endTime');
            $this->ci_smarty->assign('startTime',$arr['startTime']);
            $this->ci_smarty->assign('endTime',$arr['endTime']);
            $page_url.="startTime=".$arr['startTime']."&endTime=".$arr['endTime'];
        
            $arr['sTime']=strtotime($arr['startTime']);
            $arr['eTime']=strtotime($arr['endTime']);
        }
        
        if($this->input->get('page')!=""){
            $arr['page']=$this->input->get('page');
        }
        else{
            $arr['page']=1;
        }
        
        $arr['pageUrl']=$page_url;
        
        return $arr;

    }
    
    
    
}