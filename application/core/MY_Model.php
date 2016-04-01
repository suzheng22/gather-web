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
	     if(IMGURL=="http://139.196.36.81:8610"){
             $this->bucket="_0qSMe1n3iDd-X6mJI3D9KkX_igyN2MIv8KlXmWcVOTGEhFmPyjQw8TXONWxEAn8";
         }else{
             $this->bucket="7jsD03yg64t1kPuOANJxBI1dMpzfvUgkaBr9y11Ybg1M9X3N-54ptlhgaJjXDeqE";
         }
	     $this->StatusArray=array('shootStatus'=>array('无法拍摄','未拍摄','已拍摄','拍摄已上传','拍摄已驳回','已审核通过'),
	         'deportType'=>array(1=>'导入入库',2=>'驳回入库',3=>'新包装入库',4=>'新增图入库',5=>'组合图入库',6=>'非导入入库',7=>'取消'),
	         'retouchStatus'=>array("未领取", "已领取", "已下载", "已反馈", "反馈驳回", "已修图", "已上传", "已审核通过", "已审核驳回","反馈通过"),
	         'status'=>array("待录入","录入中","已录入","录入审核通过","录入驳回","拍摄反馈","拍摄反馈通过","拍摄反馈驳回")
	     );
        if($this->user_info['userId']=="58"){
            $this->more_api_url="http://139.196.36.81:8005/";
        }else{
            $this->more_api_url=MOREAPI;
        }
        $this->image_url=IMGURL;
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
    
    function getStatusName($fild,$id){
        return $this->StatusArray[$fild][$id];
    }
}
?>