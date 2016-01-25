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
        $token=$this->user_info['token'];
        $url=$this->user_api_url.'/user/getProjectAll?token='.$token;
        $return=$this->curl($url,$data);
        $datas=json_decode($return,true);
        $count=count($datas['data']);
        $datas=$datas['data'];
        for($i=0;$i<$count;$i++){
            foreach( $datas[$i] as $key=>$val){
                $datas[$i]['lId']=$i+1;
                if($key==='creatUserId'){
                    $data['upUserId']=$val;
                    $url=$this->user_api_url."/user/info?token=".$token;
                    $return=$this->curl($url,$data);
                    $user=json_decode($return,true);
                    $datas[$i]['createName']=$user['trueName'];
                }
                else if($key==='upUserId'){
                    $data['upUserId']=$val;
                    $url=$this->user_api_url."/user/info?token=".$token;
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
    //根据条件获取项目用户
    function getProjectUserByField($data){
        unset($data['upUserId']);
        $url=$this->user_api_url."/user/getProjectUserByFiled";
        $data['token']=urldecode($data['token']);
        $return =$this->curl($url,$data,'get');
        $datas=json_decode($return,true);
        var_dump($datas);
        $total=$datas['count'];
        $datas=$datas['data'];
        $count=count($datas);
        for($i=0;$i<$count;$i++){
            foreach( $datas[$i] as $key=>$val){
                $datas[$i]['lId']=$i+1;
                if($key==='userId'){
                    $data['upUserId']=$val;
                    $user=$this->getUserInfo($data);
                    $datas[$i]['userName']=$user['trueName'];
                    $roleId=$user['roleId'];
                    //根据userID获取角色
                    $roles=$this->getRoleInfo();;
                    //遍历
                    foreach($roles as $key1=>$val1){
                            if($roleId==$val1['roleId']){
                                $datas[$i]['roleName']=$val1['roleName'];
                            }
                    }
                }else if($key==='creatUserId'){
                    $data['upUserId']=$val;
                    $user=$this->getUserInfo($data);
                    $datas[$i]['createName']=$user['trueName'];
                }
                else if($key==='updateUserId'){
                    $data['upUserId']=$val;
                    $user=$this->getUserInfo($data);
                    $datas[$i]['updateName']=$user['trueName'];
                }
            }
        }
        $data_return['total']=$total;
        $data_return['data']=$datas;
        return $data_return;
    }
    //根据条件获取项目
    function getProjectByField($data){
        $data['token']=urldecode($data['token']);
        if($data['page']==""){
            $data['page']=1;
        }
        $url=$this->user_api_url."/user/getProjectByfiters";
        unset($data['userId']);
        $return =$this->curl($url,$data,'get');
        $datas=json_decode($return,true);
        $data['token']=urlencode($data['token']);
        $total=$datas['count'];
        $datas=$datas['data'];
        $count=count($datas);
        if($data['page']==1){
            $s=0;
        }else{
            $s=($data['page']-1)*10;
        }
        for($i=0;$i<$count;$i++){
          if($datas[$i]['pId']==$datas[$i+1]['pId']){
              unset($datas[$i]);
          }else{
              $s++;
          }
            foreach( $datas[$i] as $key=>$val){
                $datas[$i]['lId']="".($s)."";
                if($key==='userId'){
                    $data['upUserId']=$val;
                    $user=$this->getUserInfo($data);
                    $datas[$i]['userName']=$user['trueName'];
                    $roleId=$user['roleId'];
                    //根据userID获取角色
                    $roles=$this->getRoleInfo();;
                    //遍历
                    foreach($roles as $key1=>$val1){
                        if($roleId==$val1['roleId']){
                            $datas[$i]['roleName']=$val1['roleName'];
                        }
                    }
                }else if($key==='creatUserId'){
                    $data['upUserId']=$val;
                    $user=$this->getUserInfo($data);
                    $datas[$i]['createName']=$user['trueName'];
                }
                else if($key==='upUserId'){
                    $data['upUserId']=$val;
                    $user=$this->getUserInfo($data);
                    $datas[$i]['updateName']=$user['trueName'];
                }
            }
        }
        $data_return['total']= $total;
        $data_return['data']=$datas;
        return $data_return;
    }
    //改变项目状态
    function freezeProject($data){
        $p['token']=urldecode($this->user_info['token']);
        $url=$this->user_api_url."/user/freezeProject?".http_build_query($p);
        $return =$this->curl($url,$data);
        return json_decode($return);
    }
    function freezeProjectUser($data){
        $p['token']=urldecode($this->user_info['token']);
        unset($data['token']);
        $url=$this->user_api_url."/user/freezeProjectUser?".http_build_query($p);
        $return =$this->curl($url,$data);
        return json_decode($return);
    }
    //增加项目
    function addProject($data){
        $p['token']=urldecode($this->user_info['token']);
        $url=$this->user_api_url."/user/addProject?".http_build_query($p);
        $return =$this->curl($url,$data);
        return json_decode($return);
    }
    //增加项目用户
    function addProjectUser($data){
        $p['token']=urldecode($this->user_info['token']);
        $url=$this->user_api_url."/user/addProjectUser?".http_build_query($p);
        $return =$this->curl($url,$data);
        return $return;
    }
    //根据PID获取项目名称；
    function getPNameByPId($data){
        $p['token']=urldecode($this->user_info['token']);
        $project['pId']=$data['pId'];
        $url=$this->user_api_url."/user/getProjectByFiled?".http_build_query($p);
        $return =$this->curl($url,$project);
        $projects=json_decode($return,true);
        return $projects['data'][0]['pName'];
    }
    //function 根据userId获取相关信息
    function getUserInfo($data){
        $user['upUserId']=$data['upUserId'];
        $url=$this->user_api_url."/user/info?token={$this->user_info['token']}";
        $return=$this->curl($url,$data);
        $user_return=json_decode($return,true);
        return $user_return;
    }
    //根据userID获取角色信息
    function getRoleInfo(){
        $url=$this->user_api_url."/user/getUserRoleList?token={$this->user_info['token']}";
        $return=$this->curl($url,'');
        $role=json_decode($return,true);
        $roles=$role['list'];
        return $roles;
    }
}