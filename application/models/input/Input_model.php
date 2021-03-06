<?php
class Input_model extends MY_Model {


    public function __construct()
    {
    // Call the CI_Model constructor
        $this->load->model('user/project_model');
        $this->load->model('goods/goods_model');
        $this->load->model('sdk/product_model');
      parent::__construct();

    }
    /*
     * 获取录入管理列表
     * 参数 array
     * return array
     * */
    function getInputList($data){
        //重新解析token
        $data['token']=urldecode($data['token']);
        $url=$this->more_api_url."/lingmall/input/list";
        $return=$this->curl($url,$data,'get');
        $return=json_decode($return,true);
        $data['token']=urlencode($data['token']);
        if($data['page']==1){
            $n=0;
        }else{
            $n=($data['page']-1)*10;
        }
        foreach($return['data'] as $key=>$val){
            $n++;
            $return['data'][$key]['lId']=$n;
            //根据条形码获取条码名称
            $gtin['gtin']=$val['gtin'];
            $gtin['token']=$data['token'];
            $goods=$this->goods_model->getGoodsByGtin($gtin);
            $return['data'][$key]['goodsName']=$goods['gName'];
            //根据pId获取项目名称
            $pId['pId']=$val['pId'];
            $pId['token']=$data['token'];
            $return['data'][$key]['pName']=  $this->project_model->getPNameByPId($pId);
        }
        return $return;
    }
    /*
     *获取分配列表
     */
    function getInputSend($data){
        $url=$this->more_api_url."/lingmall/input/send?token={$data['token']}";
        $return=$this->curl($url,$data,'post');
        $return=json_decode($return,true);
        $gtin['gtin']=$return['gtin'];
        $gtin['token']=$data['token'];
        $goods=$this->goods_model->getGoodsByGtin($gtin);
        $return['goodsName']=$goods['gName'];
        $return['catName']=$goods['catgrory1'];
        //根据catId获取分类名称
        $cat=$this->product_model->getCatgroryList();
        foreach($cat['data'] as $key=>$val){
            if($return['catName']==$val['id']){
                $return['catName']=$val['name'];
            }
        }
        return $return;
    }

