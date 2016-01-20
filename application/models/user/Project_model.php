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
        $token=$data['token'];
        $url=$this->user_api_url.'/user/getProjectAll?token='.$token;
        $return=$this->curl($url,$data);
        $datas=json_decode($return,true);
        //var_dump($datas);
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
        $token=$data['token'];
        $url=$this->user_api_url."/user/getProjectUserByFiled";
        $data['token']=urldecode($data['token']);
        $return =$this->curl($url,$data,'get');
        $data['token']=urlencode($data['token']);
        $datas=json_decode($return,true);
        $total=$datas['count'];
        $datas=$datas['data'];
        $count=count($datas);
        for($i=0;$i<$count;$i++){
            foreach( $datas[$i] as $key=>$val){
                $datas[$i]['lId']=$i+1;
                if($key==='userId'){
                    $data['upUserId']=$val;
                    $url=$this->user_api_url."/user/info?token=".$token;
                    $return=$this->curl($url,$data);
                    $user=json_decode($return,true);
                    $datas[$i]['userName']=$user['trueName'];
                    $roleId=$user['roleId'];
                    //根据userID获取角色
                    $url=$this->user_api_url."/user/getUserRoleList?token=".$token;
                    $return=$this->curl($url,$data);
                    $role=json_decode($return,true);
                    $roles=$role['list'];
                    //遍历
                    foreach($roles as $key1=>$val1){
                            if($roleId==$val1['roleId']){
                                $datas[$i]['roleName']=$val1['roleName'];
                            }
                    }
                }else if($key==='creatUserId'){
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
                }
            }
        }
        $data_return['total']=$total;
        $data_return['data']=$datas;
        return $data_return;
    }
    //根据条件获取项目
    function getProjectByField($data){
        $token=($data['token']);
        if($data['page']==""){
            $data['page']=1;
        }
        unset($data['userId']);
        $url=$this->user_api_url."/user/getProjectByFiled";
        $data['token']=urldecode($data['token']);
        $return =$this->curl($url,$data,'get');
        $data['token']=urlencode($data['token']);
        $datas=json_decode($return,true);
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
                    $url=$this->user_api_url."/user/info?token=".$token;
                    $return=$this->curl($url,$data);
                    $user=json_decode($return,true);
                    $datas[$i]['userName']=$user['trueName'];
                    $roleId=$user['roleId'];
                    //根据userID获取角色
                    $url=$this->user_api_url."/user/getUserRoleList?token=".$token;
                    $return=$this->curl($url,$data);
                    $role=json_decode($return,true);
                    $roles=$role['list'];
                    //遍历
                    foreach($roles as $key1=>$val1){
                        if($roleId==$val1['roleId']){
                            $datas[$i]['roleName']=$val1['roleName'];
                        }
                    }
                }else if($key==='creatUserId'){
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
                }
            }
        }
        $data_return['total']= $total;
        $data_return['data']=$datas;
        return $data_return;
    }
    //改变项目状态
    function freezeProject($data){
        $token=$data['token'];
        $url=$this->user_api_url."/user/freezeProject?token=".$token;
        $return =$this->curl($url,$data);
        return json_decode($return);
    }
    function freezeProjectUser($data){
        $token=$data['token'];
        $url=$this->user_api_url."/user/freezeProjectUser?token=".$token;
        $return =$this->curl($url,$data);
        return json_decode($return);
    }
    //增加项目
    function addProject($data){
        $token=$data['token'];
        $url=$this->user_api_url."/user/addProject?token=".$token;
        $return =$this->curl($url,$data);
        return json_decode($return);
    }
    //增加项目用户
    function addProjectUser($data){
        $token=$data['token'];
        $url=$this->user_api_url."/user/addProjectUser?token=".$token;
        $return =$this->curl($url,$data);
        return $return;
    }
    //根据PID获取项目名称；
    function getPNameByPId($data){
        $token=$data['token'];
        $project['pId']=$data['pId'];
        $project['token']=$data['token'];
        $url=$this->user_api_url."/user/getProjectByFiled?token={$token}";
        $return =$this->curl($url,$data);
        $projects=json_decode($return,true);
        return $projects['data'][0]['pName'];
    }
}