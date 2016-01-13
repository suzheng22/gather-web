<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>数据采集系统</title>
    {{include file='public/css.tpl'}}
    <link rel="stylesheet" type="text/css" href="{{$resource_url}}style/jquery.iviewer.css"/>
    <style type="text/css">
        select{opacity:1;}
        #nav_info li span{width:150px}
        #nav_info li em{width:140px}
        .right_mid .cf p select{width:120px}
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
            <li class="black"><em>商品条形码:</em><span >{{$p_info.gtin}}</span></li>
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
                    <span><label for="sku_cf_01">单品</label><input type="radio" id="sku_cf_01" name="sku_cf_01"  {{if $p_info.isGroup==1}}checked="checked"{{/if}}></span>
                    <span><label for="sku_cf_02">组合包装</label><input type="radio"  {{if $p_info.isGroup==2}} checked="checked" {{/if}}/ id="sku_cf_02" name="sku_cf_01"></span>
                </div>
                {{if $p_info.isGroup==2}}
                <div  id="multiple_sku">
                    <div class="clearfix multiple_sku_add">
                        {{foreach from=$p_info.groupGoodsNames key=key item=list}}
                        <P class="clearfix">
                            <label>产品名称：</label>
                            <input type="text" class="product" value="{{$list}}"/>
                            {{if $key!=0}}
                            <span class="cf_del">删除</span>
                            {{/if}}
                        </P>
                        {{/foreach}}
                    </div>

                </div>
                {{else}}
                <div class="clearfix multiple_sku_add" style="display:none" id="multiple_sku">
                    <P class="clearfix">
                        <label>产品名称：</label>
                        <input type="text" class="product"/>
                    </P>
                </div>
                {{/if}}
                {{if $p_info.isGroup==1}}
                <div class="save_box clearfix sku_cf_001" >
                    <a href="javascript:;" onclick="save_product(1)">保存</a>
                </div>
                {{else if $p_info.isGroup==2}}
                <div class="save_box clearfix sku_cf_002">
                    <a href="javascript:;" id="cf_add" class="clearfix"><i class="iconfont">&#xf018b;</i>增加</a>
                    <a href="javascript:;" onclick="save_product(2)">保存</a>
                </div>
                {{/if}}
                <div class="save_box clearfix sku_cf_0001" style="display: none">
                    <a href="javascript:;" onclick="save_product(1)">保存</a>
                </div>
                <div class="save_box clearfix sku_cf_0002" style="display: none">
                    <a href="javascript:;" id="cf_add" class="clearfix"><i class="iconfont">&#xf018b;</i>增加</a>
                    <a href="javascript:;" onclick="save_product(2)">保存</a>
                </div>
            </div>
            <!--基本信息-->
        	<div style="display:none;" class="cf">
                <div class="base_info">
                    {{foreach from= $p_info.baseFiled.data item=list}}
                        {{if $list.isNums==1 && $list.inputType==1}}
                            <p class="clearfix p" >
                                <label>{{$list.fieldName}}：</label>
                                <input type="text" name="fieldName" class="fieldName" value="{{$p_info.baseInfo.{{$list.field}}}}"/>
                                <input type="hidden" value="{{$list.field}}" class="hidden">
                            </p>
                        {{else if $list.isNums==1 && $list.inputType==2}}
                            <p class="clearfix p">
                                <label>{{$list.fieldName}}：</label>
                                <textarea name="fieldName" class="fieldName">{{$p_info.baseInfo.{{$list.field}}}}</textarea>
                                <input type="hidden" value="{{$list.field}}" class="hidden">
                            </p>
                    <!-- 多产品-->
                        {{else  if $list.isNums==2 && $list.inputType==2 }}
                            <div class="base_info_two" id="{{$list.field}}">
                                {{if $p_info.isGroup==2}}
                                <!-- 基本信息存在时start -->
                                {{if $p_info.baseInfo.{{$list.field}} !=""}}
                                {{foreach from=$p_info.baseInfo.{{$list.field}} key=keys item=value}}
                                <p class="clearfix">
                                    <label>{{$list.fieldName}}：</label>
                                    <select data-name="{{$list.field}}" class="fieldName" onchange="check_proName(this)">
                                        <option>====请选择====</option>
                                        {{foreach from =$p_info.groupGoodsNames key=key item=name}}
                                        <option value="{{$name}}" {{if $name==$value.0}}selected="selected"{{/if}}>{{$name}}</option>
                                        {{/foreach}}
                                        </select>
                                    <textarea name="fieldName" class="fieldName">{{$value.1}}</textarea>
                                    <input type="hidden" value="{{$list.field}}" class="hidden">
                                    {{if $keys!=0}}
                                    <em class="base_info_del base_info_del{{$list.field}}" onclick="del_base(this)">删除</em>
                                    {{/if}}
                                 </p>
                                {{/foreach}}
                                {{else}}
                                <p class="clearfix">
                                    <label>{{$list.fieldName}}：</label>
                                    <select data-name="{{$list.field}}" class="fieldName" onchange="check_proName(this)">
                                        <option>====请选择====</option>
                                        {{foreach from =$p_info.groupGoodsNames key=key item=name}}
                                        <option value="{{$name}}" {{if $name==$value.0}}selected="selected"{{/if}}>{{$name}}</option>
                                        {{/foreach}}
                                    </select>
                                    <textarea name="fieldName" class="fieldName">{{$value.1}}</textarea>
                                    <input type="hidden" value="{{$list.field}}" class="hidden">
                                </p>
                                {{/if}}
                                <!-- 基本信息存在时end-->
                                {{else}}
                                {{if $p_info.baseInfo.{{$list.field}} !=""}}
                                {{foreach from=$p_info.baseInfo.{{$list.field}} item=value}}
                                <p class="clearfix">
                                    <label>{{$list.fieldName}}：</label>
                                    <textarea name="fieldName" class="fieldName">{{$value.1}}</textarea>
                                    <input type="hidden" value="{{$list.field}}" class="hidden">
                                </p>
                                {{/foreach}}
                                {{else}}
                                <p class="clearfix">
                                    <label>{{$list.fieldName}}：</label>
                                    <textarea name="fieldName" class="fieldName">{{$value.1}}</textarea>
                                    <input type="hidden" value="{{$list.field}}" class="hidden">
                                </p>
                                {{/if}}
                                {{/if}}
                                <div class="save_box"  id="save_{{$list.field}}">
                                    <a href="javascript:;" onclick="add_base('{{$list.field}}','{{$list.fieldName}}')">增加</a>
                                </div>
                            </div>
                        {{/if}}
                    <!--多产品 -->
                    {{/foreach}}
                </div>
                <div class="save_box"><a href="javascript:;" onclick="save_baseInfo()">保存</a></div>
            </div>
            <!--厂商信息-->
            <div style="display:none;" class="cf">
            	 <div id="businesser" class="businesser">
                     <div  id="bus_info">
                         <h3 class="clearfix" >
                             {{if ($p_info.shop.0)!=""}}
                             {{foreach from=$p_info.shop key=key item=list}}<a href="javascript:;" {{if $key==0}} class="selected" {{/if}}>厂商{{if $key==0}} {{else}}{{$key}}  <i class="iconfont bus_del">&#xf01b0;</i>{{/if}}</a>
                             {{/foreach}}
                             {{else}}
                             <a href="javascript:;" class="selected">厂商</a>
                             {{/if}}
                         </h3>
                     </div>
                     <div class="business_choice">
                     {{if ($p_info.shop.0)!=""}}
                     {{foreach from=$p_info.shop key=key item=list}}
                     <div class="business_add" {{if $key==0}} {{else}} style="display:none" {{/if}}>
                         <input type="hidden" class="business shopId" value="{{$list.shopId}}">
                         <input type="hidden" class="business inputIds" value="{{$p_info.inputId}}">
                                <p class="clearfix">
                                    <label>厂商类别：</label>
                                    <select  class="business">
                                        <option value="">===请选择===</option>
                                        <option value="委托商" {{if $list.shopType=="委托商"}}selected="selected"{{/if}}>1：委托商</option>
                                        <option value="生产商" {{if $list.shopType=="生产商"}}selected="selected"{{/if}}>2：生产商</option>
                                        <option value="制造商" {{if $list.shopType=="制造商"}}selected="selected"{{/if}}>3：制造商</option>
                                        <option value="经销商" {{if $list.shopType=="经销商"}}selected="selected"{{/if}}>4：经销商</option>
                                        <option value="代理商" {{if $list.shopType=="代理商"}}selected="selected"{{/if}}>5：代理商</option>
                                        <option value="分装商" {{if $list.shopType=="分装商"}}selected="selected"{{/if}}>6：分装商</option>
                                        <option value="总代理商" {{if $list.shopType=="总代理商"}}selected="selected"{{/if}}>7：总代理商</option>
                                        <option value="总经销商" {{if $list.shopType=="总经销商"}}selected="selected"{{/if}}>8：总经销商</option>
                                    </select>
                                </p>
                                <p class="clearfix">
                                    <label>厂商名称：</label>
                                    <input type="text" id="shopName" class="business" value="{{$list.shopName}}"/>
                                </p>
                     <p class="clearfix">
                         <label>厂商地址：</label>
                         <select name="location_p" id="location_p_{{$key}}" class="business" >
                             <option {{if $list.province}}selected{{/if}}>{{$list.province}}</option>
                         </select>
                         <select name="location_c" id="location_c_{{$key}}" class="business">
                             <option>{{$list.city}}</option>
                         </select>
                         <select name="location_a" id="location_a_{{$key}}" class="business">
                             <option>{{$list.region}}</option>
                         </select>
                     </p>
                                <p class="clearfix">
                                    <label></label>
                                    <input type="text" id="address" class="business" value="{{$list.address}}"/>
                                </p>
                                <p class="clearfix">
                                    <label>厂商电话：</label>
                                    <input type="text" id="phone" class="business" value="{{$list.phone}}"/>
                                </p>
                                <p class="clearfix">
                                    <label>卫生许可证：</label>
                                    <input type="text" id="sanitaryCertificateNO" class="business" value="{{$list.sanitaryCertificateNO}}"/>
                                </p>
                                <p class="clearfix">
                                    <label>生产许可证：</label>
                                    <input type="text" id="productionCertificateNO" class="business" value="{{$list.productionCertificateNO}}"/>
                                </p>
                       </div>
                     {{/foreach}}
                     {{else}}
                     <div class="business_add" {{if $key==0}} {{else}} style="display:none" {{/if}}>
                         <input type="hidden" class="business shopId" value="{{$list.shopId}}">
                         <input type="hidden" class="business inputIds" value="{{$p_info.inputId}}">
                         <p class="clearfix">
                             <label>厂商类别：</label>
                             <select id="inputId" class="business">
                                 <option value="">===请选择===</option>
                                 <option value="委托商">1：委托商</option>
                                 <option value="生产商">2：生产商</option>
                                 <option value="制造商">3：制造商</option>
                                 <option value="经销商">4：经销商</option>
                                 <option value="代理商">5：代理商</option>
                                 <option value="分装商">6：分装商</option>
                                 <option value="总代理商">7：总代理商</option>
                                 <option value="总经销商">8：总经销商</option>
                             </select>
                         </p>
                         <p class="clearfix">
                             <label>厂商名称：</label>
                             <input type="text" id="shopName" class="business"/>
                         </p>
                         <p class="clearfix">
                             <label>厂商地址：</label>
                             <select name="location_p" id="location_p" class="business" >
                             </select>
                             <select name="location_c" id="location_c" class="business">
                             </select>
                             <select name="location_a" id="location_a" class="business">
                             </select>
                         </p>
                         <p class="clearfix">
                             <label></label>
                             <input type="text" id="address" class="business"/>
                         </p>
                         <p class="clearfix">
                             <label>厂商电话：</label>
                             <input type="text" id="phone" class="business"/>
                         </p>
                         <p class="clearfix">
                             <label>卫生许可证：</label>
                             <input type="text" id="sanitaryCertificateNO" class="business"/>
                         </p>
                         <p class="clearfix">
                             <label>生产许可证：</label>
                             <input type="text" id="productionCertificateNO" class="business"/>
                         </p>
                     </div>
                     {{/if}}
                     </div>
                       <div class="save_box">
                           <a href="javascript:;" id="add_tab">添加厂商</a> <a href="javascript:;" onclick="save_business()">保存</a>
                       </div>
                 </div>
            </div>
            <!--扩充信息-->
            <div style="display:none;" class="cf">
            	<div class="extend_info">
                    {{foreach from= $p_info.extFiled.data item=list}}
                    {{if $list.isNums==1 && $list.inputType==1}}
                    <p class="clearfix">
                        <label>{{$list.fieldName}}：</label>
                        <input type="text" class="fieldName" value="{{$p_info.extInfo.{{$list.field}}}}"/>
                        <input type="hidden" value="{{$list.field}}" class="hidden">
                    </p>
                    {{else if $list.isNums==1 && $list.inputType==2}}
                    <p class="clearfix">
                        <label>{{$list.fieldName}}：</label>
                        <textarea class="fieldName">{{$p_info.extInfo.{{$list.field}}}}</textarea>
                        <input type="hidden" value="{{$list.field}}" class="hidden">
                    </p>
                    {{else  if $list.isNums==2 && $list.inputType==2}}
                    <p class="clearfix">
                        <label>{{$list.fieldName}}：</label>
                        <select class="fieldName">
                            <option>====请选择====</option>
                        </select>
                        <input type="text" class="fieldName"/>
                        <textarea class="fieldName">{{$p_info.extInfo.{{$list.field}}}}</textarea>
                        <input type="hidden" value="{{$list.field}}" class="hidden">
                    </p>
                    <div class="save_box">
                        <a href="javascript:;" id="bese_info_add">增加</a>
                    </div>
                    {{/if}}
                    {{/foreach}}
                </div>
                 <div class="save_box">
                     <a href="javascript:;" onclick="save_extendInfo()">保存</a>
                 </div>
            </div>
            <!--营养成分-->
            <div style="display:none;" class="cf">
            	<div style="border-bottom:1px solid #ccc; height:100%; padding:10px 0px 0px 0px;" class="zz_nutrient">
                	<div class="nutrition_inform" id="nutrition_inform">
                        <!-- 判断营养成分是否保存-->
                        {{if $p_info.nutritionInfo==""}}
                        <div class="nutrition_choice">
                            <h3 class="clearfix bus_info_01" id="bus_info_01"><a href="javascript:;" class="selected">营养成分</a></h3>
                        </div>
                        <div class="nutrition">
                        <div class="nutrition_child">
                            {{if $p_info.isGroup==2}}
                            <h3 class="clearfix"><span>产品名称:</span>
                                <select class="nutrition_name nutrition_value">
                                        {{foreach from =$p_info.groupGoodsNames key=key item=name}}
                                        <option value="{{$name}}" {{if $name==$list}}{{/if}}>{{$name}}</option>
                                        {{/foreach}}
                                    </select></h3>
                            {{/if}}
                            <h4 class="clearfix">
                                    <span>成分名称</span>
                                    <select name="component" class="nutrition_names">
                                        <option value="含量">含量</option>
                                        <option value="每100ml">每100ml</option>
                                        <option value="每100g">每100g</option>
                                        <option value="每一枚">每一枚</option>
                                    </select>
                                    <span>NVR%</span>
                            </h4>
                            {{foreach from=$p_info.nutritionFiled.data item=list}}
                            {{if $list['isDefault']==1}}
                            <P class="clearfix p">
                                <input type="hidden" class="nutrition_value" value="{{$list.nutritionId}}">
                                <span>{{$list.nutritionName}}:</span>
                                <input type="text"   class="nutrition_value"/>
                                <input type="hidden"   class="nutrition_value" value="{{$list.nutritionUnitEn}}"/>
                                <label>{{$list.nutritionUnitEn}}</label>
                                <input type="text"   class="nutrition_value"/><label>%</label>
                            </P>
                            {{/if}}
                            {{/foreach}}

                        </div>
                        </div>
                        <!-- 营养成分有保存记录的时候-->
                        {{else}}
                        <div class="nutrition_choice">
                                <h3 class="clearfix bus_info_01" id="bus_info_01">
                                    {{foreach from=$p_info.nutritionInfo key=key item=list}}
                                    <a href="javascript:;" {{if $key==0}}class="selected"{{/if}}>营养成分{{if $key==0}}{{else}}{{$key}}<i class="iconfont bus_del_01">&#xf01b0;</i>{{/if}}</a>
                                    {{/foreach}}
                                </h3>
                        </div>
                        <div class="nutrition">
                            {{foreach from=$p_info.nutritionInfo key=k item=list}}
                        <div class="nutrition_child" {{if $k!=0}}style="display:none"{{/if}}>
                            {{if $p_info.isGroup==2}}
                            <h3 class="clearfix"><span>产品名称:</span>
                                <select class="nutrition_name">
                                        <option>请选择</option>
                                        {{foreach from =$p_info.groupGoodsNames item=name}}
                                        <option value="{{$name}}" {{if $name==$list.proName}} selected="selected"{{/if}}>{{$name}}</option>
                                        {{/foreach}}
                                    </select>
                            </h3>
                            {{/if}}
                            <h4 class="clearfix">
                                    <span>成分名称</span>
                                    <select name="component" class="nutrition_names">
                                        <option value="含量" {{if $list.names=='含量'}}selected="selected"{{/if}}>含量</option>
                                        <option value="每100ml" {{if $list.names=='每100ml'}}selected="selected"{{/if}}>每100ml</option>
                                        <option value="每100g" {{if $list.names=='每100g'}}selected="selected"{{/if}}>每100g</option>
                                        <option value="每一枚" {{if $list.names=='每一枚'}}selected="selected"{{/if}}>每一枚</option>
                                    </select>
                                    <span>NVR%</span>
                            </h4>
                           {{foreach from=$list key=key item=value}}
                            {{if $key>1}}

                            <P class="clearfix p">
                                <input type="hidden" class="nutrition_value" value="{{$key}}">
                                <span>{{foreach from=$p_info.nutritionFiled.data key=keys item=lists}}
                                    {{if $lists.nutritionId==$key}}{{$lists.nutritionName}}{{$value.nutritionName}}{{/if}}
                                    {{/foreach}}:</span>
                                <input type="text"   class="nutrition_value" value="{{$value.shuzi}}"/>
                                <input type="hidden"   class="nutrition_value" value="{{$value.danwei}}"/>
                                <label>
                                    {{$value.danwei}}
                                </label>
                                <input type="text"   class="nutrition_value" value="{{$value.value}}"/><label>%</label>
                            </P>
                            {{/if}}
                            {{/foreach}}
                        </div>
                            {{/foreach}}
                        </div>
                        {{/if}}
                    </div>
                <div class="save_box">
                  <a href="javascript:;" id="" class="add_nutrient">添加营养成分</a> <a href="javascript:;" id="" class="add_param">添加参数</a> <a href="javascript:;" onclick="save_nutrient()">保存</a>
                </div>
                </div>
                <!--<div style="margin:10px 2px;"><a href="javascript:;" id="add_nutrient">增加营养成分</a></div>-->
            </div>
  		</div>
        <div class="zz_conforim"><a href="javascript:;" id="record_confirm">提交</a></div>
        <div class="zz_conforim"><a href="javascript:;" id="record_confirms">反馈</a></div>
	</div> 