    //根据inputId获取相关信息
    function getInputInfo($data){
        $token=$this->user_info['token'];
        $url=$this->more_api_url."/lingmall/input/{$data['inputId']}?token={$token}";
        $return=$this->curl($url,'','get');

        $return=json_decode($return,true);
      //  var_dump($return);
        $gtin['gtin']=$return['gtin'];
        $gtin['token']=$token;
        $goods=$this->goods_model->getGoodsByGtin($gtin);
        if(  $return['goodsName']==""){
            $return['goodsName']=$goods['gName'];
        }
        $return['catName']=$goods['catgrory1'];
        //根据catId获取分类名称
        $cat=$this->product_model->getCatgroryList();
        foreach($cat['data'] as $key=>$val){
            if($return['catName']==$val['id']){
                $return['catName']=$val['name'];
            }
        }
        //根据inputId获取驳回原因
        if($return['status']==4){
            $url=$this->more_api_url."/lingmall/inputAudit/{$data['inputId']}?token={$token}";
            $returns=$this->curl($url,'','get');
            $returns=json_decode($returns,true);
            $return['memo']=$returns['memo'];
            $return['memoPoint']=$returns['memoPoint'];
        }
        return $return;
    }
    //获取录入图片的接口
    function getAllImage($data){
        $token['token']=$this->bucket;
        $xPack=$data['packet'];
        $url=$this->image_url."/lingmall/pictures?token={$token['token']}&xBarcode={$data['gtin']}&xType=1&xPack=$xPack&xProject={$data['pId']}";
        $return=$this->curl($url,'','get');
        $list=json_decode($return,true);
        return $list;
    }
    //录入分类保存
    function saveType($data){
        $token=$this->user_info['token'];
        $inputId=$data['inputId'];
        $arr['filed']=$data['filed'];
        $arr['info']=$data['info'];
        $arr['inputCount']=$data['inputCount'];
        if($arr['filed']==2){
            $arr['goodsName']=$data['goodsName'];
            $arr['gtin']=$data['gtin'];
            $arr['proType']=$data['proType'];
        }
        $url=$this->more_api_url."/lingmall/input/{$inputId}?token={$token}";
        $data=json_encode($arr);
        $return=$this->curl($url,$data,'put');
        $return=json_decode($return,true);
        return $return;
    }
    //录入审核操作
    function audit($data){
        $url=$this->more_api_url."/lingmall/input/audit/{$data['orderId']}?token={$data['token']}";
        $arr['memo']=$data['memo'];
        $arr['status']=$data['status'];
        $arr['memoPoint']=$data['memoPoint'];
        $data=json_encode($arr);
        //unset($data['inputId']);
        $return=$this->curl($url,$data,'put');
        return json_decode($return);
    }
    //录入审核l列表
    function getAuditList($data){
        $data['token']=urldecode($data['token']);
        $url=$this->more_api_url."/lingmall/input/auditList";
        $return=$this->curl($url,$data,'get');
        $return=json_decode($return,true);
        $data['token']=urlencode($data['token']);
        if($data['page']==1){
            $n=0;
        }else{
            $n=($data['page']-1)*10;
        }
        foreach($return['data'] as $key=>$val){
            $n++;
            $return['data'][$key]['lId']=$n;
            //根据inputId获取详细信息
            $input['inputId']=$val['inputId'];
            $input=$this->getInputInfo($input);
            //添加条形码
            $return['data'][$key]['gtin']=$input['gtin'];
            //添加项目
            $pId['pId']=$input['pId'];
            $pId['token']=$data['token'];
            $return['data'][$key]['pName']=  $this->project_model->getPNameByPId($pId);
            //根据条形码获取条码的商品名称
            $return['data'][$key]['goodsName']=$input['goodsName'];
            //获取录入类型
            $return['data'][$key]['inputType']=$input['inputType'];
            //添加包装
            $return['data'][$key]['packet']=$input['packet'];
            //获取当前状态
            $return['data'][$key]['status']=$input['status'];
        }
        return $return;
    }
    //分配进入录入审核详细
    function getInputAudit($data){
        $token=$this->user_info['token'];
        $url=$this->more_api_url."/lingmall/input/sendAudit?token={$token}";
        $return=$this->curl($url,$data,'post');

        //根据inputId获取录入信息
        $return=json_decode($return,true);
        $input['inputId']=$return['inputId'];
        $input=$this->getInputInfo($input);
        $input['orderId']=$return['orderId'];
        $input['orderGoodsToday']=$return['orderGoodsToday'];
        $input['inputGoodsCount']=$return['inputGoodsCount'];
        return $input;
    }
    //录入反馈
    function feed($data){
        $token=$this->user_info['token'];
        $inputId=$data['inputId'];
        $feed['feedbackInfo']=$data['feedbackInfo'];
        $feed=json_encode($feed);
        $url=$this->more_api_url."/lingmall/input/feed/{$inputId}?token={$token}";
        $return=$this->curl($url,$feed,'put');
        $return=json_decode($return,true);
        return $return;
    }
    //录入厂商的删除
    function delShop($data){
        $token=$this->user_info['token'];
        $shopId=$data['shopId'];
        $url=$this->more_api_url."/lingmall/input/delShop/{$shopId}?token={$token}";
        $return=$this->curl($url,'','delete');
        $return=json_decode($return,true);
        return $return;
    }
    //根据orderid获取详细信息
    function getOrderInfo($data){
        $url=$this->more_api_url."/lingmall/input/audit/{$data['orderId']}?token={$this->user_info['token']}";
        $return=$this->curl($url,'','get');
        $return=json_decode($return,true);
        $return['orderId']=$data['orderId'];
        return $return;
    }
    function export(){
        $url="http://121.40.241.156:8005/input/export"."?token={$this->user_info['token']}";
        $data=$this->curl($url,'','post');
        return json_decode($data,true);
    }
    function import($data){
        //var_dump($data);
        $url="http://127.0.0.1:8003/input/import"."?token={$this->user_info['token']}";
        $return=$this->curl($url,$data,'post');
        return $return;
      //  var_dump($return);
      //  return json_decode($return,true);
    }

    function huaRunimport($data){
         //var_dump($data);
        $url="http://127.0.0.1:8003/test/huaRunInput"."?token={$this->user_info['token']}";
        $return=$this->curl($url,$data,'post');
        return $return;
        //  var_dump($return);
        //  return json_decode($return,true);
    }

}
?>