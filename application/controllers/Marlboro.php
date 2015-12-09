<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Marlboro extends My_Controller {
    public function __construct()
    {
        parent::__construct();
        $this->load->model('ps/marlboro_model');
        $this->load->model('user/user_model');
        $this->load->model('publicFuc/publicFuc_model','publicFuc');
    }
    function ps(){
        $data['userId']=$this->user_info['userId'];
        $data['token']=$this->user_info['token'];
        $group_list= $this->user_model->getGroupListByRole(6);

        $this->ci_smarty->assign('group_list',$group_list['list']);

        $data['userName']=$this->input->get('userName');
        $data['groupId']=$this->input->get('groupId');
        if($data['userName']!=''){
                $this->ci_smarty->assign('userName',$data['userName']);
        }
        
        if($data['groupId']!=''){
            $this->ci_smarty->assign('groupId',$data['groupId']);
        }
        if($data['userName']!='' ||$data['groupId']!=''){
            $str=$this->user_model->getUserIdsByFiled($data);
            $user_id_list=json_decode($str,true);
            $data['users']=serialize($user_id_list);
        }
        $list=$this->marlboro_model->getMarlboroList($data);

        $this->ci_smarty->assign('glist',$list);
       
        $this->ci_smarty->display('ps_check_list.tpl');
    }
    
    function psDetail($userId){
       $this->load->model('user/user_model','user');
       $this->load->model('sdk/product_model','product');
       $data['userId']=$this->user_info['userId'];
       $data['token']=$this->user_info['token'];
       $data['upUserId']=$userId;
       
       $str=$this->user->getInfo($data);
       $u_info=json_decode($str,true);
       $this->ci_smarty->assign('u_info',$u_info);

       $type_list=$this->product->getType();
       $this->ci_smarty->assign('type_list',$type_list);


       $page_url=$this->root_path.'Marlboro/psDetail/'.$userId.'?';
        $arr=$this->input->get();
        if($arr['sTime']==''||$arr['eTime']==''){
            unset($arr['sTime']);
            unset($arr['eTime']);
        }
        if(!isset($arr['status'])){
            $arr['status']=null;
        }
        if(!isset($arr['page'])){
            $arr['page']=1;
        }
        $arr['rId']=$userId;
        //增加参数
        $page_url=$this->publicFuc->getUrl( $page_url,$arr);

//       $arr['rId']=$userId;
//
//       $proName=$this->input->get('proName');
//       $type=$this->input->get('type');
//       $retouchType=$this->input->get('retouchType');
//       $status=$this->input->get('status');
//       $start_time=$this->input->get('start_time');
//       $end_time=$this->input->get('end_time');
//       $page=$this->input->get('page');
//
//       if(isset($proName)){
//           $arr['proName']=$proName;
//           $page_url.='proName='.$proName."&";
//           $this->ci_smarty->assign('proName',$proName);
//       }
//       if(isset($type)){
//           $arr['type']=$type;
//           $page_url.='type='.$type."&";
//           $this->ci_smarty->assign('type',$type);
//       }
//       if(isset($retouchType)){
//           $arr['retouchType']=$retouchType;
//           $page_url.='retouchType='.$retouchType."&";
//           $this->ci_smarty->assign('retouchType',$retouchType);
//       }
//       if(isset($status)){
//           $arr['status']=$status;
//           $page_url.='status='.$status."&";
//           $this->ci_smarty->assign('status',$status);
//       }
//       else {
//           $this->ci_smarty->assign('status','NULL');
//       }
//       if(isset($start_time)&&isset($end_time)){
//           $arr['sTime']=strtotime($start_time);
//           $arr['eTime']=strtotime($end_time);
//           $page_url.='sTime='.$start_time."&eTime=".$end_time;
//           $this->ci_smarty->assign('start_time',$start_time);
//           $this->ci_smarty->assign('end_time',$end_time);
//       }
//
//
//       if(isset($page)){
//           $arr['page']=$page;
//       }
//       else{
//           $arr['page']=1;
//       }
       
       $list=$this->marlboro_model->getMarlboroInfo($arr);
       //print_r($list);exit;
       $showpage= parent::page($page_url,10,$list['totalCount']);
       $this->ci_smarty->assign('glist',$list);
       $this->ci_smarty->assign('pages',$showpage['show']);
       $this->ci_smarty->display('ps_check_detail.tpl'); 
    }
    
    function psDetailPic($gtin){
        $this->load->model('sdk/product_model','product');
        $arr['gtin']=$gtin;
        $arr['type']='pic';
        $list=$this->marlboro_model->getMarlboroInfoPic($arr);
        $status=$this->marlboro_model->getReviewStatus($arr);

        foreach ($list['a3'] as $k=>$v){
            $png=$v;
            $v=str_replace('a3', 'a2', $v);
            $jpg=str_replace('png', 'JPG', $v);
            $str.="<li><img src='".$jpg."?imageView/1/w/50/h/50' mm='".$png."' /></li>";     
        }
        $this->ci_smarty->assign('png',$str);
        $product_info=$this->product->getProduct($arr);
        $this->ci_smarty->assign('p_info',$product_info);     
        $this->ci_smarty->assign('plist',$list);
        $this->ci_smarty->assign('status',$status['status']);
        $this->ci_smarty->display('ps_check_pic.tpl');
    }
    
    function shootDetailPic($gtin){
        $this->load->model('sdk/product_model','product');
        $arr['gtin']=$gtin;
        $arr['type']='shoot';
        $list=$this->marlboro_model->getMarlboroInfoPic($arr);
        $status=$this->marlboro_model->getReviewStatus($arr);
        $product_info=$this->product->getProduct($arr);
        //新增拍摄类型
        if(!isset($product_info['shootType']))
            $product_info['shootType']='立体';
        //项目
        if(!isset($product_info['project']))
            $product_info['project']='001';
        //包装
        if(!isset($product_info['pack']))
            $product_info['pack']='包装一';
        //批次
        if(!isset($product_info['batch']))
            $product_info['batch']='批次一';

        $this->ci_smarty->assign('p_info',$product_info);
        $this->ci_smarty->assign('plist',$list);
        $this->ci_smarty->assign('status',$status['status']);
        $this->ci_smarty->display('shoot_check_pic.tpl');
    }


    function checkStatus(){
        $data['gtin']=$this->input->post('gtin');
        $data['type']=$this->input->post('type');
        $data['status']=$this->input->post('status');
        $data['userId']=$this->user_info['userId'];
        $memo=$this->input->post('memo');
        $data['table']=$this->input->post('table');
        if(isset($memo)){
            $data['memo']=$this->input->post('memo');
        }
       echo $this->marlboro_model->changeStatus($data);exit;
    }
    function batchChangeStatus(){
        $data['rId']=$this->input->post('rId');
        $data['userId']=$this->user_info['userId'];
        $start_time=$this->input->post('start_time');
        $end_time=$this->input->post('end_time');
        $type=$this->input->post('type');
        $proName=$this->input->post('proName');
        $data['table']=$this->input->post('table');
        if(isset($start_time)&&isset($end_time)){
           $data['sTime']=strtotime($start_time);
           $data['eTime']=strtotime($end_time);
        }
        if(isset($type)){
            $data['type']=$type;
        }
        if(isset($proName)){
            $data['proName']=$proName;
        }
        echo $this->marlboro_model->batchChangeStatus($data);exit;
    }
    //拍摄审核
    function shoot(){
        $this->load->model('user/user_model','user');
        $this->load->model('user/project_model','project');
        $data['userId']=$this->user_info['userId'];
        $data['token']=$this->user_info['token'];

        $page_url=$this->root_path.'/marlboro/shoot?';
        $group_list=$this->user_model->getGroupListByRole(3);
        $this->ci_smarty->assign('group_list',$group_list['list']);
        //获取项目
        $project_list=$this->project->getProjectList($data);
        $this->ci_smarty->assign('project_list',$project_list['data']);
        $arr=$this->input->get();
        $arr['pId']=$arr['project'];
        unset($arr['project']);
        if(!isset($arr['page'])){
            $arr['page']=1;
        }
        $arr['userId']=$this->user_info['userId'];
        $arr['token']=$this->user_info['token'];
        if($arr['userName']!='' ||$arr['groupId']!='' || $arr['pId']){//1
            $str=$this->user->getUserIdsByFiled($arr);
            $user_id_list=json_decode($str,true);
            $arr['users']=serialize($user_id_list);
        }
       // var_dump($arr);
        //增加参数
      //  $page_url=$this->publicFuc->getUrl( $page_url,$arr);
     //   $showpage= parent::page($page_url,10,$list['totalCount']);
   //     $this->ci_smarty->assign('glist',$list);
    //    $this->ci_smarty->assign('pages',$showpage['show']);
//        $data['userName']=$this->input->get('userName');
//        $data['groupId']=$this->input->get('groupId');
//        $data['pId']=$this->input->get("project");//1
//        if($data['userName']!=''){
//            $this->ci_smarty->assign('userName',$data['userName']);
//        }
//        if($data['groupId']!=''){
//            $this->ci_smarty->assign('groupId',$data['groupId']);
//        }
//        if($data['pId']!=''){
//            $this->ci_smarty->assign('projectId',$data['projectId']);
//        }//1



        $list=$this->marlboro_model->getShootList($data);
        $this->ci_smarty->assign('glist',$list);
        $this->ci_smarty->display('shoot_check.tpl');
        
    }
    //拍摄详情
    function shootDetail($userId){
        $this->load->model('user/user_model','user');
        $this->load->model('sdk/product_model','product');
        $this->load->model('user/project_model','project');
        $data['userId']=$this->user_info['userId'];
        $data['token']=$this->user_info['token'];
        $data['upUserId']=$userId;
        $str=$this->user->getInfo($data);
        $u_info=json_decode($str,true);
        $this->ci_smarty->assign('u_info',$u_info);
        $type_list=$this->product->getType();
        $this->ci_smarty->assign('type_list',$type_list);
        //获取项目
        $project_list=$this->project->getProjectList($data);
        $this->ci_smarty->assign('project_list',$project_list['data']);
        $page_url=$this->root_path.'Marlboro/shootDetail/'.$userId.'?';
        $arr=$this->input->get();
        if($arr['sTime']==''||$arr['eTime']==''){
            unset($arr['sTime']);
            unset($arr['eTime']);
        }
        if(!isset($arr['status'])){
            $arr['status']=null;
        }
        if(!isset($arr['page'])){
            $arr['page']=1;
        }
        $arr['rId']=$userId;
        //增加参数
        $page_url=$this->publicFuc->getUrl( $page_url,$arr);
        $list=$this->marlboro_model->getShootInfo($arr);
        //项目
        $showpage= parent::page($page_url,10,$list['totalCount']);
        $this->ci_smarty->assign('glist',$list);
        $this->ci_smarty->assign('pages',$showpage['show']);
        $this->ci_smarty->display('shoot_check_detail.tpl');
    }
    //拍摄通过
    function shootPass(){
        $data['gtin']=$this->input->post('gtin');
        $data['userId']=$this->user_info['userId'];
        $data['token']=$this->user_info['token'];
        $str=$this->marlboro_model->changeStatus($data);
        echo json_encode($str);
    }
    //增加缺图
    function addMissFigure(){
        $data=$this->input->post();
        $data['userId']=$this->user_info['userId'];
        $data['token']=$this->user_info['token'];;
        $str=$this->marlboro_model->addMissFigure($data);
        $str['msg']='添加成功';
        echo json_encode($str);
    }
    //无法测量管理
    function noMeasure(){
        $this->load->model('user/project_model','project');
        $this->load->model('sdk/product_model','product');
        $data['userId']=$this->user_info['userId'];
        $data['token']=$this->user_info['token'];
        //商品分类的查询
        $type_list=$this->product->getType();
        $this->ci_smarty->assign('type_list',$type_list);
        $page_url=$this->root_path.'marlboro/noMeasure?';
        //加入项目
        $arr=$this->input->get();
        if($arr['sTime']==''||$arr['eTime']==''){
            unset($arr['sTime']);
            unset($arr['eTime']);
        }
        if(!isset($arr['status'])){
            $arr['status']=null;
        }
        if(!isset($arr['page'])){
            $arr['page']=1;
        }
        //增加参数
        $page_url=$this->publicFuc->getUrl( $page_url,$arr);
        //获取无法测量管理列表
        $noMeasureList=$this->marlboro_model->getNoMeasureList($arr);
        if($arr['is_ext']==1){
            //        $query=$noMeasureList['list'];
            $fileName='拍摄驳回统计';
            $fields=array('大家好','很好','俗话');
            $imgName='image';
            $query =array(0=>array('d','b','image'=>'C:/Users/Administrator/Pictures/1.jpg'),array('d','3','image'=>'C:/Users/Administrator/Pictures/2.jpg'));
            echo $this->phpExcel($imgName,$fileName,$fields, $query);
        }
        $showPage= parent::page($page_url,5,$noMeasureList['totalCount']);
        //获取项目标签
        $this->ci_smarty->assign('mlist',$noMeasureList['list']);
        $this->ci_smarty->assign('pages',$showPage['show']);
        $this->ci_smarty->display('no_measure.tpl');
    }
    //无法拍摄
    function noShoot(){
        $this->load->model('user/project_model','project');
        $this->load->model('sdk/product_model','product');
        $this->load->model('publicFuc/publicFuc_model','publicFuc');
        $data['userId']=$this->user_info['userId'];
        $data['token']=$this->user_info['token'];
        //商品分类的查询
        $type_list=$this->product->getType();
        $this->ci_smarty->assign('type_list',$type_list);
        $page_url=$this->root_path.'marlboro/noMeasure?';
        //加入项目
        $arr=$this->input->get();
        if($arr['sTime']==''||$arr['eTime']==''){
            unset($arr['sTime']);
            unset($arr['eTime']);
        }
        if(!isset($arr['status'])){
            $arr['status']=null;
        }
        if(!isset($arr['page'])){
            $arr['page']=1;
        }
        //增加参数
        $page_url=$this->publicFuc->getUrl( $page_url,$arr);
        //获取无法测量管理列表
        $noMeasureList=$this->marlboro_model->getNoShootList($arr);
        if($arr['is_ext']==1){
           // $query=$noMeasureList['list'];
            $fileName='拍摄驳回统计';
            $fields=array('大家好','很好','俗话');
            $imgName='image';
            $query =array(0=>array('d','b','image'=>'C:/Users/Administrator/Pictures/1.jpg'),array('d','3','image'=>'C:/Users/Administrator/Pictures/2.jpg'));
            echo $this->phpExcel($imgName,$fileName,$fields, $query);
        }
        $showPage= parent::page($page_url,5,$noMeasureList['totalCount']);
        //获取项目标签
        $this->ci_smarty->assign('slist',$noMeasureList['list']);
        $this->ci_smarty->assign('pages',$showPage['show']);
        $this->ci_smarty->display('no_shoot.tpl');
    }
    //拍摄新增管理
    function shootAddManager(){
        $this->load->model('user/project_model','project');
        $this->load->model('sdk/product_model','product');
        $data['userId']=$this->user_info['userId'];
        $data['token']=$this->user_info['token'];
        $arr['userId']=$this->user_info['userId'];
        $arr['token']=$this->user_info['token'];
        //商品分类的查询
        $type_list=$this->product->getType();
        $this->ci_smarty->assign('type_list',$type_list);
        $page_url=$this->root_path.'marlboro/noMeasure?';
        //加入项目
        $arr=$this->input->get();
        if($arr['sTime']==''||$arr['eTime']==''){
            unset($arr['sTime']);
            unset($arr['eTime']);
        }
        if(!isset($arr['status'])){
            $arr['status']=null;
        }
        if(!isset($arr['page'])){
            $arr['page']=1;
        }
        //增加参数
        $page_url=$this->publicFuc->getUrl( $page_url,$arr);
        //获取拍摄管理列表
        $shootAddList=$this->marlboro_model->getShootAddList($arr);
        if($arr['is_ext']==1){
            //query= $shootAddList['list'];
            $fileName='拍摄驳回统计';
            $fields=array('大家好','很好','俗话');
            $imgName='image';
            $query =array(0=>array('d','b','image'=>'C:/Users/Administrator/Pictures/1.jpg'),array('d','3','image'=>'C:/Users/Administrator/Pictures/2.jpg'));
            echo $this->phpExcel($imgName,$fileName,$fields, $query);
        }
      //  var_dump($shootAddList);
        $showPage= parent::page($page_url,5,$shootAddList['totalCount']);
        //获取项目标签
        $this->ci_smarty->assign('slist',$shootAddList['list']);
        $this->ci_smarty->assign('pages',$showPage['show']);
        $this->ci_smarty->display('shoot_add_manager.tpl');
    }
    //拍摄驳回统计
    function shootBackDetail(){
        $this->load->model('user/project_model','project');
        $this->load->model('sdk/product_model','product');
        $arr['userId']=$this->user_info['userId'];
        $arr['token']=$this->user_info['token'];
        //商品分类的查询
        $type_list=$this->product->getType();
        $this->ci_smarty->assign('type_list',$type_list);
        $page_url=$this->root_path.'marlboro/noMeasure?';
        //获取传递参数并转为page_yrl
        $arr=$this->input->get();
        if($arr['sTime']==''||$arr['eTime']==''){
            unset($arr['sTime']);
            unset($arr['eTime']);
        }
        if(!isset($arr['status'])){
            $arr['status']=null;
        }
        if(!isset($arr['page'])){
            $arr['page']=1;
        }
        //增加参数
        $page_url=$this->publicFuc->getUrl( $page_url,$arr);
        //获取拍摄管理列表
        $shootAddList=$this->marlboro_model->getShootAddList($arr);
        //导出拍摄驳回
        if($arr['is_ext']==1){
            //        $query=$noMeasureList['list'];
            $fileName='拍摄驳回统计';
            $fields=array('大家好','很好','俗话');
            $imgName='image';
            $query =array(0=>array('d','b','image'=>'C:/Users/Administrator/Pictures/1.jpg'),array('d','3','image'=>'C:/Users/Administrator/Pictures/2.jpg'));
            echo $this->phpExcel($imgName,$fileName,$fields, $query);
        }
        //  var_dump($shootAddList);
        $showPage= parent::page($page_url,5,$shootAddList['totalCount']);
        //获取项目标签
        $this->ci_smarty->assign('slist',$shootAddList['list']);
        $this->ci_smarty->assign('pages',$showPage['show']);
        $this->ci_smarty->display('shoot_back_detail.tpl');
    }
    //根据商品条形码获取商品数据
    function getGoodsByGtin(){
       $this->load->model('goods/goods_model','goods');
        $data['gtin']=$this->input->post('gtin');
        if($data['gtin']!=('123')){
            $return['msg']=0;
            echo json_encode($return);
            exit;
        }
        $return=$this->goods->getGoodsByGtin($data);
       if(!$return){
            $return['msg']=1;
            $return['pack']=array(0=>array('pack'=>1),1=>array('pack'=>2));
            $return['proName']='奶茶';
        }
        echo json_encode($return);
    }
    //增加拍摄操作
    function addShoot(){
        //当前用户ID
        $data=$this->input->post();
        $data['userId']=$this->user_info['userId'];
        $data['token']=$this->user_info['token'];
        if($data['status']==1){
            $data['msg']=$this->marlboro_model->addShoot($data)."1";
        }
        else if( $data['status']==2){
            $data['msg']=$this->marlboro_model->updateShoot($data)."2";
        }
        echo json_encode($data);
    }
    //获取拍摄
    function getShoot(){
        $data['shootId']=$this->input->post('shootId');
        $return=$this->marlboro_model->getShootInfo($data);
        echo json_encode($return);
    }


}