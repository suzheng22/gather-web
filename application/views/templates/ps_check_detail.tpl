<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户管理系统</title>
<link rel="stylesheet" type="text/css" href="style/global.css"/>
<link rel="stylesheet" type="text/css" href="style/head.css" />
<link rel="stylesheet" type="text/css" href="style/public.css"/>
<link rel="stylesheet" type="text/css" href="style/iconfont.css"/>
</head>
<body>

<div class="j-top">
    <div class="j-top-warp">
        <h3>用户管理系统<span>v1.0</span></h3>
        <div class="top_right"><span id="user_name_show"></span><em>,欢迎你</em><a href="index.html">退出</a></div>
    </div>
</div>
  
<div id="warp_box">
     <div class="main">
     	<div class="aside_nav">
        	<div class="aside_menu">
                <div class="slimScrollDiv leftsidebar_box">
                	
                        <dl class="system_log">
                            <dt onClick="changeImage()"><i class="icon iconfont">&#xf0226;</i>用户管理<img src="images/left/select_xl01.png"></dt>
                            <dd class="first_dd"><a href="user_manager.html">用户管理</a></dd>
                            <dd><a href="user_rose.html">角色管理</a></dd>
                            <dd><a href="user_group_manger.html">用户组管理</a></dd>
                        </dl>
                        <dl class="cloud">
                            <dt><a href="#"><i class="icon iconfont">&#x346a;</i>录入管理<img src="images/left/select_xl01.png"></a></dt>
                        </dl>
                         <dl class="custom">
                            <dt onClick="changeImage()"><i class="icon iconfont">&#xf01d8;</i>审核管理<img src="images/left/select_xl01.png"></dt>
                            <dd class="first_dd"><a href="ps_check.html">修图审核</a></dd>
                            <dd><a href="#">录入审核</a></dd>
                        </dl>
                        
                        <dl class="channel">
                            <dt><i class="icon iconfont">&#xf0141;</i>统计管理<img src="images/left/select_xl01.png"></dt>
                            <dd class="first_dd"><a href="#">录入统计</a></dd>
                            <dd><a href="#">录入审核统计</a></dd>
                            <dd><a href="#">修图统计</a></dd>
                            <dd><a href="#">修图审核统计</a></dd>
                        </dl>
                </div>
                <div class="projectAction"><!--<span><i class="icon iconfont">&#xf01b5;</i>增加</span><span><i class="icon iconfont">&#xf018f;</i>设置</span>--></div>
            </div>
        </div>
        <div class="viewport_main">
        	<div class="rose_box cc_box">
            	<h3>修图审核-详情</h3>	
                <div class="rose_top main_rignt_top clearfix">
                	
                        <div class="cc_top_one"><label>修图人:</label><span>XXX</span></div>
                        <div class="cc_top_one"><label>抽查通过率:</label><span>90%</span></div>
                        <div class="cc_top_one"><label>待审核商品数:</label><span>XXX</span></div>
                        <div class="clearfix"></div>
                    	<div class="cc_top_one"><label>商品名称:</label><input type="text" value=""/></div>
                     	<div class="cc_top_one"><label>上传时间:</label><input type="text" id="datetimepicker"/></div>
                        
                        <div class="cc_top_one last_show"><label>商品分类:</label>
                            <div class="choice_count choice_box">            	 			
                                <dl class="select">
                                    <dt>全部</dt>
                                    <dd>
                                        <ul>
                                            <li><a href="#">001</a></li>
                                            <li><a href="#">002</a></li>
                                        </ul>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                         <div class="cc_top_one last_show"><label>修图类型:</label>
                            <div class="choice_count choice_box">            	 			
                                <dl class="select">
                                    <dt>全部</dt>
                                    <dd>
                                        <ul>
                                            <li><a href="#">正常修图</a></li>
                                            <li><a href="#">驳回修图</a></li>
                                        </ul>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                         <div class="cc_top_one last_show"><label>状态:</label>
                            <div class="choice_count choice_box">            	 			
                                <dl class="select">
                                    <dt>全部</dt>
                                    <dd>
                                        <ul>
                                            <li><a href="#">修图已驳回</a></li>
                                            <li><a href="#">修图已通过</a></li>
                                        </ul>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                    <div class="cc_top_two">
                        
                        <a href="javascript:;" class="query"><i class="icon iconfont">&#xf00a8;</i>查询</a>
                            <a href="javascript:;"><i class="iconfont">&#xf014a;</i>清空</a>
                    </div>
                   	<div class="clearfix"></div>
                	<div class="tab_box">
                    <table>
                      <tr>
                        <th>序号</th>
                        <th>商品条形码</th>
                        <th>商品名称</th>
                        <th>商品分类</th>
                        <th>修图类型</th>
                        <th>状态</th>
                        <th>操作</th>
                        
                        
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>asda</td>
                        <td>dsad</td>
                        <td>dasdd</td>
                        <td>正常修图</td>
                        <td>修图已驳回</td>
                        <td>
                        	<a href="javascript;">审核详细</a>
                        </td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>asda</td>
                        <td>dsad</td>
                        <td>dasdd</td>
                        <td>驳回修图</td>
                        <td>修图审核通过</td>
                        <td>
                        	<a href="ps_check_pic.html" target="_blank">审核详细</a>
                        </td>
                      </tr>
                       
                      
                    </table>
                </div>
                	<div class="page_nav" id="page_nav">
                	<a href="javascript:;" class="pageNum">上一页</a>
                    <a href="javascript:;" class="pageNum">1</a>
                    <a href="javascript:;" class="pageNum">2</a>
                    <a href="javascript:;" class="pageNum">3</a>
                    <a href="javascript:;" class="pageNum">4</a>
                    <a href="javascript:;" class="pageNum">5</a>
                    <a href="javascript:;" class="pageNum">6</a>
                    <a href="javascript:;" class="pageNum">7</a>
                    <a href="javascript:;" class="pageNum">8</a>
                    <a href="javascript:;" class="pageNum">9</a>
                    <a href="javascript:;" class="pageNum">下一页</a>
                    <span>共<em>100</em>页,</span>
                    <span>共<em>66</em>条记录,</span>
                    <span>跳转到第<input type="text"/>页</span>
                    <a href="javascript:;" class="pageNum">确定</a>
                </div>
                	
                </div>
            </div>
        </div>
     </div><!--main end-->  
</div>
<script type="text/javascript"  src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/popup/popup.js"></script>
<script type="text/javascript" src="js/defined.js"></script>
<script type="text/javascript" src="js/full_screen.js"></script>
<!--时间控件-->
<link rel="stylesheet" type="text/css" href="js/time/jquery.datetimepicker.css"/>
<script type="text/javascript" src="js/time/jquery.datetimepicker.js"></script>
<script type="text/javascript">
$('#datetimepicker').datetimepicker();
</script>
<!---->  	


</body>
</html>
