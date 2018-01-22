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
	<link rel="stylesheet" type="text/css" href="../My97DatePicker/skin/WdatePicker.css"  />	
	<script type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript">
		var userjson = '';
		var c_cityinfo = '';
	</script>
</head>

<body>
<%@include file="../header.jsp" %>
<!--top end-->
<script type="text/javascript">
function sendLoginData() {
	document.getElementById("form100").submit();
}
</script>
<div id="container" class="fn-clear">
	<div class="bottom">
    	<div class="bottom_t"></div>
        <div class="bottom_c h650">
       	  <div class="bottom_c_l">
           	  <%@include file="sidebar.jsp" %>
		</div>
		
		<div class="bottom_c_r">
			<h2 style="width:680px; height:40px; line-height:41px; background:#83bb4a url(../images/reg-title-bg.png) repeat-x; 
						color:#fefefe; text-indent:25px; font-size:20px; font-family:\9ED1\4F53; font-weight:400;">基本信息</h2>
			<form id="form100" action="account_revise.do" method="post" class="reg-form"  >
				<p><label for="nickname"><em>*</em>性别：</label>
					<c:if test="${user.sex==1 }">
						<input type="radio" name="optionsRadios" checked="checked" value="男" ><font style="font-size:14px; font-family: tahoma,arial,宋体">&nbsp;&nbsp;男</font>&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio" name="optionsRadios" value="女" ><font style="font-size:14px; font-family: tahoma,arial,宋体">&nbsp;&nbsp;女</font>   
					</c:if>
					<c:if test="${user.sex==0 }">
						<input type="radio" name="optionsRadios" value="男" ><font style="font-size:14px; font-family: tahoma,arial,宋体">&nbsp;&nbsp;男</font>&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio" name="optionsRadios" value="女" checked="checked"><font style="font-size:14px; font-family: tahoma,arial,宋体">&nbsp;&nbsp;女</font>  
					</c:if>
                </p>
				<p><label for="birthday"><em>*</em>生日：</label>
                   <input type="text" name="birthday" value="${user.birthday }" class="input-txt" autocomplete="off" size="43" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                </p>
				<p><label for="address"><em>*</em>所在地：</label>
                   <input type="text" name="address" value="${user.address }" class="input-txt" id="password" autocomplete="off" size="43" />
                </p>
				<p><label for="qq"><em>*</em>QQ：</label>
                   <input  type="text" name="qq" value="${user.qq }"  class="input-txt" id="qq" autocomplete="off" size="43" />
                </p>
				<p><label for="phone"><em>*</em>电话号码：</label>
                   <input type="text" name="phone" value="${user.phone }" class="input-txt" id="phone" autocomplete="off" size="43" />
                </p>
				<p><label for="nickname"><em>*</em>爱好：</label>
                   <input type="text" name="hobby" value="${user.hobby }"  class="input-txt" id="password" autocomplete="off" size="43" />
                </p>
				<p><label for="nickname"><em>*</em>个人简介：</label>
                   <textarea name="content" rows="5" cols="60" id="nickname"  size="43" >${user.introduce }</textarea>
                </p><p></p>
               	<a href="javascript:void(0)" class="reg-login" onclick="sendLoginData()">修改</a>
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