<script type="text/javascript"  src="{{$resource_url}}js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="{{$resource_url}}js/popup/popup.js"></script>
<script type="text/javascript" src="{{$resource_url}}js/defined.js"></script>
<script type="text/javascript" src="{{$resource_url}}js/full_screen.js"></script>
<script type="text/javascript" src="{{$resource_url}}style/select2/select-ui.min.js"></script>
<script type="text/javascript">
$(function(){
	//用户列表
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
	$("#newuser_pop_revamp").pop({
			oMain:".revamp",         //触发弹出层的元素。为空时直接弹出
			sEvent:"click",             //触发事件
			oClose:"#newuser_pop_revamp .close", //关闭按钮
			bIframe:false,              //是否有iframe
			iSrc:"",                    //iframe地址
			bShade:true,                //是否有遮罩
			bShadeClose:false,          //是否点遮罩关闭
			fnAdditional:function(){
				 
				 
			}
		});
});	
</script>	

<link rel="stylesheet" type="text/css" href="{{$resource_url}}js/time/jquery.datetimepicker.css"/>
<script type="text/javascript" src="{{$resource_url}}js/time/jquery.datetimepicker.js"></script>
<script type="text/javascript">
$('#datetimepicker_start,#datetimepicker_end').datetimepicker({
    
    format:'Y-m-d',
    formatDate:'Y-m-d',
    timepicker:false,
    lang:'ch'
});
</script>