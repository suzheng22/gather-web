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
			<h3>录入系统</h3>
        </div>
    
    </div> 
	<div class="login_box">
			<div class="login_main">
                    <div class="login_form_box">
                    	<div class="ipt"><span style="width:250px; height:30px; line-height:30px; font-size:14px;">账号：{{$userInfo.trueName}}</span></div>
                        <div class="ipt"><input type="password" id="oldPwd" class="zhmm" placeholder="旧密码"/></div>
                        <div class="ipt"><input type="password" id="newPwd" class="zhmm" placeholder="设置新密码"/></div>
                        <div class="ipt"><input type="password" id="re_newPwd" class="zhmm" placeholder="确认次输入密码"/></div>
                    </div>
                   <!-- <a href="#" class="btn" id="btn" title="立即登录">登录</a>-->
                   	<input type="button" value="修改" class="btn" id="btn" onclick="editPwd()"/>
			</div>
    </div>
</body>
<script>
	function editPwd(){
	var oldPwd=$("#oldPwd").val();
	var newPwd=$("#newPwd").val();
	var re_newPwd=$("#re_newPwd").val();
	if(newPwd!=re_newPwd){
		alert('两次密码输入不符');
		return false;
	}
		$.post("{{$root_path}}user/doEditPwd",{"oldPwd":oldPwd,'newPwd':newPwd},
		  function(data){
				var dataObj=eval("("+data+")");
				if(dataObj.msgCode==0){
					alert('编辑成功');
					window.location.reload();
				}
				else{
					alert(dataObj.msg);
					window.location.reload();
				}
		  },
		  "text");
	}
</script>
</html>
