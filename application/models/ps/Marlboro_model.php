<?php
class Marlboro_model extends MY_Model {


    public function __construct()
    {
    // Call the CI_Model constructor
      parent::__construct();
        $this->load->model('goods/goods_model');
        $this->load->model('user/project_model');
    }
    //获取获取拍摄详情列表
    function getMarlboroList1($data){

        $token=$data['token'];
        $photoIds= $data['photoIds'];
        if($data['userName']==""&&$data['groupId']==""){
            $data['photoIds']="";
        }if($data['photoIds']=="N;"){
            $data['photoIds']=5;
        }
        $url=$this->more_api_url.'/shoot/MarlboroList?token='.$token;
        $return=$this->curl($url,$data);
        $list=json_decode($return,true);
        //根据获取得到的userID获取数据
        $data['ids']=$photoIds;
        $user_list=array();
        if($data['ids']!="N;"){
            $url=$this->user_api_url."/user/getUserInfoByIds?token=".$token;
            $return=$this->curl($url,$data);
            $user_list=json_decode($return,true);
        }
        //根据每个用户的ID去查找项目的数据
        $count=$list['count'];
        $list=$list['data'];
        $num=0;
        foreach ($list as $k => $v){
            foreach ($user_list as $k1=>$v1){
                if($v['photoId']==$v1['userId']){
                    $num++;
                    $list[$k]['num']=$num;
                    $list[$k]['userName']=$v1['userName'];
                    $list[$k]['groupName']=$v1['groupName'];
                    $list[$k]['passCount']=round(($list[$k]['MarlboroCount']/$list[$k]['chouchatotalCount']),4);
                    $list[$k]['passCount']=mb_substr($list[$k]['passCount'],0,6);
                }
            }
        }
        $return_list['data']=$list;
        $return_list['total']=$count;
        return $return_list;
    }
    //获取拍摄详情
    function getMarlboroDetail($data){
        $token=$data['token'];
        $url=$this->more_api_url.'/shoot/MarlboroDetail?token='.$token;
        $return=$this->curl($url,$data);
        $list=json_decode($return,true);
        $orderIds=($list['data']['orderIds']);
        $total=$list['data']['count'];
        $datas=$list['data']['data'];
        foreach ($datas as $key=>$val){
            $project_data['pId']=$val['pId'];
            $project_data['token']=$data['token'];
            $datas[$key]['pName']=$this->project_model->getPNameByPId($project_data);
        }
        $return_data['orderIds']=($orderIds);
        $return_data['data']=$datas;
        $return_data['total']=$total;
        return $return_data;
    }
    //根据orderId获取详细信息
    function getMarlboroInfo($data){
        $token=$data['token'];
        $url=$this->more_api_url."/shoot/getMarboro?token=".$token;
        $return=$this->curl($url,$data);
        $list=json_decode($return,true);
        $list=$this->getPName($list,$data['token'],$list['pId']);
        //获取商品类型
       // $token=urldecode($token);
        $catId= $list['catgrory1'];
        if($catId!=""){
            $url=$this->more_api_url."/lingmall/catgrory/{$catId}?token=".$token;
            $return =$this->curl($url,'','get');
            $datas=json_decode($return,true);
            $list['name']=$datas['name'];
        }
        return $list;
    }
    //获取所有图片
    function getAllImage($data){
        $url_token="http://139.196.36.81:8400/lingmall/service/token?type=2&bucket=test";
        $token=$this->curl($url_token,'','get');
        $token=json_decode($token,true);
        $xBatch=$data['batchNo'];
        $xPack=$data['packet'];
        $url="http://139.196.36.81:8400/lingmall/pictures?token={$token['token']}&xBarcode={$data['gtin']}&xType=1&xBatch=$xBatch&xPack=$xPack";
        $return=$this->curl($url,'','get');
        $list=json_decode($return,true);
        return $list;
    }
    //单独操作审核（通过和驳回）
    function marlboro($data){
        $token=$data['token'];
        $url=$this->more_api_url."/shoot/marlboro?token=".$token;
        $return=$this->curl($url,$data);
        return $return;
    }
    //批量审核通过
    function batchMarlboro($data){
        $token=$data['token'];
        $data['orderIds']=json_encode($data['orderIds']);
        $url=$this->more_api_url."/shoot/batchMarboro?token=".$token;
        $return=$this->curl($url,$data);
        return json_decode($return);
    }
    //增加通过缺图
    function addMissFigure($data){
        $token=$data['token'];
        $url=$this->tmore_api_url."/review/addMissFigure?token=".$token;
        $return=$this->curl($url,$data);
        return $return;
    }
    //获取无法拍摄数据
    function getNoShootList($data){
        $token=$data['token'];
        $url=$this->more_api_url."/shoot/noShootList?token=".$token;
        $return=$this->curl($url,$data);
        $datas=json_decode($return,true);
        $shoot=$this->back($datas,$data);
        return $shoot;
    }
    //获取无法测量数据
    function getNoMeasureList($data){
        $token=$data['token'];
        $url=$this->more_api_url."/measure/NoMeasureList?token=".$token;
        $return=$this->curl($url,$data);
        $datas=json_decode($return,true);
        $measure=$this->back($datas,$data);
        return $measure;
    }
    //获取拍摄新增数据
    function getShootAddList($data){
        $token=$data['token'];
        $url=$this->more_api_url."/shoot/NewPicList?token=".$token;
        $return=$this->curl($url,$data);
        $datas=json_decode($return,true);
        $back=$this->back($datas,$data);
        return $back;
    }
    //获取拍摄驳回数据
    function getShootBackList($data){
        $token=$data['token'];
        $url=$this->more_api_url."/shoot/getShootReturnList?token=".$token;
        $return=$this->curl($url,$data);
        $datas=json_decode($return,true);
        $back=$this->back($datas,$data);
        return $back;
    }
    //根据条形码获取信息
    function getInfoByGtin($data){
        $token=$data['token'];
        $url=$this->more_api_url."/shoot/getShootOrderList?token=".$token;
        $return=$this->curl($url,$data);
        $datas=json_decode($return,true);
        $goodsName=$this->goods_model->getGoodsByGtin($data);
        //返回数据的容量
        $project_data=array();
        //项目的容量
        $project=array();
        foreach($datas as $key=>$val){
            $project_data['gName']=$val['gName'];
           $project[]=$val['pId'];
        }
        $project=(array_unique($project));
        //包装容量
        $packet=array();
        foreach($datas as $key=>$val){
            $packet[]=$val['packet'];
        }
        $packet=array_unique($packet);
        $packet=array_values($packet);
        $project_data['packet']=$packet;
        $project_data['gtin']=$data['gtin'];
        $project_data['gName']=$goodsName['gName'];
       foreach($project as $key=>$val){
            $data['pId']=$project[$key];
            //根据pId去获取所有的项目名称
            $url=$this->user_api_url."/user/getProjectByFiled?token=".$token;
            $return=$this->curl($url,$data);
            $projects=json_decode($return,true);
            $project_data['project'][]=$projects['data'][0];
        }
        //获取包装
        return json_encode($project_data);
    }
    function saveNewPic($data){
        $token=$data['token'];
        $url=$this->more_api_url."/shoot/saveNewPic?token=".$token;
        $return=$this->curl($url,$data);
        $datas=json_decode($return,true);
        return $datas;
    }
    //根据主键 ID获取拍摄新增详细信息
    function getNewPicInfo($data){
        $token=$data['token'];
        $url=$this->more_api_url."/shoot/getNewPicInfo?token=".$token;
        $return=$this->curl($url,$data);
        $datas=json_decode($return,true);
        $arr['gtin']=$datas['gtin'];
        $url=$this->more_api_url.'/goods/getGoodsInfo';
        $returns=$this->curl($url,$arr,'post');
        $returns=json_decode($returns,true);
        $data['gtin']=$datas['gtin'];
        //根据项目获取其他信息
        $data1=$this->getInfoByGtin($data);
        $data1=json_decode($data1,true);
        $data1['packet1']=$datas['packet'];
        $data1['pId1']=$datas['pId'];
        $data1['memo']=$datas['memo'];
        $data1['gName']=$returns['data']['gName'];
        return $data1;
    }
    /*获取拍摄反馈的数据*/
    function getShootBackManager($data){
        $data['token']=urldecode($data['token']);
        $url=$this->more_api_url."/lingmall/feed/list";
        $return=$this->curl($url,$data,'get');
        $datas=json_decode($return,true);
        //token 转换
        $data['token']=urlencode($data['token']);
        $back=$this->back($datas,$data);
        return $back;
    }
    function back($datas,$data){
        $token=$data['token'];
        $count=$datas['count'];
        $datas=$datas['data'];
        $total=count($datas);
        for($i=0;$i<$total;$i++){
            foreach( $datas[$i] as $key=>$val){
                $datas[$i]['lId']=($i+1);
                if($key==='userId'||$key==='retouchId'){
                    $data['upUserId']=$val;
                    $url=$this->user_api_url."/user/info?token=".$token;
                    $return=$this->curl($url,$data);
                    $user=json_decode($return,true);
                    $datas[$i]['measurement']=$user['trueName'];
                }else if($key=='pId'){
                    //根据项目Id获取项目名称
                    $data[$key]=$val;
                    $datas[$i]['pName']=  $this->project_model->getPNameByPId($data);
                }else if($key=='gtin'){
                    $data[$key]=$val;
                    $url=$this->more_api_url."/goods/getGoodsInfo?token=".$token;
                    $return =$this->curl($url,$data);
                    $goods=json_decode($return,true);
                    $datas[$i]['gName']=$goods['data']['gName'];
                    //根据商品分类的ID查询商品分类名称
                    $catId=$goods['data']['catgrory1'];
                    if($catId!=""){
                        $re=$this->goods_model->getInfo($catId);
                        $datas[$i]['catName']=$re['name'];
                    }
                }
            }
        }
        $shootBack['total']=$count;
        $shootBack['data']=$datas;
        return $shootBack;
    }
    //获取拍摄反馈详细信息
    function getFeedInfo($data){
        //获取拍摄反馈的状态及反馈原因
        $fId=$data['orderId'];
        $url=$this->more_api_url."/lingmall/feed/{$fId}?token={$data['token']}";
        $return=$this->curl($url,'','get');
        $lis=json_decode($return,true);
        $data['sId']=$lis['sId'];
        $url=$this->more_api_url."/shoot/getShootRecordById";
        $return=$this->curl($url,$data);
        $list=json_decode($return,true);
        //获取项目名称
        $list=$this->getPName($list,$data['token'],$list['pId']);
        //根据条形码获取商品名，商品分类
        $urls=$this->more_api_url."/goods/getGoodsInfo?token=".$data['token'];
        $gtin['token']=$data['token'];
        $gtin['gtin']=$list['gtin'];
        $returns=$this->curl($urls,$gtin);
        $datas=json_decode($returns,true);
        $list['gName']=$datas['data']['gName'];
        $list=array_merge($lis,$list);
        return $list;
    }
    //拍摄反馈的通过与驳回
    function shootBackPass($data){
        $fId=$data['fId'];
        $put['status']=$data['status'];
        if($put['status'==2]){
            $put['memo']=$data['memo'];
        }
        $put=json_encode($put);
        $url=$this->more_api_url."/lingmall/feed/{$fId}?token={$data['token']}";
        $return=$this->curl($url,$put,'put');
        return $return;
    }
    //获取项目
    function getPName($data,$token,$pId){
        $arr['pId']=$pId;
        $arr['token']=$token;
        $data['pName']=  $this->project_model->getPNameByPId($arr);
        return $data;
    }
}
?>