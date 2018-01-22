<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html  lang="zh">
<head >
	<meta charset="utf-8">
    <title>公告详情 | 驴友网</title>
        <meta name="Keywords" content="驴友网" />
        <meta name="Description" content="旅游社交，在旅途中享受激情与欢乐" />
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"  />
        <link rel="stylesheet" type="text/css" href="../css/global.css"  />
        <link rel="stylesheet" type="text/css" href="../css/reg.css"  />  
        <link   href="../css/boxy,jquery.fancybox-1.3.4.css" />
        <style type="text/css">
        	.control-group{
        		margin:30px auto 0;
        		padding:0 200px;
        	}
        	.form-actions{
        		position:absolute;
        		padding:0 500px 0 0;
        	}
        	.return{
        		position: relative;
        		left:500px;
        		top:30px;
        	}
        		
        
        </style>
        <script type="text/javascript">
			var userjson = '';
			var c_cityinfo = '';
		</script>
</head>

<body id="reg" >
<!--top-->
<%@include file="../header.jsp" %>
        
<div id="container"  class="noXtips cf">
	<div  class="main">
		<h2>公告详细信息</h2>
		<form class="form-horizontal">
			  <fieldset>
				<div class="control-group">
				  <label class="control-label " for="typeahead">标题 </label>
				  <label class="control-label" for="typeahead">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${noticeDetail.title }</label>
				</div>
				<div class="control-group">
				  <label class="control-label " for="typeahead">发布时间</label>
				   <label class="control-label" for="typeahead">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${noticeDetail.cdate }</label>
				</div>
				<div class="control-group">
				  <label class="control-label " for="typeahead">发布者</label>
				  <label class="control-label" for="typeahead">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${noticeDetail.name }</label>
				</div>
				<div class="control-group">
				  <label class="control-label " for="typeahead">内容</label>
				  <label class="box-content" for="typeahead">
				  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${noticeDetail.message }</label>
				</div>							
				<div class="form-actions">
						<a class="btn btn-success return" href="../index.do">
						<i class="icon-repeat icon-white"></i> 	
							返回
						</a>															  
				</div>
			  </fieldset>
		</form>   
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