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

    function getProjectList($data){
        //先获取userID
        $url=$this->user_api_url.'/user/getProjectAll';
        $return=$this->curl($url,$data);
        return json_decode($return,true);
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