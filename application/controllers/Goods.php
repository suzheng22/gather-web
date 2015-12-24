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
        $type_list2=$this->product->getCatgroryList(2);
        $this->ci_smarty->assign('type_list2',$type_list2['data']);
        $type_list3=$this->product->getCatgroryList(3);
        $this->ci_smarty->assign('type_list3',$type_list3['data']);
        $page_url=$this->root_path."goods/goodsClassify?";
        $get=$this->input->get();
        if(!isset($get['status'])){
            $get['status']=null;
        }
        if(!isset($get['page'])){
            $get['page']=1;
        }

        $page_url=$this->publicFuc->getUrl($page_url,$get);
        $get['token']=$this->user_info['token'];
        /*获取基本信息列表*/
        $list=$this->goods->getGoodsClassify($get);
        $showpage= parent::page($page_url,10,$list['count']);
        $this->ci_smarty->assign('glist',$list['data']);
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
    function gets(){
        $ret=$this->goods->gets();
    }

}