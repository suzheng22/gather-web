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
            	<h3>录入统计</h3>
                <div class="rose_top main_rignt_top clearfix">
				<form action="{{$root_path}}statistics/inputList">
                  <div class="cc_top_one last_show"><label>项目名称:</label>
                    <div class="choice_count choice_box vocation">
                        <dl class="select">
                            <select name="pId" class="select3">
						  	<option value="">请选择</option>
							{{foreach from=$project_list item=list}}
								<option value="{{$list.pId}}">{{$list.pName}}</option>
							{{/foreach}}
						  </select>
                        </dl>
                    </div>
                  </div>
                    <div class="cc_top_one"><label>用户名:</label><input type="text" name="userName" value="{{$userName}}" class="user_name" /></div>
                    <div class="cc_top_one last_show"><label>用户组:</label>
                      <div class="choice_count choice_box vocation">
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
                     <div class="cc_top_one" style="width:50%;"><label>提交时间:</label>
                       <input type="text" class="datetimepicker" id="datetimepicker_start" value="{{$startTime}}" name="startTime"/>
                       <label style="width:20px;">-</label>
                        <input type="text" class="datetimepicker" id="datetimepicker_end" value="{{$endTime}}" name="endTime"/>
                      </div>
                    <div class="clearfix"></div>
                    <div class="cc_top_two" style="margin-left:14px; display:inline;">
                    	  <a href="{{$root_path}}statistics/extInput?p={{$p}}" class="query"><i class="icon iconfont">&#xf0220;</i>导出</a>
                        <span class="query"><i class="icon iconfont">&#xf00a8;</i><input type="submit" value="查询"></span>
                        <a href="javascript:;" onclick="btn_empty()"><i class="iconfont">&#xf014a;</i>清空</a>
                    </div>
					</form>
                   	<div class="clearfix"></div>
                	<div class="tab_box">
                    <table>
                      <tr style="background:#333;">
                        <th>用户名</th>
                        <th>用户组</th>
                        <th>录入总数</th>
                        <th>录入字数</th>
                        <th>审核通过数</th>
                        <th>审核通过字数</th>
                        <th>待审核数</th>
                        <th>审核驳回数</th>
                        <th>操作</th>
                      </tr>
					  {{foreach from=$glist item=list}}
						  <tr>
							<td>{{$list.userName}}</td>
							<td>{{$list.groupName}}</td>
							<td>{{$list.inputCount}}</td>
							<td>{{$list.wordCount}}</td>
							<td>{{$list.inputPassCount}}</td>
							<td>{{$list.wordPassCount}}</td>
							<td>{{$list.rReviewCount}}</td>
							<td>{{$list.reviewNoPassCount}}</td>
							<td><a href="{{$root_path}}statistics/inputDetail/{{$list.userId}}">详细</a></td>
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
  function btn_empty() {
        $(".user_name").val("");
        $("#datetimepicker_start").val("");
        $("#datetimepicker_end").val("");
        $(".uew-select-text").html('全部');
    }
</script>
</body>
</html>
