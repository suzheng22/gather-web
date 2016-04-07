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
                <h3>录入审核</h3>
                <div class="rose_top main_rignt_top clearfix">
                    <form action="{{$root_path}}input/inputList" id="myform">
                        <div class="cc_top_one"><label>商品条形码:</label><input type="text" name="gtin" value="{{$gtin}}" class="gtin"/></div>
                        <div class="cc_top_one"><label>商品名称:</label><input type="text" name="goodsName" value="{{$goodsName}}" class="proName"/></div>
                        <div class="cc_top_one last_show"><label>商品分类:</label>
                            <div class="choice_count choice_box vocation">
                                <dl class="select">
                                    <select name="topCatId" class="select3">
                                        <option value="">全部</option>
                                        {{foreach from=$type_list item=list}}
                                        <option value="{{$list.id}}" {{if $topCatId==$list.id}}selected="selected"{{/if}}>{{$list.name}}</option>
                                        {{/foreach}}
                                    </select>
                                </dl>
                            </div>
                        </div>
                        <div class="cc_top_one last_show"><label>状态:</label>
                            <div class="choice_count choice_box vocation">
                                <dl class="select">
                                    <select name="status" class="select3">
                                        <option value="">全部</option>
                                        <option value="1" {{if $status==1}}selected="selected"{{/if}}>录入审核中</option>
                                        <option value="2" {{if $status==2}}selected="selected"{{/if}}>录入审核通过</option>
                                        <option value="3" {{if $status==3}}selected="selected"{{/if}}>录入驳回</option>

                                    </select>
                                </dl>
                            </div>
                        </div>
                        <div class="cc_top_one" style="width:50%">
                            <label>审核时间:</label>
                            <input type="text" id="datetimepicker_start" name="sTime" value="{{$sTime}}"/>
                            <label style="width:20px;">-</label>
                            <input type="text" id="datetimepicker_end" name="eTime" value="{{$eTime}}"/>
                        </div>
                        
                        <div class="clearfix"></div>
                        <div class="cc_top_two" style="margin-left:12px; display:inline;">
                            <a href="javascript:void(0);" class="query"  onclick="inputAdd()"><i class="icon iconfont">&#xf0220;</i>录入审核</a>
                            <span class="query"><i class="icon iconfont">&#xf00a8;</i><input type="submit" value="查询"></span>

                            <span class="query" id="import"><input type="button" value="录入审核导入"></span>
                            <span class="query" id="importHuaRun"><input type="button" value="华润录入导入"></span>
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
                                <th>审核时间</th>
                                <th>状态</th>
                                <th>操作</th>
                            </tr>
                            {{foreach from=$glist item=list}}
                            <tr class="t_{{$list.gtin}}">
                                <td>{{$list.lId}}</td>
                                <td>{{$list.gtin}}</td>
                                <td>{{$list.goodsName}}</td>
                                <td>{{$list.catName}}</td>
                                <!-- 新增字段 -->
                                <td>{{$list.pName}}</td>
                                <td>包装{{$list.packet}}</td>
                                <td>{{if $list.inputType==1}}正常录入{{else}}驳回录入{{/if}}</td>
                                <td>{{$list.createTime|date_format:"Y-m-d H:i:s"}}</td>
                                <td>{{if $list.status==2}}已录入
                                    {{else if $list.status==3}}录入审核通过{{else if $list.status==4}}录入驳回
                                    {{else}}审核未领取
                                    {{/if}}
                                </td>
                                <td><a href="{{$root_path}}input/index?orderId={{$list.orderId}}&inputId={{$list.inputId}}&gtin={{$list.gtin}}&packet={{$list.packet}}&batchNo={{$list.batchNo}}" target="_blank">详细</a></td>
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
<div class="newuser_pop" id="import_pop">
    <div class="tit clearfix"><h4>录入审核导入</h4><a class="no_text close" href="javascript:;" title="关闭">关闭</a></div>
    <div class="content">
        <div class="login_main">
            <form id="personForm" method="post" enctype="multipart/form-data">
            <div class="login_form">

                <div class="clearfix one"><label for="user_name">录入审核导入:</label><input type="file" name="uploadFile" style="height:100%" id="uploadFile"></div>

                <a href="javascript:;" id="confirm_btn" class="confirm_btn" onclick="ajaxFileUpload('personForm','fileinput')">确认</a>

            </div>
            </form>
        </div>
    </div>
</div>
<div class="newuser_pop" id="huaRUn_import_pop">
    <div class="tit clearfix"><h4>录入审核导入</h4><a class="no_text close" href="javascript:;" title="关闭">关闭</a></div>
    <div class="content">
        <div class="login_main">
            <form id="personForms" method="post" enctype="multipart/form-data">
                <div class="login_form">

                    <div class="clearfix one"><label for="user_name">录入审核导入:</label><input type="file" name="uploadFiles" style="height:100%" id="uploadFiles"></div>

                    <a href="javascript:;" id="confirm_btn" class="confirm_btn" onclick="huaRunUpload('personForms','fileinput')">确认</a>

                </div>
            </form>
        </div>
    </div>
