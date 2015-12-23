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
                <h3>商品分类</h3>
                <div class="rose_top main_rignt_top clearfix">
                    <div class="cc_top_one"><label>商品条形码:</label><input type="text" naae="gtin"/></div>
                    <div class="cc_top_one"><label>商品名称:</label><input type="text" name="gName"/></div>
                    <div class="cc_top_one last_show"><label>商品类型:</label>
                        <div class="choice_count choice_box vocation">
                            <dl class="select">
                                <select class="select3" name="catId">
                                    <option value="">全部</option>
                                    <option value="">1</option>
                                    <option value="">2</option>
                                </select>
                            </dl>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="cc_top_one last_show"><label>一级分类:</label>
                        <div class="choice_count choice_box vocation">
                            <dl class="select">
                                <select class="select3" name="catgrory1">
                                    <option value="">全部</option>
                                    <option value="">1</option>
                                    <option value="">2</option>
                                </select>
                            </dl>
                        </div>
                    </div>
                    <div class="cc_top_one last_show"><label>二级分类:</label>
                        <div class="choice_count choice_box vocation">
                            <dl class="select">
                                <select class="select3" name="catgrory2">
                                    <option value="">全部</option>
                                    <option value="">1</option>
                                    <option value="">2</option>
                                </select>
                            </dl>
                        </div>
                    </div>
                    <div class="cc_top_one last_show"><label>三级分类:</label>
                        <div class="choice_count choice_box vocation">
                            <dl class="select">
                                <select class="select3" name="catgrory3">
                                    <option value="">全部</option>
                                    <option value="">2</option>
                                    <option value="">1</option>

                                </select>
                            </dl>
                        </div>
                    </div>

                    <div class="cc_top_two" style="margin-left:12px; display:inline;">
                        <a href="javascript:;" class="query" id="new_user"><i class="icon iconfont">&#xf00ab;</i>批处理结果</a>
                        <a href="javascript:;" class="query"><i class="icon iconfont">&#xf00a8;</i>查询</a>
                        <a href="javascript:;"><i class="iconfont">&#xf014a;</i>清空</a>
                    </div>
                    <div class="clearfix"></div>
                    <div class="tab_box">
                        <table>
                            <tr>
                                <th>序号</th>
                                <th>商品条形码</th>
                                <th>商品名称</th>
                                <th>商品分类</th>
                                <th>商品类型</th>
                                <th>品牌</th>
                                <th>状态</th>
                                <th>操作</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>asda</td>
                                <td>dsad</td>
                                <td>dasdd</td>
                                <td>dadas</td>
                                <td>审核通过</td>
                                <td>正常</td>
                                <td>
                                    <a href="javascript:;" class="pic_img">图</a>
                                    <a href="javascript:;" class="updata">修改</a>
                                </td>
                            </tr>

                        </table>
                    </div>
                    <div class="page_nav" id="page_nav">
                        {{$pages}}
                    </div>

                </div>
            </div>
        </div>
    </div><!--main end-->
</div>
<!-- 批处理结果 开始-->
<div class="newuser_pop" id="newuser_pop">
    <div class="tit clearfix"><h4>批量处理</h4><a class="no_text close" href="javascript:;" title="关闭">关闭</a></div>
    <div class="content">
        <div class="login_main">
            <div class="login_form">
                <div class="clearfix one ">
                    <label for="user_name">一级分类:</label>
                    <div class="choice_count choice_box vocation">
                        <dl class="select">
                            <select class="select1">
                                <option value="">全部</option>
                                <option value="">2</option>
                                <option value="">1</option>

                            </select>
                        </dl>
                    </div>

                </div>
                <div class="clearfix one">
                    <label for="user_name">二级分类:</label>
                    <div class="choice_count choice_box vocation">
                        <dl class="select">
                            <select class="select1">
                                <option value="">全部</option>
                                <option value="">2</option>
                                <option value="">1</option>

                            </select>
                        </dl>
                    </div>

                </div>
                <div class="clearfix one">
                    <label for="user_name">三级分类:</label>
                    <div class="choice_count choice_box vocation">
                        <dl class="select">
                            <select class="select1">
                                <option value="">全部</option>
                                <option value="">2</option>
                                <option value="">1</option>

                            </select>
                        </dl>
                    </div>
                </div>

                <a href="javascript:;" id="confirm_btn" class="confirm_btn">确认</a>
            </div>
        </div>
    </div>
