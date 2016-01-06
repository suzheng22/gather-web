<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Input extends My_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('input/input_model');
        $this->load->model('ps/marlboro_model');
        $this->load->model('publicFuc/publicFuc_model', 'publicFuc');
    }
    function inputManager(){
        $page_url=$this->root_path."input/inputManager?";
        /*处理表单数据*/
        $page=$this->input->get('page');
        if(!isset($get['status'])){
            $get['status']=null;
        }
        $get=$this->input->get();
        unset($get['page']);
        $page_url=$this->publicFuc->getUrl($page_url,$get);
        $get=$this->getPage($get,$page);
        $get['token']=$this->user_info['token'];
        $list=$this->input_model->getInputList($get);
        $showpage= parent::page($page_url,10,$list['count']);
        $this->ci_smarty->assign('glist',$list['data']);
        $this->ci_smarty->assign('pages',$showpage['show']);
        $this->ci_smarty->display('input/inputManager.tpl');
    }
    function index(){
        $data=$this->input->get();
        $data['token']=$this->user_info['token'];
        $data['orderId']=$data['inputId'];
        $list=$this->marlboro_model->getAllImage($data);
        //获取图片
        $this->ci_smarty->assign('plist',$list);
        $this->ci_smarty->assign('picList',$list[1]);
        //根据orderId获取相关信息
        $inputInfo=$this->input_model->getInputInfo($data);
        var_dump($inputInfo);
        $this->ci_smarty->assign('p_info',$inputInfo);
        $this->ci_smarty->display('input/record.tpl');
    }
    function inputAdd(){
        $data['token']=$this->user_info['token'];
        //根据orderId获取相关信息
        $inputInfo=$this->input_model->getInputSend($data);
        $data['gtin']=$inputInfo['gtin'];
        $data['packet']=$inputInfo['packet'];
        $list=$this->input_model->getAllImage($data);
        $this->ci_smarty->assign('p_info',$inputInfo);
        $this->ci_smarty->assign('plist',$list);
        $this->ci_smarty->assign('picList',$list[1]);
       $this->ci_smarty->display('input/record.tpl');
    }



    function saveBaseInfo(){
        $data['name']=$this->input->post('name');
        $data['brand']=$this->input->post('brand');
        $data['good_class']=$this->input->post('good_class');
        $data['mfrs']=$this->input->post('mfrs');
        $data['produce_no']=$this->input->post('produce_no');
        $data['sell_point']=$this->input->post('sell_point');
        $data['gtin']=$this->input->post('gtin');

       $ret= $this->input_model->saveBaseInfo($data);
       echo $ret;exit;
    }
    
    function saveFactoryInfo(){
        $data['m'][0]['mName']=$this->input->post('mName');
        $data['m'][0]['number1']=$this->input->post('number1');
        $data['m'][0]['number2']=$this->input->post('number2');
        $data['m'][0]['phone']=$this->input->post('phone');
        $data['m'][0]['address']=$this->input->post('address');
        $data['m'][0]['type']=$this->input->post('type');
        $data['gtin']=$this->input->post('gtin');
        $data['m'][0]['id']=$this->input->post('fid');
        $ret= $this->input_model->saveFactoryInfo($data);
        echo $ret;exit;
    }
    
    function save(){
        $data['gtin']=$this->input->post('gtin');
        $data['uid']=$this->user_info['userId'];
        $ret= $this->input_model->save($data);
        echo $ret;exit;
    }
    
    function saveBasicInfo(){
        $str=$this->input->post('str');
        $data['gtin']=$this->input->post('gtin');
        $list=explode("&", $str);
        foreach($list as $key=>$value){
            $obj=explode('=',$value);
            $data['basic'][$obj[0]]=$obj[1];
        }
        $ret= $this->input_model->saveBasicInfo($data);
        print_r($ret);exit;
    }
    
    function SaveNutrient(){
        $str=$this->input->post('str');
        $data['gtin']=$this->input->post('gtin');
        $list=explode("&", $str);
        foreach($list as $key=>$value){
            $obj=explode('=',$value);
            $data['y'][$key]['key']=$obj[0];
            $data['y'][$key]['value']=$obj[1];
            $data['y'][$key]['nrv']=$obj[2];
        }
        $ret= $this->input_model->SaveNutrient($data);
        print_r($ret);exit;
    }

}