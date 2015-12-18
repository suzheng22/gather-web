<?php
class Retouch_model extends MY_Model
{


    public function __construct()
    {
        // Call the CI_Model constructor
        parent::__construct();
    }
    /*获取修图列表*/
     function getMarlboroList($data){
         $url=$this->more_api_url."/lingmall/audit/list";
         $return=$this->curl($url,$data,'get');
//         if(!$return){
//             $url="f:/wamp/www/curl/retouch/list.txt";
//             $return=file_get_contents($url);
//         }
         $list=json_decode($return,true);
         foreach($list as $k=>$v){
             $data['upUserId']=$v['retouchUserId'];
             $url=$this->user_api_url."/user/info";
             $return=$this->curl($url,$data);
             $user=json_decode($return,true);
             $list[$k]['userName']=$user['userName'];
             $data['groupId']=$user['groupId'];
             $url=$this->user_api_url."/user/groupInfo";
             $return=$this->curl($url,$data);
             $group=json_decode($return,true);
             $list[$k]['groupName']=$group['groupName'];
         }
         return $list;
    }
    /*获取美工的修图审核列表*/
    function getRetouchDetail($data){
        $url=$this->more_api_url."/lingmall/audit/detail";
        $return=$this->curl($url,$data,'get');
        var_dump($return);
        if(!$return){
            $url="f:/wamp/www/curl/retouch/detail.txt";
            $return=file_get_contents($url);
        }
        $detail=json_decode($return,true);
        $count=sizeof($detail);
        $return_detail['total']=$count;
        $return_detail['data']=$detail;
        return $return_detail;
    }
    /*获取某一个修图详情*/
    function getRetouchPic($data){
        $orderId=$data['orderId'];
        $url=$this->more_api_url."/lingmall/audit/{$orderId}";
        $return=$this->curl($url,$data);
        if(!$return){
            $url="f:/wamp/www/curl/retouch/pic.txt";
            $return=file_get_contents($url);
        }
        $detail=json_decode($return,true);
        return $detail;
    }
    /*获取图片*/
    function getAllImage($data){
       // $url=$this->more_api_url."/shoot/getAllImage";
        $data['token']='7jsD03yg64t1kPuOANJxBI1dMpzfvUgkaBr9y11Ybg1M9X3N-54ptlhgaJjXDeqE';
        $data['xBarcode']='6921168550135';
        $data['xType']=1;
        $url="http://139.196.36.81:8600/lingmall/pictures";
        $return=$this->curl($url,$data,'get');
        $list=json_decode($return,true);
        return $list;
    }
    /*单独操作审核（通过和驳回）*/
    function changStatus($data){
        $orderId=$data['orderId'];
        $url=$this->more_api_url." /lingmall/audit/$orderId";
        $return=$this->curl($url,$data);
        return $return;
    }
    /*批量审核通过*/
    function batchPass($data){
        $url=$this->more_api_url."/lingmall/audit/checks";
        $return=$this->curl($url,$data);
        return $return;
    }

}