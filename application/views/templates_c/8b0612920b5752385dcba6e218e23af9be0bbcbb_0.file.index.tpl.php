<?php /* Smarty version 3.1.27, created on 2015-10-29 03:39:35
         compiled from "D:\wamp\www\collect_web\application\views\templates\index.tpl" */ ?>
<?php
/*%%SmartyHeaderCode:23627563186e7524c35_40984424%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '8b0612920b5752385dcba6e218e23af9be0bbcbb' => 
    array (
      0 => 'D:\\wamp\\www\\collect_web\\application\\views\\templates\\index.tpl',
      1 => 1446022966,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '23627563186e7524c35_40984424',
  'variables' => 
  array (
    'resource_url' => 0,
  ),
  'has_nocache_code' => false,
  'version' => '3.1.27',
  'unifunc' => 'content_563186e75578c6_70090115',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_563186e75578c6_70090115')) {
function content_563186e75578c6_70090115 ($_smarty_tpl) {

$_smarty_tpl->properties['nocache_hash'] = '23627563186e7524c35_40984424';
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

	<div class="j-top">
    	<div class="j-top-warp">
			<h3>录入系统<span>v1.0</span></h3>
            <div class="top_right"><span id="user_name_show"></span><em>,欢迎你</em><a href="index.html">退出</a></div>
        </div>
    
    </div>
    
    <div id="warp_box" style="height:198px; min-width: 1200px; background:#0066cc;">
    
    	<div style="width:240px; background:#f00; float:left; position:relative">
    <div style="min-height:180px;">
    
    </div>
    <div style="position:absolute; bottom:0px;"><span>11111</span><span>11111</span></div>
  </div>
  <div style="min-width:960px; float:left">
    <div style="background:#fff"></div>
    
</div>

</body>
</html>
<?php }
}
?>