</div>

{{include file='public/js.tpl'}}
//jquery扩展
<script  type="text/javascript">
    jQuery.extend({
        handleError: function (s, xhr, status, e) {
            if (s.error) {
                s.error.call(s.context || s, xhr, status, e);
            }
            if (s.global) {
                (s.context ? jQuery(s.context) : jQuery.event).trigger("ajaxError", [xhr, s, e]);
            }
        },
        httpData: function (xhr, type, s) {
            var ct = xhr.getResponseHeader("content-type"),
                    xml = type == "xml" || !type && ct && ct.indexOf("xml") >= 0,
                    data = xml ? xhr.responseXML : xhr.responseText;
            if (xml && data.documentElement.tagName == "parsererror")
                throw "parsererror";
            if (s && s.dataFilter)
                data = s.dataFilter(data, type);
            if (typeof data === "string") {
                if (type == "script")
                    jQuery.globalEval(data);
                if (type == "json")
                    data = window["eval"]("(" + data + ")");
            }
            return data;
        }
    });
    jQuery.extend({


        createUploadIframe: function(id, uri)
        {
            //create frame
            var frameId = 'jUploadFrame' + id;

            if(window.ActiveXObject) {
                var io = document.createElement('<iframe id="' + frameId + '" name="' + frameId + '" />');
                if(typeof uri== 'boolean'){
                    io.src = 'javascript:false';
                }
                else if(typeof uri== 'string'){
                    io.src = uri;
                }
            }
            else {
                var io = document.createElement('iframe');
                io.id = frameId;
                io.name = frameId;
            }
            io.style.position = 'absolute';
            io.style.top = '-1000px';
            io.style.left = '-1000px';

            document.body.appendChild(io);

            return io
        },
        createUploadForm: function(id, fileElementId)
        {
            //create form
            var formId = 'jUploadForm' + id;
            var fileId = 'jUploadFile' + id;
            var form = $('<form  action="" method="POST" name="' + formId + '" id="' + formId + '" enctype="multipart/form-data"></form>');
            var oldElement = $('#' + fileElementId);
            var newElement = $(oldElement).clone();
            $(oldElement).attr('id', fileId);
            $(oldElement).before(newElement);
            $(oldElement).appendTo(form);
            //set attributes
            $(form).css('position', 'absolute');
            $(form).css('top', '-1200px');
            $(form).css('left', '-1200px');
            $(form).appendTo('body');
            return form;
        },

        ajaxFileUpload: function(s) {
            // TODO introduce global settings, allowing the client to modify them for all requests, not only timeout
            s = jQuery.extend({}, jQuery.ajaxSettings, s);
            var id = new Date().getTime()
            var form = jQuery.createUploadForm(id, s.fileElementId);
            var io = jQuery.createUploadIframe(id, s.secureuri);
            var frameId = 'jUploadFrame' + id;
            var formId = 'jUploadForm' + id;
            // Watch for a new set of requests
            if ( s.global && ! jQuery.active++ )
            {
                jQuery.event.trigger( "ajaxStart" );
            }
            var requestDone = false;
            // Create the request object
            var xml = {}
            if ( s.global )
                jQuery.event.trigger("ajaxSend", [xml, s]);
            // Wait for a response to come back
            var uploadCallback = function(isTimeout)
            {
                var io = document.getElementById(frameId);
                try
                {
                    if(io.contentWindow)
                    {
                        xml.responseText = io.contentWindow.document.body?io.contentWindow.document.body.innerHTML:null;
                        xml.responseXML = io.contentWindow.document.XMLDocument?io.contentWindow.document.XMLDocument:io.contentWindow.document;

                    }else if(io.contentDocument)
                    {
                        xml.responseText = io.contentDocument.document.body?io.contentDocument.document.body.innerHTML:null;
                        xml.responseXML = io.contentDocument.document.XMLDocument?io.contentDocument.document.XMLDocument:io.contentDocument.document;
                    }
                }catch(e)
                {
                    jQuery.handleError(s, xml, null, e);
                }
                if ( xml || isTimeout == "timeout")
                {
                    requestDone = true;
                    var status;
                    try {
                        status = isTimeout != "timeout" ? "success" : "error";
                        // Make sure that the request was successful or notmodified
                        if ( status != "error" )
                        {
                            // process the data (runs the xml through httpData regardless of callback)
                            var data = jQuery.uploadHttpData( xml, s.dataType );
                            // If a local callback was specified, fire it and pass it the data
                            if ( s.success )
                                s.success( data, status );

                            // Fire the global callback
                            if( s.global )
                                jQuery.event.trigger( "ajaxSuccess", [xml, s] );
                        } else
                            jQuery.handleError(s, xml, status);
                    } catch(e)
                    {
                        status = "error";
                        jQuery.handleError(s, xml, status, e);
                    }

                    // The request was completed
                    if( s.global )
                        jQuery.event.trigger( "ajaxComplete", [xml, s] );

                    // Handle the global AJAX counter
                    if ( s.global && ! --jQuery.active )
                        jQuery.event.trigger( "ajaxStop" );

                    // Process result
                    if ( s.complete )
                        s.complete(xml, status);

                    jQuery(io).unbind()

                    setTimeout(function()
                    {	try
                    {
                        $(io).remove();
                        $(form).remove();

                    } catch(e)
                    {
                        jQuery.handleError(s, xml, null, e);
                    }

                    }, 100)

                    xml = null

                }
            }
            // Timeout checker
            if ( s.timeout > 0 )
            {
                setTimeout(function(){
                    // Check to see if the request is still happening
                    if( !requestDone ) uploadCallback( "timeout" );
                }, s.timeout);
            }
            try
            {
                // var io = $('#' + frameId);
                var form = $('#' + formId);
                $(form).attr('action', s.url);
                $(form).attr('method', 'POST');
                $(form).attr('target', frameId);
                if(form.encoding)
                {
                    form.encoding = 'multipart/form-data';
                }
                else
                {
                    form.enctype = 'multipart/form-data';
                }
                $(form).submit();

            } catch(e)
            {
                jQuery.handleError(s, xml, null, e);
            }
            if(window.attachEvent){
                document.getElementById(frameId).attachEvent('onload', uploadCallback);
            }
            else{
                document.getElementById(frameId).addEventListener('load', uploadCallback, false);
            }
            return {abort: function () {}};

        },

        uploadHttpData: function( r, type ) {
            var data = !type;
            data = type == "xml" || data ? r.responseXML : r.responseText;
            // If the type is "script", eval it in global context
            if ( type == "script" )
                jQuery.globalEval( data );
            // Get the JavaScript object, if JSON is used.
            if ( type == "json" ) {

                //eval( "data = " + data );
                if(data.indexOf('<pre>') != -1) {
                    data = data.substring(5, data.length-6);
                }
                eval("data = \" "+data+" \" ");
            }
            // evaluate scripts within html
            if ( type == "html" )
                jQuery("<div>").html(data).evalScripts();
            //alert($('param', data).each(function(){alert($(this).attr('value'));}));
            return data;
        }

    })


