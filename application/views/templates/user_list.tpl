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
            	<h3>用户管理<a href="javascript:;" id="new_user" class="new_user"><i class="iconfont">&#xf018b;</i>新增</a></h3>
				
                <div class="rose_top main_rignt_top clearfix">
						<form action="{{$root_path}}user/index" method="get">
                        <div class="cc_top_one clearfix"><label>账号名:</label><input type="text" name="userName" value="{{$userName}}"/ id="count_user"></div>
                        <div class="cc_top_one clearfix"><label>用户名:</label><input type="text" name="trueName" value="{{$trueName}}"/ id="user"></div>
                        <div class="cc_top_one clearfix vocation"><label>角色名称:</label><select name="roleId" class="select3">
																					<option value="">请选择</option>
																					{{foreach from =$role_list item=list}}
																						<option value="{{$list.roleId}}"  {{if $roleId==$list.roleId}}selected="selected"{{/if}}>{{$list.roleName}}</option>
																					{{/foreach}}
																			  </select></div>
                        <div class="cc_top_one clearfix vocation"><label>用户组名称:</label>
																					<select name="groupId" class="select3">
																					<option value="">请选择</option>
																					{{foreach from =$group_list item=list}}
																						<option value="{{$list.groupId}}" {{if $groupId==$list.groupId}}selected="selected"{{/if}}>{{$list.groupName}}</option>
																					{{/foreach}}
																					</select>
																					</div>
                         <div class="clearfix"></div>                                                           
                        <div class="cc_top_one clearfix vocation"><label>状态:</label><select name="status" class="select3">
																				<option value="">请选择</option>
																				<option value="1" {{if $status==1}}selected="selected"{{/if}}>正常</option>
																				<option value="2" {{if $status==2}}selected="selected"{{/if}}>禁用</option>
							
                            
                           												</select></div>
                                                                        
                        <div class="clearfix"></div> 
                        <div class="cc_top_two clearfix">
                            
                           
                            <span class="query"><i class="icon iconfont">&#xf00a8;</i><input type="submit" value="查询" /></span>
                            <a href="javascript:;" onclick="btn_empty()"><i class="iconfont">&#xf014a;</i>清空</a>
                        </div>
						</form>
                    <div class="clearfix"></div>
                 
                <div class="tab_box">
                    <table>
                      <tr>
                        <th>账号名</th>
                        <th>用户名</th>
                        <th>角色名称</th>
                        <th>用户组名称</th>
                        <th>描述</th>
                        <th>状态</th>
                        <th>创建时间</th>
                        <th>创建人</th>
                        <th>操作</th>
                        
                        
                      </tr>
					  {{foreach from =$userList item=list}}
                      <tr>
                        <td>{{$list.userName}}</td>
                        <td>{{$list.trueName}}</td>
                        <td>{{$list.roleName}}</td>
                        <td>{{$list.groupName}}</td>
                        <td>{{$list.desc}}</td>
                        <td>{{if $list.status==1}}正常{{else}}禁用{{/if}}</td>
                        <td>{{$list.creatTime|date_format:"Y-m-d"}}</td>
                        <td>{{$list.creatUser}}</td>
                        <td>
                        	{{if $list.status==1}}<a href="##" onclick="freeze({{$list.userId}},2)">冻结</a>{{else}}<a href="##" onclick="freeze({{$list.userId}},1)">解冻</a>{{/if}}
                        	<a href="##" class="revamp" onclick="get_info({{$list.userId}})">修改</a>
                            <a href="##" onclick="re_pwd({{$list.userId}})">重置密码</a>
                        </td>
                      </tr>
					  {{/foreach}}
                    </table>
                </div>
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
	<div class="tit clearfix"><h4>新增用户</h4><a class="no_text close" href="javascript:;" title="关闭">关闭</a></div>
	<div class="content">
		<div class="login_main">
			<div class="login_form">
				<div class="clearfix one"><label for="user_name">账号名:</label><input type="text" id="userName" class="zhmm"></div>
                <div class="clearfix one"><label for="user_name">用户名:</label><input type="text" id="trueName" class="zhmm"></div>
                <div class="clearfix one"><label for="user_name">角色名称:</label><select id="roleId" onchange="select_group(this.value)">
																					<option value="">请选择</option>
																					{{foreach from =$role_list item=list}}
																						<option value="{{$list.roleId}}" >{{$list.roleName}}</option>
																					{{/foreach}}
																			  </select></div>
                <div class="clearfix one"><label for="user_name">用户组名称:</label><select id="groupId">
																					<option value="">请选择</option>
																					
																					</select></div>
                <div class="clearfix one"><label for="user_name">描述:</label><textarea id="desc"></textarea></div>
                <a href="javascript:;" id="confirm_btn" class="confirm_btn" onclick="addUser()">确认</a>
            </div>
	   </div>
    </div>
</div>

