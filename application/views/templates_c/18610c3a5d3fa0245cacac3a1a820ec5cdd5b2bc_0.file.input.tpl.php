<?php /* Smarty version 3.1.27, created on 2015-11-02 08:51:52
         compiled from "D:\wamp\www\collect_web\application\views\templates\input.tpl" */ ?>
<?php
/*%%SmartyHeaderCode:2093456371618cb4013_74092627%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '18610c3a5d3fa0245cacac3a1a820ec5cdd5b2bc' => 
    array (
      0 => 'D:\\wamp\\www\\collect_web\\application\\views\\templates\\input.tpl',
      1 => 1446450643,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2093456371618cb4013_74092627',
  'variables' => 
  array (
    'resource_url' => 0,
    'userInfo' => 0,
    'skuInfo' => 0,
    'info' => 0,
    'val' => 0,
    'root_path' => 0,
  ),
  'has_nocache_code' => false,
  'version' => '3.1.27',
  'unifunc' => 'content_56371618e4e2f2_35258959',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_56371618e4e2f2_35258959')) {
function content_56371618e4e2f2_35258959 ($_smarty_tpl) {

$_smarty_tpl->properties['nocache_hash'] = '2093456371618cb4013_74092627';
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>数据采集系统</title>
<link rel="stylesheet" type="text/css" href="<?php echo $_smarty_tpl->tpl_vars['resource_url']->value;?>
style/global.css"/>
<link rel="stylesheet" type="text/css" href="<?php echo $_smarty_tpl->tpl_vars['resource_url']->value;?>
style/head.css" />
<link rel="stylesheet" type="text/css" href="<?php echo $_smarty_tpl->tpl_vars['resource_url']->value;?>
style/public.css"/>
<link rel="stylesheet" type="text/css" href="<?php echo $_smarty_tpl->tpl_vars['resource_url']->value;?>
style/iconfont.css"/>

 
</head>

<body>
<!------------------------顶部j-top------------------------------------->
<div class="j-top">
	<div class="j-top-warp">
		<div class="j-top-warp">
			<h3>录入系统</h3>
           <div class="top_right"><span><?php echo $_smarty_tpl->tpl_vars['userInfo']->value['trueName'];?>
</span><em>,欢迎你</em><a href="#">退出</a></div>
        </div>
        
        <ul class="clearfix" id="nav_info">
            <li class="black"><em>已完成sku:</em><span><?php echo $_smarty_tpl->tpl_vars['skuInfo']->value['baseInfo']['s1'];?>
</span></li>
            <li class="black"><em>已完成字符数:</em><span><?php echo $_smarty_tpl->tpl_vars['skuInfo']->value['baseInfo']['s2'];?>
</span></li>
            <li class="black"><em>待修改SKU:</em><span><?php echo $_smarty_tpl->tpl_vars['skuInfo']->value['baseInfo']['s3'];?>
</span></li>
       </ul>
    </div> 	
</div>
<!------------------------顶部结束--------------------------------------->
<!--------------------------- 录入信息------------------------------------> 
<div class="record_info_warp">
	<div class="left">
			<div id="pageContent">
				<div id="imgContainer">
				<?php
$_from = $_smarty_tpl->tpl_vars['skuInfo']->value['images'][0];
if (!is_array($_from) && !is_object($_from)) {
settype($_from, 'array');
}
$_smarty_tpl->tpl_vars['info'] = new Smarty_Variable;
$_smarty_tpl->tpl_vars['info']->_loop = false;
$_smarty_tpl->tpl_vars['__foreach_name'] = new Smarty_Variable(array('iteration' => 0));
foreach ($_from as $_smarty_tpl->tpl_vars['info']->value) {
$_smarty_tpl->tpl_vars['info']->_loop = true;
$_smarty_tpl->tpl_vars['__foreach_name']->value['iteration']++;
$_smarty_tpl->tpl_vars['__foreach_name']->value['first'] = $_smarty_tpl->tpl_vars['__foreach_name']->value['iteration'] == 1;
$foreach_info_Sav = $_smarty_tpl->tpl_vars['info'];
?>

									<?php if ((isset($_smarty_tpl->tpl_vars['__foreach_name']->value['first']) ? $_smarty_tpl->tpl_vars['__foreach_name']->value['first'] : null)) {?>
									<img id="imageFullScreen" src="<?php echo $_smarty_tpl->tpl_vars['info']->value;?>
"  alt=""/>
									<?php }?>
								<?php
$_smarty_tpl->tpl_vars['info'] = $foreach_info_Sav;
}
?>
			    	
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
								<?php
$_from = $_smarty_tpl->tpl_vars['skuInfo']->value['images'][0];
if (!is_array($_from) && !is_object($_from)) {
settype($_from, 'array');
}
$_smarty_tpl->tpl_vars['info'] = new Smarty_Variable;
$_smarty_tpl->tpl_vars['info']->_loop = false;
$_smarty_tpl->tpl_vars['__foreach_name'] = new Smarty_Variable(array('iteration' => 0));
foreach ($_from as $_smarty_tpl->tpl_vars['info']->value) {
$_smarty_tpl->tpl_vars['info']->_loop = true;
$_smarty_tpl->tpl_vars['__foreach_name']->value['iteration']++;
$_smarty_tpl->tpl_vars['__foreach_name']->value['first'] = $_smarty_tpl->tpl_vars['__foreach_name']->value['iteration'] == 1;
$foreach_info_Sav = $_smarty_tpl->tpl_vars['info'];
?>
                                    <li <?php if ((isset($_smarty_tpl->tpl_vars['__foreach_name']->value['first']) ? $_smarty_tpl->tpl_vars['__foreach_name']->value['first'] : null)) {?>class="active"<?php }?>><img src="<?php echo $_smarty_tpl->tpl_vars['info']->value;?>
" /></li>
								<?php
$_smarty_tpl->tpl_vars['info'] = $foreach_info_Sav;
}
?>
                                    
                                  
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
                                    <?php
$_from = $_smarty_tpl->tpl_vars['skuInfo']->value['images'][1];
if (!is_array($_from) && !is_object($_from)) {
settype($_from, 'array');
}
$_smarty_tpl->tpl_vars['info'] = new Smarty_Variable;
$_smarty_tpl->tpl_vars['info']->_loop = false;
foreach ($_from as $_smarty_tpl->tpl_vars['info']->value) {
$_smarty_tpl->tpl_vars['info']->_loop = true;
$foreach_info_Sav = $_smarty_tpl->tpl_vars['info'];
?>
                                    <li class=""><img src="<?php echo $_smarty_tpl->tpl_vars['info']->value;?>
" /></li>
								<?php
$_smarty_tpl->tpl_vars['info'] = $foreach_info_Sav;
}
?>
                                   
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
			<h2>条码：<?php echo $_smarty_tpl->tpl_vars['skuInfo']->value['baseInfo']['gtin'];?>
</h2>
			<input type="hidden"  value="<?php echo $_smarty_tpl->tpl_vars['skuInfo']->value['baseInfo']['gtin'];?>
" id="gtin"/>
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
					<input type="text" id="name" value="<?php echo $_smarty_tpl->tpl_vars['skuInfo']->value['goods']['info']['name'];?>
" />
                </li>
                <li class="clearfix">
                	<label>品牌：</label>
					<input type="text" id="brand" value="<?php echo $_smarty_tpl->tpl_vars['skuInfo']->value['goods']['info']['brand'];?>
" />
                </li>
                <li class="clearfix">
                	<label>类型：</label>
					<input type="text" id="good_class" value="<?php echo $_smarty_tpl->tpl_vars['skuInfo']->value['goods']['info']['good_class'];?>
"/>
                </li>
                <li class="clearfix">
                	<label>产地：</label>
					<input type="text" id="mfrs" value="<?php echo $_smarty_tpl->tpl_vars['skuInfo']->value['goods']['info']['mfrs'];?>
"/>
                </li>
                 <li class="clearfix">
                	<label>标准号：</label>
					<input type="text" id="produce_no" value="<?php echo $_smarty_tpl->tpl_vars['skuInfo']->value['goods']['info']['produce_no'];?>
"/>
                </li>
                 <li class="clearfix">
                	<label>卖点：</label>
					<input type="text" id="sell_point" value="<?php echo $_smarty_tpl->tpl_vars['skuInfo']->value['goods']['info']['sell_point'];?>
"/>
                </li>
                <a href="javascript:;" onclick="save_base_info();">保存</a>
            </ul>
        	<ul style="display:none;">
					<li class="clearfix">
                	<label>类型：</label>
					<input type="hidden" id="factory_<?php echo $_smarty_tpl->tpl_vars['skuInfo']->value['goods']['manu'][0]['id'];?>
"  value="$skuInfo.goods.manu.0.id"/>
					<select id="type">
					<option value="">请选择</option>
					<?php
$_from = $_smarty_tpl->tpl_vars['skuInfo']->value['factoryList'];
if (!is_array($_from) && !is_object($_from)) {
settype($_from, 'array');
}
$_smarty_tpl->tpl_vars['val'] = new Smarty_Variable;
$_smarty_tpl->tpl_vars['val']->_loop = false;
foreach ($_from as $_smarty_tpl->tpl_vars['val']->value) {
$_smarty_tpl->tpl_vars['val']->_loop = true;
$foreach_val_Sav = $_smarty_tpl->tpl_vars['val'];
?>
						<option <?php if ($_smarty_tpl->tpl_vars['skuInfo']->value['goods']['manu'][0]['type_id'] == $_smarty_tpl->tpl_vars['val']->value['id']) {?>selected="selected"<?php }?> value="<?php echo $_smarty_tpl->tpl_vars['val']->value['id'];?>
"   ><?php echo $_smarty_tpl->tpl_vars['val']->value['name'];?>
</option>
					<?php
$_smarty_tpl->tpl_vars['val'] = $foreach_val_Sav;
}
?>
					</select>
                </li>
            	<li class="clearfix">
                	<label>名称：</label>
					<input type="text" id="mName" value="<?php echo $_smarty_tpl->tpl_vars['skuInfo']->value['goods']['manu'][0]['mName'];?>
" />
                </li>
                <li class="clearfix">
                	<label>卫生许可证：</label>
					<input type="text" id="number1" value="<?php echo $_smarty_tpl->tpl_vars['skuInfo']->value['goods']['manu'][0]['number1'];?>
"  />
                </li>
				<li class="clearfix">
                	<label>生产许可证：</label>
					<input type="text" id="number2" value="<?php echo $_smarty_tpl->tpl_vars['skuInfo']->value['goods']['manu'][0]['number2'];?>
"  />
                </li>
				<li class="clearfix">
                	<label>电话：</label>
					<input type="text" id="phone" value="<?php echo $_smarty_tpl->tpl_vars['skuInfo']->value['goods']['manu'][0]['phone'];?>
" />
                </li>
				<li class="clearfix">
                	<label>地址：</label>
					<input type="text" id="address" value="<?php echo $_smarty_tpl->tpl_vars['skuInfo']->value['goods']['manu'][0]['address'];?>
" />
                </li>
			
                <a href="javascript:;" onclick="save_factory_info(<?php echo $_smarty_tpl->tpl_vars['skuInfo']->value['goods']['manu'][0]['id'];?>
);">保存</a>
            </ul>
            <ul style="display:none;">
			<?php
$_from = $_smarty_tpl->tpl_vars['skuInfo']->value['type']['basic_info'];
if (!is_array($_from) && !is_object($_from)) {
settype($_from, 'array');
}
$_smarty_tpl->tpl_vars['val'] = new Smarty_Variable;
$_smarty_tpl->tpl_vars['val']->_loop = false;
$_smarty_tpl->tpl_vars['__foreach_name'] = new Smarty_Variable(array('iteration' => 0));
foreach ($_from as $_smarty_tpl->tpl_vars['val']->value) {
$_smarty_tpl->tpl_vars['val']->_loop = true;
$_smarty_tpl->tpl_vars['__foreach_name']->value['iteration']++;
$_smarty_tpl->tpl_vars['__foreach_name']->value['first'] = $_smarty_tpl->tpl_vars['__foreach_name']->value['iteration'] == 1;
$foreach_val_Sav = $_smarty_tpl->tpl_vars['val'];
?>
            	<li <?php if ((isset($_smarty_tpl->tpl_vars['__foreach_name']->value['first']) ? $_smarty_tpl->tpl_vars['__foreach_name']->value['first'] : null)) {?>class="active"<?php }?>>
                	<label><?php echo $_smarty_tpl->tpl_vars['val']->value['name'];?>
：</label>
					<input type="text" id="<?php echo $_smarty_tpl->tpl_vars['val']->value['field'];?>
" class="basic" value="<?php echo $_smarty_tpl->tpl_vars['skuInfo']->value['goods']['typeBasicInfo'][$_smarty_tpl->tpl_vars['val']->value['field']];?>
" />
                </li>
			<?php
$_smarty_tpl->tpl_vars['val'] = $foreach_val_Sav;
}
?>
                <a href="javascript:;" onclick="save_basic('basic');">保存</a>
            </ul>
            <ul style="display:none;">
            	<?php
$_from = $_smarty_tpl->tpl_vars['skuInfo']->value['type']['extend_info'];
if (!is_array($_from) && !is_object($_from)) {
settype($_from, 'array');
}
$_smarty_tpl->tpl_vars['val'] = new Smarty_Variable;
$_smarty_tpl->tpl_vars['val']->_loop = false;
$_smarty_tpl->tpl_vars['__foreach_name'] = new Smarty_Variable(array('iteration' => 0));
foreach ($_from as $_smarty_tpl->tpl_vars['val']->value) {
$_smarty_tpl->tpl_vars['val']->_loop = true;
$_smarty_tpl->tpl_vars['__foreach_name']->value['iteration']++;
$_smarty_tpl->tpl_vars['__foreach_name']->value['first'] = $_smarty_tpl->tpl_vars['__foreach_name']->value['iteration'] == 1;
$foreach_val_Sav = $_smarty_tpl->tpl_vars['val'];
?>
            	<li <?php if ((isset($_smarty_tpl->tpl_vars['__foreach_name']->value['first']) ? $_smarty_tpl->tpl_vars['__foreach_name']->value['first'] : null)) {?>class="active"<?php }?>>
                	<label><?php echo $_smarty_tpl->tpl_vars['val']->value['name'];?>
：</label>
					<input type="text" id="<?php echo $_smarty_tpl->tpl_vars['val']->value['field'];?>
" class="extend" value="<?php echo $_smarty_tpl->tpl_vars['skuInfo']->value['goods']['typeBasicInfo'][$_smarty_tpl->tpl_vars['val']->value['field']];?>
" />
                </li>
			<?php
$_smarty_tpl->tpl_vars['val'] = $foreach_val_Sav;
}
?>
                <a href="javascript:;" onclick="save_basic('extend');">保存</a>
            </ul>
            <ul style="display:none;">
            	<li class="clearfix">
                	<label>44：</label>
					<input type="text" />
                </li>
                <a href="javascript:;">保存</a>
            </ul>
		</div>
		<a href="javascript:;" id="record_confirm">提交</a>	
  	</div>
  	
</div>    	


<?php echo '<script'; ?>
 type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['resource_url']->value;?>
js/imgfd/jquery-1.8.2.min.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['resource_url']->value;?>
js/defined.js"><?php echo '</script'; ?>
> 
<?php echo '<script'; ?>
 type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['resource_url']->value;?>
js/record.js"><?php echo '</script'; ?>
> 
<?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['resource_url']->value;?>
js/img_zoom/e-smart-zoom-jquery.min.js"><?php echo '</script'; ?>
> 
<?php echo '<script'; ?>
 type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['resource_url']->value;?>
js/json2.js"><?php echo '</script'; ?>
>
<!--图片延时加载-->
<?php echo '<script'; ?>
 type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['resource_url']->value;?>
js/lazyload/jquery.lazyload.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 type="text/javascript">  
	$(function(){ 
		$("img").lazyload({ 
		});
		
		$("#nav_info").fiexd({top:"-2px"}); 
	}); 
	
	function save_base_info(){
		var name=$("#name").val();
		var brand=$("#brand").val();
		var good_class=$("#good_class").val();
		var mfrs=$("#mfrs").val();
		var produce_no=$("#produce_no").val();
		var sell_point=$("#sell_point").val();
		var gtin=$("#gtin").val();
		$.post("<?php echo $_smarty_tpl->tpl_vars['root_path']->value;?>
input/saveBaseInfo",{"name":name,"brand":brand,"good_class":good_class,"mfrs":mfrs,"produce_no":produce_no,"sell_point":sell_point,"gtin":gtin},
		  function(data){
			//$('#msg').html("please enter the email!");
			alert(data);
			//$('#msg').html(data);
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
		$.post("<?php echo $_smarty_tpl->tpl_vars['root_path']->value;?>
input/saveFactoryInfo",{"mName":mName,"number1":number1,"number2":number2,"phone":phone,"address":address,"type":type,"gtin":gtin,"fid":id},
		  function(data){
			//$('#msg').html("please enter the email!");
			alert(data);
			//$('#msg').html(data);
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
		$.post("<?php echo $_smarty_tpl->tpl_vars['root_path']->value;?>
input/saveBasicInfo",{"str":str,"gtin":gtin},
		  function(data){
			//$('#msg').html("please enter the email!");
			alert(data);
			//$('#msg').html(data);
		  },
		  "text");              
	}	
<?php echo '</script'; ?>
> 
</body>
</html>
<?php }
}
?>