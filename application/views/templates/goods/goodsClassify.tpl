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
                    <form action="{{$root_path}}goods/goodsClassify">
                    <div class="cc_top_one"><label>商品条形码:</label><input type="text" id="gtins" name="gtin" value="{{$gtin}}"/></div>
                    <div class="cc_top_one"><label>商品名称:</label><input type="text" id="gName" name="gName" value="{{$gName}}"/></div>
                    <div class="cc_top_one"><label>商品类型:</label>
                        <input type="text" name="goodsCatgrory" value="{{$goodsCatgrory}}" id="goodsCatgrorys"/>
                    </div>
                    <div class="clearfix"></div>
                    <div class="cc_top_one last_show"><label>一级分类:</label>
                        <div class="choice_count choice_box">
                            <dl class="select">
                                <select name="catgrory1" id="catgrory1" class="" onchange="change(1,1)" style="opacity:1">
                                    <option value="">全部</option>
                                    {{foreach from=$type_list item=list}}
                                    <option value="{{$list.id}}" {{if $catgrory1==$list.id}}selected="selected"{{/if}}>{{$list.name}}</option>
                                    {{/foreach}}
                                </select>
                            </dl>
                        </div>
                    </div>
                    <div class="cc_top_one last_show"><label>二级分类:</label>
                        <div class="choice_count choice_box">
                            <dl class="select">
                                <select name="catgrory2" id="catgrory2" class="" onchange="change(2,1)" style="opacity:1">
                                    <option value="">全部</option>
                                    {{foreach from=$type_list2 item=list}}
                                    <option value="{{$list.id}}" {{if $catgrory2==$list.id}}selected="selected"{{/if}}>{{$list.name}}</option>
                                    {{/foreach}}
                                </select>
                            </dl>
                        </div>
                    </div>
                    <div class="cc_top_one last_show"><label>三级分类:</label>
                        <div class="choice_count choice_box">
                            <dl class="select">
                                <select name="catgrory3" id="catgrory3" class="" style="opacity:1">
                                    <option value="">全部</option>
                                    {{foreach from=$type_list3 item=list}}
                                    <option value="{{$list.id}}" {{if $catgrory3==$list.id}}selected="selected"{{/if}}>{{$list.name}}</option>
                                    {{/foreach}}
                                </select>
                            </dl>
                        </div>
                    </div>

                    <div class="cc_top_two" style="margin-left:12px; display:inline;">
                        <a href="javascript:;" class="query" id="new_user" ><i class="icon iconfont">&#xf00ab;</i>批处理结果</a>
                        <span class="query"><i class="icon iconfont">&#xf00a8;</i><input type="submit" value="查询" /></span>
                        <a href="javascript:;"  onclick="btn_empty()"><i class="iconfont">&#xf014a;</i>清空</a>
                    </div>
                    </form>
                    <div class="clearfix"></div>
                    <div class="tab_box">
                        <table>
                            <tr>
                                <th>序号</th>
                                <th>商品条形码</th>
                                <th>商品名称</th>
                                <th>商品类型</th>
                                <th>商品一级分类</th>
                                <th>商品二级分类</th>
                                <th>商品三级分类</th>
                                <th>操作</th>
                            </tr>
                           {{foreach from=$glist item=list}}
                            <tr>
                                <td>{{$list.lId}}</td>
                                <td>{{$list.gtin}}</td>
                                <td>{{$list.gName}}</td>
                                <td>{{$list.goodsCatgrory}}</td>
                                <td>{{$list.catgrorys1}}</td>
                                <td>{{$list.catgrorys2}}</td>
                                <td>{{$list.catgrorys3}}</td>
                                <td>
                                    <a href="javascript:;" class="pic_img" id="{{$list.gtin}}">图</a>
                                    <a href="javascript:;" class="updata" id="{{$list.id}}">修改</a>
                                </td>
                            </tr>
                            {{/foreach}}
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
                    <div class="choice_count choice_box">
                        <dl class="select">
                            <select  class="catgrory1" style="opacity:1" onchange="change(1,2)">
                                <option value="">全部</option>
                                {{foreach from=$type_list item=list}}
                                <option value="{{$list.id}}" {{if $category1==$list.id}}selected="selected"{{/if}}>{{$list.name}}</option>
                                {{/foreach}}
                            </select>
                        </dl>
                    </div>
                </div>
                <div class="clearfix one">
                    <label for="user_name">二级分类:</label>
                    <div class="choice_count choice_box vocation">
                        <dl class="select">
                            <select  class="catgrory2" style="opacity:1" onchange="change(2,2)">
                                <option value="">请选择</option>
                            </select>
                        </dl>
                    </div>

                </div>
                <div class="clearfix one">
                    <label for="user_name">三级分类:</label>
                    <div class="choice_count choice_box vocation">
                        <dl class="select">
                            <select   class="catgrory3" style="opacity:1">
                                <option value="">请选择</option>
                            </select>
                        </dl>
                    </div>
                </div>

                <a href="javascript:;" id="confirm_btn" class="confirm_btn" onclick="batch_pass()">确认</a>
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
                <div class="clearfix one"><label for="user_name">商品条形码:</label><input type="text" id="get_gtin" class="zhmm"></div>
                <div class="clearfix one"><img src="#" id="get_image"  style="width:300px; height:300px;"></div>
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
                <div class="clearfix one"><label for="user_name">商品条形码:</label><input type="text" id="gtin1" class="zhmm" readonly="readonly"></div>
                <div class="clearfix one"><label for="user_name">商品名称:</label><input type="text" id="gName1" class="zhmm" readonly="readonly"></div>
                <div class="clearfix one"><label for="user_name">商品类型:</label><input type="text" id="goodsCatgrory1" class="zhmm" readonly="readonly"></div>
                <div class="clearfix one">
                    <label for="user_name">一级分类:</label>
                    <div class="choice_count choice_box">
                        <dl class="select">
                            <select class="select catgrorys1" onchange="change(1,3)" style="opacity:1">
                                <option value="">全部</option>
                                {{foreach from=$type_list item=list}}
                                <option value="{{$list.id}}" {{if $category1==$list.id}}selected="selected"{{/if}}>{{$list.name}}</option>
                                {{/foreach}}
                            </select>
                        </dl>
                    </div>

                </div>
                <div class="clearfix one">
                    <label for="user_name">二级分类:</label>
                    <div class="choice_count choice_box">
                        <dl class="select">
                            <select class="select catgrorys2" onchange="change(2,3)" style="opacity:1">
                                <option value="">请选择</option>
                            </select>
                        </dl>
                    </div>

                </div>
                <div class="clearfix one">
                    <label for="user_name">三级分类:</label>
                    <div class="choice_count choice_box">
                        <dl class="select">
                            <select class="select catgrorys3" style="opacity:1">
                                <option value="">请选择</option>
                            </select>
                        </dl>
                    </div>
                </div>
                <a href="javascript:;" id="confirm_btn" class="confirm_btn" onclick="updateGoodsInfo()">确认</a>
            </div>
        </div>
    </div>
