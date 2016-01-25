<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class MY_Controller extends CI_Controller
{
    public function __construct()
    {
        header("Access-Control-Allow-Origin:*");
        parent::__construct();
        $this->load->helper('cookie');
        $this->load->helper('url');
        $this->load->library('CI_Smarty');
        $this->load->library('LvlangMemcache');
        $this->load->library('PHPExcel');
        $this->load->library('PHPExcel/IOFactory');
        $c=$this->uri->segment(1, 0);
        $m=$this->uri->segment(2, 0);
        $acction=$c.'/'.$m;
        $noLoginArray=array('user/login','user/doLogin');
    
        if(!in_array($acction,$noLoginArray)){
           $this->user_info= unserialize(get_cookie("user"));
            if(!isset($this->user_info['userId'])){
                header("Location: ".site_url('user/login'));
            }
            else{
                $this->ci_smarty->assign('userInfo', $this->user_info);
            }
        }

        $this->root_path=ROOTPATH;
        $this->image_url=IMGURL;
        $resource_url=RESOURCE;
        $this->ci_smarty->assign('pic_path','http://7xny7g.com2.z0.glb.qiniucdn.com/');
        $this->ci_smarty->assign('root_path', $this->root_path);
        $this->ci_smarty->assign('resource_url', $resource_url);
    }

    function page($url,$pagesize,$nums)
    {
        $currentPage = $this->input->get('page')?$this->input->get('page'):$this->input->post('page');
        if($this->input->post('page')){
            $currentPage=$this->input->post('page');
        }
        $pages=ceil($nums/$pagesize);
        if($currentPage>$pages){
            $currentPage=$pages;
        }
        if($currentPage < 1){
            $currentPage=1;
        }
        $beginNum = ($currentPage-1)*$pagesize;
        $limit="$beginNum,$pagesize";
        $pre = $currentPage-1;
        if($pre<1)
        {
            $pre=1;
        }
        $next = $currentPage +1;
        if($next>$pages)
        {
            $next=$pages;
        }
        $show ="<form method='post' action=$url id='form'><div class='page_nav' id='page_nav'>";


        $show.= "<a href='$url&page=$pre' class='pageNum'>上一页</a>";

        for($i=1;$i<=$pages;$i++)
        {
            if($i>$currentPage+2 || $i<$currentPage-2)
                continue;
            if($i==$currentPage)
                $show.= "<a class='pageNum' style='text-decoration:none;color:#CC7700;'>".$i."</a>";
            else
                $show.= "<a class='pageNum' href='$url&page=$i'>".$i."</a>";
        }

        $show.= "<a href='$url&page=$next' class='pageNum'>下一页</a>
        <span>共<em>".$pages."</em>页,</span>
        <span>共<em>".$nums."</em>条记录,</span>
        ";

        $show.= "<span>跳转到第<input type='text' name='page'  value='$currentPage'>页</span>

      <input type='button' value='跳转' id='submits'>
        </div></form>";

        $showpage['limit']=$limit;
        $showpage['show']=$show;
        return $showpage;
    }
    function getPage($get,$page){
        if($this->input->post('page')==""){
            if($page==""){
                $get['page']=1;
            }else{
                $get['page']=$page;
                unset($page);
            }
        }else{
            $get['page']=$this->input->post('page');
        }
        return $get;
    }


    

    function export_csv($filename,$data)
    {
        header("Content-type:text/csv");
        header("Content-Disposition:attachment;filename=".$filename);
        header('Cache-Control:must-revalidate,post-check=0,pre-check=0');
        header('Expires:0');
        header('Pragma:public');
        echo $data;
    }
    //导出excel
    /*如果想导出图片就必须将图片的字段设置为image*/
    function phpExcel($fileName,$fields,$query,$imageName,$weight,$height){
        if(!$query)
            return false;
        $objPHPExcel = new PHPExcel();
        $objPHPExcel=new PHPExcel();
        /*设置文本对齐方式*/
        $objPHPExcel->getDefaultStyle()->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $objPHPExcel->getDefaultStyle()->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
        $objActSheet = $objPHPExcel->getActiveSheet();
        $len=sizeof($query)+2;
        $len2=count($fields);
        //设置标题
        $col = 0;
        $letter = array('A','B','C','D','E','F','G','H','I','J','K','L','M','N');
        foreach ($fields as $field)
        {
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($col, 1, $field);
            $col++;
        }
        $row = 2;
        $temp_path=array();
        foreach($query as $key1=>$data)
        {
            $col = 0;
            $keys=array_keys($data);
            $vals=array_values($keys);
            foreach ($data as $key=>$field)
            {
                //设置成文本格式
               if($key=='gtin'){
                   $objPHPExcel->getActiveSheet()->setCellValueExplicitByColumnAndRow($col, $row, $data[$key],PHPExcel_Cell_DataType::TYPE_STRING);
               }else{
                   $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, $data[$key]);
               }
                $objPHPExcel->getActiveSheet()->getRowDimension($row)->setRowHeight($height);
                $objActSheet->getColumnDimension($letter[$col])->setWidth($weight);
                $col++;
                if($key===$imageName){
                    $objDrawing = new PHPExcel_Worksheet_Drawing();
                    /*设置图片路径 切记：只能是本地图片*/
                    //先将图片保存到本地
                    $file=$this->getImg($data[$imageName]);
                    if($file['error']==0){
                        $path=$file['save_path'];
                        $temp_path[]=$path;
                        $objDrawing->setPath($path);
                        /*设置图片高度*/
                        $objDrawing->setHeight(100);
                        /*设置图片要插入的单元格*/
                        $objDrawing->setCoordinates($letter[$col-1].$row);
                        /*设置图片所在单元格的格式*/
                        $objDrawing->setOffsetX(20);
                        $objDrawing->setOffsetY(20);
                        $objDrawing->setRotation(10);
                        $objDrawing->getShadow()->setVisible(true);
                        $objDrawing->getShadow()->setDirection(50);
                        $objDrawing->setWorksheet($objPHPExcel->getActiveSheet());
                        $objPHPExcel->getActiveSheet()->setCellValue($letter[$col-1].$row,"111");
                        continue;
                    }
                }
            }
            $row++;
        }
        $objPHPExcel->setActiveSheetIndex(0);
        $objWriter = IOFactory::createWriter($objPHPExcel, 'Excel5');
        //发送标题强制用户下载文件
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename='.$fileName.date('Ymd').'.xls');
        header('Cache-Control: max-age=0');
        $objWriter->save('php://output');
        if(!empty($temp_path)){
            foreach($temp_path as $key => $val){
                //删除文件
                @unlink($val);
            }
        }
    }
    //保存到本地图片
    function getImg($url,$save_dir="./application/temImage",$filename='',$type=0){
        if(trim($url)==''){
            return array('file_name'=>'','save_path'=>'','error'=>1);
        }
        if(trim($save_dir)==''){
            $save_dir='/';
        }
        if(trim($filename)==''){//保存文件名
            $ext=strrchr($url,'.');
            if($ext!='.gif'&&$ext!='.jpg'&&$ext!=".png"&&$ext!=".gif"){
                return array('file_name'=>'','save_path'=>'','error'=>3);
            }
            $charid = strtoupper(md5(uniqid(rand(), true)));
            $filename=$charid.$ext;
        }
        if(0!==strrpos($save_dir,'/')){
            $save_dir.='/';
        }
        //创建保存目录
        if(!file_exists($save_dir)&&!mkdir($save_dir,0777,true)){
            return array('file_name'=>'','save_path'=>'','error'=>5);
        }
        //获取远程文件所采用的方法
        if($type){
            $ch=curl_init();
            $timeout=5;
            curl_setopt($ch,CURLOPT_URL,$url);
            curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
            curl_setopt($ch,CURLOPT_CONNECTTIMEOUT,$timeout);
            $img=curl_exec($ch);
            curl_close($ch);
        }else{
            ob_start();
            readfile($url);
            $img=ob_get_contents();
            ob_end_clean();
        }
        //$size=strlen($img);
        //文件大小
        $fp2=@fopen($save_dir.$filename,'a');
        fwrite($fp2,$img);
        fclose($fp2);
        unset($img,$url);
        return array('file_name'=>$filename,'save_path'=>$save_dir.$filename,'error'=>0);
    }
    
}