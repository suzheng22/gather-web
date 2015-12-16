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
            	<h3>无法拍摄管理</h3>
                <div class="rose_top main_rignt_top clearfix">
                    <form action="{{$root_path}}shoot/noShoot" id="myform">
                	 <div class="cc_top_one last_show "><label>项目名称:</label>
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
                                <select name="type" class="select3">
                                    <option value="">全部</option>
                                 {{foreach from=$type_list item=list}}
                                    <option value="{{$list.id}}" {{if $type==$list.id}}selected="selected"{{/if}}>{{$list.name}}</option>
                                 {{/foreach}}
                                </select>
                            </dl>
                        </div>
                    </div>
                     <div class="cc_top_one" style="width:50%">
                            <label>加入时间:</label>
                            <input type="text" id="datetimepicker_start" name="sTime" value="{{$sTime}}"/>
                            <label style="width:20px;">-</label>
                            <input type="text" id="datetimepicker_end" name="eTime" value="{{$eTime}}"/>
                        </div>
                      <div class="clearfix"></div> 
                    <div class="cc_top_two" style="margin-left:12px; display:inline;">
                    	<a href="{{$root_path}}shoot/noShoot?is_ext=1" class="query"><i class="icon iconfont">&#xf0220;</i>导出</a>
                        <span class="query"><i class="icon iconfont">&#xf00a8;</i><input type="submit" value="查询"></span>
                        <a href="javascript:;" onclick="btn_empty()"><i class="iconfont">&#xf014a;</i>清空</a>
                    </div>
                    </form>
                   	<div class="clearfix"></div>
                	<div class="tab_box">
                    <table>
                      <tr>
                        <th>序号</th>
                        <th>商品条形码</th>
                        <th>商品名称</th>
                        <th>商品分类</th>
                        <th>项目名称</th>
                        <th>加入时间</th>
                        <th>拍摄人</th>
                      </tr>
                        {{foreach from=$slist item=list}}
                        <tr class="t_{{$list.gtin}}">
                            <td>{{$list.lId}}</td>
                            <td>{{$list.gtin}}</td>
                            <td>{{$list.gName}}</td>
                            <td>{{$list.catName}}</td>
                            <!-- 新增字段 -->
                            <td>{{$list.pName}}</td>
                            <td>{{$list.creatTime|date_format:"Y-m-d H:i:s"}}</td>
                            <td>{{$list.shootName}}</td>
                            <!-- 新增字段 -->
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

{{include file='public/js.tpl'}}
<!--时间控件-->
<link rel="stylesheet" type="text/css" href="{{$resource_url}}js/time/jquery.datetimepicker.css"/>
<script type="text/javascript" src="{{$resource_url}}js/time/jquery.datetimepicker.js"></script>
<script type="text/javascript">


	//select 表单美化
	$(".select3").uedSelect({
		width : 100
	});
$('#datetimepicker_start').datetimepicker({
	onGenerate:function( ct ){
		$(this).find('.xdsoft_date')
			.toggleClass('xdsoft_disabled');
	},
		format:'d/m/Y',
	formatDate:'Y/m/d',
	minDate:'-1970/01/2',
	maxDate:'+1970/01/2',
	timepicker:false
});
$('#datetimepicker_end').datetimepicker({
	onGenerate:function( ct ){
		$(this).find('.xdsoft_date')
			.toggleClass('xdsoft_disabled');
	},
		format:'d/m/Y',
	formatDate:'Y/m/d',
	minDate:'-1970/01/2',
	maxDate:'+1970/01/2',
	timepicker:false
});
function btn_empty(){
    $(".proName,.gtin").val("");
    $("#datetimepicker_start").val("");
    $("#datetimepicker_end").val("");
    $(".cc_top_one select").val("");
}
</script>
</body>
</html>
