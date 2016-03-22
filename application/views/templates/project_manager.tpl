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
            	<h3>项目管理 <a href="javascript:;" id="new_user" class="new_user"><i class="iconfont">&#xf018b;</i>新增</a></h3>
                <div class="rose_top main_rignt_top clearfix">
                    <form action="{{$root_path}}project/projectManager" id="myform">
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
                        <div class="cc_top_one clearfix last_show"><label>状态:</label>
                          <div class="choice_count choice_box vocation">            	 			
                                <dl class="select">
                                    <select name="status" class="select3">
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
                            <a href="javascript:;"  onclick="btn_empty()"><i class="iconfont">&#xf014a;</i>清空</a>
                        </div>
                    </form>
                        <div class="clearfix"></div>
                        <div class="tab_box">
                    <table>
                      <tr>
                        <th>序号</th>
                        <th>项目名称</th>
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
                        <td>{{$list.desc}}</td>
                        <td class="status_val_{{$list.pId}}">{{if $list.status==1}}正常{{else}}已冻结{{/if}}</td>
                        <td>{{$list.creatTime|date_format:"Y-m-d H:i:s"}}</td>
                        <td>{{$list.createName}}</td>
                        <td>{{$list.updateTime|date_format:"Y-m-d H:i:s"}}</td>
                        <td>{{$list.updateName}}</td>
                        <td>
                        	<a href="javascript:;" onclick="update_status({{$list.pId}},{{$list.status}})" class="status_{{$list.projectId}}">{{if $list.status==1}}冻结{{else}}解冻{{/if}}</a>
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
     </div><!--main end-->  		
</div>
<!-- 新建用户弹出层 开始-->
<div class="newuser_pop" id="newuser_pop">
	<div class="tit clearfix"><h4>项目维护</h4><a class="no_text close" href="javascript:;" title="关闭">关闭</a></div>
	<div class="content">
		<div class="login_main">
			<div class="login_form">
				<div class="clearfix one"><label for="user_name">项目名称:</label><input type="text" id="projectName" class="zhmm"></div>
                <div class="clearfix one"><label for="user_name">描述:</label><textarea id="describe"></textarea></div>
                <a href="javascript:;" id="confirm_btn" class="confirm_btn" onclick="addProject()">确认</a>
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
	
	//侧栏菜单美化
	var url = window.location;
    $('.system_log dd a').filter(function (){
        return this.href == url || url.href.indexOf(this.href) == 0;
    })
    .parents('dd').addClass('active').siblings().removeClass('active');
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
function update_status(projectId,status){
//     var status=$("#project_"+projectId).val();
    if(status==undefined){
        status=2;
    }
    var   status_e;
    var msg=['','确定要冻结该项目吗','你确定要解冻改用户吗'];
        if(confirm(msg[status])){
            if(status==1){
             status_e=2;
            }
            else if(status===2){
             status_e=1;
            }else{
             status_e=1;
            }
            var  data={projectId:projectId,status:status_e};
            //ajax
            $.post("{{$root_path}}project/updateProjectStatus",data,function(e){
                if(e.msgCode==0){
                    alert(e.msgText);
                    window.location.reload();
                    if(status==1){
                        $("#project_"+projectId).val('2');
                        $(".status_"+projectId).html('解冻');
                        $(".status_val_"+projectId).html('已冻结');
                    }
                    if(status==2){
                        $("#project_"+projectId).val('1');
                        $(".status_"+projectId).html('冻结');
                        $(".status_val_"+projectId).html('正常');
                    }
                }else{
                    alert("操作失败")
                }
            },'json')
        }
}
function addProject(){
    var projectName=$("#projectName").val();
    var describe=$("#describe").val();
    var data={project:projectName,describe:describe};
    $.post("{{$root_path}}project/addProject",data,
            function(data){
                alert(data.msgText);
                window.location.reload();
            },'json');
}
function btn_empty(){
    $(".project").val("");
    $(".cc_top_one select,.select3").val("");
    $(".uew-select-text").html('全部');
}
</script>	


</body>
</html>
