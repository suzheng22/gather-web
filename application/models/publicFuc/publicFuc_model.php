<?php
class PublicFuc_model extends MY_Model {
    public function __construct()
    {
        // Call the CI_Model constructor
        parent::__construct();

    }
    //导出csv
    function export_csv($fileName,$firstLine,$result){
        $fileName=$fileName.'.csv';//
        header("Content-type:text/csv");
        header("Content-Disposition:attachment;filename=".$fileName);
        header('Cache-Control:must-revalidate,post-check=0,pre-check=0');
        header('Expires:0');
        header('Pragma:public');
        if(empty($result)) {
            return $this->i("没有符合您要求的数据！^_^");
        }
        $data=$firstLine."\n";
        foreach($result as $key =>$val){
            $len=sizeof($val);
            $keys=array_keys($val);
            $vals=array_values($val);
            for($i=0;$i<$len;$i++){
                if($i==$len-1){
                    $data.=$this->i($val[$keys[$i]])."\n";
                }else{
                    $data.=$this->i($val[$keys[$i]].',');
                }

            }
        }
        echo $data;
    }
    //转码
    function i($strInput) {
        return iconv('utf-8','gb2312',$strInput);//页面编码为utf-8时使用，否则导出的中文为乱码
    }
    function getUrl($url,$data){
        if(!is_array($data)){
            $return ='parmars error';
            return $return;
            exit;
        }
        $key=array_keys($data);
        $val=array_values($data);
        $count=sizeof($data);
        $str='';
        for($i=0;$i<$count;$i++){
            if($i==0){
                $str.=$key[$i]."=".$val[$i];
            }else{
                $str.='&'.$key[$i]."=".$val[$i];
            }
            //输出到模板
            $this->ci_smarty->assign($key[$i],$val[$i]);
        }
        return $url.$str;
    }
    function u(){
        echo 123;
    }


}