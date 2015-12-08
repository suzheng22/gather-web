<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>数据采集系统</title>
{{include file='public/css.tpl'}}
</head>
<body>

{{include file='public/top.tpl'}}
  
<div id="warp_box">
     <div class="main">
     	{{include file='public/left.tpl'}}
        <div class="viewport_main">
        	<div class="rose_box cc_box">
            	<h3>角色管理<a href="javascript:;" id="new_user" class="new_user"><i class="iconfont">&#xf018b;</i>新增</a></h3>
                <div class="rose_top main_rignt_top clearfix">
				<form action="{{$root_path}}role/index" method="get">
                	<div class="cc_top_one"><label>角色名称:</label><input type="text" name="roleName" value="{{$roleName}}"/ id="rose_name"></div>
                    <div class="clearfix"></div>
                    <div class="cc_top_two">
                        <span class="query"><i class="icon iconfont">&#xf00a8;</i><input type="submit" value="查询" /></span>
                        <a href="javascript:;" onclick="btn_empty()"><i class="iconfont">&#xf014a;</i>清空</a>
                    </div>
				</form>
                   	<div class="clearfix"></div>
                	<div class="tab_box">
                    <table>
                      <tr>
                        <th>角色名称</th>
                        <th>创建时间</th>
                        <th>描述</th>
                      </tr>
					 {{foreach from=$roleList item=list}}
                      <tr>
                        <td>{{$list.roleName}}</td>
                        <td>{{$list.creatTime|date_format:"Y-m-d"}}</td>
                        <td>
                        	{{$list.desc}}
                        </td>
                      </tr>
					  {{/foreach}} 
                    </table>
                </div>
                <!--分页-->
                <div class="page_nav" id="page_nav">
                  {{$pages}}
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
                <div class="clearfix one"><label for="user_name">角色名称:</label><input type="text" class="zhmm" id="roleName"></div>
                <div class="clearfix one"><label for="user_name">描述:</label><textarea id="desc"></textarea></div>
                <a href="javascript:;" id="confirm_btn" class="confirm_btn" onclick="addRole()">确认</a>
            </div>
	   </div>
    </div>
</div>
{{include file='public/js.tpl'}}
<script type="text/javascript">
$(function(){
	var url = window.location;
    $('.system_log dd a').filter(function (){
        return this.href == url || url.href.indexOf(this.href) == 0;
    })
    .parents('dd').addClass('active').siblings().removeClass('active');
	$(".leftsidebar_box .user_manager dd").show();
	
});
	function addRole(){
		var roleName=$("#roleName").val();
		var desc=$("#desc").val();
		$.post("{{$root_path}}role/addRole",{"roleName":roleName,"desc":desc},
		  	function(data){
				var dataObj=eval("("+data+")");
				if(dataObj.msgCode==0){
					alert('添加成功');
					window.location.reload();
				}
				else{
					alert(dataObj.msg);
					window.location.reload();
				}
		  	},"text");
	}
	
	//清空
	function btn_empty(){
		$("#rose_name").val("");
	}
</script>

</body>
</html>
