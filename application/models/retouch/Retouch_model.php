<?php
class Retouch_model extends MY_Model
{


    public function __construct()
    {
        // Call the CI_Model constructor
        parent::__construct();
    }
     function getMarlboroList($data){
         $data=json_encode($data); var_dump($data);
         $url=$this->more_api_url."/lingmall/retouch/marlboroList";
         $return=$this->curl($url,$data);
         var_dump($return);
         $list=json_decode($return,true);
         return $list;
    }

}