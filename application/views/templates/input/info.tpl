{{if $p_info.inputId==""}}
<div style="width:300px;height:100px;margin: 0 auto;margin-top: 100px;color:red;text-align: center">暂无录入审核</div>

{{else}}

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>数据采集系统</title>
    {{include file='public/css.tpl'}}
    <link rel="stylesheet" type="text/css" href="{{$resource_url}}style/jquery.iviewer.css"/>
    <style type="text/css">
        select{opacity:1;}
        #nav_info li span{width:150px}
        #nav_info li em{width:140px}
        .right_mid .cf p select{width:120px}
    </style>
</head>
<body>
<!------------------------顶部j-top------------------------------------->
{{include file='public/top.tpl'}}


<div class="j-top-warp">
    <ul class="clearfix" id="nav_info">
        <li class="black"><em>商品条形码:</em><span >{{$p_info.gtin}}</span></li>
        {{if $p_info.orderId==""}}
        <li class="black"><em>可录入商品总数:</em><span>{{if $p_info.inputGoodsCount}}{{$p_info.inputGoodsCount}}{{else}}0{{/if}}</span></li>
        <li class="black"><em>今录入商品总数:</em><span>{{if $p_info.inputGoodsCountToday}}{{$p_info.inputGoodsCountToday}}{{else}}0{{/if}}</span></li>
        {{else}}
        <li class="black"><em>可审核商品总数:</em><span>{{if $p_info.orderGoodsCount}}{{$p_info.orderGoodsCount}}{{else}}0{{/if}}</span></li>
        <li class="black"><em>今审核商品总数:</em><span>{{if $p_info.orderGoodsToday}}{{$p_info.orderGoodsToday}}{{else}}0{{/if}}</span></li>
        {{/if}}
    </ul>
    {{if $p_info.status==4}}
    <ul>
        <li>
            <p class="clearfix">驳回点:{{$p_info.memo}}</p>
            </li>
        <li><p class="clearfix">
                驳回原因:{{$p_info.memoPoint}}</p></li>
    </ul>
    {{/if}}
