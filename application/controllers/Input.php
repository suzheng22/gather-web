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
    //录入的详细信息
    function index($p_status){
        $data=$this->input->get();
        $data['token']=$this->user_info['token'];
        //根据orderId获取相关信息
        if($data['orderId']!=""){
            $inputInfo=$this->input_model->getOrderInfo($data);
        }else{
            $inputInfo=$this->input_model->getInputInfo($data);
        }
        $data['pId']=$inputInfo['pId'];
        $list=$this->input_model->getAllImage($data);
        //获取图片
        $this->ci_smarty->assign('plist',$list);
        $this->ci_smarty->assign('picList',$list[1]);
        $inputInfo['p_status']=$p_status;
        $inputInfo['groupGoodsNames']=json_decode($inputInfo['groupGoodsNames'],true);
        $inputInfo['nutritionInfo']=json_decode($inputInfo['nutritionInfo'],true);
        $inputInfo['baseInfo']=json_decode($inputInfo['baseInfo'],true);
        $inputInfo['extInfo']=json_decode($inputInfo['extInfo'],true);
       // var_dump($inputInfo['nutritionInfo']);
        $this->ci_smarty->assign('p_info',$inputInfo);
        if($inputInfo['status']==1){
            $this->ci_smarty->display('input/record.tpl');
        }
        else{

            $this->ci_smarty->display('input/info.tpl');
        }

    }
    //录入领取
    function inputAdd($verify){
        $data['token']=$this->user_info['token'];
        //根据orderId获取相关信息
        $inputInfo=$this->input_model->getInputSend($data);
       // var_dump($inputInfo['extFiled']);
        //进行验证
        if($verify=="verify"){
            echo $inputInfo['gtin'];
            exit;
        }
        $inputInfo['groupGoodsNames']=json_decode($inputInfo['groupGoodsNames'],true);
        $inputInfo['nutritionInfo']=json_decode($inputInfo['nutritionInfo'],true);
        $inputInfo['baseInfo']=json_decode($inputInfo['baseInfo'],true);
        $inputInfo['extInfo']=json_decode($inputInfo['extInfo'],true);
        $data['gtin']=$inputInfo['gtin'];
        $data['packet']=$inputInfo['packet'];
        $data['pId']=$inputInfo['pId'];
        $list=$this->input_model->getAllImage($data);
        $this->ci_smarty->assign('p_info',$inputInfo);
        $this->ci_smarty->assign('plist',$list);
        $this->ci_smarty->assign('picList',$list[1]);
        $this->ci_smarty->display('input/record.tpl');
    }
    //分类保存
    function saveType(){
        $data=$this->input->post();
        //转为数组
        if($data['filed']==1){
            if( $data['info']!=""){
                $data['info']=explode(',',$data['info']);
            }
        }else if($data['filed']==4||$data['filed']==2||$data['filed']==3||$data['filed']==6){
            $data['info']=str_replace("[","{",$data['info']);
            $data['info']=str_replace("]","}",$data['info']);
            $data['info']=json_decode($data['info'],true);
            //echo json_encode($data['info']);exit;
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
        $data['token']=$this->user_info['token'];
        $return=$this->input_model->audit($data);
        echo json_encode($return);
    }
    //录入审核列表
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
    //录入审核
    function inputAudit($verify){
        $data['token']=$this->user_info['token'];
        //根据orderId获取相关信息
        $inputInfo=$this->input_model->getInputAudit($data);
        if($verify=="verify"){
            echo $inputInfo['inputId'];
            exit;
        }
        $inputInfo['p_status']=2;
        $inputInfo['groupGoodsNames']=json_decode($inputInfo['groupGoodsNames'],true);
        $inputInfo['nutritionInfo']=json_decode($inputInfo['nutritionInfo'],true);
        $inputInfo['baseInfo']=json_decode($inputInfo['baseInfo'],true);
        $inputInfo['extInfo']=json_decode($inputInfo['extInfo'],true);
        $data['gtin']=$inputInfo['gtin'];
        $data['packet']=$inputInfo['packet'];
        $data['pId']=$inputInfo['pId'];
        $list=$this->input_model->getAllImage($data);
        $this->ci_smarty->assign('p_info',$inputInfo);
        $this->ci_smarty->assign('plist',$list);
        $this->ci_smarty->assign('picList',$list[1]);
        $this->ci_smarty->display('input/info.tpl');
    }
    //录入反馈
    function feed(){
        $data['feedbackInfo']=$this->input->post("feedbackInfo");
        $data['inputId']=$this->input->post('inputId');
        $return=$this->input_model->feed($data);
        echo json_encode($return);
    }
    //录入厂商删除
    function delShop(){
        $data=$this->input->post();
        $return=$this->input_model->delShop($data);
        echo json_encode($return);
    }
    //录入编辑
    function inputChange(){
        $data=$this->input->get();
        $data['token']=$this->user_info['token'];
        //根据orderId获取相关信息
        $inputInfo=$this->input_model->getInputInfo($data);
        $data['pId']=$inputInfo['pId'];
        $list=$this->input_model->getAllImage($data);
        //获取图片
        $this->ci_smarty->assign('plist',$list);
        $this->ci_smarty->assign('picList',$list[1]);
        $inputInfo['groupGoodsNames']=json_decode($inputInfo['groupGoodsNames'],true);
        $inputInfo['nutritionInfo']=json_decode($inputInfo['nutritionInfo'],true);
        $inputInfo['baseInfo']=json_decode($inputInfo['baseInfo'],true);
        $inputInfo['extInfo']=json_decode($inputInfo['extInfo'],true);
        //var_dump($inputInfo['nutritionFiled']);
        $this->ci_smarty->assign('p_info',$inputInfo);
        if($inputInfo['status']!=3){
            $this->ci_smarty->display('input/record.tpl');
        }else{
            $this->ci_smarty->display('input/info.tpl');
        }

    }
    //导出
    function export(){
        $data=$this->input_model->export();
        $field=array("inputId",'条形码','商品分类','商品名称','品牌','含量','规格','型号','field');
        $this->excel($data,$field,"录入审核导出");
    }
    //导入
    function import(){
        $file=$_FILES['uploadFile'];
       // var_dump($file);
        $path=$file['tmp_name'];
        //使用excel处理数据
        if($path!=""){
            $data=$this->readExcel($path);
            unset($data[1]);
            $count=count($data);
            $return=array();
            for($i=0;$i<$count;$i++){
                foreach($data[$i+2] as $key=>$value){
                    $return[$i]['inputId']=$data[$i+2]['A'];
                    $return[$i]['baseInfo'][0]=$data[$i+2]['D'];
                    $return[$i]['baseInfo'][1]=$data[$i+2]['E'];
                    $return[$i]['baseInfo'][2]=$data[$i+2]['F'];
                    $return[$i]['baseInfo'][3]=$data[$i+2]['G'];
                    $return[$i]['baseInfo'][4]=$data[$i+2]['H'];
                    $return[$i]['field']=$data[$i+2]['I'];
                    if($return['field']!=""){
                        $field_array=explode(',',$return['field']);
                        $size=sizeof($field_array);
                        for($j=0;$j<$size;$j++){
                            $return[$i]['baseInfo_d'][$field_array[$j]]= $return[$i]['baseInfo'][$j];
                        }
                    }
                    //$return[$i]['inputId']
                    //统计字数
                    $counts=0;
                    $counts+=mb_strwidth(str_replace(" ","",$data[$i+2]['D']));
                    $counts+=mb_strwidth(str_replace(" ","",$data[$i+2]['E']));
                    $counts+=mb_strwidth(str_replace(" ","",$data[$i+2]['F']));
                    $counts+=mb_strwidth(str_replace(" ","",$data[$i+2]['G']));
                    $counts+=mb_strwidth(str_replace(" ","",$data[$i+2]['H']));
                    $return[$i]['inputCount']=$counts;

                }

            }
            //   echo $count;exit;
            //转为导入的数据
            $return= json_encode($return);
            $msg=$this->input_model->import($return);
            echo json_encode($msg);
        }

    }
    //华润导入数据
    //导入
    function huaRunimport(){
      //  var_dump($_FILES);
        $file=$_FILES['uploadFiles'];
       // var_dump($file);exit;
        // var_dump($file);
        $path=$file['tmp_name'];
        //使用excel处理数据
        if($path!=""){
            $data=$this->readExcel($path);
            unset($data[1]);
            $count=count($data);
        //    echo $count;exit;
            $return=array();
            for($i=0;$i<$count;$i++){
                foreach($data[$i+2] as $key=>$value){
                    $return[$i]['gtin']=$data[$i+2]['A'];
                    $return[$i]['topCatId']=substr($data[$i+2]['B'],0,2);
                    $return[$i]['goodsName']=$data[$i+2]['C'];
                    $return[$i]['baseInfo'][0]=$data[$i+2]['C'];
                    $return[$i]['baseInfo'][1]=$data[$i+2]['D'];
                    $return[$i]['baseInfo'][2]=$data[$i+2]['E'];
                    $return[$i]['baseInfo'][3]=$data[$i+2]['F'];
                    if($data[$i+2]['G']!=""||$data[$i+2]['G']!=null)
                        $return[$i]['baseInfo'][4]=$data[$i+2]['G'];
                    $return[$i]['field']=$data[$i+2]['I'];
                    if($return['field']!=""){
                        $field_array=explode(',',$return['field']);
                        $size=sizeof($field_array);
                        for($j=0;$j<$size;$j++){
                            $return[$i]['baseInfo_d'][$field_array[$j]]= $return[$i]['baseInfo'][$j];
                        }
                    }
                    //$return[$i]['inputId']
                    //统计字数
                    $counts=0;
                    $counts+=mb_strwidth(str_replace(" ","",$data[$i+2]['D']));
                    $counts+=mb_strwidth(str_replace(" ","",$data[$i+2]['E']));
                    $counts+=mb_strwidth(str_replace(" ","",$data[$i+2]['F']));
                    $counts+=mb_strwidth(str_replace(" ","",$data[$i+2]['G']));
                    $counts+=mb_strwidth(str_replace(" ","",$data[$i+2]['H']));
                    $return[$i]['inputCount']=$counts;

                }

            }
            //   echo $count;exit;
            //转为导入的数据
            $return= json_encode($return);
          //  echo $return ;exit;
            $msg=$this->input_model->huaRunimport($return);
            echo json_encode($msg);
        }

    }


}