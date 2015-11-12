<?php
class Marlboro_model extends MY_Model {


    public function __construct()
    {
    // Call the CI_Model constructor
      parent::__construct();

    }
    
    //获取修图审核列表
    function getMarlboroList($data) {
        $url=$this->tmore_api_url."/review/GetReviewData";
        $return=$this->curl($url,$data);
        $list=json_decode($return,true);
        
        foreach ($list as $k => $v){
            $ids[]=$v['userId'];
        }

        $data['ids']=serialize($ids);
        $url=$this->user_api_url."/user/getUserInfoByIds";
        $return=$this->curl($url,$data);
        $user_list=json_decode($return,true);
        foreach ($list as $k => $v){
            foreach ($user_list as $k1=>$v1){
                if($v['userId']==$v1['userId']){
                    $list[$k]['userName']=$v1['userName'];
                    $list[$k]['groupName']=$v1['groupName'];
                }
            }
        }
        return $list;
    }
    
    function getMarlboroInfo($data){
        $url=$this->tmore_api_url."/review/GetReviewList";
        $return=$this->curl($url,$data);
        $list=json_decode($return,true);
        return $list;
    }
    
    function  getMarlboroInfoPic($data){
        $url=$this->tmore_api_url."/image/GetReviewImageByGtin";
        $return=$this->curl($url,$data,'get');
        $list=json_decode($return,true);
        
        return $list;
    }
    
    function changeStatus($data){
        $url=$this->tmore_api_url."/review/ChangeStatus";
        $return=$this->curl($url,$data);
        return $return;
    }
    
    function batchChangeStatus($data){
        $url=$this->tmore_api_url."/review/BatchChangeStatus";
        $return=$this->curl($url,$data);
        return $return;
    }
}
?>