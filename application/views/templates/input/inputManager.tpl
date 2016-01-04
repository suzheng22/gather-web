<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>数据采集系统</title>
    {{include file='public/css.tpl'}}
</head>
<body>
{{include file='public/top.tpl'}}

<div id="warp_box">
    <div class="main">
        {{include file='public/left.tpl'}}
        <div class="viewport_main">
            <div class="rose_box cc_box">
                <h3>拍摄新增管理<a href="javascript:;" id="new_user" class="new_user"><i class="iconfont">&#xf018b;</i>新增</a></h3>
                <div class="rose_top main_rignt_top clearfix">
                    <form action="{{$root_path}}shoot/shootAddManager" id="myform">
                        <div class="cc_top_one"><label>商品条形码:</label><input type="text" name="gtin" value="{{$gtin}}" class="gtin"/></div>
                        <div class="cc_top_one"><label>商品名称:</label><input type="text" name="gName" value="{{$gName}}" class="proName"/></div>
                        <div class="cc_top_one last_show"><label>商品分类:</label>
                            <div class="choice_count choice_box vocation">
                                <dl class="select">
                                    <select name="catgrory1" class="select3">
                                        <option value="">全部</option>
                                        {{foreach from=$type_list item=list}}
                                        <option value="{{$list.id}}" {{if $catgrory1==$list.id}}selected="selected"{{/if}}>{{$list.name}}</option>
                                        {{/foreach}}
                                    </select>
                                </dl>
                            </div>
                        </div>
                        <div class="cc_top_one" style="width:50%">
                            <label>提交时间:</label>
                            <input type="text" id="datetimepicker_start" name="s_time" value="{{$s_time}}"/>
                            <label style="width:20px;">-</label>
                            <input type="text" id="datetimepicker_end" name="e_time" value="{{$e_time}}"/>
                        </div>
                        <div class="cc_top_one last_show"><label>状态:</label>
                            <div class="choice_count choice_box vocation">
                                <dl class="select">
                                    <select name="status" class="select3">
                                        <option value="">全部</option>
                                        <option value="1" {{if $status==1}}selected="selected"{{/if}}>录入已驳回</option>
                                        <option value="2" {{if $status==2}}selected="selected"{{/if}}>录入审核通过</option>
                                        <option value="3" {{if $status==3}}selected="selected"{{/if}}>录入已提交</option>
                                        <option value="4" {{if $status==4}}selected="selected"{{/if}}>录入已保存</option>
                                        <option value="5" {{if $status==5}}selected="selected"{{/if}}>拍色反馈</option>
                                        <option value="6" {{if $status==6}}selected="selected"{{/if}}>拍摄反馈驳回</option>
                                        <option value="7" {{if $status==7}}selected="selected"{{/if}}>拍摄反馈通过</option>
                                    </select>
                                </dl>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="cc_top_two" style="margin-left:12px; display:inline;">
                            <a href="{{$root_path}}shoot/shootAddManager?is_ext=1" class="query"><i class="icon iconfont">&#xf0220;</i>信息新增录入</a>
                            <span class="query"><i class="icon iconfont">&#xf00a8;</i><input type="submit" value="查询"></span>
                            <a href="javascript:;" onclick="btn_empty()"><i class="iconfont">&#xf014a;</i>清空</a>
                        </div>
                    </form>
                    <div class="clearfix"></div>
                    <div class="tab_box">
                        <table>
                            <tr>
                                <th>序号</th>
                                <th>商品条形码</th>
                                <th>商品名称</th>
                                <th>商品分类</th>
                                <th>项目名称</th>
                                <th>包装</th>
                                <th>录入类型</th>
                                <th>提交时间</th>
                                <th>状态</th>
                                <th>操作</th>
                            </tr>
                            <tr class="t_{{$list.gtin}}">
                                <td>{{$list.lId}}</td>
                                <td>{{$list.gtin}}</td>
                                <td>{{$list.gName}}</td>
                                <td>{{$list.catName}}</td>
                                <!-- 新增字段 -->
                                <td>{{$list.pName}}</td>
                                <td>包装{{$list.packet}}</td>
                                <td>{{$list.type}}</td>
                                <td>{{$list.creatTime|date_format:"Y-m-d H:i:s"}}</td>
                                <td>{{if $list.status==1}}未处理{{else if $list.status==2}}已处理 {{/if}}</td>
                                <td><a href="{{$root_path}}input/index?orderId=1&gtin=6901333110746" target="_blank">编辑</a></td>
                                <!-- 新增字段 -->
                            </tr>

                            {{foreach from=$slist item=list}}
                            <tr class="t_{{$list.gtin}}">
                                <td>{{$list.lId}}</td>
                                <td>{{$list.gtin}}</td>
                                <td>{{$list.gName}}</td>
                                <td>{{$list.catName}}</td>
                                <!-- 新增字段 -->
                                <td>{{$list.pName}}</td>
                                <td>包装{{$list.packet}}</td>
                                <td>{{$list.type}}</td>
                                <td>{{$list.creatTime|date_format:"Y-m-d H:i:s"}}</td>
                                <td>{{if $list.status==1}}未处理{{else if $list.status==2}}已处理 {{/if}}</td>
                                <td><a href="{{$root_path}}input/index?orderId={{$root_path.orderId}}&gtin={{$list.gtin}}" target="_blank">详细</a></td>
                                <!-- 新增字段 -->
                            </tr>
                            {{/foreach}}

                        </table>
                    </div>

                    <!--分页-->
                    <div class="page_nav" id="page_nav">
                        {{$pages}}
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
    $(function(){
        //分页表单提交
        $("#submits").on("click",function(){
            var action=$("#form").attr("action")+"&page="+$("input[name='page']").val();
            $("#form").attr("action",action);
            $("#form").submit();
        });
        $.fn.pasteEvents = function( delay ) {
            if (delay == undefined) delay = 20;
            return $(this).each(function() {
                var $el = $(this);
                $el.on("paste", function() {
                    $el.trigger("prepaste");
                    setTimeout(function() { $el.trigger("postpaste"); }, delay);
                });
            });
        };
        //select 表单美化
        $(".select3").uedSelect({
            width : 100
        });
        $(".select1").uedSelect({
            width :250
        });

    });
    $('#datetimepicker_start,#datetimepicker_end').datetimepicker({
        onGenerate:function( ct ){
            $(this).find('.xdsoft_date')
                    .toggleClass('xdsoft_disabled');
        },
        format:'Y-m-d',
        formatDate:'Y-m-d',
        minDate:'-1970-01-2',
        maxDate:'+1970-01-2',
        timepicker:false
    });

    //清空
    function btn_empty(){
        $(".proName,.gtin").val("");
        $("#datetimepicker_start").val("");
        $("#datetimepicker_end").val("");
        $(".cc_top_one ,.select1").val("");
        $(".uew-select-text").html('全部');
    }
</script>
</body>
</html>