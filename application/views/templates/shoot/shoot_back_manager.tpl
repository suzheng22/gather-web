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
            	<h3>拍摄反馈管理</h3>
                <div class="rose_top main_rignt_top clearfix">
                	 <div class="cc_top_one last_show"><label>项目名称:</label>
                            <div class="choice_count choice_box vocation">            	 			
                                <dl class="select">
                                    <select class="select3">
                                   		<option value="">全部</option>
                                        <option value="">1</option>
                                        <option value="">2</option>
                                   </select>
                                </dl>
                            </div>
                        </div>
                	<div class="cc_top_one"><label>商品条形码:</label><input type="text"/></div>
                    <div class="cc_top_one"><label>商品名称:</label><input type="text"/></div>
                    <div class="cc_top_one last_show"><label>商品分类:</label>
                            <div class="choice_count choice_box vocation">            	 			
                                <dl class="select">
                                    <select class="select3">
                                   		<option value="">全部</option>
                                        <option value="">1</option>
                                        <option value="">2</option>
                                   </select>
                                </dl>
                            </div>
                        </div>
                     <div class="cc_top_one" style="width:50%">
                            <label>反馈时间:</label>
                            <input type="text" id="datetimepicker_start"/>
                            <label style="width:20px;">-</label>
                            <input type="text" id="datetimepicker_end"/>
                        </div>
                        <div class="cc_top_one last_show"><label>状态:</label>
                            <div class="choice_count choice_box vocation">            	 			
                                <dl class="select">
                                    <select class="select3">
                                   		<option value="">全部</option>
                                        <option value="">1</option>
                                        <option value="">2</option>
                                   </select>
                                </dl>
                            </div>
                        </div>
                        <div class="cc_top_one last_show"><label>反馈路径:</label>
                            <div class="choice_count choice_box vocation">            	 			
                                <dl class="select">
                                    <select class="select3">
                                   		<option value="">全部</option>
                                        <option value="">修图反馈</option>
                                        <option value="">录入反馈</option>
                                   </select>
                                </dl>
                            </div>
                        </div>
                      <div class="clearfix"></div> 
                    <div class="cc_top_two" style="margin-left:12px; display:inline;">
                   
                        <a href="javascript:;" class="query"><i class="icon iconfont">&#xf00a8;</i>查询</a>
                        <a href="javascript:;"><i class="iconfont">&#xf014a;</i>清空</a>
                    </div>
                   	<div class="clearfix"></div>
                	<div class="tab_box">
                    <table>
                      <tr>
                        <th>序号</th>
                        <th>商品条形码</th>
                        <th>商品名称</th>
                        <th>商品分类</th>
                     	<th>项目</th>
                        <th>包装</th>
                        <th>批次</th>
                        <th>反馈路径</th>
                        <th>反馈状态</th>
                        <th>反馈原因</th>
                        <th>反馈时间</th>
                        <th>反馈人</th>
                       
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>123214125</td>
                        <td>2222</td>
                        <td>222</td>
                        <td>dadas</td>
                        <td>正常</td>
                        <td>
                        	2323
                        </td>
                         <td>
                        	2323
                        </td>
                         <td>
                        	修图反馈
                        </td>
                         <td>
                        	1
                        </td>
                        <td>
                        	2015.12.14
                        </td>
                        <td>
                        	张工
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

	//select 表单美化
	$(".select3").uedSelect({
		width : 112
	});
	 $(".select1").uedSelect({
		width :250			  
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

});
</script>
</body>
</html>
