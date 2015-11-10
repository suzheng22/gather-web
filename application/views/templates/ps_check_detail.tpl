<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户管理系统</title>
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
                	
                        <div class="cc_top_one"><label>修图人:</label><span>{{$u_info.trueName}}</span></div>
                        <div class="cc_top_one"><label>抽查通过率:</label><span>{{$glist.passCount*100}}%</span></div>
                        <div class="cc_top_one"><label>待审核商品数:</label><span>{{$glist.dCount}}</span></div>
                        <div class="clearfix"></div>
                    	<div class="cc_top_one"><label>商品名称:</label><input type="text" value=""/></div>
                     	<div class="cc_top_one"><label>上传时间:</label><input type="text" id="datetimepicker"/></div>
                        
                        <div class="cc_top_one last_show"><label>商品分类:</label>
                            <div class="choice_count choice_box">            	 			
                                <dl class="select">
                                    <dt>全部</dt>
                                    <dd>
                                        <ul>
                                            <li><a href="#">001</a></li>
                                            <li><a href="#">002</a></li>
                                        </ul>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                         <div class="cc_top_one last_show"><label>修图类型:</label>
                            <div class="choice_count choice_box">            	 			
                                <dl class="select">
                                    <dt>全部</dt>
                                    <dd>
                                        <ul>
                                            <li><a href="#">正常修图</a></li>
                                            <li><a href="#">驳回修图</a></li>
                                        </ul>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                         <div class="cc_top_one last_show"><label>状态:</label>
                            <div class="choice_count choice_box">            	 			
                                <dl class="select">
                                    <dt>全部</dt>
                                    <dd>
                                        <ul>
                                            <li><a href="#">修图已驳回</a></li>
                                            <li><a href="#">修图已通过</a></li>
                                        </ul>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                    <div class="cc_top_two">
                        
                        <a href="javascript:;" class="query"><i class="icon iconfont">&#xf00a8;</i>查询</a>
                            <a href="javascript:;"><i class="iconfont">&#xf014a;</i>清空</a>
                    </div>
                   	<div class="clearfix"></div>
                	<div class="tab_box">
                    <table>
                      <tr>
                        <th>商品条形码</th>
                        <th>商品名称</th>
                        <th>商品分类</th>
                        <th>修图类型</th>
                        <th>状态</th>
                        <th>操作</th>
                        
                        
                      </tr>
					  {{foreach from=$glist.gtins item=list}}
                      <tr>
                        <td>{{$list.gtin}}</td>
                        <td>{{$list.proName}}</td>
                        <td>{{$list.typeName}}</td>
                        <td>{{if $list.retouchType==1}}正常修图{{else}}驳回修图{{/if}}</td>
                        <td>{{if $list.status==1}}通过{{else if $list.status==2}}驳回{{else}}未审核{{/if}}</td>
                        <td>
                        	<a href="javascript;">审核详细</a>
                        </td>
                      </tr>
					  {{/foreach}}
                    </table>
                </div>
                	<div class="page_nav" id="page_nav">
                	<a href="javascript:;" class="pageNum">上一页</a>
                    <a href="javascript:;" class="pageNum">1</a>
                    <a href="javascript:;" class="pageNum">2</a>
                    <a href="javascript:;" class="pageNum">3</a>
                    <a href="javascript:;" class="pageNum">4</a>
                    <a href="javascript:;" class="pageNum">5</a>
                    <a href="javascript:;" class="pageNum">6</a>
                    <a href="javascript:;" class="pageNum">7</a>
                    <a href="javascript:;" class="pageNum">8</a>
                    <a href="javascript:;" class="pageNum">9</a>
                    <a href="javascript:;" class="pageNum">下一页</a>
                    <span>共<em>100</em>页,</span>
                    <span>共<em>66</em>条记录,</span>
                    <span>跳转到第<input type="text"/>页</span>
                    <a href="javascript:;" class="pageNum">确定</a>
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
$('#datetimepicker').datetimepicker();
</script>
<!---->  	


</body>
</html>
