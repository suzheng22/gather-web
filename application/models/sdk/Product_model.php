<?php
class Product_model extends MY_Model {


    public function __construct()
    {
    // Call the CI_Model constructor
      parent::__construct();

    }
    
    //获取修图审核列表
    function getType() {
        $url=$this->tmore_api_url."/type/gettype";
        $data['no']=1;
        $data['fid']=0;
        $return=$this->curl($url,$data,'get');
        $list=json_decode($return,true);

        return $list;
    }
    
    function getProduct($data){
        $token=$data['token'];
        $url=$this->tmore_api_url."/product/getproductbygtin?token=".$token;
        $return=$this->curl($url,$data,'get');
        $list=json_decode($return,true);
        return $list;
    }
    //获取商品分类
    function getCatgroryList($no){
        $data['token']=urldecode($this->user_info['token']);
        if(!$no){
            $data['no']=1;
        }else{
            $data['no']=$no;
        }
        $url=$this->more_api_url."/lingmall/catgrory/list";
        $return=$this->curl($url,$data,'get');
        $list=json_decode($return,true);
        $lists['data']=$list;
        return $lists;
    }

    
}
?>