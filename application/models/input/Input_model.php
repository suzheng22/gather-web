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
        return $return;
    }
    /*
     *获取分配列表
     */
    function getInputSend($data){
        $url=$this->more_api_url."/lingmall/input/send?token={$data['token']}";
        $return=$this->curl($url,$data,'post');
        $return=json_decode($return,true);
           // var_dump($return['extFiled']);
        return $return;
    }
    function getInputInfo($data){
        $url=$this->more_api_url."/lingmall/input/{$data['inputId']}?token={$data['token']}";
        $return=$this->curl($url,'','get');
        $return=json_decode($return,true);
        return $return;
    }
    //获取录入图片的接口
    function getAllImage($data){
        $xPack=$data['packet'];
        $url="http://139.196.36.81:8600/lingmall/pictures?token=7jsD03yg64t1kPuOANJxBI1dMpzfvUgkaBr9y11Ybg1M9X3N-54ptlhgaJjXDeqE&xBarcode={$data['gtin']}&xType=1&xPack=$xPack";
        $return=$this->curl($url,'','get');
        $list=json_decode($return,true);
        return $list;
    }
    //分类保存
    function saveType($data){
        $token=$this->user_info['token'];
        $inputId=$data['inputId'];
        $arr['filed']=$data['filed'];
        $arr['info']=$data['info'];
        $arr['inputCount']=$data['inputCount'];
        $url=$this->more_api_url."/lingmall/input/{$inputId}?token={$token}";
        $data=json_encode($arr);
        $return=$this->curl($url,$data,'put');
        $return=json_decode($return,true);
        return $return;
    }



}
?>