<!-- 修改用户弹出层 开始-->
<div class="newuser_pop" id="newuser_pop_revamp">
	<div class="tit clearfix"><h4>修改用户</h4><a class="no_text close" href="javascript:;" title="关闭">关闭</a></div>
	<div class="content">
		<div class="login_main">
			<div class="login_form"><input type="hidden" id="ed_userId" />
				<div class="clearfix one"><label for="user_name">账号名:</label><input type="text" id="up_userName" class="zhmm" readonly=""></div>
                <div class="clearfix one"><label for="user_name">用户名:</label><input type="text" id="up_trueName" class="zhmm"></div>
                <div class="clearfix one"><label for="user_name">角色名称:</label><select id="up_roleId" onchange="select_group_up(this.value)">
																					<option value="">请选择</option>
																					{{foreach from =$role_list item=list}}
																						<option value="{{$list.roleId}}" >{{$list.roleName}}</option>
																					{{/foreach}}
																			  </select></div>
                <div class="clearfix one"><label for="user_name">用户组名称:</label><select id="up_groupId">
																					<option value="">请选择</option>
																					
																					</select></div>
                <div class="clearfix one"><label for="user_name">描述:</label><textarea id="up_desc"></textarea></div>
                <a href="javascript:;" id="confirm_btn" class="confirm_btn" onclick="edit_info()">确认</a>
            </div>
	   </div>
    </div>
</div>
{{include file='public/js.tpl'}}
<script  type="text/javascript">

$(function(){
	//左侧菜单	
	var url = window.location;
    $('.system_log dd a').filter(function (){
        return this.href == url || url.href.indexOf(this.href) == 0;
    })
    .parents('dd').addClass('active').siblings().removeClass('active');
	$(".leftsidebar_box .user_manager dd").show();
});
	function addUser(){
		var userName=$("#userName").val();
		var trueName=$("#trueName").val();
		var roleId=$("#roleId").val();
		var groupId=$("#groupId").val();
		var desc=$("#desc").val();
		$.post("{{$root_path}}user/addUser",{"userName":userName,"trueName":trueName,"roleId":roleId,"groupId":groupId,"desc":desc},
		  	function(data){
				var dataObj=eval("("+data+")");
				alert(dataObj.msg);
				window.location.reload();
		  	},"text");
	}
    
	function edit_info(){
		var trueName=$("#up_trueName").val();
		var roleId=$("#up_roleId").val();
		var groupId=$("#up_groupId").val();
		var desc=$("#up_desc").val();
		var userId=$("#ed_userId").val();
		$.post("{{$root_path}}user/editUser",{"ed_userId":userId,"trueName":trueName,"roleId":roleId,"groupId":groupId,"desc":desc},
		  	function(data){
				var dataObj=eval("("+data+")");
				alert(dataObj.msg);
				window.location.reload();
		  	},"text");
	}
	
	function select_group(roleId){
		$("#groupId").empty();
		$("#groupId").append('<option value="">请选择</option>');
		$.post("{{$root_path}}user/getUserGroupListAjax",{"roleId":roleId},
		  function(data){

			var dataObj=eval("("+data+")");
			if(dataObj.msgCode>0){
				alert(dataObj.msg);
				window.location.reload();
			}
			if(dataObj.length>0){
				var html="";			
				for(var i=0;i<dataObj.length;i++){
					html+="<option value='"+dataObj[i].groupId+"'>"+dataObj[i].groupName+"</option>";
					 
				}
				$("#groupId").append(html);
			}
			else{
				alert('没有这个角色的用户组请先添加该角色的用户组');
			}

		  },
		  "text");
	}
	
	function select_group_up(roleId,groupId){
		$("#up_groupId").empty();
		$("#up_groupId").append('<option value="">请选择</option>');
		$.post("{{$root_path}}user/getUserGroupListAjax",{"roleId":roleId},
		  function(data){

			var dataObj=eval("("+data+")");
			if(dataObj.msgCode>0){
				alert(dataObj.msg);
				window.location.reload();
			}
			if(dataObj.length>0){
				var html="";			
				for(var i=0;i<dataObj.length;i++){
					html+="<option value='"+dataObj[i].groupId+"'>"+dataObj[i].groupName+"</option>";
					 
				}
				$("#up_groupId").append(html);
				if(groupId){
					$("#up_groupId").val(groupId);
				}
			}
			else{
				alert('没有这个角色的用户组请先添加该角色的用户组');
			}

		  },
		  "text");
	}
	
	function re_pwd(userId){
		$.post("{{$root_path}}user/rePwd",{"reUserId":userId},
		  function(data){
				var dataObj=eval("("+data+")");
				alert(dataObj.msg);
				window.location.reload();
		  },
		  "text");
	}	
	
	function freeze(userId,status){
		$.post("{{$root_path}}user/freeze",{"freezeUserId":userId,"status":status},
		  function(data){
				var dataObj=eval("("+data+")");
				alert(dataObj.msg);
				window.location.reload();
		  },
		  "text");
	}
	
	function get_info(userId){
		$.post("{{$root_path}}user/info",{"upUserId":userId},
		  function(data){

			var dataObj=eval("("+data+")");
			if(dataObj.msgCode>0){
				alert(dataObj.msg);
				window.location.reload();
			}
			$("#up_userName").val(dataObj.userName);
			$("#up_trueName").val(dataObj.trueName);
			$("#up_roleId").val(dataObj.roleId);
			$("#up_desc").html(dataObj.desc);
			$("#ed_userId").val(dataObj.userId);
			select_group_up(dataObj.roleId,dataObj.groupId);
		  },
		  "text");
	}
	
		//清空
	function btn_empty(){
		$("#count_user").val("");
		$("#user").val("");
		$(".cc_top_one select").val("");
	}
</script>

</body>
</html>
