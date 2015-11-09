<?php
class Role_model extends MY_Model {


    public function __construct()
    {
    // Call the CI_Model constructor
      parent::__construct();

    }
    
    function getRoleList($data) {
        $url=$this->user_api_url."/user/getUserRoleList";
        $return=$this->curl($url,$data);
        return $return;
    }
    
    function addRole($data) {
        $url=$this->user_api_url."/user/addRole";
        $return=$this->curl($url,$data);
        return $return;
    }
}
?>