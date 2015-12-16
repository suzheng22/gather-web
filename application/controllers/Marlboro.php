<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Marlboro extends My_Controller {
    public function __construct()
    {
        parent::__construct();
        $this->load->model('ps/marlboro_model');
        $this->load->model('user/user_model');
        $this->load->model('publicFuc/publicFuc_model','publicFuc');
    }
    function shootDetailPic($orderId,$gtin){
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
        $arr=$this->input->get();
        if(!isset($arr['page'])){
            $post['page']=1;
        }
        $arr['userId']=$this->user_info['userId'];
        $arr['token']=$this->user_info['token'];
        //根据用户名和用户组确定userId
        $str=$this->user->getUserIdsByFiled($arr);
        if($str){
            $user_id_list=json_decode($str,true);
           $arr['photoIds']=serialize($user_id_list);
        };
        //增加参数
        $page_url=$this->publicFuc->getUrl( $page_url,$arr);
        $list=$this->marlboro_model->getMarlboroList1($arr);
        $this->ci_smarty->assign('glist',$list);
        $this->ci_smarty->display('shoot_check.tpl');
    }
    //拍摄详情
    function shootDetail($userId,$no){
        $this->load->model('user/user_model','user');
        $this->load->model('sdk/product_model','product');
        $this->load->model('user/project_model','project');
        $data['userId']=$this->user_info['userId'];
        $data['token']=$this->user_info['token'];
        $data['upUserId']=$userId;
        $str=$this->user->getInfo($data);
        $u_info=json_decode($str,true);
        $this->ci_smarty->assign('u_info',$u_info);
        $type_list=$this->product->getCatgroryList();
        $this->ci_smarty->assign('type_list',$type_list['data']);
        //获取项目
        $project_list=$this->project->getProjectList($data);
        $this->ci_smarty->assign('project_list',$project_list['data']);
        $page_url=$this->root_path.'Marlboro/shootDetail/'.$userId.'?';
        $arr=$this->input->get();
        if(!isset($arr['status'])){
            $arr['status']=null;
        }
        if(!isset($arr['page'])){
            $arr['page']=1;
        }
        $arr['userId']=$this->user_info['userId'];
        $arr['token']=$this->user_info['token'];
        //增加参数
        $page_url=$this->publicFuc->getUrl($page_url,$arr);
        if($arr['s_time']!=''&&$arr['e_time']!=''){
            $arr['s_time']=strtotime($arr['s_time']);
            $arr['e_time']=strtotime($arr['e_time']);
        }
        $arr['photoId']=$userId;
        $list=$this->marlboro_model->getMarlboroDetail($arr);
       // var_dump($list);
        //项目
        $showpage= parent::page($page_url,10,$list['total']);
        $this->ci_smarty->assign('no',$no);
        $this->ci_smarty->assign('glist',$list['data']);
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
        //审核通过和驳回
        if($data['type']==1){
            $str=$this->marlboro_model->marlboro($data);
            echo json_encode($str);
        }else{
            //批量通过
            $orderId=explode(',',$data['orderId']);
            array_pop($orderId);
            $data['orderIds']=serialize($orderId);
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
        $data['token']=$this->user_info['token'];
        $this->ci_smarty->display('shoot/shoot_back_manager.tpl');
    }


}