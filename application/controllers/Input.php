<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Input extends My_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('sdk/product_model','product');
        $this->load->model('input/input_model');
        $this->load->model('ps/marlboro_model');
        $this->load->model('publicFuc/publicFuc_model', 'publicFuc');
    }
    //录入管理
    function inputManager(){
        //商品分类
        $type_list=$this->product->getCatgroryList();
        $this->ci_smarty->assign('type_list',$type_list['data']);
        $page_url=$this->root_path."input/inputManager?";
        /*处理表单数据*/
        $page=$this->input->get('page');
        if(!isset($get['status'])){
            $get['status']=null;
        }
        $get=$this->input->get();
        unset($get['page']);
        $page_url=$this->publicFuc->getUrl($page_url,$get);
        $get=$this->getPage($get,$page);
        $get['token']=$this->user_info['token'];
        if($get['sTime']!=''&&$get['eTime']!=''){
            $get['sTime']=strtotime($get['sTime']);
            $get['eTime']=strtotime($get['eTime']);
        }
        $list=$this->input_model->getInputList($get);
        $showpage= parent::page($page_url,10,$list['count']);
        $this->ci_smarty->assign('glist',$list['data']);
        $this->ci_smarty->assign('pages',$showpage['show']);
        $this->ci_smarty->display('input/inputManager.tpl');
    }
    //录入信息
    function index(){
        $data=$this->input->get();
        $data['token']=$this->user_info['token'];
     //   $data['inputId']=$data['inputId'];
        $list=$this->input_model->getAllImage($data);
      //  var_dump($list);
        //获取图片
        $this->ci_smarty->assign('plist',$list);
        $this->ci_smarty->assign('picList',$list[1]);
        //根据orderId获取相关信息
        $inputInfo=$this->input_model->getInputInfo($data);
        $inputInfo['groupGoodsNames']=json_decode($inputInfo['groupGoodsNames'],true);
        $inputInfo['nutritionInfo']=json_decode($inputInfo['nutritionInfo'],true);
        $inputInfo['baseInfo']=json_decode($inputInfo['baseInfo'],true);
        $inputInfo['extInfo']=json_decode($inputInfo['extInfo'],true);
       //var_dump($inputInfo['nutritionFiled']);
        $this->ci_smarty->assign('p_info',$inputInfo);
        $this->ci_smarty->display('input/info.tpl');
    }
    //录入领取
    function inputAdd(){
        $data['token']=$this->user_info['token'];
        //根据orderId获取相关信息
        $inputInfo=$this->input_model->getInputSend($data);
      //  var_dump($inputInfo['baseFiled']['data']);
        $inputInfo['groupGoodsNames']=json_decode($inputInfo['groupGoodsNames'],true);
        $inputInfo['nutritionInfo']=json_decode($inputInfo['nutritionInfo'],true);
        $inputInfo['baseInfo']=json_decode($inputInfo['baseInfo'],true);
        $inputInfo['extInfo']=json_decode($inputInfo['extInfo'],true);
//     var_dump($inputInfo['nutritionInfo']);
        $data['gtin']=$inputInfo['gtin'];
        $data['packet']=$inputInfo['packet'];
        $list=$this->input_model->getAllImage($data);
        $this->ci_smarty->assign('p_info',$inputInfo);
        $this->ci_smarty->assign('plist',$list);
        $this->ci_smarty->assign('picList',$list[1]);
        $this->ci_smarty->display('input/record.tpl');
    }
    //分类保存
    function saveType(){
        $data=$this->input->post();
       // $data['info']='["0":["shopId":"","inputId":"1","shopType":"生产商","shopName":"qwe","province":"北京市","city":"市辖区","region":"东城区","address":"qwe","phone":"qe","sanitaryCertificateNO":"qwe","productionCertificateNO":"qweqe"],"1":["shopId":"","inputId":"1","shopType":"生产商","shopName":"qwe","province":"北京市","city":"市辖区","region":"东城区","address":"qwe","phone":"qe","sanitaryCertificateNO":"qwe","productionCertificateNO":"qweqe"]]';
      //  $data['filed']=6;
      //  $data['inputId']=1;
        //转为数组
        if($data['filed']==1){
            if( $data['info']!=""){
                $data['info']=explode(',',$data['info']);
            }
        }else if($data['filed']==4||$data['filed']==2||$data['filed']==3||$data['filed']==6){
            $data['info']=str_replace("[","{",$data['info']);
            $data['info']=str_replace("]","}",$data['info']);
            $data['info']=json_decode($data['info'],true);
        }else if($data['filed']==5){
            $data['info']=array();
        }
        //转为json
       $return=$this->input_model->saveType($data);
        echo json_encode($return);
    }
    //录入的驳回与通过
    function inputPass(){
        $data=$this->input->post();
        echo $data['status'];
        if($data['status']=="3"){
            $data['memo']="1";
            $data['memoPoint']="2";
        }
        $data['token']=$this->user_info['token'];
        $return=$this->input_model->audit($data);
        echo json_encode($return);
    }
    //录入审核
    function inputList(){
        //商品分类
        $type_list=$this->product->getCatgroryList();
        $this->ci_smarty->assign('type_list',$type_list['data']);
        $page_url=$this->root_path."input/inputList?";
        /*处理表单数据*/
        $page=$this->input->get('page');
        if(!isset($get['status'])){
            $get['status']=null;
        }
        $get=$this->input->get();
        unset($get['page']);
        $page_url=$this->publicFuc->getUrl($page_url,$get);
        $get=$this->getPage($get,$page);
        $get['token']=$this->user_info['token'];
        if($get['sTime']!=''&&$get['eTime']!=''){
            $get['sTime']=strtotime($get['sTime']);
            $get['eTime']=strtotime($get['eTime']);
        }
        $list=$this->input_model->getAuditList($get);
        $showpage= parent::page($page_url,10,$list['count']);
        $this->ci_smarty->assign('glist',$list['data']);
        $this->ci_smarty->assign('pages',$showpage['show']);
        $this->ci_smarty->display('input/inputList.tpl');
    }
    function inputAudit(){
        $data['token']=$this->user_info['token'];
        //根据orderId获取相关信息
        $inputInfo=$this->input_model->getInputAudit($data);
        // var_dump($inputInfo);
        $inputInfo['groupGoodsNames']=json_decode($inputInfo['groupGoodsNames'],true);
        $inputInfo['nutritionInfo']=json_decode($inputInfo['nutritionInfo'],true);
        $inputInfo['baseInfo']=json_decode($inputInfo['baseInfo'],true);
        $inputInfo['extInfo']=json_decode($inputInfo['extInfo'],true);
        $data['gtin']=$inputInfo['gtin'];
        $data['packet']=$inputInfo['packet'];
        $list=$this->input_model->getAllImage($data);
        $this->ci_smarty->assign('p_info',$inputInfo);
        $this->ci_smarty->assign('plist',$list);
        $this->ci_smarty->assign('picList',$list[1]);
        $this->ci_smarty->display('input/index.tpl');
    }

  function sac(){
      $a='[["a0":["b0":["c0":"含量"],"b1":["c0":"weq","c1":"ewqe"],"b2":["c0":"eqwe","c1":"eqwe"],"b3":["c0":"eqwe","c1":"weqe"],"b4":["c0":"eqwe","c1":"eqwe"],"b5":["c0":"qwee","c1":"ewqe"]]]';
      $a=str_replace("[","{",$a);
      $a=str_replace("]","}",$a);
      echo $a;
      $a='[{"a0":{"b0":{"c0":"含量"},"b1":{"c0":"weq","c1":"ewqe"},"b2":{"c0":"eqwe","c1":"eqwe"},"b3":{"c0":"eqwe","c1":"weqe"},"b4":{"c0":"eqwe","c1":"eqwe"},"b5":{"c0":"qwee","c1":"ewqe"}}},{"a1":{"b0":{"c0":"含量"},"b1":{"c0":"weq","c1":"ewqe"},"b2":{"c0":"eqwe","c1":"eqwe"},"b3":{"c0":"eqwe","c1":"weqe"},"b4":{"c0":"eqwe","c1":"eqwe"},"b5":{"c0":"qwee","c1":"ewqe"}}}]';
      var_dump(json_decode($a,true));

  }

}