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
            	<h3>项目成员管理 <a href="javascript:;" id="new_user" class="new_user"><i class="iconfont">&#xf018b;</i>新增</a></h3>
                <div class="rose_top main_rignt_top clearfix">
                    <form action="{{$root_path}}project/projectUserManager" id="myform">

                            <div class="cc_top_one last_show"><label>项目名称:</label>
                                <div class="choice_count choice_box vocation">
                                    <dl class="select">
                                        <select name="pId" class="select3">
                                            <option value="">全部</option>
                                            {{foreach from=$project_list item=list}}
                                            <option value="{{$list.pId}}" {{if $pId==$list.pId}}selected="selected"{{/if}}>{{$list.pName}}</option>
                                            {{/foreach}}
                                        </select>
                                    </dl>
                                </div>
                            </div>

                        <div class="cc_top_one clearfix last_show"><label>用户名:</label>
                          <div class="choice_count choice_box vocation">
                                <dl class="select">
                                    <select name="username" class="username select3">
                                    		<option value="">请选择</option>
                                     {{foreach from =$userList item=list}}
                                                <option value="{{$list.userId}}" {{if $list.userId==$username}}selected="selected"{{/if}}>{{$list.trueName}}</option>
                                         {{/foreach}}
										</select>
                                    </dl>
                            </div>
                        </div> 
                        <div class="cc_top_one clearfix last_show"><label>状态:</label>
                          <div class="choice_count choice_box vocation">            	 			
                                <dl class="select">
                                    <select name="status" class="status select3">
											<option value="">请选择</option>
                                        <option value="1" {{if $status==1}}selected="selected"{{/if}}>正常</option>
                                        <option value="2" {{if $status==2}}selected="selected"{{/if}}>冻结</option>
										</select>
                                    </dl>
                            </div>
                        </div>
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
                        <th>序号</th>
                        <th>项目名称</th>
                          <th>用户名</th>
                          <th>用户角色</th>
                        <th>描述</th>
                        <th>状态</th>
                        <th>创建时间</th>
                        <th>创建人</th>
                        <th>修改时间</th>
                        <th>修改人</th>
                        <th>操作</th>
                      </tr>
                        {{foreach from =$plist item=list}}
                        <tr>
                            <td>{{$list.lId}}</td>
                            <td>{{$list.pName}}</td>
                            <td>{{$list.userName}}</td>
                            <td>{{$list.roleName}}</td>
                            <td>{{$list.desc}}</td>
                            <td class="status_val_{{$list.projectId}}">{{if $list.userStatus==1}}正常{{else}}已冻结{{/if}}</td>
                            <td>{{$list.creatTime|date_format:"Y-m-d H:i:s"}}</td>
                            <td>{{$list.createName}}
                                </td>
                            <td>{{$list.updateTime|date_format:"Y-m-d H:i:s"}}</td>
                            <td>{{$list.updateName}}</td>
                            <td>
                                <a href="javascript:;" onclick="update_status({{$list.pId}},{{$list.userStatus}},{{$list.userId}})" class="status_{{$list.pId}}">{{if $list.userStatus==1}}冻结{{else}}解冻{{/if}}</a>
                            </td>
                            <input type="hidden" id="project_{{$list.pId}}" value="{{$list.status}}">
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
     </div>		
</div>
<!-- 新建用户弹出层 开始-->
<div class="newuser_pop" id="newuser_pop">
	<div class="tit clearfix"><h4>项目维护</h4><a class="no_text close" href="javascript:;" title="关闭">关闭</a></div>
	<div class="content">
		<div class="login_main">
			<div class="login_form">
                <div class="clearfix one" ><label for="user_name">项目:</label>
                    <div class="choice_count choice_box vocation">
                        <dl class="select">
                            <select name="pId" class="select1" id="pIds">
                                <option value="">全部</option>
                                {{foreach from=$project_list item=list}}
                                <option value="{{$list.pId}}" {{if $pId==$list.pId}} selected="selected"{{/if}}>{{$list.pName}}</option>
                                {{/foreach}}
                            </select>
                        </dl>
                    </div>
                </div>
                <div class="clearfix one"><label for="user_name">用户角色:</label> 
                	<div class="choice_count choice_box vocation">
                        <dl class="select">
                            <select name="username" id="roles" onchange="role_change()" class="select1">
                                <option value="">请选择</option>
                             {{foreach from =$rList item=list}}
                                <option value="{{$list.roleId}}">{{$list.roleName}}</option>
                             {{/foreach}}
                            </select>
                        </dl>
                    </div></div>
                <div class="clearfix one"><label for="user_name">用户名:</label>
                 <div class="choice_count choice_box vocation">
                        <dl class="select">
                            <select name="username" id="usernames" class="select1">
                                <option value="">请选择</option>
                            </select>
                        </dl>
                    </div></div>
                <div class="clearfix one"><label for="user_name">描述:</label><textarea id="describes"></textarea></div>
                <a href="javascript:;" id="confirm_btn" class="confirm_btn" onclick="addProjectUser()">确认</a>
            </div>
	   </div>
    </div>
</div>
{{include file='public/js.tpl'}}
<script type="text/javascript">
$(function(){
    //分页表单提交
    $("#submits").on("click",function(){
        var action=$("#form").attr("action")+"&page="+$("input[name='page']").val();
        $("#form").attr("action",action);
        $("#form").submit();
    });
	
	
	//系统管理
	var url = window.location;
	$('.user_manager dd a').filter(function (){
        return this.href == url || url.href.indexOf(this.href) == 0;
    }).parents('dd').addClass('active').siblings().removeClass('active');
	$(".leftsidebar_box .user_manager dd").show();

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
//根据角色获取用户
function role_change(){
    $("#usernames").val('');
    var roleId=$("#roles").val();
    var option="<option>请选择</option>";
    //alert(roleId);
    if(roleId!=""){
        var data={roleId:roleId};
        $.post("{{$root_path}}project/getUserListByRole",data,function(data){
            for(var i in data){
                option+="<option value=\'"+data[i].userId+"\'>"+data[i].userName+"</option>";
            }
            $("#usernames").html(option);
        },'json')
    }else{
        $("#usernames").html(option);
    }
}
function update_status(projectId,status,upUserId){
    if(status==undefined){
        status=2;
    }
    var   status_e;
    var msg=['','确定要冻结该用户吗','你确定要解冻改用户吗'];
    if(confirm(msg[status])){
        if(status==1){
            status_e=2;
        }
        else if(status===2){
            status_e=1;
        }else{
            status_e=1;
        }
        var  data={projectId:projectId,status:status_e,upUserId:upUserId};
        //ajax
        $.post("{{$root_path}}project/updateProjectUserStatus",data,function(e){
            if(e.msgCode==0){
                alert(e.msgText);
                window.location.reload();
            }else{
                alert("操作失败")
            }
        },'json')
    }
}
function addProjectUser(){
    var roleId=$("#roles").val();
    var userId=$("#usernames").val();
    var projectName=$("#pIds").val();
    var describe=$("#describes").val();
    var data={pIds:projectName,describe:describe,roleId:roleId,userId:userId};
    $.post("{{$root_path}}project/addProjectUser",data,
            function(data){
                if(data){
                   alert('添加成功');
                    window.location.reload();
                }else{
                    alert('添加失败');
                }
            },'json');
}
function btn_empty(){
    $(".project").val("");
    $(".cc_top_one select,.select3").val("")
    $(".uew-select-text").html('全部');
}
</script>
</body>
</html>
