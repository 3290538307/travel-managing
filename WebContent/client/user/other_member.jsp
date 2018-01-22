<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE HTML>
<html  lang="zh">
<head>
	<meta charset="utf-8">
	<title>个人中心 | 驴友网</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="mobile-agent" content="format=html5; url=http://m.roadqu.com">
	<link rel="stylesheet" href="../css/global.css" media="all">
	<link rel="stylesheet" href="../css/boxy,jquery.fancybox-1.3.4.css">
	<link  href="../css/aboutus.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="../css/huidong.css">
	<link rel="stylesheet" type="text/css" href="../css/reg.css"  />
	
	<script type="text/javascript">
		var userjson = '';
		var c_cityinfo = '';
	</script>
	<!-- 合并jquery and $LAB -->
	
</head>
<body>
<%@include file="../header.jsp" %>

<div id="container" class="fn-clear">
	<div class="bottom">
    	<div class="bottom_t"></div>
        <div class="bottom_c h650">
        <div class="bottom_c_l">
       	  <%@include file="sidebar.jsp" %>						
		</div>
	
		<div class="bottom_c_r">
			<h2 style="width:680px; height:40px; line-height:41px; background:#83bb4a url(../images/reg-title-bg.png) repeat-x; 
						color:#fefefe; text-indent:25px; font-size:20px; font-family:\9ED1\4F53; font-weight:400;">非好友列表</h2>
			<ul id="comment-list" class="comment-list">
				<li class="fn-clear">
					<div class="isearch">
						 <div class="navSearch">
							<form action="friend_search.jsp" method="get" id="searchForm" target="_blank">
								<input name="k" type="text" class="top-search-input" id="searchKey" value="搜索好友" maxlength="50" autocomplete="off"/>
								<input name="s" type="submit" value="搜索" class="search_btn">
							</form>
							<div id="keyword_tip_content"></div>
						</div>
					</div>
				</li>
				
				<li class="fn-clear">
					<div >
						<c:forEach items="${myFriends }" var="friend">
							<p>
								<a class="comment_user" href="../friend/user_basic.do?id=${friend.id }">
								<c:if test="${not empty friend.imagepath }">
									<img width="75" height="75"  src="../images/${friend.imagepath }">
								</c:if>
								<c:if test="${ empty friend.imagepath }">
									<img width="75" height="75"  src="../images/default.jpg">
								</c:if>
									&nbsp;&nbsp;&nbsp;&nbsp;${friend.name }</a>
							</p>
							<div class="comment_box">
								<div class="comment_cnt"> 
									性别：<c:if test="${friend.sex==1 }">男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
									<c:if test="${friend.sex==0 }">女&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
									所在地：${friend.address }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									生日：${friend.birthday }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									QQ：${friend.qq }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									手机：${friend.phone }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp
								</div>
							</div>
						</c:forEach>
					</div>
				</li>
			</ul>
			<!--分页-->
			<div class="no-pages cf">
				<c:if test="${currentPage>1 }">
						<a href="friend.do?p=${currentPage-1 }" class="pageBtn">上一页 &lt;&lt;</a>
					</c:if>
					<c:forEach begin="1" end="${length }" step="1" var="i">
						<c:if test="${currentPage==i }">
							<strong>${i }</strong>
						</c:if>
						<c:if test="${currentPage!=i }">
							<a href="friend.do?p=${i }">${i }</a>
						</c:if>
					</c:forEach>
					<c:if test="${currentPage<length }">
						<a href="friend.do?p=${currentPage+1 }" class="pageBtn">下一页 &gt;&gt;</a>
					</c:if>
			</div>	
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