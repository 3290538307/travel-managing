<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html  lang="zh">
<head >
	<meta charset="utf-8">
    <title>登录 | 驴友网</title>
        <meta name="Keywords" content="驴友网" />
        <meta name="Description" content="旅游社交，在旅途中享受激情与欢乐" />
        <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
		<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="../css/global.css"  />
        <link rel="stylesheet" type="text/css" href="../css/reg.css"  />
        <link rel="stylesheet"  href="../css/boxy,jquery.fancybox-1.3.4.css" />
        <script type="text/javascript">
        	$(document).ready(function(){
        		$("#sure").on("click",function(){
        			$.get("findpassword.do",{nickname:$("#lost_user").val(),email:$("#lost_email").val()},
        			function(data){
        				console.info(data);
        				if("fail1"==data){
        					$("#myModalLabel").html("该用户不存在!").css("color","red");
        				}else if("fail2"==data){
        					$("#myModalLabel").html("用户名和邮箱不匹配!").css("color","red");
        				}else{
        					$("#myModal").modal("hide");
        					$("#msg").html("已发送至邮箱,注意查收").css("color","green");
        				}
        			});
        		});
        	});
        </script>
        <script type="text/javascript">
			var userjson = '';
			var c_cityinfo = '';
		</script>
</head>

<body id="reg" >
<!--top-->
<div class="header">
    <div class="headWrap">
        <div class="headTop fn-clear">
            <h1 class="logo">
                <a href="index.htm" title="驴友网" style="float: left;" >驴友网</a>
            </h1>
            <h2 class="slogan" title="在旅途中相遇">在旅途中相遇</h2>

            <div class="loginInfo">                
                <ul class="not_login">
                    <li style="float:right"><a href="register.jsp" class="btn_reg">注册</a></li>
                    <li  style="float:right"><a href="login.jsp"  id="top-nav-login" class="btn_login">登录</a></li>
                </ul>
            </div>
        </div>

        <ul class="dropdown">
            <li>
                <a href="../index.do" >首页</a>
            </li>
            <li>
                <a href="../memory/memory.do">旅游记忆</a>
            </li>
            <li>
				<a href="../traveller/traveller.do">结伴游</a>
			</li>
            <li>
				<a href="../strategy/strategy.do">景点攻略</a>
			</li>
		</ul>
				 
		<div class="navSearch">
			<form action="../memory/memory_search.htm" method="get" id="searchForm" target="_blank">
				<input name="k" type="text" class="top-search-input" id="searchKey" value="搜索旅游记忆" maxlength="50" autocomplete="off"/>
                <input name="" type="submit" value="搜索" class="search_btn">
            </form>
			<div id="keyword_tip_content"></div>
		</div>
	</div>
</div>
<!--top end-->
<script type="text/javascript">
function sendLoginData() {
	document.getElementById("form100").submit();
}
</script>       
<div id="container"  class="noXtips cf">
	<div  class="main">
		<h2>欢迎登录驴友网</h2>
			<!-- 按钮触发模态框 -->
			<%String msg = (String) request.getAttribute("msg");
			String name = request.getParameter("nickname"); %>

			<form id="form100" action="login.do" method="post" class="reg-form">
				
				<p>
					<label for="nickname"><em>*</em>用户名：</label> <input name="nickname"
						type="text" class="input-txt" id="nickname" autocomplete="off"
						size="43" value="<%if(name!=null){%><%=name %><%}%>" />
				</p>
				<p>
					<label for="password"><em>*</em>密码：</label> <input name="password"
						type="password" class="input-txt" id="password" autocomplete="off"
						size="43" />
				</p>

				<a href="javascript:void(0)" onclick="sendLoginData()"
					class="reg-login">登录</a>
				<!-- a href="#myModal" role="button"
					class="btn" data-toggle="modal"
					style="margin-top: 15px; margin-left: 30px;"-->
				<!--/a  -->
				<button class="btn btn-primary btn-lg" data-toggle="modal"
					data-target="#myModal" style="margin-top: 15px; margin-left: 30px; 
					font-size: 13px; padding-bottom: 8px; padding-top: 8px; "
					onclick="return false;" >密码找回</button>  
				<%
					if (msg != null) {
				%><%=msg %>
				<%} %>	
				<span id="msg" style="font-size: 16px;"></span>
			</form>
			<div class="reg-notes">
				<p>如果你还没有账户，请点击注册</p>
				<a href="register.jsp" class="reg-login">注册</a>
				
			</div>
			
		</div>
	</div>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">密码找回</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="exampleInputEmail1">用户名</label>
						<input type="text" class="form-content" id="lost_user" name="user" >
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">邮箱</label>
						<input type="text" class="form-content" id="lost_email" name="userEmail" >
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="sure">提交</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<div class="footer ">
		<div class="footerWrap fn-clear">
			<ul class="about_roadqu ">
				<li><a href="#">关于驴友</a>|</li>
				<li><a href="#">联系我们</a>|</li>
				<li><a href="#">用户公约</a>|</li>
				<li><a href="#">意见反馈</a>|</li>
				<li><a href="#">帮助中心</a>|</li>
				<li><a href="#">友情链接</a></li>
			</ul>
			<div class="foot">
				<p>
					<span>版权所有软件1001班 <a href="#">陈文平</a><a href="#"> 胡剑彬</a><a
						href="#">林清华</a><a href="#">汤怡青</a><a href="#">袁泽</a><a
						href="#">周晓丽</a>
					</span>
				</p>
				<div class="sns">
					<span>关注我们： </span><a href="#" class="login_sina">新浪微博 </a><a
						href="#" class="login_qq">腾讯微博</a> <a href="#" title="360绿色网站"><img
						src="http://trust.360.cn/img.php?sn=5229&id=5" border="0" /></a>
					<!-- WPA Button Begin -->
					<!-- WPA Button END -->
				</div>
			</div>
		</div>
	</div>
	<!-- footer end -->
</body>
</html>