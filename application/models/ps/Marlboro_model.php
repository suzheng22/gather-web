<?php
class Marlboro_model extends MY_Model {


    public function __construct()
    {
    // Call the CI_Model constructor
      parent::__construct();

    }
    
    //获取修图审核列表
    function getMarlboroList1($data){
        $url=$this->more_api_url.'/shoot/MarlboroList';
        $return=$this->curl($url,$data);
        $list=json_decode($return,true);
        //根据获取得到的userID获取数据
        $data['ids']=$data['photoIds'];
        //根据每个用户的ID去查找项目的数据
        $url=$this->user_api_url."/user/getUserInfoByIds";
        $return=$this->curl($url,$data);
        $user_list=json_decode($return,true);
        $num=0;
        foreach ($list as $k => $v){
            foreach ($user_list as $k1=>$v1){
                if($v['photoId']==$v1['userId']){
                    $num++;
                    $list[$k]['num']=$num;
                    $list[$k]['userName']=$v1['userName'];
                    $list[$k]['groupName']=$v1['groupName'];
                    $list[$k]['passCount']=$list[$k]['MarlboroCount']/$list[$k]['totalCount'];
                }
            }
        }
        return $list;
    }
    function getMarlboroDetail($data){
        $url=$this->more_api_url.'/shoot/MarlboroDetail';
        $return=$this->curl($url,$data);
        $list=json_decode($return,true);
        $count=count($list['data']);
        $datas=$list['data'];

        for ($i=0;$i<$count;$i++){
            foreach ($datas[$i] as $key=>$val){
                if($key=='gtin'){
                    $data['gtin']=$val;
                    $url=$this->tmore_api_url."/product/getproductbygtin";
                    $return=$this->curl($url,$data,'get');
                    $goods=json_decode($return,true);
                    $datas[$i]['gName']=$goods['proName'];
                    $datas[$i]['catgroryName']=$goods['typeName'];
                }
            }
        }
        $return_data['total']=$count;
        $return_data['data']=$datas;
        return $return_data;
    }

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
    
    
    function getShootList($data){
        $url=$this->tmore_api_url."/review/GetShootReviewData";
        $return=$this->curl($url,$data);;
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
//        $url=$this->tmore_api_url."/review/GetReviewList";
        $url=$this->more_api_url."/shoot/MarlboroInfo";
       // var_dump($data);exit;
        $return=$this->curl($url,$data);
        $list=json_decode($return,true);
   //     var_dump($list);
        return $list;
    }
    
    
    function getShootInfo($data){
        $url=$this->tmore_api_url."/review/GetShootReviewList";
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
    
    function getReviewStatus($data){
        $url=$this->tmore_api_url."/review/GetReviewStatus";
        $return=$this->curl($url,$data);
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
    //单独操作审核（通过和驳回）
    function marlboro($data){
        $url=$this->tmore_api_url."/shoot/marlboro";
        $return=$this->curl($url,$data);
        return $return;
    }
    //批量审核通过
    function batchMarlboro($data){
        $url=$this->tmore_api_url."/shoot/batchMarlboro";
        $return=$this->curl($url,$data);
        return $return;
    }

    //增加通过缺图
    function addMissFigure($data){
        $url=$this->tmore_api_url."/review/addMissFigure";
        $return=$this->curl($url,$data);
        return $return;
    }
    //获取无法测量数据
    function getNoMeasureList($data){
        $url=$this->tmore_api_url."/review/getNoMeasureList";
        $return=$this->curl($url,$data);
        return $return;
    }
    //获取无法拍摄数据
    function getNoShootList($data){
        $url=$this->tmore_api_url."/review/getNoShootList";
        $return=$this->curl($url,$data);
        return $return;
    }
    //获取拍摄新增列表
    function getShootAddList($data){
        $url=$this->tmore_api_url."/review/getShootAddList";
        $return=$this->curl($url,$data);
        return $return;
    }
    //新增拍摄
    function addShoot($data){
        $url=$this->tmore_api_url."/review/addShoot";
        $return=$this->curl($url,$data);
        return $return;
    }
    //修改拍摄
    function updateShoot($data){
        $url=$this->tmore_api_url."/review/updateShoot";
        $return=$this->curl($url,$data);
        return $return;
    }
}
?>