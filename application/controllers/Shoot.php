<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Shoot extends My_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('user/project_model','project');
        $this->load->model('sdk/product_model','product');
        $this->load->model('ps/marlboro_model','marlboro');
        $this->load->model('user/user_model','user');
        $this->load->model('publicFuc/publicFuc_model','publicFuc');
    }
    //无法测量管理
    function noMeasure(){
        $data['userId']=$this->user_info['userId'];
        $data['token']=$this->user_info['token'];
        //商品分类的查询
        $type_list=$this->product->getCatgroryList();
        $this->ci_smarty->assign('type_list',$type_list['data']);
        $page_url=$this->root_path.'shoot/noMeasure?';
        $project_list=$this->project->getProjectList($data);
        $this->ci_smarty->assign('project_list',$project_list['data']);
        //加入项目
        $page=$this->input->get('page');
        if(!isset($get['status'])){
            $get['status']=null;
        }
        $get=$this->input->get();
        //去掉page重新匹配
        unset($get['page']);
        $page_url=$this->publicFuc->getUrl($page_url,$get);
        $arr=$this->getPage($get,$page);
        if($arr['s_time']!=''&&$arr['e_time']!=''){
            $arr['s_time']=strtotime($arr['s_time']);
            $arr['e_time']=strtotime($arr['e_time']);
        }
        $arr['userId']=$this->user_info['userId'];
        $arr['token']=$this->user_info['token'];
        //获取无法测量管理列表
        $noMeasureList=$this->marlboro->getNoMeasureList($arr);
        if($arr['is_ext']==1){
            $fileName='无法测量';
            $fields=array('序号','商品条形码','商品名称','商品分类','项目名称','加入时间','测量人');
            $querys =$noMeasureList['data'];
            $query=array();
            $i=0;
            foreach($querys as $key1=>$val){
                $query[$i]['lId']=$val['lId'];
                $query[$i]['gtin']=$val['gtin'];
                $query[$i]['gName']=$val['gName'];
                $query[$i]['catName']=$val['catName'];
                $query[$i]['pName']=$val['pName'];
                $query[$i]['creatTime']=date("Y-m-d H:i:s",$val['creatTime']);
                $query[$i]['shootName']=$val['measurement'];
                $i++;
            }
            //var_dump($query);
            echo $this->phpExcel($fileName,$fields, $query,'','25','20');
        }
        $showPage= parent::page($page_url,10,$noMeasureList['total']);
        //获取项目标签
        $this->ci_smarty->assign('mlist',$noMeasureList['data']);
        $this->ci_smarty->assign('pages',$showPage['show']);
        $this->ci_smarty->display('shoot/no_measure.tpl');
    }
    //无法拍摄
    function noShoot(){
        $data['userId']=$this->user_info['userId'];
        $data['token']=$this->user_info['token'];
        //商品分类的查询
        $type_list=$this->product->getCatgroryList();
        $this->ci_smarty->assign('type_list',$type_list['data']);
        $project_list=$this->project->getProjectList($data);
        $this->ci_smarty->assign('project_list',$project_list['data']);
        $page_url=$this->root_path.'shoot/noShoot?';
        //加入项目
        $page=$this->input->get('page');
        if(!isset($get['status'])){
            $get['status']=null;
        }
        $get=$this->input->get();
        //去掉page重新匹配
        unset($get['page']);
        $page_url=$this->publicFuc->getUrl($page_url,$get);
        $arr=$this->getPage($get,$page);
        if($arr['s_time']!=''&&$arr['e_time']!=''){
            $arr['s_time']=strtotime($arr['s_time']);
            $arr['e_time']=strtotime($arr['e_time']);
        }
        $arr['userId']=$this->user_info['userId'];
        $arr['token']=$this->user_info['token'];
        //获取无法测量管理列表
        $noMeasureList=$this->marlboro->getNoShootList($arr);
        if($arr['is_ext']==1){
            $fileName='无法拍摄统计';
            $fields=array('序号','商品条形码','商品名称','商品分类','项目名称','加入时间','拍摄人');
            $querys =$noMeasureList['data'];
            $query=array();
            $i=0;
           foreach($querys as $key1=>$val){
                   $query[$i]['lId']=$val['lId'];
                   $query[$i]['gtin']=$val['gtin'];
                   $query[$i]['gName']=$val['gName'];
                   $query[$i]['catName']=$val['catName'];
                   $query[$i]['pName']=$val['pName'];
                   $query[$i]['creatTime']=date("Y-m-d H:i:s",$val['creatTime']);;
                   $query[$i]['shootName']=$val['measurement'];
               $i++;
           }
            echo $this->phpExcel($fileName,$fields, $query,'','25','20');
        }
        $showPage= parent::page($page_url,10,$noMeasureList['total']);
        //获取项目标签
        $this->ci_smarty->assign('slist',$noMeasureList['data']);
        $this->ci_smarty->assign('pages',$showPage['show']);
        $this->ci_smarty->display('shoot/no_shoot.tpl');
    }
    //拍摄新增管理
    function shootAddManager(){
        $data['userId']=$this->user_info['userId'];
        $data['token']=$this->user_info['token'];
        //商品分类的查询
        $type_list=$this->product->getCatgroryList();
        $this->ci_smarty->assign('type_list',$type_list['data']);
        $project_list=$this->project->getProjectList($data);
        $this->ci_smarty->assign('project_list',$project_list['data']);
        $page_url=$this->root_path.'shoot/shootAddManager?';
        //加入项目
        $page=$this->input->get('page');
        if(!isset($get['status'])){
            $get['status']=null;
        }
        $get=$this->input->get();
        //去掉page重新匹配
        unset($get['page']);
        $page_url=$this->publicFuc->getUrl($page_url,$get);
        $arr=$this->getPage($get,$page);
        if($arr['s_time']!='' && $arr['e_time']!=''){
            $arr['s_time']=strtotime($arr['s_time']);
            $arr['e_time']=strtotime($arr['e_time']);
        }
        $arr['userId']=$this->user_info['userId'];
        $arr['token']=$this->user_info['token'];

        //获取拍摄管理列表
        $shootAddList=$this->marlboro->getShootAddList($arr);
        if($arr['is_ext']==1){
            $fileName='拍摄新增统计';
            $fields=array('序号','商品条形码','商品名称','商品分类','包装','新增描述','项目名称','加入时间','新增人','未审核');
            $querys =$shootAddList['data'];
            $query=array();
            $i=0;
            foreach($querys as $key1=>$val){
                $query[$i]['lId']=$val['lId'];
                $query[$i]['gtin']=$val['gtin'];
                $query[$i]['gName']=$val['gName'];
                $query[$i]['catName']=$val['catName'];
                $query[$i]['pName']=$val['pName'];
                $query[$i]['packet']="包装".$val['packet'];
                $query[$i]['momo']=$val['momo'];
                $query[$i]['creatTime']=date("Y-m-d H:i:s",$val['creatTime']);;
                $query[$i]['measurement']=$val['measurement'];
                if($val['status']==1){
                    $query[$i]['status']='未审核';
                }else if($val['status']==1){
                    $query[$i]['status']='已通过';
                }else{
                    $query[$i]['status']='驳回';
                }
                $i++;
            }
            echo $this->phpExcel($fileName,$fields, $query,'','25','20');
        }
        //  var_dump($shootAddList);
        $showPage= parent::page($page_url,10,$shootAddList['total']);
        //获取项目标签
        $this->ci_smarty->assign('slist',$shootAddList['data']);
        $this->ci_smarty->assign('pages',$showPage['show']);
        $this->ci_smarty->display('shoot/shoot_add_manager.tpl');
    }
    //拍摄驳回统计
    function shootBackDetail(){
        $arr['userId']=$this->user_info['userId'];
        $arr['token']=$this->user_info['token'];
        //商品分类的查询
        $type_list=$this->product->getCatgroryList();
        $this->ci_smarty->assign('type_list',$type_list['data']);
        $project_list=$this->project->getProjectList($arr);
        $this->ci_smarty->assign('project_list',$project_list['data']);
        $page_url=$this->root_path.'shoot/shootBackDetail?';
        //获取传递参数并转为page_yrl
        $page=$this->input->get('page');
        if(!isset($get['status'])){
            $get['status']=null;
        }
        $get=$this->input->get();
        //去掉page重新匹配
        unset($get['page']);
        $page_url=$this->publicFuc->getUrl($page_url,$get);
        $arr=$this->getPage($get,$page);
        if($arr['s_time']!=''&&$arr['e_time']!=''){
            $arr['s_time']=strtotime($arr['s_time']);
            $arr['e_time']=strtotime($arr['e_time']);
        }
        $arr['userId']=$this->user_info['userId'];
        $arr['token']=$this->user_info['token'];
        //获取拍摄管理列表
        $shootBackList=$this->marlboro->getShootBackList($arr);
        //导出拍摄驳回
        if($arr['is_ext']==1){
            $fileName='拍摄驳回统计';
            $fields=array('序号','项目名称','商品条形码','商品名称','商品分类','包装','批次','驳回原因','驳回时间','处理状态');
            $querys =$shootBackList['data'];
            $query=array();
            $i=0;
            foreach($querys as $key1=>$val){
                $query[$i]['lId']=$val['lId'];
                $query[$i]['pName']=$val['pName'];
                $query[$i]['gtin']=$val['gtin'];
                $query[$i]['gName']=$val['gName'];
                $query[$i]['catName']=$val['catName'];
                $query[$i]['packet']="包装".$val['packet'];
                $query[$i]['batchNo']="批次".$val['batchNo'];
                $query[$i]['memo']=$val['memo'];
                $query[$i]['creatTime']=date("Y-m-d H:i:s",$val['creatTime']);
                if($val['status']==3){
                    $query[$i]['status']='驳回';
                }
                $i++;
            }
            echo $this->phpExcel($fileName,$fields, $query,'','25','20');
        }
        $showPage= parent::page($page_url,10,$shootBackList['total']);
        $this->ci_smarty->assign('slist',$shootBackList['data']);
        $this->ci_smarty->assign('pages',$showPage['show']);
        $this->ci_smarty->display('shoot/shoot_back_detail.tpl');
    }
    //根据商品条形码获取商品数据
    function getGoodsByGtin(){
        $arr['userId']=$this->user_info['userId'];
        $arr['token']=$this->user_info['token'];
        $arr['gtin']=$this->input->post('gtin');
        //$arr['gtin']='6920177962076';
        $data=$this->marlboro->getInfoByGtin($arr);
        //获取所有的项目
        echo $data;
    }
    //增加拍摄操作
    function addShoot(){
        //当前用户ID
        $data=$this->input->post();
        $data['userId']=$this->user_info['userId'];
        $data['token']=$this->user_info['token'];
        $datas=$this->marlboro->saveNewPic($data);
        echo json_encode($datas);
        exit;
    }
    /*获取单个拍摄新增的详细信息*/
    function getNewPicInfo(){
        $data=$this->input->post();
        $data['userId']=$this->user_info['userId'];
        $data['token']=$this->user_info['token'];
        $datas=$this->marlboro->getNewPicInfo($data);
        echo json_encode($datas);
        exit;
    }
}