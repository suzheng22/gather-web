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
            	<h3>拍摄新增管理<a href="javascript:;" id="new_user" class="new_user"><i class="iconfont">&#xf018b;</i>新增</a></h3>
                <div class="rose_top main_rignt_top clearfix">
                    <form action="{{$root_path}}shoot/shootAddManager" id="myform">
                    <div class="cc_top_one last_show"><label>项目名称:</label>
                        <div class="choice_count choice_box vocation">
                            <dl class="select">
                                <select name="pId" class="select3">
                                    <option value="">全部</option>
                                    {{foreach from=$project_list item=list}}
                                    <option value="{{$list.pId}}" {{if $pId==$list.pId}}selected="selected"{{/if}}>{{$list.pName}}</option>
                                    {{/foreach}}
                                </select>
                            </dl>
                        </div>
                    </div>
                     <div class="cc_top_one"><label>商品条形码:</label><input type="text" name="gtin" value="{{$gtin}}" class="gtin"/></div>
                    <div class="cc_top_one"><label>商品名称:</label><input type="text" name="proName" value="{{$proName}}" class="proName"/></div>
                    <div class="cc_top_one last_show"><label>商品分类:</label>
                        <div class="choice_count choice_box vocation">
                            <dl class="select">
                                <select name="type" class="select3">
                                    <option value="">全部</option>
                                 {{foreach from=$type_list item=list}}
                                    <option value="{{$list.id}}" {{if $type==$list.id}}selected="selected"{{/if}}>{{$list.name}}</option>
                                 {{/foreach}}
                                </select>
                            </dl>
                        </div>
                    </div>
                    <div class="cc_top_one" style="width:50%">
                          <label>新增时间:</label>
                         <input type="text" id="datetimepicker_start" name="sTime" value="{{$sTime}}"/>
                         <label style="width:20px;">-</label>
                         <input type="text" id="datetimepicker_end" name="eTime" value="{{$eTime}}"/>
                        </div>
                    <div class="cc_top_one last_show"><label>状态:</label>
                            <div class="choice_count choice_box vocation">
                                <dl class="select">
                                    <select name="status" class="select3">
                                   		<option value="">全部</option>
                                        <option value="1" {{if $status==1}}selected="selected"{{/if}}>已处理</option>
                                        <option value="2" {{if $status==2}}selected="selected"{{/if}}>未处理</option>
                                   </select>
                                </dl>
                            </div>
                        </div>
                    <div class="clearfix"></div> 
                    <div class="cc_top_two" style="margin-left:12px; display:inline;">
                    	<a href="{{$root_path}}shoot/shootAddManager?is_ext=1" class="query"><i class="icon iconfont">&#xf0220;</i>导出</a>
                        <span class="query"><i class="icon iconfont">&#xf00a8;</i><input type="submit" value="查询"></span>
                        <a href="javascript:;" onclick="btn_empty()"><i class="iconfont">&#xf014a;</i>清空</a>
                    </div>
                  </form>
                   	<div class="clearfix"></div>
                	<div class="tab_box">
                    <table>
                        <tr>
                            <th>序号</th>
                            <th>商品条形码</th>
                            <th>商品名称</th>
                            <th>商品分类</th>
                            <th>项目名称</th>
                            <th>包装</th>
                            <th>新增描述</th>
                            <th>新增时间</th>
                            <th>新增人</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>

                        {{foreach from=$slist item=list}}
                        <tr class="t_{{$list.gtin}}">
                            <td>{{$list.lId}}</td>
                            <td>{{$list.gtin}}</td>
                            <td>{{$list.gName}}</td>
                            <td>{{$list.catName}}</td>
                            <!-- 新增字段 -->
                            <td>{{$list.pName}}</td>
                            <td>包装{{$list.packet}}</td>
                            <td>{{$list.memo}}</td>
                            <td>{{$list.creatTime|date_format:"Y-m-d H:i:s"}}</td>
                            <td>{{$list.measurement}}</td>
                            <td>{{if $list.status==1}}未审核{{else if $list.status==2}}通过{{else if $list.status==3}}驳回{{/if}}</td>
                            <td><a href="javascript:;" class="shoot_add_manager_btn" id="{{$list.id}}">编辑</a></td>
                            <!-- 新增字段 -->
                        </tr>
                        {{/foreach}}
                      
                    </table>
                </div>
                	
                	<!--分页-->
                    <div class="page_nav" id="page_nav">
                      {{$pages}}
                    </div>
                	
                </div>
               
            </div>
        </div>
     </div><!--main end-->  
