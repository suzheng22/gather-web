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
        $resource_url=RESOURCE;

        $this->ci_smarty->assign('root_path', $this->root_path);
        $this->ci_smarty->assign('resource_url', $resource_url);
    }

    function page($url,$pagesize,$nums)
    {
        $currentPage = $this->input->get('currentPage')?$this->input->get('currentPage'):$this->input->post('post_page');
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
    
        $show ="<form method='post' action=$url><div class='page_nav' id='page_nav'>";
    
        
    
        $show.= "<a href='$url&currentPage=$pre' class='pageNum'>上一页</a>";
    
        for($i=1;$i<=$pages;$i++)
        {
            if($i>$currentPage+2 || $i<$currentPage-2)
                continue;
            if($i==$currentPage)
                $show.= "<a class='pageNum' style='text-decoration:none;color:#CC7700;'>".$i."</a>";
            else
                $show.= "<a class='pageNum' href='$url&currentPage=$i'>".$i."</a>";
        }
    
        $show.= "<a href='$url&currentPage=$next' class='pageNum'>下一页</a>
        <span>共<em>".$pages."</em>页,</span>
        <span>共<em>".$nums."</em>条记录,</span>
        ";
    
        $show.= "<span>跳转到第<input type='text' name='post_page'  value='$currentPage'>页</span>
        <input type='submit' value='跳转'>
        </div></form>";
    
        $showpage[limit]=$limit;
        $showpage[show]=$show;
        return $showpage;
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
    
}