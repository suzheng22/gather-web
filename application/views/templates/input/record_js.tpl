<script type="text/javascript">

    //全局变量
    var inputId='{{$p_info.inputId}}';
    var count=0;
    var goodsName='{{$p_info.goodsName}}';
    //删除的厂商信息的Id
    var shopIds="";
    //城市三级联动
    if($("#location_p").attr("class")!="business"){
        {{foreach from=$p_info.shop key=key item=list}}
        PCRES_OP('#location_p_{{$key}}', '#location_c_{{$key}}', '#location_a_{{$key}}', '{{$list.province}}', '{{$list.city}}', '{{$list.region}}');
        {{/foreach}}
    }else{
        PCRES_OP('#location_p', '#location_c', '#location_a', '上海市', '上海市', '黄浦区');
    }
    //图片的显示//
    var is="{{$picList.0.key}}";
    var storage;
    if(is){
        var iv2 = $("#viewer").iviewer(
                {
                    src: "{{$picList[0]['domain']}}/{{$picList.0.key}}"
                });
    }
    function check(){
        var memo=$("#memo").val();
        var data={feedbackInfo:memo,inputId:inputId}
            //进行保存验证
                $.ajax({
                    url:'{{$root_path}}input/feed',
                    data:data,
                    type:'POST',
                    dataType:'json',
                    success:function(e){
                        alert(e.msg);
                        window.location.reload();
                    }
                })
    }
    $("#ps_newuser_pop").pop({
        oMain:"#record_confirms",         //触发弹出层的元素。为空时直接弹出
        sEvent:"click",             //触发事件
        oClose:"#ps_newuser_pop .close", //关闭按钮
        bIframe:false,              //是否有iframe
        iSrc:"",                    //iframe地址
        bShade:true,                //是否有遮罩
        bShadeClose:false,          //是否点遮罩关闭
        fnAdditional:function(e){

        }
    });

    //配料、原料的验证
    function check_proName(e){
        var proName=$(e).val();
        var a=  $(".base_info select").size();
        var n=0;
        for(var i=0;i<a;i++){
            var proName1= $(".base_info select:eq("+i+")").val();
            if(proName1==proName){
                n++
            }
        }
        if(n>1 && proName!="==请选择=="){
            alert("已存在不能选择,请重选");
            $(e).val("");
        }
        //去检验其他原料配料
    }
    //厂商的保存
    function save_business(f){
        //获取几个厂商
        var a=$(" .business_add").size();
        //添加删除的厂商的ID
        var t="[";
        for(var i =0;i<a;i++){
            //获取当前显示DIV的表单内属性的个数
            var len=$(".business_add:eq("+i+") .business").size();
            var array_business=['shopId','inputId','shopType','shopName','province','city','region','address','phone','sanitaryCertificateNO','productionCertificateNO'];
            var arr1="";
            for(var j=0;j<len;j++){
                if(j==len-1){
                    arr1+="\""+array_business[j]+"\":\""+$(".business_add:eq("+i+") .business:eq("+j+")").val()+"\"";
                }else{
                    arr1+="\""+array_business[j]+"\":\""+$(".business_add:eq("+i+") .business:eq("+j+")").val()+"\",";
                }
            }
            if(i==a-1){
                t+="\""+i+"\":["+arr1+"]";
            }else{
                t+="\""+i+"\":["+arr1+"],";
            }
        }
        t+="]";
        $.ajax({
            url:'{{$root_path}}input/saveType',
            data:{info:t,filed:6,inputId:inputId},
            dataType:'json',
            type:'POST',
            success:function(e){
               if(e==null){
                   alert("厂商保存失败");
                   return false;
               }
                //将对应的shopId添加到对应的
                var len_shopId=$(".shopId").size();
                for(var i=0; i<len_shopId;i++){
                    var value_shopId=$(".shopId:eq("+i+")");
                    if(value_shopId.val()=="" && e!="null"){
                        value_shopId.val(e.shopIds);
                    }
                }
                if(f==3){
                    if(e.msg!="保存成功"){
                        alert("厂商保存失败")
                    }
                }else{
                    alert(e.msg);
                }
            }
        });
    }
    //基本信息的添加
    function add_base(e,f){
        var base_info =$("#"+e);
        var base_temp ='<P class="clearfix">'+
                '<label>'+f+'</label>'+
                '<select class="fieldName" onclick="check_proName(this)"><option>==请选择==</option>' +
                {{foreach from =$p_info.groupGoodsNames item=name}}
                '<option value="{{$name}}">{{$name}}</option>'+
                {{/foreach}}
                '</select>'+
                '<textarea class="fieldName"></textarea>'+
                '<em class="base_info_del base_info_del'+e+'" onclick="del_base(this)">删除</em>'+
                '</p>'
        base_info.append(base_temp);
        //重置加按钮的位置到最后
        var root = $("#"+e);
        var savebox = root.find(".save_box");
        root.append(savebox);
    }
    //删除基本信息
    function del_base(e){
        $(e).parent().remove();
    }
    //分类保存
    /*f==1，单品保存；f==2,多产品保存；f==3时最后的提交*/
    function save_product(f){
        var a = $("#multiple_sku p").size();
        var v = "";
        if(!$("#multiple_sku").is(":hidden")) {
            for (var i = 0; i < a; i++) {
                if (i == a - 1) {
                    v += $("#multiple_sku input:eq(" + i + ")").val();
                } else {
                    v += $("#multiple_sku input:eq(" + i + ")").val() + ",";
                }
            }
        }
        $.ajax({
            url:'{{$root_path}}input/saveType',
            data:{info:v,filed:1,inputId:inputId},
            dataType:'json',
            type:'POST',
            success:function(e){
                if(f==3){
                    if(e.msg!="保存成功"){
                        alert("分类提交失败")
                    }
                }else{
                    alert(e.msg);
                    window.location.reload();
                }

            }
        });
    }
    //基本信息的保存
    /*f==3,最后的提交保存*/
    function save_baseInfo(f){
        var len=$(".base_info .p").size();
        var val="[";
        for(var i=0;i<len;i++){
            var name=$(".base_info .p:eq("+i+") .fieldName").val();
            var field=$(".base_info .p:eq("+i+") .hidden").val();
            //获取fieldname的个数
            if(i==len-1){
                val +="\""+field+"\":\""+name+"\"";
            }else{
                val +="\""+field+"\":\""+name+"\",";
            }
        }
        //获取下拉多选的个数
        var len_base=$(".base_info .base_info_two").size();
        for(var h=0;h<len_base;h++){
            //获取每个多选的ID
            var id=$(".base_info .base_info_two:eq("+h+")").attr("id");
            //获取每个ID下的P的个数
            var len_base2=$(".base_info #"+id+" p").size();
            //循环遍历每个ID的P
            val +=",\""+id+"\":[";
            for(var i=0;i<len_base2;i++){
                var val1="\"";
                //获取每个P下的fieldName的个数
                var len1=$(".base_info #"+id+" p:eq("+i+") .fieldName").size();
                for(var j=0;j<len1;j++){
                    //获取每个P下的fieldName下的值
                    var name1=$(".base_info #"+id+" p:eq("+i+") .fieldName:eq("+j+")").val();
                    if(j==len1-1){
                        val1 +=""+name1+"\"";
                    }else{
                        val1 +=""+name1+"：";
                    }
                }
                if(i==len_base2-1){
                    val+="\""+i+"\":"+val1+"";
                }else{
                    val+="\""+i+"\":"+val1+",";
                }
            }
            val+="]";
        }
        val+="]";

        goodsName=$("#goodsName").val();
        var proType= $("#proType").val();
      //  console.log(val);return false;
        $.ajax({
            url:'{{$root_path}}input/saveType',
            data:{info:val,filed:2,inputId:inputId,goodsName:goodsName,gtin:{{$p_info.gtin}},proType:proType},
            dataType:'json',
            type:'POST',
            success:function(e){
                if(f==3){
                    if(e.msg!="保存成功"){
                        alert("分类提交失败");
                    }
                }else{
                    alert(e.msg);
                }
            }
        });
    }
    //扩充信息的保存
    function save_extendInfo(f){
        var len=$(".extend_info p").size();
        var val="[";
        for(var i=0;i<len;i++) {
            var name = $(".extend_info p:eq(" + i + ") .fieldName").val();
            var field = $(".extend_info p:eq(" + i + ") .hidden").val();
            //获取fieldname的个数
            var len1 = $(".extend_info p:eq(" + i + ") .fieldName").size();
            if (len1 == 1) {
                if (i == len - 1) {
                    val += "\"" + field + "\":\"" + name + "\"";
                } else {
                    val += "\"" + field + "\":\"" + name + "\",";
                }
            } else if (len1 == 2) {
                var val1 = "";
                for (var j = 0; j < len1; j++) {
                    var name1 = $(".base_info p:eq(" + i + ") .fieldName:eq(" + j + ")").val();
                    if (j == len1 - 1) {
                        val1 += "\"" + j + "\":\"" + name1 + "\"";
                    } else {
                        val1 += "\"" + j + "\":\"" + name1 + "\",";
                    }
                }
                val += "\"" + field + "\":[" + val1 + "],";
            }
        }
        val+="]";
        $.ajax({
            url:'{{$root_path}}input/saveType',
            data:{info:val,filed:3,inputId:inputId},
            dataType:'json',
            type:'POST',
            success:function(e){
                if(f==3){
                    if(e.msg!="保存成功"){
                        alert("分类提交失败")
                        return false;
                    }
                }else{
                    alert(e.msg);
                }
            }
        });
    }
    //保存产商
    //营养成分的保存
    function save_nutrient(f){
        /*先获取几个营养成分*/
        var nutrition_l=$('.nutrition_child').size();
        var num1="[";
        for(var j=0;j<nutrition_l;j++) {
            var a = $(".nutrition_child:eq(" + j + ") p").size();
            //产品名称
            var nutrition_name=$(".nutrition_child:eq(" + j + ")  .nutrition_name");
            var b=nutrition_name.val();
            var b_re=nutrition_name.attr("class");
            //成分名称
            var c=$(".nutrition_child:eq(" + j + ")  .nutrition_names").val();
            if(b!=""){
                var p_val = "\"proName\":\""+b+"\",\"names\":\""+c+"\",";
            }


            //获取所有某一个营养分类的值p标签的值
            for (var i = 0; i < a; i++) {
                //获取每个P里面的值
                var p_l = $(".nutrition_child:eq(" + j + ") p:eq(" + i + ") .nutrition_value").size();
                var pId=$(".nutrition_child:eq(" + j + ") p:eq(" + i + ") .nutrition_value:eq(0)").val();
                if(p_l!=0){
                    var val="\""+ pId + "\":[";
                    var v="";
                }
                for (var h = 1; h < p_l; h++) {
                    var  nutrition_value=$(".nutrition_child:eq(" + j + ") p:eq(" + i + ") .nutrition_value:eq(" + h + ")").val();
                    if(h!=2) {
                        nutrition_value = $(".nutrition_child:eq(" + j + ") p:eq(" + i + ") .nutrition_value:eq(" + h + ")").val();
                        if (b_re == "nutrition_name") {
                            //判断是否选择成分名称
                            if (c != "") {
                                if (b == "") {
                                    alert("请选择产品名称");
                                    return false;
                                }
                                if (nutrition_value == "") {
                                    alert("营养成分参数不能为空");
                                    return false;
                                }

                            } else if (c == "") {
                                if (b != "") {
                                    alert("请选择含量");
                                    return false;
                                }
                                if (nutrition_value == "") {
                                    alert("营养成分参数不能为空");
                                    return false;
                                }
                            }
                        } else {
                            //判断是否选择成分名称
                            if (c != "") {
                                //判断参数是否为空
                                if (nutrition_value == "") {
                                    alert("营养成分参数不能为空");
                                    return false;
                                }
                            }else {
                                if (nutrition_value != "" ) {
                                    alert("请选择含量");
                                    return false;
                                }
                            }

                        }
                    }

                    if (h == p_l - 1) {
                        if(h==1){
                            v="shuzi";
                        }else if(h==2){
                            v="danwei";
                        }else if(h==3){
                            v="value";
                        }
                        val +="\""+ v + "\":\"" + nutrition_value + "\"";
                    } else {
                        if(h==1){
                            v="shuzi";
                        }else if(h==2){
                            v="danwei";
                        }else if(h==3){
                            v="value";
                        }
                        val += "\"" + v + "\":\"" + nutrition_value + "\",";
                    }
                }
                val+="]";

                if (i == a - 1) {
                    p_val +="" + val + "";
                } else {
                    p_val += "" + val + "" + ",";
                }
            }
            //获取所有class="p3"的值
            if(j==nutrition_l-1){
                num1 += "\"" + j + "\":[" + p_val + "]]";
            }else{
                num1 += "\"" + j + "\":[" + p_val + "],";
            }
        }
      //  console.log(num1);
      //  return false;
        $.ajax({
            url:'{{$root_path}}input/saveType',
            data:{info:num1,filed:4,inputId:inputId},
            dataType:'json',
            type:'POST',
            success:function(e){
                if(f==1){
                    alert("营养成分删除成功");
                }else if(f==3){
                    if(e.msg!="保存成功"){
                        alert("分类提交失败")
                    }
                }
                else{
                    alert(e.msg);
                }
            }
        });
    }
    //选择营养成分参数时
    function nutritionUnitEn(e){
        //获取当前几个营养成分；
      var size=  $(".nutrition_child").size();
        for(var j=0;j<size;j++){
        var $nutritionUnitEn=$(".nutrition_child:eq("+j+") .nutritionUnitEn");
        //当前选中
        var  index=$nutritionUnitEn.index(e);
        //首先需要验证当前选中的Id
        var id=$(e).val()
        //判断当前选中的ID，是否已存在
        var sizes=$nutritionUnitEn.size();
        for(var i=0;i<sizes;i++ ){
            if(index!=i && index!="-1"){
                //获取其它Id值
                var nutritionId=$nutritionUnitEn.eq(i).val();
                if(id==nutritionId){
                    alert("该参数已存在");
                    $(e).val("==请选择==")
                }
            }
        }
        var c= $(".nutrition_child:eq("+j+") .nutritionUnitEn:eq("+index+") option:" +
                "").attr("class");
            if(c!="undefined"){
                $(".nutrition_child:eq("+j+") .nutritionUnitEns").eq(index).html(c);
                $(".nutrition_child:eq("+j+") .nutrition_info").eq(index).val(c);
            }
        }
    }
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
        //分类-组合包装
        $("#sku_cf_01").click(function(){
            $("#multiple_sku").hide();
            $(".sku_cf_0001").show();
            $(".sku_cf_0002").hide();
            $(".sku_cf_002").hide();
            $(".sku_cf_001").hide();
            $(".multiple_sku_add").hide();
        });
        $("#sku_cf_02").click(function(){
            $("#multiple_sku").show();
            $(".sku_cf_0002").show();
            $(".sku_cf_0001").hide();
            $(".sku_cf_002").hide();
            $(".sku_cf_001").hide();
            $(".multiple_sku_add").show();
            //增加分类下的产品名称
        });

        $("#cf_add").unbind().click(function(){
            var size=$(".product").size();
            var multiple_sku_add = $(".multiple_sku_add");
            // multiple_sku_add.show();
            var cf_temp ='<p class="clearfix">'+
                    '<label>产品名称'+size+'：</label>'+
                    '<input type="text" class="product"/>'+
                    '<span class="cf_del">删除</span>'+
                    '</p>';
            multiple_sku_add.append(cf_temp);

        });
        //组合包装的删除
        $("#multiple_sku").on('click','span.cf_del',function(){
            $(this).parent().remove();
        });
        //营养成分表
        var tabCounter_zz = 0;
        tabCounter_zz=$("#bus_info_01 a").size();
        $(".add_nutrient").click(function(){
            var n_bus=$("#bus_info_01");
            var n_temp_bus='<a href="javascript:;" class="'+tabCounter_zz+'">营养成分'+tabCounter_zz+'<i class="iconfont bus_del_01">&#xf01b0;</i></a>'
            n_bus.append(n_temp_bus);
            //营养成分追加完成后选项
            var u_list = $(".nutrition");
            var U_temp =
                    '<div class="nutrition_child">'+
                    '  <h3 class="clearfix"><span>产品名称:</span>'+
                    '<select class="nutrition_name" nutrition_value>'+
                            '<option>==请选择==</option>'+
                    {{foreach from =$p_info.groupGoodsNames item=name}}
                    '<option value="{{$name}}">{{$name}}</option>'+
                    {{/foreach}}
                    '</select>'+
                    '</h3>'+
                    '<h4 class="clearfix">'+
                    '<span>成分名称</span>'+
                    '<select>'+
                    '<option value="">请选择含量</option>'+
                    '<option value="">每100ml</option>'+
                    '<option value="">每100g</option>'+
                    '<option value="">每一枚</option>'+
                    '</select>'+
                    '<span>NVR%</span>'+
                    '</h4>'+
                    {{foreach from=$p_info.nutritionFiled.data item=list}}
                    {{if $list['isDefault']==1}}
                    '<P class="clearfix p">'+
                    '<input type="hidden" class="nutrition_value" value="{{$list.nutritionId}}">'+
                    '<span>{{$list.nutritionName}}:</span>'+
                    '<input type="text"   class="nutrition_value"/><label>{{$list.nutritionUnitEn}}</label>'+
                    ' <input type="hidden"   class="nutrition_value" value="{{$list.nutritionUnitEn}}"/>'+
                    '<input type="text"   class="nutrition_value"/><label>%</label> </P>'+
                    {{/if}}
                    {{/foreach}}
                    '</div>';
            u_list.append(U_temp);
            //显示最后一个营养成分
            var nutrient_len=$(".nutrition_child").size();
            for(var i=0;i<nutrient_len;i++){
                if(i==nutrient_len-1){
                    //当前营养成分的显示
                    $(".nutrition_child:eq("+i+")").show();
                    $(".nutrition_choice h3 a:eq("+i+")").addClass("selected").siblings().removeClass("selected");
                }else{
                    $(".nutrition_child:eq("+i+")").hide();
                }
            }
            //添加之后必须绑定此事件才能触发切换营养成分事件
            $("#bus_info_01  a").click(function(){
                var index = 0;
                $(this).addClass("selected").siblings().removeClass("selected");
                var index=$("#bus_info_01 a").index(this);
                $(".nutrition .nutrition_child").eq(index).show().stop(true, true).siblings().hide();
            });
            //营养成分的删除
            $(".bus_info_01 .bus_del_01").unbind().on('click',function(){
                var index=0;
                index=$(".bus_info_01 .bus_del_01").index(this);
                //移除营养成分
                $(".nutrition .nutrition_child").eq(index+1).remove();
                //显示前一个营养成分
                $(".nutrition .nutrition_child").eq(index).show();
                $(this).parent().remove();
                $(".bus_info_01 a").eq(index).addClass("selected").siblings().removeClass("selected");
                save_nutrient(1)
            });
        });
        //营养成分的删除
        $(".bus_info_01 .bus_del_01").unbind().on('click',function(){
            var index=0;
            index=$(".bus_info_01 .bus_del_01").index(this);
            //移除营养成分
            $(".nutrition .nutrition_child").eq(index+1).remove();
            //显示前一个营养成分
            $(".nutrition .nutrition_child").eq(index).show();
            $(this).parent().remove();
            $(".bus_info_01 a").eq(index).addClass("selected").siblings().removeClass("selected");
            //掉营养成分保存接口
            save_nutrient(1)
        });
        $(".nutrition_inform .nutrition_inform_del").each(function(){
            $(this).click(function(){
                $(this).parent().remove();
            });
        })
        //营养成分增加参数
        $(".add_param").click(function(){
            var ul = $(".nutrition_child");
            //判断当前显示的营养成分
            var size =ul.size();
            for(var i=0;i<size;i++){
                var j=$(".nutrition_child:eq("+i+")");
                if(!j.is(":hidden")){
                    ul=j;
                }
            }
            var temp =  '<p class="clearfix add_field p1">'+
                    '<select style="margin-left:2px; margin-right:10px;" class="nutrition_value nutritionUnitEn" onchange="nutritionUnitEn(this)">' +
                    '<option>==请选择==</option>' +
                    {{foreach from=$p_info.nutritionFiled.data item=list}}
                    {{if $list.isDefault!=1}}
                    '<option value="{{$list.nutritionId}}" class="{{$list.nutritionUnitEn}}">{{$list.nutritionName}}--{{$list.nutritionUnitEn}}</option>'+
                    {{/if}}
                    {{/foreach}}
                    '</select>'+
                    '<input type="text" class="nutrition_value"/>'+
                    '<label class="nutritionUnitEns"></label>'+
                    '<input type="hidden" class="nutrition_info nutrition_value"/>'+
                    '<input type="text" class="nutrition_value"/>'+
                    '<label>%</label>'+
                    '<em class="nutrition_inform_del" style="display:block;cursor:pointer">删除</em>'+
                    '</p>'
            ul.append(temp);
            $(".nutrition_inform .nutrition_inform_del").each(function(){
                $(this).click(function(){
                    $(this).parent().remove();
                });
            })
        });
        //增加营养成分单位
        //增加厂商
        var tabCounter = 0;
        $("#add_tab").click(function(){
            var bus=$("#bus_info h3");
            tabCounter=$("#bus_info h3 a").size();
            var temp_bus='<a href="javascript:;">厂商'+tabCounter+'<i class="iconfont bus_del">&#xf01b0;</i></a>'
            bus.append(temp_bus);
            //增加厂商
            var business=$(".business_choice");
            var tmp='<div class="business_add">'+
                    '<input type="hidden" class="business shopId" value="{{$list.shopId}}">'+
                    '<input type="hidden" class="business inputIds" value="{{$p_info.inputId}}">'+
                    '<p class="clearfix">'+
                    '<label>厂商类别：</label>'+
                    '<select id="inputId" class="business">'+
                    '<option value="">==请选择==</option>'+
                    '<option value="委托商">1：委托商</option>'+
                    '<option value="生产商">2：生产商</option>'+
                    '<option value="制造商">3：制造商</option>'+
                    '<option value="经销商">4：经销商</option>'+
                    '<option value="代理商">5：代理商</option>'+
                    '<option value="分装商">6：分装商</option>'+
                    '<option value="总代理商">7：总代理商</option>'+
                    '<option value="总经销商">8：总经销商</option>'+
                    '</select>'+
                    '</p>'+
                    '<p class="clearfix">'+
                    '<label>厂商名称：</label>'+
                    '<input type="text" id="shopName" class="business"/>'+
                    '</p>'+
                    '<p class="clearfix">'+
                    '<label>厂商地址：</label>'+
                    '<select name="location_p" id="location_p_'+tabCounter+'" class="business" >'+
                    '</select>'+
                    '<select name="location_c_"'+tabCounter+' id="location_c_'+tabCounter+'" class="business">'+
                    '</select>'+
                    '<select name="location_a_'+tabCounter+'" id="location_a_'+tabCounter+'" class="business">'+
                    '</select>'+
                    '</p>'+
                    '<p class="clearfix">'+
                    '<label></label>'+
                    '<input type="text" id="address" class="business"/>'+
                    '</p>'+
                    '<p class="clearfix">'+
                    '<label>厂商电话：</label>'+
                    '<input type="text" id="phone" class="business"/>'+
                    '</p>'+
                    '<p class="clearfix">'+
                    '<label>卫生许可证：</label>'+
                    '<input type="text" id="sanitaryCertificateNO" class="business"/>'+
                    '</p>'+
                    '<p class="clearfix">'+
                    '<label>生产许可证：</label>'+
                    '<input type="text" id="productionCertificateNO" class="business"/>'+
                    '</p>'+
                    '</div>';
            business.append(tmp);
            //加载城市三级联动
            PCRES_OP('#location_p_'+tabCounter, '#location_c_'+tabCounter, '#location_a_'+tabCounter, '其它', '', '');
            //显示当前显示的厂商
            var business_len=$(".business_add").size();
            for(var i=0;i<business_len;i++){
                if(i==business_len-1){
                    //当前营养成分的显示
                    $(".business_add:eq("+i+")").show();
                    $("#bus_info h3 a:eq("+i+")").addClass("selected").siblings().removeClass("selected");
                }else{
                    $(".business_add:eq("+i+")").hide();
                }
            }
            //厂商选项卡
            $("#bus_info a").click(function(){
                var index = 0;
                $(this).addClass("selected").siblings().removeClass("selected");
                index=$("#bus_info a").index(this);
                //   alert(index);
                $(".business_choice .business_add").eq(index).show().stop(true, true).siblings().hide();
            });
            //删除厂商
            $("#bus_info  .bus_del").unbind().on('click',function() {
                var index = 0;
                index = $("#bus_info .bus_del").index(this);
                var shopId = $(".business_choice .business_add:eq(" + (index + 1) + ") .shopId").val();
                $(".business_choice .business_add").eq(index + 1).remove();
                $(".business_choice .business_add").eq(index).show();
                $("#bus_info a").eq(index).addClass("selected").siblings().removeClass("selected");
                $(this).parent().remove();
                //将删除的厂商Id存进全局变量shopIds
                $.ajax({
                    url:'{{$root_path}}input/delShop',
                    data:{shopId:shopId},
                    dataType:'text',
                    type:'POST',
                    success:function(e){
                        if(e=="null"){
                            alert("删除成功")
                        }
                    }
                })
            })
        });
        //厂商删除选项卡
        $("#bus_info  .bus_del").unbind().on('click',function(){
            var index=0;
            index=$("#bus_info .bus_del").index(this);
            var shopId=	$(".business_choice .business_add:eq("+(index+1)+") .shopId").val();
            //将删除的厂商Id存进全局变量shopIds
            //移除当前厂商
            $(".business_choice .business_add").eq(index+1).remove();
            //显示前一个厂商
            $(".business_choice .business_add").eq(index).show();
            $(this).parent().remove();
            $("#bus_info a").eq(index).addClass("selected").siblings().removeClass("selected");
            $.ajax({
                url:'{{$root_path}}input/delShop',
                data:{shopId:shopId},
                dataType:'text',
                type:'POST',
                success:function(e){
                    if(e=="null"){
                        alert("删除成功")
                    }
                }
            })
        });
        //最后的提交
        $("#record_confirm").on("click",function(){
            var input_size=$('input[type="text"]').size();
            var select_size=$("select").size();
            var input_len=0;
            var select_len=0;
            for(var i=0;i<input_size;i++){
                input_len+=$('input[type="text"]:eq('+i+')').val().length;
            }
            for(var i=0;i<select_size;i++){
                select_len+=$("input:eq("+i+")").val().length;
            }
            var len=input_len;
            //console.log(len);
            //  return false;
            //进行保存验证
            // 所有的项目重新进行保存
            //1保存分类
            save_product(3);
            //保存基本信息
            save_baseInfo(3);
            //保存厂商
            save_business(3);
            //保存扩充信息
            save_extendInfo(3);
            //保存营养成分
           var a= save_nutrient(3);
            if(a==false){
                alert("保存失败");
                return false;
            }
            $.ajax({
                url:'{{$root_path}}input/saveType',
                data:{inputCount:len,inputId:inputId,filed:5},
                type:'POST',
                dataType:'json',
                success:function(e){
                    alert(e.msg);
                    window.location.reload();
                }
            })
        })
        //点击选项卡
        //选项卡
        $(".choice_count h3 a").click(function(){
           
            var index = 0;
            $(this).addClass("selected").siblings().removeClass("selected");
            var index=$(".choice_count h3 a").index(this);
            $(".right_mid ul,.right_mid .cf").eq(index).show().stop(true, true).siblings().hide();
           
           //获取索引高度，超出500PX，出现滚动条
            var hh=$(".right_mid .cf").eq(index).height();
            if(hh>420)
            {
            $(".right_mid .cf").css({"overflow-y":"scroll","overflow-x":"hidden","height":"420px"});
            }
        });
        //厂商选项卡
        $("#bus_info a").click(function(){
            //alert("aa");
            var index = 0;
            $(this).addClass("selected").siblings().removeClass("selected");
            var index=$("#bus_info a").index(this);
            $(".business_choice .business_add").eq(index).show().stop(true, true).siblings().hide();
        });
        //营养成分选项卡
        $("#bus_info_01 a").click(function(){
            var index = 0;
            $(this).addClass("selected").siblings().removeClass("selected");
            var index=$("#bus_info_01 a").index(this);
            $(".nutrition .nutrition_child").eq(index).show().stop(true, true).siblings().hide();
        });
    }); //end
</script>