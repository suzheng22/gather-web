<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>数据采集系统</title>
<link rel="stylesheet" type="text/css" href="{{$resource_url}}style/global.css"/>
<link rel="stylesheet" type="text/css" href="{{$resource_url}}style/head.css" />
<link rel="stylesheet" type="text/css" href="{{$resource_url}}style/public.css"/>
<link rel="stylesheet" type="text/css" href="{{$resource_url}}style/iconfont.css"/>

 
</head>

<body>
<!------------------------顶部j-top------------------------------------->
<div class="j-top">
	<div class="j-top-warp">
		<div class="j-top-warp">
			<h3>录入系统</h3>
           <div class="top_right"><span>{{$userInfo.trueName}}</span><em>,欢迎你</em><a href="#">退出</a></div>
        </div>
        
        <ul class="clearfix" id="nav_info">
            <li class="black"><em>已完成sku:</em><span>{{$skuInfo.baseInfo.s1}}</span></li>
            <li class="black"><em>已完成字符数:</em><span>{{$skuInfo.baseInfo.s2}}</span></li>
            <li class="black"><em>待修改SKU:</em><span>{{$skuInfo.baseInfo.s3}}</span></li>
       </ul>
    </div> 	
</div>
<!------------------------顶部结束--------------------------------------->
<!--------------------------- 录入信息------------------------------------> 
<div class="record_info_warp">
	<div class="left">
			<div id="pageContent">
				<div id="imgContainer">
				{{foreach from=$skuInfo.images.0 item=info name=name}}

									{{if $smarty.foreach.name.first}}
									<img id="imageFullScreen" src="{{$info}}"  alt=""/>
									{{/if}}
								{{/foreach}}
			    	
			    </div>
               	<h3>O(∩_∩)O滑动鼠标可放大缩小图片O(∩_∩)O</h3>
			</div>
	    <div class="detail_zoom_right">	
    		<div class="popup_box" style="margin-top:10px;">
            <!--正常显示层-->
            <div class="show_a_01">
                <div class="pic_box clearfix">
                    <div class="pic_box_left">
                        <p>标签图</p>
                    </div>
                    <div style="float:left" class="v_show">
                        <span class="prev"><i class="icon iconfont">&#x3465;</i></span>
                        <span class="next"><i class="icon iconfont">&#x3464;</i></span>
                        <div class="v_content">
                            <div  class="v_content_list">
                                <ul class="con-FangDa-ImgList">
								{{foreach from=$skuInfo.images.0 item=info name=name}}
                                    <li {{if $smarty.foreach.name.first}}class="active"{{/if}}><img src="{{$info}}" /></li>
								{{/foreach}}
                                    
                                  
                                 </ul>
                            </div>
                        </div>
                   </div>
                </div><!---->
                <!--箱装图-->
                 <div class="pic_box clearfix">
                    <div class="pic_box_left">
                        <p>箱装图</p>
                    </div>
                    <div style="float:left" class="v_show">
                        <span class="prev"><i class="icon iconfont">&#x3465;</i></span>
                        <span class="next"><i class="icon iconfont">&#x3464;</i></span>
                        <div class="v_content">
                            <div  class="v_content_list">
                                <ul class="con-FangDa-ImgList">
                                    {{foreach from=$skuInfo.images.1 item=info}}
                                    <li class=""><img src="{{$info}}" /></li>
								{{/foreach}}
                                   
                                 </ul>
                            </div>
                        </div><!--v_content-->
                   </div>
                </div>
            </div><!--show_a_01-->
    		</div>
		</div>
  	</div><!--left-->	
  	<div class="right">
  		<div class="choice_count">
			<h2>条码：{{$skuInfo.baseInfo.gtin}}</h2>
			<input type="hidden"  value="{{$skuInfo.baseInfo.gtin}}" id="gtin"/>
        	<h3>
            <a href="javascript:;" class="selected">通用参数</a>
            <a href="javascript:;">厂商信息</a>
            <a href="javascript:;">基本信息</a>
            <a href="javascript:;">扩充信息</a>
            <a href="javascript:;" class="last">营养成分</a>
            </h3>            	 			
		</div>
		<div class="right_mid">
        	<ul>
            	<li class="clearfix">
                	<label>名称：</label>
					<input type="text" id="name" value="{{$skuInfo.goods.info.name}}" />
                </li>
                <li class="clearfix">
                	<label>品牌：</label>
					<input type="text" id="brand" value="{{$skuInfo.goods.info.brand}}" />
                </li>
                <li class="clearfix">
                	<label>类型：</label>
					<input type="text" id="good_class" value="{{$skuInfo.goods.info.good_class}}"/>
                </li>
                <li class="clearfix">
                	<label>产地：</label>
					<input type="text" id="mfrs" value="{{$skuInfo.goods.info.mfrs}}"/>
                </li>
                 <li class="clearfix">
                	<label>标准号：</label>
					<input type="text" id="produce_no" value="{{$skuInfo.goods.info.produce_no}}"/>
                </li>
                 <li class="clearfix">
                	<label>卖点：</label>
					<input type="text" id="sell_point" value="{{$skuInfo.goods.info.sell_point}}"/>
                </li>
                <a href="javascript:;" onclick="save_base_info();">保存</a>
            </ul>
        	<ul style="display:none;">
					<li class="clearfix">
                	<label>类型：</label>
					<input type="hidden" id="factory_{{$skuInfo.goods.manu.0.id}}"  value="$skuInfo.goods.manu.0.id"/>
					<select id="type">
					<option value="">请选择</option>
					{{foreach from =$skuInfo.factoryList item=val}}
						<option {{if $skuInfo.goods.manu.0.type_id==$val.id}}selected="selected"{{/if}} value="{{$val.id}}"   >{{$val.name}}</option>
					{{/foreach}}
					</select>
                </li>
            	<li class="clearfix">
                	<label>名称：</label>
					<input type="text" id="mName" value="{{$skuInfo.goods.manu.0.mName}}" />
                </li>
                <li class="clearfix">
                	<label>卫生许可证：</label>
					<input type="text" id="number1" value="{{$skuInfo.goods.manu.0.number1}}"  />
                </li>
				<li class="clearfix">
                	<label>生产许可证：</label>
					<input type="text" id="number2" value="{{$skuInfo.goods.manu.0.number2}}"  />
                </li>
				<li class="clearfix">
                	<label>电话：</label>
					<input type="text" id="phone" value="{{$skuInfo.goods.manu.0.phone}}" />
                </li>
				<li class="clearfix">
                	<label>地址：</label>
					<input type="text" id="address" value="{{$skuInfo.goods.manu.0.address}}" />
                </li>
			
                <a href="javascript:;" onclick="save_factory_info({{$skuInfo.goods.manu.0.id}});">保存</a>
            </ul>
            <ul style="display:none;">
			{{foreach from =$skuInfo.type.basic_info item=val name=name}}
			{{if $val.type!=2}}
            	<li {{if $smarty.foreach.name.first}}class="active"{{/if}}>
                	<label>{{$val.name}}：</label>
					<input type="text" id="{{$val.field}}" class="basic" value="{{$skuInfo.goods.typeBasicInfo.{{$val.field}}}}" />
                </li>
			{{/if}}
			{{/foreach}}
                <a href="javascript:;" onclick="save_basic('basic');">保存</a>
            </ul>
            <ul style="display:none;">
            	{{foreach from =$skuInfo.type.extend_info item=val name=name}}
            	<li {{if $smarty.foreach.name.first}}class="active"{{/if}}>
                	<label>{{$val.name}}：</label>
					<input type="text" id="{{$val.field}}" class="extend" value="{{$skuInfo.goods.typeBasicInfo.{{$val.field}}}}" />
                </li>
			{{/foreach}}
                <a href="javascript:;" onclick="save_basic('extend');">保存</a>
            </ul>
            <ul style="display:none;">
            	<li class="clearfix cf">
                	<div  class="nutrition_inform">
                        <div id="nutrition_contain">
                            <h3 class="clearfix">
                                <span>项目</span>
                                <span>含量</span>
                                <span>NVR%</span>
                                <span>操作</span>
                            </h3>
							{{if !$skuInfo.Nutrient}}
                            <P class="clearfix">
                                <span>能量:</span>
								<input type="hidden" class="key" value="能量" />
                                <input type="text"/>
                                <input type="text"/>
                                <span>&nbsp;</span>
                            </P>
                            <P class="clearfix">
                                <span>蛋白质:</span>
								<input type="hidden" class="key" value="蛋白质" />
                                <input type="text"/>
                                <input type="text"/>
                                <span>&nbsp;</span>
                            </P>
                            <P class="clearfix">
                                <span>脂肪:</span>
								<input type="hidden" class="key" value="脂肪" />
                                <input type="text"/>
                                <input type="text"/>
                                <span>&nbsp;</span>
                            </P>
                            <P class="clearfix">
                                <span>碳水化合物:</span>
								<input type="hidden" class="key" value="碳水化合物" />
                                <input type="text" />
                                <input type="text"/>
                                <span>&nbsp;</span>
                            </P>
                             <P class="clearfix last">
                                <span>钠:</span>
								<input type="hidden" class="key" value="钠" />
                                <input type="text"/>
                                <input type="text"/>
                                <span>&nbsp;</span>
                            </P>
							{{else}}
								{{foreach from = $skuInfo.Nutrient item=list name=name}}
								<P {{if $smarty.foreach.name.last}}class="clearfix last"{{else}}class="clearfix"{{/if}}>
                                <span>能量:</span>
								<input type="hidden" class="key" value="{{$list.key}}" />
                                <input type="text" value="{{$list.value}}"/>
                                <input type="text" value="{{$list.nrv}}"/>
                                <span>&nbsp;</span>
								{{/foreach}}
                            </P>
							{{/if}}
                        </div>
                        <div class="save_box">
                           <a href="javascript:;" id="add_param">添加参数</a> <a href="javascript:;" onclick="saveNutrient()">保存</a>
                        </div>
                   </div>
                  </li>
            </ul>
		</div>
		<a href="javascript:;" id="record_confirm" onclick="save()">提交</a>	
  	</div>
  	
