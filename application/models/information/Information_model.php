<?php
class Information_model extends MY_Model{
    public function __construct(){
        parent::__construct();
    }
    /*获取商品基本信息列表*/
    function getBaseInfoList($data){
        $token=$data['token'];
        $url=$this->more_api_url."/lingmall/information/getBaseInfoList?token=$token";
        $return=$this->curl($url,$data);
        $list=json_decode($return,true);
        return $list;
    }

    /*获取商品营养成分信息列表*/
    function getNutrientList($data){
        $token=$data['token'];
        $url=$this->more_api_url."/lingmall/information/NutrientList?token=$token";
        $return=$this->curl($url,$data);
        $list=json_decode($return,true);
        return $list;
    }
    /*新增商品基本信息*/
    public function addBaseInfo($data){
        $token=$data['token'];
        $url=$this->more_api_url."/lingmall/information/NutrientList?token=$token";
        $return=$this->curl($url,$data);
        $list=json_decode($return,true);
        return $list;
    }
    /*新增营养成分信息*/
    public function addNutrientInfo($data){
        $token=$data['token'];
        $url=$this->more_api_url."/lingmall/information/NutrientList?token=$token";
        $return=$this->curl($url,$data);
        $list=json_decode($return,true);
        return $list;
    }
    /*改变商品基本信息状态*/
    public function changeBaseStatus($data){
        $token=$data['token'];
        $url=$this->more_api_url."/lingmall/information/NutrientList?token=$token";
        $return=$this->curl($url,$data);
        $list=json_decode($return,true);
        return $list;
    }

    /*改变营养成分的状态*/
    public function changeNutrientStatus($data){
        $token=$data['token'];
        $url=$this->more_api_url."/lingmall/information/NutrientList?token={$token}";
        $return=$this->curl($url,$data);
        $list=json_decode($return,true);
        return $list;
    }
}