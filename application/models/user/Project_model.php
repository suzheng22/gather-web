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
                else if($key='upUserId'){
                    $data['upUserId']=$val;
                    $url=$this->user_api_url."/user/info";
                    $return=$this->curl($url,$data);
                    $user=json_decode($return,true);
                    $datas[$i]['updateName']=$user['trueName'];
                }
            }
        }
        $project['total']=$count;
        $project['data']=$datas;
        return $project;
    }
    function addProject($data){
        $url=$this->user_api_url."/project/addProject";
        $return =$this->curl($url,$data);
        if(!$return){
            $return =array('msg'=>'添加成功');
        }
        return $return;
    }
    function addProjectUser($data){
        $url=$this->user_api_url."/project/addProjectUser";
        $return =$this->curl($url,$data);
        if(!$return){
            $return =array('msg'=>'添加成功');
        }
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