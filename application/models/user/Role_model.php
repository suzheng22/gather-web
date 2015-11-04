<?php
class Role_model extends MY_Model {


    public function __construct()
    {
    // Call the CI_Model constructor
      parent::__construct();

    }
    function getRoleList($data) {
        $url=$this->user_api_url."/user/getUserRoleList";
        $return=$this->curl->_simple_call('post',$url,$data);
        return $return;
    }
}
?>