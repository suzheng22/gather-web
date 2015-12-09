<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>数据采集系统</title>
{{include file='public/css.tpl'}}

<script type="text/javascript"  src="{{$resource_url}}js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="{{$resource_url}}js/defined.js"></script>
<script type="text/javascript">
$(function(){
	
    $('#login_bg').height($(window).height());
    $('#login_bg').width($(window).width());
});
</script>
</head>
<body id="login_bg">
	<!------------------------login------------------------------------->
	<div class="j-top">
    	<div class="j-top-warp">
			<h3><img src="{{$resource_url}}images/logo.png"/></h3>
           <!-- <div class="top_right"><span>RingKing</span><em>,欢迎你</em>|<a href="#">退出</a></div>-->
        </div>
    
    </div> 
	<div class="login_box">
			<div class="login_main">
                <form action="{{$root_path}}user/doLogin" method="post" accept-charset="utf-8">
                    <div class="login_tit">用户登录</div>
                    <div class="login_form_box">
                        <div class="ipt"><input name="userName" type="text" id="user_name" class="zhmm" placeholder="请输入用户名"/></div>
                        <div class="ipt"><input name="pwd" type="password" id="user_pass" class="zhmm" placeholder="请输入密码"/></div>{{$msg}}
                    </div>
					<input type="submit" value="登录" class="btn" id="btn"/>
                   
                 </form>
			</div>
    </div>
</body>
</html>
