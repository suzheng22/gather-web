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
            	<h3>拍摄统计</h3>
                <div class="rose_top main_rignt_top clearfix">
                	<div class="cc_top_one"><label>用户名:</label><input type="text" name="userName" value="{{$userName}}" id="user_name"/></div>
                    <div class="cc_top_one last_show"><label>用户组:</label>
                            <div class="choice_count choice_box">            	 			
                                <dl class="select">
                                    <select name="groupId">
										<option value="">全部</option>
										{{foreach from=$group_list item=list}}
												<option value="{{$list.groupId}}" {{if $groupId==$list.groupId}}selected="selected"{{/if}}>{{$list.groupName}}</option>
										{{/foreach}}
									</select>
                                </dl>
                            </div>
                        </div>
                     <div class="cc_top_one" style="width:40%;">
                            <label>拍摄开始时间:</label>
                            <input type="text" id="datetimepicker_start" name="startTime" value="{{$startTime}}"/>
                            <label style="width:20px;">-</label>
                            <input type="text" id="datetimepicker_end" name="endTime" value="{{$endTime}}"/>
                        </div>
                        <!--<div class="cc_top_one">
                            <label>拍摄结束时间:</label>
                            <input type="text" id="datetimepicker_end" name="endTime" value="{{$endTime}}"/>
                        </div>-->
                    <div class="cc_top_two" style="margin-left:12px; display:inline;">
                    	<a href="record.html" class="query"><i class="icon iconfont">&#xf0220;</i>导出</a>
                        <span class="query"><i class="icon iconfont">&#xf00a8;</i><input type="submit" value="查询" /></span>
                        <a href="javascript:;" onclick="btn_empty()"><i class="iconfont">&#xf014a;</i>清空</a>
                    </div>
                   	<div class="clearfix"></div>
                	<div class="tab_box">
                    <table>
                      <tr>
                        <th>序号</th>
                        <th>用户名</th>
                        <th>用户组</th>
                        <th>拍摄的商品数</th>
                        <th>已拍摄审核的商品数</th>
                        <th>待上传商品数</th>
                        <th>待拍摄审核的商品数</th>
                        <th>已拍摄驳回的商品数</th>
                        
                        
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>asda</td>
                        <td>dsad</td>
                        <td>dasdd</td>
                        <td>dadas</td>
                        <td>审核通过</td>
                        <td>正常</td>
                        <td>
                        	2323
                        </td>
                      </tr>
                       <tr>
                        <td>1</td>
                        <td>asda</td>
                        <td>dsad</td>
                        <td>dasdd</td>
                        <td>dadas</td>
                        <td>审核驳回</td>
                        <td>驳回</td>
                        <td>
                        	111
                        </td>
                      </tr>
                      
                      
                    </table>
                </div>
                	<div class="page_nav" id="page_nav">
                	<a href="javascript:;" class="pageNum">上一页</a>
                    <a href="javascript:;" class="pageNum">1</a>
                    <a href="javascript:;" class="pageNum">2</a>
                    <a href="javascript:;" class="pageNum">3</a>
                    <a href="javascript:;" class="pageNum">4</a>
                    <a href="javascript:;" class="pageNum">5</a>
                    <a href="javascript:;" class="pageNum">6</a>
                    <a href="javascript:;" class="pageNum">7</a>
                    <a href="javascript:;" class="pageNum">8</a>
                    <a href="javascript:;" class="pageNum">9</a>
                    <a href="javascript:;" class="pageNum">下一页</a>
                    <span>共<em>100</em>页,</span>
                    <span>共<em>66</em>条记录,</span>
                    <span>跳转到第<input type="text"/>页</span>
                    <a href="javascript:;" class="pageNum">确定</a>
                </div>
                	<!--<div class="notes">
                    <P>注意事项：</P>
                    <P>新增时，角色编码和角色名称不可重复；</P>
                    <P>修改时，角色编码不可修改，角色编码不可重复</P>
                    <P>删除时，已用在用户组和用户信息的角色不可删除；</P>
               </div>-->
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
$(function(){
	
	//菜单高亮显示和地址栏比对
	var url = window.location;
    $('.system_log dd a').filter(function (){
        return this.href == url || url.href.indexOf(this.href) == 0;
    })
    .parents('dd').addClass('active').siblings().removeClass('active');
	$(".leftsidebar_box .counts dd").show();
	
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
//清空
	function btn_empty(){
		$("#user_name").val("");
		$("#datetimepicker_start").val("");
		$("#datetimepicker_end").val("");
		$(".cc_top_one select").val("");
	} 
</script>
</body>
</html>
