<?php
class User_model extends MY_Model {


    public function __construct()
    {
    // Call the CI_Model constructor
      parent::__construct();

    }
    //登录
    function checkLogin($data){
        $url=$this->user_api_url."/user/login";	
		$return=$this->curl($url,$data);
        return $return;
    }
    
    function getUserListByGroup($data){
        $url=$this->user_api_url."/user/userGroupList";
        $return=$this->curl($url,$data);
        return $return;
    }   
    
    
    function getuserRoleList($data){
        $url=$this->user_api_url."/user/getUserRoleList";
        $return=$this->curl($url,$data);
        return $return;
    }
    
    function getGroupList($data){
        $url=$this->user_api_url."/user/getUserGroupList";
        $return=$this->curl($url,$data);
        return $return;
    }
    
    function getUserList($data){
        $url=$this->user_api_url."/user/getUserList";
        $return=$this->curl($url,$data);
        return $return;
    }
    
    
    function addUser($data){
        $url=$this->user_api_url."/user/addUser";
        $return=$this->curl($url,$data);
        return $return;
    }
    
    function rePwd($data){
        $url=$this->user_api_url."/user/rePwd";
        $return=$this->curl($url,$data);
        return $return;
    }
    
    function freeze($data){
        $url=$this->user_api_url."/user/freeze";
        $return=$this->curl($url,$data);
        return $return;
    }
    
    function getInfo($data){
        $url=$this->user_api_url."/user/info";
        $return=$this->curl($url,$data);
        return $return;
    }
    
    function editUser($data){
        $url=$this->user_api_url."/user/editUser";
        $return=$this->curl($url,$data);
        return $return;
    }
    
    function editGroup($data){
        $url=$this->user_api_url."/user/editGroup";
        $return=$this->curl($url,$data);
        return $return;
    }
    
    function addGroup($data){
        $url=$this->user_api_url."/user/addGroup";
        $return=$this->curl($url,$data);
        return $return;
    }
    
    function getGroupInfo($data){
        $url=$this->user_api_url."/user/groupInfo";
        $return=$this->curl($url,$data);
        return $return;
    }
    
    function editPwd($data){
        $url=$this->user_api_url."/user/editPwd";
        $return=$this->curl($url,$data);
        return $return;
    }
    
    function getUserIdsByFiled($data){
        $data['token']=urlencode($data['token']);
        $url=$this->user_api_url."/user/getUserIdsByFiled";
      //  echo $url;
        $return=$this->curl($url,$data);
     //   var_dump($return);
        return $return;
    }
    
    function getGroupListByRole($roleId){
        $data['roleId']=$roleId;
        $data['userId']=$this->user_info['userId'];
        $data['token']=$this->user_info['token'];
        $str=$this->getGroupList($data);
        return  $group_list=json_decode($str,true);
    }
}
?>