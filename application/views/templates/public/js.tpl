<script type="text/javascript"  src="{{$resource_url}}js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="{{$resource_url}}js/popup/popup.js"></script>
<script type="text/javascript" src="{{$resource_url}}js/defined.js"></script>
<script type="text/javascript" src="{{$resource_url}}js/full_screen.js"></script>
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
});	
</script>	