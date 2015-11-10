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
            	<h3>修图审核-详情</h3>	
                <div class="rose_top main_rignt_top clearfix">
                	
                        <div class="cc_top_one"><label>修图人:</label><span>{{$u_info.trueName}}</span></div>
                        <div class="cc_top_one"><label>抽查通过率:</label><span>{{$glist.passCount*100}}%</span></div>
                        <div class="cc_top_one"><label>待审核商品数:</label><span>{{$glist.dCount}}</span></div>
                        <div class="clearfix"></div>
						<form action="{{$root_path}}marlboro/psDetail/{{$u_info.userId}}">
                    	<div class="cc_top_one"><label>商品名称:</label><input type="text"  name="proName" value="{{$proName}}"/></div>
                     	<div class="cc_top_one"><label>上传开始时间:</label><input type="text" id="datetimepicker_start" name="start_time" value="{{$start_time}}"/></div>
                        <div class="cc_top_one"><label>上传结束时间:</label><input type="text" id="datetimepicker_end" name="end_time" value="{{$end_time}}"/></div>
                        <div class="cc_top_one last_show"><label>商品分类:</label>
                            <div class="choice_count choice_box">            	 			
                                <dl class="select">
                                    <select name="type">
										<option value="">全部</option>
										{{foreach from=$type_list item=list}}
												<option value="{{$list.id}}" {{if $type==$list.id}}selected="selected"{{/if}}>{{$list.name}}</option>
											{{/foreach}}
									</select>
                                </dl>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                         <div class="cc_top_one last_show"><label>修图类型:</label>
                            <div class="choice_count choice_box">            	 			
                                <dl class="select">
								<select name="retouchType">
									<option value="">全部</option>
									<option value="1" {{if $retouchType==1}}selected="selected"{{/if}}>正常修图</option>
									<option value="2" {{if $retouchType==2}}selected="selected"{{/if}}>驳回修图</option>
								</select>
                                </dl>
                            </div>
                        </div>
                         <div class="cc_top_one last_show"><label>状态:</label>
                            <div class="choice_count choice_box">            	 			
                                <dl class="select">
								<select name="status">
									<option value="">全部</option>
									<option value="0" {{if $status==0}}selected="selected"{{/if}}>未审核</option>
									<option value="1" {{if $status==1}}selected="selected"{{/if}}>修图已通过</option>
									<option value="2" {{if $status==2}}selected="selected"{{/if}}>修图已驳回</option>
								</select>
                                   
                                </dl>
                            </div>
                        </div>
                    <div class="cc_top_two">
                        
                        <input type="submit" value="查询" />
                            <a href="javascript:;"><i class="iconfont">&#xf014a;</i>清空</a>
                    </div>
					</form>
					<input type="button" value="批量审核" onclick="check(1)" />
                   	<div class="clearfix"></div>
                	<div class="tab_box">
                    <table>
                      <tr>
                        <th>商品条形码</th>
                        <th>商品名称</th>
                        <th>商品分类</th>
                        <th>修图类型</th>
                        <th>状态</th>
                        <th>操作</th>
                        
                        
                      </tr>
					  {{foreach from=$glist.gtins item=list}}
                      <tr>
                        <td>{{$list.gtin}}</td>
                        <td>{{$list.proName}}</td>
                        <td>{{$list.typeName}}</td>
                        <td>{{if $list.retouchType==1}}正常修图{{else}}驳回修图{{/if}}</td>
                        <td>{{if $list.status==1}}通过{{else if $list.status==2}}驳回{{else}}未审核{{/if}}</td>
                        <td>
                        	<a href="{{$root_path}}marlboro/psDetailPic/{{$list.gtin}}">审核详细</a>
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
{{include file='public/js.tpl'}}
<!--时间控件-->
<link rel="stylesheet" type="text/css" href="{{$resource_url}}js/time/jquery.datetimepicker.css"/>
<script type="text/javascript" src="{{$resource_url}}js/time/jquery.datetimepicker.js"></script>
<script type="text/javascript">
$('#datetimepicker_start').datetimepicker();
$('#datetimepicker_end').datetimepicker();

function check(){
	var gtin={{$p_info.gtin}};

		$.post("{{$root_path}}marlboro/checkStatus",{"gtin":gtin,"type":2,"status":1},
		  	function(data){
				var dataObj=eval("("+data+")");
				if(dataObj.msgCode==0){
					if(status==1){
					   alert('审核成功');
					}
					else{
						alert('驳回成功');
					}
					window.location.reload();
				}
				else{
					alert(dataObj.msgText);
					window.location.reload();
				}
		  	},"text");


}
</script>
<!---->  	


</body>
</html>
