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
            	<h3>项目统计</h3>
                <div class="rose_top main_rignt_top clearfix">
				<form action="{{$root_path}}statistics/projectList">
                  <div class="cc_top_one last_show"><label>项目名称:</label>
                          <select name="pId" class="select3">
						  	<option value="">请选择</option>
							{{foreach from=$project_list item=list}}
								<option value="{{$list.pId}}">{{$list.pName}}</option>
							{{/foreach}}
						  </select>
                      </div>

                        	<div class="clearfix"></div>
                    <div class="cc_top_two" style="margin-left:12px; display:inline;">
                    	  <a href="{{$root_path}}statistics/extProject?p={{$p}}" class="query"><i class="icon iconfont">&#xf0220;</i>导出</a>
                        <span class="query"><i class="icon iconfont">&#xf00a8;</i><input type="submit" value="查询"></span>
                        <a href="javascript:;"><i class="iconfont">&#xf014a;</i>清空</a>
                    </div>
					</form>
                   	<div class="clearfix"></div>
                	<div class="tab_box">
                    <table>
                      <tr>


                        <th>项目名称</th>
                        <th>入库总商品数</th>
                        <th>已拍摄上传总数</th>
                        <th>已拍摄审核通过总数</th>
                        <th>已修图上传总数</th>
                        <th>已修图审核通过总数</th>
                        <th>已录入提交总数</th>
                        <th>已录入审核总数</th>
                        <th>操作</th>


                      </tr>
					  {{foreach from = $plist item=list}}
                      <tr>
                        <td>{{$list.pName}}</td>
                        <td>{{$list.depotCount}}</td>
                        <td>{{$list.shootUploadCount}}</td>
                        <td>{{$list.shootPassCount}}</td>
                        <td>{{$list.retouchUploadCount}}</td>
                        <td>{{$list.retouchPassCount}}</td>
                        <td>{{$list.inputUploadCount}}</td>
                        <td>{{$list.inputPassCount}}</td>
                        <td>
                        	<a href="javascript:;">导出详情</a>
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
</script>
<!--时间控件-->

</body>
</html>
