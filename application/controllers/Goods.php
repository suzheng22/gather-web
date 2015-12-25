<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Goods extends My_Controller {

    public function __construct()
    {

        parent::__construct();
        $this->load->model('goods/goods_model', 'goods');
        $this->load->model('sdk/product_model', 'product');
        $this->load->model('publicFuc/publicFuc_model', 'publicFuc');
    }
    public function goodsClassify(){
        $type_list=$this->product->getCatgroryList();
        $this->ci_smarty->assign('type_list',$type_list['data']);
        $page_url=$this->root_path."goods/goodsClassify?";
        $get=$this->input->get();
        if(!isset($get['status'])){
            $get['status']=null;
        }
        if(!isset($get['page'])){
            $get['page']=1;
        }
        $page_url=$this->publicFuc->getUrl($page_url,$get);
        //显示搜索条件的二级分类
        if(isset($get['catgrory1'])&&$get['catgrory1']!=''){
            $a['catId']=$get['catgrory1'];
            $a['token']=$this->user_info['token'];
            $type_list2=$this->goods->getNext($a);
            $type_list2=json_decode($type_list2,true);
            $this->ci_smarty->assign('type_list2',$type_list2);
        }
        //显示搜索条件的三级分类
        if(isset($get['catgrory2'])&&$get['catgrory2']!=''){
            $a['catId']=$get['catgrory2'];
            $a['token']=$this->user_info['token'];
            $type_list3=$this->goods->getNext($a);
            $type_list3=json_decode($type_list3,true);
            $this->ci_smarty->assign('type_list3',$type_list3);
        }
        $get['token']=$this->user_info['token'];
        /*获取基本信息列表*/
        $list=$this->goods->getGoodsClassify($get);
        $showpage= parent::page($page_url,10,$list['count']);
        $this->ci_smarty->assign('glist',$list['data']);
        $this->ci_smarty->assign('ids',json_encode($list['ids']));
        $this->ci_smarty->assign('pages',$showpage['show']);
        $this->ci_smarty->display("goods/goodsClassify.tpl");
    }
    //获取下级分类
    function getNext(){
        $data=$this->input->post();
        $data['token']=$this->user_info['token'];
        $return =$this->goods->getNext($data);
        echo $return;
    }
    //获取基本信息
   function getCatgroryInfo(){
       $data=$this->input->post('id');
       $return=$this->goods->getCatgroryInfo($data);
       echo json_encode($return);
   }
    //更新商品的商品分类
    function updateGoodsInfo(){
        $data=$this->input->post();
        $data['token']=$this->user_info['token'];
        $return=$this->goods->updateGoodsInfo($data);
        echo ($return);
    }
    //获取批量信息
    function getGoodsIds(){
        $data['catgrory1']=$this->input->post('catgrory1');
        $data['catgrory2']=$this->input->post('catgrory2');
        $data['catgrory3']=$this->input->post('catgrory3');
        $data['gtin']=$this->input->post('gtin');
        $data['gName']=$this->input->post('gName');
        $data['goodsCatgrory']=$this->input->post('goodsCatgrory');
        $data['returnType']=2;
        $return=$this->goods->getGoodsIds($data);
        $arr['ids']=$return['ids'][0];
        $arr['catgrory1']=$this->input->post('catgrorys1');
        $arr['catgrory2']=$this->input->post('catgrorys2');
        $arr['catgrory3']=$this->input->post('catgrorys3');
        //批量处理
        $return1=$this->goods->batchUpdateInfo($arr);
        //执行更新语句
        echo $return1;
    }
    //获取图片
    function getImage(){
        $data['gtin']=$this->input->get['gtin']='6901209212215';
        $return = $this->goods->getAllImage($data);
        var_dump($return);
    }

}