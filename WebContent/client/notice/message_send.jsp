<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html  lang="zh">
<head >
	<meta charset="utf-8">
    <title>站内信 | 驴友网</title>
        <meta name="Keywords" content="驴友网" />
        <meta name="Description" content="旅游社交，在旅途中享受激情与欢乐" />
        <link rel="stylesheet" type="text/css" href="../css/global.css"  />
        <link rel="stylesheet" type="text/css" href="../css/reg.css"  />
        <link rel="stylesheet"  href="../css/boxy,jquery.fancybox-1.3.4.css" />
        <script type="text/javascript" src="../js/jquery-2.1.4.js"></script>
        <script>
	        $(document).ready(function(){
	        	$("#submit").on("click",function(){
	        		$.get("send_message.do",{toUser:$("#to").val(),content:$("#content").val()},function(data){
	                	console.info(data);
	                	if("success"==data){
	                		$("#res").html("发送成功!").css("color","green");
	                	}else{
	                		$("#res").html("该收件人不存在，发送失败!").css("color","red");
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

<body id="reg" >
<!--top-->
<%@include file="../header.jsp" %>
        
<div id="container"  class="noXtips cf">
	<div  class="main">
		<h2>发送站内信</h2>
			<form id="form100" action="login.htm" method="post" class="reg-form" >
				<p><label for="to_man"><em>*</em>收件人：</label>
                   <input name="to" type="text"  class="input-txt" id="to" autocomplete="off" size="43" />
                </p>
				<p><label for="content"><em>*</em>内容：</label>
                   <textarea rows="5" cols="60" id="content"  size="43" ></textarea>
                </p><p></p>
               <a href="javascript:void(0);" class="reg-login" id="submit">发送</a>  <span id="res"></span>
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