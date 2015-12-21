<?php
class Statistics_model extends MY_Model {


    public function __construct()
    {
    // Call the CI_Model constructor
      parent::__construct();

    }
    
    //获取修图统计
    function getPsList($data) {
        $token=$data['token'];
        $url=$this->tmore_api_url."/retouch/statistics?token=".$token;
        $return=$this->curl($url,$data,'get');
        $list=json_decode($return,true);

        foreach ($list['list'] as $k => $v){
            $ids[]=$v['userId'];
        }

        $data['ids']=serialize($ids);
        $url=$this->user_api_url."/user/getUserInfoByIds?token=".$token;
        $return=$this->curl($url,$data);
        $user_list=json_decode($return,true);
        foreach ($list['list'] as $k => $v){
            foreach ($user_list as $k1=>$v1){
                if($v['userId']==$v1['userId']){
                    $list['list'][$k]['userName']=$v1['userName'];
                    $list['list'][$k]['groupName']=$v1['groupName'];
                }
            }
        }
        return $list;
    }
    
    
    function getPsCheckList($data){
        $token=$data['token'];
        $url=$this->tmore_api_url."/review/GetCheckList?token=".$token;
        $return=$this->curl($url,$data);
        $list=json_decode($return,true);
        foreach ($list['list'] as $k => $v){
            $ids[]=$v['userId'];
        }
        $data['ids']=serialize($ids);
       
        $url=$this->user_api_url."/user/getUserInfoByIds?token=".$token;
       $return=$this->curl($url,$data);
        $user_list=json_decode($return,true);

        foreach ($list['list'] as $k => $v){
            foreach ($user_list as $k1=>$v1){
                if($v['userId']==$v1['userId']){
                    $list['list'][$k]['userName']=$v1['userName'];
                    $list['list'][$k]['groupName']=$v1['groupName'];
                }
            }
        }
        return $list;
    }
    
    
}
?>