<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html  lang="zh">
<head>
	<meta charset="utf-8">
	<title>旅游记忆 | 驴友网</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="mobile-agent" content="format=html5; url=http://m.roadqu.com">
	<link rel="stylesheet" href="../css/global.css" media="all">
	<link rel="stylesheet" href="../css/boxy,jquery.fancybox-1.3.4.css">
	<link  href="../css/aboutus.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
		var userjson = '';
		var c_cityinfo = '';
	</script>

</head>
<body>
<%@include file="../header.jsp" %>

<div id="container" class="fn-clear">
<div class="main">
	<div class="bottom">
    	<div class="bottom_t"></div>
        <div class="bottom_c h650">
       	  <div class="bottom_c_l">
           	  <div class="title01"> 记忆分类 </div>
              <div class="list01 bk">
                <ul>
                    <li class="un">
						<a href="memory_list.do?kind=1"><div class="icon_bot"><img src="../images/help12.png"></div>面朝大海</a>
					</li>
                    <li>
						<a href="memory_list.do?kind=2"><div class="icon_bot"><img src="../images/help13.png"></div>古镇时光</a>
					</li>
                    <li>                    
						<a href="memory_list.do?kind=3"> <div class="icon_bot"><img src="../images/help14.png"></div>吃货血拼</a>
					</li>
                    <li>                    
						<a href="memory_list.do?kind=4"> <div class="icon_bot"><img src="../images/help14.png"></div>户外撒野</a>
					</li>
                </ul>
			</div>
		</div>
		<style type="text/css">
		
			li h3{
				margin: 15px 0px;
			}
		</style>
		<div class="bottom_c_r">
			<ul class="zhuanti-list">
				<c:forEach items="${memory }" var="mem">
					<li class="ui-box zhuanti-item">
						<a target="_blank" href="memory_detail.do?id=${mem.id }"><img align="left" src="../images/${mem.path1 }" alt="${mem.title }" style="float:none;" width="300" height="200"></a>
						<div class="zhuanti-info" style="display:inline-block;line-height:20px;width:310px;padding-top: 10px;"> 
							<h2><a href="memory_detail.do?id=${mem.id }">${mem.title }</a></h2>
							<h3>类别：<c:if test="${mem.kind==1 }">面朝大海</c:if>
							<c:if test="${mem.kind==2 }">古镇时光</c:if>
							<c:if test="${mem.kind==3 }">吃货血拼</c:if>
							<c:if test="${mem.kind==4 }">户外撒野</c:if></h3>
							<h3>发布者：${mem.name }&nbsp;&nbsp;&nbsp;&nbsp;发布时间：${mem.cdate }</h3>
						</div>
					</li>
				</c:forEach>
			</ul>
			<!--分页-->
			<div class="no-pages">
				<c:if test="${currentPage>1 }">
					<c:if test="${empty kind }">
						<a href="memory_list.do?page=${currentPage-1 }" class="pageBtn">上一页 &gt;&gt;</a>
					</c:if>
					<c:if test="${not empty kind }">
						<a href="memory_list.do?page=${currentPage-1 }&kind=${kind}" class="pageBtn">上一页 &gt;&gt;</a>
					</c:if>
				</c:if>
				<c:forEach begin="1" end="${length }" step="1" var="i">
					<c:if test="${currentPage==i }">
						<strong>${i }</strong>
					</c:if>
					<c:if test="${currentPage!=i }">
						<c:if test="${empty kind }">
							<a href="memory_list.do?page=${i }">${i }</a>
						</c:if>
						<c:if test="${not empty kind }">
							<a href="memory_list.do?page=${i }&kind=${kind}">${i }</a>
						</c:if>
					</c:if>
				</c:forEach>
				<c:if test="${currentPage<length }">
					<c:if test="${empty kind }">
						<a href="memory_list.do?page=${currentPage+1 }" class="pageBtn">下一页 &gt;&gt;</a>
					</c:if>
					<c:if test="${not empty kind }">
						<a href="memory_list.do?page=${currentPage+1 }&kind=${kind}" class="pageBtn">下一页 &gt;&gt;</a>
					</c:if>
				</c:if>
			</div>	
			<!--分页-->
			
		</div>
        <div class="bottom_b"></div>
    </div>
</div>
</div>
<!-- 底部footer 开始-->
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