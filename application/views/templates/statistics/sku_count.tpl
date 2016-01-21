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
            	<h3>单品统计</h3>
				<form action="{{$root_path}}statistics/goodsList">
                <div class="rose_top main_rignt_top clearfix">
                	<div class="cc_top_one"><label>商品条形码:</label><input type="text" name="gtin"  value="{{$gtin}}"/></div>
                    <div class="cc_top_one"><label>商品名称:</label><input type="text" name="gName" value="{{$gName}}"/></div>
                    <div class="cc_top_one last_show"><label>商品分类:</label>
                            <div class="choice_count choice_box vocation">            	 			
                                <dl class="select">
                                    <select class="select3" name="catgroy1">
                                   		<option value="">全部</option>
										{{foreach from=$type_list item=list}}
                                        <option value="{{$list.id}}" {{if $catgroy1==$list.id}} selected="selected"{{/if}}>{{$list.name}}</option>
										{{/foreach}}
                                   </select>
                                </dl>
                            </div>
                     </div>
                     <div class="clearfix"></div>
                    <div class="cc_top_two" style="margin-left:12px; display:inline;">
                    	<a href="record.html" class="query"><i class="icon iconfont">&#xf0220;</i>导出</a>
                        <span class="query"><i class="icon iconfont">&#xf00a8;</i><input type="submit" value="查询" /></span>
                        <a href="javascript:;"><i class="iconfont">&#xf014a;</i>清空</a>
                    </div>
					</form>
                   	<div class="clearfix"></div>
                	<div class="tab_box">
                    <table>
                      <tr>
					  
                        <th>商品条形码</th>
                        <th>商品名称</th>
                        <th>商品分类</th>
                        <th>包装数</th>
                        <th>拍摄次数</th>
                        <th>修图次数</th>
                        <th>录入次数</th>
                        <th>录入字数</th>
                      </tr>
					  {{foreach from=$glist item=list}}
                      <tr>
                        <td>{{$list.gtin}}</td>
                        <td>{{$list.gName}}</td>
                        <td>{{$list.catgroryName}}</td>
                        <td>{{$list.packetCount}}</td>
                        <td>{{$list.shootCount}}</td>
                        <td>{{$list.retouchCount}}</td>
                        <td>
                        	{{$list.inputCount}}
                        </td>
                         <td>
                        	{{$list.wordCount}}
                        </td>
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
	
	//select 表单美化
	$(".select3").uedSelect({
		width : 100
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
</script>	

</body>
</html>
