<?php
class Input_model extends MY_Model {


    public function __construct()
    {
    // Call the CI_Model constructor
      parent::__construct();

    }
    //录入条码信息
    function getSkuInfo($data){
        $sku=$this->getSkuBaseInfo($data);
		$skuInfo['baseInfo']=json_decode($sku,true);
		
		if(isset($skuInfo['baseInfo']['gtin'])){
    		$arr['gtin']=$skuInfo['baseInfo']['gtin'];
    		$image=$this->getSkuImage($arr);
    		$skuInfo['images']=json_decode($image,true);
    		
    		$goods=$this->getGoodsInfo($arr);
    		$skuInfo['goods']=json_decode($goods,true);
		}
		else {
		    $skuInfo['images']='';
		}
		
		if (isset($skuInfo['baseInfo']['type'])){
		    $arr_1['fid']=$skuInfo['baseInfo']['type'];
		    $type=$this->getSkuType($arr_1);
		    $skuInfo['type']=json_decode($type,true);
		}
		else{
		    $skuInfo['type']='';
		}
		
		$skuInfo['factoryList']=json_decode($this->getFactoryTypeList(),true);
		

		return $skuInfo;
    }
    
    
    //录入条码主信息
    function getSkuBaseInfo($data){
        $url=$this->tmore_api_url."/enter/getentergtin";
        $return=$this->curl->_simple_call('get',$url,$data);
        return $return;
    }
    
    //录入条码图片信息
    function getSkuImage($data){
        $url=$this->tmore_api_url."/image/getimg";
        $return=$this->curl->_simple_call('get',$url,$data);
        return $return;
    }   
    
    //获取商品信息
    function getGoodsInfo($data){
        $url=$this->tmore_api_url."/enter/GetProDataByGtin";
        $return=$this->curl->_simple_call('get',$url,$data);
        return $return;
        
    }
    
    //获取产商类型信息
    function getFactoryTypeList(){
       $url=$this->tmore_api_url."/enter/GetManuType";
        $return=$this->curl->_simple_call('get',$url); 
        return $return;
    }
    
    
    //保存基本信息
    function saveBaseInfo($data){
        $url=$this->tmore_api_url."/enter/savepublicinfo";
        $return=$this->curl->_simple_call('post',$url,$data);
        return $return;
    }
    
    //保存产商信息
    function saveFactoryInfo($data){
        $url=$this->tmore_api_url."/enter/saveManufacturer";
        $return=$this->curl->_simple_call('post',$url,$data);
        return $return;
    }
    
    //保存分类属性
    function saveBasicInfo($data){
        $url=$this->tmore_api_url."/enter/savetypevalue";
        $return=$this->curl->_simple_call('post',$url,$data);
        return $return;
    }
    
    function save($data){
        $url=$this->tmore_api_url."/enter/SaveGtinStatus";
        $return=$this->curl->_simple_call('post',$url,$data);
        return $return;
    }
    
    //录入条码分类信息
    function getSkuType($data){
         $url=$this->tmore_api_url."/type/getwordkey";
     
        $return=$this->curl->_simple_call('get',$url,$data);
        return $return;  
    }
    
    //
    function SaveNutrient($data){
        $url=$this->tmore_api_url."/enter/SaveNutrient";
        $return=$this->curl->_simple_call('post',$url,$data);
        return $return;
    }
    
    function test(){
       //$data['prefix']='44543';
      
       $token= json_decode($this->token(),true);
       
       $url="http://rsf.qbox.me/list?bucket=tmore&limit=100&prefix=44543";
       
	   $this->curl->http_header('Authorization','QBox '.$token['token']);
       echo $this->curl->_simple_call('post',$url);
        

    }
    
    function token(){
        $url = "http://139.196.36.81:8600/v1/tmore/qiniu/token?type=2&url=http%3A%2F%2Frsf.qbox.me%2Flist%3Fbucket%3Dtmore%26limit%3D100%26prefix%3D44543";
       return  $return=$this->curl->_simple_call('get',$url);
    }
}
?>