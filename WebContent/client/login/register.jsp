<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html  lang="zh">
<head >

	<meta charset="utf-8">
    <title>注册 | 驴友网</title>
        <meta name="Keywords" content="驴友网" />
        <meta name="Description" content="旅游社交，在旅途中享受激情与欢乐" />
        <link rel="stylesheet" type="text/css" href="../css/global.css"  />
        <link rel="stylesheet" type="text/css" href="../css/reg.css"  />
        <link rel="stylesheet"  href="../css/boxy,jquery.fancybox-1.3.4.css" />
        <script type="text/javascript" src="../js/jquery-2.1.4.js"></script>
        <script>
	        $(document).ready(function(){
	        	$("#nickname").on("blur",function(){
	        		$.get("../checkname.do",{nickname:$("#nickname").val()},function(data){
	                	console.info(data);
	                	if("sucess"==data){
	                		$("#chkmsg").html("可以注册").css("color","green");
	                	}else{
	                		$("#chkmsg").html("用户名已存在").css("color","red");
	                	}
	                },"text");		
	        	});
	        });
        </script>
       <script>
	        $(document).ready(function(){
	        	$("#repassword").on("blur",function(){
	        		$.get("checkpwd.do",{password:$("#password").val(),repassword:$("#repassword").val()},function(data){
	                	console.info(data);
	                	if("sucess"==data){
	                		$("#chkpwd").html("密码通过").css("color","green");
	                	}else{
	                		$("#chkpwd").html("两次输入的密码不一致").css("color","red");
	                	}
	                },"text");		
	        	});
	        });
        </script>
        <script>
	        $(document).ready(function(){
	        	$("#email").on("blur",function(){
	        		$.get("../checkemail.do",{email:$("#email").val()},function(data){
	                	console.info(data);
	                	if("sucess"==data){
	                		$("#chkemail").html("通过验证").css("color","green");
	                	}else if("existed"==data){
	                		$("#chkemail").html("该邮箱已存在!").css("color","red");
	                	}else{
	                		$("#chkemail").html("格式错误!").css("color","red");
	                	}
	                },"text");		
	        	});
	        });
        </script>
        <script type="text/javascript">
        	$(document).ready(function(){
        		$("#checkcode").on("blur",function(){
        			$.get("../checkcaptcha.do",{checkcode:$("#checkcode").val()},function(data){
        				console.info(data);
        				if("null"==data){
        					$("#chkcode").html("输入不得为空!").css("color","red");
        				}else if("false"==data){
        					$("#chkcode").html("验证失败!").css("color","red");
        				}else{
        					$("#chkcode").html("验证成功!").css("color","green");
        				}
        			});
        		});
        	});
        </script>
        <script type="text/javascript">
        	$(document).ready(function(){
        		
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
                <a href="index.do" title="驴友网" style="float: left;" >驴友网</a>
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
function sendData() {
	document.getElementById("form100").submit();
}
</script>       
<div id="container"  class="noXtips cf">
	<div  class="main">
		<h2>欢迎注册驴友网</h2>
			<form id="form100" action="register.do" method="post" class="reg-form" >
				<c:if test="${not empty msg }">
					<c:out value="${msg }"></c:out>
				</c:if>
				<p><label for="nickname"><em>*</em>用户名：</label>
                   <input name="nickname" type="text"  class="input-txt" id="nickname" autocomplete="off" size="43" />
                   <span id="chkmsg"></span>
                </p>
				<p><label for="password"><em>*</em>密码：</label>
                   <input name="password" type="password"  class="input-txt" id="password" autocomplete="off" size="43" />
                </p>
				<p><label for="repassword"><em>*</em>确认密码：</label>
                   <input name="repassword" type="password"  class="input-txt" id="repassword" autocomplete="off" size="43" />
                	<span id="chkpwd"></span>
                </p>
				<p><label for="email"><em>*</em>邮箱：</label>
					<input name="email" type="text"  class="input-txt" id="email" size="43">
					<span id="chkemail"></span>
                </p>
                <p class="checkcode"><label for="checkcode"><em>*</em>验证码：</label>
					<input name="checkcode" type="text" class="input-txt" id="checkcode" autocomplete="off" >
					<span id="chkcode"></span>
					<img height="26" align="absmiddle" width="105"  onclick="this.src=this.src+'?'" title="看不清？点击更换"  src="<%=request.getContextPath() %>/client/captcha.do" id="checkcodeimg" ><span  class="refresh" id="checkmsg">换一换</span>
                	
                </p> 
                
				<p class="chcek-rule"><input name="agree" type="checkbox" value="1" checked id="agree"/>
					<span class="fl">我同意</span><a href="#" target="_blank">《驴友网服务公约》</a>
				</p>
                <a class="regbtn" id="submit" href="javascript:void(0);" onclick="sendData()" hidefocus="true">立即注册</a>                
			</form>
			
			<div class="reg-notes">
				<p>如果你已注册，请直接登录</p>
                <a href="login.jsp" class="reg-login">登录</a>
                <dl class="login-option">
                    <dt>你也可以用以下方式登录</dt>
                    <dd class="sina-ico"><a href="#">新浪微博</a></dd>
                    <dd ><a href="#">腾讯微博</a></dd>
                </dl>
			</div>
		</div>
	</div>
	
<div class="footer " >
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
			<p><span>版权所有软件1001班
			<a href="#" >陈文平</a><a href="#" > 胡剑彬</a><a href="#" >林清华</a><a href="#" >汤怡青</a><a href="#" >袁泽</a><a href="#" >周晓丽</a>
			</span></p>
            <div class="sns">
				<span>关注我们： </span><a href="#" class="login_sina">新浪微博 </a><a href="#" class="login_qq">腾讯微博</a>
				<a href="#" title="360绿色网站"><img src="http://trust.360.cn/img.php?sn=5229&id=5" border="0" /></a> 
			<!-- WPA Button Begin -->
		<!-- WPA Button END -->
			</div>
		</div>
	</div>
</div>
<!-- footer end -->
</body>
</html>