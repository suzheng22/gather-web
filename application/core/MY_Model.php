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
        if($this->user_info['userId']=="58"){
            $this->more_api_url="http://139.196.36.81:8008/";
        }else{
            $this->more_api_url=MOREAPI;
        }

         $this->pic_path=PICPATH;
    }
    
    function curl($url,$data,$m='post'){
        $return=$this->curl->_simple_call($m,$url,$data);
        $return_str=json_decode($return,true);
        $array=array();
        if(preg_match("/^[20][0-9]/",$return_str['http_code'])){
            $array['url']=$return_str['url'];
            $array['code']=$return_str['http_code'];
            //如果无法匹配成功说明返回错误
            if($return['http_code']==400){
                $array['msgCode']="参数错误";
            }elseif($return['http_code']==401){
                $array['msgCode']="认证授权失败";
            }elseif($return['http_code']==403){
                $array['msgCode']="无权限";
            } elseif($return['http_code']==404){
                $array['msgCode']="资源不存在";
            }elseif($return['http_code']==405){
                $array['msgCode']="请求方式错误";
            }elseif($return['http_code']==412){
                $array['msgCode']="请求不满足条件";
            }elseif($return['http_code']==500){
                $array['msgCode']="服务器错误(sql)";
            }elseif($return['http_code']==503){
                $array['msgCode']="服务端不可用";
            }elseif($return['http_code']==504){
                $array['msgCode']="服务端操作超时";
            }
            return $array;
        }else{
            return $return;
        }

    }
}
?>