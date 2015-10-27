<?php /* Smarty version 3.1.27, created on 2015-10-27 09:17:20
         compiled from "D:\wamp\www\collect_web\application\views\templates\login.tpl" */ ?>
<?php
/*%%SmartyHeaderCode:28401562f33109a8d46_51273245%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '9d99699645c337c48db104a26468f1c528fd0528' => 
    array (
      0 => 'D:\\wamp\\www\\collect_web\\application\\views\\templates\\login.tpl',
      1 => 1445933834,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '28401562f33109a8d46_51273245',
  'variables' => 
  array (
    'resource_url' => 0,
    'root_path' => 0,
    'msg' => 0,
  ),
  'has_nocache_code' => false,
  'version' => '3.1.27',
  'unifunc' => 'content_562f33109e7558_55134532',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_562f33109e7558_55134532')) {
function content_562f33109e7558_55134532 ($_smarty_tpl) {

$_smarty_tpl->properties['nocache_hash'] = '28401562f33109a8d46_51273245';
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

<?php echo '<script'; ?>
 type="text/javascript"  src="<?php echo $_smarty_tpl->tpl_vars['resource_url']->value;?>
js/jquery-1.9.1.min.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['resource_url']->value;?>
js/defined.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 type="text/javascript">
$(function(){
	
    $('#login_bg').height($(window).height());
    $('#login_bg').width($(window).width());
});
<?php echo '</script'; ?>
>
</head>
<body id="login_bg">
	<!------------------------login------------------------------------->
	<div class="j-top">
    	<div class="j-top-warp">
			<h3>录入系统</h3>
           <!-- <div class="top_right"><span>RingKing</span><em>,欢迎你</em>|<a href="#">退出</a></div>-->
        </div>
    
    </div> 
	<div class="login_box">
			<div class="login_main">
                <form action="<?php echo $_smarty_tpl->tpl_vars['root_path']->value;?>
user/doLogin" method="POST" accept-charset="utf-8">
                    <div class="login_tit">用户登录</div>
                    <div class="login_form_box">
                        <div class="ipt"><input name="userName" type="text" id="user_name" class="zhmm" placeholder="请输入用户名"/></div>
                        <div class="ipt"><input name="pwd" type="password" id="user_pass" class="zhmm" placeholder="请输入密码"/></div><?php echo $_smarty_tpl->tpl_vars['msg']->value;?>

                    </div>
					<input type="submit" value="33333" />
                    <a href="#" class="btn" id="btn" title="立即登录">登录</a>
                 </form>
			</div>
    </div>
</body>
</html>
<?php }
}
?>