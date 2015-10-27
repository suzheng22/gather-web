<?php /* Smarty version 3.1.27, created on 2015-10-27 04:03:48
         compiled from "D:\wamp\www\collect_web\application\views\templates\test.tpl" */ ?>
<?php
/*%%SmartyHeaderCode:20072562ee994186bc5_63943026%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'd997375a31753085aacd071f7019e76da1f5f6b4' => 
    array (
      0 => 'D:\\wamp\\www\\collect_web\\application\\views\\templates\\test.tpl',
      1 => 1445915023,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '20072562ee994186bc5_63943026',
  'variables' => 
  array (
    'test' => 0,
  ),
  'has_nocache_code' => false,
  'version' => '3.1.27',
  'unifunc' => 'content_562ee9941b1b55_37476829',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_562ee9941b1b55_37476829')) {
function content_562ee9941b1b55_37476829 ($_smarty_tpl) {

$_smarty_tpl->properties['nocache_hash'] = '20072562ee994186bc5_63943026';
?>
<html>
        <body>
            这是 <?php echo $_smarty_tpl->tpl_vars['test']->value;?>
 测试
        </body>
</html><?php }
}
?>