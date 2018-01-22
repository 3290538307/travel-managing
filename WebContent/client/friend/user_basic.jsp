<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html  lang="zh">
<head >
	<meta charset="utf-8">
    <title>用户 | 驴友网</title>
        <meta name="Keywords" content="驴友网" />
        <meta name="Description" content="旅游社交，在旅途中享受激情与欢乐" />
        <link rel="stylesheet" type="text/css" href="../css/global.css"  />
        <link rel="stylesheet" type="text/css" href="../css/reg.css"  />
        <link rel="stylesheet"  href="../css/boxy,jquery.fancybox-1.3.4.css" />
        <script type="text/javascript" src="../js/jquery-2.1.4.js"></script>
        <script type="text/javascript">
			var userjson = '';
			var c_cityinfo = '';
		</script>
		<script>
	        $(document).ready(function(){
	        	$("#apply").on("click",function(){
	        		$.get("apply_friend.do",{id:<%=request.getParameter("id")%>},function(data){
	                	console.info(data);
	                	if("true"==data){
	                		$("#apply").hide();
	                		$("#msg2").html("已向对方发出申请").css("color","green");
	                	}
	                },"text");		
	        	});
	        });
        </script>
</head>

<%@include file="header.jsp" %>
<!--top end-->
        
<div id="container"  class="noXtips cf">
	<div  class="main">
		<h2>基本资料</h2>
			<form id="form100" action="#" method="post" class="reg-form" >
				<p><label for="nickname"><em>*</em>性别：</label>
                   <label for="nickname"><c:if test="${user.sex==1 }">男</c:if>
                   <c:if test="${user.sex==0 }">女</c:if>
                   </label>
                </p>
				<p><label for="nickname"><em>*</em>生日：</label>
                   <label for="nickname">${user.birthday }</label>
                </p>
				<p><label for="nickname"><em>*</em>所在地：</label>
                   <label for="nickname">${user.address }</label>
                </p>
				<p><label for="nickname"><em>*</em>QQ：</label>
                   <label for="nickname">${user.qq }</label>
                </p>
				<p><label for="nickname"><em>*</em>手机：</label>
                   <label for="nickname">${user.phone }</label>
                </p>
				<p><label for="nickname"><em>*</em>爱好：</label>
                   <label for="nickname">${user.hobby }</label>
                </p>
				<p><label for="nickname"><em>*</em>个人简介：</label>
                   <label for="nickname">${user.introduce }</label>
                </p>				               
			</form>
			
			<div class="reg-notes">
                <dl class="login-option">
                    <dt>用户：${user.name }</dt>
                    <dd >
                    <c:if test="${empty user.imagepath }">
                    	<img src="../images/duface.jpg" width="100" height="100" />
                    </c:if>
                    <c:if test="${not empty user.imagepath }">
                    	<img src="../images/${user.imagepath }" width="100" height="100" />
                    </c:if>
                    </dd>
                </dl>
                <form action="">
                	<input type="hidden" value="${param.id }" name="id">
                	<c:if test="${is_friend==0 }">
                	<dl class="login-option">
	                    <dt>&nbsp;</dt>
						<dd>&nbsp;</dd>
						<c:if test="${empty isSend }">
							<a href="javascript:void(0);" class="reg-login" id="apply">加为好友</a>
	                    <span id="msg2"></span>
						</c:if>
						
	                </dl>
	                </c:if>
	                <c:if test="${is_friend==1 }">
	                	<dl class="login-option">
		                    <dt>&nbsp;</dt>
							<dd>&nbsp;</dd>
		                    <a class="reg-login">双方已为好友</a>
		                </dl>
	                </c:if>
                </form>
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