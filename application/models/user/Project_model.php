<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2015/12/2
 * Time: 10:31
 */
class Project_model extends MY_Model {
    public function __construct()
    {
        // Call the CI_Model constructor
        parent::__construct();

    }
    //获取项目列表
    function getProjectList($data){
        //先获取userID
        $url=$this->user_api_url.'/user/getProjectAll';
        $return=$this->curl($url,$data);
        $datas=json_decode($return,true);
        $count=count($datas['data']);
        $datas=$datas['data'];
        for($i=0;$i<$count;$i++){
            foreach( $datas[$i] as $key=>$val){
                if($key==='creatUserId'){
                    $data['upUserId']=$val;
                    $url=$this->user_api_url."/user/info";
                    $return=$this->curl($url,$data);
                    $user=json_decode($return,true);
                    $datas[$i]['createName']=$user['trueName'];
                }
                else if($key==='upUserId'){
                    $data['upUserId']=$val;
                    $url=$this->user_api_url."/user/info";
                    $return=$this->curl($url,$data);
                    $user=json_decode($return,true);
                    $datas[$i]['updateName']=$user['trueName'];
                }else if($key==='creatTime'){
                    $datas[$i]['creatTime']=date("Y-m-d H:i:s",$datas[$i]['creatTime']);
                }
            }
        }
        $project['total']=$count;
        $project['data']=$datas;
        return $project;
    }
    //根据条件获取项目
    function getProjectUserByField($data){
        $url=$this->user_api_url."/user/getProjectByFiled";
        $return =$this->curl($url,$data);
        $datas=json_decode($return,true);
        $count=count($datas);
     //   var_dump($datas);
        for($i=0;$i<$count;$i++){
            foreach( $datas[$i] as $key=>$val){
                if($key==='userId'){
                    $data['upUserId']=$val;
                    $url=$this->user_api_url."/user/info";
                    $return=$this->curl($url,$data);
                    $user=json_decode($return,true);
                    $datas[$i]['userName']=$user['trueName'];
                    $roleId=$user['roleId'];
                    //根据userID获取角色
                    $url=$this->user_api_url."/user/getUserRoleList";
                    $return=$this->curl($url,$data);
                    $role=json_decode($return,true);
                    $roles=$role['list'];
                    //遍历
                    foreach($roles as $key=>$val){
                            if($roleId==$val['roleId']){
                                $datas[$i]['roleName']=$val['roleName'];
                            }
                    }
                }
            }
        }

     //   var_dump($datas);
        $data_return['total']=$count;
        $data_return['data']=$datas;
    //    var_dump($data_return);
        return $data_return;
    }
    function getProjectByField($data){
        $url=$this->user_api_url."/user/getProjectByFiled";
        $return =$this->curl($url,$data);
        $datas=json_decode($return,true);
        array_unique( $datas);
        $count=count($datas);

        for($i=0;$i<$count;$i++){
          if($datas[$i]['pId']==$datas[$i+1]['pId']){
              unset($datas[$i+1]);
          }
            foreach( $datas[$i] as $key=>$val){
                if($key==='userId'){
                    $data['upUserId']=$val;
                    $url=$this->user_api_url."/user/info";
                    $return=$this->curl($url,$data);
                    $user=json_decode($return,true);
                    $datas[$i]['userName']=$user['trueName'];
                    $roleId=$user['roleId'];
                    //根据userID获取角色
                    $url=$this->user_api_url."/user/getUserRoleList";
                    $return=$this->curl($url,$data);
                    $role=json_decode($return,true);
                    $roles=$role['list'];
                    //遍历
                    foreach($roles as $key=>$val){
                        if($roleId==$val['roleId']){
                            $datas[$i]['roleName']=$val['roleName'];
                        }
                    }
                }
            }
        }
        //   var_dump($datas);
        $data_return['total']=$count;
        $data_return['data']=$datas;
        //    var_dump($data_return);
        return $data_return;
    }
    function addProject($data){
        $url=$this->user_api_url."/user/addProject";
        $return =$this->curl($url,$data);
        return json_decode($return);
    }
    function addProjectUser($data){
        $url=$this->user_api_url."/project/addProjectUser";
        $return =$this->curl($url,$data);
        return $return;
    }
    function updateProjectStatus($data){
        $url=$this->user_api_url."/project/updateProjectStatus";
        $return =$this->curl($url,$data);
        if(!$return){
            $return =array('msg'=>'1');
        }
        return $return;
    }
}