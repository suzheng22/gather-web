<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>数据采集系统</title>
    {{include file='public/css.tpl'}}
</head>
<body>
{{include file='public/top.tpl'}}
    <div class="main" style="text-align: center">
    {{include file='public/left.tpl'}}

        <div style="display: block;font-size: 24px;text-align: center;margin-top:10%">
            欢迎你
        </div>



    </div>
{{include file='public/js.tpl'}}
</body>

<script>
    $(function(){
        $('.user_manager dd a').filter(function (){
                    return this.href == url || url.href.indexOf(this.href) == 0;
                })
                .parents('dd').addClass('active').siblings().removeClass('active');
        $(".leftsidebar_box .user_manager dd").show();
    })
</script>
</html>

