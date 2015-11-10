<?php
class MY_Model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
         $this->load->library('Curl');
	     
         $this->user_api_url="http://192.168.8.29:8080";
	     //线上$this->user_api_url="http://121.40.241.156:8000";
	     $this->tmore_api_url="http://apics.greensea.com.cn/api.php";
	     
    }
    
    function curl($url,$data,$m='post'){
        $return=$this->curl->_simple_call($m,$url,$data);
        $return_str=json_decode($return,true);
                if($return_str['msgCode']>0){
                    if(isset($_SERVER["HTTP_X_REQUESTED_WITH"]) && strtolower($_SERVER["HTTP_X_REQUESTED_WITH"])=="xmlhttprequest"){
                        // ajax 请求的处理方式
                        echo $return;exit;
                    }else{
                        // 正常请求的处理方式
                       header("Location: ".site_url('user/logout')); 
                    };
                    
            
        }
        else{
            return $return;
        }
    }
}
?>