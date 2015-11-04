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
                            <a href="javascript:;" id="new_user">新增</a>
                            <input type="submit" value="查询" />
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
                        <td>{{$list.creatTime|date_format}}</td>
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
                
				
               <div class="notes">
                    <P>注意事项：</P>
                    <P>新增时，账户名不可重复，密码为123456，密码状</P>
                    <P>态为初始密码，进入系统弹出修改密码页面；</P>
                    <P>修改时，账户名不可修改</P>
                    <P>冻结：状态为为冻结状态，用户不可登陆系统；</P>
                    <P>正常：状态变为正常，用户可正常使用系统；</P>
                    <P>重置密码：密码为123456，密码状态为初始密码，</P>
                    <P>进入系统弹出修改密码页面。</P>
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
				<div class="clearfix one"><label for="user_name">账号名:</label><input type="text" id="" class="zhmm"></div>
                <div class="clearfix one"><label for="user_name">用户名:</label><input type="text" id="" class="zhmm"></div>
                <div class="clearfix one"><label for="user_name">角色名称:</label><input type="text" id="" class="zhmm"></div>
                <div class="clearfix one"><label for="user_name">用户组名称:</label><input type="text" id="" class="zhmm"></div>
                <div class="clearfix one"><label for="user_name">描述:</label><textarea></textarea></div>
                <a href="javascript:;" id="confirm_btn" class="confirm_btn">确认</a>
            </div>
	   </div>
    </div>
</div>
{{include file='public/js.tpl'}}


</body>
</html>
