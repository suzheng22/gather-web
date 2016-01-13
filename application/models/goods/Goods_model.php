<?php
class Goods_model extends   MY_Model{
    public function __construct()
    {
        // Call the CI_Model constructor
        parent::__construct();
    }
    function getGoodsByGtin($data){
        $url=$this->more_api_url."/goods/getGoodsInfo?token={$data['token']}";
        $return=$this->curl($url,$data);
        $data=json_decode($return,true);
         return $data['data'];
    }
    //获取商品分类列表
    function getGoodsClassify($data){
        $data['token']=urldecode($data['token']);
        $data['returnType']=1;
        $url=$this->more_api_url."/lingmall/catgrory/gtinList";
        $return=$this->curl($url,$data,'get');
        $datas=json_decode($return,true);
        $c=($data['page']-1)*10;
        foreach($datas['data'] as $k=>$v){
            $c++;
            $datas['data'][$k]['lId']=$c;
           for($i=1;$i<=3;$i++){
               $re=$this->getInfo($v['catgrory'.$i]);
               $datas['data'][$k]['catgrorys'.$i]=$re['name'];
           }
        }
        return $datas;
    }

    function batchClassify($data){
        $token=$data['token'];
        $arr['ids']=$data['ids'];
        $arr['catgrory1']=$data['catgrory1'];
        $arr['catgrory2']=$data['catgrory2'];
        $arr['catgrory3']=$data['catgrory3'];
        $data=json_encode($arr);
        $url=$this->more_api_url."/lingmall/catgrory/gtinBatch?token=".$token;
        $return=$this->curl($url,$data,'put');
        return $return;
    }
    //获取商品图片
    function getGoodsImage($data){
        $url=$this->more_api_url."/lingmall/catgrory/list?token=".$data['token'];
        $return=$this->curl($url,$data,'put');
        return $return;
    }
    //
    function getGooodsInfo($data){
        $data['token']=urldecode($data['token']);
        $id=$data['id'];
        $url=$this->more_api_url."/lingmall/catgrory/catgroryGtin/{$id}";
        $return=$this->curl($url,$data,'get');
        return $return;
    }
    //修改
    function updateGoodsInfo($data){
        $id=$data['id'];
        $token=$data['token'];
        $arr['catgrory1']=$data['catgrory1'];
        $arr['catgrory2']=$data['catgrory2'];
        $arr['catgrory3']=$data['catgrory3'];
        $arr['gName']=$data['gName'];
        $data=json_encode($arr);
        $url=$this->more_api_url."/lingmall/catgrory/catgroryGtin/{$id}?token=".$token;
        $return=$this->curl($url,$data,'put');
        return $return;
    }
    //获取下级商品分类
    function getNext($data){
        if($data['token']){
            $arr['token']=urldecode($data['token']);
        }else{
            $arr['token']=urldecode($this->user_info['token']);
        }
        $arr['f_id']=$data['catId'];
        $url=$this->more_api_url."/lingmall/catgrory/next";
        $return=$this->curl($url,$arr,'get');
        return $return;
    }
//获取商品分类信息
    function getInfo($catId){
        $data['token']=urldecode($this->user_info['token']);
        $url=$this->more_api_url."/lingmall/catgrory/{$catId}";
        $return=$this->curl($url,$data,'get');
        return json_decode($return,true);
    }
    function getCatgroryInfo($id){
        if(!$id){
            $id=84;
        }
        $data['token']=urldecode($this->user_info['token']);
        $url=$this->more_api_url."/lingmall/catgrory/catgroryGtin/{$id}";
        $return=$this->curl($url,$data,'get');
        return json_decode($return,true);
    }
   // 获取批量处理ids
    function getGoodsIds($data){
        $data['token']=urldecode($this->user_info['token']);
        $url=$this->more_api_url."/lingmall/catgrory/gtinList";
        $return=$this->curl($url,$data,'get');
       // echo $return;
        return json_decode($return,true);
    }
    //获取图片
    function getAllImage($data){
        $url="http://139.196.36.81:8600/lingmall/pictures?token=7jsD03yg64t1kPuOANJxBI1dMpzfvUgkaBr9y11Ybg1M9X3N-54ptlhgaJjXDeqE&xBarcode={$data['gtin']}&xType=1";
        $return=$this->curl($url,'','get');
        $list=json_decode($return,true);
        return $list;
    }
    //批量处理商品分类
    function batchUpdateInfo($data){
        $token=$this->user_info['token'];
        $data=json_encode($data);
        $url=$this->more_api_url."/lingmall/catgrory/gtinBatch?token=$token";
        $return=$this->curl($url,$data,'post');
        return  $return;
    }

}