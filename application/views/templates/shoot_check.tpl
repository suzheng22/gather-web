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
            	<h3>拍摄审核</h3>	
                <div class="rose_top main_rignt_top clearfix">
                	<form action="{{$root_path}}marlboro/shoot" method="get">
                         <!--项目*-->
                         <div class="cc_top_one last_show">
                             <label>项目:</label>
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
                        <div class="cc_top_one"><label>用户名:</label><input type="text" id="count_user" name="userName" value="{{$userName}}"/></div>
                        <div class="cc_top_one last_show"><label>用户组:</label>
                            <div class="choice_count choice_box vocation">            	 			
                                <dl class="select">
                                         <select name="groupId" class="select3">
                                            <option value="">全部</option>
                                           {{foreach from=$group_list item=list}}
                                                    <option value="{{$list.groupId}}" {{if $groupId==$list.groupId}}selected="selected"{{/if}}>{{$list.groupName}}</option>
                                           {{/foreach}}
                                        </select>
                                    </dl>
                            </div>
                         </div>
                        <div class="clearfix"></div>
                        <div class="cc_top_two" style="margin-left:14px; display:inline;">
                           
                           <span class="query"><i class="icon iconfont">&#xf00a8;</i><input type="submit" value="查询"/></span>
                           <a href="javascript:;" onclick="btn_empty()"><i class="iconfont">&#xf014a;</i>清空</a>
                        </div>
                    </form>
                   	<div class="clearfix"></div>
                	<div class="tab_box">
                    <table>
                      <tr>
                          <th>序列号</th>
                        <th>用户名</th>
                        <th>用户组</th>
                        <th>总商品数</th>
                        <th>待审核商品数</th>
                        <th>已审核商品数</th>
                        <th>抽查通过率</th>
                        <th>操作</th>
                        
                        
                      </tr>
                      {{foreach from =$glist item=list}}
                      <tr>
                        <td>
                            {{$list.num}}
                        </td>
                        <td>{{$list.userName}}</td>
                        <td>{{$list.groupName}}</td>
                        <td>{{$list.totalCount}}</td>
                        <td>{{$list.noMarlboroCount}}</td>
                        <td>{{$list.allMarlboroCount}}</td>
                        <td>{{((($list.MarlboroCount)/$list.chouchatotalCount)|number_format:4)*100}}%</td>

                        <td>
                        	<a href="{{$root_path}}marlboro/shootDetail/{{$list.photoId}}/{{$list.chouchatotalCount}}/{{$list.noMarlboroCount}}/{{$list.MarlboroCount}}">详情</a>
                        </td>
                      </tr>
                       {{/foreach}}
                       
                      
                    </table>
                </div>
                	<!--分页-->
                    <div class="page_nav" id="page_nav">
                      {{$pages}}
                    </div>
                </div>
            </div>
        </div>
     </div><!--main end-->  
</div>

{{include file='public/js.tpl'}}
<script type="text/javascript">
$(function(){
	
	
	//select 表单美化
	$(".select3").uedSelect({
		width : 100
	});
	//菜单高亮显示和地址栏比对
	var url = window.location;
    $('.system_log dd a').filter(function (){
        return this.href == url || url.href.indexOf(this.href) == 0;
    })
    .parents('dd').addClass('active').siblings().removeClass('active');
	$(".leftsidebar_box .check_manager dd").show();
	
});

	//清空
	function btn_empty(){
		$("#count_user").val("");
		$(".cc_top_one select").val("");
        $(".uew-select-text").html('全部');
	}

</script>
 	


</body>
</html>
