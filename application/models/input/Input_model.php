<?php
class Input_model extends MY_Model {


    public function __construct()
    {
    // Call the CI_Model constructor
      parent::__construct();

    }
    /*
     * 获取录入管理列表
     * 参数 array
     * return array
     * */
    function getInputList($data){
        //重新解析token
        $data['token']=urldecode($data['token']);
        $url=$this->more_api_url."/lingmall/input/list";
        $return=$this->curl($url,$data,'get');
        $return=json_decode($return,true);
        var_dump($return);
        return $return;
    }
    /*
     *获取分配列表
     */
    function getInputSend($data){
        $url=$this->more_api_url."/lingmall/input/send?token={$data['token']}";
        $return=$this->curl($url,$data,'put');
        var_dump($return);
        $return=json_decode($return,true);
        return $return;
    }
    function getInputInfo($data){
        $url=$this->more_api_url."/lingmall/input/{$data['inputId']}?token={$data['token']}";
        $return=$this->curl($url,'','get');
        var_dump($return);
        $return=json_decode($return,true);
        return $return;
    }



}
?>