<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Statistics extends My_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('user/user_model');
        $this->load->model('statistics/Statistics_model');
        $this->load->model('user/Project_model');
        $this->load->model('publicFuc/PublicFuc_model');
        $this->load->model('sdk/product_model', 'product');
    }
    
    function psList(){
        $page_url=$this->root_path.'statistics/psList/?';
        
        $group_list= $this->user_model->getGroupListByRole(6);
        
        $this->ci_smarty->assign('group_list',$group_list['list']);
        
        $project_list=$this->Project_model->getProjectList();
        $this->ci_smarty->assign('project_list',$project_list['data']);
        
        $arr=$this->input($page_url,6);
       /* if($this->input->get('is_ext')){
            $data['is_ext']='yes';
            $list=$this->Statistics_model->getPsList($data);
            $str = "用户名,用户组,修图商品数,已审核商品数,待上传商品数,待审核商品数,已驳回商品数\n";
            $str = iconv('utf-8','gb2312',$str);
            foreach ($list['list'] as $k=>$v){
                $userName = iconv('utf-8','gb2312',$v['userName']); //中文转码
                $groupName = iconv('utf-8','gb2312',$v['groupName']);
                $x = iconv('utf-8','gb2312','待定');
                $totalCount = $v['totalCount'];
                $passCount = $v['passCount'];
                $re_uplodeCount = $v['re_uplodeCount'];
                $re_passCount=$v['re_passCount'];
                $str .= $userName.",".$groupName.",".$totalCount.",".$passCount.",".$re_uplodeCount.",".$re_passCount.",".$x."\n";
            }
            $filename = date('Ymd').'修图统计.csv'; //设置文件名
            $this->export_csv($filename,$str); //导出
            exit;
        }
        */
        $list=$this->Statistics_model->getPsList($arr);
        $showpage= parent::page($page_url,10,$list['count']);
        $this->ci_smarty->assign('glist',$list['data']);
        $this->ci_smarty->assign('pages',$showpage['show']);
        $this->ci_smarty->display('statistics/ps_count.tpl');
    }
    
    
    function psDetail($psUserId){
        $page_url=$this->root_path.'statistics/psDetail/'.$psUserId.'?';
        $project_list=$this->Project_model->getProjectList(array());
        $this->ci_smarty->assign('project_list',$project_list['data']);
        
        $type_list=$this->product->getCatgroryList();
        $this->ci_smarty->assign('type_list',$type_list['data']);
        
        $statusList=$this->PublicFuc_model->getStatusList('retouchStatus');
        $this->ci_smarty->assign('statusList',$statusList);
        
        $arr=$this->input($page_url,6);
        $arr['userId']=$psUserId;
        $user_p['upUserId']=$psUserId;
        $u=$this->user_model->getInfo($user_p);
        $u=json_decode($u,true);
        $this->ci_smarty->assign('psUserId',$psUserId);
        $this->ci_smarty->assign('uInfo',$u);

        $list=$this->Statistics_model->getPsDetail($arr);
        
        $showpage= parent::page($page_url,10,$list['count']);
        $this->ci_smarty->assign('glist',$list['data']);
        $this->ci_smarty->assign('pages',$showpage['show']);
        $this->ci_smarty->display('statistics/ps_count_detail.tpl');
    }
    
    function projectList(){
        $page_url=$this->root_path.'statistics/projectList/?';
        $arr=$this->input($page_url);
        //显示项目列表
        $project_list=$this->Project_model->getProjectList();
        $this->ci_smarty->assign('project_list',$project_list['data']);
        
        
        
        $list=$this->Statistics_model->getProjectList($arr);
        //print_r($list);exit;
        $showpage= parent::page($page_url,10,$list['count']);
        $this->ci_smarty->assign('plist',$list['data']);
        $this->ci_smarty->assign('pages',$showpage['show']);
        $this->ci_smarty->display('statistics/project_count.tpl');
    }
    
    
    function goodsList(){
        $page_url=$this->root_path.'statistics/goodsList/?';
        $token=$this->user_info['token'];
        $type_list=$this->product->getCatgroryList();
        $this->ci_smarty->assign('type_list',$type_list['data']);
       $arr=$this->input($page_url);
        $list=$this->Statistics_model->getGoodsList($arr);
        $showpage= parent::page($page_url,10,$list['count']);
        
        $this->ci_smarty->assign('glist',$list['data']);
        $this->ci_smarty->assign('pages',$showpage['show']);
        $this->ci_smarty->display('statistics/sku_count.tpl');
    }
    
    
    function psCheckList() {
        $page_url=$this->root_path.'statistics/psCheckList/?';
        $group_list= $this->user_model->getGroupListByRole(4);
        $this->ci_smarty->assign('group_list',$group_list['list']);
        $data=$this->input($page_url,7);

        /*
        if($this->input->get('is_ext')){
            $data['is_ext']='yes';
            $list=$this->Statistics_model->getPsCheckList($data);
            $str = "用户名,用户组,审核商品数,通过商品数,已驳回商品数\n";
            $str = iconv('utf-8','gb2312',$str);
            foreach ($list['list'] as $k=>$v){
                $userName = iconv('utf-8','gb2312',$v['userName']); //中文转码
                $groupName = iconv('utf-8','gb2312',$v['groupName']);
                $totalCount = $v['totalCount'];
                $passCount = $v['passCount'];
                $noPassCount = $v['noPassCount'];
                $str .= $userName.",".$groupName.",".$totalCount.",".$passCount.",".$noPassCount."\n";
            }
            $filename = date('Ymd').'修图审核统计.csv'; //设置文件名
            $this->export_csv($filename,$str); //导出
            exit;
        }
        */
        $list=$this->Statistics_model->getPsCheckList($data);
        $this->ci_smarty->assign('page_url',$data['pageUrl']);
        $showpage= parent::page($data['pageUrl'],10,$list['count']);
        $this->ci_smarty->assign('glist',$list['data']);
        $this->ci_smarty->assign('pages',$showpage['show']);
        

        $this->ci_smarty->display('statistics/ps_check_count.tpl'); 
    }
    
    function shootList(){
        $page_url=$this->root_path.'statistics/shootList/?';
        
        $project_list=$this->Project_model->getProjectList(array());

        $this->ci_smarty->assign('project_list',$project_list['data']);
        
        $group_list= $this->user_model->getGroupListByRole(3);
        $this->ci_smarty->assign('group_list',$group_list['list']);
        
        $arr=$this->input($page_url,3);
        
        $list=$this->Statistics_model->shootList($arr);
        
        $showpage= parent::page($page_url,10,$list['count']);
        
        $this->ci_smarty->assign('slist',$list['data']);
        $this->ci_smarty->assign('pages',$showpage['show']);
        $this->ci_smarty->display('statistics/shoot_count.tpl');
    }
    
    function shootBack(){
        $page_url=$this->root_path.'statistics/shootBack/?';
        $type_list=$this->product->getCatgroryList();
        $this->ci_smarty->assign('type_list',$type_list['data']);
        
        
        $arr=$this->input($page_url);
        
        $list=$this->Statistics_model->getShootBackList($arr);
        
        $showpage= parent::page($page_url,10,$list['count']);
        
        $this->ci_smarty->assign('glist',$list['data']);
        $this->ci_smarty->assign('pages',$showpage['show']);
        $this->ci_smarty->display('statistics/shoot_back_count.tpl');
    }
    
    
    
    
    function shootDetail($shootUserId){
        $page_url=$this->root_path.'statistics/shootDetail/'.$shootUserId.'?';
        $project_list=$this->Project_model->getProjectList(array());
        $this->ci_smarty->assign('project_list',$project_list['data']);
        
        $type_list=$this->product->getCatgroryList();
        $this->ci_smarty->assign('type_list',$type_list['data']);
        
        $statusList=$this->PublicFuc_model->getStatusList('shootStatus');
        $this->ci_smarty->assign('statusList',$statusList);
        
        $this->ci_smarty->assign('shootUserId',$shootUserId);
        
        $arr=$this->input($page_url,3);
        $arr['userId']=$shootUserId;
        $user_p['upUserId']=$shootUserId;
        $u=$this->user_model->getInfo($user_p);
        $u=json_decode($u,true);
        
        $this->ci_smarty->assign('uInfo',$u);
        $list=$this->Statistics_model->shootDetailList($arr);
        $showpage= parent::page($page_url,10,$list['count']);
        $this->ci_smarty->assign('slist',$list['data']);
        $this->ci_smarty->assign('pages',$showpage['show']);
        $this->ci_smarty->display('statistics/shoot_count_detail.tpl');
    }
    
    
    function shootCheckList(){
        $page_url=$this->root_path.'statistics/shootCheckList/?';
        $group_list= $this->user_model->getGroupListByRole(3);
        $this->ci_smarty->assign('group_list',$group_list['list']);
        
        $arr=$this->input($page_url,12);
        
        $list=$this->Statistics_model->shootCheckList($arr);
       
        $showpage= parent::page($page_url,10,$list['count']);
        $this->ci_smarty->assign('slist',$list['data']);
        $this->ci_smarty->assign('pages',$showpage['show']);
        
        $this->ci_smarty->display('statistics/shoot_check_count.tpl');
    }
    
    
    function inputList(){
        $page_url=$this->root_path.'statistics/inputList/?';
        
        $group_list= $this->user_model->getGroupListByRole(2);
        $this->ci_smarty->assign('group_list',$group_list['list']);
        
        $project_list=$this->Project_model->getProjectList();
        $this->ci_smarty->assign('project_list',$project_list['data']);
        
        
        $arr=$this->input($page_url,2);
        $list=$this->Statistics_model->getInputList($arr);
        $showpage= parent::page($page_url,10,$list['count']);
        $this->ci_smarty->assign('glist',$list['data']);
        $this->ci_smarty->assign('pages',$showpage['show']);
        
        
        $this->ci_smarty->display('statistics/record_count.tpl');
    }
    
    function inputDetail($inputUserId){
        $page_url=$this->root_path.'statistics/shootDetail/'.$inputUserId.'?';
        $statusList=$this->PublicFuc_model->getStatusList('status');
        $this->ci_smarty->assign('statusList',$statusList);
        
        $project_list=$this->Project_model->getProjectList(array()); 
        $this->ci_smarty->assign('project_list',$project_list['data']);
       
        $type_list=$this->product->getCatgroryList();
        $this->ci_smarty->assign('type_list',$type_list['data']);
        
        
        $arr=$this->input($page_url,2);
        $arr['userId']=$inputUserId;
        $user_p['upUserId']=$inputUserId;
        $u=$this->user_model->getInfo($user_p);
        $u=json_decode($u,true);
        
        $this->ci_smarty->assign('uInfo',$u);
        
        $list=$this->Statistics_model->getInputDetail($arr);
        $showpage= parent::page($page_url,10,$list['count']);
        $this->ci_smarty->assign('glist',$list['data']);
        $this->ci_smarty->assign('pages',$showpage['show']);
        $this->ci_smarty->display('statistics/record_count_detail.tpl');
    }
    
    
    function inputCheck(){
        $page_url=$this->root_path.'statistics/inputCheck?';
        $group_list= $this->user_model->getGroupListByRole(11);
        $this->ci_smarty->assign('group_list',$group_list['list']);
        
        $arr=$this->input($page_url);
        $list=$this->Statistics_model->getInputCheck($arr);
        $showpage= parent::page($page_url,10,$list['count']);
        $this->ci_smarty->assign('glist',$list['data']);
        $this->ci_smarty->assign('pages',$showpage['show']);
        $this->ci_smarty->display('statistics/record_check_count.tpl');
    }
    
    function input($page_url,$roleId=''){

        $arr['is_ext']='0';
        
        if($this->input->get('gtin')!=""){
            $arr['gtin']=$this->input->get('gtin');
            $this->ci_smarty->assign('gtin',$arr['gtin']);
            $page_url.="gtin=".$arr['gtin'];
        }
        
        
        if($this->input->get('gName')!=""){
            $arr['gName']=$this->input->get('gName');
            $this->ci_smarty->assign('gName',$arr['gName']);
            $page_url.="gName=".$arr['gName'];
        }
        
        if($this->input->get('catgrory1')!=""){
            $arr['catgrory1']=$this->input->get('catgrory1');
            $this->ci_smarty->assign('catgrory1',$arr['catgrory1']);
            $page_url.="catgrory1=".$arr['catgrory1'];
        }
        
        if($this->input->get('shootStatus')!=""){
            $arr['shootStatus']=$this->input->get('shootStatus');
            $this->ci_smarty->assign('shootStatus',$arr['shootStatus']);
            $page_url.="shootStatus=".$arr['shootStatus'];
        }
        
        if($this->input->get('retouchStatus')!=""){
            $arr['retouchStatus']=$this->input->get('retouchStatus');
            $this->ci_smarty->assign('retouchStatus',$arr['retouchStatus']);
            $page_url.="retouchStatus=".$arr['retouchStatus'];
        }
        
        if($this->input->get('groupId')!=""||$this->input->get('userName')!=""){
            $user['groupId']=$this->input->get('groupId');
            $user['userName']=$this->input->get('userName');
            if($roleId!=''){
                $user['roleId']=$roleId;
            }
            $str=$this->user_model->getUserIdsByFiled($user);
            $user_id_list=json_decode($str,true);
            $arr['userIds']=serialize($user_id_list);
        
            $this->ci_smarty->assign('groupId',$user['groupId']);
            $this->ci_smarty->assign('userName',$user['userName']);
            $page_url.="groupId=".$user['groupId']."&userName=".$user['username'];
        }
        else{
            if($roleId!=''){
                $user['roleId']=$roleId;
            }
            $str=$this->user_model->getUserIdsByFiled($user);
            $user_id_list=json_decode($str,true);
            $arr['userIds']=serialize($user_id_list);
        }
        
        
        if($this->input->get('startTime')!=""&&$this->input->get('endTime')!=""){
            $arr['startTime']=$this->input->get('startTime');
            $arr['endTime']=$this->input->get('endTime');
            $this->ci_smarty->assign('startTime',$arr['startTime']);
            $this->ci_smarty->assign('endTime',$arr['endTime']);
            $page_url.="startTime=".$arr['startTime']."&endTime=".$arr['endTime'];
        
            $arr['sTime']=strtotime($arr['startTime']);
            $arr['eTime']=strtotime($arr['endTime']);
        }
        
        if($this->input->get('page')!=""){
            $arr['page']=$this->input->get('page');
        }
        else{
            $arr['page']=1;
        }
        
        foreach ($arr as $k=>$v){
            if($k!='page'&&$k!='is_ext')
            $p[$k]=$v;    
        }
        $this->ci_smarty->assign('p',urlencode(json_encode($p)));

        
        return $arr;

    }
    
    
    
    function extShoot(){
        $p=$this->input->get('p');
        $arr=json_decode($p,true);
        $arr['is_ext']=1;
        $list=$this->Statistics_model->shootList($arr);
        $str = "用户名,用户组,拍摄总数,审核通过数,待上传数,待审核数,审核驳回数,抽查通过率,拍摄通过照片数,拍摄总照片数\n";
        $str = iconv('utf-8','gb2312',$str);
        foreach ($list['data'] as $k=>$v){
            $userName = iconv('utf-8','gb2312',$v['userName']); //中文转码
            $groupName = iconv('utf-8','gb2312',$v['groupName']);
            $shootCount = $v['shootCount'];
            $shootPassCount = $v['shootPassCount'];
            $rUploadCount = $v['rUploadCount'];
            $rReviewCount = $v['rReviewCount'];
            $reviewNoPassCount = $v['reviewNoPassCount'];
            $passRate = $v['passRate'];
            $shootPassPicCount = $v['shootPassPicCount'];
            $shootPicCount = $v['shootPicCount'];
            $str .= $userName.",".$groupName.",".$shootCount.",".$shootPassCount.",".$rUploadCount.",".$rReviewCount.",".$reviewNoPassCount.",".$passRate.",".$shootPassPicCount.",".$shootPicCount."\n";
        }
        $filename = date('Ymd').'拍摄统计.csv'; //设置文件名
        $this->export_csv($filename,$str); //导出
        exit;
    }
    
    function extShootCheck(){
        $p=$this->input->get('p');
        $arr=json_decode($p,true);
        $arr['is_ext']=1;
        $list=$this->Statistics_model->shootCheckList($arr);
        $str = "用户名,用户组,审核拍摄的商品数,拍摄通过的商品数,拍摄驳回的商品数\n";
        $str = iconv('utf-8','gb2312',$str);
        foreach ($list['data'] as $k=>$v){
            $userName = iconv('utf-8','gb2312',$v['userName']); //中文转码
            $groupName = iconv('utf-8','gb2312',$v['groupName']);
            $reviewCount = $v['reviewCount'];
            $reviewPassCount = $v['reviewPassCount'];
            $reviewNoPassCount = $v['reviewNoPassCount'];
            $str .= $userName.",".$groupName.",".$reviewCount.",".$reviewPassCount.",".$reviewPassCount."\n";
        }
        $filename = date('Ymd').'拍摄审核统计.csv'; //设置文件名
        $this->export_csv($filename,$str); //导出
        exit;
    }
    
    function extGoods(){
        $p=$this->input->get('p');
        $arr=json_decode($p,true);
        $arr['is_ext']=1;
        $list=$this->Statistics_model->getGoodsList($arr);
        $str = "商品条形码,商品名称,商品分类,包装数,拍摄次数,修图次数,录入次数,录入字数\n";
        $str = iconv('utf-8','gb2312',$str);
        foreach ($list['data'] as $k=>$v){
            $gName = iconv('utf-8','gb2312',$v['gName']); //中文转码
            $catgroryName = iconv('utf-8','gb2312',$v['catgroryName']);
            $gtin = $v['gtin'];
            $packetCount = $v['packetCount'];
            $shootCount = $v['shootCount'];
            $retouchCount = $v['retouchCount'];
            $inputCount = $v['inputCount'];
            $wordCount = $v['wordCount'];
            $str .= $gtin.",".$gName.",".$catgroryName.",".$packetCount.",".$shootCount.",".$retouchCount.",".$inputCount.",".$wordCount."\n";
        }
        $filename = date('Ymd').'商品统计.csv'; //设置文件名
        $this->export_csv($filename,$str); //导出
        exit;
    }
    
    function extPs(){
        $p=$this->input->get('p');
        $arr=json_decode($p,true);
        $arr['is_ext']=1;
        $list=$this->Statistics_model->getPsList($arr);
        $str = "用户名,用户组,修图总数,审核通过数,待上传数,待审核数,审核驳回数,抽查通过率,审核通过照片数,修图照片数\n";
        $str = iconv('utf-8','gb2312',$str);
        foreach ($list['data'] as $k=>$v){
            $userName = iconv('utf-8','gb2312',$v['userName']); //中文转码
            $groupName = iconv('utf-8','gb2312',$v['groupName']);
            $retouchCount = $v['retouchCount'];
            $retouchPassCount = $v['retouchPassCount'];
            $rUploadCount = $v['rUploadCount'];
            $rReviewCount = $v['rReviewCount'];
            $reviewNoPassCount = $v['reviewNoPassCount'];
            $passRate = $v['passRate'];
            $retouchPassPicCount = $v['retouchPassPicCount'];
            $retouchPicCount = $v['retouchPicCount'];
            $str .= $userName.",".$groupName.",".$retouchCount.",".$retouchPassCount.",".$rUploadCount.",".$rReviewCount.",".$reviewNoPassCount.",".$passRate.",".$retouchPassPicCount.",".$retouchPicCount."\n";
        }
        $filename = date('Ymd').'修图统计.csv'; //设置文件名
        $this->export_csv($filename,$str); //导出
        exit;
    }
    
    function extProject() {
		$p=$this->input->get('p');
        $arr=json_decode($p,true);
        $arr['is_ext']=1;
        $list=$this->Statistics_model->getProjectList($arr);
        $str = "项目名称,入库总商品数,已拍摄上传总数,已拍摄审核通过总数,已修图上传总数,已修图审核通过总数,已录入提交总数,已录入审核总数\n";
        $str = iconv('utf-8','gb2312',$str);
        foreach ($list['data'] as $k=>$v){
            $pName = iconv('utf-8','gb2312',$v['pName']); //中文转码
            $depotCount = $v['depotCount'];
            $shootUploadCount = $v['shootUploadCount'];
            $shootPassCount = $v['shootPassCount'];
            $retouchUploadCount = $v['retouchUploadCount'];
            $retouchPassCount = $v['retouchPassCount'];
            $inputUploadCount = $v['inputUploadCount'];
            $inputPassCount = $v['inputPassCount'];
            $str .= $pName.",".$depotCount.",".$shootUploadCount.",".$shootPassCount.",".$retouchUploadCount.",".$retouchPassCount.",".$inputUploadCount.",".$inputPassCount."\n";
        }
        $filename = date('Ymd').'项目统计.csv'; //设置文件名
        $this->export_csv($filename,$str); //导出
        exit;
    }
    
    function extInput(){
        $p=$this->input->get('p');
        $arr=json_decode($p,true);
        $arr['is_ext']=1;
        $list=$this->Statistics_model->getInputList($arr);
        $str = "用户名,用户组,录入总数,录入字数,审核通过数,审核通过字数,待审核数,审核驳回数\n";
        $str = iconv('utf-8','gb2312',$str);
        foreach ($list['data'] as $k=>$v){
            $userName = iconv('utf-8','gb2312',$v['userName']); //中文转码
            $groupName = iconv('utf-8','gb2312',$v['groupName']);
            $inputCount = $v['inputCount'];
            $wordCount = $v['wordCount'];
            $inputPassCount = $v['inputPassCount'];
            $wordPassCount = $v['wordPassCount'];
            $rReviewCount = $v['rReviewCount'];
            $reviewNoPassCount = $v['reviewNoPassCount'];
            $str .= $userName.",".$groupName.",".$inputCount.",".$wordCount.",".$inputPassCount.",".$wordPassCount.",".$rReviewCount.",".$reviewNoPassCount."\n";
        }
        $filename = date('Ymd').'录入统计.csv'; //设置文件名
        $this->export_csv($filename,$str); //导出
        exit;
    }
    
    function extInputCheck() {
        $p=$this->input->get('p');
        $arr=json_decode($p,true);
        $arr['is_ext']=1;
        $list=$this->Statistics_model->getInputCheck($arr);
        $str = "用户名,用户组,审核的商品数,审核通过次数,已驳回次数\n";
        $str = iconv('utf-8','gb2312',$str);
        foreach ($list['data'] as $k=>$v){
            $userName = iconv('utf-8','gb2312',$v['userName']); //中文转码
            $groupName = iconv('utf-8','gb2312',$v['groupName']);
            $reviewCount = $v['reviewCount'];
            $reviewPassCount = $v['reviewPassCount'];
            $reviewNoPassCount = $v['reviewNoPassCount'];
            $str .= $userName.",".$groupName.",".$reviewCount.",".$reviewPassCount.",".$reviewPassCount."\n";
        }
        $filename = date('Ymd').'录入审核统计.csv'; //设置文件名
        $this->export_csv($filename,$str); //导出
        exit;
    }
    
    function extShootBack(){
		$p=$this->input->get('p');
        $arr=json_decode($p,true);
        $arr['is_ext']=1;
        $list=$this->Statistics_model->getShootBackList($arr);
        $str = "商品条形码,商品名称,商品分类,驳回原因,驳回时间\n";
        $str = iconv('utf-8','gb2312',$str);
        foreach ($list['data'] as $k=>$v){
            $gName = iconv('utf-8','gb2312',$v['gName']); //中文转码
            $cargroryName = iconv('utf-8','gb2312',$v['cargroryName']);
			$memo=iconv('utf-8','gb2312',$v['memo']);
            $gtin = $v['gtin'];
            $creatTime = $v['creatTime'];
            $str .= $gtin.",".$gName.",".$cargroryName.",".$memo.",".$creatTime."\n";
        }
        $filename = date('Ymd').'拍摄驳回统计.csv'; //设置文件名
        $this->export_csv($filename,$str); //导出
        exit;
	}
    
	function extpsCheck(){
		 $p=$this->input->get('p');
        $arr=json_decode($p,true);
        $arr['is_ext']=1;
        $list=$this->Statistics_model->getPsCheckList($arr);
        $str = "用户名,用户组,审核的商品数,通过的商品数,已驳回次数\n";
        $str = iconv('utf-8','gb2312',$str);
        foreach ($list['data'] as $k=>$v){
            $userName = iconv('utf-8','gb2312',$v['userName']); //中文转码
            $groupName = iconv('utf-8','gb2312',$v['groupName']);
            $reviewCount = $v['reviewCount'];
            $reviewPassCount = $v['reviewPassCount'];
            $reviewNoPassCount = $v['reviewNoPassCount'];
            $str .= $userName.",".$groupName.",".$reviewCount.",".$reviewPassCount.",".$reviewPassCount."\n";
        }
        $filename = date('Ymd').'修图审核统计.csv'; //设置文件名
        $this->export_csv($filename,$str); //导出
        exit;
	}
	
	function extProjectDetail($pId){
	    $list=$this->Statistics_model->getProjectDetail($pId);
	    $str = "条码,条码名称,包装,是否拍照,是否修图,是否录入\n";
	    $str = iconv('utf-8','gb2312',$str);
	    foreach ($list as $k=>$v){
	        $gtin = $v['gtin'];
	        $gName = iconv('utf-8','gb2312',$v['gName']);
	        $packet = $v['packet'];
	        if($v['shoot']>0){
	           $shoot = 'Y';
	        }
	        else{
	            $shoot = 'N';
	        }
	        
	        if($v['retouch']>0){
	            $retouch = 'Y';
	        }
	        else{
	            $retouch = 'N';
	        }
	        
	        if($v['input']>0){
	            $input = 'Y';
	        }
	        else{
	            $input = 'N';
	        }
	        
	        $str .= $gtin.",".$gName.",".$packet.",".$shoot.",".$retouch.",".$input."\n";
	    }
	    $filename = date('Ymd').'项目详细统计.csv'; //设置文件名
	    $this->export_csv($filename,$str); //导出
	    exit;
	}
}