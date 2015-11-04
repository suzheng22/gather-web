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
                <div class="slimScrollDiv">
                <ul>
                	<li class="brand "><a href="javascript:;" title="用户管理"><i class="icon iconfont">&#xf0226;</i>用户管理</a>
                        <div class="sub">
                            <ul>
                               <li class="aa bb"><a href="user_manager.html" title="用户列表">用户管理</a></li>
                                <li class="aa"><a href="user_rose.html" title="角色管理" class="">角色管理</a></li>
                                <li class="aa"><a href="user_group_manger.html" title="用户组管理">用户组管理</a></li>
                            </ul>
                        </div>
                	</li>
                    <li class=""><a href="count.html" title="统计管理"><i class="icon iconfont">&#xf0141;</i>统计管理</a></li>
                </ul>
                </div>
                
                <div class="projectAction"><span><i class="icon iconfont">&#xf01b5;</i>增加</span><span><i class="icon iconfont">&#xf018f;</i>设置</span></div>
            </div>
        </div>
        <div class="viewport_main">
        	<div class="rose_box cc_box">
            	<h3>用户组管理</h3>
                <div class="rose_top main_rignt_top clearfix">
                        <p class="cc_top_one clearfix"><label>用户组名称:</label><input type="text"/></P>
                        <p class="cc_top_one clearfix"><label>角色名称:</label><input type="text"/></p> 
                        <p class="cc_top_two clearfix">
                            <a href="javascript:;" id="new_user">新增</a>
                            <a href="javascript:;">查询</a>
                            <a href="javascript:;">清空</a>
                        </p>
                    <div class="clearfix"></div>
                 
                <div class="tab_box">
                    <table>
                      <tr>
                        <th>序号</th>
                        <th>用户组编码</th>
                        <th>用户组名称</th>
                        <th>角色名称</th>
                        <th>描述</th>
                        <th>创建时间</th>
                        <th>创建人</th>
                        <th>修改时间</th>
                        <th>修改人</th>
                        <th>操作</th>
                        
                        
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>123</td>
                        <td>mac</td>
                        <td>cc</td>
                        <td>摄影组</td>
                        <td>...</td>
                        <td>正常</td>
                        <td>2015.10.30</td>
                        <td>cc</td>
                        <td>
                        	<a href="javascript;">删除</a>
                        	<a href="javascript;">修改</a>
                        </td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>123</td>
                        <td>mac</td>
                        <td>cc</td>
                        <td>摄影组</td>
                        <td>...</td>
                        <td>正常</td>
                        <td>2015.10.30</td>
                        <td>cc</td>
                        <td>
                        	<a href="javascript;">删除</a>
                        	<a href="javascript;">修改</a>
                        </td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>123</td>
                        <td>mac</td>
                        <td>cc</td>
                        <td>摄影组</td>
                        <td>...</td>
                        <td>正常</td>
                        <td>2015.10.30</td>
                        <td>cc</td>
                        <td>
                        	<a href="javascript;">删除</a>
                        	<a href="javascript;">修改</a>
                        </td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>123</td>
                        <td>mac</td>
                        <td>cc</td>
                        <td>摄影组</td>
                        <td>...</td>
                        <td>正常</td>
                        <td>2015.10.30</td>
                        <td>cc</td>
                        <td>
                        	<a href="javascript;">删除</a>
                        	<a href="javascript;">修改</a>
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
               <div class="notes">
                    <P>注意事项：</P>
                    <P>新增时，用户组编码和用户组名称不可重复；</P>
                    <P>修改时，用户组编码不可修改，用户组名称编码不可重复；</P>
                    <P>删除时，已用在用户信息的用户组信息不可删除；</P>
               </div>
            </div>
        
        </div>
     </div><!--main end-->  		
</div>
<!-- 新建用户弹出层 开始-->
<div class="newuser_pop" id="newuser_pop">
	<div class="tit clearfix"><h4>新增用户组</h4><a class="no_text close" href="javascript:;" title="关闭">关闭</a></div>
	<div class="content">
		<div class="login_main">
			<div class="login_form">
				<div class="clearfix one"><label for="user_name">用户组编码:</label><input type="text" id="" class="zhmm"></div>
                <div class="clearfix one"><label for="user_name">用户组名称:</label><input type="text" id="" class="zhmm"></div>
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


</body>
</html>
