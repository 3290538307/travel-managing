<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
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
						color:#fefefe; text-indent:25px; font-size:20px; font-family:\9ED1\4F53; font-weight:400;">全部记忆</h2>
			<ul id="comment-list" class="comment-list">
			<c:forEach items="${myMemory }" var="mem">
				<li class="fn-clear">
					<div >
						<p>
							<a class="comment_user" href="../memory/memory_detail.do?id=${mem.id }"><img width="75" height="75" alt="i闲逛" src="../images/${mem.path1 }">${mem.title }</a>
							<label style="float:right"><a class="comment_user" href="../user/memory_delete.do?id=${mem.id }">删除</a></label>
						</p>
						<div class="comment_box">
							<div class="comment_cnt"> 
								类别：<c:if test="${mem.kind==1 }">面朝大海</c:if>
								<c:if test="${mem.kind==2 }">古镇时光</c:if>
								<c:if test="${mem.kind==3 }">吃货血拼</c:if>
								<c:if test="${mem.kind==4 }">户外撒野</c:if>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								发布时间：${mem.cdate }    
							</div>
						</div>
					</div>
				</li>
			</c:forEach>
				
			</ul>
			<!--分页-->
			<div class="no-pages cf">
				<c:if test="${currentPage>1 }">
					<a href="memeroy_list.do?p=${currentPage-1 }" class="pageBtn">上一页 &gt;&gt;</a>
				</c:if>
				<c:forEach begin="1" end="${length }" step="1" var="i">
					<c:if test="${currentPage==i }">
						<strong>${i }</strong>
					</c:if>
					<c:if test="${currentPage!=i }">
						<a href="memeroy_list.do?p=${i }">${i }</a>
					</c:if>
				</c:forEach>
				<c:if test="${currentPage<length }">
					<a href="memeroy_list.do?p=${currentPage+1 }" class="pageBtn">下一页 &gt;&gt;</a>
				</c:if>
			</div>
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