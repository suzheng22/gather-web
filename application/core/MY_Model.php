<?php
class MY_Model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
         $this->load->library('Curl');
	     
         $this->user_api_url=USERAPI;
	     //线上$this->user_api_url="http://121.40.241.156:8000";
	     $this->tmore_api_url=CONTROL;
	     $this->more_api_url=MOREAPI;
        $this->pic_path=PICPATH;
    }
    
    function curl($url,$data,$m='post'){
        $return=$this->curl->_simple_call($m,$url,$data);
        $return_str=json_decode($return,true);
                if($return_str['msgCode']>0){
//                    if(isset($_SERVER["HTTP_X_REQUESTED_WITH"]) && strtolower($_SERVER["HTTP_X_REQUESTED_WITH"])=="xmlhttprequest"){
//                        // ajax 请求的处理方式
//                        echo $return;exit;
//                    }else{
//                        $c=$this->uri->segment(1, 0);
//                        $m=$this->uri->segment(2, 0);
//                        $acction=$c.'/'.$m;
//                        $noLoginArray=array('user/login','user/doLogin');
//
//                        if(!in_array($acction,$noLoginArray)){
//                            // 正常请求的处理方式
//
//                            header("Location: ".site_url('user/logout'));
//                        }
//                        else{
//                            return $return;
//                        }
//                    }
                    return $return;
                    
            
        }
        else{
            return $return;
        }
    }
}
?>