</div>
<div class="newuser_pop" id="ps_newuser_pop">
    <div class="tit clearfix"><h4>{{$p_info.gtin}}条形码-审核</h4><a class="no_text close" href="javascript:;" title="关闭">关闭</a></div>
    <div class="content">
        <div class="login_main">
            <div class="login_form">
                <div class="clearfix one"><label for="user_name">商品条形码:</label><span class="zhmm">{{$p_info.gtin}}</span></div>
                <div class="clearfix one"><label for="user_name">商品名称:</label><span class="zhmm">{{$p_info.goodsName}}</span></div>
                <div class="clearfix one"><label for="user_name">商品类型:</label><span class="zhmm">{{$p_info.catName}}</span></div>
                <div class="clearfix one"><label for="user_name">备注:</label><textarea id="memo"></textarea></div>
                <a href="##" id="confirm_btn" class="confirm_btn" onclick="check(4)">确认</a>
            </div>
        </div>
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
<script type="text/javascript" src="{{$resource_url}}js/province_res.js"></script>
<!--dom预加载-->
<script type="text/javascript" src="{{$resource_url}}js/lazyload/jquery.fadeloader.js"></script>
<script type="text/javascript" src="{{$resource_url}}js/lazyload/jquery.lazyload.js"></script>
<script type="text/javascript">
    //全局变量
        var inputId='{{$p_info.inputId}}';
        var count=0;
        var goodsName='{{$p_info.goodsName}}';
        //删除的厂商信息的Id
        var shopIds="";
    //城市三级联动
    if($("#location_p").attr("class")!="business"){
        {{foreach from=$p_info.shop key=key item=list}}
        PCRES_OP('#location_p_{{$key}}', '#location_c_{{$key}}', '#location_a_{{$key}}', '{{$list.province}}', '{{$list.city}}', '{{$list.region}}');
        {{/foreach}}
    }else{
        PCRES_OP('#location_p', '#location_c', '#location_a', '上海市', '上海市', '黄浦区');
    }
    //图片的显示//
    var is="{{$picList.0.key}}";
    var storage;
    if(is){
        var iv2 = $("#viewer").iviewer(
                {
                    src: "{{$pic_path}}{{$picList.0.key}}"
                });
    }
    function check(){
        var memo=$("#memo").val();
        var data={feedbackInfo:memo,inputId:inputId}
            //进行保存验证
                $.ajax({
                    url:'{{$root_path}}input/feed',
                    data:data,
                    type:'POST',
                    dataType:'json',
                    success:function(e){
                        alert(e.msg);
                        window.location.reload();
                    }
                })
    }
    $("#ps_newuser_pop").pop({
        oMain:"#record_confirms",         //触发弹出层的元素。为空时直接弹出
        sEvent:"click",             //触发事件
        oClose:"#ps_newuser_pop .close", //关闭按钮
        bIframe:false,              //是否有iframe
        iSrc:"",                    //iframe地址
        bShade:true,                //是否有遮罩
        bShadeClose:false,          //是否点遮罩关闭
        fnAdditional:function(e){

        }
    });

    //配料、原料的验证
    function check_proName(e){
        var proName=$(e).val();
        var a=  $(".base_info select").size();
        var n=0;
        for(var i=0;i<a;i++){
            var proName1= $(".base_info select:eq("+i+")").val()
            if(proName1==proName){
                n++
            }
        }
        if(n>1){
            alert("已存在不能选择,请重选");
            $(e).val("");
        }
       //去检验其他原料配料
    }
    //厂商的保存
    function save_business(){
        //获取几个厂商
        var a=$(" .business_add").size();
        //添加删除的厂商的ID
        var t="[";
       for(var i =0;i<a;i++){
               //获取当前显示DIV的表单内属性的个数
               var len=$(".business_add:eq("+i+") .business").size();
               var array_business=['shopId','inputId','shopType','shopName','province','city','region','address','phone','sanitaryCertificateNO','productionCertificateNO'];
                var arr1="";
               for(var j=0;j<len;j++){
                   if(j==len-1){
                       arr1+="\""+array_business[j]+"\":\""+$(".business_add:eq("+i+") .business:eq("+j+")").val()+"\"";
                   }else{
                       arr1+="\""+array_business[j]+"\":\""+$(".business_add:eq("+i+") .business:eq("+j+")").val()+"\",";
                   }
               }
           if(i==a-1){
               t+="\""+i+"\":["+arr1+"]";
           }else{
               t+="\""+i+"\":["+arr1+"],";
           }
       }
        t+="]";
        $.ajax({
            url:'{{$root_path}}input/saveType',
            data:{info:t,filed:6,inputId:inputId},
            dataType:'json',
            type:'POST',
            success:function(e){
                //将对应的shopId添加到对应的
                var len_shopId=$(".shopId").size();
                for(var i=0; i<len_shopId;i++){
                    var value_shopId=$(".shopId:eq("+i+")");
                    if(value_shopId.val()==""){
                        value_shopId.val(e.shopIds);
                    }
                }
                alert(e.msg);
            }
        });
    }
    //基本信息的添加
    function add_base(e,f){
        var base_info =$("#"+e);
        var base_temp ='<P class="clearfix">'+
                '<label>'+f+'</label>'+
                '<select class="fieldName"><option>==请选择==</option><option value="1223B">1223B</option><option value="e323c">e323c</option></select>'+
                '<textarea class="fieldName"></textarea>'+
                '<em class="base_info_del base_info_del'+e+'" onclick="del_base(this)">删除</em>'+
                '</p>'
        base_info.append(base_temp);
        //重置加按钮的位置到最后
        var root = $("#"+e);
        var savebox = root.find(".save_box");
        root.append(savebox);
    }
    //删除基本信息
    function del_base(e){
        $(e).parent().remove();
    }
    //分类保存
    function save_product(e){
            var a = $("#multiple_sku p").size();
            var v = "";
        if(e==2) {
            for (var i = 0; i < a; i++) {
                if (i == a - 1) {
                    v += $("#multiple_sku input:eq(" + i + ")").val();
                } else {
                    v += $("#multiple_sku input:eq(" + i + ")").val() + ",";
                }
            }
        }
        $.ajax({
            url:'{{$root_path}}input/saveType',
            data:{info:v,filed:1,inputId:inputId},
            dataType:'text',
            type:'POST',
            success:function(e){
                alert(e);
            }
        });
    }
    //基本信息的保存
   function save_baseInfo(){
       var len=$(".base_info .p").size();
       var val="[";
       for(var i=0;i<len;i++){
           var name=$(".base_info .p:eq("+i+") .fieldName").val();
           var field=$(".base_info .p:eq("+i+") .hidden").val();
           //获取fieldname的个数
           if(i==len-1){
               val +="\""+field+"\":\""+name+"\"";
           }else{
               val +="\""+field+"\":\""+name+"\",";
           }
       }
       //获取下拉多选的个数
       var len_base=$(".base_info .base_info_two").size();
       for(var h=0;h<len_base;h++){
           //获取每个多选的ID
           var id=$(".base_info .base_info_two:eq("+h+")").attr("id");
           //获取每个ID下的P的个数
           var len_base2=$(".base_info #"+id+" p").size();
           //循环遍历每个ID的P
           val +=",\""+id+"\":[";
           for(var i=0;i<len_base2;i++){
               var val1="";
               //获取每个P下的fieldName的个数
               var len1=$(".base_info #"+id+" p:eq("+i+") .fieldName").size();
               for(var j=0;j<len1;j++){
                   //获取每个P下的fieldName下的值
                   var name1=$(".base_info #"+id+" p:eq("+i+") .fieldName:eq("+j+")").val();
                   if(j==len1-1){
                       val1 +="\""+j+"\":\""+name1+"\"";
                   }else{
                       val1 +="\""+j+"\":\""+name1+"\",";
                   }
               }
               if(i==len_base2-1){
                   val+="\""+ i+"\":["+val1+"]";
               }else{
                   val+="\""+ i+"\":["+val1+"],";
               }
           }
           val+="]"
       }
       val+="]";
       $.ajax({
           url:'{{$root_path}}input/saveType',
           data:{info:val,filed:2,inputId:inputId,goodsName:goodsName},
           dataType:'json',
           type:'POST',
           success:function(e){
               alert(e.msg);
           }
       });
    }
