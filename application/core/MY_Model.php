<?php
class MY_Model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
         $this->load->library('Curl');
	     $this->user_api_url="http://192.168.8.29:8080";
	     
	     //线上
	     //$this->user_api_url="121.40.241.156:8000";
	     $this->tmore_api_url="http://test.tmore.net:81/api.php";
    }
}
?>