<?php
class MY_Model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
         $this->load->library('Curl');
	     $this->user_api_url="http://192.168.8.29:8080";
    }
}
?>