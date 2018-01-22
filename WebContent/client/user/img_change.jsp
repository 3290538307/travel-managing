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
	<link rel="stylesheet" type="text/css" href="../css/reg.css"  />
	
	<script type="text/javascript">
		var userjson = '';
		var c_cityinfo = '';
	</script>
</head>
<body>
<%@include file="../header.jsp" %>
<!--top end-->

<div id="container" class="fn-clear">
	<div class="bottom">
    	<div class="bottom_t"></div>
        <div class="bottom_c h650">
        <div class="bottom_c_l">
       	  <%@include file="sidebar.jsp" %>					
		</div>
		
		<div class="bottom_c_r">
			<h2 style="width:680px; height:40px; line-height:41px; background:#83bb4a url(../images/reg-title-bg.png) repeat-x; 
						color:#fefefe; text-indent:25px; font-size:20px; font-family:\9ED1\4F53; font-weight:400;">修改头像</h2>
			<ul class="zhuanti-list">
				<li class="ui-box zhuanti-item">
				<form method="post" action="photo_update.do" enctype="multipart/form-data" >
					<caption>
					 <strong class="title2">当前我的头像</strong><br /><br />
					 <p>如果你还没有设置自己的头像，系统会显示为默认头像，你需要自己上传一张新照片来作为自己的个人头像。</p><br />
					 <c:if test="${empty img_name }">
					 	<img src="http://avatar.8264.com/data/avatar/037/83/56/87_avatar_big.jpg" onerror="this.onerror=null;this.src='http://ucenter.8264.com/images/noavatar_big.gif'" />
					 </c:if>
					 <c:if test="${not empty img_name }">
					 	<img alt="" src="../images/${img_name }" name="photo" height="200" width="200">
					 </c:if>
					</caption><br /><br />
					<caption>
		            <strong class="title2">设置我的新头像</strong><br /><br />
		           		<p>请选择一个新照片进行上传编辑。头像保存后，你可能需要刷新一下本页面(按F5键)，才能查看最新的头像效果。</p><br />
		             <input type="file" name="newPhoto" >
		            </caption>
				<input type="submit" class="sendBtn" value="修改" >
				</form>		
				</li>		
			</ul>

		</div>
		</div>
        <div class="bottom_b"></div>
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