</div>

<!-- img 开始-->
<div class="newuser_pop pic_img_box">
    <div class="tit clearfix"><h4>图</h4><a class="no_text close" href="javascript:;" title="关闭">关闭</a></div>
    <div class="content">
        <div class="login_main">
            <div class="login_form">
                <div class="clearfix one"><label for="user_name">商品条形码:</label><input type="text" id="" class="zhmm"></div>
                <div class="clearfix one"><img src="images/photos/4.jpg"/ style="width:300px; height:300px;"></div>
                <a href="javascript:;" id="confirm_btn" class="confirm_btn" style="margin:0px auto;">确认</a>
            </div>
        </div>
    </div>
</div>

<!-- 修改 开始-->
<div class="newuser_pop updata_box">
    <div class="tit clearfix"><h4>商品分类维护</h4><a class="no_text close" href="javascript:;" title="关闭">关闭</a></div>
    <div class="content">
        <div class="login_main">
            <div class="login_form">
                <div class="clearfix one"><label for="user_name">商品条形码:</label><input type="text" id="" class="zhmm"></div>
                <div class="clearfix one"><label for="user_name">商品名称:</label><input type="text" id="" class="zhmm"></div>
                <div class="clearfix one"><label for="user_name">商品类型:</label><input type="text" id="" class="zhmm"></div>
                <div class="clearfix one">
                    <label for="user_name">一级分类:</label>
                    <div class="choice_count choice_box vocation">
                        <dl class="select">
                            <select class="select1">
                                <option value="">全部</option>
                                <option value="">2</option>
                                <option value="">1</option>

                            </select>
                        </dl>
                    </div>

                </div>
                <div class="clearfix one">
                    <label for="user_name">二级分类:</label>
                    <div class="choice_count choice_box vocation">
                        <dl class="select">
                            <select class="select1">
                                <option value="">全部</option>
                                <option value="">2</option>
                                <option value="">1</option>

                            </select>
                        </dl>
                    </div>

                </div>
                <div class="clearfix one">
                    <label for="user_name">三级分类:</label>
                    <div class="choice_count choice_box vocation">
                        <dl class="select">
                            <select class="select1">
                                <option value="">全部</option>
                                <option value="">2</option>
                                <option value="">1</option>

                            </select>
                        </dl>
                    </div>
                </div>

                <a href="javascript:;" id="confirm_btn" class="confirm_btn">确认</a>
            </div>
        </div>
    </div>
</div>
{{include file='public/js.tpl'}}

<script type="text/javascript">
    $(function(){

        //select 表单美化
        $(".select3").uedSelect({
            width : 112
        });
        $(".select1").uedSelect({
            width :250
        });
        //批量处理
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

        $(".updata_box").pop({
            oMain:".updata",         //触发弹出层的元素。为空时直接弹出
            sEvent:"click",             //触发事件
            oClose:".updata_box .close", //关闭按钮
            bIframe:false,              //是否有iframe
            iSrc:"",                    //iframe地址
            bShade:true,                //是否有遮罩
            bShadeClose:false,          //是否点遮罩关闭
            fnAdditional:function(){

            }
        });

        $(".pic_img_box").pop({
            oMain:".pic_img",         //触发弹出层的元素。为空时直接弹出
            sEvent:"click",             //触发事件
            oClose:".pic_img_box .close", //关闭按钮
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
