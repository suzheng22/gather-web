<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>数据采集系统</title>
    {{include file='public/css.tpl'}}
    <link rel="stylesheet" type="text/css" href="{{$resource_url}}style/jquery.iviewer.css"/>
    <style type="text/css">
        select{opacity:1;}
    </style>
</head>
<body>
<!------------------------顶部j-top------------------------------------->
<div class="j-top">
    <div class="j-top-warp">
        <div class="j-top-warp">
            <h3>数据采集系统</h3>
            <div class="top_right"><span>RingKing</span><em>,欢迎你</em><a href="#">退出</a></div>
        </div>
        <ul class="clearfix" id="nav_info">
            <li class="black"><em>商品条形码:</em><span>{{$p_info.gtin}}</span></li>
            <li class="black"><em>可录入商品总数:</em><span>{{$p_info.inputGoodsCount}}</span></li>
            <li class="black"><em>今录入商品总数:</em><span>{{$p_info.inputGoodsCountToday}}</span></li>
            <li class="black"><em>今录入字数:</em><span>{{$p_info.inputCountToday}}</span></li>
        </ul>
    </div>
</div>
<!------------------------顶部结束--------------------------------------->
<!--------------------------- 录入信息------------------------------------> 
<div class="record_info_warp">
	<div class="left record_left">
			<div class="pageContent record_pageContent ps_check_pic">
                <div class="wrapper">
                    <div id="viewer" class="viewer"></div>
                </div>
                <h5>原图</h5>
			</div>
	    <div class="detail_zoom_right" style="margin-left:0px;">	
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
                                    {{foreach from=$plist.3 item =list name=name}}
                                    <li {{if $smarty.foreach.name.first}}class=""{{/if}}><img src="{{$pic_path}}{{$list.key}}-thumbnail50" mm="{{$pic_path}}{{$list.key}}" /></li>
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
                                    {{foreach from=$plist.5 item =list name=name}}
                                    <li {{if $smarty.foreach.name.first}} class=""{{/if}}><img src="{{$pic_path}}{{$list.key}}-thumbnail50" mm="{{$pic_path}}{{$list.key}}" /></li>
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
        	<h3>
            <a href="javascript:;" class="selected">分类</a>
            <a href="javascript:;">基本信息</a>
            <a href="javascript:;">厂商信息</a>
            <a href="javascript:;">扩充信息</a>
            <a href="javascript:;" class="last">营养成分</a>
            </h3>            	 			
		</div>
		<div class="right_mid">
        	<!--分类-->
        	<div class="cf">
                <div class="cf_Category clearfix">
                    <span><label for="sku_cf_01">单品</label><input type="radio" id="sku_cf_01" name="sku_cf_01" checked="checked"></span>
                    <span><label for="sku_cf_02">组合包装</label><input type="radio"/ id="sku_cf_02" name="sku_cf_02"></span>
                </div>
                <div style="display:none;" id="multiple_sku">
                    <div class="clearfix multiple_sku_add">
                        <P class="clearfix">
                            <label>产品名称：</label>
                            <input type="text" />
                        </P>
                    </div>
                     <div class="save_box clearfix">
                      <a href="javascript:;" id="cf_add" class="clearfix"><i class="iconfont">&#xf018b;</i>增加</a>
                      <a href="javascript:;">保存</a>
                    </div>
                    
                </div>
            </div>
            <!--基本信息-->
        	<div style="display:none;" class="cf">
                <div class="base_info">
                    {{foreach from= $p_info.baseInfo item=list}}
                        {{if $list.isNums==1 && $list.inputType==1}}
                            <p class="clearfix">
                                <label>商品名称：</label>
                                <input type="text" name="fieldName" value="{{$list.fieldName}}"/>
                            </p>
                        {{else if $list.isNums==1 && $list.inputType==2}}
                            <p class="clearfix">
                                <label>卖点：</label>
                                <textarea name="fieldName">{{$list.fieldName}}</textarea>
                            </p>
                        {{else  if $list.isNums==2 && $list.inputType==1}}
                             <p class="clearfix">
                                 <label>配料：</label>
                                <select>
                                    <option>====请选择====</option>
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                    </select>
                                    <input type="text" name="fieldName" value="{{$list.field}}"/>
                            </p>
                            <div class="save_box">
                                <a href="javascript:;" id="bese_info_add">增加</a>
                            </div>
                        {{/if}}
                        {{if $list.isNums==2  && $list.inputType==2}}
                             <p class="clearfix">
                                <label>配料：</label>
                                <select>
                                    <option>====请选择====</option>
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                </select>
                                <textarea name="fieldName">{{$list.fieldName}}</textarea>
                             </p>
                            <div class="save_box">
                                <a href="javascript:;" id="bese_info_add">增加</a>
                            </div>
                        {{/if}}
                    {{/foreach}}

                    <p class="clearfix">
                        <label>商品名称：</label>
                        <input type="text" />
                    </p>
                    <p class="clearfix">
                        <label>商品类型：</label>
                        <select>
                        	<option>====请选择====</option>
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                        </select>
                    </p>
                    <p class="clearfix">
                        <label>品牌/中：</label>
                        <input type="text" />
                    </p>
                    <p class="clearfix">
                        <label>产品类型：</label>
                         <select>
                        	<option>====请选择====</option>
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                        
                        </select>
                    </p>
                    <p class="clearfix">
                        <label>产地/原产国：</label>
                        <input type="text" />
                    </p>
                    <p class="clearfix">
                        <label>卖点：</label>
                        <textarea></textarea>
                    </p>
                </div>
                <div class="base_info_two" id="base_info_two">
                	 <p class="clearfix">
                        <label>配料：</label>
                         <select>
                        	<option>====请选择====</option>
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                        
                        </select>
                         <input type="text" />
                    </p>
                    <div class="save_box">
                           <a href="javascript:;" id="bese_info_add">增加</a>
                    </div>
                </div>
                 <div class="base_info_two" id="base_info_three">
                	 <p class="clearfix">
                        <label>原料：</label>
                         <select>
                        	<option>====请选择====</option>
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                        
                        </select>
                        <textarea ></textarea>
                    </p>
                    <div class="save_box" id="save_box03">
                           <a href="javascript:;" id="bese_info_add03">增加</a>
                    </div>
                </div>
                <div class="save_box"><a href="javascript:;">保存</a></div>
            </div>
            <!--厂商信息-->
            <div style="display:none;" class="cf">
            	 <div id="businesser">
                         <h3 class="clearfix" id="bus_info"><a href="javascript:;" id="fir1" class="selected">厂商</a></h3>
                                <p class="clearfix">
                                    <label>厂商类别：</label>
                                    <select>
                                        <option value="0">===请选择===</option>
                                        <option>1：委托商</option>
                                        <option>2：生产商</option>
                                        <option>3：制造商</option>
                                        <option>4：经销商</option>
                                        <option>5：代理商</option>
                                        <option>6：分装商</option>
                                        <option>7：总代理商</option>
                                        <option>8：总经销商</option>
                  
                                    </select>
                                </p>
                                <p class="clearfix">
                                    <label>厂商名称：</label>
                                    <input type="text" />
                                </p>
                                <p class="clearfix">
                                    <label>厂商地址：</label>
                                    <input type="text" />
                                </p>
                                <p class="clearfix">
                                    <label>厂商电话：</label>
                                    <input type="text" />
                                </p>
                                <p class="clearfix">
                                    <label>卫生许可证：</label>
                                    <input type="text" />
                                </p>
                                <p class="clearfix">
                                    <label>生产许可证：</label>
                                    <input type="text" />
                                </p>
                       </div>
                       <div class="save_box">
                           <a href="javascript:;" id="add_tab">添加厂商</a> <a href="javascript:;">保存</a>
                       </div>
            </div>
            <!--扩充信息-->
            <div style="display:none;" class="cf">
            	<div class="extend_info">
                    {{foreach from= $p_info.extendInfo item=list}}
                    {{if $list.isNums==1 && $list.inputType==1}}
                    <p class="clearfix">
                        <label>商品名称：</label>
                        <input type="text" />
                    </p>
                    {{else if $list.isNums==1 && $list.inputType==2}}
                    <p class="clearfix">
                        <label>卖点：</label>
                        <textarea></textarea>
                    </p>
                    {{else  if $list.isNums==2 && $list.inputType==1}}
                    <p class="clearfix">
                        <label>配料：</label>
                        <select>
                            <option>====请选择====</option>
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                        </select>
                        <input type="text" />
                    </p>
                    <div class="save_box">
                        <a href="javascript:;" id="bese_info_add">增加</a>
                    </div>
                    {{/if}}
                    {{if $list.isNums==2  && $list.inputType==2}}
                    <p class="clearfix">
                        <label>配料：</label>
                        <select>
                            <option>====请选择====</option>
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                        </select>
                        <textarea></textarea>
                    </p>
                    <div class="save_box">
                        <a href="javascript:;" id="bese_info_add">增加</a>
                    </div>
                    {{/if}}
                    {{/foreach}}
            		<p class="clearfix">
                	<label>口味：</label>
					<input type="text" />
                </p>
                <p class="clearfix">
                	<label>货号：</label>
					<input type="text" />
                </p>
                <p class="clearfix">
                	<label>品牌/商标：</label>
					<input type="text" />
                </p>
                <p class="clearfix">
                	<label>网址：</label>
					<input type="text" />
                </p>
                <p class="clearfix">
                	<label>服务热线：</label>
					<input type="text" />
                </p>
                <p class="clearfix">
                	<label>卫生标准：</label>
					<input type="text" />
                </p>
                <p class="clearfix">
                	<label>其它证号：</label>
					<input type="text" />
                </p>
                <p class="clearfix">
                	<label>生产工艺：</label>
					<input type="text" />
                </p>
                <p class="clearfix">
                	<label>质量等级：</label>
					<input type="text" />
                </p>
                <p class="clearfix">
                	<label>原料品种：</label>
					<input type="text" />
                </p>
                <p class="clearfix">
                	<label>原料产地：</label>
					<input type="text" />
                </p>
                </div>
                 <div class="save_box">
                     <a href="javascript:;">保存</a>
                 </div>
            </div>
            <!--营养成分-->
            <div style="display:none;" class="cf">
            	<div style="border-bottom:1px solid #ccc; height:100%; padding:10px 0px 0px 0px;" class="zz_nutrient">
                	<div class="nutrition_inform" id="nutrition_inform">
                   	<h3 class="clearfix bus_info_01"><a href="javascript:;" class="selected">营养成分</a></h3>
                    <h3 class="clearfix"><span>商品名称:</span><input type="text"/></h3>
                    <h4 class="clearfix">
                        <span>成分名称</span>
                        <select>
                                <option value="">含量</option>
                                <option value="">每100ml</option>
                                <option value="">每100g</option>
                                <option value="">每一枚</option>
                           </select>
                        <span>NVR%</span>
                    </h4>
                    <P class="clearfix">
                        <span>能量:</span>
                        <input type="text"/><label>kj</label>
                        <input type="text"/><label>%</label>
                    </P>
                    <P class="clearfix">
                        <span>蛋白质:</span>
                        <input type="text"/><label>g</label>
                        <input type="text"/><label>%</label>
                    </P>
                    <P class="clearfix">
                        <span>脂肪:</span>
                        <input type="text"/><label>g</label>
                        <input type="text"/><label>%</label>
                    </P>
                    <P class="clearfix">
                        <span>碳水化合物:</span>
                        <input type="text"/><label>kj</label>
                        <input type="text"/><label>%</label>
                    </P>
                    <P class="clearfix">
                        <span>钠:</span>
                        <input type="text"/><label>mg</label>
                        <input type="text"/><label>%</label>
                    </P>
                </div>
                <div class="save_box">
                  <a href="javascript:;" id="" class="add_nutrient">添加营养成分</a> <a href="javascript:;" id="" class="add_param">添加参数</a> <a href="javascript:;">保存</a>
                </div>
                </div>
                <!--<div style="margin:10px 2px;"><a href="javascript:;" id="add_nutrient">增加营养成分</a></div>-->
            </div>
  		</div>
        <div class="zz_conforim"><a href="javascript:;" id="record_confirm">提交</a></div>
	</div> 
