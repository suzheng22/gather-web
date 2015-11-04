<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户管理系统</title>
{{include file='public/css.tpl'}}
</head>
<body>


  {{include file='public/top.tpl'}}
<div id="warp_box">
    	
     <div class="main">
     	{{include file='public/left.tpl'}}
        <div class="viewport_main">
        	<div class="rose_box cc_box">
            	<h3>用户管理</h3>
				
                <div class="rose_top main_rignt_top clearfix">
						<form action="{{$root_path}}user/index" method="get">
                        <p class="cc_top_one clearfix"><label>账号名:</label><input type="text" name="userName" value="{{$userName}}"/></P>
                        <p class="cc_top_one clearfix"><label>用户名:</label><input type="text" name="trueName" value="{{$trueName}}"/></P>
                        <p class="cc_top_one clearfix"><label>角色名称:</label><select name="roleId">
																					<option value="">请选择</option>
																					{{foreach from =$role_list item=list}}
																						<option value="{{$list.roleId}}"  {{if $roleId==$list.roleId}}selected="selected"{{/if}}>{{$list.roleName}}</option>
																					{{/foreach}}
																			  </select></P>
                        <p class="cc_top_one clearfix"><label>用户组名称:</label>
																					<select name="groupId">
																					<option value="">请选择</option>
																					{{foreach from =$group_list item=list}}
																						<option value="{{$list.groupId}}" {{if $groupId==$list.groupId}}selected="selected"{{/if}}>{{$list.groupName}}</option>
																					{{/foreach}}
																					</select>
																					</P>
                        <p class="cc_top_one clearfix"><label>状态:</label><select name="status">
																				<option value="">请选择</option>
																				<option value="1" {{if $status==1}}selected="selected"{{/if}}>正常</option>
																				<option value="2" {{if $status==2}}selected="selected"{{/if}}>禁用</option>
																			</select></p> 
                        <p class="cc_top_two clearfix">
                            
                            <input type="submit" value="查询" />
							<a href="javascript:;" id="new_user">新增</a>
                            <a href="javascript:;">清空</a>
                        </p>
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
                        <td>...</td>
                        <td>{{if $list.status==1}}正常{{else}}禁用{{/if}}</td>
                        <td>{{$list.creatTime|date_format:"Y-m-d"}}</td>
                        <td>xx</td>
                        <td>
                        	<a href="javascript;">冻结</a>
                        	<a href="javascript;">修改</a>
                            <a href="javascript;">重置密码</a>
                        </td>
                      </tr>
					  {{/foreach}}
                    </table>
                </div>
				{{$pages}}
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
{{include file='public/js.tpl'}}
<script>
	function addUser(){
		var userName=$("#userName").val();
		var trueName=$("#trueName").val();
		var roleId=$("#roleId").val();
		var groupId=$("#groupId").val();
		var desc=$("#desc").val();
		$.post("{{$root_path}}user/addUser",{"userName":userName,"trueName":trueName,"roleId":roleId,"groupId":groupId,"desc":desc},
		  	function(data){
				var dataObj=eval("("+data+")");
				if(dataObj.msgCode==0){
					alert('添加成功');
					window.location.reload();
				}
		  	},"text");
	}
    function select_group(roleId){
		$("#groupId").empty();
		$("#groupId").append('<option value="">请选择</option>');
		$.post("{{$root_path}}user/getUserGroupListAjax",{"roleId":roleId},
		  function(data){

			var dataObj=eval("("+data+")");
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
	
</script>

</body>
</html>
