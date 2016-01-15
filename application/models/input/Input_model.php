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
        $n=0;
        foreach($return['data'] as $key=>$val){
            $n++;
            $return['data'][$key]['lId']=$n;
            //根据条形码获取条码名称
            $gtin['gtin']=$val['gtin'];
            $gtin['token']=$data['token'];
            //  var_dump($goods);
            $goods=$this->goods_model->getGoodsByGtin($gtin);
          //  var_dump($goods);
           $return['data'][$key]['goodsName']=$goods['gName'];
            //根据pId获取项目名称
            $pId['pId']=$val['pId'];
            $pId['token']=$data['token'];
            $return['data'][$key]['pName']=  $this->project_model->getPNameByPId($pId);
        }
      // var_dump($return);
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
        //  var_dump($goods);
        $goods=$this->goods_model->getGoodsByGtin($gtin);
        //  var_dump($goods);
        $return['goodsName']=$goods['gName'];
        $return['catName']=$goods['catgrory1'];
        //根据catId获取分类名称
        $cat=$this->product_model->getCatgroryList();
        foreach($cat['data'] as $key=>$val){
            // var_dump($val);
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
        $gtin['gtin']=$return['gtin'];
        $gtin['token']=$token;
        $goods=$this->goods_model->getGoodsByGtin($gtin);
        $return['goodsName']=$goods['gName'];
        $return['catName']=$goods['catgrory1'];
        //根据catId获取分类名称
        $cat=$this->product_model->getCatgroryList();
        foreach($cat['data'] as $key=>$val){
           // var_dump($val);
            if($return['catName']==$val['id']){
                $return['catName']=$val['name'];
            }
        }
        //根据inputId获取驳回原因
        if($return['status']==4){
            $url=$this->more_api_url."lingmall/inputAudit/{$data['inputId']}?token={$token}";
            $returns=$this->curl($url,'','get');
          //  var_dump($returns);
            $returns=json_decode($returns);
          //  var_dump($returns);
            $return['memo']=$returns['memo'];
            $return['memoPoint']=$returns['memoPoint'];
        }
     //   var_dump($return);
        //根据pId获取项目名称
        return $return;
    }
    //获取录入图片的接口
    function getAllImage($data){
        $xPack=$data['packet'];
        $url="http://139.196.36.81:8600/lingmall/pictures?token=7jsD03yg64t1kPuOANJxBI1dMpzfvUgkaBr9y11Ybg1M9X3N-54ptlhgaJjXDeqE&xBarcode={$data['gtin']}&xType=1&xPack=$xPack";
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
    //录入审核列别奥
    function getAuditList($data){
        $data['token']=urldecode($data['token']);
        $url=$this->more_api_url."/lingmall/input/auditList";
        $return=$this->curl($url,$data,'get');
        $return=json_decode($return,true);

        $data['token']=urlencode($data['token']);
        $n=0;
        foreach($return['data'] as $key=>$val){
            $n++;
            $return['data'][$key]['lId']=$n;
            //根据inputId获取详细信息
            $input['inputId']=$val['inputId'];
            $input=$this->getInputInfo($input);
            var_dump($input);die();
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

}
?>