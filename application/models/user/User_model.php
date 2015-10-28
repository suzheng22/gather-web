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
		$return=$this->curl->_simple_call('post',$url,$data);
        return $return;
    }
    
    function getUserListByGroup($data){
        $url=$this->user_api_url."/user/userGroupList";
        $return=$this->curl->_simple_call('post',$url,$data);
        return $return;
    }   
    
    
}
?>