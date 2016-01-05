<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>数据采集系统</title>
    {{include file='public/css.tpl'}}
</head>
<body>
<!------------------------顶部j-top------------------------------------->
{{include file='public/top.tpl'}}
<!------------------------顶部结束--------------------------------------->
<!--------------------------- 录入信息------------------------------------>
<div class="record_info_warp">
    <div class="left record_left">
        <div class="pageContent record_pageContent">
            <div class="wrapper">
                <div id="viewer" class="viewer"></div>
            </div>
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
                        <P class="clearfix">
                            <label>商品名称：</label>
                            <span>xxxxxxx</span>
                        </P>
                        <P class="clearfix">
                            <label>商品类型：</label>
                            <span>xxxxxxx</span>
                        </P>
                        <P class="clearfix">
                            <label>品牌(中)：</label>
                            <span>xxxxxxx</span>
                        </P>
                        <P class="clearfix">
                            <label>品牌(英)：</label>
                            <span>xxxxxxx</span>
                        </P>
                        <P class="clearfix">
                            <label>产地/原产国：</label>
                            <span>xxxxxxx</span>
                        </P>
                        <P class="clearfix">
                            <label>生产执行标准号：</label>
                            <span>xxxxxxx</span>
                        </P>
                        <P class="clearfix">
                            <label>配料：</label>
                            <span>xxxxxxx</span>
                        </P>
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
                <div class="bus_info">
                    <P>分销商</P>
                    <P>xxxx有限公司</P>
                    <P>中国广东省xxxx路</P>
                    <p>13738292770</p>
                    <p>许可证</p>
                    <p>许可证</p>
                </div>
                <div class="bus_info">
                    <P>分销商</P>
                    <P>xxxx有限公司</P>
                    <P>中国广东省xxxx路</P>
                    <p>13738292770</p>
                    <p>许可证</p>
                    <p>许可证</p>
                </div>
                <div class="bus_info">
                    <P>分销商</P>
                    <P>xxxx有限公司</P>
                    <P>中国广东省xxxx路</P>
                    <p>13738292770</p>
                    <p>许可证</p>
                    <p>许可证</p>
                </div>
                <div class="bus_info">
                    <P>分销商</P>
                    <P>xxxx有限公司</P>
                    <P>中国广东省xxxx路</P>
                    <p>13738292770</p>
                    <p>许可证</p>
                    <p>许可证</p>
                </div>
            </div>
            <!--扩充信息-->
            <div style="display:none;" class="cf">
                <div class="extend_info">
                    <P class="clearfix">
                        <label>xx：</label>
                        <span>xxxxxxx</span>
                    </P>
                    <P class="clearfix">
                        <label>xx：</label>
                        <span>xxxxxxx</span>
                    </P>
                    <P class="clearfix">
                        <label>xx：</label>
                        <span>xxxxxxx</span>
                    </P>
                    <P class="clearfix">
                        <label>xx：</label>
                        <span>xxxxxxx</span>
                    </P>
                    <P class="clearfix">
                        <label>xx：</label>
                        <span>xxxxxxx</span>
                    </P>
                    <P class="clearfix">
                        <label>xx：</label>
                        <span>xxxxxxx</span>
                    </P>
                    <P class="clearfix">
                        <label>xx：</label>
                        <span>xxxxxxx</span>
                    </P>
                    <P class="clearfix">
                        <label>xx：</label>
                        <span>xxxxxxx</span>
                    </P><P class="clearfix">
                        <label>xx：</label>
                        <span>xxxxxxx</span>
                    </P>

                </div>

            </div>
            <!--营养成分-->
            <div style="display:none;" class="cf">
                <div class="dic_info">
                    <h3 class="clearfix">商品名称:xxxxx</h3>
                    <h4 class="clearfix">
                        <span>成分名称</span>
                        <span>含量:</span>
                        <span>NVR%</span>
                    </h4>
                    <P class="clearfix">
                        <span>能量:</span>
                        <span>100kj</span>
                        <span>200%</span>
                    </P>
                    <P class="clearfix">
                        <span>能量:</span>
                        <span>100kj</span>
                        <span>200%</span>
                    </P>
                </div>
                <div class="dic_info">
                    <h3 class="clearfix">商品名称:xxxxx</h3>
                    <h4 class="clearfix">
                        <span>成分名称</span>
                        <span>含量:</span>
                        <span>NVR%</span>
                    </h4>
                    <P class="clearfix">
                        <span>能量:</span>
                        <span>100kj</span>
                        <span>200%</span>
                    </P>
                    <P class="clearfix">
                        <span>能量:</span>
                        <span>100kj</span>
                        <span>200%</span>
                    </P>
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
    <!--dom预加载-->
    <script type="text/javascript" src="{{$resource_url}}js/lazyload/jquery.fadeloader.js"></script>
    <script type="text/javascript" src="{{$resource_url}}js/lazyload/jquery.lazyload.js"></script>
    {{include file='public/js.tpl'}}
    <!--时间控件-->
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
            var iv2 = $("#viewer").iviewer(
                    {
                        src: "{{$pic_path}}{{$picList.0.key}}"
                    });

        }); //end
    </script>
</body>
</html>