</script>
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

        $("#import_pop").pop({
            oMain:"#import",         //触发弹出层的元素。为空时直接弹出
            sEvent:"click",             //触发事件
            oClose:"#import_pop .close", //关闭按钮
            bIframe:false,              //是否有iframe
            iSrc:"",                    //iframe地址
            bShade:true,                //是否有遮罩
            bShadeClose:false,          //是否点遮罩关闭
            fnAdditional:function(){

            }
        });
        $("#huaRUn_import_pop").pop({
            oMain:"#importHuaRun",         //触发弹出层的元素。为空时直接弹出
            sEvent:"click",             //触发事件
            oClose:"#huaRUn_import_pop .close", //关闭按钮
            bIframe:false,              //是否有iframe
            iSrc:"",                    //iframe地址
            bShade:true,                //是否有遮罩
            bShadeClose:false,          //是否点遮罩关闭
            fnAdditional:function(){

            }
        });
    });
    //清空
    function btn_empty(){
        $(".proName,.gtin").val("");
        $("#datetimepicker_start").val("");
        $("#datetimepicker_end").val("");
        $(".cc_top_one ,.select1,.select3").val("");
        $(".uew-select-text").html('全部');
    }
    function inputAdd(){
        var newTab=window.open('about:blank');
        $.ajax({
            url:'{{$root_path}}input/inputAudit/verify',
            dataType:'text',
            success:function(e){
              if(e!=""){

                 newTab.location.href='{{$root_path}}input/inputAudit';
              }else{
                  newTab.close();
                  alert("无审核可领取")
              }
            }
        })
    }
    function ajaxFileUpload(frm,upload) {
        var f = $("#" + frm);
        $.ajaxFileUpload({
                    url             : "{{$root_path}}input/import", //需要链接到服务器地址
                    secureuri       : false,
                    fileElementId   : 'uploadFile', //文件选择框的id属性
                    dataType        : 'text', //服务器返回的格式
                    success     : function(data,status) //相当于java中try语句块的用法
                    {
                        alert("共导入"+data+"条");
                      //  $('#__content__').html(data);
                    },
                    error : function(data, status, e) //相当于java中catch语句块的用法
                    {
                      //  alert(status);
                      //  $('#__content__').html('添加失败');
                    }
                }
        );

    }
    function huaRunUpload(frm,upload) {
        var f = $("#" + frm);
        $.ajaxFileUpload({
                    url             : "{{$root_path}}input/huaRunImport", //需要链接到服务器地址
                    secureuri       : false,
                    fileElementId   : 'uploadFiles', //文件选择框的id属性
                    dataType        : 'text', //服务器返回的格式
                    success     : function(data,status) //相当于java中try语句块的用法
                    {
                        alert("共导入"+data+"条");
                        //  $('#__content__').html(data);
                    },
                    error : function(data, status, e) //相当于java中catch语句块的用法
                    {
                        //  alert(status);
                        //  $('#__content__').html('添加失败');
                    }
                }
        );

    }
</script>
</body>
</html>
