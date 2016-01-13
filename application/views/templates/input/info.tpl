<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>数据采集系统</title>
    {{include file='public/css.tpl'}}
    <link rel="stylesheet" type="text/css" href="{{$resource_url}}style/jquery.iviewer.css"/>
    <style type="text/css">

    </style>
</head>
<body>
<!------------------------顶部j-top------------------------------------->
{{include file='public/top.tpl'}}
<!------------------------顶部结束--------------------------------------->
<!--------------------------- 录入信息------------------------------------>
<div class="record_info_warp">
    <div class="left record_left">
        <div class="pageContent record_pageContent ps_check_pic">
            <div class="wrapper">
                <div id="viewer" class="viewer"></div>
            </div>
            <h5>原图</h5>
        </div>
        <div class="detail_zoom_right" style="margin-left:0px;">
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
                                        {{foreach from=$plist.3 item =list name=name}}
                                        <li {{if $smarty.foreach.name.first}}class=""{{/if}}><img src="{{$pic_path}}{{$list.key}}-thumbnail50" mm="{{$pic_path}}{{$list.key}}" /></li>
                                        {{/foreach}}

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
                                        {{foreach from=$plist.5 item =list name=name}}
                                        <li {{if $smarty.foreach.name.first}}class=""{{/if}}><img src="{{$pic_path}}{{$list.key}}-thumbnail50" mm="{{$pic_path}}{{$list.key}}" /></li>
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
    <div class="right">
        <div class="choice_count">
            <h3>
                <a href="javascript:;" class="selected">基本信息</a>
                <a href="javascript:;">尺寸信息</a>
                <a href="javascript:;">厂商信息</a>
                <a href="javascript:;">扩充信息</a>
                <a href="javascript:;" class="last">营养成分</a>
            </h3>
        </div>
        <div class="right_mid">
            <!--基本信息-->
            <div class="cf">
                <div class="cf_Category clearfix">
                    <div class="clearfix multiple_sku_add">
                        {{foreach from=$p_info.baseInfo key=key item=list}}
                        {{foreach from=$p_info.baseFiled.data key=k item=val}}
                        {{if $key==$val.field}}
                        <P class="clearfix">
                            <label>
                                {{$val.fieldName}}：
                            </label>
                                {{if $list|is_array==false}}
                                 <span>
                                {{$list}}
                                  </span>
                                {{else}}
                                    {{foreach from=$list key=k item=v}}
                                        <span>{{$v.0}}:{{$v.1}}<span>
                                    {{/foreach}}
                                {{/if}}
                        </P>
                        {{else}}

                        {{/if}}
                        {{/foreach}}
                        {{/foreach}}


                    </div>

                </div>

            </div>
            <!--尺寸信息-->
            <div style="display:none;" class="cf">
                <div style="width:280px; float:left;">
                    <h3>商品尺寸</h3>
                    <P class="clearfix">
                        <label>宽：</label>
                        <span>xxxxxxx</span>
                    </P>
                    <P class="clearfix">
                        <label>高：</label>
                        <span>xxxxxxx</span>
                    </P>
                    <P class="clearfix">
                        <label>深：</label>
                        <span>xxxxxxx</span>
                    </P>
                    <P class="clearfix">
                        <label>重量：</label>
                        <span>xxxxxxx</span>
                    </P>
                </div>
                <div style="width:280px; float:left;">
                    <h3>商品箱装尺寸</h3>
                    <P class="clearfix">
                        <label>宽：</label>
                        <span>xxxxxxx</span>
                    </P>
                    <P class="clearfix">
                        <label>高：</label>
                        <span>xxxxxxx</span>
                    </P>
                    <P class="clearfix">
                        <label>深：</label>
                        <span>xxxxxxx</span>
                    </P>
                    <P class="clearfix">
                        <label>重量：</label>
                        <span>xxxxxxx</span>
                    </P>
                </div>
            </div>
            <!--厂商信息-->
            <div style="display:none;" class="cf clearfix">
                {{foreach from=$p_info.shop key=key item=list}}
                <div class="bus_info">
                    <P class="clearfix"><span>厂商类别:</span>{{$list.shopType}}</P>
                    <P class="clearfix"><span>厂商名称:</span>{{$list.shopName}}</P>
                    <P  class="clearfix"><span>厂商地址:</span>{{$list.province}}{{$list.city}}{{$list.region}}{{$list.town}}{{$list.address}}</P>
                    <p  class="clearfix"><span>厂商电话:</span>{{$list.phone}}</p>
                    <p  class="clearfix"><span>卫生许可证:</span>{{$list.sanitaryCertificateNO}}</p>
                    <p  class="clearfix"><span>生产许可证:</span>{{$list.productionCertificateNO}}</p>
                </div>
                {{/foreach}}

            </div>
            <!--扩充信息-->
            <div style="display:none;" class="cf">
                <div class="extend_info">
                    {{foreach from=$p_info.extInfo key=key item=list}}
                    {{foreach from=$p_info.extFiled.data key=k item=val}}
                    {{if $key==$val.field}}
                    <P class="clearfix">
                        <label>{{$val.fieldName}}：</label>
                        <span>{{$list}}</span>
                    </P>
                    {{/if}}
                    {{/foreach}}
                    {{/foreach}}
                </div>

            </div>
            <!--营养成分-->
            <div style="display:none;" class="cf">
                {{foreach from=$p_info.nutritionInfo key=key item=list}}
                <div class="dic_info">
                    <h3 class="clearfix">产品名称:{{$list.proName}}</h3>
                    <h4 class="clearfix">
                        <span>成分名称</span>
                        <span>{{$list.names}}:</span>
                        <span>NVR%</span>
                    </h4>
                    {{foreach from=$list key=key1 item=vals}}
                    {{foreach from=$p_info.nutritionFiled.data key=key2 item=val}}
                    {{if $key1==$val.nutritionId}}
                    <P class="clearfix">
                        <span>{{$val.nutritionName}}:</span>
                        <span>{{$vals.shuzi}}{{$vals.danwei}}</span>
                        <span>{{$vals.value}}</span>
                    </P>
                    {{/if}}
                    {{/foreach}}
                    {{/foreach}}
                </div>
                {{/foreach}}
            </div>
            {{if $p_info.u_status!=""}}
            <div class="zz_conforim"><a href="javascript:;" onclick="check(3)">通过</a><a href="javascript:;" id="record_reject">驳回</a></div>
            {{/if}}
        </div>
    </div>
    <div class="newuser_pop" id="ps_newuser_pop">
        <div class="tit clearfix"><h4>{{$p_info.gtin}}条形码-审核</h4><a class="no_text close" href="javascript:;" title="关闭">关闭</a></div>
        <div class="content">
            <div class="login_main">
                <div class="login_form">
                    <div class="clearfix one"><label for="user_name">商品条形码:</label><span class="zhmm">{{$p_info.gtin}}</span></div>
                    <div class="clearfix one"><label for="user_name">商品名称:</label><span class="zhmm">{{$p_info.goodsName}}</span></div>
                    <div class="clearfix one"><label for="user_name">商品类型:</label><span class="zhmm">{{$p_info.catName}}</span></div>
                    <div class="clearfix one"><label for="user_name">驳回类型: </label>
                        <p>
                            <input type="checkbox" name="radio" id="aa"/><label for="aa" class="num">文字错误
                            </label>
                            <input type="checkbox" name="radio" id="aa"/><label for="aa" class="num">信息缺失
                            </label>
                            <input type="checkbox" name="radio" id="aa"/><label for="aa" class="num">信息不符
                            </label>
                        </p>
                    </div>

                    <div class="clearfix one"><label for="user_name">备注:</label><textarea id="memo"></textarea></div>
                    <a href="##" id="confirm_btn" class="confirm_btn" onclick="check(4)">确认</a>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="{{$resource_url}}js/jquery-1.9.1.min.js"></script>
    <script src="{{$resource_url}}js/ui_tab.js" type="text/javascript"></script>
    <script type="text/javascript" src="{{$resource_url}}js/rotate/jqueryui.js"></script>
    <script type="text/javascript" src="{{$resource_url}}js/rotate/jquery.mousewheel.min.js"></script>
    <script type="text/javascript" src="{{$resource_url}}js/rotate/jquery.iviewer.js"></script>
    <script type="text/javascript" src="{{$resource_url}}js/popup/popup.js"></script>
    <script type="text/javascript" src="{{$resource_url}}js/record.js"></script>
    <script type="text/javascript" src="{{$resource_url}}js/defined.js"></script>
    <script type="text/javascript" src="{{$resource_url}}js/province_res.js"></script>
    <!--dom预加载-->
    <script type="text/javascript" src="{{$resource_url}}js/lazyload/jquery.fadeloader.js"></script>
    <script type="text/javascript" src="{{$resource_url}}js/lazyload/jquery.lazyload.js"></script>

    <!--时间控件-->
    <script type="text/javascript">
        var inputId="{{$p_info.inputId}}";
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
            var storage;
            if(is){
                var iv2 = $("#viewer").iviewer(
                        {
                            src: "{{$pic_path}}{{$picList.0.key}}"
                        });
            }

            $("#ps_newuser_pop").pop({
                oMain:"#record_reject",         //触发弹出层的元素。为空时直接弹出
                sEvent:"click",             //触发事件
                oClose:"#ps_newuser_pop .close", //关闭按钮
                bIframe:false,              //是否有iframe
                iSrc:"",                    //iframe地址
                bShade:true,                //是否有遮罩
                bShadeClose:false,          //是否点遮罩关闭
                fnAdditional:function(e){

                }
            });

        }); //end
        //通过事件

        //驳回
        function check(status){
            $.ajax({
                url:'{{$root_path}}input/inputPass',
                data:{inputId:inputId,status:status},
                dataType:"text",
                type:'post',
                success:function(e){
                    alert(e)
                }
            })
        }
    </script>
</body>
</html>
