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
            	<h3>营养成分<a href="javascript:;" id="new_user" class="new_user"><i class="iconfont">&#xf018b;</i>新增</a></h3>
                <div class="rose_top main_rignt_top clearfix">
                	<form action="{{$root_path}}information/nutrientInfo">
                    <div class="cc_top_one"><label>成分名称:</label><input type="text" name="nutritionName" value="{{$nutritionName}}"/></div>
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
                        <a href="javascript:;" class="clear_all" onclick="btn_empty()"><i class="iconfont">&#xf014a;</i>清空</a>
                    </div>
                    </form>
                   	<div class="clearfix"></div>
                	<div class="tab_box">
                    <table>
                      <tr>
                        <th>序号</th>
                        <th>成分名称</th>
                        <th>成分单位(中)</th>
                        <th>成分单位(英文)</th>
                        <th>状态</th>
                        <th>是否默认</th>
                        <th>描述</th>
                        <th>创建时间</th>
                        <th>操作</th>
                        
                      </tr>
                        {{foreach from=$glist item=list}}
                        <tr>
                            <td>{{$list.lId}}</td>
                            <td>{{$list.nutritionName}}</td>
                            <td>{{$list.nutritionUnit}}</td>
                            <td>{{$list.nutritionUnitEn}}</td>
                            <td>{{if $list.status==1}}正常{{else if $list.status==2}}冻结{{/if}}</td>
                            <td>{{if $list.isDefault}}是{{else}}否{{/if}}</td>
                            <td>{{$list.desc}}</td>
                            <td>{{$list.createTime|date_format:"Y-m-d H:i:s"}}</td>
                            <td><a href="#" onclick="changeStatus({{$list.nutritionId}},{{$list.status}})">{{if $list.status==1}}冻结{{else if $list.status==2}}解冻{{/if}}</a></td>
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
	<div class="tit clearfix"><h4>营养成分维护</h4><a class="no_text close" href="javascript:;" title="关闭">关闭</a></div>
	<div class="content">
		<div class="login_main">
			<div class="login_form">
                <div class="clearfix one"><label for="user_name">成分名称:</label><input type="text" id="nutritionName" class="zhmm"></div>
                <div class="clearfix one"><label for="user_name">成分单位(中):</label><input type="text" id="nutritionUnit" class="zhmm"></div>
                <div class="clearfix one"><label for="user_name">成分单位(英):</label><input type="text" id="nutritionUnitEn" class="zhmm"></div>
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
//    $(".clear_all").on("click",function(){
//        alert(1234);
//    });
		//select 表单美化
	$(".select3").uedSelect({
		width : 100
	});
	 $(".select1").uedSelect({
		width :250			  
	});
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
    var nutritionName=$("#nutritionName").val();
    var nutritionUnit=$("#nutritionUnit").val();
    var nutritionUnitEn=$("#nutritionUnitEn").val();
    var sort=$("#sort").val();
    //验证
    $.ajax({
        url:'{{$root_path}}information/addNutrient',
        data:{desc:desc,nutritionName:nutritionName,sort:sort,nutritionUnit:nutritionUnit,nutritionUnitEn:nutritionUnitEn},
        dataType:'json',
        type:'post',
        success:function(e){
            if(e.msg=="nutritionName重复"){
                alert("营养成分名称重复，不能添加");
            }else{
                alert(e.msg);
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
        status=2;
    }else{
        status=1;
    }
    $.ajax({
        url:'{{$root_path}}information/changeNutrientStatus',
        data:{nutritionId:id,status:status},
        dataType:'json',
        type:'post',
        success:function(e){
            alert(e.msg);
            window.location.reload();
        }
    })
}

function btn_empty() {
    $("input[name='nutritionName']").val("");
    $(".select3").val("");
    $(".uew-select-text").html('全部');
}

</script>	

</body>
</html>