</div>
{{include file='public/js.tpl'}}

<script type="text/javascript">
    $(function(){
        //分页表单提交
        $("#submits").on("click",function(){
                var action=$("#form").attr("action")+"&page="+$("input[name='page']").val();
                $("#form").attr("action",action);
            $("#form").submit();
        });
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
            fnAdditional:function(e){
                  var id= e.id;
                $.ajax({
                    url:'{{$root_path}}goods/getCatgroryInfo',
                    data:{id:id},
                    type:'post',
                    dataType:'json',
                    success:function(f){
                        localStorage.setItem('id',id);
                        $("#gtin1").val(f.gtin);
                        $('#gName1').val(f.gName);
                        $("#goodsCatgrory1").val(f.goodsCatgrory);
                        $(".catgrorys1").val(f.catgrory1);
                        //根据一级分类获取下级分类
                        change(1,3,f.catgrory1,f.catgrory2);
                        //根据二级分类获取下级分类
                        change(2,3,f.catgrory2,f.catgrory3);
                    }
                })
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
            fnAdditional:function(e){
                    var id=e.id;
                    $("#get_gtin").val(id);
                $.get("{{$root_path}}goods/getImage",{gtin:id},function(e){
                    $("#get_image").attr("src",e);
                },'text')
            }
        });
    });
    //获取下级分类