</div>    	


<script type="text/javascript" src="{{$resource_url}}js/imgfd/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="{{$resource_url}}js/defined.js"></script> 
<script type="text/javascript" src="{{$resource_url}}js/record.js"></script> 
<script src="{{$resource_url}}js/img_zoom/e-smart-zoom-jquery.min.js"></script> 
<!--图片延时加载-->
<script type="text/javascript" src="{{$resource_url}}js/lazyload/jquery.lazyload.js"></script>
<script type="text/javascript">  
	$(function(){ 
		$("img").lazyload({ 
		});
		
		$("#nav_info").fiexd({top:"-2px"}); 
	}); 
	//营养成分增加参数
	$("#add_param").click(function(){
		  var ul = $("#nutrition_contain");    
		  var temp =  '<P class="clearfix add_field">'+
					  '<input type="text"/ onblur="add(this)"  placeholder="新添加">'+
					  '<input type="hidden" class="key"  />'+
					  '<input type="text"/>'+
					  '<input type="text"/>'+
					  '<span class="del" style="display:block;cursor:pointer">删除</span>'+
					  '</p>'  
					 ul.append(temp);
					 $("#nutrition_contain p .del").each(function(){
						 $(this).click(function(){
							 $(this).parent().remove();
						 });
					 })	 
		});
		

		
		
		function add(obj){
			$(obj).next().val($(obj).val());
		}
	function save_base_info(){
		var name=$("#name").val();
		var brand=$("#brand").val();
		var good_class=$("#good_class").val();
		var mfrs=$("#mfrs").val();
		var produce_no=$("#produce_no").val();
		var sell_point=$("#sell_point").val();
		var gtin=$("#gtin").val();
		$.post("{{$root_path}}input/saveBaseInfo",{"name":name,"brand":brand,"good_class":good_class,"mfrs":mfrs,"produce_no":produce_no,"sell_point":sell_point,"gtin":gtin},
		  function(data){
			var dataObj=eval("("+data+")");
				if(dataObj.msgCode==0){
					alert('添加成功');
				}
		  },
		  "text");
	}
	
	function save_factory_info(id){
		var mName=$("#mName").val();
		var number1=$("#number1").val();
		var number2=$("#number2").val();
		var phone=$("#phone").val();
		var address=$("#address").val();
		var type=$("#type").val();
		var gtin=$("#gtin").val();
		$.post("{{$root_path}}input/saveFactoryInfo",{"mName":mName,"number1":number1,"number2":number2,"phone":phone,"address":address,"type":type,"gtin":gtin,"fid":id},
		  function(data){
			var dataObj=eval("("+data+")");
				if(dataObj.msgCode==0){
					alert('添加成功');
				}
		  },
		  "text");
	}
	
	function save_basic(type){
	var str="";
	var gtin=$("#gtin").val();
		$("."+type).each(function(index){
		
		var v=$(this).val();
		var id=$(this).attr("id");
				str+=id+"="+v+"&";
		 //var json=JSON.stringify($(this));
			//alert(json);
            });
var str=str.substring(0,(str.length-1));
		$.post("{{$root_path}}input/saveBasicInfo",{"str":str,"gtin":gtin},
		  function(data){
			var dataObj=eval("("+data+")");
				if(dataObj.msgCode==0){
					alert('添加成功');
				}
		  },
		  "text");              
	}
	
	function save(){
	var gtin=$("#gtin").val();
		$.post("{{$root_path}}input/save",{"gtin":gtin},
		  function(data){
			//$('#msg').html("please enter the email!");
			var dataObj=eval("("+data+")");
				if(dataObj.msgCode==0){
					alert('录入成功');
					window.location.reload();
				}
			//$('#msg').html(data);
		  },
		  "text");
	}
	
	function saveNutrient(){	
		var gtin=$("#gtin").val();
		var str=parst();
		$.post("{{$root_path}}input/saveNutrient",{"str":str,"gtin":gtin},
		  	function(data){
				var dataObj=eval("("+data+")");
				if(dataObj.msgCode==0){
					alert('添加成功');
				}
		  	},"text");
	}
	function parst(){
				var str="";
		$(".key").each(function(index){
			var key=$(this).val();
			var value=$(this).next().val();
			var nrv=$(this).next().next().val();
				if(key&&value&&nrv){
					str+=key+"="+value+"="+nrv+"&";
				}
            });
			str=str.substring(0,(str.length-1));
			return str;
	}	
</script> 
</body>
</html>
