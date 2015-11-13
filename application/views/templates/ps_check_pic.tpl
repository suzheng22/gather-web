<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>数据采集系统</title>
{{include file='public/css.tpl'}}
<link rel="stylesheet" type="text/css" href="{{$resource_url}}style/jquery.iviewer.css"/>
</head>
<body>
<!--------------------------- 修图详情------------------------------------> 
<div class="record_info_warp" style="margin-top:0px;">
	<h2>{{$p_info.gtin}}条形码-修图详情
      </h2>
	<ul class="clearfix" id="nav_info">
            <li class="black"><em>条形码:</em><span>{{$p_info.gtin}}</span></li>
            <li class="black"><em>商品名称:</em><span>{{$p_info.proName}}</span></li>
            <li class="black"><em>商品类型:</em><span>{{$p_info.typeName}}</span></li>
            <li class="black">
            	<div class="ps_top_menu">
                <a href="#" class="pass" onclick="check(1)"><i class="iconfont">&#xf01b1;</i>通过</a>
                <a href="javascript:;" id="new_user" class="back"><i class="iconfont">&#xf0223;</i>驳回</a>
                </div>
            </li>
       </ul>
     <div class="clearfix"><a href="javascript:;" id="cc_flex"><i class="iconfont">&#xf01f0;</i>查看原图</a></div>
	<div class="left_pc_check" id="left">
			<div class="pageContent ps_check_pic" >
                <div class="wrapper">
                    <div id="viewer" class="viewer"></div>
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
										{{foreach from=$plist.a2 item =list name=name}}
                                            <li {{if $smarty.foreach.name.first}}class="active"{{/if}}><img src="{{$list}}?imageView/1/w/50/h/50" mm="{{$list}}" /></li>
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
                                        {{$png}}
                                      
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
									{{foreach from=$plist.b2 item =list name=name}}
                                            <li {{if $smarty.foreach.name.first}}class=""{{/if}}><img src="{{$list}}?imageView/1/w/50/h/50" mm="{{$list}}" /></li>
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
                                    {{foreach from=$plist.c2 item =list name=name}}
                                            <li {{if $smarty.foreach.name.first}}class=""{{/if}}><img src="{{$list}}?imageView/1/w/50/h/50" mm="{{$list}}" /></li>
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
                                    {{foreach from=$plist.d2 item =list name=name}}
                                            <li {{if $smarty.foreach.name.first}}class=""{{/if}}><img src="{{$list}}?imageView/1/w/50/h/50" mm="{{$list}}" /></li>
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
                                        {{foreach from=$plist.e2 item =list name=name}}
                                            <li {{if $smarty.foreach.name.first}}class=""{{/if}}><img src="{{$list}}?imageView/1/w/50/h/50"  mm="{{$list}}" /></li>
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
                    <div id="viewer" class="viewer"></div>
                </div>
                <h5>原图</h5>
               <!--	<h3><i class="iconfont">&#xf004c;</i></h3>-->
		</div>
	    <!--<div class="detail_zoom_right" style="margin-left:0px;">	
    			<div class="popup_box" style="margin-top:10px;">
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
                                    {{foreach from=$plist.a1 item =list name=name}}
                                            <li {{if $smarty.foreach.name.first}}class="active"{{/if}}><img src="{{$list}}?imageView/1/w/200/h/200" mm="{{$list}}" /></li>
									{{/foreach}}
                                         </ul>
                                    </div>
                                </div>
                       		</div>
                    	</div>
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
                                    {{foreach from=$plist.b1 item =list name=name}}
                                            <li {{if $smarty.foreach.name.first}}class="active"{{/if}}><img src="{{$list}}?imageView/1/w/200/h/200" mm="{{$list}}" /></li>
									{{/foreach}}
                                     </ul>
                                </div>
                            </div>
                       </div>
                    	</div>
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
                                    {{foreach from=$plist.c1 item =list name=name}}
                                            <li {{if $smarty.foreach.name.first}}class="active"{{/if}}><img src="{{$list}}?imageView/1/w/200/h/200" mm="{{$list}}" /></li>
									{{/foreach}}
                                     </ul>
                                </div>
                            </div>
                       </div>
                    	</div>
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
                                    {{foreach from=$plist.d1 item =list name=name}}
                                            <li {{if $smarty.foreach.name.first}}class="active"{{/if}}><img src="{{$list}}?imageView/1/w/200/h/200" mm="{{$list}}" /></li>
									{{/foreach}}
                                     </ul>
                                </div>
                            </div>
                       </div>
                    	</div>
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
                                    {{foreach from=$plist.e2 item =list name=name}}
                                            <li {{if $smarty.foreach.name.first}}class="active"{{/if}}><img src="{{$list}}?imageView/1/w/200/h/200" mm="{{$list}}" /></li>
									{{/foreach}}
                                     </ul>
                                </div>
                            </div>
                       </div>
                    	</div>
                   
                   
                   
                   
            	</div>
    		</div>
		</div>--><!--detail_zoom_right-->
		
  	</div><!--ps_right-->
  	
