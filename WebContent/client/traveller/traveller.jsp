<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>  
<html  lang="zh">
<!--<![endif]-->  
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
	<script type="text/javascript" src = "../js/jquery-2.1.4.js"></script>
    <script type="text/javascript">		
		var userjson = '';
		var c_cityinfo = '';
	</script>	
	 <script type="text/javascript">		
		$(document).ready(function(){
			$("#k2").on("blur",function(){
				$.get("check.do",{dest:$("#k2").val()},function(data){
					if(data=="success"){
						
					}else{
						$("#info").html("目的地不存在").css("color","red")
					}
				})
			});
		})
	</script>	
</head>

<body id="gongluo">
<%@include file="../header.jsp" %>

<div id="container">
	<div class="mainWrap cf">
				<div class="search-box">
					<div class="search-body">
						<ul class="search-tab">
							<li class="select" >
                				<a href="#" >目的地</a>
            				</li>
						</ul>
						<form method="get"  action="traveller_search.do" id="f1" class="search-form">
							<input type="text" id="k2" name="dest"  class=" input-search" value="" autocomplete="off">
							<input  type="submit" class="search-btn" value="搜索" id="search">
						</form>
						<span id = "info"></span>
					</div>
				</div>
				
			<div class="ui-box cf">
				<div class="ui-title">
					<h2 class="ui-title-cnt fn-left"><em>最新发布</em> (3858篇帖子)</h2>
				</div>
				<ul class=" travel-log-list gonglue-list">
					<c:forEach items="${Jbylist}" var="Jbylist">
						<li>

							<a target="_blank" title="${Jbylist.title }" href="traveller_detail.do?id=${Jbylist.id }"></a>
						<img src="../images/3aedfe2ee2f96e8778c5a61176f0d6ed_c.jpg" alt="${Jbylist.fromdate}-${Jbylist.todate}" width="221" height="100">	           			 
						<div class="gonglue_info fn-left">
							<h3> <a target="_blank" href="traveller_detail.do?id=${Jbylist.id }"  title="${Jbylist.fromdate}-${Jbylist.todate}">${Jbylist.fromdate}-${Jbylist.todate}之${Jbylist.title }</a></h3>
							<p>&nbsp;&nbsp;目的地:${Jbylist.dest}</p>
							<p>&nbsp;&nbsp;行程:${Jbylist.fromdate}至${Jbylist.todate}</p>
							<p>&nbsp;&nbsp;发布者:<a target="_blank" href="#">${Jbylist.name}</a>&nbsp;&nbsp;&nbsp;&nbsp;发布时间：${Jbylist.cdate}</p>	
						</div>
					</li>
					</c:forEach>
					
				</ul>
				<div class="no-pages cf">
					<c:if test="${currentPage>1 }">
						<a href="traveller.do?p=${currentPage-1 }" class="pageBtn">上一页 &lt;&lt;</a>
					</c:if>
					<c:forEach begin="1" end="${length }" step="1" var="i">
						<c:if test="${currentPage==i }">
							<strong>${i }</strong>
						</c:if>
						<c:if test="${currentPage!=i }">
							<a href="traveller.do?p=${i }">${i }</a>
						</c:if>
					</c:forEach>
					<c:if test="${currentPage<length }">
						<a href="traveller.do?p=${currentPage+1 }" class="pageBtn">下一页 &gt;&gt;</a>
					</c:if>
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