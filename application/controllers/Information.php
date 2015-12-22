<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Information extends My_Controller{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('information/information_model', 'information');
        $this->load->model('sdk/product_model', 'product');
        $this->load->model('publicFuc/publicFuc_model', 'publicFuc');
    }
    /**
     * 基本信息管理
     * */
    public function baseInfoManager(){
        $data['token']=$this->user_info['token'];
        /*获取商品类型*/
        $type_list=$this->product->getCatgroryList();
        $this->ci_smarty->assign('type_list',$type_list['data']);
        $page_url=$this->root_path."information/baseInfoManager?";
        /*处理表单数据*/
        $get=$this->input->get();
        if(!isset($get['status'])){
            $get['status']=null;
        }
        if(!isset($get['page'])){
            $get['page']=1;
        }
        var_dump($get['page']);
        $page_url=$this->publicFuc->getUrl( $page_url,$get);
        $get['token']=$this->user_info['token'];
        /*获取基本信息列表*/
        $list=$this->information->getBaseInfoList($get);
        $showpage= parent::page($page_url,10,$list['count']);
        //开始分页
        $this->ci_smarty->assign('glist',$list['data']);
        $this->ci_smarty->assign('pages',$showpage['show']);
        $this->ci_smarty->display("information/base_info_manager.tpl");
    }
    /**
     * 营养成分
     * */
    public function nutrientInfo(){
        $data['token']=$this->user_info['token'];
        $page_url=$this->root_path."information/nutrientInfo?";
        /*处理表单数据*/
        $get=$this->input->get();
        if(!isset($get['status'])){
            $get['status']=null;
        }
        if(!isset($get['page'])){
            $get['page']=1;
        }
        $page_url=$this->publicFuc->getUrl( $page_url,$get);
        $get['token']=$this->user_info['token'];
        /*获取扩充成分列表*/
        $list=$this->information->getNutrientList($get);
        $showpage= parent::page($page_url,10,$list['count']);
        $this->ci_smarty->assign('glist',$list['data']);
        $this->ci_smarty->assign('pages',$showpage['show']);
        $this->ci_smarty->display("information/nutrient_info.tpl");
    }
    /*新增商品基本信息*/
    public function addBaseInfo(){
        $data=$this->input->post();
        $data['token']=$this->user_info['token'];
        /**/
        $return=$this->information->addBaseInfo($data);
        $data=json_encode($return);
        echo $data;
    }
    /*新增营养成分信息*/
    public function addNutrient(){
        $data=$this->input->post();
        $data['token']=$this->user_info['token'];
        /**/
        $return=$this->information->addNutrientInfo($data);
        $data=json_encode($return);
        echo $data;
    }
    /*改变商品基本信息状态*/
    public function changeBaseStatus(){
        $data=$this->input->post();
        $data['token']=$this->user_info['token'];
        /**/
        $return=$this->information->changeBaseStatus($data);
        $data=json_encode($return);
        echo $data;
    }
    /*改变营养成分的状态*/
    public function changeNutrientStatus(){
        $data=$this->input->post();
        $data['token']=$this->user_info['token'];
        /**/
        $return=$this->information->changeNutrientStatus($data);
        $data=json_encode($return);
        echo $data;
    }

}