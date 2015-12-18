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
            	<h3>拍摄审核-详情</h3>	
                <div class="rose_top main_rignt_top clearfix">
                	
                        <div class="cc_top_one"><label>拍摄人:</label><span>{{$u_info.trueName}}</span> <input type="hidden" id="rId" value="{{$u_info.userId}}" /></div>
                        <div class="cc_top_one"><label>抽查通过率:</label><span>{{((($total-$no)/$total)|number_format:4)*100}}%</span></div>
                        <div class="cc_top_one"><label>待审核商品数:</label><span>{{$no}}</span></div>
                        <div class="clearfix"></div>
						<form action="{{$root_path}}marlboro/shootDetail/{{$u_info.userId}}" id="myform">
                            <!-- 项目 -->
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
                    	    <div class="cc_top_one"><label>商品名称:</label><input type="text" name="gName" value="{{$gName}}" id="gName"/></div>
                     	    <div class="cc_top_one" style="width:40%;">
                            <label>上传时间:</label>
                            <input type="text" id="datetimepicker_start" name="s_time" value="{{$s_time}}"/>
                            <label style="width:20px;">-</label>
                            <input type="text" id="datetimepicker_end" name="e_time" value="{{$e_time}}"/>
                        </div>
                            <div class="clearfix"></div>
                             <div class="cc_top_one last_show"><label>商品分类:</label>
                                <div class="choice_count choice_box vocation">            	 			
                                    <dl class="select">
                                       <select name="category1" id="category1" class="select3">
                                            <option value="">全部</option>
                                          {{foreach from=$type_list item=list}}
                                                    <option value="{{$list.id}}" {{if $category1==$list.id}}selected="selected"{{/if}}>{{$list.name}}</option>
                                              {{/foreach}}
                                        </select>
                                    </dl>
                                </div>
                            </div>
                             <div class="cc_top_one last_show"><label>拍摄类型:</label>
                                <div class="choice_count choice_box vocation">            	 			
                                    <dl class="select">
                                         <select name="shootType" class="select3">
                                            <option value="">全部</option>
                                             <option value="1" {{if $shootType==1}}selected="selected"{{/if}}>正常拍摄</option>
                                            <option value="2" {{if $shootType==2}}selected="selected"{{/if}}>驳回拍摄</option>
                                       </select>
                                    </dl>
                                </div>
                            </div>
                             <div class="cc_top_one last_show"><label>状态:</label>
                                <div class="choice_count choice_box vocation">            	 			
                                    <dl class="select">
                                    <select name="status" class="select3">
                                        <option value="" {{if $status == 'NULL'}}selected="selected"{{/if}}>全部</option>
                                        <option value="1" {{if $status ==1}}selected="selected"{{/if}}>未审核</option>
                                        <option value="2" {{if $status==2}}selected="selected"{{/if}}>拍摄已通过</option>
                                        <option value="3" {{if $status==3}}selected="selected"{{/if}}>拍摄已驳回</option>
                                    </select>
                                    </dl>
                                </div>
                            </div>
                                <div class="clearfix"></div>
                            <div class="cc_top_two">
                                <span class="queryAll query"><input type="button" value="查询结果内通过" onclick="shoot_pass()"></span>
                                <span class="query"><i class="icon iconfont">&#xf00a8;</i><input type="submit" value="查询"></span>
                                <a href="javascript:;" onclick="btn_empty()"><i class="iconfont">&#xf014a;</i>清空</a>
                        </div>
						</form>
                   	<div class="clearfix"></div>
                	<div class="tab_box" >
                    <table id="show_detail">
                      <tr>
                        <th>商品条形码</th>
                        <th>商品名称</th>
                        <th>商品分类</th>
                          <!-- 新增字段 -->
                        <th>项目</th>
                          <th>包装</th>
                          <th>批次</th>
                        <th>拍摄类型</th>
                        <th>上传时间</th>
                        <th>状态</th>
                        <th>操作</th>
                      </tr>
                      {{foreach from=$glist item=list}}
                      <tr class="t_{{$list.gtin}}">
                        <td>{{$list.gtin}}</td>
                        <td>{{$list.gName}}</td>
                        <td>{{$list.catgroryName}}</td>
                          <!-- 新增字段 -->
                          <td>{{$list.pName}}</td>
                          <td>包装{{$list.packet}}</td>
                          <td>批次{{$list.batchNo}}</td>
                          <!-- 新增字段 -->
                        <td>{{if $list.type==1}}正常拍摄{{else}}驳回拍摄{{/if}}</td>
						<td>{{$list.uploadTime|date_format:"Y-m-d H:i:s"}}</td>
                        <td>{{if $list.status==1}}未审核{{else if $list.status==2}}通过{{else}}驳回{{/if}}</td>
                          <input type="hidden" value="{{$list.status}}">
                        <td>
                        	<a href="{{$root_path}}marlboro/shootDetailPic/?orderId={{$list.orderId}}&gtin={{$list.gtin}}" target="_blank">审核详细</a>
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
<!--时间控件-->
<link rel="stylesheet" type="text/css" href="{{$resource_url}}js/time/jquery.datetimepicker.css"/>
<script type="text/javascript" src="{{$resource_url}}js/time/jquery.datetimepicker.js"></script>
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

$('#datetimepicker_start').datetimepicker({
	onGenerate:function( ct ){
		$(this).find('.xdsoft_date')
			.toggleClass('xdsoft_disabled');
	},
		format:'Y/m/d',
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
		format:'Y/m/d',
	formatDate:'Y/m/d',
	minDate:'-1970/01/2',
	maxDate:'+1970/01/2',
	timepicker:false
});

function check(){
	var datetimepicker_start=$("#datetimepicker_start").val();
	var datetimepicker_end=$("#datetimepicker_end").val();
	var type=$("#type").val();
	var rId=$("#rId").val();
	var proName=$("#proName").val();
		$.post("{{$root_path}}marlboro/batchChangeStatus",{"rId":rId,"type":type,"start_time":datetimepicker_start,"end_time":datetimepicker_end,"proName":proName,'table':'shoot'},
		  	function(data){
				var dataObj=eval("("+data+")");
				if(dataObj.msgCode==0){
					alert('审核成功');
					window.location.reload();
				}
				else{
					alert(dataObj.msgText);
					window.location.reload();
				}
		  	},"text");
}

//查询内通过
function shoot_pass(){
    var num=0;
    var shoot=0;
    var data_id="";
    {{foreach from=$glist item=list}}
        var gtin={{$list.gtin}};
        var status={{$list.status}};
        var shootType={{$list.shootType}};
        var orderId={{$list.orderId}};
        if(status===1 && shootType!==1){
            $(".t_"+gtin).css('color','red');
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
        alert("请手动操作带有红色标识的条码");
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
              //  alert(e);
                alert('审核成功');
            }
        });
    }else{
        //其余状态不变
        alert("无审核操作");
    }
}
//清空
	function btn_empty() {
        $("#gtin,#gName").val("");
        $("#count_user").val("");
        $("#datetimepicker_start").val("");
        $("#datetimepicker_end").val("");
        $(".select3").val("");
        $(".uew-select-text").html('全部');
    }
</script>
 	


</body>
</html>
