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
            	<h3>修图统计</h3>
                <div class="rose_top main_rignt_top clearfix">
				<form action="{{$root_path}}statistics/ps" method="get">
                    <div class="cc_top_one"><label>用户名:</label><input type="text" name="userName" id="user_name" value="{{$userName}}"/></div>
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
                     <div class="cc_top_one" style="width:50%;">
                         <label>提交时间:</label>
                         <input type="text" class="datetimepicker" name="startTime" value="{{$startTime}}"/>
                         <input type="text" class="datetimepicker" name="endTime" value="{{$endTime}}"/>
                     </div>
                    <div class="cc_top_two" style="margin-left:14px; display:inline;">
                    	<input type="submit" value="查询" />
                        <a href="{{$page_url}}&is_ext=1" class="query" target="_blank"><i class="icon iconfont">&#xf0220;</i>导出</a>
                        <a href="javascript:;"><i class="iconfont">&#xf014a;</i>清空</a>
                    </div>
					</form>
                   	<div class="clearfix"></div>
                	<div class="tab_box">
                    <table>
                      <tr style="background:#333;">
                        <th>用户名</th>
                        <th>用户组</th>
                        <th>修图商品数</th>
                        <th>已审核商品数</th>
                        <th>待上传商品数</th>
                        <th>待审核商品数</th>
                        <th>已驳回商品数</th>
                        
                        
                      </tr>
					  {{foreach from =$glist item=list}}
                      <tr>
                        <td>{{$list.userName}}</td>
                        <td>{{$list.groupName}}</td>
                        <td>{{$list.totalCount}}</td>
                        <td>{{$list.passCount}}</td>
                        <td>{{$list.re_uplodeCount}}</td>
                        <td>{{$list.re_passCount}}</td>
                        <td>待定</td>
                      </tr>
					  {{/foreach}}
                      
                      
                    </table>
                </div>
                	{{$pages}}
                	
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
$('.datetimepicker').datetimepicker();
</script>
<!---->  

</body>
</html>
