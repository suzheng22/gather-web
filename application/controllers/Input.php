<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Input extends My_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('input/input_model');
        $this->load->model('ps/marlboro_model');
    }
    function inputManager(){
        $this->ci_smarty->display('input/inputManager.tpl');
    }
    function index(){
        $data['token']=$this->user_info['token'];
        $data['orderId']=$this->input->get("orderId");
        $data['gtin']=$this->input->get("gtin");
        $data['batchNo']=1;
        $data['packet']=1;
        $list=$this->marlboro_model->getAllImage($data);
        //获取图片
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