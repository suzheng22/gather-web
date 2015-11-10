<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>数据采集系统</title>
{{include file='public/css.tpl'}}
<link rel="stylesheet" type="text/css" href="{{$resource_url}}js/rotate/jquery.iviewer.css"/>
</head>
<body>
<!--------------------------- 修图详情------------------------------------> 
<div class="record_info_warp" style="margin-top:0px;">
	<h2>xxxxxxxxx条形码-修图详情
      </h2>
	<ul class="clearfix" id="nav_info">
            <li class="black"><em>条形码:</em><span>12321312</span></li>
            <li class="black"><em>商品名称:</em><span>321312321312321</span></li>
            <li class="black"><em>商品类型:</em><span>32312312312</span></li>
            <li class="black">
            	<div class="ps_top_menu">
                <a href="#" class="pass"><i class="iconfont">&#xf01b1;</i>通过</a>
                <a href="javascript:;" id="new_user" class="back"><i class="iconfont">&#xf0223;</i>驳回</a>
                </div>
            </li>
       </ul>
     <div class="clearfix"><a href="javascript:;" id="cc_flex"><i class="iconfont">&#xf01f0;</i>查看原图</a></div>
	<div class="left_pc_check">
			<div class="pageContent ps_check_pic" >
                <div class="wrapper">
                    <div id="viewer" class="viewer"></div>
                </div>
			</div>
	    	<div class="detail_zoom_right" style="margin-left:100px;">	
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
                                        <li class="active"><img src="images/photos/IMG_6125.JPG" /></li>
                                        <li class=""><img src="images/photos/IMG_6125.JPG"/></li>
                                        <li class=""><img src="images/photos/2J0A9712.jpg"/></li>
                                        <li class=""><img src="images/photos/2J0A9712.jpg"/></li>
                                        <li class=""><img src="images/photos/2J0A9712.jpg"/></li>
                                        <li class=""><img src="images/photos/2J0A9712.jpg"/></li>
                                        <li class=""><img src="images/photos/2J0A9712.jpg"/></li>
                                        <li class=""><img src="images/photos/2J0A9712.jpg"/></li>
                                        <li class=""><img src="images/photos/2J0A9712.jpg"/></li>
                                      
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
                                        <li class=""><img src="images/photos/2J0A9712.jpg"/></li>
                                        <li class=""><img src="images/photos/2J0A9712.jpg"/></li>
                                     </ul>
                                </div>
                            </div><!--v_content-->
                       </div>
                    </div>
                    </div><!--show_a_01-->
                </div>
			</div>
  	</div><!--left-->
  	<div class="right ps_right" style="display:none;">
		<div class="pageContent ps_check" >
				<div class="imgContainer ps_check_pic">
                    <div id="viewer" class="viewer"></div>
			    </div>
                <h5>原图</h5>
               <!--	<h3><i class="iconfont">&#xf004c;</i></h3>-->
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
                                    <ul class="ps_con-FangDa-ImgList">
                                        <li class="active"><img src="images/photos/IMG_6125.JPG" /></li>
                                        <li class=""><img src="images/photos/IMG_6125.JPG"/></li>
                                        <li class=""><img src="images/photos/2J0A9712.jpg"/></li>
                                        <li class=""><img src="images/photos/2J0A9712.jpg"/></li>
                                        <li class=""><img src="images/photos/2J0A9712.jpg"/></li>
                                        <li class=""><img src="images/photos/2J0A9712.jpg"/></li>
                                        <li class=""><img src="images/photos/2J0A9712.jpg"/></li>
                                        <li class=""><img src="images/photos/2J0A9712.jpg"/></li>
                                        <li class=""><img src="images/photos/2J0A9712.jpg"/></li>
                                      
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
                                <ul class="ps_con-FangDa-ImgList">
                                    <li class=""><img src="images/photos/2J0A9712.jpg"/></li>
                                    <li class=""><img src="images/photos/2J0A9712.jpg"/></li>
                                 </ul>
                            </div>
                        </div><!--v_content-->
                   </div>
                </div>
            	</div><!--show_a_01-->
    		</div>
		</div><!--detail_zoom_right-->
		
  	</div><!--ps_right-->
  	
</div>
<!-- 驳回弹出层 开始-->
<div class="newuser_pop" id="ps_newuser_pop">
	<div class="tit clearfix"><h4>xxxx条形码-审核</h4><a class="no_text close" href="javascript:;" title="关闭">关闭</a></div>
	<div class="content">
		<div class="login_main">
			<div class="login_form">
				<div class="clearfix one"><label for="user_name">商品条形码:</label><span class="zhmm"></span></div>
                <div class="clearfix one"><label for="user_name">商品名称:</label><span class="zhmm"></span></div>
                <div class="clearfix one"><label for="user_name">商品类型:</label><span class="zhmm"></span></div>
                <div class="clearfix one"><label for="user_name">备注:</label><textarea></textarea></div>
                <a href="javascript:;" id="confirm_btn" class="confirm_btn">确认</a>
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
			src: "images/zoomFullScreen.jpg"
		});
		var iv2 = $(".viewer").iviewer(
		{
			src: "images/photos/2J0A9712.jpg"
		});

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
		$(".ps_check_pic").css({"height":"500px"});
		$("#cc_flex").click(function(){
			var txt=$(this).html();
			var aa=$(".ps_right");
			 if(aa.is(":visible")){
				$("#cc_flex").html('<i class="iconfont">&#xf01f0;</i>查看原图');
				$(".left_pc_check").css({"width":"1200px","overflow":"hidden","margin":"0 auto"});
				$(".ps_right").hide();
			  	$(".ps_check_pic").css({"height":"500px"});
				$(".left_pc_check .detail_zoom_right").css({"margin-left":"100px"});
			}else{
				
				$("#cc_flex").html('<i class="iconfont">&#xf01f0;</i>收起原图');
				$(".left_pc_check").css({"width":"598px","float":"left"});
			 	$(".ps_right").css({"float":"left","display":"block"});
				$(".ps_right").show();
				$(".left_pc_check .detail_zoom_right").css({"margin-left":"-40px"});
				$(".ps_check").css({"height":"500px"});
				
			}
			return false;
			
		});
	

						
});
</script> 
</body>
</html>
