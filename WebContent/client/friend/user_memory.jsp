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
		<link rel="stylesheet"  href="../css/search.css" />
        <script type="text/javascript">
			var userjson = '';
			var c_cityinfo = '';
		</script>
</head>

<%@include file="header.jsp" %>
        
<div id="container" class='noXtips'>
		<div id="mainWrapper" class="fn-clear">
			<div class="main">
				<h2>旅游记忆</h2>
				<div class="searchResult">
					<ul class="zhuanti-list">
					
				<c:forEach items="${memory }" var="mem">
					<li class="cf" bid="367492">
							<div class="head_pic-warp">
								<a href="memory_detail.do?id=${mem.id }"><img src="../images/0_201301211158_youhui.jpg"></a>  
							</div>
							<div class="feed_content"> 
								<p class="feed-head">
									<a href="memory_detail.htm">${mem.title }</a>
								</p><br />
								<div class="feed_from">
									<div class="fl">
										<cite><a href="memory_detail.do?id=${mem.id }"><c:if test="${mem.kind==1 }">面朝大海</c:if>
							<c:if test="${mem.kind==2 }">古镇时光</c:if>
							<c:if test="${mem.kind==3 }">吃货血拼</c:if>
							<c:if test="${mem.kind==4 }">户外撒野</c:if></a>&nbsp;&nbsp;&nbsp;&nbsp;
											  <a href="#">发布者：${mem.name }</a>&nbsp;&nbsp;&nbsp;&nbsp;
											  <a href="#">发布时间：${mem.cdate }</a>
										</cite> 
									</div>     
								</div>
							</div>
						</li>	
				</c:forEach>
			</ul>
			<!--分页-->
			<div class="no-pages cf">
					<c:if test="${currentPage>1 }">
						<a href="user_memory.do?p=${currentPage-1 }&id=${userId}" class="pageBtn">上一页 &lt;&lt;</a>
					</c:if>
					<c:forEach begin="1" end="${length }" step="1" var="i">
						<c:if test="${currentPage==i }">
							<strong>${i }</strong>
						</c:if>
						<c:if test="${currentPage!=i }">
							<a href="user_memory.do?p=${i }&id=${userId}">${i }</a>
						</c:if>
					</c:forEach>
					<c:if test="${currentPage<length }">
						<a href="user_memory.do?p=${currentPage+1 }&id=${userId}" class="pageBtn">下一页 &gt;&gt;</a>
					</c:if>
				</div>
			<!--分页-->
				<!--记忆搜索结果end--> 
			</div>
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