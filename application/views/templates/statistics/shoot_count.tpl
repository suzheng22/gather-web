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
				<form action="{{$root_path}}statistics/shootList">
                  <div class="cc_top_one last_show"><label>项目名称:</label>
                          <div class="choice_count choice_box vocation">
                              <dl class="select">
                                  <select class="select3" name="pId">
                                    <option value="">全部</option>
                                      {{foreach from=$project_list item=list}}
                                        <option value="{{$list.pId}}" {{if $pId==$list.pId}} selected="selected"{{/if}}>{{$list.pName}}</option>
										{{/foreach}}
                                 </select>
                              </dl>
                          </div>
                      </div>
                	<div class="cc_top_one"><label>用户名:</label><input type="text" name="userName" value="{{$userName}}"/ class="user_name"></div>
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
                        <div style="width:40%;" class="cc_top_one">
                            <label>拍摄时间:</label>
                            <input type="text" value="{{$startTime}}" name="startTime" id="datetimepicker_start">
                            <label style="width:20px;">-</label>
                            <input type="text" value="{{$endTime}}" name="endTime" id="datetimepicker_end">
                        </div>
                        	<div class="clearfix"></div>
                    <div class="cc_top_two" style="margin-left:12px; display:inline;">
                    	  <a href="{{$root_path}}statistics/extShoot?p={{$p}}" class="query"><i class="icon iconfont">&#xf0220;</i>导出</a>
                        <span class="query"><i class="icon iconfont">&#xf00a8;</i><input type="submit" value="查询"></span>
                        <a href="javascript:;" onclick="btn_empty()"><i class="iconfont">&#xf014a;</i>清空</a>
                    </div>
                   	<div class="clearfix"></div>
					</form>
                	<div class="tab_box">
                    <table>
                      <tr>
                        <th>用户名</th>
                        <th>用户组</th>
                        <th>拍摄总数</th>
                        <th>审核通过数</th>
                        <th>待上传数</th>
                        <th>待审核数</th>
                        <th>审核驳回数</th>
                        <th>抽查通过率</th>
                        <th>拍摄通过照片数</th>
                        <th>拍摄总照片数</th>
                        <th>操作</th>

                      </tr>
					  {{foreach from=$slist item=list}}
                      <tr>
                        <td>{{$list.userName}}</td>
                        <td>{{$list.groupName}}</td>
                        <td>{{$list.shootCount}}</td>
                        <td>{{$list.shootPassCount}}</td>
                        <td>{{$list.rUploadCount}}</td>
                        <td>{{$list.rReviewCount}}</td>
                        <td>{{$list.reviewNoPassCount}}</td>
                        <td>{{$list.passRate}}</td>
                        <td>{{$list.shootPassPicCount}}</td>
                        <td>{{$list.shootPicCount}}</td>
                        <td>
                        	<a href="{{$root_path}}statistics/shootDetail/{{$list.userId}}">详细</a>
                        </td>
                      </tr>
					{{/foreach}}
                      </tr>


                    </table>
                </div>
                	{{$pages}}
                </div>
            </div>
        </div>
     </div><!--main end-->
</div>
<!-- 新建用户弹出层 开始-->
<div class="newuser_pop" id="newuser_pop">
	<div class="tit clearfix"><h4>新增角色</h4><a class="no_text close" href="javascript:;" title="关闭">关闭</a></div>
	<div class="content">
		<div class="login_main">
			<div class="login_form">
				<div class="clearfix one"><label for="user_name">角色编码:</label><input type="text" id="" class="zhmm"></div>
                <div class="clearfix one"><label for="user_name">角色名称:</label><input type="text" id="" class="zhmm"></div>
                <div class="clearfix one"><label for="user_name">描述:</label><textarea></textarea></div>
                <a href="javascript:;" id="confirm_btn" class="confirm_btn">确认</a>
            </div>
	   </div>
    </div>
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
//清空
  function btn_empty() {
        $(".user_name").val("");
        $("#datetimepicker_start").val("");
        $("#datetimepicker_end").val("");
        $(".uew-select-text").html('全部');
    }
</script>

</body>
</html>
