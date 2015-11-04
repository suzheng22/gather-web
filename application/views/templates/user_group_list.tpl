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
            	<h3>用户组管理</h3>
                <div class="rose_top main_rignt_top clearfix">
				<form action="{{$root_path}}user/userGroupList" method="get">
                        <p class="cc_top_one clearfix"><label>用户组名称:</label><input type="text" name="groupName" value="{{$groupName}}"/></P>
                        <p class="cc_top_one clearfix"><label>角色名称:</label><select name="roleId">
																					<option value="">请选择</option>
																					{{foreach from =$role_list item=list}}
																						<option value="{{$list.roleId}}"  {{if $roleId==$list.roleId}}selected="selected"{{/if}}>{{$list.roleName}}</option>
																					{{/foreach}}
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
                        <td>123</td>
                        <td>{{$list.desc}}</td>
                        <td>{{$list.creatTime|date_format:"Y-m-d"}}</td>
                        <td>创建人</td>
                        <td>
                        	<a href="javascript;">删除</a>
                        	<a href="javascript;">修改</a>
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
{{include file='public/js.tpl'}}


</body>
</html>
