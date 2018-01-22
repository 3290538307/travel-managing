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
		<link rel="stylesheet" type="text/css" href="../css/journey.css" >
        <script type="text/javascript">
			var userjson = '';
			var c_cityinfo = '';
		</script>
</head>

<%@include file="header.jsp" %>
        
<div id="container">
	<div class="mainWrap cf">
		<div class="main">
			<h2>结伴游</h2>
			<div class="ui-box cf">
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
						<a href="user_partner.do?id=${u_id }&p=${currentPage-1 }" class="pageBtn">上一页 &lt;&lt;</a>
					</c:if>
					<c:forEach begin="1" end="${length }" step="1" var="i">
						<c:if test="${currentPage==i }">
							<strong>${i }</strong>
						</c:if>
						<c:if test="${currentPage!=i }">
							<a href="user_partner.do?id=${u_id }&p=${i }">${i }</a>
						</c:if>
					</c:forEach>
					<c:if test="${currentPage<length }">
						<a href="user_partner.do?id=${u_id }&p=${currentPage+1 }" class="pageBtn">下一页 &gt;&gt;</a>
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