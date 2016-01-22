<?php
class Statistics_model extends MY_Model {


    public function __construct()
    {
    // Call the CI_Model constructor
      parent::__construct();
      $this->load->model('goods/Goods_model');
      $this->load->model('user/Project_model');
      $this->load->model('user/user_model');
    }
    
    //获取修图统计
    function getPsList($data) {
        $data['token']=urldecode($this->user_info['token']);
        $url=$this->more_api_url."/lingmall/stat/retouch";
        $return=$this->curl($url,$data,'get');
        $list=json_decode($return,true);
        foreach ($list['data'] as $k => $v){
            $user_p['upUserId']=$v['userId'];
            $u=$this->user_model->getInfo($user_p);
            $u=json_decode($u,true);
            $list['data'][$k]['userName']=$u['userName'];
            $list['data'][$k]['groupName']=$u['groupName'];
        }
        return $list;
    }
    
    
    function getPsDetail($data){
        $data['token']=urldecode($this->user_info['token']);
        $url=$this->more_api_url."/lingmall/stat/retouchdetail";
        $return=$this->curl($url,$data,'get');
         $list=json_decode($return,true);
        foreach ($list['data'] as $k=>$v){
            $p['token']=$data['token'];
            $p['pId']=$v['pId'];
            $list['data'][$k]['pName']=$this->Project_model->getPNameByPId($p);
            $list['data'][$k]['statusName']=$this->getStatusName('retouchStatus',$v['retouchStatus']);
            $list['data'][$k]['creatTime']=date('Y-m-d h:i:s',$v['creatTime']);
        }
        return $list;
    }
    
    function getPsCheckList($data){
        $data['token']=urldecode($this->user_info['token']);
        $url=$this->more_api_url."/lingmall/stat/retouchreview";
        $return=$this->curl($url,$data,'get');

        $list=json_decode($return,true);

        foreach ($list['data'] as $k => $v){
            $user_p['upUserId']=$v['userId'];
            $u=$this->user_model->getInfo($user_p);
            $u=json_decode($u,true);
            $list['data'][$k]['userName']=$u['userName'];
            $list['data'][$k]['groupName']=$u['groupName'];
        }
        return $list;
    }
    
    
    
    function getProjectList($data){
        $data['token']=urldecode($this->user_info['token']);
        $url=$this->more_api_url."/lingmall/stat/project";
        $return=$this->curl($url,$data,'get');
       return  json_decode($return,true);
        
    }
    
    
    function getGoodsList($data){
        $data['token']=urldecode($this->user_info['token']);
        $url=$this->more_api_url."/lingmall/stat/single";
        $return=$this->curl($url,$data,'get');
        $list= json_decode($return,true);
        return $list;
    }
    
    function shootList($data){
        $data['token']=urldecode($this->user_info['token']);
        $url=$this->more_api_url."/lingmall/stat/shoot";
        $return=$this->curl($url,$data,'get');
        $list= json_decode($return,true);
       
        foreach ($list['data'] as $k=>$v){
            $user_p['upUserId']=$v['userId'];
            $u=$this->user_model->getInfo($user_p);
            $u=json_decode($u,true);
            $list['data'][$k]['userName']=$u['userName'];
            $list['data'][$k]['groupName']=$u['groupName'];
        }
        return $list;
    }
    
    function shootDetailList($data){
        $data['token']=urldecode($this->user_info['token']);
        $url=$this->more_api_url."/lingmall/stat/shootdetail";
        $return=$this->curl($url,$data,'get');
        $list= json_decode($return,true);
        foreach ($list['data'] as $k=>$v){
            $p['token']=$data['token'];
            $p['pId']=$v['pId'];
            $list['data'][$k]['pName']=$this->Project_model->getPNameByPId($p);
            $list['data'][$k]['statusName']=$this->getStatusName('shootStatus',$v['shootStatus']);
            $list['data'][$k]['creatTime']=date('Y-m-d h:i:s',$v['creatTime']);
        }
        return $list;
    }
    
    function shootCheckList($data) {
        $data['token']=urldecode($this->user_info['token']);
        $url=$this->more_api_url."/lingmall/stat/shootreview";
        $return=$this->curl($url,$data,'get');
       $list= json_decode($return,true);
       foreach ($list['data'] as $k=>$v){
           $user_p['upUserId']=$v['userId'];
           $u=$this->user_model->getInfo($user_p);
           $u=json_decode($u,true);
           $list['data'][$k]['userName']=$u['userName'];
           $list['data'][$k]['groupName']=$u['groupName'];
       }
       return $list;
    }
    
    
    function getShootBackList($data){
        $data['token']=urldecode($this->user_info['token']);
        $url=$this->more_api_url."/lingmall/stat/shootrebut";
        $return=$this->curl($url,$data,'get');
        $list= json_decode($return,true);
        foreach ($list['data'] as $k=>$v){
            $list['data'][$k]['creatTime']=date('Y-m-d h:i:s',$v['creatTime']);
        }
        return $list;
    }
    
    function getInputList($data){
        $data['token']=urldecode($this->user_info['token']);
        $url=$this->more_api_url."/lingmall/stat/input";
        $return=$this->curl($url,$data,'get');
        $list= json_decode($return,true);
        foreach ($list['data'] as $k=>$v){
           $user_p['upUserId']=$v['userId'];
           $u=$this->user_model->getInfo($user_p);
           $u=json_decode($u,true);
           $list['data'][$k]['userName']=$u['userName'];
           $list['data'][$k]['groupName']=$u['groupName'];
       }
       return $list;
    }
    
    function getInputDetail($data){
        $data['token']=urldecode($this->user_info['token']);
        $url=$this->more_api_url."/lingmall/stat/inputdetail";
        $return=$this->curl($url,$data,'get');
        $list= json_decode($return,true);
        foreach ($list['data'] as $k=>$v){
            $p['token']=$data['token'];
            $p['pId']=$v['pId'];
            $list['data'][$k]['pName']=$this->Project_model->getPNameByPId($p);
            $list['data'][$k]['statusName']=$this->getStatusName('shootStatus',$v['shootStatus']);
            $list['data'][$k]['createTime']=date('Y-m-d h:i:s',$v['createTime']);
        }
        //print_r($list['data']);exit;
        return $list;
    }
    
    
    function getInputCheck($data){
        $data['token']=urldecode($this->user_info['token']);
        $url=$this->more_api_url."/lingmall/stat/inputreview";
        $return=$this->curl($url,$data,'get');
        $list= json_decode($return,true);
        foreach ($list['data'] as $k=>$v){
            $user_p['upUserId']=$v['userId'];
            $u=$this->user_model->getInfo($user_p);
            $u=json_decode($u,true);
            $list['data'][$k]['userName']=$u['userName'];
            $list['data'][$k]['groupName']=$u['groupName'];
        }
        return $list;
    }
    
    function getProjectDetail($pId){
        $data['token']=urldecode($this->user_info['token']);
        $data['pId']=$pId;
        $url=$this->more_api_url."/lingmall/stat/projectdetail";
        $return=$this->curl($url,$data,'get');
        $list= json_decode($return,true);
        print_r($list);exit;
    }
}
?>