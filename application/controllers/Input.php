<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Input extends My_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('input/input_model');
    }
    
    function index(){
        $data['uid']=$this->user_info['userId'];
        $data['lastLoginTime']=$this->user_info['lastLoginTime'];
        $skuInfo=$this->input_model->getSkuInfo($data);
        foreach ($skuInfo['type']['basic_info'] as $k=>$v){
            if($v[field]=='field14'&& $v['type']==2){
                $skuInfo['goods']['typeBasicInfo']['field14'];
                $temp_arr=unserialize($skuInfo['goods']['typeBasicInfo']['field14']);
                if(is_array($temp_arr)){
                    $skuInfo['Nutrient']=$temp_arr;
                }
            }
        }
        //exit;
       //print_r($skuInfo['Nutrient']);exit;
        $this->ci_smarty->assign('skuInfo', $skuInfo);
        $this->ci_smarty->display('input.tpl');
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