<?php
class Role_model extends MY_Model {


    public function __construct()
    {
    // Call the CI_Model constructor
      parent::__construct();

    }
    
    function getRoleList($data) {
        $token=$data['token'];
        $url=$this->user_api_url."/user/getUserRoleList?token=".$token;
        $return=$this->curl($url,$data);
        return $return;
    }
    
    function addRole($data) {
        $token=$data['token'];
        $url=$this->user_api_url."/user/addRole?token=".$token;
        $return=$this->curl($url,$data);
        return $return;
    }
}
?>