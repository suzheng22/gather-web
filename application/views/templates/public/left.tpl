{{if $userInfo.userId=="58"}}
<div class="aside_nav">
    <div class="aside_menu">
        <div class="slimScrollDiv leftsidebar_box">
            <dl class="menu_shoot_manager system_log">
                <dt><i class="icon iconfont">&#xf0178;</i>拍摄管理<img src="{{$resource_url}}images/left/select_xl01.png"></dt>
                <dd><a href="{{$root_path}}shoot/shootAddManager" title="拍摄审核">拍摄新增管理</a></dd>
                <dd><a href="{{$root_path}}shoot/shootBackDetail" title="拍摄驳回管理">拍摄驳回管理</a></dd>

            </dl>

            <dl class="check_manager system_log">
                <dt><i class="icon iconfont">&#xf01d8;</i>审核管理<img src="{{$resource_url}}images/left/select_xl01.png"></dt>
                <dd><a href="{{$root_path}}marlboro/shoot" title="拍摄审核">拍摄审核</a></dd>
                <dd><a href="{{$root_path}}retouch/psCheckList" title="修图审核">修图审核</a></dd>
            </dl>

        </div>
        <div class="projectAction"></div>
    </div>
</div>

{{else}}
<div class="aside_nav">
	<div class="aside_menu">
		<div class="slimScrollDiv leftsidebar_box">
        <dl class="user_manager system_log">
            <dt><i class="icon iconfont">&#xf0226;</i>系统管理<img src="{{$resource_url}}images/left/select_xl01.png"></dt>
            <!-- <dd><a href="first_index.html" title="首页管理">首页管理</a></dd> -->
            <dd><a href="{{$root_path}}user/index" title="用户管理">用户管理</a></dd>
            <dd><a href="{{$root_path}}role/index" title="角色管理">角色管理</a></dd>
            <dd><a href="{{$root_path}}user/userGroupList" title="用户组管理">用户组管理</a></dd>
            <dd><a href="{{$root_path}}project/projectManager" title="项目管理">项目管理</a></dd>
            <dd><a href="{{$root_path}}project/projectUserManager" title="项目成员管理">项目成员管理</a></dd>
        </dl>
         <dl class="business_base_info system_log">
             <dt><i class="icon iconfont">&#xf00a9;</i>商品信息<img src="{{$resource_url}}images/left/select_xl01.png"></dt>
             <dd><a href="up_good_list.html" title="导入商品清单">导入商品清单</a></dd>
             <!-- <dd><a href="{{$root_path}}" title="商品管理">商品管理</a></dd> -->
             <dd><a href="{{$root_path}}goods/goodsClassify" title="商品分类">商品分类</a></dd>
        </dl>
        <dl class="menu_shoot_manager system_log">
             <dt><i class="icon iconfont">&#xf0178;</i>拍摄管理<img src="{{$resource_url}}images/left/select_xl01.png"></dt>
             <dd><a href="{{$root_path}}shoot/noShoot" title="无法拍摄">无法拍摄</a></dd>
             <dd><a href="{{$root_path}}shoot/noMeasure" title="无法测量">无法测量</a></dd>
             <dd><a href="{{$root_path}}shoot/shootAddManager" title="拍摄审核">拍摄新增管理</a></dd>
             <dd><a href="{{$root_path}}shoot/shootBackDetail" title="拍摄驳回管理">拍摄驳回管理</a></dd>
            <dd><a href="{{$root_path}}marlboro/shootBackManager" title="拍摄反馈管理">拍摄反馈管理</a></dd>
         </dl>
         <dl class="menu_base_info system_log">
             <dt><i class="icon iconfont">&#xf01d8;</i>基本信息<img src="{{$resource_url}}images/left/select_xl01.png"></dt>
             
             <dd><a href="{{$root_path}}information/baseInfoManager" title="基本信息管理">基本信息管理</a></dd>
             <dd><a href="{{$root_path}}information/nutrientInfo" title="营养成风">营养成分</a></dd>
         </dl>
        <dl class="record system_log">
            <dt><i class="icon iconfont">&#x346a;</i>录入管理<img src="{{$resource_url}}images/left/select_xl01.png"></dt>
            <dd><a href="{{$root_path}}input/inputManager" title="录入管理">录入管理</a></dd>
        </dl>     

         <dl class="check_manager system_log">
            <dt><i class="icon iconfont">&#xf01d8;</i>审核管理<img src="{{$resource_url}}images/left/select_xl01.png"></dt>
            <dd><a href="{{$root_path}}marlboro/shoot" title="拍摄审核">拍摄审核</a></dd>
            <dd><a href="{{$root_path}}retouch/psCheckList" title="修图审核">修图审核</a></dd>
            <dd><a href="{{$root_path}}input/inputList" title="录入审核">录入审核</a></dd>
           
        </dl>
        <dl class="counts system_log">
            <dt><i class="icon iconfont">&#xf0226;</i>统计管理<img src="{{$resource_url}}images/left/select_xl01.png"></dt>
            <!-- <dd><a href="" title="商品统计">商品统计</a></dd> -->
            <dd><a href="{{$root_path}}statistics/project" title="商品统计">项目统计</a></dd>
            <dd><a href="{{$root_path}}statistics/shoot" title="拍摄统计">拍摄统计</a></dd>
            <dd><a href="shoot_check_count.html" title="拍摄审核统计">拍摄审核统计</a></dd>
            <dd><a href="record_count.html" title="录入统计">录入统计</a></dd>
            <dd><a href="record_check_count.html" title="录入审核统计">录入审核统计</a></dd>
            <dd><a href="{{$root_path}}statistics/ps" title="修图统计">修图统计</a></dd>
            <dd><a href="{{$root_path}}statistics/psCheck" title="修图审核统计">修图审核统计</a></dd>
            <!-- <dd><a href="#" title="拍摄驳回统计">拍摄驳回统计</a></dd> -->
        </dl>
		</div>
		<div class="projectAction"></div>
	</div>
</div>
{{/if}}


 