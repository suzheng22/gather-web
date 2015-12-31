<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Marlboro extends My_Controller {
    public function __construct()
    {
        parent::__construct();
        $this->load->model('ps/marlboro_model');
        $this->load->model('user/user_model');
        $this->load->model('publicFuc/publicFuc_model','publicFuc');
        $this->load->model('sdk/product_model','product');
        $this->load->model('user/project_model','project');
    }
    function shootDetailPic($orderId,$gtin,$batchNo){
        $this->load->model('sdk/product_model','product');
        $this->load->model('user/project_model','project');
        $arr=$this->input->get();
        $arr['userId']=$this->user_info['userId'];
        $arr['token']=$this->user_info['token'];
        //获取图片
        $list=$this->marlboro_model->getAllImage($arr);
        $product_info=$this->marlboro_model->getMarlboroInfo($arr);
        $product_info['userId']=$this->user_info['userId'];
        $product_info['token']=$this->user_info['token'];

      //  $product_info=$this->product->getProduct($arr);
       //var_dump($list);
        $arr['proName']=$product_info['proName'];
        $arr['catgrory']=$product_info['type'];
        $this->ci_smarty->assign('p_info',$product_info);
        $this->ci_smarty->assign('plist',$list);
        $this->ci_smarty->assign('picList',$list[1]);
        $this->ci_smarty->assign('pic_path',"http://7xny7g.com2.z0.glb.qiniucdn.com/");
        $this->ci_smarty->display('shoot_check_pic.tpl');
    }
    //拍摄审核
    function shoot(){
        $this->load->model('user/user_model','user');
        $this->load->model('user/project_model','project');
        $data['userId']=$this->user_info['userId'];
        $data['token']=$this->user_info['token'];
        $page_url=$this->root_path.'/marlboro/shoot?';
        $group_list=$this->user_model->getGroupListByRole(3);
        $this->ci_smarty->assign('group_list',$group_list['list']);
        //获取项目
        $project_list=$this->project->getProjectList($data);
        $this->ci_smarty->assign('project_list',$project_list['data']);
        $page=$this->input->get('page');
        $get=$this->input->get();
        //去掉page重新匹配
        unset($get['page']);
        $page_url=$this->publicFuc->getUrl($page_url,$get);
        $arr=$this->getPage($get,$page);
        $arr['token']=$this->user_info['token'];
        //根据用户名和用户组确定userId
            $str=$this->user->getUserIdsByFiled($arr);
            if($str){
                $user_id_list=json_decode($str,true);
                $arr['photoIds']=serialize($user_id_list);
            };
        //增加参数
        $list=$this->marlboro_model->getMarlboroList1($arr);
        $showpage= parent::page($page_url,10,$list['total']);
        $this->ci_smarty->assign('glist',$list['data']);
        $this->ci_smarty->assign('pages',$showpage['show']);
        $this->ci_smarty->display('shoot_check.tpl');
    }
    //拍摄详情
    function shootDetail($userId,$total,$no,$auto){
        $this->load->model('user/user_model','user');
        $this->load->model('sdk/product_model','product');
        $this->load->model('user/project_model','project');
        $data['userId']=$this->user_info['userId'];
        $data['token']=$this->user_info['token'];
        $data['upUserId']=$userId;
        //获取个人信息
        $str=$this->user->getInfo($data);
        $u_info=json_decode($str,true);
        $this->ci_smarty->assign('u_info',$u_info);
        //商品分类列表
        $type_list=$this->product->getCatgroryList();
        $this->ci_smarty->assign('type_list',$type_list['data']);
        //获取项目
        $project_list=$this->project->getProjectList($data);
        $this->ci_smarty->assign('project_list',$project_list['data']);
        $page_url=$this->root_path."Marlboro/shootDetail/{$userId}/{$total}/{$no}/{$auto}?";
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
        //增加参数
        if($arr['s_time']!=''&&$arr['e_time']!=''){
            $arr['s_time']=strtotime($arr['s_time']);
            $arr['e_time']=strtotime($arr['e_time']);
        }
        $arr['photoId']=$userId;
        $list=$this->marlboro_model->getMarlboroDetail($arr);
        //项目
        $showpage= parent::page($page_url,10,$list['total']);
        $this->ci_smarty->assign('auto',$auto);
        $this->ci_smarty->assign('no',$no);
        $this->ci_smarty->assign('total',$total);
        $this->ci_smarty->assign('glist',$list);
        $this->ci_smarty->assign('pages',$showpage['show']);
        $this->ci_smarty->display('shoot_check_detail.tpl');
    }
    //拍摄通过
    function shootPass(){
        $data['type']=$this->input->post('type');
        $data['status']=$this->input->post('status');
        $data['orderId']=$this->input->post('orderId');
        $data['userId']=$this->user_info['userId'];
        $data['token']=$this->user_info['token'];
        $data['memo']=$this->input->post('memo');
        //审核通过和驳回
        if($data['type']==1){
            $str=$this->marlboro_model->marlboro($data);
            echo json_encode($str);
        }else{
            //批量通过
            $data['orderIds']=$data['orderId'];
            $data['orderIds']=explode(",",$data['orderIds']);
            array_pop($data['orderIds']);
            $str=$this->marlboro_model->batchMarlboro($data);
            echo json_encode($str);
        }
    }
    //增加缺图
    function addMissFigure(){
        $data=$this->input->post();
        $data['userId']=$this->user_info['userId'];
        $data['token']=$this->user_info['token'];
        $str=$this->marlboro_model->addMissFigure($data);
        $str['msg']='添加成功';
        echo json_encode($str);
    }
    //获取拍摄
    function getShoot(){
        $data['shootId']=$this->input->post('shootId');
        $return=$this->marlboro_model->getShootInfo($data);
        echo json_encode($return);
    }
    /*拍摄反馈管理*/
    function shootBackManager(){
        $data['userId']=$this->user_info['userId'];
        $data['token']=$this->user_info['token'];
        //商品分类的查询
        $type_list=$this->product->getCatgroryList();
        $this->ci_smarty->assign('type_list',$type_list['data']);
        $project_list=$this->project->getProjectList($data);
      //  var_dump($project_list);
        $this->ci_smarty->assign('project_list',$project_list['data']);
        $page_url=$this->root_path.'marlboro/shootBackManager?';
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
        $arr['token']=$this->user_info['token'];
        //获取拍摄管理列表
        $shootBackManager=$this->marlboro_model->getShootBackManager($arr);
        if($arr['is_ext']==1){
            $fileName='拍摄反馈管理';
            $fields=array('序号','项目名称','商品条形码','商品名称','商品分类','包装','批次','反馈原因','反馈时间','反馈状态','反馈路径','反馈人');
            $querys =$shootBackManager['data'];
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
                if($val['status']==1){
                    $query[$i]['status']='反馈中';
                }else if($val['status']==1){
                    $query[$i]['status']='反馈通过';
                }else if($val['status']==3){
                    $query[$i]['status']='反馈驳回';
                }
                if($val['feedPath']==1){
                    $query[$i]['feedPath']='修图反馈';
                }else{
                    $query[$i]['feedPath']='录入反馈';
                }
                $query[$i]['measurement']=$val['measurement'];
                $i++;
            }
            echo $this->phpExcel($fileName,$fields, $query,'','15','15');
        }
        $showPage= parent::page($page_url,5,$shootBackManager['total']);
        //获取项目标签
        $this->ci_smarty->assign('slist',$shootBackManager['data']);
        $this->ci_smarty->assign('pages',$showPage['show']);
        $this->ci_smarty->display('shoot/shoot_back_manager.tpl');
    }
    //拍摄反馈详情页面
    function shootBackPic(){
        $this->load->model('sdk/product_model','product');
        $this->load->model('user/project_model','project');
        $arr=$this->input->get();
        $arr['userId']=$this->user_info['userId'];
        $arr['token']=$this->user_info['token'];
        //获取图片
        $list=$this->marlboro_model->getAllImage($arr);
        $product_info=$this->marlboro_model->getFeedInfo($arr);
        $product_info['userId']=$this->user_info['userId'];
        $product_info['token']=$this->user_info['token'];
        $arr['proName']=$product_info['proName'];
        $arr['catgrory']=$product_info['type'];
        $this->ci_smarty->assign('p_info',$product_info);
        $this->ci_smarty->assign('plist',$list);
        $this->ci_smarty->assign('picList',$list[1]);
        $this->ci_smarty->assign('pic_path',"http://7xny7g.com2.z0.glb.qiniucdn.com/");
        $this->ci_smarty->display('shoot/shoot_back_pic.tpl');
    }
    function shootBackPass(){
        $data['status']=$this->input->post('status');
        $data['fId']=$this->input->post('orderId');
        $data['token']=$this->user_info['token'];
        $data['memo']=$this->input->post('memo');
        $str=$this->marlboro_model->shootBackPass($data);
        echo $str;
    }

}