<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>数据采集系统</title>
    {{include file='public/css.tpl'}}
    <link rel="stylesheet" type="text/css" href="{{$resource_url}}style/jquery.iviewer.css"/>

</head>
<body>

<!--------------------------- 拍摄详情------------------------------------>

<div class="record_info_warp" style="margin-top:0px;">
    <h2>{{$p_info.gtin}}-反馈详情</h2>
    <ul class="clearfix" id="nav_info">
        <li class="black"><em>条形码:</em><span>{{$p_info.gtin}}</span></li>
        <li class="black"><em>商品名称:</em><span>{{$p_info.gName}}</span></li>
        <li class="black"><em>商品分类:</em><span>{{$p_info.catName}}</span></li>
        <!-- 拍摄类型 -->
        <li class="black"><em>反馈路径:</em><span>{{if $p_info.feedPath ==1}}修图反馈{{else}}录入反馈{{/if}}</span></li>
        <!-- 项目 -->
        <li class="black"><em>项目:</em><span>{{$p_info.pName}}</span></li>
        <!-- 包装 -->
        <li class="black"><em>包装:</em><span>包装{{$p_info.packet}}</span></li>
        <!-- 批次 -->
        <li class="black"><em>批次:</em><span>批次{{$p_info.batchNo}}</span></li>
        <div class="clearfix"></div>
        <p class="back_why_info">

            反馈描述:<span>{{$p_info.feedbackInfo}}</span>

        </p>

        <div class="ps_top_menu">
            {{if $p_info.status==1}}
            <a href="javascript:;" class="pass" id="shoot_new_user" ><i class="iconfont">&#xf01b1;</i>反馈通过</a>
            <a href="javascript:;"  class="back" onclick="check(3)"><i class="iconfont">&#xf0223;</i>反馈驳回</a>
            <a href="javascript:;" id="shoot_pass_less_btn" class="back"><i class="iconfont">&#xf0223;</i>反馈缺图</a>
            {{else}}
            {{if $p_info.status==2}} <a href="javascript:;" class="pass"><i class="iconfont">&#xf01b1;</i>已通过</a>
            {{elseif $p_info.status==3}} <a href="javascript:;" class="back"><i class="iconfont">&#xf0223;</i>已驳回</a>
            {{elseif $p_info.status==4}} <a href="javascript:;" class="back"><i class="iconfont">&#xf0223;</i>反馈缺图</a>{{/if}}
            {{/if}}
        </div>
    </ul>

    <div class="left shoot_left" style="width:1200px; margin:0 auto;">
        <div class="pageContent ps_check_pic" >
            <div class="wrapper">
                <div id="viewer" class="viewer"></div>
            </div>
            <h5>原图</h5>
        </div>
        <div class="detail_zoom_right" style="margin-left:40px;">
            <div class="popup_box" style="margin-top:10px;">
                <!--正常显示层-->
                <div class="show_a_01">
                    <div class="pic_box clearfix">
                        <div class="pic_box_left">
                            <p>主图</p>
                        </div>
                        <div style="float:left" class="v_show">
                            <span class="prev"><i class="icon iconfont">&#x3465;</i></span>
                            <span class="next"><i class="icon iconfont">&#x3464;</i></span>
                            <div class="v_content">
                                <div  class="v_content_list">
                                    <ul class="con-FangDa-ImgList">
                                        {{foreach from=$plist.1 item =list name=name}}

                                        <li {{if $smarty.foreach.name.first}}class="active"{{/if}}><img src="{{$pic_path}}{{$list.key}}-thumbnail50" mm="{{$pic_path}}{{$list.key}}" /></li>
                                        {{/foreach}}

                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--细节图-->
                    <div class="pic_box clearfix">
                        <div class="pic_box_left">
                            <p>细节图</p>
                        </div>
                        <div style="float:left" class="v_show">
                            <span class="prev"><i class="icon iconfont">&#x3465;</i></span>
                            <span class="next"><i class="icon iconfont">&#x3464;</i></span>
                            <div class="v_content">
                                <div  class="v_content_list">
                                    <ul class="con-FangDa-ImgList">
                                        {{foreach from=$plist.2 item =list name=name}}
                                        <li {{if $smarty.foreach.name.first}}class=""{{/if}}><img src="{{$pic_path}}{{$list.key}}-thumbnail50" mm="{{$pic_path}}{{$list.key}}" /></li>
                                        {{/foreach}}
                                    </ul>
                                </div>
                            </div><!--v_content-->
                        </div>
                    </div>
                    <!--标签图-->
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
                            </div><!--v_content-->
                        </div>
                    </div>
                    <!--组合图-->
                    <div class="pic_box clearfix">
                        <div class="pic_box_left">
                            <p>组合图</p>
                        </div>
                        <div style="float:left" class="v_show">
                            <span class="prev"><i class="icon iconfont">&#x3465;</i></span>
                            <span class="next"><i class="icon iconfont">&#x3464;</i></span>
                            <div class="v_content">
                                <div  class="v_content_list">
                                    <ul class="con-FangDa-ImgList">
                                        {{foreach from=$plist.4 item =list name=name}}
                                        <li {{if $smarty.foreach.name.first}}class=""{{/if}}><img src="{{$this->pic_path}}{{$list.key}}-thumbnail50" mm="{{$pic_path}}{{$list.key}}" /></li>
                                        {{/foreach}}
                                    </ul>
                                </div>
                            </div><!--v_content-->
                        </div>
                    </div>
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
                                        <li {{if $smarty.foreach.name.first}}class=""{{/if}}><img src="{{$pic_path}}{{$list.key}}-thumbnail50" mm="{{$pic_path}}{{$list.key}} " /></li>
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
</div>
<!-- 驳回弹出层 开始-->
<div class="newuser_pop" id="shoot_newuser_pop">
    <div class="tit clearfix"><h4>{{$p_info.gtin}}-反馈通过</h4><a class="no_text close" href="javascript:;" title="关闭">关闭</a></div>
    <div class="content">
        <div class="login_main">
            <div class="login_form">
                <div class="clearfix one"><label for="user_name">商品条形码:</label><span class="zhmm">{{$p_info.gtin}}</span></div>
                <div class="clearfix one"><label for="user_name">商品名称:</label><span class="zhmm">{{$p_info.gName}}</span></div>
                <div class="clearfix one"><label for="user_name">商品类型:</label><span class="zhmm">{{$p_info.catName}}</span></div>
                <div class="clearfix one"><label for="user_name">备注:</label><textarea id="memo"></textarea></div>
                <a href="javascript:;" id="confirm_btn" class="confirm_btn" onclick="check(2)">确认</a>
            </div>
        </div>
    </div>
