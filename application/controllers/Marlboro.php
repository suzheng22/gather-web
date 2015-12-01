<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Marlboro extends My_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('ps/marlboro_model');
        $this->load->model('user/user_model');
    }
    
    function ps(){
        $data['userId']=$this->user_info['userId'];
        $data['token']=$this->user_info['token'];
        $group_list= $this->user_model->getGroupListByRole(6);

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
            $str=$this->user_model->getUserIdsByFiled($data);
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
       $data['token']=$this->user_info['token'];
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
       else {
           $this->ci_smarty->assign('status','NULL');
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
       $this->ci_smarty->assign('pages',$showpage['show']);
       $this->ci_smarty->display('ps_check_detail.tpl'); 
    }
    
    function psDetailPic($gtin){
        $this->load->model('sdk/product_model','product');
        $arr['gtin']=$gtin;
        $arr['type']='pic';
        $list=$this->marlboro_model->getMarlboroInfoPic($arr);
        $status=$this->marlboro_model->getReviewStatus($arr);

        foreach ($list['a3'] as $k=>$v){
            $png=$v;
            $v=str_replace('a3', 'a2', $v);
            $jpg=str_replace('png', 'JPG', $v);
            $str.="<li><img src='".$jpg."?imageView/1/w/50/h/50' mm='".$png."' /></li>";     
        }
        $this->ci_smarty->assign('png',$str);
        $product_info=$this->product->getProduct($arr);
        $this->ci_smarty->assign('p_info',$product_info);     
        $this->ci_smarty->assign('plist',$list);
        $this->ci_smarty->assign('status',$status['status']);
        $this->ci_smarty->display('ps_check_pic.tpl');
    }
    
    function shootDetailPic($gtin){
        $this->load->model('sdk/product_model','product');
        $arr['gtin']=$gtin;
        $arr['type']='shoot';
        $list=$this->marlboro_model->getMarlboroInfoPic($arr);
        $status=$this->marlboro_model->getReviewStatus($arr);
        $product_info=$this->product->getProduct($arr);
        //新增拍摄类型
        if(!isset($product_info['shootType']))
            $product_info['shootType']='立体';
        //项目
        if(!isset($product_info['project']))
            $product_info['project']='001';
        //包装
        if(!isset($product_info['pack']))
            $product_info['pack']='包装一';
        //批次
        if(!isset($product_info['batch']))
            $product_info['batch']='批次一';

        $this->ci_smarty->assign('p_info',$product_info);
        $this->ci_smarty->assign('plist',$list);
        $this->ci_smarty->assign('status',$status['status']);
        $this->ci_smarty->display('shoot_check_pic.tpl');
    }
    
    
    function checkStatus(){
        $data['gtin']=$this->input->post('gtin');
        $data['type']=$this->input->post('type');
        $data['status']=$this->input->post('status');
        $data['userId']=$this->user_info['userId'];
        $memo=$this->input->post('memo');
        $data['table']=$this->input->post('table');
        if(isset($memo)){
            $data['memo']=$this->input->post('memo');
        }
       echo $this->marlboro_model->changeStatus($data);exit;
    }
    
    function batchChangeStatus(){
        $data['rId']=$this->input->post('rId');
        $data['userId']=$this->user_info['userId'];
        $start_time=$this->input->post('start_time');
        $end_time=$this->input->post('end_time');
        $type=$this->input->post('type');
        $proName=$this->input->post('proName');
        $data['table']=$this->input->post('table');
        if(isset($start_time)&&isset($end_time)){
           $data['sTime']=strtotime($start_time);
           $data['eTime']=strtotime($end_time);
        }
        
        if(isset($type)){
            $data['type']=$type;
        }
        if(isset($proName)){
            $data['proName']=$proName;
        }
        echo $this->marlboro_model->batchChangeStatus($data);exit;
    }
    
    function shoot(){
        $this->load->model('user/user_model','user');
        $data['userId']=$this->user_info['userId'];
        $data['token']=$this->user_info['token'];
        
        $group_list=$this->user_model->getGroupListByRole(3);
        $this->ci_smarty->assign('group_list',$group_list['list']);
        //添加项目
//        $project_list=$this->user_model->getProjectListByRole(3);
//        $project_list=['list'=>['projectId'=>['001','002']]];
        $project_list=array(
            'list'=>array(
                '0'=>array(
                    'projectId'=>'1',
                    'projectName'=>'项目一'
                    ),
                '1'=>array(
                    'projectId'=>'2',
                    'projectName'=>'项目二')
            ));
        $this->ci_smarty->assign('project_list',$project_list['list']);

        $data['userName']=$this->input->get('userName');
        $data['groupId']=$this->input->get('groupId');
        $data['projectId']=$this->input->get("projectId");//1
      //  $data['projectId']='1';
        if($data['userName']!=''){
            $this->ci_smarty->assign('userName',$data['userName']);
        }
        
        if($data['groupId']!=''){
            $this->ci_smarty->assign('groupId',$data['groupId']);
        }
        if($data['projectId']!=''){
            $this->ci_smarty->assign('projectId',$data['projectId']);
        }//1

        if($data['userName']!='' ||$data['groupId']!='' || $data['projectId']){//1
            $str=$this->user->getUserIdsByFiled($data);
            $user_id_list=json_decode($str,true);
            $data['users']=serialize($user_id_list);
        }
        $list=$this->marlboro_model->getShootList($data);
        $this->ci_smarty->assign('glist',$list);
        $this->ci_smarty->display('shoot_check.tpl');
        
    }
    
    function shootDetail($userId){
        $this->load->model('user/user_model','user');
        $this->load->model('sdk/product_model','product');
        $data['userId']=$this->user_info['userId'];
        $data['token']=$this->user_info['token'];
        $data['upUserId']=$userId;
         
        $str=$this->user->getInfo($data);
        $u_info=json_decode($str,true);
        $this->ci_smarty->assign('u_info',$u_info);
        
        
        $type_list=$this->product->getType();
        $this->ci_smarty->assign('type_list',$type_list);
        //项目
        //$project_list=$this->user_model->getProjectListByRole(3);
        $project_list=array(
            'list'=>array(
                '0'=>array(
                    'projectId'=>'1',
                    'projectName'=>'项目一'
                ),
                '1'=>array(
                    'projectId'=>'2',
                    'projectName'=>'项目二')
            ));
        $this->ci_smarty->assign('project_list',$project_list['list']);
        
        $page_url=$this->root_path.'Marlboro/shootDetail/'.$userId.'?';
        $arr['rId']=$userId;
        $proName=$this->input->get('proName');
        $type=$this->input->get('type');
        $shootType=$this->input->get('shootType');
        //项目
        $project=$this->input->get('project');
        //包装
        $pack=$this->input->get('pack');
        //批次
        $batch=$this->input->get('batch');

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
        if(isset($shootType)){
            $arr['shootType']=$shootType;
            $page_url.='shootType='.$shootType."&";
            $this->ci_smarty->assign('shootType',$shootType);
        }
        //项目
        if(isset($project)){
            $arr['project']=$project;
            $page_url.='project='.$project.'&';
            $this->ci_smarty->assign('project',$project);
        }
        //包装
        if(isset($pack)){
            $arr['pack']=$pack;
            $page_url.='packe='.$pack."&";
            $this->ci_smarty->assign('pack',$pack);
        }
        //批次

        if(isset($batch)){
            $arr['batch']=$batch;
            $page_url.='batch='.$batch."&";
            $this->ci_smarty->assign('batch',$batch);
        }

        if(isset($status)){
            $arr['status']=$status;
            $page_url.='status='.$status."&";
            $this->ci_smarty->assign('status',$status);
        }
        else {
            $this->ci_smarty->assign('status
            ','NULL');
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
        
        $list=$this->marlboro_model->getShootInfo($arr);
        //项目
        foreach ($list as $key=>$val){
            if(isset($val['project'])){
                $list[$key]['project']='001';
            }

            if(isset($val['pack']))
                $list[$key]['pack']='包装一';
            if(isset($val['batch']))
                $list[$key]['batch']='批次一';
        }

        $showpage= parent::page($page_url,10,$list['totalCount']);
        $this->ci_smarty->assign('glist',$list);
        $this->ci_smarty->assign('pages',$showpage['show']);
        $this->ci_smarty->display('shoot_check_detail.tpl');
    }
    
    
    
}