/*
* cat为父级ID
* next为下级ID
* */
    function change(e,f,cat,next){
        var catgrory;
        if(f==1)
            catgrory="#catgrory";
        else if(f==2)
           catgrory=".catgrory";
        else if(f==3)
            catgrory=".catgrorys";
        if(cat == undefined){
             cat=$(catgrory+e).val();
        }

        if(e==1){
            if(f==1){
                $(catgrory+"2").html("<option value=''>全部</option>");
                $(catgrory+"3").html("<option value=''>全部</option>");
            }else{
                $(catgrory+"2").html("<option value=''>请选择</option>");
                $(catgrory+"3").html("<option value=''>请选择</option>");
            }

        }if(e==2){
            if(f==1)
                $(catgrory+"3").html("<option value=''>全部</option>");
            else
                $(catgrory+"3").html("<option value=''>请选择</option>");
        }
        $.ajax({
            url:'{{$root_path}}goods/getNext',
            type:'post',
            dataType:'json',
            data:{catId:cat},
            success:function(a){
                var c=e+1;
                var option;
                if(f==1){
                    option="<option value=''>全部</option>";
                } else{
                    option="<option value=''>请选择</option>";
                }
                for(var i in a){
                        if(a[i].id==next){
                            option+="<option value=\'"+a[i].id+"\' selected='selected'>"+a[i].name+"</option>";
                        }else{
                            option+="<option value=\'"+a[i].id+"\'>"+a[i].name+"</option>";
                        }
                }
               $(catgrory+c).html(option);
            }
        })
    }
    //修改
    function updateGoodsInfo(){
        var catgrory1=$(".catgrorys1").val();
        var catgrory2=$(".catgrorys2").val();
        var catgrory3=$(".catgrorys3").val();
        var gName=$("#gName1").val();
        var id=localStorage.getItem('id');
        var data={catgrory1:catgrory1,catgrory2:catgrory2,catgrory3:catgrory3,gName:gName,id:id};
        $.ajax({
            url:'{{$root_path}}goods/updateGoodsInfo',
            data:data,
            type:'post',
            dataType:'json',
            success:function(e){
                localStorage.removeItem('id');
                    alert(e.msg);
                window.location.reload();
            }
        })

    }
    function batch_pass(){
        var gtin=$("#gtins").val();
        var gName=$("#gNames").val();
        var goodsCatgrory=$("#goodsCatgrorys").val();
        var catgrory1=$("#catgrory1").val();
        var catgrory2=$("#catgrory2").val();
        var catgrory3=$("#catgrory3").val();
        var catgrorys1=$(".catgrory1").val();
        var catgrorys2=$(".catgrory2").val();
        var catgrorys3=$(".catgrory3").val();

        var data={gtin:gtin,gName:gName,goodsCatgrory:goodsCatgrory,catgrory1:catgrory1,catgrory2:catgrory2,catgrory3:catgrory3,catgrorys1:catgrorys1,catgrorys2:catgrorys2,catgrorys3:catgrorys3};
        $.ajax({
            url:'{{$root_path}}goods/getGoodsIds',
            data:data,
            type:'POST',
            dataType:'json',
            success:function(e){
                alert(e.msg)
                //alert(e.msg);
                window.location.reload();
            },error:function(r){

            }
        })
    }
    function btn_empty() {
        $("input[type='text']").val("");
        $(".select3,.cc_top_one select").val("");
        $(".uew-select-text").html('全部');
    }
</script>

</body>
</html>
