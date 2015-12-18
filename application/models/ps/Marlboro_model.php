<?php
class Marlboro_model extends MY_Model {


    public function __construct()
    {
    // Call the CI_Model constructor
      parent::__construct();
    }
    //获取获取拍摄详情列表
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
    //获取拍摄详情
    function getMarlboroDetail($data){
        $url=$this->more_api_url.'/shoot/MarlboroDetail';
        $return=$this->curl($url,$data);
        $list=json_decode($return,true);
        $count=count($list['data']);
        $datas=$list['data'];
        for ($i=0;$i<$count;$i++){
            foreach ($datas[$i] as $key=>$val){
                if($key==='pId'){
                    $data['pId']=$val;
                    $url=$this->user_api_url."/user/getProjectByFiled";
                    $return =$this->curl($url,$data);
                    $project=json_decode($return,true);
                    foreach($project as $key=>$val){
                        if($data['pId']==$val['pId']){
                            $datas[$i]['pName']=$val['pName'];
                        }
                    }
                }
            }
        }
        $return_data['total']=$count;
        $return_data['data']=$datas;
        return $return_data;
    }

    //根据orderId获取详细信息
    function getMarlboroInfo($data){
        $url=$this->more_api_url."/shoot/getMarboro";
        $return=$this->curl($url,$data);
        $list=json_decode($return,true);
        return $list;
    }
    //获取所有图片
    function getAllImage($data){
        $url=$this->more_api_url."/shoot/getAllImage";
        $return=$this->curl($url,$data);
        $list=json_decode($return,true);
        return $list;
    }
    //单独操作审核（通过和驳回）
    function marlboro($data){
        $url=$this->more_api_url."/shoot/marlboro";
        $return=$this->curl($url,$data);
        return $return;
    }
    //批量审核通过
    function batchMarlboro($data){
        $url=$this->more_api_url."/shoot/batchMarboro";
        $return=$this->curl($url,$data);
        return $return;
    }

