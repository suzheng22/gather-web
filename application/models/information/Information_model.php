<?php
class Information_model extends MY_Model{
    public function __construct(){
        parent::__construct();
    }
    /*获取商品基本信息列表*/
    function getBaseInfoList($data){
        $data['token']=urldecode($data['token']);
        $url=$this->more_api_url."lingmall/input/list";
        $return=$this->curl($url,$data,'get');
        $list=json_decode($return,true);
        return $list;
    }

    /*新增商品基本信息*/
    public function addBaseInfo($data){
        $token=$data['token'];
        $arr['fieldName']=$data['fieldName'];
        $arr['inputType']=$data['inputType'];
        $arr['catId']=$data['catId'];
        $arr['isNums']=$data['isNums'];
        $arr['sort']=$data['sort'];
        $arr['desc']=$data['desc'];
        $arr['filedType']=$data['filedType'];
        $data=json_encode($arr);
       // echo $data;
    //    return $data;
        $url=$this->more_api_url."lingmall/input/add?token=$token";
        $return=$this->curl($url,$data,'post');
        $list=json_decode($return,true);
        return $list;
    }

    /*改变商品基本信息状态*/
    public function changeBaseStatus($data){
        $token=$data['token'];
        $field=$data['field'];
        $data=json_encode($data);
        $url=$this->more_api_url."lingmall/input/{$field}?token=$token";
        $return=$this->curl($url,$data,'put');
        $list=json_decode($return,true);
        return $list;
    }

    /*获取商品营养成分信息列表*/
    function getNutrientList($data){
        $data['token']=urldecode($data['token']);
        $url=$this->more_api_url."lingmall/nutrition/list";
        $return=$this->curl($url,$data,'get');
        if(!$return){
            $return='{
        "count":20,
        "data":[{
         "nutritionId":"213123123",
         "nutritionName":"213123123",
         "nutritionUnit":"213123123",
         "nutritionUnitEn":"213123123",
         "createTime":"14225638941",
         "createUserId":"213123123",
         "status":"2",
         "updateUserId":"213123123",
         "updateTime":"213123123",
         "isDefault":"213123123",
         "desc":"213123123"
        }]
        }';
        }
        $list=json_decode($return,true);
        return $list;
    }
    /*新增营养成分信息*/
    public function addNutrientInfo($data){
        $arr['desc']=$data['desc'];
        $arr['nutritionName']=$data['nutritionName'];
        $arr['nutritionUnit']=$data['nutritionUnit'];
        $arr['isDefault']=$data['isDefault']=1;
        $arr['nutritionUnitEn']=$data['nutritionUnitEn'];
        $token=$data['token'];
        $data=json_encode($arr);
        $url=$this->more_api_url."lingmall/nutrition/add?token=$token";
        $return=$this->curl($url,$data,'post');
        $list=json_decode($return,true);
        return $list;
    }
    /*改变营养成分的状态*/
    public function changeNutrientStatus($data){
        $token=$data['token'];
        $nutritionId=$data['nutritionId'];
        $arr['status']=$data['status'];
        $data=json_encode($arr);
        $url=$this->more_api_url."lingmall/nutrition/{$nutritionId}?token={$token}";
        $return=$this->curl($url,$data,'put');
        $list=json_decode($return,true);
        return $list;
    }
}