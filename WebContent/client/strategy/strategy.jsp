<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<head >
	<meta charset="utf-8" />
    <title>景点攻略 | 驴友网</title>
    <meta name="Keywords" content="" />
    <meta name="Description" content="" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="mobile-agent" content="format=html5; url=http://m.roadqu.com">
	<link rel="stylesheet" href="../css/global.css" media="all">
	<link rel="stylesheet" href="../css/boxy,jquery.fancybox-1.3.4.css">
    <link rel="stylesheet" type="text/css" href="../css/cityguide.css"  />
</head>
   
<body id="profile-homepage">
<%@include file="../header.jsp" %>


<div id="container">
	<div id="mainWrapper" class="cf"> 
		<!-- 主题游 begin -->  
	
		<div class="ui-box fn-clear">
			<div class="ui-title">
				<h2 class="ui-title-cnt fn-left"><em>主题游</em></h2>    
			</div>
			
			<ul class="hot-spots fn-clear">
			<c:forEach  var="strategy" items="${newstrategy}">
				<li>
				  	<a href="strategy_detail.do?id=${strategy.id }"><img src="../images/${strategy.imgpath}" width="190" height="190" alt="${strategy.spot}" title="${strategy.title}"></a>
					<p></p>
					<ul class="tag-info fn-clear">
						<li><a href="strategy_detail.do?id=${strategy.id }" target="_blank">${strategy.spot}</a></li>
						<li><a href="strategy_detail.do?id=${strategy.id }" target="_blank">${strategy.triptime}</a></li>
						<li><a href="strategy_detail.do?id=${strategy.id }" target="_blank">${strategy.people}</a></li>
					</ul>
				</li>
				
				</c:forEach>
			</ul>
		</div>
		
		<!-- 主题游 end -->  
		<!-- 时令游start -->
			
		<div class="ui-box fn-clear">
			<div class="ui-title">
				<h2 class="ui-title-cnt fn-left"><em>时令游</em></h2>    
			</div>
			
			<ul class="hot-spots fn-clear">
			<c:forEach  var="strategy" items="${newstrategy}">
				<li>
					<a href="strategy_detail.do?id=${strategy.id }"><img src="../images/${strategy.imgpath}" width="190" height="190" alt="${strategy.spot}" title="${strategy.title}"></a>
					<p></p>
					<ul class="tag-info fn-clear">
						<li><a href="strategy_detail.do?id=${strategy.id }" target="_blank">${strategy.spot}</a></li>
						<li><a href="strategy_detail.do?id=${strategy.id }" target="_blank">${strategy.triptime}</a></li>
						<li><a href="strategy_detail.do?id=${strategy.id }"target="_blank">${strategy.people}</a></li>
					</ul>
				</li>
				</c:forEach>
			
			</ul>
		</div>
		<!-- 时令游end -->
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