<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<link rel="stylesheet"  href="../css/boxy,jquery.fancybox-1.3.4.css" />
	<script type="text/javascript" src="../js/jquery-2.1.4.js"></script>	
	<script type="text/javascript">
		var userjson = '';
		var c_cityinfo = '';
	</script>
</head>
<body>
<script type="text/javascript">
         function check(form) {

          if(form.title.value=='') {
                alert("标题不能为空!");
                form.title.focus();
                return false;
           }
          if(form.photo.value=='') {
              alert("请选择一张照片!");
              form.photo.focus();
              return false;
         }
          if(form.content.value=='') {
              alert("内容不能为空!");
              form.content.focus();
              return false;
         }
         return true;
         }
</script>
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
						color:#fefefe; text-indent:25px; font-size:20px; font-family:\9ED1\4F53; font-weight:400;">发布新记忆</h2>
			<form id="form100" action="memory_add.do" method="post" class="reg-form" enctype="multipart/form-data">
				<p><label for="title"><em>*</em>标题：</label>
                   <input name="title" type="text"  class="input-txt" id="nickname" autocomplete="off" size="43" />
                </p>
				<p><label for="kind"><em>*</em>记忆类别：</label>
					<select name="kind" id="kind">
					   <option value="1">面朝大海</option>
					   <option value="2">古镇时光</option>
					   <option value="3">吃货血拼</option>
					   <option value="4">户外撒野</option>
					</select> 
                </p>
				<p><label for="photo"><em>*</em>景点图片：</label>
					<input type="file" name="photo">
                </p>
				<p></p>
				<p><label for="content"><em>*</em>内容：</label>
					<textarea rows="5" cols="60" id="content"  size="43" name="content" ></textarea>
				</p><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
               	<input type="submit" class="sendBtn" value="发布" onclick="return check(this.form)">
			</form>
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