</div>

<!-- 通过缺图  开始-->
<div class="newuser_pop" id="shoot_pass_less">
    <div class="tit clearfix"><h4>{{$p_info.gtin}}-反馈缺图</h4><a class="no_text close" href="javascript:;" title="关闭">关闭</a></div>
    <div class="content">
        <div class="login_main">
            <div class="login_form">
                <div class="clearfix one"><label for="user_name">商品条形码:</label><span class="zhmm gtin1">{{$p_info.gtin}}</span></div>
                <div class="clearfix one"><label for="user_name">商品名称:</label><span class="zhmm proName1">{{$p_info.gName}}</span></div>
                <div class="clearfix one"><label for="user_name">商品类型:</label><span class="zhmm typeName1">{{$p_info.catName}}</span></div>
                <div class="clearfix one"><label for="user_name">备注:</label><textarea id="memos"></textarea></div>
                <a href="javascript:;"  class="confirm_btn" onclick="add_miss_figure(2)">确认</a>
            </div>
        </div>
    </div>
</div>



<script type="text/javascript" src="{{$resource_url}}js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="{{$resource_url}}js/rotate/jqueryui.js"></script>
<script type="text/javascript" src="{{$resource_url}}js/rotate/jquery.mousewheel.min.js"></script>
<script type="text/javascript" src="{{$resource_url}}js/rotate/jquery.iviewer.js"></script>
<script type="text/javascript" src="{{$resource_url}}js/popup/popup.js"></script>
<script type="text/javascript" src="{{$resource_url}}js/record.js"></script>

<!--dom预加载-->
<script type="text/javascript" src="{{$resource_url}}js/lazyload/jquery.fadeloader.js"></script>
<!--图片延时加载-->
<script type="text/javascript" src="{{$resource_url}}js/lazyload/jquery.lazyload.js"></script>
<script type="text/javascript">
    $(function(){
        //预加载
        $('body').fadeloader({
            mode: 'class',
            fadeSpeed : 500,
            displayType : 'inline-block',
            easeLoad : 'swing',
            onComplete : ''
        });
        //延时加载
        $("img").lazyload();
        //实例化
        var is="{{$picList.0.key}}";
        if(is){
            var iv2 = $("#viewer").iviewer(
                    {
                        src: "{{$pic_path}}{{$picList.0.key}}"
                    });

        }


        //拍摄详情
        $("#shoot_newuser_pop").pop({
            oMain:"#shoot_new_user",         //触发弹出层的元素。为空时直接弹出
            sEvent:"click",             //触发事件
            oClose:"#shoot_newuser_pop .close", //关闭按钮
            bIframe:false,              //是否有iframe
            iSrc:"",                    //iframe地址
            bShade:true,                //是否有遮罩
            bShadeClose:false,          //是否点遮罩关闭
            fnAdditional:function(e){

            }
        });

        //拍摄详情

        $("#shoot_pass_less").pop({
            oMain:"#shoot_pass_less_btn",         //触发弹出层的元素。为空时直接弹出
            sEvent:"click",             //触发事件
            oClose:"#shoot_pass_less .close", //关闭按钮
            bIframe:false,              //是否有iframe
            iSrc:"",                    //iframe地址
            bShade:true,                //是否有遮罩
            bShadeClose:false,          //是否点遮罩关闭
            fnAdditional:function(){

            }
        });
    });

    function check(status){
        var gtin={{$p_info.gtin}};
        if(status == 1 && confirm("你确定要审核通过吗？")==false){
            return false;
        }
        var memo=$("#memo").val();
        var data={"orderId":{{$p_info.fId}},"type":1,"status":status,"memo":memo};
        //  return false;
        $.post("{{$root_path}}marlboro/shootBackPass",data,
                function(data){
                 if(status==1){
                     alert("审核通过成功");
                 }else{
                     alert("驳回");
                 }
                },"text");
    }
    function add_miss_figure(){
        //条形码
        var gtin="{{$p_info.gtin}}";

        var pId="{{$p_info.pId}}";
        var packet="{{$p_info.packet}}";
        var memo=$("#memos").val();
        var data={gtin:gtin,pId:pId,packet:packet,memo:memo};
        $.ajax({
            url:'{{$root_path}}shoot/addShoot',
            type:"POST",
            dataType:'json',
            data:data,
            success:function(e){
                    if(e['msgCode]']!="2000"){
                    var data={"orderId":{{$p_info.fId}},"status":2,};
                    $.post("{{$root_path}}marlboro/shootBackPass",data,
                            function(data){
                                //alert(e);
                                alert("审核通过成功");
                            },"text");
                }else{
                    alert(e['msgText]']);
                }
            }

        });

    }

</script>

</body>
</html>
