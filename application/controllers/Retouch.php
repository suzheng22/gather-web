<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Retouch extends My_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('user/project_model', 'project');
        $this->load->model('retouch/retouch_model','retouch');
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
        $data['pId']=$this->input->get('pId');
        if($data['userName']!=''){
            $this->ci_smarty->assign('userName',$data['userName']);
        }
        if($data['groupId']!=''){
            $this->ci_smarty->assign('groupId',$data['groupId']);
        }
        if($data['pId']!=''){
            $this->ci_smarty->assign('pId',$data['pId']);
        }
        $data['userId']=$this->user_info['userId'];
        $str=$this->user->getUserIdsByFiled($data);
        $user_id_list=json_decode($str,true);;
        $data['userIds']=serialize($user_id_list);
        $data['token']=$this->user_info['token'];
        $data['userId']=$this->user_info['userId'];
        $list=$this->retouch->getMarlboroList($data);
      //  var_dump($list);
        $this->ci_smarty->assign('glist',$list);
        $this->ci_smarty->display('ps_check_list.tpl');
    }
    /*
     * 修图审核详情
     * */
    function psCheckDetail($userId,$no,$total){
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
        $arr['retouchUserId']=$userId;
        //增加参数
        $page_url=$this->publicFuc->getUrl( $page_url,$arr);
        $arr['token']=$this->user_info['token'];
        $list=$this->retouch->getRetouchDetail($arr);
        if($arr['stime']!=''&&$arr['etime']!=''){
            $arr['stime']=strtotime($arr['stime']);
            $arr['etime']=strtotime($arr['etime']);
        }
        $showpage= parent::page($page_url,10,$list['totalCount']);
        $this->ci_smarty->assign('no',$no);
        $this->ci_smarty->assign('total',$total);
        $this->ci_smarty->assign('glist',$list['data']);
        $this->ci_smarty->assign('pages',$showpage['show']);
        $this->ci_smarty->display('ps_check_detail.tpl');
    }
    /*
     * 某一商品的修图详情
     * */
    function psCheckPic(){
        $arr=$this->input->get();
        $arr['userId']=$this->user_info['userId'];
        $arr['token']=$this->user_info['token'];
        //获取图片
        $list=$this->retouch->getAllImage($arr);
        $product_info=$this->retouch->getRetouchPic($arr);
        $product_info['token']=$this->user_info['token'];
        $arr['proName']=$product_info['proName'];
        $arr['catgrory']=$product_info['type'];
        $this->ci_smarty->assign('p_info',$product_info);
        $this->ci_smarty->assign('plist',$list);
        $this->ci_smarty->assign('picList',$list[1]);
        $this->ci_smarty->assign('pic_path',"http://7xny7g.com2.z0.glb.qiniucdn.com/");
        $this->ci_smarty->display('ps_check_pic.tpl');
    }
    /*批量审核通过*/
    function batchPass(){
        $data['status']=$this->input->post('status');
        $data['orderId']=$this->input->post('orderId');
        $data['token']=$this->user_info['token'];
            //批量通过
        $orderId=explode(',',$data['orderId']);
        array_pop($orderId);
        $data['orderIds']=serialize($orderId);
        $str=$this->retouch->batchPass($data);
        echo $str;
    }
    /*修图审核通过与驳回*/
    function changeStatus(){
        $pass=$this->input->post();
        $pass['token']=$this->user_info['token'];
        $return=$this->retouch->changeStatus($pass);
        echo $return;
      //  echo 123;
      //  echo json_encode($return);
    }
}
