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
        $project_list=$this->project->getProjectList($data);
        $this->ci_smarty->assign('project_list',$project_list['data']);
        $group_list= $this->user->getGroupListByRole(6);
        $this->ci_smarty->assign('group_list',$group_list['list']);
        $page_url=$this->root_path."Retouch/psCheckList?";
        $page=$this->input->get('page');
        $get=$this->input->get();
        //去掉page重新匹配
        unset($get['page']);
        $page_url=$this->publicFuc->getUrl($page_url,$get);
        $arr=$this->getPage($get,$page);
        if($arr['groupId']!=""||$arr['username']!=""){
            $user['groupId']=$arr['groupId'];
            $user['username']=$arr['username'];
            $user['token']=$data['token'];
            $str=$this->user->getUserIdsByFiled($user);
            $arr['userIds']=$str;
        }else{
            $user['roleId']=6;
            $str=$this->user->getUserIdsByFiled($user);
            $arr['userIds']=$str;
        }
        $list=$this->retouch->getMarlboroList($arr);
       // var_dump($list);
        $showpage= parent::page($page_url,10,$list['total']);
        $this->ci_smarty->assign('glist',$list['data']);
        $this->ci_smarty->assign('pages',$showpage['show']);
        $this->ci_smarty->display('ps_check_list.tpl');
    }
    /*
     * 修图审核详情
     * */
    function psCheckDetail($userId,$no,$total,$auto){
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
        $page_url=$this->root_path."Retouch/psCheckDetail/{$userId}/{$no}/{$total}/{$auto}?";
        //分页
        $page=$this->input->get('page');
        if(!isset($get['status'])){
            $get['status']=null;
        }
        $get=$this->input->get();
        //去掉page重新匹配
        unset($get['page']);
        $page_url=$this->publicFuc->getUrl($page_url,$get);
        $arr=$this->getPage($get,$page);
        $arr['retouchUserId']=$userId;
        //增加参数
        $arr['token']=$this->user_info['token'];
        if($arr['s_time']!=''&& $arr['e_time']!=''){
            $arr['s_time']=strtotime($arr['s_time']);
            $arr['e_time']=strtotime($arr['e_time']);
        }
        $list=$this->retouch->getRetouchDetail($arr);
        $showpage= parent::page($page_url,10,$list['total']);
        $this->ci_smarty->assign('no',$no);
        $this->ci_smarty->assign('auto',$auto);
        $this->ci_smarty->assign('total',$total);
        $this->ci_smarty->assign('glist',$list);
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
        $arr['id']=1;
        $product_info=$this->retouch->getRetouchPic($arr);
       // var_dump($product_info);

        $arr['batchNo']=$product_info['batchNo'];
        $arr['pId']=$product_info['pId'];
        //原图
        //获取原图批次
        $list2=$this->retouch->getAllImages($arr);
        //png图
        $arr['id']=3;
        $list3=$this->retouch->getAllImages($arr);
        //获取修图图片
        $arr['batchNo']=$product_info['retouchId'];
        $list=$this->retouch->getAllImage($arr);

        //整合图片资源
        foreach($list2 as $key=>$val){
            foreach($val as $k=>$v){
                    foreach($list[$key] as $k1=>$v1){
                        if($v['xSequence']==$v1['xSequence']){
                            $list2[$key][$k]['key1']=$list[$key][$k1]['key'];
                        }

                    }
            }
        }
        foreach($list2 as $key=>$val){
            foreach($val as $k=>$v){
                foreach($list3[$key] as $k1=>$v1){
                    if($v['xSequence']==$v1['xSequence']){
                        $list2[$key][$k]['key2']=$list3[$key][$k1]['key'];
                    }
                }
            }
        }


        $product_info['token']=$this->user_info['token'];
        $arr['proName']=$product_info['proName'];
        $arr['catgrory']=$product_info['type'];
        $this->ci_smarty->assign("token",$this->user_info['token']);
        $this->ci_smarty->assign("more_api",MOREAPI);
        $this->ci_smarty->assign('p_info',$product_info);
        $this->ci_smarty->assign('plists',$list2);
        $this->ci_smarty->assign('plistsis',$list2[1]);
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
        $data['orderIds']=json_encode($orderId);
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
