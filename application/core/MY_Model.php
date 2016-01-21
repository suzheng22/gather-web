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
	     
	     $this->StatusArray=array('shootStatus'=>array('无法拍摄','未拍摄','已拍摄','拍摄已上传','拍摄已驳回','已审核通过'),
	         'deportType'=>array(1=>'导入入库',2=>'驳回入库',3=>'新包装入库',4=>'新增图入库',5=>'组合图入库',6=>'非导入入库',7=>'取消'),
	         'retouchStatus'=>array("未领取", "已领取", "已下载", "已反馈", "反馈驳回", "已修图", "已上传", "已审核通过", "已审核驳回","反馈通过"),
	         'status'=>array("待录入","录入中","已录入","录入审核通过","录入驳回","拍摄反馈","拍摄反馈通过","拍摄反馈驳回")
	     );
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
    
    function getStatusName($fild,$id){
        return $this->StatusArray[$fild][$id];
    }
}
?>