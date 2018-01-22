<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- topbar starts -->
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
				<a class="brand" href="index.html"> <img alt="Charisma Logo" src="img/logo20.png" /> <span>驴友网后台管理</span></a>
				
				<!-- theme selector starts -->
				<div class="btn-group pull-right theme-container" >
					<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="icon-tint"></i><span class="hidden-phone"> 换肤</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu" id="themes">
						<li><a data-value="classic" href="#"><i class="icon-blank"></i> 经典</a></li>
						<li><a data-value="cerulean" href="#"><i class="icon-blank"></i> 天蓝</a></li>
						<li><a data-value="cyborg" href="#"><i class="icon-blank"></i> 酷黑</a></li>
						<li><a data-value="redy" href="#"><i class="icon-blank"></i> 诱惑红</a></li>
						<li><a data-value="journal" href="#"><i class="icon-blank"></i> 自由</a></li>
						<li><a data-value="simplex" href="#"><i class="icon-blank"></i> 简约</a></li>
						<li><a data-value="slate" href="#"><i class="icon-blank"></i> 岩黑</a></li>
						<li><a data-value="spacelab" href="#"><i class="icon-blank"></i> 灰色空间</a></li>
						<li><a data-value="united" href="#"><i class="icon-blank"></i> 橘红</a></li>
					</ul>
				</div>
				<!-- theme selector ends -->
				
				<!-- user dropdown starts -->
				<div class="btn-group pull-right" >
					<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="icon-user"></i><span class="hidden-phone"> <%=session.getAttribute("adminname")%></span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="#">Profile</a></li>
						<li class="divider"></li>
						<li><a href="logout.do">注销</a></li>
					</ul>
				</div>
				<!-- user dropdown ends -->
				
				<div class="top-nav nav-collapse">
					<ul class="nav">
						<li><a href="../index.do">访问驴友网</a></li>
						<li>
							<form class="navbar-search pull-left">
								<input placeholder="Search" class="search-query span2" name="query" type="text">
							</form>
						</li>
					</ul>
				</div><!--/.nav-collapse -->
			</div>
		</div>
	</div>
	<!-- topbar ends -->
	
			<div class="container-fluid">
		<div class="row-fluid">
				
			<!-- left menu starts -->
			<div class="span2 main-menu-span">
				<div class="well nav-collapse sidebar-nav">
					<ul class="nav nav-tabs nav-stacked main-menu">
						<li class="nav-header hidden-tablet">用户管理</li>
						<li><a class="ajax-link" href="admin_add.jsp"><i class="icon-plus-sign"></i><span class="hidden-tablet"> 添加管理员</span></a></li>
						<li><a class="ajax-link" href="auser_list.do"><i class="icon-user"></i><span class="hidden-tablet"> 用户列表</span></a></li>
						<li class="nav-header hidden-tablet">用户发布信息管理</li>
						<li><a class="ajax-link" href="travel_list.do"><i class="icon-list-alt"></i><span class="hidden-tablet"> 旅游记忆信息列表</span></a></li>
						<li><a class="ajax-link" href="pt_list.do"><i class="icon-list-alt"></i><span class="hidden-tablet"> 结伴游信息列表</span></a></li>												
						<li class="nav-header hidden-tablet">旅游攻略</li>
						<li><a class="ajax-link" href="strategy_add.jsp"><i class="icon-edit"></i><span class="hidden-tablet"> 发布新攻略</span></a></li>
						<li><a class="ajax-link" href="strategy_list.do"><i class="icon-list-alt"></i><span class="hidden-tablet"> 攻略列表</span></a></li>					
						<li class="nav-header hidden-tablet">公告</li>
						<li><a class="ajax-link" href="inform_add.jsp"><i class="icon-edit"></i><span class="hidden-tablet"> 发布新公告</span></a></li>
						<li><a class="ajax-link" href="inform_list.do"><i class="icon-cog"></i><span class="hidden-tablet"> 管理已发布公告</span></a></li>	
                        <li class="nav-header hidden-tablet">注销</li>								
						<li><a href="logout.do"><i class="icon-lock"></i><span class="hidden-tablet"> 退出</span></a></li>													
					</ul>
				</div><!--/.well -->
			</div><!--/span-->