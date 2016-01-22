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
            	<h3>拍摄驳回管理</h3>
                <div class="rose_top main_rignt_top clearfix">
                    <form id="{{$root_path}}marlboro/shootBackDetail">
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
                    <div class="cc_top_one"><label>商品条形码:</label><input type="text" name="gtin" value="{{$gtin}}" class="gtin"/></div>
                    <div class="cc_top_one"><label>商品名称:</label><input type="text" name="proName" value="{{$proName}}" class="proName"/></div>
                    <div class="cc_top_one last_show"><label>商品分类:</label>
                        <div class="choice_count choice_box vocation">
                            <dl class="select">
                                <select name="catgrory1" class="select3">
                                    <option value="">全部</option>
                                  {{foreach from=$type_list item=list}}
                                    <option value="{{$list.id}}" {{if $catgrory1==$list.id}}selected="selected"{{/if}}>{{$list.name}}</option>
                                  {{/foreach}}
                                </select>
                            </dl>
                        </div>
                    </div>
                     <div class="cc_top_one" style="width:50%">
                            <label>驳回时间:</label>
                         <input type="text" id="datetimepicker_start" name="s_time" value="{{$s_time}}"/>
                         <label style="width:20px;">-</label>
                         <input type="text" id="datetimepicker_end" name="e_time" value="{{$e_time}}"/>
                        </div>
                    <div class="cc_top_one last_show"><label>状态:</label>
                        <div class="choice_count choice_box vocation">
                            <dl class="select">
                                <select name="chuliStatus" class="select3">
                                    <option value="">全部</option>
                                    <option value="1" {{if $chuliStatus==1}}selected="selected"{{/if}}>未处理</option>
                                    <option value="2" {{if $chuliStatus==2}}selected="selected"{{/if}}>已处理</option>
                                </select>
                            </dl>
                        </div>
                    </div>
                      <div class="clearfix"></div> 
                    <div class="cc_top_two" style="margin-left:12px; display:inline;">
                    	<a href="{{$root_path}}shoot/shootBackDetail?is_ext=1" class="query"><i class="icon iconfont">&#xf0220;</i>导出</a>
                        <span class="query"><i class="icon iconfont">&#xf00a8;</i><input type="submit" value="查询"></span>
                        <a href="javascript:;" onclick="btn_empty()"><i class="iconfont">&#xf014a;</i>清空</a>
                    </div>
                    </form>
                   	<div class="clearfix"></div>
                	<div class="tab_box">
                    <table>
                      <tr>
                        <th>序号</th>
                        <th>项目名称</th>
                        <th>商品条形码</th>
                        <th>商品名称</th>
                        <th>商品分类</th>
                        <th>包装</th>
                        <th>批次</th>
                        <th>驳回原因</th>
                        <th>驳回时间</th>
                        <th>处理状态</th>
                      </tr>
                        {{foreach from=$slist item=list}}
                      <tr>
                        <td>{{$list.lId}}</td>
                        <td>{{$list.pName}}</td>
                        <td>{{$list.gtin}}</td>
                        <td>{{$list.gName}}</td>
                        <td>{{$list.catName}}</td>
                        <td>包装{{$list.packet}}</td>
                        <td>批次{{$list.batchNo}}</td>
                        <td>{{$list.memo}}</td>
                        <td>{{$list.creatTime|date_format:"Y-m-d H:i:s"}}</td>
                        <td>{{if $list.status==1}}{{else if $list.status==2}}已处理{{else if $list.status==3}}未处理{{/if}}</td>
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
<!-- 拍摄新增维护 开始-->
<div class="newuser_pop" id="newuser_pop">
	<div class="tit clearfix"><h4>拍摄新增维护</h4><a class="no_text close" href="javascript:;" title="关闭">关闭</a></div>
	<div class="content">
		<div class="login_main">
			<div class="login_form">
				<div class="clearfix one"><label for="user_name">商品条形码:</label><input type="text" id="" class="zhmm"></div>
                <div class="clearfix one"><label for="user_name">商品名称:</label><input type="text" id="" class="zhmm"></div>
                <div class="clearfix one"><label for="user_name">项目:</label>
                <div class="choice_count choice_box vocation">
                        <dl class="select">
                <select class="select1">
                                   		<option value="">全部</option>
                                        <option value="">1</option>
                                        <option value="">2</option>
                                   </select></dl></div></div>
                <div class="clearfix one"><label for="user_name">包装:</label>
                <div class="choice_count choice_box vocation">
                        <dl class="select">
                
                <select class="select1">
                                   		<option value="">全部</option>
                                        <option value="">1</option>
                                        <option value="">2</option>
                                   </select></dl></div></div>
                <div class="clearfix one"><label for="user_name">描述:</label><textarea></textarea></div>
                <a href="javascript:;" id="confirm_btn" class="confirm_btn">确认</a>
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
function btn_empty(){
    $(".proName,.gtin").val("");
    $("#datetimepicker_start").val("");
    $("#datetimepicker_end").val("");
    $(".cc_top_one select").val("");
    $(".uew-select-text").html('全部');
}
</script>
</body>
</html>
