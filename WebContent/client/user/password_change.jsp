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
	<script type="text/javascript" src="../js/jquery-2.1.4.js"></script>
	<script type="text/javascript">
        	$(document).ready(function(){
        		$("#oldpassword").on("blur",function(){
        			$.post("check_oldpassword.do",{oldpassword:$("#oldpassword").val()},
        			function(data){
        				console.info(data);
        				if("fail"==data){
        					$("#msg1").html("密码错误!").css("color","red");
        					$("#submit").hide();
        				}else{
        					$("#msg1").html("密码正确!").css("color","green");
        					$("#submit").show();
        				}
        			},"text");
        		});
        	});
   </script>
   <script type="text/javascript">
        	$(document).ready(function(){
        		$("#surepassword").on("blur",function(){
        			$.get("../checkpwd.do",{password:$("#newpassword").val(),repassword:$("#surepassword").val()},
        			function(data){
        				console.info(data);
        				if("sucess"!=data){
        					$("#msg2").html("前后两次输入的密码不一致!").css("color","red");
        					$("#submit").hide();
        				}else{
        					$("#msg2").html("密码通过!").css("color","green");
        					$("#submit").show();
        				}
        			},"text");
        		});
        	});
   </script>
   <script type="text/javascript">
		var userjson = '';
		var c_cityinfo = '';
	</script>
</head>
<body>
<%@include file="../header.jsp" %>
<!--top end-->
<script type="text/javascript">
function sendData() {
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
						color:#fefefe; text-indent:25px; font-size:20px; font-family:\9ED1\4F53; font-weight:400;">修改密码</h2>
			<form id="form100" action="../resetPasswd.do" method="post" class="reg-form" >
				<p><label for="oldpassword"><em>*</em>原密码：</label><span id="msg1"></span>
                   <input name="oldpassword" type="password"  class="input-txt" id="oldpassword" autocomplete="off" size="43" />
                </p>
				<p><label for="newpassword"><em>*</em>新密码：</label>
                   <input name="newpassword" type="password"  class="input-txt" id="newpassword" autocomplete="off" size="43" />
                </p>
				<p><label for="surepassword"><em>*</em>确认密码：</label><span id="msg2"></span>
                   <input name="surepassword" type="password"  class="input-txt" id="surepassword" autocomplete="off" size="43" />
                </p>
               	<a href="javascript:void(0);" class="reg-login" onclick="sendData()" id="submit">修改</a>
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