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
            	<h3>录入统计-详情</h3>
                <div class="rose_top main_rignt_top clearfix">

                        <div class="cc_top_one"><label>录入人:</label><span>{{$uInfo.userName}}</span></div>
                        <div class="cc_top_one"><label>用户组:</label><span>{{$uInfo.groupName}}</span></div>
                        <div class="clearfix"></div>
                        <div class="cc_top_one last_show"><label>加入项目:</label>
                          <div class="choice_count choice_box vocation">
                              <dl class="select">
                                  <select name="pId" class="select3">
						  	<option value="">请选择</option>
							{{foreach from=$project_list item=list}}
								<option value="{{$list.pId}}">{{$list.pName}}</option>
							{{/foreach}}
						  </select>
                              </dl>
                          </div>
                        </div>
                         <div class="cc_top_one last_show"><label>商品条形码:</label><input type="text" value=""/></div>
                    	<div class="cc_top_one"><label>商品名称:</label><input type="text" value=""/></div>
                        <div class="cc_top_one last_show"><label>商品分类:</label>
                          <div class="choice_count choice_box vocation">
                              <dl class="select">
                                 <select class="select3" name="catgroy1">
                                    <option value="">全部</option>
									{{foreach from =$type_list item=list}}
                                      <option value="{{$list.id}}" {{if $catgroy1==$list.id}} selected="selected"{{/if}}>{{$list.name}}</option>
									  {{/foreach}}
                                 </select>
                              </dl>
                          </div>
                        </div>
                        <div class="cc_top_one last_show"><label>状态:</label>
                           <div class="choice_count choice_box vocation">
                               <dl class="select">
                                   <select class="select3" name="status">
                                     <option value="">全部</option>
									 {{foreach from=$statusList item=val key=key}}
                                       <option value="{{$key}}" {{if $key==$staus}} selected="selected"{{/if}}>{{$val}}</option>
									   {{/foreach}}
                                  </select>
                               </dl>
                           </div>
                       </div>
                     	<div class="cc_top_one" style="width:50%;"><label>录入时间:</label>
                        <input type="text" class="datetimepicker" id="datetimepicker_start"/>
                        <label style="width:20px;">-</label>
                         <input type="text" class="datetimepicker" id="datetimepicker_end"/>
                       </div>

                      <div class="clearfix"></div>
                    <div class="cc_top_two">

                            <span class="query"><i class="icon iconfont">&#xf00a8;</i><input type="submit" value="查询"></span>
                            <a href="javascript:;"><i class="iconfont">&#xf014a;</i>清空</a>
                    </div>
                   	<div class="clearfix"></div>
                	<div class="tab_box">
                    <table>
                      <tr>
                        <th>商品条形码</th>
                        <th>商品名称</th>
                        <th>商品分类</th>
                        <th>加入项目</th>
                        <th>包装</th>
                        <th>状态</th>
                        <th>录入字数</th>
                        <th>是否有参照数据</th>
                        <th>录入时间</th>
                      </tr>
					  {{foreach from=$glist item=list}}
                      <tr>
                        <td>{{$list.gtin}}</td>
                        <td>{{$list.gName}}</td>
                        <td>{{$list.catgroryName}}</td>
                        <td>{{$list.pName}}</td>
                        <td>{{$list.packet}}</td>
                        <td>{{$list.statusName}}</td>
                        <td>{{$list.inputCount}}</td>
                        <td>{{if $list.isData==1}}是{{else}}否{{/if}}</td>
                        <td>{{$list.createTime}}</td>
                      </tr>
					  {{/foreach}}
                    </table>
                </div>
                	{{$pages}}
                </div>
            </div>
        </div>
     </div><!--main end-->
</div>
{{include file='public/js.tpl'}}
<script type="text/javascript">
$(function(){
	//用户列表
     $("#newuser_pop").pop({
        oMain:"#new_user",         //触发弹出层的元素。为空时直接弹出
        sEvent:"click",             //触发事件
        oClose:"#newuser_pop .close", //关闭按钮
        bIframe:false,              //是否有iframe
        iSrc:"",                    //iframe地址
        bShade:true,                //是否有遮罩
        bShadeClose:false,          //是否点遮罩关闭
        fnAdditional:function(){

        }
    });
});
</script>
</body>
</html>
