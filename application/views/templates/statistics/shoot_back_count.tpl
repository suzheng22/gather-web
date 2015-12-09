<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>数据采集系统</title>
<link rel="stylesheet" type="text/css" href="style/global.css"/>
<link rel="stylesheet" type="text/css" href="style/head.css" />
<link rel="stylesheet" type="text/css" href="style/public.css"/>
<link rel="stylesheet" type="text/css" href="style/iconfont.css"/>
</head>
<body>
<div class="j-top">
    <div class="j-top-warp">
        <h3>数据采集系统<span>v1.0</span></h3>
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
                            <dd><a href="ps_check.html">录入信息</a></dd>
                        </dl>
                         <dl class="custom">
                            <dt><i class="icon iconfont">&#xf01d8;</i>审核管理<img src="images/left/select_xl01.png"></dt>
                            <dd><a href="ps_check.html">拍摄审核</a></dd>
                            <dd><a href="record_check.html">录入审核</a></dd>
                            <dd><a href="ps_check.html">修图审核</a></dd>
                        </dl>
                        
                        <dl class="channel">
                            <dt><i class="icon iconfont">&#xf0141;</i>统计管理<img src="images/left/select_xl01.png"></dt>
                            <dd><a href="#">单品统计</a></dd>
                            <dd><a href="#">拍摄统计</a></dd>
                            <dd><a href="#">拍摄审核统计</a></dd>
                            <dd><a href="#">录入统计</a></dd>
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
            	<h3>拍摄驳回统计</h3>
                <div class="rose_top main_rignt_top clearfix">
                	<div class="cc_top_one"><label>商品条形码:</label><input type="text"/></div>
                    <div class="cc_top_one"><label>商品名称:</label><input type="text"/></div>
                    <div class="cc_top_one last_show"><label>商品分类:</label>
                            <div class="choice_count choice_box vocation">            	 			
                                <dl class="select">
                                    <select class="select3">
                                   		<option value="">全部</option>
                                        <option value="">1</option>
                                        <option value="">2</option>
                                   </select>
                                </dl>
                            </div>
                     </div>
                     <div class="clearfix"></div>
                     <div class="cc_top_one" style="width:50%">
                            <label>驳回时间:</label>
                            <input type="text" id="datetimepicker_start"/>
                            <label style="width:20px;">-</label>
                            <input type="text" id="datetimepicker_end"/>
                     </div>
                    <div class="cc_top_two" style="margin-left:12px; display:inline;">
                    	<a href="javascript:;" class="query"><i class="icon iconfont">&#xf00ab;</i>导出</a>
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
                        <th>驳回原因</th>
                        <th>驳回时间</th>
                        
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>asda</td>
                        <td>dsad</td>
                        <td>dasdd</td>
                        <td>dadas</td>
                        <td>审核通过</td>
                        
                      </tr>
                       <tr>
                        <td>1</td>
                        <td>asda</td>
                        <td>dsad</td>
                        <td>dasdd</td>
                        <td>dadas</td>
                        <td>审核驳回</td>
                       
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
<!-- 新建用户弹出层 开始-->
<div class="newuser_pop" id="newuser_pop">
	<div class="tit clearfix"><h4>新增角色</h4><a class="no_text close" href="javascript:;" title="关闭">关闭</a></div>
	<div class="content">
		<div class="login_main">
			<div class="login_form">
				<div class="clearfix one"><label for="user_name">角色编码:</label><input type="text" id="" class="zhmm"></div>
                <div class="clearfix one"><label for="user_name">角色名称:</label><input type="text" id="" class="zhmm"></div>
                <div class="clearfix one"><label for="user_name">描述:</label><textarea></textarea></div>
                <a href="javascript:;" id="confirm_btn" class="confirm_btn">确认</a>
            </div>
	   </div>
    </div>
</div>
<script type="text/javascript"  src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/popup/popup.js"></script>
<script type="text/javascript" src="js/defined.js"></script>
<script type="text/javascript" src="js/full_screen.js"></script>
<script type="text/javascript">
$(function(){
		//select 表单美化
	$(".select3").uedSelect({
		width : 100
	});
	
	
	
	//用户列表
     $("#newuser_pop").pop({
        oMain:"#new_user",         //触发弹出层的元素。为空时直接弹出
        sEvent:"click",             //触发事件
        oClose:"#newuser_pop .close", //关闭按钮
        bIframe:false,              //是否有iframe
        iSrc:"",                    //iframe地址
        bShade:true,                //是否有遮罩
        bShadeClose:false,          //是否点遮罩关闭
        fnAdditional:function(){
            
        }
    });
});	
</script>	
<!--时间控件-->
<link rel="stylesheet" type="text/css" href="js/time/jquery.datetimepicker.css"/>
<script type="text/javascript" src="js/time/jquery.datetimepicker.js"></script>
<script type="text/javascript">
$('#datetimepicker_start').datetimepicker({
	onGenerate:function( ct ){
		$(this).find('.xdsoft_date')
			.toggleClass('xdsoft_disabled');
	},
		format:'d/m/Y',
	formatDate:'Y/m/d',
	minDate:'-1970/01/2',
	maxDate:'+1970/01/2',
	timepicker:false
});
$('#datetimepicker_end').datetimepicker({
	onGenerate:function( ct ){
		$(this).find('.xdsoft_date')
			.toggleClass('xdsoft_disabled');
	},
		format:'d/m/Y',
	formatDate:'Y/m/d',
	minDate:'-1970/01/2',
	maxDate:'+1970/01/2',
	timepicker:false
}); 
</script>
</body>
</html>
