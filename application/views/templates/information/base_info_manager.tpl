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
            	<h3>基本信息管理<a href="javascript:;" id="new_user" class="new_user"><i class="iconfont">&#xf018b;</i>新增</a></h3>
                <div class="rose_top main_rignt_top clearfix">
                    <form action="{{$root_path}}information/baseInfoManager">
                	<div class="cc_top_one last_show"><label>商品类型:</label>
                        <div class="choice_count choice_box vocation">
                            <dl class="select">
                                <select name="catId" class="select3">
                                    <option value="">全部</option>
                                    {{foreach from=$type_list item=list}}
                                    <option value="{{$list.id}}" {{if $catId==$list.id}}selected="selected"{{/if}}>{{$list.name}}</option>
                                    {{/foreach}}
                                </select>
                            </dl>
                        </div>
                     </div>
                        <div class="cc_top_one last_show"><label>录入分类:</label>
                            <div class="choice_count choice_box vocation">
                                <dl class="select">
                                    <select name="filedType" class="select3">
                                        <option value="">全部</option>
                                        <option value="1" {{if $filedType==1}}selected="selected"{{/if}}>基本信息</option>
                                        <option value="2" {{if $filedType==2}}selected="selected"{{/if}}>扩充信息</option>
                                    </select>
                                </dl>
                            </div>
                        </div>
                    <div class="cc_top_one"><label>字段属性:</label><input type="text" value="{{$fieldName}}" name="fieldName"/></div>
                     <div class="cc_top_one last_show"><label>状态:</label>
                            <div class="choice_count choice_box vocation">            	 			
                                <dl class="select">
                                    <select class="select3" name="status">
                                   		<option value="">全部</option>
                                        <option value="1" {{if $status==1}}selected="selected"{{/if}}>正常</option>
                                        <option value="2" {{if $status==2}}selected="selected"{{/if}}>冻结</option>
                                   </select>
                                </dl>
                            </div>
                     </div>
                                         
                    <div class="clearfix"></div>
                    <div class="cc_top_two" style="margin-left:12px; display:inline;">
                        <span class="query"><i class="icon iconfont">&#xf00a8;</i><input type="submit" value="查询"></span>
                        <a href="javascript:;" onclick="btn_empty()"><i class="iconfont" >&#xf014a;</i>清空</a>
                    </div>
                    </form>
                   	<div class="clearfix"></div>
                	<div class="tab_box">
                    <table>
                      <tr>
                        <th>序号</th>
                        <th>商品类型</th>
                          <th>录入分类</th>
                        <th>字段属性</th>
                        <th>数量</th>
                        <th>输入类型</th>
                        <th>排序</th>
                        <th>状态</th>
                        <th>描述</th>
                        <th>创建时间</th>
                        <th>操作</th>
                        
                      </tr>
                        {{foreach from= $glist item=list}}
                        <tr>
                            <td>{{$list.lId}}</td>
                            <td>{{$list.catName}}</td>
                            <td>{{if $list.filedType==1}}基本信息{{else}}扩充信息{{/if}}</td>
                            <td>{{$list.fieldName}}</td>
                            <td>{{$list.isNums}}</td>
                            <td>{{if $list.inputType==1}}短文字{{else if $list.inputType==2}}长文字{{else if $list.inputType==3}}下拉{{/if}}</td>
                            <td>{{$list.sort}}</td>
                            <td>{{if $list.status==1}}正常{{else if $list.status==2}}冻结{{/if}}</td>
                            <td>{{$list.desc}}</td>
                            <td>{{$list.createTime|date_format:"Y-m-d H:i:s"}}</td>
                            <td><a href="javascript:;" onclick="changeStatus({{$list.field}},{{$list.status}})">{{if $list.status==1}}冻结{{else if $list.status==2}}解冻{{/if}}</a></td>
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
	<div class="tit clearfix"><h4>基本信息维护</h4><a class="no_text close" href="javascript:;" title="关闭">关闭</a></div>
	<div class="content">
		<div class="login_main">
			<div class="login_form">
				<div class="clearfix one"><label for="user_name">商品类型:</label>
                <div class="choice_count choice_box vocation">
                        <dl class="select">
                            <select id="catId" class="select3" >
                            <option value="">请选择</option>
                            {{foreach from=$type_list item=list}}
                            <option value="{{$list.id}}">{{$list.name}}</option>
                            {{/foreach}}
                            </select>
                        </dl>
                </div>
                </div>
                <div class="clearfix one"><label for="user_name">录入类型:</label>
                    <div class="choice_count choice_box vocation">
                        <dl class="select">
                            <select class="select1" id="fieldType">
                                <option value="">请选择</option>
                                <option value="1">基本成分</option>
                                <option value="2">扩充成分</option>

                            </select>
                        </dl>
                    </div>
                </div>
                <div class="clearfix one"><label for="user_name">字段属性:</label><input type="text" id="fieldName" class="zhmm "></div>
                <div class="clearfix one"><label for="user_name">数量:</label>
                 	<div class="choice_count choice_box vocation">
                        <dl class="select">
                            <select class="select1" id="isNums">
                                <option value="">请选择</option>
                                <option value="1">1个</option>
                                <option value="2">多个</option>
                            </select>
                        </dl>
                    </div>
                </div>
                <div class="clearfix one"><label for="user_name">输入类型:</label>
                <div class="choice_count choice_box vocation">
                        <dl class="select">
               					 <select class="select1" id="inputType">
                                   		<option value="">请选择</option>
                                        <option value="1">短文字</option>
                                        <option value="2">长文字</option>
                                        <option value="3">下拉</option>
                                   </select>
                        </dl>
                </div>
                </div>
                <div class="clearfix one"><label for="user_name">排序:</label><input type="text" id="sort" class="zhmm"></div>
                <div class="clearfix one"><label for="user_name">描述:</label><textarea id="desc"></textarea></div>
                <a href="javascript:;" id="confirm_btn" class="confirm_btn" onclick="check()">保存</a>
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
	//左侧菜单显示
    var url = window.location;
    $('.menu_base_info dd a').filter(function (){
        return this.href == url || url.href.indexOf(this.href) == 0;
    })
    .parents('dd').addClass('active').siblings().removeClass('active');
    $(".leftsidebar_box .menu_base_info dd").show();

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
function check(){
    var desc=$("#desc").val();
    var sort=$("#sort").val();
    var inputType=$("#inputType").val();
    var isNums=$("#isNums").val();
    var fieldName=$("#fieldName").val();
    var catId=$("#catId").val();
    var filedType=$("#fieldType").val();
    //验证
    $.ajax({
        url:'{{$root_path}}information/addBaseInfo',
        data:{desc:desc,isNums:isNums,sort:sort,filedType:filedType,catId:catId,inputType:inputType,fieldName:fieldName},
        dataType:'json',
        type:'post',
        success:function(e){
            if(e.msg=="fieldName重复"){
                alert("\'"+fieldName+"\'已存在,不能重复添加")
            }else{
                alert(e['msg']);
                window.location.reload();
            }

        }
    })
}
function changeStatus(id,status){
    var msg=['','你确定要冻结吗','你确定要解冻吗']
    if(!confirm(msg[status])){
        return false;
    }
    if(status==1){
        status=2
    }else{
        status=1
    }
    $.ajax({
        url:'{{$root_path}}information/changeBaseStatus',
        data:{field:id,status:status},
        dataType:'json',
        type:'post',
        success:function(e){

            alert(e.msg);
            window.location.reload();
        }
    })
}
function btn_empty() {
    $("input[name='field']").val("");
    $(".select3").val("");
    $(".uew-select-text").html('全部');
}
</script>	

</body>
</html>
