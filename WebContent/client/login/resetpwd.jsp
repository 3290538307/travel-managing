<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
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
        	$("#submit").hide();
        }); 
        </script>
        <script>
        $(document).ready(function(){
        	$("#repassword").on("blur",function(){
        		$.get("checkpwd.do",{password:$("#password").val(),repassword:$("#repassword").val()},function(data){
                	console.info(data);
                	if("sucess"==data){
                		$("#chkpwd").html("密码通过").css("color","green");
                		$("#submit").show();
                	}else if("null"==data){
                		$("#chkpwd").html("输入不得为空").css("color","red");
                		$("#submit").hide();
                	}
                	else{
                		$("#chkpwd").html("两次输入的密码不一致").css("color","red");
                		$("#submit").hide();
                	}
                },"text");		
        	});
        });
        </script>
        <script type="text/javascript">
        $(document).ready(function(){
        	$("#submit").on("click",function(){
        		$.post("resetpwd.do",{nickname:$("#nickname").val(),key:$("#key").val(),password:$("#password").val()},
        				function(data){
        			console.info(data);
        			if("true"==data){
        				$("#msg").html("密码设置完成，请重新登陆").css("color","green");
        			}else{
        				$("#msg").html("密码设置失败，请重新尝试").css("color","red");
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
                <a href="../memory/memory.jsp">旅游记忆</a>
            </li>
            <li>
				<a href="../traveller/traveller.jsp">结伴游</a>
			</li>
            <li>
				<a href="../strategy/strategy.jsp">景点攻略</a>
			</li>
		</ul>
				 
		<div class="navSearch">
			<form action="../memory/memory_search.jsp" method="get" id="searchForm" target="_blank">
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
		<h2>请您重设密码</h2>
			<!-- 按钮触发模态框 -->
			<form id="form100" action="resetpwd.do" method="post" class="reg-form">
				<p>
					<label for="nickname"><em>*</em>用户名：</label><c:out value="${param.nickname }"></c:out> 
					<input name="nickname" type="hidden" value="${param.nickname }" id="nickname"/>
					<input name="key" type="hidden" value="${param.key }" id="key"/>
				</p>
				<p>
					<label for="password"><em>*</em>新密码：</label> <input name="password"
						type="password" class="input-txt" id="password" autocomplete="off"
						size="43" style="margin-left: 56px; " />
				</p>
				<p>
					<label for="repassword"><em>*</em>再次输入新密码：</label> <input name="repassword"
						type="password" class="input-txt" id="repassword" autocomplete="off"
						size="43" style="margin-left: 56px; "/>
					<span id="chkpwd"></span>
				</p>
				<a href="javascript:void(0)" 
					class="reg-login" style="margin-left: 150px;margin-top: 33px;" id="submit">确认提交</a>
					<span id="msg"></span>
			</form>
		</div>
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