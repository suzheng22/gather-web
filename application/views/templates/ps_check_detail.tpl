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
            	<h3>修图审核-详情</h3>	
                <div class="rose_top main_rignt_top clearfix">
					<form action="{{$root_path}}retouch/psCheckDetail/{{$u_info.userId}}/{{$no}}/{{$total}}/{{$auto}}" method="get">
                        <div class="cc_top_one"><label>修图人:</label><span>{{$u_info.trueName}}</span><input type="hidden" id="rId" value="{{$u_info.userId}}" /></div>
                        <div class="cc_top_one"><label>抽查通过率:</label><span>{{($total*100)|substr:"0":"5"}}%</span></div>
                        <div class="cc_top_one"><label>待审核商品数:</label><span>{{$no}}</span></div>
                        <div class="clearfix"></div>
						<form action="{{$root_path}}marlboro/psDetail/{{$u_info.userId}}" id="myform">
							<div class="cc_top_one last_show"><label>项目:</label>
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
							<!-- 条形码 -->
							<div class="cc_top_one"><label>商品条形码:</label><input type="text" name="gtin" value="{{$gtin}}" id="gtin"/></div>
                    	<div class="cc_top_one"><label>商品名称:</label><input type="text"  name="gName" value="{{$gName}}" id="gName"/></div>
							<div class="clearfix"></div>

                        <div class="cc_top_one last_show"><label>商品分类:</label>
                            <div class="choice_count choice_box vocation">            	 			
                                <dl class="select">
                                    <select name="catgrory1" id="type" class="select3">
										<option value="">全部</option>
									 {{foreach from=$type_list item=list}}
												<option value="{{$list.id}}" {{if $catgrory1==$list.id}}selected="selected"{{/if}}>{{$list.name}}</option>
										 {{/foreach}}
									</select>
                                </dl>
                            </div>
                        </div>
                         <div class="cc_top_one last_show"><label>修图类型:</label>
                            <div class="choice_count choice_box vocation">            	 			
                                <dl class="select">
								<select name="retouchType" class="select3">
									<option value="">全部</option>
									<option value="1" {{if $retouchType==1}}selected="selected"{{/if}}>正常修图</option>
									<option value="2" {{if $retouchType==2}}selected="selected"{{/if}}>驳回修图</option>
								</select>
                                </dl>
                            </div>
                        </div>
                         <div class="cc_top_one last_show"><label>状态:</label>
                            <div class="choice_count choice_box vocation">            	 			
                                <dl class="select">
								<select name="status" class="select3">
									<option value="" {{if $status == 'NULL'}}selected="selected"{{/if}}>全部</option>
									<option value="1" {{if $status == 1}}selected="selected"{{/if}}>未审核</option>
									<option value="2" {{if $status==2}}selected="selected"{{/if}}>修图已通过</option>
									<option value="3" {{if $status==3}}selected="selected"{{/if}}>修图已驳回</option>
								</select>
                                </dl>
                            </div>
                        </div>
							<div class="cc_top_one" style="width:40%"><label>上传时间:</label>
								<input type="text" id="datetimepicker_start" name="s_time" value="{{$s_time}}"/> <label style="width:20px;">-</label>
								<input type="text" id="datetimepicker_end" name="e_time" value="{{$e_time}}"/></div>
							<div class="clearfix"></div>
                        <div class="clearfix"></div>
                    <div class="cc_top_two">
                        <span class="query"><i class="icon iconfont">&#xf0142;</i><input type="button" value="批量审核" onclick="shoot_pass()" /></span>
                         <span class="query"><i class="icon iconfont">&#xf00a8;</i><input type="submit" value="查询" /></span>
                         <a href="javascript:;" onclick="btn_empty()"><i class="iconfont">&#xf014a;</i>清空</a>
                    </div>
					</form>
					
                   	<div class="clearfix"></div>
                	<div class="tab_box">
                    <table>
                      <tr>
                        <th>商品条形码</th>
                        <th>商品名称</th>
                        <th>商品分类</th>
                        <th>修图类型</th>
						  <th>项目</th>
						  <th>包装</th>
						  <th>批次</th>
						  <th>上传时间</th>
						  <th>状态</th>
                        <th>操作</th>
                      </tr>
					  {{foreach from=$glist.data item=list}}
                      <tr>
                        <td>{{$list.gtin}}</td>
                        <td>{{$list.gName}}</td>
                        <td>{{$list.catgroryName}}</td>
						  <td>{{if $list.retouchType==1}}正常修图{{else}}驳回修图{{/if}}</td>
						  <td>{{$list.pName}}</td>
						  <td>包装{{$list.packet}}</td>
						  <td>批次{{$list.batchNo}}</td>

						  <td>{{$list.uploadTime|date_format:"Y-m-d H:i:s"}}</td>
                        <td>{{if $list.status==2}}通过{{else if $list.status==3}}驳回{{else}}未审核{{/if}}</td>
                        <td>
                        	<a href="{{$root_path}}retouch/psCheckPic?orderId={{$list.orderId}}&gtin={{$list.gtin}}&batchNo={{$list.batchNo}}&packet={{$list.packet}}" target="_blank">审核详细</a>
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
<script type="text/javascript">

$(function(){
	//分页表单提交
	$("#submits").on("click",function(){
		var action=$("#form").attr("action")+"&page="+$("input[name='page']").val();
		$("#form").attr("action",action);
		$("#form").submit();
	});
	
	
});
function shoot_pass(){
	var num=0;
	var shoot=0;
	var data_id="";
	{{foreach from=$glist.orderIds item=list}}
	var status={{$list.status}};
	var shootType={{$list.retouchType}};
	var orderId={{$list.orderId}};
	if(status===1 && shootType!==1){
		num++;
	}else{
		if(status===1 && shootType===1){
			shoot++;
			data_id+=orderId+',';
		}
	}
	{{/foreach}}
	//查询每条数据的拍摄类型，如果拍摄类型是驳回拍摄且状态是未审核状态需要提醒操作人手动操作
	if(num){
		alert("你的驳回修图未处理，不能批量操作");
		return false;
	}
	//如果拍摄类型是正常拍摄，且状态是未审核状态则将状态修改为审核状态
	if(shoot){
		var data={orderId:data_id};
		//ajax
		$.ajax({
			url:"{{$root_path}}retouch/batchPass",
			data:data,
			type:'POST',
			dataType:'text',
			success:function(e){
				if(e){
					alert("操作成功");
					window.location.reload();
				}else{
					alert("操作失败");
				}
			}
		});
	}else{
		//其余状态不变
		alert("无审核操作");
	}
}

	//清空
	function btn_empty(){
		$("#gtin,#gName").val("");
		$("#datetimepicker_start").val("");
		$("#datetimepicker_end").val("");
		$(".cc_top_one select,.select3").val("");
		$(".uew-select-text").html('全部');
	}
 
</script>

</body>
</html>