//扩充信息的保存
    function save_extendInfo(){
        var len=$(".extend_info p").size();
        var val="[";
        for(var i=0;i<len;i++) {
            var name = $(".extend_info p:eq(" + i + ") .fieldName").val();
            var field = $(".extend_info p:eq(" + i + ") .hidden").val();
            //获取fieldname的个数
            var len1 = $(".extend_info p:eq(" + i + ") .fieldName").size();
            if (len1 == 1) {
                if (i == len - 1) {
                    val += "\"" + field + "\":\"" + name + "\"";
                } else {
                    val += "\"" + field + "\":\"" + name + "\",";
                }
            } else if (len1 == 2) {
                var val1 = "";
                for (var j = 0; j < len1; j++) {
                    var name1 = $(".base_info p:eq(" + i + ") .fieldName:eq(" + j + ")").val();
                    if (j == len1 - 1) {
                        val1 += "\"" + j + "\":\"" + name1 + "\"";
                    } else {
                        val1 += "\"" + j + "\":\"" + name1 + "\",";
                    }
                }
                val += "\"" + field + "\":[" + val1 + "],";
            }
        }
        val+="]";
        $.ajax({
            url:'{{$root_path}}input/saveType',
            data:{info:val,filed:3,inputId:inputId},
            dataType:'json',
            type:'POST',
            success:function(e){
                alert(e.msg);
            }
        });
    }
    //保存产商
    //营养成分的保存
    function save_nutrient(f){
        /*先获取几个营养成分*/
        var nutrition_l=$("#nutrition_inform .nutrition_child").size();
        var num1="[";
       for(var j=0;j<nutrition_l;j++) {
           var a = $(".nutrition_child:eq(" + j + ") p").size();
           //产品名称
           var b=$(".nutrition_child:eq(" + j + ")  .nutrition_name").val();
           //成分名称
           var c=$(".nutrition_child:eq(" + j + ")  .nutrition_names").val();
           if(b!=""){
               var p_val = "\"proName\":\""+b+"\",\"names\":\""+c+"\",";
           }
           //获取所有某一个营养分类的值p标签的值
           for (var i = 0; i < a; i++) {
               //获取每个P里面的值
               var p_l = $(".nutrition_child:eq(" + j + ") p:eq(" + i + ") .nutrition_value").size();
               var pId=$(".nutrition_child:eq(" + j + ") p:eq(" + i + ") .nutrition_value:eq(0)").val();
               if(p_l!=0){
                   var val="\""+ pId + "\":[";
                   var v="";
               }
               for (var h = 1; h < p_l; h++) {
                   if (h == p_l - 1) {
                       if(h==1){
                           v="shuzi";
                       }else if(h==2){
                           v="danwei";
                       }else if(h==3){
                           v="value";
                       }
                       val +="\""+ v + "\":\"" + $(".nutrition_child:eq(" + j + ") p:eq(" + i + ") .nutrition_value:eq(" + h + ")").val() + "\"";
                   } else {
                       if(h==1){
                           v="shuzi";
                       }else if(h==2){
                           v="danwei";
                       }else if(h==3){
                           v="value";
                       }
                       val += "\"" + v + "\":\"" + $(".nutrition_child:eq(" + j + ") p:eq(" + i + ") .nutrition_value:eq(" + h + ")").val() + "\",";
                   }
               }
               val+="]";

               if (i == a - 1) {
                   p_val +="" + val + "";
               } else {
                   p_val += "" + val + "" + ",";
               }
           }
           //获取所有class="p3"的值
           if(j==nutrition_l-1){
               num1 += "\"" + j + "\":[" + p_val + "]]";
           }else{
               num1 += "\"" + j + "\":[" + p_val + "],";
           }
       }
        $.ajax({
            url:'{{$root_path}}input/saveType',
            data:{info:num1,filed:4,inputId:inputId},
            dataType:'json',
            type:'POST',
            success:function(e){
                if(f==1){
                    alert("营养成分删除成功");
                 }else{
                    alert(e.msg);
                }
            }
        });
    }
    //选择营养成分参数时
    function nutritionUnitEn(e){
        var size=$(".nutritionUnitEn").size()-1;
        var c= $(".nutritionUnitEn:eq("+size+") option:selected").attr("class");
        $(".nutritionUnitEns:eq("+size+")").html(c);
    }
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
		//分类-组合包装
		$("#sku_cf_01").click(function(){
			$("#multiple_sku").hide();
            $(".sku_cf_0001").show();
            $(".sku_cf_0002").hide();
            $(".sku_cf_002").hide();
            $(".sku_cf_001").hide();
            $(".multiple_sku_add").hide();
		});
		$("#sku_cf_02").click(function(){
			$("#multiple_sku").show();
            $(".sku_cf_0002").show();
            $(".sku_cf_0001").hide();
            $(".sku_cf_002").hide();
            $(".sku_cf_001").hide();
            $(".multiple_sku_add").show();
			//增加分类下的产品名称
		});
    $("#cf_add").click(function(){
        var multiple_sku_add = $(".multiple_sku_add");
       // multiple_sku_add.show();
        var cf_temp ='<p class="clearfix">'+
                '<label>产品名称：</label>'+
                '<input type="text" class="product"/>'+
                '<span class="cf_del">删除</span>'+
                '</p>';
        multiple_sku_add.append(cf_temp);

    });
    //组合包装的删除
    $("#multiple_sku .multiple_sku_add").on('click','span.cf_del',function(){
        $(this).parent().remove();
    });
		//营养成分表
			var tabCounter_zz = 0;
        tabCounter_zz=$("#bus_info_01 a").size();
			$(".add_nutrient").click(function(){
			var n_bus=$("#bus_info_01");
			var n_temp_bus='<a href="javascript:;" class="'+tabCounter_zz+'">营养成分'+tabCounter_zz+'<i class="iconfont bus_del_01">&#xf01b0;</i></a>'
					n_bus.append(n_temp_bus);
					//营养成分追加完成后选项
                var u_list = $(".nutrition");
                var U_temp =
                        '<div class="nutrition_child">'+
                        '  <h3 class="clearfix"><span>产品名称:</span>'+
                        '<select class="nutrition_name" nutrition_value>'+
                        {{foreach from =$p_info.groupGoodsNames item=name}}
                            '<option value="{{$name}}">{{$name}}</option>'+
                        {{/foreach}}
                        '</select>'+
                        '</h3>'+
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
                        {{foreach from=$p_info.nutritionFiled.data item=list}}
                        {{if $list['isDefault']==1}}
                        '<P class="clearfix p">'+
                        '<input type="hidden" class="nutrition_value" value="{{$list.nutritionId}}">'+
                        '<span>{{$list.nutritionName}}:</span>'+
                        '<input type="text"   class="nutrition_value"/><label>{{$list.nutritionUnitEn}}</label>'+
                        ' <input type="hidden"   class="nutrition_value" value="{{$list.nutritionUnitEn}}"/>'+
                        '<input type="text"   class="nutrition_value"/><label>%</label> </P>'+
                {{/if}}
                {{/foreach}}
                        '</div>';
                u_list.append(U_temp);
                //显示最后一个营养成分
                var nutrient_len=$(".nutrition_child").size();
                for(var i=0;i<nutrient_len;i++){
                    if(i==nutrient_len-1){
                        //当前营养成分的显示
                        $(".nutrition_child:eq("+i+")").show();
                        $(".nutrition_choice h3 a:eq("+i+")").addClass("selected").siblings().removeClass("selected");
                    }else{
                        $(".nutrition_child:eq("+i+")").hide();
                    }
                }
                //添加之后必须绑定此事件才能触发切换营养成分事件
                $("#bus_info_01  a").click(function(){
                    var index = 0;
                    $(this).addClass("selected").siblings().removeClass("selected");
                    var index=$("#bus_info_01 a").index(this);
                    $(".nutrition .nutrition_child").eq(index).show().stop(true, true).siblings().hide();
                });
                //营养成分的删除
                $(".bus_info_01 .bus_del_01").unbind().on('click',function(){
                    var index=0;
                    index=$(".bus_info_01 .bus_del_01").index(this);
                    //移除营养成分
                    $(".nutrition .nutrition_child").eq(index+1).remove();
                    //显示前一个营养成分
                    $(".nutrition .nutrition_child").eq(index).show();
                    $(this).parent().remove();
                    $(".bus_info_01 a").eq(index).addClass("selected").siblings().removeClass("selected");
                    save_nutrient(1)
                });
			});
        //营养成分的删除
        $(".bus_info_01 .bus_del_01").unbind().on('click',function(){
            var index=0;
            index=$(".bus_info_01 .bus_del_01").index(this);
            //移除营养成分
            $(".nutrition .nutrition_child").eq(index+1).remove();
            //显示前一个营养成分
            $(".nutrition .nutrition_child").eq(index).show();
            $(this).parent().remove();
            $(".bus_info_01 a").eq(index).addClass("selected").siblings().removeClass("selected");
            //掉营养成分保存接口
            save_nutrient(1)
        });
			//营养成分增加参数
        $(".add_param").click(function(){
					  var ul = $(".nutrition_child");
					  var temp =  '<p class="clearfix add_field p1">'+
								  '<select style="margin-left:2px; margin-right:10px;" class="nutrition_value nutritionUnitEn" onchange="nutritionUnitEn(this)">' +
                                  '<option>==请选择==</option>' +
                                      {{foreach from=$p_info.nutritionFiled.data item=list}}
                                      {{if $list.isDefault!=1}}
                                            '<option value="{{$list.nutritionId}}" class="{{$list.nutritionUnitEn}}">{{$list.nutritionName}}--{{$list.nutritionUnitEn}}</option>'+
                                      {{/if}}
                                      {{/foreach}}
                                  '</select>'+
                                  '<input type="text" class="nutrition_value"/>'+
								  '<label class="nutritionUnitEns">c</label>'+
								  '<input type="text" class="nutrition_value"/>'+
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
		//增加营养成分单位
			//增加厂商
		 	var tabCounter = 0;
			$("#add_tab").click(function(){
					var bus=$("#bus_info h3");
                  tabCounter=$("#bus_info h3 a").size();
					var temp_bus='<a href="javascript:;">厂商'+tabCounter+'<i class="iconfont bus_del">&#xf01b0;</i></a>'
					bus.append(temp_bus);
                    //增加厂商
                var business=$(".business_choice");
              var tmp='<div class="business_add">'+
                        '<input type="hidden" class="business shopId" value="{{$list.shopId}}">'+
                        '<input type="hidden" class="business inputIds" value="{{$p_info.inputId}}">'+
                        '<p class="clearfix">'+
                        '<label>厂商类别：</label>'+
                '<select id="inputId" class="business">'+
                        '<option value="">===请选择===</option>'+
                        '<option value="委托商">1：委托商</option>'+
                '<option value="生产商">2：生产商</option>'+
                '<option value="制造商">3：制造商</option>'+
                '<option value="经销商">4：经销商</option>'+
                '<option value="代理商">5：代理商</option>'+
               '<option value="分装商">6：分装商</option>'+
                '<option value="总代理商">7：总代理商</option>'+
                '<option value="总经销商">8：总经销商</option>'+
                '</select>'+
               '</p>'+
                '<p class="clearfix">'+
                        '<label>厂商名称：</label>'+
                '<input type="text" id="shopName" class="business"/>'+
                        '</p>'+
                        '<p class="clearfix">'+
                        '<label>厂商地址：</label>'+
                '<select name="location_p" id="location_p_'+tabCounter+'" class="business" >'+
                        '</select>'+
                        '<select name="location_c_"'+tabCounter+' id="location_c_'+tabCounter+'" class="business">'+
                        '</select>'+
                        '<select name="location_a_'+tabCounter+'" id="location_a_'+tabCounter+'" class="business">'+
                        '</select>'+
                      '</p>'+
                        '<p class="clearfix">'+
                        '<label></label>'+
                        '<input type="text" id="address" class="business"/>'+
                        '</p>'+
                        '<p class="clearfix">'+
                        '<label>厂商电话：</label>'+
                '<input type="text" id="phone" class="business"/>'+
                        '</p>'+
                        '<p class="clearfix">'+
                        '<label>卫生许可证：</label>'+
                '<input type="text" id="sanitaryCertificateNO" class="business"/>'+
                        '</p>'+
                        '<p class="clearfix">'+
                        '<label>生产许可证：</label>'+
                '<input type="text" id="productionCertificateNO" class="business"/>'+
                        '</p>'+
                       '</div>';
                business.append(tmp);
                //加载城市三级联动
                PCRES_OP('#location_p_'+tabCounter, '#location_c_'+tabCounter, '#location_a_'+tabCounter, '其它', '', '');
                //显示当前显示的厂商
                var business_len=$(".business_add").size();
                for(var i=0;i<business_len;i++){
                    if(i==business_len-1){
                        //当前营养成分的显示
                        $(".business_add:eq("+i+")").show();
                        $("#bus_info h3 a:eq("+i+")").addClass("selected").siblings().removeClass("selected");
                    }else{
                        $(".business_add:eq("+i+")").hide();
                    }
                }
                //厂商选项卡
                $("#bus_info a").click(function(){
                    var index = 0;
                    $(this).addClass("selected").siblings().removeClass("selected");
                     index=$("#bus_info a").index(this);
                 //   alert(index);
                    $(".business_choice .business_add").eq(index).show().stop(true, true).siblings().hide();
                });
                //删除厂商
                $("#bus_info  .bus_del").unbind().on('click',function() {
                    var index = 0;
                    index = $("#bus_info .bus_del").index(this);
                    var shopId = $(".business_choice .business_add:eq(" + (index + 1) + ") .shopId").val();
                    $(".business_choice .business_add").eq(index + 1).remove();
                    $(".business_choice .business_add").eq(index).show();
                    $("#bus_info a").eq(index).addClass("selected").siblings().removeClass("selected");
                    $(this).parent().remove();
                    //将删除的厂商Id存进全局变量shopIds
                    $.ajax({
                        url:'{{$root_path}}input/delShop',
                        data:{shopId:shopId},
                        dataType:'text',
                        type:'POST',
                        success:function(e){
                            if(e=="null"){
                                alert("删除成功")
                            }
                        }
                    })
                })
			});
        //厂商删除选项卡
        $("#bus_info  .bus_del").unbind().on('click',function(){
            var index=0;
            index=$("#bus_info .bus_del").index(this);
            var shopId=	$(".business_choice .business_add:eq("+(index+1)+") .shopId").val();
            //将删除的厂商Id存进全局变量shopIds
            //移除当前厂商
            $(".business_choice .business_add").eq(index+1).remove();
            //显示前一个厂商
            $(".business_choice .business_add").eq(index).show();
            $(this).parent().remove();
            $("#bus_info a").eq(index).addClass("selected").siblings().removeClass("selected");
            $.ajax({
                url:'{{$root_path}}input/delShop',
                data:{shopId:shopId},
                dataType:'text',
                type:'POST',
                success:function(e){
                    if(e=="null"){
                        alert("删除成功")
                    }
                }
            })
        });
            //最后的提交
            $("#record_confirm").on("click",function(){
                var input_size=$("input").size();
                var select_size=$("select").size();
                var input_len=0;
                var select_len=0;
                for(var i=0;i<input_size;i++){
                    input_len+=$("input:eq("+i+")").val().length;
                }
                for(var i=0;i<select_size;i++){
                    select_len+=$("input:eq("+i+")").val().length;
                }
                var len=input_len+select_len;
                //进行保存验证
                $.ajax({
                    url:'{{$root_path}}input/saveType',
                    data:{inputCount:len,inputId:inputId,filed:5},
                    type:'POST',
                    dataType:'json',
                    success:function(e){
                        alert(e.msg);
                        window.location.reload();
                    }
                })
            })
}); //end           	
</script>
</body>
</html>