</div>
<!-- 拍摄新增维护 开始-->
<div class="newuser_pop" id="newuser_pop">
	<div class="tit clearfix"><h4>拍摄新增维护</h4><a class="no_text close" href="javascript:;" title="关闭">关闭</a></div>
	<div class="content">
		<div class="login_main">
			<div class="login_form">
				<div class="clearfix one"><label for="user_name">商品条形码:</label><input type="text" id="gtin_1" class="zhmm"  onkeyup="get_gtin_detail()" onchange="get_gtin_detail()"><span style="color:red" class="show_msg"></span></div>
                <div class="clearfix one"><label for="user_name">商品名称:</label><input type="text" id="proName_1" class="zhmm" readonly="readonly"></div>
                <div class="clearfix one"><label for="user_name">项目:</label>
                	<div class="choice_count choice_box">
                        <dl class="select">
                        <select name="project" id="project_1" class="" style="opacity: 1">
                        </select></dl></div>
                </div>
                <div class="clearfix one"><label for="user_name">包装:</label>
                	<div class="choice_count choice_box">
                        <dl class="select">
                    <select id="pack_1" class="" style="opacity: 1">

                    </select>
                    </dl></div>
                </div>
                <div class="clearfix one"><label for="user_name">描述:</label><textarea id="describe_1"></textarea></div>
                <a href="javascript:;" id="confirm_btn" class="confirm_btn" onclick="add_shoot(1)">确认</a>
        </div>
	   </div>
    </div>
</div>
<!-- 详细 开始-->
<div class="newuser_pop shoot_add_manager">
    <div class="tit clearfix"><h4>拍摄新增编辑</h4><a class="no_text close" href="javascript:;" title="关闭">关闭</a></div>
    <div class="content">
        <div class="login_main">
            <div class="login_form">
                <div class="clearfix one"><label for="user_name">商品条形码:</label><input type="text" id="gtin_2" class="zhmm" readonly="readonly"></div>
                <div class="clearfix one"><label for="user_name">商品名称:</label><input type="text" id="proName_2" class="zhmm" readonly="readonly"></div>
                <div class="clearfix one"><label for="user_name">项目:</label>
                <div class="choice_count choice_box ">
                        <dl class="select">
                    <select id="project_22" class="" name="project" style="opacity: 1">
                    </select>
                    </dl></div>
                 </div>
                <div class="clearfix one"><label for="user_name">包装:</label>
                	<div class="choice_count choice_box ">
                        <dl class="select">
                        <select id="pack_22" class="" style="opacity: 1">
                        </select>
                        </dl></div>
                    </div>
                <div class="clearfix one"><label for="user_name">描述:</label><textarea id="describe_2"></textarea></div>
                <a href="javascript:;" id="confirm_btn" class="confirm_btn" onclick="add_shoot(2)">确认</a>
            </div>
        </div>
    </div>
