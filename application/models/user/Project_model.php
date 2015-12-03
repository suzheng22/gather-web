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
        $url=$this->user_api_url."/user/getProjectList";
        $return=$this->curl($url,$data);
        if(!$return){
            $return=array(
                'list'=>array(
                    '0'=>array(
                        'projectId'=>'1',
                        'project'=>'项目一',
                        'status'=>'1',
                        'describe'=>'123',
                        'createTime'=>'2015-10-12 11:21:11',
                        'creater'=>'苏正',
                        'modifyTime'=>'2015-10-12 11:21:11',
                        'modifyPerson'=>'suzheng'
                    ),
                    '1'=>array(
                        'projectId'=>'2',
                        'project'=>'项目二',
                        'status'=>'2',
                        'describe'=>'1233',
                        'createTime'=>'2015-10-12 11:21:11',
                        'creater'=>'苏正',
                        'modifyTime'=>'2015-10-12 11:21:11',
                        'modifyPerson'=>'suzheng'
                    )),
                'totalCount'=>2
            );
        }
        return $return;
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