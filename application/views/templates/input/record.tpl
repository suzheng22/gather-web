<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>数据采集系统</title>
    {{include file='public/css.tpl'}}
    <link rel="stylesheet" type="text/css" href="{{$resource_url}}style/jquery.iviewer.css"/>

<style type="text/css">
        select{opacity:1;}
        #nav_info li span{width:150px;}
        #nav_info li em{width:140px;}
        .right_mid .cf p select{width:120px;}
        .v_show{ padding-left:0px;}

</style>
</head>
<body ><!--style="overflow-y:hidden"-->


<div class="j-top">
    <div class="j-top-warp">
         <div class="j-top-warp">
        <h3><img src="{{$resource_url}}images/logo.png"/></h3>
        <div class="top_right"><span id="user_name_show">{{$userInfo.trueName}}</span><em>,欢迎你</em><a href="{{$root_path}}user/editPwd">修改密码</a><a href="{{$root_path}}user/logout">退出</a></div>
        </div>
        <ul class="clearfix" id="nav_info">
            <li class="black"><em>商品条形码:</em><span >{{$p_info.gtin}}</span></li>
            <li class="black"><em>可录入商品总数:</em><span>{{$p_info.inputGoodsCount}}</span></li>
            <li class="black"><em>今录入商品总数:</em><span>{{$p_info.inputGoodsCountToday}}</span></li>
            <li class="black"><em>今录入字数:</em><span>{{$p_info.inputCountToday}}</span></li>
        </ul>
    </div>
</div>

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
  	<div class="right" id="right">
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
        <div class="zz_conforim"><a href="javascript:;" id="record_confirm">提交</a><a href="javascript:;" id="record_confirms">反馈</a></div>
      
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
<script type="text/javascript" src="{{$resource_url}}js/province_res.js"></script>
<!--dom预加载-->
<script type="text/javascript" src="{{$resource_url}}js/lazyload/jquery.fadeloader.js"></script>
<script type="text/javascript" src="{{$resource_url}}js/lazyload/jquery.lazyload.js"></script>
{{include file='public/record.tpl'}}

</body>
</html>
