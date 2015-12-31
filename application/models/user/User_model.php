<?php
class User_model extends MY_Model {


    public function __construct()
    {
    // Call the CI_Model constructor
      parent::__construct();

    }
    //登录
    function checkLogin($data){
        $token=$data['token'];
        $post['userName']=$data['userName'];
        $post['pwd']=$data['pwd'];
        $post['loginType']=1;
        $data=json_encode($post);
        $url=$this->user_api_url."/user/login?token=".$token;
		$return=$this->curl($url,$data,'post');
      //  var_dump($return);
        return $return;
    }
    
    function getUserListByGroup($data){
        $token=$data['token'];
        $url=$this->user_api_url."/user/userGroupList?token=".$token;
        $return=$this->curl($url,$data);
        return $return;
    }   
    
    
    function getuserRoleList($data){
        $token=$data['token'];
        $url=$this->user_api_url."/user/getUserRoleList?token=".$token;
        $return=$this->curl($url,$data);
        return $return;
    }
    
    function getGroupList($data){
        $token=$data['token'];
        $url=$this->user_api_url."/user/getUserGroupList?token=".$token;
        $return=$this->curl($url,$data);
        return $return;
    }
    
    function getUserList($data){
        $token=$data['token'];
        $url=$this->user_api_url."/user/getUserList?token=".$token;
        $return=$this->curl($url,$data);
        return $return;
    }
    
    
    function addUser($data){
        $token=$data['token'];
        $url=$this->user_api_url."/user/addUser?token=".$token;
        $return=$this->curl($url,$data);
        return $return;
    }
    
    function rePwd($data){
        $token=$data['token'];
        $url=$this->user_api_url."/user/rePwd?token=".$token;
        $return=$this->curl($url,$data);
        return $return;
    }
    
    function freeze($data){
        $token=$data['token'];
        $url=$this->user_api_url."/user/freeze?token=".$token;
        $return=$this->curl($url,$data);
        return $return;
    }
    
    function getInfo($data){
        $token=$data['token'];
        $url=$this->user_api_url."/user/info?token=".$token;
        $return=$this->curl($url,$data);
        return $return;
    }
    
    function editUser($data){
        $token=$data['token'];
        $url=$this->user_api_url."/user/editUser?token=".$token;
        $return=$this->curl($url,$data);
        return $return;
    }
    
    function editGroup($data){
        $token=$data['token'];
        $url=$this->user_api_url."/user/editGroup?token=".$token;
        $return=$this->curl($url,$data);
        return $return;
    }
    
    function addGroup($data){
        $token=$data['token'];
        $url=$this->user_api_url."/user/addGroup?token=".$token;
        $return=$this->curl($url,$data);
        return $return;
    }
    
    function getGroupInfo($data){
        $token=$data['token'];
        $url=$this->user_api_url."/user/groupInfo?token=".$token;
        $return=$this->curl($url,$data);
        return $return;
    }
    
    function editPwd($data){
        $token=$data['token'];
        $url=$this->user_api_url."/user/editPwd?token=".$token;
        $return=$this->curl($url,$data);
        return $return;
    }
    
    function getUserIdsByFiled($data){
        $token=$data['token'];
        $url=$this->user_api_url."/user/getUserIdsByFiled?token=".$token;
        $return=$this->curl($url,$data);
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