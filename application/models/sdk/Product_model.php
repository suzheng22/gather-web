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
    
}
?>