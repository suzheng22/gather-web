<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>数据采集系统</title>
{{include file='public/css.tpl'}}
<link rel="stylesheet" type="text/css" href="{{$resource_url}}style/jquery.iviewer.css"/>
</head>
<body>
{{include file='public/top.tpl'}}
<!--------------------------- 修图详情------------------------------------> 
<div class="record_info_warp" style="margin-top:0px;">
	<h2>{{$p_info.gtin}}条形码-修图详情
      </h2>
	<ul class="clearfix" id="nav_info">
         <li class="black clearfix"><em>条形码:</em><span>{{$p_info.gtin}}</span></li>
        <li class="black clearfix"><em>商品名称:</em><span title='{{$p_info.gName}}'>{{$p_info.gName}}</span></li>
        <li class="black clearfix"><em>商品类型:</em><span>{{$p_info.catName}}</span></li>
        <!-- 拍摄类型 -->
        <li class="black clearfix"><em>拍摄类型:</em><span>{{if $p_info.retouchType ==1}}正常拍摄{{else}}驳回拍摄{{/if}}</span></li>
        <!-- 项目 -->
        <li class="black clearfix"><em>项目:</em><span>{{$p_info.pName}}</span></li>
        <!-- 包装 -->
        <li class="black clearfix"><em>包装:</em><span>包装{{$p_info.packet}}</span></li>
        <!-- 批次 -->
        <li class="black clearfix"><em>批次:</em><span>批次{{$p_info.batchNo}}</span></li>
        <div class="clearfix"></div>
        <p class="back_why_info">
            <!-- {{if $p_info.status==3}}-->
            最新驳回原因:<span>{{$p_info.memo}}</span>
            <!--  {{/if}}-->
        </p>

        <div class="ps_top_menu">
            {{if $p_info.status==1}}
            <a href="" class="pass" onclick="check(2)"><i class="iconfont">&#xf01b1;</i>通过</a>
            <a href="javascript:;" id="new_user" class="back" ><i class="iconfont">&#xf0223;</i>驳回</a>
            {{else}}
            {{if $p_info.status==2}} <a href="javascript:;" class="pass"><i class="iconfont">&#xf01b1;</i>已通过</a>
            {{elseif $p_info.status==3}} <a href="javascript:;" class="back"><i class="iconfont">&#xf0223;</i>已驳回</a>
            {{/if}}
            {{/if}}
        </div>
       </ul>
     <div class="clearfix"><a href="javascript:;" id="cc_flex"><i class="iconfont">&#xf01f0;</i>查看原图</a></div>
	<div class="left_pc_check" id="left">
			<div class="pageContent ps_check_pic" >
                <div class="wrapper">
                    <div id="viewer1" class="viewer"></div>
                </div>
                <h5>修图</h5>
			</div>
	    	<div class="detail_zoom_right" style="margin-left:100px;">	
                <div class="popup_box" style="margin-top:10px;">
                <!--正常显示层-->
                     <div class="show_a_01">
                        <div class="pic_box clearfix">
                            <div class="pic_box_left">
                                <p>主图jpg</p>
                            </div>
                        	<div style="float:left" class="v_show">
                                <span class="prev"><i class="icon iconfont">&#x3465;</i></span>
                                <span class="next"><i class="icon iconfont">&#x3464;</i></span>
                                <div class="v_content">
                                    <div  class="v_content_list">
                                        <ul class="con-FangDa-ImgList">
                                            {{foreach from=$plists.1 item =list name=name}}
                                            <li {{if $smarty.foreach.name.first}}class="active"{{/if}}><img src="{{$list.domain}}/{{$list.key}}-thumbnail50" mm="{{$list.domain}}/{{$list.key}}" mmc="{{$list.domain}}/{{$list.key1}}" mma="{{$list.key}}" mmh="{{$list.domain}}"/></li>
                                            {{/foreach}}
                                        </ul>
                                    </div>
                                </div>
                       		</div>
                    	</div>
                        <!--主图jpg-->
                    	<div class="pic_box clearfix">
                        <div class="pic_box_left">
                            <p>主图png</p>
                        </div>
                        <div style="float:left" class="v_show">
                            <span class="prev"><i class="icon iconfont">&#x3465;</i></span>
                            <span class="next"><i class="icon iconfont">&#x3464;</i></span>
                            <div class="v_content">
                                <div  class="v_content_list">
                                    <ul class="con-FangDa-ImgList">
                                        {{foreach from=$plists.1 item =list name=name}}
                                        <li {{if $smarty.foreach.name.first}}class=""{{/if}}><img src="{{$list.domain}}/{{$list.key}}-thumbnail50" mm="{{$list.domain}}/{{$list.key}}" mmc="{{$list.domain}}/{{$list.key2}}" mma="{{$list.key}}" mmh="{{$list.domain}}" mmd="2"/></li>
                                        {{/foreach}}
                                     </ul>
                                </div>
                            </div>
                       </div>
                    </div>
                        <!--主图png-->
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
                                        {{foreach from=$plists.2 item =list name=name}}
                                        <li {{if $smarty.foreach.name.first}}class=""{{/if}}><img src="{{$list.domain}}/{{$list.key}}-thumbnail50" mm="{{$list.domain}}/{{$list.key}}" mmc="{{$list.domain}}/{{$list.key1}}" mma="{{$list.key}}" mmh="{{$list.domain}}"/></li>
                                        {{/foreach}}
                                     </ul>
                                </div>
                            </div><!--v_content-->
                       </div>
                    	</div>
                        <!--细节图-->
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
                                        {{foreach from=$plists.3 item =list name=name}}
                                        <li {{if $smarty.foreach.name.first}}class=""{{/if}}><img src="{{$list.domain}}/{{$list.key}}-thumbnail50" mm="{{$list.domain}}/{{$list.key}}" mmc="{{$list.domain}}/{{$list.key1}}" mma="{{$list.key}}" mmh="{{$list.domain}}"/></li>
                                        {{/foreach}}
                                     </ul>
                                </div>
                            </div><!--v_content-->
                       </div>
                    	</div>
                        <!--标签图-->
                        
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
                                        {{foreach from=$plists.4 item =list name=name}}
                                        <li {{if $smarty.foreach.name.first}}class=""{{/if}}><img src="{{$list.domain}}/{{$list.key}}-thumbnail50" mm="{{$list.domain}}/{{$list.key}}" mmc="{{$list.domain}}/{{$list.key1}}" mma="{{$list.key}}" mmh="{{$list.domain}}"/></li>
                                        {{/foreach}}
                                     </ul>
                                </div>
                            </div><!--v_content-->
                       </div>
                    	</div>
                        <!--组合图-->
                        
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
                                        {{foreach from=$plists.5 item =list name=name}}
                                        <li {{if $smarty.foreach.name.first}}class=""{{/if}}><img src="{{$list.domain}}/{{$list.key}}-thumbnail50" mm="{{$list.domain}}/{{$list.key}}" mmc="{{$list.domain}}/{{$list.key1}}" mma="{{$list.key}}" mmh="{{$list.domain}}"/></li>
                                        {{/foreach}}
                                     </ul>
                                </div>
                            </div><!--v_content-->
                       </div>
                    	</div>
                        <!--箱装图-->
                        
                    </div><!--show_a_01-->
                </div><!--popup_box-->
			</div>
  	</div><!--left-->
  	<div class="right ps_right" style="display:none;" id="ps_right">
		<div class="pageContent ps_check_pic">
                 <div class="wrapper">
                    <div id="viewer2" class="viewer"></div>
                </div>
                <h5>原图</h5>
               <!--	<h3><i class="iconfont">&#xf004c;</i></h3>-->
		</div>
    </div>
  	
