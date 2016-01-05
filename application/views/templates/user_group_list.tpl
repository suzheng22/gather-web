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
            	<h3>用户组管理 <a href="javascript:;" id="new_user" class="new_user"><i class="iconfont">&#xf018b;</i>新增</a></h3>
                <div class="rose_top main_rignt_top clearfix">
				<form action="{{$root_path}}user/userGroupList" method="get">
                        <div class="cc_top_one clearfix"><label>用户组名称:</label><input type="text" name="groupName" value="{{$groupName}}"/ id="user_group_name"></div>
                         <div class="cc_top_one clearfix last_show"><label>角色名称:</label>
                          <dl class="select">
                                 
                         <select name="roleId" class="select3">
							<option value="">请选择</option>
							{{foreach from =$role_list item=list}}
							<option value="{{$list.roleId}}"  {{if $roleId==$list.roleId}}selected="selected"{{/if}}>{{$list.roleName}}</option>
																			{{/foreach}}
																			</select></dl></div> 
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
                        <th>用户组名称</th>
                        <th>角色名称</th>
                        <th>描述</th>
                        <th>创建时间</th>
                        <th>创建人</th>
                        <th>操作</th>
                        
                        
                      </tr>
					  {{foreach from=$group_list item=list}}
                      <tr>
                        <td>{{$list.groupName}}</td>
                        <td>{{$list.roleName}}</td>
                        <td>{{$list.desc}}</td>
                        <td>{{$list.creatTime|date_format:"Y-m-d"}}</td>
                        <td>{{$list.userName}}</td>
                        <td>
                        	<a  class="revamp" onclick="get_info({{$list.groupId}})">修改</a>
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
	<div class="tit clearfix"><h4>新增用户组</h4><a class="no_text close" href="javascript:;" title="关闭">关闭</a></div>
	<div class="content">
		<div class="login_main">
			<div class="login_form">
                <div class="clearfix one"><label for="user_name">用户组名称:</label><input type="text" id="groupName" class="zhmm"></div>
                <div class="clearfix one"><label for="user_name">角色名称:</label>
                <div class="choice_count choice_box vocation">
                        <dl class="select">
                <select id="roleId" class="select1">
																					<option value="">请选择</option>
																		{{foreach from =$role_list item=list}}
																						<option value="{{$list.roleId}}"  {{if $roleId==$list.roleId}}selected="selected"{{/if}}>{{$list.roleName}}</option>
																				{{/foreach}}
																			</select>
                                                                            </dl></div>
                                                                            
                                                                            </div>
                <div class="clearfix one"><label for="user_name">描述:</label><textarea id="desc"></textarea></div>
                <a href="javascript:;" id="confirm_btn" class="confirm_btn" onclick="addUserGroup()">确认</a>
            </div>
	   </div>
    </div>
</div>

<!-- 编辑用户组弹出层 开始-->
<div class="newuser_pop" id="newuser_pop_revamp">
	<div class="tit clearfix"><h4>修改用户组</h4><a class="no_text close" href="javascript:;" title="关闭">关闭</a></div>
	<div class="content">
		<div class="login_main">
			<div class="login_form"><input type="hidden" id="ed_groupId" />
                <div class="clearfix one"><label for="user_name">用户组名称:</label><input type="text" id="up_groupName" class="zhmm" readonly=""></div>
                <div class="clearfix one"><label for="user_name">角色名称:</label>
                <div class="choice_count choice_box vocation">
                        <dl class="select">
                
                <select id="up_roleId" class="select1">
																					<option value="">请选择</option>
																		{{foreach from =$role_list item=list}}
																						<option value="{{$list.roleId}}"  {{if $roleId==$list.roleId}}selected="selected"{{/if}}>{{$list.roleName}}</option>
																				{{/foreach}}
																			</select></dl></div></div>
                <div class="clearfix one"><label for="user_name">描述:</label><textarea id="up_desc"></textarea></div>
                <a href="javascript:;" id="confirm_btn" class="confirm_btn" onclick="edit_info()">确认</a>
            </div>
	   </div>
    </div>
</div>
{{include file='public/js.tpl'}}
<script  type="text/javascript">
$(function(){	


	//select 表单美化
	/*$(".select3").uedSelect({
		width : 100
	});
	 $(".select1").uedSelect({
		width :250			  
	});*/
	
	//左侧菜单显示
	
	var url = window.location;
	$('.user_manager dd a').filter(function (){
        return this.href == url || url.href.indexOf(this.href) == 0;
    }).parents('dd').addClass('active').siblings().removeClass('active');
	$(".leftsidebar_box .user_manager dd").show();
});
	function addUserGroup(){
		var groupName=$("#groupName").val();
		var desc=$("#desc").val();
		var roleId=$("#roleId").val();
		$.post("{{$root_path}}user/addGroup",{"groupName":groupName,"desc":desc,"roleId":roleId},
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
	
	function get_info(groupId){
		$.post("{{$root_path}}user/groupInfo",{"groupId":groupId},
						function(data){

							var dataObj=eval("("+data+")");
							if(dataObj.msgCode>0){
								alert(dataObj.msg);
								window.location.reload();
							}
							$("#up_groupName").val(dataObj.groupName);
							$("#up_roleId").val(dataObj.roleId);
							$("#up_desc").html(dataObj.desc);
							$("#ed_groupId").val(dataObj.groupId);

						},
		  "text");
	}
	
	function edit_info(){
		var roleId=$("#up_roleId").val();
		var groupId=$("#ed_groupId").val();
		var desc=$("#up_desc").val();
		$.post("{{$root_path}}user/editGroup",{"roleId":roleId,"groupId":groupId,"desc":desc},
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
		  	},"text");
	}
	//清空
	/*function btn_empty(){
		$("#user_group_name").val("");
		$(".cc_top_one select").val("");
	}*/
</script>

</body>
</html>
