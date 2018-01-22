<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>  
<html  lang="zh">  
<head>
	<meta charset="utf-8">  
	<title>结伴游 | 驴友网</title>
	<meta name="Keywords" content="旅游社交，在旅途中享受激情与欢乐" />  
	<meta name="Description" content="旅游社交，在旅途中享受激情与欢乐" />  
    <link rel="shortcut icon"  href="favicon.ico" />  
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="mobile-agent" content="format=html5; url=http://m.roadqu.com">
	<link rel="stylesheet" href="../css/global.css" media="all">
	<link rel="stylesheet" href="../css/boxy,jquery.fancybox-1.3.4.css">	 
	<link rel="stylesheet" type="text/css" href="../css/journey.css" >
		<link rel="stylesheet"  href="../css/search.css" /> 
    <script type="text/javascript">		
		var userjson = '';
		var c_cityinfo = '';
	</script>
	<!-- 合并jquery and $LAB -->
	<script type="text/javascript" src="static/min/js/jquery-1.4.4.min,LAB.min.js?t=201301111415"></script>
</head>

<body id="gongluo">
<%@include file="../header.jsp" %>
<div id="container">
	<div class="mainWrap cf">
		
			<div class="ui-box cf">
				<div class="ui-title">
					<h2 class="ui-title-cnt fn-left"><em>搜索到相关结伴游帖子 385 篇</em></h2>
				</div>
				<ul class=" travel-log-list gonglue-list">
					<c:forEach items="${jbydest }" var = "temp">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
						<li>
						<a target="_blank" title="${temp.title }" href="traveller_search.do?dest=${temp.dest }"></a>
						<img src="../images/3aedfe2ee2f96e8778c5a61176f0d6ed_c.jpg" alt="${temp.fromdate}-${temp.todate}" width="221" height="300">	           			 
						<div class="gonglue_info fn-left">
							<h3> <a target="_blank" href="traveller_search.do?id=${temp.id }"  title="${temp.fromdate}-${temp.todate}">${temp.fromdate}-${temp.todate}之${temp.title }</a></h3>
							<p>&nbsp;&nbsp;目的地:${temp.dest}</p>
							<p>&nbsp;&nbsp;行程:"${temp.fromdate}至${temp.todate}</p>
							<p>&nbsp;&nbsp;发布者:<a target="_blank" href="#">${temp.name}</a>&nbsp;&nbsp;&nbsp;&nbsp;发布时间：${temp.cdate}</p>	
						</div>
					</li>
					</c:forEach>
				</ul>
				<!--分页-->
				<div class="no-pages">
					<strong>1</strong> <a href="#">2</a>  <a href="#">3</a>  <a href="#">4</a> <span> ... </span><a href="#">100</a><a href="#" class="pageBtn">下一页 &gt;&gt;</a> </div>
				<!--分页-->
			</div>  
		</div>
</div>

<!-- 底部footer 开始-->
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