</div>
<!-- 驳回弹出层 开始-->
<div class="newuser_pop" id="ps_newuser_pop">
	<div class="tit clearfix"><h4>{{$p_info.gtin}}条形码-审核</h4><a class="no_text close" href="javascript:;" title="关闭">关闭</a></div>
	<div class="content">
		<div class="login_main">
			<div class="login_form">
				<div class="clearfix one"><label for="user_name">商品条形码:</label><span class="zhmm">{{$p_info.gtin}}</span></div>
                <div class="clearfix one"><label for="user_name">商品名称:</label><span class="zhmm">{{$p_info.gName}}</span></div>
                <div class="clearfix one"><label for="user_name">商品类型:</label><span class="zhmm">{{$p_info.catName}}</span></div>
                <div class="clearfix one"><label for="user_name">备注:</label><textarea id="memo"></textarea></div>
                <a href="##" id="confirm_btn" class="confirm_btn" onclick="check(3)">确认</a>
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
        //原图
        var iv2 = $(" #ps_right #viewer2").iviewer(
                {
                    src: "{{$plistsis[0]['domain']}}/{{$plistsis.0.key}}"
                    //?imageView/1/w/500/h/500
                });
        //修图
        function src(){
            var url="{{$more_api}}/lingmall/retouch/getKey?token={{$token}}&key1={{$plistsis.0.key}}";

            $.get(url,'',function(e){
                //alert(e);return false;
                if(e!=null){
                    var  h="{{$picList[0]['domain']}}"+"/"+e.key2;
                }else{
                    var  h="{{$picList[0]['domain']}}"+"/{{$picList.0.key}}";
                }

                        var iv2 = $(".left_pc_check #viewer1").iviewer(
                {
                    src: h
                });
            },'json')
        }
        //第一次查看的修图
        src();




		//驳回
		 $("#ps_newuser_pop").pop({
			oMain:"#new_user",         //触发弹出层的元素。为空时直接弹出
			sEvent:"click",             //触发事件
			oClose:"#ps_newuser_pop .close", //关闭按钮
			bIframe:false,              //是否有iframe
			iSrc:"",                    //iframe地址
			bShade:true,                //是否有遮罩
			bShadeClose:false,          //是否点遮罩关闭
			fnAdditional:function(e){

			}
		});
        //点击图片

        $(".con-FangDa-ImgList").on("click","img",function(){
            var smallSrc = $(this).attr('mm');  //1
            $(".left .ps_FullScreen").attr('src',smallSrc); //录入
            $("#ps_right .ps_FullScreen").attr('src',smallSrc);//修图审核原图
            var mmc=($(this).attr("mma"));
            var mmh=$(this).attr("mmh");
            var mc=$(this).attr("mmc");
            var type=$(this).attr("mmd");
            var token="{{$token}}";
            var url="{{$more_api}}/lingmall/retouch/getKey?token={{$token}}&key1="+mmc;
            $.get(url,'',function(e){
                var h="";
                if(type!=2){
                    if(e!=null)
                        h=(mmh+"/"+e.key2);

                }else{
                    if(e!=null)
                        h=(mmh+"/"+e.key3);
                }
                if(h==""){
                    $("#left .ps_FullScreen").attr('src',mc);// 修图审核修图
                }else{
                    $("#left .ps_FullScreen").attr('src',h);// 修图审核修图
                }

            },'json');
            $(".con-FangDa-ImgList li").removeClass("active");
            $(this).parent().addClass('active');//选中当前小图片加红色框线
        });

		//动画展开收起
		$(".ps_check_pic").css({"height":"500px","margin-bottom":"50px"});
		$("#cc_flex").click(function(){
			var txt=$(this).html();
			var aa=$(".ps_right");
			 if(aa.is(":visible")){
				$("#cc_flex").html('<i class="iconfont">&#xf01f0;</i>查看原图');
				$(".left_pc_check").css({"width":"1200px","overflow":"hidden","margin":"0 auto"});
				$(".ps_right").hide();
			  	$(".ps_check_pic").css({"height":"500px","margin-bottom":"50px"});
				$(".left_pc_check .detail_zoom_right").css({"margin-left":"100px"});
			}else{
				$("#cc_flex").html('<i class="iconfont">&#xf01f0;</i>收起原图');
				$(".left_pc_check").css({"width":"598px","float":"left"});
			 	$(".ps_right").css({"float":"left","display":"block"});
				$(".ps_right").show();
				$(".ps_check_pic").css({"height":"500px","margin-bottom":"0px"});
				$(".left_pc_check .detail_zoom_right").css({"margin-left":"-40px"});
				$(".ps_check").css({"height":"500px"});
			}
			return false;
		});			
});
function check(status){
    var orderId="{{$p_info.orderId}}";
	var gtin={{$p_info.gtin}};
	var memo=$("#memo").val();
    if(memo==""){
        if(status==3){
            alert("驳回原因不能为空");
            return false;
        }
    }
		$.post("{{$root_path}}retouch/changeStatus",{'orderId':orderId,"status":status,"memo":memo},
		  	function(data){
                alert(data.msg);
                window.location.reload();
		  	},"json");
}
</script> 
</body>
</html>