    //增加通过缺图
    function addMissFigure($data){
        $url=$this->tmore_api_url."/review/addMissFigure";
        $return=$this->curl($url,$data);
        return $return;
    }
    //获取无法拍摄数据
    function getNoShootList($data){
        $url=$this->more_api_url."/shoot/noShootList";
        $return=$this->curl($url,$data);
        $datas=json_decode($return,true);
        $count=count($datas);
        for($i=0;$i<$count;$i++){
            foreach( $datas[$i] as $key=>$val){
                $datas[$i]['lId']=($i+1);
                if($key==='userId'){
                    $data['upUserId']=$val;
                    $url=$this->user_api_url."/user/info";
                    $return=$this->curl($url,$data);
                    $user=json_decode($return,true);
                    $datas[$i]['shootName']=$user['trueName'];
                }else if($key=='pId'){
                    //根据项目Id获取项目名称
                    $data[$key]=$val;
                    $url=$this->user_api_url."/user/getProjectByFiled";
                    $return =$this->curl($url,$data);
                    $project=json_decode($return,true);
                    $datas[$i]['pName']=$project[0]['pName'];
                }
            }
        }
        $shoot['total']=$count;
        $shoot['data']=$datas;
        return $shoot;
    }
    //获取无法测量数据
    function getNoMeasureList($data){
        $url=$this->more_api_url."/measure/NoMeasureList";
        $return=$this->curl($url,$data);
    //    var_dump($return);
        $datas=json_decode($return,true);
        $count=count($datas);
        for($i=0;$i<$count;$i++){
            foreach( $datas[$i] as $key=>$val){
                $datas[$i]['lId']=($i+1);
                if($key==='userId'){
                    $data['upUserId']=$val;
                    $url=$this->user_api_url."/user/info";
                    $return=$this->curl($url,$data);
                    $user=json_decode($return,true);
                    $datas[$i]['measurement']=$user['trueName'];
                }else if($key=='pId'){
                    //根据项目Id获取项目名称
                    $data[$key]=$val;
                    $url=$this->user_api_url."/user/getProjectByFiled";
                    $return =$this->curl($url,$data);
                    $project=json_decode($return,true);
                    $datas[$i]['pName']=$project[0]['pName'];
                }else if($key=='gtin'){
                    $data[$key]=$val;
                    $url=$this->more_api_url."/goods/getGoodsInfo";
                    $return =$this->curl($url,$data);
                    $goods=json_decode($return,true);
                 //   var_dump($goods);
                }
            }
        }
        $measure['total']=$count;
        $measure['data']=$datas;
        return $measure;
    }
    //获取拍摄新增数据
    function getShootAddList($data){
        $url=$this->more_api_url."/shoot/NewPicList";
        $return=$this->curl($url,$data);
        $datas=json_decode($return,true);
        $count=count($datas);
        for($i=0;$i<$count;$i++){
            foreach( $datas[$i] as $key=>$val){
                $datas[$i]['lId']=($i+1);
                if($key==='userId'){
                    $data['upUserId']=$val;
                    $url=$this->user_api_url."/user/info";
                    $return=$this->curl($url,$data);
                    $user=json_decode($return,true);
                    $datas[$i]['measurement']=$user['trueName'];
                }else if($key=='pId'){
                    //根据项目Id获取项目名称
                    $data[$key]=$val;
                    $url=$this->user_api_url."/user/getProjectByFiled";
                    $return =$this->curl($url,$data);
                    $project=json_decode($return,true);
                    $datas[$i]['pName']=$project[0]['pName'];
                }
            }
        }
        $shootAdd['total']=$count;
        $shootAdd['data']=$datas;
        return $shootAdd;
    }
    //获取拍摄驳回数据
    function getShootBackList($data){
        $url=$this->more_api_url."/shoot/getShootReturnList";
        $return=$this->curl($url,$data);
        $datas=json_decode($return,true);
        $count=count($datas);
        for($i=0;$i<$count;$i++){
            foreach( $datas[$i] as $key=>$val){
                $datas[$i]['lId']=($i+1);
                if($key==='userId'){
                    $data['upUserId']=$val;
                    $url=$this->user_api_url."/user/info";
                    $return=$this->curl($url,$data);
                    $user=json_decode($return,true);
                    $datas[$i]['measurement']=$user['trueName'];
                }else if($key=='pId'){
                    //根据项目Id获取项目名称
                    $data[$key]=$val;
                    $url=$this->user_api_url."/user/getProjectByFiled";
                    $return =$this->curl($url,$data);
                    $project=json_decode($return,true);
                    $datas[$i]['pName']=$project[0]['pName'];
                }
            }
        }
        $shootBack['total']=$count;
        $shootBack['data']=$datas;
        return $shootBack;
    }
    //根据条形码获取信息
    function getInfoByGtin($data){
        $url=$this->more_api_url."/shoot/getShootOrderList";
        $return=$this->curl($url,$data);
        $datas=json_decode($return,true);
        //返回数据的容量
        $project_data=array();
        //获取所有的项目
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
       foreach($project as $key=>$val){
            $data['pId']=$project[$key];
            //根据pId去获取所有的项目名称
            $url=$this->user_api_url."/user/getProjectByFiled";
            $return=$this->curl($url,$data);
            $projects=json_decode($return,true);
            $project_data['project'][]=$projects[0];
        }

        //获取包装
        return json_encode($project_data);
    }
    function saveNewPic($data){
        $url=$this->more_api_url."/shoot/saveNewPic";
        $return=$this->curl($url,$data);
        $datas=json_decode($return,true);
        return $datas;
    }
    //根据主键 ID获取拍摄新增详细信息
    function getNewPicInfo($data){
        $url=$this->more_api_url."/shoot/getNewPicInfo";
        $return=$this->curl($url,$data);
        $datas=json_decode($return,true);
        $data['gtin']=$datas['gtin'];
        //根据项目获取其他信息
        $data1=$this->getInfoByGtin($data);
        $data1=json_decode($data1,true);
        $data1['packet1']=$datas['packet'];
        $data1['pId1']=$datas['pId'];
        $data1['memo']=$datas['memo'];
        return $data1;
    }
    /*获取拍摄反馈的数据*/
    function getShootBackManager($data){
        $url=$this->more_api_url."/shoot/ShootBackManager";
        $return=$this->curl($url,$data);
        if(!$return){
            $return=file_get_contents("f:/wamp/www/curl/marlboro/feedBack.txt");
        }
        $datas=json_decode($return,true);
        return $datas;
    }
}
?>