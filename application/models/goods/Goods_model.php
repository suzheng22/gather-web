<?php
class Goods_model extends   MY_Model{
    public function __construct()
    {
        // Call the CI_Model constructor
        parent::__construct();
    }
    function getGoodsByGtin($data){
        $url=$this->tmore_api_url."/goods/getGoodsByGtin";
        $return=$this->curl($url,$data);
        return $return;
    }
    function getGoodsClassify($data){
        $data['token']=urldecode($data['token']);
       $data['returnType']=1;
        $url=$this->more_api_url."/lingmall/catgrory/gtinList";
        $return=$this->curl($url,$data,'get');
        $datas=json_decode($return,true);
        $c=($data['page']-1)*10;
        foreach($datas['data'] as $k=>$v){
            $c++;
            $datas['data'][$k]['lId']=$c;
           for($i=1;$i<=3;$i++){
               $re=$this->getInfo($v['catgrory'.$i]);
               $datas['data'][$k]['catgrorys'.$i]=$re['name'];
           }
        }
        return $datas;
    }
    function batchClassify($data){
        $token=$data['token'];
        $arr['ids']=$data['ids'];
        $arr['catgrory1']=$data['catgrory1'];
        $arr['catgrory2']=$data['catgrory2'];
        $arr['catgrory3']=$data['catgrory3'];
        $data=json_encode($arr);
        $url=$this->more_api_url."/lingmall/catgrory/gtinBatch?token=".$token;
        $return=$this->curl($url,$data,'put');
        return $return;
    }
    function getGoodsImage($data){
        $url=$this->more_api_url."/lingmall/catgrory/list?token=".$data['token'];
        $return=$this->curl($url,$data,'put');
        return $return;
    }
    function getGooodsInfo($data){
        $data['token']=urldecode($data['token']);
        $id=$data['id'];
        $url=$this->more_api_url."/lingmall/catgrory/catgroryGtin/{$id}";
        $return=$this->curl($url,$data,'get');
        return $return;
    }
    function updateGoodsInfo($data){
        $id=$data['id'];
        $token=$data['token'];
        $arr['catgrory1']=$data['catgrory1'];
        $arr['catgrory2']=$data['catgrory2'];
        $arr['catgrory3']=$data['catgrory3'];
        $arr['gName']=$data['gName'];
        $data=json_encode($arr);
        $url=$this->more_api_url."/lingmall/catgrory/catgroryGtin/{$id}?token=".$token;
        $return=$this->curl($url,$data,'put');
        return $return;
    }
    //获取下级商品分类
    function getNext($data){
        $arr['token']=urldecode($data['token']);
        $arr['f_id']=$data['catId'];
        $url=$this->more_api_url."/lingmall/catgrory/next";
        $return=$this->curl($url,$arr,'get');
        return $return;
    }

    function getInfo($catId){
        $data['token']=urldecode($this->user_info['token']);
        $url=$this->more_api_url."/lingmall/catgrory/{$catId}";
        $return=$this->curl($url,$data,'get');
        return json_decode($return,true);
    }

}