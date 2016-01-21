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
            	<h3>录入审核统计</h3>
                <div class="rose_top main_rignt_top clearfix">
				<form action="{{$root_path}}statistics/inputCheck">
                    <div class="cc_top_one"><label>用户名:</label><input type="text" name="userName" value="{{$userName}}"/></div>
                    <div class="cc_top_one last_show"><label>用户组:</label>
                    	<div class="choice_count choice_box">
							<dl class="select">
                                   <select class="select3" name="groupId">
                                   		<option value="">全部</option>
                                       {{foreach from=$group_list item=list}}
                                        	<option value="{{$list.groupId}}" {{if $groupId==$list.groupId}} selected="selected"{{/if}}>{{$list.groupName}}</option>
										{{/foreach}}
                                   </select>
							</dl>
	            	 	</div>
                     </div>
                     <div class="cc_top_one" style="width:50%;">
                         <label>审核时间:</label>
                         <input type="text" class="datetimepicker" name="startTime" value="{{$startTime}}"/>
                         <input type="text" class="datetimepicker" name="endTime" value="{{$endTime}}"/>
                     </div>
                    <div class="cc_top_two" style="margin-left:14px; display:inline;">
                    	<a href="{{$root_path}}statistics/extInputCheck?p={{$p}}" class="query"><i class="icon iconfont">&#xf0220;</i>导出</a>
                        <span class="query"><i class="icon iconfont">&#xf00a8;</i><input type="submit" value="查询"></span>
                        <a href="javascript:;"><i class="iconfont">&#xf014a;</i>清空</a>
                    </div>
					</form>
                   	<div class="clearfix"></div>
                	<div class="tab_box">
                    <table>
                      <tr style="background:#333;">
                        <th>用户名</th>
                        <th>用户组</th>
                        <th>审核的商品数</th>
                        <th>审核通过次数</th>
                        <th>已驳回次数</th>
                      </tr>
					  {{foreach from=$glist item=list}}
                      <tr>
                        <td>{{$list.userName}}</td>
                        <td>{{$list.groupName}}</td>
                        <td>{{$list.reviewCount}}</td>
                        <td>{{$list.reviewPassCount}}</td>
                        <td>{{$list.reviewNoPassCount}}</td>
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
<script type="text/javascript">
$(function(){
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
</script>
</body>
</html>
