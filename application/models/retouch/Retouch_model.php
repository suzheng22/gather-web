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
         $data['token']=urldecode($data['token']) ;
         $url=$this->more_api_url."/lingmall/audit/list";
         $return=$this->curl($url,$data,'get');
         $list=json_decode($return,true);
         $count=$list['count'];
         $list=$list['data'];
         $data['token']=urlencode($data['token']);
         foreach($list as $k=>$v){
             $data['upUserId']=$v['retouchUserId'];
             $url=$this->user_api_url."/user/info?token=".$data['token'];
             $return=$this->curl($url,$data);
             $user=json_decode($return,true);
             $list[$k]['userName']=$user['userName'];
             $data['groupId']=$user['groupId'];
             $url=$this->user_api_url."/user/groupInfo?token=".$data['token'];
             $return=$this->curl($url,$data);
             $group=json_decode($return,true);
             $list[$k]['groupName']=$group['groupName'];
         }
         $return_detail['total']=$count;
         $return_detail['data']=$list;
         return $return_detail;
    }
    /*获取美工的修图审核列表*/
    function getRetouchDetail($data){
        $data['token']=urldecode($data['token']) ;
        $url=$this->more_api_url."/lingmall/audit/detail";
        $return=$this->curl($url,$data,'get');
        $detail=json_decode($return,true);
        $count=($detail['count']);
        $detail=$detail['data'];
        $data['token']=urlencode($data['token']) ;
        foreach($detail as $k=>$v){
            $data['pId']=$v['pId'];
            $url=$this->user_api_url."/user/getProjectByFiled?token=".$data['token'];
            $return =$this->curl($url,$data);
            $project=json_decode($return,true);
            $detail[$k]['pName']=$project['data'][0]['pName'];
        }
        $return_detail['total']=$count;
        $return_detail['data']=$detail;
        return $return_detail;
    }
    /*获取某一个修图详情*/
    function getRetouchPic($data){
        $data['token']=urldecode($data['token']) ;
        $orderId=$data['orderId'];
        $url=$this->more_api_url."/lingmall/audit/{$orderId}";
        $return=$this->curl($url,$data,'get');
        $detail=json_decode($return,true);
        $arr['gtin']=$detail['gtin'];
        $url=$this->more_api_url.'/goods/getGoodsInfo';
        $return=$this->curl($url,$arr,'post');
        $return=json_decode($return,true);
        $detail['gName']=$return['data']['gName'];
        $arr['pId']= $detail['pId'];
        $token=(urlencode($data['token']));
        $url=$this->user_api_url."/user/getProjectByFiled?token=".$token;
        $return =$this->curl($url,$arr,'post');
        $datas=json_decode($return,true);
        foreach($datas as $key=>$val){
            if($detail['pId']==$val['pId']){
                $detail['pName']=$val['pName'];
            }
        }
        //获取商品类型
        // $token=urldecode($token);
        $catId= $detail['catgrory1'];
        if($catId){
            $url=$this->more_api_url."/lingmall/catgrory/{$catId}?token=".$token;
            $return =$this->curl($url,'','get');
            $datas=json_decode($return,true);
            $detail['name']=$datas['name'];
        }

        return $detail;
    }
    /*获取修图*/
    function getAllImage($data){
        $url="http://139.196.36.81:8600/lingmall/pictures?token=7jsD03yg64t1kPuOANJxBI1dMpzfvUgkaBr9y11Ybg1M9X3N-54ptlhgaJjXDeqE&xType=2&xBarcode={$data['gtin']}&xBatch={$data['batchNo']}&xPack={$data['packet']}";
        $return=$this->curl($url,'','get');
        $list=json_decode($return,true);
        return $list;
    }
    //原图，png
    function getAllImages($data){
        $url="http://139.196.36.81:8600/lingmall/pictures?token=7jsD03yg64t1kPuOANJxBI1dMpzfvUgkaBr9y11Ybg1M9X3N-54ptlhgaJjXDeqE&xType={$data['id']}&xBarcode={$data['gtin']}&xBatch={$data['batchNo']}&xPack={$data['packet']}";
        $return=$this->curl($url,'','get');
        $list=json_decode($return,true);
        return $list;
    }
    /*单独操作审核（通过和驳回）*/
    function changeStatus($data){
        $orderId=$data['orderId'];
        $token=$data['token'];
        $arr['memo']=$data['memo'];
        $arr['status']=$data['status'];
        $arr=json_encode($arr);
        $url=$this->more_api_url."/lingmall/audit/$orderId?token=$token";
        $return=$this->curl($url,$arr,'put');
        return $return;
    }
    /*批量审核通过*/
    function batchPass($data){
        $token=$data['token'];
        $arr=json_encode($data);
        $url=$this->more_api_url."/lingmall/audit/checks?token=$token";
        $return=$this->curl($url,$arr,'put');
        return $return;
    }

}