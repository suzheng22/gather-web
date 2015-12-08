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
}