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
            	<h3>修图审核</h3>	
                <div class="rose_top main_rignt_top clearfix">
                	<div class="cc_top_one"><label>用户名:</label><input type="text" name="userName"/></div>
                    <div class="cc_top_one last_show"><label>用户组:</label>
                    	<div class="choice_count choice_box">            	 			
							<dl class="select">
									<dt>全部</dt>
									<dd>
										<ul>
											<li><a href="#">001</a></li>
											<li><a href="#">002</a></li>
											<li><a href="#">003</a></li>
											<li><a href="#">004</a></li>
											<li><a href="#">005</a></li>
											<li><a href="#">006</a></li>
										</ul>
									</dd>
								</dl>
	            	 	</div>
                     </div>
                     <div class="cc_top_one"><label>上传时间:</label><input type="text" id="datetimepicker"/></div>
                    <div class="cc_top_two" style="margin-left:14px; display:inline;">
                       
                       <a href="javascript:;" class="query"><i class="icon iconfont">&#xf00a8;</i>查询</a>
                       <a href="javascript:;"><i class="iconfont">&#xf014a;</i>清空</a>
                    </div>
                   	<div class="clearfix"></div>
                	<div class="tab_box">
                    <table>
                      <tr>
                        <th>序号</th>
                        <th>用户名</th>
                        <th>用户组</th>
                        <th>总商品数</th>
                        <th>待审核商品数</th>
                        <th>已审核商品数</th>
                        <th>抽查通过率</th>
                        <th>操作</th>
                        
                        
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>asda</td>
                        <td>dsad</td>
                        <td>dasdd</td>
                        <td>dadas</td>
                        <td>dasda</td>
                        <td>dasda</td>
                        <td>
                        	<a href="ps_check_detail.html">详情</a>
                        </td>
                      </tr>
                       
                      
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
