<script type="text/javascript"  src="{{$resource_url}}js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="{{$resource_url}}js/popup/popup.js"></script>
<script type="text/javascript" src="{{$resource_url}}js/defined.js"></script>
<script type="text/javascript" src="{{$resource_url}}js/full_screen.js"></script>
<script type="text/javascript" src="{{$resource_url}}style/select2/select-ui.min.js"></script>
<script type="text/javascript">
$(function(){
	//�û��б�
     $("#newuser_pop").pop({
        oMain:"#new_user",         //�����������Ԫ�ء�Ϊ��ʱֱ�ӵ���
        sEvent:"click",             //�����¼�
        oClose:"#newuser_pop .close", //�رհ�ť
        bIframe:false,              //�Ƿ���iframe
        iSrc:"",                    //iframe��ַ
        bShade:true,                //�Ƿ�������
        bShadeClose:false,          //�Ƿ�����ֹر�
        fnAdditional:function(){
           
        }
    });
	$("#newuser_pop_revamp").pop({
			oMain:".revamp",         //�����������Ԫ�ء�Ϊ��ʱֱ�ӵ���
			sEvent:"click",             //�����¼�
			oClose:"#newuser_pop_revamp .close", //�رհ�ť
			bIframe:false,              //�Ƿ���iframe
			iSrc:"",                    //iframe��ַ
			bShade:true,                //�Ƿ�������
			bShadeClose:false,          //�Ƿ�����ֹر�
			fnAdditional:function(){
				 
				 
			}
		});
});	
</script>	

<link rel="stylesheet" type="text/css" href="{{$resource_url}}js/time/jquery.datetimepicker.css"/>
<script type="text/javascript" src="{{$resource_url}}js/time/jquery.datetimepicker.js"></script>
<script type="text/javascript">
$('#datetimepicker_start,#datetimepicker_end').datetimepicker({
    onGenerate:function( ct ){
        $(this).find('.xdsoft_date')
                .toggleClass('xdsoft_disabled');
    },
    format:'Y-m-d',
    formatDate:'Y-m-d',
    minDate:'-1970-01-2',
    maxDate:'+1970-01-2',
    timepicker:false
});
</script>