</div>

<script type="text/javascript" src="{{$resource_url}}js/jquery-1.9.1.min.js"></script>
<script src="{{$resource_url}}js/ui_tab.js" type="text/javascript"></script>
<script type="text/javascript" src="{{$resource_url}}js/rotate/jqueryui.js"></script>
<script type="text/javascript" src="{{$resource_url}}js/rotate/jquery.mousewheel.min.js"></script>
<script type="text/javascript" src="{{$resource_url}}js/rotate/jquery.iviewer.js"></script>
<script type="text/javascript" src="{{$resource_url}}js/popup/popup.js"></script>
<script type="text/javascript" src="{{$resource_url}}js/record.js"></script>
<script type="text/javascript" src="{{$resource_url}}js/defined.js"></script>
<!--dom预加载-->
<script type="text/javascript" src="{{$resource_url}}js/lazyload/jquery.fadeloader.js"></script>
<script type="text/javascript" src="{{$resource_url}}js/lazyload/jquery.lazyload.js"></script>
<script type="text/javascript">  
$(function(){ 
		//预加载
    $('body').fadeloader({
        mode: 'class',
        fadeSpeed : 500,
        displayType : 'inline-block',
        easeLoad : 'swing',
        onComplete : ''
    });
    //延时加载
    $("img").lazyload();
    //实例化
    var is="{{$picList.0.key}}";
    if(is){
        var iv2 = $("#viewer").iviewer(
                {
                    src: "{{$pic_path}}{{$picList.0.key}}"
                });

    }
		//分类-组合包装
		$("#sku_cf_01").click(function(){
			$("#multiple_sku").hide();
		});
		$("#sku_cf_02").click(function(){
			$("#multiple_sku").show();
			//增加分类下的产品名称
			$("#cf_add").click(function(){
              var multiple_sku_add = $(".multiple_sku_add");    
              var cf_temp ='<p class="clearfix">'+
			  			  '<label>产品名称：</label>'+
			  			  '<input type="text"/>'+
						  '<span class="cf_del">删除</span>'+
						  '</p>';
                         multiple_sku_add.append(cf_temp);
						 $("#multiple_sku .multiple_sku_add").on('click','span.cf_del',function(){ 
							$(this).parent().remove(); 
						 });	 
        	});
			
		});

		//营养成分表
			var tabCounter_zz = 0;
			$(".add_nutrient").click(function(){
			var n_bus=$(".bus_info_01");
			var n_temp_bus='<a href="javascript:;">营养成分'+tabCounter_zz+'<i class="iconfont bus_del_01">&#xf01b0;</i></a>'
					n_bus.append(n_temp_bus);
					tabCounter_zz++;
					$(".bus_info_01 a").on('click','.bus_del_01',function(){
						$(this).parent().remove();
					});
					//营养成分追加完成后选项
					$(".bus_info_01 a").click(function(){
						var index = 0;
						$(this).addClass("selected").siblings().removeClass("selected");
					});
			});
			//营养成分增加参数
				$(".add_param").click(function(){
					  var ul = $(".nutrition_inform");    
					  var temp =  '<P class="clearfix add_field">'+
								  '<select style="margin-left:2px; margin-right:10px;"><option>==请选择==</option><option>维生素A</option><option>维生素B</option><option>维生素c</option></select>'+
								  '<input type="text"/>'+
								  '<label>c</label>'+
								  '<input type="text"/>'+
								  '<label>%</label>'+
								  '<em class="nutrition_inform_del" style="display:block;cursor:pointer">删除</em>'+
								  '</p>'  
								 ul.append(temp);
								 $(".nutrition_inform .nutrition_inform_del").each(function(){
									 $(this).click(function(){
										 $(this).parent().remove();
									 });
								 })	 
					});
		//增加营养成分表
		/*$("#add_nutrient").click(function(){
          var u_list = $(".zz_nutrient");    
          var U_temp ='<div style="border-bottom:1px solid #ccc; height:100%; padding:10px 0px 0px 0px;" class="zz_nutrient">'+
							 '<div class="nutrition_inform" id="nutrition_inform">'+
							 '<h3 class="clearfix"><span>商品名称:</span><input type="text"/></h3>'+
							 '<h4 class="clearfix">'+
								'<span>成分名称</span>'+
								'<select>'+
									'<option value="">含量</option>'+
									'<option value="">每100ml</option>'+
									'<option value="">每100g</option>'+
									'<option value="">每一枚</option>'+
								'</select>'+
								'<span>NVR%</span>'+
							'</h4>'+
	'<P class="clearfix"><span>能量:</span><input type="text"/><label>kj</label><input type="text"/><label>%</label></P>'+
	'<P class="clearfix"><span>蛋白质:</span><input type="text"/><label>g</label><input type="text"/><label>%</label></P>'+
	'<P class="clearfix"><span>脂肪:</span><input type="text"/><label>g</label><input type="text"/><label>%</label></P>'+
	'<P class="clearfix"><span>碳水化合物:</span><input type="text"/><label>kj</label><input type="text"/><label>%</label></P>'+
	'<P class="clearfix"><span>钠:</span><input type="text"/><label>mg</label><input type="text"/><label>%</label></P>'+
							
						  	'</div>'+
				'<div class="save_box"><a href="javascript:;" id="" class="add_param">添加参数</a> <a href="javascript:;">保存</a><a href="javascript:;" class="zz_del">删除</a></div>'+
				'</div>'  
                u_list.append(U_temp);
				$(".zz_nutrient .save_box").on('click','zz_del',function(){ 
					$(".zz_nutrient").remove(); 
				});
				
        	});*/
			
			//增加厂商
		 	var tabCounter = 0;
			$("#add_tab").click(function(){
					var bus=$("#bus_info");
					var temp_bus='<a href="javascript:;">厂商'+tabCounter+'<i class="iconfont bus_del">&#xf01b0;</i></a>'
					bus.append(temp_bus);
					tabCounter++;
					$("#bus_info a").on('click','.bus_del',function(){
						$(this).parent().remove();
					});
					//厂商追加完成后选项
					$("#bus_info a").click(function(){
						var index = 0;
						$(this).addClass("selected").siblings().removeClass("selected");
					});
			});
	
			
			//基本信息 增加配料
			$("#bese_info_add").click(function(){
              var base_info =$("#base_info_two");    
              var base_temp ='<P class="clearfix">'+
			  				'<label>配料</label>'+
			  			  	'<select><option>==请选择==</option><option>1223B</option><option>e323c</option></select>'+
							'<textarea></textarea>'+
                            '<em class="base_info_del">删除</em>'+
						    '</p>'  
                         	base_info.append(base_temp);
							
							//重置加按钮的位置到最后
						 	var root = $("#base_info_two");
							var savebox = root.find(".save_box");
							root.append(savebox);
							
							$("#base_info_two p").on('click','em.base_info_del',function(){ 
							$(this).parent().remove(); 
							
						 });
        	});
			//基本信息 增加原料
			$("#bese_info_add03").click(function(){
              var base_info =$("#base_info_three");    
              var base_temp ='<P class="clearfix">'+
			  				'<label>原料</label>'+
			  			  	'<select><option>==请选择==</option><option>2222</option><option>33333</option></select>'+
							'<textarea></textarea>'+
                            '<em class="base_info_del03">删除</em>'+
						    '</p>'  
                         	base_info.append(base_temp);
							
							//重置加按钮的位置到最后
						 	var root = $("#base_info_three");
							var savebox = root.find("#save_box03");
							root.append(savebox);
							
							$("#base_info_three p").on('click','em.base_info_del03',function(){ 
							$(this).parent().remove(); 
							
						 });
        	});

}); //end           	
</script>
</body>
</html>
