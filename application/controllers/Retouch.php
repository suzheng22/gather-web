<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Retouch extends My_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('user/project_model', 'project');
        $this->load->model('sdk/product_model', 'product');
        $this->load->model('ps/marlboro_model', 'marlboro');
        $this->load->model('user/user_model', 'user');
        $this->load->model('publicFuc/publicFuc_model', 'publicFuc');
    }
    /*
     * 修图审核
    */
    function psCheckList(){
        $data['token']=$this->user_info['token'];
       // var_dump($data);
        $project_list=$this->project->getProjectList($data);
        $this->ci_smarty->assign('project_list',$project_list['data']);
        $group_list= $this->user->getGroupListByRole();
        $this->ci_smarty->assign('group_list',$group_list['list']);
        $data['userName']=$this->input->get('userName');
        $data['groupId']=$this->input->get('groupId');
        if($data['userName']!=''){
            $this->ci_smarty->assign('userName',$data['userName']);
        }
        if($data['groupId']!=''){
            $this->ci_smarty->assign('groupId',$data['groupId']);
        }
        $str=$this->user->getUserIdsByFiled($data);
        $user_id_list=json_decode($str,true);
        $data['photoIds']=serialize($user_id_list);
        $list=$this->marlboro->getMarlboroList1($data);
        $this->ci_smarty->assign('glist',$list);
        $this->ci_smarty->display('ps_check_list.tpl');
    }
    /*
     * 修图审核详情
     * */
    function psCheckDetail($userId){
        $data['userId']=$this->user_info['userId'];
        $data['token']=$this->user_info['token'];
        $data['upUserId']=$userId;
        $str=$this->user->getInfo($data);
        $u_info=json_decode($str,true);
        $this->ci_smarty->assign('u_info',$u_info);
        $type_list=$this->product->getCatgroryList();
        $this->ci_smarty->assign('type_list',$type_list['data']);
        $project_list=$this->project->getProjectList($data);
        $this->ci_smarty->assign('project_list',$project_list['data']);
        $page_url=$this->root_path.'Retouch/psCheckDetail/'.$userId.'?';
        $arr=$this->input->get();
        if(!isset($arr['status'])){
            $arr['status']=null;
        }
        if(!isset($arr['page'])){
            $arr['page']=1;
        }

        $arr['rId']=$userId;
        //增加参数
        $page_url=$this->publicFuc->getUrl( $page_url,$arr);
        $list=$this->marlboro->getMarlboroInfo($arr);
        if($arr['s_time']!=''&&$arr['e_time']!=''){
            $arr['s_time']=strtotime($arr['s_time']);
            $arr['e_time']=strtotime($arr['e_time']);
        }
        //print_r($list);exit;
        $showpage= parent::page($page_url,10,$list['totalCount']);
        $this->ci_smarty->assign('glist',$list);
        $this->ci_smarty->assign('pages',$showpage['show']);
        $this->ci_smarty->display('ps_check_detail.tpl');
    }
    /*
     * 某一商品的修图详情
     * */
    function psCheckPic($gtin){
        $arr['gtin']=$gtin;
        $arr['type']='pic';
        $list=$this->marlboro->getMarlboroInfoPic($arr);
        $status=$this->marlboro->getReviewStatus($arr);
            $str="";
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
}