</div>
<!-- 驳回弹出层 开始-->
<div class="newuser_pop" id="ps_newuser_pop">
	<div class="tit clearfix"><h4>{{$p_info.gtin}}条形码-审核</h4><a class="no_text close" href="javascript:;" title="关闭">关闭</a></div>
	<div class="content">
		<div class="login_main">
			<div class="login_form">
				<div class="clearfix one"><label for="user_name">商品条形码:</label><span class="zhmm">{{$p_info.gtin}}</span></div>
                <div class="clearfix one"><label for="user_name">商品名称:</label><span class="zhmm">{{$p_info.proName}}</span></div>
                <div class="clearfix one"><label for="user_name">商品类型:</label><span class="zhmm">{{$p_info.typeName}}</span></div>
                <div class="clearfix one"><label for="user_name">备注:</label><textarea id="memo"></textarea></div>
                <a href="##" id="confirm_btn" class="confirm_btn" onclick="check(2)">确认</a>
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
<script type="text/javascript" src="{{$resource_url}}js/defined.js"></script>
<script type="text/javascript"> 
 
	$(function(){ 
		//实例化
		
		var iv2 = $("#viewer").iviewer(
		{
			src: "{{$plist.a2.0}}?imageView/0/h/500/"
			//?imageView/1/w/500/h/500"
		});
		var iv2 = $(".viewer").iviewer(
		{
			src: "{{$plist.a1.0}}?imageView/0/h/500/"
			//?imageView/1/w/500/h/500
		});

		//var ww=$("#left .ps_FullScreen").width();
		//var hh=$("#left .ps_FullScreen").height();
		//if(ww>hh){
		//驳回
		 $("#ps_newuser_pop").pop({
			oMain:"#new_user",         //触发弹出层的元素。为空时直接弹出
			sEvent:"click",             //触发事件
			oClose:"#ps_newuser_pop .close", //关闭按钮
			bIframe:false,              //是否有iframe
			iSrc:"",                    //iframe地址
			bShade:true,                //是否有遮罩
			bShadeClose:false,          //是否点遮罩关闭
			fnAdditional:function(){
				
			}
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
	var gtin={{$p_info.gtin}};
	var memo=$("#memo").val();

		$.post("{{$root_path}}marlboro/checkStatus",{"gtin":gtin,"type":1,"status":status,"memo":memo},
		  	function(data){
				var dataObj=eval("("+data+")");
				if(dataObj.msgCode==0){
					if(status==1){
					   alert('审核成功');
					}
					else{
						alert('驳回成功');
					}
					window.location.reload();
				}
				else{
					alert(dataObj.msgText);
					window.location.reload();
				}
		  	},"text");


}
</script> 
</body>
</html>