</div>


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
                                        <li {{if $smarty.foreach.name.first}}class=""{{/if}}><img src="{{$list.domain}}/{{$list.key}}-thumbnail50" mm="{{$list.domain}}/{{$list.key}}" /></li>
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
                                        <li {{if $smarty.foreach.name.first}}class=""{{/if}}><img src="{{$list.domain}}/{{$list.key}}-thumbnail50" mm="{{$list.domain}}/{{$list.key}}" /></li>
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
                <a href="javascript:;" class="selected">分类</a>
                <a href="javascript:;" >基本信息</a>
                <a href="javascript:;">厂商信息</a>
                <a href="javascript:;">扩充信息</a>
                <a href="javascript:;" class="last">营养成分</a>
            </h3>
        </div>
        <div class="right_mid">
            <!--基本信息-->   <!--尺寸信息-->
            <div  class="cf" >
                {{if $p_info.isGroup==1}}单品
                {{else}}
                    组合包装
                {{foreach from=$p_info.groupGoodsNames key=key item=list}}
                <P class="clearfix">
                    <label>产品名称：</label>
                    <span>{{$list}}</span>
                </P>
                {{/foreach}}
                {{/if}}
            </div>

            <div class="cf clearfix" style="display:none;">
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
                                        <span>{{$v}}<span>
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
                    {{if $list.proName!="" and $list.proName!="undefined"}}
                    <h3 class="clearfix">产品名称:{{$list.proName}}</h3>
                    {{/if}}
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


        </div>
    </div>
    {{if $p_info.status==4 && $p_info.p_status==1}}
    <div class="zz_conforim"><a href="{{$root_path}}input/inputChange?inputId={{$p_info.inputId}}&gtin={{$p_info.gtin}}&packet={{$p_info.packet}}&batchNo={{$p_info.batchNo}}" onclick="checkw(1)" id="record_confirm">编辑</a></div>
    {{else if  $p_info.p_status==2}}
    <div class="zz_conforim"><a href="javascript:;" onclick="check(2)" id="record_confirm">通过</a><a href="javascript:;"  id="record_confirms">驳回</a></div>
    {{/if}}
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
                            <input type="checkbox" name="radio" id="1"/><label for="1" class="num">文字错误
                            </label>
                            <input type="checkbox" name="radio" id="2"/><label for="2" class="num">信息缺失
                            </label>
                            <input type="checkbox" name="radio" id="3"/><label for="3" class="num">信息不符
                            </label>
                        </p>
                    </div>
                    <div class="clearfix one"><label for="user_name">备注:</label><textarea id="memo"></textarea></div>
                    <a href="##" id="confirm_btn" class="confirm_btn" onclick="check(3)">确认</a>
                </div>
            </div>
        </div>
    </div>

    <div></div>
    <script type="text/javascript" src="{{$resource_url}}js/jquery-1.9.1.min.js"></script>
    <script src="{{$resource_url}}js/ui_tab.js" type="text/javascript"></script>
    <script type="text/javascript" src="{{$resource_url}}js/rotate/jqueryui.js"></script>
    <script type="text/javascript" src="{{$resource_url}}js/rotate/jquery.mousewheel.min.js"></script>
    <script type="text/javascript" src="{{$resource_url}}js/rotate/jquery.iviewer.js"></script>
    <script type="text/javascript" src="{{$resource_url}}js/popup/popup.js"></script>
    <script type="text/javascript" src="{{$resource_url}}js/record.js"></script>
    <script type="text/javascript" src="{{$resource_url}}js/province_res.js"></script>
    <!--dom预加载-->
    <script type="text/javascript" src="{{$resource_url}}js/lazyload/jquery.fadeloader.js"></script>
    <script type="text/javascript" src="{{$resource_url}}js/lazyload/jquery.lazyload.js"></script>

    <!--时间控件-->
    <script type="text/javascript">
        var inputId="{{$p_info.inputId}}";
        var orderId="{{$p_info.orderId}}";
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
                            src: "{{$picList['0']['domain']}}/{{$picList.0.key}}"
                        });
            }

            $("#ps_newuser_pop").pop({
                oMain:"#record_confirms",         //触发弹出层的元素。为空时直接弹出
                sEvent:"click",             //触发事件
                oClose:"#ps_newuser_pop .close", //关闭按钮
                bIframe:false,              //是否有iframe
                iSrc:"",                    //iframe地址
                bShade:true,                //是否有遮罩
                bShadeClose:false,          //是否点遮罩关闭
                fnAdditional:function(e){

                }
            });
            //选项卡
            $(".choice_count h3 a").click(function(){
                //alert("aa");
                var index = 0;
                $(this).addClass("selected").siblings().removeClass("selected");
                var index=$(".choice_count h3 a").index(this);
                $(".right_mid ul,.right_mid .cf").eq(index).show().stop(true, true).siblings().hide();
            });


        }); //end
        //通过事件
        //驳回
        function check(status){
            var data="";
            if(status==3){
                var memo=$("#memo").val();
                var len=$("input[type='checkbox']:checked").length;
                if(len==0){
                    alert("请选择错误类型");
                    return false;
                }
                var memoPoint="";
                for(var i=0;i<len;i++){
                    var check=$("input[type='checkbox']:eq("+i+")").get(0).checked;
                        var value=$("input[type='checkbox']:eq("+i+")").attr("id");
                        if(i==len-1){
                            if(value==1){
                                memoPoint+="文字错误";
                            } if(value==2){
                                memoPoint+="信息缺失";
                            }if(value==3){
                                memoPoint+="信息不符";
                            }
                        }else{
                            if(value==1){
                                memoPoint+="文字错误,";
                            } if(value==2){
                                memoPoint+="信息缺失,";
                            } if(value==3){
                                memoPoint+="信息不符,";
                            }
                        }
                }
                data={orderId:orderId,status:status,memo:memo,memoPoint:memoPoint};
            }else if (status==2){
                data={orderId:orderId,status:status}
            }
            $.ajax({
                url:'{{$root_path}}input/inputPass',
                data:data,
                dataType:"json",
                type:'post',
                success:function(e){
                    alert(e.msg);
                    if(confirm("是否进入下一个审核")){
                        window.location.replace("{{$root_path}}input/inputAudit") ;
                    }else{
                        $(".zz_conforim").hide();
                    }
                }
            })
        }
    </script>
</body>
</html>
{{/if}}