</div>
{{include file='public/js.tpl'}}
<!--时间控件-->
<link rel="stylesheet" type="text/css" href="{{$resource_url}}js/time/jquery.datetimepicker.css"/>
<script type="text/javascript" src="{{$resource_url}}js/time/jquery.datetimepicker.js"></script>
<script type="text/javascript">
$(function(){
    $.fn.pasteEvents = function( delay ) {
        if (delay == undefined) delay = 20;
        return $(this).each(function() {
            var $el = $(this);
            $el.on("paste", function() {
                $el.trigger("prepaste");
                setTimeout(function() { $el.trigger("postpaste"); }, delay);
            });
        });
    };
    $("#gtin_1").on("postpaste", get_gtin_detail).pasteEvents();
	//select 表单美化
	$(".select3").uedSelect({
		width : 100
	});
	 $(".select1").uedSelect({
		width :250			  
	});
	
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
            $("#gtin").val('');
            $("#proName").val('');
            $("#pack").html('');
            $("#project").val('');
            $("#describe").val('');
        }
    });
    $(".shoot_add_manager").pop({
                oMain:".shoot_add_manager_btn",         //触发弹出层的元素。为空时直接弹出
                sEvent:"click",             //触发事件
                oClose:".shoot_add_manager .close", //关闭按钮
                bIframe:false,              //是否有iframe
                iSrc:"",                    //iframe地址
                bShade:true,                //是否有遮罩
                bShadeClose:false,          //是否点遮罩关闭
                fnAdditional:function(e){
                    var id=$(e).get(0).id;
                    alert(id);
                    $.ajax({
                        url:'{{$root_path}}shoot/getNewPicInfo',
                        data:{'id':id},
                        dataType:'json',
                        type:'POST',
                        success:function(data){
                            alert(data);
                            localStorage.setItem("id",id);
                            $("#gtin_2").val(data['gtin']);
                            $("#proName_2").val(data['gName']);
                            var packArr=data.packet;
                            var len=packArr.length;
                            var option="";
                            for (var i=0;i<len;i++){
                                if(data.packet1==packArr[i]){
                                    option+="<option value=\'"+packArr[i]+"\' selected='selected'>包装"+packArr[i]+"</option>";
                                }else{
                                    option+="<option value=\'"+packArr[i]+"\'>包装"+packArr[i]+"</option>";
                                }
                            }
                            $("#pack_22").html(option);
                           // alert(option);
                            var option1="";
                            var project=data.project;
                            for(var i in project){
                                var pId=project[i].pId;
                                var pName=project[i].pName;
                                if(pId==data.pId1){
                                    option1+="<option value=\'"+pId+"\' selected='selected'>"+pName+"</option>";
                                }
                                else{
                                    option1+="<option value=\'"+pId+"\'>"+pName+"</option>";
                                }
                            }
                            $("#describe_2").val(data.memo);
                            $("#project_22").html(option1);

                        }
                    })
                }
    });
});
$('#datetimepicker_start').datetimepicker({
	onGenerate:function( ct ){
		$(this).find('.xdsoft_date')
			.toggleClass('xdsoft_disabled');
	},
		format:'d/m/Y',
	formatDate:'Y/m/d',
	minDate:'-1970/01/2',
	maxDate:'+1970/01/2',
	timepicker:false
});
$('#datetimepicker_end').datetimepicker({
	onGenerate:function( ct ){
		$(this).find('.xdsoft_date')
			.toggleClass('xdsoft_disabled');
	},
		format:'d/m/Y',
	formatDate:'Y/m/d',
	minDate:'-1970/01/2',
	maxDate:'+1970/01/2',
	timepicker:false
});
function get_gtin_detail(){
    $(".show_msg").html('');
    var $gtin=$("#gtin_1");
    var gtin=$gtin.val();
   // alert($("#gtin_1").val());
    $.ajax({
        url:'{{$root_path}}shoot/getGoodsByGtin',
        data:{'gtin':gtin},
        type:'POST',
        dataType:'json',
        success:function(data){
           // alert(data.gtin);
            if(data.gName==""){
                $(".show_msg").html('该商品编码不存在');
                $("#project_1").html('');
                $("#pack_1").html( '');
                return false;
            }else{
                //存进html5
                $("#proName_1").val(data['gName']);
                var packArr=data.packet;
                var len=packArr.length;
                var option="";
                for (var i=0;i<len;i++){
                    if(i==0){
                        option+="<option value=\'"+packArr[i]+"\' selected='selected'>包装"+packArr[i]+"</option>";
                    }else{
                        option+="<option value=\'"+packArr[i]+"\'>包装"+packArr[i]+"</option>";
                    }
                }
                var option1="";
                var project=data.project;
                for(var i in project){
                    var pId=project[i].pId;
                    var pName=project[i].pName;
                    if(i==0){
                        option1+="<option value=\'"+pId+"\' selected='selected'>"+pName+"</option>";
                    }
                  else{
                        option1+="<option value=\'"+pId+"\'>"+pName+"</option>";
                    }
                }
                $("#project_1").html(option1);
                $("#pack_1").html( option);
            }
        }
    })
}
function add_shoot(status){
    var gtin=$("#gtin_"+status).val();
    var proName=$("#proName_"+status).val();
    var project=$("#project_"+status).val();
    var pack=$("#pack_"+status).val();
    var describe=$("#describe_"+status).val();
    var id=localStorage.getItem('id');
    if(id=="undefined"){
        id="";
    }
    if($.trim(gtin)==""){
       // alert("请输入商品编码");
        //return false;
    }if($.trim(project)==""){
       // alert("请选择项目");
      //  return false;
    }if($.trim(pack)==""){
      //  alert("请选择包装");
      //  return false;
    }if($.trim(describe)==""){
     //   alert("请填写描述");
      //  return false;
    }
    var data={gtin:gtin,pId:project,packet:pack,memo:describe,id:id};
 //   alert(data.id+','+data.gtin+','+data.pId+','+data.packet+','+data.memo);
    $.ajax({
        url:'{{$root_path}}shoot/addShoot',
        data:data,
        type:'POST',
        dataType:'json',
        success:function(data){
         //   alert(data)
            //删除html5存储
            localStorage.removeItem('id');
          if(data["msgCode]"]!='2000'){
              alert(data["msgText]"]);
              window.location.reload();
          }else{
              alert(data["msgText]"]);
          }
        },
    });
}

function get_info(group){
    $.post("{{$root_path}}user/groupInfo",{"groupId":groupId},
            function(data){
                var dataObj=eval("("+data+")");
                if(dataObj.msgCode>0){
                    alert(dataObj.msg);
                    window.location.reload();
                }
                $("#up_groupName").val(dataObj.groupName);
                $("#up_roleId").val(dataObj.roleId);
                $("#up_desc").html(dataObj.desc);
                $("#ed_groupId").val(dataObj.groupId);
            },
            "text");
}
//清空
function btn_empty(){
    $(".proName,.gtin").val("");
    $("#datetimepicker_start").val("");
    $("#datetimepicker_end").val("");
    $(".cc_top_one ,.select1").val("");
    $(".uew-select-text").html('全部');
}
</script>
</body>
</html>
