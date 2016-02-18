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
                <dd><a href="{{$root_path}}marlboro/shootCheck" title="拍摄审核">拍摄审核</a></dd>
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
            {{if $userInfo.roleId==1}}
        <dl class="user_manager system_log">
            <dt><i class="icon iconfont">&#xf021b;</i>系统管理<img src="{{$resource_url}}images/left/select_xl01.png"></dt>
            <!-- <dd><a href="first_index.html" title="首页管理">首页管理</a></dd> -->
            <dd><a href="{{$root_path}}user/index" title="用户管理">用户管理</a></dd>
            <dd><a href="{{$root_path}}role/index" title="角色管理">角色管理</a></dd>
            <dd><a href="{{$root_path}}user/userGroupList" title="用户组管理">用户组管理</a></dd>
            <dd><a href="{{$root_path}}project/projectManager" title="项目管理">项目管理</a></dd>
            <dd><a href="{{$root_path}}project/projectUserManager" title="项目成员管理">项目成员管理</a></dd>
        </dl>
            {{/if}}
            {{if $userInfo.roleId=="1"}}
         <dl class="business_base_info system_log">
             <dt><i class="icon iconfont">&#xf00a9;</i>商品信息<img src="{{$resource_url}}images/left/select_xl01.png"></dt>
             <dd><a href="up_good_list.html" title="导入商品清单">导入商品清单</a></dd>
             <dd><a href="{{$root_path}}goods/goodsManager" title="商品管理">商品管理</a></dd>
             <dd><a href="{{$root_path}}goods/goodsClassify" title="商品分类">商品分类</a></dd>
        </dl>
            {{/if}}
            <!-- 拍摄 -->
            {{if $userInfo.roleId=="12" || $userInfo.roleId=="13" || $userInfo.roleId=="3" || $userInfo.roleId=="1" || $userInfo.roleId=="14" || $userInfo.roleId=="15"}}
        <dl class="menu_shoot_manager system_log">
             <dt><i class="icon iconfont">&#xf0178;</i>拍摄管理<img src="{{$resource_url}}images/left/select_xl01.png"></dt>
             <dd><a href="{{$root_path}}shoot/noShoot" title="无法拍摄">无法拍摄</a></dd>
             <dd><a href="{{$root_path}}shoot/noMeasure" title="无法测量">无法测量</a></dd>
             <dd><a href="{{$root_path}}shoot/shootAddManager" title="拍摄新增管理">拍摄新增管理</a></dd>
             <dd><a href="{{$root_path}}shoot/shootBackDetail" title="拍摄驳回管理">拍摄驳回管理</a></dd>
            {{if $userInfo.roleId=="1" || $userInfo.roleId=="14" || $userInfo.roleId=="15"}}
            <dd><a href="{{$root_path}}marlboro/shootBackManager" title="拍摄反馈管理">拍摄反馈管理</a></dd>
            {{/if}}
         </dl>
            {{/if}}
        {{if $userInfo.roleId==1 || $userInfo.roleId==10}}

         <dl class="menu_base_info system_log">
             <dt><i class="icon iconfont">&#xf016c;</i>基本信息<img src="{{$resource_url}}images/left/select_xl01.png"></dt>
             
             <dd><a href="{{$root_path}}information/baseInfoManager" title="基本信息管理">基本信息管理</a></dd>
             <dd><a href="{{$root_path}}information/nutrientInfo" title="营养成风">营养成分</a></dd>
         </dl>
            {{/if}}
            <!--录入-->
            {{if $userInfo.roleId=="16" || $userInfo.roleId=="2" || $userInfo.roleId=="10" || $userInfo.roleId=="1"}}
        <dl class="record system_log">
            <dt><i class="icon iconfont">&#x346a;</i>录入管理<img src="{{$resource_url}}images/left/select_xl01.png"></dt>
            <dd><a href="{{$root_path}}input/inputManager" title="录入管理">录入管理</a></dd>
        </dl>     
            {{/if}}

            {{if $userInfo.roleId=="1" || $userInfo.roleId=="14" || $userInfo.roleId=="15" || $userInfo.roleId=="4" || $userInfo.roleId=="7" || $userInfo.roleId=="5" || $userInfo.roleId=="11"}}
         <dl class="check_manager system_log">
            <dt><i class="icon iconfont">&#xf01d8;</i>审核管理<img src="{{$resource_url}}images/left/select_xl01.png"></dt>
             {{if $userInfo.roleId=="14" || $userInfo.roleId=="15" ||$userInfo.roleId=="1"}}
            <dd><a href="{{$root_path}}marlboro/shootCheck" title="拍摄审核">拍摄审核</a></dd>
             {{/if}}
             {{if $userInfo.roleId=="4" || $userInfo.roleId=="7" || $userInfo.roleId=="1"}}
            <dd><a href="{{$root_path}}retouch/psCheckList" title="修图审核">修图审核</a></dd>
             {{/if}}
             <!--录入审核-->
             {{if $userInfo.roleId=="5" || $userInfo.roleId=="11" || $userInfo.roleId=="1"}}
            <dd><a href="{{$root_path}}input/inputList" title="录入审核">录入审核</a></dd>
           {{/if}}
        </dl>
            {{/if}}
            {{if $userInfo.roleId=="1"}}
        <dl class="counts system_log">
            <dt><i class="icon iconfont">&#xf0141;</i>统计管理<img src="{{$resource_url}}images/left/select_xl01.png"></dt>
            <dd><a href="{{$root_path}}statistics/goodsList" title="商品统计">商品统计</a></dd>
            <dd><a href="{{$root_path}}statistics/projectList" title="项目统计">项目统计</a></dd>
            <dd><a href="{{$root_path}}statistics/shootList" title="拍摄统计">拍摄统计</a></dd>
            <dd><a href="{{$root_path}}statistics/shootCheckList" title="拍摄审核统计">拍摄审核统计</a></dd>
            <dd><a href="{{$root_path}}statistics/inputList" title="录入统计">录入统计</a></dd>
            <dd><a href="{{$root_path}}statistics/inputCheck" title="录入审核统计">录入审核统计</a></dd>
            <dd><a href="{{$root_path}}statistics/psList" title="修图统计">修图统计</a></dd>
            <dd><a href="{{$root_path}}statistics/psCheckList" title="修图审核统计">修图审核统计</a></dd>
            <dd><a href="{{$root_path}}statistics/shootBack" title="拍摄驳回统计">拍摄驳回统计</a></dd>
        </dl>
            {{/if}}
		</div>
		<div class="projectAction"></div>
	</div>
</div>
{{/if}}


 