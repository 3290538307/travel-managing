<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>结伴游 | 驴友网</title>
    <meta charset="utf-8">
    <meta name="Keywords" content="" />
    <meta name="Description" content="" />
    <link rel="shortcut icon"  href="favicon.ico" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="mobile-agent" content="format=html5; url=http://m.roadqu.com">
	<link rel="stylesheet" href="../css/global.css" media="all">
	<link rel="stylesheet" href="../css/boxy,jquery.fancybox-1.3.4.css">
     <link rel="stylesheet" type="text/css" href="../css/youhui.css" media="all">
    <script type="text/javascript">
		var userjson = '';
		var c_cityinfo = '';
	</script>
</head>

<body>
<!--top-->
<%@include file="../header.jsp" %>

<!--main body-->
<div id="container">

    <div class="ui-box fn-clear ">
        <div class="city-guide">
            <div class="fn-left">
    
				<a herf="#">【${JbyId.fromdate}-${JbyId.todate}之${JbyId.title}】</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发帖时间：${JbyId.cdate}
            </div>
		 </div>
		 
        <!-- 发帖人 -->
        <div class="tag-list menu_select cf">
        	<span class="tag-notes fn-left">发帖人：</span>
            <span class="tag-cnt fn-right" id="lyq"><a title="JbyId.name" href="#" data-lyq="0">${JbyId.name }</a></span>
        </div>
         <!--end 发帖人 -->
		 
		 <!-- 目的地 -->
        <div class="tag-list menu_select cf">
        	<span class="tag-notes fn-left">目的地：</span>
            <span class="tag-cnt fn-right" id="lyq"><a title="JbyId.dest" href="#" class="tag-current" data-lyq="0">${JbyId.dest }</a></span>
        </div>
         <!--end 目的地 -->
		 
		  <!-- 行程安排 -->
        <div class="tag-list menu_select cf">
        	<span class="tag-notes fn-left">行程安排：</span>
            <span class="tag-cnt fn-right" id="lyq"><a href="#" data-lyq="0">${JbyId.fromdate }</a> <a href="#">至</a> <a href="#" data-lyq="0">${JbyId.todate }</a></span>
        </div>
         <!--end 行程安排 -->
		 
		 <!-- 联系方式 -->
        <div class="tag-list menu_select cf">
        	<span class="tag-notes fn-left">联系方式：</span>
            <span class="tag-cnt fn-right" id="lyq"><a href="#" class="tag-current" data-lyq="0">${JbyId.phone }</a></span>
        </div>
         <!--end 联系方式 -->
		 
		 <!-- 帖子详情 -->
        <div class="tag-list menu_select cf">
        	<span class="tag-notes fn-left">详情：</span>
            <span class="tag-cnt fn-right" id="lyq">${JbyId.content }</span>
        </div>
         <!--end 帖子详情 -->
    </div>
  

</div>
</div>

<!--main body end-->

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